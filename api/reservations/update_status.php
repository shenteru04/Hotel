<?php
require_once '../db.php';

// Authenticate user (only admin/receptionist can update status)
$payload = authenticate();
if ($payload['role'] !== 'admin' && $payload['role'] !== 'receptionist') {
    http_response_code(403);
    echo json_encode(apiResponse('error', 'Unauthorized access'));
    exit;
}

// Only allow PUT requests
if ($_SERVER['REQUEST_METHOD'] !== 'PUT') {
    http_response_code(405);
    echo json_encode(apiResponse('error', 'Method Not Allowed'));
    exit;
}

// Get input data
$data = json_decode(file_get_contents('php://input'), true);
$reservationId = sanitizeInput($data['reservation_id'] ?? '');
$newStatus = sanitizeInput($data['status'] ?? '');

// Validate input
$validStatuses = ['pending', 'confirmed', 'checked_in', 'checked_out', 'cancelled'];
if (empty($reservationId) || empty($newStatus) || !in_array($newStatus, $validStatuses)) {
    http_response_code(400);
    echo json_encode(apiResponse('error', 'Invalid reservation ID or status'));
    exit;
}

try {
    // Begin transaction
    $conn->beginTransaction();

    // Get current reservation details
    $stmt = $conn->prepare("SELECT r.*, rm.id as room_id, rm.status as room_status 
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

    // Validate status transition
    $currentStatus = $reservation['status'];
    $validTransitions = [
        'pending' => ['confirmed', 'cancelled'],
        'confirmed' => ['checked_in', 'cancelled'],
        'checked_in' => ['checked_out'],
        'checked_out' => [],
        'cancelled' => []
    ];

    if (!in_array($newStatus, $validTransitions[$currentStatus])) {
        $conn->rollBack();
        http_response_code(400);
        echo json_encode(apiResponse('error', 'Invalid status transition'));
        exit;
    }

    // Update reservation status
    $stmt = $conn->prepare("UPDATE reservations SET status = :status WHERE id = :reservation_id");
    $stmt->execute([
        ':status' => $newStatus,
        ':reservation_id' => $reservationId
    ]);

    // Update room status if needed
    $newRoomStatus = null;
    if ($newStatus === 'checked_in') {
        $newRoomStatus = 'occupied';
    } elseif ($newStatus === 'checked_out' || $newStatus === 'cancelled') {
        $newRoomStatus = 'available';
    }

    if ($newRoomStatus) {
        $stmt = $conn->prepare("UPDATE rooms SET status = :status WHERE id = :room_id");
        $stmt->execute([
            ':status' => $newRoomStatus,
            ':room_id' => $reservation['room_id']
        ]);
    }

    // Commit transaction
    $conn->commit();

    // Prepare response
    $response = [
        'reservation_id' => $reservationId,
        'previous_status' => $currentStatus,
        'new_status' => $newStatus,
        'room_status_updated' => $newRoomStatus ? true : false
    ];

    http_response_code(200);
    echo json_encode(apiResponse('success', 'Reservation status updated', $response));

} catch (PDOException $e) {
    $conn->rollBack();
    http_response_code(500);
    echo json_encode(apiResponse('error', 'Database error'));
}
?>