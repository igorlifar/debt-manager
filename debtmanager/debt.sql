-- MySQL dump 10.13  Distrib 5.1.61, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: debtmanager
-- ------------------------------------------------------
-- Server version	5.1.61

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_fbfc09f1` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add user profile',9,'add_userprofile'),(26,'Can change user profile',9,'change_userprofile'),(27,'Can delete user profile',9,'delete_userprofile'),(28,'Can add group',10,'add_group'),(29,'Can change group',10,'change_group'),(30,'Can delete group',10,'delete_group'),(31,'Can add category',11,'add_category'),(32,'Can change category',11,'change_category'),(33,'Can delete category',11,'delete_category'),(34,'Can add waste',12,'add_waste'),(35,'Can change waste',12,'change_waste'),(36,'Can delete waste',12,'delete_waste'),(37,'Can add waste part',13,'add_wastepart'),(38,'Can change waste part',13,'change_wastepart'),(39,'Can delete waste part',13,'delete_wastepart'),(40,'Can add repayment',14,'add_repayment'),(41,'Can change repayment',14,'change_repayment'),(42,'Can delete repayment',14,'delete_repayment'),(43,'Can add template',15,'add_template'),(44,'Can change template',15,'change_template'),(45,'Can delete template',15,'delete_template');
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
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'boris','Борис','Долгов','boris@dolgov.name','sha1$99127$5d44d62478c26745933054265b21b27d0b584e83',1,1,1,'2012-05-14 21:25:42','2012-03-28 19:31:52'),(2,'igor','Игорь','Лифарь','igor.lifar@gmail.com','sha1$1dcf0$d5878c339ea000ad2a1e851b57d17d16ee03112d',1,1,1,'2012-05-11 00:17:55','2012-03-28 20:38:26'),(3,'alex','Лёха','Шлюнкин','','sha1$06c7a$7eace909327b16eff04358b1ec79208782a56f63',0,1,0,'2012-05-10 00:32:11','2012-03-28 20:39:25'),(4,'gena','Гена','Фарафонов','','sha1$c2a4c$6aa760b5bf4f5853272cc44d1a1f42f68a6935f4',0,1,0,'2012-05-11 00:17:21','2012-03-28 20:39:29');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2012-03-28 20:36:49',1,11,'1','Квартира',1,''),(2,'2012-03-28 20:36:55',1,11,'2','Еда',1,''),(3,'2012-03-28 20:36:59',1,11,'3','Развлечения',1,''),(4,'2012-03-28 20:37:04',1,11,'4','Макдональдс',1,''),(5,'2012-03-28 20:38:26',1,3,'2','igor',1,''),(6,'2012-03-28 20:38:45',1,3,'2','igor',2,'Changed first_name, last_name, email, is_staff and is_superuser.'),(7,'2012-03-28 20:39:01',1,3,'1','boris',2,'Changed first_name and last_name.'),(8,'2012-03-28 20:39:25',1,3,'3','alex',1,''),(9,'2012-03-28 20:39:29',1,3,'4','gena',1,''),(10,'2012-03-28 20:39:49',1,3,'4','gena',2,'Changed first_name and last_name.'),(11,'2012-03-28 20:40:01',1,3,'3','alex',2,'Changed first_name and last_name.'),(12,'2012-03-28 20:44:32',1,11,'5','Долги',1,''),(13,'2012-03-30 20:22:24',2,12,'7','[Еда]: Магазин',2,'Changed comment.'),(14,'2012-04-05 22:25:18',2,14,'3','from igor to boris 1000.0',2,'Changed payer.'),(15,'2012-04-09 17:42:56',2,12,'23','[Развлечения]: Покупка телефона -- часть два',3,''),(16,'2012-04-09 17:43:03',2,12,'22','[Развлечения]: Покупка телефона',2,'Changed amount.'),(17,'2012-04-09 17:43:25',2,13,'69','igor [Развлечения]: Покупка телефона',2,'Changed credit.'),(18,'2012-04-09 17:43:32',2,13,'68','boris [Развлечения]: Покупка телефона',2,'Changed debet.'),(19,'2012-04-16 19:03:05',1,13,'96','alex [Долги]: Отдал долг',2,'Changed debet and credit.'),(20,'2012-04-16 19:03:13',1,13,'97','gena [Долги]: Отдал долг',2,'Changed debet and credit.'),(21,'2012-04-16 21:45:12',2,12,'32','[Долги]: Отдал долг',3,''),(22,'2012-04-16 21:48:02',2,14,'8','from gena to alex 1500.0',2,'Changed amount.'),(23,'2012-04-25 21:20:09',2,14,'13','from igor to boris 29.0',3,''),(24,'2012-04-26 19:29:51',2,12,'54','[Квартира]: ГЕНКА ДУРАШКА НЕ УМЕЕТ МЕНЯТЬ ТЕКСТИКИ',2,'Changed comment.'),(25,'2012-04-30 14:23:09',2,14,'18','from boris to igor 1000.0',1,''),(26,'2012-04-30 14:23:25',2,14,'19','from igor to gena 500.0',1,''),(27,'2012-05-01 00:47:44',2,12,'63','[Квартира]: Пятерочка',3,''),(28,'2012-05-01 00:50:17',2,12,'65','[Макдональдс]: Макдачек',3,''),(29,'2012-05-03 02:00:26',2,12,'71','[Еда]: Бургер кинг',3,'');
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
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(9,'user profile','manager','userprofile'),(10,'group','manager','group'),(11,'category','manager','category'),(12,'waste','manager','waste'),(13,'waste part','manager','wastepart'),(14,'repayment','manager','repayment'),(15,'template','manager','template');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('70d7ddb6a11f7fe08dc4f7f8450daf50','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4xYzU1ZGY0MWYwYTQzMDdkMTRh\nOTkwYjExNDQ1YTAwNw==\n','2012-04-11 21:04:04'),('c42a42656c2c8a5ced4b30b6611c963f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4xYzU1ZGY0MWYwYTQzMDdkMTRh\nOTkwYjExNDQ1YTAwNw==\n','2012-04-12 01:45:53'),('98a1915d52b75214b0c613b257d38884','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEEdS4yOTViOGNkMzY0Nzg4NmYyZWQ3\nNjNkMmJhNzI1NzVhNg==\n','2012-05-15 22:06:44'),('d181bf83e588b8718acbe6dd24783220','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4zYmUwNzY1NDlhYjAyNzRmMzMx\nNmI0YmJmM2IyMjAwZA==\n','2012-04-23 12:03:18'),('dcafd524bd93b4aa4099271c34591d9b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4zMzk5NDk1ODQwOTYwZWU5M2Fl\nYTdiMjdhYWQ3M2UzYw==\n','2012-04-13 20:19:20'),('526507796d87cae26341e8f3541eafbf','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4xYzU1ZGY0MWYwYTQzMDdkMTRh\nOTkwYjExNDQ1YTAwNw==\n','2012-04-12 14:59:06'),('c1c7043b27a31c3805083e0bcf47bf71','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEEdS4yOTViOGNkMzY0Nzg4NmYyZWQ3\nNjNkMmJhNzI1NzVhNg==\n','2012-04-24 01:30:29'),('8665a12721a2ffb3778d214b6c3dd59a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4xYzU1ZGY0MWYwYTQzMDdkMTRh\nOTkwYjExNDQ1YTAwNw==\n','2012-05-08 17:46:00'),('563706d1a7ba765838c94216d2422275','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4zMzk5NDk1ODQwOTYwZWU5M2Fl\nYTdiMjdhYWQ3M2UzYw==\n','2012-04-19 21:30:15'),('16ea539924d72c1daea9bc62246511e1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4xYzU1ZGY0MWYwYTQzMDdkMTRh\nOTkwYjExNDQ1YTAwNw==\n','2012-05-07 22:25:28'),('3d2b7f2a79da76a627ce3e0357377439','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4zMzk5NDk1ODQwOTYwZWU5M2Fl\nYTdiMjdhYWQ3M2UzYw==\n','2012-05-02 18:41:13'),('cbe92890ff402b97593725d5b00275fd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4zYmUwNzY1NDlhYjAyNzRmMzMx\nNmI0YmJmM2IyMjAwZA==\n','2012-05-07 09:44:26'),('e282cf885c23973ee8ae510043c8eb08','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEEdS4yOTViOGNkMzY0Nzg4NmYyZWQ3\nNjNkMmJhNzI1NzVhNg==\n','2012-05-20 22:03:29'),('95045d70ddf4eaf38133e52f6dec7909','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4zMzk5NDk1ODQwOTYwZWU5M2Fl\nYTdiMjdhYWQ3M2UzYw==\n','2012-05-14 14:39:33'),('6e00b98620fee9d2674cc5b3b5d2b7b6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4zYmUwNzY1NDlhYjAyNzRmMzMx\nNmI0YmJmM2IyMjAwZA==\n','2012-05-25 00:17:55'),('3b6a8d7ef2381ef3808d15f4dd05a9a7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4zMzk5NDk1ODQwOTYwZWU5M2Fl\nYTdiMjdhYWQ3M2UzYw==\n','2012-05-17 00:47:52'),('7a0d3358c3dd4c14d319cbc86cea9887','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4zYmUwNzY1NDlhYjAyNzRmMzMx\nNmI0YmJmM2IyMjAwZA==\n','2012-05-19 10:07:10'),('4cf32c588139c2299dffa129378147f2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4zMzk5NDk1ODQwOTYwZWU5M2Fl\nYTdiMjdhYWQ3M2UzYw==\n','2012-05-24 00:32:11'),('7fc98fcae6a1e5b67d7687984e38df8d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4xYzU1ZGY0MWYwYTQzMDdkMTRh\nOTkwYjExNDQ1YTAwNw==\n','2012-05-28 21:25:42');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_category`
--

