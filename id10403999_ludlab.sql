-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 09, 2019 at 01:59 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id10403999_ludlab`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `food_cost` int(11) NOT NULL,
  `wood_cost` int(11) NOT NULL,
  `pop_cost` int(11) NOT NULL,
  `user_food_mod` int(11) NOT NULL,
  `user_wood_mod` int(11) NOT NULL,
  `user_pop_mod` int(11) NOT NULL,
  `field_food_mod` int(11) NOT NULL,
  `field_wood_mod` int(11) NOT NULL,
  `field_pop_mod` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`id`, `name`, `food_cost`, `wood_cost`, `pop_cost`, `user_food_mod`, `user_wood_mod`, `user_pop_mod`, `field_food_mod`, `field_wood_mod`, `field_pop_mod`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'grass_to_wheat', 0, 10, 10, 10, 0, -10, 0, 0, 0, '2019-08-08 11:44:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'grass_to_house', 10, 10, 0, -10, -10, 0, 0, 0, 0, '2019-08-08 11:44:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `x_id` int(10) UNSIGNED NOT NULL,
  `y_id` int(10) UNSIGNED NOT NULL,
  `rotation` smallint(3) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `food` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wood` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pop` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `x_id`, `y_id`, `rotation`, `type_id`, `food`, `wood`, `pop`) VALUES
(1, 0, 0, 0, 2, 0, 0, 0),
(2, 0, 1, 0, 2, 0, 0, 0),
(3, 0, 2, 0, 4, 0, 0, 0),
(4, 0, 3, 0, 2, 0, 0, 0),
(5, 0, 4, 0, 2, 0, 0, 0),
(6, 1, 0, 0, 2, 0, 0, 0),
(7, 1, 1, 0, 2, 0, 0, 0),
(8, 1, 2, 0, 4, 0, 0, 0),
(9, 1, 3, 0, 2, 0, 0, 0),
(10, 1, 4, 0, 1, 0, 0, 0),
(11, 2, 0, 0, 3, 0, 0, 0),
(12, 2, 1, 0, 2, 0, 0, 0),
(13, 2, 2, 0, 6, 0, 0, 0),
(14, 2, 3, 0, 2, 0, 0, 0),
(15, 2, 4, 0, 2, 0, 0, 0),
(16, 3, 0, 0, 2, 0, 0, 0),
(17, 3, 1, 0, 2, 0, 0, 0),
(18, 3, 2, 0, 2, 0, 0, 0),
(19, 3, 3, 0, 5, 0, 0, 0),
(20, 3, 4, 0, 4, 0, 0, 0),
(21, 4, 0, 0, 2, 0, 0, 0),
(22, 4, 1, 0, 2, 0, 0, 0),
(23, 4, 2, 0, 2, 0, 0, 0),
(24, 4, 3, 0, 2, 0, 0, 0),
(25, 4, 4, 0, 2, 0, 0, 0),
(26, 5, 0, 0, 3, 0, 0, 0),
(27, 5, 1, 0, 14, 0, 0, 0),
(28, 5, 2, 0, 15, 0, 0, 0),
(29, 5, 3, 0, 14, 0, 0, 0),
(30, 5, 4, 0, 14, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `field_types`
--

CREATE TABLE `field_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `img_url` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `buildable` tinyint(1) NOT NULL DEFAULT 0,
  `actions` varchar(512) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `field_types`
--

