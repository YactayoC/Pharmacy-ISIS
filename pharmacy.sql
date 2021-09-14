CREATE DATABASE  IF NOT EXISTS `pharmacydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pharmacydb`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: pharmacydb
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `idCategory` int NOT NULL AUTO_INCREMENT,
  `nameC` varchar(30) NOT NULL,
  `urlCateg` varchar(45) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Farmacia','farmacy.jpg','Productos farmaceuticos'),(2,'Covid','covid.jpg','Productos para el Covid-19'),(3,'Mamá y bebé','baby.jpg','Productos para mamá y bebé'),(4,'Nutrición','nutrition.jpg','Productos de nutrición'),(5,'Dispositivos','device.jpg','Dispositivos médicos para el cuidado de la salud');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `docIdentity` varchar(15) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `idUser` int NOT NULL,
  `idDistrict` int DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  KEY `FK01_idx` (`idDistrict`),
  KEY `FK02_idx` (`idUser`),
  CONSTRAINT `FK01` FOREIGN KEY (`idDistrict`) REFERENCES `district` (`idDistrict`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK02` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'JosephE','Joseph Luis','Espino Delgado','12345678','','987654321',8,3),(2,'JairoP','Jairo','Perez','23145676',NULL,'988775672',9,1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `idDistrict` int NOT NULL AUTO_INCREMENT,
  `nameD` varchar(30) NOT NULL,
  PRIMARY KEY (`idDistrict`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'San Juan de Miraflores'),(2,'Villa El Salvador'),(3,'Villa María del Triunfo'),(4,'Lurín');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `idEmployee` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `docIdentity` varchar(15) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `idRole` int NOT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`idEmployee`),
  KEY `FK06_idx` (`idRole`),
  KEY `FK07_idx` (`idUser`),
  CONSTRAINT `FK06` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK07` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Admin','Admin','12345678','123456789',1,1),(2,'Frank ','Cabanillas Allca','12345678','123456789',2,2),(3,'Kenneth','De la Cruz Romero','12345678','123456789',3,3),(4,'Leonardo','Cruces Huaman','12345678','123456789',3,4),(5,'Marco','Yataco','12345678','123456789',2,5),(6,'Aron','Yactayo','74433077','979225922',2,6),(7,'Sebastián','Chaquila Muñoz','12345678','123456789',2,7);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `gettotal`
--

DROP TABLE IF EXISTS `gettotal`;
/*!50001 DROP VIEW IF EXISTS `gettotal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gettotal` AS SELECT
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `laboratory`
--

DROP TABLE IF EXISTS `laboratory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratory` (
  `idLaboratory` int NOT NULL AUTO_INCREMENT,
  `nameL` varchar(45) NOT NULL,
  PRIMARY KEY (`idLaboratory`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory`
--

LOCK TABLES `laboratory` WRITE;
/*!40000 ALTER TABLE `laboratory` DISABLE KEYS */;
INSERT INTO `laboratory` VALUES (1,'Labofarm'),(2,'Farmindus S.A.'),(3,'Bayer'),(4,'Medifarma S.A.'),(5,'Aventis'),(6,'Sanofi S.A.');
/*!40000 ALTER TABLE `laboratory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metpay`
--

DROP TABLE IF EXISTS `metpay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metpay` (
  `idMetPay` int NOT NULL AUTO_INCREMENT,
  `nameP` varchar(30) NOT NULL,
  PRIMARY KEY (`idMetPay`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metpay`
--

LOCK TABLES `metpay` WRITE;
/*!40000 ALTER TABLE `metpay` DISABLE KEYS */;
INSERT INTO `metpay` VALUES (1,'Tarjeta'),(2,'Efectivo');
/*!40000 ALTER TABLE `metpay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metsale`
--

DROP TABLE IF EXISTS `metsale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metsale` (
  `idMetSale` int NOT NULL AUTO_INCREMENT,
  `nameS` varchar(30) NOT NULL,
  PRIMARY KEY (`idMetSale`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metsale`
--

LOCK TABLES `metsale` WRITE;
/*!40000 ALTER TABLE `metsale` DISABLE KEYS */;
INSERT INTO `metsale` VALUES (1,'Presencial'),(2,'Virtual');
/*!40000 ALTER TABLE `metsale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paudit`
--

DROP TABLE IF EXISTS `paudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paudit` (
  `idPAudit` int NOT NULL AUTO_INCREMENT,
  `registD` date NOT NULL,
  `hour` time NOT NULL,
  `newPhoto` varchar(45) DEFAULT NULL,
  `oldPhoto` varchar(45) DEFAULT NULL,
  `oldPname` varchar(45) DEFAULT NULL,
  `newPname` varchar(45) DEFAULT NULL,
  `oldPprice` decimal(5,3) DEFAULT NULL,
  `newPprice` decimal(5,3) DEFAULT NULL,
  `oldPcateg` varchar(45) DEFAULT NULL,
  `newPcateg` varchar(45) DEFAULT NULL,
  `oldPlab` varchar(45) DEFAULT NULL,
  `newPlab` varchar(45) DEFAULT NULL,
  `oldPpresent` varchar(45) DEFAULT NULL,
  `newPpresent` varchar(45) DEFAULT NULL,
  `action` varchar(10) DEFAULT NULL,
  `employee` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPAudit`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paudit`
--

LOCK TABLES `paudit` WRITE;
/*!40000 ALTER TABLE `paudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `paudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentation`
--

DROP TABLE IF EXISTS `presentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presentation` (
  `idPresentation` int NOT NULL,
  `namePr` varchar(30) NOT NULL,
  PRIMARY KEY (`idPresentation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentation`
--

LOCK TABLES `presentation` WRITE;
/*!40000 ALTER TABLE `presentation` DISABLE KEYS */;
INSERT INTO `presentation` VALUES (1,'Inyectable'),(2,'Jarabe'),(3,'Blister'),(4,'Individual'),(5,'Paquete');
/*!40000 ALTER TABLE `presentation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `nameP` varchar(30) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `stock` int NOT NULL,
  `urlPhoto` varchar(50) NOT NULL,
  `detail` varchar(100) NOT NULL,
  `idLaboratory` int NOT NULL,
  `idCategory` int NOT NULL,
  `idPresentation` int NOT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `FK09_idx` (`idLaboratory`),
  KEY `FK10_idx` (`idCategory`),
  KEY `FK11_idx` (`idPresentation`),
  CONSTRAINT `FK09` FOREIGN KEY (`idLaboratory`) REFERENCES `laboratory` (`idLaboratory`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK10` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK11` FOREIGN KEY (`idPresentation`) REFERENCES `presentation` (`idPresentation`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Paracetamol',3.00,25,'Paracetamol.webp','Blister de paracetamol',1,1,3),(2,'Aspirina',80.00,10,'Aspirina.webp','40 tabletas de 81 mg',2,1,3),(3,'Bismutol',16.00,6,'Bismutol.webp','Frasco 150 ML',3,1,2),(4,'Abrilar',34.00,10,'Abrilar.webp','Frasco 200 ML',4,1,2),(5,'Provita',70.00,5,'Provita.webp','Frasco 20 ML',2,1,2),(6,'Mascarilla',8.00,50,'Mascarilla.webp','Mascarilla certificada',3,2,4),(7,'Oxímetro',60.00,20,'Oximetro.webp','Oxímetro de Pulso Fingertip LED  Caja 1 UN',2,2,4),(8,'Balon de oxigeno',600.00,10,'Balon_oxigeno.webp','Balon de oxigen con capacidad de 20m3',3,2,4),(9,'Alcohol ',20.00,10,'Alcohol.webp','Alcohol Medicinal 70% con Atomizador Frasco 500 ML',1,2,4),(10,'Jabon liquido',9.00,22,'Jabon_liquido.webp','Que es liquido y jabonoso y huele rico ',4,2,4),(11,'Pañal',25.00,60,'Panial.webp','Viene con alcohol',2,3,5),(12,'Papilla',15.00,23,'Papilla.webp','Sabor a durazno',3,3,4),(13,'Tinte para cabello',30.00,50,'Tinte-para-cabello.webp','Para mujer',1,3,4),(14,'Toallas higienicas',15.00,13,'Toallas-higienicas.webp','Ultrafinas',2,3,5),(15,'Toallitas húmedas',7.00,20,'Toallas-humedas.webp','Bolsa 60 UN',4,3,5),(16,'Emulsion de scott',30.00,10,'Emulsion-de-scott.webp','Sabor Cereza',2,4,2),(17,'Granola',10.00,10,'Granola.webp','formado por nueces copos de avena mezclados con miel y otros ingredientes naturales',2,4,4),(18,'Provita',80.00,15,'Provita10g20mL.webp','10g/20mL',3,4,1),(19,'Hidroferol',85.00,20,'Hidroferol.webp','0.266mg',4,4,5),(20,'Magnesio + Zinc Vivactiv',10.00,23,'Magnesio-Zinc Vivactiv.webp','Efervescente Sabor Naranja',2,4,3),(21,'Termometro',90.00,14,'Termometro.webp','Infrarojo Perfar - Unidad 1 UN',1,5,4),(22,'Estetoscopio',300.00,5,'Estetoscopio.webp','Littmann',2,5,4),(23,'Holter cardiaco',800.00,5,'holter-cardiaco.webp','inalambrico',3,5,4),(24,'Boquilla de respirador',10.00,20,'Boquilla-de-respirador.webp','Resistente',4,5,4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertP` AFTER INSERT ON `product` FOR EACH ROW BEGIN
      INSERT INTO paudit (registD,hour,newPhoto,newPname,newPprice,newPcateg,newPlab,newPpresent,action)
      values (now(),current_time(),new.urlPhoto,new.nameP,new.price,new.idCategory,new.idLaboratory,new.idPresentation,'INSERT');  
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updateP` BEFORE UPDATE ON `product` FOR EACH ROW BEGIN
      INSERT INTO paudit (registD,hour,newPhoto,oldPhoto,newPname,oldPname,newPprice,oldPprice,newPcateg,oldPcateg,newPlab,oldPlab,newPpresent,oldPpresent,action)
      values (now(),current_time(),new.urlPhoto,old.urlPhoto,new.nameP,old.nameP,new.price,old.price,new.idCategory,old.idCategory,new.idLaboratory,old.idLaboratory,new.idPresentation,old.idPresentation,'UPDATE');  
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `deleteP` AFTER DELETE ON `product` FOR EACH ROW BEGIN
      INSERT INTO paudit (registD,hour,oldPhoto,oldPname,oldPprice,oldPcateg,oldPlab,oldPpresent,action)
      values (now(),current_time(),old.urlPhoto,old.nameP,old.price,old.idCategory,old.idLaboratory,old.idPresentation,'DELETE');  
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `idReceipt` int NOT NULL AUTO_INCREMENT,
  `serialN` varchar(20) NOT NULL,
  `dateP` date NOT NULL,
  `delSt` tinyint NOT NULL DEFAULT '0',
  `idClient` int NOT NULL,
  `idEmployee` int NOT NULL,
  `idmetPay` int NOT NULL,
  `idmetSale` int NOT NULL,
  PRIMARY KEY (`idReceipt`),
  KEY `FK03_idx` (`idClient`),
  KEY `FK04_idx` (`idmetPay`),
  KEY `FK05_idx` (`idmetSale`),
  KEY `FK08_idx` (`idEmployee`),
  CONSTRAINT `FK03` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK04` FOREIGN KEY (`idmetPay`) REFERENCES `metpay` (`idMetPay`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK05` FOREIGN KEY (`idmetSale`) REFERENCES `metsale` (`idMetSale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK08` FOREIGN KEY (`idEmployee`) REFERENCES `employee` (`idEmployee`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiptdetail`
--

DROP TABLE IF EXISTS `receiptdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receiptdetail` (
  `idReceiptDetail` int NOT NULL AUTO_INCREMENT,
  `price` decimal(5,2) NOT NULL,
  `quantity` int NOT NULL,
  `idProduct` int NOT NULL,
  `idReceipt` int NOT NULL,
  PRIMARY KEY (`idReceiptDetail`),
  KEY `FK12_idx` (`idProduct`),
  KEY `FK13_idx` (`idReceipt`),
  CONSTRAINT `FK12` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK13` FOREIGN KEY (`idReceipt`) REFERENCES `receipt` (`idReceipt`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiptdetail`
--

LOCK TABLES `receiptdetail` WRITE;
/*!40000 ALTER TABLE `receiptdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `receiptdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `idRole` int NOT NULL AUTO_INCREMENT,
  `nameR` varchar(30) NOT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Vendedor'),(3,'Repartidor');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(20) NOT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `flag` tinyint DEFAULT NULL,
  `idMongo` varchar(30) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,'Client','Client',NULL,0),(1,'admin@isis.com','admin123','employee.png',1),(2,'frank@gmail.com','admin123','employee.png',1),(3,'kenneth@gmail.com','admin123','employee.png',1),(4,'leonardo@gmail.com','admin123','employee.png',1),(5,'yataco@gmail.com','admin123','employee.png',1),(6,'yactayo@gmail.com','admin123','employee.png',1),(7,'sebas@gmail.com','admin123','employee.png',1),(8,'joseph@gmail.com','joseph2021','client.png',0),(9,'jairo@gmail.com','jairo2021','client.png',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-14 11:41:53
