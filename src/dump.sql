-- MariaDB dump 10.18  Distrib 10.4.16-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: tms
-- ------------------------------------------------------
-- Server version	10.4.16-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendence_attendence`
--

DROP TABLE IF EXISTS `attendence_attendence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendence_attendence` (
  `id` bigint(20) DEFAULT NULL,
  `tcode` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` bigint(20) NOT NULL,
  PRIMARY KEY (`tcode`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendence_attendence`
--

LOCK TABLES `attendence_attendence` WRITE;
/*!40000 ALTER TABLE `attendence_attendence` DISABLE KEYS */;
INSERT INTO `attendence_attendence` VALUES (1,'1','2019-07-01','2019-06-30 13:09:56',1),(2,'1','2019-07-02','2019-06-30 22:35:14',1),(5,'2','2019-07-01','2019-07-01 10:32:39',0),(7,'2','2019-07-06','2019-07-06 12:37:48',0),(4,'3','2019-07-01','2019-07-01 10:32:39',0),(8,'3','2019-07-06','2019-07-06 12:37:48',0),(3,'4','2019-07-01','2019-07-01 10:32:39',1),(18,'7','2019-07-04','2019-07-07 08:12:34',0),(17,'7','2019-07-05','2019-07-07 08:12:21',1),(6,'7','2019-07-06','2019-07-06 12:37:48',1),(16,'7','2019-07-07','2019-07-07 08:12:01',1),(9,'8','2019-07-06','2019-07-06 12:37:48',1),(15,'9','2019-07-03','2019-07-07 07:07:05',0),(13,'9','2019-07-04','2019-07-07 07:06:28',1),(12,'9','2019-07-05','2019-07-07 07:05:26',1),(10,'9','2019-07-06','2019-07-06 12:37:48',0),(11,'9','2019-07-07','2019-07-07 07:04:58',1),(14,'9','2019-07-08','2019-07-07 07:06:50',0);
/*!40000 ALTER TABLE `attendence_attendence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add department',7,'add_department'),(26,'Can change department',7,'change_department'),(27,'Can delete department',7,'delete_department'),(28,'Can view department',7,'view_department'),(29,'Can add trainee',8,'add_trainee'),(30,'Can change trainee',8,'change_trainee'),(31,'Can delete trainee',8,'delete_trainee'),(32,'Can view trainee',8,'view_trainee'),(33,'Can add mentor',9,'add_mentor'),(34,'Can change mentor',9,'change_mentor'),(35,'Can delete mentor',9,'delete_mentor'),(36,'Can view mentor',9,'view_mentor'),(37,'Can add group',10,'add_group'),(38,'Can change group',10,'change_group'),(39,'Can delete group',10,'delete_group'),(40,'Can view group',10,'view_group'),(41,'Can add user',11,'add_user'),(42,'Can change user',11,'change_user'),(43,'Can delete user',11,'delete_user'),(44,'Can view user',11,'view_user'),(45,'Can add attendence',12,'add_attendence'),(46,'Can change attendence',12,'change_attendence'),(47,'Can delete attendence',12,'delete_attendence'),(48,'Can view attendence',12,'view_attendence'),(49,'Can add message',13,'add_message'),(50,'Can change message',13,'change_message'),(51,'Can delete message',13,'delete_message'),(52,'Can view message',13,'view_message'),(53,'Can add clearance',14,'add_clearance'),(54,'Can change clearance',14,'change_clearance'),(55,'Can delete clearance',14,'delete_clearance'),(56,'Can view clearance',14,'view_clearance'),(57,'Can add crequests',15,'add_crequests'),(58,'Can change crequests',15,'change_crequests'),(59,'Can delete crequests',15,'delete_crequests'),(60,'Can view crequests',15,'view_crequests');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$wDBGozMkFOKk04UQzMPjZX$flznXkq/eIwQ2LlGHeP3llR0IKDidJvO1Bxh2SqHAXc=','2021-09-17 21:58:44.787438',1,'akashverma','','','',1,1,'2021-09-17 21:57:54.020586'),(2,'pbkdf2_sha256$260000$eZkNUqpgXWbDdEQhPFMtSW$vOelv55JxJ0A0SbzWxbFXOKzSa6DFG8Ho+CWJ8qO4rc=',NULL,0,'avinash','','','',0,1,'2021-09-17 22:00:35.325868');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clearance_clearance`
--

DROP TABLE IF EXISTS `clearance_clearance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clearance_clearance` (
  `cname` varchar(120) NOT NULL,
  `ccode` bigint(20) NOT NULL AUTO_INCREMENT,
  `mcode` varchar(10) NOT NULL,
  PRIMARY KEY (`ccode`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clearance_clearance`
--

