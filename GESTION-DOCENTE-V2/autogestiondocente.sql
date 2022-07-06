-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: autogestiondocente
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB

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
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL AUTO_INCREMENT,
  `CargoNom` varchar(45) NOT NULL,
  `cargahoraria` int(11) NOT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo_persona`
--

DROP TABLE IF EXISTS `cargo_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo_persona` (
  `cargo_persona_Id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo_idCargo` int(11) NOT NULL,
  `persona_idPersonal` int(11) NOT NULL,
  `Turno` varchar(45) NOT NULL,
  `FechAlta` date NOT NULL,
  `FechBaja` date DEFAULT NULL,
  `ResolucAlta` varchar(45) NOT NULL,
  `ResolucBaja` varchar(45) DEFAULT NULL,
  `CargaHoraria` int(11) DEFAULT NULL,
  `Caracter` varchar(45) NOT NULL,
  PRIMARY KEY (`cargo_persona_Id`),
  KEY `persona_idPersonal` (`persona_idPersonal`),
  KEY `cargo_idCargo` (`cargo_idCargo`),
  CONSTRAINT `fk_cargo_has_persona_Personal1` FOREIGN KEY (`persona_idPersonal`) REFERENCES `persona` (`idPersonal`),
  CONSTRAINT `fk_cargo_has_personal_cargo` FOREIGN KEY (`cargo_idCargo`) REFERENCES `cargo` (`idCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo_persona`
--

LOCK TABLES `cargo_persona` WRITE;
/*!40000 ALTER TABLE `cargo_persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `idPersonal` int(11) NOT NULL AUTO_INCREMENT,
  `cuil` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `fechaNac` date NOT NULL,
  `Domicilio` varchar(45) NOT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `Titulo` varchar(45) NOT NULL,
  `FechInicioDoc` varchar(45) NOT NULL,
  `TelefonoDoc` varchar(255) DEFAULT NULL,
  `EstadoDoc` tinyint(4) NOT NULL,
  PRIMARY KEY (`idPersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (10,'20','cacho','Cristian','2022-06-09','qqq','Santiago del Estero','qqq','2022-04-07','3855808021',1),(11,'20','Morales','Cristian','2022-07-06','octavioccoco12312313','Santiago del Estero','ingles','2022-07-01','3855808021',1),(12,'1242312312','Morales','Cristian','2022-04-06','dfgdfgdfg','Santiago del Estero','sdasd','2022-09-14','3855808021',1),(13,'3873737466','Morales','Cristian','2022-03-10','dfgdfgdfg','Santiago del Estero','bbbbbbb','2022-03-23','3855808021',1);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-05 19:25:42
