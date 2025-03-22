


CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tbl_accounts` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `opening_balance` float(10,2) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_admin_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_company_name` varchar(255) NOT NULL,
  `contact_person` varchar(200) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `base_color` varchar(50) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `first_section_image` varchar(255) DEFAULT NULL,
  `footer` text DEFAULT NULL,
  `date_format` varchar(255) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `currency_position` varchar(10) DEFAULT 'Before',
  `precision` varchar(10) DEFAULT NULL,
  `decimals_separator` varchar(20) DEFAULT NULL,
  `thousands_separator` varchar(20) DEFAULT NULL,
  `time_zone` varchar(255) NOT NULL,
  `web_site` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live',
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tbl_admin_settings` (`id`, `name_company_name`, `contact_person`, `phone`, `email`, `address`, `logo`, `base_color`, `favicon`, `first_section_image`, `footer`, `date_format`, `currency`, `currency_position`, `precision`, `decimals_separator`, `thousands_separator`, `time_zone`, `web_site`, `created_at`, `del_status`, `updated_at`) VALUES
(1, 'Door Soft', 'Nazmul Hasan', '+8801812391633', 'info@doorsoft.co', 'House: 18, Road: 6, Nikunja 2, Khilkhet, Dhaka.', '', '#6ab04c', '1597255952_favicon.ico', 'a1e38ee1494380b96242260c6e1cc2b2.png', 'Developed by Whitevue', 'd/m/Y', '$', 'Before', '2', '.', ',', 'Asia/Dhaka', 'https://doorsoft.co', '2020-08-05 09:48:53', 'Live', '2024-09-23 12:57:03');

CREATE TABLE `tbl_admin_user_menus` (
  `id` int(11) NOT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `controller_name` varchar(50) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_attachments` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


