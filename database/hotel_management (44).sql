-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2026 at 04:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `advance_payments`
--

CREATE TABLE `advance_payments` (
  `advance_payment_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_method_id` int(11) NOT NULL,
  `payment_status_id` int(11) NOT NULL DEFAULT 3,
  `reference_number` varchar(100) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advance_payments`
--

INSERT INTO `advance_payments` (`advance_payment_id`, `reservation_id`, `amount`, `payment_method_id`, `payment_status_id`, `reference_number`, `payment_date`, `notes`, `created_at`, `updated_at`) VALUES
(16, 24, 1650.00, 2, 3, '543463545345345', '2025-08-24 08:07:50', 'Advance payment for reservation - Reference: 543463545345345', '2025-08-24 00:07:50', '2025-08-24 00:07:50'),
(17, 25, 2300.00, 2, 3, '543463545345345', '2025-08-24 09:58:34', 'Advance payment for reservation - Reference: 543463545345345', '2025-08-24 01:58:34', '2025-08-24 01:58:34'),
(18, 27, 2000.00, 1, 3, '', '2025-08-24 11:51:13', 'Advance payment for reservation', '2025-08-24 03:51:13', '2025-08-24 03:51:13'),
(19, 28, 5000.00, 1, 3, '', '2025-08-24 14:06:53', 'Advance payment for reservation', '2025-08-24 06:06:53', '2025-08-24 06:06:53'),
(20, 29, 7040.00, 2, 3, '62964926983628', '2025-08-24 23:04:29', 'Advance payment for reservation - Reference: 62964926983628', '2025-08-24 15:04:29', '2025-08-24 15:04:29'),
(21, 30, 2980.00, 2, 3, '543463545345345', '2025-08-25 04:53:54', 'Advance payment for reservation - Reference: 543463545345345', '2025-08-24 20:53:54', '2025-08-24 20:53:54'),
(22, 31, 3375.00, 2, 3, '543463545345345', '2025-08-26 10:57:44', 'Advance payment for reservation - Reference: 543463545345345', '2025-08-26 02:57:44', '2025-08-26 02:57:44'),
(23, 32, 2310.00, 2, 3, '543463545345345', '2025-08-26 17:50:47', 'Advance payment for reservation - Reference: 543463545345345', '2025-08-26 09:50:47', '2025-08-26 09:50:47'),
(24, 33, 3350.00, 2, 3, '543463545345345', '2025-08-31 06:50:02', 'Advance payment for reservation - Reference: 543463545345345', '2025-08-30 22:50:02', '2025-08-30 22:50:02'),
(25, 34, 2405.00, 3, 3, '543463545345345', '2025-08-31 07:59:02', 'Advance payment for reservation - Reference: 543463545345345', '2025-08-30 23:59:02', '2025-08-30 23:59:02'),
(26, 35, 2640.00, 1, 3, '', '2025-08-31 08:11:35', 'Advance payment for reservation', '2025-08-31 00:11:35', '2025-08-31 00:11:35'),
(27, 36, 2350.00, 2, 3, '543463545345345', '2025-08-31 08:23:32', 'Advance payment for reservation - Reference: 543463545345345', '2025-08-31 00:23:32', '2025-08-31 00:23:32'),
(28, 37, 2560.00, 2, 3, '543463545345345', '2025-09-04 12:06:52', 'Advance payment for reservation - Reference: 543463545345345', '2025-09-04 04:06:52', '2025-09-04 04:06:52'),
(29, 38, 655.00, 1, 3, '', '2025-09-05 10:45:09', 'Advance payment for reservation', '2025-09-05 02:45:09', '2025-09-05 02:45:09'),
(30, 39, 2672.00, 1, 3, '', '2025-09-05 11:17:08', 'Advance payment for reservation', '2025-09-05 03:17:08', '2025-09-05 03:17:08'),
(31, 40, 2840.00, 2, 3, '543463545345345', '2025-09-07 16:35:05', 'Advance payment for reservation - Reference: 543463545345345', '2025-09-07 08:35:05', '2025-09-07 08:35:05'),
(32, 41, 2000.00, 2, 3, '543463545345345', '2025-09-10 17:42:57', 'Advance payment for reservation - Reference: 543463545345345', '2025-09-10 09:42:57', '2025-09-10 09:42:57'),
(33, 42, 2710.00, 2, 3, '62964926983628', '2025-09-11 08:58:00', 'Advance payment for reservation - Reference: 62964926983628', '2025-09-11 00:58:00', '2025-09-11 00:58:00'),
(34, 43, 500.00, 1, 3, '', '2025-09-11 11:42:40', 'Advance payment for reservation', '2025-09-11 03:42:40', '2025-09-11 03:42:40'),
(35, 44, 5000.00, 2, 3, '543463545345345', '2025-09-12 09:37:43', 'Advance payment for reservation - Reference: 543463545345345', '2025-09-12 01:37:43', '2025-09-12 01:37:43'),
(36, 45, 337.50, 3, 3, '543463545345345', '2025-09-12 10:02:02', 'Advance payment for reservation - Reference: 543463545345345', '2025-09-12 02:02:02', '2025-09-12 02:02:02'),
(37, 46, 1250.00, 2, 3, '543463545345345', '2025-09-12 10:33:08', 'Advance payment for reservation - Reference: 543463545345345', '2025-09-12 02:33:08', '2025-09-12 02:33:08'),
(38, 47, 1400.00, 1, 3, '', '2025-09-14 10:14:42', 'Advance payment for reservation', '2025-09-14 02:14:42', '2025-09-14 02:14:42'),
(39, 48, 1400.00, 1, 3, '', '2025-09-14 10:15:27', 'Advance payment for reservation', '2025-09-14 02:15:27', '2025-09-14 02:15:27'),
(40, 50, 7000.00, 1, 3, '', '2025-09-16 17:39:09', 'Advance payment for reservation', '2025-09-16 09:39:09', '2025-09-16 09:39:09'),
(41, 52, 1000.00, 1, 3, '', '2025-10-14 18:44:08', 'Advance payment for reservation', '2025-10-14 10:44:08', '2025-10-14 10:44:08');

-- --------------------------------------------------------

--
-- Table structure for table `archived_hotel_services`
--

CREATE TABLE `archived_hotel_services` (
  `archived_service_id` int(11) NOT NULL,
  `original_service_id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT 0.00,
  `is_complimentary` tinyint(1) DEFAULT 0,
  `archived_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `archived_by` int(11) DEFAULT NULL COMMENT 'employee_id of the user who archived it'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archived_hotel_services`
--

INSERT INTO `archived_hotel_services` (`archived_service_id`, `original_service_id`, `service_name`, `description`, `price`, `is_complimentary`, `archived_at`, `archived_by`) VALUES
(2, 16, 'Gags', 'dsda', 200.00, 0, '2025-10-09 03:05:18', 1),
(5, 19, 'dad', 'sda', 123.00, 0, '2025-10-09 03:58:26', 1),
(6, 20, 'fsafsasfaf', 'fsafaf', 3321.00, 0, '2025-10-09 03:58:52', 1),
(8, 1, 'Laundry Service', 'Clothes picked up and returned within 24 hours', 150.00, 0, '2025-10-17 00:16:02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `archived_menu_items`
--

CREATE TABLE `archived_menu_items` (
  `archived_menu_id` int(11) NOT NULL,
  `original_menu_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(100) DEFAULT 'General',
  `is_available` tinyint(1) DEFAULT 1,
  `archived_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `archived_by` int(11) DEFAULT NULL COMMENT 'employee_id of the user who archived it'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archived_menu_items`
--

INSERT INTO `archived_menu_items` (`archived_menu_id`, `original_menu_id`, `item_name`, `description`, `price`, `category`, `is_available`, `archived_at`, `archived_by`) VALUES
(2, 27, 'Grabs', 'dasdsa', 200.00, 'Mix and Match', 1, '2025-10-09 03:06:10', 1),
(4, 29, 'sadad', 'adsads', 12313.00, 'Mix and Match', 1, '2025-10-09 04:00:31', 1),
(5, 28, 'Leche Flan', 'Creamy caramel custard dessert', 120.00, 'Desserts', 1, '2025-10-10 00:28:22', 1),
(6, 11, 'Coca-Cola', 'Chilled soft drink (can)', 60.00, 'Drinks', 1, '2025-10-14 10:42:26', 1),
(7, 13, 'Hot Coffee', 'Fresh brewed hotel blend coffee', 90.00, 'Drinks', 1, '2025-10-17 00:16:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `archived_rooms`
--

CREATE TABLE `archived_rooms` (
  `archived_room_id` int(11) NOT NULL,
  `original_room_id` int(11) NOT NULL,
  `room_number` varchar(50) NOT NULL,
  `room_type_id` int(11) NOT NULL,
  `room_status_id` int(11) NOT NULL COMMENT 'The status of the room when it was archived',
  `floor_number` int(11) DEFAULT NULL,
  `archived_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `archived_by` int(11) DEFAULT NULL COMMENT 'employee_id of the user who archived it'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `archived_room_amenities_mapping`
--

CREATE TABLE `archived_room_amenities_mapping` (
  `archived_mapping_id` int(11) NOT NULL,
  `original_room_id` int(11) NOT NULL,
  `amenity_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `archived_room_types`
--

CREATE TABLE `archived_room_types` (
  `archived_room_type_id` int(11) NOT NULL,
  `original_room_type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price_per_night` decimal(10,2) NOT NULL,
  `capacity` int(11) NOT NULL,
  `archived_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `archived_by` int(11) DEFAULT NULL COMMENT 'employee_id of the user who archived it'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archived_room_types`
--

INSERT INTO `archived_room_types` (`archived_room_type_id`, `original_room_type_id`, `type_name`, `description`, `price_per_night`, `capacity`, `archived_at`, `archived_by`) VALUES
(4, 17, 'example', 'sadadadsa', 1000.00, 5, '2025-10-09 03:06:20', 1),
(10, 24, 'dsad', 'sda', 3122.00, 1, '2025-10-14 10:27:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `valid_id` varchar(50) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `advance_payment` decimal(10,2) DEFAULT NULL,
  `payment_proof` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `email`, `valid_id`, `phone_number`, `advance_payment`, `payment_proof`) VALUES
(1, 'Yoyo', 'Vill', 'yoyo@gmail.com', NULL, '097365289295', 0.00, NULL),
(2, 'Janice', 'Jamito', 'janice@hotel.com', NULL, '09354623235', 0.00, NULL),
(3, 'Clint', 'Plaza', 'bobo@gmail.com', NULL, '657868878', 0.00, NULL),
(6, 'Shankai', 'Bai', 'shangkaibai@hotel.com', NULL, '09354623235', NULL, NULL),
(7, 'Gregor', 'Mac', 'macgregor@hotel.com', NULL, '09354623235', NULL, NULL),
(8, 'Christian', 'Boncales', 'christianboncales@gmail.com', NULL, '09354623235', NULL, NULL),
(9, 'hello', 'hii', 'john@hotel.com', NULL, '0987654333', NULL, NULL),
(10, 'Gardo', 'vill', 'gardo@hotel.com', NULL, '24625462342642', NULL, NULL),
(11, 'applejaneM', 'vill', 'apple@gmail.com', NULL, '686898888989', NULL, NULL),
(12, 'Kenneth', 'Lopez', 'kennethlopez@gmail.com', NULL, '09362842498', NULL, NULL),
(13, 'Clint Denzel', 'Plaza', 'clintdenzelplaza@gmail.com', NULL, '09123456789', NULL, NULL),
(14, 'Arline', 'Boncales', 'arline@gmail.com', NULL, '09678714583', NULL, NULL),
(15, 'Haro', 'Kart', 'haro@gmail.com', NULL, '09678715483', NULL, NULL),
(16, 'Janice', 'Jamito', 'janicejamito@gmail.com', NULL, '097645138545', NULL, NULL),
(17, 'Garey', 'Gru', 'garey@gmail.com', NULL, '08476349353', NULL, NULL),
(18, 'Clint Denzel', 'Plaza', 'clintplaza@gmail.com', NULL, '09354623235', NULL, NULL),
(19, 'Jamil', 'Khalid', 'jamil@hotel.com', NULL, '09354623235', NULL, NULL),
(20, 'Jorge', 'Bargues', 'jorge@gmail.con', NULL, '08327652953', NULL, NULL),
(21, 'asd', 'asd', 'asdd@gmail.com', NULL, '09354623235', NULL, NULL),
(22, 'adas', 'hoiuhuoi', 'hellokitty@gmail.com', NULL, '232523', NULL, NULL),
(23, 'dasdasdasdsadsa', 'boncales', 'admin@example.com', NULL, '7878970979', NULL, NULL),
(24, 'dasd', 'dadsa', 'admin@barangay.gov.ph', NULL, '686898888989', NULL, NULL),
(25, 'adas', 'dsada', 'christiandaveboncales@gmail.com', NULL, '0848395839', NULL, NULL),
(26, 'DADS', 'ADam', 'krausschneizer@gmail.com', NULL, '079074923', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_otp`
--

CREATE TABLE `email_otp` (
  `otp_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `otp_code` varchar(6) NOT NULL,
  `purpose` enum('login','password_reset','account_verification') DEFAULT 'login',
  `expires_at` datetime NOT NULL,
  `verified_at` datetime DEFAULT NULL,
  `attempts` int(11) DEFAULT 0,
  `max_attempts` int(11) DEFAULT 3,
  `created_at` datetime DEFAULT current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_otp`
--

INSERT INTO `email_otp` (`otp_id`, `employee_id`, `otp_code`, `purpose`, `expires_at`, `verified_at`, `attempts`, `max_attempts`, `created_at`, `ip_address`, `user_agent`) VALUES
(63, 2, '251429', 'login', '2025-09-02 11:22:46', '2025-09-02 11:18:11', 1, 3, '2025-09-02 11:17:46', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(64, 1, '580372', 'login', '2025-09-02 11:26:14', '2025-09-02 11:22:01', 1, 3, '2025-09-02 11:21:14', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(65, 5, '511643', 'login', '2025-09-02 11:29:12', '2025-09-02 11:24:38', 1, 3, '2025-09-02 11:24:12', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(66, 5, '536302', 'login', '2025-09-02 11:30:01', '2025-09-02 11:25:29', 3, 3, '2025-09-02 11:25:01', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(72, 2, '919601', 'password_reset', '2025-09-02 14:34:16', '2025-09-02 14:29:47', 1, 3, '2025-09-02 14:29:16', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(73, 2, '165149', 'password_reset', '2025-09-02 14:50:55', '2025-09-02 14:46:26', 1, 3, '2025-09-02 14:45:55', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(74, 2, '313410', 'login', '2025-09-02 14:51:52', '2025-09-02 14:47:10', 1, 3, '2025-09-02 14:46:52', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(75, 1, '496668', 'password_reset', '2025-09-02 14:52:35', '2025-09-02 14:48:00', 1, 3, '2025-09-02 14:47:35', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(76, 1, '839735', 'login', '2025-09-02 14:56:51', '2025-09-02 14:52:15', 1, 3, '2025-09-02 14:51:51', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(77, 2, '188218', 'login', '2025-09-02 14:59:17', '2025-09-02 14:54:38', 1, 3, '2025-09-02 14:54:17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(78, 5, '342535', 'login', '2025-09-02 15:00:45', '2025-09-02 14:56:28', 1, 3, '2025-09-02 14:55:45', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(79, 1, '792782', 'login', '2025-09-03 10:21:37', '2025-09-03 10:18:31', 1, 3, '2025-09-03 10:16:37', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(81, 2, '369973', 'login', '2025-09-03 10:31:09', '2025-09-03 10:26:49', 1, 3, '2025-09-03 10:26:09', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(82, 2, '770154', 'password_reset', '2025-09-04 12:03:24', '2025-09-04 11:58:47', 1, 3, '2025-09-04 11:58:24', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(83, 2, '445847', 'login', '2025-09-04 12:04:30', '2025-09-04 11:59:50', 1, 3, '2025-09-04 11:59:30', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(84, 1, '838549', 'login', '2025-09-04 12:05:23', '2025-09-04 12:01:12', 1, 3, '2025-09-04 12:00:23', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(85, 2, '801228', 'login', '2025-09-04 12:09:04', '2025-09-04 12:04:18', 1, 3, '2025-09-04 12:04:04', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(86, 2, '583893', 'login', '2025-09-05 09:05:33', '2025-09-05 09:01:02', 1, 3, '2025-09-05 09:00:33', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(87, 5, '442791', 'password_reset', '2025-09-05 10:25:49', '2025-09-05 10:21:32', 1, 3, '2025-09-05 10:20:49', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(88, 5, '993161', 'login', '2025-09-05 10:27:20', '2025-09-05 10:22:41', 1, 3, '2025-09-05 10:22:20', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(89, 1, '999046', 'login', '2025-09-05 10:30:13', '2025-09-05 10:25:58', 3, 3, '2025-09-05 10:25:13', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(90, 1, '209751', 'login', '2025-09-05 10:37:08', '2025-09-05 10:32:24', 1, 3, '2025-09-05 10:32:08', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(91, 2, '989629', 'login', '2025-09-05 10:39:01', '2025-09-05 10:34:35', 1, 3, '2025-09-05 10:34:01', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(92, 5, '356689', 'login', '2025-09-05 10:40:30', '2025-09-05 10:35:47', 1, 3, '2025-09-05 10:35:30', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(94, 2, '759728', 'login', '2025-09-05 11:28:13', '2025-09-05 11:24:49', 1, 3, '2025-09-05 11:23:13', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(95, 1, '254323', 'login', '2025-09-05 20:53:08', '2025-09-05 20:48:26', 1, 3, '2025-09-05 20:48:08', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(96, 2, '205657', 'login', '2025-09-10 17:46:08', '2025-09-10 17:41:46', 2, 3, '2025-09-10 17:41:08', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(97, 1, '944394', 'login', '2025-09-11 10:49:06', '2025-09-11 10:44:26', 1, 3, '2025-09-11 10:44:06', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(98, 2, '317381', 'login', '2025-09-11 11:29:16', '2025-09-11 11:24:33', 1, 3, '2025-09-11 11:24:16', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(99, 1, '850219', 'login', '2025-09-11 17:17:29', '2025-09-11 17:14:01', 1, 3, '2025-09-11 17:12:29', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(100, 1, '360949', 'login', '2025-09-12 07:09:45', '2025-09-12 07:05:04', 1, 3, '2025-09-12 07:04:45', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(102, 2, '474587', 'login', '2025-09-12 16:53:32', '2025-09-12 16:49:32', 1, 3, '2025-09-12 16:48:32', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(103, 2, '718503', 'login', '2025-09-16 11:06:15', '2025-09-16 11:01:36', 1, 3, '2025-09-16 11:01:15', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(104, 1, '766670', 'login', '2025-09-16 17:15:08', '2025-09-16 17:10:26', 1, 3, '2025-09-16 17:10:08', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(105, 2, '746529', 'login', '2025-09-19 07:28:31', '2025-09-19 07:24:09', 1, 3, '2025-09-19 07:23:31', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(107, 2, '432904', 'login', '2025-09-20 17:54:11', '2025-09-20 17:51:09', 2, 3, '2025-09-20 17:49:11', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(108, 2, '924405', 'login', '2025-10-03 19:22:59', '2025-10-03 19:18:42', 1, 3, '2025-10-03 19:17:59', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(109, 2, '393913', 'login', '2025-10-04 09:51:45', '2025-10-04 09:47:05', 1, 3, '2025-10-04 09:46:45', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(110, 2, '792028', 'login', '2025-10-09 07:21:54', '2025-10-09 07:17:09', 1, 3, '2025-10-09 07:16:54', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(111, 1, '571019', 'login', '2025-10-09 07:22:40', '2025-10-09 07:17:54', 1, 3, '2025-10-09 07:17:40', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(112, 1, '726988', 'login', '2025-10-09 08:26:28', '2025-10-09 08:21:53', 1, 3, '2025-10-09 08:21:28', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(113, 1, '386660', 'login', '2025-10-09 08:29:46', '2025-10-09 08:25:20', 2, 3, '2025-10-09 08:24:46', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(114, 1, '630037', 'login', '2025-10-09 08:32:21', '2025-10-09 08:27:45', 1, 3, '2025-10-09 08:27:21', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Mobile Safari/537.36'),
(115, 1, '415643', 'login', '2025-10-09 08:34:10', '2025-10-09 08:29:26', 1, 3, '2025-10-09 08:29:10', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Mobile Safari/537.36'),
(116, 1, '912570', 'login', '2025-10-09 08:35:13', '2025-10-09 08:30:27', 1, 3, '2025-10-09 08:30:13', '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Mobile Safari/537.36'),
(117, 2, '796749', 'login', '2025-10-09 12:06:25', '2025-10-09 12:01:44', 1, 3, '2025-10-09 12:01:25', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(118, 1, '190037', 'login', '2025-10-09 13:03:53', '2025-10-09 12:59:18', 1, 3, '2025-10-09 12:58:53', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(121, 1, '930809', 'login', '2025-10-14 18:27:38', '2025-10-14 18:23:01', 1, 3, '2025-10-14 18:22:38', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(122, 2, '525321', 'login', '2025-10-14 18:28:51', '2025-10-14 18:24:16', 1, 3, '2025-10-14 18:23:51', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(123, 1, '748768', 'login', '2025-10-14 21:54:25', '2025-10-14 21:49:45', 1, 3, '2025-10-14 21:49:25', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(124, 1, '306494', 'login', '2025-10-17 07:23:28', '2025-10-17 07:19:01', 1, 3, '2025-10-17 07:18:28', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(125, 2, '943169', 'login', '2025-10-17 07:23:42', '2025-10-17 07:19:24', 1, 3, '2025-10-17 07:18:42', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(126, 1, '359916', 'login', '2025-10-17 08:40:33', '2025-10-17 08:36:03', 1, 3, '2025-10-17 08:35:33', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(130, 1, '982853', 'login', '2025-10-31 17:29:03', '2025-10-31 17:24:18', 1, 3, '2025-10-31 17:24:03', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(131, 2, '482277', 'login', '2025-10-31 17:29:35', '2025-10-31 17:24:53', 1, 3, '2025-10-31 17:24:35', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(132, 1, '897991', 'password_reset', '2026-01-06 14:36:20', '2026-01-06 14:31:48', 1, 3, '2026-01-06 14:31:20', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone_num` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `roles` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT 0,
  `first_failed_attempt` timestamp NULL DEFAULT NULL,
  `locked_until` timestamp NULL DEFAULT NULL,
  `locked_by_admin` tinyint(1) DEFAULT 0,
  `mfa_enabled` tinyint(1) DEFAULT 1,
  `mfa_method` enum('email','sms','app') DEFAULT 'email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `email`, `first_name`, `last_name`, `phone_num`, `password`, `role_id`, `roles`, `is_active`, `created_at`, `last_login`, `failed_attempts`, `first_failed_attempt`, `locked_until`, `locked_by_admin`, `mfa_enabled`, `mfa_method`) VALUES
(1, 'christiandaveboncales@gmail.com', 'Admin', 'User', '09123456789', '$2y$10$mul6gDwtkCXjJshBVFRgbuTrPRSQSXtG.gLE0.nCgylu7lW8jgzuW', 1, 'admin', 1, '2025-08-09 10:21:32', '2025-10-31 09:24:18', 0, NULL, NULL, 0, 1, 'email'),
(2, 'christianboncales09@gmail.com', 'Christian', 'Boncales', '23526234', '$2y$10$rP7HtG4ODHSJdPGQ/MdsgetSu5dCHY0G4Zy9nIlwE7P4/OFY.aNEq', 2, 'front desk', 1, '2025-08-10 12:50:56', '2025-10-31 09:24:53', 0, NULL, NULL, 0, 1, 'email'),
(5, 'hetohorah@gmail.com', 'Clint', 'Plaza', '542423324253', '$2y$10$QFB8himpx.15x68nt84tGOw3nTKq5VOFmh.sheWUq19TUnR/W3hYq', 2, 'handyman', 1, '2025-08-18 08:24:28', '2025-09-05 02:35:47', 0, NULL, NULL, 0, 1, 'email'),
(11, 'kanserouslance@gmail.com', 'Jamil', 'Fajardo', '4265236347', '$2y$10$aIbz2rP1hLJF1jRsCKMUE.Lf2NVGZK4Eh2GmZepJG24FQJNRbVALO', 2, 'handyman', 1, '2025-08-25 20:34:02', '2025-08-26 00:26:09', 0, NULL, NULL, 0, 1, 'email'),
(13, 'tayamonante@gmail.com', 'Apple Jane', 'Edrolin', '4265236347', '$2y$10$7MKGEOqpAe8O5DU2kw.eEeXd3yyfaX9LbszlPrAzXTywAmNkc8Owm', 2, 'front desk', 1, '2025-08-25 22:58:13', '2025-08-25 14:58:48', 0, NULL, NULL, 0, 1, 'email'),
(14, 'john@hotel.com', 'John', 'Zarsosa', '4265236347', '$2y$10$cUdzhh4.nH/5Sr4HRAvYfOcMo1ZPQVLJOUY0C4/tT1WpECIFNFAka', 2, NULL, 1, '2025-09-11 11:13:59', NULL, 0, NULL, NULL, 0, 1, 'email');

-- --------------------------------------------------------

--
-- Table structure for table `extra_charges`
--

CREATE TABLE `extra_charges` (
  `extra_charges_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `service_type` enum('room_service','food_delivery','additional_service','amenity_request') DEFAULT 'additional_service',
  `service_name` varchar(255) DEFAULT NULL,
  `service_description` text DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `unit_price` decimal(10,2) DEFAULT 0.00,
  `requested_at` datetime DEFAULT current_timestamp(),
  `fulfilled_at` datetime DEFAULT NULL,
  `request_source` enum('check_in','during_stay','online','phone') DEFAULT 'check_in',
  `guest_notes` text DEFAULT NULL,
  `staff_notes` text DEFAULT NULL,
  `status` enum('pending','approved','in_progress','completed','cancelled') DEFAULT 'pending',
  `processed_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `extra_charges`
--

INSERT INTO `extra_charges` (`extra_charges_id`, `request_id`, `service_type`, `service_name`, `service_description`, `quantity`, `unit_price`, `requested_at`, `fulfilled_at`, `request_source`, `guest_notes`, `staff_notes`, `status`, `processed_by`, `created_at`, `updated_at`, `amount`) VALUES
(1, 23, 'room_service', 'Airport Shuttle', 'Ride to/from the airport', 1, 800.00, '2025-08-24 08:07:50', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 800.00),
(2, 24, 'room_service', 'Extra Blanket', 'Request for extra blanket', 1, 10.00, '2025-08-24 09:58:34', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 0.00),
(3, 25, 'room_service', 'Extra Pillow', 'Request for additional pillow', 1, 20.00, '2025-08-24 09:58:34', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 0.00),
(4, 26, 'room_service', 'Room Cleaning', 'Cleaning outside housekeeping schedule', 1, 200.00, '2025-08-24 09:58:34', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 0.00),
(5, 27, 'food_delivery', 'American Breakfast', 'Includes eggs, bacon, toast, and coffee', 1, 320.00, '2025-08-24 11:51:13', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 320.00),
(6, 28, 'food_delivery', 'American Breakfast', 'Includes eggs, bacon, toast, and coffee', 1, 320.00, '2025-08-24 14:06:53', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 320.00),
(7, 29, 'food_delivery', 'Omelette Special', 'Cheese and ham omelette with toast', 1, 270.00, '2025-08-24 14:06:53', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 270.00),
(8, 30, 'food_delivery', 'American Cream', 'Include cream pies', 1, 100.00, '2025-08-24 14:06:53', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 100.00),
(9, 31, 'food_delivery', 'Bottled Water', '500ml purified bottled water', 1, 30.00, '2025-08-24 14:06:53', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 30.00),
(10, 32, 'food_delivery', 'Beef Steak', 'Tenderloin steak with gravy and fries', 1, 690.00, '2025-08-24 14:06:53', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 690.00),
(11, 33, 'room_service', 'Extra Pillow', 'Request for additional pillow', 1, 20.00, '2025-08-24 23:04:29', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 0.00),
(12, 34, 'room_service', 'Shoe Cleaning', 'Complimentary shoe shine service', 1, 100.00, '2025-08-24 23:04:29', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 0.00),
(13, 35, 'room_service', 'Extra Blanket', 'Request for extra blanket', 1, 10.00, '2025-08-25 04:53:54', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 0.00),
(14, 36, 'room_service', 'Extra Pillow', 'Request for additional pillow', 1, 20.00, '2025-08-25 04:53:54', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 0.00),
(15, 37, 'room_service', 'Room Cleaning', 'Cleaning outside housekeeping schedule', 1, 200.00, '2025-08-25 04:53:54', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 0.00),
(16, 38, 'room_service', 'Towel Replacement', 'Fresh towel delivered to room', 1, 10.00, '2025-08-25 04:53:54', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 0.00),
(17, 39, 'room_service', 'Ironing Service', 'Clothes ironed upon request', 1, 100.00, '2025-08-25 04:53:54', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 100.00),
(18, 40, 'room_service', 'Extra Blanket', 'Request for extra blanket', 1, 10.00, '2025-08-26 10:57:44', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 0.00),
(19, 41, 'room_service', 'Extra Pillow', 'Request for additional pillow', 1, 20.00, '2025-08-26 10:57:44', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 0.00),
(20, 42, 'room_service', 'Extra Blanket', 'Request for extra blanket', 1, 10.00, '2025-08-26 17:50:46', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 0.00),
(21, 43, 'room_service', 'Towel Replacement', 'Fresh towel delivered to room', 1, 10.00, '2025-08-26 17:50:46', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 0.00),
(22, 44, 'room_service', 'Airport Shuttle', 'Ride to/from the airport', 1, 800.00, '2025-08-31 06:50:02', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 800.00),
(23, 45, 'room_service', 'Room Cleaning', 'Cleaning outside housekeeping schedule', 1, 200.00, '2025-08-31 07:59:02', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 200.00),
(24, 46, 'room_service', 'Towel Replacement', 'Fresh towel delivered to room', 1, 10.00, '2025-08-31 07:59:02', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 10.00),
(25, 47, 'food_delivery', 'American Breakfast', 'Includes eggs, bacon, toast, and coffee', 1, 320.00, '2025-08-31 08:11:35', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 320.00),
(26, 48, 'food_delivery', 'Continental Breakfast', 'Bread, butter, jam, juice, and tea', 1, 280.00, '2025-08-31 08:11:35', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 280.00),
(27, 49, 'food_delivery', 'Omelette Special', 'Cheese and ham omelette with toast', 1, 270.00, '2025-08-31 08:11:35', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 270.00),
(28, 50, 'room_service', 'Airport Shuttle', 'Ride to/from the airport', 1, 800.00, '2025-08-31 08:23:32', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 800.00),
(29, 51, 'room_service', 'Extra Blanket', 'Request for extra blanket', 1, 10.00, '2025-08-31 08:23:32', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 10.00),
(30, 52, 'room_service', 'Extra Pillow', 'Request for additional pillow', 1, 20.00, '2025-08-31 08:23:32', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 20.00),
(31, 53, 'room_service', 'Airport Shuttle', 'Ride to/from the airport', 1, 800.00, '2025-09-04 12:06:52', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 800.00),
(32, 54, 'room_service', 'Extra Pillow', 'Request for additional pillow', 1, 20.00, '2025-09-05 10:45:09', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 20.00),
(33, 55, 'room_service', 'Extra Service', 'Different services', 1, 100.00, '2025-09-05 10:45:09', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 100.00),
(34, 56, 'room_service', 'Extra Blanket', 'Request for extra blanket', 1, 10.00, '2025-09-05 11:17:08', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 10.00),
(35, 57, 'room_service', 'Airport Shuttle', 'Ride to/from the airport', 1, 800.00, '2025-09-07 16:35:05', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 800.00),
(36, 58, 'room_service', 'Extra Blanket', 'Request for extra blanket', 1, 10.00, '2025-09-07 16:35:05', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 10.00),
(37, 59, 'food_delivery', 'American Breakfast', 'Includes eggs, bacon, toast, and coffee', 1, 320.00, '2025-09-11 07:30:35', NULL, 'during_stay', NULL, NULL, 'pending', NULL, '2025-09-11 00:09:10', '2025-09-11 00:09:10', 880.00),
(38, 60, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-11 08:58:00', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-11 00:58:00', '2025-09-11 00:58:00', 800.00),
(39, 61, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-11 11:42:40', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-11 03:42:40', '2025-09-11 03:42:40', 320.00),
(40, 62, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-11 18:13:01', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-11 10:13:01', '2025-09-11 10:13:01', 690.00),
(41, 63, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-11 18:18:12', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-11 10:18:12', '2025-09-11 10:18:12', 1200.00),
(42, 64, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-11 18:22:18', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-11 10:22:18', '2025-09-11 10:22:18', 20.00),
(43, 65, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-11 18:28:10', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-11 10:28:10', '2025-09-11 10:28:10', 260.00),
(44, 66, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-11 18:34:26', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-11 10:34:26', '2025-09-11 10:34:26', 870.00),
(45, 67, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-11 18:44:22', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-11 10:44:22', '2025-09-11 10:44:22', 10.00),
(46, 68, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-12 07:13:17', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-11 23:13:17', '2025-09-11 23:13:17', 1470.00),
(47, 69, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-12 07:53:14', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-11 23:53:14', '2025-09-11 23:53:14', 150.00),
(48, 70, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-12 08:46:37', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-12 00:46:37', '2025-09-12 00:46:37', 800.00),
(49, 71, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-12 08:54:12', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-12 00:54:12', '2025-09-12 00:54:12', 280.00),
(50, 72, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-12 09:07:24', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-12 01:07:24', '2025-09-12 01:07:24', 320.00),
(51, 73, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-12 09:24:25', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-12 01:24:25', '2025-09-12 01:24:25', 920.00),
(52, 74, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-12 09:28:00', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-12 01:28:00', '2025-09-12 01:28:00', 130.00),
(53, 75, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-12 10:02:02', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-12 02:02:02', '2025-09-12 02:02:02', 20.00),
(54, 76, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-12 10:02:02', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-12 02:02:02', '2025-09-12 02:02:02', 100.00),
(55, 77, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-12 10:19:11', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-12 02:19:11', '2025-09-12 02:19:11', 320.00),
(56, 78, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-12 10:41:37', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-12 02:41:37', '2025-09-12 02:41:37', 360.00),
(57, 79, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-16 12:24:03', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-16 04:24:03', '2025-09-16 04:24:03', 320.00),
(58, 80, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-16 12:24:03', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-16 04:24:03', '2025-09-16 04:24:03', 280.00),
(59, 81, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-16 12:24:03', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-16 04:24:03', '2025-09-16 04:24:03', 250.00),
(60, 82, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-16 12:25:59', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-16 04:25:59', '2025-09-16 04:25:59', 320.00),
(61, 83, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-16 14:04:27', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-16 06:04:27', '2025-09-16 06:04:27', 100.00),
(62, 84, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-16 14:10:43', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-16 06:10:43', '2025-09-16 06:10:43', 100.00),
(63, 85, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-19 07:29:24', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-18 23:29:24', '2025-09-18 23:29:24', 320.00),
(64, 86, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-19 07:29:24', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-18 23:29:24', '2025-09-18 23:29:24', 280.00),
(65, 87, 'additional_service', NULL, NULL, 1, 0.00, '2025-09-20 17:53:20', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-09-20 09:53:20', '2025-09-20 09:53:20', 160.00),
(66, 88, 'additional_service', NULL, NULL, 1, 0.00, '2025-10-03 19:44:37', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-10-03 11:44:37', '2025-10-03 11:44:37', 320.00),
(67, 89, 'additional_service', NULL, NULL, 1, 0.00, '2025-10-03 20:03:57', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-10-03 12:03:57', '2025-10-03 12:03:57', 320.00),
(68, 90, 'additional_service', NULL, NULL, 1, 0.00, '2025-10-03 20:16:45', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-10-03 12:16:45', '2025-10-03 12:16:45', 250.00),
(69, 91, 'additional_service', NULL, NULL, 1, 0.00, '2025-10-03 20:20:42', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-10-03 12:20:42', '2025-10-03 12:20:42', 280.00),
(70, 92, 'additional_service', NULL, NULL, 1, 0.00, '2025-10-04 09:48:26', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-10-04 01:48:26', '2025-10-04 01:48:26', 320.00),
(71, 93, 'additional_service', NULL, NULL, 1, 0.00, '2025-10-14 18:35:11', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-10-14 10:35:11', '2025-10-14 10:35:11', 600.00),
(72, 94, 'additional_service', NULL, NULL, 1, 0.00, '2025-10-17 08:18:57', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-10-17 00:18:57', '2025-10-17 00:18:57', 320.00),
(73, 95, 'additional_service', NULL, NULL, 1, 0.00, '2025-10-17 09:49:50', NULL, 'check_in', NULL, NULL, 'pending', NULL, '2025-10-17 01:49:50', '2025-10-17 01:49:50', 290.00);

-- --------------------------------------------------------

--
-- Table structure for table `guest_companions`
--

CREATE TABLE `guest_companions` (
  `companion_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `relationship` varchar(50) DEFAULT 'Guest',
  `age_group` varchar(20) DEFAULT 'Adult',
  `gender` enum('Male','Female','Other','Prefer not to say') DEFAULT 'Prefer not to say',
  `date_of_birth` date DEFAULT NULL,
  `special_needs` text DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guest_companions`
--

INSERT INTO `guest_companions` (`companion_id`, `reservation_id`, `first_name`, `last_name`, `relationship`, `age_group`, `gender`, `date_of_birth`, `special_needs`, `contact_number`, `created_at`, `updated_at`) VALUES
(1, 41, 'Janice', 'Jamito', 'Spouse', 'Adult', 'Female', '2016-12-31', NULL, '89048342342', '2025-09-10 09:42:57', '2025-09-10 09:42:57'),
(2, 42, 'Apple', 'Edrolin', 'Friend', 'Adult', 'Female', '2025-09-11', NULL, '0946816534894', '2025-09-11 00:58:00', '2025-09-11 00:58:00'),
(3, 43, 'gs', 'sdfs', 'Child', 'Adult', 'Male', '2025-09-03', NULL, NULL, '2025-09-11 03:42:40', '2025-09-11 03:42:40'),
(4, 44, 'Clint', 'Plaza', 'Friend', 'Infant', 'Male', '2025-09-12', NULL, NULL, '2025-09-12 01:37:43', '2025-09-12 01:37:43'),
(5, 45, 'zaphy', 'like', 'Colleague', 'Adult', 'Prefer not to say', NULL, NULL, NULL, '2025-09-12 02:02:02', '2025-09-12 02:02:02'),
(6, 46, 'Clint', 'Plaza', 'Friend', 'Adult', 'Prefer not to say', NULL, NULL, NULL, '2025-09-12 02:33:08', '2025-09-12 02:33:08'),
(7, 47, 'gkjug', 'hgjkgk', 'Guest', 'Adult', 'Prefer not to say', NULL, NULL, NULL, '2025-09-14 02:14:42', '2025-09-14 02:14:42'),
(8, 48, 'adaaw', 'adwd', 'Guest', 'Adult', 'Prefer not to say', NULL, NULL, NULL, '2025-09-14 02:15:27', '2025-09-14 02:15:27'),
(10, 50, 'sdsa', 'dsadsa', 'Child', 'Child', 'Prefer not to say', NULL, NULL, NULL, '2025-09-16 09:39:09', '2025-09-16 09:39:09'),
(11, 51, 'sdsdgs', 'gsdgds', 'Guest', 'Adult', 'Prefer not to say', NULL, NULL, NULL, '2025-09-18 23:27:05', '2025-09-18 23:27:05'),
(12, 49, 'dad', 'dads', 'Family', 'Adult', 'Male', '2025-09-14', NULL, '54436363436', '2025-10-03 11:28:05', '2025-10-03 11:28:05'),
(13, 57, 'affaf', 'dsfdsf', 'Guest', 'Adult', 'Prefer not to say', NULL, NULL, NULL, '2025-10-17 00:52:38', '2025-10-17 00:52:38'),
(14, 58, 'fhfhfhg', 'eterttr', 'Family', 'Adult', 'Prefer not to say', NULL, NULL, '08078954587587', '2025-10-31 12:56:10', '2025-10-31 12:56:10');

--
-- Triggers `guest_companions`
--
DELIMITER $$
CREATE TRIGGER `update_companion_count_delete` AFTER DELETE ON `guest_companions` FOR EACH ROW BEGIN
    UPDATE reservations 
    SET companion_count = (
        SELECT COUNT(*) 
        FROM guest_companions 
        WHERE reservation_id = OLD.reservation_id
    ) 
    WHERE reservation_id = OLD.reservation_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_companion_count_insert` AFTER INSERT ON `guest_companions` FOR EACH ROW BEGIN
    UPDATE reservations 
    SET companion_count = (
        SELECT COUNT(*) 
        FROM guest_companions 
        WHERE reservation_id = NEW.reservation_id
    ) 
    WHERE reservation_id = NEW.reservation_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `guest_room_assignments`
--

CREATE TABLE `guest_room_assignments` (
  `guest_assignment_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `companion_id` int(11) DEFAULT NULL,
  `assigned_by_guest` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guest_room_assignments`
--

INSERT INTO `guest_room_assignments` (`guest_assignment_id`, `reservation_id`, `room_id`, `customer_id`, `companion_id`, `assigned_by_guest`, `created_at`) VALUES
(1, 47, 2, 8, NULL, 0, '2025-09-16 03:13:31'),
(2, 47, 10, NULL, 7, 0, '2025-09-16 03:13:31'),
(3, 48, 13, 8, NULL, 0, '2025-09-16 03:30:07'),
(4, 48, 21, NULL, 8, 0, '2025-09-16 03:30:07'),
(8, 50, 22, 22, NULL, 0, '2025-09-16 09:41:25'),
(9, 50, 21, NULL, 10, 0, '2025-09-16 09:41:25'),
(10, 51, 2, 18, NULL, 0, '2025-09-18 23:28:03'),
(11, 51, 37, NULL, 11, 0, '2025-09-18 23:28:03'),
(13, 49, 24, 6, NULL, 0, '2025-10-03 11:28:19'),
(14, 49, 21, NULL, 12, 0, '2025-10-03 11:28:19'),
(15, 52, 13, 23, NULL, 0, '2025-10-14 10:44:20'),
(16, 56, 1, 26, NULL, 0, '2025-10-17 00:17:49'),
(17, 58, 33, 8, NULL, 0, '2025-10-31 12:57:31'),
(18, 58, 36, NULL, 14, 0, '2025-10-31 12:57:31');

-- --------------------------------------------------------

--
-- Table structure for table `guest_tokens`
--

CREATE TABLE `guest_tokens` (
  `token_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `token_hash` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guest_tokens`
--

INSERT INTO `guest_tokens` (`token_id`, `reservation_id`, `customer_id`, `token_hash`, `expires_at`, `is_active`, `created_at`) VALUES
(1, 39, 8, '3292ed41098a22579ecf47890830a97fc35a6c6818acfe2873bc81c4d60c9f03', '2025-09-11 16:48:39', 1, '2025-09-10 22:48:39'),
(2, 28, 6, 'd77ab6fb1b980fa9b4b0a955229d9ff564e0a735c0812beed9e453fbf4af3d11', '2025-09-11 17:11:07', 1, '2025-09-10 23:11:07'),
(3, 28, 6, '1e3b9c58f9d80120afbbc0e400cf9aff01591d4e0cf419677cd7add997d4d809', '2025-09-11 17:13:09', 1, '2025-09-10 23:13:09'),
(4, 28, 6, '683e37c9a91a130ce56a4b1e30c1c6739d6ba1966e8171003108bcc8830678ee', '2025-09-11 17:22:58', 1, '2025-09-10 23:22:58'),
(5, 28, 6, '6545a2533b8b50c6f84a58717ab13741d89f56a82105cf9efceff71bfda640eb', '2025-09-11 17:30:27', 1, '2025-09-10 23:30:27'),
(6, 28, 6, 'e3734d62726f78ba837640c7ec7cf5175740407016702975d0eca8886633dae3', '2025-09-12 03:49:30', 1, '2025-09-11 09:49:30'),
(7, 41, 8, '049e831f69bd2da5621688d66ffa0a756fe0407c8b0ddb4fd6fb7f41b230e958', '2025-09-12 04:18:01', 1, '2025-09-11 10:18:01'),
(8, 43, 22, 'df3cb9515a3dba9c61fb3c0ed2fc443b090c79d8743b9d29f0e9d731075711e5', '2025-09-12 04:34:19', 1, '2025-09-11 10:34:19'),
(9, 42, 12, '60570a4373e21dc5370a1a3218ca930487409c21e43fe6c353609a783333a4d8', '2025-09-12 17:12:41', 1, '2025-09-11 23:12:41'),
(10, 28, 6, 'a255ea081603f9dcdc7dae80b83c2e393130df532a2bcd0af2a4d8aff95df2c6', '2025-09-12 19:07:20', 1, '2025-09-12 01:07:20'),
(11, 28, 6, '50dcf5a8025e5bc641c3b759c9560390b7f8205701ffdb591f26b6b344b1ba38', '2025-09-12 19:24:17', 1, '2025-09-12 01:24:17'),
(12, 28, 6, '7dfaf3037b85121895cc443d9fa53f9cc204590edff9f2a70b3e760e91e44cbe', '2025-09-12 19:27:54', 1, '2025-09-12 01:27:54'),
(13, 28, 6, '1b772c2e33465842dd5e5efbca38fc89791767788e87e804f9dbaaff15caee94', '2025-09-12 19:33:06', 1, '2025-09-12 01:33:06'),
(14, 28, 6, 'efff6986428fbef3590233d529f79548cefc1830c284830fba1e4726501ea306', '2025-09-12 19:33:22', 1, '2025-09-12 01:33:22'),
(15, 28, 6, '0a75a007e291b0aefaee0a9f48de9678dae455a3670a42dbcf338cc5b57e8c81', '2025-09-12 19:35:39', 1, '2025-09-12 01:35:39'),
(16, 28, 6, '4645f70111b1337fac9ba07b0628a0b825c045400bf3350dc5fef51c9514aa6f', '2025-09-12 19:41:34', 1, '2025-09-12 01:41:34'),
(17, 28, 6, 'c2e72765be26a26c0e03caf9d641e257d36b442b9e121c0bf692db58280e813e', '2025-09-12 19:50:58', 1, '2025-09-12 01:50:58'),
(18, 28, 6, '89bd06c4ef7bb074366bdb873cb81f3ea55cde4dc46a30a7cb59e8518d75a8cf', '2025-09-12 20:16:53', 1, '2025-09-12 02:16:53'),
(19, 28, 6, '63da83ce618dd8b0b1dd773fa00d2e913451314cafd1d5efc48f96fff68b60e1', '2025-09-12 20:17:08', 1, '2025-09-12 02:17:08'),
(20, 28, 6, '88344de3c697c3e1ccfc4aa1a607eb0b08fe07046c59733e86f9d95f937cb11f', '2025-09-12 20:19:05', 1, '2025-09-12 02:19:05'),
(21, 46, 8, '3c91258bdd68483e460f43c7076197d35eb524e5142588fef44f7a4aaa8055bf', '2025-09-12 20:39:10', 1, '2025-09-12 02:39:10'),
(22, 49, 6, '2864f711f68779658a17cf1512e5c98dcae62b434d1fe8cc1f0028f3bea1f8ed', '2025-09-21 05:14:39', 1, '2025-09-14 11:14:39'),
(23, 49, 6, '4499d80c458386669b55f64127de30d55291033085942f752452f02d49a3c547', '2025-09-16 21:52:06', 1, '2025-09-16 03:52:06'),
(24, 49, 6, '379b4a15381f9281f2265f3beb0b4e49ec3f44c739eb9908ca2e8128e1e0fce1', '2025-09-16 21:52:19', 1, '2025-09-16 03:52:19'),
(25, 49, 6, 'b94b40601ab63c51cdeadc1c02fbb1b75c5fad5ffd6b86f8474fe54b1dd95118', '2025-09-16 22:04:57', 1, '2025-09-16 04:04:57'),
(26, 49, 6, '77ac6d6518d47b5048f38997337cd61068bde4dcb0f2836fb4c117920409fb9b', '2025-09-16 22:21:47', 1, '2025-09-16 04:21:47'),
(27, 49, 6, 'c4d43de332d3afb938f3de29be1d36e1f2d41199d0d49c794ff8bed646c1c484', '2025-09-16 22:23:33', 1, '2025-09-16 04:23:33'),
(28, 48, 8, '1ab377a05e13708fdcdbe1f9221ca5935b2fc2113b1c49cbb2fbc0336ffc2ac9', '2025-09-16 22:25:54', 1, '2025-09-16 04:25:54'),
(29, 48, 8, '1454a52d06c679a9f7633eadfd393e11769111c3ce8745d5461f3ab6069a72bc', '2025-09-16 23:58:34', 1, '2025-09-16 05:58:34'),
(30, 48, 8, '09a39467183b1c37bb10f55fe3476719b3e585f9f1542bfe841e208ca8cfb597', '2025-09-17 00:03:10', 1, '2025-09-16 06:03:10'),
(31, 51, 18, '7eb3e04b86d48a01793ccea31224d29529d539078bbfd7e4e2dd43f69425ef4a', '2025-09-25 17:27:05', 1, '2025-09-18 23:27:05'),
(32, 51, 18, '2038494dee3e2af8e1d49fa5b88c3e4fe23fbeb9809c429314b2c7299dc77f13', '2025-09-19 17:29:04', 1, '2025-09-18 23:29:04'),
(33, 51, 18, '3e10b2956b7eb32557dd1fb61fcd5845452159182884c8490659ea31ba6a8161', '2025-09-19 17:31:52', 1, '2025-09-18 23:31:52'),
(34, 51, 18, '3a99078a36d8ff1b39dee6b95c19e993a16233a3d6190fbca9b2ff8c6c395a1a', '2025-09-21 03:51:43', 1, '2025-09-20 09:51:43'),
(35, 51, 18, '2fa4cc15908187c961bd3765dbd4a00e064c2d89c0ff45112e8c6c9226800164', '2025-09-21 03:52:15', 1, '2025-09-20 09:52:15'),
(36, 51, 18, '4652ead5a091a7a849d41adacef457d9e1ff213e9fac708c8f6199ffcb4a54f9', '2025-09-21 03:52:54', 1, '2025-09-20 09:52:54'),
(37, 51, 18, '2bdea3e5b9cf0f7389431ce5fec629bd122e2c51088313207a99333482718b21', '2025-09-21 03:53:06', 1, '2025-09-20 09:53:06'),
(38, 49, 6, 'ccaa53b9d727ce0c92cf5628e1a23c365b6a52db90eecb558ff31f153a8a5292', '2025-10-04 05:30:04', 1, '2025-10-03 11:30:04'),
(39, 49, 6, '870f385a3394c275f7f587c5d4f8d6fc35639029fff6bc83d4bc945e53159f99', '2025-10-04 05:33:07', 1, '2025-10-03 11:33:07'),
(40, 49, 6, '4f49534e47a3b7281ba680b82d620b8665a46353f1405088a09bcd6b899f28fa', '2025-10-04 05:33:20', 1, '2025-10-03 11:33:20'),
(41, 49, 6, '5f8160abdf05d5054a9bc1280d726c5baaf3997dce1729f3ad3c0105a63c43f3', '2025-10-04 05:44:13', 1, '2025-10-03 11:44:13'),
(42, 49, 6, '47d650f2bf6f3892970be6071e3cbba861a4984f72576c5852f5762311d4317a', '2025-10-04 05:44:30', 1, '2025-10-03 11:44:30'),
(43, 49, 6, '84998f2e04fe913afc35ef05a5139e15a67c134af285bd37df94fb2564208fb2', '2025-10-04 06:03:33', 1, '2025-10-03 12:03:33'),
(44, 49, 6, '76f613c1b6d6059a0ca039cef6eeedec55486bc98da42cb61b77a6aad71bdfe6', '2025-10-04 06:04:16', 1, '2025-10-03 12:04:16'),
(45, 49, 6, '70532fee57b1edef885ff4fbf48454ee72c55f92ec12969bcd782d3adc0c224a', '2025-10-04 06:10:22', 1, '2025-10-03 12:10:22'),
(46, 49, 6, 'b01db01ad0694411693d998138547d63e34d7b24841839ee17b7a55451a6ad18', '2025-10-04 06:10:45', 1, '2025-10-03 12:10:45'),
(47, 49, 6, '89b7e0b235b484fd0639fa8a5dd62d42ab999af2cad540445d40f4c9ace4ed23', '2025-10-04 06:16:31', 1, '2025-10-03 12:16:31'),
(48, 49, 6, '22333e65bc5d9115b019b20effc7ad52a7a11677bcb5c0461c83542948c1dcbb', '2025-10-04 06:18:05', 1, '2025-10-03 12:18:05'),
(49, 49, 6, '4be8abd9f8500956fd45cc042a72ba5cb644d3028e4abb644a6333ffd5816b6b', '2025-10-04 06:18:41', 1, '2025-10-03 12:18:41'),
(50, 49, 6, '63e4645ec08f1836a3000fa37289c1726bae1d424164438b1d621dd2584e9f5f', '2025-10-04 06:20:19', 1, '2025-10-03 12:20:19'),
(51, 49, 6, '4d24a88a389083b1b594cb42fa02ac95f14e2c8cf23bbcde04a790a256d27a86', '2025-10-04 19:48:14', 1, '2025-10-04 01:48:14'),
(52, 49, 6, '5b5b8060b0496abcb5b0302ea7488ec973b7113e1e8012cd55b0b0fd02542378', '2025-10-15 04:34:30', 1, '2025-10-14 10:34:30'),
(53, 53, 24, 'b65b1df28447fe48c45664920e88281db519368254eed406e68e8ecd011685c6', '2025-10-21 07:16:48', 1, '2025-10-14 13:16:48'),
(54, 55, 25, 'fbf4159a3ef293d2c86cf85969ac3b7d9454fdeb5735779a69d8caad085bc9c7', '2025-10-21 07:25:27', 1, '2025-10-14 13:25:27'),
(55, 56, 26, '76301c384ceecb73d97e4f394c09233822befc0f3e6a889c41872537fdfae691', '2025-10-23 18:17:22', 1, '2025-10-17 00:17:22'),
(56, 56, 26, '9253f0c1815d3237b279ac8deb73506dd8d68496a1edf58301cac7aa0d05f7f3', '2025-10-17 18:18:41', 1, '2025-10-17 00:18:41'),
(57, 57, 8, '7479ec865c10e945de75390fb946f8ed6d79e32ee49cb7344cdb333ca223b0c4', '2025-10-23 18:52:38', 1, '2025-10-17 00:52:38'),
(58, 56, 26, 'e6f100f399578f62ff9ac2ef1353c64a91fe150455fbdb8d267b8c3e743daad8', '2025-10-17 19:47:59', 1, '2025-10-17 01:47:59'),
(59, 56, 26, '977abdce2e34995e2108ba5f1e45f8f444ca6cb0f9e49dd72566a402d5406bca', '2025-10-17 19:49:17', 1, '2025-10-17 01:49:17'),
(60, 58, 8, '130c62b1409d375d7992bddce326b618f2a2435d0dabf0e77ef141ac204967af', '2025-11-07 05:56:10', 1, '2025-10-31 12:56:10');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_services`
--

CREATE TABLE `hotel_services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_complimentary` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel_services`
--

INSERT INTO `hotel_services` (`service_id`, `service_name`, `description`, `price`, `is_complimentary`) VALUES
(2, 'Wake-Up Call', 'Phone call to wake guest at requested time', 20.00, 0),
(3, 'Extra Pillow', 'Request for additional pillow', 20.00, 0),
(4, 'Extra Blanket', 'Request for extra blanket', 10.00, 0),
(5, 'Room Cleaning', 'Cleaning outside housekeeping schedule', 200.00, 0),
(6, 'Towel Replacement', 'Fresh towel delivered to room', 10.00, 0),
(7, 'Ironing Service', 'Clothes ironed upon request', 100.00, 0),
(8, 'Shoe Cleaning', 'Complimentary shoe shine service', 100.00, 0),
(10, 'Late Checkout', 'Extend checkout by 2 hours', 500.00, 0),
(11, 'Airport Shuttle', 'Ride to/from the airport', 800.00, 0),
(12, 'Extra Service', 'Different services', 100.00, 0),
(18, 'Pet Cleaning', 'We wash and clean you pets', 600.00, 0),
(21, 'Premium Massage', 'VIP treatment', 500.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_status` enum('Paid','Unpaid','Partial','Pending') DEFAULT 'Unpaid',
  `due_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `invoice_number`, `reservation_id`, `total_amount`, `paid_amount`, `payment_status`, `due_date`, `notes`, `created_at`, `updated_at`, `employee_id`) VALUES
(8, 'INV-2025080001', 28, 13220.00, 13220.00, 'Paid', '2025-08-31', 'Advance Payment', '2025-08-24 12:34:51', '2025-08-24 12:47:48', 2),
(9, 'INV-2025080002', 25, 4600.00, 4600.00, 'Paid', '2025-08-31', '', '2025-08-24 12:50:09', '2025-08-24 12:51:07', 2),
(10, 'INV-2025080003', 24, 4100.00, 4100.00, 'Paid', '2025-08-31', 'Advance Payment', '2025-08-24 13:59:24', '2025-08-24 14:56:40', NULL),
(11, 'INV-2025080004', 30, 6060.00, 5030.00, 'Partial', '2025-08-31', '', '2025-08-24 21:27:34', '2025-08-25 14:56:23', NULL),
(12, 'INV-2025080005', 32, 4620.00, 2310.00, 'Partial', '2025-09-02', 'Advance Payment', '2025-08-26 10:28:13', '2025-08-26 10:28:13', NULL),
(13, 'INV-2025080006', 33, 7800.00, 3350.00, 'Partial', '2025-09-07', '', '2025-08-31 01:46:36', '2025-08-31 01:47:40', NULL),
(14, 'INV-2025090001', 41, 4000.00, 2000.00, 'Partial', '2025-09-18', '', '2025-09-10 22:45:28', '2025-09-10 22:45:47', NULL),
(15, 'INV-2025090002', 43, 1850.00, 1850.00, 'Paid', '2025-09-19', '', '2025-09-12 01:43:29', '2025-09-12 01:45:03', NULL),
(16, 'INV-2025090003', 42, 6020.00, 6020.00, 'Paid', '2025-09-19', '', '2025-09-12 01:45:53', '2025-09-12 01:46:37', NULL),
(17, 'INV-2025090004', 46, 2500.00, 0.00, 'Unpaid', '2025-09-19', '', '2025-09-12 02:41:58', '2025-09-12 02:41:58', NULL),
(18, 'INV-2025090005', 48, 7000.00, 1400.00, 'Partial', '2025-09-23', '', '2025-09-16 04:38:31', '2025-09-16 04:38:31', NULL),
(19, 'INV-2025090006', 44, 10000.00, 5000.00, 'Partial', '2025-09-23', '', '2025-09-16 05:54:19', '2025-09-16 05:54:19', NULL),
(20, 'INV-2025090007', 29, 14380.00, 7040.00, 'Partial', '2025-09-23', '', '2025-09-16 05:57:33', '2025-09-16 05:57:33', NULL),
(21, 'INV-2025090008', 47, 7000.00, 1400.00, 'Partial', '2025-09-23', '', '2025-09-16 05:57:48', '2025-09-16 05:57:48', NULL),
(22, 'INV-2025090009', 51, 12500.00, 12500.00, 'Paid', '2025-09-26', '', '2025-09-18 23:31:04', '2025-10-14 13:27:16', NULL),
(23, 'INV-2025100001', 50, 14500.00, 14500.00, 'Paid', '2025-10-11', '', '2025-10-04 01:49:16', '2025-10-04 01:49:25', NULL),
(24, 'INV-2025100002', 49, 4000.00, 4000.00, 'Paid', '2025-10-21', '', '2025-10-14 10:36:59', '2025-10-14 10:37:46', NULL),
(25, 'INV-2025100003', 35, 6150.00, 6150.00, 'Paid', '2025-10-24', '', '2025-10-17 00:39:21', '2025-10-17 01:45:17', NULL),
(26, 'INV-2025100004', 58, 11200.00, 11200.00, 'Paid', '2025-11-07', '', '2025-10-31 12:58:51', '2025-10-31 12:59:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `invoice_item_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `item_type` enum('room','service','food','other') DEFAULT 'other',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`invoice_item_id`, `invoice_id`, `description`, `quantity`, `unit_price`, `total_price`, `item_type`, `created_at`) VALUES
(6, 8, 'Room charges and services', 1, 13220.00, 13220.00, 'room', '2025-08-24 12:34:51'),
(7, 9, 'Room charges and services', 1, 4600.00, 4600.00, 'room', '2025-08-24 12:50:09'),
(8, 10, 'Room charges and services', 1, 4100.00, 4100.00, 'room', '2025-08-24 13:59:24'),
(9, 11, 'Room charges and services', 1, 6060.00, 6060.00, 'room', '2025-08-24 21:27:34'),
(10, 12, 'Room charges and services', 1, 4620.00, 4620.00, 'room', '2025-08-26 10:28:13'),
(11, 13, 'Room charges and services', 1, 7800.00, 7800.00, 'room', '2025-08-31 01:46:36'),
(12, 14, 'Room charges and services', 1, 4000.00, 4000.00, 'room', '2025-09-10 22:45:28'),
(13, 15, 'Room charges and services', 1, 1850.00, 1850.00, 'room', '2025-09-12 01:43:29'),
(14, 16, 'Room charges and services', 1, 6020.00, 6020.00, 'room', '2025-09-12 01:45:53'),
(15, 17, 'Room charges and services', 1, 2500.00, 2500.00, 'room', '2025-09-12 02:41:58'),
(16, 18, 'Room charges and services', 1, 7000.00, 7000.00, 'room', '2025-09-16 04:38:31'),
(17, 19, 'Room charges and services', 1, 10000.00, 10000.00, 'room', '2025-09-16 05:54:19'),
(18, 20, 'Room charges and services', 1, 14380.00, 14380.00, 'room', '2025-09-16 05:57:33'),
(19, 21, 'Room charges and services', 1, 7000.00, 7000.00, 'room', '2025-09-16 05:57:48'),
(20, 22, 'Room charges and services', 1, 12500.00, 12500.00, 'room', '2025-09-18 23:31:04'),
(21, 23, 'Room charges and services', 1, 14500.00, 14500.00, 'room', '2025-10-04 01:49:16'),
(22, 24, 'Room charges and services', 1, 4000.00, 4000.00, 'room', '2025-10-14 10:36:59'),
(23, 25, 'Room charges and services', 1, 6150.00, 6150.00, 'room', '2025-10-17 00:39:21'),
(24, 26, 'Room charges and services', 1, 11200.00, 11200.00, 'room', '2025-10-31 12:58:51');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_status`
--

CREATE TABLE `maintenance_status` (
  `maintenance_status_id` int(11) NOT NULL,
  `status_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintenance_status`
--

INSERT INTO `maintenance_status` (`maintenance_status_id`, `status_name`) VALUES
(1, 'Scheduled'),
(2, 'In Progress'),
(3, 'Completed'),
(4, 'Delayed'),
(5, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `menu_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`menu_id`, `item_name`, `description`, `price`, `category`, `is_available`, `created_at`, `updated_at`) VALUES
(1, 'American Breakfast', 'Includes eggs, bacon, toast, and coffee', 320.00, 'Breakfast', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(2, 'Continental Breakfast', 'Bread, butter, jam, juice, and tea', 280.00, 'Breakfast', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(3, 'Pancakes with Syrup', 'Fluffy pancakes with maple syrup', 250.00, 'Breakfast', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(4, 'Omelette Special', 'Cheese and ham omelette with toast', 270.00, 'Breakfast', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(5, 'Grilled Chicken', 'Served with mashed potatoes and veggies', 450.00, 'Main Course', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(6, 'Beef Steak', 'Tenderloin steak with gravy and fries', 690.00, 'Main Course', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(7, 'Seafood Platter', 'Assorted grilled seafood with lemon butter', 780.00, 'Main Course', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(8, 'Spaghetti Bolognese', 'Pasta with ground beef tomato sauce', 320.00, 'Main Course', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(9, 'Vegetarian Stir Fry', 'Assorted veggies stir-fried in soy-garlic sauce', 300.00, 'Main Course', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(10, 'Bottled Water', '500ml purified bottled water', 30.00, 'Drinks', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(12, 'Fresh Mango Juice', 'Freshly blended mangoes with ice', 120.00, 'Drinks', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(14, 'Iced Tea', 'Sweet lemon iced tea', 80.00, 'Drinks', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(15, 'Chocolate Cake Slice', 'Moist chocolate cake with ganache', 160.00, 'Desserts', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(17, 'Fruit Salad', 'Chilled mix of tropical fruits and cream', 130.00, 'Desserts', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(18, 'Ice Cream Sundae', 'Vanilla ice cream with chocolate syrup', 150.00, 'Desserts', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(19, 'Club Sandwich', 'Triple-decker sandwich with chips', 220.00, 'Snacks', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(20, 'French Fries', 'Crispy golden fries with ketchup', 90.00, 'Snacks', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(21, 'Nachos', 'Cheesy nachos with salsa dip', 180.00, 'Snacks', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(22, 'Chicken Wings', '6-piece spicy buffalo wings', 260.00, 'Snacks', 1, '2025-08-03 11:45:30', '2025-08-03 11:45:30'),
(23, 'American Cream', 'Include cream pies', 100.00, 'Desserts', 1, '2025-08-16 08:21:53', '2025-08-16 08:21:53'),
(24, 'Wagyu Beef Steak', 'Best Beef Quality', 1000.00, 'Main Course', 1, '2025-08-23 00:32:43', '2025-08-23 00:32:43'),
(26, 'Fries and Burger', 'Mix and Match Promo', 75.00, 'Mix and Match', 1, '2025-10-09 03:04:30', '2025-10-09 03:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'The user who receives the notification',
  `type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `related_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `type`, `message`, `related_id`, `is_read`, `created_at`) VALUES
(319, 1, 'room_assigned', 'Room 38 has been assigned to reservation #44.', 44, 0, '2025-09-12 01:48:56'),
(320, 2, 'room_assigned', 'Room 38 has been assigned to reservation #44.', 44, 1, '2025-09-12 01:48:56'),
(321, 1, 'room_assigned', 'Room 41 has been assigned to reservation #45.', 45, 0, '2025-09-12 02:03:30'),
(322, 2, 'room_assigned', 'Room 41 has been assigned to reservation #45.', 45, 1, '2025-09-12 02:03:30'),
(323, 1, 'service_request', 'New service request (#77) from reservation #28.', 77, 0, '2025-09-12 02:19:11'),
(324, 2, 'service_request', 'New service request (#77) from reservation #28.', 77, 1, '2025-09-12 02:19:11'),
(325, 1, 'room_assigned', 'Room 2 has been assigned to reservation #46.', 46, 0, '2025-09-12 02:37:24'),
(326, 2, 'room_assigned', 'Room 2 has been assigned to reservation #46.', 46, 1, '2025-09-12 02:37:24'),
(327, 1, 'service_request', 'New service request (#78) from reservation #46.', 78, 0, '2025-09-12 02:41:37'),
(328, 2, 'service_request', 'New service request (#78) from reservation #46.', 78, 1, '2025-09-12 02:41:37'),
(329, 1, 'service_request', 'New service request (#79) from reservation #49 scheduled for breakfast.', 79, 0, '2025-09-16 04:24:03'),
(330, 2, 'service_request', 'New service request (#79) from reservation #49 scheduled for breakfast.', 79, 1, '2025-09-16 04:24:03'),
(331, 1, 'service_request', 'New service request (#80) from reservation #49 scheduled for lunch.', 80, 0, '2025-09-16 04:24:03'),
(332, 2, 'service_request', 'New service request (#80) from reservation #49 scheduled for lunch.', 80, 1, '2025-09-16 04:24:03'),
(333, 1, 'service_request', 'New service request (#81) from reservation #49 scheduled for dinner.', 81, 0, '2025-09-16 04:24:03'),
(334, 2, 'service_request', 'New service request (#81) from reservation #49 scheduled for dinner.', 81, 1, '2025-09-16 04:24:03'),
(335, 1, 'service_request', 'New service request (#82) from reservation #48 scheduled for breakfast.', 82, 0, '2025-09-16 04:25:59'),
(336, 2, 'service_request', 'New service request (#82) from reservation #48 scheduled for breakfast.', 82, 1, '2025-09-16 04:25:59'),
(337, 1, 'service_request', 'New service request (#83) from reservation #48 (Room 303, 501) scheduled for lunch.', 83, 0, '2025-09-16 06:04:27'),
(338, 2, 'service_request', 'New service request (#83) from reservation #48 (Room 303, 501) scheduled for lunch.', 83, 1, '2025-09-16 06:04:27'),
(339, 1, 'service_request', 'New service request (#84) from reservation #48 (Room 303, 501) scheduled for dinner.', 84, 0, '2025-09-16 06:10:43'),
(340, 2, 'service_request', 'New service request (#84) from reservation #48 (Room 303, 501) scheduled for dinner.', 84, 1, '2025-09-16 06:10:43'),
(341, 1, 'service_request', 'New service request (#85) from reservation #51 (Room 102, 1004) scheduled for breakfast.', 85, 0, '2025-09-18 23:29:24'),
(342, 2, 'service_request', 'New service request (#85) from reservation #51 (Room 102, 1004) scheduled for breakfast.', 85, 1, '2025-09-18 23:29:24'),
(343, 1, 'service_request', 'New service request (#86) from reservation #51 (Room 102, 1004) scheduled for lunch.', 86, 0, '2025-09-18 23:29:24'),
(344, 2, 'service_request', 'New service request (#86) from reservation #51 (Room 102, 1004) scheduled for lunch.', 86, 1, '2025-09-18 23:29:24'),
(345, 1, 'service_request', 'New service request (#87) from reservation #51 (Room 102, 1004) scheduled for breakfast.', 87, 0, '2025-09-20 09:53:21'),
(346, 2, 'service_request', 'New service request (#87) from reservation #51 (Room 102, 1004) scheduled for breakfast.', 87, 1, '2025-09-20 09:53:21'),
(347, 1, 'service_request', 'New service request (#88) from reservation #49 (Room 501, 504) scheduled for breakfast.', 88, 0, '2025-10-03 11:44:37'),
(348, 2, 'service_request', 'New service request (#88) from reservation #49 (Room 501, 504) scheduled for breakfast.', 88, 1, '2025-10-03 11:44:37'),
(349, 1, 'service_request', 'New service request (#89) from reservation #49 (Room 501, 504) scheduled for breakfast.', 89, 0, '2025-10-03 12:03:57'),
(350, 2, 'service_request', 'New service request (#89) from reservation #49 (Room 501, 504) scheduled for breakfast.', 89, 1, '2025-10-03 12:03:57'),
(351, 1, 'service_request', 'New service request (#90) from reservation #49 (Room 501, 504) scheduled for breakfast.', 90, 0, '2025-10-03 12:16:45'),
(352, 2, 'service_request', 'New service request (#90) from reservation #49 (Room 501, 504) scheduled for breakfast.', 90, 1, '2025-10-03 12:16:45'),
(353, 1, 'service_request', 'New service request (#91) from reservation #49 (Room 501, 504) scheduled for lunch.', 91, 0, '2025-10-03 12:20:42'),
(354, 2, 'service_request', 'New service request (#91) from reservation #49 (Room 501, 504) scheduled for lunch.', 91, 1, '2025-10-03 12:20:42'),
(355, 1, 'service_request', 'New service request (#92) from reservation #49 (Room 501, 504) scheduled for breakfast.', 92, 0, '2025-10-04 01:48:26'),
(356, 2, 'service_request', 'New service request (#92) from reservation #49 (Room 501, 504) scheduled for breakfast.', 92, 1, '2025-10-04 01:48:26'),
(357, 1, 'service_request', 'New service request (#93) from reservation #49 (Room 501, 504) scheduled for breakfast.', 93, 0, '2025-10-14 10:35:11'),
(358, 2, 'service_request', 'New service request (#93) from reservation #49 (Room 501, 504) scheduled for breakfast.', 93, 1, '2025-10-14 10:35:11'),
(359, 13, 'service_request', 'New service request (#93) from reservation #49 (Room 501, 504) scheduled for breakfast.', 93, 0, '2025-10-14 10:35:11'),
(360, 1, 'service_request', 'New service request (#94) from reservation #56 (Room 101) scheduled for breakfast.', 94, 0, '2025-10-17 00:18:57'),
(361, 2, 'service_request', 'New service request (#94) from reservation #56 (Room 101) scheduled for breakfast.', 94, 1, '2025-10-17 00:18:57'),
(362, 13, 'service_request', 'New service request (#94) from reservation #56 (Room 101) scheduled for breakfast.', 94, 0, '2025-10-17 00:18:57'),
(363, 1, 'service_request', 'New service request (#95) from reservation #56 (Room 101) for immediate delivery.', 95, 0, '2025-10-17 01:49:50'),
(364, 2, 'service_request', 'New service request (#95) from reservation #56 (Room 101) for immediate delivery.', 95, 1, '2025-10-17 01:49:50'),
(365, 13, 'service_request', 'New service request (#95) from reservation #56 (Room 101) for immediate delivery.', 95, 0, '2025-10-17 01:49:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `reset_token` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `used_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `employee_id`, `reset_token`, `expires_at`, `created_at`, `used_at`) VALUES
(1, 2, '9733fd0617aafba5b0d190bcb6e1d2566dcfc55486329a5d92c73356a52ba946', '2025-09-02 06:48:40', '2025-09-02 11:48:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_number` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `invoice_id`, `amount`, `payment_method`, `payment_date`, `reference_number`, `notes`, `created_at`) VALUES
(9, 8, 5000.00, 'cash', '2025-08-24 06:34:51', 'INV-INV-2025080001', 'Initial payment recorded with invoice', '2025-08-24 12:34:51'),
(10, 8, 8220.00, '1', '2025-08-24 06:42:20', 'PAY-1756039340024', 'Payment recorded via front desk', '2025-08-24 12:42:20'),
(11, 9, 2300.00, '1', '2025-08-24 06:50:26', 'PAY-1756039826199', 'Payment recorded via front desk', '2025-08-24 12:50:26'),
(12, 10, 1650.00, 'cash', '2025-08-24 07:59:24', 'INV-INV-2025080003', 'Initial payment recorded with invoice', '2025-08-24 13:59:24'),
(13, 10, 1200.00, '1', '2025-08-24 08:00:17', 'PAY-1756044017117', 'Payment recorded via front desk', '2025-08-24 14:00:17'),
(14, 10, 625.00, '1', '2025-08-24 08:34:02', 'PAY-1756046042880', 'Payment recorded via front desk', '2025-08-24 14:34:02'),
(15, 10, 625.00, '1', '2025-08-24 08:56:40', 'PAY-1756047400122', 'Payment recorded via front desk', '2025-08-24 14:56:40'),
(16, 11, 3030.00, '1', '2025-08-24 15:28:12', 'PAY-1756070892127', 'Payment recorded via front desk', '2025-08-24 21:28:12'),
(17, 11, 2000.00, '1', '2025-08-25 08:56:23', 'PAY-1756133783672', 'Payment recorded via front desk', '2025-08-25 14:56:23'),
(18, 12, 2310.00, 'cash', '2025-08-26 04:28:13', 'INV-INV-2025080005', 'Initial payment recorded with invoice', '2025-08-26 10:28:13'),
(19, 13, 3350.00, '2', '2025-08-30 19:47:40', 'PAY-1756604860384', 'Payment recorded via front desk', '2025-08-31 01:47:40'),
(20, 14, 2000.00, '2', '2025-09-10 16:45:47', '543463545345345', 'Advance Payment', '2025-09-10 22:45:47'),
(21, 15, 500.00, '2', '2025-09-11 19:44:18', 'PAY-1757641458646', 'Advance Payment', '2025-09-12 01:44:18'),
(22, 15, 1350.00, '1', '2025-09-11 19:45:03', 'PAY-1757641503221', 'Payment recorded via front desk', '2025-09-12 01:45:03'),
(23, 16, 3010.00, '1', '2025-09-11 19:46:37', 'PAY-1757641597475', 'ferg', '2025-09-12 01:46:37'),
(24, 18, 1400.00, 'gcash', '2025-09-15 22:38:31', 'INV-INV-2025090005', 'Initial payment recorded with invoice', '2025-09-16 04:38:31'),
(25, 19, 5000.00, 'gcash', '2025-09-15 23:54:19', 'INV-INV-2025090006', 'Initial payment recorded with invoice', '2025-09-16 05:54:19'),
(26, 20, 7040.00, 'gcash', '2025-09-15 23:57:33', 'INV-INV-2025090007', 'Initial payment recorded with invoice', '2025-09-16 05:57:33'),
(27, 21, 1400.00, 'cash', '2025-09-15 23:57:48', 'INV-INV-2025090008', 'Initial payment recorded with invoice', '2025-09-16 05:57:48'),
(28, 23, 7000.00, 'cash', '2025-10-03 19:49:16', 'INV-INV-2025100001', 'Initial payment recorded with invoice', '2025-10-04 01:49:16'),
(29, 23, 7500.00, '1', '2025-10-03 19:49:25', 'PAY-1759542565040', 'Payment recorded via front desk', '2025-10-04 01:49:25'),
(30, 24, 2029.99, 'gcash', '2025-10-14 04:36:59', 'INV-INV-2025100002', 'Initial payment recorded with invoice', '2025-10-14 10:36:59'),
(31, 24, 1970.01, '1', '2025-10-14 04:37:46', 'PAY-1760438266317', 'Payment recorded via front desk', '2025-10-14 10:37:46'),
(32, 22, 10000.00, '1', '2025-10-14 07:27:16', 'PAY-1760448436363', 'Payment recorded via front desk', '2025-10-14 13:27:16'),
(33, 25, 2640.00, 'cash', '2025-10-16 18:39:21', 'INV-INV-2025100003', 'Initial payment recorded with invoice', '2025-10-17 00:39:21'),
(34, 25, 3510.00, '1', '2025-10-16 19:45:17', 'PAY-1760665517458', 'Payment recorded via front desk', '2025-10-17 01:45:17'),
(35, 26, 2240.00, 'gcash', '2025-10-31 05:58:51', 'INV-INV-2025100004', 'Initial payment recorded with invoice', '2025-10-31 12:58:51'),
(36, 26, 8960.00, '1', '2025-10-31 05:59:50', 'PAY-1761915590768', 'Payment recorded via front desk', '2025-10-31 12:59:50');

-- --------------------------------------------------------

--
-- Table structure for table `payment_logs`
--

CREATE TABLE `payment_logs` (
  `log_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `reference_number` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `recorded_by` varchar(100) NOT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `action_type` enum('create_invoice','record_payment','update_invoice','delete_invoice') NOT NULL,
  `previous_status` varchar(20) DEFAULT NULL,
  `new_status` varchar(20) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_logs`
--

INSERT INTO `payment_logs` (`log_id`, `invoice_id`, `reservation_id`, `amount`, `payment_method`, `reference_number`, `notes`, `recorded_by`, `recorded_at`, `action_type`, `previous_status`, `new_status`, `ip_address`, `user_agent`) VALUES
(1, 10, 24, 625.00, '1', 'PAY-1756046042880', 'Payment recorded via front desk', 'Unknown User', '2025-08-24 14:34:02', 'record_payment', 'Partial', 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(2, 10, 24, 625.00, '1', 'PAY-1756047400122', 'Payment recorded via front desk', 'Unknown User', '2025-08-24 14:56:40', 'record_payment', 'Partial', 'Paid', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(3, 11, 30, 6060.00, 'cash', 'INV-INV-2025080004', '', 'Unknown User', '2025-08-24 21:27:34', 'create_invoice', NULL, 'Unpaid', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(4, 11, 30, 3030.00, '1', 'PAY-1756070892127', 'Payment recorded via front desk', 'Unknown User', '2025-08-24 21:28:12', 'record_payment', 'Unpaid', 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(5, 11, 30, 2000.00, '1', 'PAY-1756133783672', 'Payment recorded via front desk', 'Unknown User', '2025-08-25 14:56:23', 'record_payment', 'Partial', 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(6, 12, 32, 4620.00, 'cash', 'INV-INV-2025080005', 'Advance Payment', 'Unknown User', '2025-08-26 10:28:13', 'create_invoice', NULL, 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(7, 13, 33, 7800.00, 'N/A', 'INV-INV-2025080006', '', 'Unknown User', '2025-08-31 01:46:36', 'create_invoice', NULL, 'Unpaid', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(8, 13, 33, 3350.00, '2', 'PAY-1756604860384', 'Payment recorded via front desk', 'Unknown User', '2025-08-31 01:47:40', 'record_payment', 'Unpaid', 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36'),
(9, 14, 41, 4000.00, 'gcash', 'INV-INV-2025090001', '', 'Unknown User', '2025-09-10 22:45:28', 'create_invoice', NULL, 'Unpaid', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(10, 14, 41, 2000.00, '2', '543463545345345', 'Advance Payment', 'Unknown User', '2025-09-10 22:45:47', 'record_payment', 'Unpaid', 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(11, 15, 43, 1850.00, 'gcash', 'INV-INV-2025090002', '', 'Unknown User', '2025-09-12 01:43:29', 'create_invoice', NULL, 'Unpaid', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(12, 15, 43, 500.00, '2', 'PAY-1757641458646', 'Advance Payment', 'Unknown User', '2025-09-12 01:44:18', 'record_payment', 'Unpaid', 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(13, 15, 43, 1350.00, '1', 'PAY-1757641503221', 'Payment recorded via front desk', 'Unknown User', '2025-09-12 01:45:03', 'record_payment', 'Partial', 'Paid', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(14, 16, 42, 6020.00, 'N/A', 'INV-INV-2025090003', '', 'Unknown User', '2025-09-12 01:45:53', 'create_invoice', NULL, 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(15, 16, 42, 3010.00, '1', 'PAY-1757641597475', 'ferg', 'Unknown User', '2025-09-12 01:46:37', 'record_payment', 'Partial', 'Paid', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(16, 17, 46, 2500.00, 'N/A', 'INV-INV-2025090004', '', 'Unknown User', '2025-09-12 02:41:58', 'create_invoice', NULL, 'Unpaid', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(17, 18, 48, 7000.00, 'gcash', 'INV-INV-2025090005', '', 'Unknown User', '2025-09-16 04:38:31', 'create_invoice', NULL, 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(18, 19, 44, 10000.00, 'gcash', 'INV-INV-2025090006', '', 'Unknown User', '2025-09-16 05:54:19', 'create_invoice', NULL, 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(19, 20, 29, 14380.00, 'gcash', 'INV-INV-2025090007', '', 'Unknown User', '2025-09-16 05:57:33', 'create_invoice', NULL, 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(20, 21, 47, 7000.00, 'cash', 'INV-INV-2025090008', '', 'Unknown User', '2025-09-16 05:57:48', 'create_invoice', NULL, 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(21, 22, 51, 12500.00, 'N/A', 'INV-INV-2025090009', '', 'Unknown User', '2025-09-18 23:31:04', 'create_invoice', NULL, 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(22, 23, 50, 14500.00, 'cash', 'INV-INV-2025100001', '', 'Unknown User', '2025-10-04 01:49:16', 'create_invoice', NULL, 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(23, 23, 50, 7500.00, '1', 'PAY-1759542565040', 'Payment recorded via front desk', 'Unknown User', '2025-10-04 01:49:25', 'record_payment', 'Partial', 'Paid', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36'),
(24, 24, 49, 4000.00, 'gcash', 'INV-INV-2025100002', '', 'Unknown User', '2025-10-14 10:36:59', 'create_invoice', NULL, 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(25, 24, 49, 1970.01, '1', 'PAY-1760438266317', 'Payment recorded via front desk', 'Unknown User', '2025-10-14 10:37:46', 'record_payment', 'Partial', 'Paid', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(26, 22, 51, 10000.00, '1', 'PAY-1760448436363', 'Payment recorded via front desk', 'Unknown User', '2025-10-14 13:27:16', 'record_payment', 'Partial', 'Paid', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(27, 25, 35, 6150.00, 'cash', 'INV-INV-2025100003', '', 'Unknown User', '2025-10-17 00:39:21', 'create_invoice', NULL, 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(28, 25, 35, 3510.00, '1', 'PAY-1760665517458', 'Payment recorded via front desk', 'Unknown User', '2025-10-17 01:45:17', 'record_payment', 'Partial', 'Paid', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(29, 26, 58, 11200.00, 'gcash', 'INV-INV-2025100004', '', 'Unknown User', '2025-10-31 12:58:51', 'create_invoice', NULL, 'Partial', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'),
(30, 26, 58, 8960.00, '1', 'PAY-1761915590768', 'Payment recorded via front desk', 'Unknown User', '2025-10-31 12:59:50', 'record_payment', 'Partial', 'Paid', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `payment_method_id` int(11) NOT NULL,
  `method_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`payment_method_id`, `method_name`) VALUES
(1, 'Cash'),
(2, 'GCash'),
(3, 'Bank Transfer'),
(4, 'Credit Card'),
(5, 'Debit Card');

-- --------------------------------------------------------

--
-- Table structure for table `payment_status`
--

CREATE TABLE `payment_status` (
  `payment_status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_status`
--

INSERT INTO `payment_status` (`payment_status_id`, `status_name`) VALUES
(1, 'Paid'),
(2, 'Unpaid'),
(3, 'Pending'),
(4, 'Partial');

-- --------------------------------------------------------

--
-- Table structure for table `request_items`
--

CREATE TABLE `request_items` (
  `request_items_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_items`
--

INSERT INTO `request_items` (`request_items_id`, `request_id`, `menu_id`, `service_id`, `quantity`) VALUES
(23, 23, NULL, 11, 1),
(24, 24, NULL, 4, 1),
(25, 25, NULL, 3, 1),
(26, 26, NULL, 5, 1),
(27, 27, 1, NULL, 1),
(28, 28, 1, NULL, 1),
(29, 29, 4, NULL, 1),
(30, 30, 23, NULL, 1),
(31, 31, 10, NULL, 1),
(32, 32, 6, NULL, 1),
(33, 33, NULL, 3, 1),
(34, 34, NULL, 8, 1),
(35, 35, NULL, 4, 1),
(36, 36, NULL, 3, 1),
(37, 37, NULL, 5, 1),
(38, 38, NULL, 6, 1),
(39, 39, NULL, 7, 1),
(40, 40, NULL, 4, 1),
(41, 41, NULL, 3, 1),
(42, 42, NULL, 4, 1),
(43, 43, NULL, 6, 1),
(44, 44, NULL, 11, 1),
(45, 45, NULL, 5, 1),
(46, 46, NULL, 6, 1),
(47, 47, 1, NULL, 1),
(48, 48, 2, NULL, 1),
(49, 49, 4, NULL, 1),
(50, 50, NULL, 11, 1),
(51, 51, NULL, 4, 1),
(52, 52, NULL, 3, 1),
(53, 53, NULL, 11, 1),
(54, 54, NULL, 3, 1),
(55, 55, NULL, 12, 1),
(56, 56, NULL, 4, 1),
(57, 57, NULL, 11, 1),
(58, 58, NULL, 4, 1),
(59, 59, 1, NULL, 1),
(60, 59, 2, NULL, 1),
(61, 59, 17, NULL, 1),
(62, 59, 18, NULL, 1),
(63, 60, NULL, 11, 1),
(64, 61, 1, NULL, 1),
(65, 62, 1, NULL, 1),
(66, 62, 4, NULL, 1),
(67, 62, 23, NULL, 1),
(68, 63, NULL, 12, 1),
(69, 63, NULL, 10, 1),
(70, 63, 2, NULL, 1),
(71, 63, 1, NULL, 1),
(72, 64, NULL, 2, 1),
(73, 65, 23, NULL, 1),
(74, 65, 15, NULL, 1),
(75, 66, 1, NULL, 1),
(76, 66, 2, NULL, 1),
(77, 66, 4, NULL, 1),
(78, 67, NULL, 4, 1),
(79, 68, 1, NULL, 1),
(80, 68, 2, NULL, 1),
(81, 68, 10, NULL, 2),
(82, 68, 12, NULL, 1),
(83, 68, 6, NULL, 1),
(84, 69, 18, NULL, 1),
(85, 70, NULL, 11, 1),
(86, 71, 2, NULL, 1),
(87, 72, 1, NULL, 1),
(88, 73, 1, NULL, 2),
(89, 73, 2, NULL, 1),
(90, 74, 17, NULL, 1),
(91, 75, NULL, 3, 1),
(92, 76, NULL, 12, 1),
(93, 77, 1, NULL, 1),
(94, 78, 20, NULL, 2),
(95, 78, 21, NULL, 1),
(96, 79, 1, NULL, 1),
(97, 80, 2, NULL, 1),
(98, 81, 3, NULL, 1),
(99, 82, 1, NULL, 1),
(100, 83, 23, NULL, 1),
(101, 84, 23, NULL, 1),
(102, 85, 1, NULL, 1),
(103, 86, 2, NULL, 1),
(104, 87, 15, NULL, 1),
(105, 88, 1, NULL, 1),
(106, 89, 1, NULL, 1),
(107, 90, 3, NULL, 1),
(108, 91, 2, NULL, 1),
(109, 92, 1, NULL, 1),
(110, 93, 1, NULL, 1),
(111, 93, 2, NULL, 1),
(112, 94, 1, NULL, 1),
(113, 95, NULL, 4, 1),
(114, 95, 2, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `request_status`
--

CREATE TABLE `request_status` (
  `request_status_id` int(11) NOT NULL,
  `status_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_status`
--

INSERT INTO `request_status` (`request_status_id`, `status_name`) VALUES
(1, 'Pending'),
(2, 'Approved'),
(3, 'In Progress'),
(4, 'Completed'),
(5, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `request_types`
--

CREATE TABLE `request_types` (
  `request_type_id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_types`
--

INSERT INTO `request_types` (`request_type_id`, `type_name`) VALUES
(1, 'Room Service'),
(2, 'Food Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `reservation_type_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `booking_type` enum('specific_room','room_type') DEFAULT 'specific_room',
  `room_assignment_pending` tinyint(1) DEFAULT 0,
  `customer_id` int(11) DEFAULT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `checkout_datetime` datetime DEFAULT NULL,
  `reservation_status_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `advance_payment` decimal(10,2) DEFAULT 0.00,
  `guest_count` int(11) DEFAULT 1,
  `companion_count` int(11) DEFAULT 0,
  `special_requests` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `reservation_type_id`, `room_id`, `room_type_id`, `booking_type`, `room_assignment_pending`, `customer_id`, `check_in_date`, `check_out_date`, `checkout_datetime`, `reservation_status_id`, `total_amount`, `created_at`, `updated_at`, `advance_payment`, `guest_count`, `companion_count`, `special_requests`) VALUES
(24, 2, 24, 2, 'room_type', 0, 8, '2025-08-24', '2025-08-25', '2025-08-25 12:00:00', 2, 4100.00, '2025-08-24 08:07:50', '2025-08-24 09:21:24', 1650.00, 1, 0, ''),
(25, 2, 7, 7, 'room_type', 0, 2, '2025-08-24', '2025-08-25', '2025-08-25 12:00:00', 2, 4600.00, '2025-08-24 09:58:34', '2025-08-24 10:36:53', 2300.00, 1, 0, ''),
(27, 1, 35, NULL, 'specific_room', 0, 6, '2025-08-27', '2025-08-30', NULL, 5, 4470.00, '2025-08-24 11:51:13', '2025-08-24 14:07:02', 2000.00, 2, 0, NULL),
(28, 1, 14, NULL, 'specific_room', 0, 6, '2025-08-27', '2025-08-31', '2025-08-31 13:00:00', 3, 13220.00, '2025-08-24 14:06:53', '2025-08-24 19:08:55', 5000.00, 3, 0, NULL),
(29, 2, 32, 7, 'room_type', 0, 16, '2025-08-25', '2025-08-28', '2025-08-28 08:00:00', 2, 14380.00, '2025-08-24 23:04:29', '2025-08-25 04:50:21', 7040.00, 2, 0, 'Kiss tas hug lang'),
(30, 2, 19, 8, 'room_type', 0, 9, '2025-08-24', '2025-08-25', '2025-08-25 12:00:00', 2, 6060.00, '2025-08-25 04:53:54', '2025-08-25 05:27:27', 2980.00, 1, 0, ''),
(31, 2, 5, 5, 'room_type', 0, 11, '2025-08-27', '2025-08-29', '2025-08-29 08:00:00', 2, 7050.00, '2025-08-26 10:57:44', '2025-08-26 10:58:18', 3375.00, 2, 0, ''),
(32, 2, 31, 7, 'room_type', 0, 17, '2025-08-26', '2025-08-27', '2025-08-27 12:00:00', 2, 4620.00, '2025-08-26 17:50:46', '2025-08-26 17:52:36', 2310.00, 1, 0, ''),
(33, 2, 8, 8, 'room_type', 0, 1, '2025-08-30', '2025-08-31', '2025-08-31 13:00:00', 2, 7800.00, '2025-08-31 06:50:02', '2025-08-31 07:55:06', 3350.00, 1, 0, ''),
(34, 2, 34, 7, 'room_type', 0, 18, '2025-08-30', '2025-08-31', '2025-08-31 12:00:00', 2, 5020.00, '2025-08-31 07:59:02', '2025-10-03 20:34:38', 2405.00, 1, 0, ''),
(35, 1, 15, NULL, 'specific_room', 0, 19, '2025-08-31', '2025-09-01', '2025-09-01 13:00:00', 2, 6150.00, '2025-08-31 08:11:35', '2025-10-03 20:34:43', 2640.00, 3, 0, NULL),
(36, 2, 17, 6, 'room_type', 0, 20, '2025-08-30', '2025-08-31', '2025-08-31 12:00:00', 2, 5530.00, '2025-08-31 08:23:32', '2025-10-03 20:34:46', 2350.00, 1, 0, ''),
(37, 2, 30, 7, 'room_type', 0, 9, '2025-09-04', '2025-09-05', '2025-09-05 12:00:00', 2, 5920.00, '2025-09-04 12:06:52', '2025-09-04 12:07:45', 2560.00, 2, 0, ''),
(38, 2, 13, 2, 'room_type', 0, 21, '2025-12-24', '2025-12-25', '2025-12-25 12:00:00', 2, 2740.00, '2025-09-05 10:45:09', '2025-09-05 10:46:48', 655.00, 1, 0, 'as'),
(39, 2, 18, 7, 'room_type', 0, 8, '2025-09-05', '2025-09-08', '2025-09-08 12:00:00', 4, 13370.00, '2025-09-05 11:17:08', '2025-10-14 18:38:52', 2672.00, 1, 0, 'sad'),
(40, 2, 28, 7, 'room_type', 0, 8, '2025-09-07', '2025-09-08', '2025-09-08 12:00:00', 3, 6490.00, '2025-09-07 16:35:05', '2025-09-12 09:49:25', 2840.00, 1, 0, ''),
(41, 2, 29, 7, 'room_type', 0, 8, '2025-09-10', '2025-09-11', '2025-09-10 00:00:00', 3, 4000.00, '2025-09-10 17:42:57', '2025-09-11 06:39:20', 2000.00, 2, 1, ''),
(42, 2, 10, 10, 'room_type', 0, 12, '2025-09-11', '2025-09-12', NULL, 3, 6020.00, '2025-09-11 08:58:00', '2025-09-12 07:12:23', 2710.00, 2, 1, ''),
(43, 1, 35, NULL, '', 0, 22, '2025-09-11', '2025-09-12', '2025-09-12 12:00:00', 3, 1850.00, '2025-09-11 11:42:40', '2025-09-11 18:33:55', 500.00, 2, 1, NULL),
(44, 2, 38, 13, 'room_type', 0, 8, '2025-09-11', '2025-09-12', NULL, 3, 10000.00, '2025-09-12 09:37:43', '2025-09-12 09:49:07', 5000.00, 2, 1, ''),
(45, 2, 41, 14, 'room_type', 0, 9, '2025-09-17', '2025-09-18', NULL, 3, 1470.00, '2025-09-12 10:02:02', '2025-09-12 10:04:07', 337.50, 2, 1, ''),
(46, 2, 2, 2, 'room_type', 0, 8, '2025-09-12', '2025-09-13', NULL, 3, 2500.00, '2025-09-12 10:33:08', '2025-09-12 10:38:46', 1250.00, 2, 1, ''),
(47, 2, NULL, NULL, 'room_type', 0, 8, '2025-09-14', '2025-09-15', NULL, 3, 7000.00, '2025-09-14 10:14:41', '2025-09-16 11:40:24', 1400.00, 2, 1, ''),
(48, 2, NULL, NULL, 'room_type', 0, 8, '2025-09-14', '2025-09-15', NULL, 2, 7000.00, '2025-09-14 10:15:27', '2025-09-16 11:30:07', 1400.00, 2, 1, ''),
(49, 2, NULL, NULL, 'room_type', 0, 6, '2025-10-03', '2025-10-04', NULL, 2, 4000.00, '2025-09-14 19:14:39', '2025-10-03 19:28:19', 2029.99, 1, 1, ''),
(50, 1, NULL, NULL, 'room_type', 0, 22, '2025-09-16', '2025-09-17', '2025-09-17 12:00:00', 2, 14500.00, '2025-09-16 17:39:09', '2025-09-16 17:41:25', 7000.00, 2, 1, NULL),
(51, 2, NULL, NULL, 'room_type', 0, 18, '2025-09-18', '2025-09-19', NULL, 2, 12500.00, '2025-09-19 07:27:05', '2025-09-19 07:28:03', 2500.00, 2, 1, ''),
(52, 1, NULL, NULL, 'room_type', 0, 23, '2025-10-14', '2025-10-15', '2025-10-15 12:00:00', 3, 6500.00, '2025-10-14 18:44:08', '2025-10-14 18:44:48', 1000.00, 1, 0, NULL),
(53, 2, NULL, NULL, 'room_type', 1, 24, '2025-10-14', '2025-10-15', NULL, 5, 2500.00, '2025-10-14 21:16:48', '2025-10-17 08:23:43', 500.00, 1, 0, ''),
(54, 1, NULL, NULL, 'room_type', 1, 23, '2025-10-14', '2025-10-15', '2025-10-15 12:00:00', 1, 1500.00, '2025-10-14 21:18:39', '2025-10-14 21:18:39', 0.00, 1, 0, NULL),
(55, 2, NULL, NULL, 'room_type', 1, 25, '2025-10-14', '2025-10-15', NULL, 1, 10000.00, '2025-10-14 21:25:27', '2025-10-14 21:25:27', 2000.00, 1, 0, ''),
(56, 2, NULL, NULL, 'room_type', 0, 26, '2025-10-17', '2025-10-18', NULL, 2, 2500.00, '2025-10-17 08:17:22', '2025-10-17 08:17:49', 500.00, 1, 0, ''),
(57, 2, NULL, NULL, 'room_type', 1, 8, '2025-10-17', '2025-10-18', NULL, 1, 12500.00, '2025-10-17 08:52:38', '2025-10-17 08:52:38', 2500.00, 2, 1, 'make'),
(58, 2, NULL, NULL, 'room_type', 0, 8, '2025-10-31', '2025-11-01', NULL, 3, 11200.00, '2025-10-31 20:56:10', '2025-10-31 20:58:03', 2240.00, 2, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_details`
--

CREATE TABLE `reservation_details` (
  `reservation_detail_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `room_type_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_details`
--

INSERT INTO `reservation_details` (`reservation_detail_id`, `reservation_id`, `room_type_id`, `quantity`) VALUES
(1, 47, 2, 1),
(2, 47, 10, 1),
(3, 48, 2, 1),
(4, 48, 10, 1),
(5, 49, 2, 1),
(6, 49, 10, 1),
(7, 50, 11, 1),
(8, 50, 10, 1),
(9, 51, 2, 1),
(10, 51, 13, 1),
(11, 52, 2, 1),
(12, 52, 7, 1),
(13, 53, 2, 1),
(14, 54, 1, 1),
(15, 55, 13, 1),
(16, 56, 2, 1),
(17, 57, 2, 1),
(18, 57, 13, 1),
(19, 58, 12, 1),
(20, 58, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reservation_logs`
--

CREATE TABLE `reservation_logs` (
  `log_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `user_type` enum('customer','front_desk') DEFAULT 'customer',
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_values`)),
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_values`)),
  `notes` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_logs`
--

INSERT INTO `reservation_logs` (`log_id`, `reservation_id`, `action_type`, `timestamp`, `user_id`, `user_type`, `old_values`, `new_values`, `notes`, `ip_address`) VALUES
(27, 24, 'reservation_created', '2025-08-24 02:44:00', 1, 'front_desk', NULL, NULL, 'New reservation created for customer', '127.0.0.1'),
(28, 24, 'payment_received', '2025-08-24 02:44:00', 1, 'front_desk', NULL, NULL, 'Advance payment received', '127.0.0.1'),
(29, 24, 'room_assigned', '2025-08-24 02:44:00', 1, 'front_desk', NULL, NULL, 'Room assigned to reservation', '127.0.0.1'),
(30, 24, 'status_changed', '2025-08-24 02:44:00', 1, 'front_desk', NULL, NULL, 'Reservation status changed from Pending to Confirmed', '127.0.0.1'),
(31, 25, 'reservation_created', '2025-08-24 02:44:00', 1, 'front_desk', NULL, NULL, 'New reservation created for customer', '127.0.0.1'),
(32, 25, 'room_assigned', '2025-08-24 02:44:00', 1, 'front_desk', NULL, NULL, 'Room assigned to reservation', '127.0.0.1'),
(33, 25, 'status_changed', '2025-08-24 02:44:00', 1, 'front_desk', NULL, NULL, 'Reservation status changed from Pending to Confirmed', '127.0.0.1'),
(34, 25, 'check_in', '2025-08-24 02:44:00', 1, 'front_desk', NULL, NULL, 'Guest checked in', '127.0.0.1'),
(35, 27, 'status_changed', '2025-08-24 03:52:02', 2, 'front_desk', '{\"reservation_id\":27,\"reservation_type_id\":1,\"room_id\":33,\"room_type_id\":null,\"booking_type\":\"specific_room\",\"room_assignment_pending\":0,\"customer_id\":6,\"check_in_date\":\"2025-08-26\",\"checkin_datetime\":null,\"check_out_date\":\"2025-08-29\",\"checkout_datetime\":null,\"reservation_status_id\":1,\"total_amount\":\"4240.00\",\"created_at\":\"2025-08-24 11:51:13\",\"updated_at\":\"2025-08-24 11:51:13\",\"advance_payment\":\"2000.00\",\"guest_count\":2,\"special_requests\":null,\"current_room_status\":1}', '{\"reservation_id\":27,\"reservation_status_id\":2}', 'Reservation updated by front desk staff', '::1'),
(37, 27, 'amount_updated', '2025-08-24 04:39:38', 2, 'front_desk', '{\"reservation_id\":27,\"reservation_type_id\":1,\"room_id\":33,\"room_type_id\":null,\"booking_type\":\"specific_room\",\"room_assignment_pending\":0,\"customer_id\":6,\"check_in_date\":\"2025-08-26\",\"checkin_datetime\":null,\"check_out_date\":\"2025-08-29\",\"checkout_datetime\":null,\"reservation_status_id\":2,\"total_amount\":\"4240.00\",\"created_at\":\"2025-08-24 11:51:13\",\"updated_at\":\"2025-08-24 11:52:02\",\"advance_payment\":\"2000.00\",\"guest_count\":2,\"special_requests\":null,\"current_room_status\":3}', '{\"first_name\":\"Shankai\",\"last_name\":\"Bai\",\"email\":\"shangkaibai@hotel.com\",\"phone_number\":\"09354623235\",\"room_id\":3,\"room_type_id\":3,\"check_in_date\":\"2025-08-26\",\"check_out_date\":\"2025-08-29\",\"checkin_datetime\":\"2025-08-26 15:00:00\",\"checkout_datetime\":\"2025-08-29 12:00:00\",\"guest_count\":2,\"special_requests\":null,\"reservation_type_id\":1,\"booking_type\":\"room\",\"room_assignment_pending\":0,\"reservation_status_id\":1,\"total_amount\":8670,\"advance_payment\":2000,\"payment_method_id\":1,\"reference_number\":null,\"services\":[4,5],\"menu_items\":[{\"id\":1,\"quantity\":1},{\"id\":2,\"quantity\":1},{\"id\":4,\"quantity\":1}],\"reservation_id\":27}', 'Reservation updated by front desk staff', '::1'),
(38, 27, 'status_changed', '2025-08-24 04:39:51', 2, 'front_desk', '{\"reservation_id\":27,\"reservation_type_id\":1,\"room_id\":3,\"room_type_id\":null,\"booking_type\":\"specific_room\",\"room_assignment_pending\":0,\"customer_id\":6,\"check_in_date\":\"2025-08-26\",\"checkin_datetime\":null,\"check_out_date\":\"2025-08-29\",\"checkout_datetime\":null,\"reservation_status_id\":1,\"total_amount\":\"8670.00\",\"created_at\":\"2025-08-24 11:51:13\",\"updated_at\":\"2025-08-24 12:39:38\",\"advance_payment\":\"2000.00\",\"guest_count\":2,\"special_requests\":null,\"current_room_status\":1}', '{\"reservation_id\":27,\"reservation_status_id\":2}', 'Reservation updated by front desk staff', '::1'),
(39, 27, 'amount_updated', '2025-08-24 04:43:58', 2, 'front_desk', '{\"reservation_id\":27,\"reservation_type_id\":1,\"room_id\":3,\"room_type_id\":null,\"booking_type\":\"specific_room\",\"room_assignment_pending\":0,\"customer_id\":6,\"check_in_date\":\"2025-08-26\",\"checkin_datetime\":null,\"check_out_date\":\"2025-08-29\",\"checkout_datetime\":null,\"reservation_status_id\":2,\"total_amount\":\"8670.00\",\"created_at\":\"2025-08-24 11:51:13\",\"updated_at\":\"2025-08-24 12:39:51\",\"advance_payment\":\"2000.00\",\"guest_count\":2,\"special_requests\":null,\"current_room_status\":3}', '{\"first_name\":\"Shankai\",\"last_name\":\"Bai\",\"email\":\"shangkaibai@hotel.com\",\"phone_number\":\"09354623235\",\"room_id\":35,\"room_type_id\":12,\"check_in_date\":\"2025-08-27\",\"check_out_date\":\"2025-08-30\",\"checkin_datetime\":\"2025-08-27 15:00:00\",\"checkout_datetime\":\"2025-08-30 12:00:00\",\"guest_count\":2,\"special_requests\":null,\"reservation_type_id\":1,\"booking_type\":\"room\",\"room_assignment_pending\":0,\"reservation_status_id\":1,\"total_amount\":4190,\"advance_payment\":2000,\"payment_method_id\":1,\"reference_number\":null,\"services\":[],\"menu_items\":[{\"id\":1,\"quantity\":1},{\"id\":4,\"quantity\":1}],\"reservation_id\":27}', 'Reservation updated by front desk staff', '::1'),
(40, 27, 'status_changed', '2025-08-24 04:52:28', 2, 'front_desk', '{\"reservation_id\":27,\"reservation_type_id\":1,\"room_id\":35,\"room_type_id\":null,\"booking_type\":\"specific_room\",\"room_assignment_pending\":0,\"customer_id\":6,\"check_in_date\":\"2025-08-27\",\"checkin_datetime\":null,\"check_out_date\":\"2025-08-30\",\"checkout_datetime\":null,\"reservation_status_id\":1,\"total_amount\":\"4190.00\",\"created_at\":\"2025-08-24 11:51:13\",\"updated_at\":\"2025-08-24 12:43:58\",\"advance_payment\":\"2000.00\",\"guest_count\":2,\"special_requests\":null,\"current_room_status\":1}', '{\"reservation_id\":27,\"reservation_status_id\":5}', 'Reservation updated by front desk staff', '::1'),
(41, 27, 'amount_updated', '2025-08-24 04:53:11', 2, 'front_desk', '{\"reservation_id\":27,\"reservation_type_id\":1,\"room_id\":35,\"room_type_id\":null,\"booking_type\":\"specific_room\",\"room_assignment_pending\":0,\"customer_id\":6,\"check_in_date\":\"2025-08-27\",\"checkin_datetime\":null,\"check_out_date\":\"2025-08-30\",\"checkout_datetime\":null,\"reservation_status_id\":5,\"total_amount\":\"4190.00\",\"created_at\":\"2025-08-24 11:51:13\",\"updated_at\":\"2025-08-24 12:52:28\",\"advance_payment\":\"2000.00\",\"guest_count\":2,\"special_requests\":null,\"current_room_status\":1}', '{\"first_name\":\"Shankai\",\"last_name\":\"Bai\",\"email\":\"shangkaibai@hotel.com\",\"phone_number\":\"09354623235\",\"room_id\":35,\"room_type_id\":12,\"check_in_date\":\"2025-08-27\",\"check_out_date\":\"2025-08-30\",\"checkin_datetime\":\"2025-08-27 14:00:00\",\"checkout_datetime\":\"2025-08-30 08:00:00\",\"guest_count\":2,\"special_requests\":null,\"reservation_type_id\":1,\"booking_type\":\"room\",\"room_assignment_pending\":0,\"reservation_status_id\":1,\"total_amount\":4150,\"advance_payment\":2000,\"payment_method_id\":1,\"reference_number\":null,\"services\":[4,5],\"menu_items\":[{\"id\":2,\"quantity\":1},{\"id\":4,\"quantity\":1}],\"reservation_id\":27}', 'Reservation updated by front desk staff', '::1'),
(42, 27, 'amount_updated', '2025-08-24 05:59:12', 2, 'front_desk', '{\"reservation_id\":27,\"reservation_type_id\":1,\"room_id\":35,\"room_type_id\":null,\"booking_type\":\"specific_room\",\"room_assignment_pending\":0,\"customer_id\":6,\"check_in_date\":\"2025-08-27\",\"checkin_datetime\":null,\"check_out_date\":\"2025-08-30\",\"checkout_datetime\":null,\"reservation_status_id\":1,\"total_amount\":\"4150.00\",\"created_at\":\"2025-08-24 11:51:13\",\"updated_at\":\"2025-08-24 12:53:11\",\"advance_payment\":\"2000.00\",\"guest_count\":2,\"special_requests\":null,\"current_room_status\":1}', '{\"first_name\":\"Shankai\",\"last_name\":\"Bai\",\"email\":\"shangkaibai@hotel.com\",\"phone_number\":\"09354623235\",\"room_id\":35,\"room_type_id\":12,\"check_in_date\":\"2025-08-27\",\"check_out_date\":\"2025-08-30\",\"checkin_datetime\":\"2025-08-27 14:00:00\",\"checkout_datetime\":\"2025-08-30 08:00:00\",\"guest_count\":2,\"special_requests\":null,\"reservation_type_id\":1,\"booking_type\":\"room\",\"room_assignment_pending\":0,\"reservation_status_id\":1,\"total_amount\":5000,\"advance_payment\":2000,\"payment_method_id\":1,\"reference_number\":null,\"services\":[2,11],\"menu_items\":[{\"id\":1,\"quantity\":1},{\"id\":2,\"quantity\":1}],\"reservation_id\":27}', 'Reservation updated by front desk staff', '::1'),
(43, 27, 'amount_updated', '2025-08-24 06:05:51', 2, 'front_desk', '{\"reservation_id\":27,\"reservation_type_id\":1,\"room_id\":35,\"room_type_id\":null,\"booking_type\":\"specific_room\",\"room_assignment_pending\":0,\"customer_id\":6,\"check_in_date\":\"2025-08-27\",\"checkin_datetime\":null,\"check_out_date\":\"2025-08-30\",\"checkout_datetime\":null,\"reservation_status_id\":1,\"total_amount\":\"5000.00\",\"created_at\":\"2025-08-24 11:51:13\",\"updated_at\":\"2025-08-24 13:59:11\",\"advance_payment\":\"2000.00\",\"guest_count\":2,\"special_requests\":null,\"current_room_status\":1}', '{\"first_name\":\"Shankai\",\"last_name\":\"Bai\",\"email\":\"shangkaibai@hotel.com\",\"phone_number\":\"09354623235\",\"room_id\":35,\"room_type_id\":12,\"check_in_date\":\"2025-08-27\",\"check_out_date\":\"2025-08-30\",\"checkin_datetime\":\"2025-08-27 14:00:00\",\"checkout_datetime\":\"2025-08-30 08:00:00\",\"guest_count\":2,\"special_requests\":null,\"reservation_type_id\":1,\"booking_type\":\"room\",\"room_assignment_pending\":0,\"reservation_status_id\":1,\"total_amount\":4470,\"advance_payment\":2000,\"payment_method_id\":1,\"reference_number\":null,\"services\":[3,8],\"menu_items\":[{\"id\":1,\"quantity\":1},{\"id\":2,\"quantity\":1},{\"id\":4,\"quantity\":1}],\"reservation_id\":27}', 'Reservation updated by front desk staff', '::1'),
(44, 27, 'status_changed', '2025-08-24 06:07:02', 2, 'front_desk', '{\"reservation_id\":27,\"reservation_type_id\":1,\"room_id\":35,\"room_type_id\":null,\"booking_type\":\"specific_room\",\"room_assignment_pending\":0,\"customer_id\":6,\"check_in_date\":\"2025-08-27\",\"checkin_datetime\":null,\"check_out_date\":\"2025-08-30\",\"checkout_datetime\":null,\"reservation_status_id\":1,\"total_amount\":\"4470.00\",\"created_at\":\"2025-08-24 11:51:13\",\"updated_at\":\"2025-08-24 14:05:51\",\"advance_payment\":\"2000.00\",\"guest_count\":2,\"special_requests\":null,\"current_room_status\":1}', '{\"reservation_id\":27,\"reservation_status_id\":5}', 'Reservation updated by front desk staff', '::1'),
(45, 28, 'status_changed', '2025-08-24 06:07:19', 2, 'front_desk', '{\"reservation_id\":28,\"reservation_type_id\":1,\"room_id\":14,\"room_type_id\":null,\"booking_type\":\"specific_room\",\"room_assignment_pending\":0,\"customer_id\":6,\"check_in_date\":\"2025-08-27\",\"checkin_datetime\":\"2025-08-27 16:00:00\",\"check_out_date\":\"2025-08-31\",\"checkout_datetime\":\"2025-08-31 13:00:00\",\"reservation_status_id\":1,\"total_amount\":\"13220.00\",\"created_at\":\"2025-08-24 14:06:53\",\"updated_at\":\"2025-08-24 14:06:53\",\"advance_payment\":\"5000.00\",\"guest_count\":3,\"special_requests\":null,\"current_room_status\":1}', '{\"reservation_id\":28,\"reservation_status_id\":2}', 'Reservation updated by front desk staff', '::1'),
(46, 28, 'status_changed', '2025-08-24 11:08:55', 2, 'front_desk', '{\"reservation_id\":28,\"reservation_type_id\":1,\"room_id\":14,\"room_type_id\":null,\"booking_type\":\"specific_room\",\"room_assignment_pending\":0,\"customer_id\":6,\"check_in_date\":\"2025-08-27\",\"checkin_datetime\":\"2025-08-27 16:00:00\",\"check_out_date\":\"2025-08-31\",\"checkout_datetime\":\"2025-08-31 13:00:00\",\"reservation_status_id\":2,\"total_amount\":\"13220.00\",\"created_at\":\"2025-08-24 14:06:53\",\"updated_at\":\"2025-08-24 14:07:19\",\"advance_payment\":\"5000.00\",\"guest_count\":3,\"special_requests\":null,\"current_room_status\":3}', '{\"reservation_id\":28,\"reservation_status_id\":3}', 'Reservation updated by front desk staff', '::1'),
(47, 29, 'created', '2025-08-24 15:04:29', 16, 'customer', NULL, '{\"room_type_id\":7,\"checkin_datetime\":\"2025-08-25 14:00:00\",\"checkout_datetime\":\"2025-08-28 08:00:00\",\"total_amount\":14380,\"guest_count\":2,\"pricing_adjustments\":{\"checkin_adjustment\":500,\"checkout_adjustment\":-200,\"total_adjustment\":300,\"details\":[\"Early check-in fee: \\u20b1500\",\"Early check-out discount: -\\u20b1200\"]},\"booking_type\":\"room_type\"}', 'Online room type reservation with datetime selection', NULL),
(48, 29, 'payment_received', '2025-08-24 15:04:29', 16, 'customer', NULL, '{\"advance_payment_id\":\"20\",\"amount\":7040,\"payment_method_id\":2,\"reference_number\":\"62964926983628\"}', 'Advance payment processed for room type booking', NULL),
(49, 29, 'status_changed', '2025-08-24 20:40:33', 2, 'front_desk', '{\"reservation_id\":29,\"reservation_type_id\":2,\"room_id\":null,\"room_type_id\":7,\"booking_type\":\"room_type\",\"room_assignment_pending\":1,\"customer_id\":16,\"check_in_date\":\"2025-08-25\",\"checkin_datetime\":\"2025-08-25 14:00:00\",\"check_out_date\":\"2025-08-28\",\"checkout_datetime\":\"2025-08-28 08:00:00\",\"reservation_status_id\":1,\"total_amount\":\"14380.00\",\"created_at\":\"2025-08-24 23:04:29\",\"updated_at\":\"2025-08-24 23:04:29\",\"advance_payment\":\"7040.00\",\"guest_count\":2,\"special_requests\":\"Kiss tas hug lang\",\"current_room_status\":null}', '{\"reservation_id\":29,\"reservation_status_id\":2}', 'Reservation updated by front desk staff', '::1'),
(50, 29, 'room_assigned', '2025-08-24 20:50:21', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":32}', 'Room 32 assigned to reservation by front desk staff', '::1'),
(51, 30, 'created', '2025-08-24 20:53:54', 9, 'customer', NULL, '{\"room_type_id\":8,\"checkin_datetime\":\"2025-08-24 15:00:00\",\"checkout_datetime\":\"2025-08-25 12:00:00\",\"total_amount\":5960,\"guest_count\":1,\"pricing_adjustments\":{\"checkin_adjustment\":0,\"checkout_adjustment\":0,\"total_adjustment\":0,\"details\":[]},\"booking_type\":\"room_type\"}', 'Online room type reservation with datetime selection', NULL),
(52, 30, 'modified', '2025-08-24 20:53:54', 9, 'customer', NULL, '{\"old_total\":5960,\"new_total\":6060,\"additional_charges\":100}', 'Added services and menu items to room type booking', NULL),
(53, 30, 'payment_received', '2025-08-24 20:53:54', 9, 'customer', NULL, '{\"advance_payment_id\":\"21\",\"amount\":2980,\"payment_method_id\":2,\"reference_number\":\"543463545345345\"}', 'Advance payment processed for room type booking', NULL),
(54, 30, 'room_assigned', '2025-08-24 21:26:16', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":19}', 'Room 19 assigned to reservation by front desk staff', '::1'),
(55, 30, 'status_changed', '2025-08-24 21:27:27', 2, 'front_desk', '{\"reservation_id\":30,\"reservation_type_id\":2,\"room_id\":19,\"room_type_id\":8,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":9,\"check_in_date\":\"2025-08-24\",\"checkin_datetime\":\"2025-08-24 15:00:00\",\"check_out_date\":\"2025-08-25\",\"checkout_datetime\":\"2025-08-25 12:00:00\",\"reservation_status_id\":1,\"total_amount\":\"6060.00\",\"created_at\":\"2025-08-25 04:53:54\",\"updated_at\":\"2025-08-25 05:26:16\",\"advance_payment\":\"2980.00\",\"guest_count\":1,\"special_requests\":\"\",\"current_room_status\":3}', '{\"reservation_id\":30,\"reservation_status_id\":2}', 'Reservation updated by front desk staff', '::1'),
(56, 31, 'created', '2025-08-26 02:57:44', 11, 'customer', NULL, '{\"room_type_id\":5,\"checkin_datetime\":\"2025-08-27 14:00:00\",\"checkout_datetime\":\"2025-08-29 08:00:00\",\"total_amount\":7050,\"guest_count\":2,\"pricing_adjustments\":{\"checkin_adjustment\":500,\"checkout_adjustment\":-200,\"total_adjustment\":300,\"details\":[\"Early check-in fee: \\u20b1500\",\"Early check-out discount: -\\u20b1200\"]},\"booking_type\":\"room_type\"}', 'Online room type reservation with datetime selection', NULL),
(57, 31, 'payment_received', '2025-08-26 02:57:44', 11, 'customer', NULL, '{\"advance_payment_id\":\"22\",\"amount\":3375,\"payment_method_id\":2,\"reference_number\":\"543463545345345\"}', 'Advance payment processed for room type booking', NULL),
(58, 31, 'room_assigned', '2025-08-26 02:58:05', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":5}', 'Room 5 assigned to reservation by front desk staff', '::1'),
(59, 31, 'status_changed', '2025-08-26 02:58:18', 2, 'front_desk', '{\"reservation_id\":31,\"reservation_type_id\":2,\"room_id\":5,\"room_type_id\":5,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":11,\"check_in_date\":\"2025-08-27\",\"checkin_datetime\":\"2025-08-27 14:00:00\",\"check_out_date\":\"2025-08-29\",\"checkout_datetime\":\"2025-08-29 08:00:00\",\"reservation_status_id\":1,\"total_amount\":\"7050.00\",\"created_at\":\"2025-08-26 10:57:44\",\"updated_at\":\"2025-08-26 10:58:05\",\"advance_payment\":\"3375.00\",\"guest_count\":2,\"special_requests\":\"\",\"current_room_status\":3}', '{\"reservation_id\":31,\"reservation_status_id\":2}', 'Reservation updated by front desk staff', '::1'),
(60, 32, 'created', '2025-08-26 09:50:46', 17, 'customer', NULL, '{\"room_type_id\":7,\"checkin_datetime\":\"2025-08-26 15:00:00\",\"checkout_datetime\":\"2025-08-27 12:00:00\",\"total_amount\":4620,\"guest_count\":1,\"pricing_adjustments\":{\"checkin_adjustment\":0,\"checkout_adjustment\":0,\"total_adjustment\":0,\"details\":[]},\"booking_type\":\"room_type\"}', 'Online room type reservation with datetime selection', NULL),
(61, 32, 'payment_received', '2025-08-26 09:50:47', 17, 'customer', NULL, '{\"advance_payment_id\":\"23\",\"amount\":2310,\"payment_method_id\":2,\"reference_number\":\"543463545345345\"}', 'Advance payment processed for room type booking', NULL),
(62, 32, 'status_changed', '2025-08-26 09:52:30', 2, 'front_desk', '{\"reservation_id\":32,\"reservation_type_id\":2,\"room_id\":null,\"room_type_id\":7,\"booking_type\":\"room_type\",\"room_assignment_pending\":1,\"customer_id\":17,\"check_in_date\":\"2025-08-26\",\"checkin_datetime\":\"2025-08-26 15:00:00\",\"check_out_date\":\"2025-08-27\",\"checkout_datetime\":\"2025-08-27 12:00:00\",\"reservation_status_id\":1,\"total_amount\":\"4620.00\",\"created_at\":\"2025-08-26 17:50:46\",\"updated_at\":\"2025-08-26 17:50:46\",\"advance_payment\":\"2310.00\",\"guest_count\":1,\"special_requests\":\"\",\"current_room_status\":null}', '{\"reservation_id\":32,\"reservation_status_id\":2}', 'Reservation updated by front desk staff', '::1'),
(63, 32, 'room_assigned', '2025-08-26 09:52:36', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":31}', 'Room 31 assigned to reservation by front desk staff', '::1'),
(64, 33, 'created', '2025-08-30 22:50:02', 1, 'customer', NULL, '{\"room_type_id\":8,\"checkin_datetime\":\"2025-08-30 16:00:00\",\"checkout_datetime\":\"2025-08-31 13:00:00\",\"total_amount\":7000,\"guest_count\":1,\"pricing_adjustments\":{\"checkin_adjustment\":0,\"checkout_adjustment\":300,\"total_adjustment\":300,\"details\":[\"Late check-out fee: \\u20b1300\"]},\"booking_type\":\"room_type\"}', 'Online room type reservation with datetime selection', NULL),
(65, 33, 'modified', '2025-08-30 22:50:02', 1, 'customer', NULL, '{\"old_total\":7000,\"new_total\":7800,\"additional_charges\":800}', 'Added services and menu items to room type booking', NULL),
(66, 33, 'payment_received', '2025-08-30 22:50:02', 1, 'customer', NULL, '{\"advance_payment_id\":\"24\",\"amount\":3350,\"payment_method_id\":2,\"reference_number\":\"543463545345345\"}', 'Advance payment processed for room type booking', NULL),
(67, 33, 'room_assigned', '2025-08-30 22:51:07', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":8}', 'Room 8 assigned to reservation by front desk staff', '::1'),
(68, 33, 'status_changed', '2025-08-30 23:55:06', 2, 'front_desk', '{\"reservation_id\":33,\"reservation_type_id\":2,\"room_id\":8,\"room_type_id\":8,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":1,\"check_in_date\":\"2025-08-30\",\"checkin_datetime\":\"2025-08-30 16:00:00\",\"check_out_date\":\"2025-08-31\",\"checkout_datetime\":\"2025-08-31 13:00:00\",\"reservation_status_id\":1,\"total_amount\":\"7800.00\",\"created_at\":\"2025-08-31 06:50:02\",\"updated_at\":\"2025-08-31 06:51:07\",\"advance_payment\":\"3350.00\",\"guest_count\":1,\"special_requests\":\"\",\"current_room_status\":3}', '{\"reservation_id\":33,\"reservation_status_id\":2}', 'Reservation updated by front desk staff', '::1'),
(69, 34, 'created', '2025-08-30 23:59:02', 18, 'customer', NULL, '{\"room_type_id\":7,\"checkin_datetime\":\"2025-08-30 15:00:00\",\"checkout_datetime\":\"2025-08-31 12:00:00\",\"total_amount\":4810,\"guest_count\":1,\"pricing_adjustments\":{\"checkin_adjustment\":0,\"checkout_adjustment\":0,\"total_adjustment\":0,\"details\":[]},\"booking_type\":\"room_type\"}', 'Online room type reservation with datetime selection', NULL),
(70, 34, 'modified', '2025-08-30 23:59:02', 18, 'customer', NULL, '{\"old_total\":4810,\"new_total\":5020,\"additional_charges\":210}', 'Added services and menu items to room type booking', NULL),
(71, 34, 'payment_received', '2025-08-30 23:59:02', 18, 'customer', NULL, '{\"advance_payment_id\":\"25\",\"amount\":2405,\"payment_method_id\":3,\"reference_number\":\"543463545345345\"}', 'Advance payment processed for room type booking', NULL),
(72, 36, 'created', '2025-08-31 00:23:32', 20, 'customer', NULL, '{\"room_type_id\":6,\"checkin_datetime\":\"2025-08-30 15:00:00\",\"checkout_datetime\":\"2025-08-31 12:00:00\",\"total_amount\":4700,\"guest_count\":1,\"pricing_adjustments\":{\"checkin_adjustment\":0,\"checkout_adjustment\":0,\"total_adjustment\":0,\"details\":[]},\"booking_type\":\"room_type\"}', 'Online room type reservation with datetime selection', NULL),
(73, 36, 'modified', '2025-08-31 00:23:32', 20, 'customer', NULL, '{\"old_total\":4700,\"new_total\":5530,\"additional_charges\":830}', 'Added services and menu items to room type booking', NULL),
(74, 36, 'payment_received', '2025-08-31 00:23:32', 20, 'customer', NULL, '{\"advance_payment_id\":\"27\",\"amount\":2350,\"payment_method_id\":2,\"reference_number\":\"543463545345345\"}', 'Advance payment processed for room type booking', NULL),
(75, 34, 'room_assigned', '2025-08-31 00:23:51', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":34}', 'Room 34 assigned to reservation by front desk staff', '::1'),
(76, 36, 'room_assigned', '2025-08-31 00:23:57', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":17}', 'Room 17 assigned to reservation by front desk staff', '::1'),
(77, 37, 'created', '2025-09-04 04:06:52', 9, 'customer', NULL, '{\"room_type_id\":7,\"checkin_datetime\":\"2025-09-04 15:00:00\",\"checkout_datetime\":\"2025-09-05 12:00:00\",\"total_amount\":5120,\"guest_count\":2,\"pricing_adjustments\":{\"checkin_adjustment\":0,\"checkout_adjustment\":0,\"total_adjustment\":0,\"details\":[]},\"booking_type\":\"room_type\"}', 'Online room type reservation with datetime selection', NULL),
(78, 37, 'modified', '2025-09-04 04:06:52', 9, 'customer', NULL, '{\"old_total\":5120,\"new_total\":5920,\"additional_charges\":800}', 'Added services and menu items to room type booking', NULL),
(79, 37, 'payment_received', '2025-09-04 04:06:52', 9, 'customer', NULL, '{\"advance_payment_id\":\"28\",\"amount\":2560,\"payment_method_id\":2,\"reference_number\":\"543463545345345\"}', 'Advance payment processed for room type booking', NULL),
(80, 37, 'status_changed', '2025-09-04 04:07:12', 2, 'front_desk', '{\"reservation_id\":37,\"reservation_type_id\":2,\"room_id\":null,\"room_type_id\":7,\"booking_type\":\"room_type\",\"room_assignment_pending\":1,\"customer_id\":9,\"check_in_date\":\"2025-09-04\",\"checkin_datetime\":\"2025-09-04 15:00:00\",\"check_out_date\":\"2025-09-05\",\"checkout_datetime\":\"2025-09-05 12:00:00\",\"reservation_status_id\":1,\"total_amount\":\"5920.00\",\"created_at\":\"2025-09-04 12:06:52\",\"updated_at\":\"2025-09-04 12:06:52\",\"advance_payment\":\"2560.00\",\"guest_count\":2,\"special_requests\":\"\",\"current_room_status\":null}', '{\"reservation_id\":37,\"reservation_status_id\":2}', 'Reservation updated by front desk staff', '::1'),
(81, 37, 'room_assigned', '2025-09-04 04:07:45', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":30}', 'Room 30 assigned to reservation by front desk staff', '::1'),
(82, 38, 'created', '2025-09-05 02:45:09', 21, 'customer', NULL, '{\"room_type_id\":2,\"checkin_datetime\":\"2025-12-24 15:00:00\",\"checkout_datetime\":\"2025-12-25 12:00:00\",\"total_amount\":2620,\"guest_count\":1,\"pricing_adjustments\":{\"checkin_adjustment\":0,\"checkout_adjustment\":0,\"total_adjustment\":0,\"details\":[]},\"booking_type\":\"room_type\"}', 'Online room type reservation with datetime selection', NULL),
(83, 38, 'modified', '2025-09-05 02:45:09', 21, 'customer', NULL, '{\"old_total\":2620,\"new_total\":2740,\"additional_charges\":120}', 'Added services and menu items to room type booking', NULL),
(84, 38, 'payment_received', '2025-09-05 02:45:09', 21, 'customer', NULL, '{\"advance_payment_id\":\"29\",\"amount\":655,\"payment_method_id\":1,\"reference_number\":\"\"}', 'Advance payment processed for room type booking', NULL),
(85, 38, 'room_assigned', '2025-09-05 02:46:27', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":13}', 'Room 13 assigned to reservation by front desk staff', '::1'),
(86, 38, 'status_changed', '2025-09-05 02:46:48', 2, 'front_desk', '{\"reservation_id\":38,\"reservation_type_id\":2,\"room_id\":13,\"room_type_id\":2,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":21,\"check_in_date\":\"2025-12-24\",\"checkin_datetime\":\"2025-12-24 15:00:00\",\"check_out_date\":\"2025-12-25\",\"checkout_datetime\":\"2025-12-25 12:00:00\",\"reservation_status_id\":1,\"total_amount\":\"2740.00\",\"created_at\":\"2025-09-05 10:45:09\",\"updated_at\":\"2025-09-05 10:46:27\",\"advance_payment\":\"655.00\",\"guest_count\":1,\"special_requests\":\"as\",\"current_room_status\":3}', '{\"reservation_id\":38,\"reservation_status_id\":2}', 'Reservation updated by front desk staff', '::1'),
(87, 39, 'created', '2025-09-05 03:17:08', 8, 'customer', NULL, '{\"room_type_id\":7,\"checkin_datetime\":\"2025-09-05 15:00:00\",\"checkout_datetime\":\"2025-09-08 12:00:00\",\"total_amount\":13360,\"guest_count\":1,\"pricing_adjustments\":{\"checkin_adjustment\":0,\"checkout_adjustment\":0,\"total_adjustment\":0,\"details\":[]},\"booking_type\":\"room_type\"}', 'Online room type reservation with datetime selection', NULL),
(88, 39, 'modified', '2025-09-05 03:17:08', 8, 'customer', NULL, '{\"old_total\":13360,\"new_total\":13370,\"additional_charges\":10}', 'Added services and menu items to room type booking', NULL),
(89, 39, 'payment_received', '2025-09-05 03:17:08', 8, 'customer', NULL, '{\"advance_payment_id\":\"30\",\"amount\":2672,\"payment_method_id\":1,\"reference_number\":\"\"}', 'Advance payment processed for room type booking', NULL),
(90, 39, 'status_changed', '2025-09-05 03:27:37', 2, 'front_desk', '{\"reservation_id\":39,\"reservation_type_id\":2,\"room_id\":null,\"room_type_id\":7,\"booking_type\":\"room_type\",\"room_assignment_pending\":1,\"customer_id\":8,\"check_in_date\":\"2025-09-05\",\"checkin_datetime\":\"2025-09-05 15:00:00\",\"check_out_date\":\"2025-09-08\",\"checkout_datetime\":\"2025-09-08 12:00:00\",\"reservation_status_id\":1,\"total_amount\":\"13370.00\",\"created_at\":\"2025-09-05 11:17:08\",\"updated_at\":\"2025-09-05 11:17:08\",\"advance_payment\":\"2672.00\",\"guest_count\":1,\"special_requests\":\"sad\",\"current_room_status\":null}', '{\"reservation_id\":39,\"reservation_status_id\":2}', 'Reservation updated by front desk staff', '::1'),
(91, 39, 'room_assigned', '2025-09-05 03:32:29', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":18}', 'Room 18 assigned to reservation by front desk staff', '::1'),
(92, 39, 'status_changed', '2025-09-05 03:35:07', 2, 'front_desk', '{\"reservation_id\":39,\"reservation_type_id\":2,\"room_id\":18,\"room_type_id\":7,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":8,\"check_in_date\":\"2025-09-05\",\"checkin_datetime\":\"2025-09-05 15:00:00\",\"check_out_date\":\"2025-09-08\",\"checkout_datetime\":\"2025-09-08 12:00:00\",\"reservation_status_id\":2,\"total_amount\":\"13370.00\",\"created_at\":\"2025-09-05 11:17:08\",\"updated_at\":\"2025-09-05 11:32:29\",\"advance_payment\":\"2672.00\",\"guest_count\":1,\"special_requests\":\"sad\",\"current_room_status\":3}', '{\"reservation_id\":39,\"reservation_status_id\":3}', 'Reservation updated by front desk staff', '::1'),
(93, 40, 'room_assigned', '2025-09-10 10:37:07', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":28}', 'Room 28 assigned to reservation by front desk staff', '::1'),
(94, 41, 'room_assigned', '2025-09-10 10:37:19', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":29}', 'Room 29 assigned to reservation by front desk staff', '::1'),
(95, 41, 'status_changed', '2025-09-10 22:39:20', 2, 'front_desk', '{\"reservation_id\":41,\"reservation_type_id\":2,\"room_id\":29,\"room_type_id\":7,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":8,\"check_in_date\":\"2025-09-10\",\"check_out_date\":\"2025-09-11\",\"checkout_datetime\":null,\"reservation_status_id\":2,\"total_amount\":\"4000.00\",\"created_at\":\"2025-09-10 17:42:57\",\"updated_at\":\"2025-09-10 18:37:19\",\"advance_payment\":\"2000.00\",\"guest_count\":2,\"companion_count\":1,\"special_requests\":\"\",\"current_room_status\":3}', '{\"reservation_id\":41,\"reservation_status_id\":3}', 'Reservation updated by front desk staff', '::1'),
(96, 42, 'room_assigned', '2025-09-11 00:58:14', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":10}', 'Room 10 assigned to reservation by front desk staff', '::1'),
(97, 28, 'service_request_updated', '2025-09-11 02:26:47', 2, 'front_desk', NULL, '{\"request_id\":59,\"status_id\":\"2\",\"assigned_to\":\"2\"}', '', '::1'),
(98, 42, 'service_request_updated', '2025-09-11 02:29:07', 2, 'front_desk', NULL, '{\"request_id\":60,\"status_id\":\"2\",\"assigned_to\":\"2\"}', '', '::1'),
(99, 43, 'service_request_updated', '2025-09-11 03:43:26', 2, 'front_desk', NULL, '{\"request_id\":61,\"status_id\":\"2\",\"assigned_to\":\"14\"}', '', '::1'),
(100, 41, 'service_request_updated', '2025-09-11 10:19:19', 2, 'front_desk', NULL, '{\"request_id\":63,\"status_id\":\"2\",\"assigned_to\":\"14\"}', '', '::1'),
(101, 43, 'status_changed', '2025-09-11 10:33:55', 2, 'front_desk', '{\"reservation_id\":43,\"reservation_type_id\":1,\"room_id\":35,\"room_type_id\":null,\"booking_type\":\"\",\"room_assignment_pending\":0,\"customer_id\":22,\"check_in_date\":\"2025-09-11\",\"check_out_date\":\"2025-09-12\",\"checkout_datetime\":\"2025-09-12 12:00:00\",\"reservation_status_id\":2,\"total_amount\":\"1850.00\",\"created_at\":\"2025-09-11 11:42:40\",\"updated_at\":\"2025-09-11 11:42:40\",\"advance_payment\":\"500.00\",\"guest_count\":2,\"companion_count\":1,\"special_requests\":null,\"current_room_status\":3}', '{\"reservation_id\":43,\"reservation_status_id\":3}', 'Reservation updated by front desk staff', '::1'),
(102, 42, 'status_changed', '2025-09-11 23:12:23', 2, 'front_desk', '{\"reservation_id\":42,\"reservation_type_id\":2,\"room_id\":10,\"room_type_id\":10,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":12,\"check_in_date\":\"2025-09-11\",\"check_out_date\":\"2025-09-12\",\"checkout_datetime\":null,\"reservation_status_id\":2,\"total_amount\":\"6020.00\",\"created_at\":\"2025-09-11 08:58:00\",\"updated_at\":\"2025-09-11 08:58:14\",\"advance_payment\":\"2710.00\",\"guest_count\":2,\"companion_count\":1,\"special_requests\":\"\",\"current_room_status\":3}', '{\"reservation_id\":42,\"reservation_status_id\":3}', 'Reservation updated by front desk staff', '::1'),
(103, 42, 'service_request_updated', '2025-09-11 23:14:09', 2, 'front_desk', NULL, '{\"request_id\":68,\"status_id\":\"1\",\"assigned_to\":\"\"}', '', '::1'),
(104, 42, 'service_request_updated', '2025-09-11 23:14:15', 2, 'front_desk', NULL, '{\"request_id\":68,\"status_id\":\"2\",\"assigned_to\":\"\"}', '', '::1'),
(105, 42, 'service_request_updated', '2025-09-11 23:14:22', 2, 'front_desk', NULL, '{\"request_id\":68,\"status_id\":\"2\",\"assigned_to\":\"14\"}', '', '::1'),
(106, 42, 'service_request_updated', '2025-09-11 23:43:24', 2, 'front_desk', NULL, '{\"request_id\":68,\"status_id\":\"3\",\"assigned_to\":\"14\"}', '', '::1'),
(107, 42, 'service_request_updated', '2025-09-11 23:48:41', 2, 'front_desk', NULL, '{\"request_id\":68,\"status_id\":\"3\",\"assigned_to\":\"14\"}', '', '::1'),
(108, 42, 'service_request_updated', '2025-09-11 23:53:55', 2, 'front_desk', NULL, '{\"request_id\":69,\"status_id\":\"2\",\"assigned_to\":\"2\"}', '', '::1'),
(109, 44, 'room_assigned', '2025-09-12 01:48:56', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":38}', 'Room 38 assigned to reservation by front desk staff', '::1'),
(110, 44, 'status_changed', '2025-09-12 01:49:07', 2, 'front_desk', '{\"reservation_id\":44,\"reservation_type_id\":2,\"room_id\":38,\"room_type_id\":13,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":8,\"check_in_date\":\"2025-09-11\",\"check_out_date\":\"2025-09-12\",\"checkout_datetime\":null,\"reservation_status_id\":2,\"total_amount\":\"10000.00\",\"created_at\":\"2025-09-12 09:37:43\",\"updated_at\":\"2025-09-12 09:48:56\",\"advance_payment\":\"5000.00\",\"guest_count\":2,\"companion_count\":1,\"special_requests\":\"\",\"current_room_status\":3}', '{\"reservation_id\":44,\"reservation_status_id\":3}', 'Reservation updated by front desk staff', '::1'),
(111, 40, 'status_changed', '2025-09-12 01:49:25', 2, 'front_desk', '{\"reservation_id\":40,\"reservation_type_id\":2,\"room_id\":28,\"room_type_id\":7,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":8,\"check_in_date\":\"2025-09-07\",\"check_out_date\":\"2025-09-08\",\"checkout_datetime\":\"2025-09-08 12:00:00\",\"reservation_status_id\":2,\"total_amount\":\"6490.00\",\"created_at\":\"2025-09-07 16:35:05\",\"updated_at\":\"2025-09-10 18:37:07\",\"advance_payment\":\"2840.00\",\"guest_count\":1,\"companion_count\":0,\"special_requests\":\"\",\"current_room_status\":3}', '{\"reservation_id\":40,\"reservation_status_id\":3}', 'Reservation updated by front desk staff', '::1'),
(112, 42, 'service_request_updated', '2025-09-12 01:49:59', 2, 'front_desk', NULL, '{\"request_id\":70,\"status_id\":\"2\",\"assigned_to\":\"2\"}', '', '::1'),
(113, 45, 'room_assigned', '2025-09-12 02:03:30', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":41}', 'Room 41 assigned to reservation by front desk staff', '::1'),
(114, 45, 'status_changed', '2025-09-12 02:04:07', 2, 'front_desk', '{\"reservation_id\":45,\"reservation_type_id\":2,\"room_id\":41,\"room_type_id\":14,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":9,\"check_in_date\":\"2025-09-17\",\"check_out_date\":\"2025-09-18\",\"checkout_datetime\":null,\"reservation_status_id\":2,\"total_amount\":\"1470.00\",\"created_at\":\"2025-09-12 10:02:02\",\"updated_at\":\"2025-09-12 10:03:30\",\"advance_payment\":\"337.50\",\"guest_count\":2,\"companion_count\":1,\"special_requests\":\"\",\"current_room_status\":3}', '{\"reservation_id\":45,\"reservation_status_id\":3}', 'Reservation updated by front desk staff', '::1'),
(115, 46, 'room_assigned', '2025-09-12 02:37:24', 2, 'front_desk', '{\"room_id\":null}', '{\"room_id\":2}', 'Room 2 assigned to reservation by front desk staff', '::1'),
(116, 46, 'status_changed', '2025-09-12 02:38:46', 2, 'front_desk', '{\"reservation_id\":46,\"reservation_type_id\":2,\"room_id\":2,\"room_type_id\":2,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":8,\"check_in_date\":\"2025-09-12\",\"check_out_date\":\"2025-09-13\",\"checkout_datetime\":null,\"reservation_status_id\":2,\"total_amount\":\"2500.00\",\"created_at\":\"2025-09-12 10:33:08\",\"updated_at\":\"2025-09-12 10:37:24\",\"advance_payment\":\"1250.00\",\"guest_count\":2,\"companion_count\":1,\"special_requests\":\"\",\"current_room_status\":3}', '{\"reservation_id\":46,\"reservation_status_id\":3}', 'Reservation updated by front desk staff', '::1'),
(117, 47, 'rooms_assigned', '2025-09-16 03:13:31', 2, 'front_desk', NULL, '[{\"person_id\":\"customer-8\",\"room_id\":\"2\"},{\"person_id\":\"companion-7\",\"room_id\":\"10\"}]', 'All rooms assigned. Reservation is now Confirmed.', '::1'),
(118, 48, 'rooms_assigned', '2025-09-16 03:30:07', 2, 'front_desk', NULL, '[{\"person_id\":\"customer-8\",\"room_id\":\"13\"},{\"person_id\":\"companion-8\",\"room_id\":\"21\"}]', 'All rooms assigned. Reservation is now Confirmed.', '::1'),
(119, 47, 'status_changed', '2025-09-16 03:40:24', 2, 'front_desk', '{\"reservation_id\":47,\"reservation_type_id\":2,\"room_id\":null,\"room_type_id\":null,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":8,\"check_in_date\":\"2025-09-14\",\"check_out_date\":\"2025-09-15\",\"checkout_datetime\":null,\"reservation_status_id\":2,\"total_amount\":\"7000.00\",\"created_at\":\"2025-09-14 10:14:41\",\"updated_at\":\"2025-09-16 11:13:31\",\"advance_payment\":\"1400.00\",\"guest_count\":2,\"companion_count\":1,\"special_requests\":\"\",\"current_room_status\":null}', '{\"reservation_id\":47,\"reservation_status_id\":3}', 'Reservation updated by front desk staff', '::1'),
(120, 48, 'service_request_updated', '2025-09-16 04:30:10', 2, 'front_desk', NULL, '{\"request_id\":82,\"status_id\":\"2\",\"assigned_to\":\"2\"}', '', '::1'),
(121, 50, 'rooms_assigned', '2025-09-16 09:41:25', 2, 'front_desk', NULL, '[{\"person_id\":\"customer-22\",\"room_id\":\"22\",\"room_number\":\"502\"},{\"person_id\":\"companion-10\",\"room_id\":\"21\",\"room_number\":\"501\"}]', 'All rooms assigned. Reservation is now Confirmed.', '::1'),
(122, 51, 'rooms_assigned', '2025-09-18 23:28:03', 2, 'front_desk', NULL, '[{\"person_id\":\"customer-18\",\"room_id\":\"2\",\"room_number\":\"102\"},{\"person_id\":\"companion-11\",\"room_id\":\"37\",\"room_number\":\"1004\"}]', 'All rooms assigned. Reservation is now Confirmed.', '::1'),
(123, 51, 'service_request_updated', '2025-09-18 23:29:53', 2, 'front_desk', NULL, '{\"request_id\":85,\"status_id\":\"2\",\"assigned_to\":\"11\"}', '', '::1'),
(124, 51, 'service_request_updated', '2025-09-18 23:30:21', 2, 'front_desk', NULL, '{\"request_id\":86,\"status_id\":\"2\",\"assigned_to\":\"11\"}', '', '::1'),
(125, 51, 'service_request_updated', '2025-09-20 09:53:35', 2, 'front_desk', NULL, '{\"request_id\":87,\"status_id\":\"2\",\"assigned_to\":\"11\"}', '', '::1'),
(126, 49, 'amount_updated', '2025-10-03 11:28:05', 2, 'front_desk', '{\"reservation_id\":49,\"reservation_type_id\":2,\"room_id\":null,\"room_type_id\":null,\"booking_type\":\"room_type\",\"room_assignment_pending\":1,\"customer_id\":6,\"check_in_date\":\"2025-09-14\",\"check_out_date\":\"2025-09-15\",\"checkout_datetime\":null,\"reservation_status_id\":2,\"total_amount\":\"8120.00\",\"created_at\":\"2025-09-14 19:14:39\",\"updated_at\":\"2025-09-14 19:14:39\",\"advance_payment\":\"2030.00\",\"guest_count\":2,\"companion_count\":1,\"special_requests\":\"\",\"current_room_status\":null}', '{\"first_name\":\"Shankai\",\"last_name\":\"Bai\",\"email\":\"shangkaibai@hotel.com\",\"phone_number\":\"09354623235\",\"check_in_date\":\"2025-10-03\",\"check_out_date\":\"2025-10-04\",\"checkin_time\":\"15:00:00\",\"checkout_datetime\":\"2025-10-04 12:00:00\",\"guest_count\":1,\"special_requests\":null,\"total_amount\":4000,\"advance_payment\":2029.99,\"payment_method_id\":1,\"reference_number\":null,\"companions\":[{\"first_name\":\"dad\",\"last_name\":\"dads\",\"relationship\":\"Family\",\"age_group\":\"Adult\",\"gender\":\"Male\",\"date_of_birth\":\"2025-09-14\",\"contact_number\":\"54436363436\",\"special_needs\":null}],\"services\":[],\"menu_items\":[],\"room_types\":[{\"room_type_id\":1,\"quantity\":1},{\"room_type_id\":2,\"quantity\":1}],\"room_assignment_pending\":1,\"reservation_status_id\":1,\"booking_type\":\"room_type\",\"reservation_id\":49}', 'Reservation updated by front desk staff', '::1'),
(127, 49, 'rooms_assigned', '2025-10-03 11:28:19', 2, 'front_desk', NULL, '[{\"person_id\":\"customer-6\",\"room_id\":\"24\",\"room_number\":\"504\",\"type_name\":\"Double Room\"},{\"person_id\":\"companion-12\",\"room_id\":\"21\",\"room_number\":\"501\",\"type_name\":\"Family Room\"}]', 'All rooms assigned. Reservation is now Confirmed.', '::1'),
(128, 49, 'service_request_updated', '2025-10-03 12:21:03', 2, 'front_desk', NULL, '{\"request_id\":88,\"status_id\":\"2\",\"assigned_to\":\"2\"}', '', '::1'),
(129, 34, 'status_changed', '2025-10-03 12:34:38', 2, 'front_desk', '{\"reservation_id\":34,\"reservation_type_id\":2,\"room_id\":34,\"room_type_id\":7,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":18,\"check_in_date\":\"2025-08-30\",\"check_out_date\":\"2025-08-31\",\"checkout_datetime\":\"2025-08-31 12:00:00\",\"reservation_status_id\":1,\"total_amount\":\"5020.00\",\"created_at\":\"2025-08-31 07:59:02\",\"updated_at\":\"2025-08-31 08:23:51\",\"advance_payment\":\"2405.00\",\"guest_count\":1,\"companion_count\":0,\"special_requests\":\"\",\"current_room_status\":3}', '{\"reservation_id\":34,\"reservation_status_id\":2}', 'Reservation updated by front desk staff', '::1'),
(130, 35, 'status_changed', '2025-10-03 12:34:43', 2, 'front_desk', '{\"reservation_id\":35,\"reservation_type_id\":1,\"room_id\":15,\"room_type_id\":null,\"booking_type\":\"specific_room\",\"room_assignment_pending\":0,\"customer_id\":19,\"check_in_date\":\"2025-08-31\",\"check_out_date\":\"2025-09-01\",\"checkout_datetime\":\"2025-09-01 13:00:00\",\"reservation_status_id\":1,\"total_amount\":\"6150.00\",\"created_at\":\"2025-08-31 08:11:35\",\"updated_at\":\"2025-08-31 08:11:35\",\"advance_payment\":\"2640.00\",\"guest_count\":3,\"companion_count\":0,\"special_requests\":null,\"current_room_status\":1}', '{\"reservation_id\":35,\"reservation_status_id\":2}', 'Reservation updated by front desk staff', '::1'),
(131, 36, 'status_changed', '2025-10-03 12:34:46', 2, 'front_desk', '{\"reservation_id\":36,\"reservation_type_id\":2,\"room_id\":17,\"room_type_id\":6,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":20,\"check_in_date\":\"2025-08-30\",\"check_out_date\":\"2025-08-31\",\"checkout_datetime\":\"2025-08-31 12:00:00\",\"reservation_status_id\":1,\"total_amount\":\"5530.00\",\"created_at\":\"2025-08-31 08:23:32\",\"updated_at\":\"2025-08-31 08:23:57\",\"advance_payment\":\"2350.00\",\"guest_count\":1,\"companion_count\":0,\"special_requests\":\"\",\"current_room_status\":3}', '{\"reservation_id\":36,\"reservation_status_id\":2}', 'Reservation updated by front desk staff', '::1'),
(132, 49, 'service_request_updated', '2025-10-04 01:48:41', 2, 'front_desk', NULL, '{\"request_id\":92,\"status_id\":\"2\",\"assigned_to\":\"14\"}', '', '::1'),
(133, 49, 'service_request_updated', '2025-10-14 10:35:42', 2, 'front_desk', NULL, '{\"request_id\":93,\"status_id\":\"2\",\"assigned_to\":\"11\"}', '', '::1'),
(134, 49, 'service_request_updated', '2025-10-14 10:36:05', 2, 'front_desk', NULL, '{\"request_id\":93,\"status_id\":\"3\",\"assigned_to\":\"11\"}', '', '::1'),
(135, 39, 'status_changed', '2025-10-14 10:38:52', 2, 'front_desk', '{\"reservation_id\":39,\"reservation_type_id\":2,\"room_id\":18,\"room_type_id\":7,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":8,\"check_in_date\":\"2025-09-05\",\"check_out_date\":\"2025-09-08\",\"checkout_datetime\":\"2025-09-08 12:00:00\",\"reservation_status_id\":3,\"total_amount\":\"13370.00\",\"created_at\":\"2025-09-05 11:17:08\",\"updated_at\":\"2025-09-05 11:35:07\",\"advance_payment\":\"2672.00\",\"guest_count\":1,\"companion_count\":0,\"special_requests\":\"sad\",\"current_room_status\":2}', '{\"reservation_id\":39,\"reservation_status_id\":4}', 'Reservation updated by front desk staff', '::1'),
(136, 52, 'rooms_assigned', '2025-10-14 10:44:20', 2, 'front_desk', NULL, '[{\"person_id\":\"customer-23\",\"room_id\":\"13\",\"room_number\":\"303\",\"type_name\":\"Double Room\"}]', 'All rooms assigned. Reservation is now Confirmed.', '::1'),
(137, 52, 'status_changed', '2025-10-14 10:44:48', 2, 'front_desk', '{\"reservation_id\":52,\"reservation_type_id\":1,\"room_id\":null,\"room_type_id\":null,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":23,\"check_in_date\":\"2025-10-14\",\"check_out_date\":\"2025-10-15\",\"checkout_datetime\":\"2025-10-15 12:00:00\",\"reservation_status_id\":2,\"total_amount\":\"6500.00\",\"created_at\":\"2025-10-14 18:44:08\",\"updated_at\":\"2025-10-14 18:44:20\",\"advance_payment\":\"1000.00\",\"guest_count\":1,\"companion_count\":0,\"special_requests\":null,\"current_room_status\":null}', '{\"reservation_id\":52,\"reservation_status_id\":3}', 'Reservation updated by front desk staff', '::1'),
(138, 56, 'rooms_assigned', '2025-10-17 00:17:49', 2, 'front_desk', NULL, '[{\"person_id\":\"customer-26\",\"room_id\":\"1\",\"room_number\":\"101\",\"type_name\":\"Double Room\"}]', 'All rooms assigned. Reservation is now Confirmed.', '::1'),
(139, 56, 'service_request_updated', '2025-10-17 00:19:28', 2, 'front_desk', NULL, '{\"request_id\":94,\"status_id\":\"2\",\"assigned_to\":\"2\"}', '', '::1'),
(140, 53, 'status_changed', '2025-10-17 00:23:43', 2, 'front_desk', '{\"reservation_id\":53,\"reservation_type_id\":2,\"room_id\":null,\"room_type_id\":null,\"booking_type\":\"room_type\",\"room_assignment_pending\":1,\"customer_id\":24,\"check_in_date\":\"2025-10-14\",\"check_out_date\":\"2025-10-15\",\"checkout_datetime\":null,\"reservation_status_id\":1,\"total_amount\":\"2500.00\",\"created_at\":\"2025-10-14 21:16:48\",\"updated_at\":\"2025-10-14 21:16:48\",\"advance_payment\":\"500.00\",\"guest_count\":1,\"companion_count\":0,\"special_requests\":\"\",\"current_room_status\":null}', '{\"reservation_id\":53,\"reservation_status_id\":5}', 'Reservation updated by front desk staff', '::1'),
(141, 56, 'service_request_updated', '2025-10-17 01:50:22', 2, 'front_desk', NULL, '{\"request_id\":94,\"status_id\":\"1\",\"assigned_to\":\"5\"}', '', '::1'),
(142, 56, 'service_request_updated', '2025-10-17 01:50:47', 2, 'front_desk', NULL, '{\"request_id\":95,\"status_id\":\"4\",\"assigned_to\":\"\"}', '', '::1'),
(143, 58, 'rooms_assigned', '2025-10-31 12:57:31', 2, 'front_desk', NULL, '[{\"person_id\":\"customer-8\",\"room_id\":\"33\",\"room_number\":\"1001\",\"type_name\":\"Universal Rooms\"},{\"person_id\":\"companion-14\",\"room_id\":\"36\",\"room_number\":\"1003\",\"type_name\":\"Galaxy Room\"}]', 'All rooms assigned. Reservation is now Confirmed.', '::1'),
(144, 58, 'status_changed', '2025-10-31 12:58:03', 2, 'front_desk', '{\"reservation_id\":58,\"reservation_type_id\":2,\"room_id\":null,\"room_type_id\":null,\"booking_type\":\"room_type\",\"room_assignment_pending\":0,\"customer_id\":8,\"check_in_date\":\"2025-10-31\",\"check_out_date\":\"2025-11-01\",\"checkout_datetime\":null,\"reservation_status_id\":2,\"total_amount\":\"11200.00\",\"created_at\":\"2025-10-31 20:56:10\",\"updated_at\":\"2025-10-31 20:57:31\",\"advance_payment\":\"2240.00\",\"guest_count\":2,\"companion_count\":1,\"special_requests\":\"\",\"current_room_status\":null}', '{\"reservation_id\":58,\"reservation_status_id\":3}', 'Reservation updated by front desk staff', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_status`
--

CREATE TABLE `reservation_status` (
  `reservation_status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_status`
--

INSERT INTO `reservation_status` (`reservation_status_id`, `status_name`) VALUES
(1, 'Pending'),
(2, 'Confirmed'),
(3, 'Checked-in'),
(4, 'Checked-out'),
(5, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_type`
--

CREATE TABLE `reservation_type` (
  `reservation_type_id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_type`
--

INSERT INTO `reservation_type` (`reservation_type_id`, `type_name`) VALUES
(1, 'Walk-in'),
(2, 'Online');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_number` varchar(10) NOT NULL,
  `room_type_id` int(11) NOT NULL,
  `room_status_id` int(11) NOT NULL,
  `floor_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_number`, `room_type_id`, `room_status_id`, `floor_number`) VALUES
(1, '101', 2, 3, 1),
(2, '102', 2, 3, 1),
(3, '103', 3, 3, 1),
(5, '105', 5, 3, 1),
(7, '202', 7, 3, 2),
(8, '203', 8, 3, 2),
(9, '204', 9, 1, 2),
(10, '205', 10, 3, 2),
(11, '301', 11, 1, 3),
(12, '302', 1, 1, 3),
(13, '303', 2, 3, 3),
(14, '304', 3, 2, 3),
(15, '305', 4, 3, 3),
(16, '401', 5, 1, 4),
(17, '402', 6, 3, 4),
(18, '403', 7, 4, 4),
(19, '404', 8, 3, 4),
(20, '405', 9, 1, 4),
(21, '501', 10, 3, 5),
(22, '502', 11, 3, 5),
(23, '503', 1, 1, 5),
(24, '504', 2, 3, 5),
(25, '505', 3, 1, 5),
(27, '206', 11, 1, 2),
(28, '601', 7, 2, 6),
(29, '602', 7, 2, 6),
(30, '603', 7, 3, 6),
(31, '604', 7, 3, 6),
(32, '605', 7, 3, 6),
(33, '1001', 12, 3, 10),
(34, '210', 7, 3, 2),
(35, '1002', 12, 2, 10),
(36, '1003', 13, 3, 10),
(37, '1004', 13, 3, 10),
(38, '1005', 13, 2, 10),
(39, '1006', 13, 1, 10),
(41, '1010', 14, 2, 10),
(42, '104', 2, 1, 1),
(44, '903', 12, 1, 9),
(45, '905', 12, 1, 9),
(46, '907', 12, 1, 9),
(47, '909', 12, 1, 9),
(48, '901', 12, 1, 9),
(50, '201', 6, 1, 2),
(51, '507', 12, 1, 5),
(52, '509', 12, 1, 5),
(55, '106', 10, 1, 1),
(56, '902', 3, 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `room_amenities`
--

CREATE TABLE `room_amenities` (
  `amenity_id` int(11) NOT NULL,
  `amenity_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_amenities`
--

INSERT INTO `room_amenities` (`amenity_id`, `amenity_name`, `description`, `icon`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Wi-Fi', 'Free high-speed wireless internet', 'fas fa-wifi', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(2, 'Air Conditioning', 'Climate controlled room temperature', 'fas fa-snowflake', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(3, 'Television', 'Flat screen TV with cable channels', 'fas fa-tv', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(4, 'Mini Bar', 'In-room refrigerated mini bar', 'fas fa-glass-martini', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(5, 'Safe', 'Electronic in-room safe', 'fas fa-lock', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(6, 'Balcony', 'Private balcony with view', 'fas fa-door-open', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(7, 'Bathtub', 'Private bathroom with bathtub', 'fas fa-bath', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(8, 'Shower', 'Private bathroom with shower', 'fas fa-shower', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(9, 'Hair Dryer', 'Complimentary hair dryer', 'fas fa-wind', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(10, 'Iron & Ironing Board', 'In-room ironing facilities', 'fas fa-tshirt', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(11, 'Coffee Maker', 'In-room coffee and tea making facilities', 'fas fa-coffee', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(12, 'Room Service', '24-hour room service available', 'fas fa-concierge-bell', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(13, 'Desk & Chair', 'Work desk with ergonomic chair', 'fas fa-chair', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(14, 'Wardrobe', 'Built-in wardrobe with hangers', 'fas fa-tshirt', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(15, 'Telephone', 'Direct dial telephone', 'fas fa-phone', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(16, 'Blackout Curtains', 'Light blocking window treatments', 'fas fa-moon', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(17, 'Wake-up Service', 'Complimentary wake-up call service', 'fas fa-alarm-clock', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(18, 'Daily Housekeeping', 'Daily room cleaning service', 'fas fa-broom', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(19, 'Towels & Linens', 'Fresh towels and bed linens', 'fas fa-bed', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58'),
(20, 'Complimentary Toiletries', 'Basic bathroom amenities provided', 'fas fa-soap', 1, '2025-08-15 23:53:58', '2025-08-15 23:53:58');

-- --------------------------------------------------------

--
-- Table structure for table `room_amenities_mapping`
--

CREATE TABLE `room_amenities_mapping` (
  `mapping_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `amenity_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_amenities_mapping`
--

INSERT INTO `room_amenities_mapping` (`mapping_id`, `room_id`, `amenity_id`, `created_at`) VALUES
(2, 18, 2, '2025-08-15 23:53:58'),
(7, 32, 2, '2025-08-15 23:53:58'),
(8, 8, 2, '2025-08-15 23:53:58'),
(9, 19, 2, '2025-08-15 23:53:58'),
(11, 20, 2, '2025-08-15 23:53:58'),
(13, 22, 2, '2025-08-15 23:53:58'),
(14, 27, 2, '2025-08-15 23:53:58'),
(16, 18, 6, '2025-08-15 23:53:58'),
(21, 32, 6, '2025-08-15 23:53:58'),
(22, 8, 6, '2025-08-15 23:53:58'),
(23, 19, 6, '2025-08-15 23:53:58'),
(25, 20, 6, '2025-08-15 23:53:58'),
(27, 22, 6, '2025-08-15 23:53:58'),
(28, 27, 6, '2025-08-15 23:53:58'),
(30, 18, 7, '2025-08-15 23:53:58'),
(35, 32, 7, '2025-08-15 23:53:58'),
(36, 8, 7, '2025-08-15 23:53:58'),
(37, 19, 7, '2025-08-15 23:53:58'),
(39, 20, 7, '2025-08-15 23:53:58'),
(41, 22, 7, '2025-08-15 23:53:58'),
(42, 27, 7, '2025-08-15 23:53:58'),
(44, 18, 16, '2025-08-15 23:53:58'),
(49, 32, 16, '2025-08-15 23:53:58'),
(50, 8, 16, '2025-08-15 23:53:58'),
(51, 19, 16, '2025-08-15 23:53:58'),
(53, 20, 16, '2025-08-15 23:53:58'),
(55, 22, 16, '2025-08-15 23:53:58'),
(56, 27, 16, '2025-08-15 23:53:58'),
(58, 18, 11, '2025-08-15 23:53:58'),
(63, 32, 11, '2025-08-15 23:53:58'),
(64, 8, 11, '2025-08-15 23:53:58'),
(65, 19, 11, '2025-08-15 23:53:58'),
(67, 20, 11, '2025-08-15 23:53:58'),
(69, 22, 11, '2025-08-15 23:53:58'),
(70, 27, 11, '2025-08-15 23:53:58'),
(72, 18, 20, '2025-08-15 23:53:58'),
(77, 32, 20, '2025-08-15 23:53:58'),
(78, 8, 20, '2025-08-15 23:53:58'),
(79, 19, 20, '2025-08-15 23:53:58'),
(81, 20, 20, '2025-08-15 23:53:58'),
(83, 22, 20, '2025-08-15 23:53:58'),
(84, 27, 20, '2025-08-15 23:53:58'),
(86, 18, 18, '2025-08-15 23:53:58'),
(91, 32, 18, '2025-08-15 23:53:58'),
(92, 8, 18, '2025-08-15 23:53:58'),
(93, 19, 18, '2025-08-15 23:53:58'),
(95, 20, 18, '2025-08-15 23:53:58'),
(97, 22, 18, '2025-08-15 23:53:58'),
(98, 27, 18, '2025-08-15 23:53:58'),
(100, 18, 13, '2025-08-15 23:53:58'),
(105, 32, 13, '2025-08-15 23:53:58'),
(106, 8, 13, '2025-08-15 23:53:58'),
(107, 19, 13, '2025-08-15 23:53:58'),
(109, 20, 13, '2025-08-15 23:53:58'),
(111, 22, 13, '2025-08-15 23:53:58'),
(112, 27, 13, '2025-08-15 23:53:58'),
(114, 18, 9, '2025-08-15 23:53:58'),
(119, 32, 9, '2025-08-15 23:53:58'),
(120, 8, 9, '2025-08-15 23:53:58'),
(121, 19, 9, '2025-08-15 23:53:58'),
(123, 20, 9, '2025-08-15 23:53:58'),
(125, 22, 9, '2025-08-15 23:53:58'),
(126, 27, 9, '2025-08-15 23:53:58'),
(128, 18, 10, '2025-08-15 23:53:58'),
(133, 32, 10, '2025-08-15 23:53:58'),
(134, 8, 10, '2025-08-15 23:53:58'),
(135, 19, 10, '2025-08-15 23:53:58'),
(137, 20, 10, '2025-08-15 23:53:58'),
(139, 22, 10, '2025-08-15 23:53:58'),
(140, 27, 10, '2025-08-15 23:53:58'),
(142, 18, 4, '2025-08-15 23:53:58'),
(147, 32, 4, '2025-08-15 23:53:58'),
(148, 8, 4, '2025-08-15 23:53:58'),
(149, 19, 4, '2025-08-15 23:53:58'),
(151, 20, 4, '2025-08-15 23:53:58'),
(153, 22, 4, '2025-08-15 23:53:58'),
(154, 27, 4, '2025-08-15 23:53:58'),
(156, 18, 12, '2025-08-15 23:53:58'),
(161, 32, 12, '2025-08-15 23:53:58'),
(162, 8, 12, '2025-08-15 23:53:58'),
(163, 19, 12, '2025-08-15 23:53:58'),
(165, 20, 12, '2025-08-15 23:53:58'),
(167, 22, 12, '2025-08-15 23:53:58'),
(168, 27, 12, '2025-08-15 23:53:58'),
(170, 18, 5, '2025-08-15 23:53:58'),
(175, 32, 5, '2025-08-15 23:53:58'),
(176, 8, 5, '2025-08-15 23:53:58'),
(177, 19, 5, '2025-08-15 23:53:58'),
(179, 20, 5, '2025-08-15 23:53:58'),
(181, 22, 5, '2025-08-15 23:53:58'),
(182, 27, 5, '2025-08-15 23:53:58'),
(184, 18, 8, '2025-08-15 23:53:58'),
(189, 32, 8, '2025-08-15 23:53:58'),
(190, 8, 8, '2025-08-15 23:53:58'),
(191, 19, 8, '2025-08-15 23:53:58'),
(193, 20, 8, '2025-08-15 23:53:58'),
(195, 22, 8, '2025-08-15 23:53:58'),
(196, 27, 8, '2025-08-15 23:53:58'),
(198, 18, 15, '2025-08-15 23:53:58'),
(203, 32, 15, '2025-08-15 23:53:58'),
(204, 8, 15, '2025-08-15 23:53:58'),
(205, 19, 15, '2025-08-15 23:53:58'),
(207, 20, 15, '2025-08-15 23:53:58'),
(209, 22, 15, '2025-08-15 23:53:58'),
(210, 27, 15, '2025-08-15 23:53:58'),
(212, 18, 3, '2025-08-15 23:53:58'),
(217, 32, 3, '2025-08-15 23:53:58'),
(218, 8, 3, '2025-08-15 23:53:58'),
(219, 19, 3, '2025-08-15 23:53:58'),
(221, 20, 3, '2025-08-15 23:53:58'),
(223, 22, 3, '2025-08-15 23:53:58'),
(224, 27, 3, '2025-08-15 23:53:58'),
(226, 18, 19, '2025-08-15 23:53:58'),
(231, 32, 19, '2025-08-15 23:53:58'),
(232, 8, 19, '2025-08-15 23:53:58'),
(233, 19, 19, '2025-08-15 23:53:58'),
(235, 20, 19, '2025-08-15 23:53:58'),
(237, 22, 19, '2025-08-15 23:53:58'),
(238, 27, 19, '2025-08-15 23:53:58'),
(240, 18, 17, '2025-08-15 23:53:58'),
(245, 32, 17, '2025-08-15 23:53:58'),
(246, 8, 17, '2025-08-15 23:53:58'),
(247, 19, 17, '2025-08-15 23:53:58'),
(249, 20, 17, '2025-08-15 23:53:58'),
(251, 22, 17, '2025-08-15 23:53:58'),
(252, 27, 17, '2025-08-15 23:53:58'),
(254, 18, 14, '2025-08-15 23:53:58'),
(259, 32, 14, '2025-08-15 23:53:58'),
(260, 8, 14, '2025-08-15 23:53:58'),
(261, 19, 14, '2025-08-15 23:53:58'),
(263, 20, 14, '2025-08-15 23:53:58'),
(265, 22, 14, '2025-08-15 23:53:58'),
(266, 27, 14, '2025-08-15 23:53:58'),
(268, 18, 1, '2025-08-15 23:53:58'),
(273, 32, 1, '2025-08-15 23:53:58'),
(274, 8, 1, '2025-08-15 23:53:58'),
(275, 19, 1, '2025-08-15 23:53:58'),
(277, 20, 1, '2025-08-15 23:53:58'),
(279, 22, 1, '2025-08-15 23:53:58'),
(280, 27, 1, '2025-08-15 23:53:58'),
(512, 5, 2, '2025-08-15 23:53:58'),
(513, 16, 2, '2025-08-15 23:53:58'),
(515, 17, 2, '2025-08-15 23:53:58'),
(518, 5, 7, '2025-08-15 23:53:58'),
(519, 16, 7, '2025-08-15 23:53:58'),
(521, 17, 7, '2025-08-15 23:53:58'),
(524, 5, 16, '2025-08-15 23:53:58'),
(525, 16, 16, '2025-08-15 23:53:58'),
(527, 17, 16, '2025-08-15 23:53:58'),
(530, 5, 11, '2025-08-15 23:53:58'),
(531, 16, 11, '2025-08-15 23:53:58'),
(533, 17, 11, '2025-08-15 23:53:58'),
(536, 5, 20, '2025-08-15 23:53:58'),
(537, 16, 20, '2025-08-15 23:53:58'),
(539, 17, 20, '2025-08-15 23:53:58'),
(542, 5, 18, '2025-08-15 23:53:58'),
(543, 16, 18, '2025-08-15 23:53:58'),
(545, 17, 18, '2025-08-15 23:53:58'),
(548, 5, 13, '2025-08-15 23:53:58'),
(549, 16, 13, '2025-08-15 23:53:58'),
(551, 17, 13, '2025-08-15 23:53:58'),
(554, 5, 9, '2025-08-15 23:53:58'),
(555, 16, 9, '2025-08-15 23:53:58'),
(557, 17, 9, '2025-08-15 23:53:58'),
(560, 5, 10, '2025-08-15 23:53:58'),
(561, 16, 10, '2025-08-15 23:53:58'),
(563, 17, 10, '2025-08-15 23:53:58'),
(566, 5, 12, '2025-08-15 23:53:58'),
(567, 16, 12, '2025-08-15 23:53:58'),
(569, 17, 12, '2025-08-15 23:53:58'),
(572, 5, 5, '2025-08-15 23:53:58'),
(573, 16, 5, '2025-08-15 23:53:58'),
(575, 17, 5, '2025-08-15 23:53:58'),
(578, 5, 8, '2025-08-15 23:53:58'),
(579, 16, 8, '2025-08-15 23:53:58'),
(581, 17, 8, '2025-08-15 23:53:58'),
(584, 5, 15, '2025-08-15 23:53:58'),
(585, 16, 15, '2025-08-15 23:53:58'),
(587, 17, 15, '2025-08-15 23:53:58'),
(590, 5, 3, '2025-08-15 23:53:58'),
(591, 16, 3, '2025-08-15 23:53:58'),
(593, 17, 3, '2025-08-15 23:53:58'),
(596, 5, 19, '2025-08-15 23:53:58'),
(597, 16, 19, '2025-08-15 23:53:58'),
(599, 17, 19, '2025-08-15 23:53:58'),
(602, 5, 17, '2025-08-15 23:53:58'),
(603, 16, 17, '2025-08-15 23:53:58'),
(605, 17, 17, '2025-08-15 23:53:58'),
(608, 5, 14, '2025-08-15 23:53:58'),
(609, 16, 14, '2025-08-15 23:53:58'),
(611, 17, 14, '2025-08-15 23:53:58'),
(614, 5, 1, '2025-08-15 23:53:58'),
(615, 16, 1, '2025-08-15 23:53:58'),
(617, 17, 1, '2025-08-15 23:53:58'),
(640, 13, 2, '2025-08-15 23:53:58'),
(641, 24, 2, '2025-08-15 23:53:58'),
(643, 3, 2, '2025-08-15 23:53:58'),
(644, 14, 2, '2025-08-15 23:53:58'),
(647, 15, 2, '2025-08-15 23:53:58'),
(649, 13, 20, '2025-08-15 23:53:58'),
(650, 24, 20, '2025-08-15 23:53:58'),
(652, 3, 20, '2025-08-15 23:53:58'),
(653, 14, 20, '2025-08-15 23:53:58'),
(656, 15, 20, '2025-08-15 23:53:58'),
(658, 13, 18, '2025-08-15 23:53:58'),
(659, 24, 18, '2025-08-15 23:53:58'),
(661, 3, 18, '2025-08-15 23:53:58'),
(662, 14, 18, '2025-08-15 23:53:58'),
(665, 15, 18, '2025-08-15 23:53:58'),
(667, 13, 13, '2025-08-15 23:53:58'),
(668, 24, 13, '2025-08-15 23:53:58'),
(670, 3, 13, '2025-08-15 23:53:58'),
(671, 14, 13, '2025-08-15 23:53:58'),
(674, 15, 13, '2025-08-15 23:53:58'),
(676, 13, 9, '2025-08-15 23:53:58'),
(677, 24, 9, '2025-08-15 23:53:58'),
(679, 3, 9, '2025-08-15 23:53:58'),
(680, 14, 9, '2025-08-15 23:53:58'),
(683, 15, 9, '2025-08-15 23:53:58'),
(685, 13, 5, '2025-08-15 23:53:58'),
(686, 24, 5, '2025-08-15 23:53:58'),
(688, 3, 5, '2025-08-15 23:53:58'),
(689, 14, 5, '2025-08-15 23:53:58'),
(692, 15, 5, '2025-08-15 23:53:58'),
(694, 13, 8, '2025-08-15 23:53:58'),
(695, 24, 8, '2025-08-15 23:53:58'),
(697, 3, 8, '2025-08-15 23:53:58'),
(698, 14, 8, '2025-08-15 23:53:58'),
(701, 15, 8, '2025-08-15 23:53:58'),
(703, 13, 15, '2025-08-15 23:53:58'),
(704, 24, 15, '2025-08-15 23:53:58'),
(706, 3, 15, '2025-08-15 23:53:58'),
(707, 14, 15, '2025-08-15 23:53:58'),
(710, 15, 15, '2025-08-15 23:53:58'),
(712, 13, 3, '2025-08-15 23:53:58'),
(713, 24, 3, '2025-08-15 23:53:58'),
(715, 3, 3, '2025-08-15 23:53:58'),
(716, 14, 3, '2025-08-15 23:53:58'),
(719, 15, 3, '2025-08-15 23:53:58'),
(721, 13, 19, '2025-08-15 23:53:58'),
(722, 24, 19, '2025-08-15 23:53:58'),
(724, 3, 19, '2025-08-15 23:53:58'),
(725, 14, 19, '2025-08-15 23:53:58'),
(728, 15, 19, '2025-08-15 23:53:58'),
(730, 13, 14, '2025-08-15 23:53:58'),
(731, 24, 14, '2025-08-15 23:53:58'),
(733, 3, 14, '2025-08-15 23:53:58'),
(734, 14, 14, '2025-08-15 23:53:58'),
(737, 15, 14, '2025-08-15 23:53:58'),
(739, 13, 1, '2025-08-15 23:53:58'),
(740, 24, 1, '2025-08-15 23:53:58'),
(742, 3, 1, '2025-08-15 23:53:58'),
(743, 14, 1, '2025-08-15 23:53:58'),
(746, 15, 1, '2025-08-15 23:53:58'),
(767, 12, 2, '2025-08-15 23:53:58'),
(768, 23, 2, '2025-08-15 23:53:58'),
(770, 12, 20, '2025-08-15 23:53:58'),
(771, 23, 20, '2025-08-15 23:53:58'),
(773, 12, 18, '2025-08-15 23:53:58'),
(774, 23, 18, '2025-08-15 23:53:58'),
(776, 12, 13, '2025-08-15 23:53:58'),
(777, 23, 13, '2025-08-15 23:53:58'),
(779, 12, 8, '2025-08-15 23:53:58'),
(780, 23, 8, '2025-08-15 23:53:58'),
(782, 12, 15, '2025-08-15 23:53:58'),
(783, 23, 15, '2025-08-15 23:53:58'),
(785, 12, 3, '2025-08-15 23:53:58'),
(786, 23, 3, '2025-08-15 23:53:58'),
(788, 12, 19, '2025-08-15 23:53:58'),
(789, 23, 19, '2025-08-15 23:53:58'),
(791, 12, 14, '2025-08-15 23:53:58'),
(792, 23, 14, '2025-08-15 23:53:58'),
(794, 12, 1, '2025-08-15 23:53:58'),
(795, 23, 1, '2025-08-15 23:53:58'),
(966, 7, 2, '2025-08-24 02:00:26'),
(967, 7, 6, '2025-08-24 02:00:26'),
(968, 7, 7, '2025-08-24 02:00:26'),
(969, 7, 16, '2025-08-24 02:00:26'),
(970, 7, 11, '2025-08-24 02:00:26'),
(971, 7, 20, '2025-08-24 02:00:26'),
(972, 7, 18, '2025-08-24 02:00:26'),
(973, 7, 13, '2025-08-24 02:00:26'),
(974, 7, 9, '2025-08-24 02:00:26'),
(975, 7, 10, '2025-08-24 02:00:26'),
(976, 7, 4, '2025-08-24 02:00:26'),
(977, 7, 12, '2025-08-24 02:00:26'),
(978, 7, 5, '2025-08-24 02:00:26'),
(979, 7, 8, '2025-08-24 02:00:26'),
(980, 7, 15, '2025-08-24 02:00:26'),
(981, 7, 3, '2025-08-24 02:00:26'),
(982, 7, 19, '2025-08-24 02:00:26'),
(983, 7, 17, '2025-08-24 02:00:26'),
(984, 7, 14, '2025-08-24 02:00:26'),
(985, 7, 1, '2025-08-24 02:00:26'),
(986, 9, 2, '2025-08-24 02:00:30'),
(987, 9, 6, '2025-08-24 02:00:30'),
(988, 9, 7, '2025-08-24 02:00:30'),
(989, 9, 16, '2025-08-24 02:00:30'),
(990, 9, 11, '2025-08-24 02:00:30'),
(991, 9, 20, '2025-08-24 02:00:30'),
(992, 9, 18, '2025-08-24 02:00:30'),
(993, 9, 13, '2025-08-24 02:00:30'),
(994, 9, 9, '2025-08-24 02:00:30'),
(995, 9, 10, '2025-08-24 02:00:30'),
(996, 9, 4, '2025-08-24 02:00:30'),
(997, 9, 12, '2025-08-24 02:00:30'),
(998, 9, 5, '2025-08-24 02:00:30'),
(999, 9, 8, '2025-08-24 02:00:30'),
(1000, 9, 15, '2025-08-24 02:00:30'),
(1001, 9, 3, '2025-08-24 02:00:30'),
(1002, 9, 19, '2025-08-24 02:00:30'),
(1003, 9, 17, '2025-08-24 02:00:30'),
(1004, 9, 14, '2025-08-24 02:00:30'),
(1005, 9, 1, '2025-08-24 02:00:30'),
(1006, 10, 2, '2025-08-24 02:00:35'),
(1007, 10, 7, '2025-08-24 02:00:35'),
(1008, 10, 16, '2025-08-24 02:00:35'),
(1009, 10, 11, '2025-08-24 02:00:35'),
(1010, 10, 20, '2025-08-24 02:00:35'),
(1011, 10, 18, '2025-08-24 02:00:35'),
(1012, 10, 13, '2025-08-24 02:00:35'),
(1013, 10, 9, '2025-08-24 02:00:35'),
(1014, 10, 10, '2025-08-24 02:00:35'),
(1015, 10, 12, '2025-08-24 02:00:35'),
(1016, 10, 5, '2025-08-24 02:00:35'),
(1017, 10, 8, '2025-08-24 02:00:35'),
(1018, 10, 15, '2025-08-24 02:00:35'),
(1019, 10, 3, '2025-08-24 02:00:35'),
(1020, 10, 19, '2025-08-24 02:00:35'),
(1021, 10, 17, '2025-08-24 02:00:35'),
(1022, 10, 14, '2025-08-24 02:00:35'),
(1023, 10, 1, '2025-08-24 02:00:35'),
(1024, 34, 2, '2025-08-24 02:00:41'),
(1025, 34, 20, '2025-08-24 02:00:41'),
(1026, 25, 2, '2025-08-24 02:01:08'),
(1027, 25, 20, '2025-08-24 02:01:08'),
(1028, 25, 18, '2025-08-24 02:01:08'),
(1029, 25, 13, '2025-08-24 02:01:08'),
(1030, 25, 9, '2025-08-24 02:01:08'),
(1031, 25, 5, '2025-08-24 02:01:08'),
(1032, 25, 8, '2025-08-24 02:01:08'),
(1033, 25, 15, '2025-08-24 02:01:08'),
(1034, 25, 3, '2025-08-24 02:01:08'),
(1035, 25, 19, '2025-08-24 02:01:08'),
(1036, 25, 14, '2025-08-24 02:01:08'),
(1037, 25, 1, '2025-08-24 02:01:08'),
(1038, 28, 2, '2025-08-24 02:02:44'),
(1039, 28, 6, '2025-08-24 02:02:44'),
(1040, 28, 7, '2025-08-24 02:02:44'),
(1041, 28, 16, '2025-08-24 02:02:44'),
(1042, 28, 11, '2025-08-24 02:02:44'),
(1043, 28, 20, '2025-08-24 02:02:44'),
(1044, 28, 18, '2025-08-24 02:02:44'),
(1045, 28, 13, '2025-08-24 02:02:44'),
(1046, 28, 9, '2025-08-24 02:02:44'),
(1047, 28, 10, '2025-08-24 02:02:44'),
(1048, 28, 4, '2025-08-24 02:02:44'),
(1049, 28, 12, '2025-08-24 02:02:44'),
(1050, 28, 5, '2025-08-24 02:02:44'),
(1051, 28, 8, '2025-08-24 02:02:44'),
(1052, 28, 15, '2025-08-24 02:02:44'),
(1053, 28, 3, '2025-08-24 02:02:44'),
(1054, 28, 19, '2025-08-24 02:02:44'),
(1055, 28, 17, '2025-08-24 02:02:44'),
(1056, 28, 14, '2025-08-24 02:02:44'),
(1057, 28, 1, '2025-08-24 02:02:44'),
(1058, 29, 2, '2025-08-24 02:02:50'),
(1059, 29, 6, '2025-08-24 02:02:50'),
(1060, 29, 7, '2025-08-24 02:02:50'),
(1061, 29, 16, '2025-08-24 02:02:50'),
(1062, 29, 11, '2025-08-24 02:02:50'),
(1063, 29, 20, '2025-08-24 02:02:50'),
(1064, 29, 18, '2025-08-24 02:02:50'),
(1065, 29, 13, '2025-08-24 02:02:50'),
(1066, 29, 9, '2025-08-24 02:02:50'),
(1067, 29, 10, '2025-08-24 02:02:50'),
(1068, 29, 4, '2025-08-24 02:02:50'),
(1069, 29, 12, '2025-08-24 02:02:50'),
(1070, 29, 5, '2025-08-24 02:02:50'),
(1071, 29, 8, '2025-08-24 02:02:50'),
(1072, 29, 15, '2025-08-24 02:02:50'),
(1073, 29, 3, '2025-08-24 02:02:50'),
(1074, 29, 19, '2025-08-24 02:02:50'),
(1075, 29, 17, '2025-08-24 02:02:50'),
(1076, 29, 14, '2025-08-24 02:02:50'),
(1077, 29, 1, '2025-08-24 02:02:50'),
(1078, 30, 2, '2025-08-24 02:02:53'),
(1079, 30, 6, '2025-08-24 02:02:53'),
(1080, 30, 7, '2025-08-24 02:02:53'),
(1081, 30, 16, '2025-08-24 02:02:53'),
(1082, 30, 11, '2025-08-24 02:02:53'),
(1083, 30, 20, '2025-08-24 02:02:53'),
(1084, 30, 18, '2025-08-24 02:02:53'),
(1085, 30, 13, '2025-08-24 02:02:53'),
(1086, 30, 9, '2025-08-24 02:02:53'),
(1087, 30, 10, '2025-08-24 02:02:53'),
(1088, 30, 4, '2025-08-24 02:02:53'),
(1089, 30, 12, '2025-08-24 02:02:53'),
(1090, 30, 5, '2025-08-24 02:02:53'),
(1091, 30, 8, '2025-08-24 02:02:53'),
(1092, 30, 15, '2025-08-24 02:02:53'),
(1093, 30, 3, '2025-08-24 02:02:53'),
(1094, 30, 19, '2025-08-24 02:02:53'),
(1095, 30, 17, '2025-08-24 02:02:53'),
(1096, 30, 14, '2025-08-24 02:02:53'),
(1097, 30, 1, '2025-08-24 02:02:53'),
(1098, 31, 2, '2025-08-24 02:02:56'),
(1099, 31, 6, '2025-08-24 02:02:56'),
(1100, 31, 7, '2025-08-24 02:02:56'),
(1101, 31, 16, '2025-08-24 02:02:56'),
(1102, 31, 11, '2025-08-24 02:02:56'),
(1103, 31, 20, '2025-08-24 02:02:56'),
(1104, 31, 18, '2025-08-24 02:02:56'),
(1105, 31, 13, '2025-08-24 02:02:56'),
(1106, 31, 9, '2025-08-24 02:02:56'),
(1107, 31, 10, '2025-08-24 02:02:56'),
(1108, 31, 4, '2025-08-24 02:02:56'),
(1109, 31, 12, '2025-08-24 02:02:56'),
(1110, 31, 5, '2025-08-24 02:02:56'),
(1111, 31, 8, '2025-08-24 02:02:56'),
(1112, 31, 15, '2025-08-24 02:02:56'),
(1113, 31, 3, '2025-08-24 02:02:56'),
(1114, 31, 19, '2025-08-24 02:02:56'),
(1115, 31, 17, '2025-08-24 02:02:56'),
(1116, 31, 14, '2025-08-24 02:02:56'),
(1117, 31, 1, '2025-08-24 02:02:56'),
(1118, 33, 2, '2025-08-24 02:03:00'),
(1119, 33, 6, '2025-08-24 02:03:00'),
(1120, 33, 7, '2025-08-24 02:03:00'),
(1121, 33, 16, '2025-08-24 02:03:00'),
(1122, 33, 11, '2025-08-24 02:03:00'),
(1123, 33, 20, '2025-08-24 02:03:00'),
(1124, 33, 18, '2025-08-24 02:03:00'),
(1125, 33, 13, '2025-08-24 02:03:00'),
(1126, 33, 9, '2025-08-24 02:03:00'),
(1127, 33, 10, '2025-08-24 02:03:00'),
(1128, 33, 4, '2025-08-24 02:03:00'),
(1129, 33, 12, '2025-08-24 02:03:00'),
(1130, 33, 5, '2025-08-24 02:03:00'),
(1131, 33, 8, '2025-08-24 02:03:00'),
(1132, 33, 15, '2025-08-24 02:03:00'),
(1133, 33, 3, '2025-08-24 02:03:00'),
(1134, 33, 19, '2025-08-24 02:03:00'),
(1135, 33, 17, '2025-08-24 02:03:00'),
(1136, 33, 14, '2025-08-24 02:03:00'),
(1137, 33, 1, '2025-08-24 02:03:00'),
(1164, 11, 2, '2025-08-25 01:43:52'),
(1165, 11, 6, '2025-08-25 01:43:52'),
(1166, 11, 7, '2025-08-25 01:43:52'),
(1167, 11, 16, '2025-08-25 01:43:52'),
(1168, 11, 11, '2025-08-25 01:43:52'),
(1169, 11, 20, '2025-08-25 01:43:52'),
(1170, 11, 18, '2025-08-25 01:43:52'),
(1171, 11, 13, '2025-08-25 01:43:52'),
(1172, 11, 9, '2025-08-25 01:43:52'),
(1173, 11, 10, '2025-08-25 01:43:52'),
(1174, 11, 4, '2025-08-25 01:43:52'),
(1175, 11, 12, '2025-08-25 01:43:52'),
(1176, 11, 5, '2025-08-25 01:43:52'),
(1177, 11, 8, '2025-08-25 01:43:52'),
(1178, 11, 15, '2025-08-25 01:43:52'),
(1179, 11, 3, '2025-08-25 01:43:52'),
(1180, 11, 19, '2025-08-25 01:43:52'),
(1181, 11, 17, '2025-08-25 01:43:52'),
(1182, 11, 14, '2025-08-25 01:43:52'),
(1183, 11, 1, '2025-08-25 01:43:52'),
(1184, 21, 2, '2025-08-25 01:43:58'),
(1185, 21, 7, '2025-08-25 01:43:58'),
(1186, 21, 16, '2025-08-25 01:43:58'),
(1187, 21, 11, '2025-08-25 01:43:58'),
(1188, 21, 20, '2025-08-25 01:43:58'),
(1189, 21, 18, '2025-08-25 01:43:58'),
(1190, 21, 13, '2025-08-25 01:43:58'),
(1191, 21, 9, '2025-08-25 01:43:58'),
(1192, 21, 10, '2025-08-25 01:43:58'),
(1193, 21, 12, '2025-08-25 01:43:58'),
(1194, 21, 5, '2025-08-25 01:43:58'),
(1195, 21, 8, '2025-08-25 01:43:58'),
(1196, 21, 15, '2025-08-25 01:43:58'),
(1197, 21, 3, '2025-08-25 01:43:58'),
(1198, 21, 19, '2025-08-25 01:43:58'),
(1199, 21, 17, '2025-08-25 01:43:58'),
(1200, 21, 14, '2025-08-25 01:43:58'),
(1201, 21, 1, '2025-08-25 01:43:58'),
(1202, 1, 2, '2025-08-25 06:22:17'),
(1203, 1, 6, '2025-08-25 06:22:17'),
(1204, 1, 7, '2025-08-25 06:22:17'),
(1205, 1, 16, '2025-08-25 06:22:17'),
(1206, 1, 11, '2025-08-25 06:22:17'),
(1207, 1, 20, '2025-08-25 06:22:17'),
(1208, 1, 18, '2025-08-25 06:22:17'),
(1209, 1, 13, '2025-08-25 06:22:17'),
(1210, 1, 8, '2025-08-25 06:22:17'),
(1211, 1, 15, '2025-08-25 06:22:17'),
(1212, 1, 3, '2025-08-25 06:22:17'),
(1213, 1, 19, '2025-08-25 06:22:17'),
(1214, 1, 14, '2025-08-25 06:22:17'),
(1215, 1, 1, '2025-08-25 06:22:17'),
(1235, 2, 2, '2025-09-05 02:36:10'),
(1236, 2, 20, '2025-09-05 02:36:10'),
(1237, 2, 18, '2025-09-05 02:36:10'),
(1238, 2, 13, '2025-09-05 02:36:10'),
(1239, 2, 9, '2025-09-05 02:36:10'),
(1240, 2, 5, '2025-09-05 02:36:10'),
(1241, 2, 8, '2025-09-05 02:36:10'),
(1242, 2, 15, '2025-09-05 02:36:10'),
(1243, 2, 3, '2025-09-05 02:36:10'),
(1244, 2, 19, '2025-09-05 02:36:10'),
(1245, 2, 14, '2025-09-05 02:36:10'),
(1246, 2, 1, '2025-09-05 02:36:10'),
(1247, 35, 2, '2025-09-05 02:36:34'),
(1248, 35, 6, '2025-09-05 02:36:34'),
(1249, 35, 7, '2025-09-05 02:36:34'),
(1250, 35, 16, '2025-09-05 02:36:34'),
(1251, 35, 11, '2025-09-05 02:36:34'),
(1252, 35, 20, '2025-09-05 02:36:34'),
(1253, 35, 18, '2025-09-05 02:36:34'),
(1254, 35, 13, '2025-09-05 02:36:34'),
(1255, 35, 9, '2025-09-05 02:36:34'),
(1256, 35, 10, '2025-09-05 02:36:34'),
(1257, 35, 4, '2025-09-05 02:36:34'),
(1258, 35, 12, '2025-09-05 02:36:34'),
(1259, 35, 5, '2025-09-05 02:36:34'),
(1260, 35, 8, '2025-09-05 02:36:34'),
(1261, 35, 3, '2025-09-05 02:36:34'),
(1262, 35, 19, '2025-09-05 02:36:34'),
(1263, 35, 17, '2025-09-05 02:36:34'),
(1264, 35, 14, '2025-09-05 02:36:34'),
(1265, 35, 1, '2025-09-05 02:36:34'),
(1266, 36, 2, '2025-09-11 09:29:43'),
(1267, 36, 6, '2025-09-11 09:29:43'),
(1268, 36, 7, '2025-09-11 09:29:43'),
(1269, 36, 16, '2025-09-11 09:29:43'),
(1270, 36, 11, '2025-09-11 09:29:43'),
(1271, 36, 20, '2025-09-11 09:29:43'),
(1272, 36, 18, '2025-09-11 09:29:43'),
(1273, 36, 13, '2025-09-11 09:29:43'),
(1274, 36, 9, '2025-09-11 09:29:43'),
(1275, 36, 10, '2025-09-11 09:29:43'),
(1276, 36, 4, '2025-09-11 09:29:43'),
(1277, 36, 12, '2025-09-11 09:29:43'),
(1278, 36, 5, '2025-09-11 09:29:43'),
(1279, 36, 8, '2025-09-11 09:29:43'),
(1280, 36, 15, '2025-09-11 09:29:43'),
(1281, 36, 3, '2025-09-11 09:29:43'),
(1282, 36, 19, '2025-09-11 09:29:43'),
(1283, 36, 17, '2025-09-11 09:29:43'),
(1284, 36, 14, '2025-09-11 09:29:43'),
(1285, 36, 1, '2025-09-11 09:29:43'),
(1286, 37, 2, '2025-09-11 09:38:43'),
(1287, 37, 6, '2025-09-11 09:38:43'),
(1288, 37, 7, '2025-09-11 09:38:43'),
(1289, 37, 16, '2025-09-11 09:38:43'),
(1290, 37, 11, '2025-09-11 09:38:43'),
(1291, 37, 20, '2025-09-11 09:38:43'),
(1292, 37, 18, '2025-09-11 09:38:43'),
(1293, 37, 13, '2025-09-11 09:38:43'),
(1294, 37, 9, '2025-09-11 09:38:43'),
(1295, 37, 10, '2025-09-11 09:38:43'),
(1296, 37, 4, '2025-09-11 09:38:43'),
(1297, 37, 12, '2025-09-11 09:38:43'),
(1298, 37, 5, '2025-09-11 09:38:43'),
(1299, 37, 8, '2025-09-11 09:38:43'),
(1300, 37, 15, '2025-09-11 09:38:43'),
(1301, 37, 3, '2025-09-11 09:38:43'),
(1302, 37, 19, '2025-09-11 09:38:43'),
(1303, 37, 17, '2025-09-11 09:38:43'),
(1304, 37, 14, '2025-09-11 09:38:43'),
(1305, 37, 1, '2025-09-11 09:38:43'),
(1306, 38, 2, '2025-09-11 09:38:48'),
(1307, 38, 6, '2025-09-11 09:38:48'),
(1308, 38, 7, '2025-09-11 09:38:48'),
(1309, 38, 16, '2025-09-11 09:38:48'),
(1310, 38, 11, '2025-09-11 09:38:48'),
(1311, 38, 20, '2025-09-11 09:38:48'),
(1312, 38, 18, '2025-09-11 09:38:48'),
(1313, 38, 13, '2025-09-11 09:38:48'),
(1314, 38, 9, '2025-09-11 09:38:48'),
(1315, 38, 10, '2025-09-11 09:38:48'),
(1316, 38, 4, '2025-09-11 09:38:48'),
(1317, 38, 12, '2025-09-11 09:38:48'),
(1318, 38, 5, '2025-09-11 09:38:48'),
(1319, 38, 8, '2025-09-11 09:38:48'),
(1320, 38, 15, '2025-09-11 09:38:48'),
(1321, 38, 3, '2025-09-11 09:38:48'),
(1322, 38, 19, '2025-09-11 09:38:48'),
(1323, 38, 17, '2025-09-11 09:38:48'),
(1324, 38, 14, '2025-09-11 09:38:48'),
(1325, 38, 1, '2025-09-11 09:38:48'),
(1326, 39, 2, '2025-09-11 09:38:51'),
(1327, 39, 6, '2025-09-11 09:38:51'),
(1328, 39, 7, '2025-09-11 09:38:51'),
(1329, 39, 16, '2025-09-11 09:38:51'),
(1330, 39, 11, '2025-09-11 09:38:51'),
(1331, 39, 20, '2025-09-11 09:38:51'),
(1332, 39, 18, '2025-09-11 09:38:51'),
(1333, 39, 13, '2025-09-11 09:38:51'),
(1334, 39, 9, '2025-09-11 09:38:51'),
(1335, 39, 10, '2025-09-11 09:38:51'),
(1336, 39, 4, '2025-09-11 09:38:51'),
(1337, 39, 12, '2025-09-11 09:38:51'),
(1338, 39, 5, '2025-09-11 09:38:51'),
(1339, 39, 8, '2025-09-11 09:38:51'),
(1340, 39, 15, '2025-09-11 09:38:51'),
(1341, 39, 3, '2025-09-11 09:38:51'),
(1342, 39, 19, '2025-09-11 09:38:51'),
(1343, 39, 17, '2025-09-11 09:38:51'),
(1344, 39, 14, '2025-09-11 09:38:51'),
(1345, 39, 1, '2025-09-11 09:38:51'),
(1366, 41, 2, '2025-09-12 01:53:00'),
(1367, 41, 6, '2025-09-12 01:53:00'),
(1368, 41, 7, '2025-09-12 01:53:00'),
(1369, 41, 16, '2025-09-12 01:53:00'),
(1370, 41, 11, '2025-09-12 01:53:00'),
(1371, 41, 20, '2025-09-12 01:53:00'),
(1372, 41, 18, '2025-09-12 01:53:00'),
(1373, 41, 13, '2025-09-12 01:53:00'),
(1374, 41, 9, '2025-09-12 01:53:00'),
(1375, 41, 10, '2025-09-12 01:53:00'),
(1376, 41, 4, '2025-09-12 01:53:00'),
(1377, 41, 12, '2025-09-12 01:53:00'),
(1378, 41, 5, '2025-09-12 01:53:00'),
(1379, 41, 8, '2025-09-12 01:53:00'),
(1380, 41, 15, '2025-09-12 01:53:00'),
(1381, 41, 3, '2025-09-12 01:53:00'),
(1382, 41, 19, '2025-09-12 01:53:00'),
(1383, 41, 17, '2025-09-12 01:53:00'),
(1384, 41, 14, '2025-09-12 01:53:00'),
(1385, 41, 1, '2025-09-12 01:53:00'),
(1386, 42, 2, '2025-10-09 01:48:19'),
(1387, 42, 6, '2025-10-09 01:48:19'),
(1388, 42, 7, '2025-10-09 01:48:19'),
(1389, 42, 16, '2025-10-09 01:48:19'),
(1390, 42, 11, '2025-10-09 01:48:19'),
(1391, 42, 20, '2025-10-09 01:48:19'),
(1392, 42, 18, '2025-10-09 01:48:19'),
(1393, 42, 13, '2025-10-09 01:48:19'),
(1394, 42, 9, '2025-10-09 01:48:19'),
(1395, 42, 10, '2025-10-09 01:48:19'),
(1396, 42, 4, '2025-10-09 01:48:19'),
(1397, 42, 12, '2025-10-09 01:48:19'),
(1398, 42, 5, '2025-10-09 01:48:19'),
(1399, 42, 8, '2025-10-09 01:48:19'),
(1400, 42, 15, '2025-10-09 01:48:19'),
(1401, 42, 3, '2025-10-09 01:48:19'),
(1402, 42, 19, '2025-10-09 01:48:19'),
(1403, 42, 17, '2025-10-09 01:48:19'),
(1404, 42, 14, '2025-10-09 01:48:19'),
(1405, 42, 1, '2025-10-09 01:48:19'),
(1426, 50, 1, '2025-10-10 00:27:13'),
(1427, 50, 2, '2025-10-10 00:27:13'),
(1428, 50, 3, '2025-10-10 00:27:13'),
(1429, 50, 5, '2025-10-10 00:27:13'),
(1430, 50, 7, '2025-10-10 00:27:13'),
(1431, 50, 8, '2025-10-10 00:27:13'),
(1432, 50, 9, '2025-10-10 00:27:13'),
(1433, 50, 10, '2025-10-10 00:27:13'),
(1434, 50, 11, '2025-10-10 00:27:13'),
(1435, 50, 12, '2025-10-10 00:27:13'),
(1436, 50, 13, '2025-10-10 00:27:13'),
(1437, 50, 14, '2025-10-10 00:27:13'),
(1438, 50, 15, '2025-10-10 00:27:13'),
(1439, 50, 16, '2025-10-10 00:27:13'),
(1440, 50, 17, '2025-10-10 00:27:13'),
(1441, 50, 18, '2025-10-10 00:27:13'),
(1442, 50, 19, '2025-10-10 00:27:13'),
(1443, 50, 20, '2025-10-10 00:27:13'),
(1484, 55, 1, '2025-10-17 01:41:42'),
(1485, 55, 2, '2025-10-17 01:41:42'),
(1486, 55, 3, '2025-10-17 01:41:42'),
(1487, 55, 4, '2025-10-17 01:41:42'),
(1488, 55, 5, '2025-10-17 01:41:42'),
(1489, 55, 6, '2025-10-17 01:41:42'),
(1490, 55, 7, '2025-10-17 01:41:42'),
(1491, 55, 8, '2025-10-17 01:41:42'),
(1492, 55, 9, '2025-10-17 01:41:42'),
(1493, 55, 10, '2025-10-17 01:41:42'),
(1494, 55, 11, '2025-10-17 01:41:42'),
(1495, 55, 12, '2025-10-17 01:41:42'),
(1496, 55, 13, '2025-10-17 01:41:42'),
(1497, 55, 14, '2025-10-17 01:41:42'),
(1498, 55, 15, '2025-10-17 01:41:42'),
(1499, 55, 16, '2025-10-17 01:41:42'),
(1500, 55, 17, '2025-10-17 01:41:42'),
(1501, 55, 18, '2025-10-17 01:41:42'),
(1502, 55, 19, '2025-10-17 01:41:42'),
(1503, 55, 20, '2025-10-17 01:41:42'),
(1504, 56, 1, '2025-10-17 01:41:45'),
(1505, 56, 2, '2025-10-17 01:41:45'),
(1506, 56, 3, '2025-10-17 01:41:45'),
(1507, 56, 4, '2025-10-17 01:41:45'),
(1508, 56, 5, '2025-10-17 01:41:45'),
(1509, 56, 6, '2025-10-17 01:41:45'),
(1510, 56, 7, '2025-10-17 01:41:45'),
(1511, 56, 8, '2025-10-17 01:41:45'),
(1512, 56, 9, '2025-10-17 01:41:45'),
(1513, 56, 10, '2025-10-17 01:41:45'),
(1514, 56, 11, '2025-10-17 01:41:45'),
(1515, 56, 12, '2025-10-17 01:41:45'),
(1516, 56, 13, '2025-10-17 01:41:45'),
(1517, 56, 14, '2025-10-17 01:41:45'),
(1518, 56, 15, '2025-10-17 01:41:45'),
(1519, 56, 16, '2025-10-17 01:41:45'),
(1520, 56, 17, '2025-10-17 01:41:45'),
(1521, 56, 18, '2025-10-17 01:41:45'),
(1522, 56, 19, '2025-10-17 01:41:45'),
(1523, 56, 20, '2025-10-17 01:41:45');

-- --------------------------------------------------------

--
-- Table structure for table `room_maintenance_log`
--

CREATE TABLE `room_maintenance_log` (
  `maintenance_id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `maintenance_status_id` int(11) DEFAULT NULL,
  `maintenance_type_id` int(11) DEFAULT NULL,
  `scheduled_date` date DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_maintenance_log`
--

INSERT INTO `room_maintenance_log` (`maintenance_id`, `room_id`, `maintenance_status_id`, `maintenance_type_id`, `scheduled_date`, `started_at`, `completed_at`, `cost`, `notes`, `employee_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 4, '2025-08-25', NULL, '2025-08-25 10:09:57', 100.00, 'Needed more time to clean and dry the Air conditioner', 5, '2025-08-25 10:09:28', '2025-08-25 10:09:57'),
(2, 2, 3, 8, '2025-08-25', '2025-08-25 10:11:42', '2025-08-25 10:12:10', 100.00, 'This will be fast', 5, '2025-08-25 10:11:38', '2025-08-25 10:12:10'),
(3, 11, 1, 7, '2025-08-25', NULL, NULL, NULL, 'It would be delayed due to hectic schedule', 5, '2025-08-25 13:58:42', '2025-08-25 13:58:42'),
(4, 21, 1, 8, '2025-08-25', NULL, NULL, NULL, 'This will be done by tomorrow', 5, '2025-08-25 13:59:20', '2025-08-25 13:59:20'),
(5, 21, 1, 4, '2025-08-25', NULL, NULL, NULL, 'Due to pest the air conditioner\'s filter become clog', 5, '2025-08-25 14:24:48', '2025-08-25 14:24:48'),
(6, 11, 3, 2, '2025-08-25', '2025-08-25 17:43:22', '2025-08-25 17:44:03', 500.00, 'We notice some clogging in the water filter and need to do some plumbing', 5, '2025-08-25 14:26:10', '2025-08-25 17:44:03'),
(7, 35, 4, 10, '2025-08-25', NULL, NULL, NULL, 'Upgrades for other tech', 5, '2025-08-25 19:26:07', '2025-08-25 22:25:49'),
(8, 35, 1, 4, '2025-08-25', NULL, NULL, NULL, 'Need some cleaning', 5, '2025-08-25 21:04:20', '2025-08-25 21:04:20'),
(9, 35, 1, 8, '2025-08-25', NULL, NULL, NULL, 'Some minimal cleaning', 11, '2025-08-25 22:54:25', '2025-08-25 22:54:25'),
(10, 35, 3, 2, '2025-09-05', NULL, '2025-09-05 10:23:55', 200.00, 'Will be finished later', 5, '2025-09-05 10:23:08', '2025-09-05 10:23:55');

-- --------------------------------------------------------

--
-- Table structure for table `room_maintenance_type`
--

CREATE TABLE `room_maintenance_type` (
  `maintenance_type_id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_maintenance_type`
--

INSERT INTO `room_maintenance_type` (`maintenance_type_id`, `type_name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Cleaning', 'Routine or deep cleaning of the room', 1, '2025-08-25 01:47:57', '2025-08-25 01:47:57'),
(2, 'Plumbing Repair', 'Fixing leaks, faucets, showers, or toilets', 1, '2025-08-25 01:47:57', '2025-08-25 01:47:57'),
(3, 'Electrical', 'Issues with lights, sockets, switches, or wiring', 1, '2025-08-25 01:47:57', '2025-08-25 01:47:57'),
(4, 'Air Conditioning', 'AC servicing, repair, or refrigerant refill', 1, '2025-08-25 01:47:57', '2025-08-25 01:47:57'),
(5, 'Painting', 'Wall touch-up or full room repainting', 1, '2025-08-25 01:47:57', '2025-08-25 01:47:57'),
(6, 'Furniture Repair', 'Fixing or replacing beds, chairs, tables, etc.', 1, '2025-08-25 01:47:57', '2025-08-25 01:47:57'),
(7, 'Pest Control', 'Treatment for insects, rodents, or other pests', 1, '2025-08-25 01:47:57', '2025-08-25 01:47:57'),
(8, 'Carpet Cleaning', 'Steam or spot cleaning of carpets', 1, '2025-08-25 01:47:57', '2025-08-25 01:47:57'),
(9, 'Window/Blind Repair', 'Fixing broken windows, curtains, or blinds', 1, '2025-08-25 01:47:57', '2025-08-25 01:47:57'),
(10, 'Technology Setup', 'TV, Wi-Fi, smart controls, or phone setup', 1, '2025-08-25 01:47:57', '2025-08-25 01:47:57');

-- --------------------------------------------------------

--
-- Table structure for table `room_status`
--

CREATE TABLE `room_status` (
  `room_status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_status`
--

INSERT INTO `room_status` (`room_status_id`, `status_name`, `description`) VALUES
(1, 'Available', NULL),
(2, 'Occupied', NULL),
(3, 'Reserved', NULL),
(4, 'Out of Order', NULL),
(5, 'Under Maintenance', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

CREATE TABLE `room_types` (
  `room_type_id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price_per_night` decimal(10,2) NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`room_type_id`, `type_name`, `description`, `price_per_night`, `capacity`) VALUES
(1, 'Single Room', 'A room with a single bed for one person.', 1500.00, 1),
(2, 'Double Room', 'A room with one double bed for two people.', 2500.00, 2),
(3, 'Twin Room', 'A room with two single beds for two people.', 2600.00, 2),
(4, 'Triple Room', 'A room with three single beds or one double and one single.', 3500.00, 3),
(5, 'Queen Room', 'A room with a queen-size bed.', 2800.00, 2),
(6, 'King Room', 'A room with a king-size bed.', 3000.00, 2),
(7, 'Deluxe Room', 'A larger room with upscale amenities.', 4000.00, 2),
(8, 'Executive Room', 'A luxury room with work area and premium features.', 5000.00, 2),
(9, 'Suite', 'A spacious suite with separate living area.', 6000.00, 3),
(10, 'Family Room', 'Designed for families with multiple beds.', 4500.00, 4),
(11, 'Presidential Suite', 'Top-tier luxury suite with exclusive services.', 10000.00, 4),
(12, 'Universal Rooms', 'for intergalactic people', 1200.00, 10),
(13, 'Galaxy Room', 'Trip to Universe', 10000.00, 10),
(14, 'Kenneth Suite', 'for couple', 500.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `service_requests`
--

CREATE TABLE `service_requests` (
  `request_id` int(11) NOT NULL,
  `request_type_id` int(11) NOT NULL,
  `request_status_id` int(11) NOT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `request_time` datetime NOT NULL DEFAULT current_timestamp(),
  `delivery_datetime` datetime DEFAULT NULL COMMENT 'Scheduled time for service delivery',
  `delivery_option` varchar(50) DEFAULT 'now' COMMENT 'e.g., now, breakfast, lunch, dinner, specific_time',
  `reservation_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_requests`
--

INSERT INTO `service_requests` (`request_id`, `request_type_id`, `request_status_id`, `assigned_to`, `total`, `request_time`, `delivery_datetime`, `delivery_option`, `reservation_id`, `created_at`, `updated_at`) VALUES
(23, 1, 1, NULL, 800.00, '2025-08-24 08:07:50', NULL, 'now', 24, '2025-08-24 08:07:50', '2025-08-24 08:07:50'),
(24, 1, 1, NULL, 0.00, '2025-08-24 09:58:34', NULL, 'now', 25, '2025-08-24 09:58:34', '2025-08-24 09:58:34'),
(25, 1, 1, NULL, 0.00, '2025-08-24 09:58:34', NULL, 'now', 25, '2025-08-24 09:58:34', '2025-08-24 09:58:34'),
(26, 1, 1, NULL, 0.00, '2025-08-24 09:58:34', NULL, 'now', 25, '2025-08-24 09:58:34', '2025-08-24 09:58:34'),
(27, 2, 1, NULL, 320.00, '2025-08-24 11:51:13', NULL, 'now', 27, '2025-08-24 11:51:13', '2025-08-24 11:51:13'),
(28, 2, 1, NULL, 320.00, '2025-08-24 14:06:53', NULL, 'now', 28, '2025-08-24 14:06:53', '2025-08-24 14:06:53'),
(29, 2, 1, NULL, 270.00, '2025-08-24 14:06:53', NULL, 'now', 28, '2025-08-24 14:06:53', '2025-08-24 14:06:53'),
(30, 2, 1, NULL, 100.00, '2025-08-24 14:06:53', NULL, 'now', 28, '2025-08-24 14:06:53', '2025-08-24 14:06:53'),
(31, 2, 1, NULL, 30.00, '2025-08-24 14:06:53', NULL, 'now', 28, '2025-08-24 14:06:53', '2025-08-24 14:06:53'),
(32, 2, 1, NULL, 690.00, '2025-08-24 14:06:53', NULL, 'now', 28, '2025-08-24 14:06:53', '2025-08-24 14:06:53'),
(33, 1, 1, NULL, 0.00, '2025-08-24 23:04:29', NULL, 'now', 29, '2025-08-24 23:04:29', '2025-08-24 23:04:29'),
(34, 1, 1, NULL, 0.00, '2025-08-24 23:04:29', NULL, 'now', 29, '2025-08-24 23:04:29', '2025-08-24 23:04:29'),
(35, 1, 1, NULL, 0.00, '2025-08-25 04:53:54', NULL, 'now', 30, '2025-08-25 04:53:54', '2025-08-25 04:53:54'),
(36, 1, 1, NULL, 0.00, '2025-08-25 04:53:54', NULL, 'now', 30, '2025-08-25 04:53:54', '2025-08-25 04:53:54'),
(37, 1, 1, NULL, 0.00, '2025-08-25 04:53:54', NULL, 'now', 30, '2025-08-25 04:53:54', '2025-08-25 04:53:54'),
(38, 1, 1, NULL, 0.00, '2025-08-25 04:53:54', NULL, 'now', 30, '2025-08-25 04:53:54', '2025-08-25 04:53:54'),
(39, 1, 1, NULL, 100.00, '2025-08-25 04:53:54', NULL, 'now', 30, '2025-08-25 04:53:54', '2025-08-25 04:53:54'),
(40, 1, 1, NULL, 0.00, '2025-08-26 10:57:44', NULL, 'now', 31, '2025-08-26 10:57:44', '2025-08-26 10:57:44'),
(41, 1, 1, NULL, 0.00, '2025-08-26 10:57:44', NULL, 'now', 31, '2025-08-26 10:57:44', '2025-08-26 10:57:44'),
(42, 1, 1, NULL, 0.00, '2025-08-26 17:50:46', NULL, 'now', 32, '2025-08-26 17:50:46', '2025-08-26 17:50:46'),
(43, 1, 1, NULL, 0.00, '2025-08-26 17:50:46', NULL, 'now', 32, '2025-08-26 17:50:46', '2025-08-26 17:50:46'),
(44, 1, 1, NULL, 800.00, '2025-08-31 06:50:02', NULL, 'now', 33, '2025-08-31 06:50:02', '2025-08-31 06:50:02'),
(45, 1, 1, NULL, 200.00, '2025-08-31 07:59:02', NULL, 'now', 34, '2025-08-31 07:59:02', '2025-08-31 07:59:02'),
(46, 1, 1, NULL, 10.00, '2025-08-31 07:59:02', NULL, 'now', 34, '2025-08-31 07:59:02', '2025-08-31 07:59:02'),
(47, 2, 1, NULL, 320.00, '2025-08-31 08:11:35', NULL, 'now', 35, '2025-08-31 08:11:35', '2025-08-31 08:11:35'),
(48, 2, 1, NULL, 280.00, '2025-08-31 08:11:35', NULL, 'now', 35, '2025-08-31 08:11:35', '2025-08-31 08:11:35'),
(49, 2, 1, NULL, 270.00, '2025-08-31 08:11:35', NULL, 'now', 35, '2025-08-31 08:11:35', '2025-08-31 08:11:35'),
(50, 1, 1, NULL, 800.00, '2025-08-31 08:23:32', NULL, 'now', 36, '2025-08-31 08:23:32', '2025-08-31 08:23:32'),
(51, 1, 1, NULL, 10.00, '2025-08-31 08:23:32', NULL, 'now', 36, '2025-08-31 08:23:32', '2025-08-31 08:23:32'),
(52, 1, 1, NULL, 20.00, '2025-08-31 08:23:32', NULL, 'now', 36, '2025-08-31 08:23:32', '2025-08-31 08:23:32'),
(53, 1, 1, NULL, 800.00, '2025-09-04 12:06:52', NULL, 'now', 37, '2025-09-04 12:06:52', '2025-09-04 12:06:52'),
(54, 1, 1, NULL, 20.00, '2025-09-05 10:45:09', NULL, 'now', 38, '2025-09-05 10:45:09', '2025-09-05 10:45:09'),
(55, 1, 1, NULL, 100.00, '2025-09-05 10:45:09', NULL, 'now', 38, '2025-09-05 10:45:09', '2025-09-05 10:45:09'),
(56, 1, 1, NULL, 10.00, '2025-09-05 11:17:08', NULL, 'now', 39, '2025-09-05 11:17:08', '2025-09-05 11:17:08'),
(57, 1, 1, NULL, 800.00, '2025-09-07 16:35:05', NULL, 'now', 40, '2025-09-07 16:35:05', '2025-09-07 16:35:05'),
(58, 1, 1, NULL, 10.00, '2025-09-07 16:35:05', NULL, 'now', 40, '2025-09-07 16:35:05', '2025-09-07 16:35:05'),
(59, 2, 2, 2, 880.00, '2025-09-11 07:30:35', NULL, 'now', 28, '2025-09-11 07:30:35', '2025-09-11 10:26:47'),
(60, 1, 2, 2, 800.00, '2025-09-11 08:58:00', NULL, 'now', 42, '2025-09-11 08:58:00', '2025-09-11 10:29:07'),
(61, 2, 2, 14, 320.00, '2025-09-11 11:42:40', NULL, 'now', 43, '2025-09-11 11:42:40', '2025-09-11 11:43:26'),
(62, 2, 1, NULL, 690.00, '2025-09-11 18:13:01', NULL, 'now', 28, '2025-09-11 18:13:01', '2025-09-11 18:13:01'),
(63, 1, 2, 14, 1200.00, '2025-09-11 18:18:12', NULL, 'now', 41, '2025-09-11 18:18:12', '2025-09-11 18:19:19'),
(64, 1, 1, NULL, 20.00, '2025-09-11 18:22:18', NULL, 'now', 41, '2025-09-11 18:22:18', '2025-09-11 18:22:18'),
(65, 2, 1, NULL, 260.00, '2025-09-11 18:28:10', NULL, 'now', 41, '2025-09-11 18:28:10', '2025-09-11 18:28:10'),
(66, 2, 1, NULL, 870.00, '2025-09-11 18:34:26', NULL, 'now', 43, '2025-09-11 18:34:26', '2025-09-11 18:34:26'),
(67, 1, 1, NULL, 10.00, '2025-09-11 18:44:22', NULL, 'now', 43, '2025-09-11 18:44:22', '2025-09-11 18:44:22'),
(68, 2, 3, 14, 1470.00, '2025-09-12 07:13:17', NULL, 'now', 42, '2025-09-12 07:13:17', '2025-09-12 07:48:41'),
(69, 2, 2, 2, 150.00, '2025-09-12 07:53:14', NULL, 'now', 42, '2025-09-12 07:53:14', '2025-09-12 07:53:55'),
(70, 1, 2, 2, 800.00, '2025-09-12 08:46:37', NULL, 'now', 42, '2025-09-12 08:46:37', '2025-09-12 09:49:59'),
(71, 2, 1, NULL, 280.00, '2025-09-12 08:54:12', NULL, 'now', 42, '2025-09-12 08:54:12', '2025-09-12 08:54:12'),
(72, 2, 1, NULL, 320.00, '2025-09-12 09:07:24', NULL, 'now', 28, '2025-09-12 09:07:24', '2025-09-12 09:07:24'),
(73, 2, 1, NULL, 920.00, '2025-09-12 09:24:25', NULL, 'now', 28, '2025-09-12 09:24:25', '2025-09-12 09:24:25'),
(74, 2, 1, NULL, 130.00, '2025-09-12 09:28:00', NULL, 'now', 28, '2025-09-12 09:28:00', '2025-09-12 09:28:00'),
(75, 1, 1, NULL, 20.00, '2025-09-12 10:02:02', NULL, 'now', 45, '2025-09-12 10:02:02', '2025-09-12 10:02:02'),
(76, 1, 1, NULL, 100.00, '2025-09-12 10:02:02', NULL, 'now', 45, '2025-09-12 10:02:02', '2025-09-12 10:02:02'),
(77, 2, 1, NULL, 320.00, '2025-09-12 10:19:11', NULL, 'now', 28, '2025-09-12 10:19:11', '2025-09-12 10:19:11'),
(78, 2, 1, NULL, 360.00, '2025-09-12 10:41:37', NULL, 'now', 46, '2025-09-12 10:41:37', '2025-09-12 10:41:37'),
(79, 2, 1, NULL, 320.00, '2025-09-16 12:24:03', NULL, 'breakfast', 49, '2025-09-16 12:24:03', '2025-09-16 12:24:03'),
(80, 2, 1, NULL, 280.00, '2025-09-16 12:24:03', NULL, 'lunch', 49, '2025-09-16 12:24:03', '2025-09-16 12:24:03'),
(81, 2, 1, NULL, 250.00, '2025-09-16 12:24:03', NULL, 'dinner', 49, '2025-09-16 12:24:03', '2025-09-16 12:24:03'),
(82, 2, 2, 2, 320.00, '2025-09-16 12:25:59', NULL, 'breakfast', 48, '2025-09-16 12:25:59', '2025-09-16 12:30:10'),
(83, 2, 1, NULL, 100.00, '2025-09-16 14:04:27', NULL, 'lunch', 48, '2025-09-16 14:04:27', '2025-09-16 14:04:27'),
(84, 2, 1, NULL, 100.00, '2025-09-16 14:10:43', NULL, 'dinner', 48, '2025-09-16 14:10:43', '2025-09-16 14:10:43'),
(85, 2, 2, 11, 320.00, '2025-09-19 07:29:24', NULL, 'breakfast', 51, '2025-09-19 07:29:24', '2025-09-19 07:29:53'),
(86, 2, 2, 11, 280.00, '2025-09-19 07:29:24', NULL, 'lunch', 51, '2025-09-19 07:29:24', '2025-09-19 07:30:21'),
(87, 2, 2, 11, 160.00, '2025-09-20 17:53:20', NULL, 'breakfast', 51, '2025-09-20 17:53:20', '2025-09-20 17:53:35'),
(88, 2, 2, 2, 320.00, '2025-10-03 19:44:37', NULL, 'breakfast', 49, '2025-10-03 19:44:37', '2025-10-03 20:21:03'),
(89, 2, 1, NULL, 320.00, '2025-10-03 20:03:57', NULL, 'breakfast', 49, '2025-10-03 20:03:57', '2025-10-03 20:03:57'),
(90, 2, 1, NULL, 250.00, '2025-10-03 20:16:45', NULL, 'breakfast', 49, '2025-10-03 20:16:45', '2025-10-03 20:16:45'),
(91, 2, 1, NULL, 280.00, '2025-10-03 20:20:42', NULL, 'lunch', 49, '2025-10-03 20:20:42', '2025-10-03 20:20:42'),
(92, 2, 2, 14, 320.00, '2025-10-04 09:48:26', NULL, 'breakfast', 49, '2025-10-04 09:48:26', '2025-10-04 09:48:41'),
(93, 2, 3, 11, 600.00, '2025-10-14 18:35:11', NULL, 'breakfast', 49, '2025-10-14 18:35:11', '2025-10-14 18:36:05'),
(94, 2, 1, 5, 320.00, '2025-10-17 08:18:57', NULL, 'breakfast', 56, '2025-10-17 08:18:57', '2025-10-17 09:50:22'),
(95, 2, 4, NULL, 290.00, '2025-10-17 09:49:50', NULL, 'now', 56, '2025-10-17 09:49:50', '2025-10-17 09:50:47');

--
-- Triggers `service_requests`
--
DELIMITER $$
CREATE TRIGGER `after_service_requests_insert` AFTER INSERT ON `service_requests` FOR EACH ROW BEGIN
    INSERT INTO extra_charges (request_id, amount)
    VALUES (NEW.request_id, COALESCE(NEW.total, 0.00));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`role_id`, `role_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'System administrator with full access', '2025-09-01 12:26:48', '2025-09-01 12:26:48'),
(2, 'Front Desk', 'Front desk staff with limited access', '2025-09-01 12:26:48', '2025-09-01 12:26:48'),
(3, 'Handyman', 'Maintenance staff with specific permissions', '2025-09-01 12:26:48', '2025-09-01 12:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `session_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `last_activity` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_sessions`
--

INSERT INTO `user_sessions` (`session_id`, `employee_id`, `token`, `expires_at`, `created_at`, `last_activity`) VALUES
(1, 1, 'e070c29211a8888e637a0ed569bb3162e13fa959b83d1e41863a42892abe4548', '2025-11-08 02:22:58', '2025-10-09 08:22:58', '2025-10-09 08:22:58'),
(2, 2, '11b8386f6cf3557b2f8028e2a627a629541a8e669e59e0f42edcca4417ca125c', '2025-11-08 02:22:58', '2025-10-09 08:22:58', '2025-10-09 08:22:58'),
(3, 5, '23d2b5fd9abd9bc31d9e37a58468869ff4b7df075948f451d0a3679b72840643', '2025-11-08 02:22:58', '2025-10-09 08:22:58', '2025-10-09 08:22:58'),
(4, 11, '8cb549f7e60927ba09dc8934bb5335482b9dd1212856f5eb7bc3113c6e75349c', '2025-11-08 02:22:58', '2025-10-09 08:22:58', '2025-10-09 08:22:58'),
(5, 13, 'e5cf5d0da6e10a72829a8af55a49cfee6b4314b7266caaa880570bbf2f80fdbb', '2025-11-08 02:22:58', '2025-10-09 08:22:58', '2025-10-09 08:22:58'),
(6, 14, '3fff71759eacb752ac9a787fc04ef1aaebc0da99c4cc4fdddd3d09129401639c', '2025-11-08 02:22:58', '2025-10-09 08:22:58', '2025-10-09 08:22:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advance_payments`
--
ALTER TABLE `advance_payments`
  ADD PRIMARY KEY (`advance_payment_id`),
  ADD KEY `payment_method_id` (`payment_method_id`),
  ADD KEY `idx_advance_payments_reservation` (`reservation_id`),
  ADD KEY `idx_advance_payments_status` (`payment_status_id`);

--
-- Indexes for table `archived_hotel_services`
--
ALTER TABLE `archived_hotel_services`
  ADD PRIMARY KEY (`archived_service_id`),
  ADD KEY `idx_original_service_id` (`original_service_id`);

--
-- Indexes for table `archived_menu_items`
--
ALTER TABLE `archived_menu_items`
  ADD PRIMARY KEY (`archived_menu_id`),
  ADD KEY `idx_original_menu_id` (`original_menu_id`);

--
-- Indexes for table `archived_rooms`
--
ALTER TABLE `archived_rooms`
  ADD PRIMARY KEY (`archived_room_id`),
  ADD KEY `idx_original_room_id` (`original_room_id`);

--
-- Indexes for table `archived_room_amenities_mapping`
--
ALTER TABLE `archived_room_amenities_mapping`
  ADD PRIMARY KEY (`archived_mapping_id`),
  ADD KEY `idx_original_room_id` (`original_room_id`);

--
-- Indexes for table `archived_room_types`
--
ALTER TABLE `archived_room_types`
  ADD PRIMARY KEY (`archived_room_type_id`),
  ADD KEY `idx_original_room_type_id` (`original_room_type_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `email_otp`
--
ALTER TABLE `email_otp`
  ADD PRIMARY KEY (`otp_id`),
  ADD KEY `idx_employee_otp` (`employee_id`,`otp_code`),
  ADD KEY `idx_expires_at` (`expires_at`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `extra_charges`
--
ALTER TABLE `extra_charges`
  ADD PRIMARY KEY (`extra_charges_id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `fk_extra_charges_processed_by` (`processed_by`),
  ADD KEY `idx_extra_charges_status_source` (`status`,`request_source`),
  ADD KEY `idx_extra_charges_dates` (`requested_at`,`fulfilled_at`),
  ADD KEY `idx_extra_charges_service_type` (`service_type`,`service_name`);

--
-- Indexes for table `guest_companions`
--
ALTER TABLE `guest_companions`
  ADD PRIMARY KEY (`companion_id`),
  ADD KEY `idx_reservation_companions` (`reservation_id`),
  ADD KEY `idx_companion_name` (`first_name`,`last_name`);

--
-- Indexes for table `guest_room_assignments`
--
ALTER TABLE `guest_room_assignments`
  ADD PRIMARY KEY (`guest_assignment_id`),
  ADD UNIQUE KEY `uniq_reservation_room` (`reservation_id`,`room_id`),
  ADD KEY `fk_gra_reservation` (`reservation_id`),
  ADD KEY `fk_gra_room` (`room_id`),
  ADD KEY `fk_gra_customer` (`customer_id`),
  ADD KEY `fk_gra_companion` (`companion_id`);

--
-- Indexes for table `guest_tokens`
--
ALTER TABLE `guest_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `fk_guest_tokens_reservation` (`reservation_id`),
  ADD KEY `fk_guest_tokens_customer` (`customer_id`);

--
-- Indexes for table `hotel_services`
--
ALTER TABLE `hotel_services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `fk_employee` (`employee_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`invoice_item_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `maintenance_status`
--
ALTER TABLE `maintenance_status`
  ADD PRIMARY KEY (`maintenance_status_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `idx_notifications_user_read` (`user_id`,`is_read`,`created_at`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reset_token` (`reset_token`),
  ADD KEY `idx_reset_token` (`reset_token`),
  ADD KEY `idx_expires_at` (`expires_at`),
  ADD KEY `idx_employee_id` (`employee_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `idx_invoice_id` (`invoice_id`),
  ADD KEY `idx_recorded_at` (`recorded_at`),
  ADD KEY `idx_action_type` (`action_type`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`payment_method_id`);

--
-- Indexes for table `payment_status`
--
ALTER TABLE `payment_status`
  ADD PRIMARY KEY (`payment_status_id`);

--
-- Indexes for table `request_items`
--
ALTER TABLE `request_items`
  ADD PRIMARY KEY (`request_items_id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `fk_request_items_service_requests` (`request_id`);

--
-- Indexes for table `request_status`
--
ALTER TABLE `request_status`
  ADD PRIMARY KEY (`request_status_id`);

--
-- Indexes for table `request_types`
--
ALTER TABLE `request_types`
  ADD PRIMARY KEY (`request_type_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `reservation_type_id` (`reservation_type_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `reservation_status_id` (`reservation_status_id`),
  ADD KEY `idx_reservations_room_type_dates` (`room_type_id`,`checkout_datetime`),
  ADD KEY `idx_reservations_booking_type` (`booking_type`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `reservation_details`
--
ALTER TABLE `reservation_details`
  ADD PRIMARY KEY (`reservation_detail_id`),
  ADD KEY `fk_res_details_reservation` (`reservation_id`),
  ADD KEY `fk_res_details_room_type` (`room_type_id`);

--
-- Indexes for table `reservation_logs`
--
ALTER TABLE `reservation_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `idx_reservation_id` (`reservation_id`),
  ADD KEY `idx_timestamp` (`timestamp`),
  ADD KEY `idx_action_type` (`action_type`);

--
-- Indexes for table `reservation_status`
--
ALTER TABLE `reservation_status`
  ADD PRIMARY KEY (`reservation_status_id`);

--
-- Indexes for table `reservation_type`
--
ALTER TABLE `reservation_type`
  ADD PRIMARY KEY (`reservation_type_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `room_type_id` (`room_type_id`),
  ADD KEY `room_status_id` (`room_status_id`);

--
-- Indexes for table `room_amenities`
--
ALTER TABLE `room_amenities`
  ADD PRIMARY KEY (`amenity_id`),
  ADD UNIQUE KEY `amenity_name` (`amenity_name`),
  ADD KEY `idx_room_amenities_name` (`amenity_name`),
  ADD KEY `idx_room_amenities_active` (`is_active`);

--
-- Indexes for table `room_amenities_mapping`
--
ALTER TABLE `room_amenities_mapping`
  ADD PRIMARY KEY (`mapping_id`),
  ADD UNIQUE KEY `room_amenity_unique` (`room_id`,`amenity_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `amenity_id` (`amenity_id`),
  ADD KEY `idx_room_amenities_mapping_room_id` (`room_id`),
  ADD KEY `idx_room_amenities_mapping_amenity_id` (`amenity_id`);

--
-- Indexes for table `room_maintenance_log`
--
ALTER TABLE `room_maintenance_log`
  ADD PRIMARY KEY (`maintenance_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `maintenance_status_id` (`maintenance_status_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `maintenance_type_id` (`maintenance_type_id`);

--
-- Indexes for table `room_maintenance_type`
--
ALTER TABLE `room_maintenance_type`
  ADD PRIMARY KEY (`maintenance_type_id`),
  ADD UNIQUE KEY `unique_type_name` (`type_name`);

--
-- Indexes for table `room_status`
--
ALTER TABLE `room_status`
  ADD PRIMARY KEY (`room_status_id`),
  ADD UNIQUE KEY `status_name` (`status_name`);

--
-- Indexes for table `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`room_type_id`);

--
-- Indexes for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `request_type_id` (`request_type_id`),
  ADD KEY `request_status_id` (`request_status_id`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `fk_service_requests_reservations` (`reservation_id`),
  ADD KEY `idx_request_time` (`request_time`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `user_id` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advance_payments`
--
ALTER TABLE `advance_payments`
  MODIFY `advance_payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `archived_hotel_services`
--
ALTER TABLE `archived_hotel_services`
  MODIFY `archived_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `archived_menu_items`
--
ALTER TABLE `archived_menu_items`
  MODIFY `archived_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `archived_rooms`
--
ALTER TABLE `archived_rooms`
  MODIFY `archived_room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `archived_room_amenities_mapping`
--
ALTER TABLE `archived_room_amenities_mapping`
  MODIFY `archived_mapping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `archived_room_types`
--
ALTER TABLE `archived_room_types`
  MODIFY `archived_room_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `email_otp`
--
ALTER TABLE `email_otp`
  MODIFY `otp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `extra_charges`
--
ALTER TABLE `extra_charges`
  MODIFY `extra_charges_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `guest_companions`
--
ALTER TABLE `guest_companions`
  MODIFY `companion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `guest_room_assignments`
--
ALTER TABLE `guest_room_assignments`
  MODIFY `guest_assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `guest_tokens`
--
ALTER TABLE `guest_tokens`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `hotel_services`
--
ALTER TABLE `hotel_services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `invoice_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `maintenance_status`
--
ALTER TABLE `maintenance_status`
  MODIFY `maintenance_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=366;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `payment_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_status`
--
ALTER TABLE `payment_status`
  MODIFY `payment_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `request_items`
--
ALTER TABLE `request_items`
  MODIFY `request_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `request_status`
--
ALTER TABLE `request_status`
  MODIFY `request_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `request_types`
--
ALTER TABLE `request_types`
  MODIFY `request_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `reservation_details`
--
ALTER TABLE `reservation_details`
  MODIFY `reservation_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `reservation_logs`
--
ALTER TABLE `reservation_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `reservation_status`
--
ALTER TABLE `reservation_status`
  MODIFY `reservation_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservation_type`
--
ALTER TABLE `reservation_type`
  MODIFY `reservation_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `room_amenities`
--
ALTER TABLE `room_amenities`
  MODIFY `amenity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `room_amenities_mapping`
--
ALTER TABLE `room_amenities_mapping`
  MODIFY `mapping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1524;

--
-- AUTO_INCREMENT for table `room_maintenance_log`
--
ALTER TABLE `room_maintenance_log`
  MODIFY `maintenance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `room_maintenance_type`
--
ALTER TABLE `room_maintenance_type`
  MODIFY `maintenance_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `room_status`
--
ALTER TABLE `room_status`
  MODIFY `room_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `room_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `service_requests`
--
ALTER TABLE `service_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advance_payments`
--
ALTER TABLE `advance_payments`
  ADD CONSTRAINT `advance_payments_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `advance_payments_ibfk_2` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`payment_method_id`),
  ADD CONSTRAINT `advance_payments_ibfk_3` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_status` (`payment_status_id`);

--
-- Constraints for table `email_otp`
--
ALTER TABLE `email_otp`
  ADD CONSTRAINT `email_otp_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`);

--
-- Constraints for table `extra_charges`
--
ALTER TABLE `extra_charges`
  ADD CONSTRAINT `extra_charges_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `service_requests` (`request_id`),
  ADD CONSTRAINT `fk_extra_charges_processed_by` FOREIGN KEY (`processed_by`) REFERENCES `employees` (`employee_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_extra_charges_request` FOREIGN KEY (`request_id`) REFERENCES `service_requests` (`request_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_request_id` FOREIGN KEY (`request_id`) REFERENCES `service_requests` (`request_id`);

--
-- Constraints for table `guest_companions`
--
ALTER TABLE `guest_companions`
  ADD CONSTRAINT `guest_companions_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`) ON DELETE CASCADE;

--
-- Constraints for table `guest_room_assignments`
--
ALTER TABLE `guest_room_assignments`
  ADD CONSTRAINT `fk_gra_companion` FOREIGN KEY (`companion_id`) REFERENCES `guest_companions` (`companion_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gra_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gra_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gra_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE;

--
-- Constraints for table `guest_tokens`
--
ALTER TABLE `guest_tokens`
  ADD CONSTRAINT `fk_guest_tokens_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_guest_tokens_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `fk_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_user` FOREIGN KEY (`user_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE;

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD CONSTRAINT `payment_logs_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_logs_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`) ON DELETE SET NULL;

--
-- Constraints for table `request_items`
--
ALTER TABLE `request_items`
  ADD CONSTRAINT `fk_request_items_service_requests` FOREIGN KEY (`request_id`) REFERENCES `service_requests` (`request_id`),
  ADD CONSTRAINT `request_items_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu_items` (`menu_id`),
  ADD CONSTRAINT `request_items_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `hotel_services` (`service_id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`reservation_type_id`) REFERENCES `reservation_type` (`reservation_type_id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `reservations_ibfk_5` FOREIGN KEY (`reservation_status_id`) REFERENCES `reservation_status` (`reservation_status_id`);

--
-- Constraints for table `reservation_details`
--
ALTER TABLE `reservation_details`
  ADD CONSTRAINT `fk_res_details_reservation` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_res_details_room_type` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`room_type_id`);

--
-- Constraints for table `reservation_logs`
--
ALTER TABLE `reservation_logs`
  ADD CONSTRAINT `reservation_logs_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`room_type_id`),
  ADD CONSTRAINT `rooms_ibfk_2` FOREIGN KEY (`room_status_id`) REFERENCES `room_status` (`room_status_id`);

--
-- Constraints for table `room_amenities_mapping`
--
ALTER TABLE `room_amenities_mapping`
  ADD CONSTRAINT `room_amenities_mapping_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_amenities_mapping_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `room_amenities` (`amenity_id`) ON DELETE CASCADE;

--
-- Constraints for table `room_maintenance_log`
--
ALTER TABLE `room_maintenance_log`
  ADD CONSTRAINT `fk_maintenance_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_maintenance_log_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  ADD CONSTRAINT `room_maintenance_log_ibfk_2` FOREIGN KEY (`maintenance_status_id`) REFERENCES `maintenance_status` (`maintenance_status_id`),
  ADD CONSTRAINT `room_maintenance_log_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `room_maintenance_log_ibfk_4` FOREIGN KEY (`maintenance_type_id`) REFERENCES `room_maintenance_type` (`maintenance_type_id`);

--
-- Constraints for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD CONSTRAINT `fk_service_requests_assigned_to` FOREIGN KEY (`assigned_to`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `fk_service_requests_reservations` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`),
  ADD CONSTRAINT `service_requests_ibfk_1` FOREIGN KEY (`request_type_id`) REFERENCES `request_types` (`request_type_id`),
  ADD CONSTRAINT `service_requests_ibfk_2` FOREIGN KEY (`request_status_id`) REFERENCES `request_status` (`request_status_id`);

--
-- Constraints for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `fk_user_sessions_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
