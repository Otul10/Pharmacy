-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2019 at 06:17 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointworker`
--

CREATE TABLE `appointworker` (
  `workerid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `workerid` int(11) NOT NULL,
  `workerphone` int(11) NOT NULL,
  `worker_city` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`workerid`, `workerphone`, `worker_city`) VALUES
(1, 1367990037, 'uttara'),
(2, 1728949894, 'bashundhara'),
(3, 1987757544, 'mirpur');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicineid` int(11) NOT NULL,
  `manufacturedate` date NOT NULL,
  `name` varchar(60) NOT NULL,
  `generic` varchar(300) NOT NULL,
  `pharmaceutical` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `expirationdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `onlineorders`
--

CREATE TABLE `onlineorders` (
  `orderid` int(11) NOT NULL,
  `orderdate` datetime NOT NULL,
  `deliverydate` datetime NOT NULL,
  `medname` varchar(60) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_city` varchar(60) NOT NULL,
  `workerid` int(11) NOT NULL,
  `TotalCost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderedrelation`
--

CREATE TABLE `orderedrelation` (
  `orderid` int(11) NOT NULL,
  `medicineid` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `DOB` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `user_city` varchar(20) NOT NULL,
  `phone` int(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`, `email`, `DOB`, `address`, `user_city`, `phone`, `password`) VALUES
(1, 'Shibly567', 'shibly.hossain@gmail.com', '1980-09-10', 'House 35, Modhdhapaikpara, mirpur, dhaka', 'mirpur', 191579932, 'shibly123'),
(2, 'mafuzurislam', 'mafuz12@gmail.com', '1996-08-06', 'house 2, road 7, block c bashundhara r/a ', 'bashundhara', 1712395859, 'uhuh8479879');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointworker`
--
ALTER TABLE `appointworker`
  ADD KEY `orderid` (`orderid`),
  ADD KEY `workerid` (`workerid`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`workerid`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicineid`);

--
-- Indexes for table `onlineorders`
--
ALTER TABLE `onlineorders`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `workerid` (`workerid`);

--
-- Indexes for table `orderedrelation`
--
ALTER TABLE `orderedrelation`
  ADD KEY `medicineid` (`medicineid`),
  ADD KEY `orderid` (`orderid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicineid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointworker`
--
ALTER TABLE `appointworker`
  ADD CONSTRAINT `appointworker_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `onlineorders` (`orderid`),
  ADD CONSTRAINT `appointworker_ibfk_2` FOREIGN KEY (`workerid`) REFERENCES `delivery` (`workerid`);

--
-- Constraints for table `onlineorders`
--
ALTER TABLE `onlineorders`
  ADD CONSTRAINT `onlineorders_ibfk_1` FOREIGN KEY (`workerid`) REFERENCES `delivery` (`workerid`);

--
-- Constraints for table `orderedrelation`
--
ALTER TABLE `orderedrelation`
  ADD CONSTRAINT `orderedrelation_ibfk_1` FOREIGN KEY (`medicineid`) REFERENCES `medicine` (`medicineid`),
  ADD CONSTRAINT `orderedrelation_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `onlineorders` (`orderid`),
  ADD CONSTRAINT `orderedrelation_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
