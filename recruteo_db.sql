-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour recruteo_db
DROP DATABASE IF EXISTS `recruteo_db`;
CREATE DATABASE IF NOT EXISTS `recruteo_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `recruteo_db`;

-- Listage de la structure de la table recruteo_db. developpeur
DROP TABLE IF EXISTS `developpeur`;
CREATE TABLE IF NOT EXISTS `developpeur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `bio` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Listage des données de la table recruteo_db.developpeur : ~11 rows (environ)
DELETE FROM `developpeur`;
/*!40000 ALTER TABLE `developpeur` DISABLE KEYS */;
INSERT INTO `developpeur` (`id`, `nom`, `bio`, `created_at`) VALUES
	(1, 'vincent', 'j\'aime les tic tac', '2019-05-15 16:05:23'),
	(2, 'alain', 'j\'aime m\'entraîner', '2019-05-15 16:05:23'),
	(3, 'ozan', 'j\'aime les mangas', '2019-05-15 16:05:23'),
	(4, 'marie-line', 'j\'aime la moto', '2019-05-15 16:05:23'),
	(5, 'serge', 'j\'aime l\'amour véritable', '2019-05-15 16:05:23'),
	(6, 'jamal', 'j\'aime la sieste', '2019-05-15 16:05:23'),
	(7, 'said', 'j\'aime les grasses mat\'', '2019-05-15 16:05:23'),
	(8, 'benjamin', 'j\'aime le hockey sur glace', '2019-05-15 16:05:23'),
	(9, 'julien', 'j\'aime tinder', '2019-05-15 16:05:24'),
	(10, 'marie', 'j\'aime just dance', '2019-05-15 16:05:24'),
	(11, 'majid', 'j\'aime bien me reposer à la maison', '2019-05-15 16:05:26');
/*!40000 ALTER TABLE `developpeur` ENABLE KEYS */;

-- Listage de la structure de la table recruteo_db. equipe
DROP TABLE IF EXISTS `equipe`;
CREATE TABLE IF NOT EXISTS `equipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `id_societe` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_societe` (`id_societe`),
  CONSTRAINT `fk_id_societe` FOREIGN KEY (`id_societe`) REFERENCES `societe` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Listage des données de la table recruteo_db.equipe : ~1 rows (environ)
DELETE FROM `equipe`;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` (`id`, `nom`, `created_at`, `id_societe`) VALUES
	(3, 'DWWM', '2019-05-15 15:19:38', 2);
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;

-- Listage de la structure de la table recruteo_db. equipe_developpeur
DROP TABLE IF EXISTS `equipe_developpeur`;
CREATE TABLE IF NOT EXISTS `equipe_developpeur` (
  `id_developpeur` int(11) NOT NULL,
  `id_equipe` int(11) NOT NULL,
  `date_inscription` datetime DEFAULT NULL,
  PRIMARY KEY (`id_developpeur`,`id_equipe`),
  KEY `fk_id_equipe` (`id_equipe`),
  CONSTRAINT `fk_id_developpeur` FOREIGN KEY (`id_developpeur`) REFERENCES `developpeur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_id_equipe` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table recruteo_db.equipe_developpeur : ~11 rows (environ)
DELETE FROM `equipe_developpeur`;
/*!40000 ALTER TABLE `equipe_developpeur` DISABLE KEYS */;
INSERT INTO `equipe_developpeur` (`id_developpeur`, `id_equipe`, `date_inscription`) VALUES
	(1, 3, '2019-05-15 16:19:52'),
	(2, 3, '2019-05-15 16:19:52'),
	(3, 3, '2019-05-15 16:19:52'),
	(4, 3, '2019-05-15 16:19:52'),
	(5, 3, '2019-05-15 16:19:52'),
	(6, 3, '2019-05-15 16:19:52'),
	(7, 3, '2019-05-15 16:19:52'),
	(8, 3, '2019-05-15 16:19:52'),
	(9, 3, '2019-05-15 16:19:52'),
	(10, 3, '2019-05-15 16:19:52'),
	(11, 3, '2019-05-15 16:19:54');
/*!40000 ALTER TABLE `equipe_developpeur` ENABLE KEYS */;

-- Listage de la structure de la table recruteo_db. langage
DROP TABLE IF EXISTS `langage`;
CREATE TABLE IF NOT EXISTS `langage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Listage des données de la table recruteo_db.langage : ~11 rows (environ)
DELETE FROM `langage`;
/*!40000 ALTER TABLE `langage` DISABLE KEYS */;
INSERT INTO `langage` (`id`, `nom`) VALUES
	(1, 'php'),
	(2, 'javascript'),
	(3, 'node.js'),
	(4, 'html'),
	(5, 'css'),
	(6, 'laravel'),
	(7, 'symfony'),
	(8, 'react'),
	(9, 'react native'),
	(10, 'vue.js'),
	(11, 'angular');
