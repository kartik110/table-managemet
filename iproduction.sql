-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 22, 2025 at 10:05 AM
-- Server version: 9.1.0
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iproduction`
--

-- --------------------------------------------------------

--
-- Table structure for table `daily_table_history`
--

CREATE TABLE `daily_table_history` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `table_id` bigint UNSIGNED NOT NULL,
  `mapping_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daily_table_history`
--

INSERT INTO `daily_table_history` (`id`, `user_id`, `table_id`, `mapping_date`, `created_at`, `updated_at`) VALUES
(5, 3, 4, '2025-03-22', '2025-03-22 03:47:04', '2025-03-22 03:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_03_22_071055_create_production_tables_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `production_tables`
--

CREATE TABLE `production_tables` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `floor` enum('1st floor','2nd floor','3rd floor') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `seats` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `production_tables`
--

INSERT INTO `production_tables` (`id`, `name`, `floor`, `seats`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Oscar Neal', '3rd floor', 5, 'Tempore quo est mol', '2025-03-22 02:01:10', '2025-03-22 02:01:38'),
(2, 'Cleo Parrish', '3rd floor', 6, 'Sed est est est im', '2025-03-22 02:01:21', '2025-03-22 02:01:46'),
(3, 'Jescie Hammond', '2nd floor', 2, 'Ipsum deserunt imped', '2025-03-22 02:04:50', '2025-03-22 02:04:50'),
(4, 'Benjamin Key', '3rd floor', 7, 'Sit dolor laboriosam', '2025-03-22 02:05:01', '2025-03-22 02:05:01'),
(5, 'Deacon Powers', '2nd floor', 9, 'Sed et laboriosam a', '2025-03-22 02:05:16', '2025-03-22 02:05:16'),
(6, 'Ariel Evans', '1st floor', 10, 'Neque dolor velit ea', '2025-03-22 02:05:32', '2025-03-22 02:05:32');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_accounts`
--

