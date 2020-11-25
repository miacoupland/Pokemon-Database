-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pokemon_db_2
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
-- Table structure for table `ability`
--

DROP TABLE IF EXISTS `ability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ability` (
  `Ability ID` int NOT NULL,
  `Ability Name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Ability ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ability`
--

LOCK TABLES `ability` WRITE;
/*!40000 ALTER TABLE `ability` DISABLE KEYS */;
/*!40000 ALTER TABLE `ability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alternate forms`
--

DROP TABLE IF EXISTS `alternate forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alternate forms` (
  `National Number` int DEFAULT NULL,
  `Alternate Form ID` int NOT NULL,
  `Alternate Form Name` varchar(30) DEFAULT NULL,
  `Alternate Form Type` int DEFAULT NULL,
  `Item Required` varchar(20) DEFAULT NULL,
  `Height (ft)` float DEFAULT NULL,
  `Weight (kg)` float DEFAULT NULL,
  PRIMARY KEY (`Alternate Form ID`),
  KEY `National Number` (`National Number`),
  CONSTRAINT `alternate forms_ibfk_1` FOREIGN KEY (`National Number`) REFERENCES `pokemon` (`National Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alternate forms`
--

LOCK TABLES `alternate forms` WRITE;
/*!40000 ALTER TABLE `alternate forms` DISABLE KEYS */;
INSERT INTO `alternate forms` VALUES (1,1,'Mega Venusaur',1,'Venusaurite',7.1,100),(6,2,'Mega Charizard X',1,'Charizardite X',1.7,110.5),(6,3,'Mega Charizard Y',1,'Charizardite Y',1.7,100.5),(9,4,'Mega Blastoise',1,'Blastoisinite',1.6,101.1),(1,80,'Gigantamax Venusaur',3,'Dynamax Band',78.09,NULL),(6,81,'Gigantamax Charizard',3,'Dynamax Band',91.1,NULL),(9,82,'Gigantamax Blastoise',3,'Dynamax Band',82,NULL);
/*!40000 ALTER TABLE `alternate forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base stats`
--

DROP TABLE IF EXISTS `base stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base stats` (
  `National Number` int NOT NULL,
  `HP` int DEFAULT NULL,
  `Attack` int DEFAULT NULL,
  `Defence` int DEFAULT NULL,
  `Special Attack` int DEFAULT NULL,
  `Special Defence` int DEFAULT NULL,
  `Speed` int DEFAULT NULL,
  PRIMARY KEY (`National Number`),
  CONSTRAINT `base stats_ibfk_1` FOREIGN KEY (`National Number`) REFERENCES `pokemon` (`National Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base stats`
--

LOCK TABLES `base stats` WRITE;
/*!40000 ALTER TABLE `base stats` DISABLE KEYS */;
INSERT INTO `base stats` VALUES (1,45,49,49,65,65,45),(2,60,62,63,80,80,60),(3,80,82,83,100,100,80),(4,39,52,43,60,50,65),(5,58,64,58,80,65,80),(6,78,84,78,109,85,100),(7,44,48,65,50,64,43),(8,59,63,80,65,80,58),(9,79,83,100,85,105,78);
/*!40000 ALTER TABLE `base stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evolution`
--

DROP TABLE IF EXISTS `evolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evolution` (
  `National Number` int NOT NULL,
  `Evolves From` int DEFAULT NULL,
  `Evolves At Level` int DEFAULT NULL,
  `Evolves Into` int DEFAULT NULL,
  `Alternate Forms` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`National Number`),
  KEY `Evolves From` (`Evolves From`),
  KEY `Evolves Into` (`Evolves Into`),
  CONSTRAINT `evolution_ibfk_1` FOREIGN KEY (`National Number`) REFERENCES `pokemon` (`National Number`),
  CONSTRAINT `evolution_ibfk_2` FOREIGN KEY (`Evolves From`) REFERENCES `pokemon` (`National Number`),
  CONSTRAINT `evolution_ibfk_3` FOREIGN KEY (`Evolves Into`) REFERENCES `pokemon` (`National Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evolution`
--

LOCK TABLES `evolution` WRITE;
/*!40000 ALTER TABLE `evolution` DISABLE KEYS */;
INSERT INTO `evolution` VALUES (1,NULL,16,2,NULL),(2,1,32,3,NULL),(3,2,NULL,NULL,1),(4,NULL,16,5,NULL),(5,4,32,6,NULL),(6,5,NULL,NULL,1),(7,NULL,16,8,NULL),(8,7,32,9,NULL),(9,8,NULL,NULL,1);
/*!40000 ALTER TABLE `evolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moves`
--

DROP TABLE IF EXISTS `moves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moves` (
  `Type ID` int DEFAULT NULL,
  `Move ID` int NOT NULL,
  `Move Name` varchar(30) DEFAULT NULL,
  `Move Category` varchar(10) DEFAULT NULL,
  `Move Power` int DEFAULT NULL,
  `Move PP` int DEFAULT NULL,
  `Move Accuracy` int DEFAULT NULL,
  PRIMARY KEY (`Move ID`),
  KEY `Type ID` (`Type ID`),
  CONSTRAINT `moves_ibfk_1` FOREIGN KEY (`Type ID`) REFERENCES `type` (`Type ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moves`
--

LOCK TABLES `moves` WRITE;
/*!40000 ALTER TABLE `moves` DISABLE KEYS */;
/*!40000 ALTER TABLE `moves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon` (
  `National Number` int NOT NULL,
  `Regional Number` int DEFAULT NULL,
  `Name` varchar(11) DEFAULT NULL,
  `Height (ft)` float DEFAULT NULL,
  `Weight (kg)` float DEFAULT NULL,
  PRIMARY KEY (`National Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (1,1,'Bulbasaur',2.04,6.9),(2,2,'Ivysaur',3.03,13),(3,3,'Venusaur',6.07,100),(4,4,'Charmander',2,8.5),(5,5,'Charmeleon',3.07,19),(6,6,'Charizard',5.07,90.5),(7,7,'Squirtle',1.08,9),(8,8,'Wartortle',3.03,22.5),(9,9,'Blastoise',5.03,85.8);
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon ability`
--

DROP TABLE IF EXISTS `pokemon ability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon ability` (
  `National Number` int DEFAULT NULL,
  `Ability ID` int DEFAULT NULL,
  `Hidden Ability` tinyint(1) DEFAULT NULL,
  KEY `National Number` (`National Number`),
  KEY `Ability ID` (`Ability ID`),
  CONSTRAINT `pokemon ability_ibfk_1` FOREIGN KEY (`National Number`) REFERENCES `pokemon` (`National Number`),
  CONSTRAINT `pokemon ability_ibfk_2` FOREIGN KEY (`Ability ID`) REFERENCES `ability` (`Ability ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon ability`
--

LOCK TABLES `pokemon ability` WRITE;
/*!40000 ALTER TABLE `pokemon ability` DISABLE KEYS */;
INSERT INTO `pokemon ability` VALUES (3,142,0),(3,24,1),(2,24,1),(2,142,0),(1,142,0),(1,24,1);
/*!40000 ALTER TABLE `pokemon ability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon moves`
--

DROP TABLE IF EXISTS `pokemon moves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon moves` (
  `National Number` int DEFAULT NULL,
  `Move ID` int DEFAULT NULL,
  KEY `Move ID` (`Move ID`),
  CONSTRAINT `pokemon moves_ibfk_1` FOREIGN KEY (`Move ID`) REFERENCES `moves` (`Move ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon moves`
--

LOCK TABLES `pokemon moves` WRITE;
/*!40000 ALTER TABLE `pokemon moves` DISABLE KEYS */;
INSERT INTO `pokemon moves` VALUES (1,33),(4,33),(7,33),(1,39),(4,39),(7,39);
/*!40000 ALTER TABLE `pokemon moves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon types`
--

DROP TABLE IF EXISTS `pokemon types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon types` (
  `National Number` int NOT NULL,
  `Type ID` int DEFAULT NULL,
  `Subtype ID` int DEFAULT NULL,
  PRIMARY KEY (`National Number`),
  KEY `Type ID` (`Type ID`),
  KEY `Subtype ID` (`Subtype ID`),
  CONSTRAINT `pokemon types_ibfk_1` FOREIGN KEY (`National Number`) REFERENCES `pokemon` (`National Number`),
  CONSTRAINT `pokemon types_ibfk_2` FOREIGN KEY (`Type ID`) REFERENCES `type` (`Type ID`),
  CONSTRAINT `pokemon types_ibfk_3` FOREIGN KEY (`Subtype ID`) REFERENCES `type` (`Type ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon types`
--

LOCK TABLES `pokemon types` WRITE;
/*!40000 ALTER TABLE `pokemon types` DISABLE KEYS */;
INSERT INTO `pokemon types` VALUES (1,12,NULL),(2,12,4),(3,12,4),(4,10,NULL),(5,10,NULL),(6,10,3),(7,11,NULL),(8,11,NULL),(9,11,NULL);
/*!40000 ALTER TABLE `pokemon types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pokemon view`
--

DROP TABLE IF EXISTS `pokemon view`;
/*!50001 DROP VIEW IF EXISTS `pokemon view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pokemon view` AS SELECT 
 1 AS `National Number`,
 1 AS `Name`,
 1 AS `HP`,
 1 AS `Attack`,
 1 AS `Defence`,
 1 AS `Special Attack`,
 1 AS `Special Defence`,
 1 AS `Speed`,
 1 AS `Type ID`,
 1 AS `Subtype ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `Type ID` int NOT NULL,
  `Type Name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Type ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Normal'),(2,'Fighting'),(3,'Flying'),(4,'Poison'),(5,'Ground'),(6,'Rock'),(7,'Bug'),(8,'Ghost'),(9,'Steel'),(10,'Fire'),(11,'Water'),(12,'Grass'),(13,'Electric'),(14,'Psychic'),(15,'Ice'),(16,'Dragon'),(17,'Dark'),(18,'Fairy');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type damage`
--

DROP TABLE IF EXISTS `type damage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type damage` (
  `Damaged Type ID` int DEFAULT NULL,
  `Attacker Type ID` int DEFAULT NULL,
  `Damage Multiplier` float DEFAULT NULL,
  KEY `Damaged Type ID` (`Damaged Type ID`),
  KEY `Attacker Type ID` (`Attacker Type ID`),
  CONSTRAINT `type damage_ibfk_1` FOREIGN KEY (`Damaged Type ID`) REFERENCES `type` (`Type ID`),
  CONSTRAINT `type damage_ibfk_2` FOREIGN KEY (`Attacker Type ID`) REFERENCES `type` (`Type ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type damage`
--

LOCK TABLES `type damage` WRITE;
/*!40000 ALTER TABLE `type damage` DISABLE KEYS */;
/*!40000 ALTER TABLE `type damage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `pokemon view`
--

/*!50001 DROP VIEW IF EXISTS `pokemon view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pokemon view` AS select `p`.`National Number` AS `National Number`,`p`.`Name` AS `Name`,`bs`.`HP` AS `HP`,`bs`.`Attack` AS `Attack`,`bs`.`Defence` AS `Defence`,`bs`.`Special Attack` AS `Special Attack`,`bs`.`Special Defence` AS `Special Defence`,`bs`.`Speed` AS `Speed`,`pt`.`Type ID` AS `Type ID`,`pt`.`Subtype ID` AS `Subtype ID` from (((`pokemon` `p` join `base stats` `bs` on((`p`.`National Number` = `bs`.`National Number`))) join `pokemon types` `pt` on((`p`.`National Number` = `pt`.`National Number`))) join `type` `t` on((`pt`.`Type ID` = `t`.`Type ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-25 17:06:07
