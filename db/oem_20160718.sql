/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : 127.0.0.1:3306
Source Database       : oem

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-07-17 11:03:49
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
  `remark` varchar(4000) DEFAULT NULL,
  `info_obli_1` varchar(32) DEFAULT NULL,
  `info_obli_2` varchar(32) DEFAULT NULL,
  `info_obli_3` varchar(32) DEFAULT NULL,
  `info_obli_4` varchar(32) DEFAULT NULL,
  `money` double DEFAULT NULL COMMENT '报价',
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
  `status` tinyint(4) NOT NULL,
  `del_flag` tinyint(2) NOT NULL DEFAULT '0',
  `launcher_id` varchar(32) DEFAULT NULL,
  `receive_id` varchar(32) DEFAULT NULL,
  `remark` varchar(2048) DEFAULT NULL,
  `info_obli_1` varchar(32) DEFAULT NULL,
  `info_obli_2` varchar(32) DEFAULT NULL,
  `info_obli_3` varchar(32) DEFAULT NULL,
  `info_obli_4` varchar(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT '' COMMENT '项目名称',
  `description` varchar(2048) DEFAULT NULL COMMENT '介绍',
  `introduce` varchar(2048) DEFAULT NULL COMMENT '介绍',
  `type` tinyint(4) DEFAULT NULL COMMENT '项目类型',
  `requirements` varchar(2048) DEFAULT NULL COMMENT '成绩要求',
  `money` double DEFAULT NULL COMMENT '项目金额',
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
INSERT INTO `order_task` VALUES ('0c4e8c3dc7014610b7ef9b1661b46d76', 'OR_20160712215836', '2016-07-12 21:58:36', '2016-07-12 21:58:36', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, null, null);
INSERT INTO `order_task` VALUES ('0f192c986cb64a00a979cd90eea1ee73', 'OR_20160712223710', '2016-07-12 22:37:11', '2016-07-12 22:37:11', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12');
INSERT INTO `order_task` VALUES ('1439346cf79a4b798cfa969d508e3917', 'OR_20160712220626', '2016-07-12 22:06:26', '2016-07-12 22:06:26', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, null, null);
INSERT INTO `order_task` VALUES ('1706c24bcabf4696b2a9a13decbe7ec7', 'OR_20160712220759', '2016-07-12 22:08:22', '2016-07-12 22:08:22', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, '1232123', null);
INSERT INTO `order_task` VALUES ('28206489feaa4370b0154f7e41034b55', 'OR_20160712215344', '2016-07-12 21:53:44', '2016-07-12 21:53:44', null, null, '0', '0', null, null, null, null, null, null, null, '', null, null, null, null, null);
INSERT INTO `order_task` VALUES ('2f7ec4839b2c42b99c42c84f91b86930', 'OR_20160712230149', '2016-07-12 23:01:49', '2016-07-12 23:01:49', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12');
INSERT INTO `order_task` VALUES ('30ccb85e556c403ebe0c6c724f0ea441', 'OR_20160712223825', '2016-07-12 22:38:28', '2016-07-12 22:38:28', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12');
INSERT INTO `order_task` VALUES ('3d39fcab6d744b58876dd84e9ced8e68', 'OR_20160712211513', '2016-07-12 21:15:13', '2016-07-12 21:15:13', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, null, null);
INSERT INTO `order_task` VALUES ('4e2a3dadadff48d48978191e08ff319b', 'OR_20160712230050', '2016-07-12 23:00:50', '2016-07-12 23:00:50', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12');
INSERT INTO `order_task` VALUES ('5c16b61d59dc49c68334bd18934e3346', 'OR_20160712214619', '2016-07-12 21:46:19', '2016-07-12 21:46:19', null, null, '0', '0', null, null, null, null, null, null, null, '', null, null, null, null, null);
INSERT INTO `order_task` VALUES ('5d2b008bc0cf467b857bc31eca502373', 'OR_20160712224619', '2016-07-12 22:46:19', '2016-07-12 22:46:19', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12');
INSERT INTO `order_task` VALUES ('63b85b5167214cf2ac0e25943062767f', 'OR_20160705234141', '2016-07-05 23:41:41', '2016-07-05 23:41:41', null, '项目名称', '0', '0', null, null, null, null, null, null, null, '项目名称', '项目介绍', '项目简介', null, null, null);
INSERT INTO `order_task` VALUES ('6adc27d916f84a8b8462332b87de0664', 'OR_20160712224400', '2016-07-12 22:44:00', '2016-07-12 22:44:00', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12');
INSERT INTO `order_task` VALUES ('80aadfb678cc401e836f14b7d66cbb27', 'OR_20160712223742', '2016-07-12 22:37:42', '2016-07-12 22:37:42', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12');
INSERT INTO `order_task` VALUES ('9aa43c8daebc4b68a65acd82618e20a9', 'OR_20160705233550', '2016-07-05 23:35:50', null, null, '123', '0', '0', null, null, null, null, null, null, null, '123', null, null, null, null, null);
INSERT INTO `order_task` VALUES ('a25bbbdf952d410d889c7ee049f4796b', 'OR_20160712221021', '2016-07-12 22:10:31', '2016-07-12 22:10:31', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, '1232123', '1231');
INSERT INTO `order_task` VALUES ('a9908b3c3f594a448b8255feff40832e', 'OR_20160712224523', '2016-07-12 22:45:23', '2016-07-12 22:45:23', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12');
INSERT INTO `order_task` VALUES ('b0373c90420a4607986665303c4d4588', 'OR_20160712211716', '2016-07-12 21:17:16', '2016-07-12 21:17:16', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, null, null);
INSERT INTO `order_task` VALUES ('b5ae088366a140a4baaed1c80a48eba0', 'OR_20160712220640', '2016-07-12 22:06:40', '2016-07-12 22:06:40', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, '1232123', null);
INSERT INTO `order_task` VALUES ('c399e71c769144f087d320cab1885a88', 'OR_20160712220559', '2016-07-12 22:05:59', '2016-07-12 22:05:59', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, null, null);
INSERT INTO `order_task` VALUES ('c990251059fc4c27841795a3f0f3e9b6', 'OR_20160712224303', '2016-07-12 22:43:03', '2016-07-12 22:43:03', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12');
INSERT INTO `order_task` VALUES ('e738ea08d1e5412c994ebf56957ef2fe', 'OR_20160712224413', '2016-07-12 22:44:13', '2016-07-12 22:44:13', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12');
INSERT INTO `order_task` VALUES ('e85212dbc3cf4030b570a05b8bb2ff21', 'OR_20160712223527', '2016-07-12 22:35:31', '2016-07-12 22:35:31', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12');
INSERT INTO `order_task` VALUES ('f93f1e20e7b64bbeb8f3f9aed9626cf2', 'OR_20160712223424', '2016-07-12 22:34:24', '2016-07-12 22:34:24', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12');

-- ----------------------------
-- Table structure for order_type
-- ----------------------------
DROP TABLE IF EXISTS `order_type`;
CREATE TABLE `order_type` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '类型名称',
  `parent` varchar(255) DEFAULT NULL COMMENT '父节点id',
  `del_flag` tinyint(2) DEFAULT '0' COMMENT '是否删除，1表示删除 其他表示未删除',
  `description` varchar(4000) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_type
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
-- Table structure for sys_credit
-- ----------------------------
DROP TABLE IF EXISTS `sys_credit`;
CREATE TABLE `sys_credit` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT NULL,
  `score` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_credit
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
  `file_name` varchar(50) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `del_flag` tinyint(4) NOT NULL DEFAULT '0',
  `info_obli_1` varchar(32) DEFAULT NULL,
  `info_obli_2` varchar(32) DEFAULT NULL,
  `info_obli_3` varchar(32) DEFAULT NULL,
  `info_obli_4` varchar(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `origin_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sys_file_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_task` (`id`),
  CONSTRAINT `sys_file_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('3baf89815743405ba003d3a1d654e07c', '3baf89815743405ba003d3a1d654e07c.jpg', '2016-07-12 18:53:51', null, null, '0', '0', null, null, null, null, '3baf89815743405ba003d3a1d654e07c.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('6a6b24dbcde2404ea0edcc3f06dacaa2', '6a6b24dbcde2404ea0edcc3f06dacaa2.jpg', '2016-07-12 18:54:22', null, null, '0', '0', null, null, null, null, '6a6b24dbcde2404ea0edcc3f06dacaa2.jpg', '10.jpg');
INSERT INTO `sys_file` VALUES ('74b8958cf98947d09a5f50ecc9e05cce', '74b8958cf98947d09a5f50ecc9e05cce.jpg', '2016-07-12 22:12:02', null, null, '0', '0', null, null, null, null, '74b8958cf98947d09a5f50ecc9e05cce.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('7c511043b3ae4120abe346e65da42d11', '7c511043b3ae4120abe346e65da42d11.jpg', '2016-07-12 22:32:22', null, null, '0', '0', null, null, null, null, '7c511043b3ae4120abe346e65da42d11.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('7dce16a993334af991ad7ada14364986', '7dce16a993334af991ad7ada14364986.jpg', '2016-07-12 18:52:09', null, null, '0', '0', null, null, null, null, '7dce16a993334af991ad7ada14364986.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('7fd7e56194b84b3db62a6b8372a78d23', '7fd7e56194b84b3db62a6b8372a78d23.jpg', '2016-07-12 18:54:57', null, null, '0', '0', null, null, null, null, '7fd7e56194b84b3db62a6b8372a78d23.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('8c62d2e6886442eeb4e030a2e9855398', '8c62d2e6886442eeb4e030a2e9855398.jpg', '2016-07-12 22:33:43', '2f7ec4839b2c42b99c42c84f91b86930', null, '1', '0', null, null, null, null, '8c62d2e6886442eeb4e030a2e9855398.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('9a701d4581064c1dae34c4cf911c11e1', '9a701d4581064c1dae34c4cf911c11e1.jpg', '2016-07-12 22:11:51', null, null, '0', '0', null, null, null, null, '9a701d4581064c1dae34c4cf911c11e1.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('b157a60edabd48aabc1ef24f8cf39728', 'b157a60edabd48aabc1ef24f8cf39728.jpg', '2016-07-12 18:37:46', null, null, '0', '0', null, null, null, null, 'b157a60edabd48aabc1ef24f8cf39728.jpg', '9.jpg');
INSERT INTO `sys_file` VALUES ('b383ecf83e074b98bd10ad7762061b80', 'b383ecf83e074b98bd10ad7762061b80.jpg', '2016-07-12 22:31:55', null, null, '0', '0', null, null, null, null, 'b383ecf83e074b98bd10ad7762061b80.jpg', '2.jpg');
INSERT INTO `sys_file` VALUES ('da3f9fdf67654ee3955f0dc4971a69ab', 'da3f9fdf67654ee3955f0dc4971a69ab.jpg', '2016-07-12 18:53:47', null, null, '0', '0', null, null, null, null, 'da3f9fdf67654ee3955f0dc4971a69ab.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('ec3b4f1048354bc0b1a197d09e89d55c', 'ec3b4f1048354bc0b1a197d09e89d55c.jpg', '2016-07-12 22:34:00', '2f7ec4839b2c42b99c42c84f91b86930', null, '1', '0', null, null, null, null, 'ec3b4f1048354bc0b1a197d09e89d55c.jpg', '9.jpg');
INSERT INTO `sys_file` VALUES ('f0ce8e29e1504487b7a62878496bbed7', 'f0ce8e29e1504487b7a62878496bbed7.jpg', '2016-07-12 22:33:06', null, null, '0', '0', null, null, null, null, 'f0ce8e29e1504487b7a62878496bbed7.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('fb150ecb25844011b3f03e00a3865186', 'fb150ecb25844011b3f03e00a3865186.jpg', '2016-07-12 18:55:32', null, null, '0', '0', null, null, null, null, 'fb150ecb25844011b3f03e00a3865186.jpg', '5.jpg');

-- ----------------------------
-- Table structure for sys_score
-- ----------------------------
DROP TABLE IF EXISTS `sys_score`;
CREATE TABLE `sys_score` (
  `id` varchar(32) NOT NULL,
  `score` double DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT '0',
  `task_id` varchar(255) DEFAULT NULL,
  `rater_user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_score
-- ----------------------------
INSERT INTO `sys_score` VALUES ('1', '1121', null, '0', null, null);

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
  `description` varchar(2048) DEFAULT NULL,
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
  `real_name` varchar(128) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `id_no` varchar(32) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `lang` varchar(12) DEFAULT NULL COMMENT '设置语言',
  `last_loginout_date` datetime DEFAULT NULL COMMENT '最后登出时间',
  `confirm_status` tinyint(4) DEFAULT '0' COMMENT '确认状态',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `sys_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1F69B3D54C2F95A014EA3CC131A34D5B', '2016-06-29 22:22:32', 'test', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, null, null, null, '1', '0', null, null, '0', null, null, null, null, '0', '', null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('9bd9768ff9404861a5658db901457a69', '2016-07-04 23:26:55', 'test1', '123456', null, null, null, '123', '123', null, '1', '0', '2016-07-04 23:26:55', null, '0', null, null, null, null, '0', '123', '123', '阿斯顿', null, null, null, null, null);
