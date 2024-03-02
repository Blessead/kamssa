-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2019 at 10:40 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kamssa`
--

-- --------------------------------------------------------

--
-- Table structure for table `a_level_combinations`
--

CREATE TABLE `a_level_combinations` (
  `id` int(5) NOT NULL,
  `combination` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `a_level_combinations`
--

INSERT INTO `a_level_combinations` (`id`, `combination`) VALUES
(1, 'PCM / ICT'),
(2, 'PEM / ICT'),
(5, 'MEE / ENT'),
(6, 'HEG');

-- --------------------------------------------------------

--
-- Table structure for table `a_level_students`
--

CREATE TABLE `a_level_students` (
  `id` int(5) NOT NULL,
  `school_id` int(5) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `second_name` varchar(50) NOT NULL,
  `index_no` varchar(50) NOT NULL,
  `combination_id` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `a_level_students`
--

INSERT INTO `a_level_students` (`id`, `school_id`, `first_name`, `second_name`, `index_no`, `combination_id`) VALUES
(12, 30, 'Marvin', 'Sendikaddiwa', 'u0030/582', 1),
(13, 30, 'Peter', 'Blessed', 'uoo75/34', 2);

-- --------------------------------------------------------

--
-- Table structure for table `a_level_student_marks`
--

CREATE TABLE `a_level_student_marks` (
  `id` int(5) NOT NULL,
  `subject_paper_id` int(5) NOT NULL,
  `marks` double(5,2) NOT NULL DEFAULT '0.00',
  `student_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `a_level_student_marks`
--

INSERT INTO `a_level_student_marks` (`id`, `subject_paper_id`, `marks`, `student_id`) VALUES
(60, 1, 79.23, 12),
(61, 37, 43.37, 12),
(62, 38, 79.18, 12),
(63, 39, 65.78, 12),
(64, 43, 91.37, 12),
(65, 44, 59.49, 12),
(66, 45, 23.34, 12),
(69, 58, 55.00, 12),
(70, 59, 34.00, 12),
(71, 1, 92.86, 13),
(72, 58, 84.03, 13),
(73, 59, 41.55, 13),
(74, 37, 55.67, 13),
(75, 38, 53.68, 13),
(76, 39, 1.40, 13),
(77, 8, 45.96, 13),
(78, 9, 25.58, 13),
(79, 35, 90.05, 13),
(80, 36, 73.50, 13);

-- --------------------------------------------------------

--
-- Table structure for table `a_level_subejcts`
--

CREATE TABLE `a_level_subejcts` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `subject_code` varchar(20) NOT NULL,
  `is_core` enum('0','1','2') NOT NULL DEFAULT '0',
  `no_of_papers_done` int(5) NOT NULL DEFAULT '0',
  `short_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `a_level_subejcts`
--

INSERT INTO `a_level_subejcts` (`id`, `name`, `subject_code`, `is_core`, `no_of_papers_done`, `short_name`) VALUES
(1, 'General paper', '', '2', 1, 'Gener'),
(2, 'History', '', '0', 2, 'Histo'),
(3, 'Economics', '', '0', 2, 'Econo'),
(4, 'Entrepreneurship Educ.', '', '0', 2, 'Entre'),
(5, 'Islamic Religious Educ.', '', '0', 2, 'Islam'),
(6, 'Christian Religious Educ.', '', '0', 2, 'Chris'),
(7, 'Geography', '', '0', 2, 'Geogr'),
(8, 'Literature in English', '', '0', 2, 'Liter'),
(9, 'Kiswahili', '', '0', 2, 'Kiswa'),
(10, 'Luganda', '', '0', 2, 'Lugan'),
(11, 'Mathematics', '', '0', 2, 'Mathe'),
(12, 'Physics', '', '0', 3, 'Physi'),
(13, 'Agriculture', '', '0', 2, 'Agric'),
(14, 'Chemistry', '', '0', 3, 'Chemi'),
(15, 'Biology', '', '0', 2, 'Biolo'),
(16, 'Fine Art', '', '0', 2, 'Fine '),
(17, 'Arabic', '', '0', 2, 'Arabi'),
(18, 'Sub math', '', '1', 2, 'Sub m'),
(19, 'Sub ICT', '', '1', 2, 'Sub I'),
(20, 'Tailoring', 'tr', '1', 2, 'Tailo');

-- --------------------------------------------------------

--
-- Table structure for table `a_level_subejcts_papers`
--

CREATE TABLE `a_level_subejcts_papers` (
  `id` int(5) NOT NULL,
  `subject_id` int(5) NOT NULL,
  `paper_code` varchar(20) NOT NULL,
  `is_default` enum('0','1') NOT NULL DEFAULT '0',
  `paper_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `a_level_subejcts_papers`
