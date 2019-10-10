-- MySQL dump 10.13  Distrib 5.7.27, for Win64 (x86_64)
--
-- Host: localhost    Database: fruit
-- ------------------------------------------------------
-- Server version	5.7.27-log

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
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user info',7,'add_userinfo'),(20,'Can change user info',7,'change_userinfo'),(21,'Can delete user info',7,'delete_userinfo'),(22,'Can add address',8,'add_address'),(23,'Can change address',8,'change_address'),(24,'Can delete address',8,'delete_address'),(25,'Can add goods',9,'add_goods'),(26,'Can change goods',9,'change_goods'),(27,'Can delete goods',9,'delete_goods'),(28,'Can add good type',10,'add_goodtype'),(29,'Can change good type',10,'change_goodtype'),(30,'Can delete good type',10,'delete_goodtype'),(31,'Can add cart info',11,'add_cartinfo'),(32,'Can change cart info',11,'change_cartinfo'),(33,'Can delete cart info',11,'delete_cartinfo'),(34,'Can add order',12,'add_order'),(35,'Can change order',12,'change_order'),(36,'Can delete order',12,'delete_order');
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
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$rvssWJa38zLB$2VwqPhRdKvjNZk0+4IFdFyrJtUmUNEtC7eSbJYeXbNY=','2019-09-28 14:00:11.485986',1,'admin','','','admin@admin.com',1,1,'2019-09-27 06:55:07.035742');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartinfo_cartinfo`
--

DROP TABLE IF EXISTS `cartinfo_cartinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartinfo_cartinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_count` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cartinfo_cartinfo_user_id_370d520d_fk_userinfo_userinfo_id` (`user_id`),
  KEY `cartinfo_cartinfo_good_id_50af7139_fk_memberapp_goods_id` (`good_id`),
  CONSTRAINT `cartinfo_cartinfo_good_id_50af7139_fk_memberapp_goods_id` FOREIGN KEY (`good_id`) REFERENCES `memberapp_goods` (`id`),
  CONSTRAINT `cartinfo_cartinfo_user_id_370d520d_fk_userinfo_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `userinfo_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartinfo_cartinfo`
--

