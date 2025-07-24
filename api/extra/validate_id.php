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

// Get ID type and number from query parameters
$idType = sanitizeInput($_GET['type'] ?? '');
$idNumber = sanitizeInput($_GET['number'] ?? '');

// Validate input
if (empty($idType) || empty($idNumber)) {
    http_response_code(400);
    echo json_encode(apiResponse('error', 'ID type and number are required'));
    exit;
}

// List of valid ID types
$validIdTypes = ['passport', 'driver_license', 'national_id', 'other'];

if (!in_array($idType, $validIdTypes)) {
    http_response_code(400);
    echo json_encode(apiResponse('error', 'Invalid ID type'));
    exit;
}

try {
    // In a real implementation, you would:
    // 1. Validate the ID format based on type
    // 2. Possibly verify against an external service
    // For this example, we'll just do basic validation
    
    $isValid = false;
    $validationMessage = '';
    
    // Simple validation examples
    switch ($idType) {
        case 'passport':
            $isValid = preg_match('/^[A-Z]{2}\d{6}$/', $idNumber);
            $validationMessage = $isValid ? 'Passport number is valid' : 'Invalid passport number format';
            break;
            
        case 'driver_license':
            $isValid = preg_match('/^[A-Z0-9]{8,12}$/', $idNumber);
            $validationMessage = $isValid ? 'Driver license is valid' : 'Invalid driver license format';
            break;
            
        case 'national_id':
            $isValid = preg_match('/^\d{9,12}$/', $idNumber);
            $validationMessage = $isValid ? 'National ID is valid' : 'Invalid national ID format';
            break;
            
        default: // 'other'
            $isValid = strlen($idNumber) >= 6;
            $validationMessage = $isValid ? 'ID appears valid' : 'ID is too short';
    }

    http_response_code(200);
    echo json_encode(apiResponse('success', $validationMessage, [
        'valid' => $isValid,
        'type' => $idType,
        'number' => $idNumber
    ]));

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(apiResponse('error', 'Validation error'));
}
?>