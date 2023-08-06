-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 31, 2023 at 11:05 PM
-- Server version: 10.5.21-MariaDB-cll-lve-log
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arsisyah_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Whiskas', '2023-07-15 23:58:04', '2023-07-16 00:00:39'),
(3, 'Top cat litter', '2023-07-16 05:06:41', '2023-07-16 05:06:41'),
(4, 'meow', '2023-07-16 05:12:41', '2023-07-16 05:12:41'),
(5, 'pet', '2023-07-16 05:13:20', '2023-07-16 05:13:20');

-- --------------------------------------------------------

CREATE TABLE `pembayaran` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `image`  text DEFAULT NULL,
  `tglPembayaran` date DEFAULT NULL,
  `nota` text DEFAULT NULL,
  `metode` text DEFAULT NULL,
  `an_nama` text DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `nominal` text DEFAULT NULL,
   `status` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,  
  `harga_satuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,  
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Wetfood', '2023-07-16 00:01:16', '2023-07-16 00:01:16'),
(3, 'Pasir wangi', '2023-07-16 05:07:49', '2023-07-16 05:07:49'),
(4, 'Kalung', '2023-07-16 05:13:41', '2023-07-16 05:15:19'),
(5, 'Tali tuntun', '2023-07-16 05:14:57', '2023-07-16 05:15:30');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_26_082937_create_brands_table', 1),
(6, '2023_05_26_084523_create_categories_table', 1),
(7, '2023_05_26_084804_create_roles_table', 1),
(8, '2023_05_26_085014_add_role_id_to_users_table', 1),
(9, '2023_05_26_085401_add_phone_id_to_users_table', 1),
(10, '2023_05_26_085617_create_products_table', 1),
(11, '2023_05_28_105854_create_sliders_table', 1),
(12, '2023_05_30_080438_add_image_to_products_table', 1),
(13, '2023_06_02_071021_add_stock_to_products_table', 1),
(14, '2023_06_09_022722_add_image_to_users_table', 1),
(15, '2023_06_09_091351_add_description_to_products_table', 1),
(16, '2023_06_10_051858_add_status_to_products_table', 1),
(17, '2023_06_10_054910_update_product_status_column', 1),
(18, '2023_07_15_222056_add_status_to_sliders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` bigint(20) NOT NULL DEFAULT 0,
  `sale_price` bigint(20) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  `brands` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `rating` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `price`, `sale_price`, `stock`, `brands`, `description`, `status`, `rating`, `image`, `created_at`, `updated_at`) VALUES
(1, 2, 'Whiskas', 50000, 45000, 5, 'Whiskas', 'Ini Whiskas', 'approve', 5, '1689491012.png', '2023-07-16 00:03:32', '2023-07-16 00:04:00'),
(2, 2, 'Whiskaas', 60000, 50000, 5, 'Whiskas', 'whiskas', 'approve', 5, '1689498006.jpg', '2023-07-16 02:00:06', '2023-07-16 02:00:10'),
(3, 3, 'Top cat litter', 25000, 20000, 30, 'Top cat litter', 'pasir wangi bisa digunakan untuk kotoran kucing', 'approve', 4, '1689509894.jpg', '2023-07-16 05:10:57', '2023-07-16 05:18:14'),
(4, 4, 'kalung kucing custom', 30000, 28000, 20, 'pet', 'kalung kucing custom', 'approve', 5, '1689509864.jpg', '2023-07-16 05:17:14', '2023-07-16 05:17:44'),
(5, 5, 'Tali tuntun kucing', 50000, 45000, 12, 'pet', 'tali tuntun kucing peliharaan', 'approve', 5, '1689512626.jpg', '2023-07-16 06:03:46', '2023-07-16 06:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2023-07-15 23:52:11', '2023-07-15 23:52:11'),
(2, 'Staff', '2023-07-15 23:52:11', '2023-07-15 23:52:11'),
(3, 'User', '2023-07-15 23:52:11', '2023-07-15 23:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `caption` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `caption`, `image`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Pet Shop', 'Sedia Perlengkapan Hewan peliharaan', '1689510362.jpg', 'approve', '2023-07-16 05:26:02', '2023-07-16 05:26:09'),
(4, 'Pet Shop', 'pet shop', '1689510570.jpg', 'approve', '2023-07-16 05:29:30', '2023-07-16 05:29:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `phone`, `image`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 3, 'jono', 'jono@email.test', '0888888888', NULL, NULL, '$2y$10$aVElySed3M.TXIiPyqfxXOtdOK9OfY/I2bxiBq3UN8nwlwgZ/cDYa', NULL, '2023-07-15 23:50:06', '2023-07-15 23:50:06'),
(2, 1, 'Admin', 'admin@email.test', '+1-608-434-9953', NULL, NULL, '$2y$10$aZT9qL2uKDFWtytOz8Yw8.i09W4dVsk.lNykVR7HQJPNFD0eymbPi', NULL, '2023-07-15 23:52:11', '2023-07-15 23:52:11'),
(3, 2, 'Staff', 'staff@email.test', '937.800.9799', NULL, NULL, '$2y$10$1tEOED69mfZNEQ9msuq.huQ7Dj6UKULWlaxn8S.SRSayDOOg/rOdm', NULL, '2023-07-15 23:52:11', '2023-07-15 23:52:11'),
(4, 3, 'User', 'user@email.test', '614.205.7998', NULL, NULL, '$2y$10$zwiAGwVDEkjFgI6RcTdYhuqSMpPaS/8GWygB1j2ejV6hQQi6ufEmm', NULL, '2023-07-15 23:52:12', '2023-07-15 23:52:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
