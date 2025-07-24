-- Hotel Management System Database Schema
CREATE DATABASE IF NOT EXISTS hotel_management;
USE hotel_management;

-- Users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role ENUM('admin', 'receptionist', 'customer') NOT NULL DEFAULT 'customer',
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_user_role (role)
);

-- Rooms table
CREATE TABLE rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    type ENUM('Standard', 'Deluxe', 'Suite', 'Family') NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    capacity INT NOT NULL,
    status ENUM('available', 'occupied', 'maintenance') DEFAULT 'available',
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_room_status (status),
    INDEX idx_room_type (type)
);

-- Reservations table
CREATE TABLE reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    status ENUM('pending', 'confirmed', 'checked_in', 'checked_out', 'cancelled') DEFAULT 'pending',
    adults INT NOT NULL DEFAULT 1,
    children INT DEFAULT 0,
    special_requests TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE CASCADE,
    INDEX idx_reservation_status (status),
    INDEX idx_reservation_dates (check_in, check_out)
);

-- Billing table
CREATE TABLE billing (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    paid_amount DECIMAL(10,2) DEFAULT 0,
    balance DECIMAL(10,2) GENERATED ALWAYS AS (total_amount - paid_amount) STORED,
    payment_status ENUM('pending', 'partial', 'paid', 'refunded') DEFAULT 'pending',
    payment_method VARCHAR(50),
    transaction_id VARCHAR(100),
    invoice_number VARCHAR(50) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (reservation_id) REFERENCES reservations(id) ON DELETE CASCADE,
    INDEX idx_billing_status (payment_status)
);

-- Extra charges table
CREATE TABLE extra_charges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT NOT NULL,
    description VARCHAR(255) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    charge_type ENUM('service', 'penalty', 'other') DEFAULT 'service',
    added_by INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reservation_id) REFERENCES reservations(id) ON DELETE CASCADE,
    FOREIGN KEY (added_by) REFERENCES users(id) ON DELETE CASCADE
);

-- Discounts table
CREATE TABLE discounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT NOT NULL,
    description VARCHAR(255) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    discount_type ENUM('promo', 'loyalty', 'other') DEFAULT 'promo',
    added_by INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reservation_id) REFERENCES reservations(id) ON DELETE CASCADE,
    FOREIGN KEY (added_by) REFERENCES users(id) ON DELETE CASCADE
);

-- Audit log table
CREATE TABLE audit_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    action VARCHAR(50) NOT NULL,
    table_name VARCHAR(50) NOT NULL,
    record_id INT,
    old_values TEXT,
    new_values TEXT,
    ip_address VARCHAR(45),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_audit_action (action),
    INDEX idx_audit_table (table_name)
);

-- Sample data insertion
INSERT INTO users (username, password, email, first_name, last_name, role, phone) VALUES
('admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin@hotel.com', 'Admin', 'User', 'admin', '1234567890'),
('reception1', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'reception@hotel.com', 'Sarah', 'Johnson', 'receptionist', '9876543210'),
('guest1', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'guest1@example.com', 'John', 'Doe', 'customer', '5551234567'),
('guest2', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'guest2@example.com', 'Jane', 'Smith', 'customer', '5559876543');

INSERT INTO rooms (room_number, type, price, capacity, status, description) VALUES
('101', 'Standard', 100.00, 2, 'available', 'Standard room with queen bed, TV, and free WiFi'),
('102', 'Standard', 100.00, 2, 'available', 'Standard room with queen bed, TV, and free WiFi'),
('201', 'Deluxe', 150.00, 2, 'available', 'Deluxe room with king bed, mini-bar, and city view'),
('202', 'Deluxe', 150.00, 2, 'maintenance', 'Deluxe room currently under maintenance'),
('301', 'Suite', 250.00, 4, 'available', 'Luxury suite with separate living area and jacuzzi'),
('302', 'Suite', 250.00, 4, 'available', 'Luxury suite with separate living area and jacuzzi'),
('401', 'Family', 180.00, 4, 'available', 'Family room with two double beds and extra space');

-- Create a sample reservation
INSERT INTO reservations (user_id, room_id, check_in, check_out, status, adults, children) VALUES
(3, 1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), DATE_ADD(CURDATE(), INTERVAL 3 DAY), 'confirmed', 2, 0);

-- Create corresponding billing record
INSERT INTO billing (reservation_id, total_amount, payment_status) VALUES
(1, 200.00, 'pending');

-- Create sample extra charge
INSERT INTO extra_charges (reservation_id, description, amount, charge_type, added_by) VALUES
(1, 'Airport Transfer', 50.00, 'service', 2);

-- Create sample discount
INSERT INTO discounts (reservation_id, description, amount, discount_type, added_by) VALUES
(1, 'First-time customer discount', 20.00, 'promo', 2);