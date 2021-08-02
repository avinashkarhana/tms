








 











DROP TABLE IF EXISTS `attendence_attendence`;


CREATE TABLE `attendence_attendence` (
  `id` bigint(20) NOT NULL,
  `tcode` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `datetime` timestamp NOT NULL,
  `status` bigint(20) NOT NULL,
  PRIMARY KEY (`tcode`,`date`)
) ;








INSERT INTO `attendence_attendence` VALUES (1,'1','2019-07-01','2019-06-30 18:39:56',1),(2,'1','2019-07-02','2019-07-01 04:05:14',1),(5,'2','2019-07-01','2019-07-01 16:02:39',0),(7,'2','2019-07-06','2019-07-06 18:07:48',0),(4,'3','2019-07-01','2019-07-01 16:02:39',0),(8,'3','2019-07-06','2019-07-06 18:07:48',0),(3,'4','2019-07-01','2019-07-01 16:02:39',1),(18,'7','2019-07-04','2019-07-07 13:42:34',0),(17,'7','2019-07-05','2019-07-07 13:42:21',1),(6,'7','2019-07-06','2019-07-06 18:07:48',1),(16,'7','2019-07-07','2019-07-07 13:42:01',1),(9,'8','2019-07-06','2019-07-06 18:07:48',1),(15,'9','2019-07-03','2019-07-07 12:37:05',0),(13,'9','2019-07-04','2019-07-07 12:36:28',1),(12,'9','2019-07-05','2019-07-07 12:35:26',1),(10,'9','2019-07-06','2019-07-06 18:07:48',0),(11,'9','2019-07-07','2019-07-07 12:34:58',1),(14,'9','2019-07-08','2019-07-07 12:36:50',0);







DROP TABLE IF EXISTS `auth_group`;


CREATE TABLE `auth_group` (
  `id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ;















DROP TABLE IF EXISTS `auth_group_permissions`;


CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ;















DROP TABLE IF EXISTS `auth_permission`;


CREATE TABLE `auth_permission` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` bigint(20) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ;








INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(29,'Can add mentor',8,'add_mentor'),(30,'Can change mentor',8,'change_mentor'),(31,'Can delete mentor',8,'delete_mentor'),(32,'Can view mentor',8,'view_mentor'),(33,'Can add department',9,'add_department'),(34,'Can change department',9,'change_department'),(35,'Can delete department',9,'delete_department'),(36,'Can view department',9,'view_department'),(37,'Can add group',10,'add_group'),(38,'Can change group',10,'change_group'),(39,'Can delete group',10,'delete_group'),(40,'Can view group',10,'view_group'),(41,'Can add user',11,'add_user'),(42,'Can change user',11,'change_user'),(43,'Can delete user',11,'delete_user'),(44,'Can view user',11,'view_user'),(45,'Can add attendence',12,'add_attendence'),(46,'Can change attendence',12,'change_attendence'),(47,'Can delete attendence',12,'delete_attendence'),(48,'Can view attendence',12,'view_attendence'),(49,'Can add message',13,'add_message'),(50,'Can change message',13,'change_message'),(51,'Can delete message',13,'delete_message'),(52,'Can view message',13,'view_message'),(53,'Can add clearance',14,'add_clearance'),(54,'Can change clearance',14,'change_clearance'),(55,'Can delete clearance',14,'delete_clearance'),(56,'Can view clearance',14,'view_clearance'),(57,'Can add trainee',15,'add_trainee'),(58,'Can change trainee',15,'change_trainee'),(59,'Can delete trainee',15,'delete_trainee'),(60,'Can view trainee',15,'view_trainee'),(61,'Can add crequest',16,'add_crequest'),(62,'Can change crequest',16,'change_crequest'),(63,'Can delete crequest',16,'delete_crequest'),(64,'Can view crequest',16,'view_crequest'),(65,'Can add crequests',16,'add_crequests'),(66,'Can change crequests',16,'change_crequests'),(67,'Can delete crequests',16,'delete_crequests'),(68,'Can view crequests',16,'view_crequests');







DROP TABLE IF EXISTS `auth_user`;


CREATE TABLE `auth_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` timestamp NOT NULL,
  PRIMARY KEY (`username`)
) ;








INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$HydifSVaNFZ3$85ipDvusyoyecYw2MnPS2S+yAzvUrQg1SKplPC+QBbQ=','2019-07-06 10:52:50',1,'avinashkarhana','','','avinashkarhana1@gmail.com',1,1,'2019-06-30 18:39:31');







DROP TABLE IF EXISTS `auth_user_groups`;


CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ;















DROP TABLE IF EXISTS `auth_user_user_permissions`;


CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`)
) ;















DROP TABLE IF EXISTS `clearance_clearance`;


CREATE TABLE `clearance_clearance` (
  `cname` varchar(120) NOT NULL,
  `ccode` bigint(20) NOT NULL,
  `mcode` varchar(10) NOT NULL,
  PRIMARY KEY (`ccode`)
) ;








INSERT INTO `clearance_clearance` VALUES ('Security',1,'10'),('IT',2,'1'),('HR',3,'5'),('Production',4,'2');







DROP TABLE IF EXISTS `crequests_crequests`;


CREATE TABLE `crequests_crequests` (
  `id` bigint(20) NOT NULL,
  `status` varchar(1) NOT NULL,
  `ccode` varchar(10) NOT NULL,
  `tcode` varchar(10) NOT NULL,
  PRIMARY KEY (`tcode`,`ccode`)
) ;








INSERT INTO `crequests_crequests` VALUES (5,'0','1','1'),(1,'1','2','1'),(3,'1','3','1'),(4,'1','4','1'),(10,'2','1','9'),(8,'2','2','9'),(9,'0','3','9'),(11,'1','4','9');







DROP TABLE IF EXISTS `department_department`;


CREATE TABLE `department_department` (
  `name` varchar(120) NOT NULL,
  `dcode` bigint(20) NOT NULL,
  PRIMARY KEY (`dcode`)
) ;








INSERT INTO `department_department` VALUES ('IT',1),('Production',2),('Maintainance',3),('Finance',4),('Human Resource',5),('Security',6);







DROP TABLE IF EXISTS `django_admin_log`;


CREATE TABLE `django_admin_log` (
  `id` bigint(20) NOT NULL,
  `action_time` timestamp NOT NULL,
  `object_id` text,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` bigint(20) NOT NULL,
  `change_message` text NOT NULL,
  `content_type_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ;








INSERT INTO `django_admin_log` VALUES (1,'2019-06-30 18:39:56','1','attendence object (1)',1,'[{\"added\": {}}]',12,1),(6,'2019-06-30 18:43:24','avinashkarhana','user object (avinashkarhana)',1,'[{\"added\": {}}]',11,1),(7,'2019-06-30 18:43:45','maheshkaharana','user object (maheshkaharana)',1,'[{\"added\": {}}]',11,1),(8,'2019-06-30 18:44:07','deepaksaini','user object (deepaksaini)',1,'[{\"added\": {}}]',11,1),(9,'2019-06-30 18:44:23','vinodthakur','user object (vinodthakur)',1,'[{\"added\": {}}]',11,1),(10,'2019-06-30 18:44:39','sanjaykumar','user object (sanjaykumar)',1,'[{\"added\": {}}]',11,1),(11,'2019-06-30 18:45:18','1','mentor object (1)',1,'[{\"added\": {}}]',8,1),(12,'2019-06-30 18:45:36','2','mentor object (2)',1,'[{\"added\": {}}]',8,1),(13,'2019-06-30 18:45:53','1','group object (1)',1,'[{\"added\": {}}]',10,1),(14,'2019-06-30 18:46:03','2','group object (2)',1,'[{\"added\": {}}]',10,1),(15,'2019-06-30 18:46:21','1','department object (1)',1,'[{\"added\": {}}]',9,1),(16,'2019-06-30 18:46:33','2','department object (2)',1,'[{\"added\": {}}]',9,1),(17,'2019-06-30 18:51:31','2','mentor object (2)',2,'[{\"changed\": {\"fields\": [\"co_ord\"]}}]',8,1),(18,'2019-07-01 04:05:14','2','attendence object (2)',1,'[{\"added\": {}}]',12,1),(20,'2019-07-01 09:01:16','3','group object (3)',1,'[{\"added\": {}}]',10,1),(21,'2019-07-01 09:02:56','2','mentor object (2)',2,'[{\"changed\": {\"fields\": [\"co_ord\"]}}]',8,1),(22,'2019-07-01 09:03:11','2','mentor object (2)',2,'[{\"changed\": {\"fields\": [\"co_ord\"]}}]',8,1),(23,'2019-07-01 10:09:35','2','message object (2)',2,'[{\"changed\": {\"fields\": [\"msg\"]}}]',13,1),(28,'2019-07-02 09:11:27','1','trainee object (1)',1,'[{\"added\": {}}]',15,1),(29,'2019-07-02 09:13:12','2','trainee object (2)',1,'[{\"added\": {}}]',15,1),(30,'2019-07-02 09:14:24','3','trainee object (3)',1,'[{\"added\": {}}]',15,1),(31,'2019-07-02 09:15:24','4','trainee object (4)',1,'[{\"added\": {}}]',15,1),(32,'2019-07-02 10:01:55','3','group object (3)',3,'',10,1),(33,'2019-07-02 10:01:55','2','group object (2)',3,'',10,1),(34,'2019-07-02 10:01:55','1','group object (1)',3,'',10,1),(35,'2019-07-02 10:19:55','1','group object (1)',1,'[{\"added\": {}}]',10,1),(36,'2019-07-02 10:20:19','2','group object (2)',1,'[{\"added\": {}}]',10,1),(37,'2019-07-02 10:20:29','3','group object (3)',1,'[{\"added\": {}}]',10,1),(38,'2019-07-02 10:20:42','4','group object (4)',1,'[{\"added\": {}}]',10,1),(39,'2019-07-02 11:32:59','10','group object (10)',3,'',10,1),(40,'2019-07-02 11:32:59','9','group object (9)',3,'',10,1),(41,'2019-07-02 11:32:59','8','group object (8)',3,'',10,1),(42,'2019-07-02 11:32:59','7','group object (7)',3,'',10,1),(43,'2019-07-02 11:32:59','6','group object (6)',3,'',10,1),(44,'2019-07-02 11:32:59','5','group object (5)',3,'',10,1),(45,'2019-07-02 11:34:40','12','group object (12)',3,'',10,1),(46,'2019-07-02 11:34:40','11','group object (11)',3,'',10,1),(47,'2019-07-03 09:09:37','3','department object (3)',1,'[{\"added\": {}}]',9,1),(48,'2019-07-03 09:20:22','4','department object (4)',1,'[{\"added\": {}}]',9,1),(49,'2019-07-03 10:15:49','2','mentor object (2)',2,'[{\"changed\": {\"fields\": [\"co_ord\"]}}]',8,1),(50,'2019-07-03 10:15:56','4','mentor object (4)',2,'[{\"changed\": {\"fields\": [\"co_ord\"]}}]',8,1),(51,'2019-07-03 10:28:09','2','mentor object (2)',2,'[{\"changed\": {\"fields\": [\"co_ord\"]}}]',8,1),(52,'2019-07-03 10:43:27','4','trainee object (4)',3,'',15,1),(53,'2019-07-03 11:22:50','fcjhhvgjh,kjnsf5','user object (fcjhhvgjh,kjnsf5)',3,'',11,1),(54,'2019-07-03 11:43:45','Vir Das6','user object (Vir Das6)',3,'',11,1),(55,'2019-07-03 11:44:17','6','trainee object (6)',3,'',15,1),(56,'2019-07-03 11:44:24','5','trainee object (5)',3,'',15,1),(57,'2019-07-03 11:54:43','5','department object (5)',1,'[{\"added\": {}}]',9,1),(58,'2019-07-03 12:08:03','birbalsingh5','user object (birbalsingh5)',2,'[{\"changed\": {\"fields\": [\"username\"]}}]',11,1),(59,'2019-07-03 12:08:13','virdas7','user object (virdas7)',2,'[{\"changed\": {\"fields\": [\"username\"]}}]',11,1),(60,'2019-07-03 12:11:52','VirDas7','user object (VirDas7)',3,'',11,1),(61,'2019-07-03 12:11:52','BirbalSingh5','user object (BirbalSingh5)',3,'',11,1),(62,'2019-07-05 05:46:58','suryaprakash','user object (suryaprakash)',2,'[{\"changed\": {\"fields\": [\"username\", \"password\"]}}]',11,1),(63,'2019-07-06 12:19:19','birbalsingh5','user object (birbalsingh5)',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',11,1),(64,'2019-07-06 18:01:24','suryaprakash7','user object (suryaprakash7)',3,'',11,1),(65,'2019-07-06 18:01:54','suryaprakash','user object (suryaprakash)',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',11,1),(66,'2019-07-07 11:54:40','30','message object (30)',1,'[{\"added\": {}}]',13,1),(67,'2019-07-07 12:34:58','11','attendence object (11)',1,'[{\"added\": {}}]',12,1),(68,'2019-07-07 12:35:26','12','attendence object (12)',1,'[{\"added\": {}}]',12,1),(69,'2019-07-07 12:36:28','13','attendence object (13)',1,'[{\"added\": {}}]',12,1),(70,'2019-07-07 12:36:50','14','attendence object (14)',1,'[{\"added\": {}}]',12,1),(71,'2019-07-07 12:37:05','15','attendence object (15)',1,'[{\"added\": {}}]',12,1),(72,'2019-07-07 12:54:11','9','trainee object (9)',2,'[{\"changed\": {\"fields\": [\"proj_sub_date\"]}}]',15,1),(73,'2019-07-07 13:23:41','virdas7','user object (virdas7)',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',11,1),(74,'2019-07-07 13:42:01','16','attendence object (16)',1,'[{\"added\": {}}]',12,1),(75,'2019-07-07 13:42:21','17','attendence object (17)',1,'[{\"added\": {}}]',12,1),(76,'2019-07-07 13:42:34','18','attendence object (18)',1,'[{\"added\": {}}]',12,1);







DROP TABLE IF EXISTS `django_content_type`;


CREATE TABLE `django_content_type` (
  `id` bigint(20) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ;








INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'mentor','mentor'),(9,'department','department'),(10,'group','group'),(11,'user','user'),(12,'attendence','attendence'),(13,'message','message'),(14,'clearance','clearance'),(15,'trainee','trainee'),(16,'crequests','crequests');







DROP TABLE IF EXISTS `django_migrations`;


CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ;








INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-06-30 18:26:47'),(2,'auth','0001_initial','2019-06-30 18:26:47'),(3,'admin','0001_initial','2019-06-30 18:26:47'),(4,'admin','0002_logentry_remove_auto_add','2019-06-30 18:26:47'),(5,'admin','0003_logentry_add_action_flag_choices','2019-06-30 18:26:47'),(6,'attendence','0001_initial','2019-06-30 18:26:47'),(7,'attendence','0002_auto_20190619_0446','2019-06-30 18:26:47'),(8,'attendence','0003_auto_20190619_0514','2019-06-30 18:26:47'),(9,'attendence','0004_auto_20190619_0525','2019-06-30 18:26:47'),(10,'attendence','0005_auto_20190619_0552','2019-06-30 18:26:47'),(11,'attendence','0006_auto_20190630_1550','2019-06-30 18:26:47'),(12,'attendence','0007_auto_20190630_2356','2019-06-30 18:26:47'),(13,'contenttypes','0002_remove_content_type_name','2019-06-30 18:26:47'),(14,'auth','0002_alter_permission_name_max_length','2019-06-30 18:26:47'),(15,'auth','0003_alter_user_email_max_length','2019-06-30 18:26:47'),(16,'auth','0004_alter_user_username_opts','2019-06-30 18:26:47'),(17,'auth','0005_alter_user_last_login_null','2019-06-30 18:26:47'),(18,'auth','0006_require_contenttypes_0002','2019-06-30 18:26:47'),(19,'auth','0007_alter_validators_add_error_messages','2019-06-30 18:26:47'),(20,'auth','0008_alter_user_username_max_length','2019-06-30 18:26:47'),(21,'auth','0009_alter_user_last_name_max_length','2019-06-30 18:26:47'),(22,'auth','0010_alter_group_name_max_length','2019-06-30 18:26:47'),(23,'auth','0011_update_proxy_permissions','2019-06-30 18:26:47'),(24,'department','0001_initial','2019-06-30 18:26:47'),(25,'group','0001_initial','2019-06-30 18:26:47'),(26,'group','0002_auto_20190618_1157','2019-06-30 18:26:47'),(27,'group','0003_auto_20190619_0441','2019-06-30 18:26:47'),(28,'mentor','0001_initial','2019-06-30 18:26:47'),(29,'mentor','0002_auto_20190619_0502','2019-06-30 18:26:47'),(30,'mentor','0003_auto_20190620_1712','2019-06-30 18:26:47'),(31,'mentor','0004_mentor_img','2019-06-30 18:26:47'),(32,'message','0001_initial','2019-06-30 18:26:47'),(33,'message','0002_auto_20190619_0552','2019-06-30 18:26:47'),(34,'message','0003_auto_20190624_0609','2019-06-30 18:26:47'),(35,'message','0004_auto_20190624_0609','2019-06-30 18:26:47'),(36,'message','0005_auto_20190626_0955','2019-06-30 18:26:47'),(37,'sessions','0001_initial','2019-06-30 18:26:48'),(51,'user','0001_initial','2019-06-30 18:26:48'),(55,'clearance','0001_initial','2019-07-02 09:01:17'),(56,'trainee','0001_initial','2019-07-02 09:03:23'),(57,'trainee','0002_auto_20190702_1525','2019-07-02 09:55:19'),(58,'mentor','0005_auto_20190702_1526','2019-07-02 09:56:09'),(59,'department','0002_auto_20190702_1526','2019-07-02 09:56:33'),(60,'group','0004_auto_20190702_1526','2019-07-02 10:19:01'),(61,'group','0005_auto_20190702_1531','2019-07-02 10:19:01'),(62,'group','0006_auto_20190702_1532','2019-07-02 10:19:01'),(63,'group','0007_auto_20190702_1543','2019-07-02 10:19:01'),(64,'group','0008_auto_20190702_1551','2019-07-02 10:21:22'),(65,'clearance','0002_auto_20190702_1554','2019-07-02 10:24:13'),(66,'trainee','0003_trainee_dob','2019-07-03 10:40:34'),(67,'trainee','0004_auto_20190703_1712','2019-07-03 11:42:14'),(68,'message','0006_message_datetime','2019-07-04 11:52:18'),(69,'clearance','0003_remove_clearance_dcode','2019-07-06 07:12:26'),(70,'crequests','0001_initial','2019-07-06 08:58:54'),(71,'crequests','0002_auto_20190706_1630','2019-07-06 11:01:03');







DROP TABLE IF EXISTS `django_session`;


CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` text NOT NULL,
  `expire_date` timestamp NOT NULL,
  PRIMARY KEY (`session_key`)
) ;








