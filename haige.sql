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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.classes 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` (`id`, `comment`, `name`, `recommend`, `type`) VALUES
	(1, NULL, 'test', 'test', 'A1'),
	(2, NULL, 'test1', 'test', 'A2');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;


-- 导出  表 haige.classif_classe_type 结构
CREATE TABLE IF NOT EXISTS `classif_classe_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.classif_classe_type 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `classif_classe_type` DISABLE KEYS */;
INSERT INTO `classif_classe_type` (`id`, `comment`, `name`) VALUES
	(1, 'a1', 'A1'),
	(2, '', 'A2');
/*!40000 ALTER TABLE `classif_classe_type` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.class_schedule 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `class_schedule` DISABLE KEYS */;
INSERT INTO `class_schedule` (`id`, `comment`, `endTime`, `scheduleDate`, `startTime`, `classId`, `teacherId`) VALUES
	(2, 'ad', '06:30:00', '2015-08-06', '04:20:00', 2, 6),
	(5, '', '10:30:00', '2015-09-08', '09:35:00', 2, 6),
	(6, 's', '10:50:00', '2015-09-08', '05:25:00', 1, 5),
	(7, 'qq', '02:10:00', '2015-09-01', '01:05:00', 1, 5),
	(8, 't', '16:55:00', '2015-09-01', '06:10:00', 1, 5),
	(9, 'yu', '10:55:00', '2015-09-09', '10:10:00', 1, 6);
/*!40000 ALTER TABLE `class_schedule` ENABLE KEYS */;


