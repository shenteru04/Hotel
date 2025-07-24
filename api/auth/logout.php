<?php
require_once '../db.php';

// Only allow POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(apiResponse('error', 'Method Not Allowed'));
    exit;
}

// In a real implementation, you might:
// 1. Add the token to a blacklist
// 2. Set token expiration on client side
// For this simple implementation, we just verify the token exists

try {
    $payload = authenticate(); // This will verify the token
    
    // Return success response
    http_response_code(200);
    echo json_encode(apiResponse('success', 'Logout successful'));

} catch (Exception $e) {
    http_response_code(401);
    echo json_encode(apiResponse('error', 'Invalid token'));
}
?>