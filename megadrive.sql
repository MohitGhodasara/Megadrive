-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2016 at 04:36 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `megadrive`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE IF NOT EXISTS `data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `extensions` varchar(5) NOT NULL,
  `location` varchar(100) NOT NULL,
  `path` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id`, `name`, `extensions`, `location`, `path`) VALUES
(1, 'Movie', 'dir', '0', 'dir'),
(2, 'song', 'dir', '0', 'dir'),
(3, 'Arijit', 'mp4', '1', 'user/Arijit.mp4'),
(4, 'HD', 'dir', '0', 'dir'),
(5, 'Result', 'mp4', '0', 'user/Result.doc'),
(6, '', '', '', ''),
(7, '', '', '', ''),
(8, '', '', '', ''),
(9, '', '', '', ''),
(10, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE IF NOT EXISTS `userinfo` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `userid` varchar(100) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birthdate` date NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `countryid` int(10) NOT NULL,
  `stateid` int(10) NOT NULL,
  `city` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`id`, `name`, `sname`, `userid`, `emailid`, `password`, `gender`, `birthdate`, `mobile`, `countryid`, `stateid`, `city`) VALUES
(1, 'Mohit', 'Ghodasara', 'Mohit123', 'Mohit123@yahoo.com', '123', 'male', '2000-04-30', 9999999999, 1, 1, 1),
(2, 'Bill', 'Gates', 'billgates', 'billgates@mohit.com', '123', 'male', '1955-10-28', 9999999999, 1, 1, 2),
(3, 'larry', 'page', 'lp12345', 'lp12345@yahoo.com', '123', 'male', '2000-01-01', 8888888888, 2, 3, 4),
(4, 'mark', 'zuckerberg', 'mz12345', 'mz12345@yahoo.com', '123', 'male', '1955-10-28', 7777777777, 2, 3, 4),
(5, 'Steve ', 'Jobs', 'sj12345', 'sj12345@yahoo.com', '123', 'male', '1998-01-01', 6666666666, 1, 1, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
