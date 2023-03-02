-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mybd
-- ------------------------------------------------------
-- Server version	5.5.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `klient`
--

DROP TABLE IF EXISTS `klient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-02 11:55:46
