/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : oem

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-06-29 23:14:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for order_receive
-- ----------------------------
DROP TABLE IF EXISTS `order_receive`;
CREATE TABLE `order_receive` (
  `id` varchar(32) NOT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `receiver_id` varchar(32) DEFAULT NULL,
  `del_flag` tinyint(4) NOT NULL,
  `remark` text,
  `info_obli_1` varchar(32) DEFAULT NULL,
  `info_obli_2` varchar(32) DEFAULT NULL,
  `info_obli_3` varchar(32) DEFAULT NULL,
  `info_obli_4` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `receiver_id` (`receiver_id`),
  CONSTRAINT `order_receive_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_task` (`id`),
  CONSTRAINT `order_receive_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_receive
-- ----------------------------

-- ----------------------------
-- Table structure for order_remark
-- ----------------------------
DROP TABLE IF EXISTS `order_remark`;
CREATE TABLE `order_remark` (
  `id` varchar(32) NOT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `del_flag` tinyint(4) NOT NULL,
  `remark` text,
  `info_obli_1` varchar(32) DEFAULT NULL,
  `info_obli_2` varchar(32) DEFAULT NULL,
  `info_obli_3` varchar(32) DEFAULT NULL,
  `info_obli_4` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `order_remark_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_task` (`id`),
  CONSTRAINT `order_remark_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_remark
-- ----------------------------

-- ----------------------------
-- Table structure for order_task
-- ----------------------------
DROP TABLE IF EXISTS `order_task`;
CREATE TABLE `order_task` (
  `id` varchar(32) NOT NULL,
  `order_number` varchar(32) NOT NULL,
  `create_time` datetime NOT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `last_update_userid` varchar(32) DEFAULT NULL,
  `order_name` varchar(14) DEFAULT NULL,
  `STATUS` tinyint(4) NOT NULL,
  `del_flag` tinyint(2) NOT NULL,
  `launcher_id` varchar(32) DEFAULT NULL,
  `receive_id` varchar(32) DEFAULT NULL,
  `remark` text,
  `info_obli_1` varchar(32) DEFAULT NULL,
  `info_obli_2` varchar(32) DEFAULT NULL,
  `info_obli_3` varchar(32) DEFAULT NULL,
  `info_obli_4` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `last_update_userid` (`last_update_userid`),
  KEY `launcher_id` (`launcher_id`),
  KEY `receive_id` (`receive_id`),
  CONSTRAINT `order_task_ibfk_1` FOREIGN KEY (`last_update_userid`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `order_task_ibfk_2` FOREIGN KEY (`launcher_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `order_task_ibfk_3` FOREIGN KEY (`receive_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_task
-- ----------------------------

-- ----------------------------
-- Table structure for sys_company
-- ----------------------------
DROP TABLE IF EXISTS `sys_company`;
CREATE TABLE `sys_company` (
  `id` varchar(32) NOT NULL,
  `company_name` varchar(32) DEFAULT NULL,
  `login_name` varchar(2) DEFAULT NULL,
  `phone_number` varchar(4) DEFAULT NULL,
  `del_flag` tinyint(2) NOT NULL,
  `STATUS` tinyint(3) NOT NULL,
  `info_obli_1` varchar(32) DEFAULT NULL,
  `info_obli_2` varchar(32) DEFAULT NULL,
  `info_obli_3` varchar(32) DEFAULT NULL,
  `info_obli_4` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_company
-- ----------------------------

-- ----------------------------
-- Table structure for sys_field
-- ----------------------------
DROP TABLE IF EXISTS `sys_field`;
CREATE TABLE `sys_field` (
  `id` varchar(32) NOT NULL,
  `field_name` varchar(32) DEFAULT NULL,
  `del_flag` tinyint(2) NOT NULL,
  `STATUS` tinyint(3) NOT NULL,
  `info_obli_1` varchar(32) DEFAULT NULL,
  `info_obli_2` varchar(32) DEFAULT NULL,
  `info_obli_3` varchar(32) DEFAULT NULL,
  `info_obli_4` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_field
-- ----------------------------

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` varchar(32) NOT NULL,
  `file_name` varchar(32) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `type` varchar(2) NOT NULL,
  `del_flag` tinyint(4) NOT NULL,
  `info_obli_1` varchar(32) DEFAULT NULL,
  `info_obli_2` varchar(32) DEFAULT NULL,
  `info_obli_3` varchar(32) DEFAULT NULL,
  `info_obli_4` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sys_file_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_task` (`id`),
  CONSTRAINT `sys_file_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `login_name` varchar(15) NOT NULL,
  `password` varchar(32) NOT NULL,
  `skilled_in_field_ids` varchar(32) DEFAULT NULL,
  `description` text,
  `company_id` varchar(32) DEFAULT NULL,
  `phone_number` varchar(14) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `credit_status` int(4) DEFAULT NULL,
  `type` varchar(2) NOT NULL,
  `account` int(11) NOT NULL DEFAULT '0',
  `last_logindate` datetime DEFAULT NULL,
  `access_token` varchar(32) DEFAULT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `info_obli_1` varchar(32) DEFAULT NULL,
  `info_obli_2` varchar(32) DEFAULT NULL,
  `info_obli_3` varchar(32) DEFAULT NULL,
  `info_obli_4` varchar(32) DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `sys_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1F69B3D54C2F95A014EA3CC131A34D5B', '2016-06-29 22:22:32', 'test', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, null, null, null, '1', '0', null, null, '0', null, null, null, null, '0');
