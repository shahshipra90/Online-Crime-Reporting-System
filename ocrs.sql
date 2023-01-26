-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 20, 2018 at 06:55 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ocrs`
--

-- --------------------------------------------------------

--
-- Table structure for table `case_solved_by_information`
--

DROP TABLE IF EXISTS `case_solved_by_information`;
CREATE TABLE IF NOT EXISTS `case_solved_by_information` (
  `Police_Station` varchar(30) NOT NULL,
  `Police_Name` varchar(20) NOT NULL,
  `Police_ID` int(10) NOT NULL,
  `Phone_No` bigint(10) NOT NULL,
  `Designation` varchar(20) NOT NULL,
  `Experience` varchar(10) NOT NULL,
  `Case_No` int(5) NOT NULL,
  PRIMARY KEY (`Case_No`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `case_solved_by_information`
--

INSERT INTO `case_solved_by_information` (`Police_Station`, `Police_Name`, `Police_ID`, `Phone_No`, `Designation`, `Experience`, `Case_No`) VALUES
('Panigate', 'Jinal Soni', 1234, 989875646, 'Commissioner', '4 yrs', 3509);

-- --------------------------------------------------------

--
-- Table structure for table `crime_information`
--

DROP TABLE IF EXISTS `crime_information`;
CREATE TABLE IF NOT EXISTS `crime_information` (
  `Case_No` int(10) NOT NULL,
  `Type_of_case` varchar(10) NOT NULL,
  `Crime` varchar(50) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Address_of_crime_scene` varchar(200) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Date` date DEFAULT NULL,
  `Time` time(6) NOT NULL,
  `Date_of_caught` date NOT NULL,
  `Criminal_ID` int(4) NOT NULL,
  PRIMARY KEY (`Case_No`),
  KEY `Criminal_ID` (`Criminal_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crime_information`
--

INSERT INTO `crime_information` (`Case_No`, `Type_of_case`, `Crime`, `Description`, `Address_of_crime_scene`, `City`, `State`, `Date`, `Time`, `Date_of_caught`, `Criminal_ID`) VALUES
(3509, 'Minor', 'theft', 'snatched ring', ' uma char rasta', 'Vadodara', 'Gujarat', '2018-04-17', '06:32:00.000000', '2018-04-20', 4563);

-- --------------------------------------------------------

--
-- Table structure for table `forgot_password`
--

DROP TABLE IF EXISTS `forgot_password`;
CREATE TABLE IF NOT EXISTS `forgot_password` (
  `Mailid` varchar(40) NOT NULL,
  `OneTimePass` int(10) NOT NULL,
  PRIMARY KEY (`OneTimePass`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personal_information`
--

DROP TABLE IF EXISTS `personal_information`;
CREATE TABLE IF NOT EXISTS `personal_information` (
  `Image` varchar(100) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Phone` bigint(10) NOT NULL,
  `Address` text NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `Age` int(10) NOT NULL,
  `Height` int(10) NOT NULL,
  `Weight` int(10) NOT NULL,
  `Blood_Group` varchar(10) NOT NULL,
  `Eye_Color` varchar(20) NOT NULL,
  `Hair_Color` varchar(20) NOT NULL,
  `Criminal_ID` int(4) NOT NULL,
  PRIMARY KEY (`Criminal_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personal_information`
--

INSERT INTO `personal_information` (`Image`, `Name`, `Gender`, `Phone`, `Address`, `City`, `State`, `DOB`, `Age`, `Height`, `Weight`, `Blood_Group`, `Eye_Color`, `Hair_Color`, `Criminal_ID`) VALUES
('IMG_20160810_115014.jpg', 'Neel Soni', 'male', 7621838283, 'sangam, karelibaug', 'Vadodara', 'Gujarat', '2000-02-26', 18, 4, 55, 'AB+', '#000000', '#000000', 4563);

-- --------------------------------------------------------

--
-- Table structure for table `police_login_master`
--

DROP TABLE IF EXISTS `police_login_master`;
CREATE TABLE IF NOT EXISTS `police_login_master` (
  `username` varchar(20) NOT NULL,
  `password` varchar(70) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `police_login_master`
--

INSERT INTO `police_login_master` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `punishment_information`
--

DROP TABLE IF EXISTS `punishment_information`;
CREATE TABLE IF NOT EXISTS `punishment_information` (
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Jail_Name` varchar(20) NOT NULL,
  `Sentenced_For` varchar(20) NOT NULL,
  `Court_Name` varchar(20) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Time_taken_by_court_to_take_decision` varchar(10) NOT NULL,
  `Current_Status` varchar(20) NOT NULL,
  `Case_No` int(5) NOT NULL,
  PRIMARY KEY (`Case_No`),
  UNIQUE KEY `Case_No` (`Case_No`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `punishment_information`
--

INSERT INTO `punishment_information` (`Start_Date`, `End_Date`, `Jail_Name`, `Sentenced_For`, `Court_Name`, `City`, `Time_taken_by_court_to_take_decision`, `Current_Status`, `Case_No`) VALUES
('2018-04-25', '2018-05-03', 'central jail', '8 days', 'lal court', 'Vadodara', '4 days', 'Relased', 3509);

-- --------------------------------------------------------

--
-- Table structure for table `user_confirmation`
--

DROP TABLE IF EXISTS `user_confirmation`;
CREATE TABLE IF NOT EXISTS `user_confirmation` (
  `Email` varchar(40) NOT NULL,
  `OTP` int(6) NOT NULL,
  PRIMARY KEY (`OTP`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_confirmation`
--

INSERT INTO `user_confirmation` (`Email`, `OTP`) VALUES
('shahshipra90@gmail.com', 2317);

-- --------------------------------------------------------

--
-- Table structure for table `user_reg`
--

DROP TABLE IF EXISTS `user_reg`;
CREATE TABLE IF NOT EXISTS `user_reg` (
  `Victim_Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Victim_Gender` varchar(10) NOT NULL,
  `Victim_Phone` bigint(10) NOT NULL,
  `Emergency_phone` bigint(10) NOT NULL,
  `DOBD` date NOT NULL,
  `Address_of_Victim` varchar(50) NOT NULL,
  `Area_of_Police_Station` varchar(20) NOT NULL,
  `Crime` varchar(50) NOT NULL,
  `Crime_Description` varchar(200) NOT NULL,
  `Address_of_Crime_Scene` varchar(50) NOT NULL,
  `Date_of_Crime` date NOT NULL,
  `Time_of_Crime` time(6) NOT NULL,
  `Reference_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Status` varchar(10) NOT NULL,
  `complain_status` varchar(15) NOT NULL DEFAULT 'View',
  PRIMARY KEY (`Reference_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=9894 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_reg`
--

INSERT INTO `user_reg` (`Victim_Name`, `Email`, `Victim_Gender`, `Victim_Phone`, `Emergency_phone`, `DOBD`, `Address_of_Victim`, `Area_of_Police_Station`, `Crime`, `Crime_Description`, `Address_of_Crime_Scene`, `Date_of_Crime`, `Time_of_Crime`, `Reference_ID`, `Status`, `complain_status`) VALUES
('Shipra Shah', 'shahshipra90@gmail.com', 'female', 9638062066, 7990887071, '1999-08-27', 'ayurvedic char rasta', 'Panigate', 'Theft', 'snatched ring', 'uma char rasta', '2018-04-17', '06:32:00.000000', 3647, 'Solved', 'Reported');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
