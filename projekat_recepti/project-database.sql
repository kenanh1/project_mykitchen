-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ita_projekat_recepti
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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add korisnici',7,'add_korisnici'),(26,'Can change korisnici',7,'change_korisnici'),(27,'Can delete korisnici',7,'delete_korisnici'),(28,'Can view korisnici',7,'view_korisnici'),(29,'Can add recept test',8,'add_recepttest'),(30,'Can change recept test',8,'change_recepttest'),(31,'Can delete recept test',8,'delete_recepttest'),(32,'Can view recept test',8,'view_recepttest'),(33,'Can add kontakt',9,'add_kontakt'),(34,'Can change kontakt',9,'change_kontakt'),(35,'Can delete kontakt',9,'delete_kontakt'),(36,'Can view kontakt',9,'view_kontakt'),(37,'Can add pretplatnici',10,'add_pretplatnici'),(38,'Can change pretplatnici',10,'change_pretplatnici'),(39,'Can delete pretplatnici',10,'delete_pretplatnici'),(40,'Can view pretplatnici',10,'view_pretplatnici'),(41,'Can add lista zelja',11,'add_listazelja'),(42,'Can change lista zelja',11,'change_listazelja'),(43,'Can delete lista zelja',11,'delete_listazelja'),(44,'Can view lista zelja',11,'view_listazelja'),(45,'Can add nacin pripreme',12,'add_nacinpripreme'),(46,'Can change nacin pripreme',12,'change_nacinpripreme'),(47,'Can delete nacin pripreme',12,'delete_nacinpripreme'),(48,'Can view nacin pripreme',12,'view_nacinpripreme'),(49,'Can add video recepta',13,'add_videorecepta'),(50,'Can change video recepta',13,'change_videorecepta'),(51,'Can delete video recepta',13,'delete_videorecepta'),(52,'Can view video recepta',13,'view_videorecepta'),(53,'Can add vrsta jela',14,'add_vrstajela'),(54,'Can change vrsta jela',14,'change_vrstajela'),(55,'Can delete vrsta jela',14,'delete_vrstajela'),(56,'Can view vrsta jela',14,'view_vrstajela'),(57,'Can add zdrava hrana',15,'add_zdravahrana'),(58,'Can change zdrava hrana',15,'change_zdravahrana'),(59,'Can delete zdrava hrana',15,'delete_zdravahrana'),(60,'Can view zdrava hrana',15,'view_zdravahrana'),(61,'Can add recepti',16,'add_recepti'),(62,'Can change recepti',16,'change_recepti'),(63,'Can delete recepti',16,'delete_recepti'),(64,'Can view recepti',16,'view_recepti'),(65,'Can add cijena recepta',17,'add_cijenarecepta'),(66,'Can change cijena recepta',17,'change_cijenarecepta'),(67,'Can delete cijena recepta',17,'delete_cijenarecepta'),(68,'Can view cijena recepta',17,'view_cijenarecepta'),(69,'Can add sastojci',18,'add_sastojci'),(70,'Can change sastojci',18,'change_sastojci'),(71,'Can delete sastojci',18,'delete_sastojci'),(72,'Can view sastojci',18,'view_sastojci'),(73,'Can add vrsta obroka',19,'add_vrstaobroka'),(74,'Can change vrsta obroka',19,'change_vrstaobroka'),(75,'Can delete vrsta obroka',19,'delete_vrstaobroka'),(76,'Can view vrsta obroka',19,'view_vrstaobroka'),(77,'Can add korisnik',20,'add_korisnik'),(78,'Can change korisnik',20,'change_korisnik'),(79,'Can delete korisnik',20,'delete_korisnik'),(80,'Can view korisnik',20,'view_korisnik');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$8wCsDEBX4ShAUAY8Br944X$seI+2V828ufirIpt1++PmiEOjvw4FEmwScRuaY4DW9M=','2022-05-22 15:38:19.112705',1,'kenan','Kenan','Hodzic','hodzickenan96@gmail.com',1,1,'2022-03-21 00:57:22.000000'),(4,'pbkdf2_sha256$320000$HO5k2WrsPhoiIwfsJIPk50$qRpqTEuEfjKMUrqtcvnndPtDoHDLs+7iES3IZsQ4nuo=','2022-04-30 20:04:27.003915',0,'kenantest','','','kenantest2@gmail.com',0,1,'2022-04-30 20:04:04.265477'),(6,'pbkdf2_sha256$320000$SdT29grtL8AWgdKxIhFHu0$oVs1GiSV0mXp4XSPxp3vPqd20rE7igBzKsHcZk7OP7k=','2022-05-03 14:14:29.009585',0,'keno5','KenanNN','','kenanh96@hotmail.com',0,1,'2022-04-30 21:48:45.372666');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-03-21 01:37:07.292352','1','ReceptTest object (1)',1,'[{\"added\": {}}]',8,1),(2,'2022-03-21 21:39:38.260235','2','ReceptTest object (2)',1,'[{\"added\": {}}]',8,1),(3,'2022-03-21 22:05:28.092507','2','ReceptTest object (2)',2,'[{\"changed\": {\"fields\": [\"Kuhar\"]}}]',8,1),(4,'2022-03-23 01:35:16.056298','1','Kenan Hodzic',1,'[{\"added\": {}}]',7,1),(5,'2022-03-23 01:38:01.295642','1','VrstaJela object (1)',1,'[{\"added\": {}}]',14,1),(6,'2022-03-23 01:51:54.122179','1','VrstaObroka object (1)',1,'[{\"added\": {}}]',19,1),(7,'2022-03-23 01:59:39.002634','1','Francuski Tost',1,'[{\"added\": {}}]',16,1),(8,'2022-03-23 14:55:14.923992','1','NacinPripreme object (1)',1,'[{\"added\": {}}]',12,1),(9,'2022-03-23 14:56:39.929805','1','Francuski Tost',2,'[{\"changed\": {\"fields\": [\"Nacin pripreme id\"]}}]',16,1),(10,'2022-03-23 16:47:55.625162','2','R',1,'[{\"added\": {}}]',19,1),(11,'2022-03-23 16:48:01.135382','3','V',1,'[{\"added\": {}}]',19,1),(12,'2022-03-23 16:48:06.183719','4','P',1,'[{\"added\": {}}]',19,1),(13,'2022-03-23 16:48:26.810177','2','Pit',1,'[{\"added\": {}}]',14,1),(14,'2022-03-23 16:48:34.383208','3','Pas',1,'[{\"added\": {}}]',14,1),(15,'2022-03-23 16:48:39.668238','4','Kol',1,'[{\"added\": {}}]',14,1),(16,'2022-03-23 16:48:45.651315','5','Pec',1,'[{\"added\": {}}]',14,1),(17,'2022-03-23 16:52:23.981770','5','Sendvic',2,'[{\"changed\": {\"fields\": [\"Vrsta jela\"]}}]',14,1),(18,'2022-03-23 16:52:29.450917','4','Kolac',2,'[{\"changed\": {\"fields\": [\"Vrsta jela\"]}}]',14,1),(19,'2022-03-23 16:52:33.780779','3','Pasta',2,'[{\"changed\": {\"fields\": [\"Vrsta jela\"]}}]',14,1),(20,'2022-03-23 16:52:38.362588','2','Pita',2,'[{\"changed\": {\"fields\": [\"Vrsta jela\"]}}]',14,1),(21,'2022-03-23 16:52:45.819102','1','Sen',3,'',14,1),(22,'2022-03-23 16:54:27.771453','4','Dorucak',2,'[{\"changed\": {\"fields\": [\"Vrsta obroka\"]}}]',19,1),(23,'2022-03-23 16:54:31.373060','3','Rucak',2,'[{\"changed\": {\"fields\": [\"Vrsta obroka\"]}}]',19,1),(24,'2022-03-23 16:54:35.115471','2','Rucak',2,'[{\"changed\": {\"fields\": [\"Vrsta obroka\"]}}]',19,1),(25,'2022-03-23 16:54:39.096450','2','Vecera',2,'[{\"changed\": {\"fields\": [\"Vrsta obroka\"]}}]',19,1),(26,'2022-03-23 16:54:43.805251','1','Poslastica',2,'[{\"changed\": {\"fields\": [\"Vrsta obroka\"]}}]',19,1),(27,'2022-03-23 16:58:30.930938','2','Francuski Tost',1,'[{\"added\": {}}]',16,1),(28,'2022-03-23 17:00:51.165691','3','Sendvic sa jajima i lososom',1,'[{\"added\": {}}]',16,1),(29,'2022-03-23 17:05:17.933872','2','NacinPripreme object (2)',1,'[{\"added\": {}}]',12,1),(30,'2022-03-23 17:08:20.089565','2','Francuski Tost',2,'[{\"changed\": {\"fields\": [\"Nacin pripreme id\"]}}]',16,1),(31,'2022-03-23 17:10:32.457975','2','NacinPripreme object (2)',2,'[{\"changed\": {\"fields\": [\"Opis jela\"]}}]',12,1),(32,'2022-03-23 17:14:20.657612','4','Tostirani sendvic sa rastopljenim sirom',1,'[{\"added\": {}}]',16,1),(33,'2022-03-23 17:18:20.292302','2','Emir Razanica',1,'[{\"added\": {}}]',7,1),(34,'2022-03-23 17:18:34.979811','4','Tostirani sendvic sa rastopljenim sirom',2,'[{\"changed\": {\"fields\": [\"Korisnik id\"]}}]',16,1),(35,'2022-03-23 17:19:47.634597','3','NacinPripreme object (3)',1,'[{\"added\": {}}]',12,1),(36,'2022-03-23 17:20:02.588661','3','Sendvic sa jajima i lososom',2,'[{\"changed\": {\"fields\": [\"Nacin pripreme id\"]}}]',16,1),(37,'2022-03-23 17:29:13.226744','5','Zeleni tost sa gljivama',1,'[{\"added\": {}}]',16,1),(38,'2022-03-23 17:30:05.926695','4','NacinPripreme object (4)',1,'[{\"added\": {}}]',12,1),(39,'2022-03-23 17:30:16.076451','5','Zeleni tost sa gljivama',2,'[{\"changed\": {\"fields\": [\"Nacin pripreme id\"]}}]',16,1),(40,'2022-03-23 17:34:35.776338','3','Filip Grbavac',1,'[{\"added\": {}}]',7,1),(41,'2022-03-23 17:35:01.903986','5','Zeleni tost sa gljivama',2,'[{\"changed\": {\"fields\": [\"Korisnik id\"]}}]',16,1),(42,'2022-03-23 18:04:28.571661','4','Alvin Colakovic',1,'[{\"added\": {}}]',7,1),(43,'2022-03-23 18:04:40.503418','3','Sendvic sa jajima i lososom',2,'[{\"changed\": {\"fields\": [\"Korisnik id\"]}}]',16,1),(44,'2022-03-23 20:06:24.202609','3','Sendvic sa jajima i lososom',2,'[{\"changed\": {\"fields\": [\"Ocjena jela\"]}}]',16,1),(45,'2022-03-23 20:06:40.329403','2','Francuski Tost',2,'[{\"changed\": {\"fields\": [\"Ocjena jela\"]}}]',16,1),(46,'2022-03-26 19:40:18.373782','2','ReceptTest object (2)',3,'',8,1),(47,'2022-03-26 19:40:18.820553','1','ReceptTest object (1)',3,'',8,1),(48,'2022-03-26 20:04:22.923836','4','Način pripreme za : Zeleni tost sa gljivama',2,'[]',12,1),(49,'2022-03-26 23:21:42.123509','1','Jaja',1,'[{\"added\": {}}]',18,1),(50,'2022-03-26 23:22:26.786114','2','Banana',1,'[{\"added\": {}}]',18,1),(51,'2022-03-26 23:23:21.634178','3','Med',1,'[{\"added\": {}}]',18,1),(52,'2022-03-26 23:23:55.203173','2','Način pripreme za : Francuski Tost',2,'[{\"changed\": {\"fields\": [\"Sastojak id\"]}}]',12,1),(53,'2022-03-26 23:38:38.139758','4','Način pripreme za : Zeleni tost sa gljivama',2,'[{\"changed\": {\"fields\": [\"Sastojak id\"]}}]',12,1),(54,'2022-03-27 14:28:13.419284','6','Peciva',1,'[{\"added\": {}}]',14,1),(55,'2022-03-27 14:45:42.191167','4','Mlijeko',1,'[{\"added\": {}}]',18,1),(56,'2022-03-27 14:46:30.765142','4','Način pripreme za : Zeleni tost sa gljivama',2,'[{\"changed\": {\"fields\": [\"Sastojak id\"]}}]',12,1),(57,'2022-03-27 14:47:09.875574','2','Francuski Tost',2,'[]',16,1),(58,'2022-03-27 14:47:44.588020','2','Način pripreme za : Francuski Tost',2,'[{\"changed\": {\"fields\": [\"Sastojak id\"]}}]',12,1),(59,'2022-04-04 18:44:26.149140','5','Dimljeni losos',1,'[{\"added\": {}}]',18,1),(60,'2022-04-04 18:44:50.313518','5','Dimljeni losos',2,'[]',18,1),(61,'2022-04-04 18:45:28.776585','6','Zelena salata',1,'[{\"added\": {}}]',18,1),(62,'2022-04-04 18:46:52.997656','7','Posni sir',1,'[{\"added\": {}}]',18,1),(63,'2022-04-04 18:48:37.159804','8','Proteinski kruh',1,'[{\"added\": {}}]',18,1),(64,'2022-04-04 18:49:07.866147','3','Način pripreme za : Sendvic sa jajima i lososom',2,'[{\"changed\": {\"fields\": [\"Sastojak id\"]}}]',12,1),(65,'2022-04-04 18:51:41.328360','9','Gljive',1,'[{\"added\": {}}]',18,1),(66,'2022-04-04 18:52:11.483605','10','Tost',1,'[{\"added\": {}}]',18,1),(67,'2022-04-04 18:52:27.934838','11','Limun',1,'[{\"added\": {}}]',18,1),(68,'2022-04-04 18:52:45.255264','12','Avokado',1,'[{\"added\": {}}]',18,1),(69,'2022-04-04 18:53:45.125061','13','Cesnjak',1,'[{\"added\": {}}]',18,1),(70,'2022-04-04 18:54:27.572474','14','Maslinovo ulje',1,'[{\"added\": {}}]',18,1),(71,'2022-04-04 18:55:16.784889','4','Način pripreme za : Zeleni tost sa gljivama',2,'[{\"changed\": {\"fields\": [\"Sastojak id\"]}}]',12,1),(72,'2022-04-04 18:59:23.754058','15','Maslac',1,'[{\"added\": {}}]',18,1),(73,'2022-04-04 18:59:40.109468','16','Sir',1,'[{\"added\": {}}]',18,1),(74,'2022-04-04 19:00:24.966634','5','Način pripreme za : Tostirani sendvic sa rastopljenim sirom',1,'[{\"added\": {}}]',12,1),(75,'2022-04-04 19:00:49.260094','4','Tostirani sendvic sa rastopljenim sirom',2,'[{\"changed\": {\"fields\": [\"Nacin pripreme id\"]}}]',16,1),(76,'2022-04-24 17:20:23.193633','1','kenan',2,'[{\"changed\": {\"fields\": [\"First name\"]}}]',4,1),(77,'2022-04-24 18:53:35.724342','4','Tostirani sendvic sa rastopljenim sirom',2,'[{\"changed\": {\"fields\": [\"Korisnik id\"]}}]',16,1),(78,'2022-04-24 18:55:39.821465','2','Emir Razanica',3,'',7,1),(79,'2022-04-24 18:57:48.172165','1','Korisnik object (1)',1,'[{\"added\": {}}]',20,1),(80,'2022-04-28 20:16:34.618930','3','test2',3,'',4,1),(81,'2022-04-28 20:16:34.683079','2','testuser',3,'',4,1),(82,'2022-05-01 17:32:18.695197','12','Korisnik object (12)',3,'',20,1),(83,'2022-05-01 17:32:21.694476','11','Korisnik object (11)',3,'',20,1),(84,'2022-05-01 17:32:24.325203','10','Korisnik object (10)',3,'',20,1),(85,'2022-05-01 17:32:26.749396','9','Korisnik object (9)',3,'',20,1),(86,'2022-05-01 17:32:34.566212','8','Korisnik object (8)',3,'',20,1),(87,'2022-05-01 17:32:37.479259','7','Korisnik object (7)',3,'',20,1),(88,'2022-05-01 17:32:40.136277','6','Korisnik object (6)',3,'',20,1),(89,'2022-05-01 17:32:43.064271','5','Korisnik object (5)',3,'',20,1),(90,'2022-05-01 17:33:14.187818','5','kenan555',3,'',4,1),(91,'2022-05-01 17:46:39.138132','4','keno5',2,'[{\"changed\": {\"fields\": [\"Avatar\"]}}]',20,1),(92,'2022-05-01 17:56:36.492254','16','Korisnik object (16)',3,'',20,1),(93,'2022-05-01 17:56:39.795988','15','Korisnik object (15)',3,'',20,1),(94,'2022-05-01 17:56:43.146134','14','Korisnik object (14)',3,'',20,1),(95,'2022-05-03 10:58:50.658139','20','Korisnik object (20)',3,'',20,1),(96,'2022-05-03 10:58:50.747588','19','Korisnik object (19)',3,'',20,1),(97,'2022-05-03 10:58:50.847628','18','Korisnik object (18)',3,'',20,1),(98,'2022-05-03 10:58:50.988230','17','Korisnik object (17)',3,'',20,1),(99,'2022-05-03 10:58:51.037769','13','Korisnik object (13)',3,'',20,1),(100,'2022-05-03 14:36:35.135053','5','Zeleni tost sa gljivama',2,'[{\"changed\": {\"fields\": [\"User\", \"Korisnik id\"]}}]',16,1),(101,'2022-05-03 14:36:43.291323','4','Tostirani sendvic sa rastopljenim sirom',2,'[{\"changed\": {\"fields\": [\"User\", \"Korisnik id\"]}}]',16,1),(102,'2022-05-03 14:36:54.747918','3','Sendvic sa jajima i lososom',2,'[{\"changed\": {\"fields\": [\"User\", \"Korisnik id\"]}}]',16,1),(103,'2022-05-03 14:37:00.529299','2','Francuski Tost',2,'[{\"changed\": {\"fields\": [\"User\", \"Korisnik id\"]}}]',16,1),(104,'2022-05-22 15:40:28.129189','2','Francuski Tost',2,'[{\"changed\": {\"fields\": [\"Opis jela\"]}}]',16,1),(105,'2022-05-22 15:40:47.282703','2','Francuski Tost',2,'[]',16,1),(106,'2022-05-22 15:41:36.937083','4','Tostirani sendvic sa rastopljenim sirom',2,'[{\"changed\": {\"fields\": [\"Opis jela\"]}}]',16,1),(107,'2022-05-22 15:43:43.628869','5','Zeleni tost sa gljivama',2,'[{\"changed\": {\"fields\": [\"Opis jela\"]}}]',16,1),(108,'2022-05-22 15:44:11.604019','3','Sendvic sa jajima i lososom',2,'[{\"changed\": {\"fields\": [\"Opis jela\"]}}]',16,1),(109,'2022-05-22 16:43:58.885850','5','Zeleni tost sa gljivama',2,'[{\"changed\": {\"fields\": [\"Vrijeme pripreme\", \"Ukupno vrijeme pripreme\"]}}]',16,1),(110,'2022-05-22 16:44:09.487913','4','Tostirani sendvic sa rastopljenim sirom',2,'[{\"changed\": {\"fields\": [\"Vrijeme pripreme\", \"Ukupno vrijeme pripreme\"]}}]',16,1),(111,'2022-05-22 16:44:21.607743','4','Tostirani sendvic sa rastopljenim sirom',2,'[{\"changed\": {\"fields\": [\"Vrijeme pripreme\", \"Ukupno vrijeme pripreme\"]}}]',16,1),(112,'2022-05-22 16:44:32.821509','3','Sendvic sa jajima i lososom',2,'[{\"changed\": {\"fields\": [\"Vrijeme pripreme\", \"Ukupno vrijeme pripreme\"]}}]',16,1),(113,'2022-05-22 16:44:38.603700','2','Francuski Tost',2,'[{\"changed\": {\"fields\": [\"Vrijeme pripreme\"]}}]',16,1),(114,'2022-05-25 20:39:12.706210','6','Kroasan Sendvič',3,'',16,1),(115,'2022-05-25 20:39:16.657312','7','Kroasan Sendvič',3,'',16,1),(116,'2022-05-25 20:39:37.290544','1','Jaja',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(117,'2022-05-25 20:40:02.769532','2','Banana',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(118,'2022-05-25 20:41:22.469305','3','Med',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(119,'2022-05-25 20:41:40.499355','4','Mlijeko',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(120,'2022-05-25 20:41:48.303415','5','Dimljeni losos',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(121,'2022-05-25 20:41:59.242737','6','Zelena salata',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(122,'2022-05-25 20:42:05.307977','7','Posni sir',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(123,'2022-05-25 20:42:25.425624','8','Proteinski kruh',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(124,'2022-05-25 20:42:40.574009','7','Posni sir',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(125,'2022-05-25 20:42:59.145706','9','Gljive',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(126,'2022-05-25 20:43:05.608232','10','Tost',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(127,'2022-05-25 20:43:11.381964','11','Limun',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(128,'2022-05-25 20:43:56.719945','12','Avokado',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(129,'2022-05-25 20:44:09.928801','13','Cesnjak',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(130,'2022-05-25 20:45:00.652162','14','Maslinovo ulje',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(131,'2022-05-25 20:45:09.674746','15','Maslac',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(132,'2022-05-25 20:45:29.819827','16','Sir',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(133,'2022-05-25 20:45:35.612049','15','Maslac',2,'[{\"changed\": {\"fields\": [\"Recept id\"]}}]',18,1),(134,'2022-05-25 21:09:30.102265','1','Jaja',2,'[{\"changed\": {\"fields\": [\"Kolicina\"]}}]',18,1),(135,'2022-05-25 21:09:39.447517','2','Banana',2,'[{\"changed\": {\"fields\": [\"Kolicina\"]}}]',18,1),(136,'2022-05-25 21:10:03.050648','3','Med',2,'[{\"changed\": {\"fields\": [\"Kolicina\"]}}]',18,1),(137,'2022-05-25 21:10:15.675619','4','Mlijeko',2,'[{\"changed\": {\"fields\": [\"Kolicina\"]}}]',18,1),(138,'2022-05-25 21:10:31.666740','5','Dimljeni losos',2,'[{\"changed\": {\"fields\": [\"Kolicina\"]}}]',18,1),(139,'2022-05-25 21:11:16.566595','6','Zelena salata',2,'[{\"changed\": {\"fields\": [\"Kolicina\"]}}]',18,1),(140,'2022-05-25 21:11:44.410969','7','Posni sir',2,'[{\"changed\": {\"fields\": [\"Kolicina\"]}}]',18,1),(141,'2022-05-25 21:11:55.115378','8','Proteinski kruh',2,'[{\"changed\": {\"fields\": [\"Kolicina\"]}}]',18,1),(142,'2022-05-25 21:12:15.363963','9','Gljive',2,'[{\"changed\": {\"fields\": [\"Kolicina\"]}}]',18,1),(143,'2022-05-27 09:00:16.478411','16','Sir',2,'[{\"changed\": {\"fields\": [\"Kolicina\"]}}]',18,1),(144,'2022-05-27 09:00:23.741609','15','Maslac',2,'[{\"changed\": {\"fields\": [\"Kolicina\"]}}]',18,1),(145,'2022-05-27 10:34:46.813727','8','Kroasan Sendvič',2,'[{\"changed\": {\"fields\": [\"Vrsta obroka\"]}}]',16,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(17,'storefront','cijenarecepta'),(9,'storefront','kontakt'),(7,'storefront','korisnici'),(20,'storefront','korisnik'),(11,'storefront','listazelja'),(12,'storefront','nacinpripreme'),(10,'storefront','pretplatnici'),(16,'storefront','recepti'),(8,'storefront','recepttest'),(18,'storefront','sastojci'),(13,'storefront','videorecepta'),(14,'storefront','vrstajela'),(19,'storefront','vrstaobroka'),(15,'storefront','zdravahrana');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-03-19 22:33:09.771509'),(2,'auth','0001_initial','2022-03-19 22:33:29.249008'),(3,'admin','0001_initial','2022-03-19 22:33:36.833356'),(4,'admin','0002_logentry_remove_auto_add','2022-03-19 22:33:37.180850'),(5,'admin','0003_logentry_add_action_flag_choices','2022-03-19 22:33:37.395241'),(6,'contenttypes','0002_remove_content_type_name','2022-03-19 22:33:42.397858'),(7,'auth','0002_alter_permission_name_max_length','2022-03-19 22:33:44.527055'),(8,'auth','0003_alter_user_email_max_length','2022-03-19 22:33:44.967131'),(9,'auth','0004_alter_user_username_opts','2022-03-19 22:33:45.140465'),(10,'auth','0005_alter_user_last_login_null','2022-03-19 22:33:47.074700'),(11,'auth','0006_require_contenttypes_0002','2022-03-19 22:33:47.339591'),(12,'auth','0007_alter_validators_add_error_messages','2022-03-19 22:33:47.515598'),(13,'auth','0008_alter_user_username_max_length','2022-03-19 22:33:49.057524'),(14,'auth','0009_alter_user_last_name_max_length','2022-03-19 22:33:50.897137'),(15,'auth','0010_alter_group_name_max_length','2022-03-19 22:33:52.228010'),(16,'auth','0011_update_proxy_permissions','2022-03-19 22:33:52.483813'),(17,'auth','0012_alter_user_first_name_max_length','2022-03-19 22:33:56.517232'),(18,'sessions','0001_initial','2022-03-19 22:33:59.110031'),(19,'storefront','0001_initial','2022-03-21 01:28:14.920276'),(20,'storefront','0002_recepttest','2022-03-21 01:36:02.910867'),(21,'storefront','0003_kontakt_nacinpripreme_pretplatnici_recepti_vrstajela_and_more','2022-03-23 01:17:08.575956'),(22,'storefront','0004_alter_vrstajela_vrsta_jela_and_more','2022-03-23 16:51:58.751850'),(23,'storefront','0005_delete_recepttest_alter_cijenarecepta_options_and_more','2022-03-26 23:20:42.079311'),(24,'storefront','0006_korisnik','2022-04-24 18:51:39.986490'),(25,'storefront','0007_alter_korisnik_options_alter_korisnik_avatar','2022-04-28 19:38:27.027036'),(26,'storefront','0008_alter_korisnik_avatar','2022-04-28 19:39:17.590396'),(27,'storefront','0009_alter_korisnik_avatar','2022-04-28 19:40:23.886743'),(28,'storefront','0010_alter_korisnik_avatar','2022-04-28 19:41:15.483974'),(29,'storefront','0011_alter_korisnik_avatar','2022-04-28 19:43:31.893744'),(30,'storefront','0012_alter_korisnik_avatar','2022-04-28 19:49:53.860855'),(31,'storefront','0013_alter_korisnik_avatar','2022-05-01 17:06:28.732260'),(32,'storefront','0014_recepti_user','2022-05-03 14:36:03.724571'),(33,'storefront','0015_sastojci_mjerna_jedinica_alter_recepti_datum_objave','2022-05-22 15:10:52.861588'),(34,'storefront','0016_alter_sastojci_mjerna_jedinica','2022-05-22 15:10:52.934092'),(35,'storefront','0017_alter_sastojci_mjerna_jedinica','2022-05-22 15:10:52.988684'),(36,'storefront','0018_alter_sastojci_mjerna_jedinica','2022-05-22 15:10:53.058923'),(37,'storefront','0019_sastojci_kolicina_alter_sastojci_mjerna_jedinica','2022-05-22 15:10:53.108484'),(38,'storefront','0020_remove_nacinpripreme_recepti_id_and_more','2022-05-22 15:10:53.200172'),(39,'storefront','0021_sastojci_kolicina_sastojci_mjerna_jedinica','2022-05-22 15:10:53.272520'),(40,'storefront','0022_remove_sastojci_mjerna_jedinica_and_more','2022-05-22 15:10:53.354921'),(41,'storefront','0023_sastojci_mjerna_jedinica','2022-05-22 15:10:53.404816'),(42,'storefront','0024_alter_sastojci_mjerna_jedinica','2022-05-22 15:10:53.455904'),(43,'storefront','0025_alter_sastojci_mjerna_jedinica','2022-05-22 15:10:53.505293'),(44,'storefront','0002_alter_sastojci_kolicina','2022-05-25 20:35:35.811628'),(45,'storefront','0003_remove_recepti_vrsta_jela_id_and_more','2022-05-27 08:56:00.942475'),(46,'storefront','0004_remove_sastojci_broj_kalorija_sastojka','2022-05-27 09:02:50.221191'),(47,'storefront','0005_remove_recepti_vrsta_obroka_id_and_more','2022-05-27 10:31:09.351242');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1piehyb7r19arm0hpkpwxxn5pjzzclzs','.eJxVjMsOwiAQRf-FtSG8BZfu-w1khgGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2IVJdvrdENIjtx3QHdqt89TbuszId4UfdPCpU35eD_fvoMKo3zqF5AOqrED4gkWDSslrIqMwEFgoxjqn9VmiFVlkGUygAKjIOEtOIXt_AAL1OF4:1nsnet:uIeFkXziYmFKCs2EXtcQVnVK1iFXVWphtGMVjb1L3BI','2022-06-05 15:38:19.240698'),('4a6h2xz0es0ej53oqwr683jn8u81o79c','.eJxVjMsOwiAQRf-FtSG8BZfu-w1khgGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2IVJdvrdENIjtx3QHdqt89TbuszId4UfdPCpU35eD_fvoMKo3zqF5AOqrED4gkWDSslrIqMwEFgoxjqn9VmiFVlkGUygAKjIOEtOIXt_AAL1OF4:1nj6SZ:KIXlhsRfAoZUplkQiL91hJ6BKWeXQBiqrkENAHFzpVU','2022-05-09 21:41:31.582060'),('fx2xvz292a65jwl3wrh3uj51cndtgtco','.eJxVjMsOwiAQRf-FtSG8BZfu-w1khgGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2IVJdvrdENIjtx3QHdqt89TbuszId4UfdPCpU35eD_fvoMKo3zqF5AOqrED4gkWDSslrIqMwEFgoxjqn9VmiFVlkGUygAKjIOEtOIXt_AAL1OF4:1nYT30:RFaze4NcI8oFSfHkvWZImgP_NAAnqye5QWF2Q7OkqH4','2022-04-10 13:35:10.061617'),('k0p51cgdphql5dsrfamqp3po2dqdjdq1','.eJxVjMsOwiAQRf-FtSG8BZfu-w1khgGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2IVJdvrdENIjtx3QHdqt89TbuszId4UfdPCpU35eD_fvoMKo3zqF5AOqrED4gkWDSslrIqMwEFgoxjqn9VmiFVlkGUygAKjIOEtOIXt_AAL1OF4:1nlxt2:B1fZ45AyF6R8tJHrD8PL_JZflrBB_031KLLU9JtpEng','2022-05-17 19:08:40.434848'),('ofk2ona9d06tkuqr5q5uapq4fw58f84u','.eJxVjMsOwiAQRf-FtSG8BZfu-w1khgGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2IVJdvrdENIjtx3QHdqt89TbuszId4UfdPCpU35eD_fvoMKo3zqF5AOqrED4gkWDSslrIqMwEFgoxjqn9VmiFVlkGUygAKjIOEtOIXt_AAL1OF4:1nWPiq:xnipfGGv-vKpvjZYEsNvoqDWiVPT9yYWALwNcfv8hSM','2022-04-04 21:37:52.432032'),('qbfdngqljs48tagudimowgz142c8sl9f','.eJxVjMsOwiAQRf-FtSG8BZfu-w1khgGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2IVJdvrdENIjtx3QHdqt89TbuszId4UfdPCpU35eD_fvoMKo3zqF5AOqrED4gkWDSslrIqMwEFgoxjqn9VmiFVlkGUygAKjIOEtOIXt_AAL1OF4:1npurP:6BjA1jyKT-mMuynF2xZgjWpvV5kh7buRTCboBbT1nVU','2022-05-28 16:43:19.246811'),('wvnp6r0qavf6r6po081l3u34a1fsw8go','.eJxVjMsOwiAQRf-FtSG8BZfu-w1khgGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2IVJdvrdENIjtx3QHdqt89TbuszId4UfdPCpU35eD_fvoMKo3zqF5AOqrED4gkWDSslrIqMwEFgoxjqn9VmiFVlkGUygAKjIOEtOIXt_AAL1OF4:1nW6Mo:kBFDgsoa7hzsYj6xWoPmBrBYAFEeOWMTU9YSs7Yyx6Q','2022-04-04 00:57:50.528657');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storefront_cijenarecepta`
--

DROP TABLE IF EXISTS `storefront_cijenarecepta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storefront_cijenarecepta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `recept_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storefront_cijenarec_recept_id_id_bf15924e_fk_storefron` (`recept_id_id`),
  CONSTRAINT `storefront_cijenarec_recept_id_id_bf15924e_fk_storefron` FOREIGN KEY (`recept_id_id`) REFERENCES `storefront_recepti` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_cijenarecepta`
--

LOCK TABLES `storefront_cijenarecepta` WRITE;
/*!40000 ALTER TABLE `storefront_cijenarecepta` DISABLE KEYS */;
/*!40000 ALTER TABLE `storefront_cijenarecepta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storefront_kontakt`
--

DROP TABLE IF EXISTS `storefront_kontakt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storefront_kontakt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `text_poruke` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_kontakt`
--

LOCK TABLES `storefront_kontakt` WRITE;
/*!40000 ALTER TABLE `storefront_kontakt` DISABLE KEYS */;
/*!40000 ALTER TABLE `storefront_kontakt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storefront_korisnici`
--

DROP TABLE IF EXISTS `storefront_korisnici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storefront_korisnici` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ime` varchar(15) NOT NULL,
  `prezime` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `pretplatnik` tinyint(1) NOT NULL,
  `sifra` varchar(20) NOT NULL,
  `slika_korisnika` varchar(100) NOT NULL,
  `broj_pretplatnika` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_korisnici`
--

LOCK TABLES `storefront_korisnici` WRITE;
/*!40000 ALTER TABLE `storefront_korisnici` DISABLE KEYS */;
INSERT INTO `storefront_korisnici` VALUES (1,'Kenan','Hodzic','kenanh96@hotmail.com',1,'1234','slike/avatar_stim1.png',0),(3,'Filip','Grbavac','test@test.ba',0,'1234','slike/default_avatar_ojzcEks.png',0),(4,'Alvin','Colakovic','test@test.ba',1,'1234','slike/default_avatar_bG95tB4.png',15);
/*!40000 ALTER TABLE `storefront_korisnici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storefront_korisnik`
--

DROP TABLE IF EXISTS `storefront_korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storefront_korisnik` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `storefront_korisnik_user_id_96b33866_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_korisnik`
--

LOCK TABLES `storefront_korisnik` WRITE;
/*!40000 ALTER TABLE `storefront_korisnik` DISABLE KEYS */;
INSERT INTO `storefront_korisnik` VALUES (1,'profile_avatar/amumu_oziq6xa.jpg',1),(2,'',4),(4,'profile_avatar/akali.png',6);
/*!40000 ALTER TABLE `storefront_korisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storefront_listazelja`
--

DROP TABLE IF EXISTS `storefront_listazelja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storefront_listazelja` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `recept_id_id` bigint DEFAULT NULL,
  `user_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storefront_listazelj_recept_id_id_388d0d3d_fk_storefron` (`recept_id_id`),
  KEY `storefront_listazelj_user_id_id_97251784_fk_storefron` (`user_id_id`),
  CONSTRAINT `storefront_listazelj_recept_id_id_388d0d3d_fk_storefron` FOREIGN KEY (`recept_id_id`) REFERENCES `storefront_recepti` (`id`),
  CONSTRAINT `storefront_listazelj_user_id_id_97251784_fk_storefron` FOREIGN KEY (`user_id_id`) REFERENCES `storefront_korisnici` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_listazelja`
--

LOCK TABLES `storefront_listazelja` WRITE;
/*!40000 ALTER TABLE `storefront_listazelja` DISABLE KEYS */;
/*!40000 ALTER TABLE `storefront_listazelja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storefront_nacinpripreme`
--

DROP TABLE IF EXISTS `storefront_nacinpripreme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storefront_nacinpripreme` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vrijeme_pripreme` int NOT NULL,
  `ukupno_vrijeme_pripreme` int NOT NULL,
  `broj_osoba` varchar(20) NOT NULL,
  `opis_jela` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_nacinpripreme`
--

LOCK TABLES `storefront_nacinpripreme` WRITE;
/*!40000 ALTER TABLE `storefront_nacinpripreme` DISABLE KEYS */;
INSERT INTO `storefront_nacinpripreme` VALUES (2,5,10,'1','Francuski tost često nazivaju pohanim kruhom, no iako su glavne namirnice iste, način pripreme i serviranje se razlikuju. Izvrsno se slaže sa svježim, smrznutim i konzerviranim voćem, te jogurtom i pekmezima. Ideja za slatke kombinacije ne nedostaje, a u nastavku pročitajte tajne pripremanja i recept za najfiniji francuski tost.'),(3,15,20,'2','Tost sa sirom jedan je od najlakše izvedivih recepata. Čak vam nije potreban ni toster – ovaj sendvič može se zapeći u tavici ili pećnici, kako god vam je lakše.\r\n\r\nOsnovni sastojci koji vam trebaju su, naravno, sir, kruh i maslac. Šnite kruha premažite maslacem s vanjske strane, između posložite sve sastojke i sendvič zagrijte na odabrani način. Što se ‘punjenja’ tiče, pustite mašti na volju! Najidealnije su topive vrste sira, mozzarella, gouda ili možda tilzit, kruh možete odabrati u integralnim varijantama ili potpuno bijeli ako baš nimalo ne želite paziti na kalorije.'),(4,30,45,'4+','Ovaj sendvič spaja nekoliko odličnih sastojaka – raženi kruh, avokado, losos, jaja i klice koji zajedno zvuče apsolutno savršeno. Sve što vam treba je šnita tostiranog kruha, vilicom zgnječeni avokado s malo limuna, dimljeni losos i kuhano jaje. Na vrh po želji možete dodati i klice, krastavac, pa čak i kavijar, no sve druge varijante također su dopuštene.'),(5,5,7,'2','Tost sa sirom jedan je od najlakše izvedivih recepata. Čak vam nije potreban ni toster – ovaj sendvič može se zapeći u tavici ili pećnici, kako god vam je lakše.');
/*!40000 ALTER TABLE `storefront_nacinpripreme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storefront_pretplatnici`
--

DROP TABLE IF EXISTS `storefront_pretplatnici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storefront_pretplatnici` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_pretplatnici`
--

LOCK TABLES `storefront_pretplatnici` WRITE;
/*!40000 ALTER TABLE `storefront_pretplatnici` DISABLE KEYS */;
/*!40000 ALTER TABLE `storefront_pretplatnici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storefront_recepti`
--

DROP TABLE IF EXISTS `storefront_recepti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storefront_recepti` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `slika_jela` varchar(100) NOT NULL,
  `ocjena_jela` varchar(20) NOT NULL,
  `datum_objave` date NOT NULL,
  `tezina_pripreme` varchar(20) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `broj_osoba` varchar(20) NOT NULL,
  `opis_jela` longtext NOT NULL,
  `ukupno_vrijeme_pripreme` int NOT NULL,
  `vrijeme_pripreme` int NOT NULL,
  `vrsta_obroka` varchar(37) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `storefront_recepti_user_id_5cf739d5_fk_storefront_korisnik_id` (`user_id`),
  CONSTRAINT `storefront_recepti_user_id_5cf739d5_fk_storefront_korisnik_id` FOREIGN KEY (`user_id`) REFERENCES `storefront_korisnik` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_recepti`
--

LOCK TABLES `storefront_recepti` WRITE;
/*!40000 ALTER TABLE `storefront_recepti` DISABLE KEYS */;
INSERT INTO `storefront_recepti` VALUES (2,'Francuski Tost','slike/francuski-tost2_PeoGdoN.jpg','2','2022-03-09','2',1,'1','Francuski tost često nazivaju pohanim kruhom, no iako su glavne namirnice iste, način pripreme i serviranje se razlikuju. Izvrsno se slaže sa svježim, smrznutim i konzerviranim voćem, te jogurtom i pekmezima. Ideja za slatke kombinacije ne nedostaje, a u nastavku pročitajte tajne pripremanja i recept za najfiniji francuski tost.',10,5,'Dorucak'),(3,'Sendvic sa jajima i lososom','slike/Sendvič-s-lososom.jpg','3','2022-03-15','3',4,'1','Osnovni sastojci koji vam trebaju su, naravno, sir, kruh i maslac. Šnite kruha premažite maslacem s vanjske strane, između posložite sve sastojke i sendvič zagrijte na odabrani način. Što se ‘punjenja’ tiče, pustite mašti na volju! Najidealnije su topive vrste sira, mozzarella, gouda ili možda tilzit, kruh možete odabrati u integralnim varijantama ili potpuno bijeli ako baš nimalo ne želite paziti na kalorije.',25,15,'Dorucak'),(4,'Tostirani sendvic sa rastopljenim sirom','slike/Sendvič-sa-sirom.jpg','5','2022-02-08','2',1,'1','Tost sa sirom jedan je od najlakše izvedivih recepata. Čak vam nije potreban ni toster – ovaj sendvič može se zapeći u tavici ili pećnici, kako god vam je lakše.',10,5,'Dorucak'),(5,'Zeleni tost sa gljivama','slike/Sendvič-jaje-i-avokado.jpg','5','2022-02-08','3',1,'1','Ovaj sendvič spaja nekoliko odličnih sastojaka – raženi kruh, avokado, losos, jaja i klice koji zajedno zvuče apsolutno savršeno. Sve što vam treba je šnita tostiranog kruha, vilicom zgnječeni avokado s malo limuna, dimljeni losos i kuhano jaje. Na vrh po želji možete dodati i klice, krastavac, pa čak i kavijar, no sve druge varijante također su dopuštene.',13,7,'Dorucak'),(8,'Kroasan Sendvič','slike/Kroasan-sendvič_jak9hv9.jpg','1','2022-05-25','1',1,'1','Kad tražite ideje za doručak i neki slasni sendvič, odlična je ideja umjesto za kruhom ili nekim pecivom, posegnuti za kroasanom. Iako generalno slatkastog okusa i tradicionalno kombiniran s maslacem i džemom, slane su varijante nevjerojatno ukusne i mogu biti zaista šarolike.',10,6,'Dorucak,Uzina');
/*!40000 ALTER TABLE `storefront_recepti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storefront_sastojci`
--

DROP TABLE IF EXISTS `storefront_sastojci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storefront_sastojci` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ime_sastojka` varchar(50) NOT NULL,
  `recept_id_id` bigint DEFAULT NULL,
  `kolicina` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `storefront_sastojci_recept_id_id_4d3d8c81_fk_storefron` (`recept_id_id`),
  CONSTRAINT `storefront_sastojci_recept_id_id_4d3d8c81_fk_storefron` FOREIGN KEY (`recept_id_id`) REFERENCES `storefront_recepti` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_sastojci`
--

LOCK TABLES `storefront_sastojci` WRITE;
/*!40000 ALTER TABLE `storefront_sastojci` DISABLE KEYS */;
INSERT INTO `storefront_sastojci` VALUES (1,'Jaja',3,'6 kom'),(2,'Banana',2,'3 kom'),(3,'Med',2,'2 kasike'),(4,'Mlijeko',2,'200 ml'),(5,'Dimljeni losos',3,'50 gr'),(6,'Zelena salata',3,'50 gr'),(7,'Posni sir',3,'100 gr'),(8,'Proteinski kruh',3,'2 kriske'),(9,'Gljive',5,'200 gr'),(10,'Tost',5,'0'),(11,'Limun',5,'0'),(12,'Avokado',5,'0'),(13,'Cesnjak',5,'0'),(14,'Maslinovo ulje',5,'0'),(15,'Maslac',4,'50 gr'),(16,'Sir',4,'50 gr'),(17,'Dimljeni losos',8,'100gr'),(18,'Sirni namaz',8,'20gr'),(19,'Zelena salata',8,'50gr'),(20,'Sunka',8,'150gr');
/*!40000 ALTER TABLE `storefront_sastojci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storefront_videorecepta`
--

DROP TABLE IF EXISTS `storefront_videorecepta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storefront_videorecepta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `naziv_videa` varchar(120) NOT NULL,
  `videolink` varchar(200) NOT NULL,
  `korisnik_id_id` bigint DEFAULT NULL,
  `recept_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storefront_videorece_korisnik_id_id_c2a981e1_fk_storefron` (`korisnik_id_id`),
  KEY `storefront_videorece_recept_id_id_ed09f6fa_fk_storefron` (`recept_id_id`),
  CONSTRAINT `storefront_videorece_korisnik_id_id_c2a981e1_fk_storefron` FOREIGN KEY (`korisnik_id_id`) REFERENCES `storefront_korisnici` (`id`),
  CONSTRAINT `storefront_videorece_recept_id_id_ed09f6fa_fk_storefron` FOREIGN KEY (`recept_id_id`) REFERENCES `storefront_recepti` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_videorecepta`
--

LOCK TABLES `storefront_videorecepta` WRITE;
/*!40000 ALTER TABLE `storefront_videorecepta` DISABLE KEYS */;
/*!40000 ALTER TABLE `storefront_videorecepta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storefront_zdravahrana`
--

DROP TABLE IF EXISTS `storefront_zdravahrana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storefront_zdravahrana` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vrsta_hrane` varchar(3) NOT NULL,
  `recepti_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storefront_zdravahra_recepti_id_id_18c898fa_fk_storefron` (`recepti_id_id`),
  CONSTRAINT `storefront_zdravahra_recepti_id_id_18c898fa_fk_storefron` FOREIGN KEY (`recepti_id_id`) REFERENCES `storefront_recepti` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_zdravahrana`
--

LOCK TABLES `storefront_zdravahrana` WRITE;
/*!40000 ALTER TABLE `storefront_zdravahrana` DISABLE KEYS */;
/*!40000 ALTER TABLE `storefront_zdravahrana` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-27 16:04:25
