-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: 84.95.21.28:3306
-- Generation Time: Jul 27, 2021 at 07:08 PM
-- Server version: 5.7.35
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taldream_ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(10) NOT NULL,
  `store_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `currency_id` int(10) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `vat` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `order_status` int(11) DEFAULT '1',
  `payment_gateway` int(11) DEFAULT NULL,
  `shipping_gateway` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `store_id`, `user_id`, `currency_id`, `sub_total`, `total`, `vat`, `discount`, `order_status`, `payment_gateway`, `shipping_gateway`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 2, NULL, NULL, NULL, '25.00', 1, 0, NULL, '2021-07-12 02:56:10', '2021-07-12 02:56:10'),
(2, 3, 3, 2, NULL, NULL, NULL, '25.00', 1, 0, NULL, '2021-07-12 02:57:47', '2021-07-12 02:57:47'),
(3, 3, 3, 2, NULL, NULL, NULL, '25.00', 1, 0, NULL, '2021-07-12 03:00:38', '2021-07-12 03:00:38'),
(4, 3, 3, 2, NULL, NULL, NULL, '25.00', 1, 0, NULL, '2021-07-12 03:01:12', '2021-07-12 03:01:12'),
(5, 3, 3, 1, NULL, NULL, NULL, '25.00', 2, 1, 1, '2021-07-12 03:02:19', '2021-07-15 12:17:38'),
(6, 3, 3, 1, NULL, NULL, NULL, '25.00', 2, 1, 1, '2021-07-12 03:02:57', '2021-07-15 12:15:35'),
(7, 3, 3, 2, NULL, NULL, NULL, '25.00', 4, 0, NULL, '2021-07-12 03:06:57', '2021-07-12 09:55:54'),
(8, 3, 3, 1, NULL, NULL, NULL, '25.00', 2, 1, 1, '2021-07-12 03:07:33', '2021-07-15 11:54:08'),
(9, 3, 3, 2, NULL, NULL, '14.00', '25.00', 1, 0, NULL, '2021-07-12 03:14:08', '2021-07-12 03:14:08'),
(10, 3, 3, 2, NULL, NULL, '14.00', '25.00', 1, 0, NULL, '2021-07-12 03:25:55', '2021-07-12 03:25:55'),
(11, 3, 3, 1, '1824.00', '1534.52', '14.00', '25.00', 2, 1, 1, '2021-07-12 03:36:39', '2021-07-15 12:19:30'),
(12, 3, 3, 1, '1824.00', '1534.52', '14.00', '25.00', 2, 1, 1, '2021-07-12 03:37:29', '2021-07-15 12:20:28'),
(13, 3, 3, 1, '1824.00', '1534.52', '14.00', '25.00', 2, 1, 1, '2021-07-12 03:40:09', '2021-07-15 12:22:26'),
(14, 3, 3, 1, NULL, NULL, '14.00', '25.00', 2, 1, 1, '2021-07-12 03:41:03', '2021-07-15 12:23:57'),
(15, 3, 3, 1, NULL, NULL, '14.00', '25.00', 2, 1, 1, '2021-07-12 03:41:39', '2021-07-15 12:26:07'),
(16, 3, 3, 1, '1824.00', '1534.52', '14.00', '25.00', 2, 1, 1, '2021-07-12 03:41:59', '2021-07-15 12:31:19'),
(17, 3, 3, 2, NULL, NULL, '14.00', '25.00', 1, 0, NULL, '2021-07-12 03:43:42', '2021-07-12 03:43:42'),
(18, 3, 3, 1, '1824.00', '1534.52', '14.00', '25.00', 2, 1, 1, '2021-07-12 03:45:20', '2021-07-15 12:43:08'),
(19, 3, 3, 2, '1368.00', '-25.00', '14.00', '25.00', 1, 0, NULL, '2021-07-12 03:45:56', '2021-07-12 03:45:56'),
(20, 3, 3, 10, '1368.00', '-25.00', '14.00', '25.00', 2, 1, 1, '2021-07-12 03:46:23', '2021-07-12 11:22:36'),
(21, 3, 3, 2, '1368.00', '-25.00', '14.00', '25.00', 1, 0, NULL, '2021-07-12 03:47:01', '2021-07-12 03:47:01'),
(22, 3, 3, 2, '1368.00', '-25.00', '14.00', '25.00', 1, 0, NULL, '2021-07-12 03:47:54', '2021-07-12 03:47:54'),
(23, 3, 3, 2, '1368.00', '-25.00', '14.00', '25.00', 1, 0, NULL, '2021-07-12 03:48:57', '2021-07-12 03:48:57'),
(24, 3, 3, 2, '1368.00', '-25.00', '14.00', '25.00', 1, 0, NULL, '2021-07-12 03:49:27', '2021-07-12 03:49:27'),
(25, 3, 3, 2, '1368.00', '-25.00', '14.00', '25.00', 1, 0, NULL, '2021-07-12 03:50:00', '2021-07-12 03:50:00'),
(26, 3, 3, 2, '1368.00', '-25.00', '14.00', '25.00', 2, 1, 1, '2021-07-12 03:51:28', '2021-07-20 15:07:33'),
(27, 3, 3, 2, NULL, NULL, '14.00', '25.00', 1, 0, NULL, '2021-07-12 03:53:46', '2021-07-12 03:53:46'),
(28, 3, 3, 2, '1824.00', '1534.52', '14.00', '25.00', 1, 0, NULL, '2021-07-12 03:56:05', '2021-07-12 03:56:05'),
(29, 3, 3, 2, '1824.00', '1534.52', '14.00', '25.00', 4, 0, NULL, '2021-07-12 04:21:39', '2021-07-12 09:57:02'),
(30, 3, 3, 2, '1824.00', '1534.52', '14.00', '25.00', 1, 0, NULL, '2021-07-12 04:38:37', '2021-07-12 04:38:37'),
(31, 3, 3, 1, '1824.00', '1534.52', '14.00', '25.00', 2, 1, 1, '2021-07-12 04:42:06', '2021-07-15 11:37:40'),
(32, 3, 3, 2, NULL, NULL, '14.00', '25.00', 1, 0, NULL, '2021-07-12 04:42:50', '2021-07-12 04:42:50'),
(33, 3, 3, 2, '1824.00', '1534.52', '14.00', '25.00', 1, 0, NULL, '2021-07-12 04:45:04', '2021-07-12 04:45:04'),
(34, 3, 3, 1, '1824.00', '1534.52', '14.00', '25.00', 2, 1, 1, '2021-07-12 04:45:50', '2021-07-15 11:48:15'),
(35, 3, 3, 1, '1824.00', '1534.52', '14.00', '25.00', 2, 1, 1, '2021-07-12 04:47:07', '2021-07-15 11:51:40'),
(36, 3, 3, 2, '1824.00', '1534.52', '14.00', '25.00', 1, 0, NULL, '2021-07-12 04:48:14', '2021-07-12 04:48:14'),
(37, 3, 3, 2, NULL, NULL, '14.00', '25.00', 1, 0, NULL, '2021-07-12 04:49:35', '2021-07-12 04:49:35'),
(38, 3, 3, 2, '1824.00', '1534.52', '14.00', '25.00', 1, 0, NULL, '2021-07-12 04:52:17', '2021-07-12 11:04:36'),
(39, 3, 3, 2, '1824.00', '1534.52', '14.00', '25.00', 1, 0, NULL, '2021-07-12 04:53:44', '2021-07-12 04:53:44'),
(40, 3, 3, 2, '1824.00', '1534.52', '14.00', '25.00', 1, 0, NULL, '2021-07-12 04:54:13', '2021-07-12 04:54:13');

-- --------------------------------------------------------

--
-- Table structure for table `carts_address`
--

CREATE TABLE `carts_address` (
  `id` int(10) NOT NULL,
  `cart_id` int(10) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `house` varchar(50) DEFAULT NULL,
  `apartment` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `use_for_shipping` int(11) DEFAULT NULL,
  `newsletter` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carts_address`
--