CREATE TABLE `tbl_attendance` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live',
  `is_closed` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tbl_companies` (
  `id` int(11) NOT NULL,
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
  `is_white_label_change_able` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `tbl_companies` (`id`, `company_name`, `contact_person`, `phone`, `email`, `website`, `address`, `currency`, `timezone`, `date_format`, `logo`, `system_featured_photo`, `is_white_label_change_able`) VALUES
(1, 'Door Soft', 'Nazmul Hasan', '+8801812391633', 'info@doorsoft.co', 'https://doorsoft.co', 'House: 18, Road: 6, Nikunja 2, Khilkhet, Dhaka.', '$', 'Asia/Dhaka', 'd/m/Y', '', NULL, 1);

CREATE TABLE `tbl_customers` (
  `id` int(11) NOT NULL,
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
  `company_id` int(11) DEFAULT NULL,
  `photo` varchar(150) DEFAULT NULL,
  `date_of_anniversary` varchar(30) DEFAULT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_customer_due_receives` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `only_date` date DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `due_date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tbl_customer_orders` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_type` varchar(50) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `order_status` tinyint(4) DEFAULT 0,
  `total_product` int(11) DEFAULT NULL,
  `total_amount` float(10,2) DEFAULT NULL,
  `total_cost` float(10,2) DEFAULT NULL,
  `total_profit` float(10,2) DEFAULT NULL,
  `quotation_note` text DEFAULT NULL,
  `internal_note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_customer_order_deliveries` (
  `id` int(11) NOT NULL,
  `customer_order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_note` varchar(255) DEFAULT NULL,
  `delivery_status` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_customer_order_details` (
  `id` int(11) NOT NULL,
  `customer_order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `discount_percent` float(10,2) DEFAULT NULL,
  `sub_total` float(10,2) DEFAULT NULL,
  `total_cost` float(10,2) DEFAULT NULL,
  `profit` float(10,2) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `production_status` varchar(50) DEFAULT NULL,
  `delivered_qty` int(11) DEFAULT NULL,
  `last_update_date` timestamp NULL DEFAULT current_timestamp(),
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_customer_order_invoices` (
  `id` int(11) NOT NULL,
  `customer_order_id` int(11) DEFAULT NULL,
  `invoice_type` varchar(50) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `paid_amount` float(10,2) DEFAULT NULL,
  `due_amount` float(10,2) DEFAULT NULL,
  `order_due_amount` float(10,2) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_deposits` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `type` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `account_id` int(11) NOT NULL DEFAULT 1,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT 0,
  `del_status` varchar(11) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_expenses` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT 0,
  `added_date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_expense_items` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_finished_products_noninventory` (
  `id` int(11) NOT NULL,
  `noninvemtory_id` int(11) DEFAULT NULL,
  `finish_product_id` int(11) DEFAULT NULL,
  `nin_cost` float(10,2) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_finished_products_productionstage` (
  `id` int(11) NOT NULL,
  `productionstage_id` int(11) DEFAULT NULL,
  `finish_product_id` int(11) DEFAULT NULL,
  `stage_month` int(11) DEFAULT NULL,
  `stage_day` int(11) DEFAULT NULL,
  `stage_hours` int(11) DEFAULT NULL,
  `stage_minute` int(11) DEFAULT NULL,
  `required_time` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_finished_products_rmaterials` (
  `id` int(11) NOT NULL,
  `rmaterials_id` int(11) DEFAULT NULL,
  `finish_product_id` int(11) DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `total_cost` float(10,2) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_finish_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `stock_method` varchar(50) DEFAULT NULL,
  `unit` varchar(40) DEFAULT NULL,
  `rmcost_total` float(10,2) DEFAULT NULL,
  `noninitem_total` float(10,2) DEFAULT NULL,
  `total_cost` float(10,2) DEFAULT NULL,
  `profit_margin` float NOT NULL,
  `sale_price` float(10,2) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL,
  `tax_information` text DEFAULT NULL,
  `current_total_stock` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_fnunits` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_fpcategory` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_fpwastes` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `responsible_person` int(11) DEFAULT NULL,
  `total_loss` float(10,2) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `last_production_cost` int(11) DEFAULT NULL,
  `manufacture_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_fpwastes_fp` (
  `id` int(11) NOT NULL,
  `finish_product_id` int(11) DEFAULT NULL,
  `manufacture_id` int(11) DEFAULT NULL,
  `fp_waste_amount` decimal(11,0) DEFAULT NULL,
  `last_production_cost` decimal(11,0) DEFAULT NULL,
  `last_purchase_price` decimal(11,0) DEFAULT NULL,
  `loss_amount` decimal(11,0) DEFAULT NULL,
  `fpwaste_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_mail_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mail_driver` varchar(50) DEFAULT NULL,
  `mail_host` varchar(100) DEFAULT NULL,
  `mail_port` smallint(6) DEFAULT NULL,
  `mail_encryption` varchar(50) DEFAULT NULL,
  `mail_username` varchar(100) DEFAULT NULL,
  `mail_password` varchar(100) DEFAULT NULL,
  `mail_from` varchar(100) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_by` smallint(6) DEFAULT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tbl_mail_settings` (`id`, `mail_driver`, `mail_host`, `mail_port`, `mail_encryption`, `mail_username`, `mail_password`, `mail_from`, `from_name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'smtp', '*********', 000, 'tls', '*********', '*********', '*********', '*********', NULL, NULL, NULL, '2024-07-23 11:37:18', '2024-07-23 11:37:18');

CREATE TABLE `tbl_main_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `del_status` varchar(15) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_manufactures` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `manufacture_type` varchar(50) DEFAULT NULL,
  `manufacture_status` varchar(50) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `stock_method` varchar(20) DEFAULT NULL,
  `stage_name` varchar(20) DEFAULT NULL,
  `product_quantity` float DEFAULT NULL,
  `batch_no` varchar(50) DEFAULT NULL,
  `stage_counter` int(11) NOT NULL DEFAULT 0,
  `consumed_time` varchar(50) DEFAULT NULL,
  `expiry_days` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `complete_date` varchar(255) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `mrmcost_total` float DEFAULT NULL,
  `mnoninitem_total` float DEFAULT NULL,
  `mtotal_cost` float DEFAULT NULL,
  `mprofit_margin` float DEFAULT NULL,
  `msale_price` float DEFAULT NULL,
  `tax_information` text DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `file` text DEFAULT NULL,
  `partially_done_quantity` int(9) DEFAULT 0,
  `production_loss` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_manufactures_noninventory` (
  `id` int(11) NOT NULL,
  `noninvemtory_id` int(11) DEFAULT NULL,
  `manufacture_id` int(11) DEFAULT NULL,
  `nin_cost` float(10,2) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_manufactures_rmaterials` (
  `id` int(11) NOT NULL,
  `rmaterials_id` int(11) DEFAULT NULL,
  `manufacture_id` int(11) DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `total_cost` float(10,2) DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_manufactures_stages` (
  `id` int(11) NOT NULL,
  `productionstage_id` int(11) DEFAULT NULL,
  `manufacture_id` int(11) DEFAULT NULL,
  `stage_check` int(11) DEFAULT NULL,
  `stage_month` int(11) DEFAULT NULL,
  `stage_day` int(11) DEFAULT NULL,
  `stage_hours` int(11) DEFAULT NULL,
  `stage_minute` int(11) DEFAULT NULL,
  `required_time` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_manufacture_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `manufacture_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'fefo, batch_control',
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `del_status` varchar(50) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `tbl_menu_activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(11) NOT NULL,
  `activity_name` varchar(191) NOT NULL,
  `route_name` varchar(191) NOT NULL,
  `is_dependant` varchar(191) NOT NULL DEFAULT 'No',
  `auto_select` varchar(191) NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `tbl_non_inventory_items` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `row_id` int(11) NOT NULL,
  `created_by` varchar(6) NOT NULL,
  `created_for` varchar(6) NOT NULL,
  `updated_by` varchar(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `is_read_doctor` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tbl_payment_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `method` varchar(255) NOT NULL,
  `type` enum('live','sandbox') NOT NULL DEFAULT 'sandbox',
  `app_username` text DEFAULT NULL,
  `app_password` text DEFAULT NULL,
  `app_secret_key` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(20) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tbl_productions` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `production_stage` int(11) DEFAULT NULL,
  `production_stage_text` varchar(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `finished_product` int(11) DEFAULT NULL,
  `quantity` float(10,2) DEFAULT NULL,
  `rmcost_total` float(10,2) DEFAULT NULL,
  `noninitem_total` float(10,2) DEFAULT NULL,
  `total_cost` float(10,2) DEFAULT NULL,
  `sale_price` float(10,2) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `file_paths` text DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_production_history` (
  `id` int(11) NOT NULL,
  `work_order_id` int(11) NOT NULL,
  `produced_quantity` int(11) NOT NULL,
  `produced_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `tbl_production_noninventory` (
  `id` int(11) NOT NULL,
  `production_id` int(11) DEFAULT NULL,
  `ni_id` int(11) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `total` float(10,2) DEFAULT NULL,
  `totalamount` float(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_production_rmaterials` (
  `id` int(11) NOT NULL,
  `production_id` int(11) DEFAULT NULL,
  `rm_id` int(11) DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `total` float(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;


CREATE TABLE `tbl_production_scheduling` (
  `id` int(9) NOT NULL,
  `manufacture_id` int(9) NOT NULL,
  `production_stage_id` int(9) NOT NULL,
  `task` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `del_status` varchar(191) NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_production_stages` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_products_services` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` varchar(50) DEFAULT 'Veg No',
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_proposal_invoice` (
  `id` bigint(20) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'Proposal/Invoice',
  `date` date NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
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
  `proposal_user_id` int(11) NOT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `proposal_id` bigint(20) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL COMMENT 'Paid/Unpaid',
  `invoice_user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_proposal_invoice_products_services` (
  `id` bigint(20) NOT NULL,
  `product_service_id` int(11) DEFAULT NULL,
  `quantity_amount` float DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `total` float NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `proposal_invoice_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_proposal_pdf` (
  `id` bigint(20) NOT NULL,
  `proposal_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_proposal_photo` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file` varchar(150) DEFAULT NULL,
  `proposal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_purchase` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `supplier` int(11) DEFAULT NULL,
  `date` varchar(15) NOT NULL,
  `subtotal` float(10,2) DEFAULT NULL,
  `other` float(10,2) DEFAULT NULL,
  `grand_total` float(10,2) DEFAULT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `paid` float(10,2) DEFAULT NULL,
  `due` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `file` text DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL COMMENT 'purchase, purchase_order',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_purchase_return` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(255) DEFAULT NULL,
  `pur_ref_no` varchar(255) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `purchase_date` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `return_status` varchar(100) DEFAULT NULL,
  `total_return_amount` float DEFAULT NULL,
  `payment_method_id` int(11) NOT NULL DEFAULT 1,
  `payment_method_type` varchar(255) DEFAULT NULL,
  `account_type` varchar(20) DEFAULT NULL,
  `note` varchar(300) DEFAULT NULL,
  `added_date` varchar(55) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT 0,
  `del_status` varchar(11) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_purchase_return_details` (
  `id` int(11) NOT NULL,
  `pur_return_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_type` varchar(50) DEFAULT NULL,
  `expiry_imei_serial` varchar(255) DEFAULT NULL,
  `return_note` text DEFAULT NULL,
  `return_quantity_amount` varchar(11) DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `return_status` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT 0,
  `del_status` varchar(11) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_purchase_rmaterials` (
  `id` int(11) NOT NULL,
  `rmaterials_id` int(11) DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `quantity_amount` float(10,2) DEFAULT NULL,
  `total` float(10,2) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_quotations` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `date` varchar(15) NOT NULL,
  `subtotal` float(10,2) DEFAULT NULL,
  `other` float(10,2) DEFAULT NULL,
  `grand_total` float(10,2) DEFAULT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `due` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `file` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_quotation_details` (
  `id` int(11) NOT NULL,
  `finishProduct_id` int(11) DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `quantity_amount` float(10,2) DEFAULT NULL,
  `total` float(10,2) DEFAULT NULL,
  `quotation_id` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_rawmaterials` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `consumption_unit` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `rate_per_unit` int(11) DEFAULT NULL,
  `consumption_check` int(11) DEFAULT 0,
  `conversion_rate` float(10,2) DEFAULT NULL,
  `rate_per_consumption_unit` float(10,2) DEFAULT NULL,
  `opening_stock` float DEFAULT NULL,
  `alert_level` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_rmcategory` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_rmstock_adjustment_rmaterials` (
  `id` int(11) NOT NULL,
  `rmaterials_id` int(11) DEFAULT NULL,
  `consumption_amount` float(10,2) DEFAULT NULL,
  `inventory_adjustment_id` int(11) DEFAULT NULL,
  `consumption_status` enum('Plus','Minus','','') DEFAULT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_rmunits` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_role_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tbl_salaries` (
  `id` int(11) NOT NULL,
  `month` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `year` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `details_info` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT 0,
  `del_status` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_sales` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(20) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `other` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `grand_total` float DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `paid` float DEFAULT NULL,
  `due` float DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `manufacture_details` text DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_sale_consumptions_of_menus` (
  `id` bigint(20) NOT NULL,
  `rmaterials_id` int(11) DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `sale_consumption_id` int(11) DEFAULT NULL,
  `sales_id` int(11) NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `food_menu_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_sale_consumptions_of_modifiers_of_menus` (
  `id` bigint(20) NOT NULL,
  `rmaterials_id` int(11) DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `sale_consumption_id` int(11) DEFAULT NULL,
  `sales_id` int(11) NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `food_menu_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `outlet_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_sale_details` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `manufacture_id` int(11) DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `total_amount` float(10,2) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;


CREATE TABLE `tbl_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


CREATE TABLE `tbl_stock_adjust_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rm_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL COMMENT '1.addition 2.subtraction',
  `quantity` int(11) NOT NULL DEFAULT 0,
  `del_status` varchar(255) NOT NULL DEFAULT 'Live',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `tbl_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `opening_balance` int(11) DEFAULT NULL,
  `opening_balance_type` varchar(50) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `credit_limit` float(10,2) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_supplier_payments` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `supplier` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


CREATE TABLE `tbl_taxes` (
  `id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `tax` varchar(50) NOT NULL,
  `tax_rate` float(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(100) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `tbl_taxes` (`id`, `tax_id`, `tax`, `tax_rate`, `created_at`, `updated_at`, `del_status`) VALUES
(1, 1, 'VAT', 10.00, '2024-09-30 11:51:59', '2024-09-30 11:51:59', 'Live'),
(2, 1, 'SD', 5.00, '2024-09-30 11:51:59', '2024-09-30 11:51:59', 'Live'),
(4, 1, 'CSD', 5.00, '2024-09-30 11:51:59', '2024-09-30 11:51:59', 'Live');

CREATE TABLE `tbl_tax_items` (
  `id` int(11) NOT NULL,
  `collect_tax` varchar(50) DEFAULT NULL,
  `tax_registration_number` varchar(50) DEFAULT NULL,
  `tax_type` varchar(255) DEFAULT NULL COMMENT 'Exclusive, Inclusive',
  `added_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

INSERT INTO `tbl_tax_items` (`id`, `collect_tax`, `tax_registration_number`, `tax_type`, `added_by`, `created_at`, `updated_at`, `del_status`) VALUES
(1, 'Yes', '555', 'Inclusive', 1, '2022-06-18 17:33:06', '2024-09-30 11:51:59', 'Live');

CREATE TABLE `tbl_time_zone` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `zone_name` varchar(35) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

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

CREATE TABLE `tbl_units` (
  `id` int(11) NOT NULL,
  `unit_name` varchar(10) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `role` int(10) DEFAULT NULL COMMENT '1. Admin 2. Staff',
  `permission_role` int(10) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `salary` float DEFAULT NULL,
  `company_id` int(11) NOT NULL DEFAULT 1,
  `photo` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(150) DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Inactive',
  `is_first_login` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live',
  `language` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tbl_users` (`id`, `name`, `designation`, `role`, `permission_role`, `email`, `password`, `remember_token`, `email_verified_at`, `phone_number`, `type`, `salary`, `company_id`, `photo`, `question`, `answer`, `status`, `is_first_login`, `created_at`, `updated_at`, `del_status`, `language`) VALUES
(1, 'Admin', 'Super Admin', NULL, NULL, 'admin@doorsoft.co', '$2y$10$UQyvhZtMxC5zQrFgyb.Tjes5tyyt2CB3znoZ2CJb3gveyGWxRkMxe', NULL, NULL, '01812391633', 'Admin', NULL, 1, '1724527113_man (4) (1).png', 'What is the name of the town you were born?', 'Dhaka', 'Active', 0, '2020-08-05 09:48:53', '2024-10-09 14:58:06', 'Live', 'en');
CREATE TABLE `tbl_users_old` (
  `id` int(11) NOT NULL,
  `full_name` varchar(25) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `will_login` varchar(20) NOT NULL DEFAULT 'No',
  `role` varchar(25) NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_creation_date` datetime NOT NULL,
  `language` varchar(100) NOT NULL DEFAULT 'english',
  `last_login` datetime NOT NULL,
  `active_status` varchar(25) NOT NULL DEFAULT 'Active',
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_user_access` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `access_parent_id` int(11) DEFAULT NULL,
  `access_child_id` int(11) DEFAULT NULL,
  `del_status` varchar(11) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

CREATE TABLE `tbl_user_menu_access` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


CREATE TABLE `tbl_wastes` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `responsible_person` int(11) DEFAULT NULL,
  `total_loss` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `tbl_waste_materials` (
  `id` int(11) NOT NULL,
  `rmaterials_id` int(11) DEFAULT NULL,
  `waste_amount` float(10,2) DEFAULT NULL,
  `last_purchase_price` float(10,2) DEFAULT NULL,
  `loss_amount` float(10,2) DEFAULT NULL,
  `waste_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `manufacture_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

CREATE TABLE `tbl_white_label_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_title` varchar(255) NOT NULL,
  `logo` varchar(150) DEFAULT NULL,
  `mini_logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(150) DEFAULT NULL,
  `footer` text DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live',
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tbl_white_label_settings` (`id`, `site_title`, `logo`, `mini_logo`, `favicon`, `footer`, `company_name`, `company_website`, `created_at`, `del_status`, `updated_at`) VALUES
(1, 'iProduction - Production & Manufacture Management Software', 'logo.png', 'mini_logo.png', 'favicon.ico', 'WhiteProduction - Production & Manufacture Management Software', 'Whitevue', 'https://whitevue.com', NULL, 'Live', NULL);

CREATE TABLE `tbl_withdraw_deposits` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;


ALTER TABLE `tbl_attendance` ADD `status` INT NULL DEFAULT '0' AFTER `note`;
ALTER TABLE `tbl_rawmaterials` CHANGE `consumption_unit` `consumption_unit` FLOAT(11) NULL DEFAULT NULL, CHANGE `unit` `unit` FLOAT(11) NULL DEFAULT NULL, CHANGE `rate_per_unit` `rate_per_unit` FLOAT(11) NULL DEFAULT NULL, CHANGE `consumption_check` `consumption_check` FLOAT(11) NULL DEFAULT '0', CHANGE `alert_level` `alert_level` FLOAT(11) NULL DEFAULT NULL;

CREATE TABLE `tbl_currency` (
  `id` int(11) NOT NULL,
  `symbol` varchar(50) NOT NULL,
  `conversion_rate` varchar(50) NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 1,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `tbl_currency`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_accounts`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_admin_settings`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_admin_user_menus`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_attachments`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_attendance`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_companies`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_customer_due_receives`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_customer_orders`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_customer_order_deliveries`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_customer_order_details`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_customer_order_invoices`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_deposits`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_expenses`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_expense_items`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_finished_products_noninventory`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_finished_products_productionstage`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_finished_products_rmaterials`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_finish_products`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_fnunits`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_fpcategory`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_fpwastes`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_fpwastes_fp`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_mail_settings`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_main_modules`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_manufactures`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_manufactures_noninventory`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_manufactures_rmaterials`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_manufactures_stages`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_manufacture_product`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_menus`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_menu_activities`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_non_inventory_items`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_notifications`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_payment_settings`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_productions`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_production_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_order_id` (`work_order_id`);

ALTER TABLE `tbl_production_noninventory`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_production_rmaterials`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_production_scheduling`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_production_stages`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_products_services`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_proposal_invoice`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_proposal_invoice_products_services`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_proposal_pdf`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_proposal_photo`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_purchase`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_purchase_return`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_purchase_return_details`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_purchase_rmaterials`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_quotations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_quotation_details`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_rawmaterials`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_rmcategory`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_rmunits`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_role_permissions`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_salaries`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_sales`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_sale_consumptions_of_menus`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_sale_consumptions_of_modifiers_of_menus`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_sale_details`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

ALTER TABLE `tbl_stock_adjust_logs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_suppliers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_supplier_payments`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_taxes`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_tax_items`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_time_zone`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_units`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tbl_admins_email_unique` (`email`),
  ADD UNIQUE KEY `tbl_admins_phone_number_unique` (`phone_number`);

ALTER TABLE `tbl_users_old`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_user_access`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_user_menu_access`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_wastes`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_waste_materials`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_white_label_settings`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tbl_withdraw_deposits`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_admin_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_admin_user_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_attachments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_customer_due_receives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_customer_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_customer_order_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_customer_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_customer_order_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_expense_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_finished_products_noninventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_finished_products_productionstage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_finished_products_rmaterials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_finish_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_fnunits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_fpcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_fpwastes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_fpwastes_fp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_mail_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_main_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_manufactures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_manufactures_noninventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_manufactures_rmaterials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_manufactures_stages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_manufacture_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_menu_activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_non_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_payment_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_productions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_production_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_production_noninventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_production_rmaterials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_production_scheduling`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_production_stages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_products_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_proposal_invoice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_proposal_invoice_products_services`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_proposal_pdf`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_proposal_photo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_purchase_return`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_purchase_return_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_purchase_rmaterials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_quotations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_quotation_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_rawmaterials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_rmcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_rmunits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_salaries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_sale_consumptions_of_menus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_sale_consumptions_of_modifiers_of_menus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_sale_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_stock_adjust_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_supplier_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_tax_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_users_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_user_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_wastes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_waste_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_white_label_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `tbl_withdraw_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `tbl_production_history`
  ADD CONSTRAINT `tbl_production_history_ibfk_1` FOREIGN KEY (`work_order_id`) REFERENCES `tbl_customer_orders` (`id`);
COMMIT;