DROP TABLE IF EXISTS `manager_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_category`
--

LOCK TABLES `manager_category` WRITE;
/*!40000 ALTER TABLE `manager_category` DISABLE KEYS */;
INSERT INTO `manager_category` VALUES (1,'Квартира'),(2,'Еда'),(3,'Развлечения'),(4,'Макдональдс'),(5,'Долги');
/*!40000 ALTER TABLE `manager_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_group`
--

DROP TABLE IF EXISTS `manager_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_group`
--

LOCK TABLES `manager_group` WRITE;
/*!40000 ALTER TABLE `manager_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_group_members`
--

DROP TABLE IF EXISTS `manager_group_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_group_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`userprofile_id`),
  KEY `manager_group_members_bda51c3c` (`group_id`),
  KEY `manager_group_members_1be3128f` (`userprofile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_group_members`
--

LOCK TABLES `manager_group_members` WRITE;
/*!40000 ALTER TABLE `manager_group_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_group_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_repayment`
--

DROP TABLE IF EXISTS `manager_repayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_repayment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payer_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_repayment_8c65fe26` (`payer_id`),
  KEY `manager_repayment_fcd09624` (`recipient_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_repayment`
--

LOCK TABLES `manager_repayment` WRITE;
/*!40000 ALTER TABLE `manager_repayment` DISABLE KEYS */;
INSERT INTO `manager_repayment` VALUES (1,3,1,1200,'2012-03-29 14:58:47'),(2,1,2,1000,'2012-04-05 21:09:12'),(3,2,1,1000,'2012-04-05 22:24:20'),(4,2,4,1000,'2012-04-08 00:23:27'),(5,3,1,8000,'2012-04-13 17:43:27'),(6,3,4,2000,'2012-04-14 16:49:43'),(7,3,1,10000,'2012-04-16 18:59:00'),(8,4,3,1500,'2012-04-16 21:46:51'),(9,4,1,3000,'2012-04-20 15:23:31'),(10,2,4,500,'2012-04-23 09:44:41'),(11,3,4,300,'2012-04-25 19:37:41'),(12,3,4,430,'2012-04-25 19:38:28'),(14,4,3,500,'2012-04-27 08:37:57'),(15,2,1,3100,'2012-04-28 20:58:09'),(16,4,3,600,'2012-04-28 21:05:20'),(17,4,3,2997,'2012-04-28 21:09:06'),(18,1,2,1000,'2012-04-30 14:23:09'),(19,2,4,500,'2012-04-30 14:23:25'),(20,2,1,10000,'2012-05-04 14:32:38'),(21,4,1,10000,'2012-05-05 10:11:29'),(22,3,4,15.07,'2012-05-06 22:03:20'),(23,4,2,1000,'2012-05-11 00:17:38');
/*!40000 ALTER TABLE `manager_repayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_template`
--

DROP TABLE IF EXISTS `manager_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_template_42dc49bc` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_template`
--

LOCK TABLES `manager_template` WRITE;
/*!40000 ALTER TABLE `manager_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_template_members`
--

DROP TABLE IF EXISTS `manager_template_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_template_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_id` (`template_id`,`userprofile_id`),
  KEY `manager_template_members_1e0a3f4a` (`template_id`),
  KEY `manager_template_members_1be3128f` (`userprofile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_template_members`
--

LOCK TABLES `manager_template_members` WRITE;
/*!40000 ALTER TABLE `manager_template_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_template_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_userprofile`
--

DROP TABLE IF EXISTS `manager_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_userprofile`
--

LOCK TABLES `manager_userprofile` WRITE;
/*!40000 ALTER TABLE `manager_userprofile` DISABLE KEYS */;
INSERT INTO `manager_userprofile` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `manager_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_waste`
--

