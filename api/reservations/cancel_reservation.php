<?php
// api/reservations/cancel_reservation.php
require_once '../db.php';

// Authenticate user
$userData = authenticate();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Method not allowed"]);
    exit;
}

try {
    // Get JSON input
    $input = json_decode(file_get_contents('php://input'), true);
    
    if (!$input) {
        throw new Exception("Invalid JSON input");
    }
    
    // Validate required fields
    if (empty($input['reservation_id'])) {
        throw new Exception("Missing required field: reservation_id");
    }
    
    $reservationId = (int)$input['reservation_id'];
    $userId = (int)$userData['user_id'];
    
    // Check if reservation exists and belongs to the user
    $stmt = $conn->prepare("SELECT * FROM reservations WHERE id = :id AND user_id = :user_id");
    $stmt->execute([
        ':id' => $reservationId,
        ':user_id' => $userId
    ]);
    $reservation = $stmt->fetch();
    
    if (!$reservation) {
        throw new Exception("Reservation not found or you don't have permission to cancel it");
    }
    
    // Check if reservation can be cancelled
    $currentStatus = $reservation['status'];
    $cancellableStatuses = ['pending', 'confirmed'];
    
    if (!in_array($currentStatus, $cancellableStatuses)) {
        throw new Exception("This reservation cannot be cancelled. Current status: {$currentStatus}");
    }
    
    // Update reservation status to cancelled
    $stmt = $conn->prepare("
        UPDATE reservations 
        SET status = 'cancelled', updated_at = NOW() 
        WHERE id = :id AND user_id = :user_id
    ");
    
    $result = $stmt->execute([
        ':id' => $reservationId,
        ':user_id' => $userId
    ]);
    
    if (!$result || $stmt->rowCount() === 0) {
        throw new Exception("Failed to cancel reservation");
    }
    
    echo json_encode([
        "status" => "success",
        "message" => "Reservation cancelled successfully",
        "data" => [
            "reservation_id" => $reservationId,
            "old_status" => $currentStatus,
            "new_status" => "cancelled"
        ]
    ]);
    
} catch (Exception $e) {
    error_log("Cancel reservation error: " . $e->getMessage());
    http_response_code(400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
?>