INSERT INTO `django_session` VALUES ('2gfqfvsrlb5970smgwli6keec46zrpq4','NzBlN2ZkYjU2NDA2ODFjMTJhOWQ0NzdiZTM0NzdiYTdiYzhkZjA2Yzp7InVzZXIiOm51bGx9','2019-07-17 12:16:41'),('2pk5uvldwdyhldz3opmtbq6y5mhsi3jp','OTAyMWM1OWYyMzZiN2IzOWMxOTY3OTMyMWQwNTU2Yjg4MWY1MzUyNzp7InVzZXIiOiJzYW5qYXlrdW1hciJ9','2019-07-16 09:18:13'),('7vvnzdtlsg2et3uejuzs2r0uy55osd8q','NzBlN2ZkYjU2NDA2ODFjMTJhOWQ0NzdiZTM0NzdiYTdiYzhkZjA2Yzp7InVzZXIiOm51bGx9','2019-07-19 06:00:30'),('a9t5y5vdeo7dun4ikurtrtxcd8x3v9dd','YTc3YmNkMDM2OTQ3OTIyYmM3ODdhOGUyYWI4YzgwNjQzNzBkOWUwMTp7InVzZXIiOiJhdmluYXNoa2FyaGFuYSJ9','2019-07-18 17:26:31'),('cmfq1kfhaus1yeod9eaknsrte5q5511h','ZGEyYzAzZGE5YjNmZDY3ZjE1YjliYmI4OWJlMWQyYmM5ZjU3YzhkZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzY0MWJjMzU0MzlmM2FiYTIyZDBlM2U1OGJlMTNlMTc0NDg4ODk1IiwidXNlciI6bnVsbH0=','2019-07-20 17:59:50'),('eqny0py17iqj4w4680uu15sjesnc5rnc','NzBlN2ZkYjU2NDA2ODFjMTJhOWQ0NzdiZTM0NzdiYTdiYzhkZjA2Yzp7InVzZXIiOm51bGx9','2019-07-19 06:23:46'),('gz6zpuux3zrekbb0ei1rknetqoiijl4j','NzBlN2ZkYjU2NDA2ODFjMTJhOWQ0NzdiZTM0NzdiYTdiYzhkZjA2Yzp7InVzZXIiOm51bGx9','2019-07-19 06:00:01'),('ih401zeen7zlxkzx12xivgr84srv4xa0','NzBlN2ZkYjU2NDA2ODFjMTJhOWQ0NzdiZTM0NzdiYTdiYzhkZjA2Yzp7InVzZXIiOm51bGx9','2019-07-21 15:39:50'),('otal7uakh92aj1pcjs62qqyju4zk72gc','MGVkZGVhMDFhZDE0NDUwZjUxYWI2MWYyNDlkYTYyZmYzYzUzZWY2Mzp7InVzZXIiOiJjbHZlcm1hOSJ9','2019-07-19 06:00:52'),('s1h809xr9jpzbe0uoo9csjgloi18ape6','ZDVmNzQ4YzNiYWYyOGQ1Y2ZkZGJmZGYzZGYxNjlhN2M4MTc3NTlmYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MzY0MWJjMzU0MzlmM2FiYTIyZDBlM2U1OGJlMTNlMTc0NDg4ODk1IiwidXNlciI6InZpbm9kdGhha3VyIn0=','2019-07-22 03:34:24'),('sblcy824c7hwq82pqh3gh02vwzvovgce','NzBlN2ZkYjU2NDA2ODFjMTJhOWQ0NzdiZTM0NzdiYTdiYzhkZjA2Yzp7InVzZXIiOm51bGx9','2019-07-18 10:53:42'),('ukqsi9xnxz3kl17tgxdtydt5oo4j52hc','YWIxNjYwM2RmM2ZhZGRiMWZkMzYxNzJjMmNlMzE5NDAzOWMyMjQ1Zjp7InVzZXIiOiJkZWVwYWtzYWluaSJ9','2019-07-17 12:21:32'),('yag9zuwp7oxidbaqyjloucp0ek13fl1w','NzBlN2ZkYjU2NDA2ODFjMTJhOWQ0NzdiZTM0NzdiYTdiYzhkZjA2Yzp7InVzZXIiOm51bGx9','2019-07-19 05:45:51'),('ynlludu4wnp78vjwq3ywew725e3wltx7','NzBlN2ZkYjU2NDA2ODFjMTJhOWQ0NzdiZTM0NzdiYTdiYzhkZjA2Yzp7InVzZXIiOm51bGx9','2019-07-21 12:01:33');







