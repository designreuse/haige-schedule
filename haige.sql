-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.24 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 haige 的数据库结构
DROP DATABASE IF EXISTS `haige`;
CREATE DATABASE IF NOT EXISTS `haige` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `haige`;


-- 导出  表 haige.classes 结构
CREATE TABLE IF NOT EXISTS `classes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recommend` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.classes 的数据：~2 rows (大约)
DELETE FROM `classes`;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` (`id`, `comment`, `name`, `recommend`, `type`) VALUES
	(1, NULL, 'test', 'test', 'A1'),
	(2, NULL, 'test', 'test', 'A2');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;


-- 导出  表 haige.classif_classe_type 结构
CREATE TABLE IF NOT EXISTS `classif_classe_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.classif_classe_type 的数据：~0 rows (大约)
DELETE FROM `classif_classe_type`;
/*!40000 ALTER TABLE `classif_classe_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `classif_classe_type` ENABLE KEYS */;


-- 导出  表 haige.class_members 结构
CREATE TABLE IF NOT EXISTS `class_members` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `memberId` bigint(20) NOT NULL,
  `scheduleId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_210dk8gd4g8iaen9n4c6lkcx9` (`memberId`),
  KEY `FK_e0d0f79c1m10jdib90gb2u6sd` (`scheduleId`),
  CONSTRAINT `FK_210dk8gd4g8iaen9n4c6lkcx9` FOREIGN KEY (`memberId`) REFERENCES `members` (`id`),
  CONSTRAINT `FK_e0d0f79c1m10jdib90gb2u6sd` FOREIGN KEY (`scheduleId`) REFERENCES `class_schedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.class_members 的数据：~6 rows (大约)
DELETE FROM `class_members`;
/*!40000 ALTER TABLE `class_members` DISABLE KEYS */;
INSERT INTO `class_members` (`id`, `memberId`, `scheduleId`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 1),
	(4, 3, 1),
	(5, 4, 1),
	(6, 5, 1);
/*!40000 ALTER TABLE `class_members` ENABLE KEYS */;


-- 导出  表 haige.class_schedule 结构
CREATE TABLE IF NOT EXISTS `class_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `scheduleDate` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `classId` bigint(20) NOT NULL,
  `teacherId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_howfh9uicot374vw6hvep1s94` (`classId`),
  KEY `FK_jqup1m8s9rtvgtsw2rej3n75g` (`teacherId`),
  CONSTRAINT `FK_howfh9uicot374vw6hvep1s94` FOREIGN KEY (`classId`) REFERENCES `classes` (`id`),
  CONSTRAINT `FK_jqup1m8s9rtvgtsw2rej3n75g` FOREIGN KEY (`teacherId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.class_schedule 的数据：~3 rows (大约)
DELETE FROM `class_schedule`;
/*!40000 ALTER TABLE `class_schedule` DISABLE KEYS */;
INSERT INTO `class_schedule` (`id`, `comment`, `endTime`, `scheduleDate`, `startTime`, `classId`, `teacherId`) VALUES
	(1, '1', '07:15:00', '2015-08-17', '07:10:00', 1, 6),
	(2, 'ad', '06:30:00', '2015-08-06', '04:20:00', 1, 6),
	(3, '1', '11:15:00', '2015-08-18', '09:25:00', 2, 6);
/*!40000 ALTER TABLE `class_schedule` ENABLE KEYS */;


-- 导出  表 haige.members 结构
CREATE TABLE IF NOT EXISTS `members` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` date NOT NULL,
  `comment` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `memberName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nickName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pic` tinyblob,
  `realName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `registrationChannel` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) NOT NULL,
  `startDate` datetime DEFAULT NULL,
  `advisorId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_48b0j3yrfai6r6ax6k06p4mpf` (`memberName`),
  KEY `FK_gahm1b2bsoq0nco4wbc23xc37` (`advisorId`),
  CONSTRAINT `FK_gahm1b2bsoq0nco4wbc23xc37` FOREIGN KEY (`advisorId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.members 的数据：~13 rows (大约)
DELETE FROM `members`;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` (`id`, `address`, `age`, `birthday`, `comment`, `endDate`, `memberName`, `nickName`, `password`, `pic`, `realName`, `registrationChannel`, `sex`, `startDate`, `advisorId`) VALUES
	(1, '1', NULL, '1899-12-12', '1', NULL, '1', NULL, NULL, NULL, '1', NULL, 0, NULL, 3),
	(3, '2', NULL, '2013-09-11', '2', NULL, '22', NULL, NULL, NULL, '22', NULL, 0, NULL, 4),
	(4, '', NULL, '2013-09-14', '', NULL, '11', NULL, NULL, NULL, '123', NULL, 0, NULL, 4),
	(5, NULL, NULL, '2015-08-26', NULL, NULL, '3', NULL, NULL, NULL, '', NULL, 0, NULL, 5),
	(8, NULL, NULL, '2015-08-26', NULL, NULL, '2', NULL, NULL, NULL, '', NULL, 0, NULL, 5),
	(9, NULL, NULL, '2015-08-26', NULL, NULL, '33', NULL, NULL, NULL, '', NULL, 0, NULL, 4),
	(10, NULL, NULL, '2015-08-26', NULL, NULL, 'adf', NULL, NULL, NULL, '', NULL, 0, NULL, 1),
	(11, NULL, NULL, '2015-08-26', NULL, NULL, 'ads', NULL, NULL, NULL, '', NULL, 0, NULL, 5),
	(12, NULL, NULL, '2015-08-26', NULL, NULL, '12', NULL, NULL, NULL, '', NULL, 0, NULL, 2),
	(13, NULL, NULL, '2015-08-26', NULL, NULL, 'af', NULL, NULL, NULL, '', NULL, 0, NULL, 1),
	(14, NULL, NULL, '2015-08-26', NULL, NULL, '123', NULL, NULL, NULL, '', NULL, 0, NULL, 6),
	(16, NULL, NULL, '2015-08-26', NULL, NULL, '333', NULL, NULL, NULL, '', NULL, 0, NULL, NULL),
	(17, NULL, NULL, '2015-08-26', NULL, NULL, '444', NULL, NULL, NULL, '', NULL, 0, NULL, NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;


-- 导出  表 haige.member_linkman 结构
CREATE TABLE IF NOT EXISTS `member_linkman` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) NOT NULL,
  `tel` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weChat` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memberId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_nd9w8l9ikhtn8x43afa1stcqm` (`memberId`),
  CONSTRAINT `FK_nd9w8l9ikhtn8x43afa1stcqm` FOREIGN KEY (`memberId`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.member_linkman 的数据：~0 rows (大约)
DELETE FROM `member_linkman`;
/*!40000 ALTER TABLE `member_linkman` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_linkman` ENABLE KEYS */;


-- 导出  表 haige.member_payment 结构
CREATE TABLE IF NOT EXISTS `member_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payDate` datetime DEFAULT NULL,
  `payPerson` datetime DEFAULT NULL,
  `payment` decimal(12,2) DEFAULT NULL,
  `purchaseCount` int(11) DEFAULT NULL,
  `memberId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7jffdh85cn7x6ukn9a8vwce66` (`memberId`),
  CONSTRAINT `FK_7jffdh85cn7x6ukn9a8vwce66` FOREIGN KEY (`memberId`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.member_payment 的数据：~0 rows (大约)
DELETE FROM `member_payment`;
/*!40000 ALTER TABLE `member_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_payment` ENABLE KEYS */;


-- 导出  表 haige.roles 结构
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `roleName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.roles 的数据：~4 rows (大约)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `comment`, `realName`, `roleName`) VALUES
	(0, NULL, '超级管理员', 'root'),
	(1, NULL, '管理员', 'admin'),
	(2, NULL, '教练', 'coach'),
	(3, NULL, '顾问', 'advisor');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- 导出  表 haige.users 结构
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `pic` tinyblob,
  `realName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `weChat` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mmns67o5v4bfippoqitu4v3t6` (`userName`),
  KEY `FK_rin8hpeky1j0qj4mwj1lcc6mb` (`roleId`),
  CONSTRAINT `FK_rin8hpeky1j0qj4mwj1lcc6mb` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.users 的数据：~11 rows (大约)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `comment`, `password`, `pic`, `realName`, `tel`, `tel1`, `tel2`, `userName`, `weChat`, `roleId`) VALUES
	(1, '', '123456', NULL, '超级管理员', '2', NULL, NULL, 'root', '', 0),
	(2, '', '123456', NULL, '管理员', '1', NULL, NULL, 'admin', '', 1),
	(3, '', '123456', NULL, '顾问', '55', NULL, NULL, 'advisor', '', 3),
	(4, NULL, '123456', NULL, '顾问1', NULL, NULL, NULL, 'advisor1', NULL, 3),
	(5, NULL, '123456', NULL, '教练', NULL, NULL, NULL, 'teacher', NULL, 2),
	(6, NULL, '123455', NULL, '教练1', NULL, NULL, NULL, 'teacher1', NULL, 2),
	(7, NULL, '', NULL, '1', NULL, NULL, NULL, '1', NULL, 0),
	(9, NULL, '', NULL, '2', NULL, NULL, NULL, '2', NULL, 0),
	(10, NULL, '', NULL, '', NULL, NULL, NULL, '3', NULL, 0),
	(11, NULL, '', NULL, '', NULL, NULL, NULL, '4', NULL, 0),
	(12, NULL, '', NULL, '', NULL, NULL, NULL, '5', NULL, 0),
	(13, NULL, '', NULL, '', NULL, NULL, NULL, '7', NULL, 0),
	(14, NULL, '', NULL, '', NULL, NULL, NULL, '8', NULL, 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