-- 导出  表 haige.class_schedule_members 结构
CREATE TABLE IF NOT EXISTS `class_schedule_members` (
  `scheduleId` bigint(20) NOT NULL,
  `memberId` bigint(20) NOT NULL,
  PRIMARY KEY (`scheduleId`,`memberId`),
  KEY `FK_pkcohus0x6tglc9it3nq8ymmd` (`memberId`),
  CONSTRAINT `FK_ca0ndidexq5t53870h7syr5lo` FOREIGN KEY (`scheduleId`) REFERENCES `class_schedule` (`id`),
  CONSTRAINT `FK_pkcohus0x6tglc9it3nq8ymmd` FOREIGN KEY (`memberId`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.class_schedule_members 的数据：~15 rows (大约)
/*!40000 ALTER TABLE `class_schedule_members` DISABLE KEYS */;
INSERT INTO `class_schedule_members` (`scheduleId`, `memberId`) VALUES
	(9, 1),
	(9, 9),
	(9, 11),
	(9, 12),
	(9, 13),
	(9, 14),
	(9, 16),
	(9, 17),
	(9, 19),
	(9, 20),
	(9, 22),
	(9, 23),
	(9, 24),
	(9, 26),
	(9, 27);
/*!40000 ALTER TABLE `class_schedule_members` ENABLE KEYS */;


-- 导出  表 haige.his_schedule 结构
CREATE TABLE IF NOT EXISTS `his_schedule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cs_id` bigint(20) NOT NULL,
  `cs_date` date NOT NULL,
  `cs_comment` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cs_startTime` datetime NOT NULL,
  `cs_endTime` datetime NOT NULL,
  `u_id` bigint(20) NOT NULL,
  `u_userName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `u_realName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `u_tel` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_tel1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_weChat` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `u_comment` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_id` bigint(20) NOT NULL,
  `c_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `c_recommend` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `c_comment` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_id` bigint(20) DEFAULT NULL,
  `m_memberName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_age` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_birthday` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_realName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_sex` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cs_evaluation` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.his_schedule 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `his_schedule` DISABLE KEYS */;
INSERT INTO `his_schedule` (`id`, `cs_id`, `cs_date`, `cs_comment`, `cs_startTime`, `cs_endTime`, `u_id`, `u_userName`, `u_realName`, `u_tel`, `u_tel1`, `u_weChat`, `u_comment`, `c_id`, `c_name`, `c_recommend`, `c_type`, `c_comment`, `m_id`, `m_memberName`, `m_age`, `m_birthday`, `m_realName`, `m_sex`, `m_address`, `cs_evaluation`) VALUES
	(136, 1, '2015-09-07', 'a', '2015-09-09 16:24:31', '2015-09-09 16:24:29', 5, 'teacher', '教练', NULL, NULL, NULL, NULL, 1, 'test', 'test', 'A1', NULL, 1, '1', NULL, '1899-12-12', '1', '男', '1', '456456'),
	(137, 1, '2015-09-07', 'a', '2015-09-09 16:24:31', '2015-09-09 16:24:29', 5, 'teacher', '教练', NULL, NULL, NULL, NULL, 1, 'test', 'test', 'A1', NULL, 9, '33', NULL, '2015-08-26', '2', '男', NULL, '456456'),
	(138, 1, '2015-09-07', 'a', '2015-09-09 16:24:31', '2015-09-09 16:24:29', 5, 'teacher', '教练', NULL, NULL, NULL, NULL, 1, 'test', 'test', 'A1', NULL, 11, 'ads', NULL, '2015-08-26', '3', '男', NULL, '456456'),
	(139, 1, '2015-09-07', 'a', '2015-09-09 16:24:31', '2015-09-09 16:24:29', 5, 'teacher', '教练', NULL, NULL, NULL, NULL, 1, 'test', 'test', 'A1', NULL, 12, '12', NULL, '2015-08-26', '4', '男', NULL, '456456'),
	(140, 1, '2015-09-07', 'a', '2015-09-09 16:24:31', '2015-09-09 16:24:29', 5, 'teacher', '教练', NULL, NULL, NULL, NULL, 1, 'test', 'test', 'A1', NULL, 13, 'af', NULL, '2015-08-26', '5', '男', NULL, '456456'),
	(141, 1, '2015-09-07', 'a', '2015-09-09 16:24:31', '2015-09-09 16:24:29', 5, 'teacher', '教练', NULL, NULL, NULL, NULL, 1, 'test', 'test', 'A1', NULL, 14, '123', NULL, '2015-08-26', '6', '女', NULL, '456456'),
	(142, 1, '2015-09-07', 'a', '2015-09-09 16:24:31', '2015-09-09 16:24:29', 5, 'teacher', '教练', NULL, NULL, NULL, NULL, 1, 'test', 'test', 'A1', NULL, 16, '333', NULL, '2015-08-26', '7', '男', NULL, '456456'),
	(143, 1, '2015-09-07', 'a', '2015-09-09 16:24:31', '2015-09-09 16:24:29', 5, 'teacher', '教练', NULL, NULL, NULL, NULL, 1, 'test', 'test', 'A1', NULL, 17, '23', NULL, '2015-09-08', '32133213321332133213321332133213321332133213321332', '女', NULL, '456456'),
	(144, 1, '2015-09-07', 'a', '2015-09-09 16:24:31', '2015-09-09 16:24:29', 5, 'teacher', '教练', NULL, NULL, NULL, NULL, 1, 'test', 'test', 'A1', NULL, 19, '111', NULL, '2015-09-08', '32133213321332133213321332133213321332133213321332', '男', NULL, '456456'),
	(145, 1, '2015-09-07', 'a', '2015-09-09 16:24:31', '2015-09-09 16:24:29', 5, 'teacher', '教练', NULL, NULL, NULL, NULL, 1, 'test', 'test', 'A1', NULL, 20, '1232131', NULL, '2015-09-08', '32133213321332133213321332133213321332133213321332', '女', NULL, '456456');
/*!40000 ALTER TABLE `his_schedule` ENABLE KEYS */;


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
  `advisorId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_48b0j3yrfai6r6ax6k06p4mpf` (`memberName`),
  KEY `FK_gahm1b2bsoq0nco4wbc23xc37` (`advisorId`),
  CONSTRAINT `FK_gahm1b2bsoq0nco4wbc23xc37` FOREIGN KEY (`advisorId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.members 的数据：~15 rows (大约)
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` (`id`, `address`, `age`, `birthday`, `comment`, `endDate`, `memberName`, `nickName`, `password`, `pic`, `realName`, `registrationChannel`, `sex`, `startDate`, `advisorId`) VALUES
	(1, '1', NULL, '1899-12-12', '1', NULL, '1', NULL, NULL, NULL, '1', NULL, 0, NULL, 3),
	(9, NULL, NULL, '2015-08-26', NULL, NULL, '33', NULL, NULL, NULL, '2', NULL, 0, NULL, 4),
	(11, NULL, NULL, '2015-08-26', NULL, NULL, 'ads', NULL, NULL, NULL, '3', NULL, 0, NULL, 5),
	(12, NULL, NULL, '2015-08-26', NULL, NULL, '12', NULL, NULL, NULL, '4', NULL, 0, NULL, 2),
	(13, NULL, NULL, '2015-08-26', NULL, NULL, 'af', NULL, NULL, NULL, '5', NULL, 0, NULL, 1),
	(14, NULL, NULL, '2015-08-26', NULL, NULL, '123', NULL, NULL, NULL, '6', NULL, 1, NULL, 6),
	(16, NULL, NULL, '2015-08-26', NULL, NULL, '333', NULL, NULL, NULL, '7', NULL, 0, NULL, 4),
	(17, NULL, NULL, '2015-09-08', NULL, NULL, '23', NULL, NULL, NULL, '32133213321332133213321332133213321332133213321332', NULL, 1, NULL, 5),
	(19, NULL, NULL, '2015-09-08', NULL, NULL, '111', NULL, NULL, NULL, '32133213321332133213321332133213321332133213321332', NULL, 0, NULL, 7),
	(20, NULL, NULL, '2015-09-08', NULL, NULL, '1232131', NULL, NULL, NULL, '32133213321332133213321332133213321332133213321332', NULL, 1, NULL, 6),
	(22, NULL, NULL, '2015-09-08', NULL, NULL, '3123', NULL, NULL, NULL, 'i', NULL, 0, NULL, 9),
	(23, NULL, NULL, '2015-09-08', NULL, NULL, 'f', NULL, NULL, NULL, 't', NULL, 0, NULL, 9),
	(24, NULL, NULL, '2015-09-08', NULL, NULL, 'qwef', NULL, NULL, NULL, 't', NULL, 0, NULL, 5),
	(26, NULL, NULL, '2015-09-08', NULL, NULL, 'dsf', NULL, NULL, NULL, 'i', NULL, 0, NULL, 10),
	(27, NULL, NULL, '2015-09-08', NULL, NULL, 'v', NULL, NULL, NULL, '8', NULL, 0, NULL, 9);
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

-- 正在导出表  haige.users 的数据：~13 rows (大约)
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
	(10, NULL, '', NULL, '45', NULL, NULL, NULL, '3', NULL, 0),
	(11, NULL, '', NULL, '45', NULL, NULL, NULL, '4', NULL, 0),
	(12, NULL, '', NULL, '65', NULL, NULL, NULL, '5', NULL, 0),
	(13, NULL, '', NULL, '65', NULL, NULL, NULL, '7', NULL, 0),
	(14, NULL, '', NULL, '65', NULL, NULL, NULL, '8', NULL, 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- 导出  视图 haige.view_all_schedule 结构
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `view_all_schedule` (
	`cs_id` BIGINT(20) NOT NULL,
	`cs_date` DATE NULL,
	`cs_comment` VARCHAR(5000) NULL COLLATE 'utf8_unicode_ci',
	`cs_startTime` TIME NULL,
	`cs_endTime` TIME NULL,
	`u_id` BIGINT(20) NULL,
	`u_userName` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`u_realName` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`u_tel` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`u_tel1` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`u_weChat` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`u_comment` VARCHAR(5000) NULL COLLATE 'utf8_unicode_ci',
	`c_id` BIGINT(20) NULL,
	`c_name` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`c_recommend` VARCHAR(5000) NULL COLLATE 'utf8_unicode_ci',
	`c_type` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`c_comment` VARCHAR(5000) NULL COLLATE 'utf8_unicode_ci',
	`m_id` BIGINT(20) NULL,
	`m_memberName` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`m_age` INT(11) NULL,
	`m_birthday` DATE NULL,
	`m_realName` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`m_sex` VARCHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`m_address` VARCHAR(500) NULL COLLATE 'utf8_unicode_ci'
) ENGINE=MyISAM;


-- 导出  视图 haige.view_members 结构
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `view_members` (
	`m_memberName` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
	`m_age` INT(11) NULL,
	`m_birthday` DATE NOT NULL,
	`m_realName` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
	`m_sex` INT(11) NOT NULL,
	`m_address` VARCHAR(500) NULL COLLATE 'utf8_unicode_ci',
	`m_rChannel` VARCHAR(500) NULL COLLATE 'utf8_unicode_ci',
	`m_comment` VARCHAR(5000) NULL COLLATE 'utf8_unicode_ci',
	`u_realName` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`u_userName` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`u_tel` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`u_weChat` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`ml_name` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`ml_sex` INT(11) NULL,
	`ml_tel` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`ml_tel1` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`ml_weChat` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`mp_payDate` DATETIME NULL,
	`mp_pCount` INT(11) NULL
) ENGINE=MyISAM;


-- 导出  视图 haige.view_all_schedule 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `view_all_schedule`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `view_all_schedule` AS select cs.id as cs_id,cs.scheduleDate as cs_date,cs.`comment` as cs_comment, cs.startTime as cs_startTime,cs.endTime as cs_endTime,
u.id as u_id,u.userName as u_userName, u.realName as u_realName, u.tel as u_tel, u.tel1 as u_tel1, u.weChat as u_weChat, u.`comment` as u_comment,
c.id as c_id,c.name as c_name, c.recommend as c_recommend, c.`type` as c_type, c.`comment` as c_comment,
m.id as m_id,m.memberName as m_memberName, m.age as m_age, m.birthday as m_birthday, m.realName as m_realName, 
CASE WHEN m.sex=0 THEN '男' WHEN m.sex=1 THEN '女' ELSE '' END as m_sex,m.address as m_address
 from class_schedule cs
left join users u on cs.teacherid=u.id
left join classes c on cs.classid=c.id
left join class_schedule_members csm on cs.id = csm.scheduleid
left join members m on csm.memberId = m.id ;


-- 导出  视图 haige.view_members 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `view_members`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `view_members` AS SELECT m.memberName as m_memberName, m.age as m_age, m.birthday as m_birthday, m.realName as m_realName, m.sex as m_sex,
m.address as m_address,m.registrationChannel as m_rChannel, m.`comment` as m_comment,
u.realName as u_realName, u.userName as u_userName, u.tel as u_tel, u.weChat as u_weChat,
ml.name as ml_name, ml.sex as ml_sex, ml.tel as ml_tel, ml.tel1 as ml_tel1, ml.weChat as ml_weChat,
mp.payDate as mp_payDate, mp.purchaseCount as mp_pCount
from members m
left join users u on m.advisorid = u.id
left join member_linkman ml on m.id=ml.id
left join member_payment mp on m.id=mp.id ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