INSERT INTO `carts_address` (`id`, `cart_id`, `type`, `firstname`, `lastname`, `country`, `city`, `street`, `house`, `apartment`, `phone`, `email`, `use_for_shipping`, `newsletter`) VALUES
(1, 20, NULL, 'bill first', 'bill last', 'bill country', 'bill city', 'bill street', 'bill house', 'bill apartment', '049746346833', 'bill@email.me', 0, 1),
(2, 20, NULL, 'ship first', 'ship last', 'ship country', 'ship city', 'ship street', 'ship house', 'ship apartment', '9739476234', 'ship@email.net', 1, 0),
(3, 20, NULL, 'bill first', 'bill last', 'bill country', 'bill city', 'bill street', 'bill house', 'bill apartment', '049746346833', 'bill@email.me', 0, 1),
(4, 20, NULL, 'ship first', 'ship last', 'ship country', 'ship city', 'ship street', 'ship house', 'ship apartment', '9739476234', 'ship@email.net', 1, 0),
(5, 20, NULL, 'bill first', 'bill last', 'bill country', 'bill city', 'bill street', 'bill house', 'bill apartment', '049746346833', 'bill@email.me', 0, 1),
(6, 20, NULL, 'ship first', 'ship last', 'ship country', 'ship city', 'ship street', 'ship house', 'ship apartment', '9739476234', 'ship@email.net', 1, 0),
(7, 31, NULL, 'new first', 'ew last', 'ew country', 'ew city', 'ew street', 'new house', 'newe apartment', '049746346833', 'new@email.me', 0, 1),
(8, 31, NULL, 's first', 'ships last', 'ships country', 'ships city', 'ships street', 'ships house', 'ships apartment', '9739476234', 'shisp@email.net', 1, 0),
(9, 34, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(10, 34, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(11, 34, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(12, 34, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(13, 34, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(14, 34, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(15, 35, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(16, 35, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(17, 8, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(18, 8, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(19, 6, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(20, 6, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(21, 5, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(22, 5, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(23, 11, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(24, 11, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(25, 12, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(26, 12, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(27, 13, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(28, 13, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(29, 14, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(30, 14, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(31, 15, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(32, 15, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(33, 16, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(34, 16, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(35, 16, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(36, 16, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(37, 16, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(38, 16, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(39, 16, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(40, 16, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(41, 16, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(42, 16, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(43, 16, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(44, 16, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(45, 18, NULL, 'ner243rw first', 'e34w last', 'ewr34 country', 'e34rw city', 'er4w street', 'n43ew house', 'ne34we apartment', '049746346833', 'n34ew@email.me', 0, 1),
(46, 18, NULL, 's34r first', 'sr4hips last', 'shir34ps country', 'sh34ips city', 'shir43ps street', 'ship34s house', 'sh43ips apartment', '9739476234', 'shir4sp@email.net', 1, 0),
(47, 26, NULL, 'ztjtjujzru', 'jrzuzki', 'ezutezu', 'rtiruti', 'tzuitzio', 'rfwerwgte', 'wrtgrt', '76567856', 'erfefrerf@ehger.me', 0, 0),
(48, 26, NULL, 'tzjzujww', 'ertert', 'rthezh', 'etzh', 'etzhtju', 'wrthrt', 'wrtztz', '43563456', 'asf@uudfg.me', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `item_id` int(10) NOT NULL,
  `cart_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`item_id`, `cart_id`, `product_id`, `name`, `price`, `sale_price`, `qty`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 148, NULL, NULL, NULL, 3, 0, '2021-07-12 02:56:10', '2021-07-20 04:07:03'),
(2, 1, 145, NULL, NULL, NULL, 1, 0, '2021-07-12 02:56:10', '2021-07-20 04:07:06'),
(3, 6, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:02:57', '2021-07-20 04:07:08'),
(4, 7, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 1, '2021-07-12 03:06:57', '2021-07-12 09:55:54'),
(5, 8, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:07:33', '2021-07-20 04:07:11'),
(6, 9, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:14:08', '2021-07-20 04:07:13'),
(7, 10, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:25:55', '2021-07-20 04:07:15'),
(8, 11, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:36:39', '2021-07-20 04:07:17'),
(9, 11, 145, 'Lanvin Shoes', '345.00', '456.00', 1, 0, '2021-07-12 03:36:39', '2021-07-20 04:07:18'),
(10, 12, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:37:29', '2021-07-20 04:07:20'),
(11, 12, 145, 'Lanvin Shoes', '345.00', '456.00', 1, 0, '2021-07-12 03:37:29', '2021-07-20 04:07:22'),
(12, 13, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:40:09', '2021-07-20 04:07:25'),
(13, 13, 145, 'Lanvin Shoes', '345.00', '456.00', 1, 0, '2021-07-12 03:40:09', '2021-07-20 04:07:27'),
(14, 16, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:41:59', '2021-07-20 04:07:29'),
(15, 16, 145, 'Lanvin Shoes', '345.00', '456.00', 1, 0, '2021-07-12 03:41:59', '2021-07-20 04:11:14'),
(16, 18, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:45:20', '2021-07-20 04:11:17'),
(17, 18, 145, 'Lanvin Shoes', '345.00', '456.00', 1, 0, '2021-07-12 03:45:20', '2021-07-20 04:11:19'),
(18, 19, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:45:56', '2021-07-20 04:11:21'),
(19, 20, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:46:23', '2021-07-20 04:11:23'),
(20, 21, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:47:01', '2021-07-20 04:11:24'),
(21, 22, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:47:54', '2021-07-20 04:11:27'),
(22, 23, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:48:57', '2021-07-20 04:11:29'),
(23, 24, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:49:27', '2021-07-20 04:11:32'),
(24, 25, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:50:00', '2021-07-20 04:11:35'),
(25, 26, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:51:28', '2021-07-20 04:11:38'),
(26, 28, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 03:56:05', '2021-07-20 04:11:40'),
(27, 28, 145, 'Lanvin Shoes', '345.00', '456.00', 1, 0, '2021-07-12 03:56:05', '2021-07-20 04:11:42'),
(28, 29, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 1, '2021-07-12 04:21:39', '2021-07-12 09:57:02'),
(29, 29, 145, 'Lanvin Shoes', '345.00', '456.00', 1, 1, '2021-07-12 04:21:39', '2021-07-12 09:57:02'),
(30, 30, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, 0, '2021-07-12 04:38:37', '2021-07-20 04:11:46'),
(31, 30, 145, 'Lanvin Shoes', '345.00', '456.00', 1, 0, '2021-07-12 04:38:37', '2021-07-20 04:11:48'),
(32, 31, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, NULL, '2021-07-12 04:42:06', '2021-07-12 04:42:06'),
(33, 31, 145, 'Lanvin Shoes', '345.00', '456.00', 1, NULL, '2021-07-12 04:42:06', '2021-07-12 04:42:06'),
(34, 33, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, NULL, '2021-07-12 04:45:04', '2021-07-12 04:45:04'),
(35, 33, 145, 'Lanvin Shoes', '345.00', '456.00', 1, NULL, '2021-07-12 04:45:04', '2021-07-12 04:45:04'),
(36, 34, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, NULL, '2021-07-12 04:45:50', '2021-07-12 04:45:50'),
(37, 34, 145, 'Lanvin Shoes', '345.00', '456.00', 1, NULL, '2021-07-12 04:45:50', '2021-07-12 04:45:50'),
(38, 35, 148, 'Tom Ford Shoes', '345.00', '456.00', 5, NULL, '2021-07-12 04:47:07', '2021-07-12 09:40:36'),
(39, 35, 145, 'Lanvin Shoes', '345.00', '456.00', 1, NULL, '2021-07-12 04:47:07', '2021-07-12 09:40:36'),
(40, 36, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, NULL, '2021-07-12 04:48:14', '2021-07-12 04:48:14'),
(41, 36, 145, 'Lanvin Shoes', '345.00', '456.00', 1, NULL, '2021-07-12 04:48:14', '2021-07-12 04:48:14'),
(42, 38, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, NULL, '2021-07-12 04:52:17', '2021-07-12 11:04:36'),
(43, 38, 145, 'Lanvin Shoes', '345.00', '456.00', 1, NULL, '2021-07-12 04:52:17', '2021-07-12 04:52:17'),
(44, 39, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, NULL, '2021-07-12 04:53:44', '2021-07-12 04:53:44'),
(45, 39, 145, 'Lanvin Shoes', '345.00', '456.00', 1, NULL, '2021-07-12 04:53:44', '2021-07-12 04:53:44'),
(46, 40, 148, 'Tom Ford Shoes', '345.00', '456.00', 3, NULL, '2021-07-12 04:54:13', '2021-07-12 04:54:13'),
(47, 40, 145, 'Lanvin Shoes', '345.00', '456.00', 1, NULL, '2021-07-12 04:54:13', '2021-07-12 04:54:13');

-- --------------------------------------------------------

--
-- Table structure for table `cart_status`
--

CREATE TABLE `cart_status` (
  `status_id` int(10) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_status`
--

INSERT INTO `cart_status` (`status_id`, `name`) VALUES
(1, 'cart'),
(2, 'order'),
(3, 'closed'),
(4, 'deleted');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(10) NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `store_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` tinytext COLLATE utf8mb4_unicode_ci,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `seo_keywords` text COLLATE utf8mb4_unicode_ci,
  `seo_url` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `position` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `parent_id`, `store_id`, `user_id`, `name`, `seo_title`, `seo_description`, `seo_keywords`, `seo_url`, `description`, `created_at`, `updated_at`, `position`, `status`, `deleted`) VALUES
(1, NULL, 1, 3, 'Default', NULL, NULL, NULL, NULL, 'Default', '2021-07-02 02:56:23', '2021-07-19 08:34:42', 1, 1, 0),
(2, NULL, 6, 3, 'hats', NULL, NULL, NULL, NULL, NULL, '2021-07-06 12:16:19', '2021-07-19 08:34:58', 1, 1, 0),
(3, NULL, 6, 3, 'mens', NULL, NULL, NULL, NULL, NULL, '2021-07-06 12:16:19', '2021-07-19 08:35:58', 1, 1, 0),
(4, NULL, 2, 3, 'Classy Men', NULL, NULL, NULL, NULL, NULL, '2021-07-06 12:16:19', '2021-07-19 08:35:08', 1, 1, 0),
(5, NULL, 7, 3, 'Good Hats', NULL, NULL, NULL, NULL, NULL, '2021-07-06 12:16:19', '2021-07-19 08:35:14', 1, 1, 0),
(6, NULL, 7, 3, 'mens wear', NULL, NULL, NULL, NULL, NULL, '2021-07-07 02:26:21', '2021-07-19 08:35:18', 1, 1, 0),
(7, NULL, 4, 3, 'mensshooes', NULL, NULL, NULL, NULL, NULL, '2021-07-07 02:26:21', '2021-07-19 08:35:28', 1, 1, 0),
(8, NULL, 4, 3, 'Classy Men Shoes', NULL, NULL, NULL, NULL, NULL, '2021-07-07 02:26:21', '2021-07-19 08:35:31', 1, 1, 0),
(9, NULL, 1, 3, 'Good Shoes', NULL, NULL, NULL, NULL, NULL, '2021-07-07 02:26:21', '2021-07-19 08:35:34', 1, 1, 0),
(10, NULL, 1, 3, 'hanqseyn mes wear', NULL, NULL, NULL, NULL, NULL, '2021-07-07 02:51:20', '2021-07-19 08:35:37', 1, 1, 0),
(11, NULL, 1, 3, 'hansenymesqshooes', NULL, NULL, NULL, NULL, NULL, '2021-07-07 02:51:20', '2021-07-19 08:35:40', 1, 1, 0),
(12, NULL, 1, 3, 'Classy Hansqny Men Shoes', NULL, NULL, NULL, NULL, NULL, '2021-07-07 02:51:20', '2021-07-19 08:35:43', 1, 1, 0),
(13, NULL, 1, 3, 'Good Hanqny Shoes', NULL, NULL, NULL, NULL, NULL, '2021-07-07 02:51:20', '2021-07-19 08:35:47', 1, 1, 0),
(14, NULL, 4, 3, 'Shirtsyy', NULL, NULL, NULL, NULL, 'Official Shirts', '2021-07-09 11:53:54', '2021-07-19 08:35:52', 2, 1, 0),
(15, NULL, 2, 3, 'Shirts Newest', NULL, NULL, NULL, NULL, 'Official Shirts', '2021-07-12 08:00:07', '2021-07-15 08:16:42', 2, 1, NULL),
(16, NULL, 2, 3, 'Shirts Old', NULL, NULL, NULL, NULL, 'Official Shirts', '2021-07-12 08:08:39', '2021-07-15 08:22:08', 13, 1, 1),
(17, NULL, 2, 3, 'Shirts', NULL, NULL, NULL, NULL, 'Official Shirts', '2021-07-12 08:09:24', '2021-07-14 12:28:52', 1, 1, 1),
(18, NULL, 2, 3, 'Shirts Checked', NULL, NULL, NULL, NULL, 'Official Shirts', '2021-07-12 08:10:49', '2021-07-12 14:36:53', 2, 1, NULL),
(19, NULL, 2, 3, 'Shirts', NULL, NULL, NULL, NULL, 'Official Shirts', '2021-07-12 08:10:51', '2021-07-15 08:22:08', 1, 1, NULL),
(20, NULL, 2, 3, 'Food', NULL, NULL, NULL, NULL, '', '2021-07-12 08:13:37', '2021-07-14 12:28:52', 2, 1, NULL),
(21, NULL, 2, 3, 'children shirts', NULL, NULL, NULL, NULL, 'these are child wears', '2021-07-12 12:07:47', '2021-07-13 11:19:31', 9, 1, 1),
(22, NULL, 2, 3, 'male shirts', NULL, NULL, NULL, NULL, '', '2021-07-12 12:09:21', '2021-07-12 14:19:44', 1, 1, 1),
(23, NULL, 2, 3, 'female shirts', NULL, NULL, NULL, NULL, '', '2021-07-12 12:14:47', '2021-07-15 08:22:08', 2, 1, 1),
(24, 15, 2, 3, 'child wear', NULL, NULL, NULL, NULL, '', '2021-07-12 12:17:10', '2021-07-12 12:17:10', 1, 1, NULL),
(25, 20, 2, 3, 'hard grains', NULL, NULL, NULL, NULL, 'These are supposed to be hard', '2021-07-12 12:45:48', '2021-07-12 14:38:10', 1, 1, NULL),
(26, 25, 2, 3, 'rice', NULL, NULL, NULL, NULL, '', '2021-07-12 12:46:23', '2021-07-12 12:46:23', 1, 1, NULL),
(27, 20, 2, 3, 'hard grains 2', NULL, NULL, NULL, NULL, '', '2021-07-12 16:34:58', '2021-07-12 16:34:58', 1, 1, NULL),
(28, 20, 2, 3, 'hard gr33', NULL, NULL, NULL, NULL, '', '2021-07-12 16:35:10', '2021-07-15 08:39:07', 1, 1, NULL),
(29, 15, 2, 3, 'children wear 2', NULL, NULL, NULL, NULL, '', '2021-07-12 16:41:14', '2021-07-12 16:41:14', 1, 1, NULL),
(30, NULL, 2, 3, 'test 1', NULL, NULL, NULL, NULL, '', '2021-07-13 09:01:11', '2021-07-13 11:17:44', 10, 1, NULL),
(31, NULL, 2, 3, 'test 2', NULL, NULL, NULL, NULL, '', '2021-07-13 09:01:45', '2021-07-13 11:19:31', 1, 1, NULL),
(32, NULL, 2, 3, 'test 3', NULL, NULL, NULL, NULL, '', '2021-07-13 13:02:13', '2021-07-13 13:02:13', 12, 1, NULL),
(33, NULL, 2, 3, 'test 4', NULL, NULL, NULL, NULL, 'description', '2021-07-13 13:02:47', '2021-07-15 08:22:08', 2, 1, NULL),
(34, 30, 2, 3, 'test 1 child', NULL, NULL, NULL, NULL, 'test 1 child', '2021-07-13 13:48:21', '2021-07-13 13:48:21', 14, 1, NULL),
(35, NULL, 2, 3, 'test 5', NULL, NULL, NULL, NULL, 'fifth test', '2021-07-13 13:59:19', '2021-07-13 13:59:19', 14, 1, NULL),
(36, NULL, 11, 14, 'Everything Fashionista', NULL, NULL, NULL, NULL, 'This is for fashionistas', '2021-07-13 14:28:31', '2021-07-14 08:09:38', 2, 1, NULL),
(37, 36, 11, 14, 'Male Fashionista', NULL, NULL, NULL, NULL, 'This is male fashion', '2021-07-13 14:29:28', '2021-07-14 06:52:40', 2, 1, 1),
(38, NULL, 11, 14, 'Electronics', NULL, NULL, NULL, NULL, 'This is for electronics', '2021-07-13 14:29:53', '2021-07-14 08:09:38', 1, 1, NULL),
(39, NULL, 1, 3, 'testcat123456789', NULL, NULL, NULL, NULL, 'testcat1', '2021-07-14 06:46:39', '2021-07-15 08:34:52', 3, 1, NULL),
(40, NULL, 1, 3, 'testcat2', NULL, NULL, NULL, NULL, 'testcat2', '2021-07-14 06:56:34', '2021-07-14 06:56:34', 2, 1, NULL),
(41, 40, 1, 3, 'testcat2.1', NULL, NULL, NULL, NULL, 'testcat2.1', '2021-07-14 06:56:48', '2021-07-14 06:56:48', 3, 1, NULL),
(42, NULL, 1, 3, 'testcat121', NULL, NULL, NULL, NULL, 'testcat121', '2021-07-15 08:09:42', '2021-07-15 08:29:02', 1, 1, 0),
(43, 42, 1, 3, 'testcat122', NULL, NULL, NULL, NULL, 'testcat122', '2021-07-15 08:09:55', '2021-07-15 08:09:55', 4, 1, 0),
(44, NULL, 9, 34, '12312312', NULL, NULL, NULL, NULL, '321321313', '2021-07-15 08:15:02', '2021-07-15 08:15:02', 1, 1, 0),
(45, 44, 9, 34, '123123213', NULL, NULL, NULL, NULL, '1231231', '2021-07-15 08:15:11', '2021-07-15 08:15:11', 2, 1, 0),
(46, 42, 1, 3, 'testcat12111', NULL, NULL, NULL, NULL, 'testcat12111', '2021-07-15 08:16:14', '2021-07-15 08:16:14', 4, 1, 0),
(47, NULL, 7, 3, 'New Categ.', NULL, NULL, NULL, NULL, 'New Categ.', '2021-07-15 08:25:09', '2021-07-15 08:25:09', 1, 1, NULL),
(48, NULL, 6, 3, 'cate new', NULL, NULL, NULL, NULL, 'categoryyy new', '2021-07-15 08:41:01', '2021-07-15 08:42:23', 1, 1, NULL),
(49, NULL, 2, 3, 'SEO category', NULL, NULL, NULL, NULL, 'Category with seo', '2021-07-16 09:53:10', '2021-07-16 09:53:10', 15, 1, NULL),
(50, NULL, 1, 3, 'Shirfftsyy -50 ', NULL, NULL, NULL, NULL, 'Official Shirts', '2021-07-16 10:18:49', '2021-07-16 10:31:51', 2, 1, NULL),
(51, 0, 2, 3, 'Meta Test', NULL, NULL, NULL, NULL, 'New Meta Test', '2021-07-22 03:41:47', '2021-07-22 03:41:47', 2, 1, NULL),
(52, 0, 2, 3, 'Meta Testa', NULL, NULL, NULL, NULL, 'New Meta Tesat', '2021-07-22 03:42:51', '2021-07-22 03:42:51', 2, 1, NULL),
(53, 0, 2, 3, 'Metay Testa', NULL, NULL, NULL, NULL, 'Newy Meta Tesat', '2021-07-22 03:45:07', '2021-07-22 03:45:07', 2, 1, NULL),
(54, 0, 2, 3, 'Metay Testa', NULL, NULL, NULL, NULL, 'Newy Meta Tesat', '2021-07-22 03:52:21', '2021-07-22 03:52:21', 2, 1, NULL),
(55, 0, 2, 3, 'Metay Testa', NULL, NULL, NULL, NULL, 'Newy Meta Tesat', '2021-07-22 03:52:27', '2021-07-22 03:52:27', 2, 1, NULL),
(56, 0, 2, 3, 'Metay Testa', NULL, NULL, NULL, NULL, 'Newy Meta Tesat', '2021-07-22 03:55:57', '2021-07-22 03:55:57', 2, 1, NULL),
(57, 0, 2, 3, 'Metay Testass', NULL, NULL, NULL, NULL, 'Newy Meta Tesatsss 57', '2021-07-22 04:08:22', '2021-07-22 05:46:44', 2, 1, NULL),
(58, NULL, 1, 3, 'test meta', NULL, NULL, NULL, NULL, 'meta description', '2021-07-23 11:58:54', '2021-07-23 11:58:54', 11, 1, NULL),
(59, NULL, 1, 3, 'new meta category', NULL, NULL, NULL, NULL, 'desc', '2021-07-23 12:25:50', '2021-07-23 12:25:50', 12, 1, NULL),
(60, 0, 2, 3, 'hsrths', NULL, NULL, NULL, NULL, 'sfhsfghsf', '2021-07-23 12:40:01', '2021-07-23 12:40:01', 2, 1, NULL),
(61, NULL, 1, 3, 'test category edited', NULL, NULL, NULL, NULL, 'test description', '2021-07-23 13:03:46', '2021-07-23 14:27:02', 13, 1, NULL),
(62, 64, 5, 3, 'First category edited', NULL, NULL, NULL, NULL, 'The first category edited', '2021-07-23 17:13:02', '2021-07-23 17:21:42', 1, 1, NULL),
(63, 62, 5, 3, 'First SubCategory', NULL, NULL, NULL, NULL, 'sub', '2021-07-23 17:16:28', '2021-07-23 17:16:28', 2, 1, NULL),
(64, NULL, 5, 3, 'second', NULL, NULL, NULL, NULL, '', '2021-07-23 17:19:24', '2021-07-23 17:19:24', 2, 1, NULL),
(65, NULL, 5, 3, 'third', NULL, NULL, NULL, NULL, '', '2021-07-23 17:23:53', '2021-07-23 17:23:53', 2, 1, NULL),
(66, 0, 2, 3, 'new categooory', NULL, NULL, NULL, NULL, 'new categ. description', '2021-07-26 05:27:57', '2021-07-26 05:27:57', 2, 1, NULL),
(67, 0, 2, 3, 'new wefwewg', 'new categories seo title', 'new cate seovegerg description', 'keyword1, keyword2, keyword3', '/new_categ', 'new cat cription', '2021-07-26 05:36:37', '2021-07-26 05:36:37', 2, 1, NULL),
(68, NULL, 12, 3, 'seo category', 'seo title', 'seo description', 'key,word', '', 'seo params ', '2021-07-26 09:15:28', '2021-07-26 09:15:28', 1, 1, NULL),
(69, 0, 2, 3, 'hztzhh', 'fwrfee5t', 't45t45t', 'ert3545t', '5t45t45', 'tzhetzh', '2021-07-26 09:28:21', '2021-07-26 09:28:21', 2, 1, NULL),
(70, NULL, 12, 3, 'Shirts New', 'seo title', 'hue', 'gree,ghoul', '', 'cat_hyg', '2021-07-26 09:48:26', '2021-07-26 09:48:26', 2, 1, NULL),
(71, NULL, 3, 3, 'Testing Category', 'seo title', 'description under seo', 'seo,megastore,description', '', 'Category To test', '2021-07-26 09:54:10', '2021-07-26 09:54:10', 1, 1, NULL),
(72, NULL, 3, 3, 'Testing Category 22', 'no seo title', 'No seo meta description', 'seo,megastore,description,adef,wref,frer', '', 'New 22 Description', '2021-07-26 10:10:55', '2021-07-26 10:10:55', 2, 1, NULL),
(73, 72, 3, 3, 'Testing Category 23', 'no seo title 23', '23r3t4q45t4z545wz645z6', 'z65zw56z5,h56h56h56,h56h56h56,h56h56h5657', '', 'gwrgrzwrtrgwrt', '2021-07-26 10:14:39', '2021-07-26 10:14:39', 3, 1, NULL),
(74, 71, 3, 3, 'Testing Category 24', 'wrthwrhwtzj', 'jetzetzhtrzhetz', 'eht,etzh,k57,k,8l6,l896,7j,rhe,zr', '', 'fergwrtwrzhw', '2021-07-26 10:16:43', '2021-07-26 10:16:43', 3, 1, NULL),
(75, 72, 3, 3, 'Testing Category 25', 'no seo title 25', 'qtegwrthw5hw65z', 'z65zw56z5,h56h56h56,h56h56h56,h56h56h5657,rthzh,uj,7kj7,k7k', '', 'Category 25 Description', '2021-07-26 10:21:26', '2021-07-26 10:21:26', 3, 1, NULL),
(76, 68, 12, 3, 'new test edited', 'seo title', 'seo description', 'key,word', '', 'testy seo', '2021-07-26 10:28:24', '2021-07-26 11:20:13', 3, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `discount_id` int(10) NOT NULL,
  `store_id` int(10) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `priority` int(10) DEFAULT NULL,
  `code` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts_conditions`
--

CREATE TABLE `discounts_conditions` (
  `rule_id` int(10) NOT NULL,
  `discount_id` int(10) DEFAULT NULL,
  `position` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE `domains` (
  `domain_id` int(10) NOT NULL,
  `store_id` int(10) DEFAULT NULL,
  `url` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` int(10) DEFAULT NULL,
  `deleted` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(10) NOT NULL,
  `product_id` int(10) DEFAULT NULL,
  `location_id` int(10) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `type` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `product_id`, `location_id`, `qty`, `type`) VALUES
(1, 384, 1, 340, NULL),
(2, 385, 1, 45, NULL),
(3, 386, 1, 789, NULL),
(4, 387, 1, 5346, NULL),
(5, 388, 1, 123, NULL),
(6, 389, 1, 789, NULL),
(22, 435, 1, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_locations`
--

CREATE TABLE `inventory_locations` (
  `location_id` int(10) NOT NULL,
  `location_name` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_locations`
--

INSERT INTO `inventory_locations` (`location_id`, `location_name`) VALUES
(1, 'Main Warehouse');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_type`
--

CREATE TABLE `inventory_type` (
  `inventory_type_id` int(10) NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `menu_id` int(10) NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `store_id` int(10) NOT NULL,
  `deleted` int(10) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`menu_id`, `parent_id`, `store_id`, `deleted`, `name`, `link`, `status`, `position`, `created_at`, `updated_at`) VALUES
(1, 0, 2, 1, 'Menus Store 2', 'http://localhost.com/menu2', 2, 1, '2021-07-13 14:20:38', '2021-07-13 14:31:03'),
(2, 0, 2, NULL, 'menu2', 'http://goolge.co.ke', 1, 1, '2021-07-14 15:25:52', '2021-07-14 15:25:52');

-- --------------------------------------------------------

--
-- Table structure for table `meta_fields`
--

CREATE TABLE `meta_fields` (
  `meta_id` int(10) NOT NULL,
  `type` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `meta_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_fields`
--

INSERT INTO `meta_fields` (`meta_id`, `type`, `product_id`, `category_id`, `meta_key`, `value`) VALUES
(1, NULL, 255, NULL, 'GLOBAL', 'TEST'),
(15, 1, NULL, 57, 'Meta Key 15', 'Meta Val 2'),
(17, 1, NULL, 57, 'Meta Key 453', 'Meta V43l 2'),
(18, 1, NULL, 57, 'Meta Key 345', 'Meta Val34 2'),
(19, NULL, 338, NULL, '57u67utwe', '5tw4z557u467u4'),
(20, NULL, 338, NULL, '356z65u7468i5795', '56ze57u468i587k45u47u'),
(21, NULL, 338, NULL, 'he76u467iu4587i578i', '57u467u467i468i47968iu476u'),
(22, NULL, 343, NULL, '45twz6435w6z', '356z57ue67ur6krjj7h'),
(23, NULL, 349, NULL, '678i78ehrthe', 'jr68i5r867u7ur8kir'),
(24, 1, NULL, 58, 'key 1', 'value 1'),
(25, 1, NULL, 59, 'new meta', 'meta val'),
(26, 1, NULL, 60, 'dtjzdtuj', 'jutjdzu'),
(27, 1, NULL, 60, 'jtdzjetz', 'hetzhetzjetz'),
(28, NULL, 361, NULL, '356z356u', 'u57467u467'),
(29, 1, NULL, 61, 'meta 1 edited', 'value 1'),
(30, 1, NULL, 61, 'meta 2', 'value 2 edited'),
(31, NULL, 367, NULL, 'w45zw56z5e6u', 'e7u68i7uez56e56z'),
(32, NULL, 375, NULL, 'meta 1', 'meta value'),
(33, 1, NULL, 62, 'category 1 key edited', 'category 1 value edited'),
(34, 1, NULL, 63, 'meta 1', 'value 1'),
(35, NULL, 378, NULL, 'WSFREAGTWRHW', 'RZHWRHZEWRTHGWRTGWS'),
(36, NULL, 380, NULL, 'etgwrwrth', 'rwthrthwtgrtg'),
(37, NULL, 380, NULL, 'wrtgwrtrwzhwrtg', 'wrtgrwthrzhtzuwrhztgeg'),
(38, NULL, 380, NULL, 'ergwethrwzhrzhw', 'wtrgrwhwrthtrgtrgwrt'),
(39, NULL, 380, NULL, 'wrthwrzhwrzhwrtgerger', 'ergetgrhrzhwrtgteg'),
(40, NULL, 380, NULL, 'wegtrrwthwrzhwrh', 'rtgrwthrzhrzhrthwrtgrt'),
(41, NULL, 384, NULL, '578i579o7i', '578i578i57o79o689o'),
(42, NULL, 384, NULL, '98o689o698o6', '689869869o'),
(43, NULL, 384, NULL, '689o689680p686', '69o689o689lk6uiktuik'),
(44, NULL, 384, NULL, 'kiktuit78i5857tzu', '78i578itzuzuir67i'),
(45, NULL, 384, NULL, '78i578i57itzu', 'tzuitzit78i7i578i57'),
(46, NULL, 384, NULL, '578i578i578o57o95i5', '78i578i578itzktzukti78i'),
(49, 1, NULL, 66, 'dtjzdtuj', 'jutjdzu'),
(50, 1, NULL, 66, 'jtdzjetz', 'hetzhetzjetz'),
(51, 1, NULL, 67, 'eu57u56z', 'z56z56u5'),
(52, 1, NULL, 67, '56z56z56z', '56z56z56z'),
(53, 1, NULL, 67, 'u57u67u', '56z5u57u'),
(54, 1, NULL, 67, 'z653z356', 'w6ztrzw56z56'),
(55, NULL, 390, NULL, 'key 1', 'value 1'),
(56, 1, NULL, 69, '45t445zt4', 't45t245z'),
(57, 1, NULL, 69, '45zt45', '45t425z64'),
(58, 1, NULL, 75, '8906i57857k578j', 'jjtzuikjzhtz56h356z56'),
(59, 1, NULL, 75, 'z56z35hj653ue7h', 'he7euje67jhe67hje67hje'),
(60, 1, NULL, 76, 'key 1', 'value 1'),
(61, 1, NULL, 76, 'key 2', 'value 2'),
(62, NULL, 392, NULL, 'meta', 'key'),
(63, NULL, 394, NULL, 'one', 'val one'),
(64, NULL, 396, NULL, 'key 1', 'value 1'),
(65, NULL, 398, NULL, 'key 1', 'value 1'),
(66, NULL, 404, NULL, 'color', 'color'),
(67, NULL, 404, NULL, 'colora', 'colora'),
(68, NULL, 409, NULL, '57u46rjrj6', '7jre67ujr6j67jr6j'),
(69, NULL, 409, NULL, 'jrj7r67u6r7u', 'r67ur67ur67jr6jr'),
(70, NULL, 415, NULL, 'key 1', 'value 1'),
(71, NULL, 420, NULL, 'qerfqergqegq4eg', 'qetgqetqgtq45gq45egttq');

-- --------------------------------------------------------

--
-- Table structure for table `meta_field_types`
--

CREATE TABLE `meta_field_types` (
  `type_id` int(11) NOT NULL,
  `type_name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_field_types`
--

INSERT INTO `meta_field_types` (`type_id`, `type_name`) VALUES
(1, 'categories'),
(2, 'products');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(10) NOT NULL,
  `store_id` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `store_id`, `status`, `title`, `content`, `link`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 2, 10, '1', '1', 'http://example.com/page1', NULL, '2021-07-13 08:45:03', '2021-07-13 08:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) NOT NULL,
  `parent_id` int(10) NOT NULL DEFAULT '0',
  `user_id` int(10) NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `sale_start` timestamp NULL DEFAULT NULL,
  `sale_end` timestamp NULL DEFAULT NULL,
  `drop_price` decimal(10,2) DEFAULT '0.00',
  `drop_sale_price` decimal(10,2) DEFAULT '0.00',
  `drop_sale_start` timestamp NULL DEFAULT NULL,
  `drop_sale_end` timestamp NULL DEFAULT NULL,
  `seo_title` tinytext COLLATE utf8mb4_unicode_ci,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `seo_url` text COLLATE utf8mb4_unicode_ci,
  `seo_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` int(10) DEFAULT '1',
  `drop_status` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `parent_id`, `user_id`, `sku`, `name`, `short_description`, `description`, `price`, `sale_price`, `sale_start`, `sale_end`, `drop_price`, `drop_sale_price`, `drop_sale_start`, `drop_sale_end`, `seo_title`, `seo_description`, `seo_url`, `seo_keywords`, `status`, `drop_status`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 0, 3, 'SKUBT1', 'Timberland Boots', 'Botts', 'Boots', '30.00', '50.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 01:22:13', '2021-07-02 01:22:13', NULL),
(2, 0, 3, 'SKUMCS', 'Mocassin Loafers', 'loafers', 'Loafers', '30.00', '50.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 01:27:29', '2021-07-02 01:27:29', NULL),
(3, 0, 3, 'SKUSNKS1', 'Adidas Sneakers', 'Sneakers', 'Sneakers', '40.00', '50.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 01:33:41', '2021-07-02 01:33:41', NULL),
(4, 0, 3, 'SKUSTLT1', 'DreamPairs Stilletos', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 01:40:38', '2021-07-02 01:40:38', NULL),
(5, 0, 3, 'SKUSTLT2', 'DreamPairs Stilletos 2', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 01:43:14', '2021-07-02 01:43:14', NULL),
(6, 0, 3, 'SKUSTLT3', 'DreamPairs Stilletos 3', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 01:44:59', '2021-07-02 01:44:59', NULL),
(7, 0, 3, 'SKUSTLT4', 'DreamPairs Stilletos 4', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 01:48:03', '2021-07-02 01:48:03', NULL),
(8, 0, 3, 'SKUSTLT5', 'DreamPairs Stilletos 5', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 01:51:30', '2021-07-02 01:51:30', NULL),
(9, 0, 3, 'SKUSTLT6', 'DreamPairs Stilletos 6', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 01:53:04', '2021-07-02 01:53:04', NULL),
(10, 0, 3, 'SKUSTLT7', 'DreamPairs Stilletos 7', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 01:54:08', '2021-07-02 01:54:08', NULL),
(11, 0, 3, 'SKUSTLT8', 'DreamPairs Stilletos 8', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 01:54:57', '2021-07-02 01:54:57', NULL),
(12, 0, 3, 'SKUSTLT9', 'DreamPairs Stilletos 9', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 01:56:38', '2021-07-02 01:56:38', NULL),
(13, 0, 3, 'SKUSTLT11', 'DreamPairs Stilletos 11', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:05:26', '2021-07-02 02:05:26', NULL),
(14, 0, 3, 'SKUSTLT12', 'DreamPairs Stilletos 12', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:07:35', '2021-07-02 02:07:35', NULL),
(15, 0, 3, 'SKUSTLT13', 'DreamPairs Stilletos 13', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:08:49', '2021-07-02 02:08:49', NULL),
(16, 0, 3, 'SKUSTLT14', 'DreamPairs Stilletos 14', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:11:20', '2021-07-02 02:11:20', NULL),
(17, 0, 3, 'SKUSTLT15', 'DreamPairs Stilletos 15', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:12:57', '2021-07-02 02:12:57', NULL),
(18, 0, 3, 'SKUSTLT16', 'DreamPairs Stilletos 16', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:14:30', '2021-07-02 02:14:30', NULL),
(19, 0, 3, 'SKUSTLT17', 'DreamPairs Stilletos 17', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:16:31', '2021-07-02 02:16:31', NULL),
(20, 0, 3, 'SKUSTLT19', 'DreamPairs Stilletos 19', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:22:00', '2021-07-02 02:22:00', NULL),
(21, 0, 3, 'SKUSTLT20', 'DreamPairs Stilletos 20', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:23:08', '2021-07-02 02:23:08', NULL),
(22, 0, 3, 'SKUSTLT21', 'DreamPairs Stilletos 21', 'Stilletos', 'Stilletos', '45.00', '56.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:25:01', '2021-07-02 02:25:01', NULL),
(23, 0, 3, 'SKUHVN', 'Havana Flip Flops', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:29:32', '2021-07-02 02:29:32', NULL),
(24, 0, 3, 'SKUHVN1', 'Havana Flip Flops 1', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:31:14', '2021-07-02 02:31:14', NULL),
(25, 0, 3, 'SKUHVN3', 'Havana Flip Flops 3', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:32:41', '2021-07-02 02:32:41', NULL),
(26, 0, 3, 'SKUHVN4', 'Havana Flip Flops 4', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:37:00', '2021-07-02 02:37:00', NULL),
(27, 0, 3, 'SKUHVN5', 'Havana Flip Flops 5', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:56:48', '2021-07-02 02:56:48', NULL),
(28, 0, 3, 'SKUHVN6', 'Havana Flip Flops 6', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 02:59:23', '2021-07-02 02:59:23', NULL),
(29, 0, 3, 'SKUHVN7', 'Havana Flip Flops 7', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 03:04:52', '2021-07-02 03:04:52', NULL),
(30, 0, 3, 'SKUHVN8', 'Havana Flip Flops 8', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 03:06:08', '2021-07-02 03:06:08', NULL),
(31, 0, 3, 'SKUHVN9', 'Havana Flip Flops 9', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 03:10:43', '2021-07-02 03:10:43', NULL),
(32, 0, 3, 'SKUHVN11', 'Havana Flip Flops 11', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 03:25:27', '2021-07-02 03:25:27', NULL),
(33, 0, 3, 'SKUHVN12', 'Havana Flip Flops 12', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 03:26:46', '2021-07-02 03:26:46', NULL),
(34, 0, 3, 'SKUHVN13', 'Havana Flip Flops 13', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 03:32:53', '2021-07-02 03:32:53', NULL),
(35, 0, 3, 'SKUHVN14', 'Havana Flip Flops 14', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 03:34:39', '2021-07-02 03:34:39', NULL),
(36, 0, 3, 'SKUHVN15', 'Havana Flip Flops 15', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 03:35:55', '2021-07-02 03:35:55', NULL),
(37, 0, 3, 'SKUHVN16', 'Havana Flip Flops 16', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 03:39:07', '2021-07-02 03:39:07', NULL),
(38, 0, 3, 'SKUHVN1', 'Havana Flip Flops 18', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 03:40:40', '2021-07-02 03:40:40', NULL),
(39, 0, 3, 'SKUHVN19', 'Havana Flip Flops 19', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 03:41:44', '2021-07-02 03:41:44', NULL),
(40, 0, 3, 'SKUHVN20', 'Havana Flip Flops 20', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 03:42:52', '2021-07-02 03:42:52', NULL),
(41, 40, 3, 'HVNFLPV20', '', '', '', '20.00', '30.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 03:42:52', '2021-07-02 03:42:52', NULL),
(42, 0, 3, 'SKUHVN21', 'Havana Flip Flops 21', 'Flip Flops', 'Flip Flops', '45.00', '325.00', '2021-07-04 21:00:00', '2021-07-29 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 03:44:45', '2021-07-02 03:44:45', NULL),
(43, 42, 3, 'HVNFLPV21', '', '', '', '20.00', '30.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 03:44:45', '2021-07-02 03:44:45', NULL),
(44, 0, 3, 'sku', 'name', 'desc', 'description', '38.00', '45.00', '2021-07-13 21:00:00', '2021-07-20 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 08:11:17', '2021-07-02 08:11:17', NULL),
(45, 0, 3, 'SKUSHRT01', 'Henley Shirt', 'Henley Shirt Description', 'Henley Shirt Description', '34.00', '90.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 09:33:25', '2021-07-02 09:33:25', NULL),
(46, 45, 3, 'SKUHNLB', '', '', '', '30.00', '60.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 09:33:25', '2021-07-02 09:33:25', NULL),
(47, 0, 3, 'SKUSHRT011', 'Henley Shirt 1', 'Henley Shirt Description', 'Henley Shirt Description', '34.00', '90.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 09:35:54', '2021-07-02 09:35:54', NULL),
(48, 0, 3, 'SKUSHRT012', 'Henley Shirt 2', 'Henley Shirt Description', 'Henley Shirt Description', '34.00', '90.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 09:39:27', '2021-07-02 09:39:27', NULL),
(49, 0, 3, 'SKUSHRT013', 'Henley Shirt 3', 'Henley Shirt Description', 'Henley Shirt Description', '34.00', '90.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 09:41:45', '2021-07-02 09:41:45', NULL),
(50, 0, 3, 'SKUSHRT014', 'Henley Shirt 4', 'Henley Shirt Description', 'Henley Shirt Description', '34.00', '90.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 09:56:18', '2021-07-02 09:56:18', NULL),
(51, 0, 3, 'SKUSHRT015', 'Henley Shirt 5', 'Henley Shirt Description', 'Henley Shirt Description', '34.00', '90.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 10:05:45', '2021-07-02 10:05:45', NULL),
(52, 0, 3, 'PRD3', 'Polo Shirt', 'Polo shirt', 'Polo Shirt', '40.00', '69.00', '2021-07-04 21:00:00', '2021-07-28 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 10:43:10', '2021-07-02 10:43:10', NULL),
(53, 0, 3, 'CRCS1', 'Crocs', 'Crocs', 'Crocs', '10.00', '20.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 10:47:49', '2021-07-02 10:47:49', NULL),
(54, 53, 3, 'cs86tf86t4', '', '', '', '40.00', '50.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 10:47:49', '2021-07-02 10:47:49', NULL),
(55, 0, 3, 'CRCS23', 'Crock', 'Crocs', 'Crocs', '10.00', '20.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 10:56:09', '2021-07-02 10:56:09', NULL),
(56, 0, 3, 'CRCS5', 'Crocks', 'Crocs', 'Crocs', '10.00', '20.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 10:59:04', '2021-07-02 10:59:04', NULL),
(57, 56, 3, 'r243r24', '', '', '', '40.00', '50.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 10:59:04', '2021-07-02 10:59:04', NULL),
(58, 0, 3, 'CRCS5', 'Crocks', 'Crocs', 'Crocs', '10.00', '20.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 10:59:29', '2021-07-02 10:59:29', NULL),
(59, 58, 3, 'r243r24', '', '', '', '40.00', '50.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 10:59:29', '2021-07-02 10:59:29', NULL),
(60, 0, 3, 'FCMK3', 'face Masks', 'face Masks', 'face Masks', '10.00', '20.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 11:03:23', '2021-07-02 11:03:23', NULL),
(61, 0, 3, 'FCMK33', 'face Mask', 'face Masks', 'face Masks', '10.00', '20.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 11:06:40', '2021-07-02 11:06:40', NULL),
(62, 0, 3, 'HT34', 'Top Hat', 'Top Hat', 'Top Hat', '10.00', '20.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 11:08:50', '2021-07-02 11:08:50', NULL),
(63, 0, 3, 'HT342', 'Top Hat 22', 'Top Hat', 'Top Hat', '10.00', '20.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 11:10:41', '2021-07-02 11:10:41', NULL),
(64, 0, 3, 'HT35', 'Top Hat 225', 'Top Hat', 'Top Hat', '10.00', '20.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 11:16:13', '2021-07-02 11:16:13', NULL),
(65, 64, 3, '5t45', '', '', '', '40.00', '50.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 11:16:13', '2021-07-02 11:16:13', NULL),
(66, 0, 3, 'HT356', 'Top Hat 26', 'Top Hat', 'Top Hat', '10.00', '20.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 11:18:41', '2021-07-02 11:18:41', NULL),
(67, 66, 3, '5t456', '', '', '', '40.00', '50.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 11:18:41', '2021-07-02 11:18:41', NULL),
(68, 0, 3, 'HT32', 'Top Hat 261', 'Top Hat', 'Top Hat', '10.00', '20.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 11:24:18', '2021-07-02 11:24:18', NULL),
(69, 68, 3, 'z56zz', '', '', '', '40.00', '50.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-02 11:24:18', '2021-07-02 11:24:18', NULL),
(70, 0, 3, 'SKUBRC01', 'HermÃ¨s Bracelets', 'Bracelets', 'Bracelets', '50.00', '90.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 06:52:42', '2021-07-05 06:52:42', NULL),
(71, 70, 3, 'SKUBRCSLV01', '', '', '', '60.00', '90.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 06:52:42', '2021-07-05 06:52:42', NULL),
(72, 0, 3, 'SKUBRC4', 'HermÃ¨s Bracelets', 'Bracelets', 'Bracelets', '50.00', '90.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 08:00:06', '2021-07-05 08:00:06', NULL),
(73, 0, 3, 'SKUBRC45', 'HermÃ¨s Bracelets', 'Bracelets', 'Bracelets', '50.00', '90.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 08:01:37', '2021-07-05 08:01:37', NULL),
(74, 0, 3, 'SKUBRC456', 'HermÃ¨s Bracelets', 'Bracelets', 'Bracelets', '50.00', '90.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 08:02:36', '2021-07-05 08:02:36', NULL),
(75, 74, 3, 'SKUBRCSL456', '', '', '', '60.00', '90.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 08:02:36', '2021-07-05 08:02:36', NULL),
(76, 0, 3, 'SKUBRC77', 'HermÃ¨s Bracelets', 'Bracelets', 'Bracelets', '50.00', '90.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 08:12:28', '2021-07-05 08:12:28', NULL),
(77, 0, 3, 'SKUBRC79', 'HermÃ¨s Bracelets', 'Bracelets', 'Bracelets', '50.00', '90.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 08:15:08', '2021-07-05 08:15:08', NULL),
(78, 0, 3, 'SKUBRC7901', 'HermÃ¨s Bracelets', 'Bracelets', 'Bracelets', '50.00', '90.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 08:16:42', '2021-07-05 08:16:42', NULL),
(79, 0, 3, 'SKUBRC79012', 'HermÃ¨s Bracelets', 'Bracelets', 'Bracelets', '50.00', '90.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 08:18:40', '2021-07-05 08:18:40', NULL),
(80, 0, 3, 'SKUBRC7124', 'HermÃ¨s Bracelets', 'Bracelets', 'Bracelets', '50.00', '90.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 08:19:26', '2021-07-05 08:19:26', NULL),
(81, 0, 3, 'SKUBRC73434', 'HermÃ¨s Bracelets', 'Bracelets', 'Bracelets', '50.00', '90.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 08:32:55', '2021-07-05 08:32:55', NULL),
(82, 0, 3, 'SKUBRC73434333', 'HermÃ¨s Bracelets', 'Bracelets', 'Bracelets', '50.00', '90.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 08:33:39', '2021-07-05 08:33:39', NULL),
(83, 0, 3, 'SKUBR4997', 'HermÃ¨s Bracelets', 'Bracelets', 'Bracelets', '50.00', '90.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 08:40:46', '2021-07-05 08:40:46', NULL),
(84, 83, 3, 'SKUBRC3r34t3223', '', '', '', '60.00', '90.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 08:40:46', '2021-07-05 08:40:46', NULL),
(85, 0, 3, 'SKUBRC97', 'HermÃ¨s Bracelets', 'Bracelets', 'Bracelets', '50.00', '90.00', '2021-07-04 21:00:00', '2021-07-27 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 08:42:28', '2021-07-05 08:42:28', NULL),
(86, 85, 3, 'SKUBRC53523', '', '', '', '60.00', '90.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-05 08:42:28', '2021-07-05 08:42:28', NULL),
(87, 0, 3, '10001', 'LV1', 'LV1', 'LV1 LV1 LV1', '10.00', '9.00', '2021-07-05 21:00:00', '2021-07-08 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 06:23:44', '2021-07-06 06:23:44', NULL),
(88, 87, 3, '10001a', 'lv1a', '', '', '9.00', '8.00', '2021-07-05 21:00:00', '2021-07-07 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 06:23:44', '2021-07-06 06:23:44', NULL),
(89, 87, 3, '10001b', 'lv1b', '', '', '11.00', '10.00', '2021-07-05 21:00:00', '2021-07-07 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 06:23:44', '2021-07-06 06:23:44', NULL),
(90, 0, 3, '10001', 'LV1', 'LV1', 'LV1 LV1 LV1', '10.00', '9.00', '2021-07-05 21:00:00', '2021-07-08 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 06:23:47', '2021-07-06 06:23:47', NULL),
(91, 90, 3, '10001a', 'lv1a', '', '', '9.00', '8.00', '2021-07-05 21:00:00', '2021-07-07 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 06:23:47', '2021-07-06 06:23:47', NULL),
(92, 90, 3, '10001b', 'lv1b', '', '', '11.00', '10.00', '2021-07-05 21:00:00', '2021-07-07 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 06:23:47', '2021-07-06 06:23:47', NULL),
(93, 0, 3, '10001', 'LV1', 'LV1', 'LV1 LV1 LV1', '10.00', '9.00', '2021-07-05 21:00:00', '2021-07-08 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 06:23:51', '2021-07-06 06:23:51', NULL),
(94, 93, 3, '10001a', 'lv1a', '', '', '9.00', '8.00', '2021-07-05 21:00:00', '2021-07-07 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 06:23:51', '2021-07-06 06:23:51', NULL),
(95, 93, 3, '10001b', 'lv1b', '', '', '11.00', '10.00', '2021-07-05 21:00:00', '2021-07-07 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 06:23:51', '2021-07-06 06:23:51', NULL),
(96, 0, 3, '10001', 'LV1', 'LV1', 'LV1 LV1 LV1', '10.00', '9.00', '2021-07-05 21:00:00', '2021-07-08 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 06:23:54', '2021-07-06 06:23:54', NULL),
(97, 96, 3, '10001a', 'lv1a', '', '', '9.00', '8.00', '2021-07-05 21:00:00', '2021-07-07 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 06:23:54', '2021-07-06 06:23:54', NULL),
(98, 96, 3, '10001b', 'lv1b', '', '', '11.00', '10.00', '2021-07-05 21:00:00', '2021-07-07 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 06:23:54', '2021-07-06 06:23:54', NULL),
(99, 0, 3, '1009', 'Nike Shoe', 'This is a nice nike shoe', 'This is a very nice nike shoe', '503.00', '450.00', '2021-07-07 21:00:00', '2021-07-13 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 07:57:40', '2021-07-06 07:57:40', NULL),
(100, 0, 3, '1090', 'LG TV', 'great lg tv', 'very great lg tv', '378.00', '350.00', '2021-07-07 21:00:00', '2021-07-13 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:08:16', '2021-07-06 08:08:16', NULL),
(101, 0, 3, 'SKUNDMSW', 'Naadam  Sweaters', 'Naadam  Sweaters', 'Naadam  Sweaters', '20.00', '30.00', '2021-07-03 21:00:00', '2021-07-21 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:23:18', '2021-07-06 08:23:18', NULL),
(102, 101, 3, 'ZRIFZ755', '', '', '', '10.00', '7.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:23:18', '2021-07-06 08:23:18', NULL),
(103, 0, 3, '10002', 'LV2', 'LV2', 'LV2 LV2', '11.00', '10.00', '2021-07-06 21:00:00', '2021-07-08 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:26:09', '2021-07-06 08:26:09', NULL),
(104, 103, 3, '10002a', '', '', '', '11.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:26:09', '2021-07-06 08:26:09', NULL),
(105, 103, 3, '10002b', '', '', '', '11.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:26:09', '2021-07-06 08:26:09', NULL),
(106, 103, 3, '10002c', '', '', '', '11.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:26:09', '2021-07-06 08:26:09', NULL),
(107, 0, 3, '10002', 'LV2', 'LV2', 'LV2 LV2', '11.00', '10.00', '2021-07-06 21:00:00', '2021-07-08 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:26:37', '2021-07-06 08:26:37', NULL),
(108, 107, 3, '10002a', '', '', '', '11.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:26:37', '2021-07-06 08:26:37', NULL),
(109, 107, 3, '10002b', '', '', '', '11.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:26:37', '2021-07-06 08:26:37', NULL),
(110, 107, 3, '10002c', '', '', '', '11.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:26:37', '2021-07-06 08:26:37', NULL),
(111, 0, 3, '10002', 'LV2', 'LV2', 'LV2 LV2', '11.00', '10.00', '2021-07-06 21:00:00', '2021-07-08 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:26:39', '2021-07-06 08:26:39', NULL),
(112, 111, 3, '10002a', '', '', '', '11.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:26:39', '2021-07-06 08:26:39', NULL),
(113, 111, 3, '10002b', '', '', '', '11.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:26:39', '2021-07-06 08:26:39', NULL),
(114, 111, 3, '10002c', '', '', '', '11.00', '10.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:26:39', '2021-07-06 08:26:39', NULL),
(115, 0, 3, 'SKUNDMSW34', 'Naadam  Sweaters', 'Naadam  Sweaters', 'Naadam  Sweaters', '20.00', '30.00', '2021-07-03 21:00:00', '2021-07-21 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:56:19', '2021-07-06 08:56:19', NULL),
(116, 0, 3, 'SKUNDUGS123', 'Nadaam Sweaters', 'Nadaam Sweaters', 'Nadaam Sweaters', '10.00', '15.00', '2021-07-03 21:00:00', '2021-07-19 21:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 08:59:12', '2021-07-06 08:59:12', NULL),
(117, 0, 3, 'SKU3463', 'HATS', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 11:06:18', '2021-07-06 11:06:18', NULL),
(118, 0, 3, 'SKU34263', 'HATaS', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 11:08:04', '2021-07-06 11:08:04', NULL),
(119, 0, 3, 'SKU3423463', 'wer4', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 11:08:52', '2021-07-06 11:08:52', NULL),
(120, 0, 3, 'SKU363', '34rtt35', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 11:25:26', '2021-07-06 11:25:26', NULL),
(121, 0, 3, 'SKU363', '34rtt35', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 11:26:09', '2021-07-06 11:26:09', NULL),
(122, 0, 3, 'SKt445U363', 'w6zw', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 11:29:33', '2021-07-06 11:29:33', NULL),
(123, 0, 3, '223e', '24r24', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 11:30:14', '2021-07-06 11:30:14', NULL),
(124, 0, 3, '6z38i75856', 'Topsy Hatsy', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 11:32:57', '2021-07-06 11:32:57', NULL),
(125, 0, 3, '6z38i856', 'Topsy Haty', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 11:36:21', '2021-07-06 11:36:21', NULL),
(126, 0, 3, '6z3856', 'Tosy Haty', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 11:37:30', '2021-07-06 11:37:30', NULL),
(127, 0, 3, '6z856', 'Tosy Hay', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 11:39:47', '2021-07-06 11:39:47', NULL),
(128, 0, 3, '6z85656', 'Tosy 567Hay', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 11:41:27', '2021-07-06 11:41:27', NULL),
(129, 0, 3, '6z85656', 'Tosy 567Hay', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 11:42:32', '2021-07-06 11:42:32', NULL),
(130, 129, 3, 'SKUg751', 'Tp H57asy', 'Top Hats Tops', 'Really Good Top Hats', '345.00', '346.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 11:42:32', '2021-07-06 11:42:32', NULL),
(131, 129, 3, 'SKU45652', 'So5bry', 'Sombrero Hats', 'Sombrero Hats', '35.00', '345.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 11:42:32', '2021-07-06 11:42:32', NULL),
(132, 0, 3, '6z86', 'Ty 567Hay', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 12:11:52', '2021-07-06 12:11:52', NULL),
(133, 132, 3, 'SKU51', 'Tp H57sy', 'Top Hats Tops', 'Really Good Top Hats', '345.00', '346.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 12:11:52', '2021-07-06 12:11:52', NULL),
(134, 132, 3, 'SKU652', 'So5ry', 'Sombrero Hats', 'Sombrero Hats', '35.00', '345.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 12:11:52', '2021-07-06 12:11:52', NULL),
(135, 0, 3, '6z3486', 'Ty 5673t53tHay', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 12:14:36', '2021-07-06 12:14:36', NULL),
(136, 135, 3, 'S345KU51', 'Tp H5r34t7sy', 'Top Hats Tops', 'Really Good Top Hats', '345.00', '346.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 12:14:36', '2021-07-06 12:14:36', NULL),
(137, 135, 3, 'SKU34652', 'So5ferfry', 'Sombrero Hats', 'Sombrero Hats', '35.00', '345.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 12:14:36', '2021-07-06 12:14:36', NULL),
(138, 0, 3, '6z346', 'Ty 5673ttHay', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 12:16:19', '2021-07-06 12:16:19', NULL),
(139, 138, 3, 'S345U51', 'Tp H5r3t7sy', 'Top Hats Tops', 'Really Good Top Hats', '345.00', '346.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 12:16:19', '2021-07-06 12:16:19', NULL),
(140, 138, 3, 'SKU3462', 'So5fefry', 'Sombrero Hats', 'Sombrero Hats', '35.00', '345.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 12:16:19', '2021-07-06 12:16:19', NULL),
(141, 0, 3, 'SKUHTOFF3463', 'HATS OFF', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 12:34:15', '2021-07-06 12:34:15', NULL),
(142, 0, 3, 'SKUHTOFF33', 'HATS OF', 'Good Hats', 'REALLY Good hats', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 12:37:56', '2021-07-06 12:37:56', NULL),
(143, 142, 3, 'SKUHTSV9811', 'Top Hats Two', 'Top Hats Tops', 'Really Good Top Hats', '345.00', '346.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 12:37:56', '2021-07-06 12:37:56', NULL),
(144, 142, 3, 'SKUHTSV21', 'Sombrero 12', 'Sombrero Hats', 'Sombrero Hats', '35.00', '345.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 12:37:56', '2021-07-06 12:37:56', NULL),
(145, 0, 3, 'SKULNVFF33', 'Lanvin Shoes', 'Good Shoes', 'REALLY Good Shoes', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-06 13:40:54', '2021-07-06 13:40:54', NULL),
(146, 145, 3, 'SKUH711', 'Lanvin 42', 'Top Hats Tops', 'Really Good Top Hats', '345.00', '346.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 13:40:54', '2021-07-06 13:40:54', NULL),
(147, 145, 3, 'SKUHTS571', 'Lanvin 44', 'Sombrero Hats', 'Sombrero Hats', '35.00', '345.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-06 13:40:54', '2021-07-06 13:40:54', NULL),
(148, 0, 3, 'SKULNVFF33', 'Tom Ford Shoes', 'Good Shoes', 'REALLY Good Shoes', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-07 02:26:21', '2021-07-07 02:26:21', NULL),
(149, 148, 3, 'SKUH7131', 'Tom Ford 42', 'Top Hats Tops', 'Really Good Top Hats', '345.00', '346.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-07 02:26:21', '2021-07-07 02:26:21', NULL),
(150, 148, 3, 'SKUHTS54571', 'Tom Ford 44', 'Sombrero Hats', 'Sombrero Hats', '35.00', '345.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-07 02:26:21', '2021-07-07 02:26:21', NULL),
(151, 0, 3, 'SKULNVFFAS33', 'Hansen Shoes', 'Good Shoes', 'REALLY Good Shoes', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-07 02:40:11', '2021-07-07 02:40:11', NULL),
(152, 151, 3, 'SKUH713211', 'Hansen 42', 'Top Hats Tops', 'Really Good Top Hats', '345.00', '346.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-07 02:40:11', '2021-07-07 02:40:11', NULL),
(153, 0, 3, 'SKULNVFAS33', 'Hansn Shoes', 'Good Shoes', 'REALLY Good Shoes', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-07 02:44:05', '2021-07-07 02:44:05', NULL),
(154, 153, 3, 'SKUH73211', 'Hanen 42', 'Top Hats Tops', 'Really Good Top Hats', '345.00', '346.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-07 02:44:05', '2021-07-07 02:44:05', NULL),
(155, 0, 3, 'SKULNVFYAS33', 'Hansny Shoes', 'Good Shoes', 'REALLY Good Shoes', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-07 02:48:32', '2021-07-07 02:48:32', NULL),
(156, 155, 3, 'SKUH7Y3211', 'Hayneny 42', 'Top Hats Tops', 'Really Good Top Hats', '345.00', '346.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-07 02:48:32', '2021-07-07 02:48:32', NULL),
(157, 0, 3, 'SKULNVFQYAS33', 'Hansnqy Shoes', 'Good Shoes', 'REALLY Good Shoes', '345.00', '456.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-07 02:51:20', '2021-07-07 02:51:20', NULL),
(158, 157, 3, 'SKUH7YQ3211', 'Hayneqny 42', 'Top Hats Tops', 'Really Good Top Hats', '345.00', '346.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-07 02:51:20', '2021-07-07 14:36:08', NULL),
(159, 157, 3, 'SKUHTSYY542Q7132', 'HansqYen 4', 'Sombrero Hats', 'Sombrero Hats', '35.00', '345.00', '2021-12-26 22:00:00', '2021-12-26 22:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-07 02:51:20', '2021-07-07 14:36:08', NULL),
(160, 0, 3, 'SKURPP45', 'New Product', 'New Product Description', ' Product Description', '40.00', '45.00', '2021-07-03 21:00:00', '2021-07-28 21:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-08 09:45:21', '2021-07-08 09:45:21', NULL),
(161, 160, 3, '435345', '', '', '', '50.00', '80.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-08 09:45:21', '2021-07-08 09:45:21', NULL),
(162, 0, 3, '123123', '123123123', '12312312', '1231321', '12313.00', '12312312.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-08 11:02:06', '2021-07-08 11:02:06', NULL),
(163, 162, 3, '100000', '', '', '', '10.00', '10.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-08 11:02:06', '2021-07-08 11:02:06', NULL),
(164, 0, 3, '123123', '123123123', '12312312', '1231321', '12313.00', '12312312.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-08 11:32:17', '2021-07-08 11:32:17', NULL),
(165, 164, 3, '100000', '', '', '', '10.00', '10.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-08 11:32:17', '2021-07-08 11:32:17', NULL),
(166, 0, 3, '123123', '123123123', '12312312', '1231321', '12313.00', '12312312.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-08 11:47:37', '2021-07-08 11:47:37', NULL),
(167, 166, 3, '100000', '', '', '', '10.00', '10.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-08 11:47:37', '2021-07-08 11:47:37', NULL),
(168, 0, 3, '123123', '123123123', '12312312', '1231321', '12313.00', '12312312.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-08 11:47:56', '2021-07-08 11:47:56', NULL),
(169, 0, 3, '123123', '123123123', '12312312', '1231321', '12313.00', '12312312.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-08 11:48:55', '2021-07-08 11:48:55', NULL),
(170, 169, 3, '100000', '', '', '', '10.00', '10.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-08 11:48:55', '2021-07-08 11:48:55', NULL),
(171, 0, 3, '123123', '123123123', '12312312', '1231321', '12313.00', '12312312.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-08 11:53:10', '2021-07-08 11:53:10', NULL),
(172, 171, 3, '100000', '', '', '', '10.00', '10.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-08 11:53:10', '2021-07-08 11:53:10', NULL),
(173, 0, 14, 'sku', 'name', 'desc', 'description', '9.00', '5.00', '2021-07-08 21:00:00', '2021-07-11 21:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-08 12:13:25', '2021-07-08 12:13:25', NULL),
(174, 173, 14, 'skua', 'variant 1', '', '', '10.00', '4.00', '2021-07-13 21:00:00', '2021-07-15 21:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-08 12:13:25', '2021-07-08 12:13:25', NULL),
(175, 0, 34, 'testSku', 'testSku', 'testSku', 'testSku', '2.00', '1.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-08 15:54:14', '2021-07-08 15:54:14', NULL),
(176, 175, 34, '10', '', '', '', '10.00', '2.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-08 15:54:14', '2021-07-08 15:54:14', NULL),
(177, 0, 34, '12312312312', '312321321312', '31232133 123123 123 13123 13', '1232133123 12312 3123 213 3123 123 21312 312', '12312321.00', '32113123.00', '2021-07-21 21:00:00', '2021-07-18 21:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-08 16:17:06', '2021-07-08 16:17:06', NULL),
(178, 0, 34, 'Sku1', 'Sku1', 'Sku1Sku1Sku1Sku1Sku1Sku1Sku1Sku1Sku1Sku1', 'Sku1Sku1Sku1Sku1Sku1Sku1Sku1Sku1Sku1Sku1Sku1Sku1Sku1Sku1Sku1', '3.00', '2.00', '2021-07-14 21:00:00', '2021-07-05 21:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-08 19:45:19', '2021-07-08 19:45:19', NULL),
(179, 0, 3, 'sku1', 'Newest Product', 'desc', 'description', '50.00', NULL, NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-14 17:21:51', '2021-07-14 17:21:51', NULL),
(180, 179, 3, 'SKUA', 'variant 1', '', '', '45.00', '50.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-14 17:21:51', '2021-07-14 17:21:51', NULL),
(181, 0, 3, 'sku', 'new product', 'desc', 'description', '47.00', NULL, NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-15 07:11:48', '2021-07-15 07:11:48', NULL),
(182, 0, 3, 'test sku', 'test product', NULL, NULL, '48.00', '34.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-15 07:17:10', '2021-07-15 07:17:10', NULL),
(183, 182, 3, 'skua', 'variant 1', '', '', '45.00', '46.00', '2021-07-15 21:00:00', '2021-07-16 21:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 07:17:10', '2021-07-15 07:17:10', NULL),
(184, 0, 34, '123123', '1231231231', '2321312312', '12312321', '11.00', '11.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-15 07:24:37', '2021-07-15 07:24:37', NULL),
(185, 184, 34, '111', '', '', '', '11.00', '11.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 07:24:37', '2021-07-15 07:24:37', NULL),
(186, 0, 3, 'SKUNDMSW34', 'Product with stores', 'This product should have stores', 'This product should have stores with their categories', '45.00', '48.00', '2021-07-15 21:00:00', '2021-07-18 21:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-15 07:59:35', '2021-07-15 07:59:35', NULL),
(187, 186, 3, 'skua', 'variant 1', '', '', '46.00', '49.00', '2021-07-15 21:00:00', '2021-07-16 21:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 07:59:35', '2021-07-15 07:59:35', NULL),
(188, 0, 3, '1009', 'product with options', 'desc', 'description', '47.00', '45.00', '2021-07-15 21:00:00', '2021-07-16 21:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-15 08:10:33', '2021-07-15 08:10:33', NULL),
(189, 188, 3, 'skua', '', '', '', '45.00', '43.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 08:10:33', '2021-07-15 08:10:33', NULL),
(190, 0, 3, 'SKUNDMSW34', 'test 2', 'desc', 'description', '50.00', '43.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-15 09:04:22', '2021-07-15 09:04:22', NULL),
(191, 190, 3, '54', '', '', '', '40.00', '43.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 09:04:22', '2021-07-15 09:04:22', NULL),
(192, 0, 34, 'talsku', '123123', '1231231231', '23123', '1.00', '111.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-15 09:33:19', '2021-07-15 09:33:19', NULL),
(193, 0, 3, 'sku34', 'late product', 'desc', 'description', '45.00', '50.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-15 11:49:19', '2021-07-15 11:49:19', NULL),
(194, 0, 3, 'test sku', 'new prod', 'desc', 'description', '50.00', '45.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-15 13:48:31', '2021-07-15 13:48:31', NULL),
(195, 0, 3, 'sku34', 'prod with variants', 'desc', NULL, '50.00', '45.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-15 13:56:48', '2021-07-15 13:56:48', NULL),
(196, 195, 3, 'skua', 'variant 1', '', '', '45.00', '42.00', '2021-07-15 21:00:00', '2021-07-17 21:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 13:56:48', '2021-07-15 13:56:48', NULL),
(197, 0, 3, 'new sku', 'new variant prod', 'desc', NULL, '50.00', '45.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-15 14:01:48', '2021-07-15 14:01:48', NULL),
(198, 197, 3, 'skua', 'variant 1', '', '', '45.00', '43.00', '2021-07-15 21:00:00', '2021-07-16 21:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 14:01:48', '2021-07-15 14:01:48', NULL),
(199, 0, 3, 'namsku', 'named product', NULL, NULL, '50.00', '45.00', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-15 14:47:31', '2021-07-15 14:47:31', NULL),
(200, 0, 34, 'SKU11111', 'NAME11111', 'NAME11111NAME11111NAME11111NAME11111NAME11111NAME11111NAME11111', 'NAME11111NAME11111NAME11111NAME11111NAME11111NAME11111NAME11111', '10.00', '9.00', '2021-06-30 21:00:00', '2021-06-08 21:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-15 14:52:22', '2021-07-15 14:52:22', NULL),
(201, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:49:16', '2021-07-15 19:49:16', NULL),
(202, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:50:26', '2021-07-15 19:50:26', NULL),
(203, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:51:54', '2021-07-15 19:51:54', NULL),
(204, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:52:08', '2021-07-15 19:52:08', NULL),
(205, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:52:25', '2021-07-15 19:52:25', NULL),
(206, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:52:39', '2021-07-15 19:52:39', NULL),
(207, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:52:51', '2021-07-15 19:52:51', NULL),
(208, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:53:19', '2021-07-15 19:53:19', NULL),
(209, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:54:20', '2021-07-15 19:54:20', NULL),
(210, 209, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:54:20', '2021-07-15 19:54:20', NULL),
(211, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:55:13', '2021-07-15 19:55:13', NULL),
(212, 211, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:55:13', '2021-07-15 19:55:13', NULL),
(213, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:55:48', '2021-07-15 19:55:48', NULL),
(214, 213, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:55:48', '2021-07-15 19:55:48', NULL);
INSERT INTO `products` (`product_id`, `parent_id`, `user_id`, `sku`, `name`, `short_description`, `description`, `price`, `sale_price`, `sale_start`, `sale_end`, `drop_price`, `drop_sale_price`, `drop_sale_start`, `drop_sale_end`, `seo_title`, `seo_description`, `seo_url`, `seo_keywords`, `status`, `drop_status`, `created_at`, `updated_at`, `deleted`) VALUES
(215, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:56:20', '2021-07-15 19:56:20', NULL),
(216, 215, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:56:20', '2021-07-15 19:56:20', NULL),
(217, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:56:30', '2021-07-15 19:56:30', NULL),
(218, 217, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:56:30', '2021-07-15 19:56:30', NULL),
(219, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:56:42', '2021-07-15 19:56:42', NULL),
(220, 219, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:56:42', '2021-07-15 19:56:42', NULL),
(221, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:57:05', '2021-07-15 19:57:05', NULL),
(222, 221, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:57:05', '2021-07-15 19:57:05', NULL),
(223, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:57:54', '2021-07-15 19:57:54', NULL),
(224, 223, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:57:54', '2021-07-15 19:57:54', NULL),
(225, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:58:04', '2021-07-15 19:58:04', NULL),
(226, 225, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:58:04', '2021-07-15 19:58:04', NULL),
(227, 225, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:58', '2021-07-15 19:45:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 19:58:04', '2021-07-15 19:58:04', NULL),
(228, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:00:18', '2021-07-15 20:00:18', NULL),
(229, 228, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:00:18', '2021-07-15 20:00:18', NULL),
(230, 228, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:58', '2021-07-15 19:45:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:00:18', '2021-07-15 20:00:18', NULL),
(231, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:01:03', '2021-07-15 20:01:03', NULL),
(232, 231, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:01:03', '2021-07-15 20:01:03', NULL),
(233, 231, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:58', '2021-07-15 19:45:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:01:03', '2021-07-15 20:01:03', NULL),
(234, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:01:42', '2021-07-15 20:01:42', NULL),
(235, 234, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:01:42', '2021-07-15 20:01:42', NULL),
(236, 234, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:58', '2021-07-15 19:45:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:01:42', '2021-07-15 20:01:42', NULL),
(237, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:02:49', '2021-07-15 20:02:49', NULL),
(238, 237, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:02:49', '2021-07-15 20:02:49', NULL),
(239, 237, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:58', '2021-07-15 19:45:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:02:49', '2021-07-15 20:02:49', NULL),
(240, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:03:18', '2021-07-15 20:03:18', NULL),
(241, 240, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:03:18', '2021-07-15 20:03:18', NULL),
(242, 240, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:58', '2021-07-15 19:45:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:03:18', '2021-07-15 20:03:18', NULL),
(243, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:03:31', '2021-07-15 20:03:31', NULL),
(244, 243, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:03:31', '2021-07-15 20:03:31', NULL),
(245, 243, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:58', '2021-07-15 19:45:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:03:31', '2021-07-15 20:03:31', NULL),
(246, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:04:34', '2021-07-15 20:04:34', NULL),
(247, 246, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:04:34', '2021-07-15 20:04:34', NULL),
(248, 246, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:58', '2021-07-15 19:45:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:04:34', '2021-07-15 20:04:34', NULL),
(249, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:05:56', '2021-07-15 20:05:56', NULL),
(250, 249, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:05:56', '2021-07-15 20:05:56', NULL),
(251, 249, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:58', '2021-07-15 19:45:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:05:56', '2021-07-15 20:05:56', NULL),
(252, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:06:57', '2021-07-15 20:06:57', NULL),
(253, 252, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:06:57', '2021-07-15 20:06:57', NULL),
(254, 252, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:58', '2021-07-15 19:45:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:06:57', '2021-07-15 20:06:57', NULL),
(255, 0, 34, 'NewSkuName', 'NewSkuName', 'NewSkuNameNewSkuNameNewSkuName', 'NewSkuNameNewSkuNameNewSkuName', '100.00', '11.00', '2021-07-15 19:45:29', '2021-07-15 19:45:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:08:03', '2021-07-15 20:08:03', NULL),
(256, 255, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:51', '2021-07-15 19:45:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:08:03', '2021-07-15 20:08:03', NULL),
(257, 255, 34, '', '', '', '', '0.00', '0.00', '2021-07-15 19:45:58', '2021-07-15 19:45:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:08:03', '2021-07-15 20:08:03', NULL),
(258, 0, 34, 'NewSkuTest', 'test', 'testtesttest', 'testtest', '1111.00', '22.00', '2021-07-15 20:15:25', '2021-07-15 20:15:25', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:18:41', '2021-07-15 20:18:41', NULL),
(259, 258, 34, '', '', '', '', '123.00', '0.00', '2021-07-15 20:15:58', '2021-07-15 20:15:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:18:41', '2021-07-15 20:18:41', NULL),
(260, 258, 34, '', '', '', '', '12312.00', '0.00', '2021-07-15 20:16:05', '2021-07-15 20:16:05', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-15 20:18:41', '2021-07-15 20:18:41', NULL),
(261, 0, 3, 'SKUNDMSW34', 'namee', 'desc', '', '45.00', '45.00', '2021-07-19 16:22:33', '2021-07-19 16:22:33', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-19 18:27:04', '2021-07-20 10:33:36', NULL),
(262, 261, 3, 'skub', '', '', '', '4.00', '6.00', '2021-07-19 16:24:56', '2021-07-19 16:24:56', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-19 18:27:04', '2021-07-19 18:27:04', NULL),
(263, 0, 3, 'sku', 'new nameee', '', '', '40.00', '36.00', '2021-07-19 16:41:35', '2021-07-19 16:41:35', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-19 18:44:29', '2021-07-20 08:58:43', NULL),
(264, 263, 3, 'skua', '', '', '', '54.00', '43.00', '2021-07-19 16:42:26', '2021-07-19 16:42:26', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-19 18:44:29', '2021-07-19 18:44:29', NULL),
(265, 0, 3, 'sku', 'test edit', '', '', '45.00', '40.00', '2021-07-20 12:42:48', '2021-07-20 12:42:48', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-20 14:46:49', '2021-07-20 14:46:49', NULL),
(266, 0, 3, 'sku34', 'test edit 2', 'des', '', '50.00', '45.00', '2021-07-20 12:47:53', '2021-07-20 12:47:53', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-20 14:51:35', '2021-07-20 15:18:49', NULL),
(267, 266, 3, 'skua', '', '', '', '50.00', '45.00', '2021-07-20 12:48:58', '2021-07-20 12:48:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-20 14:51:35', '2021-07-20 14:51:35', NULL),
(268, 266, 3, 'skub', '', '', '', '52.00', '45.00', '2021-07-20 12:49:18', '2021-07-20 12:49:18', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-20 14:51:35', '2021-07-20 14:51:35', NULL),
(269, 0, 3, 'shiruiw', 'new check', 'desc', '', '45.00', '34.00', '2021-07-21 09:30:10', '2021-07-21 09:30:10', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-21 11:35:28', '2021-07-21 11:36:57', NULL),
(270, 269, 3, 'skub', '', '', '', '3.00', '5.00', '2021-07-21 09:31:17', '2021-07-21 09:31:17', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-21 11:35:28', '2021-07-21 11:35:28', NULL),
(271, 269, 3, 'skuc', '', '', '', '6.00', '5.00', '2021-07-21 09:32:02', '2021-07-21 09:32:02', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-21 11:35:28', '2021-07-21 11:35:28', NULL),
(272, 0, 3, 'sku', 'product with image', 'desc', '', '45.00', '40.00', '2021-07-21 12:41:09', '2021-07-21 12:41:09', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-21 14:45:45', '2021-07-21 14:45:45', NULL),
(273, 272, 3, 'skua', '', '', '', '4.00', '6.00', '2021-07-21 12:43:12', '2021-07-21 12:43:12', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-21 14:45:45', '2021-07-21 14:45:45', NULL),
(274, 272, 3, 'skub', '', '', '', '3.00', '7.00', '2021-07-21 12:43:33', '2021-07-21 12:43:33', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-21 14:45:45', '2021-07-21 14:45:45', NULL),
(275, 0, 3, 'sku34', 'prod with img', 'desc', '', '50.00', '45.00', '2021-07-22 05:13:06', '2021-07-22 05:13:06', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 07:23:27', '2021-07-22 07:23:27', NULL),
(276, 275, 3, 'skua', '', '', '', '34.00', '32.00', '2021-07-22 05:20:44', '2021-07-22 05:20:44', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 07:23:27', '2021-07-22 07:23:27', NULL),
(277, 0, 3, '45t3454', '4y635y5335hhg', '356y35hye56y356y', '356y35hyheh356y3', '34.00', '453.00', '2021-07-22 09:56:25', '2021-07-22 09:56:25', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 10:00:02', '2021-07-22 10:00:02', NULL),
(278, 277, 3, '1r34r1', '', '', '', '30.00', '50.00', '2021-07-22 09:57:42', '2021-07-22 09:57:42', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 10:00:02', '2021-07-22 10:00:02', NULL),
(279, 0, 3, 'skunewest', 'newest', 'desc', '', '50.00', '45.00', '2021-07-22 08:01:43', '2021-07-22 08:01:43', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 10:05:40', '2021-07-22 10:05:40', NULL),
(280, 279, 3, 'skua', '', '', '', '4.00', '3.00', '2021-07-22 08:03:30', '2021-07-22 08:03:30', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 10:05:40', '2021-07-22 10:05:40', NULL),
(281, 0, 3, 'trt4rtewwe', 'product with variant with image', '', '', '50.00', '45.00', '2021-07-22 08:53:05', '2021-07-22 08:53:05', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 11:16:29', '2021-07-22 11:28:21', NULL),
(282, 281, 3, 'skua', '', '', '', '0.00', '0.00', '2021-07-22 09:13:55', '2021-07-22 09:13:55', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 11:16:29', '2021-07-22 11:16:29', NULL),
(283, 0, 3, 'jkdfjkjkdf', 'live test', '', '', '50.00', '45.00', '2021-07-22 10:02:01', '2021-07-22 10:02:01', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:04:54', '2021-07-22 12:04:54', NULL),
(284, 283, 3, '', '', '', '', '0.00', '0.00', '2021-07-22 10:02:32', '2021-07-22 10:02:32', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:04:54', '2021-07-22 12:04:54', NULL),
(285, 0, 3, 'eu7u67uru', 'jrzujr76ur67u', 'ur76ur6ir6kru', 'r67ur67ur6irzuir', '55.00', '556.00', '2021-07-22 12:06:52', '2021-07-22 12:06:52', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:12:10', '2021-07-22 12:12:10', NULL),
(286, 285, 3, 'rtz56z5', '', '', '', '50.00', '80.00', '2021-07-22 12:07:57', '2021-07-22 12:07:57', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:12:10', '2021-07-22 12:12:10', NULL),
(287, 0, 3, 'hdjdesrwe', 'prod', 'desc', '', '40.00', '37.00', '2021-07-22 10:13:49', '2021-07-22 10:13:49', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:16:42', '2021-07-22 12:16:42', NULL),
(288, 287, 3, 'skua', '', '', '', '0.00', '0.00', '2021-07-22 10:14:43', '2021-07-22 10:14:43', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:16:42', '2021-07-22 12:16:42', NULL),
(289, 0, 3, 'edrf3464tgre34', 'prod var', '', '', '50.00', '45.00', '2021-07-22 10:15:02', '2021-07-22 10:15:02', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:17:59', '2021-07-22 12:17:59', NULL),
(290, 289, 3, '', '', '', '', '0.00', '0.00', '2021-07-22 10:15:30', '2021-07-22 10:15:30', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:17:59', '2021-07-22 12:17:59', NULL),
(291, 0, 3, 'f436dft', 'variant imaged', '', '', '50.00', '45.00', '2021-07-22 10:27:02', '2021-07-22 10:27:02', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:30:18', '2021-07-22 12:30:18', NULL),
(292, 291, 3, '', '', '', '', '0.00', '0.00', '2021-07-22 10:28:00', '2021-07-22 10:28:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:30:18', '2021-07-22 12:30:18', NULL),
(293, 0, 3, '53z656z', 'z356z35u67u46', '8i578i57io8659o68o', 'o689o689o68p090p790p', '45.00', '24.00', '2021-07-22 12:37:56', '2021-07-22 12:37:56', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:40:49', '2021-07-22 12:40:49', NULL),
(294, 293, 3, 't45t4ze5', '', '', '', '30.00', '20.00', '2021-07-22 12:38:34', '2021-07-22 12:38:34', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:40:49', '2021-07-22 12:40:49', NULL),
(295, 0, 3, 'rr3q4r3', 'r43r34rr', '34t34r34r134r', 'r314r3t545t24', '23.00', '13.00', '2021-07-22 12:45:38', '2021-07-22 12:45:38', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:48:39', '2021-07-22 12:48:39', NULL),
(296, 295, 3, 'r134tr5t', '', '', '', '30.00', '20.00', '2021-07-22 12:46:22', '2021-07-22 12:46:22', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:48:39', '2021-07-22 12:48:39', NULL),
(297, 0, 3, '432r3r3f', 'f35gt42g24g5', 'f45gtwt45tw4tt', 't45t45t45t45t45t', '56.00', '23.00', '2021-07-22 12:48:57', '2021-07-22 12:48:57', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:51:27', '2021-07-22 12:51:27', NULL),
(298, 0, 3, '324t5245t', 't245t246z46z', 'z356z356z356z', '356z356z', '34.00', '23.00', '2021-07-22 12:53:25', '2021-07-22 12:53:25', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 12:55:54', '2021-07-22 12:55:54', NULL),
(299, 0, 3, 'rewtq34r34r', 'r43r34t45t24z', 'z563z35hethertgrtg', 'gwtgwgwzw56z56z', '45.00', '23.00', '2021-07-22 12:57:06', '2021-07-22 12:57:06', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 13:00:15', '2021-07-22 13:00:15', NULL),
(300, 299, 3, '23r3q5t4', '', '', '', '50.00', '30.00', '2021-07-22 12:57:56', '2021-07-22 12:57:56', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 13:00:15', '2021-07-22 13:00:15', NULL),
(301, 0, 3, 'skufdfvds', 'prod 1', 'desc', '', '50.00', '45.00', '2021-07-22 11:19:35', '2021-07-22 11:19:35', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 13:22:21', '2021-07-22 13:22:21', NULL),
(302, 301, 3, 'sew', '', '', '', '45.00', '40.00', '2021-07-22 11:20:15', '2021-07-22 11:20:15', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 13:22:21', '2021-07-22 13:22:21', NULL),
(303, 0, 3, '43rfdw', 'prod 2', 'desc', '', '50.00', '48.00', '2021-07-22 11:20:43', '2021-07-22 11:20:43', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 13:23:25', '2021-07-22 13:23:25', NULL),
(304, 303, 3, '', '', '', '', '40.00', '30.00', '2021-07-22 11:21:15', '2021-07-22 11:21:15', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 13:23:25', '2021-07-22 13:23:25', NULL),
(305, 0, 3, 't42gtg24regerwwe', 'rgwetgwrh5zhh', 'utjrzjurzujrzujrzuj', 'rtjezthehzerhzetzjjurzujr', '68.00', '34.00', '2021-07-22 13:28:39', '2021-07-22 13:28:39', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 13:31:38', '2021-07-22 13:31:38', NULL),
(306, 305, 3, '1342r13f', '', '', '', '60.00', '40.00', '2021-07-22 13:29:31', '2021-07-22 13:29:31', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 13:31:38', '2021-07-22 13:31:38', NULL),
(307, 0, 3, '245t346z35z', 'z356z35u36u3', 'z365z356z357u5', '65z356z356u36ju356z3', '80.00', '23.00', '2021-07-22 13:32:43', '2021-07-22 13:32:43', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 13:35:59', '2021-07-22 13:35:59', NULL),
(308, 307, 3, '14324421r34r', '', '', '', '70.00', '30.00', '2021-07-22 13:33:44', '2021-07-22 13:33:44', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 13:35:59', '2021-07-22 13:35:59', NULL),
(309, 0, 3, '245t34zt3', 'z35z357u46j4h3', '53zt356z57u467u467', 'z356z5e5tzez56', '56.00', '24.00', '2021-07-22 14:06:19', '2021-07-22 14:06:19', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 14:28:20', '2021-07-22 14:28:20', NULL),
(310, 309, 3, 'd34f345t', '', '', '', '45.00', '12.00', '2021-07-22 14:07:21', '2021-07-22 14:07:21', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 14:28:20', '2021-07-22 14:28:20', NULL),
(311, 0, 3, '56z356zu67u', '68i579k589o69o', '698o689o68068069o7i', 'i578i57o789o89o6', '80.00', '34.00', '2021-07-22 14:30:57', '2021-07-22 14:30:57', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 14:34:02', '2021-07-22 14:34:02', NULL),
(312, 311, 3, 'w64zwt5t5', '', '', '', '30.00', '20.00', '2021-07-22 14:31:55', '2021-07-22 14:31:55', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 14:34:02', '2021-07-22 14:34:02', NULL),
(313, 0, 3, 'wt545z45z656z', 'z356zjurzkituiktuol', 'k758i578i578i579kitztuikt', 'tuilt9ot89o689o689o', '70.00', '35.00', '2021-07-22 14:42:16', '2021-07-22 14:42:16', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 14:45:13', '2021-07-22 14:45:13', NULL),
(314, 313, 3, 'ezhe56', '', '', '', '600.00', '456.00', '2021-07-22 14:43:00', '2021-07-22 14:43:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 14:45:13', '2021-07-22 14:45:13', NULL),
(315, 0, 3, 'awd3d23', '35t426z57u', 'u647u64i878iu7647u', 'u467u4668i4', '80.00', '34.00', '2021-07-22 14:46:10', '2021-07-22 14:46:10', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 14:49:56', '2021-07-22 14:49:56', NULL),
(316, 315, 3, '43t45t', '', '', '', '60.00', '20.00', '2021-07-22 14:47:41', '2021-07-22 14:47:41', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 14:49:56', '2021-07-22 14:49:56', NULL),
(317, 0, 3, 'e65z47u467u', 'u467u587i57o98o', 'o689p90p790p790', 'gwtegw45657u7648i878o59o', '80.00', '34.00', '2021-07-22 14:48:54', '2021-07-22 14:48:54', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 14:52:22', '2021-07-22 14:52:22', NULL),
(318, 317, 3, '46z57u67u45', '', '', '', '70.00', '30.00', '2021-07-22 14:50:03', '2021-07-22 14:50:03', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 14:52:22', '2021-07-22 14:52:22', NULL),
(319, 0, 3, 'q3t5w45z', 'ui6u76u467u467', 'u467u57356z345z45', 'z65z356z7u467u467', '90.00', '34.00', '2021-07-22 14:52:41', '2021-07-22 14:52:41', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 14:55:47', '2021-07-22 14:55:47', NULL),
(320, 319, 3, '5t42z6356z', '', '', '', '90.00', '40.00', '2021-07-22 14:53:34', '2021-07-22 14:53:34', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 14:55:47', '2021-07-22 14:55:47', NULL),
(321, 0, 3, '5u467u467u7', 'u467u467u467u', '467u467u467u467u', 'u467u467u468i4u67', '90.00', '45.00', '2021-07-22 14:57:42', '2021-07-22 14:57:42', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 15:00:24', '2021-07-22 15:00:24', NULL),
(322, 321, 3, 'rwtzw65z56', '', '', '', '80.00', '30.00', '2021-07-22 14:58:16', '2021-07-22 14:58:16', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 15:00:24', '2021-07-22 15:00:24', NULL),
(323, 0, 3, '45t36z557u64u47u', '467u467i478iz5', '56z46u758i57k56z6z56z56z', '456z6ujehzrtew46z56z56z56z', '90.00', '45.00', '2021-07-22 15:12:58', '2021-07-22 15:12:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 15:16:03', '2021-07-22 15:16:03', NULL),
(324, 323, 3, '4g24z6536z', '', '', '', '90.00', '30.00', '2021-07-22 15:13:44', '2021-07-22 15:13:44', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-22 15:16:03', '2021-07-22 15:16:03', NULL),
(325, 0, 3, 'r323rt2', '23r34tr245t245t', '2t45t245t24twgwtrzw46z', 'z536z35u57u67u467u467u647', '80.00', '45.00', '2021-07-23 02:46:51', '2021-07-23 02:46:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 02:55:25', '2021-07-23 02:55:25', NULL),
(326, 325, 3, '56z356z', '', '', '', '90.00', '60.00', '2021-07-23 02:53:18', '2021-07-23 02:53:18', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 02:55:25', '2021-07-23 02:55:25', NULL),
(327, 0, 3, '356z455z5', 'z56z457u767u8i578i', '7u476u467u467u467u', '467u467u4687i768i78i', '80.00', '33.00', '2021-07-23 02:58:07', '2021-07-23 02:58:07', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 03:01:48', '2021-07-23 03:01:48', NULL),
(328, 327, 3, '3qerqt5t', '', '', '', '90.00', '40.00', '2021-07-23 02:58:48', '2021-07-23 02:58:48', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 03:01:48', '2021-07-23 03:01:48', NULL),
(329, 0, 3, '6zz7z4646u7', '76u6tzjtzj57u46u46', 'u467u467u64u467u67u', '647u647u64ujujrztuj67u647u', '80.00', '46.00', '2021-07-23 03:01:03', '2021-07-23 03:01:03', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 03:04:07', '2021-07-23 03:04:07', NULL),
(330, 329, 3, '5u6i56z56z5', '', '', '', '80.00', '30.00', '2021-07-23 03:01:48', '2021-07-23 03:01:48', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 03:04:07', '2021-07-23 03:04:07', NULL),
(331, 0, 3, '6z5z457u467', 'z56z57ue6jurtjur67u', 'rujtu7u647u3u566z56z6', 'z356z357uzeertzw45t4w5z53t445t45t', '90.00', '23.00', '2021-07-23 03:02:58', '2021-07-23 03:02:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 03:07:14', '2021-07-23 03:07:14', NULL),
(332, 331, 3, 'r8i78i578i578i', '', '', '', '90.00', '70.00', '2021-07-23 03:03:50', '2021-07-23 03:03:50', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 03:07:14', '2021-07-23 03:07:14', NULL),
(333, 331, 3, '4z53zu357u467', '', '', '', '80.00', '50.00', '2021-07-23 03:04:08', '2021-07-23 03:04:08', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 03:07:14', '2021-07-23 03:07:14', NULL),
(334, 331, 3, 't35t4z46z5z', '', '', '', '60.00', '30.00', '2021-07-23 03:04:29', '2021-07-23 03:04:29', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 03:07:14', '2021-07-23 03:07:14', NULL),
(335, 331, 3, 'ferfqergq5g', '', '', '', '70.00', '30.00', '2021-07-23 03:04:52', '2021-07-23 03:04:52', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 03:07:14', '2021-07-23 03:07:14', NULL),
(336, 0, 3, '5z656z536', '356z356z56z', '356z356z35u57u67u4', '647u467u467u467u67u467', '90.00', '56.00', '2021-07-23 03:26:32', '2021-07-23 03:26:32', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 03:29:05', '2021-07-23 03:29:05', NULL),
(337, 0, 3, '467u476', 'u76u467u', 'u467u46i478i', 'u467u67u46j467', '90.00', '67.00', '2021-07-23 03:32:43', '2021-07-23 03:32:43', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 03:35:22', '2021-07-23 03:35:22', NULL),
(338, 0, 3, '45t46z536z356z', 'z356z3557u647u', '467u56z45t', 'fq5t4w6ze57u68u4u76u', '90.00', '45.00', '2021-07-23 03:42:13', '2021-07-23 03:42:13', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 03:45:44', '2021-07-23 03:45:44', NULL),
(339, 338, 3, '7u67u5hr', '', '', '', '90.00', '70.00', '2021-07-23 03:42:51', '2021-07-23 03:42:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 03:45:44', '2021-07-23 03:45:44', NULL),
(340, 338, 3, 'etw6z5z56z5', '', '', '', '60.00', '30.00', '2021-07-23 03:43:08', '2021-07-23 03:43:08', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 03:45:44', '2021-07-23 03:45:44', NULL),
(341, 0, 3, 'newskusa', 'prod with variant img', 'desc', '', '50.00', '47.00', '2021-07-23 04:13:57', '2021-07-23 04:13:57', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 06:19:52', '2021-07-23 06:19:52', NULL),
(342, 341, 3, 'skua', '', '', '', '50.00', '45.00', '2021-07-23 04:17:06', '2021-07-23 04:17:06', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 06:19:52', '2021-07-23 06:19:52', NULL),
(343, 0, 3, 'q45tw45t2t', 't45t45z365', 'u7467u468i78i78i78', 'z356z35u5ezte6z', '90.00', '34.00', '2021-07-23 08:47:20', '2021-07-23 08:47:20', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 08:51:08', '2021-07-23 08:51:08', NULL),
(344, 343, 3, '3z635h', '', '', '', '90.00', '60.00', '2021-07-23 08:48:48', '2021-07-23 08:48:48', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 08:51:08', '2021-07-23 08:51:08', NULL),
(345, 0, 3, 'SKUNDMSW34', 'testing 123', 'desc', '', '45.00', '40.00', '2021-07-23 09:02:50', '2021-07-23 09:02:50', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 11:05:22', '2021-07-23 11:05:22', NULL),
(346, 345, 3, '', '', '', '', '0.00', '0.00', '2021-07-23 09:03:23', '2021-07-23 09:03:23', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 11:05:22', '2021-07-23 11:05:22', NULL),
(347, 0, 3, 't45t35z356z', 'z356z35u67u', 't45t3z6356z36t356t', 'z356z57zikrew65zew56', '90.00', '45.00', '2021-07-23 11:20:39', '2021-07-23 11:20:39', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 11:24:28', '2021-07-23 11:24:28', NULL),
(348, 347, 3, 'w54tw4zw45', '', '', '', '20.00', '10.00', '2021-07-23 11:22:10', '2021-07-23 11:22:10', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 11:24:28', '2021-07-23 11:24:28', NULL),
(349, 0, 3, 'i578i578u5e456', 'z5u768i57oit8ir68u', 'i578i578i76ue56u764r8i875i5', 'i578i57o9567u575', '90.00', '34.00', '2021-07-23 11:44:36', '2021-07-23 11:44:36', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 11:53:37', '2021-07-23 11:53:37', NULL),
(350, 349, 3, 'gre76ur6ue5', '', '', '', '60.00', '30.00', '2021-07-23 11:50:13', '2021-07-23 11:50:13', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 11:53:37', '2021-07-23 11:53:37', NULL),
(351, 0, 3, 'u46i5o978i4u7', '56z46i7597iru7z65', '57u4586i579i6u756z456z', 'z5u746i85775z6645u7356z3', '90.00', '45.00', '2021-07-23 12:01:09', '2021-07-23 12:01:09', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 12:05:19', '2021-07-23 12:05:19', NULL),
(352, 351, 3, 'rzhe67', '', '', '', '70.00', '40.00', '2021-07-23 12:02:15', '2021-07-23 12:02:15', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 12:05:19', '2021-07-23 12:05:19', NULL),
(353, 0, 3, 't45z6357u64754', '63576ehwttwg4trtfsz6z', 'e56zue6jhgtrse565q34t3z5646', '356z65u7egterfsgerzhew', '80.00', '34.00', '2021-07-23 12:09:41', '2021-07-23 12:09:41', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 12:13:48', '2021-07-23 12:13:48', NULL),
(354, 353, 3, '245z4w5eue5', '', '', '', '5640.00', '560.00', '2021-07-23 12:11:06', '2021-07-23 12:11:06', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 12:13:48', '2021-07-23 12:13:48', NULL),
(355, 0, 3, '68i6597iruz5e7', '8it79o780loktrj', '68i70z897i8ur57u875iuj', 'i7898ztj6758tkik7t', '80.00', '45.00', '2021-07-23 12:22:14', '2021-07-23 12:22:14', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 12:25:24', '2021-07-23 12:25:24', NULL),
(356, 355, 3, 'g4wh5z7w', '', '', '', '70.00', '40.00', '2021-07-23 12:23:12', '2021-07-23 12:23:12', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 12:25:24', '2021-07-23 12:25:24', NULL),
(357, 0, 3, '78o98o978rz454', '6ze57ir757ue', '6ue67i857r8iru7', 'u76r76ur857ur76u57', '90.00', '56.00', '2021-07-23 12:24:39', '2021-07-23 12:24:39', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 12:27:45', '2021-07-23 12:27:45', NULL),
(358, 357, 3, 'srze57ue56z', '', '', '', '60.00', '40.00', '2021-07-23 12:25:24', '2021-07-23 12:25:24', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 12:27:45', '2021-07-23 12:27:45', NULL),
(359, 0, 3, '5u68i57riuw56ze5', 'ue67u8r79o7tuz6757zu', '67u48otiru676ri', '87it7u57r68ir68r', '90.00', '56.00', '2021-07-23 12:30:10', '2021-07-23 12:30:10', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 12:33:01', '2021-07-23 12:33:01', NULL),
(360, 359, 3, '6ue5u76ue', '', '', '', '80.00', '40.00', '2021-07-23 12:30:51', '2021-07-23 12:30:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 12:33:01', '2021-07-23 12:33:01', NULL),
(361, 0, 3, 'rhw45tw4wz', 'zwtz56z5w6', 'zezwrtzej56z46z456z56', '56z56z5w45q34twq45tz', '799.00', '655.00', '2021-07-23 12:52:30', '2021-07-23 12:52:30', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 12:55:49', '2021-07-23 12:55:49', NULL),
(362, 361, 3, '5u35u5', '', '', '', '80.00', '40.00', '2021-07-23 12:53:27', '2021-07-23 12:53:27', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 12:55:49', '2021-07-23 12:55:49', NULL),
(363, 0, 3, 't45t35z356z6z356z56', '5635u767u5z56z', '56z536uz357u356z56z', '536zu357u356z6z356z35', '90.00', '56.00', '2021-07-23 13:02:58', '2021-07-23 13:02:58', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 13:06:41', '2021-07-23 13:06:41', NULL),
(364, 363, 3, '2t6z356', '', '', '', '780.00', '450.00', '2021-07-23 13:04:13', '2021-07-23 13:04:13', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 13:06:41', '2021-07-23 13:06:41', NULL),
(365, 0, 3, 'u467u48i4z56z5', '6z46u746uu4576u', '67uj46j4r67576476u', '46467u467u46568i467u56z536z356z', '90.00', '78.00', '2021-07-23 13:06:18', '2021-07-23 13:06:18', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 13:09:41', '2021-07-23 13:09:41', NULL),
(366, 365, 3, 'ewtzw65zw4', '', '', '', '80.00', '40.00', '2021-07-23 13:07:10', '2021-07-23 13:07:10', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 13:09:41', '2021-07-23 13:09:41', NULL),
(367, 0, 3, '56u468iz46z5e67u', '76u578i467u467u', 'u467u468iu4755riu75', '67ui578i5u756i8r7u56', '897.00', '564.00', '2021-07-23 13:11:28', '2021-07-23 13:11:28', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 13:14:50', '2021-07-23 13:14:50', NULL),
(368, 367, 3, '34t42z6', '', '', '', '900.00', '450.00', '2021-07-23 13:12:13', '2021-07-23 13:12:13', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 13:14:50', '2021-07-23 13:14:50', NULL),
(369, 0, 3, 'las573f', 'last prod', 'desc', '', '50.00', '40.00', '2021-07-23 12:28:13', '2021-07-23 12:28:13', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 14:31:43', '2021-07-23 14:31:43', NULL),
(370, 369, 3, 'skua', '', '', '', '0.00', '0.00', '2021-07-23 12:29:37', '2021-07-23 12:29:37', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 14:31:43', '2021-07-23 14:31:43', NULL),
(371, 0, 3, 'newsku', 'new_prod', 'desd', '', '40.00', '43.00', '2021-07-23 12:35:41', '2021-07-23 12:35:41', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 14:38:30', '2021-07-23 14:38:30', NULL),
(372, 371, 3, 'skua', '', '', '', '0.00', '0.00', '2021-07-23 12:36:24', '2021-07-23 12:36:24', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 14:38:30', '2021-07-23 14:38:30', NULL),
(373, 0, 3, 'skunew', 'testing', 'desc', 'desc', '50.00', '45.00', '2021-07-23 14:30:16', '2021-07-23 14:30:16', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 16:33:26', '2021-07-23 16:38:33', NULL),
(374, 373, 3, 'skua', '', '', '', '45.00', '40.00', '2021-07-23 14:31:02', '2021-07-23 14:31:02', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 16:33:26', '2021-07-23 16:33:26', NULL),
(375, 0, 3, 'sku', 'test meta', 'desc', 'desc', '50.00', '45.00', '2021-07-23 14:37:53', '2021-07-23 14:37:53', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 16:40:40', '2021-07-23 16:40:40', NULL),
(376, 375, 3, 'skua', '', '', '', '0.00', '0.00', '2021-07-23 14:38:27', '2021-07-23 14:38:27', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 16:40:40', '2021-07-23 16:40:40', NULL),
(377, 375, 3, 'skub', '', '', '', '0.00', '0.00', '2021-07-23 14:38:34', '2021-07-23 14:38:34', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-23 16:40:40', '2021-07-23 16:40:40', NULL),
(378, 0, 3, 'w45t4wztw', 'zerze56ue57ue56z', 'e56ze5jtzetzueztee', '5ue5ze56ze56ze56z', '89.00', '45.00', '2021-07-25 12:08:33', '2021-07-25 12:08:33', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-25 12:11:53', '2021-07-25 12:11:53', NULL),
(379, 378, 3, '45t4z45t', '', '', '', '80.00', '20.00', '2021-07-25 12:09:30', '2021-07-25 12:09:30', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-25 12:11:53', '2021-07-25 12:11:53', NULL),
(380, 0, 3, '45y356', 'y356y53u57u', '57u467u46756y', 'y356y56u7u647u', '8980.00', '453.00', '2021-07-26 01:10:19', '2021-07-26 01:10:19', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 01:15:57', '2021-07-26 01:15:57', NULL),
(381, 380, 3, 'wz65ez56z56', '', '', '', '980.00', '560.00', '2021-07-26 01:11:47', '2021-07-26 01:11:47', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 01:15:57', '2021-07-26 01:15:57', NULL),
(382, 380, 3, 'regt56z56', '', '', '', '670.00', '230.00', '2021-07-26 01:12:06', '2021-07-26 01:12:06', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 01:15:57', '2021-07-26 01:15:57', NULL),
(383, 380, 3, '7u46467', '', '', '', '680.00', '450.00', '2021-07-26 01:12:26', '2021-07-26 01:12:26', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 01:15:57', '2021-07-26 01:15:57', NULL),
(384, 0, 3, 't545t345', 'MetTage', '5z57u6746z56z56z5', '4u676i68i5z56z576', '7879.00', '5657.00', '2021-07-26 01:19:46', '2021-07-26 01:19:46', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 01:28:03', '2021-07-27 15:53:56', NULL),
(385, 384, 3, 'heeh5756z', 'Product 385', '', '', '900.00', '880.00', '2021-07-26 01:22:41', '2021-07-26 01:22:41', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 01:28:03', '2021-07-27 15:53:56', NULL),
(386, 384, 3, '46jr76u67', 'The Product 386', '', '', '780.00', '560.00', '2021-07-26 01:23:10', '2021-07-26 01:23:10', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 01:28:03', '2021-07-27 15:53:56', NULL),
(387, 384, 3, '7585o7ktzk', '', '', '', '660.00', '70.00', '2021-07-26 01:23:34', '2021-07-26 01:23:34', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 01:28:03', '2021-07-27 15:53:56', NULL),
(388, 384, 3, '56u5774u6', '', '', '', '670.00', '40.00', '2021-07-26 01:24:10', '2021-07-26 01:24:10', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 01:28:03', '2021-07-27 15:53:56', NULL),
(389, 384, 3, '57u67u46', '', '', '', '760.00', '450.00', '2021-07-26 01:24:45', '2021-07-26 01:24:45', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 01:28:03', '2021-07-27 15:53:56', NULL),
(390, 0, 3, 'skutoday', 'test today', 'desc', '', '50.00', '45.00', '2021-07-26 06:18:07', '2021-07-26 06:18:07', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 08:22:52', '2021-07-26 08:55:54', NULL),
(391, 0, 3, 'skua', '', '', '', '50.00', '40.00', '2021-07-26 06:19:08', '2021-07-26 06:19:08', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 08:22:52', '2021-07-26 08:55:54', NULL),
(392, 0, 3, 'skutest', 'today\'s phone edited', 'desc', '', '50.00', '45.00', '2021-07-26 09:34:56', '2021-07-26 09:34:56', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 11:38:18', '2021-07-26 12:10:26', NULL),
(393, 0, 3, 'skua', '', '', '', '50.00', '45.00', '2021-07-26 09:35:47', '2021-07-26 09:35:47', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 11:38:18', '2021-07-26 12:10:26', NULL),
(394, 0, 3, 'nert', 'test1', '', '', '50.00', '35.00', '2021-07-26 10:24:51', '2021-07-26 10:24:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 12:27:57', '2021-07-26 12:27:57', NULL),
(395, 394, 3, 'skua', '', '', '', '50.00', '45.00', '2021-07-26 10:25:38', '2021-07-26 10:25:38', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 12:27:57', '2021-07-26 12:27:57', NULL),
(396, 0, 3, 'SKUNDMSW34', 'test2', 'desc', '', '50.00', '0.00', '2021-07-26 10:42:38', '2021-07-26 10:42:38', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 12:46:14', '2021-07-26 12:46:14', NULL),
(397, 396, 3, 'skua', '', '', '', '50.00', '45.00', '2021-07-26 10:43:56', '2021-07-26 10:43:56', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 12:46:14', '2021-07-26 12:46:14', NULL),
(398, 0, 3, 'SKUNDMSW34', 'test3', 'desc', '', '50.00', '45.00', '2021-07-26 10:51:10', '2021-07-26 10:51:10', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 12:54:07', '2021-07-26 12:54:07', NULL),
(399, 398, 3, 'skua', '', '', '', '50.00', '45.00', '2021-07-26 10:51:52', '2021-07-26 10:51:52', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 12:54:07', '2021-07-26 12:54:07', NULL),
(400, 0, 67, 'july2721', 'july2721', 'july2721', 'july2721', '27.00', '26.00', '2021-07-27 01:46:40', '2021-07-29 21:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 20:49:48', '2021-07-26 20:49:48', NULL),
(401, 400, 67, '', '', '', '', '27.00', '0.00', '2021-07-27 01:47:06', '2021-07-27 01:47:06', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 20:49:48', '2021-07-26 20:49:48', NULL),
(402, 0, 67, 'july2721a', 'july2721a', 'july2721a', 'july2721a', '27.00', '26.00', '2021-07-27 01:48:28', '2021-07-29 21:00:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 20:59:18', '2021-07-26 20:59:18', NULL),
(403, 402, 67, '', '', '', '', '0.00', '0.00', '2021-07-27 01:49:19', '2021-07-27 01:49:19', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-26 20:59:18', '2021-07-26 20:59:18', NULL),
(404, 0, 3, 'test1color', 'test1', 'test1', 'test1', '27.00', '26.00', '2021-07-27 12:53:08', '2021-07-27 12:53:08', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 08:01:10', '2021-07-27 08:01:10', NULL),
(405, 404, 3, '', '', '', '', '0.00', '0.00', '2021-07-27 12:57:31', '2021-07-27 12:57:31', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 08:01:10', '2021-07-27 08:01:10', NULL),
(406, 404, 3, '', '', '', '', '0.00', '0.00', '2021-07-27 12:57:35', '2021-07-27 12:57:35', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 08:01:10', '2021-07-27 08:01:10', NULL),
(407, 404, 3, '', '', '', '', '0.00', '0.00', '2021-07-27 12:57:40', '2021-07-27 12:57:40', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 08:01:10', '2021-07-27 08:01:10', NULL),
(408, 404, 3, '', '', '', '', '0.00', '0.00', '2021-07-27 12:57:45', '2021-07-27 12:57:45', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 08:01:10', '2021-07-27 08:01:10', NULL),
(409, 0, 3, '5ze7u467u4', 'hj67j467u47', '67j4u76476u467u', 'hj467jh467u67u', '797.00', '45.00', '2021-07-27 08:08:14', '2021-07-27 08:08:14', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 08:13:22', '2021-07-27 08:13:22', NULL),
(410, 409, 3, '55756z5htj', '', '', '', '80.00', '40.00', '2021-07-27 08:09:46', '2021-07-27 08:09:46', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 08:13:22', '2021-07-27 08:13:22', NULL),
(411, 409, 3, '4587t8gw4r', '', '', '', '807.00', '97.00', '2021-07-27 08:10:30', '2021-07-27 08:10:30', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 08:13:22', '2021-07-27 08:13:22', NULL),
(412, 0, 3, 'SKUTESTS', 'Testing tags', 'Testging tags a short description', 'Longer description', '90.00', '67.00', '2021-07-27 08:15:44', '2021-07-27 08:15:44', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 08:23:51', '2021-07-27 09:29:54', NULL),
(413, 412, 3, 'e53t45', '', '', '', '80.00', '89.00', '2021-07-27 08:20:43', '2021-07-27 08:20:43', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 08:23:51', '2021-07-27 09:29:54', NULL),
(414, 0, 3, 'skua', 'new product', 'desc', '', '50.00', '45.00', '2021-07-27 06:33:24', '2021-07-27 06:33:24', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-27 08:38:02', '2021-07-27 08:38:02', NULL),
(415, 0, 3, 'skua', 'test now', 'desc', '', '50.00', '0.00', '2021-07-27 07:11:41', '2021-07-27 07:11:41', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-27 09:19:48', '2021-07-27 09:19:48', NULL),
(416, 415, 3, '', '', '', '', '40.00', '0.00', '2021-07-27 07:14:00', '2021-07-27 07:14:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 09:19:48', '2021-07-27 09:19:48', NULL),
(417, 415, 3, '', '', '', '', '49.00', '0.00', '2021-07-27 07:15:38', '2021-07-27 07:15:38', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 09:19:48', '2021-07-27 09:19:48', NULL),
(418, 0, 3, 'sku', 'prod with tag', 'short ', '', '50.00', '0.00', '2021-07-27 12:10:55', '2021-07-27 12:10:55', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-27 14:15:24', '2021-07-27 14:15:24', NULL),
(419, 418, 3, 'skua', '', '', '', '50.00', '45.00', '2021-07-27 12:13:10', '2021-07-27 12:13:10', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 14:15:24', '2021-07-27 14:15:24', NULL),
(420, 0, 3, '4thw5h5jew5h', 'e5z7jhe65jue67j', '76je6j4e68k4e67je76j', 'j6ejtuje6j7e6je76ue7u', '56.00', '45.00', '2021-07-27 16:09:13', '2021-07-27 16:09:13', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 16:13:00', '2021-07-27 16:13:00', NULL),
(421, 420, 3, '35tq5tq', '', '', '', '20.00', '14.00', '2021-07-27 16:10:34', '2021-07-27 16:10:34', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 16:13:00', '2021-07-27 16:13:00', NULL),
(422, 0, 3, '34rr34t35t', 'fweffg4qgq4gq45tg', 'qtgetgwtrh35h356z56z', '56z56z356z', '80.00', '34.00', '2021-07-27 16:24:56', '2021-07-27 16:24:56', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 16:28:24', '2021-07-27 16:28:24', NULL),
(423, 422, 3, 'f334t34r', '', '', '', '345.00', '23.00', '2021-07-27 16:26:05', '2021-07-27 16:26:05', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 16:28:24', '2021-07-27 16:28:24', NULL),
(424, 0, 3, 'hztzhetzje', 'hetzhetzjetzhjet', 'hetzhetzjetujetzh', 'tzhetzjtejetz', '450.00', '234.00', '2021-07-27 16:38:49', '2021-07-27 16:38:49', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 16:42:17', '2021-07-27 16:42:17', NULL),
(425, 424, 3, '356334', '', '', '', '450.00', '340.00', '2021-07-27 16:39:31', '2021-07-27 16:39:31', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 16:42:17', '2021-07-27 16:42:17', NULL),
(426, 0, 3, 'hkjl', 'ghoul', '', '', '658956.00', '0.00', '2021-07-27 14:55:10', '2021-07-27 14:55:10', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-27 16:59:49', '2021-07-27 16:59:49', NULL),
(427, 426, 3, 'skua', '', '', '', '0.00', '0.00', '2021-07-27 14:57:44', '2021-07-27 14:57:44', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 16:59:49', '2021-07-27 16:59:49', NULL),
(428, 0, 3, 'q34r3tqt', 'werqwtq3tq34t', '', '', '34.00', '23.00', '2021-07-27 17:03:07', '2021-07-27 17:03:07', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 17:05:25', '2021-07-27 17:05:25', NULL),
(429, 0, 3, 'wr343t3', '34t3t353--rtt3', 'r34t34t3', '', '90.00', '45.00', '2021-07-27 17:30:51', '2021-07-27 17:30:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 17:34:41', '2021-07-27 17:34:41', NULL);
INSERT INTO `products` (`product_id`, `parent_id`, `user_id`, `sku`, `name`, `short_description`, `description`, `price`, `sale_price`, `sale_start`, `sale_end`, `drop_price`, `drop_sale_price`, `drop_sale_start`, `drop_sale_end`, `seo_title`, `seo_description`, `seo_url`, `seo_keywords`, `status`, `drop_status`, `created_at`, `updated_at`, `deleted`) VALUES
(430, 429, 3, 'wrtrhwtr', '', '', '', '890.00', '340.00', '2021-07-27 17:32:00', '2021-07-27 17:32:00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 17:34:41', '2021-07-27 17:34:41', NULL),
(431, 0, 3, 'uidoriu', 'erfer', '', '', '50.00', '0.00', '2021-07-27 15:44:32', '2021-07-27 15:44:32', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-27 17:48:13', '2021-07-27 17:48:13', NULL),
(432, 431, 3, '', '', '', '', '0.00', '0.00', '2021-07-27 15:45:01', '2021-07-27 15:45:01', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 17:48:13', '2021-07-27 17:48:13', NULL),
(433, 0, 3, 'dfsd', 'jfdkjfd', '', '', '50.00', '0.00', '2021-07-27 15:48:02', '2021-07-27 15:48:02', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-27 17:50:47', '2021-07-27 17:50:47', NULL),
(434, 433, 3, 'skua', '', '', '', '0.00', '0.00', '2021-07-27 15:48:45', '2021-07-27 15:48:45', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 17:50:47', '2021-07-27 17:50:47', NULL),
(435, 0, 3, 'dsjhds', 'kjjkhdf', '', '', '49.00', '0.00', '2021-07-27 15:58:12', '2021-07-27 15:58:12', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-27 18:00:53', '2021-07-27 18:00:53', NULL),
(436, 435, 3, 'skua', '', '', '', '0.00', '0.00', '2021-07-27 15:58:43', '2021-07-27 15:58:43', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 18:00:53', '2021-07-27 18:00:53', NULL),
(437, 0, 3, 'jkdkjd', 'kjdfkjdf', '', '', '69.00', '0.00', '2021-07-27 16:35:59', '2021-07-27 16:35:59', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-07-27 18:39:03', '2021-07-27 18:39:03', NULL),
(438, 437, 3, 'skua', '', '', '', '0.00', '0.00', '2021-07-27 16:36:51', '2021-07-27 16:36:51', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-07-27 18:39:03', '2021-07-27 18:39:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

CREATE TABLE `products_attributes` (
  `attribute_id` int(10) NOT NULL,
  `product_id` int(10) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_attributes`
--

INSERT INTO `products_attributes` (`attribute_id`, `product_id`, `name`, `position`) VALUES
(1, 4, 'Array', 1),
(2, 6, 'colour', 1),
(3, 7, 'colour', 1),
(4, 8, 'colour', 1),
(5, 9, 'colour', 1),
(6, 10, 'colour', 1),
(7, 11, 'colour', 1),
(8, 12, 'colour', 1),
(9, 13, 'colour', 1),
(10, 14, 'colour', 1),
(11, 15, 'colour', 1),
(12, 16, 'colour', 1),
(13, 17, 'colour', 1),
(14, 18, 'colour', 1),
(15, 19, 'colour', 1),
(16, 20, 'colour', 1),
(17, 21, 'colour', 1),
(18, 22, 'colour', 1),
(19, 23, 'Size', 1),
(20, 24, 'Size', 1),
(21, 25, 'Size', 1),
(22, 26, 'Size', 1),
(23, 27, 'Size', 1),
(24, 28, 'Size', 1),
(25, 29, 'Size', 1),
(26, 30, 'Size', 1),
(27, 31, 'Size', 1),
(28, 32, 'Size', 1),
(29, 33, 'Size', 1),
(30, 34, 'Size', 1),
(31, 35, 'Size', 1),
(32, 36, 'Size', 1),
(33, 37, 'Size', 1),
(34, 38, 'Size', 1),
(35, 39, 'Size', 1),
(36, 40, 'Size', 1),
(37, 42, 'Size', 1),
(38, 43, 'Size', 1),
(39, 44, 'color', 1),
(40, 45, 'Color', 1),
(41, 46, 'Color', 1),
(42, 47, 'Color', 1),
(43, 48, 'Color', 1),
(44, 49, 'Color', 1),
(45, 50, 'Color', 1),
(46, 51, 'Color', 1),
(47, 53, 'color', 1),
(48, 54, 'color', 1),
(49, 56, 'color', 1),
(50, 58, 'color', 1),
(51, 60, 'color', 1),
(52, 61, 'color', 1),
(53, 62, 'width', 1),
(54, 63, 'width', 1),
(55, 64, 'width', 1),
(56, 66, 'Lenth', 1),
(57, 67, 'Lenth', 1),
(58, 68, 'Show', 1),
(59, 69, 'Show', 1),
(60, 70, 'material', 1),
(61, 71, 'material', 1),
(62, 72, 'material', 1),
(63, 73, 'material', 1),
(64, 74, 'material', 1),
(65, 75, 'material', 1),
(66, 76, 'material', 1),
(67, 77, 'material', 1),
(68, 78, 'material', 1),
(69, 79, 'material', 1),
(70, 80, 'material', 1),
(71, 81, 'material', 1),
(72, 82, 'material', 1),
(73, 83, 'material', 1),
(74, 84, 'material', 1),
(75, 85, 'material', 1),
(76, 86, 'material', 1),
(77, 87, 'color', 1),
(78, 88, '', 1),
(79, 89, '', 1),
(80, 90, 'color', 1),
(81, 91, '', 1),
(82, 92, '', 1),
(83, 93, 'color', 1),
(84, 94, '', 1),
(85, 95, '', 1),
(86, 96, 'color', 1),
(87, 97, '', 1),
(88, 98, '', 1),
(89, 99, 'color', 1),
(90, 100, 'color', 1),
(91, 100, 'size', 2),
(92, 101, 'colour', 1),
(93, 102, 'colour', 1),
(94, 103, 'color', 1),
(95, 104, 'color', 1),
(96, 105, 'color', 1),
(97, 106, 'color', 1),
(98, 107, 'color', 1),
(99, 108, 'color', 1),
(100, 109, 'color', 1),
(101, 110, 'color', 1),
(102, 111, 'color', 1),
(103, 112, 'color', 1),
(104, 113, 'color', 1),
(105, 114, 'color', 1),
(106, 115, 'colour', 1),
(107, 116, 'size', 1),
(108, 118, 'Colour', 1),
(109, 118, 'Size', 2),
(110, 119, 'Colour', 1),
(111, 119, 'Size', 2),
(112, 120, 'Colour', 1),
(113, 120, 'Size', 2),
(114, 121, 'Colour', 1),
(115, 121, 'Size', 2),
(116, 122, 'Colour', 1),
(117, 122, 'Size', 2),
(118, 123, 'Colour', 1),
(119, 123, 'Size', 2),
(120, 124, 'Colour', 1),
(121, 124, 'Size', 2),
(122, 125, 'Colour', 1),
(123, 125, 'Size', 2),
(124, 126, 'Colour', 1),
(125, 126, 'Size', 2),
(126, 127, 'Colour', 1),
(127, 127, 'Size', 2),
(128, 128, 'Colour', 1),
(129, 128, 'Size', 2),
(130, 129, 'Colour', 1),
(131, 129, 'Size', 2),
(132, 130, 'size', 1),
(133, 130, 'colour', 2),
(134, 131, '', 1),
(135, 132, 'Colour', 1),
(136, 132, 'Size', 2),
(137, 133, 'size', 1),
(138, 133, 'colour', 2),
(139, 134, '', 1),
(140, 135, 'Colour', 1),
(141, 135, 'Size', 2),
(142, 136, 'size', 1),
(143, 136, 'colour', 2),
(144, 137, '', 1),
(145, 138, 'Colour', 1),
(146, 138, 'Size', 2),
(147, 139, 'size', 1),
(148, 139, 'colour', 2),
(149, 140, '', 1),
(150, 141, 'Colour', 1),
(151, 141, 'Size', 2),
(152, 142, 'Colour', 1),
(153, 142, 'Size', 2),
(154, 143, 'size', 1),
(155, 143, 'colour', 2),
(156, 144, '', 1),
(157, 145, 'Colour', 1),
(158, 145, 'Size', 2),
(159, 146, 'size', 1),
(160, 146, 'colour', 2),
(161, 147, 'size', 1),
(162, 147, 'colour', 2),
(163, 148, 'colour', 1),
(164, 148, 'size', 2),
(165, 149, 'size', 1),
(166, 149, 'colour', 2),
(167, 150, 'size', 1),
(168, 150, 'colour', 2),
(169, 151, 'colour', 1),
(170, 151, 'size', 2),
(171, 153, 'colour', 1),
(172, 153, 'size', 2),
(173, 155, 'colour', 1),
(174, 155, 'size', 2),
(175, 157, 'colour', 1),
(176, 157, 'size', 2),
(177, 160, 'size', 1),
(178, 162, 'COLOR', 1),
(179, 162, 'SIZE', 2),
(180, 164, 'COLOR', 1),
(181, 164, 'SIZE', 2),
(182, 166, 'COLOR', 1),
(183, 166, 'SIZE', 2),
(184, 169, 'COLOR', 1),
(185, 169, 'SIZE', 2),
(186, 171, 'COLOR', 1),
(187, 171, 'SIZE', 2),
(188, 173, 'color', 1),
(189, 173, 'size', 2),
(190, 175, 'Color', 1),
(191, 175, 'Size', 2),
(192, 179, 'color', 1),
(193, 179, 'size', 2),
(194, 181, 'color', 1),
(195, 182, 'color', 1),
(196, 184, 'name', 1),
(197, 184, 'color', 2),
(198, 186, 'color', 1),
(199, 188, 'color', 1),
(200, 188, 'size', 2),
(201, 190, 'color', 1),
(202, 190, 'size', 2),
(203, 192, 'color', 1),
(204, 192, 'size', 2),
(205, 193, 'color', 1),
(206, 193, 'size', 2),
(207, 194, 'color', 1),
(208, 194, 'size', 2),
(209, 195, 'color', 1),
(210, 195, 'size', 2),
(211, 197, 'color', 1),
(212, 197, 'size', 2),
(213, 199, 'color', 1),
(214, 199, 'size', 2),
(215, 200, 'COLOR', 1),
(216, 200, 'SIZE', 2),
(217, 202, 'Color', 1),
(218, 202, 'Size', 2),
(219, 203, 'Color', 1),
(220, 203, 'Size', 2),
(221, 206, 'Color', 1),
(222, 206, 'Size', 2),
(223, 207, 'Color', 1),
(224, 207, 'Size', 2),
(225, 208, 'Color', 1),
(226, 208, 'Size', 2),
(227, 209, 'Color', 1),
(228, 209, 'Size', 2),
(229, 211, 'Color', 1),
(230, 211, 'Size', 2),
(231, 213, 'Color', 1),
(232, 213, 'Size', 2),
(233, 215, 'Color', 1),
(234, 215, 'Size', 2),
(235, 217, 'Color', 1),
(236, 217, 'Size', 2),
(237, 219, 'Color', 1),
(238, 219, 'Size', 2),
(239, 221, 'Color', 1),
(240, 221, 'Size', 2),
(241, 223, 'Color', 1),
(242, 223, 'Size', 2),
(243, 225, 'Color', 1),
(244, 225, 'Size', 2),
(245, 228, 'Color', 1),
(246, 228, 'Size', 2),
(247, 231, 'Color', 1),
(248, 231, 'Size', 2),
(249, 234, 'Color', 1),
(250, 234, 'Size', 2),
(251, 237, 'Color', 1),
(252, 237, 'Size', 2),
(253, 240, 'Color', 1),
(254, 240, 'Size', 2),
(255, 243, 'Color', 1),
(256, 243, 'Size', 2),
(257, 246, 'Color', 1),
(258, 246, 'Size', 2),
(259, 249, 'Color', 1),
(260, 249, 'Size', 2),
(261, 252, 'Color', 1),
(262, 252, 'Size', 2),
(263, 255, 'Color', 1),
(264, 255, 'Size', 2),
(265, 258, 'size', 1),
(266, 258, 'color', 2),
(267, 261, 'color', 1),
(268, 261, 'size', 2),
(269, 263, 'color', 1),
(270, 263, 'size', 2),
(271, 263, 'size', 1),
(272, 263, 'color', 1),
(273, 263, 'color', 1),
(274, 261, 'color', 1),
(275, 265, 'color', 1),
(276, 266, 'color', 1),
(277, 266, 'size', 2),
(278, 266, 'color', 1),
(279, 269, 'color', 1),
(280, 269, 'size', 2),
(281, 269, 'color', 1),
(282, 272, 'color', 1),
(283, 272, 'size', 2),
(284, 275, 'color', 1),
(285, 275, 'size', 2),
(286, 277, 'size', 1),
(287, 279, 'color', 1),
(288, 279, 'size', 2),
(289, 281, 'color', 1),
(290, 281, 'color', 1),
(291, 283, 'color', 1),
(292, 285, 'size', 1),
(293, 287, 'color', 1),
(294, 289, 'color', 1),
(295, 291, 'color', 1),
(296, 293, 'size', 1),
(297, 295, 'size', 1),
(298, 299, 'size', 1),
(299, 301, 'color', 1),
(300, 303, 'color', 1),
(301, 305, 'size', 1),
(302, 307, 'size', 1),
(303, 309, 'size', 1),
(304, 311, 'size', 1),
(305, 313, 'size', 1),
(306, 315, 'size', 1),
(307, 317, 'size', 1),
(308, 319, 'size', 1),
(309, 321, 'size', 1),
(310, 323, 'size', 1),
(311, 325, 'size', 1),
(312, 327, 'size', 1),
(313, 329, 'colour', 1),
(314, 331, 'colour', 1),
(315, 338, 'size', 1),
(316, 341, 'color', 1),
(317, 343, 'size', 1),
(318, 345, 'color', 1),
(319, 347, 'size', 1),
(320, 349, 'size', 1),
(321, 351, 'color', 1),
(322, 353, 'colour', 1),
(323, 355, 'size', 1),
(324, 357, 'size', 1),
(325, 359, 'size', 1),
(326, 361, 'size', 1),
(327, 363, 'size', 1),
(328, 365, 'size', 1),
(329, 367, 'size', 1),
(330, 369, 'color', 1),
(331, 371, 'size', 1),
(332, 373, 'color', 1),
(333, 373, 'color', 1),
(334, 373, 'color', 1),
(335, 373, 'color', 2),
(336, 375, 'color', 1),
(337, 378, 'size', 1),
(338, 380, 'size', 1),
(339, 384, 'size', 1),
(340, 384, 'color', 2),
(341, 384, 'material', 3),
(364, 390, 'color', 1),
(365, 392, 'color', 1),
(366, 394, 'color', 1),
(367, 396, 'color', 1),
(368, 398, 'size', 1),
(369, 400, 'color', 1),
(370, 400, 'size', 2),
(371, 402, 'color', 1),
(372, 402, 'size', 2),
(373, 402, 'colorb', 3),
(374, 402, 'sizeb', 4),
(375, 402, 'colorc', 5),
(376, 402, 'sizec', 6),
(377, 404, 'color', 1),
(378, 404, 'colora', 2),
(379, 404, 'colorb', 3),
(380, 404, 'colorc', 4),
(381, 404, 'colord', 5),
(382, 409, 'size', 1),
(383, 409, 'color', 2),
(384, 409, 'shape', 3),
(385, 409, 'material', 4),
(386, 412, 'color', 1),
(387, 412, 'size', 2),
(388, 412, 'shape', 3),
(389, 412, 'material', 4),
(390, 415, 'color', 1),
(391, 415, 'size', 2),
(392, 418, 'color', 1),
(393, 420, 'size', 1),
(394, 420, 'color', 2),
(395, 422, 'size', 1),
(396, 424, 'size', 1),
(397, 426, 'color', 1),
(398, 429, 'color', 1),
(399, 431, 'color', 1),
(400, 433, 'color', 1),
(401, 435, 'color', 1),
(402, 437, 'color', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes_options`
--

CREATE TABLE `products_attributes_options` (
  `option_id` int(10) NOT NULL,
  `attribute_id` int(10) DEFAULT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci,
  `position` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_attributes_options`
--

INSERT INTO `products_attributes_options` (`option_id`, `attribute_id`, `name`, `position`) VALUES
(1, 11, 'Black', 1),
(2, 11, '1', 2),
(3, 18, 'Black', 1),
(4, 19, '9', 1),
(5, 20, '9', 1),
(6, 21, '9', 1),
(7, 22, '9', 1),
(8, 23, '9', 1),
(9, 24, '9', 1),
(10, 25, '9', 1),
(11, 26, '9', 1),
(12, 27, '9', 1),
(13, 28, '9', 1),
(14, 29, '9', 1),
(15, 30, '9', 1),
(16, 31, '9', 1),
(17, 32, '9', 1),
(18, 33, '9', 1),
(19, 34, '9', 1),
(20, 35, '9', 1),
(21, 36, '9', 1),
(22, 37, '9', 1),
(23, 39, 'green', 1),
(24, 40, 'Black', 1),
(25, 55, '75', 1),
(26, 56, 'short', 1),
(27, 58, 'biz', 1),
(28, 60, 'Silver', 1),
(29, 62, 'Silver', 1),
(30, 63, 'Silver', 1),
(31, 64, 'Silver', 1),
(32, 66, 'Silver', 1),
(33, 67, 'Silver', 1),
(34, 68, 'Silver', 1),
(35, 69, 'Silver', 1),
(36, 70, 'Silver', 1),
(37, 71, 'Silver', 1),
(38, 72, 'Silver', 1),
(39, 73, 'Silver', 1),
(40, 75, 'Silver', 1),
(41, 89, 'green', 1),
(42, 89, 'blue', 2),
(43, 90, 'green', 1),
(44, 90, 'blue', 2),
(45, 91, '32', 1),
(46, 91, '36', 2),
(47, 92, 'grey', 1),
(48, 94, 'red', 1),
(49, 94, 'green', 2),
(50, 94, 'pink', 3),
(51, 98, 'red', 1),
(52, 98, 'green', 2),
(53, 98, 'pink', 3),
(54, 102, 'red', 1),
(55, 102, 'green', 2),
(56, 102, 'pink', 3),
(57, 106, 'grey', 1),
(58, 107, 'large', 1),
(59, 157, 'Brown', 1),
(60, 157, 'Black', 2),
(61, 157, 'Grey', 3),
(62, 158, '40', 1),
(63, 158, '41', 2),
(64, 158, '42', 3),
(65, 158, '43', 4),
(66, 158, '44', 5),
(67, 163, 'Brown', 1),
(68, 163, 'Black', 2),
(69, 163, 'Grey', 3),
(70, 164, '40', 1),
(71, 164, '41', 2),
(72, 164, '42', 3),
(73, 164, '43', 4),
(74, 164, '44', 5),
(75, 169, 'Brown', 1),
(76, 169, 'Black', 2),
(77, 169, 'Grey', 3),
(78, 170, '40', 1),
(79, 170, '41', 2),
(80, 170, '42', 3),
(81, 170, '43', 4),
(82, 170, '44', 5),
(83, 171, 'Brown', 1),
(84, 171, 'Black', 2),
(85, 171, 'Grey', 3),
(86, 172, '40', 1),
(87, 172, '41', 2),
(88, 172, '42', 3),
(89, 172, '43', 4),
(90, 172, '44', 5),
(91, 173, 'Brown', 1),
(92, 173, 'Black', 2),
(93, 173, 'Grey', 3),
(94, 174, '40', 1),
(95, 174, '41', 2),
(96, 174, '42', 3),
(97, 174, '43', 4),
(98, 174, '44', 5),
(99, 175, 'Brown', 1),
(100, 175, 'Black', 2),
(101, 175, 'Grey', 3),
(102, 176, '40', 1),
(103, 176, '41', 2),
(104, 176, '42', 3),
(105, 176, '43', 4),
(106, 176, '44', 5),
(107, 177, 'small', 1),
(108, 178, 'BLACK', 1),
(109, 179, 'L', 1),
(110, 180, 'BLACK', 1),
(111, 181, 'L', 1),
(112, 182, 'BLACK', 1),
(113, 183, 'L', 1),
(114, 184, 'BLACK', 1),
(115, 185, 'L', 1),
(116, 186, 'BLACK', 1),
(117, 187, 'L', 1),
(118, 190, 'Black', 1),
(119, 191, 'XL', 1),
(120, 201, 'green', 1),
(121, 202, '32', 1),
(122, 203, 'white', 1),
(123, 203, 'green', 2),
(124, 204, 'XL', 1),
(125, 204, 'L', 2),
(126, 205, 'green', 1),
(127, 206, '32', 1),
(128, 207, 'green', 1),
(129, 208, '32', 1),
(130, 209, 'green', 1),
(131, 210, '32', 1),
(132, 211, 'green', 1),
(133, 212, '32', 1),
(134, 213, 'green', 1),
(135, 214, '32', 1),
(136, 216, 'XL', 1),
(137, 216, 'L', 2),
(138, 218, 'xl', 1),
(139, 218, 'l', 2),
(140, 220, 'xl', 1),
(141, 220, 'l', 2),
(142, 222, 'xl', 1),
(143, 222, 'l', 2),
(144, 224, 'xl', 1),
(145, 224, 'l', 2),
(146, 226, 'xl', 1),
(147, 226, 'l', 2),
(148, 228, 'xl', 1),
(149, 228, 'l', 2),
(150, 230, 'xl', 1),
(151, 230, 'l', 2),
(152, 232, 'xl', 1),
(153, 232, 'l', 2),
(154, 234, 'xl', 1),
(155, 234, 'l', 2),
(156, 236, 'xl', 1),
(157, 236, 'l', 2),
(158, 238, 'xl', 1),
(159, 238, 'l', 2),
(160, 240, 'xl', 1),
(161, 240, 'l', 2),
(162, 242, 'xl', 1),
(163, 242, 'l', 2),
(164, 244, 'xl', 1),
(165, 244, 'l', 2),
(166, 246, 'xl', 1),
(167, 246, 'l', 2),
(168, 248, 'xl', 1),
(169, 248, 'l', 2),
(170, 250, 'xl', 1),
(171, 250, 'l', 2),
(172, 252, 'xl', 1),
(173, 252, 'l', 2),
(174, 254, 'xl', 1),
(175, 254, 'l', 2),
(176, 256, 'xl', 1),
(177, 256, 'l', 2),
(178, 258, 'xl', 1),
(179, 258, 'l', 2),
(180, 260, 'xl', 1),
(181, 260, 'l', 2),
(182, 262, 'xl', 1),
(183, 262, 'l', 2),
(184, 264, 'xl', 1),
(185, 264, 'l', 2),
(186, 265, 'MEDIUM', 1),
(187, 265, 'LARGE', 2),
(188, 266, 'GREEN', 1),
(189, 266, 'YELLOW', 2),
(190, 267, 'green', 1),
(191, 268, '32', 1),
(192, 269, 'green', 1),
(193, 270, '32', 1),
(194, 276, 'green', 1),
(195, 276, 'blue', 2),
(196, 277, '32', 1),
(197, 277, '33', 2),
(198, 276, 'greens', 1),
(199, 279, 'green', 1),
(200, 279, 'blue', 2),
(201, 280, '32', 1),
(202, 280, '35', 2),
(203, 279, 'greens', 1),
(204, 282, 'green', 1),
(205, 282, 'blue', 2),
(206, 283, 'xs', 2),
(207, 284, 'green', 1),
(208, 285, 'IX', 1),
(209, 286, 'small', 1),
(210, 287, 'green', 1),
(211, 288, 'IX', 1),
(212, 289, 'blue', 1),
(213, 289, 'grey', 1),
(214, 291, 'red', 1),
(215, 292, 'small', 1),
(216, 293, 'green', 1),
(217, 294, 'violet', 1),
(218, 295, 'blue', 1),
(219, 296, 'small', 1),
(220, 297, 'small', 1),
(221, 298, 'small', 1),
(222, 299, 'green', 1),
(223, 300, 'blue', 1),
(224, 301, 'small', 1),
(225, 302, 'small', 1),
(226, 303, 'ferwgttr', 1),
(227, 304, 'small', 1),
(228, 305, 'small', 1),
(229, 306, 'small', 1),
(230, 307, 'small', 1),
(231, 308, 'small', 1),
(232, 309, 'small', 1),
(233, 310, 'small', 1),
(234, 311, 'small', 1),
(235, 312, 'small', 1),
(236, 313, 'red', 1),
(237, 314, 'Red', 1),
(238, 314, 'Green', 2),
(239, 314, 'Blue', 3),
(240, 314, 'Yellow', 4),
(241, 315, 'small', 1),
(242, 315, 'medium', 2),
(243, 316, 'green', 1),
(244, 317, 'small', 1),
(245, 318, 'green', 1),
(246, 319, 'small', 1),
(247, 320, 'lagre', 1),
(248, 321, 'red', 1),
(249, 322, 'brown', 1),
(250, 323, 'small', 1),
(251, 324, 'small', 1),
(252, 325, 'small', 1),
(253, 326, 'small', 1),
(254, 327, 'small', 1),
(255, 328, 'small', 1),
(256, 329, 'small', 1),
(257, 330, 'green', 1),
(258, 331, 'IX', 1),
(259, 332, 'green', 1),
(260, 332, 'blue', 2),
(261, 336, 'blue', 1),
(262, 336, 'red', 2),
(263, 337, 'small', 1),
(264, 338, 'small', 1),
(265, 338, 'medium', 2),
(266, 338, 'large', 3),
(267, 339, 'small', 3),
(268, 339, 'large', 2),
(269, 339, 'medium', 5),
(270, 340, 'grey', 1),
(271, 340, 'green', 2),
(272, 340, 'white', 3),
(273, 340, 'yellow', 4),
(274, 340, 'blue', 5),
(275, 341, 'wood', 5),
(276, 341, 'metal', 2),
(277, 341, 'silk', 3),
(278, 341, 'cloth', 4),
(279, 364, 'green', 1),
(281, 364, 'blue', 2),
(282, 365, 'green', 1),
(283, 366, 'red', 1),
(284, 367, 'green', 1),
(285, 368, 'IX', 1),
(286, 369, 'red', 1),
(287, 369, 'yellow', 2),
(288, 370, 's', 1),
(289, 370, 'xl', 2),
(290, 371, 'a', 1),
(291, 371, 'b', 2),
(292, 372, 'b', 1),
(293, 373, 'a', 1),
(294, 374, 'a', 1),
(295, 374, 'b', 2),
(296, 375, 'a', 1),
(297, 375, 'b', 2),
(298, 376, 'a', 1),
(299, 376, 'b', 2),
(300, 377, 'a', 1),
(301, 377, 'd', 2),
(302, 381, 'a', 1),
(303, 381, 'b', 2),
(304, 381, 'c', 3),
(305, 381, 'd', 4),
(306, 382, 'small', 1),
(307, 382, 'large', 2),
(308, 383, 'red', 1),
(309, 383, 'blue', 2),
(310, 384, 'round', 1),
(311, 384, 'sqaure', 2),
(312, 385, 'metal', 1),
(313, 385, 'wood', 2),
(314, 386, 'red', 1),
(315, 387, 'medium', 1),
(316, 388, 'square', 1),
(317, 389, 'wood', 1),
(318, 390, 'green', 2),
(319, 391, '10', 1),
(320, 391, '20', 2),
(321, 392, 'green', 1),
(322, 393, 'small', 1),
(323, 394, 'red', 1),
(324, 395, 'small', 1),
(325, 396, 'small', 1),
(326, 397, 'green', 1),
(327, 398, 'blue', 1),
(328, 399, 'green', 1),
(329, 400, 'green', 1),
(330, 401, 'green', 1),
(331, 402, 'green', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_category`
--

CREATE TABLE `products_category` (
  `product_id` int(10) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `store_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_category`
--

INSERT INTO `products_category` (`product_id`, `category_id`, `store_id`) VALUES
(28, 1, NULL),
(29, 1, NULL),
(30, 1, NULL),
(31, 1, NULL),
(32, 1, NULL),
(33, 1, NULL),
(34, 1, NULL),
(35, 1, NULL),
(36, 1, NULL),
(37, 1, NULL),
(38, 1, NULL),
(39, 1, NULL),
(40, 1, NULL),
(42, 1, NULL),
(45, 1, NULL),
(53, 1, NULL),
(56, 1, NULL),
(58, 1, NULL),
(64, 1, NULL),
(66, 1, NULL),
(68, 1, NULL),
(70, 1, NULL),
(73, 1, NULL),
(74, 1, NULL),
(83, 1, NULL),
(85, 1, NULL),
(87, 1, NULL),
(90, 1, NULL),
(93, 1, NULL),
(96, 1, NULL),
(101, 1, NULL),
(103, 1, NULL),
(107, 1, NULL),
(111, 1, NULL),
(115, 1, NULL),
(116, 1, NULL),
(138, 2, NULL),
(138, 3, NULL),
(138, 4, NULL),
(138, 5, NULL),
(142, 2, NULL),
(142, 3, NULL),
(142, 4, NULL),
(142, 5, NULL),
(145, 2, NULL),
(145, 3, NULL),
(145, 4, NULL),
(145, 5, NULL),
(148, 6, NULL),
(148, 7, NULL),
(148, 8, NULL),
(148, 9, NULL),
(157, 10, NULL),
(157, 11, NULL),
(157, 12, NULL),
(157, 13, NULL),
(255, 44, 9),
(261, 43, 1),
(261, 42, 1),
(261, 18, 2),
(263, 12, 1),
(263, 39, 1),
(263, 18, 2),
(263, 16, 2),
(266, 10, 1),
(266, 24, 2),
(266, 15, 2),
(269, 12, 1),
(269, 41, 1),
(269, 40, 1),
(269, 19, 2),
(269, 26, 2),
(269, 25, 2),
(269, 20, 2),
(272, 50, 1),
(272, 19, 2),
(272, 22, 2),
(272, 47, 7),
(275, 50, 1),
(275, 29, 2),
(275, 15, 2),
(275, 48, 6),
(277, 41, 1),
(277, 40, 1),
(277, 46, 1),
(277, 42, 1),
(277, 29, 2),
(277, 15, 2),
(277, 26, 2),
(277, 25, 2),
(277, 20, 2),
(277, 34, 2),
(277, 30, 2),
(277, 48, 6),
(277, 47, 7),
(279, 11, 1),
(279, 20, 2),
(279, 48, 6),
(281, 39, 1),
(285, 41, 1),
(285, 40, 1),
(285, 46, 1),
(285, 42, 1),
(285, 26, 2),
(285, 25, 2),
(285, 20, 2),
(285, 28, 2),
(285, 34, 2),
(285, 30, 2),
(285, 8, 4),
(285, 3, 6),
(285, 6, 7),
(287, 13, 1),
(293, 41, 1),
(293, 40, 1),
(293, 46, 1),
(293, 42, 1),
(295, 41, 1),
(295, 40, 1),
(298, 41, 1),
(298, 40, 1),
(299, 41, 1),
(299, 40, 1),
(301, 13, 1),
(303, 13, 1),
(305, 41, 1),
(305, 40, 1),
(305, 46, 1),
(305, 42, 1),
(307, 41, 1),
(307, 40, 1),
(307, 46, 1),
(307, 42, 1),
(307, 29, 2),
(307, 15, 2),
(309, 41, 1),
(309, 40, 1),
(311, 41, 1),
(311, 40, 1),
(311, 46, 1),
(311, 42, 1),
(311, 26, 2),
(311, 25, 2),
(311, 20, 2),
(313, 41, 1),
(313, 40, 1),
(313, 46, 1),
(313, 42, 1),
(313, 29, 2),
(313, 15, 2),
(313, 26, 2),
(313, 25, 2),
(313, 20, 2),
(315, 41, 1),
(315, 40, 1),
(315, 46, 1),
(315, 42, 1),
(315, 24, 2),
(315, 15, 2),
(315, 28, 2),
(315, 20, 2),
(315, 26, 2),
(315, 25, 2),
(315, 6, 7),
(317, 41, 1),
(317, 40, 1),
(317, 46, 1),
(317, 42, 1),
(317, 24, 2),
(317, 15, 2),
(317, 26, 2),
(317, 25, 2),
(317, 20, 2),
(317, 14, 4),
(317, 7, 4),
(317, 6, 7),
(321, 41, 1),
(321, 40, 1),
(323, 24, 2),
(323, 15, 2),
(323, 26, 2),
(323, 25, 2),
(323, 20, 2),
(343, 41, 1),
(343, 40, 1),
(343, 46, 1),
(343, 42, 1),
(343, 26, 2),
(343, 25, 2),
(343, 20, 2),
(343, 24, 2),
(343, 15, 2),
(343, 34, 2),
(343, 30, 2),
(343, 31, 2),
(343, 29, 2),
(349, 43, 1),
(349, 42, 1),
(349, 15, 2),
(349, 26, 2),
(349, 25, 2),
(349, 20, 2),
(349, 48, 6),
(349, 47, 7),
(351, 41, 1),
(351, 40, 1),
(351, 29, 2),
(351, 15, 2),
(351, 26, 2),
(351, 25, 2),
(351, 20, 2),
(351, 34, 2),
(351, 30, 2),
(353, 43, 1),
(353, 42, 1),
(353, 24, 2),
(353, 15, 2),
(353, 26, 2),
(353, 25, 2),
(353, 20, 2),
(353, 34, 2),
(353, 30, 2),
(353, 14, 4),
(355, 11, 1),
(355, 41, 1),
(355, 40, 1),
(355, 46, 1),
(355, 42, 1),
(355, 4, 2),
(355, 29, 2),
(355, 15, 2),
(355, 25, 2),
(355, 20, 2),
(355, 26, 2),
(357, 41, 1),
(357, 40, 1),
(357, 46, 1),
(357, 42, 1),
(357, 26, 2),
(357, 25, 2),
(357, 20, 2),
(357, 34, 2),
(357, 30, 2),
(359, 13, 1),
(361, 12, 1),
(361, 46, 1),
(361, 42, 1),
(361, 26, 2),
(361, 25, 2),
(361, 20, 2),
(363, 11, 1),
(363, 41, 1),
(363, 40, 1),
(363, 46, 1),
(363, 42, 1),
(363, 29, 2),
(363, 15, 2),
(363, 26, 2),
(363, 25, 2),
(363, 20, 2),
(363, 28, 2),
(363, 8, 4),
(365, 41, 1),
(365, 40, 1),
(365, 61, 1),
(365, 29, 2),
(365, 15, 2),
(365, 28, 2),
(365, 20, 2),
(367, 11, 1),
(369, 47, 7),
(369, 61, 1),
(373, 12, 1),
(373, 29, 2),
(373, 15, 2),
(375, 10, 1),
(384, 41, 1),
(384, 40, 1),
(384, 46, 1),
(384, 42, 1),
(384, 29, 2),
(384, 15, 2),
(384, 26, 2),
(384, 25, 2),
(384, 20, 2),
(384, 28, 2),
(384, 63, 5),
(384, 62, 5),
(384, 64, 5),
(384, 48, 6),
(384, 6, 7),
(390, 13, 1),
(390, 15, 2),
(392, 12, 1),
(394, 12, 1),
(396, 12, 1),
(398, 40, 1),
(384, 7, 4),
(384, 8, 4),
(384, 14, 4),
(420, 41, 1),
(420, 40, 1),
(420, 43, 1),
(420, 42, 1),
(420, 29, 2),
(420, 15, 2),
(420, 26, 2),
(420, 25, 2),
(420, 20, 2),
(420, 22, 2),
(424, 12, 1),
(424, 46, 1),
(424, 42, 1),
(424, 26, 2),
(424, 25, 2),
(424, 20, 2),
(428, 41, 1),
(428, 40, 1),
(428, 29, 2),
(428, 15, 2),
(429, 41, 1),
(429, 40, 1),
(429, 46, 1),
(429, 42, 1),
(429, 26, 2),
(429, 25, 2),
(429, 20, 2),
(429, 8, 4),
(435, 11, 1),
(435, 41, 1),
(435, 40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_images`
--

CREATE TABLE `products_images` (
  `image_id` int(10) NOT NULL,
  `product_id` int(10) DEFAULT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(10) DEFAULT NULL,
  `deleted` int(10) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_images`
--

INSERT INTO `products_images` (`image_id`, `product_id`, `name`, `alt`, `path`, `position`, `deleted`, `created_at`, `updated_at`) VALUES
(1, NULL, '586a1cd7-4b50-4522-ac32-02279a6a066b.jpg', 'dev.jpg', '/uploads/products/586a1cd7-4b50-4522-ac32-02279a6a066b.jpg', 0, 0, '2021-07-20 08:56:41', '2021-07-20 08:56:41'),
(2, NULL, 'a1397c75-767f-4a67-9c98-da6d33dd2b32.jpg', 'dev.jpg', '/uploads/products/a1397c75-767f-4a67-9c98-da6d33dd2b32.jpg', 0, 0, '2021-07-20 08:58:28', '2021-07-20 08:58:28'),
(3, NULL, '50417af9-ee4d-46ce-9e02-e93b8e3c95a1.jpg', 'dps.jpg', '/uploads/products/50417af9-ee4d-46ce-9e02-e93b8e3c95a1.jpg', 1, 0, '2021-07-20 08:58:28', '2021-07-20 08:58:28'),
(4, NULL, '8d25272a-9d5c-4627-8aff-d409a94ca7a3.jpg', 'ftp.jpg', '/uploads/products/8d25272a-9d5c-4627-8aff-d409a94ca7a3.jpg', 2, 0, '2021-07-20 08:58:28', '2021-07-20 08:58:28'),
(5, NULL, 'dd0bd2ab-6c3e-449e-93e2-34d614339dcd.jpg', 'dps.jpg', '/uploads/products/dd0bd2ab-6c3e-449e-93e2-34d614339dcd.jpg', 0, 0, '2021-07-20 09:13:03', '2021-07-20 09:13:03'),
(6, NULL, 'e12b8656-58f0-4515-8f9a-4d7cfdfcf476.jpg', 'ftp.jpg', '/uploads/products/e12b8656-58f0-4515-8f9a-4d7cfdfcf476.jpg', 1, 0, '2021-07-20 09:13:03', '2021-07-20 09:13:03'),
(7, NULL, '03a4eedc-9738-412f-aa0a-62f973244f90.jpg', 'havana.jpg', '/uploads/products/03a4eedc-9738-412f-aa0a-62f973244f90.jpg', 2, 0, '2021-07-20 09:13:03', '2021-07-20 09:13:03'),
(8, NULL, '268b1139-1712-440f-8df9-9cda2103eb2d.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/268b1139-1712-440f-8df9-9cda2103eb2d.jpg', 0, 0, '2021-07-20 12:46:37', '2021-07-20 12:46:37'),
(9, NULL, '0b0eec78-2352-4f5c-aa32-c9c917778de3.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/0b0eec78-2352-4f5c-aa32-c9c917778de3.jpg', 0, 0, '2021-07-20 15:45:59', '2021-07-20 15:45:59'),
(10, NULL, '82644969-d216-41d4-9793-3a27a829698e.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/82644969-d216-41d4-9793-3a27a829698e.jpg', 0, 0, '2021-07-21 07:33:58', '2021-07-21 07:33:58'),
(11, NULL, '94cc6c93-f23c-41a6-89ac-2f6d3da10a54.jpg', '264533_2114337422991_5407105_n.jpg', '/uploads/products/94cc6c93-f23c-41a6-89ac-2f6d3da10a54.jpg', 0, 0, '2021-07-21 13:33:33', '2021-07-21 13:33:33'),
(12, NULL, '2321ea8c-6e24-4d95-8ab4-41de2a61f11d.jpg', '314955_2449282473014_156846712_n.jpg', '/uploads/products/2321ea8c-6e24-4d95-8ab4-41de2a61f11d.jpg', 1, 0, '2021-07-21 13:33:33', '2021-07-21 13:33:33'),
(13, NULL, '94e2bdb9-da44-45c8-b064-69db392cb486.jpg', '535857_436104329813091_825014964_n_2.jpg', '/uploads/products/94e2bdb9-da44-45c8-b064-69db392cb486.jpg', 2, 0, '2021-07-21 13:33:33', '2021-07-21 13:33:33'),
(14, NULL, 'd5c3b877-b87a-42da-8154-fe3b635d115a.jpg', '264533_2114337422991_5407105_n.jpg', '/uploads/products/d5c3b877-b87a-42da-8154-fe3b635d115a.jpg', 0, 0, '2021-07-21 13:35:01', '2021-07-21 13:35:01'),
(15, NULL, 'ea179616-4f8e-449d-a88f-9f6cd824f606.jpg', '314955_2449282473014_156846712_n.jpg', '/uploads/products/ea179616-4f8e-449d-a88f-9f6cd824f606.jpg', 1, 0, '2021-07-21 13:35:01', '2021-07-21 13:35:01'),
(16, NULL, 'e97128ad-d781-4bc7-8e86-b207bf77ee35.jpg', '535857_436104329813091_825014964_n_2.jpg', '/uploads/products/e97128ad-d781-4bc7-8e86-b207bf77ee35.jpg', 2, 0, '2021-07-21 13:35:01', '2021-07-21 13:35:01'),
(17, NULL, '483c6387-a3ac-4979-bf76-0b8db65228eb.jpg', '264533_2114337422991_5407105_n.jpg', '/uploads/products/483c6387-a3ac-4979-bf76-0b8db65228eb.jpg', 0, 0, '2021-07-21 13:36:58', '2021-07-21 13:36:58'),
(18, NULL, 'd45cf2a0-80af-4ef9-83d2-c491513bc7de.jpg', '314955_2449282473014_156846712_n.jpg', '/uploads/products/d45cf2a0-80af-4ef9-83d2-c491513bc7de.jpg', 1, 0, '2021-07-21 13:36:58', '2021-07-21 13:36:58'),
(19, NULL, 'ee8b647d-d155-468e-b35c-3eee1fdeef8e.jpg', '535857_436104329813091_825014964_n_2.jpg', '/uploads/products/ee8b647d-d155-468e-b35c-3eee1fdeef8e.jpg', 2, 0, '2021-07-21 13:36:58', '2021-07-21 13:36:58'),
(20, NULL, '47e4bf36-21cd-4790-aee2-ba3600f1b0b6.jpg', '264533_2114337422991_5407105_n.jpg', '/uploads/products/47e4bf36-21cd-4790-aee2-ba3600f1b0b6.jpg', 0, 0, '2021-07-21 13:41:21', '2021-07-21 13:41:21'),
(21, NULL, 'dc00e817-3357-4c94-a28c-aad779a41560.jpg', '264533_2114337422991_5407105_n.jpg', '/uploads/products/dc00e817-3357-4c94-a28c-aad779a41560.jpg', 0, 0, '2021-07-21 13:42:00', '2021-07-21 13:42:00'),
(22, NULL, '744b2795-27df-4fba-b34b-2d3ad428f14c.jpg', '264533_2114337422991_5407105_n.jpg', '/uploads/products/744b2795-27df-4fba-b34b-2d3ad428f14c.jpg', 0, 0, '2021-07-21 13:42:49', '2021-07-21 13:42:49'),
(23, NULL, 'cb1b5fa6-4051-4b95-8293-8ab81eff680e.jpg', '314955_2449282473014_156846712_n.jpg', '/uploads/products/cb1b5fa6-4051-4b95-8293-8ab81eff680e.jpg', 1, 0, '2021-07-21 13:42:49', '2021-07-21 13:42:49'),
(24, NULL, '895f0a3e-9885-447e-8431-362da34d80de.jpg', '535857_436104329813091_825014964_n_2.jpg', '/uploads/products/895f0a3e-9885-447e-8431-362da34d80de.jpg', 2, 0, '2021-07-21 13:42:49', '2021-07-21 13:42:49'),
(25, NULL, '4efeaba2-9bfc-4007-b46c-1fd941e17f4b.jpg', 'FB_IMG_1461957262610.jpg', '/uploads/products/4efeaba2-9bfc-4007-b46c-1fd941e17f4b.jpg', 0, 0, '2021-07-21 14:01:55', '2021-07-21 14:01:55'),
(26, NULL, 'f754f9ac-74ea-4343-917a-b316e132ddd8.jpg', 'FB_IMG_1461957269899.jpg', '/uploads/products/f754f9ac-74ea-4343-917a-b316e132ddd8.jpg', 1, 0, '2021-07-21 14:01:55', '2021-07-21 14:01:55'),
(27, NULL, 'a21888f6-8c9f-4313-9df2-e553ac1722f9.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/a21888f6-8c9f-4313-9df2-e553ac1722f9.jpg', 2, 0, '2021-07-21 14:01:55', '2021-07-21 14:01:55'),
(28, NULL, '67cc401c-c266-4007-8f46-989017a6f926.jpg', 'FB_IMG_1461957269899.jpg', '/uploads/products/67cc401c-c266-4007-8f46-989017a6f926.jpg', 0, 0, '2021-07-21 14:44:35', '2021-07-21 14:44:35'),
(29, NULL, '32f1c707-6aff-4fa0-b0ba-1a14882a34b5.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/32f1c707-6aff-4fa0-b0ba-1a14882a34b5.jpg', 1, 0, '2021-07-21 14:44:35', '2021-07-21 14:44:35'),
(30, NULL, 'a76da6dd-cc75-4d4d-9a13-b9ce3facb8ef.jpg', 'FB_IMG_1461957269899.jpg', '/uploads/products/a76da6dd-cc75-4d4d-9a13-b9ce3facb8ef.jpg', 0, 0, '2021-07-22 07:21:45', '2021-07-22 07:21:45'),
(31, NULL, '55f24d16-78f1-4136-ba20-083899188792.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/55f24d16-78f1-4136-ba20-083899188792.jpg', 1, 0, '2021-07-22 07:21:45', '2021-07-22 07:21:45'),
(32, NULL, 'f72d3438-d6ce-43b2-ad62-01ee2aba5388.jpg', 'dev.jpg', '/uploads/products/f72d3438-d6ce-43b2-ad62-01ee2aba5388.jpg', 0, 0, '2021-07-22 09:11:20', '2021-07-22 09:11:20'),
(33, NULL, '00ca8f26-c5e6-458f-a2ed-17dcf8cd8dd4.png', 'cloud-phone.png', '/uploads/products/00ca8f26-c5e6-458f-a2ed-17dcf8cd8dd4.png', 0, 0, '2021-07-22 09:23:29', '2021-07-22 09:23:29'),
(34, NULL, 'e033472a-38df-4b0f-9c8d-d093735228b1.jpg', 'dps.jpg', '/uploads/products/e033472a-38df-4b0f-9c8d-d093735228b1.jpg', 0, 0, '2021-07-22 09:26:57', '2021-07-22 09:26:57'),
(35, NULL, 'f583ed11-c22e-469f-8dcb-cb38392a8b88.jpg', 'dev.jpg', '/uploads/products/f583ed11-c22e-469f-8dcb-cb38392a8b88.jpg', 0, 0, '2021-07-22 09:34:07', '2021-07-22 09:34:07'),
(36, NULL, '4abb8d62-d331-4996-95a7-bb69f22d7d5c.jpg', 'free.jpg', '/uploads/products/4abb8d62-d331-4996-95a7-bb69f22d7d5c.jpg', 0, 0, '2021-07-22 09:36:37', '2021-07-22 09:36:37'),
(37, NULL, '590b645c-e125-44b7-915a-3f4e2bcb500b.jpg', 'havana.jpg', '/uploads/products/590b645c-e125-44b7-915a-3f4e2bcb500b.jpg', 1, 0, '2021-07-22 09:36:37', '2021-07-22 09:36:37'),
(38, NULL, '02ef1cdf-df06-47d9-bc93-e3089078fb60.png', 'opera.png', '/uploads/products/02ef1cdf-df06-47d9-bc93-e3089078fb60.png', 0, 0, '2021-07-22 09:38:59', '2021-07-22 09:38:59'),
(39, NULL, 'd36296a9-d890-4d45-8ff9-1227db101f90.jpg', 'polo.jpg', '/uploads/products/d36296a9-d890-4d45-8ff9-1227db101f90.jpg', 1, 0, '2021-07-22 09:38:59', '2021-07-22 09:38:59'),
(40, NULL, '0080c8de-a6ef-47a0-84da-b843633c6462.jpg', 'dps.jpg', '/uploads/products/0080c8de-a6ef-47a0-84da-b843633c6462.jpg', 0, 0, '2021-07-22 09:57:00', '2021-07-22 09:57:00'),
(41, NULL, '3df73ca2-c8ad-41b9-ae39-e54aa34df004.jpg', 'havana.jpg', '/uploads/products/3df73ca2-c8ad-41b9-ae39-e54aa34df004.jpg', 1, 0, '2021-07-22 09:57:00', '2021-07-22 09:57:00'),
(42, 277, '54a3b4f1-6940-4ff1-b737-522e183f8164.jpg', 'dps.jpg', '/uploads/products/54a3b4f1-6940-4ff1-b737-522e183f8164.jpg', 0, 0, '2021-07-22 09:59:27', '2021-07-22 10:00:02'),
(43, NULL, '964f2150-bb15-4c12-afcc-7bc88bdd6fc6.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/964f2150-bb15-4c12-afcc-7bc88bdd6fc6.jpg', 0, 0, '2021-07-22 10:04:21', '2021-07-22 10:04:21'),
(44, 279, 'c4bcabce-12eb-4b5a-958a-46c5166091e1.jpg', 'FB_IMG_1461957269899.jpg', '/uploads/products/c4bcabce-12eb-4b5a-958a-46c5166091e1.jpg', 0, 0, '2021-07-22 10:04:36', '2021-07-22 10:05:40'),
(45, 279, 'c14b8294-2f9a-46d0-8bac-d74439a3dc49.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/c14b8294-2f9a-46d0-8bac-d74439a3dc49.jpg', 1, 0, '2021-07-22 10:04:36', '2021-07-22 10:05:40'),
(46, NULL, '6c69ff6f-ae73-4f62-b64e-cfe031b49939.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/6c69ff6f-ae73-4f62-b64e-cfe031b49939.jpg', 0, 0, '2021-07-22 10:42:05', '2021-07-22 10:42:05'),
(47, NULL, '80b0da03-7ae8-4ac3-9ff9-a79adcfb04a3.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/80b0da03-7ae8-4ac3-9ff9-a79adcfb04a3.jpg', 0, 0, '2021-07-22 11:15:52', '2021-07-22 11:15:52'),
(48, NULL, '125312f5-12fa-43d6-9be5-4534ee9e1b4a.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/125312f5-12fa-43d6-9be5-4534ee9e1b4a.jpg', 0, 0, '2021-07-22 12:04:24', '2021-07-22 12:04:24'),
(49, NULL, '95b00052-d810-4114-9f16-5760310166d5.jpg', 'free.jpg', '/uploads/products/95b00052-d810-4114-9f16-5760310166d5.jpg', 0, 0, '2021-07-22 12:07:28', '2021-07-22 12:07:28'),
(50, NULL, '6c95d1ce-31c5-4af1-a606-8fb46cd03234.jpg', 'silver_bracelet.jpg', '/uploads/products/6c95d1ce-31c5-4af1-a606-8fb46cd03234.jpg', 0, 0, '2021-07-22 12:08:06', '2021-07-22 12:08:06'),
(51, 285, '7345422b-d488-4219-be08-f5ae13ec9234.jpg', 'Beauty-routine-on-a-budget-1-1.jpg', '/uploads/products/7345422b-d488-4219-be08-f5ae13ec9234.jpg', 0, 0, '2021-07-22 12:09:39', '2021-07-22 12:12:10'),
(52, NULL, '9210cc7c-f05a-4077-aa00-52f920710efa.jpg', 'slip.jpg', '/uploads/products/9210cc7c-f05a-4077-aa00-52f920710efa.jpg', 0, 0, '2021-07-22 12:10:09', '2021-07-22 12:10:09'),
(53, NULL, '020534ca-b4a8-46c2-822f-509b4747c0e8.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/020534ca-b4a8-46c2-822f-509b4747c0e8.jpg', 0, 0, '2021-07-22 12:17:25', '2021-07-22 12:17:25'),
(54, NULL, 'dd712b97-d95b-456c-b405-65179bb1fba0.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/dd712b97-d95b-456c-b405-65179bb1fba0.jpg', 0, 0, '2021-07-22 12:30:13', '2021-07-22 12:30:13'),
(55, NULL, '76e4c977-b940-4782-808a-bae5969c4e32.jpg', 'free.jpg', '/uploads/products/76e4c977-b940-4782-808a-bae5969c4e32.jpg', 0, 0, '2021-07-22 12:33:50', '2021-07-22 12:33:50'),
(56, 293, 'c699b286-57f3-49c9-b600-8fde52b224f8.jpg', 'Beauty-routine-on-a-budget-1-1.jpg', '/uploads/products/c699b286-57f3-49c9-b600-8fde52b224f8.jpg', 0, 0, '2021-07-22 12:40:20', '2021-07-22 12:40:49'),
(57, NULL, 'c21bb8eb-17e7-469b-ad9c-aab8fcd4a670.jpg', 'free.jpg', '/uploads/products/c21bb8eb-17e7-469b-ad9c-aab8fcd4a670.jpg', 0, 0, '2021-07-22 12:40:44', '2021-07-22 12:40:44'),
(58, 295, 'b4768f3e-3bc8-4330-b1cb-9a5f4d6d17e6.jpg', 'dps.jpg', '/uploads/products/b4768f3e-3bc8-4330-b1cb-9a5f4d6d17e6.jpg', 0, 0, '2021-07-22 12:48:10', '2021-07-22 12:48:39'),
(59, NULL, 'f1581fac-b362-469e-8e0b-6602900f8d30.jpg', 'ftp.jpg', '/uploads/products/f1581fac-b362-469e-8e0b-6602900f8d30.jpg', 0, 0, '2021-07-22 12:51:26', '2021-07-22 12:51:26'),
(60, NULL, 'edce974e-f5e9-42b5-a448-fbaf0dad8055.jpg', 'Beauty-routine-on-a-budget-1-1.jpg', '/uploads/products/edce974e-f5e9-42b5-a448-fbaf0dad8055.jpg', 0, 0, '2021-07-22 12:52:32', '2021-07-22 12:52:32'),
(61, NULL, '8f4898af-478d-4ea3-a046-738b9eb8503b.jpg', 'dev.jpg', '/uploads/products/8f4898af-478d-4ea3-a046-738b9eb8503b.jpg', 1, 0, '2021-07-22 12:52:32', '2021-07-22 12:52:32'),
(62, 298, '483c2681-9ed3-4607-9e2b-ddf29e4fab54.jpg', 'havana.jpg', '/uploads/products/483c2681-9ed3-4607-9e2b-ddf29e4fab54.jpg', 0, 0, '2021-07-22 12:55:45', '2021-07-22 12:55:54'),
(63, 298, 'd22852fd-210a-4b17-8841-b21569317d0d.jpg', 'mac-cosmetics.jpg', '/uploads/products/d22852fd-210a-4b17-8841-b21569317d0d.jpg', 1, 0, '2021-07-22 12:55:45', '2021-07-22 12:55:54'),
(64, 298, '397eb190-721a-4ca9-821a-4e334dd685d8.png', 'opera.png', '/uploads/products/397eb190-721a-4ca9-821a-4e334dd685d8.png', 2, 0, '2021-07-22 12:55:45', '2021-07-22 12:55:54'),
(65, 299, '2581da57-b591-48e6-8909-b2bd10cf0fe9.png', 'opera.png', '/uploads/products/2581da57-b591-48e6-8909-b2bd10cf0fe9.png', 0, 0, '2021-07-22 12:59:36', '2021-07-22 13:00:15'),
(66, 299, 'bf29894e-678b-4933-b63d-19ab53cb8ef2.jpg', 'polo.jpg', '/uploads/products/bf29894e-678b-4933-b63d-19ab53cb8ef2.jpg', 1, 0, '2021-07-22 12:59:36', '2021-07-22 13:00:15'),
(67, 299, 'a5ae2851-b35f-4d42-a7c4-e97991d49c7a.jpg', 'silver_bracelet.jpg', '/uploads/products/a5ae2851-b35f-4d42-a7c4-e97991d49c7a.jpg', 2, 0, '2021-07-22 12:59:36', '2021-07-22 13:00:15'),
(68, NULL, '037fd4dd-ed83-4f8c-9665-af7b7fcb0a15.png', 'qa-cood.png', '/uploads/products/037fd4dd-ed83-4f8c-9665-af7b7fcb0a15.png', 0, 0, '2021-07-22 13:00:07', '2021-07-22 13:00:07'),
(69, NULL, '60c23de6-83b1-4542-a14b-28aa369076a9.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/60c23de6-83b1-4542-a14b-28aa369076a9.jpg', 0, 0, '2021-07-22 13:23:19', '2021-07-22 13:23:19'),
(70, 305, '79adad54-adc0-4813-a1c1-b50b4753f0e1.jpg', 'silver_bracelet.jpg', '/uploads/products/79adad54-adc0-4813-a1c1-b50b4753f0e1.jpg', 0, 0, '2021-07-22 13:31:10', '2021-07-22 13:31:38'),
(71, 305, 'ca7f692d-1dc2-4645-86a4-78373c6e7756.webp', 'sneakers.webp', '/uploads/products/ca7f692d-1dc2-4645-86a4-78373c6e7756.webp', 1, 0, '2021-07-22 13:31:10', '2021-07-22 13:31:38'),
(72, NULL, 'ce81a926-0f2a-4c3c-9dc3-c0dbbe4e614f.png', 'Untitled.png', '/uploads/products/ce81a926-0f2a-4c3c-9dc3-c0dbbe4e614f.png', 0, 0, '2021-07-22 13:35:12', '2021-07-22 13:35:12'),
(73, NULL, '01aceab7-25b9-4fa7-9086-82fe3a1f3c30.jpg', 'v2.jpg', '/uploads/products/01aceab7-25b9-4fa7-9086-82fe3a1f3c30.jpg', 1, 0, '2021-07-22 13:35:12', '2021-07-22 13:35:12'),
(74, NULL, 'bb170006-4228-43b5-ba7c-6e1ec48e7e72.png', 'Untitled.png', '/uploads/products/bb170006-4228-43b5-ba7c-6e1ec48e7e72.png', 0, 0, '2021-07-22 13:35:13', '2021-07-22 13:35:13'),
(75, 307, 'fb1d6586-240a-4f8d-b72d-a703181b2431.jpg', 'free.jpg', '/uploads/products/fb1d6586-240a-4f8d-b72d-a703181b2431.jpg', 0, 0, '2021-07-22 13:35:25', '2021-07-22 13:35:59'),
(76, 307, 'ce7a6ca0-9f42-4bed-86b5-6e2a3cdd51aa.jpg', 'havana.jpg', '/uploads/products/ce7a6ca0-9f42-4bed-86b5-6e2a3cdd51aa.jpg', 1, 0, '2021-07-22 13:35:25', '2021-07-22 13:35:59'),
(77, NULL, '055556db-ce07-42f4-8282-9fec286b8ecb.jpg', 'havana.jpg', '/uploads/products/055556db-ce07-42f4-8282-9fec286b8ecb.jpg', 0, 0, '2021-07-22 13:35:54', '2021-07-22 13:35:54'),
(78, 309, '9cec95f5-3536-4ccc-a0ea-0ec5b8caa667.jpg', 'dev.jpg', '/uploads/products/9cec95f5-3536-4ccc-a0ea-0ec5b8caa667.jpg', 0, 0, '2021-07-22 14:09:01', '2021-07-22 14:28:20'),
(79, 309, 'b1f614ec-c8f4-450a-8f01-74320a01406d.jpg', 'havana.jpg', '/uploads/products/b1f614ec-c8f4-450a-8f01-74320a01406d.jpg', 1, 0, '2021-07-22 14:09:01', '2021-07-22 14:28:20'),
(80, NULL, '67c2649e-cfab-4e33-9ebd-dc448e217984.jpg', 'henley.jpg', '/uploads/products/67c2649e-cfab-4e33-9ebd-dc448e217984.jpg', 0, 0, '2021-07-22 14:27:49', '2021-07-22 14:27:49'),
(81, 311, '4649f450-e9f8-407f-aab8-fd50c8d38a5d.jpg', 'dev.jpg', '/uploads/products/4649f450-e9f8-407f-aab8-fd50c8d38a5d.jpg', 0, 0, '2021-07-22 14:33:28', '2021-07-22 14:34:02'),
(82, 313, 'b67daf71-eec9-4657-b691-fa5f8456c68c.jpg', 'dev.jpg', '/uploads/products/b67daf71-eec9-4657-b691-fa5f8456c68c.jpg', 0, 0, '2021-07-22 14:44:45', '2021-07-22 14:45:13'),
(83, NULL, 'd6154363-3922-4ca6-ab8e-7dcacdc78e87.jpg', 'free.jpg', '/uploads/products/d6154363-3922-4ca6-ab8e-7dcacdc78e87.jpg', 0, 0, '2021-07-22 14:46:32', '2021-07-22 14:46:32'),
(84, 315, 'fadaccf5-f340-43d5-a657-623ab4169dbf.jpg', 'dev.jpg', '/uploads/products/fadaccf5-f340-43d5-a657-623ab4169dbf.jpg', 0, 0, '2021-07-22 14:49:18', '2021-07-22 14:49:56'),
(85, 317, 'c672b2df-2bf0-4d9d-a94a-0905eb7c1c2e.jpg', 'dps.jpg', '/uploads/products/c672b2df-2bf0-4d9d-a94a-0905eb7c1c2e.jpg', 0, 0, '2021-07-22 14:51:38', '2021-07-22 14:52:22'),
(86, NULL, 'de1715b1-397c-4544-ae36-0c5189156e53.png', 'qa-cood.png', '/uploads/products/de1715b1-397c-4544-ae36-0c5189156e53.png', 0, 0, '2021-07-22 14:52:15', '2021-07-22 14:52:15'),
(87, NULL, '2dcd897c-4c95-4df2-b154-cd59956f14cf.png', '404.png', '/uploads/products/2dcd897c-4c95-4df2-b154-cd59956f14cf.png', 0, 0, '2021-07-22 14:55:17', '2021-07-22 14:55:17'),
(88, NULL, 'd148a06a-1bbe-4d80-9d99-4de3afdcce65.jpg', 'henley.jpg', '/uploads/products/d148a06a-1bbe-4d80-9d99-4de3afdcce65.jpg', 0, 0, '2021-07-22 14:55:40', '2021-07-22 14:55:40'),
(89, 321, '0bddc3e1-dee1-4011-a494-20be1299aa85.jpg', 'dev.jpg', '/uploads/products/0bddc3e1-dee1-4011-a494-20be1299aa85.jpg', 0, 0, '2021-07-22 14:59:59', '2021-07-22 15:00:24'),
(90, NULL, 'd1bd5822-b5d5-4979-8efb-1348d879064e.jpg', 'dps.jpg', '/uploads/products/d1bd5822-b5d5-4979-8efb-1348d879064e.jpg', 0, 0, '2021-07-22 15:13:41', '2021-07-22 15:13:41'),
(91, NULL, 'a3067c4e-4134-42b6-845e-57e1aa154c5c.jpg', 'henley.jpg', '/uploads/products/a3067c4e-4134-42b6-845e-57e1aa154c5c.jpg', 0, 0, '2021-07-22 15:14:10', '2021-07-22 15:14:10'),
(92, 324, 'd49d9393-d428-4229-a3c1-975e42e7b7cf.jpg', 'ManufacturingCosmetics.jpg', '/uploads/products/d49d9393-d428-4229-a3c1-975e42e7b7cf.jpg', 0, 0, '2021-07-22 15:15:59', '2021-07-22 15:16:03'),
(93, 325, '484b8eef-e3cd-4e79-af27-df1f0f214600.jpg', 'dps.jpg', '/uploads/products/484b8eef-e3cd-4e79-af27-df1f0f214600.jpg', 0, 0, '2021-07-23 02:54:55', '2021-07-23 02:55:25'),
(94, 325, 'd7a2843c-8f56-40ec-8abb-1b3e7f60a7ba.jpg', 'havana.jpg', '/uploads/products/d7a2843c-8f56-40ec-8abb-1b3e7f60a7ba.jpg', 1, 0, '2021-07-23 02:54:55', '2021-07-23 02:55:25'),
(95, 325, '766c85c8-663d-4458-bcd9-4b09a687a80b.jpg', 'leg.jpg', '/uploads/products/766c85c8-663d-4458-bcd9-4b09a687a80b.jpg', 2, 0, '2021-07-23 02:54:55', '2021-07-23 02:55:25'),
(96, 325, '336de206-24c8-4d61-978d-dc2f64924690.jpg', 'pf-00506b7d--Shoes.jpg', '/uploads/products/336de206-24c8-4d61-978d-dc2f64924690.jpg', 3, 0, '2021-07-23 02:54:55', '2021-07-23 02:55:25'),
(97, 327, '32a05f5c-bfe5-42da-84ae-ecba89e95c57.jpg', 'dps.jpg', '/uploads/products/32a05f5c-bfe5-42da-84ae-ecba89e95c57.jpg', 0, 0, '2021-07-23 03:00:34', '2021-07-23 03:01:48'),
(98, 327, '98c9bf95-d433-4a94-9a10-a13473d1e19f.jpg', 'havana.jpg', '/uploads/products/98c9bf95-d433-4a94-9a10-a13473d1e19f.jpg', 1, 0, '2021-07-23 03:00:34', '2021-07-23 03:01:48'),
(99, 327, '1b15cf0a-1fe4-4185-8e20-2d6baf7c204c.jpg', 'Pair-leather-shoes.jpg', '/uploads/products/1b15cf0a-1fe4-4185-8e20-2d6baf7c204c.jpg', 2, 0, '2021-07-23 03:00:34', '2021-07-23 03:01:48'),
(100, 328, 'f489cb96-29a8-4497-8520-7d53bf4cf7da.jpeg', 'sneakers.jpeg', '/uploads/products/f489cb96-29a8-4497-8520-7d53bf4cf7da.jpeg', 0, 0, '2021-07-23 03:00:56', '2021-07-23 03:01:48'),
(101, 329, '8826a1ca-13a5-4ab7-a2a8-a1fb49752e62.jpg', 'dps.jpg', '/uploads/products/8826a1ca-13a5-4ab7-a2a8-a1fb49752e62.jpg', 0, 0, '2021-07-23 03:03:31', '2021-07-23 03:04:07'),
(102, 329, 'e00434e7-8b96-4c56-b467-659c51857239.jpg', 'havana.jpg', '/uploads/products/e00434e7-8b96-4c56-b467-659c51857239.jpg', 1, 0, '2021-07-23 03:03:31', '2021-07-23 03:04:07'),
(103, 329, '03d1b0a6-6534-4258-948c-626505fdb94d.jpg', 'henley.jpg', '/uploads/products/03d1b0a6-6534-4258-948c-626505fdb94d.jpg', 2, 0, '2021-07-23 03:03:31', '2021-07-23 03:04:07'),
(104, 329, 'a76c31fd-e2f6-4ac5-bbf3-56aa64e304d6.jpg', 'leg.jpg', '/uploads/products/a76c31fd-e2f6-4ac5-bbf3-56aa64e304d6.jpg', 3, 0, '2021-07-23 03:03:31', '2021-07-23 03:04:07'),
(105, 330, 'a89cb05e-6efe-4318-b6cf-bc541555caf0.jpg', 'pf-00506b7d--Shoes.jpg', '/uploads/products/a89cb05e-6efe-4318-b6cf-bc541555caf0.jpg', 0, 0, '2021-07-23 03:04:02', '2021-07-23 03:04:07'),
(106, 331, '4a15267a-1b9d-43fb-ac68-52ff6519f14d.jpg', 'dps.jpg', '/uploads/products/4a15267a-1b9d-43fb-ac68-52ff6519f14d.jpg', 0, 0, '2021-07-23 03:05:28', '2021-07-23 03:07:15'),
(107, 331, '8d104c61-28be-4502-8d71-b64713f3a14c.jpg', 'havana.jpg', '/uploads/products/8d104c61-28be-4502-8d71-b64713f3a14c.jpg', 1, 0, '2021-07-23 03:05:28', '2021-07-23 03:07:15'),
(108, 331, 'a3361f10-52f6-48cf-871b-e9da20e68e3d.jpg', 'Pair-leather-shoes.jpg', '/uploads/products/a3361f10-52f6-48cf-871b-e9da20e68e3d.jpg', 2, 0, '2021-07-23 03:05:28', '2021-07-23 03:07:15'),
(109, 332, '4a7b8d3f-5758-4ddb-8ead-d7a04f66cb9b.jpg', 'polo.jpg', '/uploads/products/4a7b8d3f-5758-4ddb-8ead-d7a04f66cb9b.jpg', 0, 0, '2021-07-23 03:05:55', '2021-07-23 03:07:14'),
(110, 333, '0130b226-4e0a-4738-83fc-6865b11b0244.jpeg', 'sneakers.jpeg', '/uploads/products/0130b226-4e0a-4738-83fc-6865b11b0244.jpeg', 0, 0, '2021-07-23 03:06:17', '2021-07-23 03:07:14'),
(111, 334, 'b2aa5997-cb0d-4842-9a2d-bca20ecb0955.jpg', 'pf-00506b7d--Shoes.jpg', '/uploads/products/b2aa5997-cb0d-4842-9a2d-bca20ecb0955.jpg', 0, 0, '2021-07-23 03:06:40', '2021-07-23 03:07:15'),
(112, 335, 'ed06f51a-1e03-4fd7-a851-0c66d3231011.jpg', 'havana.jpg', '/uploads/products/ed06f51a-1e03-4fd7-a851-0c66d3231011.jpg', 0, 0, '2021-07-23 03:07:11', '2021-07-23 03:07:15'),
(113, 338, '106d4c6c-d422-42b6-b4e2-2a0e77f7939f.jpg', 'dps.jpg', '/uploads/products/106d4c6c-d422-42b6-b4e2-2a0e77f7939f.jpg', 0, 0, '2021-07-23 03:44:33', '2021-07-23 03:45:44'),
(114, 338, 'e4921efa-59ea-45d1-98ac-8f84a2119bb7.jpg', 'leg.jpg', '/uploads/products/e4921efa-59ea-45d1-98ac-8f84a2119bb7.jpg', 1, 0, '2021-07-23 03:44:33', '2021-07-23 03:45:44'),
(115, 338, '0734abf7-53ab-47e0-b050-675de7aa3ba1.jpg', 'pf-00506b7d--Shoes.jpg', '/uploads/products/0734abf7-53ab-47e0-b050-675de7aa3ba1.jpg', 2, 0, '2021-07-23 03:44:33', '2021-07-23 03:45:44'),
(116, 338, '21f0fd9f-6193-4850-8bd9-f5d805edb10d.jpg', 'polo.jpg', '/uploads/products/21f0fd9f-6193-4850-8bd9-f5d805edb10d.jpg', 3, 0, '2021-07-23 03:44:33', '2021-07-23 03:45:44'),
(117, 339, '074e3f67-70f6-4e70-8611-73a4f453de6d.jpg', 'henley.jpg', '/uploads/products/074e3f67-70f6-4e70-8611-73a4f453de6d.jpg', 0, 0, '2021-07-23 03:44:57', '2021-07-23 03:45:44'),
(118, 340, 'bde5285a-4fd2-4e62-8add-e17d56959231.jpg', 'Pair-leather-shoes.jpg', '/uploads/products/bde5285a-4fd2-4e62-8add-e17d56959231.jpg', 0, 0, '2021-07-23 03:45:22', '2021-07-23 03:45:44'),
(119, 342, '47401fe5-fa2d-42e1-a45c-a7faef02d0d4.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/47401fe5-fa2d-42e1-a45c-a7faef02d0d4.jpg', 0, 0, '2021-07-23 06:19:21', '2021-07-23 06:19:52'),
(120, 343, '155250ae-196d-4075-b156-4d5fa451975e.png', 'qa-cood.png', '/uploads/products/155250ae-196d-4075-b156-4d5fa451975e.png', 0, 0, '2021-07-23 08:50:32', '2021-07-23 08:51:08'),
(121, 344, 'd0b1c77e-e0b2-4323-8d8c-950765533231.webp', 'loafers.webp', '/uploads/products/d0b1c77e-e0b2-4323-8d8c-950765533231.webp', 0, 0, '2021-07-23 08:50:57', '2021-07-23 08:51:08'),
(122, NULL, '4dee5737-8ba8-465c-b255-d4911e1bce1b.jpg', 'FB_IMG_1461957262610.jpg', '/uploads/products/4dee5737-8ba8-465c-b255-d4911e1bce1b.jpg', 0, 0, '2021-07-23 10:29:01', '2021-07-23 10:29:01'),
(123, NULL, '2d949178-5f8f-484d-8460-a4e78405ca4d.jpg', 'FB_IMG_1461957269899.jpg', '/uploads/products/2d949178-5f8f-484d-8460-a4e78405ca4d.jpg', 1, 0, '2021-07-23 10:29:01', '2021-07-23 10:29:01'),
(124, NULL, '1c4819d6-f58d-4384-a80e-c71b81bf4c0e.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/1c4819d6-f58d-4384-a80e-c71b81bf4c0e.jpg', 2, 0, '2021-07-23 10:29:01', '2021-07-23 10:29:01'),
(125, NULL, '0e380bb4-7bf1-4e62-9bdc-64dbde26b478.jpg', 'FB_IMG_1461957262610.jpg', '/uploads/products/0e380bb4-7bf1-4e62-9bdc-64dbde26b478.jpg', 0, 0, '2021-07-23 11:02:39', '2021-07-23 11:02:39'),
(126, NULL, '82a74b36-f477-4157-820e-cb2fff260dc6.jpg', 'FB_IMG_1461957269899.jpg', '/uploads/products/82a74b36-f477-4157-820e-cb2fff260dc6.jpg', 1, 0, '2021-07-23 11:02:39', '2021-07-23 11:02:39'),
(127, NULL, '97dd46a4-903c-4c3a-aa81-ec10e4095f21.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/97dd46a4-903c-4c3a-aa81-ec10e4095f21.jpg', 2, 0, '2021-07-23 11:02:39', '2021-07-23 11:02:39'),
(128, NULL, 'e12fef41-fdf7-4acf-8f4c-1c53775306d9.jpg', 'FB_IMG_1461957269899.jpg', '/uploads/products/e12fef41-fdf7-4acf-8f4c-1c53775306d9.jpg', 0, 0, '2021-07-23 11:02:57', '2021-07-23 11:02:57'),
(129, NULL, '6604f9d0-1cd2-4178-9e35-ca10991b2c75.jpg', 'FB_IMG_1461957269899.jpg', '/uploads/products/6604f9d0-1cd2-4178-9e35-ca10991b2c75.jpg', 0, 0, '2021-07-23 11:05:17', '2021-07-23 11:05:17'),
(130, 347, '049f6506-2e27-4a79-8933-b82e8e49943a.png', 'msg table.png', '/uploads/products/049f6506-2e27-4a79-8933-b82e8e49943a.png', 0, 0, '2021-07-23 11:23:50', '2021-07-23 11:24:28'),
(131, 347, '2ae2206e-defb-4d52-a475-4d80440d9a2a.png', 'opera.png', '/uploads/products/2ae2206e-defb-4d52-a475-4d80440d9a2a.png', 1, 0, '2021-07-23 11:23:50', '2021-07-23 11:24:28'),
(132, NULL, '5749df89-5d87-459b-ba30-d445418a4571.jpg', 'dev.jpg', '/uploads/products/5749df89-5d87-459b-ba30-d445418a4571.jpg', 0, 0, '2021-07-23 11:52:26', '2021-07-23 11:52:26'),
(133, 349, '5c820b1d-ac90-4bb9-bb34-6d353d4c0e9d.jpg', 'Beauty-routine-on-a-budget-1-1.jpg', '/uploads/products/5c820b1d-ac90-4bb9-bb34-6d353d4c0e9d.jpg', 0, 0, '2021-07-23 11:53:22', '2021-07-23 11:53:37'),
(134, NULL, 'a8f76f72-e6b5-4c19-9e86-04a7b1287509.jpg', 'dev.jpg', '/uploads/products/a8f76f72-e6b5-4c19-9e86-04a7b1287509.jpg', 0, 0, '2021-07-23 11:54:52', '2021-07-23 11:54:52'),
(135, 351, 'd1635525-9338-4c1b-b72a-f4c1493017a2.jpg', 'dev.jpg', '/uploads/products/d1635525-9338-4c1b-b72a-f4c1493017a2.jpg', 0, 0, '2021-07-23 12:04:06', '2021-07-23 12:05:19'),
(136, NULL, '97f36189-9a1e-4d8b-8881-b246fd298b91.jpg', 'silver_bracelet.jpg', '/uploads/products/97f36189-9a1e-4d8b-8881-b246fd298b91.jpg', 0, 0, '2021-07-23 12:04:25', '2021-07-23 12:04:25'),
(137, NULL, 'c6c113ae-aefa-4b52-9753-c4da42763978.jpg', 'dev.jpg', '/uploads/products/c6c113ae-aefa-4b52-9753-c4da42763978.jpg', 0, 0, '2021-07-23 12:10:28', '2021-07-23 12:10:28'),
(138, NULL, 'b5ff8941-fab2-4463-a290-d122481a393e.jpg', 'silver_bracelet.jpg', '/uploads/products/b5ff8941-fab2-4463-a290-d122481a393e.jpg', 0, 0, '2021-07-23 12:10:59', '2021-07-23 12:10:59'),
(139, 353, '8f6cc43b-5d2f-4112-bf6c-04d47300573c.jpg', 'Beauty-routine-on-a-budget-1-1.jpg', '/uploads/products/8f6cc43b-5d2f-4112-bf6c-04d47300573c.jpg', 0, 0, '2021-07-23 12:12:37', '2021-07-23 12:13:48'),
(140, 353, 'ca89cc1c-4e5f-46b9-a883-f401f294fde2.png', 'cloud-phone.png', '/uploads/products/ca89cc1c-4e5f-46b9-a883-f401f294fde2.png', 1, 0, '2021-07-23 12:12:37', '2021-07-23 12:13:48'),
(141, NULL, '072d303f-f62e-4b7f-997b-84862fdf98cf.jpg', 'ManufacturingCosmetics.jpg', '/uploads/products/072d303f-f62e-4b7f-997b-84862fdf98cf.jpg', 0, 0, '2021-07-23 12:13:10', '2021-07-23 12:13:10'),
(142, 355, '7d65afa8-f9fb-4411-97dc-16bbf6fd88f3.jpg', 'Beauty-routine-on-a-budget-1-1.jpg', '/uploads/products/7d65afa8-f9fb-4411-97dc-16bbf6fd88f3.jpg', 0, 0, '2021-07-23 12:24:57', '2021-07-23 12:25:24'),
(143, NULL, '921a095e-f294-4f89-bb50-f1f54dfd7bf3.jpg', 'free.jpg', '/uploads/products/921a095e-f294-4f89-bb50-f1f54dfd7bf3.jpg', 0, 0, '2021-07-23 12:25:20', '2021-07-23 12:25:20'),
(144, 357, 'e2e6ab15-ab6b-4b80-b93b-788715a4dd90.jpg', 'Beauty-routine-on-a-budget-1-1.jpg', '/uploads/products/e2e6ab15-ab6b-4b80-b93b-788715a4dd90.jpg', 0, 0, '2021-07-23 12:27:04', '2021-07-23 12:27:45'),
(145, NULL, 'abd19321-eaf9-48c4-a925-f6fedf954b6c.jpg', 'dev.jpg', '/uploads/products/abd19321-eaf9-48c4-a925-f6fedf954b6c.jpg', 0, 0, '2021-07-23 12:32:58', '2021-07-23 12:32:58'),
(146, NULL, '36e64fd1-ceb4-49f1-960f-96180d51f5d0.jpg', 'silver_bracelet.jpg', '/uploads/products/36e64fd1-ceb4-49f1-960f-96180d51f5d0.jpg', 0, 0, '2021-07-23 12:55:39', '2021-07-23 12:55:39'),
(147, 363, 'fe77575e-2d06-4464-ab6f-8e9dcb179299.jpg', 'havana.jpg', '/uploads/products/fe77575e-2d06-4464-ab6f-8e9dcb179299.jpg', 0, 0, '2021-07-23 13:05:46', '2021-07-23 13:06:41'),
(148, NULL, 'b99515a7-cd45-424a-8ebc-5eecceb17448.jpg', 'leg.jpg', '/uploads/products/b99515a7-cd45-424a-8ebc-5eecceb17448.jpg', 0, 0, '2021-07-23 13:06:21', '2021-07-23 13:06:21'),
(149, 365, '68a83477-5b91-4398-a689-8c3c22ffd209.jpg', 'dps.jpg', '/uploads/products/68a83477-5b91-4398-a689-8c3c22ffd209.jpg', 0, 0, '2021-07-23 13:08:53', '2021-07-23 13:09:41'),
(150, NULL, '9229abb5-010e-4f66-8634-51a6be74c41b.jpg', 'pf-00506b7d--Shoes.jpg', '/uploads/products/9229abb5-010e-4f66-8634-51a6be74c41b.jpg', 0, 0, '2021-07-23 13:09:23', '2021-07-23 13:09:23'),
(151, 367, 'a5cc9820-a80d-46c6-a685-b7b347c68355.jpg', 'havana.jpg', '/uploads/products/a5cc9820-a80d-46c6-a685-b7b347c68355.jpg', 0, 0, '2021-07-23 13:13:55', '2021-07-23 13:14:50'),
(152, 368, 'be7b1476-28ec-4305-ad7f-22163ae1a3d5.jpg', 'Pair-leather-shoes.jpg', '/uploads/products/be7b1476-28ec-4305-ad7f-22163ae1a3d5.jpg', 0, 0, '2021-07-23 13:14:26', '2021-07-23 13:14:50'),
(153, 369, 'c42b9816-bdb6-45f3-901a-ab33930a6eac.jpg', 'FB_IMG_1461957262610.jpg', '/uploads/products/c42b9816-bdb6-45f3-901a-ab33930a6eac.jpg', 0, 0, '2021-07-23 14:31:14', '2021-07-23 14:31:43'),
(154, 369, 'e1391706-21d1-4ce3-86f9-974d766cce9e.jpg', 'FB_IMG_1461957269899.jpg', '/uploads/products/e1391706-21d1-4ce3-86f9-974d766cce9e.jpg', 1, 0, '2021-07-23 14:31:14', '2021-07-23 14:31:43'),
(155, 369, '819b7889-2364-4a88-b52c-be335c745ec1.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/819b7889-2364-4a88-b52c-be335c745ec1.jpg', 2, 0, '2021-07-23 14:31:14', '2021-07-23 14:31:43'),
(156, NULL, '21ff6fc0-81a1-47a1-b6e9-2f9e5451a8b2.jpg', 'FB_IMG_1461957454732.jpg', '/uploads/products/21ff6fc0-81a1-47a1-b6e9-2f9e5451a8b2.jpg', 0, 0, '2021-07-23 14:31:31', '2021-07-23 14:31:31'),
(157, 371, 'fede2e4e-c612-49ce-bf57-5ae68b04404f.jpg', 'FB_IMG_1461957432098.jpg', '/uploads/products/fede2e4e-c612-49ce-bf57-5ae68b04404f.jpg', 0, 0, '2021-07-23 14:37:59', '2021-07-23 14:38:30'),
(158, 372, '32db6d6e-cb11-47df-949c-8c429124e5e6.jpg', 'FB_IMG_1461957413589.jpg', '/uploads/products/32db6d6e-cb11-47df-949c-8c429124e5e6.jpg', 0, 0, '2021-07-23 14:38:23', '2021-07-23 14:38:30'),
(159, NULL, 'ba806c71-61f5-4caf-8fe9-662d9bbad225.jpg', 'FB_IMG_1461957262610.jpg', '/uploads/products/ba806c71-61f5-4caf-8fe9-662d9bbad225.jpg', 0, 0, '2021-07-23 16:30:46', '2021-07-23 16:30:46'),
(160, NULL, '60f822c5-2089-490b-9912-d118037dbf2d.jpg', 'FB_IMG_1461957269899.jpg', '/uploads/products/60f822c5-2089-490b-9912-d118037dbf2d.jpg', 1, 0, '2021-07-23 16:30:46', '2021-07-23 16:30:46'),
(161, NULL, 'ec28f18d-5e85-46df-8a9c-ff253d6d9052.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/ec28f18d-5e85-46df-8a9c-ff253d6d9052.jpg', 2, 0, '2021-07-23 16:30:46', '2021-07-23 16:30:46'),
(162, 373, '403d1663-3e0d-4efe-b8fa-39589fec784a.jpg', 'FB_IMG_1461957262610.jpg', '/uploads/products/403d1663-3e0d-4efe-b8fa-39589fec784a.jpg', 0, 0, '2021-07-23 16:32:41', '2021-07-23 16:33:26'),
(163, 373, 'f7375032-e477-48ca-a4e4-81943d2fc27e.jpg', 'FB_IMG_1461957269899.jpg', '/uploads/products/f7375032-e477-48ca-a4e4-81943d2fc27e.jpg', 1, 0, '2021-07-23 16:32:41', '2021-07-23 16:33:26'),
(164, 373, '84556f12-ccd9-4ef9-ad02-21bf34f25c2d.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/84556f12-ccd9-4ef9-ad02-21bf34f25c2d.jpg', 2, 0, '2021-07-23 16:32:41', '2021-07-23 16:33:26'),
(165, 378, 'cc958e5f-1418-4a65-abbe-2d7efc1619ad.jpg', 'dps.jpg', '/uploads/products/cc958e5f-1418-4a65-abbe-2d7efc1619ad.jpg', 0, 0, '2021-07-25 12:10:35', '2021-07-25 12:11:53'),
(166, 378, 'e6b78b51-d4ad-41f4-8e36-2437c3e05771.jpg', 'pf-00506b7d--Shoes.jpg', '/uploads/products/e6b78b51-d4ad-41f4-8e36-2437c3e05771.jpg', 1, 0, '2021-07-25 12:10:35', '2021-07-25 12:11:53'),
(167, 379, 'c807015e-1345-471b-88ae-1956ea39ed47.jpg', 'leg.jpg', '/uploads/products/c807015e-1345-471b-88ae-1956ea39ed47.jpg', 0, 0, '2021-07-25 12:11:42', '2021-07-25 12:11:53'),
(168, 380, 'a61dac27-b525-43a2-85fb-234db93bca93.jpg', 'henley.jpg', '/uploads/products/a61dac27-b525-43a2-85fb-234db93bca93.jpg', 0, 0, '2021-07-26 01:13:11', '2021-07-26 01:15:57'),
(169, 380, 'd4a12d67-c35a-4296-97a4-ff11bf63ba71.jpg', 'polo.jpg', '/uploads/products/d4a12d67-c35a-4296-97a4-ff11bf63ba71.jpg', 1, 0, '2021-07-26 01:13:11', '2021-07-26 01:15:57'),
(170, 381, 'b44dfa32-1192-47b7-8c30-57e9ce2e07ce.jpg', 'leg.jpg', '/uploads/products/b44dfa32-1192-47b7-8c30-57e9ce2e07ce.jpg', 0, 0, '2021-07-26 01:13:55', '2021-07-26 01:15:57'),
(171, 382, 'c05776aa-d008-4fdf-bd74-5f2b9315ed53.jpg', 'Pair-leather-shoes.jpg', '/uploads/products/c05776aa-d008-4fdf-bd74-5f2b9315ed53.jpg', 0, 0, '2021-07-26 01:14:22', '2021-07-26 01:15:57'),
(172, 383, '36624bf6-0cf8-4d40-9573-795b2bf72fb2.jpg', 'pf-00506b7d--Shoes.jpg', '/uploads/products/36624bf6-0cf8-4d40-9573-795b2bf72fb2.jpg', 0, 0, '2021-07-26 01:14:32', '2021-07-26 01:15:57'),
(173, 384, '83333972-5eb1-4868-8640-4f44f2ac9f91.jpg', 'havana.jpg', '/uploads/products/83333972-5eb1-4868-8640-4f44f2ac9f91.jpg', 0, 0, '2021-07-26 01:24:15', '2021-07-26 01:28:03'),
(174, 384, 'd294352e-2bd1-488a-b383-7e757e0cbf9c.jpg', 'henley.jpg', '/uploads/products/d294352e-2bd1-488a-b383-7e757e0cbf9c.jpg', 1, 0, '2021-07-26 01:24:15', '2021-07-26 01:28:03'),
(180, 390, '299069e1-9bce-47a5-a79b-b25aca371d10.jpg', 'FB_IMG_1461957269899.jpg', '/uploads/products/299069e1-9bce-47a5-a79b-b25aca371d10.jpg', 0, 0, '2021-07-26 08:20:47', '2021-07-26 08:22:52'),
(181, 390, '9302d095-ab38-4269-9595-e14a840400f7.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/9302d095-ab38-4269-9595-e14a840400f7.jpg', 1, 0, '2021-07-26 08:20:47', '2021-07-26 08:22:52'),
(182, 391, '965fab10-1706-4440-a995-95b9bc50d42a.jpg', 'FB_IMG_1461957262610.jpg', '/uploads/products/965fab10-1706-4440-a995-95b9bc50d42a.jpg', 0, 0, '2021-07-26 08:21:27', '2021-07-26 08:22:52'),
(183, 392, '635c8e00-364e-4cdf-916d-e9c0d7bad0b5.jpg', 'FB_IMG_1461957207366.jpg', '/uploads/products/635c8e00-364e-4cdf-916d-e9c0d7bad0b5.jpg', 0, 0, '2021-07-26 11:37:25', '2021-07-26 11:38:19'),
(184, 392, '3cba7b9f-2e13-4546-9e98-d1708d60995b.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/3cba7b9f-2e13-4546-9e98-d1708d60995b.jpg', 1, 0, '2021-07-26 11:37:25', '2021-07-26 11:38:19'),
(185, NULL, 'edb17698-2e7c-4692-92a5-860de7c91dc7.jpg', 'FB_IMG_1461957159099.jpg', '/uploads/products/edb17698-2e7c-4692-92a5-860de7c91dc7.jpg', 0, 0, '2021-07-26 11:38:00', '2021-07-26 11:38:00'),
(186, NULL, '7cea7982-b75f-4f6a-a9bc-f7af92fff1b3.jpg', 'FB_IMG_1461957159099.jpg', '/uploads/products/7cea7982-b75f-4f6a-a9bc-f7af92fff1b3.jpg', 0, 0, '2021-07-26 11:48:15', '2021-07-26 11:48:15'),
(187, 394, 'e80f3e4d-6c17-47af-ad6d-d9917ce782db.jpg', 'FB_IMG_1461957413589.jpg', '/uploads/products/e80f3e4d-6c17-47af-ad6d-d9917ce782db.jpg', 0, 0, '2021-07-26 12:27:18', '2021-07-26 12:27:57'),
(188, 397, '35c75fda-9312-41a4-8852-422b4aa7bb64.jpg', 'FB_IMG_1461957207366.jpg', '/uploads/products/35c75fda-9312-41a4-8852-422b4aa7bb64.jpg', 0, 0, '2021-07-26 12:46:14', '2021-07-26 12:46:14'),
(189, 397, 'b7a455e6-fb72-499c-a740-246259dc3c43.jpg', 'FB_IMG_1461957262610.jpg', '/uploads/products/b7a455e6-fb72-499c-a740-246259dc3c43.jpg', 1, 0, '2021-07-26 12:46:14', '2021-07-26 12:46:14'),
(190, 398, '30f8fec8-0f96-4ff9-8a6d-7ac070926182.jpg', 'FB_IMG_1461957207366.jpg', '/uploads/products/30f8fec8-0f96-4ff9-8a6d-7ac070926182.jpg', 0, 0, '2021-07-26 12:54:07', '2021-07-26 12:54:07'),
(191, 398, '43314354-bd98-41a1-9b25-da24d71f4fc9.jpg', 'FB_IMG_1461957262610.jpg', '/uploads/products/43314354-bd98-41a1-9b25-da24d71f4fc9.jpg', 1, 0, '2021-07-26 12:54:07', '2021-07-26 12:54:07'),
(192, NULL, '2db4654b-446a-4047-bbe0-4605195cfd97.png', 'Screen Shot 2021-07-27 at 3.33.36 AM.png', '/uploads/products/2db4654b-446a-4047-bbe0-4605195cfd97.png', 0, 0, '2021-07-26 20:59:17', '2021-07-26 20:59:17'),
(193, NULL, '92a0dc57-8b57-4c83-b818-0542d660f85c.jpg', 'havana.jpg', '/uploads/products/92a0dc57-8b57-4c83-b818-0542d660f85c.jpg', 0, 0, '2021-07-27 04:53:20', '2021-07-27 04:53:20'),
(194, NULL, '5489e739-3cc5-4c81-badf-56ffc87e3ef2.jpg', 'Pair-leather-shoes.jpg', '/uploads/products/5489e739-3cc5-4c81-badf-56ffc87e3ef2.jpg', 0, 0, '2021-07-27 04:53:47', '2021-07-27 04:53:47'),
(195, NULL, '8d6f687c-cdc3-4f65-86e1-31a695299872.png', 'Screen Shot 2021-07-27 at 3.17.15 AM.png', '/uploads/products/8d6f687c-cdc3-4f65-86e1-31a695299872.png', 0, 0, '2021-07-27 08:01:08', '2021-07-27 08:01:08'),
(196, 410, 'cfe69979-14e4-4419-b6f8-e0755d5a83fc.jpg', 'leg.jpg', '/uploads/products/cfe69979-14e4-4419-b6f8-e0755d5a83fc.jpg', 0, 0, '2021-07-27 08:12:20', '2021-07-27 08:13:22'),
(197, 411, 'd8573be1-3abf-43aa-a14b-bd755891820e.jpg', 'dps.jpg', '/uploads/products/d8573be1-3abf-43aa-a14b-bd755891820e.jpg', 0, 0, '2021-07-27 08:12:58', '2021-07-27 08:13:22'),
(198, NULL, '3f20e532-050f-4499-afa8-42160b32e2c0.jpg', 'havana.jpg', '/uploads/products/3f20e532-050f-4499-afa8-42160b32e2c0.jpg', 0, 0, '2021-07-27 08:13:22', '2021-07-27 08:13:22'),
(199, NULL, '5b435012-cc15-4be4-885b-9fdfd05794e6.jpg', 'Pair-leather-shoes.jpg', '/uploads/products/5b435012-cc15-4be4-885b-9fdfd05794e6.jpg', 1, 0, '2021-07-27 08:13:22', '2021-07-27 08:13:22'),
(200, 413, '9417b6b6-4725-4436-81d2-78944e24659d.jpg', 'henley.jpg', '/uploads/products/9417b6b6-4725-4436-81d2-78944e24659d.jpg', 0, 0, '2021-07-27 08:23:16', '2021-07-27 08:23:51'),
(201, NULL, 'a3ca04d9-be67-44e5-9937-f8cdc0e0a10c.webp', 'Gear-Xero-HFS-SOURCE-Xero-Shoes.webp', '/uploads/products/a3ca04d9-be67-44e5-9937-f8cdc0e0a10c.webp', 0, 0, '2021-07-27 08:23:50', '2021-07-27 08:23:50'),
(202, NULL, '561ed0d2-96c7-47b2-a037-47d1897bd0d7.jpg', 'Pair-leather-shoes.jpg', '/uploads/products/561ed0d2-96c7-47b2-a037-47d1897bd0d7.jpg', 1, 0, '2021-07-27 08:23:50', '2021-07-27 08:23:50'),
(203, 415, 'a03038c5-e7d6-460b-8b6c-a4ba0cbbf344.jpg', 'FB_IMG_1461957262610.jpg', '/uploads/products/a03038c5-e7d6-460b-8b6c-a4ba0cbbf344.jpg', 0, 0, '2021-07-27 09:19:47', '2021-07-27 09:19:48'),
(204, 415, 'c21ecd20-5cd4-4817-aae4-05b0b5e7cc83.jpg', 'FB_IMG_1461957269899.jpg', '/uploads/products/c21ecd20-5cd4-4817-aae4-05b0b5e7cc83.jpg', 1, 0, '2021-07-27 09:19:47', '2021-07-27 09:19:48'),
(205, 415, '3b4d6ffc-187b-4d0c-8de0-f300102c17cd.jpg', 'FB_IMG_1461957291549.jpg', '/uploads/products/3b4d6ffc-187b-4d0c-8de0-f300102c17cd.jpg', 2, 0, '2021-07-27 09:19:47', '2021-07-27 09:19:48'),
(206, NULL, 'c744a452-93bd-4894-9ca3-d8e06d64fcc8.jpg', 'FB_IMG_1461957262610.jpg', '/uploads/products/c744a452-93bd-4894-9ca3-d8e06d64fcc8.jpg', 0, 0, '2021-07-27 14:15:24', '2021-07-27 14:15:24'),
(207, NULL, '9ecacd34-7af2-4f4e-a91a-7e25282dc264.jpg', 'FB_IMG_1461957269899.jpg', '/uploads/products/9ecacd34-7af2-4f4e-a91a-7e25282dc264.jpg', 1, 0, '2021-07-27 14:15:24', '2021-07-27 14:15:24'),
(208, 421, 'decc2908-7c8f-449c-a559-97dcde750609.webp', 'Gear-Xero-HFS-SOURCE-Xero-Shoes.webp', '/uploads/products/decc2908-7c8f-449c-a559-97dcde750609.webp', 0, 0, '2021-07-27 16:12:46', '2021-07-27 16:13:00'),
(209, 420, 'd188cbac-8076-4843-9f53-551ff669e59b.jpg', 'havana.jpg', '/uploads/products/d188cbac-8076-4843-9f53-551ff669e59b.jpg', 0, 0, '2021-07-27 16:13:00', '2021-07-27 16:13:00'),
(210, 420, 'a0f30f84-5c5c-4ffc-a202-08d2ba2dd976.jpg', 'henley.jpg', '/uploads/products/a0f30f84-5c5c-4ffc-a202-08d2ba2dd976.jpg', 1, 0, '2021-07-27 16:13:00', '2021-07-27 16:13:00'),
(211, 420, '23cebc8b-11fa-45fe-8afc-43566765ea79.jpg', 'leg.jpg', '/uploads/products/23cebc8b-11fa-45fe-8afc-43566765ea79.jpg', 2, 0, '2021-07-27 16:13:00', '2021-07-27 16:13:00'),
(212, 423, 'a7dac9a2-ee85-4084-b7f0-4c8a59e0b819.jpg', 'dps.jpg', '/uploads/products/a7dac9a2-ee85-4084-b7f0-4c8a59e0b819.jpg', 0, 0, '2021-07-27 16:28:11', '2021-07-27 16:28:24'),
(213, 422, 'e12f8466-2ea0-47ec-af82-d6fcf75e71b6.jpg', 'henley.jpg', '/uploads/products/e12f8466-2ea0-47ec-af82-d6fcf75e71b6.jpg', 0, 0, '2021-07-27 16:28:23', '2021-07-27 16:28:24'),
(214, 422, '9deb6de7-48c8-4af3-a0d2-6d0601e8c362.jpg', 'leg.jpg', '/uploads/products/9deb6de7-48c8-4af3-a0d2-6d0601e8c362.jpg', 1, 0, '2021-07-27 16:28:23', '2021-07-27 16:28:24'),
(215, NULL, 'a7196593-954c-44cd-8d46-4f79cf7f51e5.jpg', 'havana.jpg', '/uploads/products/a7196593-954c-44cd-8d46-4f79cf7f51e5.jpg', 0, 0, '2021-07-27 16:32:48', '2021-07-27 16:32:48'),
(216, 425, '82b8ac02-c1d7-40f5-9ac9-40b4c6790e11.jpeg', 'sneakers.jpeg', '/uploads/products/82b8ac02-c1d7-40f5-9ac9-40b4c6790e11.jpeg', 0, 0, '2021-07-27 16:41:42', '2021-07-27 16:42:17'),
(217, 430, '7a71c206-c827-4969-a3ff-be5cc6f5451f.jpg', 'pf-00506b7d--Shoes.jpg', '/uploads/products/7a71c206-c827-4969-a3ff-be5cc6f5451f.jpg', 0, 0, '2021-07-27 17:34:10', '2021-07-27 17:34:41');

-- --------------------------------------------------------

--
-- Table structure for table `products_options`
--

CREATE TABLE `products_options` (
  `product_id` int(10) DEFAULT NULL,
  `attribute_id` int(10) DEFAULT NULL,
  `option_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_options`
--

INSERT INTO `products_options` (`product_id`, `attribute_id`, `option_id`) VALUES
(158, 176, 104),
(158, 175, 100),
(159, 176, 106),
(159, 175, 101),
(226, 244, 164),
(227, 244, 165),
(229, 246, 166),
(230, 246, 167),
(232, 248, 168),
(233, 248, 169),
(235, 250, 170),
(236, 250, 171),
(238, 252, 172),
(239, 252, 173),
(241, 254, 174),
(242, 254, 175),
(244, 256, 176),
(245, 256, 177),
(247, 258, 178),
(248, 258, 179),
(250, 260, 180),
(251, 260, 181),
(253, 262, 182),
(254, 262, 183),
(256, 264, 184),
(257, 264, 185),
(259, 265, 186),
(259, 266, 188),
(260, 265, 187),
(260, 266, 189),
(262, 267, 190),
(262, 268, 191),
(264, 269, 192),
(264, 270, 193),
(267, 276, 194),
(267, 277, 196),
(268, 276, 195),
(268, 277, 197),
(270, 279, 199),
(270, 280, 201),
(271, 279, 200),
(271, 280, 202),
(273, 282, 204),
(273, 283, 206),
(274, 282, 205),
(274, 283, 206),
(276, 284, 207),
(276, 285, 208),
(278, 286, 209),
(280, 287, 210),
(280, 288, 211),
(282, 289, 212),
(286, 292, 215),
(288, 293, 216),
(290, 294, 217),
(292, 295, 218),
(294, 296, 219),
(296, 297, 220),
(300, 298, 221),
(302, 299, 222),
(304, 300, 223),
(306, 301, 224),
(308, 302, 225),
(310, 303, 226),
(312, 304, 227),
(314, 305, 228),
(316, 306, 229),
(318, 307, 230),
(320, 308, 231),
(322, 309, 232),
(324, 310, 233),
(326, 311, 234),
(328, 312, 235),
(330, 313, 236),
(332, 314, 237),
(333, 314, 238),
(334, 314, 239),
(335, 314, 240),
(339, 315, 241),
(340, 315, 242),
(342, 316, 243),
(344, 317, 244),
(346, 318, 245),
(348, 319, 246),
(350, 320, 247),
(352, 321, 248),
(354, 322, 249),
(356, 323, 250),
(358, 324, 251),
(360, 325, 252),
(362, 326, 253),
(364, 327, 254),
(366, 328, 255),
(368, 329, 256),
(370, 330, 257),
(372, 331, 258),
(374, 332, 259),
(376, 336, 261),
(377, 336, 262),
(379, 337, 263),
(381, 338, 264),
(382, 338, 265),
(383, 338, 266),
(385, 339, 267),
(385, 340, 270),
(385, 341, 275),
(386, 339, 268),
(386, 340, 271),
(386, 341, 276),
(387, 339, 267),
(387, 340, 272),
(387, 341, 277),
(388, 339, 269),
(388, 340, 273),
(388, 341, 278),
(389, 339, 269),
(389, 340, 274),
(389, 341, 275),
(391, 364, 279),
(393, 365, 282),
(395, 366, 283),
(397, 367, 284),
(399, 368, 285),
(401, 369, 286),
(403, 371, 290),
(403, 373, 293),
(403, 374, 294),
(405, 377, 300),
(405, 381, 302),
(406, 381, 303),
(407, 381, 304),
(408, 377, 301),
(408, 381, 305),
(410, 382, 306),
(410, 383, 308),
(410, 384, 310),
(410, 385, 312),
(411, 382, 307),
(411, 383, 309),
(411, 384, 311),
(411, 385, 313),
(413, 386, 314),
(413, 387, 315),
(413, 388, 316),
(413, 389, 317),
(416, 390, 318),
(416, 391, 319),
(417, 390, 318),
(417, 391, 320),
(419, 392, 321),
(421, 393, 322),
(421, 394, 323),
(423, 395, 324),
(425, 396, 325),
(427, 397, 326),
(430, 398, 327),
(432, 399, 328),
(434, 400, 329),
(436, 401, 330),
(438, 402, 331);

-- --------------------------------------------------------

--
-- Table structure for table `products_store`
--

CREATE TABLE `products_store` (
  `id` int(10) NOT NULL,
  `product_id` int(10) DEFAULT NULL,
  `store_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_store`
--

INSERT INTO `products_store` (`id`, `product_id`, `store_id`) VALUES
(1, 135, 3),
(2, 138, 3),
(3, 138, 4),
(4, 142, 3),
(5, 142, 4),
(6, 145, 3),
(7, 145, 4),
(8, 148, 3),
(9, 148, 4),
(10, 157, 3),
(11, 157, 4);

-- --------------------------------------------------------

--
-- Table structure for table `products_tags`
--

CREATE TABLE `products_tags` (
  `tag_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_tags`
--

INSERT INTO `products_tags` (`tag_id`, `product_id`) VALUES
(2, 123),
(3, 123),
(4, 148),
(5, 148),
(6, 151),
(7, 151),
(8, 153),
(9, 153),
(10, 155),
(11, 155),
(12, 157),
(13, 157),
(28, 384),
(29, 384);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` varbinary(255) NOT NULL,
  `session_time` int(11) DEFAULT NULL,
  `session_lifetime` mediumint(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `shipping_id` int(10) NOT NULL,
  `store_id` int(10) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` int(10) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_rules`
--

CREATE TABLE `shipping_rules` (
  `rule_id` int(10) NOT NULL,
  `shipping_id` int(10) DEFAULT NULL,
  `country` int(10) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) DEFAULT NULL,
  `free_from` decimal(10,2) DEFAULT NULL,
  `delete` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `store_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noti_email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `industry` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`store_id`, `user_id`, `name`, `url`, `email`, `noti_email`, `industry`, `status`, `created_at`, `updated_at`, `token`) VALUES
(1, 3, 'Default', NULL, NULL, NULL, NULL, 1, '2021-07-01 19:19:50', '2021-07-01 19:19:52', NULL),
(2, 3, 'Some Canadian Shoe Store', NULL, 'admin@sss.biz', 'admin@sss.biz', 'shoes', 1, '2021-07-05 09:18:59', '2021-07-05 09:18:59', NULL),
(3, 3, 'Some Shoe Store', NULL, 'admin@sss.biz', 'admin@sss.biz', 'shoes', 1, '2021-07-05 09:16:41', '2021-07-05 09:16:41', NULL),
(4, 3, 'Some Mexican Shoe Store', NULL, 'admin@mss.biz', 'admin@mss.biz', 'shoes', 1, '2021-07-05 09:38:45', '2021-07-05 09:38:45', NULL),
(5, 3, 'Russian Shoess Storess', NULL, 'admin@rss.biz', 'admin@rss.biz', 'shoes', 1, '2021-07-05 11:49:05', '2021-07-05 11:49:05', NULL),
(6, 3, 'store 1', NULL, 'store@example.com', 'storenotif@example.com', 'fashion', 1, '2021-07-08 15:05:27', '2021-07-08 15:05:27', NULL),
(7, 3, 'store 1', NULL, 'store@example.com', 'storenotif@example.com', 'fashion', 1, '2021-07-08 15:18:57', '2021-07-08 15:18:57', NULL),
(8, 3, 'store 1', NULL, 'store@example.com', 'storenotif@example.com', 'fashion', 1, '2021-07-08 15:22:56', '2021-07-08 15:22:56', NULL),
(9, 34, 'Tals Fasion store', NULL, 'tal@dreamax.co.il', 'tal@dreamax.co.il', 'Fashion', 21321, '2021-07-09 06:46:12', '2021-07-09 06:46:12', NULL),
(10, 3, 'store 1', NULL, 'store@example.com', 'storenotif@example.com', 'fashion', 1, '2021-07-09 07:16:58', '2021-07-09 07:16:58', NULL),
(11, 14, 'store 1', NULL, 'store@example.com', 'storenotif@example.com', 'fashion', 1, '2021-07-13 14:27:23', '2021-07-13 14:27:23', NULL),
(12, 3, 'Victor\'s store', NULL, 'store@example.com', 'storenotif@example.com', 'fashion', 1, '2021-07-23 16:50:23', '2021-07-23 16:50:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stores_currency`
--

CREATE TABLE `stores_currency` (
  `currency_id` int(10) NOT NULL,
  `store_id` int(10) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(10,4) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores_currency`
--

INSERT INTO `stores_currency` (`currency_id`, `store_id`, `name`, `rate`, `deleted`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'dollars', '20.0000', NULL, 1, '2021-07-05 09:16:41', '2021-07-05 09:16:41'),
(2, 3, 'pesos', '300.0000', NULL, 1, '2021-07-05 09:16:41', '2021-07-05 09:16:41'),
(3, 3, 'francs', '20.0000', NULL, 1, '2021-07-05 09:16:41', '2021-07-05 09:16:41'),
(4, 5, 'rubles', '20.0000', NULL, 1, '2021-07-05 09:44:46', '2021-07-05 09:44:46'),
(5, 5, 'pesos', '300.0000', NULL, 1, '2021-07-05 09:44:46', '2021-07-05 09:44:46'),
(6, 5, 'rupees', '20.0000', NULL, 1, '2021-07-05 09:44:46', '2021-07-05 11:49:05'),
(7, 7, 'us dollars', '159.0000', NULL, 3, '2021-07-08 15:18:57', '2021-07-08 15:18:57'),
(8, 7, 'british pound', '159.0000', NULL, 3, '2021-07-08 15:18:57', '2021-07-08 15:18:57'),
(9, 8, 'us dollars', '159.0000', NULL, 3, '2021-07-08 15:22:56', '2021-07-08 15:22:56'),
(10, 8, 'british pound', '159.0000', NULL, 3, '2021-07-08 15:22:56', '2021-07-08 15:22:56'),
(11, 9, 'us dollars', '159.0000', NULL, 3, '2021-07-09 06:46:12', '2021-07-09 06:46:12'),
(12, 9, 'british pound', '159.0000', NULL, 3, '2021-07-09 06:46:12', '2021-07-09 06:46:12'),
(13, 10, 'us dollars', '159.0000', NULL, 3, '2021-07-09 07:16:58', '2021-07-09 07:16:58'),
(14, 10, 'british pound', '159.0000', NULL, 3, '2021-07-09 07:16:58', '2021-07-09 07:16:58'),
(15, 11, 'us dollars', '159.0000', NULL, 3, '2021-07-13 14:27:23', '2021-07-13 14:27:23'),
(16, 11, 'british pound', '159.0000', NULL, 3, '2021-07-13 14:27:23', '2021-07-13 14:27:23'),
(17, 12, 'us dollars', '159.0000', NULL, 3, '2021-07-23 16:50:23', '2021-07-23 16:50:23'),
(18, 12, 'british pound', '159.0000', NULL, 3, '2021-07-23 16:50:23', '2021-07-23 16:50:23');

-- --------------------------------------------------------

--
-- Table structure for table `stores_settings`
--

CREATE TABLE `stores_settings` (
  `id` int(10) NOT NULL,
  `store_id` int(10) DEFAULT NULL,
  `legal_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_system` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight_unit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orders_prefix` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orders_suffix` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores_settings`
--

INSERT INTO `stores_settings` (`id`, `store_id`, `legal_name`, `phone`, `country`, `city`, `street`, `house`, `apartment`, `zip`, `timezone`, `language`, `unit_system`, `weight_unit`, `orders_prefix`, `orders_suffix`, `currency`) VALUES
(1, NULL, 'Some Shoe Store Ltd', '07334576709', 'Canada', 'Yukon', 'Jensen', 'House 9', '98 Apartments', '+76', 'canada/yukon', 'French', '', '', '', '', NULL),
(2, NULL, 'Ruski Shoess Store Ltd', '0733457709', 'Russia', 'Kaliningrad', 'KrÃ³lewiec', 'House Dix', '98 Apartments', '+76', 'europe/kaliningrad', 'Russian', '', '', '', '', NULL),
(3, 6, 'store legal name', '08132131972', 'Israel', 'port harcourt', 'Okekemlane', 'No. 27', '2', '', 'GMT', 'Hebrew', 'SI', 'kg', 'pre', 'suf', NULL),
(4, 7, 'store legal name', '08132131972', 'Israel', 'port harcourt', 'Okekemlane', 'No. 27', '2', '', 'GMT', 'Hebrew', 'SI', 'kg', 'pre', 'suf', NULL),
(5, 8, 'store legal name', '08132131972', 'Israel', 'port harcourt', 'Okekemlane', 'No. 27', '2', '', 'GMT', 'Hebrew', 'SI', 'kg', 'pre', 'suf', NULL),
(6, 9, 'Tals Fasion store', '+97212312312321', 'Israel', 'Tel Aviv', 'Ben Gurion', '1', '1', '', 'GMT', 'Hebrew', 'Metter', 'KG', 'TT', 'RR', NULL),
(7, 10, 'store legal name', '08132131972', 'Israel', 'port harcourt', 'Okekemlane', 'No. 27', '2', '', 'GMT', 'Hebrew', 'SI', 'kg', 'pre', 'suf', NULL),
(8, 11, 'store legal name', '', 'Nigeria', '', '', '', '', '', '', '', 'SI', 'kg', '', '', NULL),
(9, 12, 'store legal name', '08132131972', 'Nigeria', 'port harcourt', 'Okekemlane', 'No. 27', '2', '', 'GMT', 'Hebrew', 'SI', 'kg', 'pre', 'suf', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `store_account_status`
--

CREATE TABLE `store_account_status` (
  `store_account_status_id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store_account_status`
--

INSERT INTO `store_account_status` (`store_account_status_id`, `name`) VALUES
(1, 'active'),
(2, 'pending'),
(3, 'deleted');

-- --------------------------------------------------------

--
-- Table structure for table `store_customers`
--

CREATE TABLE `store_customers` (
  `store_user_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `store_account_status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_customers`
--

INSERT INTO `store_customers` (`store_user_id`, `customer_id`, `store_id`, `store_account_status`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 8, 2, NULL, '2021-07-02 15:50:11', NULL, '2021-07-02 15:50:11', NULL),
(2, 8, 2, NULL, '2021-07-02 16:13:10', NULL, '2021-07-02 16:13:10', NULL),
(3, 36, 2, NULL, '2021-07-13 11:49:55', NULL, '2021-07-13 11:49:55', NULL),
(4, 37, 2, NULL, '2021-07-13 11:54:16', NULL, '2021-07-13 11:54:16', NULL),
(5, 38, 2, 2, '2021-07-13 13:09:00', NULL, '2021-07-13 13:09:00', NULL),
(6, 39, 2, 2, '2021-07-13 13:47:29', NULL, '2021-07-13 13:47:29', NULL),
(7, 40, 2, NULL, '2021-07-14 05:00:04', NULL, '2021-07-14 05:00:04', NULL),
(8, 41, 2, NULL, '2021-07-14 05:37:00', NULL, '2021-07-14 05:37:00', NULL),
(9, 42, 2, NULL, '2021-07-14 05:47:52', NULL, '2021-07-14 05:47:52', NULL),
(10, 44, 2, NULL, '2021-07-14 08:54:08', NULL, '2021-07-14 08:54:08', NULL),
(11, 45, 4, NULL, '2021-07-14 10:50:37', NULL, '2021-07-14 10:50:37', NULL),
(12, 47, 4, NULL, '2021-07-19 12:52:00', NULL, '2021-07-19 12:52:00', NULL),
(13, 48, 3, NULL, '2021-07-20 09:36:03', NULL, '2021-07-20 09:36:03', NULL),
(14, 49, 3, NULL, '2021-07-20 13:04:49', NULL, '2021-07-20 13:04:49', NULL),
(15, 50, 3, NULL, '2021-07-21 14:36:48', NULL, '2021-07-21 14:36:48', NULL),
(16, 51, 5, NULL, '2021-07-22 09:09:53', NULL, '2021-07-22 09:09:53', NULL),
(17, 52, 1, NULL, '2021-07-22 09:22:50', NULL, '2021-07-22 09:22:50', NULL),
(18, 53, 1, NULL, '2021-07-22 09:24:57', NULL, '2021-07-22 09:24:57', NULL),
(19, 54, 1, NULL, '2021-07-22 13:31:54', NULL, '2021-07-22 13:31:54', NULL),
(20, 55, 1, NULL, '2021-07-23 11:24:28', NULL, '2021-07-23 11:24:28', NULL),
(21, 56, 3, NULL, '2021-07-23 13:31:28', NULL, '2021-07-23 13:31:28', NULL),
(22, 57, 3, NULL, '2021-07-23 13:41:09', NULL, '2021-07-23 13:41:09', NULL),
(23, 59, 1, NULL, '2021-07-23 17:03:20', NULL, '2021-07-23 17:03:20', NULL),
(24, 60, 3, NULL, '2021-07-26 12:58:09', NULL, '2021-07-26 12:58:09', NULL),
(25, 61, 1, NULL, '2021-07-26 15:50:03', NULL, '2021-07-26 15:50:03', NULL),
(26, 62, 1, NULL, '2021-07-26 15:53:08', NULL, '2021-07-26 15:53:08', NULL),
(27, 64, 1, NULL, '2021-07-26 15:56:32', NULL, '2021-07-26 15:56:32', NULL),
(28, 65, 1, NULL, '2021-07-26 16:00:50', NULL, '2021-07-26 16:00:50', NULL),
(29, 68, 3, NULL, '2021-07-27 11:56:27', NULL, '2021-07-27 11:56:27', NULL),
(30, 69, 3, NULL, '2021-07-27 14:35:04', NULL, '2021-07-27 14:35:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `user_id`, `name`, `deleted`, `created_at`, `updated_at`) VALUES
(2, 3, 'hats', 0, '2021-07-06 11:30:14', '2021-07-06 11:30:14'),
(3, 3, 'greats', 0, '2021-07-06 11:30:14', '2021-07-06 11:30:14'),
(4, 3, 'tomfordd', 0, '2021-07-07 02:26:21', '2021-07-07 02:26:21'),
(5, 3, 'great tom ford', 0, '2021-07-07 02:26:21', '2021-07-07 02:26:21'),
(6, 3, 'hansen', 0, '2021-07-07 02:40:11', '2021-07-07 02:40:11'),
(7, 3, 'great hansen shoes', 0, '2021-07-07 02:40:11', '2021-07-07 02:40:11'),
(8, 3, 'hasen', 0, '2021-07-07 02:44:05', '2021-07-07 02:44:05'),
(9, 3, 'great hasen shoes', 0, '2021-07-07 02:44:05', '2021-07-07 02:44:05'),
(10, 3, 'hasyen', 0, '2021-07-07 02:48:32', '2021-07-07 02:48:32'),
(11, 3, 'great haysen shoes', 0, '2021-07-07 02:48:32', '2021-07-07 02:48:32'),
(12, 3, 'hasyqen', 0, '2021-07-07 02:51:20', '2021-07-07 02:51:20'),
(13, 3, 'great haqysen shoes', 0, '2021-07-07 02:51:20', '2021-07-07 02:51:20'),
(14, 3, 'g4k76j67', 0, '2021-07-27 09:50:49', '2021-07-27 09:50:49'),
(15, 3, '564534r3', 0, '2021-07-27 09:50:49', '2021-07-27 09:50:49'),
(16, 3, 'wz65z56z', 0, '2021-07-27 09:50:49', '2021-07-27 09:50:49'),
(17, 3, 'ezue57ue67u', 0, '2021-07-27 14:57:17', '2021-07-27 14:57:17'),
(18, 3, 'z56ze5u57u', 0, '2021-07-27 14:57:17', '2021-07-27 14:57:17'),
(19, 3, 'tjru67u67u', 0, '2021-07-27 15:04:34', '2021-07-27 15:04:34'),
(20, 3, 'uet56ze5u5e7', 0, '2021-07-27 15:04:34', '2021-07-27 15:04:34'),
(21, 3, 'qt5wtwh5', 0, '2021-07-27 15:10:28', '2021-07-27 15:10:28'),
(22, 3, 'u67uu6jj', 0, '2021-07-27 15:11:13', '2021-07-27 15:11:13'),
(23, 3, 'etzu7u6', 0, '2021-07-27 15:11:13', '2021-07-27 15:11:13'),
(24, 3, 'r7o9ri8ru7', 0, '2021-07-27 15:30:21', '2021-07-27 15:30:21'),
(25, 3, 'hezhej676e', 0, '2021-07-27 15:30:21', '2021-07-27 15:30:21'),
(26, 3, 'u56z56z', 0, '2021-07-27 15:40:31', '2021-07-27 15:40:31'),
(27, 3, 'z356z356z', 0, '2021-07-27 15:40:31', '2021-07-27 15:40:31'),
(28, 3, 'rui76u67', 0, '2021-07-27 15:53:56', '2021-07-27 15:53:56'),
(29, 3, 'ue65z56z', 0, '2021-07-27 15:53:56', '2021-07-27 15:53:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recovery_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recovery_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sec_qtn_1` text COLLATE utf8mb4_unicode_ci,
  `sec_qtn_2` text COLLATE utf8mb4_unicode_ci,
  `sec_qtn_3` text COLLATE utf8mb4_unicode_ci,
  `birthplace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interests` text COLLATE utf8mb4_unicode_ci,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `profile` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `first_name`, `last_name`, `details`, `website`, `country`, `city`, `date_of_birth`, `occupation`, `status`, `recovery_email`, `recovery_phone`, `sec_qtn_1`, `sec_qtn_2`, `sec_qtn_3`, `birthplace`, `interests`, `password`, `email`, `phone_number`, `created_at`, `updated_at`, `profile`, `cover`, `tag`, `create_id`) VALUES
(1, 'johndoe', 'John', 'Doe', 'details', 'johndoe.com', 'nigeria', 'port harcourt', '2001-04-10', 'developer', 'lowkey', NULL, NULL, NULL, NULL, NULL, 'abia state', 'swimming, biking', '$2y$10$5X60ALr/3t12PDIWzVvCY.WcIPcD8omo.0grP4YlTGdShi5ykDEDG', 'johndoe@mail.com', '08132131972', '2021-06-29 08:21:35', '2021-06-29 08:21:35', NULL, NULL, NULL, NULL),
(3, 'ben', 'Ben', 'Ma', 'Ben Ma Deatils', 'ma.com', 'Kenya', 'Nairobi', '1938-04-13', 'Doctor', 'active', NULL, NULL, NULL, NULL, NULL, 'Nairobi Hospital', 'Playing, Singing, Writing', '$2y$10$NKgeL1JGysmyznHAFs9.3upBxA2ofJfmoLO0u0bf1kwTX5.vMJDfO', 'ben@ma.comUI', '84576823', '2021-06-29 08:43:28', '2021-06-29 08:43:28', NULL, NULL, NULL, NULL),
(8, 'user_name', 'firstname', 'lastname', '', 'www.customer.com', 'nigeria', 'port harcourt', '1996-05-19', 'developer', 'active', NULL, NULL, NULL, NULL, NULL, 'abia', 'fashion, sports, fishing', NULL, 'customer@example.comgr', '34424424323', '2021-07-02 15:44:16', '2021-07-02 15:44:16', '', '', '', 2),
(14, 'vic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$8O8.C.a0WR4p/O9n43KsIuNSmO.zmiwyEOqJ2YADtWyhlPtulv.C.', 'vic@example.comtj', NULL, '2021-07-08 09:00:28', '2021-07-08 09:00:28', NULL, NULL, NULL, NULL),
(15, 'Tals', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$unMDcMuYneneZ5OFrXG7s.azQn69n1ajrXxrWxT24BDYvHliXoweW', 'tal@dreamax.co.ili', NULL, '2021-07-08 10:52:31', '2021-07-08 10:52:31', NULL, NULL, NULL, NULL),
(16, 'tally', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$P9tUYYM.BvZj56PB1vV2Fu1GSwFpxE7NXMwXzQ0GxjZA7AJ6ZQCFm', 'tal@dreamax.co.ilrt', NULL, '2021-07-08 10:59:03', '2021-07-08 10:59:03', NULL, NULL, NULL, NULL),
(17, 'vicky', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$kp99aAk2LQ24oa8Dl5Cjwuts5cWqKsgCXADoNELG7O8/TZY4rlKjS', 'vic@example.comhr', NULL, '2021-07-08 11:17:17', '2021-07-08 11:17:17', NULL, NULL, NULL, NULL),
(18, 'victa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ruUgE6JAaEQEyrYZK1eFJuU0qhj2i.EKl97G6h6fmzrmo/nDbis3C', 'vic@example.com', NULL, '2021-07-08 11:29:03', '2021-07-08 11:29:03', NULL, NULL, NULL, NULL),
(19, 'talhadi', 'Ben', 'Ma', 'Ben Ma Deatils', 'ma.com', 'Kenya', 'Nairobi', '1938-04-13', 'Doctor', 'active', NULL, NULL, NULL, NULL, NULL, 'Nairobi Hospital', 'Playing, Singing, Writing', '$2y$10$NKgeL1JGysmyznHAFs9.3upBxA2ofJfmoLO0u0bf1kwTX5.vMJDfO', 'ben@ma.comfg', '845323447', '2021-06-29 08:43:28', '2021-06-29 08:43:28', NULL, NULL, NULL, NULL),
(20, 'tal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$re2E1stFdt8s1DAThCkuEeDstu6vIKdw.LLLmY/PTs/YL40W/Vi22', 'tal', NULL, '2021-07-08 11:57:55', '2021-07-08 11:57:55', NULL, NULL, NULL, NULL),
(21, 'victor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$zwX.a8tz0fS.yZCexRlnduBXuLUeyt7HQLzkjlSNHiSGbHG31BKUq', 'victor@example.com', NULL, '2021-07-08 11:59:26', '2021-07-08 11:59:26', NULL, NULL, NULL, NULL),
(26, 'janets', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$pheEm2xYVcLzcmhm/F2hm.wx8.OnwL5aNXZ6pidY/nBGGFHMKNDIq', 'janets@me.me', NULL, '2021-07-08 13:03:31', '2021-07-08 13:03:31', NULL, NULL, NULL, NULL),
(27, 'jane', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$9LoAcbnmvpp4X4xUsLCF3.OreB2hN.zcXu.P/RFv/XAETEeQx0T46', 'jane@me.me', NULL, '2021-07-08 13:04:31', '2021-07-08 13:04:31', NULL, NULL, NULL, NULL),
(28, 'paul', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$UbDcKi8yMv/bnq5TX0GA.uCebaueJexBMx/1p8MB13LHNeXKLAorC', 'paul@me.me', NULL, '2021-07-08 13:06:22', '2021-07-08 13:06:22', NULL, NULL, NULL, NULL),
(29, 'talls', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$d0lOhB4spaWmNLlTJyjlUucCd2BeW.Od8JrXRaHIA5OrgihKvdsXi', 'tal@dreamax.co.ilez', NULL, '2021-07-08 14:35:45', '2021-07-08 14:35:45', NULL, NULL, NULL, NULL),
(30, 'talli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$yDXv8Sv74pR/WuPW1Y0kRu24kGXErdwViwFe9U1cuc1ONKvc2GthW', 'tal@dreamax.co.ilo', NULL, '2021-07-08 14:39:09', '2021-07-08 14:39:09', NULL, NULL, NULL, NULL),
(31, 'pauline', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$9Beu.Tq/HZ1rZlK.fQF9Cem5fto8v/BTz5b7adLchNWLhG7WwJwJu', 'pauline@me.me', NULL, '2021-07-08 14:50:10', '2021-07-08 14:50:10', NULL, NULL, NULL, NULL),
(32, 'tal2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$jeIzk7a3UeRYVFnenZs/vuFU.Rpjz08CxdaeJDLzfD4MWNmQQLnx6', 'tal@dreamax.co.il', NULL, '2021-07-08 15:06:13', '2021-07-08 15:06:13', NULL, NULL, NULL, NULL),
(34, 'tal1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ZA5TJdYBid4xHP1aawsfv.PBl7/BLaoUwk6beODNbF3GXU3RezadC', 'tal1', NULL, '2021-07-08 15:14:26', '2021-07-08 15:14:26', NULL, NULL, NULL, NULL),
(35, 'john', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Wlr898Ph5ZG2V/FCFuP6JOxw6fyvs9QZNVbCy7/Rd/InJM/hNzxoC', 'john@test.com', NULL, '2021-07-08 15:21:35', '2021-07-08 15:21:35', NULL, NULL, NULL, NULL),
(36, '8i578i', 'u67u4z', 'etzu7u67u6', 'uolziol', 'ferrergerf', 'fqerferf', 'erfeqrger', '1998-12-09', 'Dentist', 'w445t45tw', '', NULL, '', '', '', 'w45tw45wzw4', 'w45z4z46z45,z45,z45z45z,45zw,45zw45z', NULL, '', '', '2021-07-13 11:49:55', '2021-07-26 08:14:51', '', '', '', 2),
(37, 'userss', '', '', '', '', '', '', '2021-07-13', '', '', NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', '2021-07-13 11:54:16', '2021-07-13 11:54:16', '', '', '', 2),
(38, 'juni', 'paulson', 'Juni', 'Junis Details', 'pauls.net', 'Uganda', 'Kampala', '2021-07-13', 'Developer', '', NULL, NULL, NULL, NULL, NULL, 'Kampala', 'none', NULL, 'paul@juni.net', '074567545657', '2021-07-13 13:09:00', '2021-07-13 13:42:33', '', '', '', 2),
(39, 'juniy', 'pauly', 'Juniy', 'Junis Details', 'pauls.net', 'Uganda', 'Kampala', '2021-07-13', 'Developer', '', NULL, NULL, NULL, NULL, NULL, 'Kampala', 'none', NULL, 'paul@juni.net', '072568756747', '2021-07-13 13:47:29', '2021-07-13 13:47:29', '', '', '', 2),
(40, 'vans', 'vans', 'loeb', 'Loebs Details', 'loeb.net', 'Ukraine', 'Kyiev', '2021-07-14', 'Soldier', '', NULL, NULL, NULL, NULL, NULL, 'Lviv', 'Sports', NULL, 'vans@loeb.net', '07235676457', '2021-07-14 05:00:04', '2021-07-14 05:00:04', '', '', '', 2),
(41, 'jamal', 'jamal', 'Grey', 'Greys Details', 'jamal.net', 'Egypt', 'cairo', '2021-07-14', 'Sheikh', '', NULL, NULL, NULL, NULL, NULL, 'Cairo', 'none', '$2y$10$U8dMBHOrEpgA9Rgq3FPqwe87In7FvPULGghLc/335Zr/UdqQ3lmBW', 'jama@me.net', '07223545657', '2021-07-14 05:37:00', '2021-07-14 05:36:59', '', '', '', 2),
(42, 'talib', 'kweli', 'tkweli', 'Talibs Details', 'kweli.net', 'Zambia', 'Lusaka', '2021-07-14', 'Writer', '', NULL, NULL, NULL, NULL, NULL, 'Lusaka', 'none', '$2y$10$UDbd4p8x2iuNN8pp4zOeFOeeZL8y28hBPwMH9.hXR/KagznnmUZu6', 'kwe@me.net', '072467756456', '2021-07-14 05:47:52', '2021-07-14 05:47:52', '', '', '', 2),
(43, 'kofi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$jXdGvVuwcdFLzuLhTqeB.OxnqtA/I/DBxIkjy/A93EYamLrWAMMPi', 'kofi@me.me', NULL, '2021-07-14 06:00:57', '2021-07-14 06:00:57', NULL, NULL, NULL, NULL),
(44, 'username', 'firstname', 'lastname', '', '', '', '', '2021-07-14', '', '', NULL, NULL, NULL, NULL, NULL, '', 'fashion, sports, fishing', '$2y$10$FWpq0OukND9DUK0IzpS8i.kJGCJJaFClarT3YKSJ4QFJ9.9TROLTG', 'customer@example.co', '', '2021-07-14 08:54:08', '2021-07-14 08:54:08', '', '', '', 2),
(45, 'usernam', 'firstname', 'lastname', '', '', '', '', '2021-07-14', '', '', NULL, NULL, NULL, NULL, NULL, '', 'fashion, sports, fishing', '$2y$10$qrFWEPpurdRWx4AXos0KAehbeYoDCH/tt00CAqwita6G7lJ/UaCu6', 'customer@example.com', '', '2021-07-14 10:50:37', '2021-07-14 10:50:37', '', '', '', 4),
(46, 'ngla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$Vm8Myb7VdT3Apu/tN5j/2uWjsSJOmFC0rDlnPKk.p9ImSr77Hx/Na', 'juke@me.me', NULL, '2021-07-15 08:52:58', '2021-07-15 08:52:58', NULL, NULL, NULL, NULL),
(47, 'tjrtz', 'iiul', 'loizlol', 'izolziol', 'tuitzi', 'arfer', 'afreaget', '1997-01-01', 'grtsgrtg', 'srtgrt', NULL, NULL, NULL, NULL, NULL, 'srthsgt', 'srtgsreg', '$2y$10$/zfrgi5LXe/dPAAMJxRZteU9N0PUXmFPAEZL9ouvUUjROhBrMsSva', 'grtgst', '789678923567', '2021-07-19 12:52:00', '2021-07-19 12:52:00', 'rhetzhtz', 'etzhe', 'egtt45t', 4),
(48, 'ert ', '', '', '', '', '', '', '2021-07-20', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '$2y$10$VNWp.nfrhn0ZXJGO90nBFuAe7tSWualQ2B8irto3iMvrWfVtI6pGC', 'ase@asdf.sdf', '', '2021-07-20 09:36:03', '2021-07-20 09:36:03', '', '', '', 3),
(49, '', 'Orel', 'Juke', '', '', 'Senegal', 'Dakar', '2021-07-26', '', '', '', NULL, '', '', '', '', '', '$2y$10$HOjP5oEU1btzKbwgYvjFxuZlPX.l7JsWtCX1dS3eEC25/c91s3ywe', 'ngalla@example.com', '', '2021-07-20 13:04:49', '2021-07-26 12:20:00', '', '', '', 3),
(50, 'vico', 'victor', 'onwukwe', '', '', 'nigeria', '', '2021-07-06', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '$2y$10$qbMkzn/uX8tqHyuP5fq/LuxT4.iLXQVbhL2VrfWn7V1ra7T0ugYpC', 'victoronwukwe25@gmail.comt', '08132131972', '2021-07-21 14:36:48', '2021-07-21 14:36:48', '', '', '', 3),
(51, 'vicon', 'victor', 'Onwukwe', '', 'www.customer.com', 'nigeria', 'port harcourt', '2021-07-04', 'developer', '', NULL, NULL, NULL, NULL, NULL, '', 'fashion', '$2y$10$slhaCUC9lS4doUVRwqVCDOVYBNHf7U4Fn7tfRog1/t0pEtXf5kura', 'victoronwukwe25@gmail.coms', '08132145572', '2021-07-22 09:09:53', '2021-07-22 09:09:53', '', '', '', 5),
(52, 'vick', 'victor', 'onwukwe', '', '', '', '', '2021-07-04', 'developer', '', NULL, NULL, NULL, NULL, NULL, '', 'fashion', '$2y$10$9F5X24h5OMRJ0n3sf4TShuTOTCVmMJTsZhT2oniDRea2hTXbzGTTq', 'victoronwukwe25@gmail.com', '', '2021-07-22 09:22:50', '2021-07-22 09:22:50', '', '', '', 1),
(53, 'johnbull', 'John', 'Bull', '', '', '', '', '2021-07-23', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '$2y$10$BQCCoQbx89jgRQO9v.8LyusHBetamH2.gELSpF/GCk8zW2mQr3uQC', 'joh@test.com', '023543231972', '2021-07-22 09:24:57', '2021-07-22 09:24:57', '', '', '', 1),
(54, 'annon', 'testing', '1', '', '', '', '', '2021-07-01', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '$2y$10$ewOS7/VXhBzu17ugT01PjehghRjQ4HovbjQzEXGfLpWfpJHt8QbpS', 'testing1@example.com', '', '2021-07-22 13:31:54', '2021-07-22 13:31:54', '', '', '', 1),
(55, 'ann', 'test', 'customer', '', '', '', '', '2021-07-04', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '$2y$10$clJogFSFA3JRHrP7juwVQuGUllqTeB4IRLsoDSAU8mw.peiGAsCd.', 'testcustomer@example.com', '', '2021-07-23 11:24:28', '2021-07-23 11:24:28', '', '', '', 1),
(56, 'test', '', '', '', '', '', '', '2021-07-23', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '$2y$10$inpzU/TbQGM4dpRjK/7N7uuiGjceMdhhFkUSNj.ft5z309HF1muXi', 'ase@asdf.sdSD', '', '2021-07-23 13:31:28', '2021-07-23 13:31:28', '', '', '', 3),
(57, 'testing', '', '', '', '', '', '', '2021-07-23', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '$2y$10$vvvIuWwf4biG1sizuNCHIerGI6RIx4YNWN0wLCqS/DUTd/Yks1/e2', 'ase@asdf.sd', '', '2021-07-23 13:41:09', '2021-07-23 13:41:09', '', '', '', 3),
(59, '', 'Jaymee', 'Lastname', '', 'www.jaymee.com', 'phillipines', 'port harcourt', '2021-07-01', 'developer', '1', NULL, NULL, NULL, NULL, NULL, '', 'fashion', '$2y$10$3Quv4rLKVihyBBYxh33RI.FWCyh23UFnYlCk.obbN6kLb/MMR0l/G', 'jaymee@test.com', '08132123543', '2021-07-23 17:03:20', '2021-07-23 17:03:20', '', '', '', 1),
(60, 'orel', 'ngalla', 'juke', '', '', 'Bahrain', 'Dakar', '2021-07-27', '', '', '', NULL, '', '', '', '', '', '$2y$10$rDeAzKS3rIJ4Nzy7i295ROW4RDFuDqYB36rYzulN83ZPYu7Nn19Z2', 'ngalla@test.com', '0000000000', '2021-07-26 12:58:09', '2021-07-27 15:22:43', '', '', '', 3),
(61, '', 'new', 'dawn', '', '', '', '', '2021-07-07', 'developer', '', '', NULL, '', '', '', '', 'fashion', '$2y$10$jW3eDXqUBThOETZ.BiNHjOPYziyR2Nf2s6wIDoT6A6nabTNuhJHcO', 'newdawn@mail.com', '08132131972', '2021-07-26 15:50:03', '2021-07-26 15:50:03', '', '', '', 1),
(62, '', 'victor', 'new', '', '', '', '', '2021-07-05', 'developer', '1', '', NULL, '', '', '', '', '', '$2y$10$2e1TBSk77gVAgWhNzoiSau1V/Rcvm9OCjthjoiIYYljJ/gyIDCklK', 'victoronwukwe25@gmail.com', '08132131972', '2021-07-26 15:53:08', '2021-07-26 15:53:08', '', '', '', 1),
(64, '', 'new', 'dawn', '', '', '', '', '2021-07-07', 'developer', '0', '', NULL, '', '', '', '', '', '$2y$10$KNuXRpDJiCHN20PYD5foTO49f8qnUrjD4f8HfcYZmq5hNNbTQyti.', 'newdawn1@mail.com', '08132131971', '2021-07-26 15:56:32', '2021-07-26 15:56:32', '', '', '', 1),
(65, '', 'victor', 'new', '', '', '', '', '2021-07-26', 'developer', '0', '', NULL, '', '', '', '', '', '$2y$10$uW2zWx6MQn3wzpiwsTEKb.I9ZGbVFYocTgzt.Cob8oru90SHTjcx2', 'johnny@test.com', '08132131972', '2021-07-26 16:00:50', '2021-07-26 16:00:50', '', '', '', 1),
(66, 'jayc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$L9K27Q02RJwPPmHuFtbbv.S8EPrwSl4u8dySpqNsXEXq9Csa1R8OG', 'jayc@gmail.com', NULL, '2021-07-26 20:39:42', '2021-07-26 20:39:42', NULL, NULL, NULL, NULL),
(67, 'jaym', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$6HDudNjsADg4xueqZjKv0uI7H34x5qaA8beRt/LV3HoAeLQb2GjTu', 'jaym@gmail.com', NULL, '2021-07-26 20:40:29', '2021-07-26 20:40:29', NULL, NULL, NULL, NULL),
(68, 'ishoo', '', '', '', '', '', '', '2021-07-27', '', '', '', NULL, '', '', '', '', '', '$2y$10$BLBD.sBr4hti0TgdzMs03Os2ZMGYDE.e816VsMrji5d4F7bPq5Q1.', 'ase@asdf.sd', '', '2021-07-27 11:56:27', '2021-07-27 11:56:27', '', '', '', 3),
(69, 'victor', '', '', '', '', '', '', '2021-07-27', '', '', '', NULL, '', '', '', '', '', '$2y$10$kjHkgSYa4eQ3fWRColvx.ua2FGqw1ArzMIWgfrqIt5xN16L9U6X/y', 'ase@asdf.sd', '', '2021-07-27 14:35:04', '2021-07-27 14:35:04', '', '', '', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `FK2_carts_order_status` (`order_status`),
  ADD KEY `FK_cart_store_currency` (`currency_id`);

--
-- Indexes for table `carts_address`
--
ALTER TABLE `carts_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indexes for table `cart_status`
--
ALTER TABLE `cart_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discount_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `code` (`code`),
  ADD KEY `start_date` (`start_date`),
  ADD KEY `end_date` (`end_date`),
  ADD KEY `priority` (`priority`);

--
-- Indexes for table `discounts_conditions`
--
ALTER TABLE `discounts_conditions`
  ADD PRIMARY KEY (`rule_id`),
  ADD KEY `discount_id` (`discount_id`);

--
-- Indexes for table `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`domain_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `verified` (`verified`),
  ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `FK2_inventory_type_id` (`type`),
  ADD KEY `FK3_location_id` (`location_id`);

--
-- Indexes for table `inventory_locations`
--
ALTER TABLE `inventory_locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `inventory_type`
--
ALTER TABLE `inventory_type`
  ADD PRIMARY KEY (`inventory_type_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`menu_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `meta_fields`
--
ALTER TABLE `meta_fields`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `meta_field_types`
--
ALTER TABLE `meta_field_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `status` (`status`),
  ADD KEY `b2b_status` (`drop_status`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `sku` (`sku`);

--
-- Indexes for table `products_attributes`
--
ALTER TABLE `products_attributes`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products_attributes_options`
--
ALTER TABLE `products_attributes_options`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `products_category`
--
ALTER TABLE `products_category`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `products_options`
--
ALTER TABLE `products_options`
  ADD KEY `FK1_products_options_product_id` (`product_id`),
  ADD KEY `FK2_products_options_attribute_id` (`attribute_id`),
  ADD KEY `FK3_products_options_option_id` (`option_id`);

--
-- Indexes for table `products_store`
--
ALTER TABLE `products_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `products_tags`
--
ALTER TABLE `products_tags`
  ADD KEY `FK1_products_tags_tag_id` (`tag_id`),
  ADD KEY `FK2_products_tags_product_id` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shipping_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `shipping_rules`
--
ALTER TABLE `shipping_rules`
  ADD PRIMARY KEY (`rule_id`),
  ADD KEY `status` (`status`),
  ADD KEY `delete` (`delete`),
  ADD KEY `shipping_id` (`shipping_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `stores_currency`
--
ALTER TABLE `stores_currency`
  ADD PRIMARY KEY (`currency_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `stores_settings`
--
ALTER TABLE `stores_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `store_account_status`
--
ALTER TABLE `store_account_status`
  ADD PRIMARY KEY (`store_account_status_id`);

--
-- Indexes for table `store_customers`
--
ALTER TABLE `store_customers`
  ADD PRIMARY KEY (`store_user_id`),
  ADD KEY `FK1_store_account_status_id` (`store_account_status`),
  ADD KEY `FK2_customer_id` (`customer_id`),
  ADD KEY `FK3_store_id` (`store_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uniq_fields` (`user_name`,`phone_number`,`email`),
  ADD KEY `create_id` (`create_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `carts_address`
--
ALTER TABLE `carts_address`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `item_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `cart_status`
--
ALTER TABLE `cart_status`
  MODIFY `status_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `discount_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts_conditions`
--
ALTER TABLE `discounts_conditions`
  MODIFY `rule_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `domains`
--
ALTER TABLE `domains`
  MODIFY `domain_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `inventory_locations`
--
ALTER TABLE `inventory_locations`
  MODIFY `location_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventory_type`
--
ALTER TABLE `inventory_type`
  MODIFY `inventory_type_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `menu_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meta_fields`
--
ALTER TABLE `meta_fields`
  MODIFY `meta_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `meta_field_types`
--
ALTER TABLE `meta_field_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=439;

--
-- AUTO_INCREMENT for table `products_attributes`
--
ALTER TABLE `products_attributes`
  MODIFY `attribute_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- AUTO_INCREMENT for table `products_attributes_options`
--
ALTER TABLE `products_attributes_options`
  MODIFY `option_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- AUTO_INCREMENT for table `products_images`
--
ALTER TABLE `products_images`
  MODIFY `image_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `products_store`
--
ALTER TABLE `products_store`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `shipping_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_rules`
--
ALTER TABLE `shipping_rules`
  MODIFY `rule_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `stores_currency`
--
ALTER TABLE `stores_currency`
  MODIFY `currency_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `stores_settings`
--
ALTER TABLE `stores_settings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `store_account_status`
--
ALTER TABLE `store_account_status`
  MODIFY `store_account_status_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `store_customers`
--
ALTER TABLE `store_customers`
  MODIFY `store_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `FK1_carts_store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  ADD CONSTRAINT `FK2_carts_order_status` FOREIGN KEY (`order_status`) REFERENCES `cart_status` (`status_id`),
  ADD CONSTRAINT `FK_cart_store_currency` FOREIGN KEY (`currency_id`) REFERENCES `stores_currency` (`currency_id`),
  ADD CONSTRAINT `FK_carts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `carts_address`
--
ALTER TABLE `carts_address`
  ADD CONSTRAINT `FK_cart_address_carts` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `FK1_cart_items_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`),
  ADD CONSTRAINT `FK2_cart_items_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK1_products_categories_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `FK1_discounts_store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Constraints for table `discounts_conditions`
--
ALTER TABLE `discounts_conditions`
  ADD CONSTRAINT `FK1_discount_rules_discount_id` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`discount_id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `FK1_inventory_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `FK2_inventory_type_id` FOREIGN KEY (`type`) REFERENCES `inventory_type` (`inventory_type_id`),
  ADD CONSTRAINT `FK3_location_id` FOREIGN KEY (`location_id`) REFERENCES `inventory_locations` (`location_id`);

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `FK_menu_store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Constraints for table `meta_fields`
--
ALTER TABLE `meta_fields`
  ADD CONSTRAINT `FK1_products_meta_field_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `FK1_products_meta_field_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK1_product_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `products_attributes`
--
ALTER TABLE `products_attributes`
  ADD CONSTRAINT `FK1_products_attributes_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products_attributes_options`
--
ALTER TABLE `products_attributes_options`
  ADD CONSTRAINT `FK1_products_attributes_options_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `products_attributes` (`attribute_id`);

--
-- Constraints for table `products_category`
--
ALTER TABLE `products_category`
  ADD CONSTRAINT `FK1_products_category_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `FK2_products_category_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `FK3_products_category_store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Constraints for table `products_images`
--
ALTER TABLE `products_images`
  ADD CONSTRAINT `FK_images_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products_options`
--
ALTER TABLE `products_options`
  ADD CONSTRAINT `FK1_products_options_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `FK2_products_options_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `products_attributes` (`attribute_id`),
  ADD CONSTRAINT `FK3_products_options_option_id` FOREIGN KEY (`option_id`) REFERENCES `products_attributes_options` (`option_id`);

--
-- Constraints for table `products_store`
--
ALTER TABLE `products_store`
  ADD CONSTRAINT `FK1_products_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `FK1_products_store_store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Constraints for table `products_tags`
--
ALTER TABLE `products_tags`
  ADD CONSTRAINT `FK1_products_tags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`),
  ADD CONSTRAINT `FK2_products_tags_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `FK1_shipments_store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Constraints for table `shipping_rules`
--
ALTER TABLE `shipping_rules`
  ADD CONSTRAINT `FK1_shipping_rules` FOREIGN KEY (`shipping_id`) REFERENCES `shipping` (`shipping_id`);

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `FK1_stores_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `stores_currency`
--
ALTER TABLE `stores_currency`
  ADD CONSTRAINT `FK1_store_currency_store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Constraints for table `stores_settings`
--
ALTER TABLE `stores_settings`
  ADD CONSTRAINT `FK1_stores_settings_store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Constraints for table `store_customers`
--
ALTER TABLE `store_customers`
  ADD CONSTRAINT `FK1_store_account_status_id` FOREIGN KEY (`store_account_status`) REFERENCES `store_account_status` (`store_account_status_id`),
  ADD CONSTRAINT `FK2_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FK3_store_id` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `FK1_tags_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