--

INSERT INTO `a_level_subejcts_papers` (`id`, `subject_id`, `paper_code`, `is_default`, `paper_name`) VALUES
(1, 1, 'Paper 1', '0', ''),
(2, 2, 'paper 1', '0', ''),
(3, 2, 'Paper 2', '0', ''),
(4, 2, 'Paper 3', '0', ''),
(5, 2, 'Paper 4', '0', ''),
(6, 2, 'Paper 5', '0', ''),
(7, 2, 'Paper 6', '0', ''),
(8, 3, 'Paper 1', '0', ''),
(9, 3, 'Paper 2', '0', ''),
(10, 4, 'Paper 1', '0', ''),
(11, 4, 'Paper 2', '0', ''),
(12, 4, 'Paper 3', '0', ''),
(13, 5, 'Paper 1', '0', ''),
(14, 5, 'Paper 2', '0', ''),
(15, 5, 'Paper 3', '0', ''),
(16, 5, 'Paper 4', '0', ''),
(17, 6, 'Paper 1', '0', ''),
(18, 6, 'Paper 2', '0', ''),
(19, 6, 'Paper 3', '0', ''),
(20, 6, 'Paper 4', '0', ''),
(21, 6, 'Paper 5', '0', ''),
(22, 6, 'Paper 6', '0', ''),
(23, 7, 'Paper 1', '0', ''),
(24, 7, 'Paper 2', '0', ''),
(25, 7, 'Paper 3', '0', ''),
(26, 8, 'Paper 1', '0', ''),
(27, 8, 'Paper 2', '0', ''),
(28, 8, 'Paper 3', '0', ''),
(29, 9, 'Paper 1', '0', ''),
(30, 9, 'Paper 2', '0', ''),
(31, 9, 'Paper 3', '0', ''),
(32, 10, 'Paper 1', '0', ''),
(33, 10, 'Paper 2', '0', ''),
(34, 10, 'Paper 3', '0', ''),
(35, 11, 'Paper 1', '0', ''),
(36, 11, 'Paper 2', '0', ''),
(37, 12, 'Paper 1', '0', ''),
(38, 12, 'Paper 2', '0', ''),
(39, 12, 'Paper 3', '0', ''),
(40, 13, 'Paper 1', '0', ''),
(41, 13, 'Paper 2', '0', ''),
(42, 13, 'Paper 3', '0', ''),
(43, 14, 'Paper 1', '0', ''),
(44, 14, 'Paper 2', '0', ''),
(45, 14, 'Paper 3', '0', ''),
(46, 15, 'Paper 1', '0', ''),
(47, 15, 'Paper 2', '0', ''),
(48, 16, 'Paper 1', '0', ''),
(49, 16, 'Paper 2', '0', ''),
(50, 16, 'Paper 3', '0', ''),
(51, 16, 'Paper 4', '0', ''),
(52, 16, 'Paper 5', '0', ''),
(53, 16, 'Paper 6', '0', ''),
(54, 17, 'paper 1', '0', ''),
(55, 17, 'Paper 2', '0', ''),
(56, 17, 'Paper 3', '0', ''),
(57, 18, 'paper 1', '0', 'trytry'),
(58, 19, 'paper 1', '0', ''),
(59, 19, 'Paper 2', '0', ''),
(60, 20, 'paiyyu', '1', 'uiuyiyui'),
(61, 20, 'uyiyu', '1', 'iuyuiyu');

