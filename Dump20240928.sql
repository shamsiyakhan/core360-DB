use core360;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: core360
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventid` varchar(20) NOT NULL,
  `inventcategory` varchar(70) DEFAULT NULL,
  `inventname` varchar(90) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `details` varchar(150) DEFAULT NULL,
  `stock` varchar(90) DEFAULT NULL,
  `orgid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`inventid`),
  KEY `orgid` (`orgid`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`orgid`) REFERENCES `organization` (`orgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `orgid` varchar(50) NOT NULL,
  `orgname` varchar(100) DEFAULT NULL,
  `orgaddress` varchar(200) DEFAULT NULL,
  `orgmail` varchar(100) DEFAULT NULL,
  `orgnumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`orgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES ('1','allana','campus','sehrozkhan2704@gmail.com','9876543219'),('eGpZhbaA38','camp','Camp','organization@gmail.com','7894561230'),('MmffMGHkvb','Core 360','Camp','shaybankhan12345@gmail.com','7894561230');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp`
--

DROP TABLE IF EXISTS `otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp` (
  `email` varchar(50) DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp`
--

LOCK TABLES `otp` WRITE;
/*!40000 ALTER TABLE `otp` DISABLE KEYS */;
INSERT INTO `otp` VALUES ('sehrozkhan2704@gmail.com','780004'),('sehrozkhan2704@gmail.com','994385'),('sehrozkhan2704@gmail.com','823285'),('sehrozkhan2704@gmail.com','138244'),('sehrozkhan2704@gmail.com','580196'),('sehrozkhan2704@gmail.com','918532'),('sehrozkhan2704@gmail.com','820304'),('sehrozkhan2704@gmail.com','311486'),('sehrozkhan2704@gmail.com','230422'),('sehrozkhan2704@gmail.com','596455'),('sehrozkhan2704@gmail.com','888330'),('sehrozkhan2704@gmail.com','693400'),('sehrozkhan2704@gmail.com','859223'),('sehrozkhan2704@gmail.com','549643'),('sehrozkhan2704@gmail.com','144910'),('sehrozkhan2704@gmail.com','770387'),('sehrozkhan2704@gmail.com','870415'),('yobegey752@anypng.com','732128');
/*!40000 ALTER TABLE `otp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleid` int(11) NOT NULL,
  `rolename` enum('admin','owner','manager','employee') DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (101,'owner'),(102,'manager'),(103,'employee');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskid` varchar(20) NOT NULL,
  `taskname` varchar(80) DEFAULT NULL,
  `assignedby` varchar(50) DEFAULT NULL,
  `assignedat` varchar(50) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `taskstatus` varchar(80) DEFAULT NULL,
  `hourstracked` int(11) DEFAULT NULL,
  `starttime` date DEFAULT NULL,
  `endtime` date DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `orgid` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  KEY `userid` (`userid`),
  KEY `fk_orgid` (`orgid`),
  CONSTRAINT `fk_orgid` FOREIGN KEY (`orgid`) REFERENCES `organization` (`orgid`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES ('cU8NaLDYk9','Develop Login Module','Wjs51yYrSh','2024-10-12 10:00:00','2024-10-19','Open',12,'2024-10-12','2024-10-12','o8mLTxt1pg','eGpZhbaA38'),('E2prAOz6mD','Test Task1','Wjs51yYrSh','2024-11-07 17:50:31.672000','2024-11-30','Open',0,'0000-00-00','0000-00-00','Wjs51yYrSh','eGpZhbaA38');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `teamid` varchar(20) NOT NULL,
  `teamname` varchar(80) DEFAULT NULL,
  `teaminfo` varchar(200) DEFAULT NULL,
  `teammember` varchar(500) DEFAULT NULL,
  `createdat` date DEFAULT NULL,
  `createdby` varchar(80) DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `orgid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`teamid`),
  KEY `userid` (`userid`),
  KEY `orgid` (`orgid`),
  CONSTRAINT `orgid` FOREIGN KEY (`orgid`) REFERENCES `organization` (`orgid`),
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES ('2K7wS04oIQ','Frontend team','Angular team','[\"o8mLTxt1pg\"]','2024-11-07','Wjs51yYrSh','Wjs51yYrSh','eGpZhbaA38'),('6YRvQilMG7','UI UX','Designers','[\"IpuJD6KF7D\"]','2024-10-24','3LqPQ1PAfH','3LqPQ1PAfH','MmffMGHkvb'),('aghhttUL6Q','Backend Developer','test developer','[\"3LqPQ1PAfH\"]','2024-10-24','3LqPQ1PAfH','3LqPQ1PAfH','MmffMGHkvb'),('aLz0hWKpMT','Production Team','List of all members of production team','[\"3LqPQ1PAfH\",\"IpuJD6KF7D\"]','2024-10-24','3LqPQ1PAfH','3LqPQ1PAfH','MmffMGHkvb'),('lko1KkIXq1','Test Tea,','test team','[\"IpuJD6KF7D\"]','2024-10-24','3LqPQ1PAfH','3LqPQ1PAfH','MmffMGHkvb'),('OTDGoOATPv','Frontend Developers','List of developers','[\"3LqPQ1PAfH\",\"IpuJD6KF7D\"]','2024-10-24','3LqPQ1PAfH','3LqPQ1PAfH','MmffMGHkvb');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` varchar(50) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `createdat` date DEFAULT NULL,
  `modifiedat` date DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  `orgid` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`),
  KEY `roleid` (`roleid`),
  KEY `orgid` (`orgid`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`orgid`) REFERENCES `organization` (`orgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('3LqPQ1PAfH','Shayban Khan','shaybankhan12345@gmail.com','Test123@','8149863141','camp','male','1999-10-23','2024-10-24','2024-10-24',101,'MmffMGHkvb','Active'),('IpuJD6KF7D','shayban test','lewage2024@aleitar.com','test123@',NULL,'camp',NULL,'9999-01-21','2024-10-24','2024-10-24',103,'MmffMGHkvb','active'),('o8mLTxt1pg','Test Employee','yobegey752@anypng.com','VGVzdDEyM0A=',NULL,'camp',NULL,'2024-11-07','2024-11-07','2024-11-07',103,'eGpZhbaA38','active'),('u101','shamsiya','sehrozkhan2704@gmail.com','Shams123@','7841849749','kharadi','female','0000-00-00','0000-00-00','0000-00-00',101,'1',NULL),('Wjs51yYrSh','Shayban Khan','organization@gmail.com','VGVzdDEyM0A=','9876543210','camp','male','2024-11-06','2024-11-06','2024-11-06',101,'eGpZhbaA38','Active');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'core360'
--

--
-- Dumping routines for database 'core360'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-07 23:17:32