DROP TABLE IF EXISTS `manager_waste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_waste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `amount` double NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_waste_42dc49bc` (`category_id`),
  KEY `manager_waste_cc846901` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_waste`
--

LOCK TABLES `manager_waste` WRITE;
/*!40000 ALTER TABLE `manager_waste` DISABLE KEYS */;
INSERT INTO `manager_waste` VALUES (1,'Покупка квартиры',1,'2012-03-28 20:41:21',150000,1),(2,'ЗА ВСЁЁ',5,'2012-03-28 20:53:52',10000,1),(3,'Телефон',5,'2012-03-28 21:11:58',550,1),(4,'Кино',3,'2012-03-28 21:54:45',1200,1),(5,'Хавка в кине',3,'2012-03-29 01:45:34',510,2),(6,'Долги до системы',5,'2012-03-30 20:20:16',12000,2),(7,'Магазин',2,'2012-03-30 20:21:20',630,3),(8,'Гена зашёл в магазин',2,'2012-03-31 18:33:06',650,2),(9,'Гена зашёл в магазин',2,'2012-03-31 18:35:52',526.87,2),(10,'Боря зашёл в магазин',2,'2012-03-31 18:38:00',715,2),(11,'Игарёха сносил г-на Геннадия Витальевича в магазин',2,'2012-04-01 14:08:10',1068,4),(12,'Геннадий добрый человек',4,'2012-04-01 20:05:42',876,2),(13,'Геннадий заботливый дохуя',2,'2012-04-01 20:06:53',414,2),(14,'Геннадий',1,'2012-04-01 20:08:09',241,2),(15,'Когда-то в буфете',2,'2012-04-05 21:02:14',549,3),(16,'На чмо-дизайнера',3,'2012-04-05 21:03:36',6201,3),(17,'За сервер + DNS',3,'2012-04-05 21:04:03',1500,3),(18,'Покормил Борю',2,'2012-04-05 21:31:40',200,3),(19,'Магазин',2,'2012-04-05 21:32:10',600,3),(20,'Магазин',2,'2012-04-05 21:32:25',600,3),(21,'Магазин',3,'2012-04-05 22:23:41',1663,1),(22,'Покупка телефона',3,'2012-04-09 12:05:34',4000,2),(24,'Квартира',1,'2012-04-12 12:05:12',45000,1),(25,'Елки-палки',2,'2012-04-12 12:08:04',1892,1),(26,'ЖЫРНЫЙ',2,'2012-04-13 17:40:48',480,1),(27,'ЖЫРНЫЙ',2,'2012-04-13 17:41:37',330,1),(28,'ЖЫРНЫЙ',2,'2012-04-13 17:42:28',2649,1),(29,'domain',5,'2012-04-14 00:42:43',110,1),(30,'Генка купил ПОЖРАТЬ',2,'2012-04-14 23:21:25',510,2),(31,'Билеты в кино',3,'2012-04-16 17:58:57',1500,4),(34,'Ëлки-Хуялки',2,'2012-04-16 21:50:34',2800,4),(33,'ЛАРЁК-МАРЁК',2,'2012-04-16 18:03:53',270,4),(35,'ЧЯСИКИ',3,'2012-04-18 18:43:16',9800,3),(36,'Столовка',2,'2012-04-18 18:44:15',180,3),(37,'ЕБАНАЯ ЖРАКА',4,'2012-04-19 22:28:47',984,3),(38,'Магазин',2,'2012-04-20 15:13:02',798,1),(39,'БУХЛО',2,'2012-04-20 15:14:08',3033,1),(40,'ёлкипалки др игоря',2,'2012-04-20 15:22:06',5652,1),(41,'Шоколадница',2,'2012-04-21 00:29:52',1000,4),(42,'Гена заботливый Макдак1',4,'2012-04-22 16:07:24',995,4),(43,'Гена заботливый Макдак2',4,'2012-04-22 16:13:24',724,4),(44,'Интернет (3 месяца)',1,'2012-04-23 22:25:56',1800,1),(45,'Пить',2,'2012-04-24 02:30:27',228,2),(46,'Буфетик',2,'2012-04-24 17:47:05',200,2),(47,'Пятерка',1,'2012-04-24 17:48:40',980,2),(48,'Ёлкипалки ДР2',3,'2012-04-24 17:48:51',7378,1),(49,'ЛИМОНЫ',2,'2012-04-24 17:50:03',93.25,1),(50,'Пятёрочка',2,'2012-04-25 19:35:30',352,4),(51,'хуууууууййййййй',4,'2012-04-25 19:45:56',817,3),(52,'маркеры',3,'2012-04-25 19:52:31',100,4),(53,'ИДЕАЛИСК',1,'2012-04-25 19:54:01',200,4),(54,'ГЕНКА ДУРАШКА НЕ УМЕЕТ МЕНЯТЬ ТЕКСТИКИ',1,'2012-04-25 19:57:12',700,4),(55,'Гена прощается с последними деньгами (доля за квартиру)',1,'2012-04-25 20:02:23',8250,4),(56,'хот-доги икея',1,'2012-04-25 20:05:40',500,3),(57,'Буфетик',2,'2012-04-26 16:13:06',500,2),(58,'Генка - человек-магазин',2,'2012-04-26 19:28:32',902,2),(59,'5очкабухлосовсембезалкогольное',2,'2012-04-28 00:10:07',728,4),(60,'Генка сходил в магазин',2,'2012-04-28 20:59:22',682.5,2),(61,'Сушилка',1,'2012-04-28 21:08:12',899,4),(62,'Пивасик',3,'2012-04-30 14:21:51',810,2),(67,'ВИКТОРИЯ',2,'2012-05-01 22:07:42',1700,4),(64,'Пятерочка',2,'2012-05-01 00:47:01',750,2),(66,'Макдачек',4,'2012-05-01 00:50:08',560,2),(68,'ТАКСИ',1,'2012-05-01 22:08:32',600,4),(69,'БЮРГЕР КИНГ',2,'2012-05-02 18:32:41',830,4),(70,'Киноша',3,'2012-05-03 00:48:24',2400,3),(72,'Еда в киноше',3,'2012-05-03 02:01:00',350,2),(73,'Такси',1,'2012-05-03 02:01:34',400,2),(74,'ИКЕЯ',1,'2012-05-03 18:35:27',8734,1),(75,'Магазин Квартал 30.04.2012 ',2,'2012-05-03 18:36:25',821,1),(76,'волшебный сервер',3,'2012-05-03 18:42:00',500,1),(77,'Пятерочка',2,'2012-05-04 14:17:53',650,2),(78,'Бургеркинг',2,'2012-05-04 14:19:29',800,2),(79,'ГенаОливье',2,'2012-05-05 01:34:35',1000,4),(80,'Бытовуха',1,'2012-05-05 10:08:42',638,2),(81,'МОЛОЧКО',2,'2012-05-05 10:12:13',400,4),(82,'Букетик + бк',2,'2012-05-05 22:13:26',425,2),(83,'Польская Мода вообще модная',2,'2012-05-06 12:01:12',1995,4),(84,'Ощпень модная мода',2,'2012-05-08 11:04:34',1233,4),(85,'Бургер Кинг',2,'2012-05-08 23:04:32',820,2),(86,'Польская мода',1,'2012-05-08 23:04:59',3650,2),(87,'Microwave Oven + Пилот',1,'2012-05-10 01:24:18',3398,2),(88,'Попкорны',1,'2012-05-10 01:25:04',350,2),(89,'Такси',3,'2012-05-10 01:25:41',400,2),(90,'Шоколадница',2,'2012-05-14 19:23:20',2090,2),(91,'Игорь польский модник',2,'2012-05-14 19:24:39',1489,2),(92,'Все польские модники (без пивасика и креветок)',2,'2012-05-14 19:26:15',2487,2),(93,'Пивасик и креветки',2,'2012-05-14 19:27:18',563,2),(94,'Мороженное попкорн',2,'2012-05-14 22:34:18',1240,4);
/*!40000 ALTER TABLE `manager_waste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_wastepart`
--

DROP TABLE IF EXISTS `manager_wastepart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_wastepart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `debet` double NOT NULL,
  `credit` double NOT NULL,
  `waste_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_wastepart_fbfc09f1` (`user_id`),
  KEY `manager_wastepart_8a2520d` (`waste_id`)
) ENGINE=MyISAM AUTO_INCREMENT=293 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_wastepart`
--

LOCK TABLES `manager_wastepart` WRITE;
/*!40000 ALTER TABLE `manager_wastepart` DISABLE KEYS */;
INSERT INTO `manager_wastepart` VALUES (1,1,100000,50000,1),(2,2,50000,50000,1),(3,3,0,50000,1),(4,1,10000,0,2),(5,3,0,10000,2),(6,1,550,0,3),(7,2,0,550,3),(8,1,300,300,4),(9,2,0,300,4),(10,3,600,300,4),(11,4,300,300,4),(12,1,510,250,5),(13,2,0,260,5),(14,2,12000,0,6),(15,3,0,12000,6),(16,1,0,210,7),(17,2,0,210,7),(18,3,630,210,7),(19,1,0,162.5,8),(20,2,0,162.5,8),(21,3,0,162.5,8),(22,4,650,162.5,8),(23,1,0,131.7175,9),(24,2,0,131.7175,9),(25,3,0,131.7175,9),(26,4,526.87,131.7175,9),(27,1,715,238.333333333333,10),(28,2,0,238.333333333333,10),(29,3,0,238.333333333333,10),(30,1,0,267,11),(31,2,0,267,11),(32,3,0,267,11),(33,4,1068,267,11),(34,1,0,255,12),(35,3,0,291,12),(36,4,876,330,12),(37,1,0,103.5,13),(38,2,0,103.5,13),(39,3,0,103.5,13),(40,4,414,103.5,13),(41,1,0,60.25,14),(42,2,0,60.25,14),(43,3,0,60.25,14),(44,4,241,60.25,14),(45,1,0,183,15),(46,2,549,183,15),(47,3,0,183,15),(48,2,6201,2067,16),(49,3,0,2067,16),(50,4,0,2067,16),(51,1,1500,0,17),(52,2,0,500,17),(53,3,0,500,17),(54,4,0,500,17),(55,1,0,200,18),(56,2,0,0,18),(57,3,200,0,18),(58,4,0,0,18),(59,1,0,200,19),(60,2,0,200,19),(61,3,600,200,19),(62,1,0,200,20),(63,2,0,200,20),(64,3,600,200,20),(65,1,1663,554,21),(66,2,0,555,21),(67,3,0,554,21),(68,1,4000,0,22),(69,2,0,4000,22),(73,2,15000,15000,24),(72,1,30000,15000,24),(74,3,0,15000,24),(75,1,1892,946,25),(76,2,0,946,25),(77,1,480,160,26),(78,2,0,160,26),(79,3,0,160,26),(80,1,330,165,27),(81,3,0,165,27),(82,1,2649,883,28),(83,2,0,883,28),(84,3,0,883,28),(85,1,110,0,29),(86,2,0,110,29),(87,2,0,170,30),(88,3,0,170,30),(89,4,510,170,30),(90,1,0,0,31),(91,2,0,500,31),(92,3,0,500,31),(93,4,1500,500,31),(105,1,9800,3266,35),(104,4,0,600,34),(103,3,2800,1100,34),(102,2,0,1100,34),(98,1,0,0,33),(99,2,0,90,33),(100,3,0,90,33),(101,4,270,90,33),(106,3,0,3268,35),(107,4,0,3266,35),(108,2,0,180,36),(109,3,180,0,36),(110,1,0,179,37),(111,2,0,467,37),(112,3,984,338,37),(113,1,798,587,38),(114,2,0,161,38),(115,3,0,50,38),(116,1,3033,1011,39),(117,2,0,1011,39),(118,3,0,1011,39),(119,1,4632,2164.83,40),(120,2,0,1590.34,40),(121,3,1020,1023,40),(122,4,0,873.83,40),(123,1,0,0,41),(124,2,0,500,41),(125,3,0,0,41),(126,4,1000,500,41),(127,1,0,252,42),(128,2,0,276,42),(129,3,0,216,42),(130,4,995,251,42),(131,1,0,270,43),(132,2,0,61,43),(133,3,0,191,43),(134,4,724,202,43),(135,1,1800,600,44),(136,2,0,600,44),(137,3,0,600,44),(138,2,0,76,45),(139,3,0,76,45),(140,4,228,76,45),(141,2,200,0,46),(142,3,0,200,46),(143,1,0,245,47),(144,2,980,245,47),(145,3,0,245,47),(146,4,0,245,47),(147,1,7378,250,48),(148,2,0,6628,48),(149,3,0,250,48),(150,4,0,250,48),(151,1,93.25,0,49),(152,2,0,93.25,49),(153,1,0,88,50),(154,2,0,88,50),(155,3,0,88,50),(156,4,352,88,50),(157,1,0,152,51),(158,2,0,369,51),(159,3,817,0,51),(160,4,0,296,51),(161,1,0,25,52),(162,2,0,25,52),(163,3,0,25,52),(164,4,100,25,52),(165,1,0,50,53),(166,2,0,50,53),(167,3,0,50,53),(168,4,200,50,53),(169,1,0,0,54),(170,2,0,350,54),(171,3,0,0,54),(172,4,700,350,54),(173,1,2750,0,55),(174,2,2750,0,55),(175,3,2750,0,55),(176,4,0,8250,55),(177,1,500,60,56),(178,4,0,440,56),(179,1,500,0,57),(180,2,0,250,57),(181,3,0,250,57),(182,1,0,225.5,58),(183,2,0,225.5,58),(184,3,0,225.5,58),(185,4,902,225.5,58),(186,1,0,182,59),(187,2,0,182,59),(188,3,0,182,59),(189,4,728,182,59),(190,2,0,227.5,60),(191,3,0,227.5,60),(192,4,682.5,227.5,60),(193,1,0,224.75,61),(194,2,0,224.75,61),(195,3,0,224.75,61),(196,4,899,224.75,61),(197,2,810,330,62),(198,3,0,330,62),(199,4,0,150,62),(208,2,560,222,66),(210,2,0,566.666666666667,67),(211,3,0,566.666666666667,67),(203,2,750,250,64),(204,3,0,250,64),(205,4,0,250,64),(209,3,0,338,66),(212,4,1700,566.666666666667,67),(213,3,0,300,68),(214,4,600,300,68),(215,1,0,0,69),(216,2,0,180,69),(217,3,0,325,69),(218,4,830,325,69),(219,2,0,800,70),(220,3,2400,800,70),(221,4,0,800,70),(225,3,350,0,72),(224,2,0,350,72),(226,2,0,133.333333333333,73),(227,3,400,133.333333333333,73),(228,4,0,133.333333333333,73),(229,1,8734,200,74),(230,4,0,8534,74),(231,1,821,205.25,75),(232,2,0,205.25,75),(233,3,0,205.25,75),(234,4,0,205.25,75),(235,1,500,0,76),(236,2,0,166.666666666667,76),(237,3,0,166.666666666667,76),(238,4,0,166.666666666667,76),(239,2,0,216.666666666667,77),(240,3,650,216.666666666667,77),(241,4,0,216.666666666667,77),(242,2,0,400,78),(243,3,800,400,78),(244,2,0,333.333333333333,79),(245,3,0,333.333333333333,79),(246,4,1000,333.333333333333,79),(247,1,0,159.5,80),(248,2,638,159.5,80),(249,3,0,159.5,80),(250,4,0,159.5,80),(251,2,0,133.333333333333,81),(252,3,0,133.333333333333,81),(253,4,400,133.333333333333,81),(254,2,425,0,82),(255,3,0,425,82),(256,2,0,665,83),(257,3,0,665,83),(258,4,1995,665,83),(259,2,433,411,84),(260,3,0,411,84),(261,4,800,411,84),(262,2,0,225,85),(263,3,0,255,85),(264,4,820,340,85),(265,2,3650,1216.66666666667,86),(266,3,0,1216.66666666667,86),(267,4,0,1216.66666666667,86),(268,1,0,849.5,87),(269,2,3398,849.5,87),(270,3,0,849.5,87),(271,4,0,849.5,87),(272,2,350,116.666666666667,88),(273,3,0,116.666666666667,88),(274,4,0,116.666666666667,88),(275,2,300,133.333333333333,89),(276,3,100,133.333333333333,89),(277,4,0,133.333333333333,89),(278,2,0,547,90),(279,3,2090,946,90),(280,4,0,597,90),(281,2,1489,496.333333333333,91),(282,3,0,496.333333333333,91),(283,4,0,496.333333333333,91),(284,2,0,829,92),(285,3,2487,829,92),(286,4,0,829,92),(287,2,0,281.5,93),(288,3,563,281.5,93),(289,1,0,310,94),(290,2,0,310,94),(291,3,0,310,94),(292,4,1240,310,94);
/*!40000 ALTER TABLE `manager_wastepart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-05-15 11:07:37
