<?php
require_once '../db.php';

// Allow GET requests without authentication for availability checking
if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    http_response_code(405);
    echo json_encode(apiResponse('error', 'Method Not Allowed'));
    exit;
}

// Get query parameters
$checkIn = sanitizeInput($_GET['check_in'] ?? '');
$checkOut = sanitizeInput($_GET['check_out'] ?? '');
$roomType = sanitizeInput($_GET['room_type'] ?? '');
$adults = sanitizeInput($_GET['adults'] ?? 1);
$children = sanitizeInput($_GET['children'] ?? 0);

// Validate input
$errors = [];
if (empty($checkIn)) $errors[] = 'Check-in date is required';
if (empty($checkOut)) $errors[] = 'Check-out date is required';

// Date validation
$today = new DateTime();
$checkInDate = DateTime::createFromFormat('Y-m-d', $checkIn);
$checkOutDate = DateTime::createFromFormat('Y-m-d', $checkOut);

if (!$checkInDate || $checkInDate < $today) {
    $errors[] = 'Invalid check-in date';
}
if (!$checkOutDate || $checkOutDate <= $checkInDate) {
    $errors[] = 'Invalid check-out date';
}

if (!empty($errors)) {
    http_response_code(400);
    echo json_encode(apiResponse('error', 'Validation failed', ['errors' => $errors]));
    exit;
}

try {
    // Build base query for available rooms
    $query = "SELECT r.* 
              FROM rooms r
              WHERE r.status = 'available'";

    $params = [];

    // Filter by room type if specified
    if (!empty($roomType)) {
        $query .= " AND r.type = :room_type";
        $params[':room_type'] = $roomType;
    }

    // Filter by capacity if specified
    if (is_numeric($adults) && $adults > 0) {
        $minCapacity = $adults + ($children > 0 ? 1 : 0);
        $query .= " AND r.capacity >= :min_capacity";
        $params[':min_capacity'] = $minCapacity;
    }

    // Get all potentially available rooms
    $stmt = $conn->prepare($query);
    $stmt->execute($params);
    $allRooms = $stmt->fetchAll();

    // Check each room for reservation conflicts
    $availableRooms = [];
    foreach ($allRooms as $room) {
        $stmt = $conn->prepare("SELECT id FROM reservations 
                               WHERE room_id = :room_id 
                               AND status IN ('confirmed', 'checked_in')
                               AND (
                                   (check_in <= :check_in AND check_out > :check_in)
                                   OR (check_in < :check_out AND check_out >= :check_out)
                                   OR (check_in >= :check_in AND check_out <= :check_out)
                               )");
        $stmt->execute([
            ':room_id' => $room['id'],
            ':check_in' => $checkIn,
            ':check_out' => $checkOut
        ]);

        if ($stmt->rowCount() === 0) {
            $availableRooms[] = $room;
        }
    }

    // Calculate nights and add pricing info
    $nights = $checkOutDate->diff($checkInDate)->days;
    $response = array_map(function($room) use ($nights) {
        return [
            'room_id' => $room['id'],
            'room_number' => $room['room_number'],
            'type' => $room['type'],
            'capacity' => $room['capacity'],
            'price_per_night' => $room['price'],
            'total_price' => $nights * $room['price'],
            'nights' => $nights
        ];
    }, $availableRooms);

    http_response_code(200);
    echo json_encode(apiResponse('success', 'Availability checked', [
        'check_in' => $checkIn,
        'check_out' => $checkOut,
        'available_rooms' => $response
    ]));

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(apiResponse('error', 'Database error'));
}
?>