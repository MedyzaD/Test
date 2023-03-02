-- MySQL dump 10.13  Distrib 5.5.23, for Win64 (x86)
--
-- Host: localhost    Database: new_mybd
-- ------------------------------------------------------
-- Server version	5.5.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `new_mybd`
--

USE `new_mybd`;

--
-- Table structure for table `credit`
--

DROP TABLE IF EXISTS `credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type_of_credit` int(11) NOT NULL,
  `Klient` int(11) NOT NULL,
  `Sum` int(11) NOT NULL,
  `Date_of_issue` date NOT NULL,
  `Term` float NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_credit_UNIQUE` (`ID`),
  KEY `ct_idx` (`Type_of_credit`),
  KEY `ck_idx` (`Klient`),
  CONSTRAINT `ck` FOREIGN KEY (`Klient`) REFERENCES `klient` (`ID`),
  CONSTRAINT `ct` FOREIGN KEY (`Type_of_credit`) REFERENCES `type_of_credit` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit`
--

LOCK TABLES `credit` WRITE;
/*!40000 ALTER TABLE `credit` DISABLE KEYS */;
INSERT INTO `credit` VALUES (2,18,1,100000,'2000-01-19',10),(3,15,2,20000,'2020-03-01',15),(14,20,2,400000,'2020-03-02',45),(15,18,5,3555,'2020-03-03',13.4),(16,18,2,2224442,'2020-03-04',1),(17,15,8,300000,'2020-03-05',5),(18,16,2,10000000,'2020-03-06',25),(19,16,8,1000,'2020-03-07',20.5),(20,17,4,800000,'2020-03-07',14.5),(21,16,6,1200000,'2020-03-08',11.1),(22,18,2,400000,'2020-03-09',14.5),(23,18,12,2710000,'2020-03-10',17.4),(24,19,14,20,'2023-03-04',70);
/*!40000 ALTER TABLE `credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klient`
--

DROP TABLE IF EXISTS `klient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klient` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Surname` varchar(60) COLLATE utf8_bin NOT NULL,
  `Name` varchar(45) COLLATE utf8_bin NOT NULL,
  `Patroymic` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Sex` set('m','w') COLLATE utf8_bin NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Snils` bigint(20) NOT NULL,
  `Addres` varchar(100) CHARACTER SET utf8 NOT NULL,
  `Phone` bigint(20) DEFAULT NULL,
  `Document` set('zagrannik','passport','voenik') COLLATE utf8_bin NOT NULL,
  `Document_number` varchar(45) COLLATE utf8_bin NOT NULL,
  `INN` bigint(20) DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Snils_UNIQUE` (`Snils`),
  UNIQUE KEY `Document_number_UNIQUE` (`Document_number`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `Phone_UNIQUE` (`Phone`),
  UNIQUE KEY `INN_UNIQUE` (`INN`),
  UNIQUE KEY `email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klient`
--

LOCK TABLES `klient` WRITE;
/*!40000 ALTER TABLE `klient` DISABLE KEYS */;
INSERT INTO `klient` VALUES (1,'Cidorov','Michail','Vasilevich','m','1967-09-15',64564777864,'Novosibirskl, Rimskay, 87',89236545675,'passport','5756865566',123456789012,NULL),(2,'Turkin','Vladimir','Valerievish','m','1967-06-28',89897358925,'Novosibirsk, Pobedi, 2',89543575436,'zagrannik','32646465',1345678901234,'gfgfgfgfgdh@mail.ru'),(3,'Avgustin','Evangeliy','Petrovich','m','1990-05-12',12345678910,'Novosibirsk, Pobedi, 1',89133912524,'passport','1234567891',NULL,NULL),(4,'Maria','Petrova','Vladimir','w','1980-09-11',89763531747,'Moscow, Berdisheva, 2',89534745632,'passport','9746931574',NULL,NULL),(5,'Petrov','Petr','Petrovich','m','1970-12-07',35621706478,'Tomsk, Frunse, 6',NULL,'passport','3697564467',NULL,'ddddddddd@mail.ru'),(6,'Wier','Tina','Borisovish','w','1990-09-14',57753427646,'Omsk, Homi, 7',89543575437,'zagrannik','32646466',NULL,NULL),(7,'Mirskay','Ekaterina','Lvovna','w','1983-02-11',89897358926,'Novosibirsk, Pobedi, 3',89543575435,'zagrannik','32646464',NULL,'gfhjksla@sychka.ru'),(8,'Riskova','Sima','Danilovna','w','1999-11-04',89897358924,'Novosibirsk, Pobedi, 4',89543575434,'zagrannik','32646463',NULL,NULL),(9,'Istom','Daniil','Vavilovich','m','2001-02-28',89897358929,'Novosibirsk, Pobedi, 1',89543575432,'passport','3697564463',555432178923,NULL),(10,'Wumen','Natalay','Borisovna','w','1998-12-08',89897358922,'Krasnoobsk, Omskay, 9',89543575430,'passport','3697564490',NULL,'fgtuygdhfjosjfh@gmail.com'),(11,'Viks','Mira','Kirrilovna','w','1979-12-09',89897358923,'Krasnoobsk, Omskay, 5',89543575439,'passport','3697564299',NULL,NULL),(12,'Tarbin','Dima','Vladimirovich','m','1980-05-15',89897358943,'Krasnoobsk, Omskay, 7',NULL,'passport','3697564456',NULL,'dhghv@bk.ru'),(14,'Starodubtsev','Daniil','Vladimirovich','m','1999-05-25',89249961084,'Novosibirsk, Lyponova, 2',89249961084,'passport','5019994346',1442345789204,NULL);
/*!40000 ALTER TABLE `klient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Credit` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Sum` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_repayment_UNIQUE` (`ID`),
  KEY `pc_idx` (`Credit`),
  CONSTRAINT `pc` FOREIGN KEY (`Credit`) REFERENCES `credit` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,2,'2000-02-19',1000),(2,2,'2001-01-19',20000),(3,14,'2020-03-04',50000),(4,14,'2025-03-04',100000),(5,14,'2029-03-04',400000),(6,18,'2020-03-07',10000001),(7,24,'2053-03-04',100);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_credit`
--

DROP TABLE IF EXISTS `type_of_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_of_credit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) COLLATE utf8_bin NOT NULL,
  `Comment` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `Bet` float NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_credit`
--

LOCK TABLES `type_of_credit` WRITE;
/*!40000 ALTER TABLE `type_of_credit` DISABLE KEYS */;
INSERT INTO `type_of_credit` VALUES (15,'Kredit ucheda','dgsfgdsfligadjfhgsd',12),(16,'Kradit machina','fbhdjvgidhbd',3),(17,'Kredit na stroitelstvo',NULL,20),(18,'Kredit na IP','oiduhdf',1.6),(19,'Kredit na techniku','sbjfibljsfof',7),(20,'Kredit na detei','gdkjgvisdgvi',15);
/*!40000 ALTER TABLE `type_of_credit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-02 14:22:36
