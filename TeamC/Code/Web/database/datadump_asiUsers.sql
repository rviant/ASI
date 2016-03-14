-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Nov 21, 2015 at 05:56 PM
-- Server version: 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `asi`
--

-- --------------------------------------------------------

--
-- Table structure for table `management`
--
DROP TABLE IF EXISTS `management`;
CREATE TABLE `management` (
`managementID` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `middleName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `accountLocked` tinyint(1) DEFAULT NULL,
  `forgotPasswordCode` int(11) DEFAULT NULL,
  `forgotPasswordRequests` int(5) DEFAULT '0',
  `loginRequests` int(5) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;

INSERT INTO `management` (`managementID`, `firstName`, `middleName`, `lastName`, `username`, `password`, `email`, `phone`, `accountLocked`, `forgotPasswordCode`, `forgotPasswordRequests`, `loginRequests`) VALUES
(1, 'Myrian', '', 'Herlle', 'mherlle', '$2y$10$6Ar3NwMBQxK7zCCAK9WGAe1TGF9Qw5qmas5CBGKTAgE43iqUTrDKu', 'mherlle@fiu.edu', '3053487900', NULL, NULL, 0, 3);

UNLOCK TABLES;
-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `studentID` int(11) NOT NULL,
  `day` varchar(255) NOT NULL,
  `hour` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--
LOCK TABLES `schedule` WRITE;


UNLOCK TABLES;


-- --------------------------------------------------------

--
-- Table structure for table `students`
--
--
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `studentID` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `middleName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `universityID` int(11) NOT NULL,
  `accountLocked` tinyint(1) DEFAULT NULL,
  `forgotPasswordCode` int(11) DEFAULT NULL,
  `forgotPasswordRequests` int(5) DEFAULT '0',
  `loginRequests` int(5) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
INSERT INTO `students` (`studentID`, `firstName`, `middleName`, `lastName`, `username`, `password`, `email`, `phone`, `universityID`, `accountLocked`, `forgotPasswordCode`, `forgotPasswordRequests`, `loginRequests`) VALUES
(0, 'eric', 'frank', 'aguiar', 'eric', '$2y$10$ENj41Xkgm/DKn.HdmPE.K.znbrELqLykuIW1IqmwUiA5E13PXrr7W', 'eagui037@fiu.edu', '3058675309', 5878909, NULL, NULL, 0, 0),
(1, 'clark', '', 'kent', 'superman', '$2y$10$ENj41Xkgm/DKn.HdmPE.K.znbrELqLykuIW1IqmwUiA5E13PXrr7W', 'superman@gmail.com', '3056781234', 2950289, NULL, NULL, 0, 0),
(2, 'bruce', '', 'wayne', 'batman', '$2y$10$ENj41Xkgm/DKn.HdmPE.K.znbrELqLykuIW1IqmwUiA5E13PXrr7W', 'batman@gmail.com', '3056783456', 1234567, NULL, NULL, 0, 0),
(3, 'barry', '', 'allen', 'flash', '$2y$10$ENj41Xkgm/DKn.HdmPE.K.znbrELqLykuIW1IqmwUiA5E13PXrr7W', 'flash@gmail.com', '3056099250', 9876543, NULL, NULL, 0, 0);

UNLOCK TABLES;


-- --------------------------------------------------------

--
-- Table structure for table `tutors`
--

DROP TABLE IF EXISTS `tutors`;
CREATE TABLE `tutors` (
`tutorID` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `middleName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `accountLocked` tinyint(1) DEFAULT NULL,
  `forgotPasswordCode` int(11) DEFAULT NULL,
  `forgotPasswordRequests` int(5) DEFAULT '0',
  `loginRequests` int(5) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--
LOCK TABLES `tutors` WRITE;

INSERT INTO `tutors` (`tutorID`, `firstName`, `middleName`, `lastName`, `username`, `password`, `email`, `phone`, `accountLocked`, `forgotPasswordCode`, `forgotPasswordRequests`, `loginRequests`) VALUES
(0, 'hal', '', 'jordan', 'greenlatern', 'tutorpassword', 'greenlatern@gmail.com', '3056879234', NULL, NULL, 0, 0),
(1, 'oliver', '', 'queen', 'greenarrow', 'tutorpassword', 'greenarrow@gmail.com', '3056783948', NULL, NULL, 0, 0),
(2, 'jimmy', '', 'johns', 'jimmyjohns', 'tutorpassword', 'jj@gmail.com', '3056981736', NULL, NULL, 0, 0),
(3, 'peter', '', 'parker', 'spiderman', 'tutorpassword', 'spiderman@gmail.com', '7868675309', NULL, NULL, 0, 0);


UNLOCK TABLES;


-- --------------------------------------------------------

--
-- Table structure for table `tutor_session`
--

DROP TABLE IF EXISTS `tutor_session`;
CREATE TABLE `tutor_session` (
`sessionID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `tutorID` int(11) NOT NULL,
  `day` varchar(30) NOT NULL,
  `hour` varchar(30) NOT NULL,
  `courseNumber` varchar(30) NOT NULL,
  `courseTitle` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--
LOCK TABLES `tutor_session` WRITE;

INSERT INTO `tutor_session` (`sessionID`, `studentID`, `tutorID`, `day`, `hour`, `courseNumber`, `courseTitle`) VALUES
(1, 2, 3, 'monday', '2:00 pm', 'cda 4101', 'computer organization'),
(2, 1, 2, 'tuesday', '1:00 pm', 'mad 3512', 'algorithms'),
(3, 1, 3, 'wednesday', '3:00 pm', 'cop 4710', 'database'),
(4, 0, 3, 'thursday', '11:00 am', 'cop 4610', 'operating systems');

UNLOCK TABLES;









