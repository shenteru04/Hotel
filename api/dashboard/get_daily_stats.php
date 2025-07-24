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

require_once 'db.php';
require_once 'auth.php';

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
    
    $today = date('Y-m-d');
    
    // Get today's check-ins
    $checkinQuery = "SELECT COUNT(*) as todays_checkins 
                     FROM reservations 
                     WHERE DATE(check_in) = ? AND (status = 'confirmed' OR status = 'checked_in')";
    $stmt = $db->prepare($checkinQuery);
    $stmt->execute([$today]);
    $todaysCheckins = $stmt->fetch(PDO::FETCH_ASSOC)['todays_checkins'];
    
    // Get today's check-outs
    $checkoutQuery = "SELECT COUNT(*) as todays_checkouts 
                      FROM reservations 
                      WHERE DATE(check_out) = ? AND status = 'checked_out'";
    $stmt = $db->prepare($checkoutQuery);
    $stmt->execute([$today]);
    $todaysCheckouts = $stmt->fetch(PDO::FETCH_ASSOC)['todays_checkouts'];
    
    // Get today's revenue from reservations
    $revenueQuery = "SELECT COALESCE(SUM(total_amount), 0) as todays_revenue 
                     FROM reservations 
                     WHERE DATE(check_in) = ? AND (status = 'confirmed' OR status = 'checked_in')";
    $stmt = $db->prepare($revenueQuery);
    $stmt->execute([$today]);
    $todaysRevenue = $stmt->fetch(PDO::FETCH_ASSOC)['todays_revenue'];
    
    // Get new reservations made today
    $newReservationsQuery = "SELECT COUNT(*) as new_reservations 
                            FROM reservations 
                            WHERE DATE(created_at) = ?";
    $stmt = $db->prepare($newReservationsQuery);
    $stmt->execute([$today]);
    $newReservations = $stmt->fetch(PDO::FETCH_ASSOC)['new_reservations'];
    
    // Format revenue with currency symbol
    $formattedRevenue = '$' . number_format($todaysRevenue, 2);
    
    echo json_encode([
        'status' => 'success',
        'data' => [
            'todays_checkins' => (int)$todaysCheckins,
            'todays_checkouts' => (int)$todaysCheckouts,
            'todays_revenue' => $formattedRevenue,
            'todays_revenue_raw' => (float)$todaysRevenue,
            'new_reservations' => (int)$newReservations,
            'date' => $today
        ]
    ]);
    
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => 'Database error: ' . $e->getMessage()
    ]);
}
?>