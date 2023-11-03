-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2023 at 06:21 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `humeur`
--

CREATE TABLE `humeur` (
  `id` int(60) NOT NULL,
  `DATE` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  `sentiment` varchar(60) NOT NULL,
  `token` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temps`
--

CREATE TABLE `temps` (
  `id` int(11) NOT NULL,
  `id_employé` int(11) NOT NULL,
  `heure_debut` time NOT NULL,
  `heure_fin` time DEFAULT NULL,
  `pause_debut` time DEFAULT NULL,
  `pause_fin` time DEFAULT NULL,
  `date_j` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `temps`
--

INSERT INTO `temps` (`id`, `id_employé`, `heure_debut`, `heure_fin`, `pause_debut`, `pause_fin`, `date_j`) VALUES
(66, 1, '09:49:00', '14:08:00', '13:30:00', '13:30:00', '2023-10-31'),
(67, 1, '09:50:00', '14:08:00', '13:30:00', '13:30:00', '2023-11-01'),
(68, 1, '09:52:00', '14:08:00', '13:30:00', '13:30:00', '2023-11-02'),
(69, 1, '09:53:00', '14:08:00', '13:30:00', '13:30:00', '2023-11-03'),
(70, 1, '10:11:00', '14:08:00', '13:30:00', '13:30:00', '2023-11-06'),
(75, 1, '10:12:00', '14:08:00', '13:30:00', '13:30:00', '2023-11-07'),
(79, 1, '10:13:00', '14:08:00', '13:30:00', '13:30:00', '2023-11-08'),
(85, 1, '10:14:00', '14:08:00', '13:30:00', '13:30:00', '2023-11-09'),
(86, 1, '10:22:00', '14:08:00', '13:30:00', '13:30:00', '2023-11-10'),
(94, 4, '17:23:00', '17:23:00', '17:23:00', '17:23:00', '2023-11-03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prénom` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nom`, `prénom`, `email`, `password`, `role`) VALUES
(1, 'Dakak', 'Fatima', 'fatima.dakak@gmail.com', 'fatima', 'employee'),
(2, 'Elhor', 'Taha', 'elhor.tah@gmail.com', '123', 'admin'),
(4, 'JAMAL', 'Ghada', 'ghada@gmail.com', 'ghada', 'employee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `humeur`
--
ALTER TABLE `humeur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temps`
--
ALTER TABLE `temps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employé` (`id_employé`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `humeur`
--
ALTER TABLE `humeur`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `temps`
--
ALTER TABLE `temps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `temps`
--
ALTER TABLE `temps`
  ADD CONSTRAINT `temps_ibfk_1` FOREIGN KEY (`id_employé`) REFERENCES `users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
