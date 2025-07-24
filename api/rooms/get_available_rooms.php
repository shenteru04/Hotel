<?php
require_once '../db.php'; // adjust path if needed

try {
    // Optional: date filters
    $checkIn  = $_GET['check_in'] ?? null;
    $checkOut = $_GET['check_out'] ?? null;

    // Sample logic: Select rooms not booked during the specified dates
    $query = "SELECT * FROM rooms WHERE status = 'available'";
    $stmt = $conn->prepare($query);
    $stmt->execute();
    $rooms = $stmt->fetchAll();

    echo json_encode([
        'status' => 'success',
        'data' => ['rooms' => $rooms]
    ]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => 'Failed to fetch rooms',
        'error' => $e->getMessage()
    ]);
}
