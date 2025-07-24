<?php
require_once '../db.php';

// Authenticate user (only admin/receptionist can add charges)
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
$description = sanitizeInput($data['description'] ?? '');
$amount = sanitizeInput($data['amount'] ?? '');

// Validate input
if (empty($reservationId) || empty($description) || empty($amount)) {
    http_response_code(400);
    echo json_encode(apiResponse('error', 'Reservation ID, description and amount are required'));
    exit;
}

if (!is_numeric($amount) || $amount <= 0) {
    http_response_code(400);
    echo json_encode(apiResponse('error', 'Invalid amount'));
    exit;
}

try {
    // Begin transaction
    $conn->beginTransaction();

    // Check if reservation exists
    $stmt = $conn->prepare("SELECT id FROM reservations WHERE id = :reservation_id");
    $stmt->execute([':reservation_id' => $reservationId]);
    
    if ($stmt->rowCount() === 0) {
        $conn->rollBack();
        http_response_code(404);
        echo json_encode(apiResponse('error', 'Reservation not found'));
        exit;
    }

    // Add extra charge
    $stmt = $conn->prepare("INSERT INTO extra_charges 
                          (reservation_id, description, amount, added_by)
                          VALUES (:reservation_id, :description, :amount, :added_by)");
    $stmt->execute([
        ':reservation_id' => $reservationId,
        ':description' => $description,
        ':amount' => $amount,
        ':added_by' => $payload['user_id']
    ]);

    // Update billing total
    $stmt = $conn->prepare("UPDATE billing 
                          SET total_amount = total_amount + :amount,
                              balance = balance + :amount
                          WHERE reservation_id = :reservation_id");
    $stmt->execute([
        ':amount' => $amount,
        ':reservation_id' => $reservationId
    ]);

    // Commit transaction
    $conn->commit();

    // Get updated billing information
    $stmt = $conn->prepare("SELECT * FROM billing WHERE reservation_id = :reservation_id");
    $stmt->execute([':reservation_id' => $reservationId]);
    $billing = $stmt->fetch();

    http_response_code(201);
    echo json_encode(apiResponse('success', 'Charge added successfully', [
        'billing' => $billing,
        'charge' => [
            'description' => $description,
            'amount' => $amount
        ]
    ]));

} catch (PDOException $e) {
    $conn->rollBack();
    http_response_code(500);
    echo json_encode(apiResponse('error', 'Database error'));
}
?>