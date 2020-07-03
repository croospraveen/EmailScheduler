-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2020 at 06:48 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emailtask_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batchnumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `batchnumber`, `created_at`, `updated_at`, `users_id`) VALUES
(1, 'Batch1593782342', '2020-07-03 07:49:02', '2020-07-03 07:49:02', 1),
(2, 'Batch1593783988', '2020-07-03 08:16:28', '2020-07-03 08:16:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bulkemailattachments`
--

CREATE TABLE `bulkemailattachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bulkemails_id` int(11) NOT NULL,
  `filename` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bulkemailattachments`
--

INSERT INTO `bulkemailattachments` (`id`, `bulkemails_id`, `filename`, `created_at`, `updated_at`) VALUES
(1, 30, '843418011.txt', '2020-07-03 11:05:19', '2020-07-03 11:05:19'),
(2, 31, '2103448684.xlsx', '2020-07-03 11:07:01', '2020-07-03 11:07:01'),
(3, 32, '666961909.txt', '2020-07-03 11:09:12', '2020-07-03 11:09:12');

-- --------------------------------------------------------

--
-- Table structure for table `bulkemailbatches`
--

CREATE TABLE `bulkemailbatches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bulkemails_id` int(11) NOT NULL,
  `batches_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bulkemailbatches`
--

INSERT INTO `bulkemailbatches` (`id`, `bulkemails_id`, `batches_id`, `created_at`, `updated_at`) VALUES
(1, 6, 1, '2020-07-03 08:11:33', '2020-07-03 08:11:33'),
(2, 7, 1, '2020-07-03 08:16:43', '2020-07-03 08:16:43'),
(3, 7, 2, '2020-07-03 08:16:43', '2020-07-03 08:16:43'),
(4, 8, 2, '2020-07-03 08:26:46', '2020-07-03 08:26:46'),
(5, 9, 1, '2020-07-03 08:29:26', '2020-07-03 08:29:26'),
(6, 9, 2, '2020-07-03 08:29:26', '2020-07-03 08:29:26'),
(7, 10, 2, '2020-07-03 08:31:49', '2020-07-03 08:31:49'),
(8, 11, 2, '2020-07-03 08:35:19', '2020-07-03 08:35:19'),
(9, 12, 1, '2020-07-03 09:44:54', '2020-07-03 09:44:54'),
(10, 12, 2, '2020-07-03 09:44:54', '2020-07-03 09:44:54'),
(11, 13, 2, '2020-07-03 09:51:14', '2020-07-03 09:51:14'),
(12, 14, 2, '2020-07-03 09:57:54', '2020-07-03 09:57:54'),
(13, 24, 2, '2020-07-03 10:44:43', '2020-07-03 10:44:43'),
(14, 26, 1, '2020-07-03 11:01:18', '2020-07-03 11:01:18'),
(15, 27, 1, '2020-07-03 11:02:19', '2020-07-03 11:02:19'),
(16, 30, 1, '2020-07-03 11:05:19', '2020-07-03 11:05:19'),
(17, 30, 2, '2020-07-03 11:05:19', '2020-07-03 11:05:19'),
(18, 31, 1, '2020-07-03 11:07:01', '2020-07-03 11:07:01'),
(19, 31, 2, '2020-07-03 11:07:01', '2020-07-03 11:07:01'),
(20, 32, 1, '2020-07-03 11:09:12', '2020-07-03 11:09:12');

-- --------------------------------------------------------

--
-- Table structure for table `bulkemails`
--

CREATE TABLE `bulkemails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senddate` date NOT NULL DEFAULT '2020-07-03',
  `users_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bulkemails`
--

INSERT INTO `bulkemails` (`id`, `alias`, `subject`, `senddate`, `users_id`, `created_at`, `updated_at`, `body`) VALUES
(1, 'Test', 'S Test', '2020-07-03', 1, '2020-07-03 07:43:01', '2020-07-03 07:43:01', NULL),
(2, 'dzj', 'kxchzjkcz', '2020-07-03', 1, '2020-07-03 07:51:42', '2020-07-03 07:51:42', NULL),
(3, 'ali', 'sub', '2020-07-03', 1, '2020-07-03 07:52:44', '2020-07-03 07:52:44', NULL),
(4, 'nbh', 'gh', '2020-07-03', 1, '2020-07-03 07:54:07', '2020-07-03 07:54:07', NULL),
(5, 'jbjb', 'nbjvhj', '2020-07-03', 1, '2020-07-03 07:58:22', '2020-07-03 07:58:22', '<p>nhgh</p>'),
(6, 'jbjb', 'nzxcnxz', '2020-07-03', 1, '2020-07-03 08:11:33', '2020-07-03 08:11:33', '<p>mznckn</p>'),
(7, 'jhj', 'jhhg', '2020-07-03', 1, '2020-07-03 08:16:43', '2020-07-03 08:16:43', '<p>nhghjg</p>'),
(8, 'vhghghg', 'kknk', '2020-07-03', 1, '2020-07-03 08:26:46', '2020-07-03 08:26:46', '<p>nbjjh</p>'),
(9, 'jghh', 'jkhjh', '2020-07-03', 1, '2020-07-03 08:29:26', '2020-07-03 08:29:26', '<p>mkllk</p>'),
(10, 'jjhj', 'mbhghb', '2020-07-03', 1, '2020-07-03 08:31:49', '2020-07-03 08:31:49', '<p>jkhjgj</p>'),
(11, 'jkh', 'jhui', '2020-07-03', 1, '2020-07-03 08:35:19', '2020-07-03 08:35:19', '<p>kjji</p>'),
(12, 'kn', 'kkn', '2020-07-03', 1, '2020-07-03 09:44:54', '2020-07-03 09:44:54', '<p>kn</p>'),
(13, 'nn', 'mkm', '2020-07-03', 1, '2020-07-03 09:51:14', '2020-07-03 09:51:14', '<p>mll</p>'),
(14, 'jhh', 'jjb', '2020-07-03', 1, '2020-07-03 09:57:54', '2020-07-03 09:57:54', '<p>jjj</p>'),
(15, 'bj', 'jjk', '2020-07-03', 1, '2020-07-03 10:04:38', '2020-07-03 10:04:38', NULL),
(16, 'bk', 'mnjk', '2020-07-03', 1, '2020-07-03 10:10:50', '2020-07-03 10:10:50', '<ol>\r\n	<li>&nbsp;</li>\r\n</ol>'),
(17, 'nbj', 'jkj', '2020-07-03', 1, '2020-07-03 10:11:46', '2020-07-03 10:11:46', '<p>kjk</p>'),
(18, 'njk', 'j', '2020-07-03', 1, '2020-07-03 10:13:09', '2020-07-03 10:13:09', '<p>jjk</p>'),
(19, NULL, 'mnk', '2020-07-03', 1, '2020-07-03 10:15:34', '2020-07-03 10:15:34', NULL),
(20, 'bhj', 'jj', '2020-07-03', 1, '2020-07-03 10:16:26', '2020-07-03 10:16:26', NULL),
(21, 'll', 'jhj', '2020-07-03', 1, '2020-07-03 10:18:07', '2020-07-03 10:18:07', NULL),
(22, NULL, NULL, '2020-07-03', 1, '2020-07-03 10:28:02', '2020-07-03 10:28:02', NULL),
(23, 'jkjk', 'k', '2020-07-03', 1, '2020-07-03 10:42:46', '2020-07-03 10:42:46', NULL),
(24, 'hh', 'hjk', '2020-07-03', 1, '2020-07-03 10:44:43', '2020-07-03 10:44:43', '<p>bjjk</p>'),
(25, NULL, NULL, '2020-07-03', 1, '2020-07-03 10:58:47', '2020-07-03 10:58:47', NULL),
(26, NULL, 'bj', '2020-07-03', 1, '2020-07-03 11:01:18', '2020-07-03 11:01:18', '<p>hj</p>'),
(27, 'jbjb', 'jjk', '2020-07-03', 1, '2020-07-03 11:02:19', '2020-07-03 11:02:19', '<p>kh</p>'),
(28, NULL, NULL, '2020-07-03', 1, '2020-07-03 11:03:50', '2020-07-03 11:03:50', '<p>bj</p>'),
(29, 'n', 'n', '2020-07-03', 1, '2020-07-03 11:04:52', '2020-07-03 11:04:52', '<p>&nbsp;mnbm</p>'),
(30, 'n', 'n', '2020-07-03', 1, '2020-07-03 11:05:19', '2020-07-03 11:05:19', '<p>&nbsp;mnbm</p>'),
(31, NULL, NULL, '2020-07-03', 1, '2020-07-03 11:07:01', '2020-07-03 11:07:01', '<p>j</p>'),
(32, NULL, NULL, '2020-07-03', 1, '2020-07-03 11:09:12', '2020-07-03 11:09:12', '<p>jj</p>');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contactid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contactnuumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batches_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `contactid`, `name`, `contactnuumber`, `email`, `batches_id`, `created_at`, `updated_at`) VALUES
(1, 0, 'Ins', '11', 'asd@gmail', 1, '2020-07-03 07:49:02', '2020-07-03 07:49:02'),
(2, 0, 'Puw', '11', 'asd@gmail', 2, '2020-07-03 08:16:28', '2020-07-03 08:16:28');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '2020_07_03_123146_create_bulkemails_table', 1),
(8, '2020_07_03_131005_add_body_to_bulkemails_table', 1),
(9, '2020_07_03_053139_create_contacts_table', 2),
(10, '2020_07_03_054651_create_batches_table', 2),
(11, '2020_07_03_065410_add_users_id_to_batches', 2),
(12, '2020_07_03_133312_create_bulkemailbatches_table', 3),
(13, '2020_07_03_135057_create_bulkemailattachments_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'abc', 'abc@gmail.com', NULL, '$2y$10$dwW7Al6NGpTzW3fWgLW57.0FRKr5kDZKk5hXzZ8b4kxbefBBtqmlm', NULL, '2020-07-03 07:37:44', '2020-07-03 07:37:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulkemailattachments`
--
ALTER TABLE `bulkemailattachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulkemailbatches`
--
ALTER TABLE `bulkemailbatches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulkemails`
--
ALTER TABLE `bulkemails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bulkemailattachments`
--
ALTER TABLE `bulkemailattachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bulkemailbatches`
--
ALTER TABLE `bulkemailbatches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `bulkemails`
--
ALTER TABLE `bulkemails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
