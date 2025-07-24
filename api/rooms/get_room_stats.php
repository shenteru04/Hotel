<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: Content-Type, Authorization');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}
require_once __DIR__ . '/../db.php';
require_once __DIR__ . '/../auth.php';

    // Check if function exists
    if (!function_exists('verifyToken')) {
        throw new Exception('verifyToken function not found in auth.php');
    }

    // Verify authentication
    $auth = verifyToken();
    if (!$auth['valid']) {
        http_response_code(401);
        echo json_encode([
            'status' => 'error',
            'message' => 'Unauthorized access'
        ]);
        exit();
    }

    // Check if Database class exists
if (!class_exists('Database')) {
    throw new Exception('Database class not found in db.php');
}


    $database = new Database();
    $db = $database->getConnection();
    
    if (!$db) {
        throw new Exception('Failed to get database connection');
    }
    
    // Test query first
    $testQuery = "SHOW TABLES";
    $stmt = $db->prepare($testQuery);
    $stmt->execute();
    $tables = $stmt->fetchAll(PDO::FETCH_COLUMN);
    
    if (!in_array('rooms', $tables)) {
        throw new Exception('Table "rooms" not found. Available tables: ' . implode(', ', $tables));
    }
    
    if (!in_array('reservations', $tables)) {
        throw new Exception('Table "reservations" not found. Available tables: ' . implode(', ', $tables));
    }
    
    // Get total rooms (your table has 'status' column)
    $totalRoomsQuery = "SELECT COUNT(*) as total_rooms FROM rooms WHERE status = 'available' OR status = 'occupied'";
    $stmt = $db->prepare($totalRoomsQuery);
    $stmt->execute();
    $totalRooms = $stmt->fetch(PDO::FETCH_ASSOC)['total_rooms'];
    
    // Get occupied rooms - check your reservations status values
    $occupiedRoomsQuery = "SELECT COUNT(DISTINCT room_id) as occupied_rooms 
                          FROM reservations 
                          WHERE (status = 'confirmed' OR status = 'checked_in') 
                          AND CURDATE() BETWEEN check_in AND check_out";
    $stmt = $db->prepare($occupiedRoomsQuery);
    $stmt->execute();
    $occupiedRooms = $stmt->fetch(PDO::FETCH_ASSOC)['occupied_rooms'];
    
    // Get available rooms
    $availableRooms = $totalRooms - $occupiedRooms;
    
    // Calculate occupancy rate
    $occupancyRate = $totalRooms > 0 ? round(($occupiedRooms / $totalRooms) * 100, 1) : 0;
    
    echo json_encode([
        'status' => 'success',
        'data' => [
            'total_rooms' => (int)$totalRooms,
            'occupied_rooms' => (int)$occupiedRooms,
            'available_rooms' => (int)$availableRooms,
            'occupancy_rate' => $occupancyRate
        ],
        'debug' => [
            'tables_found' => $tables,
            'file_path' => __FILE__,
            'auth_valid' => $auth['valid']
        ]
    ]);
    
?>