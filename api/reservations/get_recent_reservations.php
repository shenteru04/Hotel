<?php
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

try {
    $database = new Database();
    $db = $database->getConnection();
    
    // Get limit from query parameter, default to 10
    $limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 10;
    $limit = min($limit, 50); // Maximum 50 records
    
    // Query to get recent reservations with room and user details
    $query = "SELECT 
                r.id,
                r.room_id,
                r.user_id,
                r.check_in,
                r.check_out,
                r.total_amount,
                r.status,
                r.created_at,
                rm.room_number,
                rm.type as room_type,
                u.first_name,
                u.last_name,
                u.email,
                CONCAT(COALESCE(u.first_name, ''), ' ', COALESCE(u.last_name, '')) as guest_name
              FROM reservations r
              LEFT JOIN rooms rm ON r.room_id = rm.id
              LEFT JOIN users u ON r.user_id = u.id
              WHERE r.status != 'cancelled'
              ORDER BY r.created_at DESC
              LIMIT ?";
    
    $stmt = $db->prepare($query);
    $stmt->execute([$limit]);
    $reservations = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Format the data
    $formattedReservations = array_map(function($reservation) {
        return [
            'id' => $reservation['id'],
            'room_id' => $reservation['room_id'],
            'room_number' => $reservation['room_number'] ?: 'Room ' . $reservation['room_id'],
            'room_type' => $reservation['room_type'],
            'user_id' => $reservation['user_id'],
            'guest_name' => $reservation['guest_name'] ?: ($reservation['first_name'] . ' ' . $reservation['last_name']),
            'first_name' => $reservation['first_name'],
            'last_name' => $reservation['last_name'],
            'email' => $reservation['email'],
            'check_in' => $reservation['check_in'],
            'check_out' => $reservation['check_out'],
            'total_amount' => $reservation['total_amount'],
            'status' => $reservation['status'],
            'created_at' => $reservation['created_at'],
            'formatted_amount' => '$' . number_format($reservation['total_amount'], 2),
            'check_in_formatted' => date('M j, Y', strtotime($reservation['check_in'])),
            'check_out_formatted' => date('M j, Y', strtotime($reservation['check_out'])),
            'created_formatted' => date('M j, Y g:i A', strtotime($reservation['created_at']))
        ];
    }, $reservations);
    
    echo json_encode([
        'status' => 'success',
        'data' => $formattedReservations,
        'count' => count($formattedReservations)
    ]);
    
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => 'Database error: ' . $e->getMessage()
    ]);
}
?>