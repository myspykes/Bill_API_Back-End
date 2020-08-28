-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: lawChamber
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
-- Table structure for table `lawyers`
--

DROP TABLE IF EXISTS `lawyers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lawyers` (
  `employee_ID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `barGrading` int NOT NULL,
  PRIMARY KEY (`employee_ID`),
  UNIQUE KEY `employee_ID_UNIQUE` (`employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lawyers`
--

LOCK TABLES `lawyers` WRITE;
/*!40000 ALTER TABLE `lawyers` DISABLE KEYS */;
INSERT INTO `lawyers` VALUES (1,'Jones','Lartey',250),(2,'Rodney','Boakye',400),(3,'Kofi','Yeboah',250),(4,'Angel','Adoma',200);
/*!40000 ALTER TABLE `lawyers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `repo1`
--

DROP TABLE IF EXISTS `repo1`;
/*!50001 DROP VIEW IF EXISTS `repo1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `repo1` AS SELECT 
 1 AS `employeeID`,
 1 AS `Hours`,
 1 AS `barGrading`,
 1 AS `project_Name`,
 1 AS `p_Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sumspe`
--

DROP TABLE IF EXISTS `sumspe`;
/*!50001 DROP VIEW IF EXISTS `sumspe`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sumspe` AS SELECT 
 1 AS `employeeID`,
 1 AS `hours`,
 1 AS `unit`,
 1 AS `cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tb_projWork`
--

DROP TABLE IF EXISTS `tb_projWork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_projWork` (
  `pro_id` int NOT NULL AUTO_INCREMENT,
  `employeeID` int NOT NULL,
  `project_Name` varchar(45) NOT NULL,
  `p_Date` date NOT NULL,
  `p_Start` time NOT NULL,
  `p_End` time NOT NULL,
  PRIMARY KEY (`pro_id`,`employeeID`),
  UNIQUE KEY `pro_id_UNIQUE` (`pro_id`),
  KEY `emploeeID_idx` (`employeeID`),
  CONSTRAINT `emploeeID` FOREIGN KEY (`employeeID`) REFERENCES `lawyers` (`employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_projWork`
--

LOCK TABLES `tb_projWork` WRITE;
/*!40000 ALTER TABLE `tb_projWork` DISABLE KEYS */;
INSERT INTO `tb_projWork` VALUES (14,1,'MTN','2020-08-28','09:50:00','16:00:00');
/*!40000 ALTER TABLE `tb_projWork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `timesheet`
--

DROP TABLE IF EXISTS `timesheet`;
/*!50001 DROP VIEW IF EXISTS `timesheet`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `timesheet` AS SELECT 
 1 AS `employeeID`,
 1 AS `barGrading`,
 1 AS `project_Name`,
 1 AS `p_Date`,
 1 AS `p_End`,
 1 AS `p_Start`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'lawChamber'
--

--
-- Dumping routines for database 'lawChamber'
--
/*!50003 DROP PROCEDURE IF EXISTS `allTimesheet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `allTimesheet`()
BEGIN
select 
employeeID,
project_Name,
p_Date,
p_Start,
p_End
 from tb_projWork;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `companySum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `companySum`(
IN _project_Name varchar(45) 
)
BEGIN

SELECT employeeID,hour(timediff(p_End,p_Start))as hours, barGrading, 
FORMAT((hour(timediff(p_End,p_Start))*barGrading),2) as cost
 FROM lawChamber.tb_projWork JOIN lawyers ON tb_projwork.employeeID = lawyers.employee_ID where project_Name =_project_Name  
 
  union all
 
 select NULL,NULL ,'TOTAL',FORMAT(sum((hour(timediff(p_End,p_Start))*barGrading)),2)
 from lawChamber.tb_projWork JOIN lawyers ON tb_projwork.employeeID = lawyers.employee_ID where project_Name =_project_Name 
 ;
 


 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `company_sum_range` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `company_sum_range`(
IN _project_Name varchar(45),
in _startRange date,
in _endRange date
)
BEGIN

SELECT employeeID,hour(timediff(p_End,p_Start))as hours, barGrading, 
FORMAT((hour(timediff(p_End,p_Start))*barGrading),2) as cost
 FROM lawChamber.tb_projWork JOIN lawyers ON tb_projwork.employeeID = lawyers.employee_ID where (p_Date BETWEEN _startRange AND _endRange) and ( project_Name =_project_Name ) 
 
  union all
 
 select null,null,'TOTAL',FORMAT(sum((hour(timediff(p_End,p_Start))*barGrading)),2)
 from lawChamber.tb_projWork JOIN lawyers ON tb_projwork.employeeID = lawyers.employee_ID where  (p_Date BETWEEN _startRange AND _endRange) and ( project_Name =_project_Name )
 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lawyerADDInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lawyerADDInfo`(

IN _firstName varchar(45),
IN _lastName varchar(45),
IN _barGrading INT
)
BEGIN
insert INTO lawyers(firstName,lastName,
barGrading) VALUES(_firstName,_lastName,
_barGrading);
SELECT *  from lawyers where firstName= _firstName and lastName=_lastName AND barGrading=_barGrading ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LawyerAddTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LawyerAddTime`(
IN _employeeID INT,
IN _project_Name varchar(45),
IN _p_Date date,
IN _p_Start time,
IN _p_End time
)
BEGIN

insert INTO tb_projWork(employeeID,project_Name,p_Date,
p_Start,p_End) VALUES(_employeeID,_project_Name,
_p_Date,_p_Start,_p_End);
SELECT * from tb_projWork where employeeID=_employeeID and project_Name=_project_Name and p_Date=_p_Date and 
p_Start=_p_Start and p_End=_p_End  ;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lawyerslist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lawyerslist`()
BEGIN
SELECT * FROM lawyers;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `per_timesheet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `per_timesheet`(
in _employeeID int
)
BEGIN
select 
employeeID,
project_Name,
p_Date,
p_Start,
p_End
 from tb_projWork where employeeID =_employeeID ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `timestampsheet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `timestampsheet`(
IN _employeeID int,
IN _startDate Date,
IN _endDate Date
)
BEGIN
select * from lawChamber.timesheet where (p_Date BETWEEN _startDate AND _endDate) and employeeID = _employeeID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `repo1`
--

/*!50001 DROP VIEW IF EXISTS `repo1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `repo1` AS select `timesheet`.`employeeID` AS `employeeID`,format(((time_to_sec(cast(`timesheet`.`p_End` as time)) / 3600) - (time_to_sec(cast(`timesheet`.`p_Start` as time)) / 3600)),0) AS `Hours`,`timesheet`.`barGrading` AS `barGrading`,`timesheet`.`project_Name` AS `project_Name`,`timesheet`.`p_Date` AS `p_Date` from `timesheet` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sumspe`
--

/*!50001 DROP VIEW IF EXISTS `sumspe`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sumspe` AS select `timesheet`.`employeeID` AS `employeeID`,hour(timediff(`timesheet`.`p_End`,`timesheet`.`p_Start`)) AS `hours`,`timesheet`.`barGrading` AS `unit`,format((hour(timediff(`timesheet`.`p_End`,`timesheet`.`p_Start`)) * `timesheet`.`barGrading`),2) AS `cost` from `timesheet` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `timesheet`
--

/*!50001 DROP VIEW IF EXISTS `timesheet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `timesheet` AS select `tb_projwork`.`employeeID` AS `employeeID`,`lawyers`.`barGrading` AS `barGrading`,`tb_projwork`.`project_Name` AS `project_Name`,`tb_projwork`.`p_Date` AS `p_Date`,`tb_projwork`.`p_End` AS `p_End`,`tb_projwork`.`p_Start` AS `p_Start` from (`tb_projwork` join `lawyers` on((`tb_projwork`.`employeeID` = `lawyers`.`employee_ID`))) */;
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

-- Dump completed on 2020-08-28  9:58:50
