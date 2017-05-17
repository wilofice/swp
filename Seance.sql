-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Client :  localhost
-- Généré le :  Mar 16 Mai 2017 à 15:56
-- Version du serveur :  10.1.21-MariaDB
-- Version de PHP :  7.0.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `swp`
--

--
-- Vider la table avant d'insérer `Seance`
--

TRUNCATE TABLE `Seance`;
--
-- Contenu de la table `Seance`
--

INSERT INTO `Seance` (`NumS`, `type`, `NumC`, `NumEmp`, `EtatS`) VALUES
(11, 'seance', 635, 7, 1),
(13, 'seance', 675, 7, 1),
(14, 'seance', 695, 7, 1),
(855, 'seance', 802, 848, 1),
(857, 'examen', 809, 850, 1),
(896, 'seance', 815, 889, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
