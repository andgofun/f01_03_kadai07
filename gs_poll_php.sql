-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2018 年 9 朁E27 日 14:20
-- サーバのバージョン： 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gs_poll_php`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
`id` int(11) NOT NULL,
  `answer` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `remote_addr` varchar(15) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `answer_date` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `answers`
--

INSERT INTO `answers` (`id`, `answer`, `created`, `remote_addr`, `user_agent`, `answer_date`) VALUES
(1, 1, '2018-09-27 20:47:11', NULL, NULL, NULL),
(2, 2, '2018-09-27 20:47:16', NULL, NULL, NULL),
(3, 1, '2018-09-27 20:49:46', NULL, NULL, NULL),
(4, 2, '2018-09-27 20:53:57', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '2018-09-27'),
(6, 0, '2018-09-27 20:54:52', NULL, NULL, NULL),
(7, 0, '2018-09-27 20:55:03', NULL, NULL, NULL),
(8, 0, '2018-09-27 20:58:31', NULL, NULL, NULL),
(9, 0, '2018-09-27 20:58:52', NULL, NULL, NULL),
(10, 0, '2018-09-27 20:59:14', NULL, NULL, NULL),
(11, 1, '2018-09-27 21:01:20', NULL, NULL, NULL),
(12, 2, '2018-09-27 21:01:23', NULL, NULL, NULL),
(13, 1, '2018-09-27 21:01:27', NULL, NULL, NULL),
(14, 1, '2018-09-27 21:01:37', NULL, NULL, NULL),
(15, 2, '2018-09-27 21:02:09', NULL, NULL, NULL),
(16, 0, '2018-09-27 21:15:09', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_answer` (`remote_addr`,`user_agent`,`answer_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
