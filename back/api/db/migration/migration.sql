-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 07 mai 2024 à 12:32
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `boutiquejs`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Description` varchar(500) DEFAULT NULL,
    `Marque` varchar(50) NOT NULL ,
    `Model` varchar(50) NOT NULL,
    `Ref` varchar(50) NOT NULL,
    `Fab` varchar(30) NOT NULL,
    `Dimension` varchar(15) NOT NULL,
    `Matiere` varchar(20) NOT NULL ,
    `Color` varchar(20) NOT NULL ,
    `Movement` varchar(30) NOT NULL ,
    `Complications` varchar(200) NOT NULL ,
    `Waterproof` varchar(10) DEFAULT NULL ,
    `Bracelet` varchar(20) NOT NULL ,
    `Color_Bracelet` varchar(20) NOT NULL ,
    `Availability` varchar(20) NOT NULL ,
    `Price` int NOT NULL,
    `Reduction` int DEFAULT NULL,
    `Stock` int NOT NULL,
    PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `URL` varchar(10) DEFAULT NULL,
  `Id_Article` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (Id_Article) REFERENCES article(Id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
