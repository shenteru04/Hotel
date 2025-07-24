<?php
require_once '../db.php';

// Authenticate user (only admin/receptionist can process payments)
$payload = authenticate();
if ($payload['role'] !== 'admin' && $payload['role'] !== 'receptionist') {
    http_response_code(403);
    echo json_encode(apiResponse('error', 'Unauthorized access'));
    exit;
}

// Only allow POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(apiResponse('error', 'Method Not Allowed'));
    exit;
}

// Get input data
$data = json_decode(file_get_contents('php://input'), true);
$reservationId = sanitizeInput($data['reservation_id'] ?? '');
$amount = sanitizeInput($data['amount'] ?? '');
$paymentMethod = sanitizeInput($data['payment_method'] ?? '');
$transactionId = sanitizeInput($data['transaction_id'] ?? '');

// Validate input
if (empty($reservationId) || empty($amount) || empty($paymentMethod)) {
    http_response_code(400);
    echo json_encode(apiResponse('error', 'Reservation ID, amount and payment method are required'));
    exit;
}

if (!is_numeric($amount) || $amount <= 0) {
    http_response_code(400);
    echo json_encode(apiResponse('error', 'Invalid payment amount'));
    exit;
}

try {
    // Begin transaction
    $conn->beginTransaction();

    // Get billing information
    $stmt = $conn->prepare("SELECT * FROM billing WHERE reservation_id = :reservation_id FOR UPDATE");
    $stmt->execute([':reservation_id' => $reservationId]);
    $billing = $stmt->fetch();

    if (!$billing) {
        $conn->rollBack();
        http_response_code(404);
        echo json_encode(apiResponse('error', 'Billing record not found'));
        exit;
    }

    // Calculate new paid amount and balance
    $newPaidAmount = $billing['paid_amount'] + $amount;
    $newBalance = $billing['total_amount'] - $newPaidAmount;

    // Determine new payment status
    $newPaymentStatus = $billing['payment_status'];
    if ($newBalance <= 0) {
        $newPaymentStatus = 'paid';
    } elseif ($newPaidAmount > 0) {
        $newPaymentStatus = 'partial';
    }

    // Generate invoice number if this is the first payment
    $invoiceNumber = $billing['invoice_number'];
    if (empty($invoiceNumber)) {
        $invoiceNumber = 'INV-' . strtoupper(uniqid());
    }

    // Update billing record
    $stmt = $conn->prepare("UPDATE billing 
                          SET paid_amount = :paid_amount,
                              balance = :balance,
                              payment_status = :payment_status,
                              payment_method = :payment_method,
                              transaction_id = :transaction_id,
                              invoice_number = :invoice_number
                          WHERE reservation_id = :reservation_id");
    $stmt->execute([
        ':paid_amount' => $newPaidAmount,
        ':balance' => $newBalance,
        ':payment_status' => $newPaymentStatus,
        ':payment_method' => $paymentMethod,
        ':transaction_id' => $transactionId,
        ':invoice_number' => $invoiceNumber,
        ':reservation_id' => $reservationId
    ]);

    // If payment completes the balance, update reservation status to confirmed
    if ($newPaymentStatus === 'paid') {
        $stmt = $conn->prepare("UPDATE reservations SET status = 'confirmed' WHERE id = :reservation_id");
        $stmt->execute([':reservation_id' => $reservationId]);
    }

    // Commit transaction
    $conn->commit();

    // Get updated billing information
    $stmt = $conn->prepare("SELECT * FROM billing WHERE reservation_id = :reservation_id");
    $stmt->execute([':reservation_id' => $reservationId]);
    $updatedBilling = $stmt->fetch();

    // Prepare response
    $response = [
        'billing' => $updatedBilling,
        'paid_amount' => $amount,
        'new_balance' => $newBalance
    ];

    http_response_code(200);
    echo json_encode(apiResponse('success', 'Payment processed successfully', $response));

} catch (PDOException $e) {
    $conn->rollBack();
    http_response_code(500);
    echo json_encode(apiResponse('error', 'Database error'));
}
?>