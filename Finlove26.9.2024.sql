CREATE DATABASE  IF NOT EXISTS `finlove` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `finlove`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: finlove
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `GenderID` int NOT NULL AUTO_INCREMENT,
  `Gender_Name` varchar(255) NOT NULL,
  PRIMARY KEY (`GenderID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Male'),(2,'Female'),(3,'Other');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `MessageID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `Content` text,
  `TimeJoin` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `TimeQuit` timestamp NULL DEFAULT NULL,
  `Timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MessageID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferences` (
  `PreferenceID` int NOT NULL AUTO_INCREMENT,
  `PreferenceNames` varchar(255) NOT NULL,
  PRIMARY KEY (`PreferenceID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
INSERT INTO `preferences` VALUES (1,'ดูหนัง'),(2,'ฟังเพลง'),(3,'เล่นกีฬา');
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `home` varchar(255) DEFAULT NULL,
  `DateBirth` date DEFAULT NULL,
  `interestedGender` varchar(45) DEFAULT NULL,
  `imageFile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `goal` varchar(45) DEFAULT NULL,
  `GenderID` int DEFAULT NULL,
  `PreferenceID` int DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `loginAttempt` tinyint NOT NULL DEFAULT '0',
  `lastAttemptTime` timestamp NULL DEFAULT NULL,
  `resetToken` varchar(255) DEFAULT NULL,
  `resetTokenExpiration` datetime DEFAULT NULL,
  `pinCode` varchar(10) DEFAULT NULL,
  `pinCodeExpiration` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (11,'ant','$2b$10$q.6bXcC21vaNw3D4da.cGu7oahb/oVuarpPcw1bv113ynHpTuu60i','Methaporn','Limrostham','ANT','pedza507@gmail.com','0642727318',180,'satriwit','2024-09-08','หญิง','image5659273214376440803.jpg','ปริญญาตรี','Love Forever',1,NULL,1,0,NULL,'d44abf99df6d57adf69d79ae2db8fbb804b8eeb0','2024-09-26 17:54:49','4416','2024-09-26 20:33:21'),(12,'arm','$2b$10$udcmB9ceKATtVZ0vzDromO00oIhSINs/Tff034HuhwCM6bxmdKfLW',NULL,NULL,NULL,'adsd',NULL,NULL,NULL,NULL,NULL,'image6779698432442957937.jpg',NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,NULL),(13,'tul','$2b$10$4yw7e6pnsX29xl8KpXDVdOaA1PSXLUcvhOeQ8X5biO3qDzWPomzpC',NULL,NULL,NULL,'fsdfsd',NULL,NULL,NULL,NULL,NULL,'image6779698432442957937.jpg',NULL,NULL,NULL,NULL,0,0,'2024-09-12 18:58:17',NULL,NULL,NULL,NULL),(14,'Rick','$2b$10$DbdL8BMNspuhkeo3f.9DFuVEQ1q1.agUu1oPtzd9gDcAD/PZ5CPIC','Tawatchai','Kreeweek','New','tawatchai.kee@rmutto.ac.th','0922732903',171,'Ladprow63','2024-09-13','อื่นๆ','image6779698432442957937.jpg','ปริญญาตรี','one night',1,NULL,0,0,'2024-09-13 05:16:15',NULL,NULL,NULL,NULL),(15,'vvc','$2b$10$/r4jfBQ18evqicnTfHDO9uVKPLb7wPpXiq6G5RH56tjbrLGfSJCgG','hgfh','fhfgh','fghfgh','vvc','2452345',242,'245245','2024-09-16','หญิง','image3683749073219213965.jpg','ปริญญาตรี','24545',3,NULL,1,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `UserID` int NOT NULL,
  `PreferenceID` int NOT NULL,
  PRIMARY KEY (`UserID`,`PreferenceID`),
  KEY `PreferenceID` (`PreferenceID`),
  CONSTRAINT `userpreferences_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `userpreferences_ibfk_2` FOREIGN KEY (`PreferenceID`) REFERENCES `preferences` (`PreferenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (11,1),(14,1),(15,1),(11,2),(14,2);
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-26 19:48:53
