-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 01, 2025 at 12:42 PM
-- Server version: 10.4.33-MariaDB-log
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `classcheduler`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `section` varchar(255) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `section`, `level`, `course`, `created_at`, `updated_at`) VALUES
(1, 'A', '11', '(ABM) Accountancy, Business and Management', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(2, 'B', '11', '(ABM) Accountancy, Business and Management', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(3, 'A', '11', '(GAS) General Academic Strand', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(4, 'B', '11', '(GAS) General Academic Strand', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(5, 'A', '11', '(HUMSS) Humanities and Social Sciences', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(6, 'B', '11', '(HUMSS) Humanities and Social Sciences', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(7, 'A', '11', '(STEM) Science, Technology, Engineering, and Mathematics', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(8, 'B', '11', '(STEM) Science, Technology, Engineering, and Mathematics', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(9, 'A', '11', '(ICT) Information and Communication Technology', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(10, 'B', '11', '(ICT) Information and Communication Technology', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(11, 'A', '11', '(HE) Home Economics', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(12, 'B', '11', '(HE) Home Economics', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(13, 'A', '11', '(SMAW) Shielded Metal Arc Welding', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(14, 'B', '11', '(SMAW) Shielded Metal Arc Welding', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(15, 'A', '11', '(AUTO) Automotive Servicing', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(16, 'B', '11', '(AUTO) Automotive Servicing', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(17, 'A', '12', '(ABM) Accountancy, Business and Management', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(18, 'B', '12', '(ABM) Accountancy, Business and Management', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(19, 'A', '12', '(GAS) General Academic Strand', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(20, 'B', '12', '(GAS) General Academic Strand', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(21, 'A', '12', '(HUMSS) Humanities and Social Sciences', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(22, 'B', '12', '(HUMSS) Humanities and Social Sciences', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(23, 'A', '12', '(STEM) Science, Technology, Engineering, and Mathematics', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(24, 'B', '12', '(STEM) Science, Technology, Engineering, and Mathematics', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(25, 'A', '12', '(ICT) Information and Communication Technology', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(26, 'B', '12', '(ICT) Information and Communication Technology', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(27, 'A', '12', '(HE) Home Economics', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(28, 'B', '12', '(HE) Home Economics', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(29, 'A', '12', '(SMAW) Shielded Metal Arc Welding', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(30, 'B', '12', '(SMAW) Shielded Metal Arc Welding', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(31, 'A', '12', '(AUTO) Automotive Servicing', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(32, 'B', '12', '(AUTO) Automotive Servicing', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(33, 'A', '1', '(BSIT) Bachelor of Science in Information Technology', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(34, 'B', '1', '(BSIT) Bachelor of Science in Information Technology', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(35, 'A', '1', '(BSHM) Bachelor of Science in Hospitality Management', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(36, 'B', '1', '(BSHM) Bachelor of Science in Hospitality Management', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(37, 'A', '1', '(BSAIS) Bachelor of Science in Accounting Information Systems', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(38, 'B', '1', '(BSAIS) Bachelor of Science in Accounting Information Systems', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(39, 'A', '1', '(BSTM) Bachelor of Science in Tourism Management', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(40, 'B', '1', '(BSTM) Bachelor of Science in Tourism Management', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(41, 'A', '1', '(BSOA) Bachelor of Science in Office Administration', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(42, 'B', '1', '(BSOA) Bachelor of Science in Office Administration', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(43, 'A', '1', '(BSENTREP) Bachelor of Science in Entrepreneurship', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(44, 'B', '1', '(BSENTREP) Bachelor of Science in Entrepreneurship', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(45, 'A', '1', '(BSBA-HRM) Bachelor of Science in Business Administration Major in HRM', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(46, 'B', '1', '(BSBA-HRM) Bachelor of Science in Business Administration Major in HRM', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(47, 'A', '1', '(BSBA-MM) Bachelor of Science in Business Administration Major in Marketing Management', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(48, 'B', '1', '(BSBA-MM) Bachelor of Science in Business Administration Major in Marketing Management', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(49, 'A', '1', '(BLIS) Bachelor of Library Information Science', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(50, 'B', '1', '(BLIS) Bachelor of Library Information Science', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(51, 'A', '1', '(BSCpE) Bachelor of Science in Computer Engineering', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(52, 'B', '1', '(BSCpE) Bachelor of Science in Computer Engineering', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(53, 'A', '1', '(BSP) Bachelor of Science in Psychology', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(54, 'B', '1', '(BSP) Bachelor of Science in Psychology', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(55, 'A', '1', '(BSCRIM) Bachelor of Science in Criminology', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(56, 'B', '1', '(BSCRIM) Bachelor of Science in Criminology', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(57, 'A', '1', '(BPED) Bachelor of Physical Education', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(58, 'B', '1', '(BPED) Bachelor of Physical Education', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(59, 'A', '1', '(BTLED) Bachelor of Technology and Livelihood Education', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(60, 'B', '1', '(BTLED) Bachelor of Technology and Livelihood Education', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(61, 'A', '1', '(BEED) Bachelor of Elementary Education', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(62, 'B', '1', '(BEED) Bachelor of Elementary Education', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(63, 'A', '1', '(BSED) Bachelor of Secondary Education', '2025-08-24 17:23:53', '2025-08-24 17:23:53'),
(64, 'B', '1', '(BSED) Bachelor of Secondary Education', '2025-08-24 17:23:53', '2025-08-24 17:23:53');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_number` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = active, 1 = inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `status`, `created_at`, `updated_at`) VALUES
(1, '101', 0, '2025-08-24 18:01:13', '2025-08-24 18:01:13'),
(2, '102', 1, '2025-08-24 18:01:13', '2025-08-24 18:01:13'),
(3, '103', 0, '2025-08-24 18:01:13', '2025-08-24 18:01:13'),
(4, '104', 1, '2025-08-24 18:01:13', '2025-08-24 18:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0=Regular, 1=Special, 2=Exam, 3=Assignment',
  `description` varchar(255) DEFAULT NULL,
  `datetime_start` datetime NOT NULL,
  `datetime_end` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `room_id`, `class_id`, `type`, `description`, `datetime_start`, `datetime_end`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 1, 'Special session - Science Lab', '2025-09-02 14:00:00', '2025-09-02 16:00:00', '2025-08-25 07:19:20', '2025-08-25 07:19:20'),
(3, 3, 3, 2, 'Midterm Exam - English', '2025-08-30 18:00:00', '2025-08-30 20:00:00', '2025-08-25 07:19:20', '2025-08-25 09:30:58'),
(4, 1, 2, 3, 'Assignment submission - History', '2025-09-15 17:00:00', '2025-09-15 19:00:00', '2025-08-25 07:19:20', '2025-08-25 09:28:58');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `semester` tinyint(1) NOT NULL COMMENT '1 = First Sem, 2 = Second Sem',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `class_id`, `subject_name`, `semester`, `created_at`, `updated_at`) VALUES
(1, 46, 'CC101 - Purposive Communication', 1, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(2, 46, 'CC102 - Mathematics in the Modern World', 1, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(3, 46, 'CC103 - Understanding the Self', 1, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(4, 46, 'CC104 - Philippine History', 1, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(5, 46, 'CC105 - The Contemporary World', 1, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(6, 46, 'CC106 - Physical Education 1', 1, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(7, 46, 'CC107 - National Service Training Program 1 (NSTP 1)', 1, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(8, 46, 'CC108 - Introduction to Computing', 1, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(9, 46, 'CC109 - Living in the IT Era', 1, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(10, 46, 'CC201 - Readings in Philippine History', 2, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(11, 46, 'CC202 - Ethics', 2, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(12, 46, 'CC203 - Science, Technology, and Society', 2, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(13, 46, 'CC204 - Art Appreciation', 2, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(14, 46, 'CC205 - Physical Education 2', 2, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(15, 46, 'CC206 - National Service Training Program 2 (NSTP 2)', 2, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(16, 46, 'CC207 - Programming 1 (Java Fundamentals)', 2, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(17, 46, 'CC208 - The Life and Works of Rizal', 2, '2025-08-24 17:27:22', '2025-08-24 17:27:22'),
(18, 46, 'CC209 - Writing in the Discipline', 2, '2025-08-24 17:27:22', '2025-08-24 17:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `role` enum('Student','Instructor','Admin','SuperAdmin') DEFAULT 'Student',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `email`, `password`, `profile`, `role`, `created_at`) VALUES
(1, 'Super', 'null', 'Admins', 'superadmin@gmail.com', 'superadmin@gmail.com', '/storage/uploads/dedMfYz6bX7y8qmj7deYn77p29xyvG1JVWwwDREN.png', 'SuperAdmin', '2025-08-23 16:03:31'),
(2, 'System', NULL, 'Admin', 'admin@gmail.com', 'admin@gmail.com', 'password123', 'Admin', '2025-08-23 16:03:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_number` (`room_number`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
