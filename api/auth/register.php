<?php
require_once '../db.php';

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Method Not Allowed']);
    exit;
}

$input = json_decode(file_get_contents('php://input'), true);

if (json_last_error() !== JSON_ERROR_NONE) {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => 'Invalid JSON input']);
    exit;
}

// Validation
$errors = [];
$required = ['username', 'password', 'email', 'first_name', 'last_name'];
foreach ($required as $field) {
    if (empty($input[$field])) {
        $errors[] = ['field' => $field, 'message' => ucfirst(str_replace('_', ' ', $field)).' is required'];
    }
}

if (!filter_var($input['email'] ?? '', FILTER_VALIDATE_EMAIL)) {
    $errors[] = ['field' => 'email', 'message' => 'Invalid email format'];
}

if (strlen($input['password'] ?? '') < 8) {
    $errors[] = ['field' => 'password', 'message' => 'Password must be at least 8 characters'];
}

if (!empty($errors)) {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => 'Validation failed', 'errors' => $errors]);
    exit;
}

try {
    $conn->beginTransaction();

    // Check for duplicates
    $stmt = $conn->prepare("SELECT username, email FROM users WHERE username = ? OR email = ?");
    $stmt->execute([$input['username'], $input['email']]);
    
    if ($existing = $stmt->fetch()) {
        $conflict = $existing['username'] === $input['username'] ? 'username' : 'email';
        http_response_code(409);
        echo json_encode([
            'status' => 'error',
            'message' => ucfirst($conflict).' already exists',
            'conflict_field' => $conflict
        ]);
        exit;
    }

    // Insert user
    $stmt = $conn->prepare("INSERT INTO users SET 
        username = ?,
        password = ?,
        email = ?,
        first_name = ?,
        last_name = ?,
        phone = ?,
        role = 'customer',
        created_at = NOW(),
        updated_at = NOW()
    ");
    
    $hashedPassword = password_hash($input['password'], PASSWORD_DEFAULT);
    $stmt->execute([
        $input['username'],
        $hashedPassword,
        $input['email'],
        $input['first_name'],
        $input['last_name'],
        $input['phone'] ?? null
    ]);

    $userId = $conn->lastInsertId();

    // Generate token
    $tokenPayload = [
        'user_id' => $userId,
        'role' => 'customer',
        'exp' => time() + (60 * 60 * 24) // 1 day
    ];
    $token = generateJWT($tokenPayload);

    // Get created user
    $stmt = $conn->prepare("SELECT * FROM users WHERE id = ?");
    $stmt->execute([$userId]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    $conn->commit();

    http_response_code(201);
    echo json_encode([
        'status' => 'success',
        'message' => 'Registration successful',
        'token' => $token,
        'user' => [
            'id' => $user['id'],
            'username' => $user['username'],
            'email' => $user['email'],
            'first_name' => $user['first_name'],
            'last_name' => $user['last_name'],
            'phone' => $user['phone'],
            'role' => $user['role']
        ]
    ]);

} catch (PDOException $e) {
    $conn->rollBack();
    http_response_code(500);
    echo json_encode(['status' => 'error', 'message' => 'Database error: '.$e->getMessage()]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['status' => 'error', 'message' => 'Server error: '.$e->getMessage()]);
}
?>