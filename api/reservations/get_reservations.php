<?php
// /hotel/api/reservations/get_reservations.php

require_once __DIR__ . '/../db.php';

header("Content-Type: application/json");

try {
    // Authenticate user
    $payload = authenticate();
    $userId = $payload['user_id'];

    // Get reservations for the current user
    $stmt = $conn->prepare("
        SELECT 
            r.id,
            rm.room_number,
            rm.type AS room_type,
            r.check_in,
            r.check_out,
            r.status,
            r.total_amount,
            r.advance_payment
        FROM reservations r
        JOIN rooms rm ON r.room_id = rm.id
        WHERE r.user_id = :user_id
        ORDER BY r.check_in ASC
    ");
    $stmt->execute([':user_id' => $userId]);
    $reservations = $stmt->fetchAll();

    echo json_encode([
        "status" => "success",
        "data" => [
            "reservations" => $reservations
        ]
    ]);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error",
        "message" => "Database error: " . $e->getMessage()
    ]);
} catch (Exception $e) {
    http_response_code(400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}