DROP TABLE IF EXISTS `group_group`;


CREATE TABLE `group_group` (
  `dcode` varchar(10) NOT NULL,
  `mcode` varchar(10) NOT NULL,
  `gcode` bigint(20) NOT NULL,
  PRIMARY KEY (`gcode`)
) ;








INSERT INTO `group_group` VALUES ('1','1',1),('2','5',2),('1','1',3),('1','1',4);







DROP TABLE IF EXISTS `mentor_mentor`;


CREATE TABLE `mentor_mentor` (
  `name` varchar(120) NOT NULL,
  `designation` varchar(120) NOT NULL,
  `dcode` varchar(10) NOT NULL,
  `mcode` bigint(20) NOT NULL,
  `co_ord` bigint(20) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mcode`)
) ;








INSERT INTO `mentor_mentor` VALUES ('Vinod Thakur','IT HEAD','1',1,0,9999999991,''),('Sanjay Kumar','Senior Production Manager','2',2,1,9999999999,''),('Parveen Sangwan','Engineer','3',3,0,9999999931,''),('Surya Prakash','Chief Manager','4',4,0,7777777777,''),('Birbal Singh','HR Head','5',5,0,9867898765,''),('Satish Sharma','ABC','1',6,0,9875678769,''),('RAHUL TOMAR','EXECUTIVE','4',8,0,8199800699,''),('C L VERMA','Chief Manager','4',9,0,8199800602,''),('S Gairola','Chief Security Officer','6',10,0,9878787787,'');







DROP TABLE IF EXISTS `message_message`;


CREATE TABLE `message_message` (
  `id` bigint(20) NOT NULL,
  `tocode` varchar(10) NOT NULL,
  `fromcode` varchar(10) NOT NULL,
  `gstatus` bigint(20) NOT NULL,
  `msg` text NOT NULL,
  `fromtype` varchar(1) NOT NULL,
  `totype` varchar(1) NOT NULL,
  `datetime` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ;








INSERT INTO `message_message` VALUES (14,'1','2',0,'Abc','C','G','2019-07-04 11:56:46'),(15,'2','1',0,'pot is good','T','G','2019-07-04 11:57:42'),(16,'2','2',0,'hbmbh','C','G','2019-07-04 11:58:09'),(17,'2','1',0,'gvg','T','G','2019-07-04 11:58:29'),(18,'2','1',0,'hi','T','G','2019-07-04 12:00:51'),(19,'2','2',0,'jhvj','C','G','2019-07-04 12:01:02'),(20,'1','2',1,'Hello','C','T','2019-07-04 12:03:24'),(21,'3','2',1,'Hello','C','T','2019-07-04 17:01:54'),(22,'3','2',1,'I have a news','C','T','2019-07-04 17:03:00'),(23,'3','2',1,'ho','C','T','2019-07-04 17:05:35'),(24,'3','2',1,'bla bla','C','T','2019-07-04 17:26:07'),(25,'3','2',1,'awgvdjgavsda','C','T','2019-07-04 17:26:13'),(26,'3','1',1,'awmdbajw ','T','T','2019-07-04 17:26:42'),(27,'3','1',1,'qwjgqjfq','T','T','2019-07-04 17:26:47'),(28,'1','3',1,'ewbf','T','T','2019-07-04 17:30:39'),(29,'1','3',1,'qdbwqb','T','T','2019-07-04 17:30:42'),(30,'9','2',1,'Hello','M','T','2019-07-07 11:54:35'),(31,'2','9',1,'Hello','T','C','2019-07-07 11:59:58'),(32,'1','9',0,'Hi','T','G','2019-07-07 12:00:22'),(33,'7','9',0,'Hello Vir','T','T','2019-07-07 12:00:37'),(34,'9','2',1,'Hello ABC','C','T','2019-07-07 12:02:41'),(35,'9','2',0,'How about your project progress?','C','T','2019-07-07 12:22:57'),(36,'1','7',0,'Hello Sir','T','M','2019-07-07 13:30:51');







DROP TABLE IF EXISTS `trainee_trainee`;


CREATE TABLE `trainee_trainee` (
  `rep_date` date NOT NULL,
  `tcode` bigint(20) NOT NULL,
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
) ;








INSERT INTO `trainee_trainee` VALUES ('2019-06-06',1,'Avinash Karhana','Omkar Singh','Sunita Rani','S/O Omkar Singh, 150 Bhodwal Majri, Teh. Samalkha',9416029640,'avinashkarhana1@gmail.com','Hemvati Nandan Bahuguna Grahwal University','B.Tech.',4,'1','1','2',NULL,NULL,'2019-07-01',NULL,'','1969-12-31'),('2019-06-06',2,'Mahesh Kaharana','Puran Singh','Mukesh Devi','S/O Puran Singh V.P.O. Bhodwal Majri, Teh. Samalkha, Panipat (Haryana)',9896299217,'maheshkaharana2@gmail.com','Hemvati Nandan Bahuguna Grahwal University','B.Tech.',4,'1','1','2',NULL,NULL,NULL,NULL,'','1969-12-31'),('2019-06-06',3,'Deepak Saini','XYZ','ABC','PQR',9999999991,'a@a.com','NIT','B.Tech.',4,'2','2','2',NULL,NULL,NULL,NULL,'','1969-12-31'),('2019-12-31',7,'Vir Das','Ram Das','Bala','gehwfvvqefvjywhfjh',8786789876,'qja@a.com','vqmhvdsjmqvdj','hjsjwdj,wgdvjwmh',4,'1','1','1',NULL,'9999-12-31','9999-12-31',NULL,'','1995-06-21'),('2019-06-11',8,'Bhag kjdnfgk','kjsnk Ymdm','bdje','hehbflwegfy`',8786999983,'qyy@hsh.com','jhejfd','jhsdbjfb',4,'1','1','1',NULL,'9999-12-31','9999-12-31',NULL,'','1998-01-11'),('9999-12-31',9,'ABCDEFGH','PQRST','KLMNU','EJRBKQBF',9898978678,'A@HBDD.COM','JSGFJS','JVSBDB',4,'1','1','1',NULL,'9999-12-31','1999-12-31',NULL,'','2006-06-15');







DROP TABLE IF EXISTS `user_user`;


CREATE TABLE `user_user` (
  `username` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `utype` varchar(10) NOT NULL,
  `ucode` varchar(10) NOT NULL,
  PRIMARY KEY (`username`)
) ;








INSERT INTO `user_user` VALUES ('abcdefgh9','PQRST@2006','T','9'),('avinashkarhana','A1','T','1'),('bhagkjdnfgk8','kjsnk@1998','T','8'),('birbalsingh5','B1','M','5'),('clverma9','C@8199800602','M','9'),('deepaksaini','D1','T','3'),('maheshkaharana','M1','T','2'),('rahultomar8','RAHUL@8199800699','M','8'),('sanjaykumar','S1','M','2'),('satishsharma6','Satish@9875678769','M','6'),('sgairola10','S@9878787787','M','10'),('suryaprakash','S1','M','7'),('vinodthakur','V1','M','1'),('virdas7','V1','T','7');

















