<?php
require_once '../db.php';

// Authenticate user (only admin/receptionist can handle walk-ins)
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
$firstName = sanitizeInput($data['first_name'] ?? '');
$lastName = sanitizeInput($data['last_name'] ?? '');
$phone = sanitizeInput($data['phone'] ?? '');
$email = sanitizeInput($data['email'] ?? '');
$roomId = sanitizeInput($data['room_id'] ?? '');
$checkIn = sanitizeInput($data['check_in'] ?? '');
$checkOut = sanitizeInput($data['check_out'] ?? '');
$adults = sanitizeInput($data['adults'] ?? 1);
$children = sanitizeInput($data['children'] ?? 0);

// Validate input
$errors = [];
if (empty($firstName)) $errors[] = 'First name is required';
if (empty($lastName)) $errors[] = 'Last name is required';
if (empty($phone)) $errors[] = 'Phone number is required';
if (empty($roomId)) $errors[] = 'Room selection is required';
if (empty($checkIn)) $errors[] = 'Check-in date is required';
if (empty($checkOut)) $errors[] = 'Check-out date is required';

if (!empty($errors)) {
    http_response_code(400);
    echo json_encode(apiResponse('error', 'Validation failed', ['errors' => $errors]));
    exit;
}

try {
    // Begin transaction
    $conn->beginTransaction();

    // Check room availability
    $stmt = $conn->prepare("SELECT * FROM rooms WHERE id = :id AND status = 'available'");
    $stmt->execute([':id' => $roomId]);
    $room = $stmt->fetch();

    if (!$room) {
        $conn->rollBack();
        http_response_code(400);
        echo json_encode(apiResponse('error', 'Selected room is not available'));
        exit;
    }

    // Check for conflicting reservations
    $stmt = $conn->prepare("SELECT id FROM reservations 
                           WHERE room_id = :room_id 
                           AND status IN ('confirmed', 'checked_in')
                           AND (
                               (check_in <= :check_in AND check_out > :check_in)
                               OR (check_in < :check_out AND check_out >= :check_out)
                               OR (check_in >= :check_in AND check_out <= :check_out)
                           )");
    $stmt->execute([
        ':room_id' => $roomId,
        ':check_in' => $checkIn,
        ':check_out' => $checkOut
    ]);

    if ($stmt->rowCount() > 0) {
        $conn->rollBack();
        http_response_code(400);
        echo json_encode(apiResponse('error', 'Room not available for selected dates'));
        exit;
    }

    // Create walk-in customer user (if email provided)
    $userId = null;
    if (!empty($email)) {
        $username = 'walkin_' . uniqid();
        $tempPassword = bin2hex(random_bytes(4)); // Temporary password
        
        $stmt = $conn->prepare("INSERT INTO users 
                              (username, password, email, first_name, last_name, role, phone)
                              VALUES (:username, :password, :email, :first_name, :last_name, 'customer', :phone)");
        $stmt->execute([
            ':username' => $username,
            ':password' => password_hash($tempPassword, PASSWORD_DEFAULT),
            ':email' => $email,
            ':first_name' => $firstName,
            ':last_name' => $lastName,
            ':phone' => $phone
        ]);
        
        $userId = $conn->lastInsertId();
    }

    // Create reservation
    $stmt = $conn->prepare("INSERT INTO reservations 
                          (user_id, room_id, check_in, check_out, status, adults, children)
                          VALUES (:user_id, :room_id, :check_in, :check_out, 'confirmed', :adults, :children)");
    $stmt->execute([
        ':user_id' => $userId,
        ':room_id' => $roomId,
        ':check_in' => $checkIn,
        ':check_out' => $checkOut,
        ':adults' => $adults,
        ':children' => $children
    ]);
    $reservationId = $conn->lastInsertId();

    // Calculate total amount
    $checkInDate = new DateTime($checkIn);
    $checkOutDate = new DateTime($checkOut);
    $nights = $checkOutDate->diff($checkInDate)->days;
    $totalAmount = $nights * $room['price'];

    // Create billing record
    $stmt = $conn->prepare("INSERT INTO billing 
                          (reservation_id, total_amount, payment_status)
                          VALUES (:reservation_id, :total_amount, 'pending')");
    $stmt->execute([
        ':reservation_id' => $reservationId,
        ':total_amount' => $totalAmount
    ]);

    // Update room status
    $stmt = $conn->prepare("UPDATE rooms SET status = 'occupied' WHERE id = :id");
    $stmt->execute([':id' => $roomId]);

    // Commit transaction
    $conn->commit();

    // Prepare response
    $response = [
        'reservation_id' => $reservationId,
        'customer' => [
            'first_name' => $firstName,
            'last_name' => $lastName,
            'phone' => $phone,
            'email' => $email,
            'temp_password' => isset($tempPassword) ? $tempPassword : null
        ],
        'room' => $room,
        'billing' => [
            'total_amount' => $totalAmount,
            'nights' => $nights
        ]
    ];

    http_response_code(201);
    echo json_encode(apiResponse('success', 'Walk-in reservation created', $response));

} catch (PDOException $e) {
    $conn->rollBack();
    http_response_code(500);
    echo json_encode(apiResponse('error', 'Database error'));
}
?>