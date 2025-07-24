<?php
// api/db.php - Database connection and core functions

// Always JSON response
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Exit early if accessed directly via browser (no AJAX)
// ✅ Allow API GET requests (from fetch/AJAX), only block direct browser access
if ($_SERVER['REQUEST_METHOD'] === 'GET' && empty($_SERVER['HTTP_SEC_FETCH_MODE']) && !isset($_SERVER['HTTP_AUTHORIZATION'])) {
    http_response_code(403);
    echo json_encode(["status" => "error", "message" => "Direct access is not allowed."]);
    exit;
}

// Database config
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'hotel_management');

try {
    $conn = new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME, DB_USER, DB_PASS);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    
    // Create $pdo alias for backward compatibility
    $pdo = $conn;
    
} catch(PDOException $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error",
        "message" => "Database connection failed",
        "error" => $e->getMessage()
    ]);
    exit;
}

// Input validation helper
function sanitizeInput($data) {
    if (is_array($data)) return array_map('sanitizeInput', $data);
    return htmlspecialchars(stripslashes(trim($data)), ENT_QUOTES, 'UTF-8');
}

// JWT generation
function generateJWT($payload) {
    $header = json_encode(['typ' => 'JWT', 'alg' => 'HS256']);
    $payload = json_encode($payload);

    $base64Header = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($header));
    $base64Payload = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($payload));
    
    $signature = hash_hmac('sha256', "$base64Header.$base64Payload", 'hotel_secret_key', true);
    $base64Signature = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($signature));
    
    return "$base64Header.$base64Payload.$base64Signature";
}

// JWT verification
function verifyJWT($token) {
    $parts = explode('.', $token);
    if (count($parts) !== 3) return false;

    [$header, $payload, $signature] = $parts;

    $expectedSig = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode(
        hash_hmac('sha256', "$header.$payload", 'hotel_secret_key', true)
    ));

    if ($expectedSig !== $signature) return false;

    $decoded = json_decode(base64_decode(str_replace(['-', '_'], ['+', '/'], $payload)), true);

    if (isset($decoded['exp']) && $decoded['exp'] < time()) return false;

    return $decoded;
}

// Auth middleware
function authenticate() {
    $headers = getallheaders();
    if (!isset($headers['Authorization'])) {
        http_response_code(401);
        echo json_encode(["status" => "error", "message" => "Authorization header missing"]);
        exit;
    }

    $token = str_replace('Bearer ', '', $headers['Authorization']);
    $payload = verifyJWT($token);

    if (!$payload) {
        http_response_code(401);
        echo json_encode(["status" => "error", "message" => "Invalid or expired token"]);
        exit;
    }

    return $payload;
}

// Role checking
function authorize($requiredRole) {
    $payload = authenticate();
    global $conn;

    $stmt = $conn->prepare("SELECT role FROM users WHERE id = :id");
    $stmt->execute([':id' => $payload['user_id']]);
    $user = $stmt->fetch();

    if (!$user || $user['role'] !== $requiredRole) {
        http_response_code(403);
        echo json_encode(["status" => "error", "message" => "Unauthorized access"]);
        exit;
    }

    return $payload;
}

// Standard response
function apiResponse($status, $message, $data = null) {
    $response = ["status" => $status, "message" => $message];
    if ($data !== null) $response["data"] = $data;
    return $response;
}

// Error handler
function handleException($e) {
    error_log($e->getMessage());
    http_response_code(500);
    echo json_encode([
        "status" => "error",
        "message" => "An error occurred",
        "error" => $e->getMessage()
    ]);
    exit;
}

set_exception_handler('handleException');
?>