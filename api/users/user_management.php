<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');
require_once __DIR__ . '/../db.php';

// Handle CORS
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type");

// Get the request method
$method = $_SERVER['REQUEST_METHOD'];

// Handle different request methods
switch ($method) {
    case 'GET':
        // Get all users or search users
        handleGetRequest();
        break;
    case 'POST':
        // Add a new user
        handlePostRequest();
        break;
    case 'PUT':
        // Update a user
        handlePutRequest();
        break;
    case 'DELETE':
        // Delete a user
        handleDeleteRequest();
        break;
    default:
        http_response_code(405);
        echo json_encode(['error' => 'Method not allowed']);
        break;
}

function handleGetRequest() {
    global $conn;
    
    $search = isset($_GET['search']) ? $_GET['search'] : '';
    
    try {
        $query = "SELECT id, username, email, first_name, last_name, phone, role, created_at 
                  FROM users";
        
        if (!empty($search)) {
            $query .= " WHERE username LIKE :search OR email LIKE :search OR 
                       first_name LIKE :search OR last_name LIKE :search OR 
                       phone LIKE :search OR role LIKE :search";
            $stmt = $conn->prepare($query);
            $searchParam = "%$search%";
            $stmt->bindParam(':search', $searchParam);
        } else {
            $stmt = $conn->prepare($query);
        }
        
        $stmt->execute();
        $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        echo json_encode(['success' => true, 'data' => $users]);
    } catch (PDOException $e) {
        http_response_code(500);
        echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
    }
}

function handlePostRequest() {
    global $conn;
    
    $data = json_decode(file_get_contents('php://input'), true);
    
    // Validate input
    if (!isset($data['username']) || !isset($data['password']) || !isset($data['email']) || 
        !isset($data['first_name']) || !isset($data['last_name']) || !isset($data['role'])) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required fields']);
        return;
    }
    
    $username = $data['username'];
    $password = password_hash($data['password'], PASSWORD_DEFAULT);
    $email = $data['email'];
    $firstName = $data['first_name'];
    $lastName = $data['last_name'];
    $phone = isset($data['phone']) ? $data['phone'] : null;
    $role = $data['role'];
    
    try {
        // Check if username or email already exists
        $checkStmt = $conn->prepare("SELECT id FROM users WHERE username = :username OR email = :email");
        $checkStmt->bindParam(':username', $username);
        $checkStmt->bindParam(':email', $email);
        $checkStmt->execute();
        
        if ($checkStmt->rowCount() > 0) {
            http_response_code(409);
            echo json_encode(['error' => 'Username or email already exists']);
            return;
        }
        
        // Insert new user
        $insertStmt = $conn->prepare("INSERT INTO users 
                                     (username, password, email, first_name, last_name, phone, role, created_at) 
                                     VALUES (:username, :password, :email, :first_name, :last_name, :phone, :role, NOW())");
        
        $insertStmt->bindParam(':username', $username);
        $insertStmt->bindParam(':password', $password);
        $insertStmt->bindParam(':email', $email);
        $insertStmt->bindParam(':first_name', $firstName);
        $insertStmt->bindParam(':last_name', $lastName);
        $insertStmt->bindParam(':phone', $phone);
        $insertStmt->bindParam(':role', $role);
        
        if ($insertStmt->execute()) {
            $userId = $conn->lastInsertId();
            $user = [
                'id' => $userId,
                'username' => $username,
                'email' => $email,
                'first_name' => $firstName,
                'last_name' => $lastName,
                'phone' => $phone,
                'role' => $role,
                'created_at' => date('Y-m-d H:i:s')
            ];
            echo json_encode(['success' => true, 'data' => $user]);
        } else {
            http_response_code(500);
            echo json_encode(['error' => 'Failed to create user']);
        }
    } catch (PDOException $e) {
        http_response_code(500);
        echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
    }
}

function handlePutRequest() {
    global $conn;
    
    $data = json_decode(file_get_contents('php://input'), true);
    $userId = isset($_GET['id']) ? $_GET['id'] : null;
    
    if (!$userId) {
        http_response_code(400);
        echo json_encode(['error' => 'User ID is required']);
        return;
    }
    
    // Validate input
    if (!isset($data['username']) || !isset($data['email']) || 
        !isset($data['first_name']) || !isset($data['last_name']) || !isset($data['role'])) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required fields']);
        return;
    }
    
    $username = $data['username'];
    $email = $data['email'];
    $firstName = $data['first_name'];
    $lastName = $data['last_name'];
    $phone = isset($data['phone']) ? $data['phone'] : null;
    $role = $data['role'];
    $password = isset($data['password']) ? password_hash($data['password'], PASSWORD_DEFAULT) : null;
    
    try {
        // Check if username or email already exists for another user
        $checkStmt = $conn->prepare("SELECT id FROM users WHERE (username = :username OR email = :email) AND id != :id");
        $checkStmt->bindParam(':username', $username);
        $checkStmt->bindParam(':email', $email);
        $checkStmt->bindParam(':id', $userId);
        $checkStmt->execute();
        
        if ($checkStmt->rowCount() > 0) {
            http_response_code(409);
            echo json_encode(['error' => 'Username or email already exists for another user']);
            return;
        }
        
        // Update user
        $updateFields = "username = :username, email = :email, first_name = :first_name, 
                        last_name = :last_name, phone = :phone, role = :role, updated_at = NOW()";
        
        if ($password) {
            $updateFields .= ", password = :password";
        }
        
        $updateStmt = $conn->prepare("UPDATE users SET $updateFields WHERE id = :id");
        
        $updateStmt->bindParam(':username', $username);
        $updateStmt->bindParam(':email', $email);
        $updateStmt->bindParam(':first_name', $firstName);
        $updateStmt->bindParam(':last_name', $lastName);
        $updateStmt->bindParam(':phone', $phone);
        $updateStmt->bindParam(':role', $role);
        $updateStmt->bindParam(':id', $userId);
        
        if ($password) {
            $updateStmt->bindParam(':password', $password);
        }
        
        if ($updateStmt->execute()) {
            echo json_encode(['success' => true]);
        } else {
            http_response_code(500);
            echo json_encode(['error' => 'Failed to update user']);
        }
    } catch (PDOException $e) {
        http_response_code(500);
        echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
    }
}

function handleDeleteRequest() {
    global $conn;
    
    $userId = isset($_GET['id']) ? $_GET['id'] : null;
    
    if (!$userId) {
        http_response_code(400);
        echo json_encode(['error' => 'User ID is required']);
        return;
    }
    
    try {
        $stmt = $conn->prepare("DELETE FROM users WHERE id = :id");
        $stmt->bindParam(':id', $userId);
        
        if ($stmt->execute()) {
            echo json_encode(['success' => true]);
        } else {
            http_response_code(500);
            echo json_encode(['error' => 'Failed to delete user']);
        }
    } catch (PDOException $e) {
        http_response_code(500);
        echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
    }
}
?>