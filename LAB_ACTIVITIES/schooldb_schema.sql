-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2026 at 04:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schooldb_schema`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(100) NOT NULL,
  `Department` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`CourseID`, `CourseName`, `Department`) VALUES
(101, 'Introduction to Computer Science', 'Computer Science'),
(102, 'Calculus I', 'Mathematics'),
(103, 'English Composition', 'English'),
(104, 'Physics 101', 'Physics'),
(105, 'Psychology 101', 'Psychology');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `EnrollmentID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `EnrollmentDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`EnrollmentID`, `StudentID`, `CourseID`, `EnrollmentDate`) VALUES
(1, 1, 101, '2024-01-15'),
(2, 1, 103, '2024-01-15'),
(5, 3, 101, '2024-01-15'),
(6, 3, 104, '2024-01-17'),
(7, 4, 104, '2024-01-18'),
(8, 4, 102, '2024-01-18'),
(9, 5, 103, '2024-01-19'),
(10, 5, 105, '2024-01-19'),
(11, 6, 105, '2024-01-20'),
(12, 6, 101, '2024-01-20'),
(13, 7, 101, '2024-01-21'),
(14, 7, 102, '2024-01-21'),
(15, 8, 102, '2024-01-22'),
(16, 8, 104, '2024-01-22'),
(17, 9, 104, '2024-01-23'),
(18, 9, 103, '2024-01-23'),
(19, 10, 103, '2024-01-24'),
(20, 10, 105, '2024-01-24');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Course` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `Name`, `Age`, `Course`) VALUES
(1, 'John Smith', 19, 'Computer Science'),
(3, 'Michael Brown', 21, 'Computer Science'),
(4, 'Sophia Garcia', 19, 'Physics'),
(5, 'William Jones', 22, 'English'),
(6, 'Olivia Davis', 20, 'Psychology'),
(7, 'James Wilson', 21, 'Computer Science'),
(8, 'Isabella Martinez', 19, 'Mathematics'),
(9, 'Benjamin Taylor', 20, 'Physics'),
(10, 'Mia Anderson', 22, 'English');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`CourseID`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`EnrollmentID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