CREATE TABLE `tbl_accounts` (
  `id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `opening_balance` float(10,2) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_settings`
--

CREATE TABLE `tbl_admin_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name_company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_section_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_position` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Before',
  `precision` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimals_separator` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thousands_separator` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `web_site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Live',
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_admin_settings`
--

INSERT INTO `tbl_admin_settings` (`id`, `name_company_name`, `contact_person`, `phone`, `email`, `address`, `logo`, `base_color`, `favicon`, `first_section_image`, `footer`, `date_format`, `currency`, `currency_position`, `precision`, `decimals_separator`, `thousands_separator`, `time_zone`, `web_site`, `created_at`, `del_status`, `updated_at`) VALUES
(1, 'Door Soft', 'Nazmul Hasan', '+8801812391633', 'info@doorsoft.co', 'House: 18, Road: 6, Nikunja 2, Khilkhet, Dhaka.', '', '#6ab04c', '1597255952_favicon.ico', 'a1e38ee1494380b96242260c6e1cc2b2.png', 'Developed by Whitevue', 'd/m/Y', '$', 'Before', '2', '.', ',', 'Asia/Dhaka', 'https://doorsoft.co', '2020-08-05 04:18:53', 'Live', '2024-09-23 07:27:03');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_user_menus`
--

CREATE TABLE `tbl_admin_user_menus` (
  `id` int NOT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `controller_name` varchar(50) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attachments`
--

CREATE TABLE `tbl_attachments` (
  `id` bigint NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attendance`
--

CREATE TABLE `tbl_attendance` (
  `id` int NOT NULL,
  `reference_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `note` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'Live',
  `is_closed` int NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_companies`
--

CREATE TABLE `tbl_companies` (
  `id` int NOT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `date_format` varchar(50) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `system_featured_photo` varchar(300) DEFAULT NULL,
  `is_white_label_change_able` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_companies`
--

INSERT INTO `tbl_companies` (`id`, `company_name`, `contact_person`, `phone`, `email`, `website`, `address`, `currency`, `timezone`, `date_format`, `logo`, `system_featured_photo`, `is_white_label_change_able`) VALUES
(1, 'Door Soft', 'Nazmul Hasan', '+8801812391633', 'info@doorsoft.co', 'https://doorsoft.co', 'House: 18, Road: 6, Nikunja 2, Khilkhet, Dhaka.', '$', 'Asia/Dhaka', 'd/m/Y', '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_currency`
--

CREATE TABLE `tbl_currency` (
  `id` int NOT NULL,
  `symbol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `conversion_rate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_id` int NOT NULL DEFAULT '1',
  `del_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Live',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `opening_balance` float DEFAULT NULL,
  `opening_balance_type` varchar(50) DEFAULT NULL,
  `credit_limit` float DEFAULT NULL,
  `date_of_birth` varchar(30) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `permanent_address` varchar(150) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `photo` varchar(150) DEFAULT NULL,
  `date_of_anniversary` varchar(30) DEFAULT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_due_receives`
--

CREATE TABLE `tbl_customer_due_receives` (
  `id` int NOT NULL,
  `reference_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `only_date` date DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `note` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `due_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_orders`
--

CREATE TABLE `tbl_customer_orders` (
  `id` int NOT NULL,
  `reference_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `order_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `order_status` tinyint DEFAULT '0',
  `total_product` int DEFAULT NULL,
  `total_amount` float(10,2) DEFAULT NULL,
  `total_cost` float(10,2) DEFAULT NULL,
  `total_profit` float(10,2) DEFAULT NULL,
  `quotation_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `internal_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `del_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_order_deliveries`
--

CREATE TABLE `tbl_customer_order_deliveries` (
  `id` int NOT NULL,
  `customer_order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `delivery_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `del_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_order_details`
--

CREATE TABLE `tbl_customer_order_details` (
  `id` int NOT NULL,
  `customer_order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `discount_percent` float(10,2) DEFAULT NULL,
  `sub_total` float(10,2) DEFAULT NULL,
  `total_cost` float(10,2) DEFAULT NULL,
  `profit` float(10,2) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `production_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `delivered_qty` int DEFAULT NULL,
  `last_update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `del_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_order_invoices`
--

CREATE TABLE `tbl_customer_order_invoices` (
  `id` int NOT NULL,
  `customer_order_id` int DEFAULT NULL,
  `invoice_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `paid_amount` float(10,2) DEFAULT NULL,
  `due_amount` float(10,2) DEFAULT NULL,
  `order_due_amount` float(10,2) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `del_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_deposits`
--

CREATE TABLE `tbl_deposits` (
  `id` int NOT NULL,
  `reference_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `type` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `account_id` int NOT NULL DEFAULT '1',
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT '0',
  `del_status` varchar(11) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expenses`
--

CREATE TABLE `tbl_expenses` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `account_id` int DEFAULT '0',
  `added_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expense_items`
--

CREATE TABLE `tbl_expense_items` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finished_products_noninventory`
--

CREATE TABLE `tbl_finished_products_noninventory` (
  `id` int NOT NULL,
  `noninvemtory_id` int DEFAULT NULL,
  `finish_product_id` int DEFAULT NULL,
  `nin_cost` float(10,2) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finished_products_productionstage`
--

CREATE TABLE `tbl_finished_products_productionstage` (
  `id` int NOT NULL,
  `productionstage_id` int DEFAULT NULL,
  `finish_product_id` int DEFAULT NULL,
  `stage_month` int DEFAULT NULL,
  `stage_day` int DEFAULT NULL,
  `stage_hours` int DEFAULT NULL,
  `stage_minute` int DEFAULT NULL,
  `required_time` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finished_products_rmaterials`
--

CREATE TABLE `tbl_finished_products_rmaterials` (
  `id` int NOT NULL,
  `rmaterials_id` int DEFAULT NULL,
  `finish_product_id` int DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `total_cost` float(10,2) DEFAULT NULL,
  `company_id` int NOT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_finish_products`
--

CREATE TABLE `tbl_finish_products` (
  `id` int NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `category` int DEFAULT NULL,
  `stock_method` varchar(50) DEFAULT NULL,
  `unit` varchar(40) DEFAULT NULL,
  `rmcost_total` float(10,2) DEFAULT NULL,
  `noninitem_total` float(10,2) DEFAULT NULL,
  `total_cost` float(10,2) DEFAULT NULL,
  `profit_margin` float NOT NULL,
  `sale_price` float(10,2) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL,
  `tax_information` text,
  `current_total_stock` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fnunits`
--

CREATE TABLE `tbl_fnunits` (
  `id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fpcategory`
--

CREATE TABLE `tbl_fpcategory` (
  `id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fpwastes`
--

CREATE TABLE `tbl_fpwastes` (
  `id` int NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `responsible_person` int DEFAULT NULL,
  `total_loss` float(10,2) DEFAULT NULL,
  `note` text,
  `company_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `last_production_cost` int DEFAULT NULL,
  `manufacture_id` int DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fpwastes_fp`
--

CREATE TABLE `tbl_fpwastes_fp` (
  `id` int NOT NULL,
  `finish_product_id` int DEFAULT NULL,
  `manufacture_id` int DEFAULT NULL,
  `fp_waste_amount` decimal(11,0) DEFAULT NULL,
  `last_production_cost` decimal(11,0) DEFAULT NULL,
  `last_purchase_price` decimal(11,0) DEFAULT NULL,
  `loss_amount` decimal(11,0) DEFAULT NULL,
  `fpwaste_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mail_settings`
--

CREATE TABLE `tbl_mail_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `mail_driver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mail_host` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mail_port` smallint DEFAULT NULL,
  `mail_encryption` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mail_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mail_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mail_from` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `from_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `created_by` smallint DEFAULT NULL,
  `updated_by` smallint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_mail_settings`
--

INSERT INTO `tbl_mail_settings` (`id`, `mail_driver`, `mail_host`, `mail_port`, `mail_encryption`, `mail_username`, `mail_password`, `mail_from`, `from_name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'smtp', '*********', 0, 'tls', '*********', '*********', '*********', '*********', NULL, NULL, NULL, '2024-07-23 06:07:18', '2024-07-23 06:07:18');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_main_modules`
--

CREATE TABLE `tbl_main_modules` (
  `id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `del_status` varchar(15) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manufactures`
--

CREATE TABLE `tbl_manufactures` (
  `id` int NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `manufacture_type` varchar(50) DEFAULT NULL,
  `manufacture_status` varchar(50) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `customer_order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `stock_method` varchar(20) DEFAULT NULL,
  `stage_name` varchar(20) DEFAULT NULL,
  `product_quantity` float DEFAULT NULL,
  `batch_no` varchar(50) DEFAULT NULL,
  `stage_counter` int NOT NULL DEFAULT '0',
  `consumed_time` varchar(50) DEFAULT NULL,
  `expiry_days` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `complete_date` varchar(255) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `mrmcost_total` float DEFAULT NULL,
  `mnoninitem_total` float DEFAULT NULL,
  `mtotal_cost` float DEFAULT NULL,
  `mprofit_margin` float DEFAULT NULL,
  `msale_price` float DEFAULT NULL,
  `tax_information` text,
  `note` varchar(200) DEFAULT NULL,
  `file` text,
  `partially_done_quantity` int DEFAULT '0',
  `production_loss` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `added_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manufactures_noninventory`
--

CREATE TABLE `tbl_manufactures_noninventory` (
  `id` int NOT NULL,
  `noninvemtory_id` int DEFAULT NULL,
  `manufacture_id` int DEFAULT NULL,
  `nin_cost` float(10,2) DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manufactures_rmaterials`
--

CREATE TABLE `tbl_manufactures_rmaterials` (
  `id` int NOT NULL,
  `rmaterials_id` int DEFAULT NULL,
  `manufacture_id` int DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `total_cost` float(10,2) DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manufactures_stages`
--

CREATE TABLE `tbl_manufactures_stages` (
  `id` int NOT NULL,
  `productionstage_id` int DEFAULT NULL,
  `manufacture_id` int DEFAULT NULL,
  `stage_check` int DEFAULT NULL,
  `stage_month` int DEFAULT NULL,
  `stage_day` int DEFAULT NULL,
  `stage_hours` int DEFAULT NULL,
  `stage_minute` int DEFAULT NULL,
  `required_time` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_manufacture_product`
--

CREATE TABLE `tbl_manufacture_product` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `manufacture_id` int NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'fefo, batch_control',
  `quantity` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menus`
--

CREATE TABLE `tbl_menus` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_menus`
--

INSERT INTO `tbl_menus` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Home', NULL, NULL, NULL),
(2, 'Dashboard', NULL, NULL, NULL),
(3, 'Profile', NULL, NULL, NULL),
(4, 'Production Management', NULL, NULL, NULL),
(5, 'BOM Management', NULL, NULL, NULL),
(6, 'RM Stock', NULL, NULL, NULL),
(7, 'Product Stock', NULL, NULL, NULL),
(8, 'Quality Control', NULL, NULL, NULL),
(9, 'Sales', NULL, NULL, NULL),
(10, 'Supply Chain Management', NULL, NULL, NULL),
(11, 'Orders', NULL, NULL, NULL),
(12, 'Accounting', NULL, NULL, NULL),
(13, 'HRM', NULL, NULL, NULL),
(14, 'Supplier Payment', NULL, NULL, NULL),
(15, 'Customer Receives', NULL, NULL, NULL),
(16, 'Item Setup', NULL, NULL, NULL),
(17, 'Reports', NULL, NULL, NULL),
(18, 'Expense', NULL, NULL, NULL),
(19, 'Users', NULL, NULL, NULL),
(20, 'Settings', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu_activities`
--

CREATE TABLE `tbl_menu_activities` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_id` int NOT NULL,
  `activity_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `route_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_dependant` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'No',
  `auto_select` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_menu_activities`
--

INSERT INTO `tbl_menu_activities` (`id`, `menu_id`, `activity_name`, `route_name`, `is_dependant`, `auto_select`, `created_at`, `updated_at`) VALUES
(1, 1, 'Home', 'user-home', 'Yes', 'Yes', NULL, NULL),
(2, 2, 'Dashboard', 'dashboard', 'No', 'No', NULL, NULL),
(3, 3, 'Change Password', 'change-password', 'No', 'No', NULL, NULL),
(4, 3, 'Edit Profile', 'edit-profile', 'No', 'No', NULL, NULL),
(5, 3, 'Update Profile', 'update-profile', 'Yes', 'No', NULL, NULL),
(6, 3, 'Set Security Question', 'set-security-question', 'No', 'No', NULL, NULL),
(7, 3, 'Save Security Question', 'save-security-question', 'Yes', 'No', NULL, NULL),
(8, 4, 'Add Manufacture', 'manufacture.create', 'No', 'No', NULL, NULL),
(9, 4, 'List Manufacture', 'manufacture.index', 'No', 'No', NULL, NULL),
(10, 4, 'Edit Manufacture', 'manufacture.edit', 'No', 'No', NULL, NULL),
(11, 4, 'Delete Manufacture', 'manufacture.delete', 'No', 'No', NULL, NULL),
(12, 4, 'View Manufacture', 'manufacture.view', 'No', 'No', NULL, NULL),
(13, 4, 'Duplicate Manufacture', 'manufacture.duplicate', 'No', 'No', NULL, NULL),
(14, 4, 'Print Manufacture', 'manufacture.print', 'No', 'No', NULL, NULL),
(15, 5, 'Add RM Category', 'rmcategory.create', 'No', 'No', NULL, NULL),
(16, 5, 'List RM Category', 'rmcategory.index', 'No', 'No', NULL, NULL),
(17, 5, 'Edit RM Category', 'rmcategory.edit', 'No', 'No', NULL, NULL),
(18, 5, 'Delete RM Category', 'rmcategory.delete', 'No', 'No', NULL, NULL),
(19, 5, 'Add RM', 'rm.create', 'No', 'No', NULL, NULL),
(20, 5, 'List RM', 'rm.index', 'No', 'No', NULL, NULL),
(21, 5, 'Edit RM', 'rm.edit', 'No', 'No', NULL, NULL),
(22, 5, 'Delete RM', 'rm.delete', 'No', 'No', NULL, NULL),
(23, 5, 'Add Non Inventory Item', 'noi.create', 'No', 'No', NULL, NULL),
(24, 5, 'List Non Inventory Item', 'noi.index', 'No', 'No', NULL, NULL),
(25, 5, 'Edit Non Inventory Item', 'noi.edit', 'No', 'No', NULL, NULL),
(26, 5, 'Delete Non Inventory Item', 'noi.delete', 'No', 'No', NULL, NULL),
(27, 6, 'RM Stock', 'rm.stock', 'No', 'No', NULL, NULL),
(28, 6, 'Low Stock', 'low.stock', 'No', 'No', NULL, NULL),
(29, 6, 'Add Stock Adjustment', 'stock-adjustment.create', 'No', 'No', NULL, NULL),
(30, 6, 'List Stock Adjustment', 'stock-adjustment.index', 'No', 'No', NULL, NULL),
(31, 6, 'Edit Stock Adjustment', 'stock-adjustment.edit', 'No', 'No', NULL, NULL),
(32, 7, 'Product Stock', 'product.stock', 'No', 'No', NULL, NULL),
(33, 8, 'Add Production Loss', 'production-loss.create', 'No', 'No', NULL, NULL),
(34, 8, 'List Production Loss', 'production-loss.index', 'No', 'No', NULL, NULL),
(35, 8, 'Add RM Waste', 'rmwaste.create', 'No', 'No', NULL, NULL),
(36, 8, 'List RM Waste', 'rmwaste.index', 'No', 'No', NULL, NULL),
(37, 8, 'Edit RM Waste', 'rmwaste.edit', 'No', 'No', NULL, NULL),
(38, 8, 'Delete RM Waste', 'rmwaste.delete', 'No', 'No', NULL, NULL),
(39, 8, 'Add Product Waste', 'productwaste.create', 'No', 'No', NULL, NULL),
(40, 8, 'List Product Waste', 'productwaste.index', 'No', 'No', NULL, NULL),
(41, 8, 'Edit Product Waste', 'productwaste.edit', 'No', 'No', NULL, NULL),
(42, 8, 'Delete Product Waste', 'productwaste.delete', 'No', 'No', NULL, NULL),
(43, 9, 'Add Sale', 'sale.create', 'No', 'No', NULL, NULL),
(44, 9, 'List Sale', 'sale.index', 'No', 'No', NULL, NULL),
(45, 9, 'Edit Sale', 'sale.edit', 'No', 'No', NULL, NULL),
(46, 9, 'Delete Sale', 'sale.delete', 'No', 'No', NULL, NULL),
(47, 9, 'Sale Print Invoice', 'sale.print-invoice', 'No', 'No', NULL, NULL),
(48, 9, 'Sale Download Invoice', 'sale.download-invoice', 'No', 'No', NULL, NULL),
(49, 9, 'Sale View Details', 'sale.view-details', 'No', 'No', NULL, NULL),
(50, 9, 'Sale Chalan Print', 'sale.chalan-print', 'No', 'No', NULL, NULL),
(51, 9, 'Sale Chalan Download', 'sale.chalan-download', 'No', 'No', NULL, NULL),
(52, 9, 'Add Customer', 'customer.create', 'No', 'No', NULL, NULL),
(53, 9, 'List Customer', 'customer.index', 'No', 'No', NULL, NULL),
(54, 9, 'Edit Customer', 'customer.edit', 'No', 'No', NULL, NULL),
(55, 9, 'Delete Customer', 'customer.delete', 'No', 'No', NULL, NULL),
(56, 9, 'Customer Due Report', 'customer.due-report', 'No', 'No', NULL, NULL),
(57, 9, 'Customer Ledger', 'customer.ledger', 'No', 'No', NULL, NULL),
(58, 10, 'Add Supplier', 'supplier.create', 'No', 'No', NULL, NULL),
(59, 10, 'List Supplier', 'supplier.index', 'No', 'No', NULL, NULL),
(60, 10, 'Edit Supplier', 'supplier.edit', 'No', 'No', NULL, NULL),
(61, 10, 'Delete Supplier', 'supplier.delete', 'No', 'No', NULL, NULL),
(62, 10, 'Supplier Due Report', 'supplier.due-report', 'No', 'No', NULL, NULL),
(63, 10, 'Supplier Ledger', 'supplier.ledger', 'No', 'No', NULL, NULL),
(64, 10, 'Supplier Balance Report', 'supplier.balance-report', 'No', 'No', NULL, NULL),
(65, 10, 'Demand Forecasting By Order', 'demand-forecasting.order', 'No', 'No', NULL, NULL),
(66, 10, 'Demand Forecasting By Product', 'demand-forecasting.product', 'No', 'No', NULL, NULL),
(67, 10, 'Raw Material Price History', 'rm-price-history', 'No', 'No', NULL, NULL),
(68, 11, 'Add Order', 'order.create', 'No', 'No', NULL, NULL),
(69, 11, 'List Order', 'order.index', 'No', 'No', NULL, NULL),
(70, 11, 'Edit Order', 'order.edit', 'No', 'No', NULL, NULL),
(71, 11, 'Delete Order', 'order.delete', 'No', 'No', NULL, NULL),
(72, 11, 'Print Order Invoice', 'order.print-invoice', 'No', 'No', NULL, NULL),
(73, 11, 'Download Order Invoice', 'order.download-invoice', 'No', 'No', NULL, NULL),
(74, 11, 'View Order Details', 'order.view-details', 'No', 'No', NULL, NULL),
(75, 11, 'Order Status', 'order-status', 'No', 'No', NULL, NULL),
(76, 11, 'Add Quotations', 'quotations.create', 'No', 'No', NULL, NULL),
(77, 11, 'List Quotations', 'quotations.index', 'No', 'No', NULL, NULL),
(78, 11, 'Edit Quotations', 'quotations.edit', 'No', 'No', NULL, NULL),
(79, 11, 'Delete Quotations', 'quotations.delete', 'No', 'No', NULL, NULL),
(80, 11, 'Product Order By Low Stock', 'product.low-stock', 'No', 'No', NULL, NULL),
(81, 11, 'Product Order By Work Order', 'product.work-order', 'No', 'No', NULL, NULL),
(82, 11, 'Product Order By Production', 'product.production', 'No', 'No', NULL, NULL),
(83, 11, 'Product Order By Multiple Product', 'product.multiple-product', 'No', 'No', NULL, NULL),
(84, 12, 'Add Account', 'account.create', 'No', 'No', NULL, NULL),
(85, 12, 'Account List', 'account.index', 'No', 'No', NULL, NULL),
(86, 12, 'Edit Account', 'account.edit', 'No', 'No', NULL, NULL),
(87, 12, 'Delete Account', 'account.delete', 'No', 'No', NULL, NULL),
(88, 12, 'Add Deposit Withdraw', 'deposit.create', 'No', 'No', NULL, NULL),
(89, 12, 'List Deposit Withdraw', 'deposit.index', 'No', 'No', NULL, NULL),
(90, 12, 'Edit Deposit Withdrwaw', 'deposit.edit', 'No', 'No', NULL, NULL),
(91, 12, 'Delete Deposit Withdraw', 'deposit.delete', 'No', 'No', NULL, NULL),
(92, 12, 'Balance Sheet', 'balancesheet', 'No', 'No', NULL, NULL),
(93, 12, 'Trial Balance', 'trialbalance', 'No', 'No', NULL, NULL),
(94, 13, 'Add Attendance', 'attendance.create', 'No', 'No', NULL, NULL),
(95, 13, 'List Attendance', 'attendance.index', 'No', 'No', NULL, NULL),
(96, 13, 'Edit Attendance', 'attendance.edit', 'No', 'No', NULL, NULL),
(97, 13, 'Delete Attendance', 'attendance.delete', 'No', 'No', NULL, NULL),
(98, 13, 'Add Payroll', 'payroll.create', 'No', 'No', NULL, NULL),
(99, 13, 'List Payroll', 'payroll.index', 'No', 'No', NULL, NULL),
(100, 13, 'Edit Payroll', 'payroll.edit', 'No', 'No', NULL, NULL),
(101, 14, 'Add Supplier Payment', 'supplier-payment.create', 'No', 'No', NULL, NULL),
(102, 14, 'List Supplier Payment', 'supplier-payment.index', 'No', 'No', NULL, NULL),
(103, 14, 'Edit Supplier Payment', 'supplier-payment.edit', 'No', 'No', NULL, NULL),
(104, 14, 'Delete Supplier Payment', 'supplier-payment.delete', 'No', 'No', NULL, NULL),
(105, 15, 'Add Customer Received', 'customer-received.create', 'No', 'No', NULL, NULL),
(106, 15, 'List Customer Received', 'customer-received.index', 'No', 'No', NULL, NULL),
(107, 15, 'Edit Customer Received', 'customer-received.edit', 'No', 'No', NULL, NULL),
(108, 15, 'Delete Customer Received', 'customer-received.delete', 'No', 'No', NULL, NULL),
(109, 16, 'Add Product Category', 'productcategory.create', 'No', 'No', NULL, NULL),
(110, 16, 'List Product Category', 'productcategory.index', 'No', 'No', NULL, NULL),
(111, 16, 'Edit Product Category', 'productcategory.edit', 'No', 'No', NULL, NULL),
(112, 16, 'Delete Product Category', 'productcategory.delete', 'No', 'No', NULL, NULL),
(113, 16, 'Add Product', 'product.create', 'No', 'No', NULL, NULL),
(114, 16, 'List Product', 'product.index', 'No', 'No', NULL, NULL),
(115, 16, 'Edit Product', 'product.edit', 'No', 'No', NULL, NULL),
(116, 16, 'Delete Product', 'product.delete', 'No', 'No', NULL, NULL),
(117, 16, 'Duplicate Product', 'product.duplicate', 'No', 'No', NULL, NULL),
(118, 17, 'RM Purchase Report', 'rmpurchase.report', 'No', 'No', NULL, NULL),
(119, 17, 'RM Item Purchase Report', 'rmpurchaseitem.report', 'No', 'No', NULL, NULL),
(120, 17, 'RM Stock Report', 'rmstock.report', 'No', 'No', NULL, NULL),
(121, 17, 'Supplier Due Report', 'supplierdue.report', 'No', 'No', NULL, NULL),
(122, 17, 'Supplier Ledger', 'supplierledger.report', 'No', 'No', NULL, NULL),
(123, 17, 'Production Report', 'production.report', 'No', 'No', NULL, NULL),
(124, 17, 'Finished Product Production Report', 'fpp.report', 'No', 'No', NULL, NULL),
(125, 17, 'Finished Product Sale Report', 'fpsale.report', 'No', 'No', NULL, NULL),
(126, 17, 'Finished Product Item Sale Report', 'fpitemsale.report', 'No', 'No', NULL, NULL),
(127, 17, 'Customer Due Report', 'customerdue.report', 'No', 'No', NULL, NULL),
(128, 17, 'Customer Ledger', 'customerledger', 'No', 'No', NULL, NULL),
(129, 17, 'Profit & Loss Report', 'profit-loss', 'No', 'No', NULL, NULL),
(130, 17, 'Production Profit Report', 'production-profit.report', 'No', 'No', NULL, NULL),
(131, 17, 'Attendance Report', 'attandance.report', 'No', 'No', NULL, NULL),
(132, 17, 'Expense Report', 'expense-report', 'No', 'No', NULL, NULL),
(133, 17, 'Salary Report', 'salary-report', 'No', 'No', NULL, NULL),
(134, 17, 'RM Waste Report', 'rmwaste-report', 'No', 'No', NULL, NULL),
(135, 17, 'Product Waste Report', 'productwaste-report', 'No', 'No', NULL, NULL),
(136, 17, 'ABC Analysis Report', 'abcanalysis-report', 'No', 'No', NULL, NULL),
(137, 17, 'Product Price History', 'product-price-history', 'No', 'No', NULL, NULL),
(138, 17, 'RM Price History', 'rm-price-history', 'No', 'No', NULL, NULL),
(139, 18, 'Add Expense Category', 'expense-category.create', 'No', 'No', NULL, NULL),
(140, 18, 'Edit Expense Category', 'expense-category.edit', 'No', 'No', NULL, NULL),
(141, 18, 'List Expense Category', 'expense-category.index', 'No', 'No', NULL, NULL),
(142, 18, 'Delete Expense Category', 'expense-category.delete', 'No', 'No', NULL, NULL),
(143, 18, 'Add Expense', 'expense.create', 'No', 'No', NULL, NULL),
(144, 18, 'Edit Expense', 'expense.edit', 'No', 'No', NULL, NULL),
(145, 18, 'List Expense', 'expense.index', 'No', 'No', NULL, NULL),
(146, 18, 'Delete Expense', 'expense.delete', 'No', 'No', NULL, NULL),
(147, 19, 'Add Role', 'role.create', 'No', 'No', NULL, NULL),
(148, 19, 'Edit Role', 'role.edit', 'No', 'No', NULL, NULL),
(149, 19, 'List Role', 'role.index', 'No', 'No', NULL, NULL),
(150, 19, 'Delete Role', 'role.delete', 'No', 'No', NULL, NULL),
(151, 19, 'Add User', 'user.create', 'No', 'No', NULL, NULL),
(152, 19, 'Edit User', 'user.edit', 'No', 'No', NULL, NULL),
(153, 19, 'List User', 'user.index', 'No', 'No', NULL, NULL),
(154, 19, 'Delete User', 'user.delete', 'No', 'No', NULL, NULL),
(155, 20, 'Add Unit', 'units.create', 'No', 'No', NULL, NULL),
(156, 20, 'List Unit', 'units.index', 'No', 'No', NULL, NULL),
(157, 20, 'Edit Unit', 'units.edit', 'No', 'No', NULL, NULL),
(158, 20, 'Delete Unit', 'units.delete', 'No', 'No', NULL, NULL),
(159, 20, 'White Label', 'white-label', 'No', 'No', NULL, NULL),
(160, 20, 'Add Production Stage', 'productionstage.create', 'No', 'No', NULL, NULL),
(161, 20, 'List Production Stage', 'productionstage.list', 'No', 'No', NULL, NULL),
(162, 20, 'Edit Production Stage', 'productionstage.edit', 'No', 'No', NULL, NULL),
(163, 20, 'Delete Production Stage', 'productionstage.delete', 'No', 'No', NULL, NULL),
(164, 20, 'Mail Settings', 'mail-settings', 'No', 'No', NULL, NULL),
(165, 20, 'Tax Settings', 'tax-settings', 'No', 'No', NULL, NULL),
(166, 20, 'Company Profile', 'company-profile', 'No', 'No', NULL, NULL),
(167, 20, 'Data Import', 'data-import', 'No', 'No', NULL, NULL),
(168, 10, 'Add Purchase', 'purchase.create', 'No', 'No', NULL, NULL),
(169, 10, 'List Purchase', 'purchase.index', 'No', 'No', NULL, NULL),
(170, 10, 'Edit Purchase', 'purchase.edit', 'No', 'No', NULL, NULL),
(171, 10, 'Delete Purchase', 'purchase.delete', 'No', 'No', NULL, NULL),
(172, 10, 'View Purchase', 'purchase.view', 'No', 'No', NULL, NULL),
(173, 10, 'Generate Purchase', 'purchase.generate', 'No', 'No', NULL, NULL),
(174, 10, 'Print Purchase', 'purchase.print', 'No', 'No', NULL, NULL),
(175, 10, 'Download Purchase', 'purchase.download', 'No', 'No', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_non_inventory_items`
--

CREATE TABLE `tbl_non_inventory_items` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notifications`
--

CREATE TABLE `tbl_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `row_id` int NOT NULL,
  `created_by` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_for` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_read_doctor` int NOT NULL DEFAULT '0',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_settings`
--

CREATE TABLE `tbl_payment_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('live','sandbox') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `app_username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `app_password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `app_secret_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `updated_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productions`
--

CREATE TABLE `tbl_productions` (
  `id` int NOT NULL,
  `reference_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `production_stage` int DEFAULT NULL,
  `production_stage_text` varchar(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `finished_product` int DEFAULT NULL,
  `quantity` float(10,2) DEFAULT NULL,
  `rmcost_total` float(10,2) DEFAULT NULL,
  `noninitem_total` float(10,2) DEFAULT NULL,
  `total_cost` float(10,2) DEFAULT NULL,
  `sale_price` float(10,2) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `file_paths` text,
  `added_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_production_history`
--

CREATE TABLE `tbl_production_history` (
  `id` int NOT NULL,
  `work_order_id` int NOT NULL,
  `produced_quantity` int NOT NULL,
  `produced_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_production_noninventory`
--

CREATE TABLE `tbl_production_noninventory` (
  `id` int NOT NULL,
  `production_id` int DEFAULT NULL,
  `ni_id` int DEFAULT NULL,
  `account` int DEFAULT NULL,
  `total` float(10,2) DEFAULT NULL,
  `totalamount` float(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_production_rmaterials`
--

CREATE TABLE `tbl_production_rmaterials` (
  `id` int NOT NULL,
  `production_id` int DEFAULT NULL,
  `rm_id` int DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `total` float(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_production_scheduling`
--

CREATE TABLE `tbl_production_scheduling` (
  `id` int NOT NULL,
  `manufacture_id` int NOT NULL,
  `production_stage_id` int NOT NULL,
  `task` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `end_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `del_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_production_stages`
--

CREATE TABLE `tbl_production_stages` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products_services`
--

CREATE TABLE `tbl_products_services` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` varchar(50) DEFAULT 'Veg No',
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_proposal_invoice`
--

CREATE TABLE `tbl_proposal_invoice` (
  `id` bigint NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'Proposal/Invoice',
  `date` date NOT NULL,
  `customer_id` int DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `subtotal` float UNSIGNED NOT NULL,
  `discount_type` varchar(50) NOT NULL COMMENT 'Fixed/Percentage',
  `discount_value` float NOT NULL,
  `tax` varchar(500) NOT NULL COMMENT 'total tax',
  `shipping_other` float NOT NULL,
  `grand_total` float NOT NULL,
  `proposal_no` varchar(20) NOT NULL,
  `proposal_status` varchar(20) NOT NULL DEFAULT 'N/A' COMMENT 'Accepted, Declined, N/A',
  `template_bg_color` varchar(50) NOT NULL DEFAULT '#45818E',
  `template_text_color` varchar(50) NOT NULL DEFAULT '#FFFFFF',
  `proposal_user_id` int NOT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `proposal_id` bigint DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `note` text,
  `payment_status` varchar(20) DEFAULT NULL COMMENT 'Paid/Unpaid',
  `invoice_user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_proposal_invoice_products_services`
--

CREATE TABLE `tbl_proposal_invoice_products_services` (
  `id` bigint NOT NULL,
  `product_service_id` int DEFAULT NULL,
  `quantity_amount` float DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `total` float NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `proposal_invoice_id` bigint DEFAULT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_proposal_pdf`
--

CREATE TABLE `tbl_proposal_pdf` (
  `id` bigint NOT NULL,
  `proposal_id` int DEFAULT NULL,
  `attachment_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_proposal_photo`
--

CREATE TABLE `tbl_proposal_photo` (
  `id` bigint NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file` varchar(150) DEFAULT NULL,
  `proposal_id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase`
--

CREATE TABLE `tbl_purchase` (
  `id` int NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `supplier` int DEFAULT NULL,
  `date` varchar(15) NOT NULL,
  `subtotal` float(10,2) DEFAULT NULL,
  `other` float(10,2) DEFAULT NULL,
  `grand_total` float(10,2) DEFAULT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `account` int DEFAULT NULL,
  `paid` float(10,2) DEFAULT NULL,
  `due` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `file` text,
  `type` varchar(50) DEFAULT NULL COMMENT 'purchase, purchase_order',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase_return`
--

CREATE TABLE `tbl_purchase_return` (
  `id` int NOT NULL,
  `reference_no` varchar(255) DEFAULT NULL,
  `pur_ref_no` varchar(255) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `purchase_date` varchar(55) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `return_status` varchar(100) DEFAULT NULL,
  `total_return_amount` float DEFAULT NULL,
  `payment_method_id` int NOT NULL DEFAULT '1',
  `payment_method_type` varchar(255) DEFAULT NULL,
  `account_type` varchar(20) DEFAULT NULL,
  `note` varchar(300) DEFAULT NULL,
  `added_date` varchar(55) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT '0',
  `del_status` varchar(11) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase_return_details`
--

CREATE TABLE `tbl_purchase_return_details` (
  `id` int NOT NULL,
  `pur_return_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `item_type` varchar(50) DEFAULT NULL,
  `expiry_imei_serial` varchar(255) DEFAULT NULL,
  `return_note` text,
  `return_quantity_amount` varchar(11) DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `return_status` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT '0',
  `del_status` varchar(11) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase_rmaterials`
--

CREATE TABLE `tbl_purchase_rmaterials` (
  `id` int NOT NULL,
  `rmaterials_id` int DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `quantity_amount` float(10,2) DEFAULT NULL,
  `total` float(10,2) DEFAULT NULL,
  `purchase_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotations`
--

CREATE TABLE `tbl_quotations` (
  `id` int NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `date` varchar(15) NOT NULL,
  `subtotal` float(10,2) DEFAULT NULL,
  `other` float(10,2) DEFAULT NULL,
  `grand_total` float(10,2) DEFAULT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `due` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `file` text,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_details`
--

CREATE TABLE `tbl_quotation_details` (
  `id` int NOT NULL,
  `finishProduct_id` int DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `quantity_amount` float(10,2) DEFAULT NULL,
  `total` float(10,2) DEFAULT NULL,
  `quotation_id` int DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rawmaterials`
--

CREATE TABLE `tbl_rawmaterials` (
  `id` int NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` int DEFAULT NULL,
  `consumption_unit` float DEFAULT NULL,
  `unit` float DEFAULT NULL,
  `rate_per_unit` float DEFAULT NULL,
  `consumption_check` float DEFAULT '0',
  `conversion_rate` float(10,2) DEFAULT NULL,
  `rate_per_consumption_unit` float(10,2) DEFAULT NULL,
  `opening_stock` float DEFAULT NULL,
  `alert_level` float DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rmcategory`
--

CREATE TABLE `tbl_rmcategory` (
  `id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rmstock_adjustment_rmaterials`
--

CREATE TABLE `tbl_rmstock_adjustment_rmaterials` (
  `id` int NOT NULL,
  `rmaterials_id` int DEFAULT NULL,
  `consumption_amount` float(10,2) DEFAULT NULL,
  `inventory_adjustment_id` int DEFAULT NULL,
  `consumption_status` enum('Plus','Minus','','') DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rmunits`
--

CREATE TABLE `tbl_rmunits` (
  `id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'User', '2025-03-22 02:15:34', '2025-03-22 02:15:34');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role_permissions`
--

CREATE TABLE `tbl_role_permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `activity_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_role_permissions`
--

INSERT INTO `tbl_role_permissions` (`id`, `role_id`, `menu_id`, `activity_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 2, NULL, NULL),
(2, 1, 3, 3, NULL, NULL),
(3, 1, 3, 4, NULL, NULL),
(4, 1, 3, 6, NULL, NULL),
(5, 1, 4, 8, NULL, NULL),
(6, 1, 4, 9, NULL, NULL),
(7, 1, 4, 10, NULL, NULL),
(8, 1, 4, 11, NULL, NULL),
(9, 1, 4, 12, NULL, NULL),
(10, 1, 4, 13, NULL, NULL),
(11, 1, 4, 14, NULL, NULL),
(12, 1, 5, 15, NULL, NULL),
(13, 1, 5, 16, NULL, NULL),
(14, 1, 5, 17, NULL, NULL),
(15, 1, 5, 18, NULL, NULL),
(16, 1, 5, 19, NULL, NULL),
(17, 1, 5, 20, NULL, NULL),
(18, 1, 5, 21, NULL, NULL),
(19, 1, 5, 22, NULL, NULL),
(20, 1, 5, 23, NULL, NULL),
(21, 1, 5, 24, NULL, NULL),
(22, 1, 5, 25, NULL, NULL),
(23, 1, 5, 26, NULL, NULL),
(24, 1, 6, 27, NULL, NULL),
(25, 1, 6, 28, NULL, NULL),
(26, 1, 6, 29, NULL, NULL),
(27, 1, 6, 30, NULL, NULL),
(28, 1, 6, 31, NULL, NULL),
(29, 1, 7, 32, NULL, NULL),
(30, 1, 8, 33, NULL, NULL),
(31, 1, 8, 34, NULL, NULL),
(32, 1, 8, 35, NULL, NULL),
(33, 1, 8, 36, NULL, NULL),
(34, 1, 8, 37, NULL, NULL),
(35, 1, 8, 38, NULL, NULL),
(36, 1, 8, 39, NULL, NULL),
(37, 1, 8, 40, NULL, NULL),
(38, 1, 8, 41, NULL, NULL),
(39, 1, 8, 42, NULL, NULL),
(40, 1, 9, 43, NULL, NULL),
(41, 1, 9, 44, NULL, NULL),
(42, 1, 9, 45, NULL, NULL),
(43, 1, 9, 46, NULL, NULL),
(44, 1, 9, 47, NULL, NULL),
(45, 1, 9, 48, NULL, NULL),
(46, 1, 9, 49, NULL, NULL),
(47, 1, 9, 50, NULL, NULL),
(48, 1, 9, 51, NULL, NULL),
(49, 1, 9, 52, NULL, NULL),
(50, 1, 9, 53, NULL, NULL),
(51, 1, 9, 54, NULL, NULL),
(52, 1, 9, 55, NULL, NULL),
(53, 1, 9, 56, NULL, NULL),
(54, 1, 9, 57, NULL, NULL),
(55, 1, 10, 58, NULL, NULL),
(56, 1, 10, 59, NULL, NULL),
(57, 1, 10, 60, NULL, NULL),
(58, 1, 10, 61, NULL, NULL),
(59, 1, 10, 62, NULL, NULL),
(60, 1, 10, 63, NULL, NULL),
(61, 1, 10, 64, NULL, NULL),
(62, 1, 10, 65, NULL, NULL),
(63, 1, 10, 66, NULL, NULL),
(64, 1, 10, 67, NULL, NULL),
(65, 1, 10, 168, NULL, NULL),
(66, 1, 10, 169, NULL, NULL),
(67, 1, 10, 170, NULL, NULL),
(68, 1, 10, 171, NULL, NULL),
(69, 1, 10, 172, NULL, NULL),
(70, 1, 10, 173, NULL, NULL),
(71, 1, 10, 174, NULL, NULL),
(72, 1, 10, 175, NULL, NULL),
(73, 1, 11, 68, NULL, NULL),
(74, 1, 11, 69, NULL, NULL),
(75, 1, 11, 70, NULL, NULL),
(76, 1, 11, 71, NULL, NULL),
(77, 1, 11, 72, NULL, NULL),
(78, 1, 11, 73, NULL, NULL),
(79, 1, 11, 74, NULL, NULL),
(80, 1, 11, 75, NULL, NULL),
(81, 1, 11, 76, NULL, NULL),
(82, 1, 11, 77, NULL, NULL),
(83, 1, 11, 78, NULL, NULL),
(84, 1, 11, 79, NULL, NULL),
(85, 1, 11, 80, NULL, NULL),
(86, 1, 11, 81, NULL, NULL),
(87, 1, 11, 82, NULL, NULL),
(88, 1, 11, 83, NULL, NULL),
(89, 1, 12, 84, NULL, NULL),
(90, 1, 12, 85, NULL, NULL),
(91, 1, 12, 86, NULL, NULL),
(92, 1, 12, 87, NULL, NULL),
(93, 1, 12, 88, NULL, NULL),
(94, 1, 12, 89, NULL, NULL),
(95, 1, 12, 90, NULL, NULL),
(96, 1, 12, 91, NULL, NULL),
(97, 1, 12, 92, NULL, NULL),
(98, 1, 12, 93, NULL, NULL),
(99, 1, 13, 94, NULL, NULL),
(100, 1, 13, 95, NULL, NULL),
(101, 1, 13, 96, NULL, NULL),
(102, 1, 13, 97, NULL, NULL),
(103, 1, 13, 98, NULL, NULL),
(104, 1, 13, 99, NULL, NULL),
(105, 1, 13, 100, NULL, NULL),
(106, 1, 14, 101, NULL, NULL),
(107, 1, 14, 102, NULL, NULL),
(108, 1, 14, 103, NULL, NULL),
(109, 1, 14, 104, NULL, NULL),
(110, 1, 15, 105, NULL, NULL),
(111, 1, 15, 106, NULL, NULL),
(112, 1, 15, 107, NULL, NULL),
(113, 1, 15, 108, NULL, NULL),
(114, 1, 16, 109, NULL, NULL),
(115, 1, 16, 110, NULL, NULL),
(116, 1, 16, 111, NULL, NULL),
(117, 1, 16, 112, NULL, NULL),
(118, 1, 16, 113, NULL, NULL),
(119, 1, 16, 114, NULL, NULL),
(120, 1, 16, 115, NULL, NULL),
(121, 1, 16, 116, NULL, NULL),
(122, 1, 16, 117, NULL, NULL),
(123, 1, 17, 118, NULL, NULL),
(124, 1, 17, 119, NULL, NULL),
(125, 1, 17, 120, NULL, NULL),
(126, 1, 17, 121, NULL, NULL),
(127, 1, 17, 122, NULL, NULL),
(128, 1, 17, 123, NULL, NULL),
(129, 1, 17, 124, NULL, NULL),
(130, 1, 17, 125, NULL, NULL),
(131, 1, 17, 126, NULL, NULL),
(132, 1, 17, 127, NULL, NULL),
(133, 1, 17, 128, NULL, NULL),
(134, 1, 17, 129, NULL, NULL),
(135, 1, 17, 130, NULL, NULL),
(136, 1, 17, 131, NULL, NULL),
(137, 1, 17, 132, NULL, NULL),
(138, 1, 17, 133, NULL, NULL),
(139, 1, 17, 134, NULL, NULL),
(140, 1, 17, 135, NULL, NULL),
(141, 1, 17, 136, NULL, NULL),
(142, 1, 17, 137, NULL, NULL),
(143, 1, 17, 138, NULL, NULL),
(144, 1, 18, 139, NULL, NULL),
(145, 1, 18, 140, NULL, NULL),
(146, 1, 18, 141, NULL, NULL),
(147, 1, 18, 142, NULL, NULL),
(148, 1, 18, 143, NULL, NULL),
(149, 1, 18, 144, NULL, NULL),
(150, 1, 18, 145, NULL, NULL),
(151, 1, 18, 146, NULL, NULL),
(152, 1, 19, 147, NULL, NULL),
(153, 1, 19, 148, NULL, NULL),
(154, 1, 19, 149, NULL, NULL),
(155, 1, 19, 150, NULL, NULL),
(156, 1, 19, 151, NULL, NULL),
(157, 1, 19, 152, NULL, NULL),
(158, 1, 19, 153, NULL, NULL),
(159, 1, 19, 154, NULL, NULL),
(160, 1, 20, 155, NULL, NULL),
(161, 1, 20, 156, NULL, NULL),
(162, 1, 20, 157, NULL, NULL),
(163, 1, 20, 158, NULL, NULL),
(164, 1, 20, 159, NULL, NULL),
(165, 1, 20, 160, NULL, NULL),
(166, 1, 20, 161, NULL, NULL),
(167, 1, 20, 162, NULL, NULL),
(168, 1, 20, 163, NULL, NULL),
(169, 1, 20, 164, NULL, NULL),
(170, 1, 20, 165, NULL, NULL),
(171, 1, 20, 166, NULL, NULL),
(172, 1, 20, 167, NULL, NULL),
(173, 1, 1, 1, NULL, NULL),
(174, 1, 3, 5, NULL, NULL),
(175, 1, 3, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salaries`
--

CREATE TABLE `tbl_salaries` (
  `id` int NOT NULL,
  `month` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `year` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `details_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `account_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT '0',
  `del_status` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales`
--

CREATE TABLE `tbl_sales` (
  `id` int NOT NULL,
  `reference_no` varchar(20) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `product_quantity` int DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `other` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `grand_total` float DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `paid` float DEFAULT NULL,
  `due` float DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `manufacture_details` text,
  `added_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sale_consumptions_of_menus`
--

CREATE TABLE `tbl_sale_consumptions_of_menus` (
  `id` bigint NOT NULL,
  `rmaterials_id` int DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `sale_consumption_id` int DEFAULT NULL,
  `sales_id` int NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `food_menu_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sale_consumptions_of_modifiers_of_menus`
--

CREATE TABLE `tbl_sale_consumptions_of_modifiers_of_menus` (
  `id` bigint NOT NULL,
  `rmaterials_id` int DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `sale_consumption_id` int DEFAULT NULL,
  `sales_id` int NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `food_menu_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sale_details`
--

CREATE TABLE `tbl_sale_details` (
  `id` int NOT NULL,
  `sale_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `manufacture_id` int DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `product_quantity` int DEFAULT NULL,
  `total_amount` float(10,2) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sessions`
--

CREATE TABLE `tbl_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock_adjust_logs`
--

CREATE TABLE `tbl_stock_adjust_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `rm_id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1.addition 2.subtraction',
  `quantity` int NOT NULL DEFAULT '0',
  `del_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_suppliers`
--

CREATE TABLE `tbl_suppliers` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `opening_balance` int DEFAULT NULL,
  `opening_balance_type` varchar(50) DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `company_id` int DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `credit_limit` float(10,2) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier_payments`
--

CREATE TABLE `tbl_supplier_payments` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `supplier` int DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_taxes`
--

CREATE TABLE `tbl_taxes` (
  `id` int NOT NULL,
  `tax_id` int NOT NULL,
  `tax` varchar(50) NOT NULL,
  `tax_rate` float(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(100) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tbl_taxes`
--

INSERT INTO `tbl_taxes` (`id`, `tax_id`, `tax`, `tax_rate`, `created_at`, `updated_at`, `del_status`) VALUES
(1, 1, 'VAT', 10.00, '2024-09-30 06:21:59', '2024-09-30 06:21:59', 'Live'),
(2, 1, 'SD', 5.00, '2024-09-30 06:21:59', '2024-09-30 06:21:59', 'Live'),
(4, 1, 'CSD', 5.00, '2024-09-30 06:21:59', '2024-09-30 06:21:59', 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tax_items`
--

CREATE TABLE `tbl_tax_items` (
  `id` int NOT NULL,
  `collect_tax` varchar(50) DEFAULT NULL,
  `tax_registration_number` varchar(50) DEFAULT NULL,
  `tax_type` varchar(255) DEFAULT NULL COMMENT 'Exclusive, Inclusive',
  `added_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tbl_tax_items`
--

INSERT INTO `tbl_tax_items` (`id`, `collect_tax`, `tax_registration_number`, `tax_type`, `added_by`, `created_at`, `updated_at`, `del_status`) VALUES
(1, 'Yes', '555', 'Inclusive', 1, '2022-06-18 12:03:06', '2024-09-30 06:21:59', 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_time_zone`
--

CREATE TABLE `tbl_time_zone` (
  `id` int NOT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `zone_name` varchar(35) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tbl_time_zone`
--

INSERT INTO `tbl_time_zone` (`id`, `country_code`, `zone_name`, `del_status`) VALUES
(1, 'AD', 'Europe/Andorra', 'Live'),
(2, 'AE', 'Asia/Dubai', 'Live'),
(3, 'AF', 'Asia/Kabul', 'Live'),
(4, 'AG', 'America/Antigua', 'Live'),
(5, 'AI', 'America/Anguilla', 'Live'),
(6, 'AL', 'Europe/Tirane', 'Live'),
(7, 'AM', 'Asia/Yerevan', 'Live'),
(8, 'AO', 'Africa/Luanda', 'Live'),
(9, 'AQ', 'Antarctica/McMurdo', 'Live'),
(10, 'AQ', 'Antarctica/Casey', 'Live'),
(11, 'AQ', 'Antarctica/Davis', 'Live'),
(12, 'AQ', 'Antarctica/DumontDUrville', 'Live'),
(13, 'AQ', 'Antarctica/Mawson', 'Live'),
(14, 'AQ', 'Antarctica/Palmer', 'Live'),
(15, 'AQ', 'Antarctica/Rothera', 'Live'),
(16, 'AQ', 'Antarctica/Syowa', 'Live'),
(17, 'AQ', 'Antarctica/Troll', 'Live'),
(18, 'AQ', 'Antarctica/Vostok', 'Live'),
(19, 'AR', 'America/Argentina/Buenos_Aires', 'Live'),
(20, 'AR', 'America/Argentina/Cordoba', 'Live'),
(21, 'AR', 'America/Argentina/Salta', 'Live'),
(22, 'AR', 'America/Argentina/Jujuy', 'Live'),
(23, 'AR', 'America/Argentina/Tucuman', 'Live'),
(24, 'AR', 'America/Argentina/Catamarca', 'Live'),
(25, 'AR', 'America/Argentina/La_Rioja', 'Live'),
(26, 'AR', 'America/Argentina/San_Juan', 'Live'),
(27, 'AR', 'America/Argentina/Mendoza', 'Live'),
(28, 'AR', 'America/Argentina/San_Luis', 'Live'),
(29, 'AR', 'America/Argentina/Rio_Gallegos', 'Live'),
(30, 'AR', 'America/Argentina/Ushuaia', 'Live'),
(31, 'AS', 'Pacific/Pago_Pago', 'Live'),
(32, 'AT', 'Europe/Vienna', 'Live'),
(33, 'AU', 'Australia/Lord_Howe', 'Live'),
(34, 'AU', 'Antarctica/Macquarie', 'Live'),
(35, 'AU', 'Australia/Hobart', 'Live'),
(36, 'AU', 'Australia/Currie', 'Live'),
(37, 'AU', 'Australia/Melbourne', 'Live'),
(38, 'AU', 'Australia/Sydney', 'Live'),
(39, 'AU', 'Australia/Broken_Hill', 'Live'),
(40, 'AU', 'Australia/Brisbane', 'Live'),
(41, 'AU', 'Australia/Lindeman', 'Live'),
(42, 'AU', 'Australia/Adelaide', 'Live'),
(43, 'AU', 'Australia/Darwin', 'Live'),
(44, 'AU', 'Australia/Perth', 'Live'),
(45, 'AU', 'Australia/Eucla', 'Live'),
(46, 'AW', 'America/Aruba', 'Live'),
(47, 'AX', 'Europe/Mariehamn', 'Live'),
(48, 'AZ', 'Asia/Baku', 'Live'),
(49, 'BA', 'Europe/Sarajevo', 'Live'),
(50, 'BB', 'America/Barbados', 'Live'),
(51, 'BD', 'Asia/Dhaka', 'Live'),
(52, 'BE', 'Europe/Brussels', 'Live'),
(53, 'BF', 'Africa/Ouagadougou', 'Live'),
(54, 'BG', 'Europe/Sofia', 'Live'),
(55, 'BH', 'Asia/Bahrain', 'Live'),
(56, 'BI', 'Africa/Bujumbura', 'Live'),
(57, 'BJ', 'Africa/Porto-Novo', 'Live'),
(58, 'BL', 'America/St_Barthelemy', 'Live'),
(59, 'BM', 'Atlantic/Bermuda', 'Live'),
(60, 'BN', 'Asia/Brunei', 'Live'),
(61, 'BO', 'America/La_Paz', 'Live'),
(62, 'BQ', 'America/Kralendijk', 'Live'),
(63, 'BR', 'America/Noronha', 'Live'),
(64, 'BR', 'America/Belem', 'Live'),
(65, 'BR', 'America/Fortaleza', 'Live'),
(66, 'BR', 'America/Recife', 'Live'),
(67, 'BR', 'America/Araguaina', 'Live'),
(68, 'BR', 'America/Maceio', 'Live'),
(69, 'BR', 'America/Bahia', 'Live'),
(70, 'BR', 'America/Sao_Paulo', 'Live'),
(71, 'BR', 'America/Campo_Grande', 'Live'),
(72, 'BR', 'America/Cuiaba', 'Live'),
(73, 'BR', 'America/Santarem', 'Live'),
(74, 'BR', 'America/Porto_Velho', 'Live'),
(75, 'BR', 'America/Boa_Vista', 'Live'),
(76, 'BR', 'America/Manaus', 'Live'),
(77, 'BR', 'America/Eirunepe', 'Live'),
(78, 'BR', 'America/Rio_Branco', 'Live'),
(79, 'BS', 'America/Nassau', 'Live'),
(80, 'BT', 'Asia/Thimphu', 'Live'),
(81, 'BW', 'Africa/Gaborone', 'Live'),
(82, 'BY', 'Europe/Minsk', 'Live'),
(83, 'BZ', 'America/Belize', 'Live'),
(84, 'CA', 'America/St_Johns', 'Live'),
(85, 'CA', 'America/Halifax', 'Live'),
(86, 'CA', 'America/Glace_Bay', 'Live'),
(87, 'CA', 'America/Moncton', 'Live'),
(88, 'CA', 'America/Goose_Bay', 'Live'),
(89, 'CA', 'America/Blanc-Sablon', 'Live'),
(90, 'CA', 'America/Toronto', 'Live'),
(91, 'CA', 'America/Nipigon', 'Live'),
(92, 'CA', 'America/Thunder_Bay', 'Live'),
(93, 'CA', 'America/Iqaluit', 'Live'),
(94, 'CA', 'America/Pangnirtung', 'Live'),
(95, 'CA', 'America/Atikokan', 'Live'),
(96, 'CA', 'America/Winnipeg', 'Live'),
(97, 'CA', 'America/Rainy_River', 'Live'),
(98, 'CA', 'America/Resolute', 'Live'),
(99, 'CA', 'America/Rankin_Inlet', 'Live'),
(100, 'CA', 'America/Regina', 'Live'),
(101, 'CA', 'America/Swift_Current', 'Live'),
(102, 'CA', 'America/Edmonton', 'Live'),
(103, 'CA', 'America/Cambridge_Bay', 'Live'),
(104, 'CA', 'America/Yellowknife', 'Live'),
(105, 'CA', 'America/Inuvik', 'Live'),
(106, 'CA', 'America/Creston', 'Live'),
(107, 'CA', 'America/Dawson_Creek', 'Live'),
(108, 'CA', 'America/Fort_Nelson', 'Live'),
(109, 'CA', 'America/Vancouver', 'Live'),
(110, 'CA', 'America/Whitehorse', 'Live'),
(111, 'CA', 'America/Dawson', 'Live'),
(112, 'CC', 'Indian/Cocos', 'Live'),
(113, 'CD', 'Africa/Kinshasa', 'Live'),
(114, 'CD', 'Africa/Lubumbashi', 'Live'),
(115, 'CF', 'Africa/Bangui', 'Live'),
(116, 'CG', 'Africa/Brazzaville', 'Live'),
(117, 'CH', 'Europe/Zurich', 'Live'),
(118, 'CI', 'Africa/Abidjan', 'Live'),
(119, 'CK', 'Pacific/Rarotonga', 'Live'),
(120, 'CL', 'America/Santiago', 'Live'),
(121, 'CL', 'America/Punta_Arenas', 'Live'),
(122, 'CL', 'Pacific/Easter', 'Live'),
(123, 'CM', 'Africa/Douala', 'Live'),
(124, 'CN', 'Asia/Shanghai', 'Live'),
(125, 'CN', 'Asia/Urumqi', 'Live'),
(126, 'CO', 'America/Bogota', 'Live'),
(127, 'CR', 'America/Costa_Rica', 'Live'),
(128, 'CU', 'America/Havana', 'Live'),
(129, 'CV', 'Atlantic/Cape_Verde', 'Live'),
(130, 'CW', 'America/Curacao', 'Live'),
(131, 'CX', 'Indian/Christmas', 'Live'),
(132, 'CY', 'Asia/Nicosia', 'Live'),
(133, 'CY', 'Asia/Famagusta', 'Live'),
(134, 'CZ', 'Europe/Prague', 'Live'),
(135, 'DE', 'Europe/Berlin', 'Live'),
(136, 'DE', 'Europe/Busingen', 'Live'),
(137, 'DJ', 'Africa/Djibouti', 'Live'),
(138, 'DK', 'Europe/Copenhagen', 'Live'),
(139, 'DM', 'America/Dominica', 'Live'),
(140, 'DO', 'America/Santo_Domingo', 'Live'),
(141, 'DZ', 'Africa/Algiers', 'Live'),
(142, 'EC', 'America/Guayaquil', 'Live'),
(143, 'EC', 'Pacific/Galapagos', 'Live'),
(144, 'EE', 'Europe/Tallinn', 'Live'),
(145, 'EG', 'Africa/Cairo', 'Live'),
(146, 'EH', 'Africa/El_Aaiun', 'Live'),
(147, 'ER', 'Africa/Asmara', 'Live'),
(148, 'ES', 'Europe/Madrid', 'Live'),
(149, 'ES', 'Africa/Ceuta', 'Live'),
(150, 'ES', 'Atlantic/Canary', 'Live'),
(151, 'ET', 'Africa/Addis_Ababa', 'Live'),
(152, 'FI', 'Europe/Helsinki', 'Live'),
(153, 'FJ', 'Pacific/Fiji', 'Live'),
(154, 'FK', 'Atlantic/Stanley', 'Live'),
(155, 'FM', 'Pacific/Chuuk', 'Live'),
(156, 'FM', 'Pacific/Pohnpei', 'Live'),
(157, 'FM', 'Pacific/Kosrae', 'Live'),
(158, 'FO', 'Atlantic/Faroe', 'Live'),
(159, 'FR', 'Europe/Paris', 'Live'),
(160, 'GA', 'Africa/Libreville', 'Live'),
(161, 'GB', 'Europe/London', 'Live'),
(162, 'GD', 'America/Grenada', 'Live'),
(163, 'GE', 'Asia/Tbilisi', 'Live'),
(164, 'GF', 'America/Cayenne', 'Live'),
(165, 'GG', 'Europe/Guernsey', 'Live'),
(166, 'GH', 'Africa/Accra', 'Live'),
(167, 'GI', 'Europe/Gibraltar', 'Live'),
(168, 'GL', 'America/Godthab', 'Live'),
(169, 'GL', 'America/Danmarkshavn', 'Live'),
(170, 'GL', 'America/Scoresbysund', 'Live'),
(171, 'GL', 'America/Thule', 'Live'),
(172, 'GM', 'Africa/Banjul', 'Live'),
(173, 'GN', 'Africa/Conakry', 'Live'),
(174, 'GP', 'America/Guadeloupe', 'Live'),
(175, 'GQ', 'Africa/Malabo', 'Live'),
(176, 'GR', 'Europe/Athens', 'Live'),
(177, 'GS', 'Atlantic/South_Georgia', 'Live'),
(178, 'GT', 'America/Guatemala', 'Live'),
(179, 'GU', 'Pacific/Guam', 'Live'),
(180, 'GW', 'Africa/Bissau', 'Live'),
(181, 'GY', 'America/Guyana', 'Live'),
(182, 'HK', 'Asia/Hong_Kong', 'Live'),
(183, 'HN', 'America/Tegucigalpa', 'Live'),
(184, 'HR', 'Europe/Zagreb', 'Live'),
(185, 'HT', 'America/Port-au-Prince', 'Live'),
(186, 'HU', 'Europe/Budapest', 'Live'),
(187, 'ID', 'Asia/Jakarta', 'Live'),
(188, 'ID', 'Asia/Pontianak', 'Live'),
(189, 'ID', 'Asia/Makassar', 'Live'),
(190, 'ID', 'Asia/Jayapura', 'Live'),
(191, 'IE', 'Europe/Dublin', 'Live'),
(192, 'IL', 'Asia/Jerusalem', 'Live'),
(193, 'IM', 'Europe/Isle_of_Man', 'Live'),
(194, 'IN', 'Asia/Kolkata', 'Live'),
(195, 'IO', 'Indian/Chagos', 'Live'),
(196, 'IQ', 'Asia/Baghdad', 'Live'),
(197, 'IR', 'Asia/Tehran', 'Live'),
(198, 'IS', 'Atlantic/Reykjavik', 'Live'),
(199, 'IT', 'Europe/Rome', 'Live'),
(200, 'JE', 'Europe/Jersey', 'Live'),
(201, 'JM', 'America/Jamaica', 'Live'),
(202, 'JO', 'Asia/Amman', 'Live'),
(203, 'JP', 'Asia/Tokyo', 'Live'),
(204, 'KE', 'Africa/Nairobi', 'Live'),
(205, 'KG', 'Asia/Bishkek', 'Live'),
(206, 'KH', 'Asia/Phnom_Penh', 'Live'),
(207, 'KI', 'Pacific/Tarawa', 'Live'),
(208, 'KI', 'Pacific/Enderbury', 'Live'),
(209, 'KI', 'Pacific/Kiritimati', 'Live'),
(210, 'KM', 'Indian/Comoro', 'Live'),
(211, 'KN', 'America/St_Kitts', 'Live'),
(212, 'KP', 'Asia/Pyongyang', 'Live'),
(213, 'KR', 'Asia/Seoul', 'Live'),
(214, 'KW', 'Asia/Kuwait', 'Live'),
(215, 'KY', 'America/Cayman', 'Live'),
(216, 'KZ', 'Asia/Almaty', 'Live'),
(217, 'KZ', 'Asia/Qyzylorda', 'Live'),
(218, 'KZ', 'Asia/Aqtobe', 'Live'),
(219, 'KZ', 'Asia/Aqtau', 'Live'),
(220, 'KZ', 'Asia/Atyrau', 'Live'),
(221, 'KZ', 'Asia/Oral', 'Live'),
(222, 'LA', 'Asia/Vientiane', 'Live'),
(223, 'LB', 'Asia/Beirut', 'Live'),
(224, 'LC', 'America/St_Lucia', 'Live'),
(225, 'LI', 'Europe/Vaduz', 'Live'),
(226, 'LK', 'Asia/Colombo', 'Live'),
(227, 'LR', 'Africa/Monrovia', 'Live'),
(228, 'LS', 'Africa/Maseru', 'Live'),
(229, 'LT', 'Europe/Vilnius', 'Live'),
(230, 'LU', 'Europe/Luxembourg', 'Live'),
(231, 'LV', 'Europe/Riga', 'Live'),
(232, 'LY', 'Africa/Tripoli', 'Live'),
(233, 'MA', 'Africa/Casablanca', 'Live'),
(234, 'MC', 'Europe/Monaco', 'Live'),
(235, 'MD', 'Europe/Chisinau', 'Live'),
(236, 'ME', 'Europe/Podgorica', 'Live'),
(237, 'MF', 'America/Marigot', 'Live'),
(238, 'MG', 'Indian/Antananarivo', 'Live'),
(239, 'MH', 'Pacific/Majuro', 'Live'),
(240, 'MH', 'Pacific/Kwajalein', 'Live'),
(241, 'MK', 'Europe/Skopje', 'Live'),
(242, 'ML', 'Africa/Bamako', 'Live'),
(243, 'MM', 'Asia/Yangon', 'Live'),
(244, 'MN', 'Asia/Ulaanbaatar', 'Live'),
(245, 'MN', 'Asia/Hovd', 'Live'),
(246, 'MN', 'Asia/Choibalsan', 'Live'),
(247, 'MO', 'Asia/Macau', 'Live'),
(248, 'MP', 'Pacific/Saipan', 'Live'),
(249, 'MQ', 'America/Martinique', 'Live'),
(250, 'MR', 'Africa/Nouakchott', 'Live'),
(251, 'MS', 'America/Montserrat', 'Live'),
(252, 'MT', 'Europe/Malta', 'Live'),
(253, 'MU', 'Indian/Mauritius', 'Live'),
(254, 'MV', 'Indian/Maldives', 'Live'),
(255, 'MW', 'Africa/Blantyre', 'Live'),
(256, 'MX', 'America/Mexico_City', 'Live'),
(257, 'MX', 'America/Cancun', 'Live'),
(258, 'MX', 'America/Merida', 'Live'),
(259, 'MX', 'America/Monterrey', 'Live'),
(260, 'MX', 'America/Matamoros', 'Live'),
(261, 'MX', 'America/Mazatlan', 'Live'),
(262, 'MX', 'America/Chihuahua', 'Live'),
(263, 'MX', 'America/Ojinaga', 'Live'),
(264, 'MX', 'America/Hermosillo', 'Live'),
(265, 'MX', 'America/Tijuana', 'Live'),
(266, 'MX', 'America/Bahia_Banderas', 'Live'),
(267, 'MY', 'Asia/Kuala_Lumpur', 'Live'),
(268, 'MY', 'Asia/Kuching', 'Live'),
(269, 'MZ', 'Africa/Maputo', 'Live'),
(270, 'NA', 'Africa/Windhoek', 'Live'),
(271, 'NC', 'Pacific/Noumea', 'Live'),
(272, 'NE', 'Africa/Niamey', 'Live'),
(273, 'NF', 'Pacific/Norfolk', 'Live'),
(274, 'NG', 'Africa/Lagos', 'Live'),
(275, 'NI', 'America/Managua', 'Live'),
(276, 'NL', 'Europe/Amsterdam', 'Live'),
(277, 'NO', 'Europe/Oslo', 'Live'),
(278, 'NP', 'Asia/Kathmandu', 'Live'),
(279, 'NR', 'Pacific/Nauru', 'Live'),
(280, 'NU', 'Pacific/Niue', 'Live'),
(281, 'NZ', 'Pacific/Auckland', 'Live'),
(282, 'NZ', 'Pacific/Chatham', 'Live'),
(283, 'OM', 'Asia/Muscat', 'Live'),
(284, 'PA', 'America/Panama', 'Live'),
(285, 'PE', 'America/Lima', 'Live'),
(286, 'PF', 'Pacific/Tahiti', 'Live'),
(287, 'PF', 'Pacific/Marquesas', 'Live'),
(288, 'PF', 'Pacific/Gambier', 'Live'),
(289, 'PG', 'Pacific/Port_Moresby', 'Live'),
(290, 'PG', 'Pacific/Bougainville', 'Live'),
(291, 'PH', 'Asia/Manila', 'Live'),
(292, 'PK', 'Asia/Karachi', 'Live'),
(293, 'PL', 'Europe/Warsaw', 'Live'),
(294, 'PM', 'America/Miquelon', 'Live'),
(295, 'PN', 'Pacific/Pitcairn', 'Live'),
(296, 'PR', 'America/Puerto_Rico', 'Live'),
(297, 'PS', 'Asia/Gaza', 'Live'),
(298, 'PS', 'Asia/Hebron', 'Live'),
(299, 'PT', 'Europe/Lisbon', 'Live'),
(300, 'PT', 'Atlantic/Madeira', 'Live'),
(301, 'PT', 'Atlantic/Azores', 'Live'),
(302, 'PW', 'Pacific/Palau', 'Live'),
(303, 'PY', 'America/Asuncion', 'Live'),
(304, 'QA', 'Asia/Qatar', 'Live'),
(305, 'RE', 'Indian/Reunion', 'Live'),
(306, 'RO', 'Europe/Bucharest', 'Live'),
(307, 'RS', 'Europe/Belgrade', 'Live'),
(308, 'RU', 'Europe/Kaliningrad', 'Live'),
(309, 'RU', 'Europe/Moscow', 'Live'),
(310, 'RU', 'Europe/Simferopol', 'Live'),
(311, 'RU', 'Europe/Volgograd', 'Live'),
(312, 'RU', 'Europe/Kirov', 'Live'),
(313, 'RU', 'Europe/Astrakhan', 'Live'),
(314, 'RU', 'Europe/Saratov', 'Live'),
(315, 'RU', 'Europe/Ulyanovsk', 'Live'),
(316, 'RU', 'Europe/Samara', 'Live'),
(317, 'RU', 'Asia/Yekaterinburg', 'Live'),
(318, 'RU', 'Asia/Omsk', 'Live'),
(319, 'RU', 'Asia/Novosibirsk', 'Live'),
(320, 'RU', 'Asia/Barnaul', 'Live'),
(321, 'RU', 'Asia/Tomsk', 'Live'),
(322, 'RU', 'Asia/Novokuznetsk', 'Live'),
(323, 'RU', 'Asia/Krasnoyarsk', 'Live'),
(324, 'RU', 'Asia/Irkutsk', 'Live'),
(325, 'RU', 'Asia/Chita', 'Live'),
(326, 'RU', 'Asia/Yakutsk', 'Live'),
(327, 'RU', 'Asia/Khandyga', 'Live'),
(328, 'RU', 'Asia/Vladivostok', 'Live'),
(329, 'RU', 'Asia/Ust-Nera', 'Live'),
(330, 'RU', 'Asia/Magadan', 'Live'),
(331, 'RU', 'Asia/Sakhalin', 'Live'),
(332, 'RU', 'Asia/Srednekolymsk', 'Live'),
(333, 'RU', 'Asia/Kamchatka', 'Live'),
(334, 'RU', 'Asia/Anadyr', 'Live'),
(335, 'RW', 'Africa/Kigali', 'Live'),
(336, 'SA', 'Asia/Riyadh', 'Live'),
(337, 'SB', 'Pacific/Guadalcanal', 'Live'),
(338, 'SC', 'Indian/Mahe', 'Live'),
(339, 'SD', 'Africa/Khartoum', 'Live'),
(340, 'SE', 'Europe/Stockholm', 'Live'),
(341, 'SG', 'Asia/Singapore', 'Live'),
(342, 'SH', 'Atlantic/St_Helena', 'Live'),
(343, 'SI', 'Europe/Ljubljana', 'Live'),
(344, 'SJ', 'Arctic/Longyearbyen', 'Live'),
(345, 'SK', 'Europe/Bratislava', 'Live'),
(346, 'SL', 'Africa/Freetown', 'Live'),
(347, 'SM', 'Europe/San_Marino', 'Live'),
(348, 'SN', 'Africa/Dakar', 'Live'),
(349, 'SO', 'Africa/Mogadishu', 'Live'),
(350, 'SR', 'America/Paramaribo', 'Live'),
(351, 'SS', 'Africa/Juba', 'Live'),
(352, 'ST', 'Africa/Sao_Tome', 'Live'),
(353, 'SV', 'America/El_Salvador', 'Live'),
(354, 'SX', 'America/Lower_Princes', 'Live'),
(355, 'SY', 'Asia/Damascus', 'Live'),
(356, 'SZ', 'Africa/Mbabane', 'Live'),
(357, 'TC', 'America/Grand_Turk', 'Live'),
(358, 'TD', 'Africa/Ndjamena', 'Live'),
(359, 'TF', 'Indian/Kerguelen', 'Live'),
(360, 'TG', 'Africa/Lome', 'Live'),
(361, 'TH', 'Asia/Bangkok', 'Live'),
(362, 'TJ', 'Asia/Dushanbe', 'Live'),
(363, 'TK', 'Pacific/Fakaofo', 'Live'),
(364, 'TL', 'Asia/Dili', 'Live'),
(365, 'TM', 'Asia/Ashgabat', 'Live'),
(366, 'TN', 'Africa/Tunis', 'Live'),
(367, 'TO', 'Pacific/Tongatapu', 'Live'),
(368, 'TR', 'Europe/Istanbul', 'Live'),
(369, 'TT', 'America/Port_of_Spain', 'Live'),
(370, 'TV', 'Pacific/Funafuti', 'Live'),
(371, 'TW', 'Asia/Taipei', 'Live'),
(372, 'TZ', 'Africa/Dar_es_Salaam', 'Live'),
(373, 'UA', 'Europe/Kiev', 'Live'),
(374, 'UA', 'Europe/Uzhgorod', 'Live'),
(375, 'UA', 'Europe/Zaporozhye', 'Live'),
(376, 'UG', 'Africa/Kampala', 'Live'),
(377, 'UM', 'Pacific/Midway', 'Live'),
(378, 'UM', 'Pacific/Wake', 'Live'),
(379, 'US', 'America/New_York', 'Live'),
(380, 'US', 'America/Detroit', 'Live'),
(381, 'US', 'America/Kentucky/Louisville', 'Live'),
(382, 'US', 'America/Kentucky/Monticello', 'Live'),
(383, 'US', 'America/Indiana/Indianapolis', 'Live'),
(384, 'US', 'America/Indiana/Vincennes', 'Live'),
(385, 'US', 'America/Indiana/Winamac', 'Live'),
(386, 'US', 'America/Indiana/Marengo', 'Live'),
(387, 'US', 'America/Indiana/Petersburg', 'Live'),
(388, 'US', 'America/Indiana/Vevay', 'Live'),
(389, 'US', 'America/Chicago', 'Live'),
(390, 'US', 'America/Indiana/Tell_City', 'Live'),
(391, 'US', 'America/Indiana/Knox', 'Live'),
(392, 'US', 'America/Menominee', 'Live'),
(393, 'US', 'America/North_Dakota/Center', 'Live'),
(394, 'US', 'America/North_Dakota/New_Salem', 'Live'),
(395, 'US', 'America/North_Dakota/Beulah', 'Live'),
(396, 'US', 'America/Denver', 'Live'),
(397, 'US', 'America/Boise', 'Live'),
(398, 'US', 'America/Phoenix', 'Live'),
(399, 'US', 'America/Los_Angeles', 'Live'),
(400, 'US', 'America/Anchorage', 'Live'),
(401, 'US', 'America/Juneau', 'Live'),
(402, 'US', 'America/Sitka', 'Live'),
(403, 'US', 'America/Metlakatla', 'Live'),
(404, 'US', 'America/Yakutat', 'Live'),
(405, 'US', 'America/Nome', 'Live'),
(406, 'US', 'America/Adak', 'Live'),
(407, 'US', 'Pacific/Honolulu', 'Live'),
(408, 'UY', 'America/Montevideo', 'Live'),
(409, 'UZ', 'Asia/Samarkand', 'Live'),
(410, 'UZ', 'Asia/Tashkent', 'Live'),
(411, 'VA', 'Europe/Vatican', 'Live'),
(412, 'VC', 'America/St_Vincent', 'Live'),
(413, 'VE', 'America/Caracas', 'Live'),
(414, 'VG', 'America/Tortola', 'Live'),
(415, 'VI', 'America/St_Thomas', 'Live'),
(416, 'VN', 'Asia/Ho_Chi_Minh', 'Live'),
(417, 'VU', 'Pacific/Efate', 'Live'),
(418, 'WF', 'Pacific/Wallis', 'Live'),
(419, 'WS', 'Pacific/Apia', 'Live'),
(420, 'YE', 'Asia/Aden', 'Live'),
(421, 'YT', 'Indian/Mayotte', 'Live'),
(422, 'ZA', 'Africa/Johannesburg', 'Live'),
(423, 'ZM', 'Africa/Lusaka', 'Live'),
(424, 'ZW', 'Africa/Harare', 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_units`
--

CREATE TABLE `tbl_units` (
  `id` int NOT NULL,
  `unit_name` varchar(10) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int DEFAULT NULL COMMENT '1. Admin 2. Staff',
  `permission_role` int DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` float DEFAULT NULL,
  `company_id` int NOT NULL DEFAULT '1',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Inactive',
  `is_first_login` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Live',
  `language` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `name`, `designation`, `role`, `permission_role`, `email`, `password`, `remember_token`, `email_verified_at`, `phone_number`, `type`, `salary`, `company_id`, `photo`, `question`, `answer`, `status`, `is_first_login`, `created_at`, `updated_at`, `del_status`, `language`, `table_id`) VALUES
(1, 'Admin', 'Super Admin', NULL, NULL, 'admin@doorsoft.co', '$2y$10$UQyvhZtMxC5zQrFgyb.Tjes5tyyt2CB3znoZ2CJb3gveyGWxRkMxe', NULL, NULL, '01812391633', 'Admin', NULL, 1, '1724527113_man (4) (1).png', 'What is the name of the town you were born?', 'Dhaka', 'Active', 0, '2020-08-05 04:18:53', '2024-10-09 09:28:06', 'Live', 'en', NULL),
(2, 'Kylee Ayala', 'Aut non distinctio', 2, 1, 'lodim@mailinator.com', '$2y$10$wGManFXh5GiVw9Uuy1xQRudYIhzL9oJssg4crOluqbcSupxzagY9O', NULL, NULL, '+1 (538) 255-5346', 'User', 100, 1, NULL, NULL, NULL, 'Active', 1, '2025-03-22 02:16:09', '2025-03-22 02:56:46', 'Live', NULL, 2),
(3, 'Garth Durham', 'Id excepturi et sed', 2, 1, 'bywod@mailinator.com', '$2y$10$csVexjPpYjehw2WDAOSKq.bFEmJmpq1s4G2WWZVKwkkrBBm23K.oK', NULL, NULL, '+1 (216) 662-7201', 'User', 1000, 1, NULL, NULL, NULL, 'Active', 1, '2025-03-22 02:16:26', '2025-03-22 02:56:31', 'Live', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users_old`
--

CREATE TABLE `tbl_users_old` (
  `id` int NOT NULL,
  `full_name` varchar(25) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `will_login` varchar(20) NOT NULL DEFAULT 'No',
  `role` varchar(25) NOT NULL,
  `company_id` int NOT NULL,
  `account_creation_date` datetime NOT NULL,
  `language` varchar(100) NOT NULL DEFAULT 'english',
  `last_login` datetime NOT NULL,
  `active_status` varchar(25) NOT NULL DEFAULT 'Active',
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_access`
--

CREATE TABLE `tbl_user_access` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `access_parent_id` int DEFAULT NULL,
  `access_child_id` int DEFAULT NULL,
  `del_status` varchar(11) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_menu_access`
--

CREATE TABLE `tbl_user_menu_access` (
  `id` int NOT NULL,
  `menu_id` int DEFAULT '0',
  `user_id` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wastes`
--

CREATE TABLE `tbl_wastes` (
  `id` int NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `responsible_person` int DEFAULT NULL,
  `total_loss` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `added_by` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waste_materials`
--

CREATE TABLE `tbl_waste_materials` (
  `id` int NOT NULL,
  `rmaterials_id` int DEFAULT NULL,
  `waste_amount` float(10,2) DEFAULT NULL,
  `last_purchase_price` float(10,2) DEFAULT NULL,
  `loss_amount` float(10,2) DEFAULT NULL,
  `waste_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `manufacture_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_white_label_settings`
--

CREATE TABLE `tbl_white_label_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `site_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mini_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Live',
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_white_label_settings`
--

INSERT INTO `tbl_white_label_settings` (`id`, `site_title`, `logo`, `mini_logo`, `favicon`, `footer`, `company_name`, `company_website`, `created_at`, `del_status`, `updated_at`) VALUES
(1, 'iProduction - Production & Manufacture Management Software', 'logo.png', 'mini_logo.png', 'favicon.ico', 'WhiteProduction - Production & Manufacture Management Software', 'Whitevue', 'https://whitevue.com', NULL, 'Live', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_withdraw_deposits`
--

CREATE TABLE `tbl_withdraw_deposits` (
  `id` int NOT NULL,
  `reference_no` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `account` int DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daily_table_history`
--
ALTER TABLE `daily_table_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `production_tables`
--
ALTER TABLE `production_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_admin_settings`
--
ALTER TABLE `tbl_admin_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_admin_user_menus`
--
ALTER TABLE `tbl_admin_user_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_attachments`
--
ALTER TABLE `tbl_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_companies`
--
ALTER TABLE `tbl_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_currency`
--
ALTER TABLE `tbl_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer_due_receives`
--
ALTER TABLE `tbl_customer_due_receives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer_orders`
--
ALTER TABLE `tbl_customer_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer_order_deliveries`
--
ALTER TABLE `tbl_customer_order_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer_order_details`
--
ALTER TABLE `tbl_customer_order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer_order_invoices`
--
ALTER TABLE `tbl_customer_order_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_deposits`
--
ALTER TABLE `tbl_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_expense_items`
--
ALTER TABLE `tbl_expense_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_finished_products_noninventory`
--
ALTER TABLE `tbl_finished_products_noninventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_finished_products_productionstage`
--
ALTER TABLE `tbl_finished_products_productionstage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_finished_products_rmaterials`
--
ALTER TABLE `tbl_finished_products_rmaterials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_finish_products`
--
ALTER TABLE `tbl_finish_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_fnunits`
--
ALTER TABLE `tbl_fnunits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_fpcategory`
--
ALTER TABLE `tbl_fpcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_fpwastes`
--
ALTER TABLE `tbl_fpwastes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_fpwastes_fp`
--
ALTER TABLE `tbl_fpwastes_fp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_mail_settings`
--
ALTER TABLE `tbl_mail_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_main_modules`
--
ALTER TABLE `tbl_main_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_manufactures`
--
ALTER TABLE `tbl_manufactures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_manufactures_noninventory`
--
ALTER TABLE `tbl_manufactures_noninventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_manufactures_rmaterials`
--
ALTER TABLE `tbl_manufactures_rmaterials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_manufactures_stages`
--
ALTER TABLE `tbl_manufactures_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_manufacture_product`
--
ALTER TABLE `tbl_manufacture_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_menus`
--
ALTER TABLE `tbl_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_menu_activities`
--
ALTER TABLE `tbl_menu_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_non_inventory_items`
--
ALTER TABLE `tbl_non_inventory_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_payment_settings`
--
ALTER TABLE `tbl_payment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_productions`
--
ALTER TABLE `tbl_productions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_production_history`
--
ALTER TABLE `tbl_production_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_order_id` (`work_order_id`);

--
-- Indexes for table `tbl_production_noninventory`
--
ALTER TABLE `tbl_production_noninventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_production_rmaterials`
--
ALTER TABLE `tbl_production_rmaterials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_production_scheduling`
--
ALTER TABLE `tbl_production_scheduling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_production_stages`
--
ALTER TABLE `tbl_production_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_products_services`
--
ALTER TABLE `tbl_products_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_proposal_invoice`
--
ALTER TABLE `tbl_proposal_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_proposal_invoice_products_services`
--
ALTER TABLE `tbl_proposal_invoice_products_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_proposal_pdf`
--
ALTER TABLE `tbl_proposal_pdf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_proposal_photo`
--
ALTER TABLE `tbl_proposal_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_purchase_return`
--
ALTER TABLE `tbl_purchase_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_purchase_return_details`
--
ALTER TABLE `tbl_purchase_return_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_purchase_rmaterials`
--
ALTER TABLE `tbl_purchase_rmaterials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_quotations`
--
ALTER TABLE `tbl_quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_quotation_details`
--
ALTER TABLE `tbl_quotation_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_rawmaterials`
--
ALTER TABLE `tbl_rawmaterials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_rmcategory`
--
ALTER TABLE `tbl_rmcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_rmunits`
--
ALTER TABLE `tbl_rmunits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_role_permissions`
--
ALTER TABLE `tbl_role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_salaries`
--
ALTER TABLE `tbl_salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sale_consumptions_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sale_consumptions_of_modifiers_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_modifiers_of_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sale_details`
--
ALTER TABLE `tbl_sale_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sessions`
--
ALTER TABLE `tbl_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `tbl_stock_adjust_logs`
--
ALTER TABLE `tbl_stock_adjust_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_supplier_payments`
--
ALTER TABLE `tbl_supplier_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_taxes`
--
ALTER TABLE `tbl_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_tax_items`
--
ALTER TABLE `tbl_tax_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_time_zone`
--
ALTER TABLE `tbl_time_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_units`
--
ALTER TABLE `tbl_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tbl_admins_email_unique` (`email`),
  ADD UNIQUE KEY `tbl_admins_phone_number_unique` (`phone_number`),
  ADD KEY `tbl_users_table_id_foreign` (`table_id`);

--
-- Indexes for table `tbl_users_old`
--
ALTER TABLE `tbl_users_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_access`
--
ALTER TABLE `tbl_user_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_menu_access`
--
ALTER TABLE `tbl_user_menu_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_wastes`
--
ALTER TABLE `tbl_wastes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_waste_materials`
--
ALTER TABLE `tbl_waste_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_white_label_settings`
--
ALTER TABLE `tbl_white_label_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_withdraw_deposits`
--
ALTER TABLE `tbl_withdraw_deposits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daily_table_history`
--
ALTER TABLE `daily_table_history`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `production_tables`
--
ALTER TABLE `production_tables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_admin_settings`
--
ALTER TABLE `tbl_admin_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_admin_user_menus`
--
ALTER TABLE `tbl_admin_user_menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_attachments`
--
ALTER TABLE `tbl_attachments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_companies`
--
ALTER TABLE `tbl_companies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_customer_due_receives`
--
ALTER TABLE `tbl_customer_due_receives`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_customer_orders`
--
ALTER TABLE `tbl_customer_orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_customer_order_deliveries`
--
ALTER TABLE `tbl_customer_order_deliveries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_customer_order_details`
--
ALTER TABLE `tbl_customer_order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_customer_order_invoices`
--
ALTER TABLE `tbl_customer_order_invoices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_deposits`
--
ALTER TABLE `tbl_deposits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_expense_items`
--
ALTER TABLE `tbl_expense_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_finished_products_noninventory`
--
ALTER TABLE `tbl_finished_products_noninventory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_finished_products_productionstage`
--
ALTER TABLE `tbl_finished_products_productionstage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_finished_products_rmaterials`
--
ALTER TABLE `tbl_finished_products_rmaterials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_finish_products`
--
ALTER TABLE `tbl_finish_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_fnunits`
--
ALTER TABLE `tbl_fnunits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_fpcategory`
--
ALTER TABLE `tbl_fpcategory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_fpwastes`
--
ALTER TABLE `tbl_fpwastes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_fpwastes_fp`
--
ALTER TABLE `tbl_fpwastes_fp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_mail_settings`
--
ALTER TABLE `tbl_mail_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_main_modules`
--
ALTER TABLE `tbl_main_modules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_manufactures`
--
ALTER TABLE `tbl_manufactures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_manufactures_noninventory`
--
ALTER TABLE `tbl_manufactures_noninventory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_manufactures_rmaterials`
--
ALTER TABLE `tbl_manufactures_rmaterials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_manufactures_stages`
--
ALTER TABLE `tbl_manufactures_stages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_manufacture_product`
--
ALTER TABLE `tbl_manufacture_product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_menus`
--
ALTER TABLE `tbl_menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_menu_activities`
--
ALTER TABLE `tbl_menu_activities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `tbl_non_inventory_items`
--
ALTER TABLE `tbl_non_inventory_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_payment_settings`
--
ALTER TABLE `tbl_payment_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_productions`
--
ALTER TABLE `tbl_productions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_production_history`
--
ALTER TABLE `tbl_production_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_production_noninventory`
--
ALTER TABLE `tbl_production_noninventory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_production_rmaterials`
--
ALTER TABLE `tbl_production_rmaterials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_production_scheduling`
--
ALTER TABLE `tbl_production_scheduling`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_production_stages`
--
ALTER TABLE `tbl_production_stages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_products_services`
--
ALTER TABLE `tbl_products_services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_proposal_invoice`
--
ALTER TABLE `tbl_proposal_invoice`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_proposal_invoice_products_services`
--
ALTER TABLE `tbl_proposal_invoice_products_services`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_proposal_pdf`
--
ALTER TABLE `tbl_proposal_pdf`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_proposal_photo`
--
ALTER TABLE `tbl_proposal_photo`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_purchase_return`
--
ALTER TABLE `tbl_purchase_return`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_purchase_return_details`
--
ALTER TABLE `tbl_purchase_return_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_purchase_rmaterials`
--
ALTER TABLE `tbl_purchase_rmaterials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_quotations`
--
ALTER TABLE `tbl_quotations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_quotation_details`
--
ALTER TABLE `tbl_quotation_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_rawmaterials`
--
ALTER TABLE `tbl_rawmaterials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_rmcategory`
--
ALTER TABLE `tbl_rmcategory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_rmunits`
--
ALTER TABLE `tbl_rmunits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_role_permissions`
--
ALTER TABLE `tbl_role_permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `tbl_salaries`
--
ALTER TABLE `tbl_salaries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sale_consumptions_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_menus`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sale_consumptions_of_modifiers_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_modifiers_of_menus`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sale_details`
--
ALTER TABLE `tbl_sale_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_stock_adjust_logs`
--
ALTER TABLE `tbl_stock_adjust_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_supplier_payments`
--
ALTER TABLE `tbl_supplier_payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_taxes`
--
ALTER TABLE `tbl_taxes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_tax_items`
--
ALTER TABLE `tbl_tax_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_units`
--
ALTER TABLE `tbl_units`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_users_old`
--
ALTER TABLE `tbl_users_old`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user_access`
--
ALTER TABLE `tbl_user_access`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_wastes`
--
ALTER TABLE `tbl_wastes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_waste_materials`
--
ALTER TABLE `tbl_waste_materials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_white_label_settings`
--
ALTER TABLE `tbl_white_label_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_withdraw_deposits`
--
ALTER TABLE `tbl_withdraw_deposits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_production_history`
--
ALTER TABLE `tbl_production_history`
  ADD CONSTRAINT `tbl_production_history_ibfk_1` FOREIGN KEY (`work_order_id`) REFERENCES `tbl_customer_orders` (`id`);

--
-- Constraints for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD CONSTRAINT `tbl_users_table_id_foreign` FOREIGN KEY (`table_id`) REFERENCES `production_tables` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
