<?php
// Connect to the database
require_once(__DIR__ . '/../db.php');

// --- Main Login Logic ---

// Allow only POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(apiResponse('error', 'Method Not Allowed'));
    exit;
}

// Get and sanitize JSON input
$data = json_decode(file_get_contents('php://input'), true);
$username = sanitizeInput($data['username'] ?? '');
$password = sanitizeInput($data['password'] ?? '');

// Check required fields
if (empty($username) || empty($password)) {
    http_response_code(400);
    echo json_encode(apiResponse('error', 'Username and password are required'));
    exit;
}

try {
    // Query user by username
    $stmt = $conn->prepare("SELECT * FROM users WHERE username = :username LIMIT 1");
    $stmt->execute([':username' => $username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Validate user and password
    if (!$user || !password_verify($password, $user['password'])) {
        http_response_code(401);
        echo json_encode(apiResponse('error', 'Invalid credentials'));
        exit;
    }

    // Generate a dummy token payload (replace with secure JWT later)
    $tokenPayload = [
        'user_id' => $user['id'],
        'role'    => $user['role'],
        'exp'     => time() + (60 * 60 * 24) // 1 day
    ];
    $token = generateJWT($tokenPayload);

    // Success: Return token and user info
    echo json_encode([
    'status' => 'success',
    'message' => 'Login successful',
    'token' => $token,
    'user' => [
        'id' => $user['id'],
        'username' => $user['username'],
        'email' => $user['email'],
        'first_name' => $user['first_name'],
        'last_name' => $user['last_name'],
        'role' => $user['role'] // Make sure this exists in your database
    ]
]);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(apiResponse('error', 'Database error: ' . $e->getMessage()));
}
?>
