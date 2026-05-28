-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2026 at 02:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fakultet`
--

-- --------------------------------------------------------

--
-- Table structure for table `izabranipredmet`
--

CREATE TABLE `izabranipredmet` (
  `StudentID` int(11) NOT NULL,
  `PredmetID` int(11) NOT NULL,
  `GodinaSlusanja` int(11) DEFAULT NULL,
  `Odslusao` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `izabranipredmet`
--

INSERT INTO `izabranipredmet` (`StudentID`, `PredmetID`, `GodinaSlusanja`, `Odslusao`) VALUES
(1, 2, 2024, b'1'),
(1, 3, 2025, b'1'),
(1, 5, 2026, b'0'),
(1, 6, 2024, b'1'),
(2, 2, 2024, b'1'),
(2, 3, 2025, b'0'),
(2, 6, 2026, b'1'),
(2, 7, 2025, b'1'),
(3, 5, 2026, b'1'),
(3, 7, 2024, b'1'),
(3, 8, 2025, b'1'),
(3, 9, 2026, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `kontakt_informacije`
--

CREATE TABLE `kontakt_informacije` (
  `KontaktID` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `ProfesorID` int(11) DEFAULT NULL,
  `DatumKontakta` date DEFAULT NULL,
  `TipID` int(11) DEFAULT NULL,
  `Detalji` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `predmet`
--

CREATE TABLE `predmet` (
  `PredmetID` int(11) NOT NULL,
  `SifraPredmeta` varchar(20) DEFAULT NULL,
  `Predmet` varchar(100) DEFAULT NULL,
  `Semestar` int(11) DEFAULT NULL,
  `Opis` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `predmet`
--

INSERT INTO `predmet` (`PredmetID`, `SifraPredmeta`, `Predmet`, `Semestar`, `Opis`) VALUES
(2, 'MAT101', 'Matematika I', 1, 'Osnovni kurs matematike'),
(3, 'PRG102', 'Programiranje', 1, 'Uvod u programiranje u Javi'),
(5, 'WEB201', 'Web Programiranje', 2, 'HTML CSS JavaScript i PHP'),
(6, 'BPS202', 'Baze Podataka', 2, 'Rad sa relacionim bazama podataka'),
(7, 'MRE301', 'Racunarske Mreze', 3, 'Osnove racunarskih mreza'),
(8, 'SOF302', 'Softversko Inzenjerstvo', 3, 'Projektovanje softvera'),
(9, 'OOP203', 'Objektno Orijentisano Programiranje', 2, 'Napredna Java i OOP koncepti');

-- --------------------------------------------------------

--
-- Table structure for table `profesor`
--

CREATE TABLE `profesor` (
  `ProfesorID` int(11) NOT NULL,
  `Ime` varchar(50) DEFAULT NULL,
  `Prezime` varchar(50) DEFAULT NULL,
  `DatumRodjenja` date DEFAULT NULL,
  `Telefon` varchar(30) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL,
  `Ime` varchar(50) DEFAULT NULL,
  `Prezime` varchar(50) DEFAULT NULL,
  `BrojIndeksa` varchar(20) DEFAULT NULL,
  `DatumRodjenja` date DEFAULT NULL,
  `Adresa` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefon` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `Ime`, `Prezime`, `BrojIndeksa`, `DatumRodjenja`, `Adresa`, `Email`, `Telefon`) VALUES
(1, 'Marko', 'Markovic', 'RA101/2023', '2003-05-10', 'Beograd', 'marko@gmail.com', '061111111'),
(2, 'Nikola', 'Nikolic', 'RA102/2023', '2002-09-15', 'Novi Sad', 'nikola@gmail.com', '062222222'),
(3, 'Jovana', 'Jovanovic', 'RA103/2023', '2003-01-20', 'Nis', 'jovana@gmail.com', '063333333');

-- --------------------------------------------------------

--
-- Table structure for table `tip`
--

CREATE TABLE `tip` (
  `TipID` int(11) NOT NULL,
  `Naziv` varchar(50) DEFAULT NULL,
  `Opis` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `izabranipredmet`
--
ALTER TABLE `izabranipredmet`
  ADD PRIMARY KEY (`StudentID`,`PredmetID`),
  ADD KEY `PredmetID` (`PredmetID`);

--
-- Indexes for table `kontakt_informacije`
--
ALTER TABLE `kontakt_informacije`
  ADD PRIMARY KEY (`KontaktID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `ProfesorID` (`ProfesorID`),
  ADD KEY `TipID` (`TipID`);

--
-- Indexes for table `predmet`
--
ALTER TABLE `predmet`
  ADD PRIMARY KEY (`PredmetID`);

--
-- Indexes for table `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`ProfesorID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`);

--
-- Indexes for table `tip`
--
ALTER TABLE `tip`
  ADD PRIMARY KEY (`TipID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kontakt_informacije`
--
ALTER TABLE `kontakt_informacije`
  MODIFY `KontaktID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `predmet`
--
ALTER TABLE `predmet`
  MODIFY `PredmetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `profesor`
--
ALTER TABLE `profesor`
  MODIFY `ProfesorID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tip`
--
ALTER TABLE `tip`
  MODIFY `TipID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `izabranipredmet`
--
ALTER TABLE `izabranipredmet`
  ADD CONSTRAINT `izabranipredmet_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  ADD CONSTRAINT `izabranipredmet_ibfk_2` FOREIGN KEY (`PredmetID`) REFERENCES `predmet` (`PredmetID`);

--
-- Constraints for table `kontakt_informacije`
--
ALTER TABLE `kontakt_informacije`
  ADD CONSTRAINT `kontakt_informacije_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  ADD CONSTRAINT `kontakt_informacije_ibfk_2` FOREIGN KEY (`ProfesorID`) REFERENCES `profesor` (`ProfesorID`),
  ADD CONSTRAINT `kontakt_informacije_ibfk_3` FOREIGN KEY (`TipID`) REFERENCES `tip` (`TipID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
