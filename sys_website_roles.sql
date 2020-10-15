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
-- Table structure for table `website_roles`
--

DROP TABLE IF EXISTS `website_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_roles` (
  `id` int NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  `website` int NOT NULL,
  `developer` int DEFAULT NULL,
  PRIMARY KEY (`id`,`website`),
  KEY `website_role_to_website_idx` (`website`),
  KEY `website_role_to_developer_idx` (`developer`),
  KEY `website_role_idx` (`role`),
  CONSTRAINT `website_role` FOREIGN KEY (`role`) REFERENCES `roles` (`type`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `website_role_to_developer` FOREIGN KEY (`developer`) REFERENCES `developers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `website_role_to_website` FOREIGN KEY (`website`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_roles`
--

LOCK TABLES `website_roles` WRITE;
/*!40000 ALTER TABLE `website_roles` DISABLE KEYS */;
INSERT INTO `website_roles` VALUES (1,'OWNER',123,12),(2,'ADMIN',234,12),(3,'EDITOR',345,12),(4,'OWNER',456,12),(6,'EDITOR',678,12),(7,'EDITOR',123,23),(8,'OWNER',234,23),(9,'ADMIN',345,23),(10,'EDITOR',456,23),(12,'ADMIN',678,23),(13,'ADMIN',123,34),(14,'EDITOR',234,34),(15,'OWNER',345,34),(16,'ADMIN',456,34),(18,'OWNER',678,34);
/*!40000 ALTER TABLE `website_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `website_role_AFTER_INSERT` AFTER INSERT ON `website_roles` FOR EACH ROW BEGIN
	IF NEW.role = 'ADMIN' OR NEW.role = 'OWNER' THEN
    INSERT INTO website_priviledges VALUES ('WRITE', NEW.developer, NEW.website ,null);
    INSERT INTO website_priviledges VALUES ('UPDATE', NEW.developer, NEW.website ,null);
    INSERT INTO website_priviledges VALUES ('DELETE', NEW.developer, NEW.website ,null);
    INSERT INTO website_priviledges VALUES ('READ', NEW.developer, NEW.website ,null);
	END IF;
    IF NEW.role = 'WRITER' THEN 
    INSERT INTO website_priviledges VALUES ('READ', NEW.developer, NEW.website, null); 
    INSERT INTO website_priviledges VALUES ('CREATE', NEW.developer, NEW.website, null); 
    INSERT INTO website_priviledges VALUES ('UPDATE', NEW.developer, NEW.website, null); 
    END IF;
    IF NEW.role = 'EDITOR' THEN
	INSERT INTO website_priviledges VALUES ('READ', NEW.developer, NEW.website, null); 
	INSERT INTO website_priviledges VALUES ('UPDATE', NEW.developer, NEW.website, null); 
    END IF;
    IF NEW.role = 'REVIEWER' THEN
    INSERT INTO website_priviledges VALUES ('READ', NEW.developer, NEW.website, null); 
    END IF;
END */;;
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

-- Dump completed on 2020-10-15 12:17:34
