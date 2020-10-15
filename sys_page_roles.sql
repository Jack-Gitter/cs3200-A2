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
-- Table structure for table `page_roles`
--

DROP TABLE IF EXISTS `page_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_roles` (
  `id` int NOT NULL,
  `developer` int DEFAULT NULL,
  `page` int NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`page`),
  KEY `page_role_to_page_idx` (`page`),
  KEY `page_role_to_developer_idx` (`developer`),
  KEY `role_enum_idx` (`role`),
  CONSTRAINT `page_role_to_developer` FOREIGN KEY (`developer`) REFERENCES `developers` (`id`),
  CONSTRAINT `page_role_to_page` FOREIGN KEY (`page`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_enum` FOREIGN KEY (`role`) REFERENCES `roles` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_roles`
--

LOCK TABLES `page_roles` WRITE;
/*!40000 ALTER TABLE `page_roles` DISABLE KEYS */;
INSERT INTO `page_roles` VALUES (57,23,234,'editor'),(58,34,234,'reviewer'),(59,12,234,'writer'),(63,12,456,'editor'),(64,23,456,'reviewer'),(65,34,456,'writer');
/*!40000 ALTER TABLE `page_roles` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `page_role_AFTER_INSERT` AFTER INSERT ON `page_roles` FOR EACH ROW BEGIN
	IF NEW.role = 'admin' OR NEW.role = 'owner' THEN
    INSERT INTO page_priviledges VALUES (null, NEW.developer, NEW.page, 'write');
    INSERT INTO page_priviledges VALUES (null, NEW.developer, NEW.page, 'update');
    INSERT INTO page_priviledges VALUES (null, NEW.developer, NEW.page, 'delete' );
    INSERT INTO page_priviledges VALUES (null, NEW.developer, NEW.page, 'read');
	END IF;
    IF NEW.role = 'writer' THEN 
    INSERT INTO page_priviledges VALUES (null, NEW.developer, NEW.page, 'read'); 
    INSERT INTO page_priviledges VALUES (null, NEW.developer, NEW.page, 'create'); 
    INSERT INTO page_priviledges VALUES (null, NEW.developer, NEW.page, 'update'); 
    END IF;
    IF NEW.role = 'editor' THEN
	INSERT INTO page_priviledges VALUES (null, NEW.developer, NEW.page, 'read'); 
	INSERT INTO page_priviledges VALUES (null,  NEW.developer, NEW.page, 'update'); 
    END IF;
    IF NEW.role = 'reviewer' THEN
    INSERT INTO page_priviledges VALUES (null, NEW.developer, NEW.page , 'read'); 
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

-- Dump completed on 2020-10-15 12:17:37