-- --------------------------------------------------------

--
-- Table structure for table `o_level_optionals`
--

CREATE TABLE `o_level_optionals` (
  `id` int(5) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `o_level_optionals`
--

INSERT INTO `o_level_optionals` (`id`, `subject`, `full_name`) VALUES
(1, 'commerce', 'Commerce'),
(2, 'cre', 'Christian Religious Education'),
(3, 'ent', 'Entreprenurship'),
(4, 'fine_art', 'FIne Art'),
(5, 'agric', 'Agriculture'),
(6, 'luganda', 'Luganda'),
(7, 'lit', 'Litereature'),
(8, 'ire', 'Islamic Religious Education'),
(9, 'computer', 'Computer Studies');

-- --------------------------------------------------------

--
-- Table structure for table `o_level_students`
--

CREATE TABLE `o_level_students` (
  `id` int(5) NOT NULL,
  `school_id` int(5) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `second_name` varchar(50) NOT NULL,
  `index_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `o_level_students`
--

INSERT INTO `o_level_students` (`id`, `school_id`, `first_name`, `second_name`, `index_no`) VALUES
(16, 30, 'Marvin', 'Sendikaddiwa', '15/u/1554');

-- --------------------------------------------------------

--
-- Table structure for table `o_level_student_marks`
--

CREATE TABLE `o_level_student_marks` (
  `id` int(5) NOT NULL,
  `subject_paper_id` int(5) NOT NULL,
  `marks` double(5,2) NOT NULL DEFAULT '0.00',
  `student_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `o_level_student_marks`
--

INSERT INTO `o_level_student_marks` (`id`, `subject_paper_id`, `marks`, `student_id`) VALUES
(5, 1, 90.37, 2),
(6, 2, 56.03, 2),
(7, 3, 9.03, 2),
(8, 4, 77.05, 2),
(181, 1, 4.00, 16),
(182, 2, 8.00, 16),
(183, 3, 14.00, 16),
(184, 4, 14.00, 16),
(185, 5, 15.00, 16),
(186, 6, 15.00, 16),
(187, 7, 84.00, 16),
(188, 8, 45.00, 16),
(189, 9, 54.00, 16),
(190, 10, 73.00, 16),
(191, 12, 64.00, 16),
(192, 13, 80.00, 16),
(193, 14, 74.00, 16),
(194, 16, 68.00, 16),
(195, 17, 70.00, 16),
(196, 19, 64.00, 16),
(197, 20, 70.00, 16),
(198, 25, 67.00, 16),
(199, 26, 68.00, 16),
(200, 23, 58.00, 16),
(201, 24, 38.00, 16);

-- --------------------------------------------------------

--
-- Table structure for table `o_level_subejcts`
--

CREATE TABLE `o_level_subejcts` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `subject_code` varchar(20) NOT NULL,
  `is_core` enum('0','1') NOT NULL DEFAULT '0',
  `no_of_papers_done` tinyint(2) NOT NULL DEFAULT '1',
  `short_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `o_level_subejcts`
--

INSERT INTO `o_level_subejcts` (`id`, `name`, `subject_code`, `is_core`, `no_of_papers_done`, `short_name`) VALUES
(1, 'English', 'tyty', '1', 2, 'Eng'),
(2, 'Mathematics', 'mth', '1', 2, 'Mat'),
(3, 'Biology', 'hgh', '1', 3, 'Bio'),
(4, 'Physics', 'ytyt', '1', 3, 'Phy'),
(5, 'Chemistry', 'tr', '1', 3, 'Che'),
(6, 'History', 'hg', '1', 2, 'His'),
(7, 'Geography', 'hg', '1', 2, 'Geo'),
(8, 'Commerce', 'h', '0', 1, 'Com'),
(9, 'Christian Religious Education', 'bn', '0', 2, 'Chr'),
(10, 'Entrepreneurship Educ', 'nb', '0', 2, 'Ent'),
(11, 'Fine Art', 'ghhg', '0', 2, 'Fin'),
(12, 'Agric', 'jh', '0', 2, 'Agr'),
(13, 'Luganda', 'hg', '0', 2, 'Lug'),
(14, 'Lusoga', 'nb', '0', 2, 'Lus'),
(15, 'Lunyakyitara', '', '0', 1, 'Lun'),
(17, 'French', '', '0', 1, 'Fre'),
(18, 'Arabic', '', '0', 1, 'Ara'),
(19, 'Litereature', '', '0', 1, 'Lit'),
(21, 'Computer Studies', '', '0', 1, 'Com'),
(22, 'Accounts', '', '0', 1, 'Acc'),
(23, 'Clothing''s and Textiles', '', '0', 1, 'Clo');

-- --------------------------------------------------------

--
-- Table structure for table `o_level_subejcts_papers`
--

CREATE TABLE `o_level_subejcts_papers` (
  `id` int(5) NOT NULL,
  `subject_id` int(5) NOT NULL,
  `paper_code` varchar(20) NOT NULL,
  `is_default` enum('0','1') NOT NULL DEFAULT '0',
  `paper_name` varchar(20) NOT NULL,
  `marked_out_of` double(5,2) NOT NULL DEFAULT '100.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `o_level_subejcts_papers`
--

INSERT INTO `o_level_subejcts_papers` (`id`, `subject_id`, `paper_code`, `is_default`, `paper_name`, `marked_out_of`) VALUES
(1, 1, 'Paper 1', '1', 'yt', 50.00),
(2, 1, 'Paper 2', '1', 'yt', 50.00),
(3, 2, 'Paper 1', '1', 'df', 50.00),
(4, 2, 'Paper 2', '1', 'df', 50.00),
(5, 3, 'Paper 1', '1', 'df', 50.00),
(6, 3, 'Paper 2', '1', 'df', 50.00),
(7, 3, 'Paper 3', '1', 'df', 50.00),
(8, 4, 'Paper 1', '1', 'fd', 50.00),
(9, 4, 'Paper 2', '1', 'fd', 50.00),
(10, 4, 'Paper 3', '1', 'df', 50.00),
(11, 4, 'Paper 4', '0', '', 50.00),
(12, 5, 'Paper 1', '1', 'df', 50.00),
(13, 5, 'Paper 2', '1', 'df', 50.00),
(14, 5, 'Paper 3', '1', 'fd', 50.00),
(15, 5, 'Paper 4', '0', '', 50.00),
(16, 6, 'Paper 1', '1', 'df', 50.00),
(17, 6, 'Paper 2', '1', 'fd', 50.00),
(18, 6, 'Paper 4', '0', '', 50.00),
(19, 7, 'Paper 1', '1', 'fd', 50.00),
(20, 7, 'Paper 2', '1', 'fd', 50.00),
(21, 8, 'Paper 1', '1', 'new', 50.00),
(22, 9, 'Paper 1', '1', 'fd', 50.00),
(23, 10, 'Paper 1', '1', 'fd', 50.00),
(24, 10, 'Paper 2', '1', 'fd', 50.00),
(25, 11, 'Paper 1', '1', 'fd', 50.00),
(26, 11, 'Paper 2', '1', 'fd', 50.00),
(27, 11, 'Paper 3', '1', 'fd', 50.00),
(28, 11, 'Paper 4', '0', '', 50.00),
(29, 12, 'Paper 1', '1', 'fd', 50.00),
(30, 12, 'Paper 2', '1', 'fd', 50.00),
(31, 13, 'Paper 1', '1', 'fd', 50.00),
(32, 13, 'Paper 2', '0', '', 50.00),
(33, 14, 'Paper 1', '1', 'fd', 50.00),
(34, 14, 'Paper 2', '1', 'fd', 50.00),
(35, 15, 'Paper 1', '1', 'fd', 50.00),
(36, 15, 'Paper 2', '1', 'fd', 50.00),
(38, 17, 'Paper 1', '1', 'fd', 50.00),
(39, 17, 'Paper 2', '1', 'fd', 50.00),
(40, 17, 'Paper 3', '0', '', 50.00),
(41, 18, 'Paper 1', '0', '', 50.00),
(42, 18, 'Paper 2', '0', '', 50.00),
(43, 19, 'Paper 1', '0', '', 50.00),
(46, 21, 'Paper 1', '0', '', 50.00),
(47, 21, 'Paper 2', '0', '', 50.00),
(48, 22, 'paper 1', '0', '', 50.00),
(49, 23, 'Paper 1', '0', 'fdgdfg', 50.00),
(50, 23, 'Paper 2', '0', 'tgtrtr', 50.00),
(55, 9, 'Paper 2', '1', 'fd', 50.00);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`) VALUES
(1, 'Settings'),
(2, 'Students'),
(3, 'Results'),
(4, 'Reports'),
(5, 'Schools');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(5) NOT NULL,
  `name` varchar(500) NOT NULL,
  `no_of_students` int(5) NOT NULL,
  `district` varchar(100) NOT NULL,
  `center_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `no_of_students`, `district`, `center_no`) VALUES
(20, 'Mita kawempe college ss', 55, 'kololo', '44545'),
(25, 'Makerere college', 55, 'kololo', '44545'),
(28, 'Bat valley', 55, 'kololo', '44545'),
(29, 'Kaboja', 55, 'kololo', '44545'),
(30, 'Kitante Hill School', 78, 'kampala', '566/44');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `1` int(11) NOT NULL,
  `2` int(11) NOT NULL,
  `3` int(11) NOT NULL,
  `4` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `password`) VALUES
(1, 'admin', '\r/B$CÕI¢Ü–*ÇVA'),
(4, 'judith', '_²õÔüW¡<}nMÜãä'),
(6, 'test', 'MÁ\0Ã''Œ¡À›²-‡'),
(7, 'juliana', 'MÁ\0Ã''Œ¡À›²-‡');

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `perm_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `user_id`, `perm_id`) VALUES
(50, 1, 1),
(51, 1, 2),
(52, 1, 3),
(53, 1, 4),
(54, 1, 5),
(56, 6, 1),
(57, 7, 2),
(58, 7, 3),
(62, 4, 1),
(63, 4, 2),
(64, 4, 3),
(65, 4, 4),
(66, 4, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `a_level_combinations`
--
ALTER TABLE `a_level_combinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_level_students`
--
ALTER TABLE `a_level_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_level_student_marks`
--
ALTER TABLE `a_level_student_marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_level_subejcts`
--
ALTER TABLE `a_level_subejcts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_level_subejcts_papers`
--
ALTER TABLE `a_level_subejcts_papers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `o_level_optionals`
--
ALTER TABLE `o_level_optionals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `o_level_students`
--
ALTER TABLE `o_level_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `o_level_student_marks`
--
ALTER TABLE `o_level_student_marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `o_level_subejcts`
--
ALTER TABLE `o_level_subejcts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `o_level_subejcts_papers`
--
ALTER TABLE `o_level_subejcts_papers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `perm_id` (`perm_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `a_level_combinations`
--
ALTER TABLE `a_level_combinations`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `a_level_students`
--
ALTER TABLE `a_level_students`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `a_level_student_marks`
--
ALTER TABLE `a_level_student_marks`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `a_level_subejcts`
--
ALTER TABLE `a_level_subejcts`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `a_level_subejcts_papers`
--
ALTER TABLE `a_level_subejcts_papers`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `o_level_students`
--
ALTER TABLE `o_level_students`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `o_level_student_marks`
--
ALTER TABLE `o_level_student_marks`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;
--
-- AUTO_INCREMENT for table `o_level_subejcts`
--
ALTER TABLE `o_level_subejcts`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `o_level_subejcts_papers`
--
ALTER TABLE `o_level_subejcts_papers`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD CONSTRAINT `user_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_permissions_ibfk_2` FOREIGN KEY (`perm_id`) REFERENCES `permissions` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
