-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: complexdb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `t_app_push_message`
--

DROP TABLE IF EXISTS `t_app_push_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_app_push_message` (
  `msg_item_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `msg_item_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `default_value` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N',
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`msg_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_app_push_message`
--

LOCK TABLES `t_app_push_message` WRITE;
/*!40000 ALTER TABLE `t_app_push_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_app_push_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_app_push_send_his`
--

DROP TABLE IF EXISTS `t_app_push_send_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_app_push_send_his` (
  `push_seq_no` bigint NOT NULL,
  `fucntion_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `alert_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `data1` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `data2` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `data3` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `send_dtime` datetime DEFAULT NULL,
  `ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `msg_item_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`push_seq_no`),
  KEY `FK_t_member_app_push_TO_t_app_push_send_his_1` (`ID`),
  KEY `FK_t_member_app_push_TO_t_app_push_send_his_2` (`msg_item_id`),
  CONSTRAINT `FK_t_member_app_push_TO_t_app_push_send_his_1` FOREIGN KEY (`ID`) REFERENCES `t_member_app_push` (`ID`),
  CONSTRAINT `FK_t_member_app_push_TO_t_app_push_send_his_2` FOREIGN KEY (`msg_item_id`) REFERENCES `t_member_app_push` (`msg_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_app_push_send_his`
--

LOCK TABLES `t_app_push_send_his` WRITE;
/*!40000 ALTER TABLE `t_app_push_send_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_app_push_send_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_app_push_send_standard`
--

DROP TABLE IF EXISTS `t_app_push_send_standard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_app_push_send_standard` (
  `push_idx` bigint NOT NULL,
  `msg_item_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fucntion_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `alert_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `data1` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `data2` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `data3` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`push_idx`),
  KEY `FK_t_app_push_message_TO_t_app_push_send_standard_1` (`msg_item_id`),
  CONSTRAINT `FK_t_app_push_message_TO_t_app_push_send_standard_1` FOREIGN KEY (`msg_item_id`) REFERENCES `t_app_push_message` (`msg_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_app_push_send_standard`
--

LOCK TABLES `t_app_push_send_standard` WRITE;
/*!40000 ALTER TABLE `t_app_push_send_standard` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_app_push_send_standard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_application_complaint`
--

DROP TABLE IF EXISTS `t_application_complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_application_complaint` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `app_title` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_date` datetime NOT NULL,
  `app_code` tinyint NOT NULL DEFAULT '1',
  `app_method` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'W',
  `app_content` varchar(400) DEFAULT NULL,
  `progress_status` tinyint DEFAULT '1',
  `app_receipt_date` datetime DEFAULT NULL,
  `app_complete_date` datetime DEFAULT NULL,
  `app_cancel_date` datetime DEFAULT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `FK_t_complaints_type_TO_t_application_complaint_1` (`app_code`),
  KEY `FK_t_dongho_TO_t_application_complaint_1` (`ho_code`),
  KEY `FK_t_dongho_TO_t_application_complaint_2` (`dong_code`),
  CONSTRAINT `FK_t_complaints_type_TO_t_application_complaint_1` FOREIGN KEY (`app_code`) REFERENCES `t_complaints_type` (`app_code`),
  CONSTRAINT `FK_t_dongho_TO_t_application_complaint_1` FOREIGN KEY (`ho_code`) REFERENCES `t_dongho` (`ho_code`),
  CONSTRAINT `FK_t_dongho_TO_t_application_complaint_2` FOREIGN KEY (`dong_code`) REFERENCES `t_dongho` (`dong_code`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_application_complaint`
--

LOCK TABLES `t_application_complaint` WRITE;
/*!40000 ALTER TABLE `t_application_complaint` DISABLE KEYS */;
INSERT INTO `t_application_complaint` VALUES (3,'민원제목…','2022-01-01 00:00:00',1,'W','우리집 수도가 새고있습니다.',1,NULL,NULL,NULL,'101','101'),(4,'민원제목4','2022-07-03 00:00:00',3,'W','하자신청합니다44444.',1,NULL,NULL,NULL,'101','101'),(5,'민원제목3','2022-07-01 00:00:00',2,'W','위층 층간소음이 너무 크네요.',1,NULL,NULL,NULL,'101','101'),(6,'민원제목4','2022-07-01 00:00:00',1,'W','전기 하자신청합니다.',1,NULL,NULL,NULL,'101','101'),(7,'민원제목5','2022-07-01 00:00:00',1,'W','가스 하자신청합니다.',1,NULL,NULL,NULL,'101','101'),(8,'민원제목6','2022-07-02 00:00:00',1,'W','건축 하자신청합니다.',1,NULL,NULL,NULL,'101','101'),(9,'민원제목7','2022-07-03 00:00:00',1,'W','하자신청합니다777.',1,NULL,NULL,NULL,'101','101'),(10,'민원제목8','2022-07-03 00:00:00',1,'W','하자신청합니다888.',1,NULL,NULL,NULL,'101','101'),(11,'민원제목9','2022-07-03 00:00:00',1,'W','하자신청합니다999.',1,NULL,NULL,NULL,'101','101'),(12,'민원제목10','2022-07-03 00:00:00',1,'W','하자신청합니다1010.',1,NULL,NULL,NULL,'101','101'),(13,'민원제목11','2022-07-03 00:00:00',1,'W','하자신청합니다11 11.',1,NULL,NULL,NULL,'101','101'),(14,'민원제목12','2022-07-03 00:00:00',2,'W','하자신청합니다11 11.',1,NULL,NULL,NULL,'101','101'),(15,'민원제목13','2022-07-03 00:00:00',3,'W','하자신청합니다13 13.',1,NULL,NULL,NULL,'101','101'),(16,'민원제목13','2022-07-03 00:00:00',3,'W','하자신청합니다13 13.',1,NULL,NULL,NULL,'101','101'),(17,'테스트민원제목','2022-08-24 11:32:29',1,'W','화장실 파손',1,'2022-08-24 11:32:29','2022-08-24 11:32:29',NULL,'101','101'),(18,'테스트민원제목','2022-08-24 11:33:16',1,'W','안방 벽지 훼손',1,'2022-08-24 11:33:16','2022-08-24 11:33:16',NULL,'101','101'),(19,'테스트민원제목','2022-08-24 11:33:16',1,'W','보일러 파손',1,'2022-08-24 11:33:16','2022-08-24 11:33:16',NULL,'101','101'),(20,'테스트민원제목','2022-08-24 11:33:16',1,'W','주방 싱크대 파손',1,'2022-08-24 11:33:16','2022-08-24 11:33:16',NULL,'101','101');
/*!40000 ALTER TABLE `t_application_complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cctv`
--

DROP TABLE IF EXISTS `t_cctv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cctv` (
  `cam_no` tinyint NOT NULL,
  `cam_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cam_address` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cam_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cctv`
--

LOCK TABLES `t_cctv` WRITE;
/*!40000 ALTER TABLE `t_cctv` DISABLE KEYS */;
INSERT INTO `t_cctv` VALUES (1,'놀이터1','http://10.1.1.1:8080','test'),(2,'놀이터2','http://10.1.1.1:8080','test'),(3,'주차장','http://10.1.1.1:8080','test'),(4,'정문','http://10.1.1.1:8080','test');
/*!40000 ALTER TABLE `t_cctv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cctv_dong`
--

DROP TABLE IF EXISTS `t_cctv_dong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cctv_dong` (
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cam_no` tinyint NOT NULL,
  PRIMARY KEY (`dong_code`,`cam_no`),
  KEY `FK_t_cctv_TO_t_cctv_dong_1` (`cam_no`),
  CONSTRAINT `FK_t_cctv_TO_t_cctv_dong_1` FOREIGN KEY (`cam_no`) REFERENCES `t_cctv` (`cam_no`),
  CONSTRAINT `FK_t_dong_TO_t_cctv_dong_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dong` (`dong_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cctv_dong`
--

LOCK TABLES `t_cctv_dong` WRITE;
/*!40000 ALTER TABLE `t_cctv_dong` DISABLE KEYS */;
INSERT INTO `t_cctv_dong` VALUES ('101',1),('102',1),('9999',1),('101',2),('102',2),('9999',2),('101',3),('102',3),('9999',3),('101',4),('102',4),('9999',4);
/*!40000 ALTER TABLE `t_cctv_dong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_complaints_type`
--

DROP TABLE IF EXISTS `t_complaints_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_complaints_type` (
  `app_code` tinyint NOT NULL,
  `app_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sort_order` tinyint NOT NULL DEFAULT '0',
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`app_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_complaints_type`
--

LOCK TABLES `t_complaints_type` WRITE;
/*!40000 ALTER TABLE `t_complaints_type` DISABLE KEYS */;
INSERT INTO `t_complaints_type` VALUES (1,'하자보수신청',1,NULL),(2,'세대 민원',2,NULL),(3,'공용부 민원',3,NULL);
/*!40000 ALTER TABLE `t_complaints_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_contract_document`
--

DROP TABLE IF EXISTS `t_contract_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_contract_document` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `contract_date` datetime NOT NULL,
  `contract_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `contract_content` text CHARACTER SET utf8 COLLATE utf8_bin,
  `file_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `insert_dtime` datetime DEFAULT NULL,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `file_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_contract_document`
--

LOCK TABLES `t_contract_document` WRITE;
/*!40000 ALTER TABLE `t_contract_document` DISABLE KEYS */;
INSERT INTO `t_contract_document` VALUES (1,'2022-01-01 00:00:00','홈네트워크 유지보수계약','계약서 내용입니다.........................','http://10.10.10.1/aaa.doc','2022-07-21 10:28:41','11111',NULL),(2,'2022-01-01 00:00:00','홈네트워크 유지보수계약2','계약서 내용입니다.........................','http://10.10.10.1/aaa2.doc','2022-07-21 10:28:41','11111',NULL),(3,'2022-01-01 00:00:00','홈네트워크 유지보수계약3','계약서 내용입니다.........................','http://10.10.10.1/aaa3.doc','2022-07-21 10:28:41','11111',NULL),(4,'2022-01-01 00:00:00','홈네트워크 유지보수계약4','계약서 내용입니다.........................','http://10.10.10.1/aaa4.doc','2022-07-21 10:28:41','11111',NULL),(5,'2022-01-01 00:00:00','홈네트워크 유지보수계약5','계약서 내용입니다.........................','http://10.10.10.1/aaa5.doc','2022-07-21 10:28:41','11111',NULL),(6,'2022-01-01 00:00:00','홈네트워크 유지보수계약6','계약서 내용입니다.........................','http://10.10.10.1/aaa6.doc','2022-07-21 10:28:41','11111',NULL),(7,'2022-01-01 00:00:00','홈네트워크 유지보수계약7','계약서 내용입니다.........................','http://10.10.10.1/aaa7.doc','2022-07-21 10:28:41','11111',NULL),(8,'2022-01-01 00:00:00','홈네트워크 유지보수계약8','계약서 내용입니다.........................','http://10.10.10.1/aaa8.doc','2022-07-21 10:28:41','11111',NULL),(9,'2022-01-01 00:00:00','홈네트워크 유지보수계약9','계약서 내용입니다.........................','http://10.10.10.1/aaa9.doc','2022-07-21 10:28:41','11111',NULL),(10,'2022-01-01 00:00:00','홈네트워크 유지보수계약10','계약서 내용입니다.........................','http://10.10.10.1/aaa10.doc','2022-07-21 10:28:41','11111',NULL),(11,'2022-01-01 00:00:00','홈네트워크 유지보수계약11','계약서 내용입니다.........................','http://10.10.10.1/aaa11.doc','2022-07-21 10:28:41','11111',NULL),(12,'2022-01-01 00:00:00','홈네트워크 유지보수계약12','계약서 내용입니다.........................','http://10.10.10.1/aaa12.doc','2022-07-21 10:28:41','11111',NULL),(13,'2022-02-02 00:11:22','테스트 계약','테스트 계약서 내용입니다............','http://10.10.10.1/test1.doc','2022-08-24 11:42:50','11111','test1'),(14,'2022-02-02 00:33:44','테스트 계약','테스트 계약서 내용입니다............','http://10.10.10.1/test2.doc','2022-08-24 11:43:58','11111','test2'),(15,'2022-02-02 00:55:55','테스트 계약','테스트 계약서 내용입니다............','http://10.10.10.1/test4.doc','2022-08-24 11:45:17','11111','test4'),(16,'2022-02-02 00:55:11','테스트 계약','테스트 계약서 내용입니다............','http://10.10.10.1/test3.doc','2022-08-24 11:45:33','11111','test3');
/*!40000 ALTER TABLE `t_contract_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_delivery`
--

DROP TABLE IF EXISTS `t_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_delivery` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `arrival_time` datetime NOT NULL,
  `parcel_box_no` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mail_box_no` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `receiver` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `del_fee` int DEFAULT '0',
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `receive_time` datetime DEFAULT NULL,
  `parcel_status` tinyint NOT NULL DEFAULT '0',
  `parcel_flag` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '무인',
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `send_time` datetime DEFAULT NULL,
  `send_result` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N',
  `memo` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `FK_t_dongho_TO_t_delivery_1` (`dong_code`),
  KEY `FK_t_dongho_TO_t_delivery_2` (`ho_code`),
  CONSTRAINT `FK_t_dongho_TO_t_delivery_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dongho` (`dong_code`),
  CONSTRAINT `FK_t_dongho_TO_t_delivery_2` FOREIGN KEY (`ho_code`) REFERENCES `t_dongho` (`ho_code`)
) ENGINE=InnoDB AUTO_INCREMENT=65540 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_delivery`
--

LOCK TABLES `t_delivery` WRITE;
/*!40000 ALTER TABLE `t_delivery` DISABLE KEYS */;
INSERT INTO `t_delivery` VALUES (7,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(8,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(9,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(10,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(11,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(12,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(13,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(14,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(15,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(16,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(17,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(18,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(20,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(21,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(22,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(23,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(24,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(25,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(26,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(27,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(28,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(29,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(30,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(31,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(35,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(36,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(37,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(38,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(39,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(40,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(41,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(42,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(43,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(44,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(45,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(46,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(47,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(48,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(49,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(50,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(51,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(52,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(53,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(54,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(55,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(56,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(57,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(58,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(66,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(67,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(68,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(69,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(70,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(71,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(72,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(73,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(74,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(75,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(76,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(77,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(78,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(79,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(80,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(81,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(82,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(83,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(84,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(85,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(86,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(87,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(88,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(89,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(90,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(91,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(92,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(93,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(94,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(95,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(96,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(97,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(98,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(99,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(100,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(101,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(102,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(103,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(104,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(105,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(106,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(107,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(108,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(109,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(110,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(111,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(112,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(113,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(129,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(130,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(131,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(132,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(133,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(134,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(135,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(136,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(137,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(138,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(139,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(140,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(141,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(142,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(143,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(144,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(145,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(146,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(147,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(148,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(149,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(150,'2022-06-23 17:18:55','1','1','101-101',0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(65528,'2022-06-23 17:22:46','1','1',NULL,0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(65529,'2022-06-23 17:22:46','1','1',NULL,0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(65530,'2022-06-23 17:22:46','1','1',NULL,0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(65531,'2022-06-23 17:22:46','1','1',NULL,0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(65532,'2022-06-23 17:22:46','1','1',NULL,0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(65533,'2022-06-23 17:22:46','1','1',NULL,0,'101','101',NULL,0,'무인','tester',NULL,NULL,NULL),(65534,'2022-10-21 10:10:00','1','1',NULL,0,'101','101',NULL,0,'무인','tester',NULL,'N',NULL),(65535,'2022-10-21 10:10:00','1','1',NULL,0,'101','101',NULL,0,'무인','tester',NULL,'N',NULL),(65536,'2022-11-21 10:10:00','1','1',NULL,0,'101','101',NULL,0,'1','tester',NULL,'N',NULL),(65537,'2022-11-21 10:10:00','1','1',NULL,0,'101','101',NULL,1,'무인','tester',NULL,'N',NULL),(65538,'2022-08-24 07:46:29','1','1',NULL,0,'101','101',NULL,0,'무인','tester',NULL,'N','한진택배'),(65539,'2022-08-24 07:46:29','1','1',NULL,0,'101','101',NULL,1,'무인','tester',NULL,'N','CJ택배');
/*!40000 ALTER TABLE `t_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_device`
--

DROP TABLE IF EXISTS `t_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_device` (
  `device_type` tinyint NOT NULL,
  `sub_idx` tinyint NOT NULL,
  `sub_group_id` tinyint NOT NULL DEFAULT '0',
  `sub_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `control_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'RS485',
  `model_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`device_type`,`sub_group_id`,`sub_idx`),
  KEY `FK_t_device_type_TO_t_device_1` (`device_type`),
  CONSTRAINT `fk_t_device_type` FOREIGN KEY (`device_type`) REFERENCES `t_device_type` (`device_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_device`
--

LOCK TABLES `t_device` WRITE;
/*!40000 ALTER TABLE `t_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_device_type`
--

DROP TABLE IF EXISTS `t_device_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_device_type` (
  `device_type` tinyint NOT NULL,
  `device_type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sub_id_cnt` tinyint NOT NULL DEFAULT '0',
  `sub_group_cnt` tinyint NOT NULL DEFAULT '0',
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`device_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_device_type`
--

LOCK TABLES `t_device_type` WRITE;
/*!40000 ALTER TABLE `t_device_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_device_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dong`
--

DROP TABLE IF EXISTS `t_dong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dong` (
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dong_alias` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sort_order` tinyint NOT NULL DEFAULT '0',
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `guardphone_id` tinyint DEFAULT NULL,
  PRIMARY KEY (`dong_code`),
  KEY `FK_t_hn_guardphone_TO_t_dong_1_idx` (`guardphone_id`),
  CONSTRAINT `FK_t_hn_guardphone_TO_t_dong_1` FOREIGN KEY (`guardphone_id`) REFERENCES `t_hn_guardphone` (`idx`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dong`
--

LOCK TABLES `t_dong` WRITE;
/*!40000 ALTER TABLE `t_dong` DISABLE KEYS */;
INSERT INTO `t_dong` VALUES ('101','101',1,NULL,NULL),('102','102',1,NULL,NULL),('9999','관리동',1,NULL,NULL);
/*!40000 ALTER TABLE `t_dong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dongho`
--

DROP TABLE IF EXISTS `t_dongho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dongho` (
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ho_alias` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `hh_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `h_area_type` tinyint NOT NULL DEFAULT '0',
  `move_out_dtime` datetime DEFAULT NULL,
  `hn_send_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N',
  `line_code` char(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `crime_prev_passwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `lobby_passwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `hc_group_id` tinyint DEFAULT NULL,
  PRIMARY KEY (`ho_code`,`dong_code`),
  KEY `FK_t_dong_TO_t_dongho_1` (`dong_code`),
  KEY `FK_t_household_type_TO_t_dongho_1` (`h_area_type`),
  KEY `FK_t_home_control_group_TO_t_dongho_1` (`hc_group_id`),
  CONSTRAINT `FK_t_dong_TO_t_dongho_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dong` (`dong_code`),
  CONSTRAINT `FK_t_home_control_group_TO_t_dongho_1` FOREIGN KEY (`hc_group_id`) REFERENCES `t_home_control_group` (`hc_group_id`),
  CONSTRAINT `FK_t_household_type_TO_t_dongho_1` FOREIGN KEY (`h_area_type`) REFERENCES `t_household_type` (`h_area_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dongho`
--

LOCK TABLES `t_dongho` WRITE;
/*!40000 ALTER TABLE `t_dongho` DISABLE KEYS */;
INSERT INTO `t_dongho` VALUES ('101','101','101',NULL,30,NULL,'Y',NULL,NULL,NULL,NULL,NULL),('102','101','102',NULL,30,NULL,'N',NULL,NULL,NULL,NULL,NULL),('103','101','103',NULL,30,NULL,'N',NULL,NULL,NULL,NULL,NULL),('104','101','102',NULL,40,NULL,'N',NULL,NULL,NULL,NULL,NULL),('105','101','102',NULL,40,NULL,'N',NULL,NULL,NULL,NULL,NULL),('9999','9999','관리사무소',NULL,0,NULL,'N',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_dongho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dongline`
--

DROP TABLE IF EXISTS `t_dongline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dongline` (
  `line_code` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lowest_floor` tinyint NOT NULL DEFAULT '0',
  `top_floor` tinyint NOT NULL DEFAULT '0',
  `min_ho` tinyint NOT NULL DEFAULT '1',
  `max_ho` tinyint NOT NULL DEFAULT '1',
  `lobby_floor` tinyint NOT NULL DEFAULT '0',
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`line_code`,`dong_code`),
  KEY `FK_t_dong_TO_t_dongline_1` (`dong_code`),
  CONSTRAINT `FK_t_dong_TO_t_dongline_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dong` (`dong_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dongline`
--

LOCK TABLES `t_dongline` WRITE;
/*!40000 ALTER TABLE `t_dongline` DISABLE KEYS */;
INSERT INTO `t_dongline` VALUES ('0105','101',-1,20,1,5,0,NULL),('0110','101',-1,20,1,10,1,NULL);
/*!40000 ALTER TABLE `t_dongline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dongline_floor`
--

DROP TABLE IF EXISTS `t_dongline_floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dongline_floor` (
  `abs_floor` tinyint NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `line_code` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `disp_floor` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`abs_floor`,`dong_code`,`line_code`),
  KEY `FK_t_dongline_TO_t_donline_floor_1` (`dong_code`),
  KEY `FK_t_dongline_TO_t_donline_floor_2` (`line_code`),
  CONSTRAINT `FK_t_dongline_TO_t_donline_floor_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dongline` (`dong_code`),
  CONSTRAINT `FK_t_dongline_TO_t_donline_floor_2` FOREIGN KEY (`line_code`) REFERENCES `t_dongline` (`line_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dongline_floor`
--

LOCK TABLES `t_dongline_floor` WRITE;
/*!40000 ALTER TABLE `t_dongline_floor` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_dongline_floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dongline_zone`
--

DROP TABLE IF EXISTS `t_dongline_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dongline_zone` (
  `zone_no` smallint NOT NULL,
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `line_code` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `s_floor` tinyint NOT NULL DEFAULT '0',
  `e_floor` tinyint NOT NULL DEFAULT '0',
  `s_ho` tinyint NOT NULL DEFAULT '1',
  `e_ho` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_no`),
  KEY `FK_t_dongline_TO_t_dongline_zone_1` (`dong_code`),
  KEY `FK_t_dongline_TO_t_dongline_zone_2` (`line_code`),
  CONSTRAINT `FK_t_dongline_TO_t_dongline_zone_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dongline` (`dong_code`),
  CONSTRAINT `FK_t_dongline_TO_t_dongline_zone_2` FOREIGN KEY (`line_code`) REFERENCES `t_dongline` (`line_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dongline_zone`
--

LOCK TABLES `t_dongline_zone` WRITE;
/*!40000 ALTER TABLE `t_dongline_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_dongline_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_elevator`
--

DROP TABLE IF EXISTS `t_elevator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_elevator` (
  `elv_no` tinyint NOT NULL,
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `line_code` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`elv_no`),
  KEY `FK_t_dongline_TO_t_elevator_1` (`dong_code`),
  KEY `FK_t_dongline_TO_t_elevator_2` (`line_code`),
  CONSTRAINT `FK_t_dongline_TO_t_elevator_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dongline` (`dong_code`),
  CONSTRAINT `FK_t_dongline_TO_t_elevator_2` FOREIGN KEY (`line_code`) REFERENCES `t_dongline` (`line_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_elevator`
--

LOCK TABLES `t_elevator` WRITE;
/*!40000 ALTER TABLE `t_elevator` DISABLE KEYS */;
INSERT INTO `t_elevator` VALUES (1,NULL,'101','0105'),(2,NULL,'101','0110');
/*!40000 ALTER TABLE `t_elevator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_elevator_control`
--

DROP TABLE IF EXISTS `t_elevator_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_elevator_control` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `control_req_dtime` datetime NOT NULL,
  `elv_no` tinyint NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `direction` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ev_arrive_time` datetime DEFAULT NULL,
  `req_method` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'W',
  `comm_result` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N',
  `comm_dtime` datetime DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `FK_t_elevator_dongho_TO_t_elevator_control_1` (`elv_no`),
  KEY `FK_t_elevator_dongho_TO_t_elevator_control_2` (`dong_code`),
  KEY `FK_t_elevator_dongho_TO_t_elevator_control_3` (`ho_code`),
  CONSTRAINT `FK_t_elevator_dongho_TO_t_elevator_control_1` FOREIGN KEY (`elv_no`) REFERENCES `t_elevator_dongho` (`elv_no`),
  CONSTRAINT `FK_t_elevator_dongho_TO_t_elevator_control_2` FOREIGN KEY (`dong_code`) REFERENCES `t_elevator_dongho` (`dong_code`),
  CONSTRAINT `FK_t_elevator_dongho_TO_t_elevator_control_3` FOREIGN KEY (`ho_code`) REFERENCES `t_elevator_dongho` (`ho_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_elevator_control`
--

LOCK TABLES `t_elevator_control` WRITE;
/*!40000 ALTER TABLE `t_elevator_control` DISABLE KEYS */;
INSERT INTO `t_elevator_control` VALUES (3,'2022-08-22 14:20:25',1,'101','101','D','2022-08-22 14:20:25','W','N','2022-08-22 14:20:25'),(4,'2022-09-30 12:12:00',1,'101','101','D','2022-09-30 12:20:00','W','Y','2022-09-30 12:12:00'),(5,'2022-08-22 15:17:36',1,'101','101','U','2022-08-22 15:17:36','W','Y','2022-08-22 15:17:36');
/*!40000 ALTER TABLE `t_elevator_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_elevator_dongho`
--

DROP TABLE IF EXISTS `t_elevator_dongho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_elevator_dongho` (
  `elv_no` tinyint NOT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`elv_no`,`ho_code`,`dong_code`),
  KEY `FK_t_dongho_TO_t_elevator_dongho_1` (`ho_code`),
  KEY `FK_t_dongho_TO_t_elevator_dongho_2` (`dong_code`),
  CONSTRAINT `FK_t_dongho_TO_t_elevator_dongho_1` FOREIGN KEY (`ho_code`) REFERENCES `t_dongho` (`ho_code`),
  CONSTRAINT `FK_t_dongho_TO_t_elevator_dongho_2` FOREIGN KEY (`dong_code`) REFERENCES `t_dongho` (`dong_code`),
  CONSTRAINT `FK_t_elevator_TO_t_elevator_dongho_1` FOREIGN KEY (`elv_no`) REFERENCES `t_elevator` (`elv_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_elevator_dongho`
--

LOCK TABLES `t_elevator_dongho` WRITE;
/*!40000 ALTER TABLE `t_elevator_dongho` DISABLE KEYS */;
INSERT INTO `t_elevator_dongho` VALUES (1,'101','101'),(2,'101','101');
/*!40000 ALTER TABLE `t_elevator_dongho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_energy`
--

DROP TABLE IF EXISTS `t_energy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_energy` (
  `energy_dtime` datetime NOT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `elec_meter` decimal(7,2) DEFAULT '0.00',
  `water_meter` decimal(7,2) DEFAULT '0.00',
  `gas_meter` decimal(7,2) DEFAULT '0.00',
  `hot_water_meter` decimal(7,2) DEFAULT '0.00',
  `heating_meter` decimal(7,2) DEFAULT '0.00',
  `elec_usage` decimal(7,2) DEFAULT '0.00',
  `water_usage` decimal(7,2) DEFAULT '0.00',
  `gas_usage` decimal(7,2) DEFAULT '0.00',
  `hot_water_usage` decimal(7,2) DEFAULT '0.00',
  `heating_usage` decimal(7,2) DEFAULT '0.00',
  `aircon_meter` decimal(7,2) DEFAULT '0.00',
  `airconf_usage` decimal(7,2) DEFAULT '0.00',
  `memo` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`energy_dtime`,`ho_code`,`dong_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_energy`
--

LOCK TABLES `t_energy` WRITE;
/*!40000 ALTER TABLE `t_energy` DISABLE KEYS */;
INSERT INTO `t_energy` VALUES ('2021-06-30 23:59:00','101','101',0.00,0.00,0.00,0.00,0.00,1.00,1.00,0.00,0.00,0.00,0.00,0.00,NULL),('2021-06-30 23:59:00','102','101',0.00,0.00,0.00,0.00,0.00,2.00,2.00,0.00,0.00,0.00,0.00,0.00,NULL),('2021-06-30 23:59:00','103','101',0.00,0.00,0.00,0.00,0.00,3.00,3.00,0.00,0.00,0.00,0.00,0.00,NULL),('2021-06-30 23:59:00','104','101',0.00,0.00,0.00,0.00,0.00,4.00,4.00,0.00,0.00,0.00,0.00,0.00,NULL),('2021-06-30 23:59:00','105','101',0.00,0.00,0.00,0.00,0.00,5.00,5.00,0.00,0.00,0.00,0.00,0.00,NULL),('2021-07-01 23:59:00','101','101',1.00,1.00,1.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-01 23:59:00','102','101',2.00,2.00,2.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-01 23:59:00','103','101',3.00,3.00,3.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-01 23:59:00','104','101',4.00,4.00,4.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-01 23:59:00','105','101',5.00,5.00,5.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-02 23:59:00','101','101',2.00,2.00,2.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-02 23:59:00','102','101',4.00,4.00,4.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-02 23:59:00','103','101',6.00,6.00,6.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-02 23:59:00','104','101',8.00,8.00,8.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-02 23:59:00','105','101',10.00,10.00,10.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-03 23:59:00','101','101',3.00,3.00,3.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-03 23:59:00','102','101',6.00,6.00,6.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-03 23:59:00','103','101',9.00,9.00,9.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-03 23:59:00','104','101',12.00,12.00,12.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-03 23:59:00','105','101',15.00,15.00,15.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-04 23:59:00','101','101',4.00,4.00,4.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-04 23:59:00','102','101',8.00,8.00,8.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-04 23:59:00','103','101',12.00,12.00,12.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-04 23:59:00','104','101',16.00,16.00,16.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-04 23:59:00','105','101',20.00,20.00,20.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-05 23:59:00','101','101',5.00,5.00,5.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-05 23:59:00','102','101',10.00,10.00,10.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-05 23:59:00','103','101',15.00,15.00,15.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-05 23:59:00','104','101',20.00,20.00,20.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-05 23:59:00','105','101',25.00,25.00,25.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-06 23:59:00','101','101',6.00,6.00,6.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-06 23:59:00','102','101',12.00,12.00,12.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-06 23:59:00','103','101',18.00,18.00,18.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-06 23:59:00','104','101',24.00,24.00,24.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-06 23:59:00','105','101',30.00,30.00,30.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-07 23:59:00','101','101',7.00,7.00,7.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-07 23:59:00','102','101',14.00,14.00,14.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-07 23:59:00','103','101',21.00,21.00,21.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-07 23:59:00','104','101',28.00,28.00,28.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-07 23:59:00','105','101',35.00,35.00,35.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-08 23:59:00','101','101',8.00,8.00,8.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-08 23:59:00','102','101',16.00,16.00,16.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-08 23:59:00','103','101',24.00,24.00,24.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-08 23:59:00','104','101',32.00,32.00,32.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-08 23:59:00','105','101',40.00,40.00,40.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-09 23:59:00','101','101',9.00,9.00,9.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-09 23:59:00','102','101',18.00,18.00,18.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-09 23:59:00','103','101',27.00,27.00,27.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-09 23:59:00','104','101',36.00,36.00,36.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-09 23:59:00','105','101',45.00,45.00,45.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-10 23:59:00','101','101',10.00,10.00,10.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-10 23:59:00','102','101',20.00,20.00,20.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-10 23:59:00','103','101',30.00,30.00,30.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-10 23:59:00','104','101',40.00,40.00,40.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-10 23:59:00','105','101',50.00,50.00,50.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-11 23:59:00','101','101',11.00,11.00,11.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-11 23:59:00','102','101',22.00,22.00,22.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-11 23:59:00','103','101',33.00,33.00,33.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-11 23:59:00','104','101',44.00,44.00,44.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-11 23:59:00','105','101',55.00,55.00,55.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-12 23:59:00','101','101',12.00,12.00,12.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-12 23:59:00','102','101',24.00,24.00,24.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-12 23:59:00','103','101',36.00,36.00,36.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-12 23:59:00','104','101',48.00,48.00,48.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-12 23:59:00','105','101',60.00,60.00,60.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-13 23:59:00','101','101',13.00,13.00,13.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-13 23:59:00','102','101',26.00,26.00,26.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-13 23:59:00','103','101',39.00,39.00,39.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-13 23:59:00','104','101',52.00,52.00,52.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-13 23:59:00','105','101',65.00,65.00,65.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-14 23:59:00','101','101',14.00,14.00,14.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-14 23:59:00','102','101',28.00,28.00,28.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-14 23:59:00','103','101',42.00,42.00,42.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-14 23:59:00','104','101',56.00,56.00,56.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-14 23:59:00','105','101',70.00,70.00,70.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-15 23:59:00','101','101',15.00,15.00,15.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-15 23:59:00','102','101',30.00,30.00,30.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-15 23:59:00','103','101',45.00,45.00,45.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-15 23:59:00','104','101',60.00,60.00,60.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-15 23:59:00','105','101',75.00,75.00,75.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-16 23:59:00','101','101',16.00,16.00,16.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-16 23:59:00','102','101',32.00,32.00,32.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-16 23:59:00','103','101',48.00,48.00,48.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-16 23:59:00','104','101',64.00,64.00,64.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-16 23:59:00','105','101',80.00,80.00,80.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-17 23:59:00','101','101',17.00,17.00,17.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-17 23:59:00','102','101',34.00,34.00,34.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-17 23:59:00','103','101',51.00,51.00,51.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-17 23:59:00','104','101',68.00,68.00,68.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-17 23:59:00','105','101',85.00,85.00,85.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-18 23:59:00','101','101',18.00,18.00,18.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-18 23:59:00','102','101',36.00,36.00,36.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-18 23:59:00','103','101',54.00,54.00,54.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-18 23:59:00','104','101',72.00,72.00,72.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-18 23:59:00','105','101',90.00,90.00,90.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-19 23:59:00','101','101',19.00,19.00,19.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-19 23:59:00','102','101',38.00,38.00,38.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-19 23:59:00','103','101',57.00,57.00,57.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-19 23:59:00','104','101',76.00,76.00,76.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-19 23:59:00','105','101',95.00,95.00,95.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-20 23:59:00','101','101',20.00,20.00,20.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-20 23:59:00','102','101',40.00,40.00,40.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-20 23:59:00','103','101',60.00,60.00,60.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-20 23:59:00','104','101',80.00,80.00,80.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-20 23:59:00','105','101',100.00,100.00,100.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-21 23:59:00','101','101',21.00,21.00,21.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-21 23:59:00','102','101',42.00,42.00,42.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-21 23:59:00','103','101',63.00,63.00,63.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-21 23:59:00','104','101',84.00,84.00,84.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-21 23:59:00','105','101',105.00,105.00,105.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-22 23:59:00','101','101',22.00,22.00,22.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-22 23:59:00','102','101',44.00,44.00,44.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-22 23:59:00','103','101',66.00,66.00,66.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-22 23:59:00','104','101',88.00,88.00,88.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-22 23:59:00','105','101',110.00,110.00,110.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-23 23:59:00','101','101',23.00,23.00,23.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-23 23:59:00','102','101',46.00,46.00,46.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-23 23:59:00','103','101',69.00,69.00,69.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-23 23:59:00','104','101',92.00,92.00,92.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-23 23:59:00','105','101',115.00,115.00,115.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-24 23:59:00','101','101',24.00,24.00,24.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-24 23:59:00','102','101',48.00,48.00,48.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-24 23:59:00','103','101',72.00,72.00,72.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-24 23:59:00','104','101',96.00,96.00,96.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-24 23:59:00','105','101',120.00,120.00,120.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-25 23:59:00','101','101',25.00,25.00,25.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-25 23:59:00','102','101',50.00,50.00,50.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-25 23:59:00','103','101',75.00,75.00,75.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-25 23:59:00','104','101',100.00,100.00,100.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-25 23:59:00','105','101',125.00,125.00,125.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-26 23:59:00','101','101',26.00,26.00,26.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-26 23:59:00','102','101',52.00,52.00,52.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-26 23:59:00','103','101',78.00,78.00,78.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-26 23:59:00','104','101',104.00,104.00,104.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-26 23:59:00','105','101',130.00,130.00,130.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-27 23:59:00','101','101',27.00,27.00,27.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-27 23:59:00','102','101',54.00,54.00,54.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-27 23:59:00','103','101',81.00,81.00,81.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-27 23:59:00','104','101',108.00,108.00,108.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-27 23:59:00','105','101',135.00,135.00,135.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-28 23:59:00','101','101',28.00,28.00,28.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-28 23:59:00','102','101',56.00,56.00,56.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-28 23:59:00','103','101',84.00,84.00,84.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-28 23:59:00','104','101',112.00,112.00,112.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-28 23:59:00','105','101',140.00,140.00,140.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-29 23:59:00','101','101',29.00,29.00,29.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-29 23:59:00','102','101',58.00,58.00,58.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-29 23:59:00','103','101',87.00,87.00,87.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-29 23:59:00','104','101',116.00,116.00,116.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-29 23:59:00','105','101',145.00,145.00,145.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-30 23:59:00','101','101',30.00,30.00,30.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-30 23:59:00','102','101',60.00,60.00,60.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-30 23:59:00','103','101',90.00,90.00,90.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-30 23:59:00','104','101',120.00,120.00,120.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-30 23:59:00','105','101',150.00,150.00,150.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-07-31 23:59:00','101','101',31.00,31.00,31.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-07-31 23:59:00','102','101',62.00,62.00,62.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-07-31 23:59:00','103','101',93.00,93.00,93.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-07-31 23:59:00','104','101',124.00,124.00,124.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-07-31 23:59:00','105','101',155.00,155.00,155.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-01 23:59:00','101','101',32.00,32.00,32.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-01 23:59:00','102','101',64.00,64.00,64.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-01 23:59:00','103','101',96.00,96.00,96.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-01 23:59:00','104','101',128.00,128.00,128.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-01 23:59:00','105','101',160.00,160.00,160.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-02 23:59:00','101','101',33.00,33.00,33.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-02 23:59:00','102','101',66.00,66.00,66.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-02 23:59:00','103','101',99.00,99.00,99.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-02 23:59:00','104','101',132.00,132.00,132.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-02 23:59:00','105','101',165.00,165.00,165.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-03 23:59:00','101','101',34.00,34.00,34.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-03 23:59:00','102','101',68.00,68.00,68.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-03 23:59:00','103','101',102.00,102.00,102.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-03 23:59:00','104','101',136.00,136.00,136.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-03 23:59:00','105','101',170.00,170.00,170.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-04 23:59:00','101','101',35.00,35.00,35.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-04 23:59:00','102','101',70.00,70.00,70.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-04 23:59:00','103','101',105.00,105.00,105.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-04 23:59:00','104','101',140.00,140.00,140.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-04 23:59:00','105','101',175.00,175.00,175.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-05 23:59:00','101','101',36.00,36.00,36.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-05 23:59:00','102','101',72.00,72.00,72.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-05 23:59:00','103','101',108.00,108.00,108.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-05 23:59:00','104','101',144.00,144.00,144.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-05 23:59:00','105','101',180.00,180.00,180.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-06 23:59:00','101','101',37.00,37.00,37.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-06 23:59:00','102','101',74.00,74.00,74.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-06 23:59:00','103','101',111.00,111.00,111.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-06 23:59:00','104','101',148.00,148.00,148.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-06 23:59:00','105','101',185.00,185.00,185.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-07 23:59:00','101','101',38.00,38.00,38.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-07 23:59:00','102','101',76.00,76.00,76.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-07 23:59:00','103','101',114.00,114.00,114.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-07 23:59:00','104','101',152.00,152.00,152.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-07 23:59:00','105','101',190.00,190.00,190.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-08 23:59:00','101','101',39.00,39.00,39.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-08 23:59:00','102','101',78.00,78.00,78.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-08 23:59:00','103','101',117.00,117.00,117.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-08 23:59:00','104','101',156.00,156.00,156.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-08 23:59:00','105','101',195.00,195.00,195.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-09 23:59:00','101','101',40.00,40.00,40.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-09 23:59:00','102','101',80.00,80.00,80.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-09 23:59:00','103','101',120.00,120.00,120.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-09 23:59:00','104','101',160.00,160.00,160.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-09 23:59:00','105','101',200.00,200.00,200.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-10 23:59:00','101','101',41.00,41.00,41.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-10 23:59:00','102','101',82.00,82.00,82.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-10 23:59:00','103','101',123.00,123.00,123.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-10 23:59:00','104','101',164.00,164.00,164.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-10 23:59:00','105','101',205.00,205.00,205.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-11 23:59:00','101','101',42.00,42.00,42.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-11 23:59:00','102','101',84.00,84.00,84.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-11 23:59:00','103','101',126.00,126.00,126.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-11 23:59:00','104','101',168.00,168.00,168.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-11 23:59:00','105','101',210.00,210.00,210.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-12 23:59:00','101','101',43.00,43.00,43.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-12 23:59:00','102','101',86.00,86.00,86.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-12 23:59:00','103','101',129.00,129.00,129.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-12 23:59:00','104','101',172.00,172.00,172.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-12 23:59:00','105','101',215.00,215.00,215.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-13 23:59:00','101','101',44.00,44.00,44.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-13 23:59:00','102','101',88.00,88.00,88.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-13 23:59:00','103','101',132.00,132.00,132.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-13 23:59:00','104','101',176.00,176.00,176.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-13 23:59:00','105','101',220.00,220.00,220.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-14 23:59:00','101','101',45.00,45.00,45.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-14 23:59:00','102','101',90.00,90.00,90.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-14 23:59:00','103','101',135.00,135.00,135.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-14 23:59:00','104','101',180.00,180.00,180.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-14 23:59:00','105','101',225.00,225.00,225.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-15 23:59:00','101','101',46.00,46.00,46.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-15 23:59:00','102','101',92.00,92.00,92.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-15 23:59:00','103','101',138.00,138.00,138.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-15 23:59:00','104','101',184.00,184.00,184.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-15 23:59:00','105','101',230.00,230.00,230.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-16 23:59:00','101','101',47.00,47.00,47.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-16 23:59:00','102','101',94.00,94.00,94.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-16 23:59:00','103','101',141.00,141.00,141.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-16 23:59:00','104','101',188.00,188.00,188.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-16 23:59:00','105','101',235.00,235.00,235.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-17 23:59:00','101','101',48.00,48.00,48.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-17 23:59:00','102','101',96.00,96.00,96.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-17 23:59:00','103','101',144.00,144.00,144.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-17 23:59:00','104','101',192.00,192.00,192.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-17 23:59:00','105','101',240.00,240.00,240.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-18 23:59:00','101','101',49.00,49.00,49.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-18 23:59:00','102','101',98.00,98.00,98.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-18 23:59:00','103','101',147.00,147.00,147.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-18 23:59:00','104','101',196.00,196.00,196.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-18 23:59:00','105','101',245.00,245.00,245.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-19 23:59:00','101','101',50.00,50.00,50.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-19 23:59:00','102','101',100.00,100.00,100.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-19 23:59:00','103','101',150.00,150.00,150.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-19 23:59:00','104','101',200.00,200.00,200.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-19 23:59:00','105','101',250.00,250.00,250.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-20 23:59:00','101','101',51.00,51.00,51.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-20 23:59:00','102','101',102.00,102.00,102.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-20 23:59:00','103','101',153.00,153.00,153.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-20 23:59:00','104','101',204.00,204.00,204.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-20 23:59:00','105','101',255.00,255.00,255.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-21 23:59:00','101','101',52.00,52.00,52.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-21 23:59:00','102','101',104.00,104.00,104.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-21 23:59:00','103','101',156.00,156.00,156.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-21 23:59:00','104','101',208.00,208.00,208.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-21 23:59:00','105','101',260.00,260.00,260.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-22 23:59:00','101','101',53.00,53.00,53.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-22 23:59:00','102','101',106.00,106.00,106.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-22 23:59:00','103','101',159.00,159.00,159.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-22 23:59:00','104','101',212.00,212.00,212.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-22 23:59:00','105','101',265.00,265.00,265.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-23 23:59:00','101','101',54.00,54.00,54.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-23 23:59:00','102','101',108.00,108.00,108.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-23 23:59:00','103','101',162.00,162.00,162.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-23 23:59:00','104','101',216.00,216.00,216.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-23 23:59:00','105','101',270.00,270.00,270.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-24 23:59:00','101','101',55.00,55.00,55.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-24 23:59:00','102','101',110.00,110.00,110.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-24 23:59:00','103','101',165.00,165.00,165.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-24 23:59:00','104','101',220.00,220.00,220.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-24 23:59:00','105','101',275.00,275.00,275.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-25 23:59:00','101','101',56.00,56.00,56.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-25 23:59:00','102','101',112.00,112.00,112.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-25 23:59:00','103','101',168.00,168.00,168.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-25 23:59:00','104','101',224.00,224.00,224.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-25 23:59:00','105','101',280.00,280.00,280.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-26 23:59:00','101','101',57.00,57.00,57.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-26 23:59:00','102','101',114.00,114.00,114.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-26 23:59:00','103','101',171.00,171.00,171.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-26 23:59:00','104','101',228.00,228.00,228.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-26 23:59:00','105','101',285.00,285.00,285.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-27 23:59:00','101','101',58.00,58.00,58.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-27 23:59:00','102','101',116.00,116.00,116.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-27 23:59:00','103','101',174.00,174.00,174.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-27 23:59:00','104','101',232.00,232.00,232.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-27 23:59:00','105','101',290.00,290.00,290.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-28 23:59:00','101','101',59.00,59.00,59.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-28 23:59:00','102','101',118.00,118.00,118.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-28 23:59:00','103','101',177.00,177.00,177.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-28 23:59:00','104','101',236.00,236.00,236.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-28 23:59:00','105','101',295.00,295.00,295.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-29 23:59:00','101','101',60.00,60.00,60.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-29 23:59:00','102','101',120.00,120.00,120.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-29 23:59:00','103','101',180.00,180.00,180.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-29 23:59:00','104','101',240.00,240.00,240.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-29 23:59:00','105','101',300.00,300.00,300.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-30 23:59:00','101','101',61.00,61.00,61.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-30 23:59:00','102','101',122.00,122.00,122.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-30 23:59:00','103','101',183.00,183.00,183.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-30 23:59:00','104','101',244.00,244.00,244.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-30 23:59:00','105','101',305.00,305.00,305.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-08-31 23:59:00','101','101',62.00,62.00,62.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-08-31 23:59:00','102','101',124.00,124.00,124.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-08-31 23:59:00','103','101',186.00,186.00,186.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-08-31 23:59:00','104','101',248.00,248.00,248.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-08-31 23:59:00','105','101',310.00,310.00,310.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-01 23:59:00','101','101',63.00,63.00,63.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-01 23:59:00','102','101',126.00,126.00,126.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-01 23:59:00','103','101',189.00,189.00,189.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-01 23:59:00','104','101',252.00,252.00,252.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-01 23:59:00','105','101',315.00,315.00,315.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-02 23:59:00','101','101',64.00,64.00,64.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-02 23:59:00','102','101',128.00,128.00,128.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-02 23:59:00','103','101',192.00,192.00,192.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-02 23:59:00','104','101',256.00,256.00,256.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-02 23:59:00','105','101',320.00,320.00,320.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-03 23:59:00','101','101',65.00,65.00,65.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-03 23:59:00','102','101',130.00,130.00,130.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-03 23:59:00','103','101',195.00,195.00,195.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-03 23:59:00','104','101',260.00,260.00,260.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-03 23:59:00','105','101',325.00,325.00,325.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-04 23:59:00','101','101',66.00,66.00,66.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-04 23:59:00','102','101',132.00,132.00,132.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-04 23:59:00','103','101',198.00,198.00,198.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-04 23:59:00','104','101',264.00,264.00,264.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-04 23:59:00','105','101',330.00,330.00,330.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-05 23:59:00','101','101',67.00,67.00,67.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-05 23:59:00','102','101',134.00,134.00,134.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-05 23:59:00','103','101',201.00,201.00,201.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-05 23:59:00','104','101',268.00,268.00,268.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-05 23:59:00','105','101',335.00,335.00,335.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-06 23:59:00','101','101',68.00,68.00,68.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-06 23:59:00','102','101',136.00,136.00,136.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-06 23:59:00','103','101',204.00,204.00,204.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-06 23:59:00','104','101',272.00,272.00,272.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-06 23:59:00','105','101',340.00,340.00,340.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-07 23:59:00','101','101',69.00,69.00,69.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-07 23:59:00','102','101',138.00,138.00,138.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-07 23:59:00','103','101',207.00,207.00,207.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-07 23:59:00','104','101',276.00,276.00,276.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-07 23:59:00','105','101',345.00,345.00,345.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-08 23:59:00','101','101',70.00,70.00,70.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-08 23:59:00','102','101',140.00,140.00,140.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-08 23:59:00','103','101',210.00,210.00,210.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-08 23:59:00','104','101',280.00,280.00,280.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-08 23:59:00','105','101',350.00,350.00,350.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-09 23:59:00','101','101',71.00,71.00,71.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-09 23:59:00','102','101',142.00,142.00,142.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-09 23:59:00','103','101',213.00,213.00,213.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-09 23:59:00','104','101',284.00,284.00,284.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-09 23:59:00','105','101',355.00,355.00,355.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-10 23:59:00','101','101',72.00,72.00,72.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-10 23:59:00','102','101',144.00,144.00,144.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-10 23:59:00','103','101',216.00,216.00,216.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-10 23:59:00','104','101',288.00,288.00,288.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-10 23:59:00','105','101',360.00,360.00,360.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-11 23:59:00','101','101',73.00,73.00,73.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-11 23:59:00','102','101',146.00,146.00,146.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-11 23:59:00','103','101',219.00,219.00,219.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-11 23:59:00','104','101',292.00,292.00,292.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-11 23:59:00','105','101',365.00,365.00,365.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-12 23:59:00','101','101',74.00,74.00,74.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-12 23:59:00','102','101',148.00,148.00,148.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-12 23:59:00','103','101',222.00,222.00,222.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-12 23:59:00','104','101',296.00,296.00,296.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-12 23:59:00','105','101',370.00,370.00,370.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-13 23:59:00','101','101',75.00,75.00,75.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-13 23:59:00','102','101',150.00,150.00,150.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-13 23:59:00','103','101',225.00,225.00,225.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-13 23:59:00','104','101',300.00,300.00,300.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-13 23:59:00','105','101',375.00,375.00,375.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-14 23:59:00','101','101',76.00,76.00,76.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-14 23:59:00','102','101',152.00,152.00,152.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-14 23:59:00','103','101',228.00,228.00,228.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-14 23:59:00','104','101',304.00,304.00,304.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-14 23:59:00','105','101',380.00,380.00,380.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-15 23:59:00','101','101',77.00,77.00,77.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-15 23:59:00','102','101',154.00,154.00,154.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-15 23:59:00','103','101',231.00,231.00,231.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-15 23:59:00','104','101',308.00,308.00,308.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-15 23:59:00','105','101',385.00,385.00,385.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-16 23:59:00','101','101',78.00,78.00,78.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-16 23:59:00','102','101',156.00,156.00,156.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-16 23:59:00','103','101',234.00,234.00,234.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-16 23:59:00','104','101',312.00,312.00,312.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-16 23:59:00','105','101',390.00,390.00,390.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-17 23:59:00','101','101',79.00,79.00,79.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-17 23:59:00','102','101',158.00,158.00,158.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-17 23:59:00','103','101',237.00,237.00,237.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-17 23:59:00','104','101',316.00,316.00,316.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-17 23:59:00','105','101',395.00,395.00,395.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-18 23:59:00','101','101',80.00,80.00,80.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-18 23:59:00','102','101',160.00,160.00,160.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-18 23:59:00','103','101',240.00,240.00,240.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-18 23:59:00','104','101',320.00,320.00,320.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-18 23:59:00','105','101',400.00,400.00,400.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-19 23:59:00','101','101',81.00,81.00,81.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-19 23:59:00','102','101',162.00,162.00,162.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-19 23:59:00','103','101',243.00,243.00,243.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-19 23:59:00','104','101',324.00,324.00,324.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-19 23:59:00','105','101',405.00,405.00,405.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-20 23:59:00','101','101',82.00,82.00,82.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-20 23:59:00','102','101',164.00,164.00,164.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-20 23:59:00','103','101',246.00,246.00,246.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-20 23:59:00','104','101',328.00,328.00,328.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-20 23:59:00','105','101',410.00,410.00,410.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-21 23:59:00','101','101',83.00,83.00,83.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-21 23:59:00','102','101',166.00,166.00,166.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-21 23:59:00','103','101',249.00,249.00,249.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-21 23:59:00','104','101',332.00,332.00,332.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-21 23:59:00','105','101',415.00,415.00,415.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-22 23:59:00','101','101',84.00,84.00,84.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-22 23:59:00','102','101',168.00,168.00,168.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-22 23:59:00','103','101',252.00,252.00,252.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-22 23:59:00','104','101',336.00,336.00,336.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-22 23:59:00','105','101',420.00,420.00,420.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-23 23:59:00','101','101',85.00,85.00,85.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-23 23:59:00','102','101',170.00,170.00,170.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-23 23:59:00','103','101',255.00,255.00,255.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-23 23:59:00','104','101',340.00,340.00,340.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-23 23:59:00','105','101',425.00,425.00,425.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-24 23:59:00','101','101',86.00,86.00,86.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-24 23:59:00','102','101',172.00,172.00,172.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-24 23:59:00','103','101',258.00,258.00,258.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-24 23:59:00','104','101',344.00,344.00,344.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-24 23:59:00','105','101',430.00,430.00,430.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-25 23:59:00','101','101',87.00,87.00,87.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-25 23:59:00','102','101',174.00,174.00,174.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-25 23:59:00','103','101',261.00,261.00,261.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-25 23:59:00','104','101',348.00,348.00,348.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-25 23:59:00','105','101',435.00,435.00,435.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-26 23:59:00','101','101',88.00,88.00,88.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-26 23:59:00','102','101',176.00,176.00,176.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-26 23:59:00','103','101',264.00,264.00,264.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-26 23:59:00','104','101',352.00,352.00,352.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-26 23:59:00','105','101',440.00,440.00,440.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-27 23:59:00','101','101',89.00,89.00,89.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-27 23:59:00','102','101',178.00,178.00,178.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-27 23:59:00','103','101',267.00,267.00,267.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-27 23:59:00','104','101',356.00,356.00,356.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-27 23:59:00','105','101',445.00,445.00,445.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-28 23:59:00','101','101',90.00,90.00,90.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-28 23:59:00','102','101',180.00,180.00,180.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-28 23:59:00','103','101',270.00,270.00,270.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-28 23:59:00','104','101',360.00,360.00,360.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-28 23:59:00','105','101',450.00,450.00,450.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-29 23:59:00','101','101',91.00,91.00,91.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-29 23:59:00','102','101',182.00,182.00,182.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-29 23:59:00','103','101',273.00,273.00,273.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-29 23:59:00','104','101',364.00,364.00,364.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-29 23:59:00','105','101',455.00,455.00,455.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-09-30 23:59:00','101','101',92.00,92.00,92.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-09-30 23:59:00','102','101',184.00,184.00,184.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-09-30 23:59:00','103','101',276.00,276.00,276.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-09-30 23:59:00','104','101',368.00,368.00,368.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-09-30 23:59:00','105','101',460.00,460.00,460.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-01 23:59:00','101','101',93.00,93.00,93.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-01 23:59:00','102','101',186.00,186.00,186.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-01 23:59:00','103','101',279.00,279.00,279.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-01 23:59:00','104','101',372.00,372.00,372.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-01 23:59:00','105','101',465.00,465.00,465.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-02 23:59:00','101','101',94.00,94.00,94.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-02 23:59:00','102','101',188.00,188.00,188.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-02 23:59:00','103','101',282.00,282.00,282.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-02 23:59:00','104','101',376.00,376.00,376.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-02 23:59:00','105','101',470.00,470.00,470.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-03 23:59:00','101','101',95.00,95.00,95.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-03 23:59:00','102','101',190.00,190.00,190.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-03 23:59:00','103','101',285.00,285.00,285.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-03 23:59:00','104','101',380.00,380.00,380.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-03 23:59:00','105','101',475.00,475.00,475.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-04 23:59:00','101','101',96.00,96.00,96.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-04 23:59:00','102','101',192.00,192.00,192.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-04 23:59:00','103','101',288.00,288.00,288.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-04 23:59:00','104','101',384.00,384.00,384.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-04 23:59:00','105','101',480.00,480.00,480.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-05 23:59:00','101','101',97.00,97.00,97.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-05 23:59:00','102','101',194.00,194.00,194.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-05 23:59:00','103','101',291.00,291.00,291.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-05 23:59:00','104','101',388.00,388.00,388.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-05 23:59:00','105','101',485.00,485.00,485.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-06 23:59:00','101','101',98.00,98.00,98.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-06 23:59:00','102','101',196.00,196.00,196.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-06 23:59:00','103','101',294.00,294.00,294.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-06 23:59:00','104','101',392.00,392.00,392.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-06 23:59:00','105','101',490.00,490.00,490.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-07 23:59:00','101','101',99.00,99.00,99.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-07 23:59:00','102','101',198.00,198.00,198.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-07 23:59:00','103','101',297.00,297.00,297.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-07 23:59:00','104','101',396.00,396.00,396.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-07 23:59:00','105','101',495.00,495.00,495.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-08 23:59:00','101','101',100.00,100.00,100.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-08 23:59:00','102','101',200.00,200.00,200.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-08 23:59:00','103','101',300.00,300.00,300.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-08 23:59:00','104','101',400.00,400.00,400.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-08 23:59:00','105','101',500.00,500.00,500.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-09 23:59:00','101','101',101.00,101.00,101.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-09 23:59:00','102','101',202.00,202.00,202.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-09 23:59:00','103','101',303.00,303.00,303.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-09 23:59:00','104','101',404.00,404.00,404.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-09 23:59:00','105','101',505.00,505.00,505.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-10 23:59:00','101','101',102.00,102.00,102.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-10 23:59:00','102','101',204.00,204.00,204.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-10 23:59:00','103','101',306.00,306.00,306.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-10 23:59:00','104','101',408.00,408.00,408.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-10 23:59:00','105','101',510.00,510.00,510.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-11 23:59:00','101','101',103.00,103.00,103.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-11 23:59:00','102','101',206.00,206.00,206.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-11 23:59:00','103','101',309.00,309.00,309.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-11 23:59:00','104','101',412.00,412.00,412.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-11 23:59:00','105','101',515.00,515.00,515.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-12 23:59:00','101','101',104.00,104.00,104.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-12 23:59:00','102','101',208.00,208.00,208.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-12 23:59:00','103','101',312.00,312.00,312.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-12 23:59:00','104','101',416.00,416.00,416.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-12 23:59:00','105','101',520.00,520.00,520.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-13 23:59:00','101','101',105.00,105.00,105.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-13 23:59:00','102','101',210.00,210.00,210.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-13 23:59:00','103','101',315.00,315.00,315.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-13 23:59:00','104','101',420.00,420.00,420.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-13 23:59:00','105','101',525.00,525.00,525.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-14 23:59:00','101','101',106.00,106.00,106.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-14 23:59:00','102','101',212.00,212.00,212.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-14 23:59:00','103','101',318.00,318.00,318.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-14 23:59:00','104','101',424.00,424.00,424.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-14 23:59:00','105','101',530.00,530.00,530.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-15 23:59:00','101','101',107.00,107.00,107.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-15 23:59:00','102','101',214.00,214.00,214.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-15 23:59:00','103','101',321.00,321.00,321.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-15 23:59:00','104','101',428.00,428.00,428.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-15 23:59:00','105','101',535.00,535.00,535.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-16 23:59:00','101','101',108.00,108.00,108.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-16 23:59:00','102','101',216.00,216.00,216.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-16 23:59:00','103','101',324.00,324.00,324.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-16 23:59:00','104','101',432.00,432.00,432.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-16 23:59:00','105','101',540.00,540.00,540.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-17 23:59:00','101','101',109.00,109.00,109.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-17 23:59:00','102','101',218.00,218.00,218.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-17 23:59:00','103','101',327.00,327.00,327.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-17 23:59:00','104','101',436.00,436.00,436.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-17 23:59:00','105','101',545.00,545.00,545.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-18 23:59:00','101','101',110.00,110.00,110.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-18 23:59:00','102','101',220.00,220.00,220.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-18 23:59:00','103','101',330.00,330.00,330.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-18 23:59:00','104','101',440.00,440.00,440.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-18 23:59:00','105','101',550.00,550.00,550.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-19 23:59:00','101','101',111.00,111.00,111.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-19 23:59:00','102','101',222.00,222.00,222.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-19 23:59:00','103','101',333.00,333.00,333.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-19 23:59:00','104','101',444.00,444.00,444.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-19 23:59:00','105','101',555.00,555.00,555.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-20 23:59:00','101','101',112.00,112.00,112.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-20 23:59:00','102','101',224.00,224.00,224.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-20 23:59:00','103','101',336.00,336.00,336.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-20 23:59:00','104','101',448.00,448.00,448.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-20 23:59:00','105','101',560.00,560.00,560.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-21 23:59:00','101','101',113.00,113.00,113.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-21 23:59:00','102','101',226.00,226.00,226.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-21 23:59:00','103','101',339.00,339.00,339.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-21 23:59:00','104','101',452.00,452.00,452.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-21 23:59:00','105','101',565.00,565.00,565.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-22 23:59:00','101','101',114.00,114.00,114.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-22 23:59:00','102','101',228.00,228.00,228.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-22 23:59:00','103','101',342.00,342.00,342.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-22 23:59:00','104','101',456.00,456.00,456.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-22 23:59:00','105','101',570.00,570.00,570.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-23 23:59:00','101','101',115.00,115.00,115.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-23 23:59:00','102','101',230.00,230.00,230.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-23 23:59:00','103','101',345.00,345.00,345.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-23 23:59:00','104','101',460.00,460.00,460.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-23 23:59:00','105','101',575.00,575.00,575.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-24 23:59:00','101','101',116.00,116.00,116.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-24 23:59:00','102','101',232.00,232.00,232.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-24 23:59:00','103','101',348.00,348.00,348.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-24 23:59:00','104','101',464.00,464.00,464.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-24 23:59:00','105','101',580.00,580.00,580.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-25 23:59:00','101','101',117.00,117.00,117.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-25 23:59:00','102','101',234.00,234.00,234.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-25 23:59:00','103','101',351.00,351.00,351.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-25 23:59:00','104','101',468.00,468.00,468.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-25 23:59:00','105','101',585.00,585.00,585.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-26 23:59:00','101','101',118.00,118.00,118.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-26 23:59:00','102','101',236.00,236.00,236.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-26 23:59:00','103','101',354.00,354.00,354.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-26 23:59:00','104','101',472.00,472.00,472.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-26 23:59:00','105','101',590.00,590.00,590.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-27 23:59:00','101','101',119.00,119.00,119.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-27 23:59:00','102','101',238.00,238.00,238.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-27 23:59:00','103','101',357.00,357.00,357.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-27 23:59:00','104','101',476.00,476.00,476.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-27 23:59:00','105','101',595.00,595.00,595.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-28 23:59:00','101','101',120.00,120.00,120.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-28 23:59:00','102','101',240.00,240.00,240.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-28 23:59:00','103','101',360.00,360.00,360.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-28 23:59:00','104','101',480.00,480.00,480.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-28 23:59:00','105','101',600.00,600.00,600.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-29 23:59:00','101','101',121.00,121.00,121.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-29 23:59:00','102','101',242.00,242.00,242.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-29 23:59:00','103','101',363.00,363.00,363.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-29 23:59:00','104','101',484.00,484.00,484.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-29 23:59:00','105','101',605.00,605.00,605.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-30 23:59:00','101','101',122.00,122.00,122.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-30 23:59:00','102','101',244.00,244.00,244.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-30 23:59:00','103','101',366.00,366.00,366.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-30 23:59:00','104','101',488.00,488.00,488.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-30 23:59:00','105','101',610.00,610.00,610.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-10-31 23:59:00','101','101',123.00,123.00,123.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-10-31 23:59:00','102','101',246.00,246.00,246.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-10-31 23:59:00','103','101',369.00,369.00,369.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-10-31 23:59:00','104','101',492.00,492.00,492.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-10-31 23:59:00','105','101',615.00,615.00,615.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-01 23:59:00','101','101',124.00,124.00,124.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-01 23:59:00','102','101',248.00,248.00,248.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-01 23:59:00','103','101',372.00,372.00,372.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-01 23:59:00','104','101',496.00,496.00,496.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-01 23:59:00','105','101',620.00,620.00,620.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-02 23:59:00','101','101',125.00,125.00,125.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-02 23:59:00','102','101',250.00,250.00,250.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-02 23:59:00','103','101',375.00,375.00,375.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-02 23:59:00','104','101',500.00,500.00,500.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-02 23:59:00','105','101',625.00,625.00,625.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-03 23:59:00','101','101',126.00,126.00,126.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-03 23:59:00','102','101',252.00,252.00,252.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-03 23:59:00','103','101',378.00,378.00,378.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-03 23:59:00','104','101',504.00,504.00,504.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-03 23:59:00','105','101',630.00,630.00,630.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-04 23:59:00','101','101',127.00,127.00,127.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-04 23:59:00','102','101',254.00,254.00,254.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-04 23:59:00','103','101',381.00,381.00,381.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-04 23:59:00','104','101',508.00,508.00,508.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-04 23:59:00','105','101',635.00,635.00,635.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-05 23:59:00','101','101',128.00,128.00,128.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-05 23:59:00','102','101',256.00,256.00,256.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-05 23:59:00','103','101',384.00,384.00,384.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-05 23:59:00','104','101',512.00,512.00,512.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-05 23:59:00','105','101',640.00,640.00,640.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-06 23:59:00','101','101',129.00,129.00,129.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-06 23:59:00','102','101',258.00,258.00,258.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-06 23:59:00','103','101',387.00,387.00,387.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-06 23:59:00','104','101',516.00,516.00,516.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-06 23:59:00','105','101',645.00,645.00,645.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-07 23:59:00','101','101',130.00,130.00,130.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-07 23:59:00','102','101',260.00,260.00,260.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-07 23:59:00','103','101',390.00,390.00,390.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-07 23:59:00','104','101',520.00,520.00,520.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-07 23:59:00','105','101',650.00,650.00,650.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-08 23:59:00','101','101',131.00,131.00,131.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-08 23:59:00','102','101',262.00,262.00,262.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-08 23:59:00','103','101',393.00,393.00,393.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-08 23:59:00','104','101',524.00,524.00,524.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-08 23:59:00','105','101',655.00,655.00,655.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-09 23:59:00','101','101',132.00,132.00,132.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-09 23:59:00','102','101',264.00,264.00,264.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-09 23:59:00','103','101',396.00,396.00,396.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-09 23:59:00','104','101',528.00,528.00,528.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-09 23:59:00','105','101',660.00,660.00,660.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-10 23:59:00','101','101',133.00,133.00,133.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-10 23:59:00','102','101',266.00,266.00,266.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-10 23:59:00','103','101',399.00,399.00,399.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-10 23:59:00','104','101',532.00,532.00,532.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-10 23:59:00','105','101',665.00,665.00,665.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-11 23:59:00','101','101',134.00,134.00,134.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-11 23:59:00','102','101',268.00,268.00,268.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-11 23:59:00','103','101',402.00,402.00,402.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-11 23:59:00','104','101',536.00,536.00,536.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-11 23:59:00','105','101',670.00,670.00,670.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-12 23:59:00','101','101',135.00,135.00,135.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-12 23:59:00','102','101',270.00,270.00,270.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-12 23:59:00','103','101',405.00,405.00,405.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-12 23:59:00','104','101',540.00,540.00,540.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-12 23:59:00','105','101',675.00,675.00,675.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-13 23:59:00','101','101',136.00,136.00,136.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-13 23:59:00','102','101',272.00,272.00,272.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-13 23:59:00','103','101',408.00,408.00,408.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-13 23:59:00','104','101',544.00,544.00,544.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-13 23:59:00','105','101',680.00,680.00,680.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-14 23:59:00','101','101',137.00,137.00,137.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-14 23:59:00','102','101',274.00,274.00,274.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-14 23:59:00','103','101',411.00,411.00,411.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-14 23:59:00','104','101',548.00,548.00,548.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-14 23:59:00','105','101',685.00,685.00,685.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-15 23:59:00','101','101',138.00,138.00,138.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-15 23:59:00','102','101',276.00,276.00,276.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-15 23:59:00','103','101',414.00,414.00,414.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-15 23:59:00','104','101',552.00,552.00,552.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-15 23:59:00','105','101',690.00,690.00,690.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-16 23:59:00','101','101',139.00,139.00,139.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-16 23:59:00','102','101',278.00,278.00,278.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-16 23:59:00','103','101',417.00,417.00,417.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-16 23:59:00','104','101',556.00,556.00,556.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-16 23:59:00','105','101',695.00,695.00,695.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-17 23:59:00','101','101',140.00,140.00,140.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-17 23:59:00','102','101',280.00,280.00,280.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-17 23:59:00','103','101',420.00,420.00,420.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-17 23:59:00','104','101',560.00,560.00,560.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-17 23:59:00','105','101',700.00,700.00,700.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-18 23:59:00','101','101',141.00,141.00,141.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-18 23:59:00','102','101',282.00,282.00,282.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-18 23:59:00','103','101',423.00,423.00,423.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-18 23:59:00','104','101',564.00,564.00,564.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-18 23:59:00','105','101',705.00,705.00,705.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-19 23:59:00','101','101',142.00,142.00,142.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-19 23:59:00','102','101',284.00,284.00,284.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-19 23:59:00','103','101',426.00,426.00,426.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-19 23:59:00','104','101',568.00,568.00,568.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-19 23:59:00','105','101',710.00,710.00,710.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-20 23:59:00','101','101',143.00,143.00,143.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-20 23:59:00','102','101',286.00,286.00,286.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-20 23:59:00','103','101',429.00,429.00,429.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-20 23:59:00','104','101',572.00,572.00,572.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-20 23:59:00','105','101',715.00,715.00,715.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-21 23:59:00','101','101',144.00,144.00,144.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-21 23:59:00','102','101',288.00,288.00,288.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-21 23:59:00','103','101',432.00,432.00,432.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-21 23:59:00','104','101',576.00,576.00,576.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-21 23:59:00','105','101',720.00,720.00,720.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-22 23:59:00','101','101',145.00,145.00,145.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-22 23:59:00','102','101',290.00,290.00,290.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-22 23:59:00','103','101',435.00,435.00,435.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-22 23:59:00','104','101',580.00,580.00,580.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-22 23:59:00','105','101',725.00,725.00,725.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-23 23:59:00','101','101',146.00,146.00,146.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-23 23:59:00','102','101',292.00,292.00,292.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-23 23:59:00','103','101',438.00,438.00,438.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-23 23:59:00','104','101',584.00,584.00,584.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-23 23:59:00','105','101',730.00,730.00,730.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-24 23:59:00','101','101',147.00,147.00,147.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-24 23:59:00','102','101',294.00,294.00,294.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-24 23:59:00','103','101',441.00,441.00,441.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-24 23:59:00','104','101',588.00,588.00,588.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-24 23:59:00','105','101',735.00,735.00,735.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-25 23:59:00','101','101',148.00,148.00,148.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-25 23:59:00','102','101',296.00,296.00,296.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-25 23:59:00','103','101',444.00,444.00,444.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-25 23:59:00','104','101',592.00,592.00,592.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-25 23:59:00','105','101',740.00,740.00,740.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-26 23:59:00','101','101',149.00,149.00,149.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-26 23:59:00','102','101',298.00,298.00,298.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-26 23:59:00','103','101',447.00,447.00,447.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-26 23:59:00','104','101',596.00,596.00,596.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-26 23:59:00','105','101',745.00,745.00,745.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-27 23:59:00','101','101',150.00,150.00,150.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-27 23:59:00','102','101',300.00,300.00,300.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-27 23:59:00','103','101',450.00,450.00,450.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-27 23:59:00','104','101',600.00,600.00,600.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-27 23:59:00','105','101',750.00,750.00,750.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-28 23:59:00','101','101',151.00,151.00,151.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-28 23:59:00','102','101',302.00,302.00,302.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-28 23:59:00','103','101',453.00,453.00,453.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-28 23:59:00','104','101',604.00,604.00,604.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-28 23:59:00','105','101',755.00,755.00,755.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-29 23:59:00','101','101',152.00,152.00,152.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-29 23:59:00','102','101',304.00,304.00,304.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-29 23:59:00','103','101',456.00,456.00,456.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-29 23:59:00','104','101',608.00,608.00,608.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-29 23:59:00','105','101',760.00,760.00,760.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-11-30 23:59:00','101','101',153.00,153.00,153.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-11-30 23:59:00','102','101',306.00,306.00,306.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-11-30 23:59:00','103','101',459.00,459.00,459.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-11-30 23:59:00','104','101',612.00,612.00,612.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-11-30 23:59:00','105','101',765.00,765.00,765.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-01 23:59:00','101','101',154.00,154.00,154.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-01 23:59:00','102','101',308.00,308.00,308.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-01 23:59:00','103','101',462.00,462.00,462.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-01 23:59:00','104','101',616.00,616.00,616.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-01 23:59:00','105','101',770.00,770.00,770.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-02 23:59:00','101','101',155.00,155.00,155.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-02 23:59:00','102','101',310.00,310.00,310.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-02 23:59:00','103','101',465.00,465.00,465.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-02 23:59:00','104','101',620.00,620.00,620.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-02 23:59:00','105','101',775.00,775.00,775.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-03 23:59:00','101','101',156.00,156.00,156.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-03 23:59:00','102','101',312.00,312.00,312.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-03 23:59:00','103','101',468.00,468.00,468.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-03 23:59:00','104','101',624.00,624.00,624.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-03 23:59:00','105','101',780.00,780.00,780.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-04 23:59:00','101','101',157.00,157.00,157.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-04 23:59:00','102','101',314.00,314.00,314.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-04 23:59:00','103','101',471.00,471.00,471.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-04 23:59:00','104','101',628.00,628.00,628.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-04 23:59:00','105','101',785.00,785.00,785.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-05 23:59:00','101','101',158.00,158.00,158.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-05 23:59:00','102','101',316.00,316.00,316.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-05 23:59:00','103','101',474.00,474.00,474.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-05 23:59:00','104','101',632.00,632.00,632.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-05 23:59:00','105','101',790.00,790.00,790.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-06 23:59:00','101','101',159.00,159.00,159.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-06 23:59:00','102','101',318.00,318.00,318.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-06 23:59:00','103','101',477.00,477.00,477.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-06 23:59:00','104','101',636.00,636.00,636.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-06 23:59:00','105','101',795.00,795.00,795.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-07 23:59:00','101','101',160.00,160.00,160.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-07 23:59:00','102','101',320.00,320.00,320.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-07 23:59:00','103','101',480.00,480.00,480.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-07 23:59:00','104','101',640.00,640.00,640.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-07 23:59:00','105','101',800.00,800.00,800.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-08 23:59:00','101','101',161.00,161.00,161.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-08 23:59:00','102','101',322.00,322.00,322.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-08 23:59:00','103','101',483.00,483.00,483.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-08 23:59:00','104','101',644.00,644.00,644.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-08 23:59:00','105','101',805.00,805.00,805.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-09 23:59:00','101','101',162.00,162.00,162.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-09 23:59:00','102','101',324.00,324.00,324.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-09 23:59:00','103','101',486.00,486.00,486.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-09 23:59:00','104','101',648.00,648.00,648.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-09 23:59:00','105','101',810.00,810.00,810.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-10 23:59:00','101','101',163.00,163.00,163.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-10 23:59:00','102','101',326.00,326.00,326.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-10 23:59:00','103','101',489.00,489.00,489.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-10 23:59:00','104','101',652.00,652.00,652.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-10 23:59:00','105','101',815.00,815.00,815.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-11 23:59:00','101','101',164.00,164.00,164.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-11 23:59:00','102','101',328.00,328.00,328.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-11 23:59:00','103','101',492.00,492.00,492.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-11 23:59:00','104','101',656.00,656.00,656.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-11 23:59:00','105','101',820.00,820.00,820.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-12 23:59:00','101','101',165.00,165.00,165.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-12 23:59:00','102','101',330.00,330.00,330.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-12 23:59:00','103','101',495.00,495.00,495.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-12 23:59:00','104','101',660.00,660.00,660.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-12 23:59:00','105','101',825.00,825.00,825.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-13 23:59:00','101','101',166.00,166.00,166.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-13 23:59:00','102','101',332.00,332.00,332.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-13 23:59:00','103','101',498.00,498.00,498.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-13 23:59:00','104','101',664.00,664.00,664.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-13 23:59:00','105','101',830.00,830.00,830.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-14 23:59:00','101','101',167.00,167.00,167.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-14 23:59:00','102','101',334.00,334.00,334.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-14 23:59:00','103','101',501.00,501.00,501.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-14 23:59:00','104','101',668.00,668.00,668.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-14 23:59:00','105','101',835.00,835.00,835.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-15 23:59:00','101','101',168.00,168.00,168.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-15 23:59:00','102','101',336.00,336.00,336.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-15 23:59:00','103','101',504.00,504.00,504.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-15 23:59:00','104','101',672.00,672.00,672.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-15 23:59:00','105','101',840.00,840.00,840.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-16 23:59:00','101','101',169.00,169.00,169.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-16 23:59:00','102','101',338.00,338.00,338.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-16 23:59:00','103','101',507.00,507.00,507.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-16 23:59:00','104','101',676.00,676.00,676.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-16 23:59:00','105','101',845.00,845.00,845.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-17 23:59:00','101','101',170.00,170.00,170.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-17 23:59:00','102','101',340.00,340.00,340.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-17 23:59:00','103','101',510.00,510.00,510.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-17 23:59:00','104','101',680.00,680.00,680.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-17 23:59:00','105','101',850.00,850.00,850.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-18 23:59:00','101','101',171.00,171.00,171.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-18 23:59:00','102','101',342.00,342.00,342.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-18 23:59:00','103','101',513.00,513.00,513.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-18 23:59:00','104','101',684.00,684.00,684.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-18 23:59:00','105','101',855.00,855.00,855.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-19 23:59:00','101','101',172.00,172.00,172.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-19 23:59:00','102','101',344.00,344.00,344.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-19 23:59:00','103','101',516.00,516.00,516.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-19 23:59:00','104','101',688.00,688.00,688.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-19 23:59:00','105','101',860.00,860.00,860.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-20 23:59:00','101','101',173.00,173.00,173.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-20 23:59:00','102','101',346.00,346.00,346.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-20 23:59:00','103','101',519.00,519.00,519.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-20 23:59:00','104','101',692.00,692.00,692.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-20 23:59:00','105','101',865.00,865.00,865.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-21 23:59:00','101','101',174.00,174.00,174.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-21 23:59:00','102','101',348.00,348.00,348.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-21 23:59:00','103','101',522.00,522.00,522.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-21 23:59:00','104','101',696.00,696.00,696.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-21 23:59:00','105','101',870.00,870.00,870.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-22 23:59:00','101','101',175.00,175.00,175.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-22 23:59:00','102','101',350.00,350.00,350.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-22 23:59:00','103','101',525.00,525.00,525.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-22 23:59:00','104','101',700.00,700.00,700.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-22 23:59:00','105','101',875.00,875.00,875.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-23 23:59:00','101','101',176.00,176.00,176.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-23 23:59:00','102','101',352.00,352.00,352.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-23 23:59:00','103','101',528.00,528.00,528.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-23 23:59:00','104','101',704.00,704.00,704.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-23 23:59:00','105','101',880.00,880.00,880.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-24 23:59:00','101','101',177.00,177.00,177.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-24 23:59:00','102','101',354.00,354.00,354.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-24 23:59:00','103','101',531.00,531.00,531.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-24 23:59:00','104','101',708.00,708.00,708.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-24 23:59:00','105','101',885.00,885.00,885.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-25 23:59:00','101','101',178.00,178.00,178.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-25 23:59:00','102','101',356.00,356.00,356.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-25 23:59:00','103','101',534.00,534.00,534.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-25 23:59:00','104','101',712.00,712.00,712.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-25 23:59:00','105','101',890.00,890.00,890.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-26 23:59:00','101','101',179.00,179.00,179.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-26 23:59:00','102','101',358.00,358.00,358.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-26 23:59:00','103','101',537.00,537.00,537.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-26 23:59:00','104','101',716.00,716.00,716.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-26 23:59:00','105','101',895.00,895.00,895.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-27 23:59:00','101','101',180.00,180.00,180.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-27 23:59:00','102','101',360.00,360.00,360.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-27 23:59:00','103','101',540.00,540.00,540.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-27 23:59:00','104','101',720.00,720.00,720.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-27 23:59:00','105','101',900.00,900.00,900.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-28 23:59:00','101','101',181.00,181.00,181.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-28 23:59:00','102','101',362.00,362.00,362.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-28 23:59:00','103','101',543.00,543.00,543.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-28 23:59:00','104','101',724.00,724.00,724.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-28 23:59:00','105','101',905.00,905.00,905.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-29 23:59:00','101','101',182.00,182.00,182.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-29 23:59:00','102','101',364.00,364.00,364.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-29 23:59:00','103','101',546.00,546.00,546.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-29 23:59:00','104','101',728.00,728.00,728.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-29 23:59:00','105','101',910.00,910.00,910.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-30 23:59:00','101','101',183.00,183.00,183.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-30 23:59:00','102','101',366.00,366.00,366.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-30 23:59:00','103','101',549.00,549.00,549.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-30 23:59:00','104','101',732.00,732.00,732.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-30 23:59:00','105','101',915.00,915.00,915.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2021-12-31 23:59:00','101','101',184.00,184.00,184.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2021-12-31 23:59:00','102','101',368.00,368.00,368.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2021-12-31 23:59:00','103','101',552.00,552.00,552.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2021-12-31 23:59:00','104','101',736.00,736.00,736.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2021-12-31 23:59:00','105','101',920.00,920.00,920.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-01 23:59:00','101','101',185.00,185.00,185.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-01 23:59:00','102','101',370.00,370.00,370.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-01 23:59:00','103','101',555.00,555.00,555.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-01 23:59:00','104','101',740.00,740.00,740.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-01 23:59:00','105','101',925.00,925.00,925.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-02 23:59:00','101','101',186.00,186.00,186.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-02 23:59:00','102','101',372.00,372.00,372.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-02 23:59:00','103','101',558.00,558.00,558.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-02 23:59:00','104','101',744.00,744.00,744.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-02 23:59:00','105','101',930.00,930.00,930.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-03 23:59:00','101','101',187.00,187.00,187.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-03 23:59:00','102','101',374.00,374.00,374.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-03 23:59:00','103','101',561.00,561.00,561.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-03 23:59:00','104','101',748.00,748.00,748.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-03 23:59:00','105','101',935.00,935.00,935.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-04 23:59:00','101','101',188.00,188.00,188.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-04 23:59:00','102','101',376.00,376.00,376.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-04 23:59:00','103','101',564.00,564.00,564.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-04 23:59:00','104','101',752.00,752.00,752.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-04 23:59:00','105','101',940.00,940.00,940.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-05 23:59:00','101','101',189.00,189.00,189.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-05 23:59:00','102','101',378.00,378.00,378.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-05 23:59:00','103','101',567.00,567.00,567.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-05 23:59:00','104','101',756.00,756.00,756.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-05 23:59:00','105','101',945.00,945.00,945.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-06 23:59:00','101','101',190.00,190.00,190.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-06 23:59:00','102','101',380.00,380.00,380.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-06 23:59:00','103','101',570.00,570.00,570.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-06 23:59:00','104','101',760.00,760.00,760.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-06 23:59:00','105','101',950.00,950.00,950.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-07 23:59:00','101','101',191.00,191.00,191.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-07 23:59:00','102','101',382.00,382.00,382.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-07 23:59:00','103','101',573.00,573.00,573.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-07 23:59:00','104','101',764.00,764.00,764.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-07 23:59:00','105','101',955.00,955.00,955.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-08 23:59:00','101','101',192.00,192.00,192.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-08 23:59:00','102','101',384.00,384.00,384.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-08 23:59:00','103','101',576.00,576.00,576.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-08 23:59:00','104','101',768.00,768.00,768.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-08 23:59:00','105','101',960.00,960.00,960.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-09 23:59:00','101','101',193.00,193.00,193.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-09 23:59:00','102','101',386.00,386.00,386.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-09 23:59:00','103','101',579.00,579.00,579.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-09 23:59:00','104','101',772.00,772.00,772.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-09 23:59:00','105','101',965.00,965.00,965.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-10 23:59:00','101','101',194.00,194.00,194.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-10 23:59:00','102','101',388.00,388.00,388.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-10 23:59:00','103','101',582.00,582.00,582.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-10 23:59:00','104','101',776.00,776.00,776.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-10 23:59:00','105','101',970.00,970.00,970.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-11 23:59:00','101','101',195.00,195.00,195.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-11 23:59:00','102','101',390.00,390.00,390.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-11 23:59:00','103','101',585.00,585.00,585.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-11 23:59:00','104','101',780.00,780.00,780.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-11 23:59:00','105','101',975.00,975.00,975.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-12 23:59:00','101','101',196.00,196.00,196.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-12 23:59:00','102','101',392.00,392.00,392.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-12 23:59:00','103','101',588.00,588.00,588.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-12 23:59:00','104','101',784.00,784.00,784.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-12 23:59:00','105','101',980.00,980.00,980.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-13 23:59:00','101','101',197.00,197.00,197.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-13 23:59:00','102','101',394.00,394.00,394.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-13 23:59:00','103','101',591.00,591.00,591.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-13 23:59:00','104','101',788.00,788.00,788.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-13 23:59:00','105','101',985.00,985.00,985.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-14 23:59:00','101','101',198.00,198.00,198.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-14 23:59:00','102','101',396.00,396.00,396.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-14 23:59:00','103','101',594.00,594.00,594.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-14 23:59:00','104','101',792.00,792.00,792.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-14 23:59:00','105','101',990.00,990.00,990.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-15 23:59:00','101','101',199.00,199.00,199.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-15 23:59:00','102','101',398.00,398.00,398.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-15 23:59:00','103','101',597.00,597.00,597.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-15 23:59:00','104','101',796.00,796.00,796.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-15 23:59:00','105','101',995.00,995.00,995.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-16 23:59:00','101','101',200.00,200.00,200.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-16 23:59:00','102','101',400.00,400.00,400.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-16 23:59:00','103','101',600.00,600.00,600.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-16 23:59:00','104','101',800.00,800.00,800.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-16 23:59:00','105','101',1000.00,1000.00,1000.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-17 23:59:00','101','101',201.00,201.00,201.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-17 23:59:00','102','101',402.00,402.00,402.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-17 23:59:00','103','101',603.00,603.00,603.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-17 23:59:00','104','101',804.00,804.00,804.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-17 23:59:00','105','101',1005.00,1005.00,1005.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-18 23:59:00','101','101',202.00,202.00,202.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-18 23:59:00','102','101',404.00,404.00,404.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-18 23:59:00','103','101',606.00,606.00,606.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-18 23:59:00','104','101',808.00,808.00,808.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-18 23:59:00','105','101',1010.00,1010.00,1010.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-19 23:59:00','101','101',203.00,203.00,203.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-19 23:59:00','102','101',406.00,406.00,406.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-19 23:59:00','103','101',609.00,609.00,609.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-19 23:59:00','104','101',812.00,812.00,812.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-19 23:59:00','105','101',1015.00,1015.00,1015.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-20 23:59:00','101','101',204.00,204.00,204.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-20 23:59:00','102','101',408.00,408.00,408.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-20 23:59:00','103','101',612.00,612.00,612.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-20 23:59:00','104','101',816.00,816.00,816.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-20 23:59:00','105','101',1020.00,1020.00,1020.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-21 23:59:00','101','101',205.00,205.00,205.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-21 23:59:00','102','101',410.00,410.00,410.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-21 23:59:00','103','101',615.00,615.00,615.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-21 23:59:00','104','101',820.00,820.00,820.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-21 23:59:00','105','101',1025.00,1025.00,1025.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-22 23:59:00','101','101',206.00,206.00,206.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-22 23:59:00','102','101',412.00,412.00,412.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-22 23:59:00','103','101',618.00,618.00,618.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-22 23:59:00','104','101',824.00,824.00,824.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-22 23:59:00','105','101',1030.00,1030.00,1030.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-23 23:59:00','101','101',207.00,207.00,207.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-23 23:59:00','102','101',414.00,414.00,414.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-23 23:59:00','103','101',621.00,621.00,621.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-23 23:59:00','104','101',828.00,828.00,828.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-23 23:59:00','105','101',1035.00,1035.00,1035.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-24 23:59:00','101','101',208.00,208.00,208.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-24 23:59:00','102','101',416.00,416.00,416.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-24 23:59:00','103','101',624.00,624.00,624.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-24 23:59:00','104','101',832.00,832.00,832.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-24 23:59:00','105','101',1040.00,1040.00,1040.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-25 23:59:00','101','101',209.00,209.00,209.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-25 23:59:00','102','101',418.00,418.00,418.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-25 23:59:00','103','101',627.00,627.00,627.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-25 23:59:00','104','101',836.00,836.00,836.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-25 23:59:00','105','101',1045.00,1045.00,1045.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-26 23:59:00','101','101',210.00,210.00,210.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-26 23:59:00','102','101',420.00,420.00,420.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-26 23:59:00','103','101',630.00,630.00,630.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-26 23:59:00','104','101',840.00,840.00,840.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-26 23:59:00','105','101',1050.00,1050.00,1050.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-27 23:59:00','101','101',211.00,211.00,211.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-27 23:59:00','102','101',422.00,422.00,422.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-27 23:59:00','103','101',633.00,633.00,633.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-27 23:59:00','104','101',844.00,844.00,844.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-27 23:59:00','105','101',1055.00,1055.00,1055.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-28 23:59:00','101','101',212.00,212.00,212.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-28 23:59:00','102','101',424.00,424.00,424.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-28 23:59:00','103','101',636.00,636.00,636.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-28 23:59:00','104','101',848.00,848.00,848.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-28 23:59:00','105','101',1060.00,1060.00,1060.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-29 23:59:00','101','101',213.00,213.00,213.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-29 23:59:00','102','101',426.00,426.00,426.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-29 23:59:00','103','101',639.00,639.00,639.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-29 23:59:00','104','101',852.00,852.00,852.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-29 23:59:00','105','101',1065.00,1065.00,1065.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-30 23:59:00','101','101',214.00,214.00,214.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-30 23:59:00','102','101',428.00,428.00,428.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-30 23:59:00','103','101',642.00,642.00,642.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-30 23:59:00','104','101',856.00,856.00,856.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-30 23:59:00','105','101',1070.00,1070.00,1070.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-01-31 23:59:00','101','101',215.00,215.00,215.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-01-31 23:59:00','102','101',430.00,430.00,430.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-01-31 23:59:00','103','101',645.00,645.00,645.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-01-31 23:59:00','104','101',860.00,860.00,860.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-01-31 23:59:00','105','101',1075.00,1075.00,1075.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-01 23:59:00','101','101',216.00,216.00,216.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-01 23:59:00','102','101',432.00,432.00,432.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-01 23:59:00','103','101',648.00,648.00,648.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-01 23:59:00','104','101',864.00,864.00,864.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-01 23:59:00','105','101',1080.00,1080.00,1080.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-02 23:59:00','101','101',217.00,217.00,217.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-02 23:59:00','102','101',434.00,434.00,434.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-02 23:59:00','103','101',651.00,651.00,651.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-02 23:59:00','104','101',868.00,868.00,868.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-02 23:59:00','105','101',1085.00,1085.00,1085.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-03 23:59:00','101','101',218.00,218.00,218.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-03 23:59:00','102','101',436.00,436.00,436.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-03 23:59:00','103','101',654.00,654.00,654.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-03 23:59:00','104','101',872.00,872.00,872.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-03 23:59:00','105','101',1090.00,1090.00,1090.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-04 23:59:00','101','101',219.00,219.00,219.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-04 23:59:00','102','101',438.00,438.00,438.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-04 23:59:00','103','101',657.00,657.00,657.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-04 23:59:00','104','101',876.00,876.00,876.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-04 23:59:00','105','101',1095.00,1095.00,1095.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-05 23:59:00','101','101',220.00,220.00,220.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-05 23:59:00','102','101',440.00,440.00,440.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-05 23:59:00','103','101',660.00,660.00,660.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-05 23:59:00','104','101',880.00,880.00,880.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-05 23:59:00','105','101',1100.00,1100.00,1100.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-06 23:59:00','101','101',221.00,221.00,221.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-06 23:59:00','102','101',442.00,442.00,442.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-06 23:59:00','103','101',663.00,663.00,663.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-06 23:59:00','104','101',884.00,884.00,884.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-06 23:59:00','105','101',1105.00,1105.00,1105.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-07 23:59:00','101','101',222.00,222.00,222.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-07 23:59:00','102','101',444.00,444.00,444.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-07 23:59:00','103','101',666.00,666.00,666.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-07 23:59:00','104','101',888.00,888.00,888.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-07 23:59:00','105','101',1110.00,1110.00,1110.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-08 23:59:00','101','101',223.00,223.00,223.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-08 23:59:00','102','101',446.00,446.00,446.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-08 23:59:00','103','101',669.00,669.00,669.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-08 23:59:00','104','101',892.00,892.00,892.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-08 23:59:00','105','101',1115.00,1115.00,1115.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-09 23:59:00','101','101',224.00,224.00,224.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-09 23:59:00','102','101',448.00,448.00,448.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-09 23:59:00','103','101',672.00,672.00,672.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-09 23:59:00','104','101',896.00,896.00,896.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-09 23:59:00','105','101',1120.00,1120.00,1120.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-10 23:59:00','101','101',225.00,225.00,225.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-10 23:59:00','102','101',450.00,450.00,450.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-10 23:59:00','103','101',675.00,675.00,675.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-10 23:59:00','104','101',900.00,900.00,900.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-10 23:59:00','105','101',1125.00,1125.00,1125.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-11 23:59:00','101','101',226.00,226.00,226.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-11 23:59:00','102','101',452.00,452.00,452.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-11 23:59:00','103','101',678.00,678.00,678.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-11 23:59:00','104','101',904.00,904.00,904.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-11 23:59:00','105','101',1130.00,1130.00,1130.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-12 23:59:00','101','101',227.00,227.00,227.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-12 23:59:00','102','101',454.00,454.00,454.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-12 23:59:00','103','101',681.00,681.00,681.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-12 23:59:00','104','101',908.00,908.00,908.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-12 23:59:00','105','101',1135.00,1135.00,1135.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-13 23:59:00','101','101',228.00,228.00,228.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-13 23:59:00','102','101',456.00,456.00,456.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-13 23:59:00','103','101',684.00,684.00,684.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-13 23:59:00','104','101',912.00,912.00,912.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-13 23:59:00','105','101',1140.00,1140.00,1140.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-14 23:59:00','101','101',229.00,229.00,229.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-14 23:59:00','102','101',458.00,458.00,458.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-14 23:59:00','103','101',687.00,687.00,687.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-14 23:59:00','104','101',916.00,916.00,916.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-14 23:59:00','105','101',1145.00,1145.00,1145.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-15 23:59:00','101','101',230.00,230.00,230.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-15 23:59:00','102','101',460.00,460.00,460.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-15 23:59:00','103','101',690.00,690.00,690.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-15 23:59:00','104','101',920.00,920.00,920.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-15 23:59:00','105','101',1150.00,1150.00,1150.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-16 23:59:00','101','101',231.00,231.00,231.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-16 23:59:00','102','101',462.00,462.00,462.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-16 23:59:00','103','101',693.00,693.00,693.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-16 23:59:00','104','101',924.00,924.00,924.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-16 23:59:00','105','101',1155.00,1155.00,1155.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-17 23:59:00','101','101',232.00,232.00,232.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-17 23:59:00','102','101',464.00,464.00,464.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-17 23:59:00','103','101',696.00,696.00,696.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-17 23:59:00','104','101',928.00,928.00,928.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-17 23:59:00','105','101',1160.00,1160.00,1160.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-18 23:59:00','101','101',233.00,233.00,233.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-18 23:59:00','102','101',466.00,466.00,466.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-18 23:59:00','103','101',699.00,699.00,699.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-18 23:59:00','104','101',932.00,932.00,932.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-18 23:59:00','105','101',1165.00,1165.00,1165.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-19 23:59:00','101','101',234.00,234.00,234.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-19 23:59:00','102','101',468.00,468.00,468.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-19 23:59:00','103','101',702.00,702.00,702.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-19 23:59:00','104','101',936.00,936.00,936.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-19 23:59:00','105','101',1170.00,1170.00,1170.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-20 23:59:00','101','101',235.00,235.00,235.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-20 23:59:00','102','101',470.00,470.00,470.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-20 23:59:00','103','101',705.00,705.00,705.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-20 23:59:00','104','101',940.00,940.00,940.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-20 23:59:00','105','101',1175.00,1175.00,1175.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-21 23:59:00','101','101',236.00,236.00,236.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-21 23:59:00','102','101',472.00,472.00,472.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-21 23:59:00','103','101',708.00,708.00,708.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-21 23:59:00','104','101',944.00,944.00,944.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-21 23:59:00','105','101',1180.00,1180.00,1180.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-22 23:59:00','101','101',237.00,237.00,237.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-22 23:59:00','102','101',474.00,474.00,474.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-22 23:59:00','103','101',711.00,711.00,711.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-22 23:59:00','104','101',948.00,948.00,948.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-22 23:59:00','105','101',1185.00,1185.00,1185.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-23 23:59:00','101','101',238.00,238.00,238.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-23 23:59:00','102','101',476.00,476.00,476.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-23 23:59:00','103','101',714.00,714.00,714.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-23 23:59:00','104','101',952.00,952.00,952.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-23 23:59:00','105','101',1190.00,1190.00,1190.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-24 23:59:00','101','101',239.00,239.00,239.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-24 23:59:00','102','101',478.00,478.00,478.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-24 23:59:00','103','101',717.00,717.00,717.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-24 23:59:00','104','101',956.00,956.00,956.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-24 23:59:00','105','101',1195.00,1195.00,1195.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-25 23:59:00','101','101',240.00,240.00,240.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-25 23:59:00','102','101',480.00,480.00,480.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-25 23:59:00','103','101',720.00,720.00,720.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-25 23:59:00','104','101',960.00,960.00,960.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-25 23:59:00','105','101',1200.00,1200.00,1200.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-26 23:59:00','101','101',241.00,241.00,241.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-26 23:59:00','102','101',482.00,482.00,482.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-26 23:59:00','103','101',723.00,723.00,723.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-26 23:59:00','104','101',964.00,964.00,964.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-26 23:59:00','105','101',1205.00,1205.00,1205.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-27 23:59:00','101','101',242.00,242.00,242.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-27 23:59:00','102','101',484.00,484.00,484.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-27 23:59:00','103','101',726.00,726.00,726.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-27 23:59:00','104','101',968.00,968.00,968.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-27 23:59:00','105','101',1210.00,1210.00,1210.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-02-28 23:59:00','101','101',243.00,243.00,243.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-02-28 23:59:00','102','101',486.00,486.00,486.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-02-28 23:59:00','103','101',729.00,729.00,729.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-02-28 23:59:00','104','101',972.00,972.00,972.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-02-28 23:59:00','105','101',1215.00,1215.00,1215.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-01 23:59:00','101','101',244.00,244.00,244.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-01 23:59:00','102','101',488.00,488.00,488.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-01 23:59:00','103','101',732.00,732.00,732.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-01 23:59:00','104','101',976.00,976.00,976.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-01 23:59:00','105','101',1220.00,1220.00,1220.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-02 23:59:00','101','101',245.00,245.00,245.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-02 23:59:00','102','101',490.00,490.00,490.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-02 23:59:00','103','101',735.00,735.00,735.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-02 23:59:00','104','101',980.00,980.00,980.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-02 23:59:00','105','101',1225.00,1225.00,1225.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-03 23:59:00','101','101',246.00,246.00,246.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-03 23:59:00','102','101',492.00,492.00,492.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-03 23:59:00','103','101',738.00,738.00,738.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-03 23:59:00','104','101',984.00,984.00,984.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-03 23:59:00','105','101',1230.00,1230.00,1230.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-04 23:59:00','101','101',247.00,247.00,247.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-04 23:59:00','102','101',494.00,494.00,494.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-04 23:59:00','103','101',741.00,741.00,741.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-04 23:59:00','104','101',988.00,988.00,988.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-04 23:59:00','105','101',1235.00,1235.00,1235.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-05 23:59:00','101','101',248.00,248.00,248.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-05 23:59:00','102','101',496.00,496.00,496.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-05 23:59:00','103','101',744.00,744.00,744.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-05 23:59:00','104','101',992.00,992.00,992.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-05 23:59:00','105','101',1240.00,1240.00,1240.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-06 23:59:00','101','101',249.00,249.00,249.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-06 23:59:00','102','101',498.00,498.00,498.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-06 23:59:00','103','101',747.00,747.00,747.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-06 23:59:00','104','101',996.00,996.00,996.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-06 23:59:00','105','101',1245.00,1245.00,1245.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-07 23:59:00','101','101',250.00,250.00,250.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-07 23:59:00','102','101',500.00,500.00,500.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-07 23:59:00','103','101',750.00,750.00,750.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-07 23:59:00','104','101',1000.00,1000.00,1000.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-07 23:59:00','105','101',1250.00,1250.00,1250.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-08 23:59:00','101','101',251.00,251.00,251.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-08 23:59:00','102','101',502.00,502.00,502.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-08 23:59:00','103','101',753.00,753.00,753.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-08 23:59:00','104','101',1004.00,1004.00,1004.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-08 23:59:00','105','101',1255.00,1255.00,1255.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-09 23:59:00','101','101',252.00,252.00,252.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-09 23:59:00','102','101',504.00,504.00,504.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-09 23:59:00','103','101',756.00,756.00,756.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-09 23:59:00','104','101',1008.00,1008.00,1008.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-09 23:59:00','105','101',1260.00,1260.00,1260.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-10 23:59:00','101','101',253.00,253.00,253.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-10 23:59:00','102','101',506.00,506.00,506.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-10 23:59:00','103','101',759.00,759.00,759.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-10 23:59:00','104','101',1012.00,1012.00,1012.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-10 23:59:00','105','101',1265.00,1265.00,1265.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-11 23:59:00','101','101',254.00,254.00,254.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-11 23:59:00','102','101',508.00,508.00,508.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-11 23:59:00','103','101',762.00,762.00,762.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-11 23:59:00','104','101',1016.00,1016.00,1016.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-11 23:59:00','105','101',1270.00,1270.00,1270.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-12 23:59:00','101','101',255.00,255.00,255.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-12 23:59:00','102','101',510.00,510.00,510.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-12 23:59:00','103','101',765.00,765.00,765.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-12 23:59:00','104','101',1020.00,1020.00,1020.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-12 23:59:00','105','101',1275.00,1275.00,1275.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-13 23:59:00','101','101',256.00,256.00,256.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-13 23:59:00','102','101',512.00,512.00,512.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-13 23:59:00','103','101',768.00,768.00,768.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-13 23:59:00','104','101',1024.00,1024.00,1024.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-13 23:59:00','105','101',1280.00,1280.00,1280.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-14 23:59:00','101','101',257.00,257.00,257.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-14 23:59:00','102','101',514.00,514.00,514.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-14 23:59:00','103','101',771.00,771.00,771.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-14 23:59:00','104','101',1028.00,1028.00,1028.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-14 23:59:00','105','101',1285.00,1285.00,1285.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-15 23:59:00','101','101',258.00,258.00,258.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-15 23:59:00','102','101',516.00,516.00,516.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-15 23:59:00','103','101',774.00,774.00,774.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-15 23:59:00','104','101',1032.00,1032.00,1032.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-15 23:59:00','105','101',1290.00,1290.00,1290.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-16 23:59:00','101','101',259.00,259.00,259.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-16 23:59:00','102','101',518.00,518.00,518.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-16 23:59:00','103','101',777.00,777.00,777.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-16 23:59:00','104','101',1036.00,1036.00,1036.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-16 23:59:00','105','101',1295.00,1295.00,1295.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-17 23:59:00','101','101',260.00,260.00,260.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-17 23:59:00','102','101',520.00,520.00,520.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-17 23:59:00','103','101',780.00,780.00,780.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-17 23:59:00','104','101',1040.00,1040.00,1040.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-17 23:59:00','105','101',1300.00,1300.00,1300.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-18 23:59:00','101','101',261.00,261.00,261.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-18 23:59:00','102','101',522.00,522.00,522.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-18 23:59:00','103','101',783.00,783.00,783.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-18 23:59:00','104','101',1044.00,1044.00,1044.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-18 23:59:00','105','101',1305.00,1305.00,1305.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-19 23:59:00','101','101',262.00,262.00,262.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-19 23:59:00','102','101',524.00,524.00,524.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-19 23:59:00','103','101',786.00,786.00,786.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-19 23:59:00','104','101',1048.00,1048.00,1048.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-19 23:59:00','105','101',1310.00,1310.00,1310.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-20 23:59:00','101','101',263.00,263.00,263.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-20 23:59:00','102','101',526.00,526.00,526.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-20 23:59:00','103','101',789.00,789.00,789.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-20 23:59:00','104','101',1052.00,1052.00,1052.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-20 23:59:00','105','101',1315.00,1315.00,1315.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-21 23:59:00','101','101',264.00,264.00,264.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-21 23:59:00','102','101',528.00,528.00,528.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-21 23:59:00','103','101',792.00,792.00,792.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-21 23:59:00','104','101',1056.00,1056.00,1056.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-21 23:59:00','105','101',1320.00,1320.00,1320.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-22 23:59:00','101','101',265.00,265.00,265.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-22 23:59:00','102','101',530.00,530.00,530.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-22 23:59:00','103','101',795.00,795.00,795.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-22 23:59:00','104','101',1060.00,1060.00,1060.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-22 23:59:00','105','101',1325.00,1325.00,1325.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-23 23:59:00','101','101',266.00,266.00,266.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-23 23:59:00','102','101',532.00,532.00,532.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-23 23:59:00','103','101',798.00,798.00,798.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-23 23:59:00','104','101',1064.00,1064.00,1064.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-23 23:59:00','105','101',1330.00,1330.00,1330.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-24 23:59:00','101','101',267.00,267.00,267.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-24 23:59:00','102','101',534.00,534.00,534.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-24 23:59:00','103','101',801.00,801.00,801.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-24 23:59:00','104','101',1068.00,1068.00,1068.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-24 23:59:00','105','101',1335.00,1335.00,1335.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-25 23:59:00','101','101',268.00,268.00,268.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-25 23:59:00','102','101',536.00,536.00,536.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-25 23:59:00','103','101',804.00,804.00,804.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-25 23:59:00','104','101',1072.00,1072.00,1072.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-25 23:59:00','105','101',1340.00,1340.00,1340.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-26 23:59:00','101','101',269.00,269.00,269.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-26 23:59:00','102','101',538.00,538.00,538.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-26 23:59:00','103','101',807.00,807.00,807.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-26 23:59:00','104','101',1076.00,1076.00,1076.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-26 23:59:00','105','101',1345.00,1345.00,1345.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-27 23:59:00','101','101',270.00,270.00,270.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-27 23:59:00','102','101',540.00,540.00,540.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-27 23:59:00','103','101',810.00,810.00,810.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-27 23:59:00','104','101',1080.00,1080.00,1080.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-27 23:59:00','105','101',1350.00,1350.00,1350.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-28 23:59:00','101','101',271.00,271.00,271.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-28 23:59:00','102','101',542.00,542.00,542.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-28 23:59:00','103','101',813.00,813.00,813.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-28 23:59:00','104','101',1084.00,1084.00,1084.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-28 23:59:00','105','101',1355.00,1355.00,1355.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-29 23:59:00','101','101',272.00,272.00,272.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-29 23:59:00','102','101',544.00,544.00,544.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-29 23:59:00','103','101',816.00,816.00,816.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-29 23:59:00','104','101',1088.00,1088.00,1088.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-29 23:59:00','105','101',1360.00,1360.00,1360.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-30 23:59:00','101','101',273.00,273.00,273.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-30 23:59:00','102','101',546.00,546.00,546.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-30 23:59:00','103','101',819.00,819.00,819.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-30 23:59:00','104','101',1092.00,1092.00,1092.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-30 23:59:00','105','101',1365.00,1365.00,1365.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-03-31 23:59:00','101','101',274.00,274.00,274.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-03-31 23:59:00','102','101',548.00,548.00,548.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-03-31 23:59:00','103','101',822.00,822.00,822.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-03-31 23:59:00','104','101',1096.00,1096.00,1096.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-03-31 23:59:00','105','101',1370.00,1370.00,1370.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-01 23:59:00','101','101',275.00,275.00,275.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-01 23:59:00','102','101',550.00,550.00,550.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-01 23:59:00','103','101',825.00,825.00,825.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-01 23:59:00','104','101',1100.00,1100.00,1100.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-01 23:59:00','105','101',1375.00,1375.00,1375.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-02 23:59:00','101','101',276.00,276.00,276.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-02 23:59:00','102','101',552.00,552.00,552.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-02 23:59:00','103','101',828.00,828.00,828.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-02 23:59:00','104','101',1104.00,1104.00,1104.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-02 23:59:00','105','101',1380.00,1380.00,1380.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-03 23:59:00','101','101',277.00,277.00,277.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-03 23:59:00','102','101',554.00,554.00,554.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-03 23:59:00','103','101',831.00,831.00,831.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-03 23:59:00','104','101',1108.00,1108.00,1108.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-03 23:59:00','105','101',1385.00,1385.00,1385.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-04 23:59:00','101','101',278.00,278.00,278.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-04 23:59:00','102','101',556.00,556.00,556.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-04 23:59:00','103','101',834.00,834.00,834.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-04 23:59:00','104','101',1112.00,1112.00,1112.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-04 23:59:00','105','101',1390.00,1390.00,1390.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-05 23:59:00','101','101',279.00,279.00,279.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-05 23:59:00','102','101',558.00,558.00,558.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-05 23:59:00','103','101',837.00,837.00,837.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-05 23:59:00','104','101',1116.00,1116.00,1116.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-05 23:59:00','105','101',1395.00,1395.00,1395.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-06 23:59:00','101','101',280.00,280.00,280.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-06 23:59:00','102','101',560.00,560.00,560.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-06 23:59:00','103','101',840.00,840.00,840.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-06 23:59:00','104','101',1120.00,1120.00,1120.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-06 23:59:00','105','101',1400.00,1400.00,1400.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-07 23:59:00','101','101',281.00,281.00,281.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-07 23:59:00','102','101',562.00,562.00,562.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-07 23:59:00','103','101',843.00,843.00,843.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-07 23:59:00','104','101',1124.00,1124.00,1124.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-07 23:59:00','105','101',1405.00,1405.00,1405.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-08 23:59:00','101','101',282.00,282.00,282.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-08 23:59:00','102','101',564.00,564.00,564.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-08 23:59:00','103','101',846.00,846.00,846.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-08 23:59:00','104','101',1128.00,1128.00,1128.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-08 23:59:00','105','101',1410.00,1410.00,1410.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-09 23:59:00','101','101',283.00,283.00,283.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-09 23:59:00','102','101',566.00,566.00,566.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-09 23:59:00','103','101',849.00,849.00,849.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-09 23:59:00','104','101',1132.00,1132.00,1132.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-09 23:59:00','105','101',1415.00,1415.00,1415.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-10 23:59:00','101','101',284.00,284.00,284.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-10 23:59:00','102','101',568.00,568.00,568.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-10 23:59:00','103','101',852.00,852.00,852.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-10 23:59:00','104','101',1136.00,1136.00,1136.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-10 23:59:00','105','101',1420.00,1420.00,1420.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-11 23:59:00','101','101',285.00,285.00,285.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-11 23:59:00','102','101',570.00,570.00,570.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-11 23:59:00','103','101',855.00,855.00,855.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-11 23:59:00','104','101',1140.00,1140.00,1140.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-11 23:59:00','105','101',1425.00,1425.00,1425.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-12 23:59:00','101','101',286.00,286.00,286.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-12 23:59:00','102','101',572.00,572.00,572.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-12 23:59:00','103','101',858.00,858.00,858.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-12 23:59:00','104','101',1144.00,1144.00,1144.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-12 23:59:00','105','101',1430.00,1430.00,1430.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-13 23:59:00','101','101',287.00,287.00,287.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-13 23:59:00','102','101',574.00,574.00,574.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-13 23:59:00','103','101',861.00,861.00,861.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-13 23:59:00','104','101',1148.00,1148.00,1148.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-13 23:59:00','105','101',1435.00,1435.00,1435.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-14 23:59:00','101','101',288.00,288.00,288.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-14 23:59:00','102','101',576.00,576.00,576.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-14 23:59:00','103','101',864.00,864.00,864.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-14 23:59:00','104','101',1152.00,1152.00,1152.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-14 23:59:00','105','101',1440.00,1440.00,1440.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-15 23:59:00','101','101',289.00,289.00,289.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-15 23:59:00','102','101',578.00,578.00,578.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-15 23:59:00','103','101',867.00,867.00,867.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-15 23:59:00','104','101',1156.00,1156.00,1156.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-15 23:59:00','105','101',1445.00,1445.00,1445.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-16 23:59:00','101','101',290.00,290.00,290.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-16 23:59:00','102','101',580.00,580.00,580.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-16 23:59:00','103','101',870.00,870.00,870.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-16 23:59:00','104','101',1160.00,1160.00,1160.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-16 23:59:00','105','101',1450.00,1450.00,1450.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-17 23:59:00','101','101',291.00,291.00,291.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-17 23:59:00','102','101',582.00,582.00,582.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-17 23:59:00','103','101',873.00,873.00,873.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-17 23:59:00','104','101',1164.00,1164.00,1164.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-17 23:59:00','105','101',1455.00,1455.00,1455.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-18 23:59:00','101','101',292.00,292.00,292.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-18 23:59:00','102','101',584.00,584.00,584.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-18 23:59:00','103','101',876.00,876.00,876.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-18 23:59:00','104','101',1168.00,1168.00,1168.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-18 23:59:00','105','101',1460.00,1460.00,1460.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-19 23:59:00','101','101',293.00,293.00,293.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-19 23:59:00','102','101',586.00,586.00,586.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-19 23:59:00','103','101',879.00,879.00,879.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-19 23:59:00','104','101',1172.00,1172.00,1172.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-19 23:59:00','105','101',1465.00,1465.00,1465.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-20 23:59:00','101','101',294.00,294.00,294.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-20 23:59:00','102','101',588.00,588.00,588.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-20 23:59:00','103','101',882.00,882.00,882.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-20 23:59:00','104','101',1176.00,1176.00,1176.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-20 23:59:00','105','101',1470.00,1470.00,1470.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-21 23:59:00','101','101',295.00,295.00,295.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-21 23:59:00','102','101',590.00,590.00,590.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-21 23:59:00','103','101',885.00,885.00,885.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-21 23:59:00','104','101',1180.00,1180.00,1180.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-21 23:59:00','105','101',1475.00,1475.00,1475.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-22 23:59:00','101','101',296.00,296.00,296.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-22 23:59:00','102','101',592.00,592.00,592.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-22 23:59:00','103','101',888.00,888.00,888.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-22 23:59:00','104','101',1184.00,1184.00,1184.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-22 23:59:00','105','101',1480.00,1480.00,1480.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-23 23:59:00','101','101',297.00,297.00,297.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-23 23:59:00','102','101',594.00,594.00,594.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-23 23:59:00','103','101',891.00,891.00,891.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-23 23:59:00','104','101',1188.00,1188.00,1188.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-23 23:59:00','105','101',1485.00,1485.00,1485.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-24 23:59:00','101','101',298.00,298.00,298.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-24 23:59:00','102','101',596.00,596.00,596.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-24 23:59:00','103','101',894.00,894.00,894.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-24 23:59:00','104','101',1192.00,1192.00,1192.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-24 23:59:00','105','101',1490.00,1490.00,1490.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-25 23:59:00','101','101',299.00,299.00,299.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-25 23:59:00','102','101',598.00,598.00,598.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-25 23:59:00','103','101',897.00,897.00,897.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-25 23:59:00','104','101',1196.00,1196.00,1196.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-25 23:59:00','105','101',1495.00,1495.00,1495.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-26 23:59:00','101','101',300.00,300.00,300.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-26 23:59:00','102','101',600.00,600.00,600.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-26 23:59:00','103','101',900.00,900.00,900.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-26 23:59:00','104','101',1200.00,1200.00,1200.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-26 23:59:00','105','101',1500.00,1500.00,1500.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-27 23:59:00','101','101',301.00,301.00,301.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-27 23:59:00','102','101',602.00,602.00,602.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-27 23:59:00','103','101',903.00,903.00,903.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-27 23:59:00','104','101',1204.00,1204.00,1204.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-27 23:59:00','105','101',1505.00,1505.00,1505.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-28 23:59:00','101','101',302.00,302.00,302.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-28 23:59:00','102','101',604.00,604.00,604.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-28 23:59:00','103','101',906.00,906.00,906.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-28 23:59:00','104','101',1208.00,1208.00,1208.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-28 23:59:00','105','101',1510.00,1510.00,1510.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-29 23:59:00','101','101',303.00,303.00,303.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-29 23:59:00','102','101',606.00,606.00,606.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-29 23:59:00','103','101',909.00,909.00,909.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-29 23:59:00','104','101',1212.00,1212.00,1212.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-29 23:59:00','105','101',1515.00,1515.00,1515.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-04-30 23:59:00','101','101',304.00,304.00,304.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-04-30 23:59:00','102','101',608.00,608.00,608.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-04-30 23:59:00','103','101',912.00,912.00,912.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-04-30 23:59:00','104','101',1216.00,1216.00,1216.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-04-30 23:59:00','105','101',1520.00,1520.00,1520.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-01 23:59:00','101','101',305.00,305.00,305.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-01 23:59:00','102','101',610.00,610.00,610.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-01 23:59:00','103','101',915.00,915.00,915.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-01 23:59:00','104','101',1220.00,1220.00,1220.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-01 23:59:00','105','101',1525.00,1525.00,1525.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-02 23:59:00','101','101',306.00,306.00,306.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-02 23:59:00','102','101',612.00,612.00,612.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-02 23:59:00','103','101',918.00,918.00,918.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-02 23:59:00','104','101',1224.00,1224.00,1224.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-02 23:59:00','105','101',1530.00,1530.00,1530.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-03 23:59:00','101','101',307.00,307.00,307.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-03 23:59:00','102','101',614.00,614.00,614.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-03 23:59:00','103','101',921.00,921.00,921.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-03 23:59:00','104','101',1228.00,1228.00,1228.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-03 23:59:00','105','101',1535.00,1535.00,1535.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-04 23:59:00','101','101',308.00,308.00,308.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-04 23:59:00','102','101',616.00,616.00,616.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-04 23:59:00','103','101',924.00,924.00,924.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-04 23:59:00','104','101',1232.00,1232.00,1232.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-04 23:59:00','105','101',1540.00,1540.00,1540.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-05 23:59:00','101','101',309.00,309.00,309.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-05 23:59:00','102','101',618.00,618.00,618.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-05 23:59:00','103','101',927.00,927.00,927.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-05 23:59:00','104','101',1236.00,1236.00,1236.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-05 23:59:00','105','101',1545.00,1545.00,1545.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-06 23:59:00','101','101',310.00,310.00,310.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-06 23:59:00','102','101',620.00,620.00,620.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-06 23:59:00','103','101',930.00,930.00,930.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-06 23:59:00','104','101',1240.00,1240.00,1240.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-06 23:59:00','105','101',1550.00,1550.00,1550.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-07 23:59:00','101','101',311.00,311.00,311.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-07 23:59:00','102','101',622.00,622.00,622.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-07 23:59:00','103','101',933.00,933.00,933.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-07 23:59:00','104','101',1244.00,1244.00,1244.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-07 23:59:00','105','101',1555.00,1555.00,1555.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-08 23:59:00','101','101',312.00,312.00,312.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-08 23:59:00','102','101',624.00,624.00,624.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-08 23:59:00','103','101',936.00,936.00,936.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-08 23:59:00','104','101',1248.00,1248.00,1248.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-08 23:59:00','105','101',1560.00,1560.00,1560.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-09 23:59:00','101','101',313.00,313.00,313.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-09 23:59:00','102','101',626.00,626.00,626.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-09 23:59:00','103','101',939.00,939.00,939.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-09 23:59:00','104','101',1252.00,1252.00,1252.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-09 23:59:00','105','101',1565.00,1565.00,1565.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-10 23:59:00','101','101',314.00,314.00,314.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-10 23:59:00','102','101',628.00,628.00,628.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-10 23:59:00','103','101',942.00,942.00,942.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-10 23:59:00','104','101',1256.00,1256.00,1256.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-10 23:59:00','105','101',1570.00,1570.00,1570.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-11 23:59:00','101','101',315.00,315.00,315.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-11 23:59:00','102','101',630.00,630.00,630.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-11 23:59:00','103','101',945.00,945.00,945.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-11 23:59:00','104','101',1260.00,1260.00,1260.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-11 23:59:00','105','101',1575.00,1575.00,1575.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-12 23:59:00','101','101',316.00,316.00,316.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-12 23:59:00','102','101',632.00,632.00,632.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-12 23:59:00','103','101',948.00,948.00,948.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-12 23:59:00','104','101',1264.00,1264.00,1264.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-12 23:59:00','105','101',1580.00,1580.00,1580.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-13 23:59:00','101','101',317.00,317.00,317.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-13 23:59:00','102','101',634.00,634.00,634.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-13 23:59:00','103','101',951.00,951.00,951.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-13 23:59:00','104','101',1268.00,1268.00,1268.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-13 23:59:00','105','101',1585.00,1585.00,1585.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-14 23:59:00','101','101',318.00,318.00,318.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-14 23:59:00','102','101',636.00,636.00,636.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-14 23:59:00','103','101',954.00,954.00,954.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-14 23:59:00','104','101',1272.00,1272.00,1272.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-14 23:59:00','105','101',1590.00,1590.00,1590.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-15 23:59:00','101','101',319.00,319.00,319.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-15 23:59:00','102','101',638.00,638.00,638.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-15 23:59:00','103','101',957.00,957.00,957.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-15 23:59:00','104','101',1276.00,1276.00,1276.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-15 23:59:00','105','101',1595.00,1595.00,1595.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-16 23:59:00','101','101',320.00,320.00,320.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-16 23:59:00','102','101',640.00,640.00,640.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-16 23:59:00','103','101',960.00,960.00,960.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-16 23:59:00','104','101',1280.00,1280.00,1280.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-16 23:59:00','105','101',1600.00,1600.00,1600.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-17 23:59:00','101','101',321.00,321.00,321.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-17 23:59:00','102','101',642.00,642.00,642.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-17 23:59:00','103','101',963.00,963.00,963.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-17 23:59:00','104','101',1284.00,1284.00,1284.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-17 23:59:00','105','101',1605.00,1605.00,1605.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-18 23:59:00','101','101',322.00,322.00,322.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-18 23:59:00','102','101',644.00,644.00,644.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-18 23:59:00','103','101',966.00,966.00,966.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-18 23:59:00','104','101',1288.00,1288.00,1288.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-18 23:59:00','105','101',1610.00,1610.00,1610.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-19 23:59:00','101','101',323.00,323.00,323.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-19 23:59:00','102','101',646.00,646.00,646.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-19 23:59:00','103','101',969.00,969.00,969.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-19 23:59:00','104','101',1292.00,1292.00,1292.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-19 23:59:00','105','101',1615.00,1615.00,1615.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-20 23:59:00','101','101',324.00,324.00,324.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-20 23:59:00','102','101',648.00,648.00,648.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-20 23:59:00','103','101',972.00,972.00,972.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-20 23:59:00','104','101',1296.00,1296.00,1296.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-20 23:59:00','105','101',1620.00,1620.00,1620.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-21 23:59:00','101','101',325.00,325.00,325.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-21 23:59:00','102','101',650.00,650.00,650.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-21 23:59:00','103','101',975.00,975.00,975.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-21 23:59:00','104','101',1300.00,1300.00,1300.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-21 23:59:00','105','101',1625.00,1625.00,1625.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-22 23:59:00','101','101',326.00,326.00,326.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-22 23:59:00','102','101',652.00,652.00,652.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-22 23:59:00','103','101',978.00,978.00,978.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-22 23:59:00','104','101',1304.00,1304.00,1304.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-22 23:59:00','105','101',1630.00,1630.00,1630.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-23 23:59:00','101','101',327.00,327.00,327.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-23 23:59:00','102','101',654.00,654.00,654.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-23 23:59:00','103','101',981.00,981.00,981.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-23 23:59:00','104','101',1308.00,1308.00,1308.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-23 23:59:00','105','101',1635.00,1635.00,1635.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-24 23:59:00','101','101',328.00,328.00,328.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-24 23:59:00','102','101',656.00,656.00,656.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-24 23:59:00','103','101',984.00,984.00,984.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-24 23:59:00','104','101',1312.00,1312.00,1312.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-24 23:59:00','105','101',1640.00,1640.00,1640.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-25 23:59:00','101','101',329.00,329.00,329.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-25 23:59:00','102','101',658.00,658.00,658.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-25 23:59:00','103','101',987.00,987.00,987.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-25 23:59:00','104','101',1316.00,1316.00,1316.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-25 23:59:00','105','101',1645.00,1645.00,1645.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-26 23:59:00','101','101',330.00,330.00,330.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-26 23:59:00','102','101',660.00,660.00,660.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-26 23:59:00','103','101',990.00,990.00,990.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-26 23:59:00','104','101',1320.00,1320.00,1320.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-26 23:59:00','105','101',1650.00,1650.00,1650.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-27 23:59:00','101','101',331.00,331.00,331.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-27 23:59:00','102','101',662.00,662.00,662.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-27 23:59:00','103','101',993.00,993.00,993.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-27 23:59:00','104','101',1324.00,1324.00,1324.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-27 23:59:00','105','101',1655.00,1655.00,1655.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-28 23:59:00','101','101',332.00,332.00,332.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-28 23:59:00','102','101',664.00,664.00,664.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-28 23:59:00','103','101',996.00,996.00,996.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-28 23:59:00','104','101',1328.00,1328.00,1328.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-28 23:59:00','105','101',1660.00,1660.00,1660.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-29 23:59:00','101','101',333.00,333.00,333.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-29 23:59:00','102','101',666.00,666.00,666.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-29 23:59:00','103','101',999.00,999.00,999.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-29 23:59:00','104','101',1332.00,1332.00,1332.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-29 23:59:00','105','101',1665.00,1665.00,1665.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-30 23:59:00','101','101',334.00,334.00,334.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-30 23:59:00','102','101',668.00,668.00,668.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-30 23:59:00','103','101',1002.00,1002.00,1002.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-30 23:59:00','104','101',1336.00,1336.00,1336.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-30 23:59:00','105','101',1670.00,1670.00,1670.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-05-31 23:59:00','101','101',335.00,335.00,335.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-05-31 23:59:00','102','101',670.00,670.00,670.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-05-31 23:59:00','103','101',1005.00,1005.00,1005.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-05-31 23:59:00','104','101',1340.00,1340.00,1340.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-05-31 23:59:00','105','101',1675.00,1675.00,1675.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-01 23:59:00','101','101',336.00,336.00,336.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-01 23:59:00','102','101',672.00,672.00,672.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-01 23:59:00','103','101',1008.00,1008.00,1008.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-01 23:59:00','104','101',1344.00,1344.00,1344.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-01 23:59:00','105','101',1680.00,1680.00,1680.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-02 23:59:00','101','101',337.00,337.00,337.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-02 23:59:00','102','101',674.00,674.00,674.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-02 23:59:00','103','101',1011.00,1011.00,1011.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-02 23:59:00','104','101',1348.00,1348.00,1348.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-02 23:59:00','105','101',1685.00,1685.00,1685.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-03 23:59:00','101','101',338.00,338.00,338.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-03 23:59:00','102','101',676.00,676.00,676.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-03 23:59:00','103','101',1014.00,1014.00,1014.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-03 23:59:00','104','101',1352.00,1352.00,1352.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-03 23:59:00','105','101',1690.00,1690.00,1690.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-04 23:59:00','101','101',339.00,339.00,339.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-04 23:59:00','102','101',678.00,678.00,678.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-04 23:59:00','103','101',1017.00,1017.00,1017.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-04 23:59:00','104','101',1356.00,1356.00,1356.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-04 23:59:00','105','101',1695.00,1695.00,1695.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-05 23:59:00','101','101',340.00,340.00,340.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-05 23:59:00','102','101',680.00,680.00,680.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-05 23:59:00','103','101',1020.00,1020.00,1020.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-05 23:59:00','104','101',1360.00,1360.00,1360.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-05 23:59:00','105','101',1700.00,1700.00,1700.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-06 23:59:00','101','101',341.00,341.00,341.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-06 23:59:00','102','101',682.00,682.00,682.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-06 23:59:00','103','101',1023.00,1023.00,1023.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-06 23:59:00','104','101',1364.00,1364.00,1364.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-06 23:59:00','105','101',1705.00,1705.00,1705.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-07 23:59:00','101','101',342.00,342.00,342.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-07 23:59:00','102','101',684.00,684.00,684.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-07 23:59:00','103','101',1026.00,1026.00,1026.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-07 23:59:00','104','101',1368.00,1368.00,1368.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-07 23:59:00','105','101',1710.00,1710.00,1710.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-08 23:59:00','101','101',343.00,343.00,343.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-08 23:59:00','102','101',686.00,686.00,686.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-08 23:59:00','103','101',1029.00,1029.00,1029.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-08 23:59:00','104','101',1372.00,1372.00,1372.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-08 23:59:00','105','101',1715.00,1715.00,1715.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-09 23:59:00','101','101',344.00,344.00,344.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-09 23:59:00','102','101',688.00,688.00,688.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-09 23:59:00','103','101',1032.00,1032.00,1032.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-09 23:59:00','104','101',1376.00,1376.00,1376.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-09 23:59:00','105','101',1720.00,1720.00,1720.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-10 23:59:00','101','101',345.00,345.00,345.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-10 23:59:00','102','101',690.00,690.00,690.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-10 23:59:00','103','101',1035.00,1035.00,1035.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-10 23:59:00','104','101',1380.00,1380.00,1380.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-10 23:59:00','105','101',1725.00,1725.00,1725.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-11 23:59:00','101','101',346.00,346.00,346.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-11 23:59:00','102','101',692.00,692.00,692.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-11 23:59:00','103','101',1038.00,1038.00,1038.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-11 23:59:00','104','101',1384.00,1384.00,1384.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-11 23:59:00','105','101',1730.00,1730.00,1730.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-12 23:59:00','101','101',347.00,347.00,347.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-12 23:59:00','102','101',694.00,694.00,694.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-12 23:59:00','103','101',1041.00,1041.00,1041.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-12 23:59:00','104','101',1388.00,1388.00,1388.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-12 23:59:00','105','101',1735.00,1735.00,1735.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-13 23:59:00','101','101',348.00,348.00,348.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-13 23:59:00','102','101',696.00,696.00,696.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-13 23:59:00','103','101',1044.00,1044.00,1044.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-13 23:59:00','104','101',1392.00,1392.00,1392.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-13 23:59:00','105','101',1740.00,1740.00,1740.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-14 23:59:00','101','101',349.00,349.00,349.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-14 23:59:00','102','101',698.00,698.00,698.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-14 23:59:00','103','101',1047.00,1047.00,1047.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-14 23:59:00','104','101',1396.00,1396.00,1396.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-14 23:59:00','105','101',1745.00,1745.00,1745.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-15 23:59:00','101','101',350.00,350.00,350.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-15 23:59:00','102','101',700.00,700.00,700.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-15 23:59:00','103','101',1050.00,1050.00,1050.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-15 23:59:00','104','101',1400.00,1400.00,1400.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-15 23:59:00','105','101',1750.00,1750.00,1750.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-16 23:59:00','101','101',351.00,351.00,351.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-16 23:59:00','102','101',702.00,702.00,702.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-16 23:59:00','103','101',1053.00,1053.00,1053.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-16 23:59:00','104','101',1404.00,1404.00,1404.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-16 23:59:00','105','101',1755.00,1755.00,1755.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-17 23:59:00','101','101',352.00,352.00,352.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-17 23:59:00','102','101',704.00,704.00,704.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-17 23:59:00','103','101',1056.00,1056.00,1056.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-17 23:59:00','104','101',1408.00,1408.00,1408.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-17 23:59:00','105','101',1760.00,1760.00,1760.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-18 23:59:00','101','101',353.00,353.00,353.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-18 23:59:00','102','101',706.00,706.00,706.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-18 23:59:00','103','101',1059.00,1059.00,1059.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-18 23:59:00','104','101',1412.00,1412.00,1412.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-18 23:59:00','105','101',1765.00,1765.00,1765.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-19 23:59:00','101','101',354.00,354.00,354.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-19 23:59:00','102','101',708.00,708.00,708.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-19 23:59:00','103','101',1062.00,1062.00,1062.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-19 23:59:00','104','101',1416.00,1416.00,1416.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-19 23:59:00','105','101',1770.00,1770.00,1770.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-20 23:59:00','101','101',355.00,355.00,355.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-20 23:59:00','102','101',710.00,710.00,710.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-20 23:59:00','103','101',1065.00,1065.00,1065.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-20 23:59:00','104','101',1420.00,1420.00,1420.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-20 23:59:00','105','101',1775.00,1775.00,1775.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-21 23:59:00','101','101',356.00,356.00,356.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-21 23:59:00','102','101',712.00,712.00,712.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-21 23:59:00','103','101',1068.00,1068.00,1068.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-21 23:59:00','104','101',1424.00,1424.00,1424.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-21 23:59:00','105','101',1780.00,1780.00,1780.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-22 23:59:00','101','101',357.00,357.00,357.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-22 23:59:00','102','101',714.00,714.00,714.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-22 23:59:00','103','101',1071.00,1071.00,1071.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-22 23:59:00','104','101',1428.00,1428.00,1428.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-22 23:59:00','105','101',1785.00,1785.00,1785.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-23 23:59:00','101','101',358.00,358.00,358.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-23 23:59:00','102','101',716.00,716.00,716.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-23 23:59:00','103','101',1074.00,1074.00,1074.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-23 23:59:00','104','101',1432.00,1432.00,1432.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-23 23:59:00','105','101',1790.00,1790.00,1790.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-24 23:59:00','101','101',359.00,359.00,359.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-24 23:59:00','102','101',718.00,718.00,718.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-24 23:59:00','103','101',1077.00,1077.00,1077.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-24 23:59:00','104','101',1436.00,1436.00,1436.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-24 23:59:00','105','101',1795.00,1795.00,1795.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-25 23:59:00','101','101',360.00,360.00,360.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-25 23:59:00','102','101',720.00,720.00,720.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-25 23:59:00','103','101',1080.00,1080.00,1080.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-25 23:59:00','104','101',1440.00,1440.00,1440.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-25 23:59:00','105','101',1800.00,1800.00,1800.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-26 23:59:00','101','101',361.00,361.00,361.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-26 23:59:00','102','101',722.00,722.00,722.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-26 23:59:00','103','101',1083.00,1083.00,1083.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-26 23:59:00','104','101',1444.00,1444.00,1444.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-26 23:59:00','105','101',1805.00,1805.00,1805.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-27 23:59:00','101','101',362.00,362.00,362.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-27 23:59:00','102','101',724.00,724.00,724.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-27 23:59:00','103','101',1086.00,1086.00,1086.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-27 23:59:00','104','101',1448.00,1448.00,1448.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-27 23:59:00','105','101',1810.00,1810.00,1810.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-28 23:59:00','101','101',363.00,363.00,363.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-28 23:59:00','102','101',726.00,726.00,726.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-28 23:59:00','103','101',1089.00,1089.00,1089.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-28 23:59:00','104','101',1452.00,1452.00,1452.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-28 23:59:00','105','101',1815.00,1815.00,1815.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-29 23:59:00','101','101',364.00,364.00,364.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-29 23:59:00','102','101',728.00,728.00,728.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-29 23:59:00','103','101',1092.00,1092.00,1092.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-29 23:59:00','104','101',1456.00,1456.00,1456.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-29 23:59:00','105','101',1820.00,1820.00,1820.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-06-30 23:59:00','101','101',365.00,365.00,365.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-06-30 23:59:00','102','101',730.00,730.00,730.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-06-30 23:59:00','103','101',1095.00,1095.00,1095.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-06-30 23:59:00','104','101',1460.00,1460.00,1460.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-06-30 23:59:00','105','101',1825.00,1825.00,1825.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-01 23:59:00','101','101',366.00,366.00,366.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-01 23:59:00','102','101',732.00,732.00,732.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-01 23:59:00','103','101',1098.00,1098.00,1098.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-01 23:59:00','104','101',1464.00,1464.00,1464.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-01 23:59:00','105','101',1830.00,1830.00,1830.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-02 23:59:00','101','101',367.00,367.00,367.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-02 23:59:00','102','101',734.00,734.00,734.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-02 23:59:00','103','101',1101.00,1101.00,1101.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-02 23:59:00','104','101',1468.00,1468.00,1468.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-02 23:59:00','105','101',1835.00,1835.00,1835.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-03 23:59:00','101','101',368.00,368.00,368.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-03 23:59:00','102','101',736.00,736.00,736.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-03 23:59:00','103','101',1104.00,1104.00,1104.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-03 23:59:00','104','101',1472.00,1472.00,1472.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-03 23:59:00','105','101',1840.00,1840.00,1840.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-04 23:59:00','101','101',369.00,369.00,369.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-04 23:59:00','102','101',738.00,738.00,738.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-04 23:59:00','103','101',1107.00,1107.00,1107.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-04 23:59:00','104','101',1476.00,1476.00,1476.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-04 23:59:00','105','101',1845.00,1845.00,1845.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-05 23:59:00','101','101',370.00,370.00,370.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-05 23:59:00','102','101',740.00,740.00,740.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-05 23:59:00','103','101',1110.00,1110.00,1110.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-05 23:59:00','104','101',1480.00,1480.00,1480.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-05 23:59:00','105','101',1850.00,1850.00,1850.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-06 23:59:00','101','101',371.00,371.00,371.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-06 23:59:00','102','101',742.00,742.00,742.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-06 23:59:00','103','101',1113.00,1113.00,1113.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-06 23:59:00','104','101',1484.00,1484.00,1484.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-06 23:59:00','105','101',1855.00,1855.00,1855.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-07 23:59:00','101','101',372.00,372.00,372.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-07 23:59:00','102','101',744.00,744.00,744.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-07 23:59:00','103','101',1116.00,1116.00,1116.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-07 23:59:00','104','101',1488.00,1488.00,1488.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-07 23:59:00','105','101',1860.00,1860.00,1860.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-08 23:59:00','101','101',373.00,373.00,373.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-08 23:59:00','102','101',746.00,746.00,746.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-08 23:59:00','103','101',1119.00,1119.00,1119.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-08 23:59:00','104','101',1492.00,1492.00,1492.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-08 23:59:00','105','101',1865.00,1865.00,1865.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-09 23:59:00','101','101',374.00,374.00,374.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-09 23:59:00','102','101',748.00,748.00,748.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-09 23:59:00','103','101',1122.00,1122.00,1122.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-09 23:59:00','104','101',1496.00,1496.00,1496.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-09 23:59:00','105','101',1870.00,1870.00,1870.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-10 23:59:00','101','101',375.00,375.00,375.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-10 23:59:00','102','101',750.00,750.00,750.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-10 23:59:00','103','101',1125.00,1125.00,1125.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-10 23:59:00','104','101',1500.00,1500.00,1500.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-10 23:59:00','105','101',1875.00,1875.00,1875.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-11 23:59:00','101','101',376.00,376.00,376.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-11 23:59:00','102','101',752.00,752.00,752.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-11 23:59:00','103','101',1128.00,1128.00,1128.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-11 23:59:00','104','101',1504.00,1504.00,1504.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-11 23:59:00','105','101',1880.00,1880.00,1880.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-12 23:59:00','101','101',377.00,377.00,377.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-12 23:59:00','102','101',754.00,754.00,754.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-12 23:59:00','103','101',1131.00,1131.00,1131.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-12 23:59:00','104','101',1508.00,1508.00,1508.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-12 23:59:00','105','101',1885.00,1885.00,1885.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-13 23:59:00','101','101',378.00,378.00,378.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-13 23:59:00','102','101',756.00,756.00,756.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-13 23:59:00','103','101',1134.00,1134.00,1134.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-13 23:59:00','104','101',1512.00,1512.00,1512.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-13 23:59:00','105','101',1890.00,1890.00,1890.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-14 23:59:00','101','101',379.00,379.00,379.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-14 23:59:00','102','101',758.00,758.00,758.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-14 23:59:00','103','101',1137.00,1137.00,1137.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-14 23:59:00','104','101',1516.00,1516.00,1516.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-14 23:59:00','105','101',1895.00,1895.00,1895.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-15 23:59:00','101','101',380.00,380.00,380.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-15 23:59:00','102','101',760.00,760.00,760.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-15 23:59:00','103','101',1140.00,1140.00,1140.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-15 23:59:00','104','101',1520.00,1520.00,1520.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-15 23:59:00','105','101',1900.00,1900.00,1900.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-16 23:59:00','101','101',381.00,381.00,381.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-16 23:59:00','102','101',762.00,762.00,762.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-16 23:59:00','103','101',1143.00,1143.00,1143.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-16 23:59:00','104','101',1524.00,1524.00,1524.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-16 23:59:00','105','101',1905.00,1905.00,1905.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-17 23:59:00','101','101',382.00,382.00,382.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-17 23:59:00','102','101',764.00,764.00,764.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-17 23:59:00','103','101',1146.00,1146.00,1146.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-17 23:59:00','104','101',1528.00,1528.00,1528.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-17 23:59:00','105','101',1910.00,1910.00,1910.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-18 23:59:00','101','101',383.00,383.00,383.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-18 23:59:00','102','101',766.00,766.00,766.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-18 23:59:00','103','101',1149.00,1149.00,1149.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-18 23:59:00','104','101',1532.00,1532.00,1532.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-18 23:59:00','105','101',1915.00,1915.00,1915.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-19 23:59:00','101','101',384.00,384.00,384.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-19 23:59:00','102','101',768.00,768.00,768.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-19 23:59:00','103','101',1152.00,1152.00,1152.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-19 23:59:00','104','101',1536.00,1536.00,1536.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-19 23:59:00','105','101',1920.00,1920.00,1920.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-20 23:59:00','101','101',385.00,385.00,385.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-20 23:59:00','102','101',770.00,770.00,770.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-20 23:59:00','103','101',1155.00,1155.00,1155.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-20 23:59:00','104','101',1540.00,1540.00,1540.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-20 23:59:00','105','101',1925.00,1925.00,1925.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-21 23:59:00','101','101',386.00,386.00,386.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-21 23:59:00','102','101',772.00,772.00,772.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-21 23:59:00','103','101',1158.00,1158.00,1158.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-21 23:59:00','104','101',1544.00,1544.00,1544.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-21 23:59:00','105','101',1930.00,1930.00,1930.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-22 23:59:00','101','101',387.00,387.00,387.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-22 23:59:00','102','101',774.00,774.00,774.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-22 23:59:00','103','101',1161.00,1161.00,1161.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-22 23:59:00','104','101',1548.00,1548.00,1548.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-22 23:59:00','105','101',1935.00,1935.00,1935.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-23 23:59:00','101','101',388.00,388.00,388.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-23 23:59:00','102','101',776.00,776.00,776.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-23 23:59:00','103','101',1164.00,1164.00,1164.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-23 23:59:00','104','101',1552.00,1552.00,1552.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-23 23:59:00','105','101',1940.00,1940.00,1940.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-24 23:59:00','101','101',389.00,389.00,389.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-24 23:59:00','102','101',778.00,778.00,778.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-24 23:59:00','103','101',1167.00,1167.00,1167.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-24 23:59:00','104','101',1556.00,1556.00,1556.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-24 23:59:00','105','101',1945.00,1945.00,1945.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-25 23:59:00','101','101',390.00,390.00,390.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-25 23:59:00','102','101',780.00,780.00,780.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-25 23:59:00','103','101',1170.00,1170.00,1170.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-25 23:59:00','104','101',1560.00,1560.00,1560.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-25 23:59:00','105','101',1950.00,1950.00,1950.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-26 23:59:00','101','101',391.00,391.00,391.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-26 23:59:00','102','101',782.00,782.00,782.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-26 23:59:00','103','101',1173.00,1173.00,1173.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-26 23:59:00','104','101',1564.00,1564.00,1564.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-26 23:59:00','105','101',1955.00,1955.00,1955.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-27 23:59:00','101','101',392.00,392.00,392.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-27 23:59:00','102','101',784.00,784.00,784.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-27 23:59:00','103','101',1176.00,1176.00,1176.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-27 23:59:00','104','101',1568.00,1568.00,1568.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-27 23:59:00','105','101',1960.00,1960.00,1960.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-28 23:59:00','101','101',393.00,393.00,393.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-28 23:59:00','102','101',786.00,786.00,786.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-28 23:59:00','103','101',1179.00,1179.00,1179.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-28 23:59:00','104','101',1572.00,1572.00,1572.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-28 23:59:00','105','101',1965.00,1965.00,1965.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-29 23:59:00','101','101',394.00,394.00,394.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-29 23:59:00','102','101',788.00,788.00,788.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-29 23:59:00','103','101',1182.00,1182.00,1182.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-29 23:59:00','104','101',1576.00,1576.00,1576.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-29 23:59:00','105','101',1970.00,1970.00,1970.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-30 23:59:00','101','101',395.00,395.00,395.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-30 23:59:00','102','101',790.00,790.00,790.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-30 23:59:00','103','101',1185.00,1185.00,1185.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-30 23:59:00','104','101',1580.00,1580.00,1580.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-30 23:59:00','105','101',1975.00,1975.00,1975.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-07-31 23:59:00','101','101',396.00,396.00,396.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-07-31 23:59:00','102','101',792.00,792.00,792.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-07-31 23:59:00','103','101',1188.00,1188.00,1188.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-07-31 23:59:00','104','101',1584.00,1584.00,1584.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-07-31 23:59:00','105','101',1980.00,1980.00,1980.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-01 23:59:00','101','101',397.00,397.00,397.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-01 23:59:00','102','101',794.00,794.00,794.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-01 23:59:00','103','101',1191.00,1191.00,1191.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-01 23:59:00','104','101',1588.00,1588.00,1588.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-01 23:59:00','105','101',1985.00,1985.00,1985.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-02 23:59:00','101','101',398.00,398.00,398.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-02 23:59:00','102','101',796.00,796.00,796.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-02 23:59:00','103','101',1194.00,1194.00,1194.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-02 23:59:00','104','101',1592.00,1592.00,1592.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-02 23:59:00','105','101',1990.00,1990.00,1990.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-03 23:59:00','101','101',399.00,399.00,399.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-03 23:59:00','102','101',798.00,798.00,798.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-03 23:59:00','103','101',1197.00,1197.00,1197.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-03 23:59:00','104','101',1596.00,1596.00,1596.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-03 23:59:00','105','101',1995.00,1995.00,1995.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-04 23:59:00','101','101',400.00,400.00,400.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-04 23:59:00','102','101',800.00,800.00,800.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-04 23:59:00','103','101',1200.00,1200.00,1200.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-04 23:59:00','104','101',1600.00,1600.00,1600.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-04 23:59:00','105','101',2000.00,2000.00,2000.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-05 23:59:00','101','101',401.00,401.00,401.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-05 23:59:00','102','101',802.00,802.00,802.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-05 23:59:00','103','101',1203.00,1203.00,1203.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-05 23:59:00','104','101',1604.00,1604.00,1604.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-05 23:59:00','105','101',2005.00,2005.00,2005.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-06 23:59:00','101','101',402.00,402.00,402.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-06 23:59:00','102','101',804.00,804.00,804.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-06 23:59:00','103','101',1206.00,1206.00,1206.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-06 23:59:00','104','101',1608.00,1608.00,1608.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-06 23:59:00','105','101',2010.00,2010.00,2010.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-07 23:59:00','101','101',403.00,403.00,403.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-07 23:59:00','102','101',806.00,806.00,806.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-07 23:59:00','103','101',1209.00,1209.00,1209.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-07 23:59:00','104','101',1612.00,1612.00,1612.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-07 23:59:00','105','101',2015.00,2015.00,2015.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-08 23:59:00','101','101',404.00,404.00,404.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-08 23:59:00','102','101',808.00,808.00,808.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-08 23:59:00','103','101',1212.00,1212.00,1212.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-08 23:59:00','104','101',1616.00,1616.00,1616.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-08 23:59:00','105','101',2020.00,2020.00,2020.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-09 23:59:00','101','101',405.00,405.00,405.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-09 23:59:00','102','101',810.00,810.00,810.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-09 23:59:00','103','101',1215.00,1215.00,1215.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-09 23:59:00','104','101',1620.00,1620.00,1620.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-09 23:59:00','105','101',2025.00,2025.00,2025.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-10 23:59:00','101','101',406.00,406.00,406.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-10 23:59:00','102','101',812.00,812.00,812.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-10 23:59:00','103','101',1218.00,1218.00,1218.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-10 23:59:00','104','101',1624.00,1624.00,1624.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-10 23:59:00','105','101',2030.00,2030.00,2030.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-11 23:59:00','101','101',407.00,407.00,407.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-11 23:59:00','102','101',814.00,814.00,814.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-11 23:59:00','103','101',1221.00,1221.00,1221.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-11 23:59:00','104','101',1628.00,1628.00,1628.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-11 23:59:00','105','101',2035.00,2035.00,2035.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-12 23:59:00','101','101',408.00,408.00,408.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-12 23:59:00','102','101',816.00,816.00,816.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-12 23:59:00','103','101',1224.00,1224.00,1224.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-12 23:59:00','104','101',1632.00,1632.00,1632.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-12 23:59:00','105','101',2040.00,2040.00,2040.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-13 23:59:00','101','101',409.00,409.00,409.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-13 23:59:00','102','101',818.00,818.00,818.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-13 23:59:00','103','101',1227.00,1227.00,1227.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-13 23:59:00','104','101',1636.00,1636.00,1636.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-13 23:59:00','105','101',2045.00,2045.00,2045.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-14 23:59:00','101','101',410.00,410.00,410.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-14 23:59:00','102','101',820.00,820.00,820.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-14 23:59:00','103','101',1230.00,1230.00,1230.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-14 23:59:00','104','101',1640.00,1640.00,1640.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-14 23:59:00','105','101',2050.00,2050.00,2050.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-15 23:59:00','101','101',411.00,411.00,411.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-15 23:59:00','102','101',822.00,822.00,822.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-15 23:59:00','103','101',1233.00,1233.00,1233.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-15 23:59:00','104','101',1644.00,1644.00,1644.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-15 23:59:00','105','101',2055.00,2055.00,2055.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-16 23:59:00','101','101',412.00,412.00,412.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-16 23:59:00','102','101',824.00,824.00,824.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-16 23:59:00','103','101',1236.00,1236.00,1236.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-16 23:59:00','104','101',1648.00,1648.00,1648.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-16 23:59:00','105','101',2060.00,2060.00,2060.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-17 23:59:00','101','101',413.00,413.00,413.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-17 23:59:00','102','101',826.00,826.00,826.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-17 23:59:00','103','101',1239.00,1239.00,1239.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-17 23:59:00','104','101',1652.00,1652.00,1652.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-17 23:59:00','105','101',2065.00,2065.00,2065.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-18 23:59:00','101','101',414.00,414.00,414.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-18 23:59:00','102','101',828.00,828.00,828.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-18 23:59:00','103','101',1242.00,1242.00,1242.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-18 23:59:00','104','101',1656.00,1656.00,1656.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-18 23:59:00','105','101',2070.00,2070.00,2070.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-19 23:59:00','101','101',415.00,415.00,415.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-19 23:59:00','102','101',830.00,830.00,830.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-19 23:59:00','103','101',1245.00,1245.00,1245.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-19 23:59:00','104','101',1660.00,1660.00,1660.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-19 23:59:00','105','101',2075.00,2075.00,2075.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-20 23:59:00','101','101',416.00,416.00,416.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-20 23:59:00','102','101',832.00,832.00,832.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-20 23:59:00','103','101',1248.00,1248.00,1248.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-20 23:59:00','104','101',1664.00,1664.00,1664.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-20 23:59:00','105','101',2080.00,2080.00,2080.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-21 23:59:00','101','101',417.00,417.00,417.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-21 23:59:00','102','101',834.00,834.00,834.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-21 23:59:00','103','101',1251.00,1251.00,1251.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-21 23:59:00','104','101',1668.00,1668.00,1668.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-21 23:59:00','105','101',2085.00,2085.00,2085.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-22 23:59:00','101','101',418.00,418.00,418.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-22 23:59:00','102','101',836.00,836.00,836.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-22 23:59:00','103','101',1254.00,1254.00,1254.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-22 23:59:00','104','101',1672.00,1672.00,1672.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-22 23:59:00','105','101',2090.00,2090.00,2090.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-23 23:59:00','101','101',419.00,419.00,419.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-23 23:59:00','102','101',838.00,838.00,838.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-23 23:59:00','103','101',1257.00,1257.00,1257.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-23 23:59:00','104','101',1676.00,1676.00,1676.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-23 23:59:00','105','101',2095.00,2095.00,2095.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-24 23:59:00','101','101',420.00,420.00,420.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-24 23:59:00','102','101',840.00,840.00,840.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-24 23:59:00','103','101',1260.00,1260.00,1260.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-24 23:59:00','104','101',1680.00,1680.00,1680.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-24 23:59:00','105','101',2100.00,2100.00,2100.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-25 23:59:00','101','101',421.00,421.00,421.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-25 23:59:00','102','101',842.00,842.00,842.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-25 23:59:00','103','101',1263.00,1263.00,1263.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-25 23:59:00','104','101',1684.00,1684.00,1684.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-25 23:59:00','105','101',2105.00,2105.00,2105.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-26 23:59:00','101','101',422.00,422.00,422.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-26 23:59:00','102','101',844.00,844.00,844.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-26 23:59:00','103','101',1266.00,1266.00,1266.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-26 23:59:00','104','101',1688.00,1688.00,1688.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-26 23:59:00','105','101',2110.00,2110.00,2110.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-27 23:59:00','101','101',423.00,423.00,423.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-27 23:59:00','102','101',846.00,846.00,846.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-27 23:59:00','103','101',1269.00,1269.00,1269.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-27 23:59:00','104','101',1692.00,1692.00,1692.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-27 23:59:00','105','101',2115.00,2115.00,2115.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-28 23:59:00','101','101',424.00,424.00,424.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-28 23:59:00','102','101',848.00,848.00,848.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-28 23:59:00','103','101',1272.00,1272.00,1272.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-28 23:59:00','104','101',1696.00,1696.00,1696.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-28 23:59:00','105','101',2120.00,2120.00,2120.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-29 23:59:00','101','101',425.00,425.00,425.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-29 23:59:00','102','101',850.00,850.00,850.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-29 23:59:00','103','101',1275.00,1275.00,1275.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-29 23:59:00','104','101',1700.00,1700.00,1700.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-29 23:59:00','105','101',2125.00,2125.00,2125.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-30 23:59:00','101','101',426.00,426.00,426.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-30 23:59:00','102','101',852.00,852.00,852.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-30 23:59:00','103','101',1278.00,1278.00,1278.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-30 23:59:00','104','101',1704.00,1704.00,1704.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-30 23:59:00','105','101',2130.00,2130.00,2130.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-08-31 23:59:00','101','101',427.00,427.00,427.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-08-31 23:59:00','102','101',854.00,854.00,854.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-08-31 23:59:00','103','101',1281.00,1281.00,1281.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-08-31 23:59:00','104','101',1708.00,1708.00,1708.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-08-31 23:59:00','105','101',2135.00,2135.00,2135.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-01 23:59:00','101','101',428.00,428.00,428.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-01 23:59:00','102','101',856.00,856.00,856.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-01 23:59:00','103','101',1284.00,1284.00,1284.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-01 23:59:00','104','101',1712.00,1712.00,1712.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-01 23:59:00','105','101',2140.00,2140.00,2140.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-02 23:59:00','101','101',429.00,429.00,429.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-02 23:59:00','102','101',858.00,858.00,858.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-02 23:59:00','103','101',1287.00,1287.00,1287.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-02 23:59:00','104','101',1716.00,1716.00,1716.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-02 23:59:00','105','101',2145.00,2145.00,2145.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-03 23:59:00','101','101',430.00,430.00,430.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-03 23:59:00','102','101',860.00,860.00,860.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-03 23:59:00','103','101',1290.00,1290.00,1290.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-03 23:59:00','104','101',1720.00,1720.00,1720.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-03 23:59:00','105','101',2150.00,2150.00,2150.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-04 23:59:00','101','101',431.00,431.00,431.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-04 23:59:00','102','101',862.00,862.00,862.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-04 23:59:00','103','101',1293.00,1293.00,1293.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-04 23:59:00','104','101',1724.00,1724.00,1724.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-04 23:59:00','105','101',2155.00,2155.00,2155.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-05 23:59:00','101','101',432.00,432.00,432.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-05 23:59:00','102','101',864.00,864.00,864.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-05 23:59:00','103','101',1296.00,1296.00,1296.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-05 23:59:00','104','101',1728.00,1728.00,1728.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-05 23:59:00','105','101',2160.00,2160.00,2160.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-06 23:59:00','101','101',433.00,433.00,433.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-06 23:59:00','102','101',866.00,866.00,866.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-06 23:59:00','103','101',1299.00,1299.00,1299.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-06 23:59:00','104','101',1732.00,1732.00,1732.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-06 23:59:00','105','101',2165.00,2165.00,2165.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-07 23:59:00','101','101',434.00,434.00,434.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-07 23:59:00','102','101',868.00,868.00,868.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-07 23:59:00','103','101',1302.00,1302.00,1302.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-07 23:59:00','104','101',1736.00,1736.00,1736.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-07 23:59:00','105','101',2170.00,2170.00,2170.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-08 23:59:00','101','101',435.00,435.00,435.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-08 23:59:00','102','101',870.00,870.00,870.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-08 23:59:00','103','101',1305.00,1305.00,1305.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-08 23:59:00','104','101',1740.00,1740.00,1740.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-08 23:59:00','105','101',2175.00,2175.00,2175.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-09 23:59:00','101','101',436.00,436.00,436.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-09 23:59:00','102','101',872.00,872.00,872.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-09 23:59:00','103','101',1308.00,1308.00,1308.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-09 23:59:00','104','101',1744.00,1744.00,1744.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-09 23:59:00','105','101',2180.00,2180.00,2180.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-10 23:59:00','101','101',437.00,437.00,437.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-10 23:59:00','102','101',874.00,874.00,874.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-10 23:59:00','103','101',1311.00,1311.00,1311.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-10 23:59:00','104','101',1748.00,1748.00,1748.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-10 23:59:00','105','101',2185.00,2185.00,2185.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-11 23:59:00','101','101',438.00,438.00,438.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-11 23:59:00','102','101',876.00,876.00,876.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-11 23:59:00','103','101',1314.00,1314.00,1314.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-11 23:59:00','104','101',1752.00,1752.00,1752.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-11 23:59:00','105','101',2190.00,2190.00,2190.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-12 23:59:00','101','101',439.00,439.00,439.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-12 23:59:00','102','101',878.00,878.00,878.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-12 23:59:00','103','101',1317.00,1317.00,1317.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-12 23:59:00','104','101',1756.00,1756.00,1756.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-12 23:59:00','105','101',2195.00,2195.00,2195.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-13 23:59:00','101','101',440.00,440.00,440.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-13 23:59:00','102','101',880.00,880.00,880.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-13 23:59:00','103','101',1320.00,1320.00,1320.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-13 23:59:00','104','101',1760.00,1760.00,1760.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-13 23:59:00','105','101',2200.00,2200.00,2200.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-14 23:59:00','101','101',441.00,441.00,441.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-14 23:59:00','102','101',882.00,882.00,882.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-14 23:59:00','103','101',1323.00,1323.00,1323.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-14 23:59:00','104','101',1764.00,1764.00,1764.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-14 23:59:00','105','101',2205.00,2205.00,2205.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-15 23:59:00','101','101',442.00,442.00,442.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-15 23:59:00','102','101',884.00,884.00,884.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-15 23:59:00','103','101',1326.00,1326.00,1326.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-15 23:59:00','104','101',1768.00,1768.00,1768.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-15 23:59:00','105','101',2210.00,2210.00,2210.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-16 23:59:00','101','101',443.00,443.00,443.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-16 23:59:00','102','101',886.00,886.00,886.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-16 23:59:00','103','101',1329.00,1329.00,1329.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-16 23:59:00','104','101',1772.00,1772.00,1772.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-16 23:59:00','105','101',2215.00,2215.00,2215.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-17 23:59:00','101','101',444.00,444.00,444.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-17 23:59:00','102','101',888.00,888.00,888.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-17 23:59:00','103','101',1332.00,1332.00,1332.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-17 23:59:00','104','101',1776.00,1776.00,1776.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-17 23:59:00','105','101',2220.00,2220.00,2220.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-18 23:59:00','101','101',445.00,445.00,445.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-18 23:59:00','102','101',890.00,890.00,890.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-18 23:59:00','103','101',1335.00,1335.00,1335.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-18 23:59:00','104','101',1780.00,1780.00,1780.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-18 23:59:00','105','101',2225.00,2225.00,2225.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-19 23:59:00','101','101',446.00,446.00,446.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-19 23:59:00','102','101',892.00,892.00,892.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-19 23:59:00','103','101',1338.00,1338.00,1338.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-19 23:59:00','104','101',1784.00,1784.00,1784.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-19 23:59:00','105','101',2230.00,2230.00,2230.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-20 23:59:00','101','101',447.00,447.00,447.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-20 23:59:00','102','101',894.00,894.00,894.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-20 23:59:00','103','101',1341.00,1341.00,1341.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-20 23:59:00','104','101',1788.00,1788.00,1788.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-20 23:59:00','105','101',2235.00,2235.00,2235.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-21 23:59:00','101','101',448.00,448.00,448.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-21 23:59:00','102','101',896.00,896.00,896.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-21 23:59:00','103','101',1344.00,1344.00,1344.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-21 23:59:00','104','101',1792.00,1792.00,1792.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-21 23:59:00','105','101',2240.00,2240.00,2240.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-22 23:59:00','101','101',449.00,449.00,449.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-22 23:59:00','102','101',898.00,898.00,898.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-22 23:59:00','103','101',1347.00,1347.00,1347.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-22 23:59:00','104','101',1796.00,1796.00,1796.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-22 23:59:00','105','101',2245.00,2245.00,2245.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-23 23:59:00','101','101',450.00,450.00,450.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-23 23:59:00','102','101',900.00,900.00,900.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-23 23:59:00','103','101',1350.00,1350.00,1350.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-23 23:59:00','104','101',1800.00,1800.00,1800.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-23 23:59:00','105','101',2250.00,2250.00,2250.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-24 23:59:00','101','101',451.00,451.00,451.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-24 23:59:00','102','101',902.00,902.00,902.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-24 23:59:00','103','101',1353.00,1353.00,1353.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-24 23:59:00','104','101',1804.00,1804.00,1804.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-24 23:59:00','105','101',2255.00,2255.00,2255.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-25 23:59:00','101','101',452.00,452.00,452.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-25 23:59:00','102','101',904.00,904.00,904.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-25 23:59:00','103','101',1356.00,1356.00,1356.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-25 23:59:00','104','101',1808.00,1808.00,1808.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-25 23:59:00','105','101',2260.00,2260.00,2260.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-26 23:59:00','101','101',453.00,453.00,453.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-26 23:59:00','102','101',906.00,906.00,906.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-26 23:59:00','103','101',1359.00,1359.00,1359.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-26 23:59:00','104','101',1812.00,1812.00,1812.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-26 23:59:00','105','101',2265.00,2265.00,2265.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-27 23:59:00','101','101',454.00,454.00,454.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-27 23:59:00','102','101',908.00,908.00,908.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-27 23:59:00','103','101',1362.00,1362.00,1362.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-27 23:59:00','104','101',1816.00,1816.00,1816.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-27 23:59:00','105','101',2270.00,2270.00,2270.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-28 23:59:00','101','101',455.00,455.00,455.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-28 23:59:00','102','101',910.00,910.00,910.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-28 23:59:00','103','101',1365.00,1365.00,1365.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-28 23:59:00','104','101',1820.00,1820.00,1820.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-28 23:59:00','105','101',2275.00,2275.00,2275.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-29 23:59:00','101','101',456.00,456.00,456.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-29 23:59:00','102','101',912.00,912.00,912.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-29 23:59:00','103','101',1368.00,1368.00,1368.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-29 23:59:00','104','101',1824.00,1824.00,1824.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-29 23:59:00','105','101',2280.00,2280.00,2280.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-09-30 23:59:00','101','101',457.00,457.00,457.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-09-30 23:59:00','102','101',914.00,914.00,914.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-09-30 23:59:00','103','101',1371.00,1371.00,1371.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-09-30 23:59:00','104','101',1828.00,1828.00,1828.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-09-30 23:59:00','105','101',2285.00,2285.00,2285.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-01 23:59:00','101','101',458.00,458.00,458.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-01 23:59:00','102','101',916.00,916.00,916.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-01 23:59:00','103','101',1374.00,1374.00,1374.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-01 23:59:00','104','101',1832.00,1832.00,1832.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-01 23:59:00','105','101',2290.00,2290.00,2290.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-02 23:59:00','101','101',459.00,459.00,459.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-02 23:59:00','102','101',918.00,918.00,918.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-02 23:59:00','103','101',1377.00,1377.00,1377.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-02 23:59:00','104','101',1836.00,1836.00,1836.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-02 23:59:00','105','101',2295.00,2295.00,2295.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-03 23:59:00','101','101',460.00,460.00,460.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-03 23:59:00','102','101',920.00,920.00,920.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-03 23:59:00','103','101',1380.00,1380.00,1380.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-03 23:59:00','104','101',1840.00,1840.00,1840.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-03 23:59:00','105','101',2300.00,2300.00,2300.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-04 23:59:00','101','101',461.00,461.00,461.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-04 23:59:00','102','101',922.00,922.00,922.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-04 23:59:00','103','101',1383.00,1383.00,1383.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-04 23:59:00','104','101',1844.00,1844.00,1844.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-04 23:59:00','105','101',2305.00,2305.00,2305.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-05 23:59:00','101','101',462.00,462.00,462.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-05 23:59:00','102','101',924.00,924.00,924.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-05 23:59:00','103','101',1386.00,1386.00,1386.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-05 23:59:00','104','101',1848.00,1848.00,1848.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-05 23:59:00','105','101',2310.00,2310.00,2310.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-06 23:59:00','101','101',463.00,463.00,463.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-06 23:59:00','102','101',926.00,926.00,926.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-06 23:59:00','103','101',1389.00,1389.00,1389.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-06 23:59:00','104','101',1852.00,1852.00,1852.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-06 23:59:00','105','101',2315.00,2315.00,2315.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-07 23:59:00','101','101',464.00,464.00,464.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-07 23:59:00','102','101',928.00,928.00,928.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-07 23:59:00','103','101',1392.00,1392.00,1392.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-07 23:59:00','104','101',1856.00,1856.00,1856.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-07 23:59:00','105','101',2320.00,2320.00,2320.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-08 23:59:00','101','101',465.00,465.00,465.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-08 23:59:00','102','101',930.00,930.00,930.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-08 23:59:00','103','101',1395.00,1395.00,1395.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-08 23:59:00','104','101',1860.00,1860.00,1860.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-08 23:59:00','105','101',2325.00,2325.00,2325.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-09 23:59:00','101','101',466.00,466.00,466.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-09 23:59:00','102','101',932.00,932.00,932.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-09 23:59:00','103','101',1398.00,1398.00,1398.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-09 23:59:00','104','101',1864.00,1864.00,1864.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-09 23:59:00','105','101',2330.00,2330.00,2330.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-10 23:59:00','101','101',467.00,467.00,467.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-10 23:59:00','102','101',934.00,934.00,934.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-10 23:59:00','103','101',1401.00,1401.00,1401.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-10 23:59:00','104','101',1868.00,1868.00,1868.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-10 23:59:00','105','101',2335.00,2335.00,2335.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-11 23:59:00','101','101',468.00,468.00,468.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-11 23:59:00','102','101',936.00,936.00,936.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-11 23:59:00','103','101',1404.00,1404.00,1404.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-11 23:59:00','104','101',1872.00,1872.00,1872.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-11 23:59:00','105','101',2340.00,2340.00,2340.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-12 23:59:00','101','101',469.00,469.00,469.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-12 23:59:00','102','101',938.00,938.00,938.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-12 23:59:00','103','101',1407.00,1407.00,1407.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-12 23:59:00','104','101',1876.00,1876.00,1876.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-12 23:59:00','105','101',2345.00,2345.00,2345.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-13 23:59:00','101','101',470.00,470.00,470.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-13 23:59:00','102','101',940.00,940.00,940.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-13 23:59:00','103','101',1410.00,1410.00,1410.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-13 23:59:00','104','101',1880.00,1880.00,1880.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-13 23:59:00','105','101',2350.00,2350.00,2350.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-14 23:59:00','101','101',471.00,471.00,471.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-14 23:59:00','102','101',942.00,942.00,942.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-14 23:59:00','103','101',1413.00,1413.00,1413.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-14 23:59:00','104','101',1884.00,1884.00,1884.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-14 23:59:00','105','101',2355.00,2355.00,2355.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-15 23:59:00','101','101',472.00,472.00,472.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-15 23:59:00','102','101',944.00,944.00,944.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-15 23:59:00','103','101',1416.00,1416.00,1416.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-15 23:59:00','104','101',1888.00,1888.00,1888.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-15 23:59:00','105','101',2360.00,2360.00,2360.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-16 23:59:00','101','101',473.00,473.00,473.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-16 23:59:00','102','101',946.00,946.00,946.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-16 23:59:00','103','101',1419.00,1419.00,1419.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-16 23:59:00','104','101',1892.00,1892.00,1892.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-16 23:59:00','105','101',2365.00,2365.00,2365.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-17 23:59:00','101','101',474.00,474.00,474.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-17 23:59:00','102','101',948.00,948.00,948.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-17 23:59:00','103','101',1422.00,1422.00,1422.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-17 23:59:00','104','101',1896.00,1896.00,1896.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-17 23:59:00','105','101',2370.00,2370.00,2370.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-18 23:59:00','101','101',475.00,475.00,475.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-18 23:59:00','102','101',950.00,950.00,950.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-18 23:59:00','103','101',1425.00,1425.00,1425.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-18 23:59:00','104','101',1900.00,1900.00,1900.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-18 23:59:00','105','101',2375.00,2375.00,2375.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-19 23:59:00','101','101',476.00,476.00,476.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-19 23:59:00','102','101',952.00,952.00,952.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-19 23:59:00','103','101',1428.00,1428.00,1428.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-19 23:59:00','104','101',1904.00,1904.00,1904.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-19 23:59:00','105','101',2380.00,2380.00,2380.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-20 23:59:00','101','101',477.00,477.00,477.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-20 23:59:00','102','101',954.00,954.00,954.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-20 23:59:00','103','101',1431.00,1431.00,1431.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-20 23:59:00','104','101',1908.00,1908.00,1908.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-20 23:59:00','105','101',2385.00,2385.00,2385.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-21 23:59:00','101','101',478.00,478.00,478.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-21 23:59:00','102','101',956.00,956.00,956.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-21 23:59:00','103','101',1434.00,1434.00,1434.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-21 23:59:00','104','101',1912.00,1912.00,1912.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-21 23:59:00','105','101',2390.00,2390.00,2390.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-22 23:59:00','101','101',479.00,479.00,479.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-22 23:59:00','102','101',958.00,958.00,958.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-22 23:59:00','103','101',1437.00,1437.00,1437.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-22 23:59:00','104','101',1916.00,1916.00,1916.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-22 23:59:00','105','101',2395.00,2395.00,2395.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-23 23:59:00','101','101',480.00,480.00,480.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-23 23:59:00','102','101',960.00,960.00,960.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-23 23:59:00','103','101',1440.00,1440.00,1440.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-23 23:59:00','104','101',1920.00,1920.00,1920.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-23 23:59:00','105','101',2400.00,2400.00,2400.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-24 23:59:00','101','101',481.00,481.00,481.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-24 23:59:00','102','101',962.00,962.00,962.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-24 23:59:00','103','101',1443.00,1443.00,1443.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-24 23:59:00','104','101',1924.00,1924.00,1924.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-24 23:59:00','105','101',2405.00,2405.00,2405.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-25 23:59:00','101','101',482.00,482.00,482.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-25 23:59:00','102','101',964.00,964.00,964.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-25 23:59:00','103','101',1446.00,1446.00,1446.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-25 23:59:00','104','101',1928.00,1928.00,1928.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-25 23:59:00','105','101',2410.00,2410.00,2410.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-26 23:59:00','101','101',483.00,483.00,483.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-26 23:59:00','102','101',966.00,966.00,966.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-26 23:59:00','103','101',1449.00,1449.00,1449.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-26 23:59:00','104','101',1932.00,1932.00,1932.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-26 23:59:00','105','101',2415.00,2415.00,2415.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-27 23:59:00','101','101',484.00,484.00,484.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-27 23:59:00','102','101',968.00,968.00,968.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-27 23:59:00','103','101',1452.00,1452.00,1452.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-27 23:59:00','104','101',1936.00,1936.00,1936.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-27 23:59:00','105','101',2420.00,2420.00,2420.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-28 23:59:00','101','101',485.00,485.00,485.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-28 23:59:00','102','101',970.00,970.00,970.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-28 23:59:00','103','101',1455.00,1455.00,1455.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-28 23:59:00','104','101',1940.00,1940.00,1940.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-28 23:59:00','105','101',2425.00,2425.00,2425.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-29 23:59:00','101','101',486.00,486.00,486.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-29 23:59:00','102','101',972.00,972.00,972.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-29 23:59:00','103','101',1458.00,1458.00,1458.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-29 23:59:00','104','101',1944.00,1944.00,1944.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-29 23:59:00','105','101',2430.00,2430.00,2430.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-30 23:59:00','101','101',487.00,487.00,487.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-30 23:59:00','102','101',974.00,974.00,974.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-30 23:59:00','103','101',1461.00,1461.00,1461.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-30 23:59:00','104','101',1948.00,1948.00,1948.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-30 23:59:00','105','101',2435.00,2435.00,2435.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-10-31 23:59:00','101','101',488.00,488.00,488.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-10-31 23:59:00','102','101',976.00,976.00,976.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-10-31 23:59:00','103','101',1464.00,1464.00,1464.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-10-31 23:59:00','104','101',1952.00,1952.00,1952.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-10-31 23:59:00','105','101',2440.00,2440.00,2440.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-01 23:59:00','101','101',489.00,489.00,489.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-01 23:59:00','102','101',978.00,978.00,978.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-01 23:59:00','103','101',1467.00,1467.00,1467.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-01 23:59:00','104','101',1956.00,1956.00,1956.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-01 23:59:00','105','101',2445.00,2445.00,2445.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-02 23:59:00','101','101',490.00,490.00,490.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-02 23:59:00','102','101',980.00,980.00,980.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-02 23:59:00','103','101',1470.00,1470.00,1470.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-02 23:59:00','104','101',1960.00,1960.00,1960.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-02 23:59:00','105','101',2450.00,2450.00,2450.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-03 23:59:00','101','101',491.00,491.00,491.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-03 23:59:00','102','101',982.00,982.00,982.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-03 23:59:00','103','101',1473.00,1473.00,1473.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-03 23:59:00','104','101',1964.00,1964.00,1964.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-03 23:59:00','105','101',2455.00,2455.00,2455.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-04 23:59:00','101','101',492.00,492.00,492.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-04 23:59:00','102','101',984.00,984.00,984.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-04 23:59:00','103','101',1476.00,1476.00,1476.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-04 23:59:00','104','101',1968.00,1968.00,1968.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-04 23:59:00','105','101',2460.00,2460.00,2460.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-05 23:59:00','101','101',493.00,493.00,493.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-05 23:59:00','102','101',986.00,986.00,986.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-05 23:59:00','103','101',1479.00,1479.00,1479.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-05 23:59:00','104','101',1972.00,1972.00,1972.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-05 23:59:00','105','101',2465.00,2465.00,2465.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-06 23:59:00','101','101',494.00,494.00,494.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-06 23:59:00','102','101',988.00,988.00,988.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-06 23:59:00','103','101',1482.00,1482.00,1482.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-06 23:59:00','104','101',1976.00,1976.00,1976.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-06 23:59:00','105','101',2470.00,2470.00,2470.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-07 23:59:00','101','101',495.00,495.00,495.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-07 23:59:00','102','101',990.00,990.00,990.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-07 23:59:00','103','101',1485.00,1485.00,1485.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-07 23:59:00','104','101',1980.00,1980.00,1980.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-07 23:59:00','105','101',2475.00,2475.00,2475.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-08 23:59:00','101','101',496.00,496.00,496.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-08 23:59:00','102','101',992.00,992.00,992.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-08 23:59:00','103','101',1488.00,1488.00,1488.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-08 23:59:00','104','101',1984.00,1984.00,1984.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-08 23:59:00','105','101',2480.00,2480.00,2480.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-09 23:59:00','101','101',497.00,497.00,497.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-09 23:59:00','102','101',994.00,994.00,994.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-09 23:59:00','103','101',1491.00,1491.00,1491.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-09 23:59:00','104','101',1988.00,1988.00,1988.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-09 23:59:00','105','101',2485.00,2485.00,2485.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-10 23:59:00','101','101',498.00,498.00,498.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-10 23:59:00','102','101',996.00,996.00,996.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-10 23:59:00','103','101',1494.00,1494.00,1494.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-10 23:59:00','104','101',1992.00,1992.00,1992.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-10 23:59:00','105','101',2490.00,2490.00,2490.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-11 23:59:00','101','101',499.00,499.00,499.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-11 23:59:00','102','101',998.00,998.00,998.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-11 23:59:00','103','101',1497.00,1497.00,1497.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-11 23:59:00','104','101',1996.00,1996.00,1996.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-11 23:59:00','105','101',2495.00,2495.00,2495.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-12 23:59:00','101','101',500.00,500.00,500.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-12 23:59:00','102','101',1000.00,1000.00,1000.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-12 23:59:00','103','101',1500.00,1500.00,1500.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-12 23:59:00','104','101',2000.00,2000.00,2000.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-12 23:59:00','105','101',2500.00,2500.00,2500.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-13 23:59:00','101','101',501.00,501.00,501.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-13 23:59:00','102','101',1002.00,1002.00,1002.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-13 23:59:00','103','101',1503.00,1503.00,1503.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-13 23:59:00','104','101',2004.00,2004.00,2004.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-13 23:59:00','105','101',2505.00,2505.00,2505.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-14 23:59:00','101','101',502.00,502.00,502.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-14 23:59:00','102','101',1004.00,1004.00,1004.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-14 23:59:00','103','101',1506.00,1506.00,1506.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-14 23:59:00','104','101',2008.00,2008.00,2008.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-14 23:59:00','105','101',2510.00,2510.00,2510.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-15 23:59:00','101','101',503.00,503.00,503.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-15 23:59:00','102','101',1006.00,1006.00,1006.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-15 23:59:00','103','101',1509.00,1509.00,1509.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-15 23:59:00','104','101',2012.00,2012.00,2012.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-15 23:59:00','105','101',2515.00,2515.00,2515.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-16 23:59:00','101','101',504.00,504.00,504.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-16 23:59:00','102','101',1008.00,1008.00,1008.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-16 23:59:00','103','101',1512.00,1512.00,1512.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-16 23:59:00','104','101',2016.00,2016.00,2016.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-16 23:59:00','105','101',2520.00,2520.00,2520.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-17 23:59:00','101','101',505.00,505.00,505.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-17 23:59:00','102','101',1010.00,1010.00,1010.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-17 23:59:00','103','101',1515.00,1515.00,1515.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-17 23:59:00','104','101',2020.00,2020.00,2020.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-17 23:59:00','105','101',2525.00,2525.00,2525.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-18 23:59:00','101','101',506.00,506.00,506.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-18 23:59:00','102','101',1012.00,1012.00,1012.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-18 23:59:00','103','101',1518.00,1518.00,1518.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-18 23:59:00','104','101',2024.00,2024.00,2024.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-18 23:59:00','105','101',2530.00,2530.00,2530.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-19 23:59:00','101','101',507.00,507.00,507.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-19 23:59:00','102','101',1014.00,1014.00,1014.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-19 23:59:00','103','101',1521.00,1521.00,1521.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-19 23:59:00','104','101',2028.00,2028.00,2028.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-19 23:59:00','105','101',2535.00,2535.00,2535.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-20 23:59:00','101','101',508.00,508.00,508.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-20 23:59:00','102','101',1016.00,1016.00,1016.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-20 23:59:00','103','101',1524.00,1524.00,1524.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-20 23:59:00','104','101',2032.00,2032.00,2032.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-20 23:59:00','105','101',2540.00,2540.00,2540.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-21 23:59:00','101','101',509.00,509.00,509.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-21 23:59:00','102','101',1018.00,1018.00,1018.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-21 23:59:00','103','101',1527.00,1527.00,1527.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-21 23:59:00','104','101',2036.00,2036.00,2036.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-21 23:59:00','105','101',2545.00,2545.00,2545.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-22 23:59:00','101','101',510.00,510.00,510.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-22 23:59:00','102','101',1020.00,1020.00,1020.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-22 23:59:00','103','101',1530.00,1530.00,1530.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-22 23:59:00','104','101',2040.00,2040.00,2040.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-22 23:59:00','105','101',2550.00,2550.00,2550.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-23 23:59:00','101','101',511.00,511.00,511.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-23 23:59:00','102','101',1022.00,1022.00,1022.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-23 23:59:00','103','101',1533.00,1533.00,1533.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-23 23:59:00','104','101',2044.00,2044.00,2044.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-23 23:59:00','105','101',2555.00,2555.00,2555.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-24 23:59:00','101','101',512.00,512.00,512.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-24 23:59:00','102','101',1024.00,1024.00,1024.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-24 23:59:00','103','101',1536.00,1536.00,1536.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-24 23:59:00','104','101',2048.00,2048.00,2048.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-24 23:59:00','105','101',2560.00,2560.00,2560.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-25 23:59:00','101','101',513.00,513.00,513.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-25 23:59:00','102','101',1026.00,1026.00,1026.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-25 23:59:00','103','101',1539.00,1539.00,1539.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-25 23:59:00','104','101',2052.00,2052.00,2052.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-25 23:59:00','105','101',2565.00,2565.00,2565.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-26 23:59:00','101','101',514.00,514.00,514.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-26 23:59:00','102','101',1028.00,1028.00,1028.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-26 23:59:00','103','101',1542.00,1542.00,1542.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-26 23:59:00','104','101',2056.00,2056.00,2056.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-26 23:59:00','105','101',2570.00,2570.00,2570.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-27 23:59:00','101','101',515.00,515.00,515.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-27 23:59:00','102','101',1030.00,1030.00,1030.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-27 23:59:00','103','101',1545.00,1545.00,1545.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-27 23:59:00','104','101',2060.00,2060.00,2060.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-27 23:59:00','105','101',2575.00,2575.00,2575.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-28 23:59:00','101','101',516.00,516.00,516.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-28 23:59:00','102','101',1032.00,1032.00,1032.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-28 23:59:00','103','101',1548.00,1548.00,1548.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-28 23:59:00','104','101',2064.00,2064.00,2064.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-28 23:59:00','105','101',2580.00,2580.00,2580.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-29 23:59:00','101','101',517.00,517.00,517.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-29 23:59:00','102','101',1034.00,1034.00,1034.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-29 23:59:00','103','101',1551.00,1551.00,1551.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-29 23:59:00','104','101',2068.00,2068.00,2068.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-29 23:59:00','105','101',2585.00,2585.00,2585.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-11-30 23:59:00','101','101',518.00,518.00,518.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-11-30 23:59:00','102','101',1036.00,1036.00,1036.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-11-30 23:59:00','103','101',1554.00,1554.00,1554.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-11-30 23:59:00','104','101',2072.00,2072.00,2072.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-11-30 23:59:00','105','101',2590.00,2590.00,2590.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-01 23:59:00','101','101',519.00,519.00,519.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-01 23:59:00','102','101',1038.00,1038.00,1038.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-01 23:59:00','103','101',1557.00,1557.00,1557.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-01 23:59:00','104','101',2076.00,2076.00,2076.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-01 23:59:00','105','101',2595.00,2595.00,2595.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-02 23:59:00','101','101',520.00,520.00,520.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-02 23:59:00','102','101',1040.00,1040.00,1040.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-02 23:59:00','103','101',1560.00,1560.00,1560.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-02 23:59:00','104','101',2080.00,2080.00,2080.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-02 23:59:00','105','101',2600.00,2600.00,2600.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-03 23:59:00','101','101',521.00,521.00,521.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-03 23:59:00','102','101',1042.00,1042.00,1042.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-03 23:59:00','103','101',1563.00,1563.00,1563.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-03 23:59:00','104','101',2084.00,2084.00,2084.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-03 23:59:00','105','101',2605.00,2605.00,2605.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-04 23:59:00','101','101',522.00,522.00,522.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-04 23:59:00','102','101',1044.00,1044.00,1044.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-04 23:59:00','103','101',1566.00,1566.00,1566.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-04 23:59:00','104','101',2088.00,2088.00,2088.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-04 23:59:00','105','101',2610.00,2610.00,2610.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-05 23:59:00','101','101',523.00,523.00,523.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-05 23:59:00','102','101',1046.00,1046.00,1046.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-05 23:59:00','103','101',1569.00,1569.00,1569.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-05 23:59:00','104','101',2092.00,2092.00,2092.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-05 23:59:00','105','101',2615.00,2615.00,2615.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-06 23:59:00','101','101',524.00,524.00,524.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-06 23:59:00','102','101',1048.00,1048.00,1048.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-06 23:59:00','103','101',1572.00,1572.00,1572.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-06 23:59:00','104','101',2096.00,2096.00,2096.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-06 23:59:00','105','101',2620.00,2620.00,2620.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-07 23:59:00','101','101',525.00,525.00,525.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-07 23:59:00','102','101',1050.00,1050.00,1050.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-07 23:59:00','103','101',1575.00,1575.00,1575.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-07 23:59:00','104','101',2100.00,2100.00,2100.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-07 23:59:00','105','101',2625.00,2625.00,2625.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-08 23:59:00','101','101',526.00,526.00,526.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-08 23:59:00','102','101',1052.00,1052.00,1052.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-08 23:59:00','103','101',1578.00,1578.00,1578.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-08 23:59:00','104','101',2104.00,2104.00,2104.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-08 23:59:00','105','101',2630.00,2630.00,2630.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-09 23:59:00','101','101',527.00,527.00,527.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-09 23:59:00','102','101',1054.00,1054.00,1054.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-09 23:59:00','103','101',1581.00,1581.00,1581.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-09 23:59:00','104','101',2108.00,2108.00,2108.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-09 23:59:00','105','101',2635.00,2635.00,2635.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-10 23:59:00','101','101',528.00,528.00,528.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-10 23:59:00','102','101',1056.00,1056.00,1056.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-10 23:59:00','103','101',1584.00,1584.00,1584.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-10 23:59:00','104','101',2112.00,2112.00,2112.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-10 23:59:00','105','101',2640.00,2640.00,2640.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-11 23:59:00','101','101',529.00,529.00,529.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-11 23:59:00','102','101',1058.00,1058.00,1058.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-11 23:59:00','103','101',1587.00,1587.00,1587.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-11 23:59:00','104','101',2116.00,2116.00,2116.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-11 23:59:00','105','101',2645.00,2645.00,2645.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-12 23:59:00','101','101',530.00,530.00,530.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-12 23:59:00','102','101',1060.00,1060.00,1060.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-12 23:59:00','103','101',1590.00,1590.00,1590.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-12 23:59:00','104','101',2120.00,2120.00,2120.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-12 23:59:00','105','101',2650.00,2650.00,2650.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-13 23:59:00','101','101',531.00,531.00,531.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-13 23:59:00','102','101',1062.00,1062.00,1062.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-13 23:59:00','103','101',1593.00,1593.00,1593.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-13 23:59:00','104','101',2124.00,2124.00,2124.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-13 23:59:00','105','101',2655.00,2655.00,2655.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-14 23:59:00','101','101',532.00,532.00,532.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-14 23:59:00','102','101',1064.00,1064.00,1064.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-14 23:59:00','103','101',1596.00,1596.00,1596.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-14 23:59:00','104','101',2128.00,2128.00,2128.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-14 23:59:00','105','101',2660.00,2660.00,2660.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-15 23:59:00','101','101',533.00,533.00,533.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-15 23:59:00','102','101',1066.00,1066.00,1066.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-15 23:59:00','103','101',1599.00,1599.00,1599.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-15 23:59:00','104','101',2132.00,2132.00,2132.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-15 23:59:00','105','101',2665.00,2665.00,2665.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-16 23:59:00','101','101',534.00,534.00,534.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-16 23:59:00','102','101',1068.00,1068.00,1068.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-16 23:59:00','103','101',1602.00,1602.00,1602.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-16 23:59:00','104','101',2136.00,2136.00,2136.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-16 23:59:00','105','101',2670.00,2670.00,2670.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-17 23:59:00','101','101',535.00,535.00,535.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-17 23:59:00','102','101',1070.00,1070.00,1070.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-17 23:59:00','103','101',1605.00,1605.00,1605.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-17 23:59:00','104','101',2140.00,2140.00,2140.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-17 23:59:00','105','101',2675.00,2675.00,2675.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-18 23:59:00','101','101',536.00,536.00,536.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-18 23:59:00','102','101',1072.00,1072.00,1072.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-18 23:59:00','103','101',1608.00,1608.00,1608.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-18 23:59:00','104','101',2144.00,2144.00,2144.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-18 23:59:00','105','101',2680.00,2680.00,2680.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-19 23:59:00','101','101',537.00,537.00,537.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-19 23:59:00','102','101',1074.00,1074.00,1074.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-19 23:59:00','103','101',1611.00,1611.00,1611.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-19 23:59:00','104','101',2148.00,2148.00,2148.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-19 23:59:00','105','101',2685.00,2685.00,2685.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-20 23:59:00','101','101',538.00,538.00,538.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-20 23:59:00','102','101',1076.00,1076.00,1076.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-20 23:59:00','103','101',1614.00,1614.00,1614.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-20 23:59:00','104','101',2152.00,2152.00,2152.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-20 23:59:00','105','101',2690.00,2690.00,2690.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-21 23:59:00','101','101',539.00,539.00,539.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-21 23:59:00','102','101',1078.00,1078.00,1078.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-21 23:59:00','103','101',1617.00,1617.00,1617.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-21 23:59:00','104','101',2156.00,2156.00,2156.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-21 23:59:00','105','101',2695.00,2695.00,2695.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-22 23:59:00','101','101',540.00,540.00,540.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-22 23:59:00','102','101',1080.00,1080.00,1080.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-22 23:59:00','103','101',1620.00,1620.00,1620.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-22 23:59:00','104','101',2160.00,2160.00,2160.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-22 23:59:00','105','101',2700.00,2700.00,2700.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-23 23:59:00','101','101',541.00,541.00,541.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-23 23:59:00','102','101',1082.00,1082.00,1082.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-23 23:59:00','103','101',1623.00,1623.00,1623.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-23 23:59:00','104','101',2164.00,2164.00,2164.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-23 23:59:00','105','101',2705.00,2705.00,2705.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-24 23:59:00','101','101',542.00,542.00,542.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-24 23:59:00','102','101',1084.00,1084.00,1084.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-24 23:59:00','103','101',1626.00,1626.00,1626.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-24 23:59:00','104','101',2168.00,2168.00,2168.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-24 23:59:00','105','101',2710.00,2710.00,2710.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-25 23:59:00','101','101',543.00,543.00,543.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-25 23:59:00','102','101',1086.00,1086.00,1086.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-25 23:59:00','103','101',1629.00,1629.00,1629.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-25 23:59:00','104','101',2172.00,2172.00,2172.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-25 23:59:00','105','101',2715.00,2715.00,2715.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-26 23:59:00','101','101',544.00,544.00,544.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-26 23:59:00','102','101',1088.00,1088.00,1088.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-26 23:59:00','103','101',1632.00,1632.00,1632.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-26 23:59:00','104','101',2176.00,2176.00,2176.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-26 23:59:00','105','101',2720.00,2720.00,2720.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-27 23:59:00','101','101',545.00,545.00,545.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-27 23:59:00','102','101',1090.00,1090.00,1090.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-27 23:59:00','103','101',1635.00,1635.00,1635.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-27 23:59:00','104','101',2180.00,2180.00,2180.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-27 23:59:00','105','101',2725.00,2725.00,2725.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-28 23:59:00','101','101',546.00,546.00,546.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-28 23:59:00','102','101',1092.00,1092.00,1092.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-28 23:59:00','103','101',1638.00,1638.00,1638.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-28 23:59:00','104','101',2184.00,2184.00,2184.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-28 23:59:00','105','101',2730.00,2730.00,2730.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-29 23:59:00','101','101',547.00,547.00,547.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-29 23:59:00','102','101',1094.00,1094.00,1094.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-29 23:59:00','103','101',1641.00,1641.00,1641.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-29 23:59:00','104','101',2188.00,2188.00,2188.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-29 23:59:00','105','101',2735.00,2735.00,2735.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-30 23:59:00','101','101',548.00,548.00,548.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-30 23:59:00','102','101',1096.00,1096.00,1096.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-30 23:59:00','103','101',1644.00,1644.00,1644.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-30 23:59:00','104','101',2192.00,2192.00,2192.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-30 23:59:00','105','101',2740.00,2740.00,2740.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2022-12-31 23:59:00','101','101',549.00,549.00,549.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2022-12-31 23:59:00','102','101',1098.00,1098.00,1098.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2022-12-31 23:59:00','103','101',1647.00,1647.00,1647.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2022-12-31 23:59:00','104','101',2196.00,2196.00,2196.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2022-12-31 23:59:00','105','101',2745.00,2745.00,2745.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-01 23:59:00','101','101',550.00,550.00,550.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-01 23:59:00','102','101',1100.00,1100.00,1100.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-01 23:59:00','103','101',1650.00,1650.00,1650.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-01 23:59:00','104','101',2200.00,2200.00,2200.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-01 23:59:00','105','101',2750.00,2750.00,2750.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-02 23:59:00','101','101',551.00,551.00,551.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-02 23:59:00','102','101',1102.00,1102.00,1102.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-02 23:59:00','103','101',1653.00,1653.00,1653.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-02 23:59:00','104','101',2204.00,2204.00,2204.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-02 23:59:00','105','101',2755.00,2755.00,2755.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-03 23:59:00','101','101',552.00,552.00,552.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-03 23:59:00','102','101',1104.00,1104.00,1104.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-03 23:59:00','103','101',1656.00,1656.00,1656.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-03 23:59:00','104','101',2208.00,2208.00,2208.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-03 23:59:00','105','101',2760.00,2760.00,2760.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-04 23:59:00','101','101',553.00,553.00,553.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-04 23:59:00','102','101',1106.00,1106.00,1106.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-04 23:59:00','103','101',1659.00,1659.00,1659.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-04 23:59:00','104','101',2212.00,2212.00,2212.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-04 23:59:00','105','101',2765.00,2765.00,2765.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-05 23:59:00','101','101',554.00,554.00,554.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-05 23:59:00','102','101',1108.00,1108.00,1108.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-05 23:59:00','103','101',1662.00,1662.00,1662.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-05 23:59:00','104','101',2216.00,2216.00,2216.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-05 23:59:00','105','101',2770.00,2770.00,2770.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-06 23:59:00','101','101',555.00,555.00,555.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-06 23:59:00','102','101',1110.00,1110.00,1110.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-06 23:59:00','103','101',1665.00,1665.00,1665.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-06 23:59:00','104','101',2220.00,2220.00,2220.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-06 23:59:00','105','101',2775.00,2775.00,2775.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-07 23:59:00','101','101',556.00,556.00,556.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-07 23:59:00','102','101',1112.00,1112.00,1112.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-07 23:59:00','103','101',1668.00,1668.00,1668.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-07 23:59:00','104','101',2224.00,2224.00,2224.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-07 23:59:00','105','101',2780.00,2780.00,2780.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-08 23:59:00','101','101',557.00,557.00,557.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-08 23:59:00','102','101',1114.00,1114.00,1114.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-08 23:59:00','103','101',1671.00,1671.00,1671.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-08 23:59:00','104','101',2228.00,2228.00,2228.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-08 23:59:00','105','101',2785.00,2785.00,2785.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-09 23:59:00','101','101',558.00,558.00,558.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-09 23:59:00','102','101',1116.00,1116.00,1116.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-09 23:59:00','103','101',1674.00,1674.00,1674.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-09 23:59:00','104','101',2232.00,2232.00,2232.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-09 23:59:00','105','101',2790.00,2790.00,2790.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-10 23:59:00','101','101',559.00,559.00,559.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-10 23:59:00','102','101',1118.00,1118.00,1118.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-10 23:59:00','103','101',1677.00,1677.00,1677.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-10 23:59:00','104','101',2236.00,2236.00,2236.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-10 23:59:00','105','101',2795.00,2795.00,2795.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-11 23:59:00','101','101',560.00,560.00,560.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-11 23:59:00','102','101',1120.00,1120.00,1120.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-11 23:59:00','103','101',1680.00,1680.00,1680.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-11 23:59:00','104','101',2240.00,2240.00,2240.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-11 23:59:00','105','101',2800.00,2800.00,2800.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-12 23:59:00','101','101',561.00,561.00,561.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-12 23:59:00','102','101',1122.00,1122.00,1122.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-12 23:59:00','103','101',1683.00,1683.00,1683.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-12 23:59:00','104','101',2244.00,2244.00,2244.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-12 23:59:00','105','101',2805.00,2805.00,2805.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-13 23:59:00','101','101',562.00,562.00,562.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-13 23:59:00','102','101',1124.00,1124.00,1124.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-13 23:59:00','103','101',1686.00,1686.00,1686.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-13 23:59:00','104','101',2248.00,2248.00,2248.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-13 23:59:00','105','101',2810.00,2810.00,2810.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-14 23:59:00','101','101',563.00,563.00,563.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-14 23:59:00','102','101',1126.00,1126.00,1126.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-14 23:59:00','103','101',1689.00,1689.00,1689.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-14 23:59:00','104','101',2252.00,2252.00,2252.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-14 23:59:00','105','101',2815.00,2815.00,2815.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-15 23:59:00','101','101',564.00,564.00,564.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-15 23:59:00','102','101',1128.00,1128.00,1128.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-15 23:59:00','103','101',1692.00,1692.00,1692.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-15 23:59:00','104','101',2256.00,2256.00,2256.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-15 23:59:00','105','101',2820.00,2820.00,2820.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-16 23:59:00','101','101',565.00,565.00,565.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-16 23:59:00','102','101',1130.00,1130.00,1130.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-16 23:59:00','103','101',1695.00,1695.00,1695.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-16 23:59:00','104','101',2260.00,2260.00,2260.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-16 23:59:00','105','101',2825.00,2825.00,2825.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-17 23:59:00','101','101',566.00,566.00,566.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-17 23:59:00','102','101',1132.00,1132.00,1132.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-17 23:59:00','103','101',1698.00,1698.00,1698.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-17 23:59:00','104','101',2264.00,2264.00,2264.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-17 23:59:00','105','101',2830.00,2830.00,2830.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-18 23:59:00','101','101',567.00,567.00,567.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-18 23:59:00','102','101',1134.00,1134.00,1134.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-18 23:59:00','103','101',1701.00,1701.00,1701.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-18 23:59:00','104','101',2268.00,2268.00,2268.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-18 23:59:00','105','101',2835.00,2835.00,2835.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-19 23:59:00','101','101',568.00,568.00,568.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-19 23:59:00','102','101',1136.00,1136.00,1136.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-19 23:59:00','103','101',1704.00,1704.00,1704.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-19 23:59:00','104','101',2272.00,2272.00,2272.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-19 23:59:00','105','101',2840.00,2840.00,2840.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-20 23:59:00','101','101',569.00,569.00,569.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-20 23:59:00','102','101',1138.00,1138.00,1138.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-20 23:59:00','103','101',1707.00,1707.00,1707.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-20 23:59:00','104','101',2276.00,2276.00,2276.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-20 23:59:00','105','101',2845.00,2845.00,2845.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-21 23:59:00','101','101',570.00,570.00,570.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-21 23:59:00','102','101',1140.00,1140.00,1140.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-21 23:59:00','103','101',1710.00,1710.00,1710.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-21 23:59:00','104','101',2280.00,2280.00,2280.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-21 23:59:00','105','101',2850.00,2850.00,2850.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-22 23:59:00','101','101',571.00,571.00,571.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-22 23:59:00','102','101',1142.00,1142.00,1142.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-22 23:59:00','103','101',1713.00,1713.00,1713.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-22 23:59:00','104','101',2284.00,2284.00,2284.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-22 23:59:00','105','101',2855.00,2855.00,2855.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-23 23:59:00','101','101',572.00,572.00,572.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-23 23:59:00','102','101',1144.00,1144.00,1144.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-23 23:59:00','103','101',1716.00,1716.00,1716.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-23 23:59:00','104','101',2288.00,2288.00,2288.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-23 23:59:00','105','101',2860.00,2860.00,2860.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-24 23:59:00','101','101',573.00,573.00,573.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-24 23:59:00','102','101',1146.00,1146.00,1146.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-24 23:59:00','103','101',1719.00,1719.00,1719.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-24 23:59:00','104','101',2292.00,2292.00,2292.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-24 23:59:00','105','101',2865.00,2865.00,2865.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-25 23:59:00','101','101',574.00,574.00,574.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-25 23:59:00','102','101',1148.00,1148.00,1148.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-25 23:59:00','103','101',1722.00,1722.00,1722.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-25 23:59:00','104','101',2296.00,2296.00,2296.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-25 23:59:00','105','101',2870.00,2870.00,2870.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-26 23:59:00','101','101',575.00,575.00,575.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-26 23:59:00','102','101',1150.00,1150.00,1150.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-26 23:59:00','103','101',1725.00,1725.00,1725.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-26 23:59:00','104','101',2300.00,2300.00,2300.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-26 23:59:00','105','101',2875.00,2875.00,2875.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-27 23:59:00','101','101',576.00,576.00,576.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-27 23:59:00','102','101',1152.00,1152.00,1152.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-27 23:59:00','103','101',1728.00,1728.00,1728.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-27 23:59:00','104','101',2304.00,2304.00,2304.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-27 23:59:00','105','101',2880.00,2880.00,2880.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-28 23:59:00','101','101',577.00,577.00,577.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-28 23:59:00','102','101',1154.00,1154.00,1154.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-28 23:59:00','103','101',1731.00,1731.00,1731.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-28 23:59:00','104','101',2308.00,2308.00,2308.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-28 23:59:00','105','101',2885.00,2885.00,2885.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-29 23:59:00','101','101',578.00,578.00,578.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-29 23:59:00','102','101',1156.00,1156.00,1156.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-29 23:59:00','103','101',1734.00,1734.00,1734.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-29 23:59:00','104','101',2312.00,2312.00,2312.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-29 23:59:00','105','101',2890.00,2890.00,2890.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-30 23:59:00','101','101',579.00,579.00,579.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-30 23:59:00','102','101',1158.00,1158.00,1158.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-30 23:59:00','103','101',1737.00,1737.00,1737.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-30 23:59:00','104','101',2316.00,2316.00,2316.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-30 23:59:00','105','101',2895.00,2895.00,2895.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-01-31 23:59:00','101','101',580.00,580.00,580.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-01-31 23:59:00','102','101',1160.00,1160.00,1160.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-01-31 23:59:00','103','101',1740.00,1740.00,1740.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-01-31 23:59:00','104','101',2320.00,2320.00,2320.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-01-31 23:59:00','105','101',2900.00,2900.00,2900.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-01 23:59:00','101','101',581.00,581.00,581.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-01 23:59:00','102','101',1162.00,1162.00,1162.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-01 23:59:00','103','101',1743.00,1743.00,1743.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-01 23:59:00','104','101',2324.00,2324.00,2324.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-01 23:59:00','105','101',2905.00,2905.00,2905.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-02 23:59:00','101','101',582.00,582.00,582.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-02 23:59:00','102','101',1164.00,1164.00,1164.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-02 23:59:00','103','101',1746.00,1746.00,1746.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-02 23:59:00','104','101',2328.00,2328.00,2328.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-02 23:59:00','105','101',2910.00,2910.00,2910.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-03 23:59:00','101','101',583.00,583.00,583.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-03 23:59:00','102','101',1166.00,1166.00,1166.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-03 23:59:00','103','101',1749.00,1749.00,1749.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-03 23:59:00','104','101',2332.00,2332.00,2332.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-03 23:59:00','105','101',2915.00,2915.00,2915.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-04 23:59:00','101','101',584.00,584.00,584.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-04 23:59:00','102','101',1168.00,1168.00,1168.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-04 23:59:00','103','101',1752.00,1752.00,1752.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-04 23:59:00','104','101',2336.00,2336.00,2336.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-04 23:59:00','105','101',2920.00,2920.00,2920.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-05 23:59:00','101','101',585.00,585.00,585.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-05 23:59:00','102','101',1170.00,1170.00,1170.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-05 23:59:00','103','101',1755.00,1755.00,1755.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-05 23:59:00','104','101',2340.00,2340.00,2340.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-05 23:59:00','105','101',2925.00,2925.00,2925.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-06 23:59:00','101','101',586.00,586.00,586.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-06 23:59:00','102','101',1172.00,1172.00,1172.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-06 23:59:00','103','101',1758.00,1758.00,1758.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-06 23:59:00','104','101',2344.00,2344.00,2344.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-06 23:59:00','105','101',2930.00,2930.00,2930.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-07 23:59:00','101','101',587.00,587.00,587.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-07 23:59:00','102','101',1174.00,1174.00,1174.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-07 23:59:00','103','101',1761.00,1761.00,1761.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-07 23:59:00','104','101',2348.00,2348.00,2348.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-07 23:59:00','105','101',2935.00,2935.00,2935.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-08 23:59:00','101','101',588.00,588.00,588.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-08 23:59:00','102','101',1176.00,1176.00,1176.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-08 23:59:00','103','101',1764.00,1764.00,1764.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-08 23:59:00','104','101',2352.00,2352.00,2352.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-08 23:59:00','105','101',2940.00,2940.00,2940.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-09 23:59:00','101','101',589.00,589.00,589.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-09 23:59:00','102','101',1178.00,1178.00,1178.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-09 23:59:00','103','101',1767.00,1767.00,1767.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-09 23:59:00','104','101',2356.00,2356.00,2356.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-09 23:59:00','105','101',2945.00,2945.00,2945.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-10 23:59:00','101','101',590.00,590.00,590.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-10 23:59:00','102','101',1180.00,1180.00,1180.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-10 23:59:00','103','101',1770.00,1770.00,1770.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-10 23:59:00','104','101',2360.00,2360.00,2360.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-10 23:59:00','105','101',2950.00,2950.00,2950.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-11 23:59:00','101','101',591.00,591.00,591.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-11 23:59:00','102','101',1182.00,1182.00,1182.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-11 23:59:00','103','101',1773.00,1773.00,1773.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-11 23:59:00','104','101',2364.00,2364.00,2364.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-11 23:59:00','105','101',2955.00,2955.00,2955.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-12 23:59:00','101','101',592.00,592.00,592.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-12 23:59:00','102','101',1184.00,1184.00,1184.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-12 23:59:00','103','101',1776.00,1776.00,1776.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-12 23:59:00','104','101',2368.00,2368.00,2368.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-12 23:59:00','105','101',2960.00,2960.00,2960.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-13 23:59:00','101','101',593.00,593.00,593.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-13 23:59:00','102','101',1186.00,1186.00,1186.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-13 23:59:00','103','101',1779.00,1779.00,1779.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-13 23:59:00','104','101',2372.00,2372.00,2372.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-13 23:59:00','105','101',2965.00,2965.00,2965.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-14 23:59:00','101','101',594.00,594.00,594.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-14 23:59:00','102','101',1188.00,1188.00,1188.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-14 23:59:00','103','101',1782.00,1782.00,1782.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-14 23:59:00','104','101',2376.00,2376.00,2376.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-14 23:59:00','105','101',2970.00,2970.00,2970.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-15 23:59:00','101','101',595.00,595.00,595.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-15 23:59:00','102','101',1190.00,1190.00,1190.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-15 23:59:00','103','101',1785.00,1785.00,1785.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-15 23:59:00','104','101',2380.00,2380.00,2380.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-15 23:59:00','105','101',2975.00,2975.00,2975.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-16 23:59:00','101','101',596.00,596.00,596.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-16 23:59:00','102','101',1192.00,1192.00,1192.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-16 23:59:00','103','101',1788.00,1788.00,1788.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-16 23:59:00','104','101',2384.00,2384.00,2384.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-16 23:59:00','105','101',2980.00,2980.00,2980.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-17 23:59:00','101','101',597.00,597.00,597.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-17 23:59:00','102','101',1194.00,1194.00,1194.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-17 23:59:00','103','101',1791.00,1791.00,1791.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-17 23:59:00','104','101',2388.00,2388.00,2388.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-17 23:59:00','105','101',2985.00,2985.00,2985.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-18 23:59:00','101','101',598.00,598.00,598.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-18 23:59:00','102','101',1196.00,1196.00,1196.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-18 23:59:00','103','101',1794.00,1794.00,1794.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-18 23:59:00','104','101',2392.00,2392.00,2392.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-18 23:59:00','105','101',2990.00,2990.00,2990.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-19 23:59:00','101','101',599.00,599.00,599.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-19 23:59:00','102','101',1198.00,1198.00,1198.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-19 23:59:00','103','101',1797.00,1797.00,1797.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-19 23:59:00','104','101',2396.00,2396.00,2396.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-19 23:59:00','105','101',2995.00,2995.00,2995.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-20 23:59:00','101','101',600.00,600.00,600.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-20 23:59:00','102','101',1200.00,1200.00,1200.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-20 23:59:00','103','101',1800.00,1800.00,1800.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-20 23:59:00','104','101',2400.00,2400.00,2400.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-20 23:59:00','105','101',3000.00,3000.00,3000.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-21 23:59:00','101','101',601.00,601.00,601.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-21 23:59:00','102','101',1202.00,1202.00,1202.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-21 23:59:00','103','101',1803.00,1803.00,1803.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-21 23:59:00','104','101',2404.00,2404.00,2404.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-21 23:59:00','105','101',3005.00,3005.00,3005.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-22 23:59:00','101','101',602.00,602.00,602.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-22 23:59:00','102','101',1204.00,1204.00,1204.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-22 23:59:00','103','101',1806.00,1806.00,1806.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-22 23:59:00','104','101',2408.00,2408.00,2408.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-22 23:59:00','105','101',3010.00,3010.00,3010.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-23 23:59:00','101','101',603.00,603.00,603.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-23 23:59:00','102','101',1206.00,1206.00,1206.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-23 23:59:00','103','101',1809.00,1809.00,1809.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-23 23:59:00','104','101',2412.00,2412.00,2412.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-23 23:59:00','105','101',3015.00,3015.00,3015.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-24 23:59:00','101','101',604.00,604.00,604.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-24 23:59:00','102','101',1208.00,1208.00,1208.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-24 23:59:00','103','101',1812.00,1812.00,1812.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-24 23:59:00','104','101',2416.00,2416.00,2416.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-24 23:59:00','105','101',3020.00,3020.00,3020.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-25 23:59:00','101','101',605.00,605.00,605.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-25 23:59:00','102','101',1210.00,1210.00,1210.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-25 23:59:00','103','101',1815.00,1815.00,1815.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-25 23:59:00','104','101',2420.00,2420.00,2420.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-25 23:59:00','105','101',3025.00,3025.00,3025.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-26 23:59:00','101','101',606.00,606.00,606.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-26 23:59:00','102','101',1212.00,1212.00,1212.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-26 23:59:00','103','101',1818.00,1818.00,1818.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-26 23:59:00','104','101',2424.00,2424.00,2424.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-26 23:59:00','105','101',3030.00,3030.00,3030.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-27 23:59:00','101','101',607.00,607.00,607.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-27 23:59:00','102','101',1214.00,1214.00,1214.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-27 23:59:00','103','101',1821.00,1821.00,1821.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-27 23:59:00','104','101',2428.00,2428.00,2428.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-27 23:59:00','105','101',3035.00,3035.00,3035.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-02-28 23:59:00','101','101',608.00,608.00,608.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-02-28 23:59:00','102','101',1216.00,1216.00,1216.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-02-28 23:59:00','103','101',1824.00,1824.00,1824.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-02-28 23:59:00','104','101',2432.00,2432.00,2432.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-02-28 23:59:00','105','101',3040.00,3040.00,3040.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-01 23:59:00','101','101',609.00,609.00,609.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-01 23:59:00','102','101',1218.00,1218.00,1218.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-01 23:59:00','103','101',1827.00,1827.00,1827.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-01 23:59:00','104','101',2436.00,2436.00,2436.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-01 23:59:00','105','101',3045.00,3045.00,3045.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-02 23:59:00','101','101',610.00,610.00,610.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-02 23:59:00','102','101',1220.00,1220.00,1220.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-02 23:59:00','103','101',1830.00,1830.00,1830.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-02 23:59:00','104','101',2440.00,2440.00,2440.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-02 23:59:00','105','101',3050.00,3050.00,3050.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-03 23:59:00','101','101',611.00,611.00,611.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-03 23:59:00','102','101',1222.00,1222.00,1222.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-03 23:59:00','103','101',1833.00,1833.00,1833.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-03 23:59:00','104','101',2444.00,2444.00,2444.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-03 23:59:00','105','101',3055.00,3055.00,3055.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-04 23:59:00','101','101',612.00,612.00,612.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-04 23:59:00','102','101',1224.00,1224.00,1224.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-04 23:59:00','103','101',1836.00,1836.00,1836.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-04 23:59:00','104','101',2448.00,2448.00,2448.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-04 23:59:00','105','101',3060.00,3060.00,3060.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-05 23:59:00','101','101',613.00,613.00,613.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-05 23:59:00','102','101',1226.00,1226.00,1226.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-05 23:59:00','103','101',1839.00,1839.00,1839.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-05 23:59:00','104','101',2452.00,2452.00,2452.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-05 23:59:00','105','101',3065.00,3065.00,3065.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-06 23:59:00','101','101',614.00,614.00,614.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-06 23:59:00','102','101',1228.00,1228.00,1228.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-06 23:59:00','103','101',1842.00,1842.00,1842.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-06 23:59:00','104','101',2456.00,2456.00,2456.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-06 23:59:00','105','101',3070.00,3070.00,3070.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-07 23:59:00','101','101',615.00,615.00,615.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-07 23:59:00','102','101',1230.00,1230.00,1230.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-07 23:59:00','103','101',1845.00,1845.00,1845.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-07 23:59:00','104','101',2460.00,2460.00,2460.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-07 23:59:00','105','101',3075.00,3075.00,3075.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-08 23:59:00','101','101',616.00,616.00,616.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-08 23:59:00','102','101',1232.00,1232.00,1232.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-08 23:59:00','103','101',1848.00,1848.00,1848.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-08 23:59:00','104','101',2464.00,2464.00,2464.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-08 23:59:00','105','101',3080.00,3080.00,3080.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-09 23:59:00','101','101',617.00,617.00,617.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-09 23:59:00','102','101',1234.00,1234.00,1234.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-09 23:59:00','103','101',1851.00,1851.00,1851.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-09 23:59:00','104','101',2468.00,2468.00,2468.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-09 23:59:00','105','101',3085.00,3085.00,3085.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-10 23:59:00','101','101',618.00,618.00,618.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-10 23:59:00','102','101',1236.00,1236.00,1236.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-10 23:59:00','103','101',1854.00,1854.00,1854.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-10 23:59:00','104','101',2472.00,2472.00,2472.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-10 23:59:00','105','101',3090.00,3090.00,3090.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-11 23:59:00','101','101',619.00,619.00,619.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-11 23:59:00','102','101',1238.00,1238.00,1238.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-11 23:59:00','103','101',1857.00,1857.00,1857.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-11 23:59:00','104','101',2476.00,2476.00,2476.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-11 23:59:00','105','101',3095.00,3095.00,3095.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-12 23:59:00','101','101',620.00,620.00,620.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-12 23:59:00','102','101',1240.00,1240.00,1240.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-12 23:59:00','103','101',1860.00,1860.00,1860.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-12 23:59:00','104','101',2480.00,2480.00,2480.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-12 23:59:00','105','101',3100.00,3100.00,3100.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-13 23:59:00','101','101',621.00,621.00,621.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-13 23:59:00','102','101',1242.00,1242.00,1242.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-13 23:59:00','103','101',1863.00,1863.00,1863.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-13 23:59:00','104','101',2484.00,2484.00,2484.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-13 23:59:00','105','101',3105.00,3105.00,3105.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-14 23:59:00','101','101',622.00,622.00,622.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-14 23:59:00','102','101',1244.00,1244.00,1244.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-14 23:59:00','103','101',1866.00,1866.00,1866.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-14 23:59:00','104','101',2488.00,2488.00,2488.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-14 23:59:00','105','101',3110.00,3110.00,3110.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-15 23:59:00','101','101',623.00,623.00,623.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-15 23:59:00','102','101',1246.00,1246.00,1246.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-15 23:59:00','103','101',1869.00,1869.00,1869.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-15 23:59:00','104','101',2492.00,2492.00,2492.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-15 23:59:00','105','101',3115.00,3115.00,3115.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-16 23:59:00','101','101',624.00,624.00,624.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-16 23:59:00','102','101',1248.00,1248.00,1248.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-16 23:59:00','103','101',1872.00,1872.00,1872.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-16 23:59:00','104','101',2496.00,2496.00,2496.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-16 23:59:00','105','101',3120.00,3120.00,3120.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-17 23:59:00','101','101',625.00,625.00,625.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-17 23:59:00','102','101',1250.00,1250.00,1250.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-17 23:59:00','103','101',1875.00,1875.00,1875.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-17 23:59:00','104','101',2500.00,2500.00,2500.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-17 23:59:00','105','101',3125.00,3125.00,3125.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-18 23:59:00','101','101',626.00,626.00,626.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-18 23:59:00','102','101',1252.00,1252.00,1252.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-18 23:59:00','103','101',1878.00,1878.00,1878.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-18 23:59:00','104','101',2504.00,2504.00,2504.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-18 23:59:00','105','101',3130.00,3130.00,3130.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-19 23:59:00','101','101',627.00,627.00,627.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-19 23:59:00','102','101',1254.00,1254.00,1254.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-19 23:59:00','103','101',1881.00,1881.00,1881.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-19 23:59:00','104','101',2508.00,2508.00,2508.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-19 23:59:00','105','101',3135.00,3135.00,3135.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-20 23:59:00','101','101',628.00,628.00,628.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-20 23:59:00','102','101',1256.00,1256.00,1256.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-20 23:59:00','103','101',1884.00,1884.00,1884.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-20 23:59:00','104','101',2512.00,2512.00,2512.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-20 23:59:00','105','101',3140.00,3140.00,3140.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-21 23:59:00','101','101',629.00,629.00,629.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-21 23:59:00','102','101',1258.00,1258.00,1258.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-21 23:59:00','103','101',1887.00,1887.00,1887.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-21 23:59:00','104','101',2516.00,2516.00,2516.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-21 23:59:00','105','101',3145.00,3145.00,3145.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-22 23:59:00','101','101',630.00,630.00,630.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-22 23:59:00','102','101',1260.00,1260.00,1260.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-22 23:59:00','103','101',1890.00,1890.00,1890.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-22 23:59:00','104','101',2520.00,2520.00,2520.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-22 23:59:00','105','101',3150.00,3150.00,3150.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-23 23:59:00','101','101',631.00,631.00,631.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-23 23:59:00','102','101',1262.00,1262.00,1262.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-23 23:59:00','103','101',1893.00,1893.00,1893.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-23 23:59:00','104','101',2524.00,2524.00,2524.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-23 23:59:00','105','101',3155.00,3155.00,3155.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-24 23:59:00','101','101',632.00,632.00,632.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-24 23:59:00','102','101',1264.00,1264.00,1264.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-24 23:59:00','103','101',1896.00,1896.00,1896.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-24 23:59:00','104','101',2528.00,2528.00,2528.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-24 23:59:00','105','101',3160.00,3160.00,3160.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-25 23:59:00','101','101',633.00,633.00,633.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-25 23:59:00','102','101',1266.00,1266.00,1266.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-25 23:59:00','103','101',1899.00,1899.00,1899.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-25 23:59:00','104','101',2532.00,2532.00,2532.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-25 23:59:00','105','101',3165.00,3165.00,3165.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-26 23:59:00','101','101',634.00,634.00,634.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-26 23:59:00','102','101',1268.00,1268.00,1268.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-26 23:59:00','103','101',1902.00,1902.00,1902.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-26 23:59:00','104','101',2536.00,2536.00,2536.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-26 23:59:00','105','101',3170.00,3170.00,3170.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-27 23:59:00','101','101',635.00,635.00,635.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-27 23:59:00','102','101',1270.00,1270.00,1270.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-27 23:59:00','103','101',1905.00,1905.00,1905.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-27 23:59:00','104','101',2540.00,2540.00,2540.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-27 23:59:00','105','101',3175.00,3175.00,3175.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-28 23:59:00','101','101',636.00,636.00,636.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-28 23:59:00','102','101',1272.00,1272.00,1272.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-28 23:59:00','103','101',1908.00,1908.00,1908.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-28 23:59:00','104','101',2544.00,2544.00,2544.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-28 23:59:00','105','101',3180.00,3180.00,3180.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-29 23:59:00','101','101',637.00,637.00,637.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-29 23:59:00','102','101',1274.00,1274.00,1274.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-29 23:59:00','103','101',1911.00,1911.00,1911.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-29 23:59:00','104','101',2548.00,2548.00,2548.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-29 23:59:00','105','101',3185.00,3185.00,3185.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-30 23:59:00','101','101',638.00,638.00,638.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-30 23:59:00','102','101',1276.00,1276.00,1276.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-30 23:59:00','103','101',1914.00,1914.00,1914.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-30 23:59:00','104','101',2552.00,2552.00,2552.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-30 23:59:00','105','101',3190.00,3190.00,3190.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-03-31 23:59:00','101','101',639.00,639.00,639.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-03-31 23:59:00','102','101',1278.00,1278.00,1278.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-03-31 23:59:00','103','101',1917.00,1917.00,1917.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-03-31 23:59:00','104','101',2556.00,2556.00,2556.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-03-31 23:59:00','105','101',3195.00,3195.00,3195.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-01 23:59:00','101','101',640.00,640.00,640.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-01 23:59:00','102','101',1280.00,1280.00,1280.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-01 23:59:00','103','101',1920.00,1920.00,1920.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-01 23:59:00','104','101',2560.00,2560.00,2560.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-01 23:59:00','105','101',3200.00,3200.00,3200.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-02 23:59:00','101','101',641.00,641.00,641.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-02 23:59:00','102','101',1282.00,1282.00,1282.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-02 23:59:00','103','101',1923.00,1923.00,1923.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-02 23:59:00','104','101',2564.00,2564.00,2564.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-02 23:59:00','105','101',3205.00,3205.00,3205.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-03 23:59:00','101','101',642.00,642.00,642.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-03 23:59:00','102','101',1284.00,1284.00,1284.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-03 23:59:00','103','101',1926.00,1926.00,1926.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-03 23:59:00','104','101',2568.00,2568.00,2568.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-03 23:59:00','105','101',3210.00,3210.00,3210.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-04 23:59:00','101','101',643.00,643.00,643.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-04 23:59:00','102','101',1286.00,1286.00,1286.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-04 23:59:00','103','101',1929.00,1929.00,1929.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-04 23:59:00','104','101',2572.00,2572.00,2572.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-04 23:59:00','105','101',3215.00,3215.00,3215.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-05 23:59:00','101','101',644.00,644.00,644.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-05 23:59:00','102','101',1288.00,1288.00,1288.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-05 23:59:00','103','101',1932.00,1932.00,1932.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-05 23:59:00','104','101',2576.00,2576.00,2576.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-05 23:59:00','105','101',3220.00,3220.00,3220.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-06 23:59:00','101','101',645.00,645.00,645.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-06 23:59:00','102','101',1290.00,1290.00,1290.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-06 23:59:00','103','101',1935.00,1935.00,1935.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-06 23:59:00','104','101',2580.00,2580.00,2580.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-06 23:59:00','105','101',3225.00,3225.00,3225.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-07 23:59:00','101','101',646.00,646.00,646.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-07 23:59:00','102','101',1292.00,1292.00,1292.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-07 23:59:00','103','101',1938.00,1938.00,1938.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-07 23:59:00','104','101',2584.00,2584.00,2584.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-07 23:59:00','105','101',3230.00,3230.00,3230.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-08 23:59:00','101','101',647.00,647.00,647.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-08 23:59:00','102','101',1294.00,1294.00,1294.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-08 23:59:00','103','101',1941.00,1941.00,1941.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-08 23:59:00','104','101',2588.00,2588.00,2588.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-08 23:59:00','105','101',3235.00,3235.00,3235.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-09 23:59:00','101','101',648.00,648.00,648.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-09 23:59:00','102','101',1296.00,1296.00,1296.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-09 23:59:00','103','101',1944.00,1944.00,1944.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-09 23:59:00','104','101',2592.00,2592.00,2592.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-09 23:59:00','105','101',3240.00,3240.00,3240.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-10 23:59:00','101','101',649.00,649.00,649.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-10 23:59:00','102','101',1298.00,1298.00,1298.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-10 23:59:00','103','101',1947.00,1947.00,1947.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-10 23:59:00','104','101',2596.00,2596.00,2596.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-10 23:59:00','105','101',3245.00,3245.00,3245.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-11 23:59:00','101','101',650.00,650.00,650.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-11 23:59:00','102','101',1300.00,1300.00,1300.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-11 23:59:00','103','101',1950.00,1950.00,1950.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-11 23:59:00','104','101',2600.00,2600.00,2600.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-11 23:59:00','105','101',3250.00,3250.00,3250.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-12 23:59:00','101','101',651.00,651.00,651.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-12 23:59:00','102','101',1302.00,1302.00,1302.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-12 23:59:00','103','101',1953.00,1953.00,1953.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-12 23:59:00','104','101',2604.00,2604.00,2604.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-12 23:59:00','105','101',3255.00,3255.00,3255.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-13 23:59:00','101','101',652.00,652.00,652.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-13 23:59:00','102','101',1304.00,1304.00,1304.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-13 23:59:00','103','101',1956.00,1956.00,1956.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-13 23:59:00','104','101',2608.00,2608.00,2608.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-13 23:59:00','105','101',3260.00,3260.00,3260.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-14 23:59:00','101','101',653.00,653.00,653.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-14 23:59:00','102','101',1306.00,1306.00,1306.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-14 23:59:00','103','101',1959.00,1959.00,1959.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-14 23:59:00','104','101',2612.00,2612.00,2612.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-14 23:59:00','105','101',3265.00,3265.00,3265.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-15 23:59:00','101','101',654.00,654.00,654.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-15 23:59:00','102','101',1308.00,1308.00,1308.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-15 23:59:00','103','101',1962.00,1962.00,1962.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-15 23:59:00','104','101',2616.00,2616.00,2616.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-15 23:59:00','105','101',3270.00,3270.00,3270.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-16 23:59:00','101','101',655.00,655.00,655.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-16 23:59:00','102','101',1310.00,1310.00,1310.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-16 23:59:00','103','101',1965.00,1965.00,1965.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-16 23:59:00','104','101',2620.00,2620.00,2620.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-16 23:59:00','105','101',3275.00,3275.00,3275.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-17 23:59:00','101','101',656.00,656.00,656.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-17 23:59:00','102','101',1312.00,1312.00,1312.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-17 23:59:00','103','101',1968.00,1968.00,1968.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-17 23:59:00','104','101',2624.00,2624.00,2624.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-17 23:59:00','105','101',3280.00,3280.00,3280.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-18 23:59:00','101','101',657.00,657.00,657.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-18 23:59:00','102','101',1314.00,1314.00,1314.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-18 23:59:00','103','101',1971.00,1971.00,1971.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-18 23:59:00','104','101',2628.00,2628.00,2628.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-18 23:59:00','105','101',3285.00,3285.00,3285.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-19 23:59:00','101','101',658.00,658.00,658.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-19 23:59:00','102','101',1316.00,1316.00,1316.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-19 23:59:00','103','101',1974.00,1974.00,1974.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-19 23:59:00','104','101',2632.00,2632.00,2632.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-19 23:59:00','105','101',3290.00,3290.00,3290.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-20 23:59:00','101','101',659.00,659.00,659.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-20 23:59:00','102','101',1318.00,1318.00,1318.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-20 23:59:00','103','101',1977.00,1977.00,1977.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-20 23:59:00','104','101',2636.00,2636.00,2636.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-20 23:59:00','105','101',3295.00,3295.00,3295.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-21 23:59:00','101','101',660.00,660.00,660.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-21 23:59:00','102','101',1320.00,1320.00,1320.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-21 23:59:00','103','101',1980.00,1980.00,1980.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-21 23:59:00','104','101',2640.00,2640.00,2640.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-21 23:59:00','105','101',3300.00,3300.00,3300.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-22 23:59:00','101','101',661.00,661.00,661.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-22 23:59:00','102','101',1322.00,1322.00,1322.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-22 23:59:00','103','101',1983.00,1983.00,1983.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-22 23:59:00','104','101',2644.00,2644.00,2644.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-22 23:59:00','105','101',3305.00,3305.00,3305.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-23 23:59:00','101','101',662.00,662.00,662.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-23 23:59:00','102','101',1324.00,1324.00,1324.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-23 23:59:00','103','101',1986.00,1986.00,1986.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-23 23:59:00','104','101',2648.00,2648.00,2648.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-23 23:59:00','105','101',3310.00,3310.00,3310.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-24 23:59:00','101','101',663.00,663.00,663.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-24 23:59:00','102','101',1326.00,1326.00,1326.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-24 23:59:00','103','101',1989.00,1989.00,1989.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-24 23:59:00','104','101',2652.00,2652.00,2652.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-24 23:59:00','105','101',3315.00,3315.00,3315.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-25 23:59:00','101','101',664.00,664.00,664.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-25 23:59:00','102','101',1328.00,1328.00,1328.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-25 23:59:00','103','101',1992.00,1992.00,1992.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-25 23:59:00','104','101',2656.00,2656.00,2656.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-25 23:59:00','105','101',3320.00,3320.00,3320.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-26 23:59:00','101','101',665.00,665.00,665.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-26 23:59:00','102','101',1330.00,1330.00,1330.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-26 23:59:00','103','101',1995.00,1995.00,1995.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-26 23:59:00','104','101',2660.00,2660.00,2660.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-26 23:59:00','105','101',3325.00,3325.00,3325.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-27 23:59:00','101','101',666.00,666.00,666.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-27 23:59:00','102','101',1332.00,1332.00,1332.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-27 23:59:00','103','101',1998.00,1998.00,1998.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-27 23:59:00','104','101',2664.00,2664.00,2664.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-27 23:59:00','105','101',3330.00,3330.00,3330.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-28 23:59:00','101','101',667.00,667.00,667.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-28 23:59:00','102','101',1334.00,1334.00,1334.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-28 23:59:00','103','101',2001.00,2001.00,2001.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-28 23:59:00','104','101',2668.00,2668.00,2668.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-28 23:59:00','105','101',3335.00,3335.00,3335.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-29 23:59:00','101','101',668.00,668.00,668.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-29 23:59:00','102','101',1336.00,1336.00,1336.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-29 23:59:00','103','101',2004.00,2004.00,2004.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-29 23:59:00','104','101',2672.00,2672.00,2672.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-29 23:59:00','105','101',3340.00,3340.00,3340.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-04-30 23:59:00','101','101',669.00,669.00,669.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-04-30 23:59:00','102','101',1338.00,1338.00,1338.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-04-30 23:59:00','103','101',2007.00,2007.00,2007.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-04-30 23:59:00','104','101',2676.00,2676.00,2676.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-04-30 23:59:00','105','101',3345.00,3345.00,3345.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-01 23:59:00','101','101',670.00,670.00,670.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-01 23:59:00','102','101',1340.00,1340.00,1340.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-01 23:59:00','103','101',2010.00,2010.00,2010.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-01 23:59:00','104','101',2680.00,2680.00,2680.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-01 23:59:00','105','101',3350.00,3350.00,3350.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-02 23:59:00','101','101',671.00,671.00,671.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-02 23:59:00','102','101',1342.00,1342.00,1342.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-02 23:59:00','103','101',2013.00,2013.00,2013.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-02 23:59:00','104','101',2684.00,2684.00,2684.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-02 23:59:00','105','101',3355.00,3355.00,3355.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-03 23:59:00','101','101',672.00,672.00,672.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-03 23:59:00','102','101',1344.00,1344.00,1344.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-03 23:59:00','103','101',2016.00,2016.00,2016.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-03 23:59:00','104','101',2688.00,2688.00,2688.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-03 23:59:00','105','101',3360.00,3360.00,3360.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-04 23:59:00','101','101',673.00,673.00,673.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-04 23:59:00','102','101',1346.00,1346.00,1346.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-04 23:59:00','103','101',2019.00,2019.00,2019.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-04 23:59:00','104','101',2692.00,2692.00,2692.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-04 23:59:00','105','101',3365.00,3365.00,3365.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-05 23:59:00','101','101',674.00,674.00,674.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-05 23:59:00','102','101',1348.00,1348.00,1348.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-05 23:59:00','103','101',2022.00,2022.00,2022.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-05 23:59:00','104','101',2696.00,2696.00,2696.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-05 23:59:00','105','101',3370.00,3370.00,3370.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-06 23:59:00','101','101',675.00,675.00,675.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-06 23:59:00','102','101',1350.00,1350.00,1350.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-06 23:59:00','103','101',2025.00,2025.00,2025.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-06 23:59:00','104','101',2700.00,2700.00,2700.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-06 23:59:00','105','101',3375.00,3375.00,3375.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-07 23:59:00','101','101',676.00,676.00,676.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-07 23:59:00','102','101',1352.00,1352.00,1352.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-07 23:59:00','103','101',2028.00,2028.00,2028.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-07 23:59:00','104','101',2704.00,2704.00,2704.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-07 23:59:00','105','101',3380.00,3380.00,3380.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-08 23:59:00','101','101',677.00,677.00,677.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-08 23:59:00','102','101',1354.00,1354.00,1354.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-08 23:59:00','103','101',2031.00,2031.00,2031.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-08 23:59:00','104','101',2708.00,2708.00,2708.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-08 23:59:00','105','101',3385.00,3385.00,3385.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-09 23:59:00','101','101',678.00,678.00,678.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-09 23:59:00','102','101',1356.00,1356.00,1356.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-09 23:59:00','103','101',2034.00,2034.00,2034.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-09 23:59:00','104','101',2712.00,2712.00,2712.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-09 23:59:00','105','101',3390.00,3390.00,3390.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-10 23:59:00','101','101',679.00,679.00,679.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-10 23:59:00','102','101',1358.00,1358.00,1358.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-10 23:59:00','103','101',2037.00,2037.00,2037.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-10 23:59:00','104','101',2716.00,2716.00,2716.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-10 23:59:00','105','101',3395.00,3395.00,3395.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-11 23:59:00','101','101',680.00,680.00,680.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-11 23:59:00','102','101',1360.00,1360.00,1360.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-11 23:59:00','103','101',2040.00,2040.00,2040.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-11 23:59:00','104','101',2720.00,2720.00,2720.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-11 23:59:00','105','101',3400.00,3400.00,3400.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-12 23:59:00','101','101',681.00,681.00,681.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-12 23:59:00','102','101',1362.00,1362.00,1362.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-12 23:59:00','103','101',2043.00,2043.00,2043.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-12 23:59:00','104','101',2724.00,2724.00,2724.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-12 23:59:00','105','101',3405.00,3405.00,3405.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-13 23:59:00','101','101',682.00,682.00,682.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-13 23:59:00','102','101',1364.00,1364.00,1364.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-13 23:59:00','103','101',2046.00,2046.00,2046.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-13 23:59:00','104','101',2728.00,2728.00,2728.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-13 23:59:00','105','101',3410.00,3410.00,3410.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-14 23:59:00','101','101',683.00,683.00,683.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-14 23:59:00','102','101',1366.00,1366.00,1366.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-14 23:59:00','103','101',2049.00,2049.00,2049.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-14 23:59:00','104','101',2732.00,2732.00,2732.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-14 23:59:00','105','101',3415.00,3415.00,3415.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-15 23:59:00','101','101',684.00,684.00,684.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-15 23:59:00','102','101',1368.00,1368.00,1368.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-15 23:59:00','103','101',2052.00,2052.00,2052.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-15 23:59:00','104','101',2736.00,2736.00,2736.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-15 23:59:00','105','101',3420.00,3420.00,3420.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-16 23:59:00','101','101',685.00,685.00,685.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-16 23:59:00','102','101',1370.00,1370.00,1370.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-16 23:59:00','103','101',2055.00,2055.00,2055.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-16 23:59:00','104','101',2740.00,2740.00,2740.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-16 23:59:00','105','101',3425.00,3425.00,3425.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-17 23:59:00','101','101',686.00,686.00,686.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-17 23:59:00','102','101',1372.00,1372.00,1372.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-17 23:59:00','103','101',2058.00,2058.00,2058.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-17 23:59:00','104','101',2744.00,2744.00,2744.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-17 23:59:00','105','101',3430.00,3430.00,3430.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-18 23:59:00','101','101',687.00,687.00,687.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-18 23:59:00','102','101',1374.00,1374.00,1374.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-18 23:59:00','103','101',2061.00,2061.00,2061.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-18 23:59:00','104','101',2748.00,2748.00,2748.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-18 23:59:00','105','101',3435.00,3435.00,3435.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-19 23:59:00','101','101',688.00,688.00,688.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-19 23:59:00','102','101',1376.00,1376.00,1376.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-19 23:59:00','103','101',2064.00,2064.00,2064.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-19 23:59:00','104','101',2752.00,2752.00,2752.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-19 23:59:00','105','101',3440.00,3440.00,3440.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-20 23:59:00','101','101',689.00,689.00,689.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-20 23:59:00','102','101',1378.00,1378.00,1378.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-20 23:59:00','103','101',2067.00,2067.00,2067.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-20 23:59:00','104','101',2756.00,2756.00,2756.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-20 23:59:00','105','101',3445.00,3445.00,3445.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-21 23:59:00','101','101',690.00,690.00,690.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-21 23:59:00','102','101',1380.00,1380.00,1380.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-21 23:59:00','103','101',2070.00,2070.00,2070.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-21 23:59:00','104','101',2760.00,2760.00,2760.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-21 23:59:00','105','101',3450.00,3450.00,3450.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-22 23:59:00','101','101',691.00,691.00,691.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-22 23:59:00','102','101',1382.00,1382.00,1382.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-22 23:59:00','103','101',2073.00,2073.00,2073.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-22 23:59:00','104','101',2764.00,2764.00,2764.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-22 23:59:00','105','101',3455.00,3455.00,3455.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-23 23:59:00','101','101',692.00,692.00,692.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-23 23:59:00','102','101',1384.00,1384.00,1384.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-23 23:59:00','103','101',2076.00,2076.00,2076.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-23 23:59:00','104','101',2768.00,2768.00,2768.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-23 23:59:00','105','101',3460.00,3460.00,3460.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-24 23:59:00','101','101',693.00,693.00,693.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-24 23:59:00','102','101',1386.00,1386.00,1386.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-24 23:59:00','103','101',2079.00,2079.00,2079.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-24 23:59:00','104','101',2772.00,2772.00,2772.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-24 23:59:00','105','101',3465.00,3465.00,3465.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-25 23:59:00','101','101',694.00,694.00,694.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-25 23:59:00','102','101',1388.00,1388.00,1388.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-25 23:59:00','103','101',2082.00,2082.00,2082.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-25 23:59:00','104','101',2776.00,2776.00,2776.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-25 23:59:00','105','101',3470.00,3470.00,3470.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-26 23:59:00','101','101',695.00,695.00,695.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-26 23:59:00','102','101',1390.00,1390.00,1390.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-26 23:59:00','103','101',2085.00,2085.00,2085.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-26 23:59:00','104','101',2780.00,2780.00,2780.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-26 23:59:00','105','101',3475.00,3475.00,3475.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-27 23:59:00','101','101',696.00,696.00,696.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-27 23:59:00','102','101',1392.00,1392.00,1392.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-27 23:59:00','103','101',2088.00,2088.00,2088.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-27 23:59:00','104','101',2784.00,2784.00,2784.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-27 23:59:00','105','101',3480.00,3480.00,3480.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-28 23:59:00','101','101',697.00,697.00,697.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-28 23:59:00','102','101',1394.00,1394.00,1394.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-28 23:59:00','103','101',2091.00,2091.00,2091.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-28 23:59:00','104','101',2788.00,2788.00,2788.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-28 23:59:00','105','101',3485.00,3485.00,3485.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-29 23:59:00','101','101',698.00,698.00,698.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-29 23:59:00','102','101',1396.00,1396.00,1396.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-29 23:59:00','103','101',2094.00,2094.00,2094.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-29 23:59:00','104','101',2792.00,2792.00,2792.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-29 23:59:00','105','101',3490.00,3490.00,3490.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-30 23:59:00','101','101',699.00,699.00,699.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-30 23:59:00','102','101',1398.00,1398.00,1398.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-30 23:59:00','103','101',2097.00,2097.00,2097.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-30 23:59:00','104','101',2796.00,2796.00,2796.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-30 23:59:00','105','101',3495.00,3495.00,3495.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-05-31 23:59:00','101','101',700.00,700.00,700.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-05-31 23:59:00','102','101',1400.00,1400.00,1400.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-05-31 23:59:00','103','101',2100.00,2100.00,2100.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-05-31 23:59:00','104','101',2800.00,2800.00,2800.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-05-31 23:59:00','105','101',3500.00,3500.00,3500.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-01 23:59:00','101','101',701.00,701.00,701.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-01 23:59:00','102','101',1402.00,1402.00,1402.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-01 23:59:00','103','101',2103.00,2103.00,2103.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-01 23:59:00','104','101',2804.00,2804.00,2804.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-01 23:59:00','105','101',3505.00,3505.00,3505.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-02 23:59:00','101','101',702.00,702.00,702.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-02 23:59:00','102','101',1404.00,1404.00,1404.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-02 23:59:00','103','101',2106.00,2106.00,2106.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-02 23:59:00','104','101',2808.00,2808.00,2808.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-02 23:59:00','105','101',3510.00,3510.00,3510.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-03 23:59:00','101','101',703.00,703.00,703.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-03 23:59:00','102','101',1406.00,1406.00,1406.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-03 23:59:00','103','101',2109.00,2109.00,2109.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-03 23:59:00','104','101',2812.00,2812.00,2812.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-03 23:59:00','105','101',3515.00,3515.00,3515.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-04 23:59:00','101','101',704.00,704.00,704.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-04 23:59:00','102','101',1408.00,1408.00,1408.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-04 23:59:00','103','101',2112.00,2112.00,2112.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-04 23:59:00','104','101',2816.00,2816.00,2816.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-04 23:59:00','105','101',3520.00,3520.00,3520.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-05 23:59:00','101','101',705.00,705.00,705.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-05 23:59:00','102','101',1410.00,1410.00,1410.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-05 23:59:00','103','101',2115.00,2115.00,2115.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-05 23:59:00','104','101',2820.00,2820.00,2820.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-05 23:59:00','105','101',3525.00,3525.00,3525.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-06 23:59:00','101','101',706.00,706.00,706.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-06 23:59:00','102','101',1412.00,1412.00,1412.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-06 23:59:00','103','101',2118.00,2118.00,2118.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-06 23:59:00','104','101',2824.00,2824.00,2824.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-06 23:59:00','105','101',3530.00,3530.00,3530.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-07 23:59:00','101','101',707.00,707.00,707.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-07 23:59:00','102','101',1414.00,1414.00,1414.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-07 23:59:00','103','101',2121.00,2121.00,2121.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-07 23:59:00','104','101',2828.00,2828.00,2828.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-07 23:59:00','105','101',3535.00,3535.00,3535.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-08 23:59:00','101','101',708.00,708.00,708.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-08 23:59:00','102','101',1416.00,1416.00,1416.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-08 23:59:00','103','101',2124.00,2124.00,2124.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-08 23:59:00','104','101',2832.00,2832.00,2832.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-08 23:59:00','105','101',3540.00,3540.00,3540.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-09 23:59:00','101','101',709.00,709.00,709.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-09 23:59:00','102','101',1418.00,1418.00,1418.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-09 23:59:00','103','101',2127.00,2127.00,2127.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-09 23:59:00','104','101',2836.00,2836.00,2836.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-09 23:59:00','105','101',3545.00,3545.00,3545.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-10 23:59:00','101','101',710.00,710.00,710.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-10 23:59:00','102','101',1420.00,1420.00,1420.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-10 23:59:00','103','101',2130.00,2130.00,2130.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-10 23:59:00','104','101',2840.00,2840.00,2840.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-10 23:59:00','105','101',3550.00,3550.00,3550.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-11 23:59:00','101','101',711.00,711.00,711.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-11 23:59:00','102','101',1422.00,1422.00,1422.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-11 23:59:00','103','101',2133.00,2133.00,2133.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-11 23:59:00','104','101',2844.00,2844.00,2844.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-11 23:59:00','105','101',3555.00,3555.00,3555.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-12 23:59:00','101','101',712.00,712.00,712.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-12 23:59:00','102','101',1424.00,1424.00,1424.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-12 23:59:00','103','101',2136.00,2136.00,2136.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-12 23:59:00','104','101',2848.00,2848.00,2848.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-12 23:59:00','105','101',3560.00,3560.00,3560.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-13 23:59:00','101','101',713.00,713.00,713.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-13 23:59:00','102','101',1426.00,1426.00,1426.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-13 23:59:00','103','101',2139.00,2139.00,2139.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-13 23:59:00','104','101',2852.00,2852.00,2852.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-13 23:59:00','105','101',3565.00,3565.00,3565.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-14 23:59:00','101','101',714.00,714.00,714.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-14 23:59:00','102','101',1428.00,1428.00,1428.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-14 23:59:00','103','101',2142.00,2142.00,2142.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-14 23:59:00','104','101',2856.00,2856.00,2856.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-14 23:59:00','105','101',3570.00,3570.00,3570.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-15 23:59:00','101','101',715.00,715.00,715.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-15 23:59:00','102','101',1430.00,1430.00,1430.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-15 23:59:00','103','101',2145.00,2145.00,2145.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-15 23:59:00','104','101',2860.00,2860.00,2860.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-15 23:59:00','105','101',3575.00,3575.00,3575.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-16 23:59:00','101','101',716.00,716.00,716.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-16 23:59:00','102','101',1432.00,1432.00,1432.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-16 23:59:00','103','101',2148.00,2148.00,2148.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-16 23:59:00','104','101',2864.00,2864.00,2864.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-16 23:59:00','105','101',3580.00,3580.00,3580.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-17 23:59:00','101','101',717.00,717.00,717.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-17 23:59:00','102','101',1434.00,1434.00,1434.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-17 23:59:00','103','101',2151.00,2151.00,2151.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-17 23:59:00','104','101',2868.00,2868.00,2868.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-17 23:59:00','105','101',3585.00,3585.00,3585.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-18 23:59:00','101','101',718.00,718.00,718.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-18 23:59:00','102','101',1436.00,1436.00,1436.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-18 23:59:00','103','101',2154.00,2154.00,2154.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-18 23:59:00','104','101',2872.00,2872.00,2872.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-18 23:59:00','105','101',3590.00,3590.00,3590.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-19 23:59:00','101','101',719.00,719.00,719.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-19 23:59:00','102','101',1438.00,1438.00,1438.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-19 23:59:00','103','101',2157.00,2157.00,2157.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-19 23:59:00','104','101',2876.00,2876.00,2876.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-19 23:59:00','105','101',3595.00,3595.00,3595.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-20 23:59:00','101','101',720.00,720.00,720.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-20 23:59:00','102','101',1440.00,1440.00,1440.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-20 23:59:00','103','101',2160.00,2160.00,2160.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-20 23:59:00','104','101',2880.00,2880.00,2880.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-20 23:59:00','105','101',3600.00,3600.00,3600.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-21 23:59:00','101','101',721.00,721.00,721.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-21 23:59:00','102','101',1442.00,1442.00,1442.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-21 23:59:00','103','101',2163.00,2163.00,2163.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-21 23:59:00','104','101',2884.00,2884.00,2884.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-21 23:59:00','105','101',3605.00,3605.00,3605.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-22 23:59:00','101','101',722.00,722.00,722.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-22 23:59:00','102','101',1444.00,1444.00,1444.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-22 23:59:00','103','101',2166.00,2166.00,2166.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-22 23:59:00','104','101',2888.00,2888.00,2888.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-22 23:59:00','105','101',3610.00,3610.00,3610.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-23 23:59:00','101','101',723.00,723.00,723.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-23 23:59:00','102','101',1446.00,1446.00,1446.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-23 23:59:00','103','101',2169.00,2169.00,2169.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-23 23:59:00','104','101',2892.00,2892.00,2892.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-23 23:59:00','105','101',3615.00,3615.00,3615.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-24 23:59:00','101','101',724.00,724.00,724.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-24 23:59:00','102','101',1448.00,1448.00,1448.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-24 23:59:00','103','101',2172.00,2172.00,2172.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-24 23:59:00','104','101',2896.00,2896.00,2896.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-24 23:59:00','105','101',3620.00,3620.00,3620.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-25 23:59:00','101','101',725.00,725.00,725.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-25 23:59:00','102','101',1450.00,1450.00,1450.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-25 23:59:00','103','101',2175.00,2175.00,2175.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-25 23:59:00','104','101',2900.00,2900.00,2900.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-25 23:59:00','105','101',3625.00,3625.00,3625.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-26 23:59:00','101','101',726.00,726.00,726.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-26 23:59:00','102','101',1452.00,1452.00,1452.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-26 23:59:00','103','101',2178.00,2178.00,2178.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-26 23:59:00','104','101',2904.00,2904.00,2904.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-26 23:59:00','105','101',3630.00,3630.00,3630.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-27 23:59:00','101','101',727.00,727.00,727.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-27 23:59:00','102','101',1454.00,1454.00,1454.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-27 23:59:00','103','101',2181.00,2181.00,2181.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-27 23:59:00','104','101',2908.00,2908.00,2908.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-27 23:59:00','105','101',3635.00,3635.00,3635.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-28 23:59:00','101','101',728.00,728.00,728.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-28 23:59:00','102','101',1456.00,1456.00,1456.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-28 23:59:00','103','101',2184.00,2184.00,2184.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-28 23:59:00','104','101',2912.00,2912.00,2912.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-28 23:59:00','105','101',3640.00,3640.00,3640.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-29 23:59:00','101','101',729.00,729.00,729.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-29 23:59:00','102','101',1458.00,1458.00,1458.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-29 23:59:00','103','101',2187.00,2187.00,2187.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-29 23:59:00','104','101',2916.00,2916.00,2916.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-29 23:59:00','105','101',3645.00,3645.00,3645.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-06-30 23:59:00','101','101',730.00,730.00,730.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-06-30 23:59:00','102','101',1460.00,1460.00,1460.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-06-30 23:59:00','103','101',2190.00,2190.00,2190.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-06-30 23:59:00','104','101',2920.00,2920.00,2920.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-06-30 23:59:00','105','101',3650.00,3650.00,3650.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-01 23:59:00','101','101',731.00,731.00,731.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-01 23:59:00','102','101',1462.00,1462.00,1462.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-01 23:59:00','103','101',2193.00,2193.00,2193.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-01 23:59:00','104','101',2924.00,2924.00,2924.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-01 23:59:00','105','101',3655.00,3655.00,3655.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-02 23:59:00','101','101',732.00,732.00,732.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-02 23:59:00','102','101',1464.00,1464.00,1464.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-02 23:59:00','103','101',2196.00,2196.00,2196.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-02 23:59:00','104','101',2928.00,2928.00,2928.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-02 23:59:00','105','101',3660.00,3660.00,3660.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-03 23:59:00','101','101',733.00,733.00,733.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-03 23:59:00','102','101',1466.00,1466.00,1466.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-03 23:59:00','103','101',2199.00,2199.00,2199.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-03 23:59:00','104','101',2932.00,2932.00,2932.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-03 23:59:00','105','101',3665.00,3665.00,3665.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-04 23:59:00','101','101',734.00,734.00,734.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-04 23:59:00','102','101',1468.00,1468.00,1468.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-04 23:59:00','103','101',2202.00,2202.00,2202.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-04 23:59:00','104','101',2936.00,2936.00,2936.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-04 23:59:00','105','101',3670.00,3670.00,3670.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-05 23:59:00','101','101',735.00,735.00,735.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-05 23:59:00','102','101',1470.00,1470.00,1470.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-05 23:59:00','103','101',2205.00,2205.00,2205.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-05 23:59:00','104','101',2940.00,2940.00,2940.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-05 23:59:00','105','101',3675.00,3675.00,3675.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-06 23:59:00','101','101',736.00,736.00,736.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-06 23:59:00','102','101',1472.00,1472.00,1472.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-06 23:59:00','103','101',2208.00,2208.00,2208.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-06 23:59:00','104','101',2944.00,2944.00,2944.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-06 23:59:00','105','101',3680.00,3680.00,3680.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-07 23:59:00','101','101',737.00,737.00,737.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-07 23:59:00','102','101',1474.00,1474.00,1474.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-07 23:59:00','103','101',2211.00,2211.00,2211.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-07 23:59:00','104','101',2948.00,2948.00,2948.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-07 23:59:00','105','101',3685.00,3685.00,3685.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-08 23:59:00','101','101',738.00,738.00,738.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-08 23:59:00','102','101',1476.00,1476.00,1476.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-08 23:59:00','103','101',2214.00,2214.00,2214.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-08 23:59:00','104','101',2952.00,2952.00,2952.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-08 23:59:00','105','101',3690.00,3690.00,3690.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-09 23:59:00','101','101',739.00,739.00,739.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-09 23:59:00','102','101',1478.00,1478.00,1478.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-09 23:59:00','103','101',2217.00,2217.00,2217.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-09 23:59:00','104','101',2956.00,2956.00,2956.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-09 23:59:00','105','101',3695.00,3695.00,3695.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-10 23:59:00','101','101',740.00,740.00,740.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-10 23:59:00','102','101',1480.00,1480.00,1480.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-10 23:59:00','103','101',2220.00,2220.00,2220.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-10 23:59:00','104','101',2960.00,2960.00,2960.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-10 23:59:00','105','101',3700.00,3700.00,3700.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-11 23:59:00','101','101',741.00,741.00,741.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-11 23:59:00','102','101',1482.00,1482.00,1482.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-11 23:59:00','103','101',2223.00,2223.00,2223.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-11 23:59:00','104','101',2964.00,2964.00,2964.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-11 23:59:00','105','101',3705.00,3705.00,3705.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-12 23:59:00','101','101',742.00,742.00,742.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-12 23:59:00','102','101',1484.00,1484.00,1484.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-12 23:59:00','103','101',2226.00,2226.00,2226.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-12 23:59:00','104','101',2968.00,2968.00,2968.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-12 23:59:00','105','101',3710.00,3710.00,3710.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-13 23:59:00','101','101',743.00,743.00,743.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-13 23:59:00','102','101',1486.00,1486.00,1486.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-13 23:59:00','103','101',2229.00,2229.00,2229.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-13 23:59:00','104','101',2972.00,2972.00,2972.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-13 23:59:00','105','101',3715.00,3715.00,3715.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-14 23:59:00','101','101',744.00,744.00,744.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-14 23:59:00','102','101',1488.00,1488.00,1488.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-14 23:59:00','103','101',2232.00,2232.00,2232.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-14 23:59:00','104','101',2976.00,2976.00,2976.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-14 23:59:00','105','101',3720.00,3720.00,3720.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-15 23:59:00','101','101',745.00,745.00,745.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-15 23:59:00','102','101',1490.00,1490.00,1490.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-15 23:59:00','103','101',2235.00,2235.00,2235.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-15 23:59:00','104','101',2980.00,2980.00,2980.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-15 23:59:00','105','101',3725.00,3725.00,3725.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-16 23:59:00','101','101',746.00,746.00,746.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-16 23:59:00','102','101',1492.00,1492.00,1492.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-16 23:59:00','103','101',2238.00,2238.00,2238.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-16 23:59:00','104','101',2984.00,2984.00,2984.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-16 23:59:00','105','101',3730.00,3730.00,3730.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-17 23:59:00','101','101',747.00,747.00,747.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-17 23:59:00','102','101',1494.00,1494.00,1494.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-17 23:59:00','103','101',2241.00,2241.00,2241.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-17 23:59:00','104','101',2988.00,2988.00,2988.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-17 23:59:00','105','101',3735.00,3735.00,3735.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-18 23:59:00','101','101',748.00,748.00,748.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-18 23:59:00','102','101',1496.00,1496.00,1496.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-18 23:59:00','103','101',2244.00,2244.00,2244.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-18 23:59:00','104','101',2992.00,2992.00,2992.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-18 23:59:00','105','101',3740.00,3740.00,3740.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-19 23:59:00','101','101',749.00,749.00,749.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-19 23:59:00','102','101',1498.00,1498.00,1498.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-19 23:59:00','103','101',2247.00,2247.00,2247.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-19 23:59:00','104','101',2996.00,2996.00,2996.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-19 23:59:00','105','101',3745.00,3745.00,3745.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL),('2023-07-20 23:59:00','101','101',750.00,750.00,750.00,1.00,0.00,1.00,1.00,1.00,0.00,0.00,0.00,0.00,NULL),('2023-07-20 23:59:00','102','101',1500.00,1500.00,1500.00,2.00,0.00,2.00,2.00,2.00,0.00,0.00,0.00,0.00,NULL),('2023-07-20 23:59:00','103','101',2250.00,2250.00,2250.00,3.00,0.00,3.00,3.00,3.00,0.00,0.00,0.00,0.00,NULL),('2023-07-20 23:59:00','104','101',3000.00,3000.00,3000.00,4.00,0.00,4.00,4.00,4.00,0.00,0.00,0.00,0.00,NULL),('2023-07-20 23:59:00','105','101',3750.00,3750.00,3750.00,5.00,0.00,5.00,5.00,5.00,0.00,0.00,0.00,0.00,NULL);
/*!40000 ALTER TABLE `t_energy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_energy_setting`
--

DROP TABLE IF EXISTS `t_energy_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_energy_setting` (
  `energy_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `meter_base_date` tinyint NOT NULL,
  `energy_unit` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `conversion_factor` decimal(6,2) DEFAULT NULL,
  `noti_criteria1` smallint DEFAULT NULL,
  `noti_criteria2` smallint DEFAULT NULL,
  `noti_criteria3` smallint DEFAULT NULL,
  `etc_value` smallint DEFAULT NULL,
  `memo` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`energy_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_energy_setting`
--

LOCK TABLES `t_energy_setting` WRITE;
/*!40000 ALTER TABLE `t_energy_setting` DISABLE KEYS */;
INSERT INTO `t_energy_setting` VALUES ('elec',1,'kWh',0.00,NULL,NULL,NULL,NULL,NULL),('gas',10,'m3',0.00,NULL,NULL,NULL,NULL,NULL),('water',0,'ton',0.00,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_energy_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_energy_target`
--

DROP TABLE IF EXISTS `t_energy_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_energy_target` (
  `energy_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dong_code` varchar(4) NOT NULL,
  `ho_code` varchar(4) NOT NULL,
  `target_value` int NOT NULL,
  `insert_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`energy_type`,`dong_code`,`ho_code`),
  KEY `FK_t_energy_setting_TO_t_energy_target_1` (`energy_type`),
  CONSTRAINT `FK_t_energy_setting_TO_t_energy_target_1` FOREIGN KEY (`energy_type`) REFERENCES `t_energy_setting` (`energy_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_energy_target`
--

LOCK TABLES `t_energy_target` WRITE;
/*!40000 ALTER TABLE `t_energy_target` DISABLE KEYS */;
INSERT INTO `t_energy_target` VALUES ('elec','101','101',300,'2022-07-23 10:54:49'),('gas','101','101',111,'2022-07-23 10:55:29'),('water','101','101',10,'2022-07-23 10:04:34');
/*!40000 ALTER TABLE `t_energy_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_ev_charging_alarm_log`
--

DROP TABLE IF EXISTS `t_ev_charging_alarm_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_ev_charging_alarm_log` (
  `idx` bigint NOT NULL,
  `event_dtime` datetime NOT NULL,
  `charger_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `charger_type` char(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '완속',
  `alarm_type` char(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '충전완료',
  `send_time` datetime DEFAULT NULL,
  `send_result` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `FK_t_dongho_TO_t_ev_charging_alarm_log_1` (`ho_code`),
  KEY `FK_t_dongho_TO_t_ev_charging_alarm_log_2` (`dong_code`),
  CONSTRAINT `FK_t_dongho_TO_t_ev_charging_alarm_log_1` FOREIGN KEY (`ho_code`) REFERENCES `t_dongho` (`ho_code`),
  CONSTRAINT `FK_t_dongho_TO_t_ev_charging_alarm_log_2` FOREIGN KEY (`dong_code`) REFERENCES `t_dongho` (`dong_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ev_charging_alarm_log`
--

LOCK TABLES `t_ev_charging_alarm_log` WRITE;
/*!40000 ALTER TABLE `t_ev_charging_alarm_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_ev_charging_alarm_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_ev_charging_log`
--

DROP TABLE IF EXISTS `t_ev_charging_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_ev_charging_log` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `charger_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `charge_start_dtime` datetime NOT NULL,
  `charge_end_dtime` datetime DEFAULT NULL,
  `charge_remain_time` int DEFAULT '0',
  `charger_loc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `charger_type` char(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '완속',
  `charger_status` char(1) DEFAULT '0',
  `charge_amount` int DEFAULT '0',
  `use_fee` int DEFAULT '0',
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `FK_t_dongho_TO_t_ev_charging_log_1` (`dong_code`),
  KEY `FK_t_dongho_TO_t_ev_charging_log_2` (`ho_code`),
  CONSTRAINT `FK_t_dongho_TO_t_ev_charging_log_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dongho` (`dong_code`),
  CONSTRAINT `FK_t_dongho_TO_t_ev_charging_log_2` FOREIGN KEY (`ho_code`) REFERENCES `t_dongho` (`ho_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ev_charging_log`
--

LOCK TABLES `t_ev_charging_log` WRITE;
/*!40000 ALTER TABLE `t_ev_charging_log` DISABLE KEYS */;
INSERT INTO `t_ev_charging_log` VALUES (2,'11111111','2022-07-18 08:00:01','2022-08-25 14:05:31',100,'1번 충전기','급속','2',123,5000,'101','101'),(3,'11111111','2022-07-17 18:00:01','2022-07-17 22:00:01',100,'2번 충전기','완속','3',1233,10000,'101','101'),(4,'11111111','2022-07-16 12:00:01','2022-07-16 14:00:01',100,'1번 충전기','급속','3',1233,10000,'9999','9999');
/*!40000 ALTER TABLE `t_ev_charging_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_evacuation_ladder_noti`
--

DROP TABLE IF EXISTS `t_evacuation_ladder_noti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_evacuation_ladder_noti` (
  `인덱스` int NOT NULL,
  `noti_dong_code` varchar(4) NOT NULL,
  `send_result` char(1) DEFAULT 'N',
  `send_time` datetime DEFAULT NULL,
  `noti_ho_code` varchar(4) NOT NULL,
  `dong_code` varchar(4) NOT NULL,
  `ho_code` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_evacuation_ladder_noti`
--

LOCK TABLES `t_evacuation_ladder_noti` WRITE;
/*!40000 ALTER TABLE `t_evacuation_ladder_noti` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_evacuation_ladder_noti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_family_loc`
--

DROP TABLE IF EXISTS `t_family_loc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_family_loc` (
  `tag_id` varchar(20) NOT NULL,
  `tag_name` varchar(20) DEFAULT NULL,
  `tag_desc` varchar(20) DEFAULT NULL,
  `dong_code` varchar(4) NOT NULL,
  `ho_code` varchar(4) NOT NULL,
  `pos_desc` varchar(40) DEFAULT NULL,
  `pos_update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_family_loc`
--

LOCK TABLES `t_family_loc` WRITE;
/*!40000 ALTER TABLE `t_family_loc` DISABLE KEYS */;
INSERT INTO `t_family_loc` VALUES ('11111111','1번','아빠 태그','101','101','101 1층','2022-07-15 16:21:14'),('11111112','2번','엄마 태그','101','101','101 지하1층','2022-07-15 16:21:14'),('11111113','3번','홍참판태그','101','101','101 지하2층','2022-07-15 16:21:14');
/*!40000 ALTER TABLE `t_family_loc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_guardphone_setting_log`
--

DROP TABLE IF EXISTS `t_guardphone_setting_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_guardphone_setting_log` (
  `setting_dtime` datetime NOT NULL,
  `client_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_model_code` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `command_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_guardphone_setting_log`
--

LOCK TABLES `t_guardphone_setting_log` WRITE;
/*!40000 ALTER TABLE `t_guardphone_setting_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_guardphone_setting_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_hc_group_room`
--

DROP TABLE IF EXISTS `t_hc_group_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_hc_group_room` (
  `hc_group_id` tinyint NOT NULL,
  `room_id` tinyint NOT NULL,
  PRIMARY KEY (`hc_group_id`,`room_id`),
  KEY `FK_t_room_TO_t_hc_group_room_1` (`room_id`),
  CONSTRAINT `FK_t_home_control_group_TO_t_hc_group_room_1` FOREIGN KEY (`hc_group_id`) REFERENCES `t_home_control_group` (`hc_group_id`),
  CONSTRAINT `FK_t_room_TO_t_hc_group_room_1` FOREIGN KEY (`room_id`) REFERENCES `t_room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_hc_group_room`
--

LOCK TABLES `t_hc_group_room` WRITE;
/*!40000 ALTER TABLE `t_hc_group_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_hc_group_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_hn_call_log`
--

DROP TABLE IF EXISTS `t_hn_call_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_hn_call_log` (
  `call_dtime` datetime DEFAULT NULL,
  `caller_model_code` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `caller_dong` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `caller_ho` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `receiver_model_code` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `receiver_dong` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `receiver_ho` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_hn_call_log`
--

LOCK TABLES `t_hn_call_log` WRITE;
/*!40000 ALTER TABLE `t_hn_call_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_hn_call_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_hn_config_control_log`
--

DROP TABLE IF EXISTS `t_hn_config_control_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_hn_config_control_log` (
  `control_dtime` datetime NOT NULL,
  `client_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_model_code` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `command_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_hn_config_control_log`
--

LOCK TABLES `t_hn_config_control_log` WRITE;
/*!40000 ALTER TABLE `t_hn_config_control_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_hn_config_control_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_hn_emergency_log`
--

DROP TABLE IF EXISTS `t_hn_emergency_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_hn_emergency_log` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `occur_dtime` datetime NOT NULL,
  `occur_loc_loc` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_model_code` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `emergency_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_hn_emergency_log`
--

LOCK TABLES `t_hn_emergency_log` WRITE;
/*!40000 ALTER TABLE `t_hn_emergency_log` DISABLE KEYS */;
INSERT INTO `t_hn_emergency_log` VALUES (1,'2022-10-21 10:10:00','전체','TEST','101','101','침입','N'),(2,'2022-06-21 10:10:00','전체','TEST','101','101','침입','N');
/*!40000 ALTER TABLE `t_hn_emergency_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_hn_guardphone`
--

DROP TABLE IF EXISTS `t_hn_guardphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_hn_guardphone` (
  `idx` tinyint NOT NULL AUTO_INCREMENT,
  `guardphone__ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `guardphone_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `guardphone_gw` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `guardphone_dns` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `auth_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `auth_dtime` datetime DEFAULT NULL,
  `mac_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `alive_state` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'DEAD',
  `access_dtime` datetime DEFAULT NULL,
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `product_model_code` char(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `guardphone_id` char(16) COLLATE utf8_bin NOT NULL,
  `gaurdphone_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '1',
  PRIMARY KEY (`idx`),
  KEY `FK_t_product_model_TO_t_hn_guardphone_1` (`product_model_code`),
  CONSTRAINT `FK_t_product_model_TO_t_hn_guardphone_1` FOREIGN KEY (`product_model_code`) REFERENCES `t_product_model` (`product_model_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_hn_guardphone`
--

LOCK TABLES `t_hn_guardphone` WRITE;
/*!40000 ALTER TABLE `t_hn_guardphone` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_hn_guardphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_hn_lobbyphone`
--

DROP TABLE IF EXISTS `t_hn_lobbyphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_hn_lobbyphone` (
  `idx` smallint NOT NULL AUTO_INCREMENT,
  `lobbyphone_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lobbyphone_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lobbyphone_gw` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lobbyphone_dns` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `auth_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `auth_dtime` datetime DEFAULT NULL,
  `mac_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `alive_state` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'DEAD',
  `access_dtime` datetime DEFAULT NULL,
  `floor_num` tinyint DEFAULT '1',
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `product_model_code` char(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `line_code` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lobbyphone_id` char(16) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `FK_t_product_model_TO_t_hn_lobbyphone_1` (`product_model_code`),
  KEY `FK_t_dongline_TO_t_hn_lobbyphone_1` (`dong_code`),
  KEY `FK_t_dongline_TO_t_hn_lobbyphone_2` (`line_code`),
  CONSTRAINT `FK_t_dongline_TO_t_hn_lobbyphone_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dongline` (`dong_code`),
  CONSTRAINT `FK_t_dongline_TO_t_hn_lobbyphone_2` FOREIGN KEY (`line_code`) REFERENCES `t_dongline` (`line_code`),
  CONSTRAINT `FK_t_product_model_TO_t_hn_lobbyphone_1` FOREIGN KEY (`product_model_code`) REFERENCES `t_product_model` (`product_model_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_hn_lobbyphone`
--

LOCK TABLES `t_hn_lobbyphone` WRITE;
/*!40000 ALTER TABLE `t_hn_lobbyphone` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_hn_lobbyphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_hn_wallpad`
--

DROP TABLE IF EXISTS `t_hn_wallpad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_hn_wallpad` (
  `idx` smallint NOT NULL AUTO_INCREMENT,
  `wallpad_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `wallpad_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `wallpad_gw` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `wallpad_dns` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `auth_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `auth_dtime` datetime DEFAULT NULL,
  `mac_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `alive_state` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'DEAD',
  `access_dtime` datetime DEFAULT NULL,
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `product_model_code` char(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `wallpad_id` char(16) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `FK_t_product_model_TO_t_hn_wallpad_1` (`product_model_code`),
  KEY `FK_t_dongho_TO_t_hn_wallpad_1` (`dong_code`),
  KEY `FK_t_dongho_TO_t_hn_wallpad_2` (`ho_code`),
  CONSTRAINT `FK_t_dongho_TO_t_hn_wallpad_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dongho` (`dong_code`),
  CONSTRAINT `FK_t_dongho_TO_t_hn_wallpad_2` FOREIGN KEY (`ho_code`) REFERENCES `t_dongho` (`ho_code`),
  CONSTRAINT `FK_t_product_model_TO_t_hn_wallpad_1` FOREIGN KEY (`product_model_code`) REFERENCES `t_product_model` (`product_model_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_hn_wallpad`
--

LOCK TABLES `t_hn_wallpad` WRITE;
/*!40000 ALTER TABLE `t_hn_wallpad` DISABLE KEYS */;
INSERT INTO `t_hn_wallpad` VALUES (3,'10.10.10.11','255.255.255.0','10.10.10.1','10.10.0.1',NULL,NULL,NULL,'DEAD',NULL,NULL,'dsw001','101','101',''),(4,'10.10.10.99','255.255.255.0','10.10.10.1','10.10.0.1',NULL,NULL,NULL,'DEAD',NULL,NULL,'dsw001','9999','9999','');
/*!40000 ALTER TABLE `t_hn_wallpad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_home_control_group`
--

DROP TABLE IF EXISTS `t_home_control_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_home_control_group` (
  `hc_group_id` tinyint NOT NULL,
  `hc_group_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sort_order` tinyint NOT NULL DEFAULT '0',
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`hc_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_home_control_group`
--

LOCK TABLES `t_home_control_group` WRITE;
/*!40000 ALTER TABLE `t_home_control_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_home_control_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_home_device_type`
--

DROP TABLE IF EXISTS `t_home_device_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_home_device_type` (
  `hc_group_id` tinyint NOT NULL,
  `room_id` tinyint NOT NULL,
  `device_type` tinyint NOT NULL,
  `sub_idx` tinyint NOT NULL,
  `sub_group_id` tinyint NOT NULL,
  PRIMARY KEY (`hc_group_id`,`room_id`,`device_type`,`sub_group_id`,`sub_idx`),
  KEY `FK_t_hc_group_room_TO_t_home_device_type_2` (`room_id`),
  KEY `fk_t_device_sub_group_id_idx` (`sub_group_id`,`sub_idx`),
  CONSTRAINT `FK_t_hc_group_room_TO_t_home_device_type_1` FOREIGN KEY (`hc_group_id`) REFERENCES `t_hc_group_room` (`hc_group_id`),
  CONSTRAINT `FK_t_hc_group_room_TO_t_home_device_type_2` FOREIGN KEY (`room_id`) REFERENCES `t_hc_group_room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_home_device_type`
--

LOCK TABLES `t_home_device_type` WRITE;
/*!40000 ALTER TABLE `t_home_device_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_home_device_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_home_entry_log`
--

DROP TABLE IF EXISTS `t_home_entry_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_home_entry_log` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `occur_dtime` datetime NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `entry_method` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N',
  `insert_date` datetime DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_home_entry_log`
--

LOCK TABLES `t_home_entry_log` WRITE;
/*!40000 ALTER TABLE `t_home_entry_log` DISABLE KEYS */;
INSERT INTO `t_home_entry_log` VALUES (1,'2022-07-04 05:00:00','101','101','N','2022-07-20 19:41:26'),(2,'2022-07-05 05:00:00','101','101','N','2022-07-20 19:41:26'),(3,'2022-07-06 05:00:00','101','101','N','2022-07-20 19:41:26');
/*!40000 ALTER TABLE `t_home_entry_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_home_visit_video_log`
--

DROP TABLE IF EXISTS `t_home_visit_video_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_home_visit_video_log` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `occur_dtime` datetime NOT NULL,
  `client_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_model_code` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `file_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `file_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `command_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_home_visit_video_log`
--

LOCK TABLES `t_home_visit_video_log` WRITE;
/*!40000 ALTER TABLE `t_home_visit_video_log` DISABLE KEYS */;
INSERT INTO `t_home_visit_video_log` VALUES (1,'2022-07-01 05:00:00','127.0.0.1',NULL,'101','101','ftp://10.10.10.1','aaa.jpg',NULL,'N'),(2,'2022-07-02 05:00:00','127.0.0.1',NULL,'101','101','ftp://10.10.10.1','bbb.jpg',NULL,'N'),(3,'2022-07-03 05:00:00','127.0.0.1',NULL,'101','101','ftp://10.10.10.1','ccc.jpg',NULL,'N');
/*!40000 ALTER TABLE `t_home_visit_video_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_household_type`
--

DROP TABLE IF EXISTS `t_household_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_household_type` (
  `h_area_type` tinyint NOT NULL DEFAULT '0',
  `h_area_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sort_order` tinyint NOT NULL DEFAULT '0',
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`h_area_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_household_type`
--

LOCK TABLES `t_household_type` WRITE;
/*!40000 ALTER TABLE `t_household_type` DISABLE KEYS */;
INSERT INTO `t_household_type` VALUES (0,'구분없음',0,NULL),(30,'30평형',1,NULL),(40,'40평형',2,NULL),(50,'50평형',3,NULL);
/*!40000 ALTER TABLE `t_household_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_io_mapping`
--

DROP TABLE IF EXISTS `t_io_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_io_mapping` (
  `io_group_id` tinyint NOT NULL,
  `idx` smallint NOT NULL,
  PRIMARY KEY (`io_group_id`,`idx`),
  KEY `FK_t_hn_lobbyphone_TO_t_io_mapping_1_idx` (`idx`),
  CONSTRAINT `FK_t_hn_lobbyphone_TO_t_io_mapping_1` FOREIGN KEY (`idx`) REFERENCES `t_hn_lobbyphone` (`idx`),
  CONSTRAINT `FK_t_io_permission_group_TO_t_io_mapping_1` FOREIGN KEY (`io_group_id`) REFERENCES `t_io_permission_group` (`io_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_io_mapping`
--

LOCK TABLES `t_io_mapping` WRITE;
/*!40000 ALTER TABLE `t_io_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_io_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_io_permission_group`
--

DROP TABLE IF EXISTS `t_io_permission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_io_permission_group` (
  `io_group_id` tinyint NOT NULL,
  `io_group_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`io_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_io_permission_group`
--

LOCK TABLES `t_io_permission_group` WRITE;
/*!40000 ALTER TABLE `t_io_permission_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_io_permission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_key_contact`
--

DROP TABLE IF EXISTS `t_key_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_key_contact` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `phone_num` varchar(20) NOT NULL,
  `contact_flag` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '단지시설',
  `facility_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `insert_dtime` datetime NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_key_contact`
--

LOCK TABLES `t_key_contact` WRITE;
/*!40000 ALTER TABLE `t_key_contact` DISABLE KEYS */;
INSERT INTO `t_key_contact` VALUES (1,'010-111-1101','단지시설','관리소',NULL,'2022-07-20 08:53:37'),(2,'010-111-1102','단지시설','수영/사우나',NULL,'2022-07-20 08:53:37'),(3,'010-111-1103','단지시설','골프장',NULL,'2022-07-20 08:53:37'),(4,'010-111-1104','단지시설','유아놀이방',NULL,'2022-07-20 08:53:37'),(5,'010-111-1105','단지시설','노래방',NULL,'2022-07-20 08:53:37'),(6,'010-111-1106','단지시설','전기팀',NULL,'2022-07-20 08:53:37'),(7,'010-111-1107','단지시설','설비팀',NULL,'2022-07-20 08:53:37'),(8,'010-111-1108','단지시설','노인정',NULL,'2022-07-20 08:53:37'),(9,'010-111-1109','단지시설','대표회의실',NULL,'2022-07-20 08:53:37'),(10,'010-111-1110','단지시설','부녀회의실',NULL,'2022-07-20 08:53:37'),(11,'010-111-1111','단지시설','비상전화',NULL,'2022-07-20 08:53:37'),(12,'010-111-1112','공공기관','주민센터',NULL,'2022-07-20 08:53:37'),(13,'010-111-1113','공공기관','경찰서',NULL,'2022-07-20 08:53:37'),(14,'010-111-1114','주변상가','이마트',NULL,'2022-07-20 08:53:37'),(15,'010-111-1115','주변상가','24시 마켓',NULL,'2022-07-20 08:53:37'),(16,'010-111-1116','기타시설','중국집',NULL,'2022-07-20 08:53:37');
/*!40000 ALTER TABLE `t_key_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_lobby_entry_log`
--

DROP TABLE IF EXISTS `t_lobby_entry_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lobby_entry_log` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `occur_dtime` datetime NOT NULL,
  `lobby_id` smallint DEFAULT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `card_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `entry_method` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N',
  `insert_date` datetime DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_lobby_entry_log`
--

LOCK TABLES `t_lobby_entry_log` WRITE;
/*!40000 ALTER TABLE `t_lobby_entry_log` DISABLE KEYS */;
INSERT INTO `t_lobby_entry_log` VALUES (1,'2022-07-07 05:00:00',NULL,'101','101',NULL,'C','2022-07-20 19:41:31'),(2,'2022-07-08 05:00:00',NULL,'101','101',NULL,'P','2022-07-20 19:41:31'),(3,'2022-07-09 05:00:00',NULL,'101','101',NULL,'B','2022-07-20 19:41:31');
/*!40000 ALTER TABLE `t_lobby_entry_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_lobby_visit_video_log`
--

DROP TABLE IF EXISTS `t_lobby_visit_video_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_lobby_visit_video_log` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `occur_dtime` datetime NOT NULL,
  `client_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_model_code` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `file_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `file_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `command_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_lobby_visit_video_log`
--

LOCK TABLES `t_lobby_visit_video_log` WRITE;
/*!40000 ALTER TABLE `t_lobby_visit_video_log` DISABLE KEYS */;
INSERT INTO `t_lobby_visit_video_log` VALUES (1,'2022-07-04 05:00:00','127.0.0.1',NULL,'ftp://10.10.10.1','aaa2.jpg','101','101',NULL,'N'),(2,'2022-07-05 05:00:00','127.0.0.1',NULL,'ftp://10.10.10.1','bbb2.jpg','101','101',NULL,'N'),(3,'2022-07-06 05:00:00','127.0.0.1',NULL,'ftp://10.10.10.1','ccc2.jpg','101','101',NULL,'N');
/*!40000 ALTER TABLE `t_lobby_visit_video_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_management_fee`
--

DROP TABLE IF EXISTS `t_management_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_management_fee` (
  `mng_year` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mng_month` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mng_fee_1` int DEFAULT '0',
  `mng_fee_2` int DEFAULT NULL,
  `mng_fee_3` int DEFAULT NULL,
  `mng_fee_4` int DEFAULT NULL,
  `mng_fee_5` int DEFAULT NULL,
  `mng_fee_6` int DEFAULT NULL,
  `mng_fee_7` int DEFAULT NULL,
  `mng_fee_8` int DEFAULT NULL,
  `mng_fee_9` int DEFAULT NULL,
  `mng_fee_10` int DEFAULT NULL,
  `mng_fee_11` int DEFAULT NULL,
  `mng_fee_12` int DEFAULT NULL,
  `mng_fee_13` int DEFAULT NULL,
  `mng_fee_14` int DEFAULT NULL,
  `mng_fee_15` int DEFAULT NULL,
  `mng_fee_16` int DEFAULT NULL,
  `mng_fee_17` int DEFAULT NULL,
  `mng_fee_18` int DEFAULT NULL,
  `mng_fee_19` int DEFAULT NULL,
  `mng_fee_20` int DEFAULT NULL,
  `mng_fee_21` int DEFAULT NULL,
  `mng_fee_22` int DEFAULT NULL,
  `mng_fee_23` int DEFAULT NULL,
  `mng_fee_24` int DEFAULT NULL,
  `mng_fee_25` int DEFAULT NULL,
  `mng_fee_26` int DEFAULT NULL,
  `mng_fee_27` int DEFAULT NULL,
  `mng_fee_28` int DEFAULT NULL,
  `mng_fee_29` int DEFAULT NULL,
  `mng_fee_30` int DEFAULT NULL,
  `mng_fee_31` int DEFAULT NULL,
  `mng_fee_32` int DEFAULT NULL,
  `total_mng` int DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  PRIMARY KEY (`mng_year`,`mng_month`,`dong_code`,`ho_code`),
  KEY `FK_t_dongho_TO_t_management_fee_1_idx` (`dong_code`),
  KEY `FK_t_dongho_TO_t_management_fee_2_idx` (`ho_code`),
  CONSTRAINT `FK_t_dongho_TO_t_management_fee_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dongho` (`ho_code`),
  CONSTRAINT `FK_t_dongho_TO_t_management_fee_2` FOREIGN KEY (`ho_code`) REFERENCES `t_dongho` (`ho_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_management_fee`
--

LOCK TABLES `t_management_fee` WRITE;
/*!40000 ALTER TABLE `t_management_fee` DISABLE KEYS */;
INSERT INTO `t_management_fee` VALUES ('2021','01','101','101',1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,32496,NULL),('2021','02','101','101',1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,32528,NULL),('2021','03','101','101',1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,32560,NULL),('2021','04','101','101',1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,32592,NULL),('2021','05','101','101',1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,32624,NULL),('2021','06','101','101',1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,32656,NULL),('2021','07','101','101',1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,32688,NULL),('2021','08','101','101',1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,32720,NULL),('2021','09','101','101',1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,32752,NULL),('2021','10','101','101',1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,32784,NULL),('2021','11','101','101',1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,32816,NULL),('2021','12','101','101',1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,32848,NULL),('2022','01','101','101',1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,32880,NULL),('2022','02','101','101',1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,32912,NULL),('2022','03','101','101',1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,32944,NULL),('2022','04','101','101',1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,1046,32976,NULL),('2022','05','101','101',1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,1046,1047,33008,NULL),('2022','06','101','101',1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,1046,1047,1048,33040,NULL);
/*!40000 ALTER TABLE `t_management_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_member`
--

DROP TABLE IF EXISTS `t_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_member` (
  `ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `passwd` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `h_master_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N',
  `ho_dns` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ho_gw` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `accept_terms_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N',
  `accept_term_time` datetime DEFAULT NULL,
  `auth_method` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '월패드',
  `auth_time` timestamp NOT NULL,
  `withdraw_dtime` datetime DEFAULT NULL,
  `status` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '신청',
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_t_dongho_TO_t_member_1` (`dong_code`),
  KEY `FK_t_dongho_TO_t_member_2` (`ho_code`),
  CONSTRAINT `FK_t_dongho_TO_t_member_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dongho` (`dong_code`),
  CONSTRAINT `FK_t_dongho_TO_t_member_2` FOREIGN KEY (`ho_code`) REFERENCES `t_dongho` (`ho_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_member`
--

LOCK TABLES `t_member` WRITE;
/*!40000 ALTER TABLE `t_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_member_accept_terms`
--

DROP TABLE IF EXISTS `t_member_accept_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_member_accept_terms` (
  `mod_time` datetime NOT NULL,
  `content_1` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content_2` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content_3` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`mod_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_member_accept_terms`
--

LOCK TABLES `t_member_accept_terms` WRITE;
/*!40000 ALTER TABLE `t_member_accept_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_member_accept_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_member_access_log`
--

DROP TABLE IF EXISTS `t_member_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_member_access_log` (
  `access_time` timestamp NOT NULL,
  `ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_member_access_log`
--

LOCK TABLES `t_member_access_log` WRITE;
/*!40000 ALTER TABLE `t_member_access_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_member_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_member_app_push`
--

DROP TABLE IF EXISTS `t_member_app_push`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_member_app_push` (
  `ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `msg_item_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`,`msg_item_id`),
  KEY `FK_t_app_push_message_TO_t_member_app_push_1` (`msg_item_id`),
  CONSTRAINT `FK_t_app_push_message_TO_t_member_app_push_1` FOREIGN KEY (`msg_item_id`) REFERENCES `t_app_push_message` (`msg_item_id`),
  CONSTRAINT `FK_t_member_TO_t_member_app_push_1` FOREIGN KEY (`ID`) REFERENCES `t_member` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_member_app_push`
--

LOCK TABLES `t_member_app_push` WRITE;
/*!40000 ALTER TABLE `t_member_app_push` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_member_app_push` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_member_log`
--

DROP TABLE IF EXISTS `t_member_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_member_log` (
  `mod_time` datetime NOT NULL,
  `ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `passwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `h_master_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ho_dns` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ho_gw` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `accept_terms_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N',
  `accept_term_time` datetime DEFAULT NULL,
  `auth_method` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '월패드',
  `auth_time` timestamp NOT NULL,
  `withdraw_dtime` datetime DEFAULT NULL,
  `status` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '신청',
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `command_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_push_useflag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  PRIMARY KEY (`mod_time`,`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_member_log`
--

LOCK TABLES `t_member_log` WRITE;
/*!40000 ALTER TABLE `t_member_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_member_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_notice`
--

DROP TABLE IF EXISTS `t_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_notice` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `noti_type` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '전체',
  `noti_title` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `noti_content` text CHARACTER SET utf8 COLLATE utf8_bin,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  `noti_owner` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `send_time` datetime DEFAULT NULL,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `new_flag` char(1) NOT NULL DEFAULT 'N',
  `file_path` varchar(30) DEFAULT NULL,
  `file_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=1376407 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_notice`
--

LOCK TABLES `t_notice` WRITE;
/*!40000 ALTER TABLE `t_notice` DISABLE KEYS */;
INSERT INTO `t_notice` VALUES (1376221,'전체','1376221-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376222,'전체','1376222-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376223,'전체','1376223-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376224,'전체','1376224-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376225,'전체','1376225-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376226,'전체','1376226-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376227,'전체','1376227-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376228,'전체','1376228-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376229,'전체','1376229-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376230,'전체','1376230-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376231,'전체','1376231-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376232,'전체','1376232-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376233,'전체','1376233-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376234,'전체','1376234-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376235,'전체','1376235-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376236,'전체','1376236-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376237,'전체','1376237-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376238,'전체','1376238-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376239,'전체','1376239-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376240,'전체','1376240-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376241,'전체','1376241-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376242,'전체','1376242-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376243,'전체','1376243-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376244,'전체','1376244-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376245,'전체','1376245-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376246,'전체','1376246-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376247,'전체','1376247-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376248,'전체','1376248-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376249,'전체','1376249-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376250,'전체','1376250-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376251,'전체','1376251-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376252,'전체','1376252-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376268,'전체','1376268-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376269,'전체','1376269-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376270,'전체','1376270-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376271,'전체','1376271-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376272,'전체','1376272-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376273,'전체','1376273-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376274,'전체','1376274-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376275,'전체','1376275-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376276,'전체','1376276-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376277,'전체','1376277-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376278,'전체','1376278-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376279,'전체','1376279-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376280,'전체','1376280-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376281,'전체','1376281-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376282,'전체','1376282-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376283,'전체','1376283-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376284,'전체','1376284-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376285,'전체','1376285-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376286,'전체','1376286-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376287,'전체','1376287-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376288,'전체','1376288-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376289,'전체','1376289-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376290,'전체','1376290-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376291,'전체','1376291-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376292,'전체','1376292-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376293,'전체','1376293-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376294,'전체','1376294-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376295,'전체','1376295-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376296,'전체','1376296-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376297,'전체','1376297-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376298,'전체','1376298-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376299,'전체','1376299-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376331,'전체','1376331-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376332,'전체','1376332-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376333,'전체','1376333-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376334,'전체','1376334-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376335,'전체','1376335-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376336,'전체','1376336-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376337,'전체','1376337-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376338,'전체','1376338-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376339,'전체','1376339-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376340,'전체','1376340-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376341,'전체','1376341-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376342,'전체','1376342-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376343,'전체','1376343-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376344,'전체','1376344-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376345,'전체','1376345-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376346,'전체','1376346-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376347,'전체','1376347-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376348,'전체','1376348-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376349,'전체','1376349-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376350,'전체','1376350-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376351,'전체','1376351-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376352,'전체','1376352-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376353,'전체','1376353-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376354,'전체','1376354-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376355,'전체','1376355-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376356,'전체','1376356-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376357,'전체','1376357-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376358,'전체','1376358-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376359,'전체','1376359-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376360,'전체','1376360-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376361,'전체','1376361-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376362,'전체','1376362-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376363,'전체','1376363-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376364,'전체','1376364-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376365,'전체','1376365-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376366,'전체','1376366-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376367,'전체','1376367-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376368,'전체','1376368-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376369,'전체','1376369-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376370,'전체','1376370-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376371,'전체','1376371-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376372,'전체','1376372-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376373,'전체','1376373-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376374,'전체','1376374-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376375,'전체','1376375-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376376,'전체','1376376-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376377,'전체','1376377-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376378,'전체','1376378-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376379,'전체','1376379-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376380,'전체','1376380-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376381,'전체','1376381-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376382,'전체','1376382-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376383,'전체','1376383-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376384,'전체','1376384-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376385,'전체','1376385-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376386,'전체','1376386-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376387,'전체','1376387-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376388,'전체','1376388-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376389,'전체','1376389-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376390,'전체','1376390-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376391,'전체','1376391-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376392,'전체','1376392-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376393,'전체','1376393-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376394,'전체','1376394-공지테스트2','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-06-22 01:42:12',NULL,'9999','N',NULL,NULL),(1376395,'전체','공지테스트','테스트입니다.테스트입니다....','2022-10-21 01:10:00','2023-01-30 03:12:00','관리소','2022-08-18 22:45:47',NULL,'9999','N',NULL,NULL),(1376396,'전체','공지테스트','테스트입니다.테스트입니다....','2022-10-21 01:10:00','2023-01-30 03:12:00','관리소','2022-08-18 22:47:06',NULL,'9999','N',NULL,NULL),(1376397,'전체','공지테스트','테스트입니다.테스트입니다....','2022-10-21 01:10:00','2023-01-30 03:12:00','관리소','2022-08-18 23:05:33',NULL,'9999','N',NULL,NULL),(1376398,'전체','공지테스트','테스트입니다.테스트입니다....','2022-10-21 01:10:00','2023-01-30 03:12:00','관리소','2022-08-18 23:05:33',NULL,'9999','N',NULL,NULL),(1376399,'전체','공지테스트','테스트입니다.테스트입니다....','2022-08-19 00:07:28','2023-01-30 03:12:00','관리소','2022-08-19 00:07:28',NULL,'9999','N',NULL,NULL),(1376400,'전체','공지테스트','테스트입니다.테스트입니다....','2022-10-21 01:10:00','2023-01-30 03:12:00','관리소','2022-08-19 00:56:07',NULL,'9999','N',NULL,NULL),(1376401,'전체','공지테스트','테스트입니다.테스트입니다....','2022-08-22 22:21:09','2022-08-22 22:21:09','관리소','2022-08-22 22:21:09',NULL,'9999','Y','http://1.1.1.1/notice','testNotice.jpg'),(1376402,'전체','공지테스트','테스트입니다.테스트입니다....','2022-08-24 01:51:57','2022-08-24 01:51:57','관리소','2022-08-24 01:51:57',NULL,'9999','N',NULL,NULL),(1376403,'전체','공지테스트','테스트입니다.테스트입니다....','2022-08-24 01:51:57','2022-08-24 01:51:57','관리소','2022-08-24 01:51:57',NULL,'9999','N',NULL,NULL),(1376404,'전체','공지테스트','테스트입니다.테스트입니다....','2022-08-24 01:51:57','2022-08-24 01:51:57','관리소','2022-08-24 01:51:57',NULL,'9999','N',NULL,NULL),(1376405,'전체','공지테스트','테스트입니다.테스트입니다....','2022-08-24 01:51:57','2022-08-24 01:51:57','관리소','2022-08-24 01:51:57',NULL,'9999','N',NULL,NULL),(1376406,'전체','공지테스트','테스트입니다.테스트입니다....','2022-06-21 01:10:00','2022-09-30 03:12:00','관리소','2022-08-29 21:51:20',NULL,'9999','Y','http://1.1.1.1/notice','testNotice.jpg');
/*!40000 ALTER TABLE `t_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_notice_send`
--

DROP TABLE IF EXISTS `t_notice_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_notice_send` (
  `idx` bigint NOT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `send_time` datetime DEFAULT NULL,
  `send_result` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N',
  PRIMARY KEY (`idx`,`ho_code`,`dong_code`),
  KEY `FK_t_dongho_TO_t_notice_send_1` (`ho_code`),
  KEY `FK_t_dongho_TO_t_notice_send_2` (`dong_code`),
  CONSTRAINT `FK_t_dongho_TO_t_notice_send_1` FOREIGN KEY (`ho_code`) REFERENCES `t_dongho` (`ho_code`),
  CONSTRAINT `FK_t_dongho_TO_t_notice_send_2` FOREIGN KEY (`dong_code`) REFERENCES `t_dongho` (`dong_code`),
  CONSTRAINT `fk_t_notice_to_t_notice_send` FOREIGN KEY (`idx`) REFERENCES `t_notice` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_notice_send`
--

LOCK TABLES `t_notice_send` WRITE;
/*!40000 ALTER TABLE `t_notice_send` DISABLE KEYS */;
INSERT INTO `t_notice_send` VALUES (1376221,'101','101',NULL,'N'),(1376222,'101','101',NULL,'N'),(1376223,'101','101',NULL,'N'),(1376224,'101','101',NULL,'N'),(1376225,'101','101',NULL,'N'),(1376226,'101','101',NULL,'N'),(1376227,'101','101',NULL,'N'),(1376228,'101','101',NULL,'N'),(1376229,'101','101',NULL,'N'),(1376230,'101','101',NULL,'N'),(1376231,'101','101',NULL,'N'),(1376232,'101','101',NULL,'N'),(1376233,'101','101',NULL,'N'),(1376234,'101','101',NULL,'N'),(1376235,'101','101',NULL,'N'),(1376236,'101','101',NULL,'N'),(1376237,'101','101',NULL,'N'),(1376238,'101','101',NULL,'N'),(1376239,'101','101',NULL,'N'),(1376240,'101','101',NULL,'N'),(1376241,'101','101',NULL,'N'),(1376242,'101','101',NULL,'N'),(1376243,'101','101',NULL,'N'),(1376244,'101','101',NULL,'N'),(1376245,'101','101',NULL,'N'),(1376246,'101','101',NULL,'N'),(1376247,'101','101',NULL,'N'),(1376248,'101','101',NULL,'N'),(1376249,'101','101',NULL,'N'),(1376250,'101','101',NULL,'N'),(1376251,'101','101',NULL,'N'),(1376252,'101','101',NULL,'N'),(1376268,'101','101',NULL,'N'),(1376269,'101','101',NULL,'N'),(1376270,'101','101',NULL,'N'),(1376271,'101','101',NULL,'N'),(1376272,'101','101',NULL,'N'),(1376273,'101','101',NULL,'N'),(1376274,'101','101',NULL,'N'),(1376275,'101','101',NULL,'N'),(1376276,'101','101',NULL,'N'),(1376277,'101','101',NULL,'N'),(1376278,'101','101',NULL,'N'),(1376279,'101','101',NULL,'N'),(1376280,'101','101',NULL,'N'),(1376281,'101','101',NULL,'N'),(1376282,'101','101',NULL,'N'),(1376283,'101','101',NULL,'N'),(1376284,'101','101',NULL,'N'),(1376285,'101','101',NULL,'N'),(1376286,'101','101',NULL,'N'),(1376287,'101','101',NULL,'N'),(1376288,'101','101',NULL,'N'),(1376289,'101','101',NULL,'N'),(1376290,'101','101',NULL,'N'),(1376291,'101','101',NULL,'N'),(1376292,'101','101',NULL,'N'),(1376293,'101','101',NULL,'N'),(1376294,'101','101',NULL,'N'),(1376295,'101','101',NULL,'N'),(1376296,'101','101',NULL,'N'),(1376297,'101','101',NULL,'N'),(1376298,'101','101',NULL,'N'),(1376299,'101','101',NULL,'N'),(1376331,'101','101',NULL,'N'),(1376332,'101','101',NULL,'N'),(1376333,'101','101',NULL,'N'),(1376334,'101','101',NULL,'N'),(1376335,'101','101',NULL,'N'),(1376336,'101','101',NULL,'N'),(1376337,'101','101',NULL,'N'),(1376338,'101','101',NULL,'N'),(1376339,'101','101',NULL,'N'),(1376340,'101','101',NULL,'N'),(1376341,'101','101',NULL,'N'),(1376342,'101','101',NULL,'N'),(1376343,'101','101',NULL,'N'),(1376344,'101','101',NULL,'N'),(1376345,'101','101',NULL,'N'),(1376346,'101','101',NULL,'N'),(1376347,'101','101',NULL,'N'),(1376348,'101','101',NULL,'N'),(1376349,'101','101',NULL,'N'),(1376350,'101','101',NULL,'N'),(1376351,'101','101',NULL,'N'),(1376352,'101','101',NULL,'N'),(1376353,'101','101',NULL,'N'),(1376354,'101','101',NULL,'N'),(1376355,'101','101',NULL,'N'),(1376356,'101','101',NULL,'N'),(1376357,'101','101',NULL,'N'),(1376358,'101','101',NULL,'N'),(1376359,'101','101',NULL,'N'),(1376360,'101','101',NULL,'N'),(1376361,'101','101',NULL,'N'),(1376362,'101','101',NULL,'N'),(1376363,'101','101',NULL,'N'),(1376364,'101','101',NULL,'N'),(1376365,'101','101',NULL,'N'),(1376366,'101','101',NULL,'N'),(1376367,'101','101',NULL,'N'),(1376368,'101','101',NULL,'N'),(1376369,'101','101',NULL,'N'),(1376370,'101','101',NULL,'N'),(1376371,'101','101',NULL,'N'),(1376372,'101','101',NULL,'N'),(1376373,'101','101',NULL,'N'),(1376374,'101','101',NULL,'N'),(1376375,'101','101',NULL,'N'),(1376376,'101','101',NULL,'N'),(1376377,'101','101',NULL,'N'),(1376378,'101','101',NULL,'N'),(1376379,'101','101',NULL,'N'),(1376380,'101','101',NULL,'N'),(1376381,'101','101',NULL,'N'),(1376382,'101','101',NULL,'N'),(1376383,'101','101',NULL,'N'),(1376384,'101','101',NULL,'N'),(1376385,'101','101',NULL,'N'),(1376386,'101','101',NULL,'N'),(1376387,'101','101',NULL,'N'),(1376388,'101','101',NULL,'N'),(1376389,'101','101',NULL,'N'),(1376390,'101','101',NULL,'N'),(1376391,'101','101',NULL,'N'),(1376392,'101','101',NULL,'N'),(1376393,'101','101',NULL,'N'),(1376394,'101','101',NULL,'N'),(1376395,'101','101',NULL,'N'),(1376396,'101','101',NULL,'N'),(1376397,'101','101',NULL,'N'),(1376398,'101','101',NULL,'N'),(1376399,'101','101',NULL,'N'),(1376400,'101','101',NULL,'N'),(1376401,'101','101',NULL,'Y'),(1376402,'101','101',NULL,'Y'),(1376403,'101','101',NULL,'N'),(1376404,'101','101',NULL,'Y'),(1376405,'101','101',NULL,'Y');
/*!40000 ALTER TABLE `t_notice_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_organization_code`
--

DROP TABLE IF EXISTS `t_organization_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_organization_code` (
  `org_code` tinyint NOT NULL,
  `org_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sort_order` tinyint NOT NULL DEFAULT '0',
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`org_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_organization_code`
--

LOCK TABLES `t_organization_code` WRITE;
/*!40000 ALTER TABLE `t_organization_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_organization_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_parking_io`
--

DROP TABLE IF EXISTS `t_parking_io`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_parking_io` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `car_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `inout_flag` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '입차',
  `inout_dtime` datetime NOT NULL,
  `car_flag` char(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '세대',
  `send_time` datetime DEFAULT NULL,
  `send_result` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N',
  PRIMARY KEY (`idx`),
  KEY `FK_t_dongho_TO_t_parking_io_1` (`dong_code`),
  KEY `FK_t_dongho_TO_t_parking_io_2` (`ho_code`),
  CONSTRAINT `FK_t_dongho_TO_t_parking_io_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dongho` (`dong_code`),
  CONSTRAINT `FK_t_dongho_TO_t_parking_io_2` FOREIGN KEY (`ho_code`) REFERENCES `t_dongho` (`ho_code`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_parking_io`
--

LOCK TABLES `t_parking_io` WRITE;
/*!40000 ALTER TABLE `t_parking_io` DISABLE KEYS */;
INSERT INTO `t_parking_io` VALUES (1,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(2,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(3,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(4,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(5,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(6,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(7,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(8,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(9,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(10,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(11,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(12,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(14,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(15,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(16,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(17,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(18,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(19,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(20,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(21,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(22,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(23,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(24,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(25,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(29,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(30,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(31,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(32,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(33,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(34,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(35,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(36,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(37,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(38,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(39,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(40,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(41,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(42,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(43,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(44,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(45,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(46,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(47,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(48,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(49,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(50,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(51,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(52,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(60,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(61,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(62,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(63,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(64,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(65,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(66,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(67,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(68,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(69,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(70,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(71,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(72,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(73,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(74,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(75,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(76,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(77,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(78,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(79,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(80,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(81,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(82,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(83,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(84,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(85,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(86,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(87,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(88,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(89,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(90,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(91,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(92,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(93,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(94,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(95,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(96,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(97,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(98,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(99,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(100,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(101,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(102,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(103,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(104,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(105,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(106,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(107,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(123,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(124,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(125,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(126,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(127,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(128,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(129,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(130,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(131,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(132,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(133,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(134,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(135,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(136,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(137,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(138,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(139,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(140,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(141,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(142,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(143,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(144,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(145,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(146,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(147,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(148,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(149,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(150,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(151,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(152,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(153,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(154,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(155,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(156,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(157,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(158,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(159,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(160,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(161,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(162,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(163,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(164,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(165,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(166,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(167,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(168,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(169,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(170,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(171,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(172,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(173,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(174,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(175,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(176,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(177,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(178,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(179,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(180,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(181,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(182,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(183,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(184,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(185,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(186,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(187,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(188,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(189,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(190,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(191,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(192,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(193,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(194,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(195,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(196,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(197,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(198,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(199,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(200,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(201,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(202,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(203,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(204,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(205,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(206,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(207,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(208,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(209,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(210,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(211,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(212,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(213,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(214,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(215,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N'),(216,'1가1111','101','101','입차','2022-06-24 11:10:32','세대',NULL,'N'),(217,'1가1111','101','101','출차','2022-06-24 11:10:32','세대',NULL,'N'),(218,'9가9999','101','101','입차','2022-06-24 11:10:32','방문',NULL,'N');
/*!40000 ALTER TABLE `t_parking_io` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_parking_loc`
--

DROP TABLE IF EXISTS `t_parking_loc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_parking_loc` (
  `idx` bigint NOT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tag_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tag_desc` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pos_x` int DEFAULT NULL,
  `pos_y` int DEFAULT NULL,
  `floor_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pos_desc` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `floor_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `building_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pos_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `FK_t_dongho_TO_t_parking_loc_1` (`dong_code`),
  KEY `FK_t_dongho_TO_t_parking_loc_2` (`ho_code`),
  CONSTRAINT `FK_t_dongho_TO_t_parking_loc_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dongho` (`dong_code`),
  CONSTRAINT `FK_t_dongho_TO_t_parking_loc_2` FOREIGN KEY (`ho_code`) REFERENCES `t_dongho` (`ho_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_parking_loc`
--

LOCK TABLES `t_parking_loc` WRITE;
/*!40000 ALTER TABLE `t_parking_loc` DISABLE KEYS */;
INSERT INTO `t_parking_loc` VALUES (1,'장민호','1012359','아들태그','101','101',200,150,'1F','1층 로비','1층','101동','2022-08-24 07:56:40');
/*!40000 ALTER TABLE `t_parking_loc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_parking_resv`
--

DROP TABLE IF EXISTS `t_parking_resv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_parking_resv` (
  `resv_no` int NOT NULL AUTO_INCREMENT,
  `vis_start_date` datetime NOT NULL,
  `vis_end_date` datetime NOT NULL,
  `car_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `resv_method` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'W',
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `resv_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N',
  `collect_dtime` datetime DEFAULT NULL,
  `inout_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N',
  PRIMARY KEY (`resv_no`),
  KEY `FK_t_dongho_TO_t_parking_resv_1` (`dong_code`),
  KEY `FK_t_dongho_TO_t_parking_resv_2` (`ho_code`),
  CONSTRAINT `FK_t_dongho_TO_t_parking_resv_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dongho` (`dong_code`),
  CONSTRAINT `FK_t_dongho_TO_t_parking_resv_2` FOREIGN KEY (`ho_code`) REFERENCES `t_dongho` (`ho_code`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_parking_resv`
--

LOCK TABLES `t_parking_resv` WRITE;
/*!40000 ALTER TABLE `t_parking_resv` DISABLE KEYS */;
INSERT INTO `t_parking_resv` VALUES (7,'2022-06-30 00:00:00','2022-07-01 00:00:00','1허1111','W','101','101','N',NULL,'N'),(8,'2022-07-01 00:00:00','2022-07-02 00:00:00','1허1111','W','101','101','N',NULL,'N'),(9,'2022-07-02 00:00:00','2022-07-03 00:00:00','1허1111','W','101','101','N',NULL,'N'),(10,'2022-07-03 00:00:00','2022-07-04 00:00:00','1허1111','W','101','101','N',NULL,'N'),(11,'2022-07-04 00:00:00','2022-07-05 00:00:00','1허1111','W','101','101','N',NULL,'N'),(50,'2022-06-29 00:00:00','2022-06-30 00:00:00','1가1269','W','101','101','N',NULL,'N');
/*!40000 ALTER TABLE `t_parking_resv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_parking_resv_conf`
--

DROP TABLE IF EXISTS `t_parking_resv_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_parking_resv_conf` (
  `month_max_day` tinyint NOT NULL DEFAULT '0',
  `max_num_per_day` tinyint NOT NULL DEFAULT '0',
  `max_day_per_num` tinyint NOT NULL DEFAULT '0',
  `reservation_period` tinyint NOT NULL,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mod_dtime` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_parking_resv_conf`
--

LOCK TABLES `t_parking_resv_conf` WRITE;
/*!40000 ALTER TABLE `t_parking_resv_conf` DISABLE KEYS */;
INSERT INTO `t_parking_resv_conf` VALUES (15,3,2,7,'test','2022-06-29 12:23:37');
/*!40000 ALTER TABLE `t_parking_resv_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_parking_resv_his`
--

DROP TABLE IF EXISTS `t_parking_resv_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_parking_resv_his` (
  `insert_dtime` datetime NOT NULL,
  `resv_no` int NOT NULL,
  `vis_start_date` datetime NOT NULL,
  `vis_end_date` datetime NOT NULL,
  `car_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `resv_method` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'W',
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `resv_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N',
  `collect_dtime` datetime DEFAULT NULL,
  `inout_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N',
  PRIMARY KEY (`insert_dtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_parking_resv_his`
--

LOCK TABLES `t_parking_resv_his` WRITE;
/*!40000 ALTER TABLE `t_parking_resv_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_parking_resv_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_permission_group`
--

DROP TABLE IF EXISTS `t_permission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_permission_group` (
  `p_group_id` tinyint NOT NULL,
  `p_group_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`p_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_permission_group`
--

LOCK TABLES `t_permission_group` WRITE;
/*!40000 ALTER TABLE `t_permission_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_permission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_prevent_setting_log`
--

DROP TABLE IF EXISTS `t_prevent_setting_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_prevent_setting_log` (
  `setting_dtime` datetime NOT NULL,
  `client_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_model_code` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `command_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_prevent_setting_log`
--

LOCK TABLES `t_prevent_setting_log` WRITE;
/*!40000 ALTER TABLE `t_prevent_setting_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_prevent_setting_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_product_model`
--

DROP TABLE IF EXISTS `t_product_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_product_model` (
  `product_model_code` char(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_model_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_type_id` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_info` varchar(50) DEFAULT NULL,
  `local_server_ip` varchar(20) DEFAULT NULL,
  `local_server_port` smallint DEFAULT NULL,
  `gw_server_ip` varchar(20) DEFAULT NULL,
  `gw_server_port` smallint DEFAULT NULL,
  `api_server_ip` varchar(20) DEFAULT NULL,
  `api_server_port` smallint DEFAULT NULL,
  `sip_server_ip` varchar(20) DEFAULT NULL,
  `sip_server_port` smallint DEFAULT NULL,
  `sftp_server_ip` varchar(20) DEFAULT NULL,
  `sftp_server_port` smallint DEFAULT NULL,
  `guard_phone_ip` varchar(20) DEFAULT NULL,
  `gaurd_phone_port` smallint DEFAULT NULL,
  `mngoffice_phone_ip` varchar(20) DEFAULT NULL,
  `mngoffice_phone_port` smallint DEFAULT NULL,
  `notice_flag` char(1) DEFAULT '0',
  `management_fee_flag` char(1) DEFAULT '0',
  `delivery_info_flag` char(1) DEFAULT '0',
  `parking_info_flag` char(1) DEFAULT '0',
  `parking_resv_flag` char(1) DEFAULT '0',
  `elevator_call_flag` char(1) DEFAULT '0',
  `location_flag` char(1) DEFAULT '0',
  `location_car_flag` char(1) DEFAULT '0',
  `ev_charging_flag` char(1) DEFAULT '0',
  `cctv_flag` char(1) DEFAULT '0',
  `repair_request_flag` char(1) DEFAULT '0',
  `vote_flag` char(1) DEFAULT '0',
  `key_contract_flag` char(1) DEFAULT '0',
  `ems_flag` char(1) DEFAULT '0',
  `midi_vol_emergency` tinyint DEFAULT NULL,
  `midi_vol_normal` tinyint DEFAULT NULL,
  `sftp_id` varchar(20) DEFAULT NULL,
  `sftp_pwd` varchar(20) DEFAULT NULL,
  `init_file_path` varchar(100) DEFAULT NULL,
  `init_file_name` varchar(20) DEFAULT NULL,
  `init_file_encoding` char(1) DEFAULT '0',
  PRIMARY KEY (`product_model_code`),
  KEY `FK_t_product_type_TO_t_product_model_1` (`product_type_id`),
  CONSTRAINT `FK_t_product_type_TO_t_product_model_1` FOREIGN KEY (`product_type_id`) REFERENCES `t_product_type` (`product_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_product_model`
--

LOCK TABLES `t_product_model` WRITE;
/*!40000 ALTER TABLE `t_product_model` DISABLE KEYS */;
INSERT INTO `t_product_model` VALUES ('dsw001','대성월패드','W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','0','0','0','0','0','0','0','0','0','0',NULL,NULL,NULL,NULL,NULL,NULL,'0');
/*!40000 ALTER TABLE `t_product_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_product_type`
--

DROP TABLE IF EXISTS `t_product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_product_type` (
  `product_type_id` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sort_order` tinyint NOT NULL DEFAULT '0',
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`product_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_product_type`
--

LOCK TABLES `t_product_type` WRITE;
/*!40000 ALTER TABLE `t_product_type` DISABLE KEYS */;
INSERT INTO `t_product_type` VALUES ('G','경비실기',3,NULL),('L','로비폰',2,NULL),('W','월패드',1,NULL);
/*!40000 ALTER TABLE `t_product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_program_code`
--

DROP TABLE IF EXISTS `t_program_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_program_code` (
  `menu_id` tinyint NOT NULL,
  `menu_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sort_order` tinyint NOT NULL DEFAULT '1',
  `sort_order2` tinyint NOT NULL DEFAULT '1',
  `sort_order3` tinyint NOT NULL DEFAULT '1',
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_program_code`
--

LOCK TABLES `t_program_code` WRITE;
/*!40000 ALTER TABLE `t_program_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_program_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_program_per_group`
--

DROP TABLE IF EXISTS `t_program_per_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_program_per_group` (
  `permission_group_id` tinyint NOT NULL,
  `menu_id` tinyint NOT NULL,
  `parh_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `file_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`permission_group_id`,`menu_id`),
  KEY `FK_t_program_code_TO_t_program_per_group_1` (`menu_id`),
  CONSTRAINT `FK_t_permission_group_TO_t_program_per_group_1` FOREIGN KEY (`permission_group_id`) REFERENCES `t_permission_group` (`p_group_id`),
  CONSTRAINT `FK_t_program_code_TO_t_program_per_group_1` FOREIGN KEY (`menu_id`) REFERENCES `t_program_code` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_program_per_group`
--

LOCK TABLES `t_program_per_group` WRITE;
/*!40000 ALTER TABLE `t_program_per_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_program_per_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_room`
--

DROP TABLE IF EXISTS `t_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_room` (
  `room_id` tinyint NOT NULL,
  `room__name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `room_alias` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sort_order` tinyint NOT NULL DEFAULT '0',
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_room`
--

LOCK TABLES `t_room` WRITE;
/*!40000 ALTER TABLE `t_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_section_volume`
--

DROP TABLE IF EXISTS `t_section_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_section_volume` (
  `section_id` tinyint NOT NULL,
  `product_model_code` char(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ANA0` tinyint DEFAULT NULL,
  `ANA1` tinyint DEFAULT NULL,
  `SIN` tinyint DEFAULT NULL,
  `SOUT` tinyint DEFAULT NULL,
  `ROUT` tinyint DEFAULT NULL,
  `NR` tinyint DEFAULT NULL,
  `AGC` tinyint DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `FK_t_product_model_TO_t_section_volumn_1_idx` (`product_model_code`),
  CONSTRAINT `FK_t_product_model_TO_t_section_volume_1` FOREIGN KEY (`product_model_code`) REFERENCES `t_product_model` (`product_model_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_section_volume`
--

LOCK TABLES `t_section_volume` WRITE;
/*!40000 ALTER TABLE `t_section_volume` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_section_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_server_access_log`
--

DROP TABLE IF EXISTS `t_server_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_server_access_log` (
  `access_dtime` datetime NOT NULL,
  `client_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_model_code` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mac_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_server_access_log`
--

LOCK TABLES `t_server_access_log` WRITE;
/*!40000 ALTER TABLE `t_server_access_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_server_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_set_management_fee`
--

DROP TABLE IF EXISTS `t_set_management_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_set_management_fee` (
  `mng_fee_item` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mng_fee_alias` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mng_fee_order` tinyint NOT NULL,
  PRIMARY KEY (`mng_fee_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_set_management_fee`
--

LOCK TABLES `t_set_management_fee` WRITE;
/*!40000 ALTER TABLE `t_set_management_fee` DISABLE KEYS */;
INSERT INTO `t_set_management_fee` VALUES ('mng_fee_1','일반관리비',1),('mng_fee_10','대표회의운영비',10),('mng_fee_11','선거관리위원회운영비',11),('mng_fee_12','안전진단비실시비용',12),('mng_fee_13','정화조오물수수료',13),('mng_fee_14','생활폐기물수수료',14),('mng_fee_15','건물보험료',15),('mng_fee_16','공용시설보수비',16),('mng_fee_17','공동난방비',17),('mng_fee_18','공동급탕비',18),('mng_fee_19','공동가스료',19),('mng_fee_2','청소비',2),('mng_fee_20','공동전기료',20),('mng_fee_21','공동수도료',21),('mng_fee_22','세대전기료',22),('mng_fee_23','세대수도료',23),('mng_fee_24','세대가스료',24),('mng_fee_25','세대난방비',25),('mng_fee_26','세대급탕비',26),('mng_fee_27','TV수신료',27),('mng_fee_28','기타관리비1',28),('mng_fee_29','기타관리비2',29),('mng_fee_3','경비비',3),('mng_fee_30','기타관리비3',30),('mng_fee_31','기타관리비4',31),('mng_fee_32','기타관리비5',32),('mng_fee_4','소독비',4),('mng_fee_5','승강기유지비',5),('mng_fee_6','홈네트워크 설치유지비',6),('mng_fee_7','수선유지비',7),('mng_fee_8','장기수선충당금',8),('mng_fee_9','위탁관리수수료',9),('total_mng','당월관리비',33);
/*!40000 ALTER TABLE `t_set_management_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_system_type`
--

DROP TABLE IF EXISTS `t_system_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_system_type` (
  `system_type_id` tinyint NOT NULL,
  `system_type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sort_order` tinyint NOT NULL DEFAULT '0',
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `use_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`system_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_system_type`
--

LOCK TABLES `t_system_type` WRITE;
/*!40000 ALTER TABLE `t_system_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_system_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_pass` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `gender_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '구분없음',
  `tel_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `memo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `p_group_id` tinyint NOT NULL,
  `org_code` tinyint NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_t_permission_group_TO_t_user_1` (`p_group_id`),
  KEY `FK_t_organization_code_TO_t_user_1` (`org_code`),
  CONSTRAINT `FK_t_organization_code_TO_t_user_1` FOREIGN KEY (`org_code`) REFERENCES `t_organization_code` (`org_code`),
  CONSTRAINT `FK_t_permission_group_TO_t_user_1` FOREIGN KEY (`p_group_id`) REFERENCES `t_permission_group` (`p_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_access_log`
--

DROP TABLE IF EXISTS `t_user_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_access_log` (
  `access_time` timestamp NOT NULL,
  `user_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_access_log`
--

LOCK TABLES `t_user_access_log` WRITE;
/*!40000 ALTER TABLE `t_user_access_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_vote_agenda`
--

DROP TABLE IF EXISTS `t_vote_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_vote_agenda` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `vote_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `vote_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `v_start_dtime` datetime NOT NULL,
  `v_end_dtime` datetime NOT NULL,
  `insert_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `vote_end_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'N',
  `subjects_num` int DEFAULT '0',
  `participation_num` int DEFAULT '0',
  `vote_rate` tinyint DEFAULT '0',
  `fin_end_dtime` datetime DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_vote_agenda`
--

LOCK TABLES `t_vote_agenda` WRITE;
/*!40000 ALTER TABLE `t_vote_agenda` DISABLE KEYS */;
INSERT INTO `t_vote_agenda` VALUES (1,'우리아파트 동대표 선거 건','2022년도 동대표를 선출합니다. 꼭투표해 주세요!!!','2022-01-01 08:00:00','2022-01-10 18:00:00','2022-07-19 16:20:16','tester','Y',10,5,50,'2022-01-11 18:00:00'),(2,'관리회사 변경 건','관리회사의 계약기간이 완료될 예정입니다. 꼭투표해 주세요!!!','2022-05-01 08:00:00','2022-05-11 08:00:00','2022-07-19 16:20:16','tester','Y',10,9,90,'2022-01-11 18:00:00'),(3,'우리아파트 동대표 보궐선거 건','101동 동대표 사임으로 재선거를 실시합니다.. 꼭투표해 주세요!!!','2022-07-19 08:00:00','2022-07-31 08:00:00','2022-07-19 16:20:16','tester','N',10,0,0,'2022-01-11 18:00:00');
/*!40000 ALTER TABLE `t_vote_agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_vote_items`
--

DROP TABLE IF EXISTS `t_vote_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_vote_items` (
  `item_no` tinyint NOT NULL,
  `idx` int NOT NULL,
  `item_content` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `votes_number` int DEFAULT '0',
  `votes_number_off` int DEFAULT '0',
  `insert_date` datetime NOT NULL,
  PRIMARY KEY (`item_no`,`idx`),
  KEY `FK_t_vote_agenda_TO_t_vote_items_1_idx` (`idx`),
  CONSTRAINT `FK_t_vote_agenda_TO_t_vote_items_1` FOREIGN KEY (`idx`) REFERENCES `t_vote_agenda` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_vote_items`
--

LOCK TABLES `t_vote_items` WRITE;
/*!40000 ALTER TABLE `t_vote_items` DISABLE KEYS */;
INSERT INTO `t_vote_items` VALUES (1,1,'일길동',2,1,'2022-07-19 16:40:23'),(1,2,'타워피엠씨',2,1,'2022-07-19 16:43:30'),(1,3,'삼용이',2,1,'2022-07-19 16:44:29'),(2,1,'이길동',2,1,'2022-07-19 16:40:23'),(2,2,'우리관리',2,1,'2022-07-19 16:43:30'),(2,3,'반대파',2,1,'2022-07-19 16:44:29'),(3,1,'삼길동',1,1,'2022-07-19 16:40:23'),(3,2,'신안관리',1,1,'2022-07-19 16:43:30'),(4,1,'사길동',1,1,'2022-07-19 16:40:23'),(4,2,'아파트관리',1,1,'2022-07-19 16:43:30'),(5,1,'오길동',0,0,'2022-07-19 16:40:23'),(5,2,'변경안함',0,0,'2022-07-19 16:43:30');
/*!40000 ALTER TABLE `t_vote_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_voters`
--

DROP TABLE IF EXISTS `t_voters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_voters` (
  `idx` int NOT NULL,
  `dong_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ho_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `vote_datetime` datetime NOT NULL,
  `vote_method` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'W',
  `choice_item_no` tinyint NOT NULL,
  PRIMARY KEY (`idx`,`dong_code`,`ho_code`),
  KEY `FK_t_dongho_TO_t_voters_1` (`dong_code`),
  KEY `FK_t_dongho_TO_t_voters_2` (`ho_code`),
  CONSTRAINT `FK_t_dongho_TO_t_voters_1` FOREIGN KEY (`dong_code`) REFERENCES `t_dongho` (`dong_code`),
  CONSTRAINT `FK_t_dongho_TO_t_voters_2` FOREIGN KEY (`ho_code`) REFERENCES `t_dongho` (`ho_code`),
  CONSTRAINT `FK_t_vote_agenda_TO_t_voters_1` FOREIGN KEY (`idx`) REFERENCES `t_vote_agenda` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_voters`
--

LOCK TABLES `t_voters` WRITE;
/*!40000 ALTER TABLE `t_voters` DISABLE KEYS */;
INSERT INTO `t_voters` VALUES (1,'101','101','2022-07-19 17:23:36','W',1);
/*!40000 ALTER TABLE `t_voters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_wather`
--

DROP TABLE IF EXISTS `t_wather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_wather` (
  `grid_x` smallint NOT NULL,
  `grid_y` smallint NOT NULL,
  `data_seq` tinyint NOT NULL,
  `town_forecast` tinyint DEFAULT NULL,
  `forecast_day` tinyint DEFAULT NULL,
  `now_time_temp` decimal(4,1) DEFAULT NULL,
  `day_max_temp` decimal(4,1) DEFAULT NULL,
  `day_min_temp` decimal(4,1) DEFAULT NULL,
  `sky` tinyint DEFAULT NULL,
  `pty` tinyint DEFAULT NULL,
  `wf_kor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `wf_en` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pop` smallint DEFAULT NULL,
  `reh` smallint DEFAULT NULL,
  `ws` decimal(4,1) DEFAULT NULL,
  `wd` tinyint DEFAULT NULL,
  `wd_kor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `wd_en` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `r12` decimal(4,1) DEFAULT NULL,
  `s12` decimal(4,1) DEFAULT NULL,
  `r06` decimal(4,1) DEFAULT NULL,
  `s06` decimal(4,1) DEFAULT NULL,
  PRIMARY KEY (`grid_x`,`grid_y`,`data_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_wather`
--

LOCK TABLES `t_wather` WRITE;
/*!40000 ALTER TABLE `t_wather` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_wather` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_weather_setup`
--

DROP TABLE IF EXISTS `t_weather_setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_weather_setup` (
  `division` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'kor',
  `administrative division` char(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `large_area` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `medium_area` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `small_area` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `grid_x` smallint DEFAULT NULL,
  `grid_y` smallint DEFAULT NULL,
  `longitude_d` smallint DEFAULT NULL,
  `longitude_m` smallint DEFAULT NULL,
  `longitude_s` smallint DEFAULT NULL,
  `latitude_d` smallint DEFAULT NULL,
  `latitude_m` smallint DEFAULT NULL,
  `latitude_s` smallint DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `update_dtime` datetime DEFAULT NULL,
  `seup` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'N',
  PRIMARY KEY (`division`,`administrative division`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_weather_setup`
--

LOCK TABLES `t_weather_setup` WRITE;
/*!40000 ALTER TABLE `t_weather_setup` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_weather_setup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'complexdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `getMonthEnergyUse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMonthEnergyUse`(
	energyType VARCHAR(10), reqYear CHAR(4), reqMonth CHAR(2), dongCode varchar(4), hoCode varchar(4)
)
BEGIN
SET @selectFlag = 'Y';
SET @energyType = energyType;
SET @reqYear = reqYear;
SET @reqMonth = reqMonth;
SET @dongCode = dongCode;
SET @hoCode = hoCode;

call spMonthEnergyUse (@selectFlag, @energyType, @reqYear,@reqMonth,@dongCode, @hoCode, 
@monthUsage, @sameAreaUsage, @prevMonthUsage, @prevYearSameMonthUsage,
@forecastUsage, @targetUsage, @mySavingRankingArea, @mySavingRankingAll,
@startDtime, @endDtime);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDayEnergyUseByMonth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDayEnergyUseByMonth`(
	energyType VARCHAR(10), reqYear CHAR(4), reqMonth CHAR(2), dongCode varchar(4), hoCode varchar(4))
BEGIN

DECLARE i INT;
SET i = 1;

SET @energyType = energyType;
SET @reqYear = reqYear;
SET @reqMonth = reqMonth;
SET @dongCode = dongCode;
SET @hoCode = hoCode;

SET @baseDate = (SELECT meter_base_date FROM t_energy_setting WHERE energy_type = @energyType);
SET @baseDate = IFNULL(@baseDate, 1);
#select @baseDate;
-- select cast(DATE_FORMAT(energy_dtime, '%d') as signed) from t_energy;
SET @startDtime = concat(reqYear, '-', reqMonth,'-01'); #조회 시작일자 : 요청월 1일
SET @endDtime = date_add(@startDtime, INTERVAL 1 MONTH); #조회 종료일자 : 조회 시작일자 일년 후 
###########다음달 말일날짜 다시 구해야 함

#***meter_base_date가 0이면 말일을 의미함
IF (@baseDate = 0) THEN    
  SET @startDtime =  date_add(@startDtime, INTERVAL -1 DAY);
  SET @endDtime = date_add(@endDtime, INTERVAL -1 DAY);
ELSEIF (@baseDate > 0 AND @baseDate < 10) THEN 
  SET @baseDate = concat('0', @baseDate) ;
  SET @startDtime = concat(reqYear, '-', reqMonth, '-', @baseDate);
  SET @endDtime = date_add(@startDtime, INTERVAL 1 MONTH);
ELSE
	SET @startDtime = concat(reqYear, '-', reqMonth, '-', @baseDate);
    SET @endDtime = date_add(@startDtime, INTERVAL 1 MONTH);
END IF;
#select @baseDate, @startDtime, @endDtime;

#오늘날짜가 종료일(@endDtime) 보다 적으면 이번달 이달 조회종료일 = 현재날짜 +1
SET @nEndDtime = (SELECT IF(CONVERT(@endDtime, DATETIME) > NOW(), date_add(date_format(now(), '%Y-%m-%d'), INTERVAL 1 DAY), @endDtime));
#select @startDtime, @endDtime, @nEndDtime;

SET @startDate = @startDtime;
SET @endDate =  @endDtime;

IF (@startDate <= CURRENT_DATE() and @endDate >= CURRENT_DATE()) THEN
	SET @endDate = CURRENT_DATE();
END IF; 

SET @dayCount = DATEDIFF(@endDate, @startDate);
#select @energyType, @startDate, @endDate, @dongCode, @hoCode, @dayCount;

DROP TEMPORARY TABLE IF EXISTS tmp_day_energy;
CREATE temporary table tmp_day_energy(
	 useDate char(10),
     dayMonthUsage DECIMAL(7,2), 
     sameAreaUsage DECIMAL(7,2),
     prevYearSameMonthUsage DECIMAL(7,2)
);

#---동일평형 세대정보
DROP TEMPORARY TABLE IF EXISTS tmp_dongho;
CREATE temporary table tmp_dongho
SELECT dong_code, ho_code FROM t_dongho
WHERE h_area_type IN (SELECT h_area_type FROM t_dongho WHERE dong_code = @dongCode AND ho_code = @hoCode);

#---동일평형 세대수
SET @var_cnt = (SELECT count(*) AS cnt FROM tmp_dongho);

SET @useDate = @startDate;
WHILE (i <= @dayCount) DO
	SET @dayMonthUsage = 0;
    SET @nextDate = DATE_ADD(@useDate, INTERVAL 1 DAY);
    
    #에너지별 일사용량
	IF (@energyType = 'elec') THEN
		SELECT sum(ifnull(elec_usage,0)) AS dayUsage 
			INTO  @dayUsage
		FROM t_energy 
		WHERE dong_code = @dongCode AND ho_code = @hoCode
		AND (energy_dtime >= @useDate AND energy_dtime < @nextDate);
	ELSEIF(@energyType = 'water') THEN
		SELECT sum(ifnull(water_usage,0)) AS dayUsage 
			INTO  @dayUsage
		FROM t_energy 
		WHERE dong_code = @dongCode AND ho_code = @hoCode
		AND (energy_dtime >= @useDate AND energy_dtime < @nextDate);
	ELSEIF(@energyType = 'gas') THEN
		SELECT sum(ifnull(gas_usage,0)) AS dayUsage 
			INTO  @dayUsage
		FROM t_energy 
		WHERE dong_code = @dongCode AND ho_code = @hoCode
		AND (energy_dtime >= @useDate AND energy_dtime < @nextDate);
	ELSEIF(@energyType = 'hotWater') THEN
		SELECT sum(ifnull(hot_water_usage,0)) AS dayUsage 
			INTO  @dayUsage
		FROM t_energy 
		WHERE dong_code = @dongCode AND ho_code = @hoCode
		AND (energy_dtime >= @useDate AND energy_dtime < @nextDate);
	ELSEIF(@energyType = 'heating') THEN
		SELECT sum(ifnull(heating_usage,0)) AS dayUsage 
			INTO  @dayUsage
		FROM t_energy 
		WHERE dong_code = @dongCode AND ho_code = @hoCode
		AND (energy_dtime >= @useDate AND energy_dtime < @nextDate);
	ELSEIF(@energyType = 'aircon') THEN
		SELECT sum(ifnull(heating_usage,0)) AS dayUsage 
			INTO  @dayUsage
		FROM t_energy 
		WHERE dong_code = @dongCode AND ho_code = @hoCode
		AND (energy_dtime >= @useDate AND energy_dtime < @nextDate);
	END IF;
	SET@dayUsage = IFNULL(@dayUsage, 0); #NULL처리
    
	#동일평형 사용량(평균)
	SET @sameAreaUsage = 0;
	IF (@energyType = 'elec') THEN
		SET @sameAreaUsage =(
			SELECT (sum(elec_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
			WHERE (energy_dtime >= @useDate AND energy_dtime < @nextDate) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
		);
	ELSEIF(@energyType = 'water') THEN
		SET @sameAreaUsage =(
			SELECT (sum(water_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
			WHERE (energy_dtime >= @useDate AND energy_dtime < @nextDate) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
		);
	ELSEIF(@energyType = 'gas') THEN
		SET @sameAreaUsage =(
			SELECT (sum(gas_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
			WHERE (energy_dtime >= @useDate AND energy_dtime < @nextDate) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
		);
	ELSEIF(@energyType = 'hotWater') THEN
		SET @sameAreaUsage =(
			SELECT (sum(hot_water_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
			WHERE (energy_dtime >= @useDate AND energy_dtime < @nextDate) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
		);
	ELSEIF(@energyType = 'heating') THEN
		SET @sameAreaUsage =(
			SELECT (sum(heating_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
			WHERE (energy_dtime >= @useDate AND energy_dtime < @nextDate) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
		);
	ELSEIF(@energyType = 'aircon') THEN
		SET @sameAreaUsage =(
			SELECT (sum(aircon_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
			WHERE (energy_dtime >= @useDate AND energy_dtime < @nextDate) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
		);
	END IF;    
	SET @sameAreaUsage = IFNULL(@sameAreaUsage, 0); #NULL처리
    
	#전년동월 사용량
	SET @prev_m_startDtime =date_add(@useDate, INTERVAL -1 YEAR);
	SET @prev_m_endDtime =date_add(@nextDate, INTERVAL -1 YEAR);
	SET @prevYearSameMonthUsage = 0;
	#select @prev_m_startDtime, @prev_m_endDtime;

	IF (@energyType = 'elec') THEN
		SELECT sum(ifnull(elec_usage,0)) AS prevYearSameMonthUsage  
			INTO  @prevYearSameMonthUsage
		FROM t_energy 
		WHERE dong_code = @dongCode AND ho_code = @hoCode
		AND (energy_dtime >= @prev_m_startDtime AND energy_dtime < @prev_m_endDtime);
	ELSEIF (@energyType = 'water') THEN
		SELECT sum(ifnull(water_usage,0)) AS prevYearSameMonthUsage  
			INTO  @prevYearSameMonthUsage
		FROM t_energy 
		WHERE dong_code = @dongCode AND ho_code = @hoCode
		AND (energy_dtime >= @prev_m_startDtime AND energy_dtime < @prev_m_endDtime);
	ELSEIF (@energyType = 'gas') THEN
		SELECT sum(ifnull(gas_usage,0)) AS prevYearSameMonthUsage  
			INTO  @prevYearSameMonthUsage
		FROM t_energy 
		WHERE dong_code = @dongCode AND ho_code = @hoCode
		AND (energy_dtime >= @prev_m_startDtime AND energy_dtime < @prev_m_endDtime);
	ELSEIF (@energyType = 'hot_water') THEN
		SELECT sum(ifnull(hot_water_usage,0)) AS prevYearSameMonthUsage  
			INTO  @prevYearSameMonthUsage
		FROM t_energy 
		WHERE dong_code = @dongCode AND ho_code = @hoCode
		AND (energy_dtime > @prev_m_startDtime AND energy_dtime < @prev_m_endDtime);
	ELSEIF (@energyType = 'heating') THEN
		SELECT sum(ifnull(heating_usage,0)) AS prevYearSameMonthUsage  
			INTO  @prevYearSameMonthUsage
		FROM t_energy 
		WHERE dong_code = @dongCode AND ho_code = @hoCode
		AND (energy_dtime > @prev_m_startDtime AND energy_dtime < @prev_m_endDtime);
	ELSEIF (@energyType = 'aircon') THEN
		SELECT sum(ifnull(aircon_usage,0)) AS prevYearSameMonthUsage  
			INTO  @prevYearSameMonthUsage
		FROM t_energy 
		WHERE dong_code = @dongCode AND ho_code = @hoCode
		AND (energy_dtime > @prev_m_startDtime AND energy_dtime < @prev_m_endDtime);
	END IF;

	SET@prevYearSameMonthUsage = IFNULL(@prevYearSameMonthUsage, 0); #NULL처리     
    
    #select i, @dayCount, @useDate, @nextDate, @energyType, @dayUsage, @var_cnt, @sameAreaUsage, @prevYearSameMonthUsage; 
	INSERT INTO tmp_day_energy (useDate, dayMonthUsage, sameAreaUsage, prevYearSameMonthUsage) VALUES 
    (@useDate, @dayUsage, @sameAreaUsage, @prevYearSameMonthUsage);
    
	SET i = i + 1;    
	SET @useDate = @nextDate;
END WHILE;

SELECT cast(DATE_FORMAT(useDate , '%d') as unsigned) AS useDate, dayMonthUsage, sameAreaUsage, prevYearSameMonthUsage FROM tmp_day_energy;
-- SELECT * FROM tmp_day_energy;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spMonthEnergyUse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spMonthEnergyUse`(
IN selectFlag CHAR(1), 
INOUT energyType VARCHAR(10), IN reqYear CHAR(4), IN reqMonth CHAR(2), IN dongCode VARCHAR(4), IN hoCode VARCHAR(4), 
OUT monthUsage DECIMAL(7,2), OUT sameAreaUsage DECIMAL(7,2), OUT prevMonthUsage DECIMAL(7,2), OUT prevYearSameMonthUsage DECIMAL(7,2),
OUT forecastUsage DECIMAL(7,2), OUT targetUsage DECIMAL(7,2), OUT mySavingRankingArea VARCHAR(10), OUT mySavingRankingAll VARCHAR(10),
OUT startDtime CHAR(10), OUT endDtime CHAR(10)
)
BEGIN
SET @energyType = energyType;
SET @reqYear = reqYear;
SET @reqMonth = reqMonth;
SET @dongCode = dongCode;
SET @hoCode = hoCode;
SET @reqMonthUsage = 0;

SET @forecastUsage = 0;

SET @baseDate = (SELECT meter_base_date FROM t_energy_setting WHERE energy_type = @energyType);
SET @baseDate = IFNULL(@baseDate, 1);
#select @baseDate;

SET @startDtime = concat(reqYear, '-', reqMonth,'-01'); #조회 시작일자 : 요청월 1일
SET @endDtime = date_add(@startDtime, INTERVAL 1 MONTH); #조회 종료일자 : 조회 시작일자 일년 후 
###########다음달 말일날짜 다시 구해야 함

#***meter_base_date가 0이면 말일을 의미함
IF (@baseDate = 0) THEN    
  SET @startDtime =  date_add(@startDtime, INTERVAL -1 DAY);
  SET @endDtime = date_add(@endDtime, INTERVAL -1 DAY);
ELSEIF (@baseDate > 0 AND @baseDate < 10) THEN 
  SET @baseDate = concat('0', @baseDate) ;
  SET @startDtime = concat(reqYear, '-', reqMonth, '-', @baseDate);
  SET @endDtime = date_add(@startDtime, INTERVAL 1 MONTH);
ELSE
	SET @startDtime = concat(reqYear, '-', reqMonth, '-', @baseDate);
    SET @endDtime = date_add(@startDtime, INTERVAL 1 MONTH);
END IF;
#select @baseDate, @startDtime, @endDtime;

#오늘날짜가 종료일(@endDtime) 보다 적으면 이번달 이달 조회종료일 = 현재날짜 +1
SET @nEndDtime = (SELECT IF(CONVERT(@endDtime, DATETIME) > NOW(), date_add(date_format(now(), '%Y-%m-%d'), INTERVAL 1 DAY), @endDtime));
#select @startDtime, @endDtime, @nEndDtime;

#월간 사용량
IF (@energyType = 'elec') THEN
	SELECT sum(ifnull(elec_usage,0)) AS reqMonthUsage 
		INTO  @reqMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime);
ELSEIF(@energyType = 'water') THEN
	SELECT sum(ifnull(water_usage,0)) AS reqMonthUsage 
		INTO  @reqMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime);
ELSEIF(@energyType = 'gas') THEN
	SELECT sum(ifnull(gas_usage,0)) AS reqMonthUsage 
		INTO  @reqMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime);
ELSEIF(@energyType = 'hotWater') THEN
	SELECT sum(ifnull(hot_water_usage,0)) AS reqMonthUsage 
		INTO  @reqMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime);
ELSEIF(@energyType = 'heating') THEN
	SELECT sum(ifnull(heating_usage,0)) AS reqMonthUsage 
		INTO  @reqMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime);   
ELSEIF(@energyType = 'aircon') THEN
	SELECT sum(ifnull(heating_usage,0)) AS reqMonthUsage 
		INTO  @reqMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime);
END IF;
SET@reqMonthUsage = IFNULL(@reqMonthUsage, 0); #NULL처리

#에너지 목표값
SET @targetUsage = (SELECT target_value FROM t_energy_target WHERE energy_type = @energyType AND dong_code = @dongCode And ho_code = @hoCode);
SET @targetUsage = IFNULL(@targetUsage, 1);

#에측사용량 = (당월사용량/사용일수) x 당월_총일수
#--사용일수
SET @useDayCount = DATEDIFF(@nEndDtime, @startDtime);
#--당월총일수
SET @totalDayCount = DATEDIFF(@endDtime, @startDtime);
#---예측사용량
SET @forecastUsage = (@reqMonthUsage/@useDayCount) * @totalDayCount;
#select @energyType, @dongCode, @hoCode, @startDtime, @nEndDtime, @useDayCount, @totalDayCount, @reqMonthUsage, @targetUsage, @forecastUsage;

#전체세대수
SET @all_cnt = (SELECT count(*) AS cnt FROM t_dongho WHERE dong_code != '9999');

#동일평형 사용량(평균)
#---동일평형 세대정보
DROP TEMPORARY TABLE IF EXISTS tmp_dongho;
CREATE temporary table tmp_dongho
SELECT dong_code, ho_code FROM t_dongho
WHERE h_area_type IN (SELECT h_area_type FROM t_dongho WHERE dong_code = @dongCode AND ho_code = @hoCode);

#---동일평형 세대수
SET @var_cnt = (SELECT count(*) AS cnt FROM tmp_dongho);
#SELECT @var_cnt;

#---동일평형 평균
SET @sameAreaUsage =0;

IF (@energyType = 'elec') THEN
	SET @sameAreaUsage =(
		SELECT (sum(elec_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
		WHERE (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
	);
ELSEIF(@energyType = 'water') THEN
	SET @sameAreaUsage =(
		SELECT (sum(water_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
		WHERE (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
	);
ELSEIF(@energyType = 'gas') THEN
	SET @sameAreaUsage =(
		SELECT (sum(gas_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
		WHERE (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
	);
ELSEIF(@energyType = 'hotWater') THEN
	SET @sameAreaUsage =(
		SELECT (sum(hot_water_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
		WHERE (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
	);
ELSEIF(@energyType = 'heating') THEN
	SET @sameAreaUsage =(
		SELECT (sum(heating_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
		WHERE (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
	);
ELSEIF(@energyType = 'aircon') THEN
	SET @sameAreaUsage =(
		SELECT (sum(aircon_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
		WHERE (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
	);
END IF;    
SET @sameAreaUsage = IFNULL(@sameAreaUsage, 0); #NULL처리
#SELECT   @var_cnt, @sameAreaUsage;

#우리집 절약순위(동일평형 랭킹)
DROP TEMPORARY TABLE IF EXISTS tmp_dongho_area;

IF (@energyType = 'elec') THEN
	CREATE temporary table tmp_dongho_area
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.elec_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN tmp_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'water') THEN
	CREATE temporary table tmp_dongho_area
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.water_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN tmp_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'gas') THEN
	CREATE temporary table tmp_dongho_area
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.gas_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN tmp_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'hotWater') THEN
	CREATE temporary table tmp_dongho_area
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.hot_water_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN tmp_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'heating') THEN
	CREATE temporary table tmp_dongho_area
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.heating_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN tmp_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'aircon') THEN
	CREATE temporary table tmp_dongho_area
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.aircon_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN tmp_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
END IF;
#SELECT * FROM tmp_dongho_area;

SET @rankingArea = (SELECT count(*)+1 AS 'rCount' FROM tmp_dongho_area WHERE energy_usage < @reqMonthUsage);
#SELECT @rankingArea;

#우리집 절약순위(전체 랭킹)
DROP TEMPORARY TABLE IF EXISTS tmp_dongho_all;

IF (@energyType = 'elec') THEN
	CREATE temporary table tmp_dongho_all
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.elec_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN t_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'water') THEN
	CREATE temporary table tmp_dongho_all
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.water_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN t_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'gas') THEN
	CREATE temporary table tmp_dongho_all
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.gas_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN t_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'hotWater') THEN
	CREATE temporary table tmp_dongho_all
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.hot_water_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN t_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'heating') THEN
	CREATE temporary table tmp_dongho_all
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.heating_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN t_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'aircon') THEN
	CREATE temporary table tmp_dongho_all
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.aircon_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN t_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
END IF;

#SELECT * FROM tmp_dongho_all;

SET @rankingAll = (SELECT count(*)+1 AS 'rCount' FROM tmp_dongho_all WHERE energy_usage < @reqMonthUsage);
#SELECT @rankingAll;

#전월 사용량
SET @prev_startDtime =date_add(@startDtime, INTERVAL -1 MONTH);
SET @prev_endDtime =date_add(@endDtime, INTERVAL -1 MONTH);
SET @prevMonthUsage  = 0;
#select @prev_startDtime, @prev_endDtime;

IF (@energyType = 'elec') THEN
	SELECT sum(ifnull(elec_usage,0)) AS prevMonthsage 
		INTO  @prevMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @prev_startDtime AND energy_dtime < @prev_endDtime);
ELSEIF (@energyType = 'water') THEN
	SELECT sum(ifnull(water_usage,0)) AS prevMonthsage 
		INTO  @prevMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @prev_startDtime AND energy_dtime < @prev_endDtime);
ELSEIF (@energyType = 'gas') THEN
	SELECT sum(ifnull(gas_usage,0)) AS prevMonthsage 
		INTO  @prevMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @prev_startDtime AND energy_dtime < @prev_endDtime);
ELSEIF (@energyType = 'hot_water') THEN
	SELECT sum(ifnull(hot_water_usage,0)) AS prevMonthsage 
		INTO  @prevMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime > @prev_startDtime AND energy_dtime < @prev_endDtime);
ELSEIF (@energyType = 'heating') THEN
	SELECT sum(ifnull(heating_usage,0)) AS prevMonthsage 
		INTO  @prevMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime > @prev_startDtime AND energy_dtime < @prev_endDtime);
ELSEIF (@energyType = 'aircon') THEN
	SELECT sum(ifnull(aircon_usage,0)) AS prevMonthsage 
		INTO  @prevMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime > @prev_startDtime AND energy_dtime < @prev_endDtime);
END IF;

SET@prevMonthUsage = IFNULL(@prevMonthUsage, 0); #NULL처리
#SELECT @startDtime, @nEndDtime, @prev_startDtime, @prev_endDtime, @energyType, @prevMonthUsage;

#전년동월 사용량
SET @prev_m_startDtime =date_add(@startDtime, INTERVAL -1 YEAR);
SET @prev_m_endDtime =date_add(@endDtime, INTERVAL -1 YEAR);
SET @prevYearSameMonthUsage = 0;
#select @prev_m_startDtime, @prev_m_endDtime;

IF (@energyType = 'elec') THEN
	SELECT sum(ifnull(elec_usage,0)) AS prevYearSameMonthUsage  
		INTO  @prevYearSameMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @prev_m_startDtime AND energy_dtime < @prev_m_endDtime);
ELSEIF (@energyType = 'water') THEN
	SELECT sum(ifnull(water_usage,0)) AS prevYearSameMonthUsage  
		INTO  @prevYearSameMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @prev_m_startDtime AND energy_dtime < @prev_m_endDtime);
ELSEIF (@energyType = 'gas') THEN
	SELECT sum(ifnull(gas_usage,0)) AS prevYearSameMonthUsage  
		INTO  @prevYearSameMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @prev_m_startDtime AND energy_dtime < @prev_m_endDtime);
ELSEIF (@energyType = 'hot_water') THEN
	SELECT sum(ifnull(hot_water_usage,0)) AS prevYearSameMonthUsage  
		INTO  @prevYearSameMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime > @prev_m_startDtime AND energy_dtime < @prev_m_endDtime);
ELSEIF (@energyType = 'heating') THEN
	SELECT sum(ifnull(heating_usage,0)) AS prevYearSameMonthUsage  
		INTO  @prevYearSameMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime > @prev_m_startDtime AND energy_dtime < @prev_m_endDtime);
ELSEIF (@energyType = 'aircon') THEN
	SELECT sum(ifnull(aircon_usage,0)) AS prevYearSameMonthUsage  
		INTO  @prevYearSameMonthUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime > @prev_m_startDtime AND energy_dtime < @prev_m_endDtime);
END IF;

SET@prevYearSameMonthUsage = IFNULL(@prevYearSameMonthUsage, 0); #NULL처리
#select @startDtime, @nEndDtime, @prev_startDtime, @prev_endDtime, @energyType, @prevYearSameMonthUsage;

#@reqYear, @rMonth, @monthUsage, @sameAreaUsage, @prevMonthUsage, @prevYearSameMonthUsage, @forecastUsage, @targetUsage, @mySavingRankingArea, @mySavingRankingAll
SET monthUsage = @reqMonthUsage;
SET sameAreaUsage = @sameAreaUsage;
SET prevMonthUsage = @prevMonthUsage;
SET prevYearSameMonthUsage = @prevYearSameMonthUsage;
SET forecastUsage = CONVERT(@forecastUsage, DECIMAL(7,2));
SET targetUsage = CONVERT(@targetUsage, DECIMAL(7,2));
#SET mySavingRankingArea = @rankingArea;
#SET mySavingRankingAll = @rankingAll;
SET mySavingRankingArea = '-';
IF (monthUsage > 0) THEN 
	SET mySavingRankingArea = CONCAT(@rankingArea, '/', @var_cnt); 
END IF;
SET mySavingRankingAll = '-';
IF (monthUsage > 0) THEN 
	SET mySavingRankingAll = CONCAT(@rankingAll, '/', @all_cnt); 
END IF;
SET startDtime = @startDtime;
SET endDtime = @endDtime;

IF (selectFlag = 'Y') THEN

SELECT  dongCode, hoCode, energyType, 
	   reqYear, reqMonth, monthUsage,
       #@nEndDtime AS nEndDtime,
       #@useDayCount AS useDayCount, @totalDayCount AS totalDayCount, 
       targetUsage, sameAreaUsage,
       prevMonthUsage, prevYearSameMonthUsage,
       mySavingRankingArea, mySavingRankingAll;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spMonthEnergyUseByYear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spMonthEnergyUseByYear`(energyType varchar(10), reqYear char(4), dongCode varchar(4), hoCode varchar(4))
BEGIN

DECLARE i INT;
SET i = 1;

SET @energyType = energyType;
SET @reqYear = reqYear;
SET @endMonth = 12;
SET @dongCode = dongCode;
SET @hoCode = hoCode;

IF (@reqYear = YEAR(CURRENT_DATE())) THEN
	SET @endMonth = MONTH(CURRENT_DATE());
END IF; 
#select @energyType, @reqYear, @reqMonth, @dongCode, @hoCode;

DROP TEMPORARY TABLE IF EXISTS tmp_month_energy;
CREATE temporary table tmp_month_energy(
	 reqYear char(4),
     reqMonth char(2),
     monthUsage DECIMAL(7,2), 
     sameAreaUsage DECIMAL(7,2), 
     prevMonthUsage DECIMAL(7,2), 
     prevYearSameMonthUsage DECIMAL(7,2),
	 forecastUsage DECIMAL(7,2),
     targetUsage DECIMAL(7,2),
     mySavingRankingArea VARCHAR(10),
     mySavingRankingAll VARCHAR(10)
);

WHILE (i <= @endMonth) DO
	SET @tMonth = '';
       
	IF (i < 10) THEN 
		SET @tMonth = CONCAT('0', CONVERT(i, CHAR(1)));
	ELSE
        SET @tMonth = CONVERT(i, CHAR(2));
	END IF;        
    
	call spMonthEnergyUse ('N', @energyType, @reqYear, @tMonth, @dongCode, @hoCode, @monthUsage, @sameAreaUsage,
						   @prevMonthUsage, @prevYearSameMonthUsage, @forecastUsage, @targetUsage, @mySavingRankingArea, 
                           @mySavingRankingAll, @startDtim, @endDtime);
                           
	INSERT INTO tmp_month_energy
        (reqYear, reqMonth, monthUsage, sameAreaUsage, prevMonthUsage, 
         prevYearSameMonthUsage, forecastUsage, targetUsage, mySavingRankingArea, mySavingRankingAll) 
	VALUES 
		(@reqYear, @reqMonth, @monthUsage, @sameAreaUsage, @prevMonthUsage, 
         @prevYearSameMonthUsage, @forecastUsage, @targetUsage, @mySavingRankingArea, @mySavingRankingAll);
	
	#select i, @tMonth, @endMonth; 
    
	SET i = i + 1;    
END WHILE;

SELECT CONVERT(reqMonth, unsigned) AS useMonth, monthUsage, sameAreaUsage, prevYearSameMonthUsage, mySavingRankingArea
FROM tmp_month_energy;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spMonthEnergyUseCall` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spMonthEnergyUseCall`(
	energyType VARCHAR(10), reqYear CHAR(4), reqMonth CHAR(2), dongCode varchar(4), hoCode varchar(4)
)
BEGIN
SET @selectFlag = 'Y';
SET @energyType = energyType;
SET @reqYear = reqYear;
SET @reqMonth = reqMonth;
SET @dongCode = dongCode;
SET @hoCode = hoCode;

call spMonthEnergyUse (@selectFlag, @energyType, @reqYear,@reqMonth, @dongCode, @hoCode, 
@monthUsage, @sameAreaUsage, @prevMonthUsage, @prevYearSameMonthUsage,
@forecastUsage, @targetUsage, @mySavingRankingArea, @mySavingRankingAll,
@startDtime, @endDtime);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spNowEnergyUse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spNowEnergyUse`(dongCode varchar(4), hoCode varchar(4))
BEGIN
SET @dongCode = dongCode;
SET @hoCode = hoCode;
SET @reqYear = CONVERT(YEAR(CURRENT_DATE()), CHAR(4));
SET @reqMonth = '01';

IF (MONTH(CURRENT_DATE()) < 10) THEN 
   SET @reqMonth = CONCAT('0', CONVERT(MONTH(CURRENT_DATE()), CHAR(1)));
ELSE
   SET @reqMonth = CONVERT(MONTH(CURRENT_DATE()), CHAR(2));
END IF;    
#select @reqYear, @reqMonth;

DROP TEMPORARY TABLE IF EXISTS tmp_now_month_energy;
CREATE temporary table tmp_now_month_energy(
     energyType varchar(10),
     nowMonthUsage DECIMAL(7,2),
     targetUsage DECIMAL(7,2),
     sameAreaUsage DECIMAL(7,2), 
	 prevYearSameMonthUsage DECIMAL(7,2),
     mySavingRankingArea VARCHAR(10),
     prevMonthUsage DECIMAL(7,2)
);

#당월 전기 사용 현황
SET @energyType = 'elec';
SET @isExists = (SELECT EXISTS (select * from t_energy_setting where energy_type = @energyType) as success);

IF (@isExists = 1) THEN
   call spMonthEnergyUse ('N', @energyType, @reqYear, @reqMonth, @dongCode, @hoCode, @monthUsage, @sameAreaUsage,
                     @prevMonthUsage, @prevYearSameMonthUsage, @forecastUsage, @targetUsage, @mySavingRankingArea, 
                           @mySavingRankingAll, @startDtim, @endDtime);
                           
      INSERT INTO tmp_now_month_energy
        (energyType, nowMonthUsage, sameAreaUsage, prevMonthUsage, 
         prevYearSameMonthUsage, targetUsage, mySavingRankingArea) 
   VALUES 
      (@energyType, @monthUsage, @sameAreaUsage, @prevMonthUsage, 
         @prevYearSameMonthUsage, @targetUsage, @mySavingRankingArea);
END IF;

#당월 수도 사용 현황
SET @energyType = 'water';
SET @isExists = (SELECT EXISTS (select * from t_energy_setting where energy_type = @energyType) as success);

IF (@isExists = 1) THEN
   call spMonthEnergyUse ('N', @energyType, @reqYear, @reqMonth, @dongCode, @hoCode, @monthUsage, @sameAreaUsage,
                     @prevMonthUsage, @prevYearSameMonthUsage, @forecastUsage, @targetUsage, @mySavingRankingArea, 
                           @mySavingRankingAll, @startDtim, @endDtime);
                           
   INSERT INTO tmp_now_month_energy
        (energyType, nowMonthUsage, sameAreaUsage, prevMonthUsage, 
         prevYearSameMonthUsage, targetUsage, mySavingRankingArea) 
   VALUES 
      (@energyType, @monthUsage, @sameAreaUsage, @prevMonthUsage, 
         @prevYearSameMonthUsage, @targetUsage, @mySavingRankingArea);
END IF;

#당월 가스 사용 현황
SET @energyType = 'gas';
SET @isExists = (SELECT EXISTS (select * from t_energy_setting where energy_type = @energyType) as success);

IF (@isExists = 1) THEN
   call spMonthEnergyUse ('N', @energyType, @reqYear, @reqMonth, @dongCode, @hoCode, @monthUsage, @sameAreaUsage,
                     @prevMonthUsage, @prevYearSameMonthUsage, @forecastUsage, @targetUsage, @mySavingRankingArea, 
                           @mySavingRankingAll, @startDtim, @endDtime);
                           
   INSERT INTO tmp_now_month_energy
        (energyType, nowMonthUsage, sameAreaUsage, prevMonthUsage, 
         prevYearSameMonthUsage, targetUsage, mySavingRankingArea) 
   VALUES 
      (@energyType, @monthUsage, @sameAreaUsage, @prevMonthUsage, 
         @prevYearSameMonthUsage, @targetUsage, @mySavingRankingArea);
END IF;

select * from tmp_now_month_energy;

#당월 온수 사용 현황
SET @energyType = 'hotWater';
SET @isExists = (SELECT EXISTS (select * from t_energy_setting where energy_type = @energyType) as success);

IF (@isExists = 1) THEN
   call spMonthEnergyUse ('N', @energyType, @reqYear, @reqMonth, @dongCode, @hoCode, @monthUsage, @sameAreaUsage,
                     @prevMonthUsage, @prevYearSameMonthUsage, @forecastUsage, @targetUsage, @mySavingRankingArea, 
                           @mySavingRankingAll, @startDtim, @endDtime);
                           
   INSERT INTO tmp_now_month_energy
        (energyType, nowMonthUsage, sameAreaUsage, prevMonthUsage, 
         prevYearSameMonthUsage, targetUsage, mySavingRankingArea) 
   VALUES 
      (@energyType, @monthUsage, @sameAreaUsage, @prevMonthUsage, 
         @prevYearSameMonthUsage, @targetUsage, @mySavingRankingArea);
END IF;

#당월 난방 사용 현황
SET @energyType = 'heating';
SET @isExists = (SELECT EXISTS (select * from t_energy_setting where energy_type = @energyType) as success);

IF (@isExists = 1) THEN
   call spMonthEnergyUse ('N', @energyType, @reqYear, @reqMonth, @dongCode, @hoCode, @monthUsage, @sameAreaUsage,
                     @prevMonthUsage, @prevYearSameMonthUsage, @forecastUsage, @targetUsage, @mySavingRankingArea, 
                           @mySavingRankingAll, @startDtim, @endDtime);
                           
   INSERT INTO tmp_now_month_energy
        (energyType, nowMonthUsage, sameAreaUsage, prevMonthUsage, 
         prevYearSameMonthUsage, targetUsage, mySavingRankingArea) 
   VALUES 
      (@energyType, @monthUsage, @sameAreaUsage, @prevMonthUsage, 
         @prevYearSameMonthUsage, @targetUsage, @mySavingRankingArea);
END IF;


#당월 에어컨 사용 현황
SET @energyType = 'aircon';
SET @isExists = (SELECT EXISTS (select * from t_energy_setting where energy_type = @energyType) as success);

IF (@isExists = 1) THEN
   call spMonthEnergyUse ('N', @energyType, @reqYear, @reqMonth, @dongCode, @hoCode, @nowMonthUsage, @sameAreaUsage,
                     @prevMonthUsage, @prevYearSameMonthUsage, @forecastUsage, @targetUsage, @mySavingRankingArea, 
                           @mySavingRankingAll, @startDtim, @endDtime);
                           
   INSERT INTO tmp_now_month_energy
        (energyType, nowMonthUsage, sameAreaUsage, prevMonthUsage, 
         prevYearSameMonthUsage, targetUsage, mySavingRankingArea) 
   VALUES 
      (@energyType, @monthUsage, @sameAreaUsage, @prevMonthUsage, 
         @prevYearSameMonthUsage, @targetUsage, @mySavingRankingArea);
END IF;

select energyType, nowMonthUsage, targetUsage, sameAreaUsage, prevYearSameMonthUsage, mySavingRankingArea, prevMonthUsage
from tmp_now_month_energy;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spYearEnergyUse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spYearEnergyUse`(energyType varchar(10), reqYear char(4), dongCode varchar(4), hoCode varchar(4))
BEGIN
SET @energyType = energyType;
SET @nowYearUsage = 0;
SET @dongCode = dongCode;
SET @hoCode = hoCode;

SET @baseDate = (SELECT meter_base_date FROM t_energy_setting WHERE energy_type = @energyType);

SET @baseDate = IFNULL(@baseDate, 1);
#select @baseDate;

SET @startDtime = concat(reqYear, '-01-01'); #조회 시작일자 : 요청월 1일
SET @endDtime = date_add(@startDtime, INTERVAL 1 YEAR); #조회 종료일자 : 조회 시작일자 일년 후 
###########다음달 말일날짜 다시 구해야 함

#***meter_base_date가 0이면 말일을 의미함
IF (@baseDate = 0) THEN    
  SET @startDtime =  date_add(@startDtime, INTERVAL -1 DAY);
  SET @endDtime = date_add(@endDtime, INTERVAL -1 DAY);
ELSEIF (@baseDate > 0 AND @baseDate < 10) THEN 
  SET @baseDate = concat('0', @baseDate) ;
  SET @startDtime = concat(reqYear, '-01-', @baseDate);
  SET @endDtime = date_add(@startDtime, INTERVAL 1 YEAR);
ELSE
	SET @startDtime = concat(reqYear, '-01-', @baseDate);
    SET @endDtime = date_add(@startDtime, INTERVAL 1 YEAR);
END IF;
#select @baseDate, @startDtime, @endDtime;

#오늘날짜가 종료일(@endDtime) 보다 적으면 이번달 이달 조회종료일 = 현재날짜 +1
SET @nEndDtime = (SELECT IF(CONVERT(@endDtime, DATETIME) > NOW(), date_add(date_format(now(), '%Y-%m-%d'), INTERVAL 1 DAY), @endDtime));
#select @startDtime, @endDtime, @nEndDtime;

#월간 사용량
IF (@energyType = 'elec') THEN
	SELECT sum(ifnull(elec_usage,0)) AS nowYearUsage 
		INTO  @nowYearUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime);
ELSEIF(@energyType = 'water') THEN
	SELECT sum(ifnull(water_usage,0)) AS nowYearUsage 
		INTO  @nowYearUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime);
ELSEIF(@energyType = 'gas') THEN
	SELECT sum(ifnull(gas_usage,0)) AS nowYearUsage 
		INTO  @nowYearUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime);
ELSEIF(@energyType = 'hotWater') THEN
	SELECT sum(ifnull(hot_water_usage,0)) AS nowYearUsage 
		INTO  @nowYearUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime);
ELSEIF(@energyType = 'heating') THEN
	SELECT sum(ifnull(heating_usage,0)) AS nowYearUsage 
		INTO  @nowYearUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime);   
ELSEIF(@energyType = 'aircon') THEN
	SELECT sum(ifnull(heating_usage,0)) AS nowYearUsage 
		INTO  @nowYearUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime);
END IF;
SET@nowYearUsage = IFNULL(@nowYearUsage, 0); #NULL처리
#SELECT @startDtime, @nEndDtime, @energyType, @nowYearUsage;

#전체세대수
SET @all_cnt = (SELECT count(*) AS cnt FROM t_dongho WHERE dong_code != '9999');

#동일평형 사용량(평균)
#---동일평형 세대정보
DROP TEMPORARY TABLE IF EXISTS tmp_dongho;
CREATE temporary table tmp_dongho
SELECT dong_code, ho_code FROM t_dongho
WHERE h_area_type IN (SELECT h_area_type FROM t_dongho WHERE dong_code = @dongCode AND ho_code = @hoCode);

#---동일평형 세대수
SET @var_cnt = (SELECT count(*) AS cnt FROM tmp_dongho);
#SELECT @var_cnt;

#---동일평형 평균
SET @sameAreaUsage = 0;

IF (@energyType = 'elec') THEN
	SET @sameAreaUsage =(
		SELECT (sum(elec_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
		WHERE (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
	);
ELSEIF(@energyType = 'water') THEN
	SET @sameAreaUsage =(
		SELECT (sum(water_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
		WHERE (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
	);
ELSEIF(@energyType = 'gas') THEN
	SET @sameAreaUsage =(
		SELECT (sum(gas_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
		WHERE (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
	);
ELSEIF(@energyType = 'hotWater') THEN
	SET @sameAreaUsage =(
		SELECT (sum(hot_water_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
		WHERE (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
	);
ELSEIF(@energyType = 'heating') THEN
	SET @sameAreaUsage =(
		SELECT (sum(heating_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
		WHERE (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
	);
ELSEIF(@energyType = 'aircon') THEN
	SET @sameAreaUsage =(
		SELECT (sum(aircon_usage)/@var_cnt) AS sameAreaUsage FROM t_energy 
		WHERE (energy_dtime >= @startDtime AND energy_dtime < @nEndDtime) AND (dong_code, ho_code) IN (SELECT dong_code, ho_code FROM tmp_dongho)
	);
END IF; 
SET @sameAreaUsage = IFNULL(@sameAreaUsage, 0); #NULL처리
SET @sameAreaUsage = format(@sameAreaUsage, 2);
#SELECT  @sameAreaUsage;

#우리집 절약순위(동일평형 랭킹)
DROP TEMPORARY TABLE IF EXISTS tmp_dongho_area;

IF (@energyType = 'elec') THEN
	CREATE temporary table tmp_dongho_area
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.elec_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN tmp_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'water') THEN
	CREATE temporary table tmp_dongho_area
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.water_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN tmp_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'gas') THEN
	CREATE temporary table tmp_dongho_area
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.gas_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN tmp_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'hotWater') THEN
	CREATE temporary table tmp_dongho_area
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.hot_water_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN tmp_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'heating') THEN
	CREATE temporary table tmp_dongho_area
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.heating_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN tmp_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'aircon') THEN
	CREATE temporary table tmp_dongho_area
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.aircon_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN tmp_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
END IF;

#SELECT * FROM tmp_dongho_area;

SET @rankingArea = (SELECT count(*)+1 AS 'rCount' FROM tmp_dongho_area WHERE energy_usage < @nowYearUsage);
#SELECT @rankingArea;

#우리집 절약순위(전체 랭킹)
DROP TEMPORARY TABLE IF EXISTS tmp_dongho_all;

IF (@energyType = 'elec') THEN
	CREATE temporary table tmp_dongho_all
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.elec_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN t_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'water') THEN
	CREATE temporary table tmp_dongho_all
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.water_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN t_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'gas') THEN
	CREATE temporary table tmp_dongho_all
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.gas_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN t_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'hotWater') THEN
	CREATE temporary table tmp_dongho_all
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.hot_water_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN t_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'heating') THEN
	CREATE temporary table tmp_dongho_all
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.heating_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN t_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
ELSEIF (@energyType = 'aircon') THEN
	CREATE temporary table tmp_dongho_all
	SELECT a.dong_code, a.ho_code, sum(ifnull(a.aircon_usage,0)) AS energy_usage
	FROM t_energy a INNER JOIN t_dongho b on a.dong_code = b.dong_code AND a.ho_code = b.ho_code
	WHERE a.energy_dtime >= @startDtime AND a.energy_dtime < @nEndDtime
	GROUP BY a.dong_code, a.ho_code;
END IF;

#SELECT * FROM tmp_dongho_all;

SET @rankingAll = (SELECT count(*)+1 AS 'rCount' FROM tmp_dongho_all WHERE energy_usage < @nowYearUsage);
#SELECT @rankingAll;

#전년 사용량
SET @prev_startDtime =date_add(@startDtime, INTERVAL -1 YEAR);
SET @prev_endDtime =date_add(@endDtime, INTERVAL -1 YEAR);
SET @prevYearUsage = 0;


IF (@energyType = 'elec') THEN
	SELECT sum(ifnull(elec_usage,0)) AS prevYearUsage 
		INTO  @prevYearUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime > @prev_startDtime AND energy_dtime < @prev_endDtime);
ELSEIF (@energyType = 'water') THEN
	SELECT sum(ifnull(water_usage,0)) AS prevYearUsage 
		INTO  @prevYearUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime > @prev_startDtime AND energy_dtime < @prev_endDtime);
ELSEIF (@energyType = 'gas') THEN
	SELECT sum(ifnull(gas_usage,0)) AS prevYearUsage 
		INTO  @prevYearUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime > @prev_startDtime AND energy_dtime < @prev_endDtime);
ELSEIF (@energyType = 'hot_water') THEN
	SELECT sum(ifnull(hot_water_usage,0)) AS prevYearUsage 
		INTO  @prevYearUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime > @prev_startDtime AND energy_dtime < @prev_endDtime);
ELSEIF (@energyType = 'heating') THEN
	SELECT sum(ifnull(heating_usage,0)) AS prevYearUsage 
		INTO  @prevYearUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime > @prev_startDtime AND energy_dtime < @prev_endDtime);
ELSEIF (@energyType = 'aircon') THEN
	SELECT sum(ifnull(aircon_usage,0)) AS prevYearUsage 
		INTO  @prevYearUsage
	FROM t_energy 
	WHERE dong_code = @dongCode AND ho_code = @hoCode
	AND (energy_dtime > @prev_startDtime AND energy_dtime < @prev_endDtime);
END IF;
SET@prevYearUsage = IFNULL(@prevYearUsage, 0); #NULL처리

/*
SELECT @dongCode AS dongCode, @hoCode AS hoCode, @energyType AS energyType, 
       @baseDate AS baseDate, @startDtime AS startDtime, @endDtime AS endDtime,
       @prev_startDtime, @prev_endDtime,
	   #@nDayCount AS nDayCount, @dayCount AS dayCount, 
       @nowYearUsage AS yearUsage, 
       @sameAreaUsage AS sameAreaUsage, 
       @prevYearUsage AS prevYearUsage, 
       @rankingArea AS mySavingRankingArea, @rankingAll AS mySavingRankingAll;
*/
SELECT @dongCode AS dongCode, @hoCode AS hoCode, @energyType AS energyType, @reqYear AS reqYear, @sameAreaUsage AS sameAreaUsage,  
       @nowYearUsage AS yearUsage, @prevYearUsage AS prevYearUsage, 
       CONCAT(@rankingArea, '/', @var_cnt) AS mySavingRankingArea, 
       CONCAT(@rankingAll, '/', @all_cnt) AS mySavingRankingAll;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-30 11:14:54
