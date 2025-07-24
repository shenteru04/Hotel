<?php
require_once '../db.php';

// Authenticate user
$payload = authenticate();

// Only allow GET requests
if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    http_response_code(405);
    echo json_encode(apiResponse('error', 'Method Not Allowed'));
    exit;
}

// Get reservation ID from query parameters
$reservationId = isset($_GET['reservation_id']) ? sanitizeInput($_GET['reservation_id']) : null;

if (!$reservationId) {
    http_response_code(400);
    echo json_encode(apiResponse('error', 'Reservation ID is required'));
    exit;
}

try {
    // Check if user has permission to view this invoice
    $stmt = $conn->prepare("SELECT r.user_id, r.id 
                          FROM reservations r
                          JOIN billing b ON r.id = b.reservation_id
                          WHERE r.id = :reservation_id");
    $stmt->execute([':reservation_id' => $reservationId]);
    $reservation = $stmt->fetch();

    if (!$reservation) {
        http_response_code(404);
        echo json_encode(apiResponse('error', 'Reservation not found'));
        exit;
    }

    // Only allow if user is admin, receptionist, or the reservation owner
    if ($payload['role'] !== 'admin' && $payload['role'] !== 'receptionist' && $reservation['user_id'] != $payload['user_id']) {
        http_response_code(403);
        echo json_encode(apiResponse('error', 'Unauthorized to view this invoice'));
        exit;
    }

    // Get invoice details
    $stmt = $conn->prepare("SELECT 
                            b.id as billing_id,
                            b.invoice_number,
                            b.total_amount,
                            b.paid_amount,
                            b.balance,
                            b.payment_status,
                            b.payment_method,
                            b.created_at as invoice_date,
                            r.id as reservation_id,
                            r.check_in,
                            r.check_out,
                            r.adults,
                            r.children,
                            rm.room_number,
                            rm.type as room_type,
                            rm.price as room_rate,
                            u.first_name,
                            u.last_name,
                            u.email,
                            u.phone
                        FROM billing b
                        JOIN reservations r ON b.reservation_id = r.id
                        JOIN rooms rm ON r.room_id = rm.id
                        JOIN users u ON r.user_id = u.id
                        WHERE b.reservation_id = :reservation_id");
    $stmt->execute([':reservation_id' => $reservationId]);
    $invoice = $stmt->fetch();

    if (!$invoice) {
        http_response_code(404);
        echo json_encode(apiResponse('error', 'Invoice not found'));
        exit;
    }

    // Calculate number of nights
    $checkIn = new DateTime($invoice['check_in']);
    $checkOut = new DateTime($invoice['check_out']);
    $nights = $checkOut->diff($checkIn)->days;
    $invoice['nights'] = $nights;
    $invoice['room_total'] = $nights * $invoice['room_rate'];

    // Get extra charges
    $stmt = $conn->prepare("SELECT description, amount, created_at 
                          FROM extra_charges 
                          WHERE reservation_id = :reservation_id");
    $stmt->execute([':reservation_id' => $reservationId]);
    $extraCharges = $stmt->fetchAll();

    // Get discounts
    $stmt = $conn->prepare("SELECT description, amount, created_at 
                          FROM discounts 
                          WHERE reservation_id = :reservation_id");
    $stmt->execute([':reservation_id' => $reservationId]);
    $discounts = $stmt->fetchAll();

    // Prepare response
    $response = [
        'invoice' => $invoice,
        'extra_charges' => $extraCharges,
        'discounts' => $discounts
    ];

    http_response_code(200);
    echo json_encode(apiResponse('success', 'Invoice retrieved successfully', $response));

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(apiResponse('error', 'Database error'));
}
?>