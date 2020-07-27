-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: bfivytbdx3azjl87gze7-mysql.services.clever-cloud.com    Database: bfivytbdx3azjl87gze7
-- ------------------------------------------------------
-- Server version	8.0.15-5

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'f41d366d-91e5-11e9-8525-cecd028ee826:1-56603476';

--
-- Table structure for table `account_move`
--

DROP TABLE IF EXISTS `account_move`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_move` (
  `idacc_move` int(11) NOT NULL AUTO_INCREMENT,
  `account_from` int(11) NOT NULL,
  `account_to` int(11) NOT NULL,
  `date_move` date NOT NULL,
  `amount` double NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`idacc_move`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='this table contains information of moves between accounts and transaction status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_move`
--

LOCK TABLES `account_move` WRITE;
/*!40000 ALTER TABLE `account_move` DISABLE KEYS */;
INSERT INTO `account_move` VALUES (1,987654321,123456789,'2020-07-26',150,'S'),(2,123456789,987654321,'2020-07-26',164,'S'),(3,123456789,987654321,'2020-07-26',168,'S'),(4,123456789,987654321,'2020-07-26',168,'S'),(5,987654321,123456789,'2020-07-27',100,'S'),(6,987654321,123456789,'2020-07-27',100,'S');
/*!40000 ALTER TABLE `account_move` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-27 14:48:40
