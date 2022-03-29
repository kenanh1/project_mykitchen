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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add korisnici',7,'add_korisnici'),(26,'Can change korisnici',7,'change_korisnici'),(27,'Can delete korisnici',7,'delete_korisnici'),(28,'Can view korisnici',7,'view_korisnici'),(29,'Can add recept test',8,'add_recepttest'),(30,'Can change recept test',8,'change_recepttest'),(31,'Can delete recept test',8,'delete_recepttest'),(32,'Can view recept test',8,'view_recepttest'),(33,'Can add kontakt',9,'add_kontakt'),(34,'Can change kontakt',9,'change_kontakt'),(35,'Can delete kontakt',9,'delete_kontakt'),(36,'Can view kontakt',9,'view_kontakt'),(37,'Can add pretplatnici',10,'add_pretplatnici'),(38,'Can change pretplatnici',10,'change_pretplatnici'),(39,'Can delete pretplatnici',10,'delete_pretplatnici'),(40,'Can view pretplatnici',10,'view_pretplatnici'),(41,'Can add lista zelja',11,'add_listazelja'),(42,'Can change lista zelja',11,'change_listazelja'),(43,'Can delete lista zelja',11,'delete_listazelja'),(44,'Can view lista zelja',11,'view_listazelja'),(45,'Can add nacin pripreme',12,'add_nacinpripreme'),(46,'Can change nacin pripreme',12,'change_nacinpripreme'),(47,'Can delete nacin pripreme',12,'delete_nacinpripreme'),(48,'Can view nacin pripreme',12,'view_nacinpripreme'),(49,'Can add video recepta',13,'add_videorecepta'),(50,'Can change video recepta',13,'change_videorecepta'),(51,'Can delete video recepta',13,'delete_videorecepta'),(52,'Can view video recepta',13,'view_videorecepta'),(53,'Can add vrsta jela',14,'add_vrstajela'),(54,'Can change vrsta jela',14,'change_vrstajela'),(55,'Can delete vrsta jela',14,'delete_vrstajela'),(56,'Can view vrsta jela',14,'view_vrstajela'),(57,'Can add zdrava hrana',15,'add_zdravahrana'),(58,'Can change zdrava hrana',15,'change_zdravahrana'),(59,'Can delete zdrava hrana',15,'delete_zdravahrana'),(60,'Can view zdrava hrana',15,'view_zdravahrana'),(61,'Can add recepti',16,'add_recepti'),(62,'Can change recepti',16,'change_recepti'),(63,'Can delete recepti',16,'delete_recepti'),(64,'Can view recepti',16,'view_recepti'),(65,'Can add cijena recepta',17,'add_cijenarecepta'),(66,'Can change cijena recepta',17,'change_cijenarecepta'),(67,'Can delete cijena recepta',17,'delete_cijenarecepta'),(68,'Can view cijena recepta',17,'view_cijenarecepta'),(69,'Can add sastojci',18,'add_sastojci'),(70,'Can change sastojci',18,'change_sastojci'),(71,'Can delete sastojci',18,'delete_sastojci'),(72,'Can view sastojci',18,'view_sastojci'),(73,'Can add vrsta obroka',19,'add_vrstaobroka'),(74,'Can change vrsta obroka',19,'change_vrstaobroka'),(75,'Can delete vrsta obroka',19,'delete_vrstaobroka'),(76,'Can view vrsta obroka',19,'view_vrstaobroka');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$8wCsDEBX4ShAUAY8Br944X$seI+2V828ufirIpt1++PmiEOjvw4FEmwScRuaY4DW9M=','2022-03-21 21:37:52.294042',1,'kenan','','','hodzickenan96@gmail.com',1,1,'2022-03-21 00:57:22.175624');
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-03-21 01:37:07.292352','1','ReceptTest object (1)',1,'[{\"added\": {}}]',8,1),(2,'2022-03-21 21:39:38.260235','2','ReceptTest object (2)',1,'[{\"added\": {}}]',8,1),(3,'2022-03-21 22:05:28.092507','2','ReceptTest object (2)',2,'[{\"changed\": {\"fields\": [\"Kuhar\"]}}]',8,1),(4,'2022-03-23 01:35:16.056298','1','Kenan Hodzic',1,'[{\"added\": {}}]',7,1),(5,'2022-03-23 01:38:01.295642','1','VrstaJela object (1)',1,'[{\"added\": {}}]',14,1),(6,'2022-03-23 01:51:54.122179','1','VrstaObroka object (1)',1,'[{\"added\": {}}]',19,1),(7,'2022-03-23 01:59:39.002634','1','Francuski Tost',1,'[{\"added\": {}}]',16,1),(8,'2022-03-23 14:55:14.923992','1','NacinPripreme object (1)',1,'[{\"added\": {}}]',12,1),(9,'2022-03-23 14:56:39.929805','1','Francuski Tost',2,'[{\"changed\": {\"fields\": [\"Nacin pripreme id\"]}}]',16,1),(10,'2022-03-23 16:47:55.625162','2','R',1,'[{\"added\": {}}]',19,1),(11,'2022-03-23 16:48:01.135382','3','V',1,'[{\"added\": {}}]',19,1),(12,'2022-03-23 16:48:06.183719','4','P',1,'[{\"added\": {}}]',19,1),(13,'2022-03-23 16:48:26.810177','2','Pit',1,'[{\"added\": {}}]',14,1),(14,'2022-03-23 16:48:34.383208','3','Pas',1,'[{\"added\": {}}]',14,1),(15,'2022-03-23 16:48:39.668238','4','Kol',1,'[{\"added\": {}}]',14,1),(16,'2022-03-23 16:48:45.651315','5','Pec',1,'[{\"added\": {}}]',14,1),(17,'2022-03-23 16:52:23.981770','5','Sendvic',2,'[{\"changed\": {\"fields\": [\"Vrsta jela\"]}}]',14,1),(18,'2022-03-23 16:52:29.450917','4','Kolac',2,'[{\"changed\": {\"fields\": [\"Vrsta jela\"]}}]',14,1),(19,'2022-03-23 16:52:33.780779','3','Pasta',2,'[{\"changed\": {\"fields\": [\"Vrsta jela\"]}}]',14,1),(20,'2022-03-23 16:52:38.362588','2','Pita',2,'[{\"changed\": {\"fields\": [\"Vrsta jela\"]}}]',14,1),(21,'2022-03-23 16:52:45.819102','1','Sen',3,'',14,1),(22,'2022-03-23 16:54:27.771453','4','Dorucak',2,'[{\"changed\": {\"fields\": [\"Vrsta obroka\"]}}]',19,1),(23,'2022-03-23 16:54:31.373060','3','Rucak',2,'[{\"changed\": {\"fields\": [\"Vrsta obroka\"]}}]',19,1),(24,'2022-03-23 16:54:35.115471','2','Rucak',2,'[{\"changed\": {\"fields\": [\"Vrsta obroka\"]}}]',19,1),(25,'2022-03-23 16:54:39.096450','2','Vecera',2,'[{\"changed\": {\"fields\": [\"Vrsta obroka\"]}}]',19,1),(26,'2022-03-23 16:54:43.805251','1','Poslastica',2,'[{\"changed\": {\"fields\": [\"Vrsta obroka\"]}}]',19,1),(27,'2022-03-23 16:58:30.930938','2','Francuski Tost',1,'[{\"added\": {}}]',16,1),(28,'2022-03-23 17:00:51.165691','3','Sendvic sa jajima i lososom',1,'[{\"added\": {}}]',16,1),(29,'2022-03-23 17:05:17.933872','2','NacinPripreme object (2)',1,'[{\"added\": {}}]',12,1),(30,'2022-03-23 17:08:20.089565','2','Francuski Tost',2,'[{\"changed\": {\"fields\": [\"Nacin pripreme id\"]}}]',16,1),(31,'2022-03-23 17:10:32.457975','2','NacinPripreme object (2)',2,'[{\"changed\": {\"fields\": [\"Opis jela\"]}}]',12,1),(32,'2022-03-23 17:14:20.657612','4','Tostirani sendvic sa rastopljenim sirom',1,'[{\"added\": {}}]',16,1),(33,'2022-03-23 17:18:20.292302','2','Emir Razanica',1,'[{\"added\": {}}]',7,1),(34,'2022-03-23 17:18:34.979811','4','Tostirani sendvic sa rastopljenim sirom',2,'[{\"changed\": {\"fields\": [\"Korisnik id\"]}}]',16,1),(35,'2022-03-23 17:19:47.634597','3','NacinPripreme object (3)',1,'[{\"added\": {}}]',12,1),(36,'2022-03-23 17:20:02.588661','3','Sendvic sa jajima i lososom',2,'[{\"changed\": {\"fields\": [\"Nacin pripreme id\"]}}]',16,1),(37,'2022-03-23 17:29:13.226744','5','Zeleni tost sa gljivama',1,'[{\"added\": {}}]',16,1),(38,'2022-03-23 17:30:05.926695','4','NacinPripreme object (4)',1,'[{\"added\": {}}]',12,1),(39,'2022-03-23 17:30:16.076451','5','Zeleni tost sa gljivama',2,'[{\"changed\": {\"fields\": [\"Nacin pripreme id\"]}}]',16,1),(40,'2022-03-23 17:34:35.776338','3','Filip Grbavac',1,'[{\"added\": {}}]',7,1),(41,'2022-03-23 17:35:01.903986','5','Zeleni tost sa gljivama',2,'[{\"changed\": {\"fields\": [\"Korisnik id\"]}}]',16,1),(42,'2022-03-23 18:04:28.571661','4','Alvin Colakovic',1,'[{\"added\": {}}]',7,1),(43,'2022-03-23 18:04:40.503418','3','Sendvic sa jajima i lososom',2,'[{\"changed\": {\"fields\": [\"Korisnik id\"]}}]',16,1),(44,'2022-03-23 20:06:24.202609','3','Sendvic sa jajima i lososom',2,'[{\"changed\": {\"fields\": [\"Ocjena jela\"]}}]',16,1),(45,'2022-03-23 20:06:40.329403','2','Francuski Tost',2,'[{\"changed\": {\"fields\": [\"Ocjena jela\"]}}]',16,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(17,'storefront','cijenarecepta'),(9,'storefront','kontakt'),(7,'storefront','korisnici'),(11,'storefront','listazelja'),(12,'storefront','nacinpripreme'),(10,'storefront','pretplatnici'),(16,'storefront','recepti'),(8,'storefront','recepttest'),(18,'storefront','sastojci'),(13,'storefront','videorecepta'),(14,'storefront','vrstajela'),(19,'storefront','vrstaobroka'),(15,'storefront','zdravahrana');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-03-19 22:33:09.771509'),(2,'auth','0001_initial','2022-03-19 22:33:29.249008'),(3,'admin','0001_initial','2022-03-19 22:33:36.833356'),(4,'admin','0002_logentry_remove_auto_add','2022-03-19 22:33:37.180850'),(5,'admin','0003_logentry_add_action_flag_choices','2022-03-19 22:33:37.395241'),(6,'contenttypes','0002_remove_content_type_name','2022-03-19 22:33:42.397858'),(7,'auth','0002_alter_permission_name_max_length','2022-03-19 22:33:44.527055'),(8,'auth','0003_alter_user_email_max_length','2022-03-19 22:33:44.967131'),(9,'auth','0004_alter_user_username_opts','2022-03-19 22:33:45.140465'),(10,'auth','0005_alter_user_last_login_null','2022-03-19 22:33:47.074700'),(11,'auth','0006_require_contenttypes_0002','2022-03-19 22:33:47.339591'),(12,'auth','0007_alter_validators_add_error_messages','2022-03-19 22:33:47.515598'),(13,'auth','0008_alter_user_username_max_length','2022-03-19 22:33:49.057524'),(14,'auth','0009_alter_user_last_name_max_length','2022-03-19 22:33:50.897137'),(15,'auth','0010_alter_group_name_max_length','2022-03-19 22:33:52.228010'),(16,'auth','0011_update_proxy_permissions','2022-03-19 22:33:52.483813'),(17,'auth','0012_alter_user_first_name_max_length','2022-03-19 22:33:56.517232'),(18,'sessions','0001_initial','2022-03-19 22:33:59.110031'),(19,'storefront','0001_initial','2022-03-21 01:28:14.920276'),(20,'storefront','0002_recepttest','2022-03-21 01:36:02.910867'),(21,'storefront','0003_kontakt_nacinpripreme_pretplatnici_recepti_vrstajela_and_more','2022-03-23 01:17:08.575956'),(22,'storefront','0004_alter_vrstajela_vrsta_jela_and_more','2022-03-23 16:51:58.751850');
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
INSERT INTO `django_session` VALUES ('ofk2ona9d06tkuqr5q5uapq4fw58f84u','.eJxVjMsOwiAQRf-FtSG8BZfu-w1khgGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2IVJdvrdENIjtx3QHdqt89TbuszId4UfdPCpU35eD_fvoMKo3zqF5AOqrED4gkWDSslrIqMwEFgoxjqn9VmiFVlkGUygAKjIOEtOIXt_AAL1OF4:1nWPiq:xnipfGGv-vKpvjZYEsNvoqDWiVPT9yYWALwNcfv8hSM','2022-04-04 21:37:52.432032'),('wvnp6r0qavf6r6po081l3u34a1fsw8go','.eJxVjMsOwiAQRf-FtSG8BZfu-w1khgGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2IVJdvrdENIjtx3QHdqt89TbuszId4UfdPCpU35eD_fvoMKo3zqF5AOqrED4gkWDSslrIqMwEFgoxjqn9VmiFVlkGUygAKjIOEtOIXt_AAL1OF4:1nW6Mo:kBFDgsoa7hzsYj6xWoPmBrBYAFEeOWMTU9YSs7Yyx6Q','2022-04-04 00:57:50.528657');
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
INSERT INTO `storefront_korisnici` VALUES (1,'Kenan','Hodzic','kenanh96@hotmail.com',1,'1234','slike/avatar_stim1.png',0),(2,'Emir','Razanica','test@test.ba',0,'1234','slike/default_avatar.png',8),(3,'Filip','Grbavac','test@test.ba',0,'1234','slike/default_avatar_ojzcEks.png',0),(4,'Alvin','Colakovic','test@test.ba',1,'1234','slike/default_avatar_bG95tB4.png',15);
/*!40000 ALTER TABLE `storefront_korisnici` ENABLE KEYS */;
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
  `recepti_id_id` bigint DEFAULT NULL,
  `sastojak_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storefront_nacinprip_recepti_id_id_69c9557d_fk_storefron` (`recepti_id_id`),
  KEY `storefront_nacinprip_sastojak_id_id_bb06f8d5_fk_storefron` (`sastojak_id_id`),
  CONSTRAINT `storefront_nacinprip_recepti_id_id_69c9557d_fk_storefron` FOREIGN KEY (`recepti_id_id`) REFERENCES `storefront_recepti` (`id`),
  CONSTRAINT `storefront_nacinprip_sastojak_id_id_bb06f8d5_fk_storefron` FOREIGN KEY (`sastojak_id_id`) REFERENCES `storefront_sastojci` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_nacinpripreme`
--

LOCK TABLES `storefront_nacinpripreme` WRITE;
/*!40000 ALTER TABLE `storefront_nacinpripreme` DISABLE KEYS */;
INSERT INTO `storefront_nacinpripreme` VALUES (2,5,10,'1','Francuski tost često nazivaju pohanim kruhom, no iako su glavne namirnice iste, način pripreme i serviranje se razlikuju. Izvrsno se slaže sa svježim, smrznutim i konzerviranim voćem, te jogurtom i pekmezima. Ideja za slatke kombinacije ne nedostaje, a u nastavku pročitajte tajne pripremanja i recept za najfiniji francuski tost.',2,NULL),(3,15,20,'2','Tost sa sirom jedan je od najlakše izvedivih recepata. Čak vam nije potreban ni toster – ovaj sendvič može se zapeći u tavici ili pećnici, kako god vam je lakše.\r\n\r\nOsnovni sastojci koji vam trebaju su, naravno, sir, kruh i maslac. Šnite kruha premažite maslacem s vanjske strane, između posložite sve sastojke i sendvič zagrijte na odabrani način. Što se ‘punjenja’ tiče, pustite mašti na volju! Najidealnije su topive vrste sira, mozzarella, gouda ili možda tilzit, kruh možete odabrati u integralnim varijantama ili potpuno bijeli ako baš nimalo ne želite paziti na kalorije.',3,NULL),(4,30,45,'4+','Ovaj sendvič spaja nekoliko odličnih sastojaka – raženi kruh, avokado, losos, jaja i klice koji zajedno zvuče apsolutno savršeno. Sve što vam treba je šnita tostiranog kruha, vilicom zgnječeni avokado s malo limuna, dimljeni losos i kuhano jaje. Na vrh po želji možete dodati i klice, krastavac, pa čak i kavijar, no sve druge varijante također su dopuštene.',5,NULL);
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
  `kalorije` int NOT NULL,
  `tezina_pripreme` varchar(20) NOT NULL,
  `korisnik_id_id` bigint DEFAULT NULL,
  `nacin_pripreme_id_id` bigint DEFAULT NULL,
  `vrsta_jela_id_id` bigint DEFAULT NULL,
  `vrsta_obroka_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storefront_recepti_vrsta_jela_id_id_3f4ba9f3_fk_storefron` (`vrsta_jela_id_id`),
  KEY `storefront_recepti_vrsta_obroka_id_id_86799ad7_fk_storefron` (`vrsta_obroka_id_id`),
  KEY `storefront_recepti_korisnik_id_id_de10934e_fk_storefron` (`korisnik_id_id`),
  KEY `storefront_recepti_nacin_pripreme_id_id_70292c97_fk_storefron` (`nacin_pripreme_id_id`),
  CONSTRAINT `storefront_recepti_korisnik_id_id_de10934e_fk_storefron` FOREIGN KEY (`korisnik_id_id`) REFERENCES `storefront_korisnici` (`id`),
  CONSTRAINT `storefront_recepti_nacin_pripreme_id_id_70292c97_fk_storefron` FOREIGN KEY (`nacin_pripreme_id_id`) REFERENCES `storefront_nacinpripreme` (`id`),
  CONSTRAINT `storefront_recepti_vrsta_jela_id_id_3f4ba9f3_fk_storefron` FOREIGN KEY (`vrsta_jela_id_id`) REFERENCES `storefront_vrstajela` (`id`),
  CONSTRAINT `storefront_recepti_vrsta_obroka_id_id_86799ad7_fk_storefron` FOREIGN KEY (`vrsta_obroka_id_id`) REFERENCES `storefront_vrstaobroka` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_recepti`
--

LOCK TABLES `storefront_recepti` WRITE;
/*!40000 ALTER TABLE `storefront_recepti` DISABLE KEYS */;
INSERT INTO `storefront_recepti` VALUES (2,'Francuski Tost','slike/francuski-tost2_PeoGdoN.jpg','2','2022-03-09',150,'2',1,2,5,4),(3,'Sendvic sa jajima i lososom','slike/Sendvič-s-lososom.jpg','3','2022-03-15',200,'3',4,3,5,4),(4,'Tostirani sendvic sa rastopljenim sirom','slike/Sendvič-sa-sirom.jpg','5','2022-02-08',180,'2',2,2,5,4),(5,'Zeleni tost sa gljivama','slike/Sendvič-jaje-i-avokado.jpg','5','2022-02-08',87,'3',3,4,5,4);
/*!40000 ALTER TABLE `storefront_recepti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storefront_recepttest`
--

DROP TABLE IF EXISTS `storefront_recepttest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storefront_recepttest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slika_jela` varchar(100) NOT NULL,
  `naziv_jela` varchar(30) NOT NULL,
  `kuhar` varchar(15) NOT NULL,
  `ocjena` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_recepttest`
--

LOCK TABLES `storefront_recepttest` WRITE;
/*!40000 ALTER TABLE `storefront_recepttest` DISABLE KEYS */;
INSERT INTO `storefront_recepttest` VALUES (1,'slike/Zrzut_ekranu_013019_101829_AM.jpg','Test jelo','Kenan',5),(2,'slike/48-meilleurs-thèmes-de-restaurants-WordPress-2020.jpg','Stream Test','Alvin Cola',3);
/*!40000 ALTER TABLE `storefront_recepttest` ENABLE KEYS */;
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
  `broj_kalorija_sastojka` int NOT NULL,
  `recept_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storefront_sastojci_recept_id_id_4d3d8c81_fk_storefron` (`recept_id_id`),
  CONSTRAINT `storefront_sastojci_recept_id_id_4d3d8c81_fk_storefron` FOREIGN KEY (`recept_id_id`) REFERENCES `storefront_recepti` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_sastojci`
--

LOCK TABLES `storefront_sastojci` WRITE;
/*!40000 ALTER TABLE `storefront_sastojci` DISABLE KEYS */;
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
-- Table structure for table `storefront_vrstajela`
--

DROP TABLE IF EXISTS `storefront_vrstajela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storefront_vrstajela` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vrsta_jela` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_vrstajela`
--

LOCK TABLES `storefront_vrstajela` WRITE;
/*!40000 ALTER TABLE `storefront_vrstajela` DISABLE KEYS */;
INSERT INTO `storefront_vrstajela` VALUES (2,'Pita'),(3,'Pasta'),(4,'Kolac'),(5,'Sendvic');
/*!40000 ALTER TABLE `storefront_vrstajela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storefront_vrstaobroka`
--

DROP TABLE IF EXISTS `storefront_vrstaobroka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storefront_vrstaobroka` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vrsta_obroka` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storefront_vrstaobroka`
--

LOCK TABLES `storefront_vrstaobroka` WRITE;
/*!40000 ALTER TABLE `storefront_vrstaobroka` DISABLE KEYS */;
INSERT INTO `storefront_vrstaobroka` VALUES (1,'Poslastica'),(2,'Vecera'),(3,'Rucak'),(4,'Dorucak');
/*!40000 ALTER TABLE `storefront_vrstaobroka` ENABLE KEYS */;
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
  `vrsta_jela_id_id` bigint DEFAULT NULL,
  `vrsta_obroka_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storefront_zdravahra_recepti_id_id_18c898fa_fk_storefron` (`recepti_id_id`),
  KEY `storefront_zdravahra_vrsta_jela_id_id_352bf5ce_fk_storefron` (`vrsta_jela_id_id`),
  KEY `storefront_zdravahra_vrsta_obroka_id_id_0045a69a_fk_storefron` (`vrsta_obroka_id_id`),
  CONSTRAINT `storefront_zdravahra_recepti_id_id_18c898fa_fk_storefron` FOREIGN KEY (`recepti_id_id`) REFERENCES `storefront_recepti` (`id`),
  CONSTRAINT `storefront_zdravahra_vrsta_jela_id_id_352bf5ce_fk_storefron` FOREIGN KEY (`vrsta_jela_id_id`) REFERENCES `storefront_vrstajela` (`id`),
  CONSTRAINT `storefront_zdravahra_vrsta_obroka_id_id_0045a69a_fk_storefron` FOREIGN KEY (`vrsta_obroka_id_id`) REFERENCES `storefront_vrstaobroka` (`id`)
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

-- Dump completed on 2022-03-25 19:03:28
