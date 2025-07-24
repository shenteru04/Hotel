<?php
require_once '../db.php';

// Authenticate user (only admin/receptionist can upgrade rooms)
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
$newRoomId = sanitizeInput($data['new_room_id'] ?? '');

// Validate input
if (empty($reservationId) || empty($newRoomId)) {
    http_response_code(400);
    echo json_encode(apiResponse('error', 'Reservation ID and new room ID are required'));
    exit;
}

try {
    // Begin transaction
    $conn->beginTransaction();

    // Get current reservation details
    $stmt = $conn->prepare("SELECT r.*, rm.type as current_room_type, rm.price as current_price
                           FROM reservations r
                           JOIN rooms rm ON r.room_id = rm.id
                           WHERE r.id = :reservation_id");
    $stmt->execute([':reservation_id' => $reservationId]);
    $reservation = $stmt->fetch();

    if (!$reservation) {
        $conn->rollBack();
        http_response_code(404);
        echo json_encode(apiResponse('error', 'Reservation not found'));
        exit;
    }

    // Check if reservation can be modified
    if (!in_array($reservation['status'], ['pending', 'confirmed'])) {
        $conn->rollBack();
        http_response_code(400);
        echo json_encode(apiResponse('error', 'Reservation cannot be modified in its current status'));
        exit;
    }

    // Get new room details
    $stmt = $conn->prepare("SELECT * FROM rooms WHERE id = :room_id AND status = 'available'");
    $stmt->execute([':room_id' => $newRoomId]);
    $newRoom = $stmt->fetch();

    if (!$newRoom) {
        $conn->rollBack();
        http_response_code(400);
        echo json_encode(apiResponse('error', 'New room is not available'));
        exit;
    }

    // Verify this is actually an upgrade
    $roomHierarchy = ['Standard' => 1, 'Deluxe' => 2, 'Suite' => 3];
    $currentRoomLevel = $roomHierarchy[$reservation['current_room_type']] ?? 0;
    $newRoomLevel = $roomHierarchy[$newRoom['type']] ?? 0;

    if ($newRoomLevel <= $currentRoomLevel) {
        $conn->rollBack();
        http_response_code(400);
        echo json_encode(apiResponse('error', 'New room must be higher category than current room'));
        exit;
    }

    // Check for conflicts in new room
    $stmt = $conn->prepare("SELECT id FROM reservations 
                           WHERE room_id = :room_id 
                           AND status IN ('confirmed', 'checked_in')
                           AND id != :reservation_id
                           AND (
                               (check_in <= :check_in AND check_out > :check_in)
                               OR (check_in < :check_out AND check_out >= :check_out)
                               OR (check_in >= :check_in AND check_out <= :check_out)
                           )");
    $stmt->execute([
        ':room_id' => $newRoomId,
        ':reservation_id' => $reservationId,
        ':check_in' => $reservation['check_in'],
        ':check_out' => $reservation['check_out']
    ]);

    if ($stmt->rowCount() > 0) {
        $conn->rollBack();
        http_response_code(400);
        echo json_encode(apiResponse('error', 'New room has conflicting reservations'));
        exit;
    }

    // Calculate price difference
    $checkInDate = new DateTime($reservation['check_in']);
    $checkOutDate = new DateTime($reservation['check_out']);
    $nights = $checkOutDate->diff($checkInDate)->days;
    $priceDifference = ($newRoom['price'] - $reservation['current_price']) * $nights;

    // Update reservation with new room
    $stmt = $conn->prepare("UPDATE reservations SET room_id = :new_room_id WHERE id = :reservation_id");
    $stmt->execute([
        ':new_room_id' => $newRoomId,
        ':reservation_id' => $reservationId
    ]);

    // Update billing total
    $stmt = $conn->prepare("UPDATE billing 
                          SET total_amount = total_amount + :price_difference,
                              balance = balance + :price_difference
                          WHERE reservation_id = :reservation_id");
    $stmt->execute([
        ':price_difference' => $priceDifference,
        ':reservation_id' => $reservationId
    ]);

    // Update room statuses
    $stmt = $conn->prepare("UPDATE rooms SET status = 'available' WHERE id = :old_room_id");
    $stmt->execute([':old_room_id' => $reservation['room_id']]);

    $stmt = $conn->prepare("UPDATE rooms SET status = 'occupied' WHERE id = :new_room_id");
    $stmt->execute([':new_room_id' => $newRoomId]);

    // Commit transaction
    $conn->commit();

    // Prepare response
    $response = [
        'reservation_id' => $reservationId,
        'previous_room' => [
            'id' => $reservation['room_id'],
            'type' => $reservation['current_room_type'],
            'price' => $reservation['current_price']
        ],
        'new_room' => [
            'id' => $newRoomId,
            'type' => $newRoom['type'],
            'price' => $newRoom['price']
        ],
        'price_difference' => $priceDifference,
        'nights' => $nights
    ];

    http_response_code(200);
    echo json_encode(apiResponse('success', 'Room upgraded successfully', $response));

} catch (PDOException $e) {
    $conn->rollBack();
    http_response_code(500);
    echo json_encode(apiResponse('error', 'Database error'));
}
?>