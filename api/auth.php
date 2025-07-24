<?php
// api/auth.php - Handles login

require_once __DIR__ . '/db.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Method not allowed"]);
    exit;
}

// Read and sanitize input
$data = json_decode(file_get_contents("php://input"), true);
$username = sanitizeInput($data['username'] ?? '');
$password = sanitizeInput($data['password'] ?? '');

if (!$username || !$password) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Username and password are required"]);
    exit;
}

try {
    $stmt = $conn->prepare("SELECT id, username, password, role FROM users WHERE username = :username LIMIT 1");
    $stmt->execute([':username' => $username]);
    $user = $stmt->fetch();

    if (!$user || !password_verify($password, $user['password'])) {
        http_response_code(401);
        echo json_encode(["status" => "error", "message" => "Invalid username or password"]);
        exit;
    }

    // JWT payload
    $payload = [
        "user_id" => $user['id'],
        "username" => $user['username'],
        "role" => $user['role'],
        "exp" => time() + 60 * 60 * 24 // expires in 24 hours
    ];

    $token = generateJWT($payload);

    echo json_encode([
        "status" => "success",
        "message" => "Login successful",
        "token" => $token,
        "user" => [
            "id" => $user['id'],
            "username" => $user['username'],
            "role" => $user['role']
        ]
    ]);

} catch (Exception $e) {
    handleException($e);
}