LOCK TABLES `cartinfo_cartinfo` WRITE;
/*!40000 ALTER TABLE `cartinfo_cartinfo` DISABLE KEYS */;
INSERT INTO `cartinfo_cartinfo` VALUES (1,18,2,2),(2,2,3,2),(3,9,1,2);
/*!40000 ALTER TABLE `cartinfo_cartinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartinfo_order`
--

DROP TABLE IF EXISTS `cartinfo_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartinfo_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(50) NOT NULL,
  `orderdetail` longtext NOT NULL,
  `adsname` varchar(50) NOT NULL,
  `adsphone` varchar(20) NOT NULL,
  `ads` varchar(300) NOT NULL,
  `time` datetime(6) NOT NULL,
  `acot` int(11) NOT NULL,
  `acount` decimal(8,2) NOT NULL,
  `orderstatus` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cartinfo_order_user_id_01642304_fk_userinfo_userinfo_id` (`user_id`),
  CONSTRAINT `cartinfo_order_user_id_01642304_fk_userinfo_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `userinfo_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartinfo_order`
--

LOCK TABLES `cartinfo_order` WRITE;
/*!40000 ALTER TABLE `cartinfo_order` DISABLE KEYS */;
INSERT INTO `cartinfo_order` VALUES (1,'20190929094817','[{\"id\":\"3\",\"name\":\"苹果\",\"price\":\"12.00\",\"count\":\"9\"}]','liziyuan','12345676543','顺德区','2019-09-29 01:48:17.457140',2,22.00,1,2),(2,'20190929095730','[{\"id\":\"1\",\"name\":\"香蕉\",\"price\":\"1.00\",\"count\":\"18\"},{\"id\":\"2\",\"name\":\"葡萄\",\"price\":\"12.00\",\"count\":\"2\"},{\"id\":\"3\",\"name\":\"苹果\",\"price\":\"12.00\",\"count\":\"9\"}]','liziyuan','12345676543','顺德区','2019-09-29 01:57:30.172510',2,32.00,1,2);
/*!40000 ALTER TABLE `cartinfo_order` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-09-27 06:55:58.983612','1','qwe',1,'[{\"added\": {}}]',7,1),(2,'2019-09-27 06:56:04.645047','1','qwe',2,'[]',7,1),(3,'2019-09-27 06:56:27.746327','1','水果',1,'[{\"added\": {}}]',10,1),(4,'2019-09-27 06:56:36.188412','2','肉类',1,'[{\"added\": {}}]',10,1),(5,'2019-09-27 06:57:45.457116','1','苹果',1,'[{\"added\": {}}]',9,1),(6,'2019-09-27 06:58:20.878847','2','香蕉',1,'[{\"added\": {}}]',9,1),(7,'2019-09-27 06:59:03.232501','3','葡萄',1,'[{\"added\": {}}]',9,1),(8,'2019-09-27 06:59:45.232402','4','猪肉',1,'[{\"added\": {}}]',9,1),(9,'2019-09-27 07:00:22.833680','5','牛肉',1,'[{\"added\": {}}]',9,1),(10,'2019-09-27 07:00:52.658197','6','鸡肉',1,'[{\"added\": {}}]',9,1),(11,'2019-09-28 14:00:53.408063','1','tony',1,'[{\"added\": {}}]',8,1),(12,'2019-09-28 14:01:17.857906','2','petter',1,'[{\"added\": {}}]',8,1),(13,'2019-09-29 01:35:25.688613','3','liziyuan',1,'[{\"added\": {}}]',8,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'cartinfo','cartinfo'),(12,'cartinfo','order'),(5,'contenttypes','contenttype'),(9,'memberapp','goods'),(10,'memberapp','goodtype'),(6,'sessions','session'),(8,'userinfo','address'),(7,'userinfo','userinfo');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-09-27 06:52:34.873257'),(2,'auth','0001_initial','2019-09-27 06:52:46.425548'),(3,'admin','0001_initial','2019-09-27 06:52:49.884062'),(4,'admin','0002_logentry_remove_auto_add','2019-09-27 06:52:50.074116'),(5,'contenttypes','0002_remove_content_type_name','2019-09-27 06:52:51.603835'),(6,'auth','0002_alter_permission_name_max_length','2019-09-27 06:52:52.868523'),(7,'auth','0003_alter_user_email_max_length','2019-09-27 06:52:53.718697'),(8,'auth','0004_alter_user_username_opts','2019-09-27 06:52:53.821452'),(9,'auth','0005_alter_user_last_login_null','2019-09-27 06:52:54.684734'),(10,'auth','0006_require_contenttypes_0002','2019-09-27 06:52:54.763265'),(11,'auth','0007_alter_validators_add_error_messages','2019-09-27 06:52:54.877640'),(12,'auth','0008_alter_user_username_max_length','2019-09-27 06:52:55.921345'),(13,'userinfo','0001_initial','2019-09-27 06:52:56.608094'),(14,'userinfo','0002_address','2019-09-27 06:52:57.870983'),(15,'memberapp','0001_initial','2019-09-27 06:53:00.851403'),(16,'cartinfo','0001_initial','2019-09-27 06:53:05.929127'),(17,'sessions','0001_initial','2019-09-27 06:53:06.663783'),(18,'cartinfo','0002_auto_20190928_1105','2019-09-28 03:05:32.697083');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('x2f31y1u7z88i65dpkgwkfldrdfqyljp','ODExODI4M2VkOTY0MTZkZmJlZWJhOTYyMGFlNDI2N2NhNTUxYzdjZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MzA5MTZhM2Q0NzQ5NzgwNGNlYTk3Y2QzNDE1YjkzNDIyMThkNDBhIiwidXNlcl9pZCI6MiwidXNlcl9uYW1lIjoiYWJjIn0=','2019-10-12 03:00:07.204199'),('xmktv1pi0dsvgeti9q6t5cd5jjlg9bv1','ZGFhZjNiMzU1ODAwODEwYmEzNzVhYWQzNTg4MmE3MGY0NmM5NjllMzp7InVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImFiYyIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MzA5MTZhM2Q0NzQ5NzgwNGNlYTk3Y2QzNDE1YjkzNDIyMThkNDBhIn0=','2019-10-12 14:00:11.841455');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberapp_goods`
--

DROP TABLE IF EXISTS `memberapp_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memberapp_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `unit` varchar(30) NOT NULL,
  `detail` varchar(1000) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `isdelete` tinyint(1) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `memberapp_goods_type_id_46740ecf_fk_memberapp_goodtype_id` (`type_id`),
  CONSTRAINT `memberapp_goods_type_id_46740ecf_fk_memberapp_goodtype_id` FOREIGN KEY (`type_id`) REFERENCES `memberapp_goodtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberapp_goods`
--

LOCK TABLES `memberapp_goods` WRITE;
/*!40000 ALTER TABLE `memberapp_goods` DISABLE KEYS */;
INSERT INTO `memberapp_goods` VALUES (1,'苹果',12.00,'无描述','1个','商品详情','static/images/goods/1530692528.4974627e77c2868d95ac092bc0e2dc64268b4ac.png',0,1),(2,'香蕉',1.00,'有描述','1个','商品详情','static/images/goods/1569460912.6826506a.jpg',0,1),(3,'葡萄',12.00,'可能有描述','1个','商品详情','static/images/goods/1530773272.4620383d900f2eb6392c1556e02086f0c2b892b.jpg',0,1),(4,'猪肉',33.00,'描述','1斤','商品详情','static/images/goods/a.jpg',0,2),(5,'牛肉',49.00,'无描述','1斤','商品详情','static/images/goods/1530773272.4620383d900f2eb6392c1556e02086f0c2b892b_4KDeHxw.jpg',0,2),(6,'鸡肉',30.00,'商品描述','1斤','商品详情','static/images/goods/1530692528.4974627e77c2868d95ac092bc0e2dc64268b4ac_3KaHMGS.png',0,2);
/*!40000 ALTER TABLE `memberapp_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberapp_goodtype`
--

DROP TABLE IF EXISTS `memberapp_goodtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memberapp_goodtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `isdelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberapp_goodtype`
--

LOCK TABLES `memberapp_goodtype` WRITE;
/*!40000 ALTER TABLE `memberapp_goodtype` DISABLE KEYS */;
INSERT INTO `memberapp_goodtype` VALUES (1,'水果','商品描述',0),(2,'肉类','商品描述',0);
/*!40000 ALTER TABLE `memberapp_goodtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo_address`
--

DROP TABLE IF EXISTS `userinfo_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(50) NOT NULL,
  `ads` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userinfo_address_user_id_3623c808_fk_userinfo_userinfo_id` (`user_id`),
  CONSTRAINT `userinfo_address_user_id_3623c808_fk_userinfo_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `userinfo_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo_address`
--

LOCK TABLES `userinfo_address` WRITE;
/*!40000 ALTER TABLE `userinfo_address` DISABLE KEYS */;
INSERT INTO `userinfo_address` VALUES (1,'tony','北京市海淀区','234567890',2),(2,'petter','青岛市黄岛区','1234567',1),(3,'liziyuan','顺德区','12345676543',2);
/*!40000 ALTER TABLE `userinfo_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo_userinfo`
--

DROP TABLE IF EXISTS `userinfo_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) NOT NULL,
  `upassword` varchar(50) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `time` datetime(6) NOT NULL,
  `isban` tinyint(1) NOT NULL,
  `isdelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo_userinfo`
--

LOCK TABLES `userinfo_userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo_userinfo` DISABLE KEYS */;
INSERT INTO `userinfo_userinfo` VALUES (1,'qwe','qwe','qwe@qwe.com','1234567890','2019-09-27 06:56:04.642728',0,0),(2,'abc','pbkdf2_sha1$36000$abc$oaUTHxovtdavAZViVJKK2zj9Ltc=','abc@abc.con','1234567890','2019-09-27 07:53:34.969295',0,0);
/*!40000 ALTER TABLE `userinfo_userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-10 17:53:31
