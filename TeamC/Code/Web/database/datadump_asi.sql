
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `asi`
--
-- --------------------------------------------------------

--
-- Table structure for table `tutors`
--

CREATE TABLE `tutors` (
  `tutorID` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `middleName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `accountLocked` BOOLEAN DEFAULT NULL,
  `forgotPasswordCode` int(11) DEFAULT NULL,
  `loginRequests` int(5) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

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
  `accountLocked` BOOLEAN DEFAULT NULL,
  `forgotPasswordCode` int(11) DEFAULT NULL,
  `loginRequests` int(5) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `management`
--

CREATE TABLE `management` (
  `managementID` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `middleName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `accountLocked` BOOLEAN DEFAULT NULL,
  `forgotPasswordCode` int(11) DEFAULT NULL,
  `loginRequests` int(5) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `studentID` int(11) NOT NULL,
  `day` varchar(255) NOT NULL,
  `hour` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tutor_session`
--

CREATE TABLE `tutor_session` (
  `sessionID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `tutorID` int(11) NOT NULL,
  `day` varchar(30) NOT NULL,
  `hour` varchar(30) NOT NULL,
  `courseNumber` varchar(30) NOT NULL,
  `courseTitle` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Indexes for table `tutors`
--
ALTER TABLE `tutors`
  ADD PRIMARY KEY (`tutorID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`studentID`);

--
-- Indexes for table `management`
--
ALTER TABLE `management`
  ADD PRIMARY KEY (`managementID`);

--
-- Indexes for table `tutor_session`
--
ALTER TABLE `tutor_session`
  ADD PRIMARY KEY (`sessionID`);


--
-- AUTO_INCREMENT for table `tutors`
--
ALTER TABLE `tutors`
  MODIFY `tutorID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `studentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `management`
--
ALTER TABLE `management`
  MODIFY `managementID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tutor_session`
--
ALTER TABLE `tutor_session`
  MODIFY `sessionID` int(11) NOT NULL AUTO_INCREMENT;



