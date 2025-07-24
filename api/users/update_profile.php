<?php
require_once '../db.php';

// Authenticate user
$payload = authenticate();

// Only allow PUT requests
if ($_SERVER['REQUEST_METHOD'] !== 'PUT') {
    http_response_code(405);
    echo json_encode(apiResponse('error', 'Method Not Allowed'));
    exit;
}

// Get input data
$data = json_decode(file_get_contents('php://input'), true);
$userId = sanitizeInput($data['id'] ?? $payload['user_id']);
$email = sanitizeInput($data['email'] ?? '');
$firstName = sanitizeInput($data['first_name'] ?? '');
$lastName = sanitizeInput($data['last_name'] ?? '');
$phone = sanitizeInput($data['phone'] ?? '');

// Validate input
$errors = [];
if (empty($email)) $errors[] = 'Email is required';
if (empty($firstName)) $errors[] = 'First name is required';
if (empty($lastName)) $errors[] = 'Last name is required';

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $errors[] = 'Invalid email format';
}

// Check if user has permission to update
if ($payload['user_id'] != $userId && $payload['role'] !== 'admin') {
    http_response_code(403);
    echo json_encode(apiResponse('error', 'Unauthorized to update this user'));
    exit;
}

if (!empty($errors)) {
    http_response_code(400);
    echo json_encode(apiResponse('error', 'Validation failed', ['errors' => $errors]));
    exit;
}

try {
    // Check if email is already taken by another user
    $stmt = $conn->prepare("SELECT id FROM users WHERE email = :email AND id != :id");
    $stmt->execute([':email' => $email, ':id' => $userId]);
    
    if ($stmt->rowCount() > 0) {
        http_response_code(409);
        echo json_encode(apiResponse('error', 'Email already in use by another account'));
        exit;
    }

    // Update user profile
    $stmt = $conn->prepare("UPDATE users 
                          SET email = :email,
                              first_name = :first_name,
                              last_name = :last_name,
                              phone = :phone,
                              updated_at = CURRENT_TIMESTAMP
                          WHERE id = :id");
    $stmt->execute([
        ':email' => $email,
        ':first_name' => $firstName,
        ':last_name' => $lastName,
        ':phone' => $phone,
        ':id' => $userId
    ]);

    // Get updated user details
    $stmt = $conn->prepare("SELECT 
                            id, username, email, first_name, last_name, 
                            role, phone, created_at, updated_at
                          FROM users 
                          WHERE id = :id");
    $stmt->execute([':id' => $userId]);
    $user = $stmt->fetch();

    http_response_code(200);
    echo json_encode(apiResponse('success', 'Profile updated successfully', [
        'user' => $user
    ]));

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(apiResponse('error', 'Database error'));
}
?>