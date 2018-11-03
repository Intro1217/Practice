-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: abc
-- ------------------------------------------------------
-- Server version	5.7.14-log

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
-- Current Database: `abc`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `abc` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `abc`;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `title` varchar(15) NOT NULL,
  `marquee` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES ('ABC影城','ABC影城票價全面八折優惠一個月');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `seq` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(2) NOT NULL,
  `length` int(11) NOT NULL,
  `ondate` date NOT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `director` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `trailer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `up` int(2) NOT NULL,
  `rank` int(10) NOT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'電影01',3,120,'2018-06-14','電影01劇情簡介電影01劇情簡介電影01劇情簡介電影01劇情簡介電影01劇情簡介電影01劇情簡介電影01劇情簡介電影01劇情簡介電影01劇情簡介電影01劇情簡介\"','電影01發行商','電影01導演','03B01.png','03B01v.mp4',1,2),(2,'電影02',2,120,'2018-06-13','電影02劇情簡介電影02劇情簡介電影02劇情簡介電影02劇情簡介電影02劇情簡介電影02劇情簡介電影02劇情簡介電影02劇情簡介電影02劇情簡介電影02劇情簡介\"','電影02發行商','電影02導演','03B02.png','03B02v.mp4',1,1),(3,'電影03',3,120,'2018-06-15','電影03劇情簡介電影03劇情簡介電影03劇情簡介電影03劇情簡介電影03劇情簡介電影03劇情簡介電影03劇情簡介電影03劇情簡介電影03劇情簡介電影03劇情簡介\"','電影03發行商','電影03導演','03B03.png','03B03v.mp4',1,3),(4,'電影04',4,120,'2018-06-12','電影04劇情簡介電影04劇情簡介電影04劇情簡介電影04劇情簡介電影04劇情簡介電影04劇情簡介電影04劇情簡介電影04劇情簡介電影04劇情簡介電影04劇情簡介\"','電影04發行商','電影04導演','03B04.png','03B04v.mp4',1,5),(5,'電影05',1,120,'2018-06-14','電影05劇情簡介電影05劇情簡介電影05劇情簡介電影05劇情簡介電影05劇情簡介電影05劇情簡介電影05劇情簡介電影05劇情簡介電影05劇情簡介電影05劇情簡介\"','電影05發行商','電影05導演','03B05.png','03B05v.mp4',1,4),(6,'電影06',2,120,'2018-06-14','電影06劇情簡介電影06劇情簡介電影06劇情簡介電影06劇情簡介電影06劇情簡介電影06劇情簡介電影06劇情簡介電影06劇情簡介電影06劇情簡介電影06劇情簡介\"','電影06發行商','電影06導演','03B06.png','03B06v.mp4',1,6),(7,'電影07',3,120,'2018-06-15','電影07劇情簡介電影07劇情簡介電影07劇情簡介電影07劇情簡介電影07劇情簡介電影07劇情簡介電影07劇情簡介電影07劇情簡介電影07劇情簡介電影07劇情簡介\"','電影07發行商','電影07導演','03B07.png','03B07v.mp4',1,7),(8,'電影08',4,120,'2018-06-13','電影08劇情簡介電影08劇情簡介電影08劇情簡介電影08劇情簡介電影08劇情簡介電影08劇情簡介電影08劇情簡介電影08劇情簡介電影08劇情簡介電影08劇情簡介\"\"','電影08發行商','電影08導演','03B08.png','03B08v.mp4',1,8),(9,'電影09',1,120,'2018-06-14','電影09劇情簡介電影09劇情簡介電影09劇情簡介電影09劇情簡介電影09劇情簡介電影09劇情簡介電影09劇情簡介電影09劇情簡介電影09劇情簡介電影09劇情簡介\"','電影09發行商','電影09導演','03B09.png','03B09v.mp4',1,9),(10,'電影10',2,120,'2018-06-12','電影10劇情簡介電影10劇情簡介電影10劇情簡介電影10劇情簡介電影10劇情簡介電影10劇情簡介電影10劇情簡介電影10劇情簡介電影10劇情簡介電影10劇情簡介\"','電影10發行商','電影10導演','03B10.png','03B10v.mp4',1,10),(11,'電影11',3,120,'2018-03-19','電影11劇情簡介電影11劇情簡介電影11劇情簡介電影11劇情簡介電影11劇情簡介電影11劇情簡介電影11劇情簡介電影11劇情簡介電影11劇情簡介電影11劇情簡介\"','電影11發行商','電影11導演','03B11.png','03B11v.mp4',1,11),(12,'電影12',4,120,'2018-03-18','電影12劇情簡介電影12劇情簡介電影12劇情簡介電影12劇情簡介電影12劇情簡介電影12劇情簡介電影12劇情簡介電影12劇情簡介電影12劇情簡介電影12劇情簡介\"','電影12發行商','電影12導演','03B12.png','03B12v.mp4',1,12),(13,'電影13',1,120,'2018-03-12','電影13劇情簡介電影13劇情簡介電影13劇情簡介電影13劇情簡介電影13劇情簡介電影13劇情簡介電影13劇情簡介電影13劇情簡介電影13劇情簡介電影13劇情簡介','電影13發行商','電影13導演','03B13.png','03B13v.mp4',1,13),(14,'電影14',2,120,'2018-03-13','電影14劇情簡介電影14劇情簡介電影14劇情簡介電影14劇情簡介電影14劇情簡介電影14劇情簡介電影14劇情簡介電影14劇情簡介電影14劇情簡介電影14劇情簡介','電影14發行商','電影14導演','03B14.png','03B14v.mp4',1,14),(15,'電影15',3,120,'2018-03-14','電影15劇情簡介電影15劇情簡介電影15劇情簡介電影15劇情簡介電影15劇情簡介電影15劇情簡介電影15劇情簡介電影15劇情簡介電影15劇情簡介電影15劇情簡介','電影15發行商','電影15導演','03B15.png','03B15v.mp4',1,15),(16,'電影16',4,120,'2018-03-15','電影16劇情簡介電影16劇情簡介電影16劇情簡介電影16劇情簡介電影16劇情簡介電影16劇情簡介電影16劇情簡介電影16劇情簡介電影16劇情簡介電影16劇情簡介','電影16發行商','電影16導演','03B16.png','03B16v.mp4',0,17),(17,'電影17',1,120,'2018-03-16','電影17劇情簡介電影17劇情簡介電影17劇情簡介電影17劇情簡介電影17劇情簡介電影17劇情簡介電影17劇情簡介電影17劇情簡介電影17劇情簡介電影17劇情簡介','電影17發行商','電影17導演','03B17.png','03B17v.mp4',1,16),(18,'電影18',2,120,'2018-03-18','電影18劇情簡介電影18劇情簡介電影18劇情簡介電影18劇情簡介電影18劇情簡介電影18劇情簡介電影18劇情簡介電影18劇情簡介電影18劇情簡介電影18劇情簡介\"','電影18發行商','電影18導演','03B18.png','03B18v.mp4',1,19),(19,'電影19',3,120,'2018-03-18','電影19劇情簡介電影19劇情簡介電影19劇情簡介電影19劇情簡介電影19劇情簡介電影19劇情簡介電影19劇情簡介電影19劇情簡介電影19劇情簡介電影19劇情簡介','電影19發行商','電影19導演','03B19.png','03B19v.mp4',1,18),(20,'sdfasdf',3,142,'2018-03-19','sdfasdfsdfsdasdf\"','dfsafsd','sdfsdfsdf','tmp.png','tmp.png',1,20);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ord`
