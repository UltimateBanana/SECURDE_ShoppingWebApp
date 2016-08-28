CREATE DATABASE  IF NOT EXISTS `securde` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `securde`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: securde
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_level` varchar(50) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `billing_house_number` varchar(10) NOT NULL,
  `billing_street` varchar(100) NOT NULL,
  `billing_subdivision` varchar(100) NOT NULL,
  `billing_city` varchar(100) NOT NULL,
  `billing_postal_code` int(11) NOT NULL,
  `billing_country` varchar(100) NOT NULL,
  `shipping_house_number` varchar(10) NOT NULL,
  `shipping_street` varchar(100) NOT NULL,
  `shipping_subdivision` varchar(100) NOT NULL,
  `shipping_city` varchar(100) NOT NULL,
  `shipping_postal_code` int(11) NOT NULL,
  `shipping_country` varchar(100) NOT NULL,
  `is_locked` int(1) NOT NULL,
  `login_attemps` int(1) unsigned zerofill NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'USER','HALLO','sa','sdfghj','banana','chocolate','qwertyui@qwerty.com','1234','sdfghjk','xcvbnm','dfghjk',1234,'dfghjk','1234','dfgyhuio','xcvbnm','ewrtyui',1234,'tvbhnj',0,0),(2,'ADMINISTRATOR','Gelo','A','John','gelo-ace1','jellyace','gelo@ace.com','12','Hey','Shawn','Kingston',1234,'Neverland','12','You\'re','Way','Too',1234,'BeaCHES',0,0),(3,'PRODUCT_MANAGER','Angelo','G','John','gelo-ace2','jellyace','gelo@ace.com','12','Hey','Shawn','Kingston',1234,'Neverland','12','You\'re','Way','Too',1234,'BeaCHES',0,0),(4,'ACCOUNTING_MANAGER','John','G','Angelo','gelo-ace3','jellyace','gelo@ace.com','12','Hey','Shawn','Kingston',1234,'Neverland','12','You\'re','Way','Too',1234,'BeaCHES',0,0),(5,'USER','Banana','D','Yuup','hello','hello123','hello@123.com','123','qwerty','qwertyuiop','asdf',1234,'asdfghjkl','123','qwerty','qwertyuiop','asdf',1234,'asdfghjkl',0,0),(6,'PRODUCT_MANAGER','Monkey','C','MonkeyDo','mankey','mankey2','mankey@monkey.com','','','','',0,'','','','','',0,'',0,0),(7,'ACCOUNTING_MANAGER','Giraffe','G','Giraffarig','giraffe','g123','giraffe@g.com','','','','',0,'','','','','',0,'',0,0),(8,'USER','Hannah','S','Banana','hannah','banana','hannah@banana.com','1234','banana','world','yoo',1234,'BANANA','1234','banana','world','yoo',1234,'BANANA',0,0),(9,'PRODUCT_MANAGER','Bananana','b','Banana','banana1','banana','banana@banana.com','','','','',0,'','','','','',0,'',0,0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditcard` (
  `account_id` int(11) NOT NULL,
  `credit_card_number` varchar(100) NOT NULL,
  `security_pin` varchar(100) NOT NULL,
  `credit_limit` int(20) NOT NULL,
  PRIMARY KEY (`account_id`,`credit_card_number`),
  CONSTRAINT `account_id_credit_card` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard`
--

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
INSERT INTO `creditcard` VALUES (1,'1234567890','123',999);
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_item_id` int(11) NOT NULL,
  `feedback` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`,`receipt_item_id`),
  KEY `receipt_item_id_feedback_idx` (`receipt_item_id`),
  CONSTRAINT `receipt_item_id_feedback` FOREIGN KEY (`receipt_item_id`) REFERENCES `receiptitem` (`receipt_item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,1,NULL);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `is_deleted` int(1) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Sample A','A is a sample boots product','Boots',500,0),(2,'B','B is a sample sandals product','Sandals',350,0),(3,'C','C is a sample shoes product','Shoes',400,0),(4,'D','D is a sample slippers product','Slippers',200,1),(5,'Banana','Bananas in pajamas','Slippers',100,0),(6,'Vans White','WAT ARE THOOOOOSE','Shoes',300,0),(7,'Yo Momma','Yo Momma by Converse','Shoes',200,0),(8,'Apple Bottom','HEEEEEYY','BOOTS',123,0),(9,'Oxfords','OXFORDS NOT BROGUES','Shoes',555,0),(10,'Brogues','BROGUES NOT OXFORDS','Shoes',555,0),(11,'NANAY MO','NANAY MO DAW OH','Sandals',345,0),(12,'KERRBIE','KERR-BAE','SHOES',123,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipt` (
  `receipt_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `credit_card_number` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `total_price` double NOT NULL,
  PRIMARY KEY (`receipt_id`),
  KEY `account_id_idx` (`account_id`),
  CONSTRAINT `account_id_receipt` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` VALUES (1,1,'1234567890','2016-06-18 00:00:00',500);
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiptitem`
--

DROP TABLE IF EXISTS `receiptitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receiptitem` (
  `receipt_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  PRIMARY KEY (`receipt_item_id`,`receipt_id`),
  KEY `receipt_id_receipt_item_idx` (`receipt_id`),
  KEY `product_id_receipt_item_idx` (`product_id`),
  CONSTRAINT `product_id_receipt_item` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `receipt_id_receipt_item` FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`receipt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiptitem`
--

LOCK TABLES `receiptitem` WRITE;
/*!40000 ALTER TABLE `receiptitem` DISABLE KEYS */;
INSERT INTO `receiptitem` VALUES (1,1,1,1,500);
/*!40000 ALTER TABLE `receiptitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-28 19:25:22
