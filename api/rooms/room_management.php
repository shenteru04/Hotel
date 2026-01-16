<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
header('Access-Control-Max-Age: 3600');

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

require_once __DIR__ . '/../db.php';
require_once __DIR__ . '/../auth.php';

// Debugging - log incoming requests
error_log("[" . date('Y-m-d H:i:s') . "] Received " . $_SERVER['REQUEST_METHOD'] . " request");

try {
    $auth = verifyToken();
    if (!$auth['valid']) {
        http_response_code(401);
        echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        exit();
    }

    $database = new Database();
    $db = $database->getConnection();

    $requestMethod = $_SERVER['REQUEST_METHOD'];
    $input = json_decode(file_get_contents('php://input'), true);

    switch ($requestMethod) {
        case 'GET':
            $stmt = $db->prepare("SELECT id, room_number, type, capacity, price, status, description, amenities, created_at, updated_at FROM rooms ORDER BY id DESC");
            $stmt->execute();
            $rooms = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode(['status' => 'success', 'rooms' => $rooms]);
            break;

        case 'POST':
            if (
                empty($input['room_number']) || empty($input['type']) || empty($input['capacity']) ||
                empty($input['price']) || empty($input['status'])
            ) {
                http_response_code(400);
                echo json_encode(['status' => 'error', 'message' => 'Missing required fields']);
                exit();
            }
            $stmt = $db->prepare("INSERT INTO rooms (room_number, type, capacity, price, status, description, amenities, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), NOW())");
            $stmt->execute([
                $input['room_number'],
                $input['type'],
                $input['capacity'],
                $input['price'],
                $input['status'],
                $input['description'] ?? '',
                $input['amenities'] ?? ''
            ]);
            echo json_encode(['status' => 'success', 'id' => $db->lastInsertId()]);
            break;

        case 'PUT':
            if (
                empty($input['id']) || empty($input['room_number']) || empty($input['type']) ||
                empty($input['capacity']) || empty($input['price']) || empty($input['status'])
            ) {
                http_response_code(400);
                echo json_encode(['status' => 'error', 'message' => 'Missing required fields']);
                exit();
            }
            $stmt = $db->prepare("UPDATE rooms SET room_number=?, type=?, capacity=?, price=?, status=?, description=?, amenities=?, updated_at=NOW() WHERE id=?");
            $stmt->execute([
                $input['room_number'],
                $input['type'],
                $input['capacity'],
                $input['price'],
                $input['status'],
                $input['description'] ?? '',
                $input['amenities'] ?? '',
                $input['id']
            ]);
            echo json_encode(['status' => 'success', 'affected_rows' => $stmt->rowCount()]);
            break;

        case 'DELETE':
            if (empty($input['id'])) {
                http_response_code(400);
                echo json_encode(['status' => 'error', 'message' => 'Missing room id']);
                exit();
            }
            $stmt = $db->prepare("DELETE FROM rooms WHERE id=?");
            $stmt->execute([$input['id']]);
            echo json_encode(['status' => 'success', 'affected_rows' => $stmt->rowCount()]);
            break;

        default:
            http_response_code(405);
            header('Allow: GET, POST, PUT, DELETE, OPTIONS');
            echo json_encode([
                'status' => 'error',
                'message' => 'Method Not Allowed',
                'allowed_methods' => ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS']
            ]);
    }
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
    error_log("Error: " . $e->getMessage());
}