--

DROP TABLE IF EXISTS `ord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ord` (
  `seq` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `movie` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `odate` date NOT NULL,
  `osess` int(11) NOT NULL,
  `qt` int(11) NOT NULL,
  `seats` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cus_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ord`
--

LOCK TABLES `ord` WRITE;
/*!40000 ALTER TABLE `ord` DISABLE KEYS */;
INSERT INTO `ord` VALUES (16,'201803180016','電影02','2018-03-19',0,4,'2,3,4,5','samuel'),(17,'201803180017','電影02','2018-03-18',4,4,'4,5,6,7','samuel'),(23,'201806150023','電影02','2018-06-15',0,2,'0,1','user');
/*!40000 ALTER TABLE `ord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poster`
--

DROP TABLE IF EXISTS `poster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poster` (
  `seq` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rank` int(5) NOT NULL,
  `ani` int(3) NOT NULL,
  `up` int(2) NOT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poster`
--

LOCK TABLES `poster` WRITE;
/*!40000 ALTER TABLE `poster` DISABLE KEYS */;
INSERT INTO `poster` VALUES (3,'Champion01.jpg',' 冠軍大叔',4,3,0),(4,'03A04.jpg','預告片04',5,1,1),(5,'03A05.jpg','預告片05',3,2,1),(6,'03A06.jpg','預告片06',6,3,1),(7,'03A07.jpg','預告片07',7,1,1),(8,'03A08.jpg','預告片08',8,2,1),(9,'03A09.jpg','預告片09',9,3,1);
/*!40000 ALTER TABLE `poster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_account`
--

DROP TABLE IF EXISTS `t_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_account` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`uid`,`name`),
  UNIQUE KEY `uid_UNIQUE` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_account`
--

LOCK TABLES `t_account` WRITE;
/*!40000 ALTER TABLE `t_account` DISABLE KEYS */;
INSERT INTO `t_account` VALUES (1,'samuel','123456','samuel@abc.com'),(2,'user','123456','user@abc.com'),(3,'guest','123456','guest@abc.com');
/*!40000 ALTER TABLE `t_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-17 20:32:16