LOCK TABLES `clearance_clearance` WRITE;
/*!40000 ALTER TABLE `clearance_clearance` DISABLE KEYS */;
INSERT INTO `clearance_clearance` VALUES ('Security',1,'10'),('IT',2,'1'),('HR',3,'5'),('Production',4,'2');
/*!40000 ALTER TABLE `clearance_clearance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crequests_crequests`
--

DROP TABLE IF EXISTS `crequests_crequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crequests_crequests` (
  `id` bigint(20) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `ccode` varchar(10) NOT NULL,
  `tcode` varchar(10) NOT NULL,
  PRIMARY KEY (`tcode`,`ccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crequests_crequests`
--

LOCK TABLES `crequests_crequests` WRITE;
/*!40000 ALTER TABLE `crequests_crequests` DISABLE KEYS */;
INSERT INTO `crequests_crequests` VALUES (5,'0','1','1'),(1,'1','2','1'),(3,'1','3','1'),(4,'1','4','1'),(10,'2','1','9'),(8,'2','2','9'),(9,'0','3','9'),(11,'1','4','9');
/*!40000 ALTER TABLE `crequests_crequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_department`
--

DROP TABLE IF EXISTS `department_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_department` (
  `name` varchar(120) NOT NULL,
  `dcode` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`dcode`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_department`
--

LOCK TABLES `department_department` WRITE;
/*!40000 ALTER TABLE `department_department` DISABLE KEYS */;
INSERT INTO `department_department` VALUES ('IT',1),('Production',2),('Maintainance',3),('Finance',4),('Human Resource',5),('Security',6);
/*!40000 ALTER TABLE `department_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-09-17 22:00:36.483758','2','avinash',1,'[{\"added\": {}}]',4,1),(2,'2021-09-17 22:03:36.230341','akashverma','user object (akashverma)',2,'[{\"changed\": {\"fields\": [\"Username\", \"Password\"]}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'','admin','logentry'),(2,'','auth','permission'),(3,'','auth','group'),(4,'','auth','user'),(5,'','contenttypes','contenttype'),(6,'','sessions','session'),(7,'','department','department'),(8,'','trainee','trainee'),(9,'','mentor','mentor'),(10,'','group','group'),(11,'','user','user'),(12,'','attendence','attendence'),(13,'','message','message'),(14,'','clearance','clearance'),(15,'','crequests','crequests');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-09-17 21:29:28.602931'),(2,'auth','0001_initial','2021-09-17 21:29:40.960408'),(3,'admin','0001_initial','2021-09-17 21:29:44.238850'),(4,'admin','0002_logentry_remove_auto_add','2021-09-17 21:29:44.320289'),(5,'admin','0003_logentry_add_action_flag_choices','2021-09-17 21:29:44.395287'),(6,'attendence','0001_initial','2021-09-17 21:30:49.181524'),(7,'contenttypes','0002_remove_content_type_name','2021-09-17 21:30:49.262921'),(8,'auth','0002_alter_permission_name_max_length','2021-09-17 21:30:49.310956'),(9,'auth','0003_alter_user_email_max_length','2021-09-17 21:30:49.374026'),(10,'auth','0004_alter_user_username_opts','2021-09-17 21:30:49.440882'),(11,'auth','0005_alter_user_last_login_null','2021-09-17 21:30:49.486044'),(12,'auth','0006_require_contenttypes_0002','2021-09-17 21:30:49.530375'),(13,'auth','0007_alter_validators_add_error_messages','2021-09-17 21:30:49.573182'),(14,'auth','0008_alter_user_username_max_length','2021-09-17 21:30:49.618048'),(15,'auth','0009_alter_user_last_name_max_length','2021-09-17 21:30:49.662675'),(16,'auth','0010_alter_group_name_max_length','2021-09-17 21:30:49.835052'),(17,'auth','0011_update_proxy_permissions','2021-09-17 21:30:49.864031'),(18,'auth','0012_alter_user_first_name_max_length','2021-09-17 21:30:49.907282'),(19,'clearance','0001_initial','2021-09-17 21:30:49.951396'),(20,'crequests','0001_initial','2021-09-17 21:30:50.021169'),(21,'department','0001_initial','2021-09-17 21:30:50.051190'),(22,'group','0001_initial','2021-09-17 21:30:50.099251'),(23,'mentor','0001_initial','2021-09-17 21:30:50.166253'),(24,'message','0001_initial','2021-09-17 21:30:50.233861'),(26,'trainee','0001_initial','2021-09-17 21:30:50.341463'),(27,'user','0001_initial','2021-09-17 21:30:50.384789'),(28,'message','0002_alter_message_dateandtime','2021-09-17 21:33:13.584752'),(29,'sessions','0001_initial','2021-09-17 21:42:46.357384');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('43kdsl32sxzlmyh3at7sfeublbxfhxfs','.eJxVzMEOwiAMxvF34WwII7haj959BlJKkTndkrF5Mb67kOyg137__t7K07ZmvxVZ_BDVWXXq8HsLxKNMbYh3mm6z5nlalyHoluh9Lfo6R3lc9vYPyFRy_WYIwNIxnMAiWWeDSQSOjSQTohg2YF0fDSKg69kySmp1nxiPSFTRxlWJxiq-ZHmS-nwBlxs_EA:1mRLxf:ifRb7M1DOv3lm_oSJnunsD25ImKhjQXxZZJA4peFvtA','2021-10-01 22:03:59.659575'),('hleoa90l553bbqvxkqycijm3lajuozrw','eyJ1c2VyIjpudWxsfQ:1mRLe1:9uXD4c3JF6-HX68Zp7SWDpujY2KoHAAiY-SDoel8brc','2021-10-01 21:43:41.933220');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_group`
--

DROP TABLE IF EXISTS `group_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_group` (
  `dcode` varchar(10) NOT NULL,
  `mcode` varchar(10) NOT NULL,
  `gcode` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`gcode`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_group`
--

LOCK TABLES `group_group` WRITE;
/*!40000 ALTER TABLE `group_group` DISABLE KEYS */;
INSERT INTO `group_group` VALUES ('1','1',1),('2','5',2),('1','1',3),('1','1',4);
/*!40000 ALTER TABLE `group_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentor_mentor`
--

DROP TABLE IF EXISTS `mentor_mentor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentor_mentor` (
  `name` varchar(120) NOT NULL,
  `designation` varchar(120) NOT NULL,
  `dcode` varchar(10) NOT NULL,
  `mcode` bigint(20) NOT NULL AUTO_INCREMENT,
  `co_ord` bigint(20) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mcode`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentor_mentor`
--

LOCK TABLES `mentor_mentor` WRITE;
/*!40000 ALTER TABLE `mentor_mentor` DISABLE KEYS */;
INSERT INTO `mentor_mentor` VALUES ('Vinod Thakur','IT HEAD','1',1,0,9999999991,''),('Sanjay Kumar','Senior Production Manager','2',2,1,9999999999,''),('Parveen Sangwan','Engineer','3',3,0,9999999931,''),('Surya Prakash','Chief Manager','4',4,0,7777777777,''),('Birbal Singh','HR Head','5',5,0,9867898765,''),('Satish Sharma','ABC','1',6,0,9875678769,''),('RAHUL TOMAR','EXECUTIVE','4',8,0,8199800699,''),('C L VERMA','Chief Manager','4',9,0,8199800602,''),('S Gairola','Chief Security Officer','6',10,0,9878787787,'');
/*!40000 ALTER TABLE `mentor_mentor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_message`
--

DROP TABLE IF EXISTS `message_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tocode` varchar(10) NOT NULL,
  `fromcode` varchar(10) NOT NULL,
  `gstatus` bigint(20) NOT NULL,
  `msg` text NOT NULL,
  `fromtype` varchar(1) NOT NULL,
  `totype` varchar(1) NOT NULL,
  `dateandtime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_message`
--

LOCK TABLES `message_message` WRITE;
/*!40000 ALTER TABLE `message_message` DISABLE KEYS */;
INSERT INTO `message_message` VALUES (14,'1','2',0,'Abc','C','G','2019-07-04 06:26:46'),(15,'2','1',0,'pot is good','T','G','2019-07-04 06:27:42'),(16,'2','2',0,'hbmbh','C','G','2019-07-04 06:28:09'),(17,'2','1',0,'gvg','T','G','2019-07-04 06:28:29'),(18,'2','1',0,'hi','T','G','2019-07-04 06:30:51'),(19,'2','2',0,'jhvj','C','G','2019-07-04 06:31:02'),(20,'1','2',1,'Hello','C','T','2019-07-04 06:33:24'),(21,'3','2',1,'Hello','C','T','2019-07-04 11:31:54'),(22,'3','2',1,'I have a news','C','T','2019-07-04 11:33:00'),(23,'3','2',1,'ho','C','T','2019-07-04 11:35:35'),(24,'3','2',1,'bla bla','C','T','2019-07-04 11:56:07'),(25,'3','2',1,'awgvdjgavsda','C','T','2019-07-04 11:56:13'),(26,'3','1',1,'awmdbajw ','T','T','2019-07-04 11:56:42'),(27,'3','1',1,'qwjgqjfq','T','T','2019-07-04 11:56:47'),(28,'1','3',1,'ewbf','T','T','2019-07-04 12:00:39'),(29,'1','3',1,'qdbwqb','T','T','2019-07-04 12:00:42'),(30,'9','2',1,'Hello','M','T','2019-07-07 06:24:35'),(31,'2','9',1,'Hello','T','C','2019-07-07 06:29:58'),(32,'1','9',0,'Hi','T','G','2019-07-07 06:30:22'),(33,'7','9',0,'Hello Vir','T','T','2019-07-07 06:30:37'),(34,'9','2',1,'Hello ABC','C','T','2019-07-07 06:32:41'),(35,'9','2',0,'How about your project progress?','C','T','2019-07-07 06:52:57'),(36,'1','7',0,'Hello Sir','T','M','2019-07-07 08:00:51'),(37,'4','2',0,'hi','C','G','2021-09-17 16:17:57'),(38,'2','10',0,'hello sir','T','C','2021-09-17 16:34:25');
/*!40000 ALTER TABLE `message_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainee_trainee`
--

DROP TABLE IF EXISTS `trainee_trainee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainee_trainee` (
  `rep_date` date NOT NULL,
  `tcode` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `fname` varchar(120) NOT NULL,
  `mname` varchar(120) NOT NULL,
  `address` text NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `institute` varchar(200) NOT NULL,
  `qual` varchar(180) NOT NULL,
  `dur` bigint(20) NOT NULL,
  `dcode` varchar(10) DEFAULT NULL,
  `mcode` varchar(10) DEFAULT NULL,
  `gcode` varchar(10) DEFAULT NULL,
  `proj` varchar(200) DEFAULT NULL,
  `proj_assign_date` date DEFAULT NULL,
  `proj_sub_date` date DEFAULT NULL,
  `clearances` varchar(200) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`tcode`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainee_trainee`
--

LOCK TABLES `trainee_trainee` WRITE;
/*!40000 ALTER TABLE `trainee_trainee` DISABLE KEYS */;
INSERT INTO `trainee_trainee` VALUES ('2019-06-06',1,'Avinash Karhana','Omkar Singh','Sunita Rani','S/O Omkar Singh, 150 Bhodwal Majri, Teh. Samalkha',9416029640,'avinashkarhana1@gmail.com','Hemvati Nandan Bahuguna Grahwal University','B.Tech.',4,'1','1','2',NULL,NULL,'2019-07-01',NULL,'','1969-12-31'),('2019-06-06',2,'Mahesh Kaharana','Puran Singh','Mukesh Devi','S/O Puran Singh V.P.O. Bhodwal Majri, Teh. Samalkha, Panipat (Haryana)',9896299217,'maheshkaharana2@gmail.com','Hemvati Nandan Bahuguna Grahwal University','B.Tech.',4,'1','1','2',NULL,NULL,NULL,NULL,'','1969-12-31'),('2019-06-06',3,'Deepak Saini','XYZ','ABC','PQR',9999999991,'a@a.com','NIT','B.Tech.',4,'2','2','2',NULL,NULL,NULL,NULL,'','1969-12-31'),('2019-12-31',7,'Vir Das','Ram Das','Bala','gehwfvvqefvjywhfjh',8786789876,'qja@a.com','vqmhvdsjmqvdj','hjsjwdj,wgdvjwmh',4,'1','1','1',NULL,'9999-12-31','9999-12-31',NULL,'','1995-06-21'),('2019-06-11',8,'Bhag kjdnfgk','kjsnk Ymdm','bdje','hehbflwegfy`',8786999983,'qyy@hsh.com','jhejfd','jhsdbjfb',4,'1','1','1',NULL,'9999-12-31','9999-12-31',NULL,'','1998-01-11'),('9999-12-31',9,'ABCDEFGH','PQRST','KLMNU','EJRBKQBF',9898978678,'A@HBDD.COM','JSGFJS','JVSBDB',4,'1','1','1',NULL,'9999-12-31','1999-12-31',NULL,'','2006-06-15'),('2020-12-31',10,'akash','asfsg','dgdtsn','lko',8597456985,'as@gmail.com','jkgln','hgfty',4,'1','1','1',NULL,'2021-01-31','2021-12-31',NULL,'','2016-02-18');
/*!40000 ALTER TABLE `trainee_trainee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user` (
  `username` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `utype` varchar(10) NOT NULL,
  `ucode` varchar(10) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
INSERT INTO `user_user` VALUES ('abcdefgh9','PQRST@2006','T','9'),('akash10','asfsg@2016','T','10'),('akashverma','A1','T','10'),('avinashkarhana','A1','T','1'),('bhagkjdnfgk8','kjsnk@1998','T','8'),('birbalsingh5','B1','M','5'),('clverma9','C@8199800602','M','9'),('deepaksaini','D1','T','3'),('maheshkaharana','M1','T','2'),('rahultomar8','RAHUL@8199800699','M','8'),('sanjaykumar','S1','M','2'),('satishsharma6','Satish@9875678769','M','6'),('sgairola10','S@9878787787','M','10'),('suryaprakash','S1','M','7'),('vinodthakur','V1','M','1'),('virdas7','V1','T','7');
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-18  3:47:43
