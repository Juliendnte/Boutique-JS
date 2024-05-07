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
  `Name` varchar(50) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Price` int NOT NULL,
  `Reduction` int DEFAULT NULL,
  `Stock` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `have`
--

DROP TABLE IF EXISTS `have`;
CREATE TABLE IF NOT EXISTS `have` (
  `Id_Article` int DEFAULT NULL,
  `Id_Tag` int DEFAULT NULL,
  FOREIGN KEY (Id_Article) REFERENCES article(Id),
  FOREIGN KEY (Id_Tag) REFERENCES tags(Id)
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

--
-- Structure de la table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Label` varchar(10) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Label` (`Label`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

-- Insertion des fausses données dans la table `tags`
INSERT INTO `tags` (`Label`) VALUES
                                 ('Clothing'),
                                 ('Electronics'),
                                 ('Books'),
                                 ('Home Decor'),
                                 ('Accessories');

-- Insertion des fausses données dans la table `article`
INSERT INTO `article` (`Name`, `Description`, `Price`, `Reduction`, `Stock`) VALUES
                                                                                 ('T-shirt', 'Comfortable cotton t-shirt', 20, NULL, 100),
                                                                                 ('Smartphone', 'High-performance smartphone', 500, 50, 50),
                                                                                 ('Novel', 'Bestselling fiction novel', 15, 10, 200),
                                                                                 ('Wall Clock', 'Vintage style wall clock', 30, NULL, 50),
                                                                                 ('Sunglasses', 'UV protection sunglasses', 25, 5, 80);

-- Insertion des fausses données dans la table `have`
INSERT INTO `have` (`Id_Article`, `Id_Tag`) VALUES
                                                (1, 1),
                                                (1, 5),
                                                (2, 2),
                                                (3, 3),
                                                (4, 4),
                                                (5, 5);

-- Insertion des fausses données dans la table `photo`
INSERT INTO `photo` (`URL`, `Id_Article`) VALUES
                                              ('tshirt.jpg', 1),
                                              ('smartphone.jpg', 2),
                                              ('novel.jpg', 3),
                                              ('clock.jpg', 4),
                                              ('sunglasses.jpg', 5);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
