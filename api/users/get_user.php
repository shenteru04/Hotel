<?php
require_once '../db.php';

// Authenticate user
$payload = authenticate();

// Only allow GET requests
if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    http_response_code(405);
    echo json_encode(apiResponse('error', 'Method Not Allowed'));
    exit;
}

// Get user ID from query parameters (default to current user)
$userId = isset($_GET['id']) ? sanitizeInput($_GET['id']) : $payload['user_id'];

try {
    // Check if requesting user has permission
    if ($payload['user_id'] != $userId && $payload['role'] !== 'admin') {
        http_response_code(403);
        echo json_encode(apiResponse('error', 'Unauthorized to view this user'));
        exit;
    }

    // Get user details (excluding password)
    $stmt = $conn->prepare("SELECT 
                            id, username, email, first_name, last_name, 
                            role, phone, created_at, updated_at
                          FROM users 
                          WHERE id = :id");
    $stmt->execute([':id' => $userId]);
    $user = $stmt->fetch();

    if (!$user) {
        http_response_code(404);
        echo json_encode(apiResponse('error', 'User not found'));
        exit;
    }

    // Get user's reservations count if requested
    $includeStats = isset($_GET['stats']) && $_GET['stats'] == 'true';
    $stats = [];
    
    if ($includeStats) {
        // Reservation counts by status
        $stmt = $conn->prepare("SELECT status, COUNT(*) as count 
                              FROM reservations 
                              WHERE user_id = :user_id
                              GROUP BY status");
        $stmt->execute([':user_id' => $userId]);
        $reservationStats = $stmt->fetchAll(PDO::FETCH_KEY_PAIR);
        
        // Total spending
        $stmt = $conn->prepare("SELECT COALESCE(SUM(paid_amount), 0) as total_spent
                              FROM billing b
                              JOIN reservations r ON b.reservation_id = r.id
                              WHERE r.user_id = :user_id
                              AND b.payment_status = 'paid'");
        $stmt->execute([':user_id' => $userId]);
        $totalSpent = $stmt->fetchColumn();
        
        $stats = [
            'reservations' => $reservationStats,
            'total_spent' => (float)$totalSpent
        ];
    }

    // Prepare response
    $response = ['user' => $user];
    if ($includeStats) {
        $response['stats'] = $stats;
    }

    http_response_code(200);
    echo json_encode(apiResponse('success', 'User retrieved successfully', $response));

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(apiResponse('error', 'Database error'));
}
?>