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
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `recommend` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.classes 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` (`id`, `comment`, `name`, `recommend`) VALUES
	(1, NULL, '教学课程', NULL),
	(2, NULL, '会员活动', NULL);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;


-- 导出  表 haige.class_schedule 结构
CREATE TABLE IF NOT EXISTS `class_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `costTimes` int(11) NOT NULL,
  `endTime` time NOT NULL,
  `scheduleDate` date NOT NULL,
  `startTime` time NOT NULL,
  `classId` bigint(20) NOT NULL,
  `creatorId` bigint(20) NOT NULL,
  `teacherId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_howfh9uicot374vw6hvep1s94` (`classId`),
  KEY `FK_k2mx0tf7wvkw6s24c7g6ik90s` (`creatorId`),
  KEY `FK_jqup1m8s9rtvgtsw2rej3n75g` (`teacherId`),
  CONSTRAINT `FK_howfh9uicot374vw6hvep1s94` FOREIGN KEY (`classId`) REFERENCES `classes` (`id`),
  CONSTRAINT `FK_jqup1m8s9rtvgtsw2rej3n75g` FOREIGN KEY (`teacherId`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_k2mx0tf7wvkw6s24c7g6ik90s` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.class_schedule 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `class_schedule` DISABLE KEYS */;
INSERT INTO `class_schedule` (`id`, `comment`, `costTimes`, `endTime`, `scheduleDate`, `startTime`, `classId`, `creatorId`, `teacherId`) VALUES
	(1, '3w', 2, '23:50:00', '2015-09-17', '14:50:00', 2, 1, 5),
	(7, '12', 1, '18:50:00', '2015-09-17', '15:10:00', 1, 1, 5);
/*!40000 ALTER TABLE `class_schedule` ENABLE KEYS */;


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
  `csm_evaluation` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `c_id` bigint(20) NOT NULL,
  `c_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `c_recommend` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_comment` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_id` bigint(20) DEFAULT NULL,
  `m_memberName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_age` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_birthday` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_realName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_sex` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_phase` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `p_name` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cs_evaluation` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.his_schedule 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `his_schedule` DISABLE KEYS */;
INSERT INTO `his_schedule` (`id`, `cs_id`, `cs_date`, `cs_comment`, `cs_startTime`, `cs_endTime`, `u_id`, `u_userName`, `u_realName`, `u_tel`, `u_tel1`, `u_weChat`, `u_comment`, `csm_evaluation`, `c_id`, `c_name`, `c_recommend`, `c_comment`, `m_id`, `m_memberName`, `m_age`, `m_birthday`, `m_realName`, `m_sex`, `m_address`, `m_phase`, `p_name`, `cs_evaluation`) VALUES
	(1, 2, '2015-09-03', '22232', '2015-09-18 01:05:00', '2015-09-18 07:15:00', 6, 'teacher1', '教练1', NULL, NULL, NULL, NULL, '1', 1, '教学课程', NULL, NULL, 11, 'ads', NULL, '2015-09-01', '3', '男', NULL, NULL, 'A1', NULL),
	(2, 2, '2015-09-03', '22232', '2015-09-18 01:05:00', '2015-09-18 07:15:00', 6, 'teacher1', '教练1', NULL, NULL, NULL, NULL, '3', 1, '教学课程', NULL, NULL, 13, 'af', NULL, '2015-09-01', '5', '男', NULL, NULL, 'A1', NULL),
	(4, 3, '2015-09-02', 'qq', '2015-09-18 15:05:00', '2015-09-18 17:45:00', 5, 'teacher', '教练', NULL, NULL, NULL, NULL, 'qwq', 1, '教学课程', NULL, NULL, 12, '12', NULL, '2015-09-01', '4', '男', NULL, NULL, 'A2', NULL),
	(5, 4, '1899-12-06', '1', '2015-09-18 01:10:00', '2015-09-18 08:40:00', 5, 'teacher', '教练', NULL, NULL, NULL, NULL, '11', 1, '教学课程', NULL, NULL, 17, '23', NULL, '2015-09-01', '让', '女', NULL, NULL, 'A2', NULL),
	(6, 5, '1899-12-12', '66', '2015-09-18 01:15:00', '2015-09-18 09:25:00', 5, 'teacher', '教练', NULL, NULL, NULL, NULL, '1', 1, '教学课程', NULL, NULL, 14, '123', NULL, '2015-09-01', '6', '女', NULL, NULL, 'A1', NULL),
	(7, 6, '2015-08-31', '1', '2015-09-18 00:10:00', '2015-09-18 13:25:00', 5, 'teacher', '教练', NULL, NULL, NULL, NULL, 'q', 1, '教学课程', NULL, NULL, 16, '333', NULL, '2015-09-01', '7', '男', NULL, NULL, 'A1', NULL);
/*!40000 ALTER TABLE `his_schedule` ENABLE KEYS */;


-- 导出  表 haige.members 结构
CREATE TABLE IF NOT EXISTS `members` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` date NOT NULL,
  `comment` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `leftTime` int(11) NOT NULL,
  `memberName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nickName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pic` tinyblob,
  `proType` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `registrationChannel` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) NOT NULL,
  `startDate` date DEFAULT NULL,
  `advisorId` bigint(20) NOT NULL,
  `phaseId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_48b0j3yrfai6r6ax6k06p4mpf` (`memberName`),
  KEY `FK_gahm1b2bsoq0nco4wbc23xc37` (`advisorId`),
  KEY `FK_epcibqrtum7r1bl1eeng90hyc` (`phaseId`),
  CONSTRAINT `FK_epcibqrtum7r1bl1eeng90hyc` FOREIGN KEY (`phaseId`) REFERENCES `phase` (`id`),
  CONSTRAINT `FK_gahm1b2bsoq0nco4wbc23xc37` FOREIGN KEY (`advisorId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.members 的数据：~18 rows (大约)
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` (`id`, `address`, `age`, `birthday`, `comment`, `endDate`, `leftTime`, `memberName`, `nickName`, `password`, `pic`, `proType`, `realName`, `registrationChannel`, `sex`, `startDate`, `advisorId`, `phaseId`) VALUES
	(1, '1', NULL, '2015-09-01', '1', '2015-12-09', 0, '1', NULL, NULL, NULL, '', '1', '', 0, NULL, 3, 2),
	(9, '', NULL, '2015-09-01', '', '1899-11-27', 4, '33', NULL, NULL, NULL, '', '2', NULL, 0, NULL, 4, 3),
	(16, NULL, NULL, '2015-09-01', NULL, '2015-12-09', 3, '333', NULL, NULL, NULL, NULL, '7', NULL, 0, NULL, 1, 1),
	(19, NULL, NULL, '2015-09-01', NULL, '2015-12-09', 4, '111', NULL, NULL, NULL, NULL, '发给', NULL, 0, NULL, 7, 2),
	(20, NULL, NULL, '2015-09-01', NULL, '2015-12-09', 4, '1232131', NULL, NULL, NULL, NULL, '34', NULL, 1, NULL, 6, 2),
	(22, NULL, NULL, '2015-09-01', NULL, '2015-12-09', 5, '3123', NULL, NULL, NULL, NULL, 'i', NULL, 0, NULL, 9, 1),
	(23, NULL, NULL, '2015-09-08', NULL, '2015-12-09', 5, 'f', NULL, NULL, NULL, NULL, 't', NULL, 0, NULL, 9, 3),
	(24, NULL, NULL, '2015-09-08', NULL, '2015-12-09', 5, 'qwef', NULL, NULL, NULL, NULL, 't', NULL, 0, NULL, 5, 3),
	(26, NULL, NULL, '2015-09-08', NULL, '2015-12-09', 5, 'dsf', NULL, NULL, NULL, NULL, 'i', NULL, 0, NULL, 10, 1),
	(27, NULL, NULL, '2015-09-08', NULL, '2015-12-09', 5, 'v', NULL, NULL, NULL, NULL, '8', NULL, 0, NULL, 9, 3),
	(28, '45', NULL, '1899-12-31', '54', '2015-12-09', 5, '45', NULL, NULL, NULL, '5', '45', NULL, 0, NULL, 3, 1),
	(31, '12', NULL, '2015-09-09', '1', '2015-12-09', 5, '112', NULL, NULL, NULL, '1', '1', '1', 0, NULL, 3, 1),
	(32, '6', NULL, '1899-12-07', '6', '2015-12-09', 5, '556', NULL, NULL, NULL, '6', '66', '6', 0, NULL, 3, 2),
	(33, '5546', NULL, '1899-12-05', '565', '1899-11-27', 0, '555', NULL, NULL, NULL, '5', '555', '5456', 0, NULL, 3, 1);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;


-- 导出  表 haige.member_event 结构
CREATE TABLE IF NOT EXISTS `member_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `costTimes` int(11) NOT NULL,
  `endTime` time NOT NULL,
  `eventDate` date NOT NULL,
  `startTime` time NOT NULL,
  `creatorId` bigint(20) DEFAULT NULL,
  `memberId` bigint(20) DEFAULT NULL,
  `teacherId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hsdgnfoox9gmmbo09sj2gguh5` (`creatorId`),
  KEY `FK_esgdjckwcnhtpfo518u7pa45m` (`memberId`),
  KEY `FK_tmh9sxsa5m4k9js3j19hmhji2` (`teacherId`),
  CONSTRAINT `FK_esgdjckwcnhtpfo518u7pa45m` FOREIGN KEY (`memberId`) REFERENCES `members` (`id`),
  CONSTRAINT `FK_hsdgnfoox9gmmbo09sj2gguh5` FOREIGN KEY (`creatorId`) REFERENCES `members` (`id`),
  CONSTRAINT `FK_tmh9sxsa5m4k9js3j19hmhji2` FOREIGN KEY (`teacherId`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.member_event 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `member_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_event` ENABLE KEYS */;


-- 导出  表 haige.member_linkman 结构
CREATE TABLE IF NOT EXISTS `member_linkman` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `relation` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
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
  `comment` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payDate` date NOT NULL,
  `payPerson` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment` decimal(12,2) NOT NULL,
  `purchaseCount` int(11) NOT NULL,
  `memberId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7jffdh85cn7x6ukn9a8vwce66` (`memberId`),
  CONSTRAINT `FK_7jffdh85cn7x6ukn9a8vwce66` FOREIGN KEY (`memberId`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.member_payment 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `member_payment` DISABLE KEYS */;
INSERT INTO `member_payment` (`id`, `comment`, `payDate`, `payPerson`, `payment`, `purchaseCount`, `memberId`) VALUES
	(1, '1', '1899-12-31', '1', 10001.00, 11, 1);
/*!40000 ALTER TABLE `member_payment` ENABLE KEYS */;


-- 导出  表 haige.phase 结构
CREATE TABLE IF NOT EXISTS `phase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `recommend` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.phase 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `phase` DISABLE KEYS */;
INSERT INTO `phase` (`id`, `name`, `recommend`) VALUES
	(1, 'A1', NULL),
	(2, 'A2', NULL),
	(3, 'A3', NULL);
/*!40000 ALTER TABLE `phase` ENABLE KEYS */;


-- 导出  表 haige.roles 结构
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `roleName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.roles 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `comment`, `realName`, `roleName`) VALUES
	(0, NULL, '超级管理员', 'root'),
	(1, NULL, '管理员', 'admin'),
	(2, NULL, '教练', 'coach'),
	(3, NULL, '顾问', 'advisor'),
	(4, NULL, '出纳', 'cashier');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- 导出  表 haige.schedule_member 结构
CREATE TABLE IF NOT EXISTS `schedule_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `evaluation` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memberId` bigint(20) NOT NULL,
  `scheduleId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pcr2m4y54h86rhve0qv803sem` (`memberId`),
  KEY `FK_q229m8h8inkruewj0wrtuc7kb` (`scheduleId`),
  CONSTRAINT `FK_pcr2m4y54h86rhve0qv803sem` FOREIGN KEY (`memberId`) REFERENCES `members` (`id`),
  CONSTRAINT `FK_q229m8h8inkruewj0wrtuc7kb` FOREIGN KEY (`scheduleId`) REFERENCES `class_schedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.schedule_member 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `schedule_member` DISABLE KEYS */;
INSERT INTO `schedule_member` (`id`, `comment`, `evaluation`, `memberId`, `scheduleId`) VALUES
	(17, NULL, NULL, 9, 1),
	(40, NULL, NULL, 16, 7),
	(41, NULL, NULL, 19, 7);
/*!40000 ALTER TABLE `schedule_member` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  haige.users 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `comment`, `password`, `pic`, `realName`, `tel`, `tel1`, `tel2`, `userName`, `weChat`, `roleId`) VALUES
	(1, '', '111111', NULL, '超级管理员', '2', NULL, NULL, 'root', '', 0),
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
	(13, NULL, '123456', NULL, '65', NULL, NULL, NULL, '7', NULL, 0),
	(14, NULL, '', NULL, '65', NULL, NULL, NULL, '8', NULL, 0),
	(15, NULL, '123456', NULL, '出纳', NULL, NULL, NULL, 'cashier', NULL, 4);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- 导出  视图 haige.view_all_schedule 结构
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `view_all_schedule` (
	`cs_id` BIGINT(20) NOT NULL,
	`cs_date` DATE NOT NULL,
	`cs_comment` VARCHAR(5000) NULL COLLATE 'utf8_unicode_ci',
	`cs_startTime` TIME NOT NULL,
	`cs_endTime` TIME NOT NULL,
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
	`c_comment` VARCHAR(5000) NULL COLLATE 'utf8_unicode_ci',
	`m_id` BIGINT(20) NULL,
	`m_memberName` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`m_age` INT(11) NULL,
	`m_birthday` DATE NULL,
	`m_realName` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`m_sex` VARCHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`m_address` VARCHAR(500) NULL COLLATE 'utf8_unicode_ci',
	`csm_evaluation` VARCHAR(500) NULL COLLATE 'utf8_unicode_ci',
	`p_name` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci'
) ENGINE=MyISAM;


-- 导出  视图 haige.view_members 结构
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `view_members` (
	`m_id` BIGINT(20) NOT NULL,
	`m_memberName` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
	`m_age` INT(11) NULL,
	`m_birthday` DATE NOT NULL,
	`m_realName` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
	`m_sex` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci',
	`m_endDate` DATE NULL,
	`m_proType` VARCHAR(500) NULL COLLATE 'utf8_unicode_ci',
	`m_address` VARCHAR(500) NULL COLLATE 'utf8_unicode_ci',
	`m_rChannel` VARCHAR(500) NULL COLLATE 'utf8_unicode_ci',
	`m_leftTime` INT(11) NOT NULL,
	`m_comment` VARCHAR(5000) NULL COLLATE 'utf8_unicode_ci',
	`u_id` BIGINT(20) NULL,
	`u_realName` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`u_userName` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`u_tel` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`u_weChat` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`ml_id` BIGINT(20) NULL,
	`ml_name` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`ml_relation` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`ml_sex` INT(11) NULL,
	`ml_tel` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`ml_tel1` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`ml_weChat` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`p_name` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci'
) ENGINE=MyISAM;


-- 导出  视图 haige.view_member_payment 结构
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `view_member_payment` (
	`m_id` BIGINT(20) NOT NULL,
	`m_memberName` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
	`m_age` INT(11) NULL,
	`m_birthday` DATE NOT NULL,
	`m_realName` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
	`m_sex` INT(11) NOT NULL,
	`m_address` VARCHAR(500) NULL COLLATE 'utf8_unicode_ci',
	`m_rChannel` VARCHAR(500) NULL COLLATE 'utf8_unicode_ci',
	`m_leftTime` INT(11) NOT NULL,
	`m_comment` VARCHAR(5000) NULL COLLATE 'utf8_unicode_ci',
	`u_id` BIGINT(20) NULL,
	`u_realName` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`u_userName` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`u_tel` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`u_weChat` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`mp_payDate` DATE NULL,
	`mp_pPerson` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`mp_payment` DECIMAL(12,2) NULL,
	`mp_pCount` INT(11) NULL
) ENGINE=MyISAM;


-- 导出  视图 haige.view_all_schedule 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `view_all_schedule`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `view_all_schedule` AS select cs.id as cs_id,cs.scheduleDate as cs_date,cs.`comment` as cs_comment, cs.startTime as cs_startTime,cs.endTime as cs_endTime,
u.id as u_id,u.userName as u_userName, u.realName as u_realName, u.tel as u_tel, u.tel1 as u_tel1, u.weChat as u_weChat, u.`comment` as u_comment,
c.id as c_id,c.name as c_name, c.recommend as c_recommend, c.`comment` as c_comment,
m.id as m_id,m.memberName as m_memberName, m.age as m_age, m.birthday as m_birthday, m.realName as m_realName, 
CASE WHEN m.sex=0 THEN '男' WHEN m.sex=1 THEN '女' ELSE '' END as m_sex,m.address as m_address,
csm.evaluation as csm_evaluation,
p.name as p_name
 from class_schedule cs
left join users u on cs.teacherid=u.id
left join classes c on cs.classid=c.id
left join schedule_member csm on cs.id = csm.scheduleid
left join members m on csm.memberId = m.id 
left join phase p on m.phaseId = p.id ;


-- 导出  视图 haige.view_members 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `view_members`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `view_members` AS SELECT m.id as m_id, m.memberName as m_memberName, m.age as m_age, m.birthday as m_birthday, m.realName as m_realName,
CASE WHEN m.sex=0 THEN '男' WHEN m.sex=1 THEN '女' ELSE '' END as m_sex,m.endDate as m_endDate,m.proType as m_proType,
m.address as m_address,m.registrationChannel as m_rChannel,m.leftTime as m_leftTime, m.`comment` as m_comment,
u.id as u_id, u.realName as u_realName, u.userName as u_userName, u.tel as u_tel, u.weChat as u_weChat,
ml.id as ml_id, ml.name as ml_name, ml.relation as ml_relation, ml.sex as ml_sex, ml.tel as ml_tel, ml.tel1 as ml_tel1, ml.weChat as ml_weChat,
p.name as p_name
from members m
left join users u on m.advisorid = u.id
left join member_linkman ml on m.id=ml.memberId 
left join phase p on m.phaseId = p.id ;


-- 导出  视图 haige.view_member_payment 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `view_member_payment`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `view_member_payment` AS SELECT m.id as m_id, m.memberName as m_memberName, m.age as m_age, m.birthday as m_birthday, m.realName as m_realName, m.sex as m_sex,
m.address as m_address,m.registrationChannel as m_rChannel,m.leftTime as m_leftTime, m.`comment` as m_comment,
u.id as u_id, u.realName as u_realName, u.userName as u_userName, u.tel as u_tel, u.weChat as u_weChat,
mp.payDate as mp_payDate, mp.payPerson as mp_pPerson,mp.payment as mp_payment,mp.purchaseCount as mp_pCount
from members m
left join users u on m.advisorid = u.id
left join member_payment mp on m.id=mp.memberId ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
