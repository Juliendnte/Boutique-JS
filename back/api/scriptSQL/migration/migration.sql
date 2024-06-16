-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 23 mai 2024 à 08:56
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
    `Description` varchar(1000) DEFAULT NULL,
    `Id_Marque` int NOT NULL,
    `Model` varchar(200) NOT NULL,
    `Ref` varchar(50) NOT NULL,
    `Id_Fab` int NOT NULL,
    `Dimension` varchar(15) NOT NULL,
    `Id_Matiere` int NOT NULL,
    `Id_Color` int NOT NULL,
    `Id_Movement` int NOT NULL,
    `Complications` varchar(200) NOT NULL,
    `Waterproof` varchar(20) DEFAULT NULL,
    `Id_Bracelet` int NOT NULL,
    `Id_Color_Bracelet` int NOT NULL,
    `Availability` tinyint(1) NOT NULL DEFAULT 1,
    `Price` int NOT NULL,
    `Reduction` int DEFAULT NULL,
    `Stock` int NOT NULL,
    PRIMARY KEY (`Id`),
    KEY `Id_Marque` (`Id_Marque`),
    KEY `Id_Fab` (`Id_Fab`),
    KEY `Id_Matiere` (`Id_Matiere`),
    KEY `Id_Color` (`Id_Color`),
    KEY `Id_Movement` (`Id_Movement`),
    KEY `Id_Bracelet` (`Id_Bracelet`),
    KEY `Id_Color_Bracelet` (`Id_Color_Bracelet`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE IF NOT EXISTS `color` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Label` varchar(30) NOT NULL UNIQUE,
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE IF NOT EXISTS `marque` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Label` varchar(50) NOT NULL,
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fabrication`
--

DROP TABLE IF EXISTS `fabrication`;
CREATE TABLE IF NOT EXISTS `fabrication` (
     `Id` int NOT NULL AUTO_INCREMENT,
     `Label` varchar(30) NOT NULL,
PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
      `Id` int NOT NULL AUTO_INCREMENT,
      `Label` varchar(20) NOT NULL,
      PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `movement`
--

DROP TABLE IF EXISTS `movement`;
CREATE TABLE IF NOT EXISTS `movement` (
      `Id` int NOT NULL AUTO_INCREMENT,
      `Label` varchar(35) NOT NULL,
      PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bracelet`
--

DROP TABLE IF EXISTS `bracelet`;
CREATE TABLE IF NOT EXISTS `bracelet` (
       `Id` int NOT NULL AUTO_INCREMENT,
       `Label` varchar(40) NOT NULL,
       PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `color_bracelet`
--

DROP TABLE IF EXISTS `color_bracelet`;
CREATE TABLE IF NOT EXISTS `color_bracelet` (
       `Id` int NOT NULL AUTO_INCREMENT,
       `Label` varchar(30) NOT NULL,
       PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
       `Id_Commande`int auto_increment ,
       `Nb` int NOT NULL DEFAULT 1,
       `Id_user` int NOT NULL,
       `Id_article` int NOT NULL,
       `Current_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
       PRIMARY KEY (`Id_Commande`),
       KEY `Id_article` (`Id_article`),
       KEY `Id_user` (`Id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `favoris`
--

DROP TABLE IF EXISTS `favoris`;
CREATE TABLE IF NOT EXISTS `favoris` (
      `Id_user` int NOT NULL,
      `Id_article` int NOT NULL,
      PRIMARY KEY (`Id_user`,`Id_article`),
      KEY `Id_article` (`Id_article`),
      KEY `Id_user` (`Id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `URL` varchar(100) DEFAULT NULL,
    `Id_Article` int NOT NULL,
    PRIMARY KEY (`Id`),
    KEY `Id_Article` (`Id_Article`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Name` varchar(30) NOT NULL UNIQUE,
    `Email` varchar(70) NOT NULL UNIQUE,
    `Pwd` varchar(200) NOT NULL,
    `Salt` varchar(100) NOT NULL,
    `Adresse` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
    ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`Id_Marque`) REFERENCES `marque` (`Id`) ON DELETE CASCADE,
    ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`Id_Fab`) REFERENCES `fabrication` (`Id`) ON DELETE CASCADE,
    ADD CONSTRAINT `article_ibfk_3` FOREIGN KEY (`Id_Matiere`) REFERENCES `matiere` (`Id`) ON DELETE CASCADE,
    ADD CONSTRAINT `article_ibfk_4` FOREIGN KEY (`Id_Color`) REFERENCES `color` (`Id`) ON DELETE CASCADE,
    ADD CONSTRAINT `article_ibfk_5` FOREIGN KEY (`Id_Movement`) REFERENCES `movement` (`Id`) ON DELETE CASCADE,
    ADD CONSTRAINT `article_ibfk_6` FOREIGN KEY (`Id_Bracelet`) REFERENCES `bracelet` (`Id`) ON DELETE CASCADE,
    ADD CONSTRAINT `article_ibfk_7` FOREIGN KEY (`Id_Color_Bracelet`) REFERENCES `color_bracelet` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
    ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`Id_user`) REFERENCES `users` (`Id`) ON DELETE CASCADE,
    ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `favoris`
--
ALTER TABLE `favoris`
    ADD CONSTRAINT `favoris_ibfk_1` FOREIGN KEY (`Id_user`) REFERENCES `users` (`Id`) ON DELETE CASCADE,
    ADD CONSTRAINT `favoris_ibfk_2` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `photo`
--
ALTER TABLE `photo`
    ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`Id_Article`) REFERENCES `article` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