INSERT INTO `field_types` (`id`, `img_url`, `buildable`, `actions`) VALUES
(1, 'http://talpasasolud.000webhostapp.com/resources/img/field_images/buza.jpg', 0, ''),
(2, 'http://talpasasolud.000webhostapp.com/resources/img/field_images/grass.jpg', 1, '1,2'),
(3, 'http://talpasasolud.000webhostapp.com/resources/img/field_images/house1.jpg', 0, ''),
(4, 'http://talpasasolud.000webhostapp.com/resources/img/field_images/house2.jpg', 0, ''),
(5, 'http://talpasasolud.000webhostapp.com/resources/img/field_images/house3.jpg', 0, ''),
(6, 'http://talpasasolud.000webhostapp.com/resources/img/field_images/loot.jpg', 0, ''),
(7, 'http://talpasasolud.000webhostapp.com/resources/img/field_images/rekettye.jpg', 0, ''),
(10, 'http://talpasasolud.000webhostapp.com/resources/img/field_images/water.jpg', 0, ''),
(11, 'http://talpasasolud.000webhostapp.com/resources/img/field_images/water_grass.jpg', 0, ''),
(14, 'http://talpasasolud.000webhostapp.com/resources/img/field_images/wood1.jpg', 0, ''),
(15, 'http://talpasasolud.000webhostapp.com/resources/img/field_images/wood2.jpg', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `field_ware_modifiers`
--

CREATE TABLE `field_ware_modifiers` (
  `id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED NOT NULL,
  `food` int(11) NOT NULL,
  `wood` int(11) NOT NULL,
  `pop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `field_ware_modifiers`
--

INSERT INTO `field_ware_modifiers` (`id`, `field_id`, `food`, `wood`, `pop`) VALUES
(1, 1, 0, 0, 0),
(2, 2, 0, 0, 0),
(3, 3, 0, 0, 0),
(4, 4, 0, 0, 0),
(5, 5, 0, 0, 0),
(6, 6, 0, 0, 0),
(7, 7, 0, 0, 0),
(8, 8, 0, 0, 0),
(9, 9, 0, 0, 0),
(10, 10, 0, 0, 0),
(11, 11, 0, 0, 0),
(12, 12, 0, 0, 0),
(13, 13, 0, 0, 0),
(14, 14, 0, 0, 0),
(15, 15, 0, 0, 0),
(16, 16, 0, 0, 0),
(17, 17, 0, 0, 0),
(18, 18, 0, 0, 0),
(19, 19, 0, 0, 0),
(20, 20, 0, 0, 0),
(21, 21, 0, 0, 0),
(22, 22, 0, 0, 0),
(23, 23, 0, 0, 0),
(24, 24, 0, 0, 0),
(25, 25, 0, 0, 0),
(26, 26, 0, 0, 0),
(27, 27, 0, 0, 0),
(28, 28, 0, 0, 0),
(29, 29, 0, 0, 0),
(30, 30, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `maps`
--

CREATE TABLE `maps` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `maps`
--

INSERT INTO `maps` (`id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2019-08-06 17:00:04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `map_field_accesses`
--

CREATE TABLE `map_field_accesses` (
  `id` int(10) UNSIGNED NOT NULL,
  `map_id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `map_field_accesses`
--

INSERT INTO `map_field_accesses` (`id`, `map_id`, `field_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(265) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `token`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', 'test', '1', 1, '2019-08-06 17:25:19', '2019-08-28 10:22:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_wares`
--

CREATE TABLE `user_wares` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `food` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wood` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `pop` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_wares`
--

INSERT INTO `user_wares` (`id`, `user_id`, `food`, `wood`, `pop`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 100, 91, 92, '2019-08-28 12:17:21', '2019-08-28 12:21:59', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_ware_modifiers`
--

CREATE TABLE `user_ware_modifiers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `food` int(11) NOT NULL,
  `wood` int(11) NOT NULL,
  `pop` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_ware_modifiers`
--

INSERT INTO `user_ware_modifiers` (`id`, `user_id`, `food`, `wood`, `pop`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 20, 0, -20, '2019-08-28 12:18:32', '2019-08-28 12:24:21', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `field_types`
--
ALTER TABLE `field_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `field_ware_modifiers`
--
ALTER TABLE `field_ware_modifiers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_ware_modifier_fied_id_fk1` (`field_id`);

--
-- Indexes for table `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `maps_user_id_fk1` (`user_id`) USING BTREE;

--
-- Indexes for table `map_field_accesses`
--
ALTER TABLE `map_field_accesses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_id` (`id`) USING BTREE;

--
-- Indexes for table `user_wares`
--
ALTER TABLE `user_wares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_wares_user_id_fk1` (`user_id`);

--
-- Indexes for table `user_ware_modifiers`
--
ALTER TABLE `user_ware_modifiers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `use_ware_modifier_user_id_fk1` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `field_types`
--
ALTER TABLE `field_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `field_ware_modifiers`
--
ALTER TABLE `field_ware_modifiers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `map_field_accesses`
--
ALTER TABLE `map_field_accesses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_wares`
--
ALTER TABLE `user_wares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_ware_modifiers`
--
ALTER TABLE `user_ware_modifiers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `field_ware_modifiers`
--
ALTER TABLE `field_ware_modifiers`
  ADD CONSTRAINT `field_ware_modifier_fied_id_fk1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `maps`
--
ALTER TABLE `maps`
  ADD CONSTRAINT `maps_user_id_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_wares`
--
ALTER TABLE `user_wares`
  ADD CONSTRAINT `user_wares_user_id_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_ware_modifiers`
--
ALTER TABLE `user_ware_modifiers`
  ADD CONSTRAINT `use_ware_modifier_user_id_fk1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
