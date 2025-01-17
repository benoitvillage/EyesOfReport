-- MySQL dump 10.14  Distrib 5.5.44-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: eorweb
-- ------------------------------------------------------
-- Server version	5.5.44-MariaDB-log

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
-- Table structure for table `admin_inqueries`
--

DROP TABLE IF EXISTS `admin_inqueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_inqueries` (
  `admin_mail` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_inqueries`
--

LOCK TABLES `admin_inqueries` WRITE;
/*!40000 ALTER TABLE `admin_inqueries` DISABLE KEYS */;
INSERT INTO `admin_inqueries` VALUES ('michael.aubertin@axians.com,benoit.village@axians.com');
/*!40000 ALTER TABLE `admin_inqueries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_settings`
--

DROP TABLE IF EXISTS `auth_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_settings` (
  `auth_type` tinyint(1) NOT NULL DEFAULT '0',
  `ldap_ip` varchar(255) DEFAULT NULL,
  `ldap_port` int(11) DEFAULT NULL,
  `ldap_search` varchar(255) DEFAULT NULL,
  `ldap_user` varchar(255) DEFAULT NULL,
  `ldap_password` varchar(255) DEFAULT NULL,
  `ldap_rdn` varchar(255) DEFAULT NULL,
  `ldap_filter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`auth_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_settings`
--

LOCK TABLES `auth_settings` WRITE;
/*!40000 ALTER TABLE `auth_settings` DISABLE KEYS */;
INSERT INTO `auth_settings` VALUES (1,'ldapma',389,'OU=People,,DC=axians,DC=com','cn=svc-eon,ou=Admin,ou=People,dc=axians,dc=com','Wm9iaV9sYV9tb3VjaGU=','samaccountname','(& (objectClass=user) (objectClass=person))');
/*!40000 ALTER TABLE `auth_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupright`
--

DROP TABLE IF EXISTS `groupright`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupright` (
  `group_id` int(11) NOT NULL,
  `tab_1` enum('0','1') NOT NULL DEFAULT '0',
  `tab_2` enum('0','1') NOT NULL DEFAULT '0',
  `tab_3` enum('0','1') NOT NULL,
  `tab_4` enum('0','1') NOT NULL,
  `tab_5` enum('0','1') NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupright`
--

LOCK TABLES `groupright` WRITE;
/*!40000 ALTER TABLE `groupright` DISABLE KEYS */;
INSERT INTO `groupright` VALUES (1,'0','1','1','1','1'),(9,'0','0','1','0','1'),(10,'0','0','1','1','1'),(11,'0','0','1','0','1');
/*!40000 ALTER TABLE `groupright` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `group_descr` text,
  PRIMARY KEY (`group_id`,`group_name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'admins','Administrator group'),(9,'Users','Users'),(10,'Managers','Contract Managers'),(11,'test','testing group');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_tree`
--

DROP TABLE IF EXISTS `host_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_tree` (
  `host_id` varchar(15) DEFAULT NULL,
  `parent_id` varchar(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_tree`
--

LOCK TABLES `host_tree` WRITE;
/*!40000 ALTER TABLE `host_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `host_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `join_report_cred`
--

DROP TABLE IF EXISTS `join_report_cred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `join_report_cred` (
  `report_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `join_report_cred`
--

LOCK TABLES `join_report_cred` WRITE;
/*!40000 ALTER TABLE `join_report_cred` DISABLE KEYS */;
INSERT INTO `join_report_cred` VALUES (1,1),(9,9),(10,1),(3,1),(10,9),(2,10),(2,9),(11,1),(11,9),(11,10),(12,1),(12,9),(12,10),(13,1),(13,9),(13,10),(14,1),(14,9),(14,10),(14,11),(15,1),(15,9),(15,10),(2,1),(16,1),(16,10),(16,9),(17,1),(17,9),(17,10),(18,1),(19,1),(18,9),(19,9),(20,1),(20,9),(20,10),(21,1),(21,9),(21,10),(22,1),(22,10),(22,9),(23,1),(23,9),(23,10),(24,1),(24,9),(24,10),(25,1),(25,9),(25,10),(26,1),(26,9),(26,10),(27,1),(27,10),(27,9),(28,1),(28,10),(28,9);
/*!40000 ALTER TABLE `join_report_cred` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `join_report_format`
--

DROP TABLE IF EXISTS `join_report_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `join_report_format` (
  `join_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `output_format_id` int(11) NOT NULL,
  PRIMARY KEY (`join_id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `join_report_format`
--

LOCK TABLES `join_report_format` WRITE;
/*!40000 ALTER TABLE `join_report_format` DISABLE KEYS */;
INSERT INTO `join_report_format` VALUES (1,1,1),(3,1,5),(4,9,1),(6,9,4),(7,3,2),(8,3,3),(9,3,5),(10,10,5),(11,10,2),(12,2,2),(13,11,1),(14,11,2),(16,12,1),(18,12,2),(19,13,1),(20,13,2),(21,14,1),(22,14,2),(23,15,1),(24,15,2),(25,16,1),(26,16,2),(27,17,1),(28,17,2),(29,18,1),(30,18,2),(31,19,1),(32,19,2),(33,20,1),(34,20,2),(35,21,1),(36,21,2),(37,22,1),(38,22,5),(39,22,2),(40,23,1),(41,23,2),(42,24,1),(43,24,2),(44,25,1),(47,25,2),(48,26,3),(49,27,1),(50,27,2),(51,28,1),(52,28,2),(53,28,5);
/*!40000 ALTER TABLE `join_report_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldap_users`
--

DROP TABLE IF EXISTS `ldap_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ldap_users` (
  `dn` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  PRIMARY KEY (`dn`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldap_users`
--

LOCK TABLES `ldap_users` WRITE;
/*!40000 ALTER TABLE `ldap_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `ldap_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldap_users_extended`
--

DROP TABLE IF EXISTS `ldap_users_extended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ldap_users_extended` (
  `dn` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `checked` smallint(6) NOT NULL,
  PRIMARY KEY (`dn`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldap_users_extended`
--

LOCK TABLES `ldap_users_extended` WRITE;
/*!40000 ALTER TABLE `ldap_users_extended` DISABLE KEYS */;
/*!40000 ALTER TABLE `ldap_users_extended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=184805 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (184798,'1455287108','admin','logout','User logged out','217.109.123.80'),(184799,'1455287115','admin','login','User logged in','217.109.123.80'),(184800,'1458135285','admin','login','User logged in','192.168.26.1'),(184801,'1458364661','admin','login','User logged in','192.168.26.1'),(184802,'1459234307','admin','logout','User logged out','192.168.26.1'),(184803,'1459234311','admin','login','User logged in','192.168.26.1'),(184804,'1473251805','admin','login','User logged in','10.205.129.187');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_template`
--

DROP TABLE IF EXISTS `master_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_template` (
  `Template` varchar(50) DEFAULT NULL,
  `Mastered` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_template`
--

LOCK TABLES `master_template` WRITE;
/*!40000 ALTER TABLE `master_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `output_format`
--

DROP TABLE IF EXISTS `output_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `output_format` (
  `format_id` int(5) NOT NULL AUTO_INCREMENT,
  `type` char(10) NOT NULL,
  PRIMARY KEY (`format_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `output_format`
--

LOCK TABLES `output_format` WRITE;
/*!40000 ALTER TABLE `output_format` DISABLE KEYS */;
INSERT INTO `output_format` VALUES (1,'HTML'),(2,'PDF'),(3,'XLSX'),(4,'DOCX'),(5,'PPTX');
/*!40000 ALTER TABLE `output_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_name` varchar(150) DEFAULT NULL,
  `report_rptfile` varchar(100) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (25,'Analyse incidents serveurs mensuel','EOR_Application_Host_Service_Incident_FR.rptdesign','other'),(18,'Analyse erreurs chargements nocturne','EOR_ETL_Error_Summary_Day.rptdesign','technic'),(24,'Disponibilite applicative avancee mensuel','EOR_Application_category_FR.rptdesign','other'),(23,'Disponibilite applicative mensuel','EOR_Application_basic_FR.rptdesign','other'),(26,'Analyse incidents serveurs mensuel tableur','EOR_Application_Host_Service_Incident_Tableur_FR.rptdesign','other'),(27,'Analyse incidents applicatif journalier','EOR_Application_incident_analysis_FR.rptdesign','other'),(28,'Disponibilite portefeuille de service mensuel','EOR_Contract_Application_FR.rptdesign','other');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (937541971,1),(1328096520,1),(958854550,1),(1182260729,1),(210080805,1);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_passwd` varchar(255) NOT NULL,
  `user_descr` varchar(255) DEFAULT NULL,
  `user_type` tinyint(1) NOT NULL,
  `user_location` varchar(255) DEFAULT NULL,
  `user_limitation` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`,`user_name`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'admin','21232f297a57a5a743894a0e4a801fc3','default user',0,'',0),(142,10,'manager','1d0258c2440a8d19e716292b231e3190','manager',0,'',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-07 15:19:50
