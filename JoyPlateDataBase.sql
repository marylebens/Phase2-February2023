-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: joyplate
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `customer`
--
use joyplate;

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerid` int NOT NULL AUTO_INCREMENT,
  `firstName` text NOT NULL,
  `lastName` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Moses','Nkanyo','nkanyomoses@yahoo.com','password'),(2,'Max','Winchester','abc@example.com','password'),(3,'jon','tom','good@yahoo.com','password'),(4,'yes','james','nice@yahoo.com','password'),(5,'lum','ngum','ngum@yahoo.com','password');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `itemid` int NOT NULL AUTO_INCREMENT,
  `itemName` text NOT NULL,
  `description` text NOT NULL,
  `price` int NOT NULL,
  `itemType` text NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Eggs and bacon','fried eggs mixed with bacon, serves one',15,'breakfast','eggs and bacon.jpg'),(2,'cheese burger','baked burger with fried cheese',15,'breakfast','american cheese burger.jpg'),(3,'Iced coffee','coffee with cream',10,'breakfast','OIP.jpg'),(4,'Toasted bread','toasted bread with butter',15,'breakfast','toasted bread with butter.jpg'),(5,'Rice and stew','Fried rice with tomatoes stew',15,'lunch','rice and stew.jpg'),(6,'chicken rice','Rice mixed with baked chicken',25,'lunch','chicken rice.jpg'),(7,'Potatoe stew','potatoes with tomatoes source',15,'lunch','potatoe stew.jpg'),(8,'Fried rice','rice mixed with carrot and beans',15,'Dinner','Quick-and-Easy-Fried-Rice.jpg'),(9,'Pork soup','boiled pork with spices',20,'Dinner','pork soup.jpg'),(10,'Vegetables and plantain','fried plantain with vegetables and shrimp',25,'Dinner','vegetable and plantain.jpg');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `detailsid` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `itemid` int NOT NULL,
  PRIMARY KEY (`detailsid`),
  KEY `itemid` (`itemid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `menu` (`itemid`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `purchases` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,4),(6,2,5),(7,3,1),(8,3,5);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `customerid` int NOT NULL,
  PRIMARY KEY (`orderid`),
  KEY `customerid` (`customerid`),
  CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `customer` (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,1),(2,1),(3,2);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-10 14:29:05
