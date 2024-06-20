-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2024 at 12:22 AM
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
-- Database: `mandegar`
--

-- --------------------------------------------------------

--
-- Table structure for table `st_education_info`
--

CREATE TABLE `st_education_info` (
  `id` int(11) NOT NULL,
  `last_heigh_school` varchar(30) NOT NULL,
  `last_avrage` varchar(5) NOT NULL,
  `last_enzebat` varchar(5) NOT NULL,
  `last_karname` varchar(30) NOT NULL,
  `st_id_no` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `st_education_info`
--

INSERT INTO `st_education_info` (`id`, `last_heigh_school`, `last_avrage`, `last_enzebat`, `last_karname`, `st_id_no`) VALUES
(1, 'امام صادق', '14.26', '', '', ''),
(2, 'امام صادق', '14.26', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `st_fa_reg`
--

CREATE TABLE `st_fa_reg` (
  `id` int(11) NOT NULL,
  `fa_fname` varchar(30) NOT NULL,
  `fa_job` varchar(30) NOT NULL,
  `fa_phone` varchar(30) NOT NULL,
  `fa_id_no` varchar(10) NOT NULL,
  `fa_education` varchar(30) NOT NULL,
  `fa_work_address` text NOT NULL,
  `st_id_no` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `st_fa_reg`
--

INSERT INTO `st_fa_reg` (`id`, `fa_fname`, `fa_job`, `fa_phone`, `fa_id_no`, `fa_education`, `fa_work_address`, `st_id_no`) VALUES
(1, 'ali', '', '', '0372647170', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `st_mo_reg`
--

CREATE TABLE `st_mo_reg` (
  `id` int(11) NOT NULL,
  `mo_fname` varchar(30) NOT NULL,
  `mo_lname` varchar(30) NOT NULL,
  `mo_job` varchar(30) NOT NULL,
  `mo_phone` varchar(11) NOT NULL,
  `mo_id_no` varchar(10) NOT NULL,
  `mo_education` varchar(30) NOT NULL,
  `mo_work_address` varchar(30) NOT NULL,
  `st_id_no` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `st_mo_reg`
--

INSERT INTO `st_mo_reg` (`id`, `mo_fname`, `mo_lname`, `mo_job`, `mo_phone`, `mo_id_no`, `mo_education`, `mo_work_address`, `st_id_no`) VALUES
(1, 'ali', '', '', '', '0372647170', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `st_reg_info`
--

CREATE TABLE `st_reg_info` (
  `id` int(11) NOT NULL,
  `st_fname` varchar(30) NOT NULL,
  `st_lname` varchar(30) NOT NULL,
  `st_faname` varchar(30) NOT NULL,
  `st_brithdate` date NOT NULL,
  `st_brithplace` varchar(30) NOT NULL,
  `st_id_card_exportion` varchar(30) NOT NULL,
  `st_phone` varchar(11) NOT NULL,
  `st_home_phone` varchar(8) NOT NULL,
  `st_address` text NOT NULL,
  `st_personal_pic` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `st_reg_info`
--

INSERT INTO `st_reg_info` (`id`, `st_fname`, `st_lname`, `st_faname`, `st_brithdate`, `st_brithplace`, `st_id_card_exportion`, `st_phone`, `st_home_phone`, `st_address`, `st_personal_pic`) VALUES
(1, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(2, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(3, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(4, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(5, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(6, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(7, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(8, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(9, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(10, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(11, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(12, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(13, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(14, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(15, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(16, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(17, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(18, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(19, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(20, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(21, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(22, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(23, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(24, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(25, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(26, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(27, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(28, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', ''),
(29, 'Jason', 'hodson', '', '0000-00-00', '', '', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `st_education_info`
--
ALTER TABLE `st_education_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `st_fa_reg`
--
ALTER TABLE `st_fa_reg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `st_mo_reg`
--
ALTER TABLE `st_mo_reg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `st_reg_info`
--
ALTER TABLE `st_reg_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `st_education_info`
--
ALTER TABLE `st_education_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `st_fa_reg`
--
ALTER TABLE `st_fa_reg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `st_mo_reg`
--
ALTER TABLE `st_mo_reg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `st_reg_info`
--
ALTER TABLE `st_reg_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
