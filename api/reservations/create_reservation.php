<?php
// Include the database connection
require_once '../db.php';

// Authenticate user
$userData = authenticate();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Method not allowed"]);
    exit;
}

try {
    // Validate required fields
    $requiredFields = ['room_id', 'check_in', 'check_out', 'adults', 'advance_payment_method'];
    foreach ($requiredFields as $field) {
        if (empty($_POST[$field])) {
            throw new Exception("Missing required field: $field");
        }
    }

    // Sanitize inputs
    $roomId = (int)$_POST['room_id'];
    $userId = (int)$userData['user_id'];
    $checkIn = sanitizeInput($_POST['check_in']);
    $checkOut = sanitizeInput($_POST['check_out']);
    $adults = (int)$_POST['adults'];
    $children = isset($_POST['children']) ? (int)$_POST['children'] : 0;
    $specialRequests = sanitizeInput($_POST['special_requests'] ?? '');
    $paymentMethod = sanitizeInput($_POST['payment_method'] ?? 'cash');
    $paymentDetails = sanitizeInput($_POST['payment_details'] ?? '');
    $advancePaymentMethod = sanitizeInput($_POST['advance_payment_method']);
    $pwdDiscount = isset($_POST['pwd_discount']) && $_POST['pwd_discount'] === '1';
    $additionalServices = $_POST['additional_services'] ?? [];

    // Validate dates
    $checkInDate = new DateTime($checkIn);
    $checkOutDate = new DateTime($checkOut);
    if ($checkOutDate <= $checkInDate) {
        throw new Exception("Check-out date must be after check-in date");
    }

    // Check if room exists and get its details
    $stmt = $conn->prepare("SELECT * FROM rooms WHERE id = :room_id");
    $stmt->execute([':room_id' => $roomId]);
    $room = $stmt->fetch();

    if (!$room) {
        throw new Exception("Room not found");
    }

    // Check room availability using your table structure
    $stmt = $conn->prepare("
        SELECT COUNT(*) as count 
        FROM reservations 
        WHERE room_id = :room_id 
        AND status IN ('confirmed', 'checked_in', 'pending') 
        AND (
            (check_in <= :check_in AND check_out > :check_in) OR
            (check_in < :check_out AND check_out >= :check_out) OR
            (check_in >= :check_in AND check_out <= :check_out)
        )
    ");
    $stmt->execute([
        ':room_id' => $roomId,
        ':check_in' => $checkIn,
        ':check_out' => $checkOut
    ]);
    $availability = $stmt->fetch();

    if ($availability['count'] > 0) {
        throw new Exception("Room is not available for the selected dates");
    }

    // Calculate pricing
    $nights = $checkInDate->diff($checkOutDate)->days;
    
    // Get room price (assuming it's stored in the rooms table)
    $roomPrice = isset($room['price']) ? (float)$room['price'] : 100.00; // Default price if not set
    $roomTotal = $roomPrice * $nights;
    $servicesTotal = 0;

    // Calculate additional services cost
    $servicePrices = [
        'late_checkout' => 15,
        'airport_pickup' => 30
    ];

    foreach ($additionalServices as $service) {
        if (isset($servicePrices[$service])) {
            $servicesTotal += $servicePrices[$service];
        }
    }

    $subtotal = $roomTotal + $servicesTotal;
    $discountAmount = $pwdDiscount ? $subtotal * 0.2 : 0;
    $totalAmount = $subtotal - $discountAmount;
    $advanceAmount = $totalAmount * 0.3;

    // Handle file upload
    $paymentProofPath = null;
    if (isset($_FILES['payment_proof']) && $_FILES['payment_proof']['error'] === UPLOAD_ERR_OK) {
        $uploadDir = '../../uploads/payment_proofs/';
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0755, true);
        }

        $fileExtension = strtolower(pathinfo($_FILES['payment_proof']['name'], PATHINFO_EXTENSION));
        $allowedExtensions = ['jpg', 'jpeg', 'png', 'pdf'];
        
        if (!in_array($fileExtension, $allowedExtensions)) {
            throw new Exception("Invalid file type. Only JPG, PNG, and PDF are allowed.");
        }

        if ($_FILES['payment_proof']['size'] > 2 * 1024 * 1024) { // 2MB limit
            throw new Exception("File size too large. Maximum 2MB allowed.");
        }

        $fileName = uniqid() . '_' . time() . '.' . $fileExtension;
        $paymentProofPath = $uploadDir . $fileName;

        if (!move_uploaded_file($_FILES['payment_proof']['tmp_name'], $paymentProofPath)) {
            throw new Exception("Failed to upload payment proof");
        }
    }

    // Start transaction
    $conn->beginTransaction();

    try {
        // Insert reservation using your existing table structure
        $stmt = $conn->prepare("
            INSERT INTO reservations (
                user_id, room_id, check_in, check_out, 
                adults, children, special_requests, payment_method, 
                payment_details, advance_payment_method, pwd_discount, 
                total_amount, advance_payment, advance_payment_file, 
                payment_proof, additional_services, status, created_at
            ) VALUES (
                :user_id, :room_id, :check_in, :check_out, 
                :adults, :children, :special_requests, :payment_method, 
                :payment_details, :advance_payment_method, :pwd_discount, 
                :total_amount, :advance_payment, :advance_payment_file, 
                :payment_proof, :additional_services, 'pending', NOW()
            )
        ");

        // Convert additional services to JSON string
        $additionalServicesJson = !empty($additionalServices) ? json_encode($additionalServices) : null;

        $stmt->execute([
            ':user_id' => $userId,
            ':room_id' => $roomId,
            ':check_in' => $checkIn,
            ':check_out' => $checkOut,
            ':adults' => $adults,
            ':children' => $children,
            ':special_requests' => $specialRequests,
            ':payment_method' => $paymentMethod,
            ':payment_details' => $paymentDetails,
            ':advance_payment_method' => $advancePaymentMethod,
            ':pwd_discount' => $pwdDiscount ? 1 : 0,
            ':total_amount' => $totalAmount,
            ':advance_payment' => $advanceAmount,
            ':advance_payment_file' => $paymentProofPath,
            ':payment_proof' => $paymentProofPath, // Same file for both fields
            ':additional_services' => $additionalServicesJson
        ]);

        $reservationId = $conn->lastInsertId();

        // Remove the reservation_services table creation since you store services in JSON
        // Additional services are already stored in the additional_services column as JSON

        $conn->commit();

        echo json_encode([
            "status" => "success",
            "message" => "Reservation created successfully! Please wait for admin confirmation.",
            "data" => [
                "reservation_id" => $reservationId,
                "total_amount" => $totalAmount,
                "advance_amount" => $advanceAmount
            ]
        ]);

    } catch (Exception $e) {
        $conn->rollBack();
        if ($paymentProofPath && file_exists($paymentProofPath)) {
            unlink($paymentProofPath);
        }
        throw $e;
    }

} catch (Exception $e) {
    error_log("Reservation creation error: " . $e->getMessage());
    http_response_code(400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
?>