/*!40000 ALTER TABLE `langage` ENABLE KEYS */;

-- Listage de la structure de la table recruteo_db. langage_developpeur
DROP TABLE IF EXISTS `langage_developpeur`;
CREATE TABLE IF NOT EXISTS `langage_developpeur` (
  `id_developpeur` int(11) NOT NULL,
  `id_langage` int(11) NOT NULL,
  PRIMARY KEY (`id_developpeur`,`id_langage`),
  KEY `fk_id_langage` (`id_langage`),
  CONSTRAINT `fk_id_developpeur_lang` FOREIGN KEY (`id_developpeur`) REFERENCES `developpeur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_id_langage` FOREIGN KEY (`id_langage`) REFERENCES `langage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table recruteo_db.langage_developpeur : ~35 rows (environ)
DELETE FROM `langage_developpeur`;
/*!40000 ALTER TABLE `langage_developpeur` DISABLE KEYS */;
INSERT INTO `langage_developpeur` (`id_developpeur`, `id_langage`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(1, 2),
	(2, 2),
	(3, 2),
	(4, 2),
	(5, 2),
	(6, 2),
	(7, 2),
	(8, 2),
	(9, 2),
	(10, 2),
	(11, 2),
	(1, 3),
	(2, 3),
	(11, 3),
	(2, 4),
	(2, 5),
	(7, 6),
	(8, 7),
	(4, 8),
	(6, 8),
	(5, 9),
	(9, 9),
	(6, 10),
	(10, 11);
/*!40000 ALTER TABLE `langage_developpeur` ENABLE KEYS */;

-- Listage de la structure de la table recruteo_db. langage_requis_equipe
DROP TABLE IF EXISTS `langage_requis_equipe`;
CREATE TABLE IF NOT EXISTS `langage_requis_equipe` (
  `id_equipe` int(11) NOT NULL,
  `id_langage` int(11) NOT NULL,
  PRIMARY KEY (`id_equipe`,`id_langage`),
  KEY `fk_id_langage_requis` (`id_langage`),
  CONSTRAINT `fk_id_equipe_langage_requis` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_id_langage_requis` FOREIGN KEY (`id_langage`) REFERENCES `langage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table recruteo_db.langage_requis_equipe : ~2 rows (environ)
DELETE FROM `langage_requis_equipe`;
/*!40000 ALTER TABLE `langage_requis_equipe` DISABLE KEYS */;
INSERT INTO `langage_requis_equipe` (`id_equipe`, `id_langage`) VALUES
	(3, 1),
	(3, 2);
/*!40000 ALTER TABLE `langage_requis_equipe` ENABLE KEYS */;

-- Listage de la structure de la table recruteo_db. societe
DROP TABLE IF EXISTS `societe`;
CREATE TABLE IF NOT EXISTS `societe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `code_postal` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Listage des données de la table recruteo_db.societe : ~1 rows (environ)
DELETE FROM `societe`;
/*!40000 ALTER TABLE `societe` DISABLE KEYS */;
INSERT INTO `societe` (`id`, `nom`, `adresse`, `code_postal`, `ville`) VALUES
	(2, 'Next-Formation', '6-8 rue Firmin Gillot', '75015', 'paris');
/*!40000 ALTER TABLE `societe` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
