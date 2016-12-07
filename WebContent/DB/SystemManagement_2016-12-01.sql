# ************************************************************
# Sequel Pro SQL dump
# Version v1.00
#
#
# Host: 127.0.0.1
# Database: systemmanagement
# Generation Time: 2016-12-01 14:20:08 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table replyinfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `replyinfo`;

CREATE TABLE `replyinfo` (
  `rId` int(11) NOT NULL AUTO_INCREMENT,
  `rTId` int(11) NOT NULL DEFAULT '0',
  `rSId` int(11) NOT NULL DEFAULT '0',
  `rUId` int(11) NOT NULL DEFAULT '0',
  `rTopic` varchar(20) DEFAULT '',
  `rContents` text NOT NULL,
  `rPublishTime` datetime NOT NULL,
  `rModifyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`rId`),
  KEY `FK_rUId` (`rUId`),
  KEY `FK_rSId` (`rSId`),
  KEY `FK_rTId` (`rTId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `replyinfo` WRITE;
/*!40000 ALTER TABLE `replyinfo` DISABLE KEYS */;

INSERT INTO `replyinfo` (`rId`, `rTId`, `rSId`, `rUId`, `rTopic`, `rContents`, `rPublishTime`, `rModifyTime`)
VALUES
	(77,69,71,7,'写得不错，赞一个！','写得不错，赞一个！','2016-11-01 09:27:30',NULL),
	(78,69,71,7,'写得不错，赞一个！','写得不错，赞一个！','2016-11-01 09:35:50',NULL);

/*!40000 ALTER TABLE `replyinfo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sectioninfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sectioninfo`;

CREATE TABLE `sectioninfo` (
  `sId` int(11) NOT NULL AUTO_INCREMENT,
  `sName` varchar(20) CHARACTER SET gbk NOT NULL DEFAULT '',
  `sTopicCount` int(11) NOT NULL DEFAULT '0',
  `sMasterId` int(11) DEFAULT '0',
  `sParentId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sectioninfo` WRITE;
/*!40000 ALTER TABLE `sectioninfo` DISABLE KEYS */;

INSERT INTO `sectioninfo` (`sId`, `sName`, `sTopicCount`, `sMasterId`, `sParentId`)
VALUES
	(70,'学术交流',0,1,0),
	(71,'福寿螺研究',1,1,77),
	(73,'课题1：入侵媒介及相关病原入侵致害的相关',2,1,70),
	(74,'课题2：入侵媒介的生态适应性及进化研究',1,1,70),
	(75,'课题3：入侵媒介及相关病原的种质遗传学特',1,1,70),
	(77,'发表文章',0,1,0),
	(78,'伊蚊入侵研究',1,1,77),
	(79,'双脐螺入侵研究',1,1,77),
	(84,'课题4：入侵媒介和病原体/病原体与宿主',0,1,70);

/*!40000 ALTER TABLE `sectioninfo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table topicinfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `topicinfo`;

CREATE TABLE `topicinfo` (
  `tId` int(11) NOT NULL AUTO_INCREMENT,
  `tSId` int(11) NOT NULL DEFAULT '0',
  `tUId` int(11) NOT NULL DEFAULT '0',
  `tTopic` varchar(20) NOT NULL DEFAULT '',
  `tContents` text NOT NULL,
  `tReplyCount` int(11) NOT NULL DEFAULT '0',
  `tClickCount` int(11) NOT NULL DEFAULT '0',
  `tPublishTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tModifyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`tId`),
  KEY `FK_tUId` (`tUId`),
  KEY `FK_tSId` (`tSId`),
  CONSTRAINT `FK_tSId` FOREIGN KEY (`tSId`) REFERENCES `sectioninfo` (`sId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tUId` FOREIGN KEY (`tUId`) REFERENCES `userinfo` (`uId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `topicinfo` WRITE;
/*!40000 ALTER TABLE `topicinfo` DISABLE KEYS */;

INSERT INTO `topicinfo` (`tId`, `tSId`, `tUId`, `tTopic`, `tContents`, `tReplyCount`, `tClickCount`, `tPublishTime`, `tModifyTime`)
VALUES
	(55,73,1,'Test','Test',0,0,'2016-11-30 15:59:44',NULL),
	(56,74,1,'Test','Test',0,0,'2016-11-30 15:59:57',NULL),
	(57,75,1,'Test','Test',0,0,'2016-11-30 16:00:05',NULL),
	(59,78,1,'Test','Test',0,0,'2016-11-30 16:00:19',NULL),
	(60,79,1,'Test','Test',0,0,'2016-11-30 16:00:24',NULL),
	(61,73,24,'test','test',0,0,'2016-11-28 22:14:27',NULL),
	(62,71,1,'福寿螺研究','福寿螺研究福寿螺研究福寿螺研究福寿螺研究<br>好好学习天天向上<br>好好学习天天向上<br>好好学习天天向上',0,0,'2016-11-30 01:16:18','2016-11-30 01:16:00');

/*!40000 ALTER TABLE `topicinfo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table userinfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `uId` int(11) NOT NULL AUTO_INCREMENT,
  `uName` varchar(10) NOT NULL DEFAULT '',
  `uPassWord` varchar(20) NOT NULL DEFAULT '',
  `uSex` tinyint(1) NOT NULL DEFAULT '0',
  `uFace` varchar(5) NOT NULL DEFAULT '',
  `uRegTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uType` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uId`),
  UNIQUE KEY `UQ_uName` (`uName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;

INSERT INTO `userinfo` (`uId`, `uName`, `uPassWord`, `uSex`, `uFace`, `uRegTime`, `uType`)
VALUES
	(1,'admin','admin',1,'1.gif','2016-11-11 22:17:48',2),
	(7,'test','test',1,'2.gif','2016-11-13 14:52:58',2),
	(8,'javaweb','javaweb',0,'2.gif','2010-01-29 10:34:37',0),
	(18,'test01','test01',0,'1.gif','2016-11-28 21:08:52',0),
	(19,'test02','test02',0,'1.gif','2016-11-28 21:12:39',0),
	(20,'test03','test03',0,'1.gif','2016-11-28 21:27:54',0),
	(21,'test05','test05',0,'1.gif','2016-11-28 21:30:38',0),
	(22,'test06','test06',0,'1.gif','2016-11-28 21:43:27',0),
	(23,'test07','test07',0,'1.gif','2016-11-28 21:49:54',0),
	(24,'test04','test04',0,'1.gif','2016-11-28 22:01:30',0);

/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
