-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: sys
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `website_priviledges`
--

DROP TABLE IF EXISTS `website_priviledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_priviledges` (
  `priveledge` varchar(45) DEFAULT NULL,
  `developer` int DEFAULT NULL,
  `website` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `website_privilede_to_developer_idx` (`developer`),
  KEY `website_priviledge_to_website_idx` (`website`),
  KEY `priviledge_type_idx` (`priveledge`),
  CONSTRAINT `priviledge_type` FOREIGN KEY (`priveledge`) REFERENCES `priviledges` (`type`),
  CONSTRAINT `website_priviledge_to_developer` FOREIGN KEY (`developer`) REFERENCES `developers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `website_priviledge_to_website` FOREIGN KEY (`website`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_priviledges`
--

LOCK TABLES `website_priviledges` WRITE;
/*!40000 ALTER TABLE `website_priviledges` DISABLE KEYS */;
INSERT INTO `website_priviledges` VALUES ('WRITE',12,123,241),('UPDATE',12,123,242),('DELETE',12,123,243),('READ',12,123,244),('WRITE',12,234,245),('UPDATE',12,234,246),('DELETE',12,234,247),('READ',12,234,248),('READ',12,345,249),('UPDATE',12,345,250),('WRITE',12,456,251),('UPDATE',12,456,252),('DELETE',12,456,253),('READ',12,456,254),('READ',12,678,259),('UPDATE',12,678,260),('READ',23,123,261),('UPDATE',23,123,262),('WRITE',23,234,263),('UPDATE',23,234,264),('DELETE',23,234,265),('READ',23,234,266),('WRITE',23,345,267),('UPDATE',23,345,268),('DELETE',23,345,269),('READ',23,345,270),('READ',23,456,271),('UPDATE',23,456,272),('WRITE',23,678,277),('UPDATE',23,678,278),('DELETE',23,678,279),('READ',23,678,280),('WRITE',34,123,281),('UPDATE',34,123,282),('DELETE',34,123,283),('READ',34,123,284),('READ',34,234,285),('UPDATE',34,234,286),('WRITE',34,345,287),('UPDATE',34,345,288),('DELETE',34,345,289),('READ',34,345,290),('WRITE',34,456,291),('UPDATE',34,456,292),('DELETE',34,456,293),('READ',34,456,294),('WRITE',34,678,297),('UPDATE',34,678,298),('DELETE',34,678,299),('READ',34,678,300);
/*!40000 ALTER TABLE `website_priviledges` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-15 12:17:34
