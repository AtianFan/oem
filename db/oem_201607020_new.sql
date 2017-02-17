/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : oem

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-07-20 17:59:31
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
  `del_flag` tinyint(4) NOT NULL DEFAULT '0',
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
INSERT INTO `order_receive` VALUES ('0c4e8c3dc7014610b7ef9b1661b46d76', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 21:51:02', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123123', null, null, null, null, null);
INSERT INTO `order_receive` VALUES ('25ede8922da046c0a4e77ac78219cbc6', 'a096e2d819a546a68f93da5e98f20379', '2016-07-19 00:06:29', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '123');
INSERT INTO `order_receive` VALUES ('4d7b686104b8474cb33e7d9940134880', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 23:19:44', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '12345');
INSERT INTO `order_receive` VALUES ('4faccded4b8f4baf8c44cef315733e8f', null, '2016-07-18 23:04:38', null, '0', '123154', null, null, null, null, null);
INSERT INTO `order_receive` VALUES ('5f7be63fa5fd4eee93c79374c4313788', null, '2016-07-18 23:04:14', null, '0', '1231551', null, null, null, null, null);
INSERT INTO `order_receive` VALUES ('74edb6dcafe544019c88b527f5c865a3', 'a096e2d819a546a68f93da5e98f20379', '2016-07-19 00:06:11', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '1234125');
INSERT INTO `order_receive` VALUES ('7be6ddac28d04aa09be67d5569f72259', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 23:19:45', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '12456');
INSERT INTO `order_receive` VALUES ('8f11db33d88c43689a551b5b1faf511e', null, '2016-07-18 23:06:15', null, '0', '123412', null, null, null, null, '1231241245');
INSERT INTO `order_receive` VALUES ('8fa949a3b32c4e769862eda7e85c9804', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 23:19:56', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', 'asd123', null, null, null, null, '1245');
INSERT INTO `order_receive` VALUES ('9ae58ccbcb2a4673b104c9b3abbea97a', null, '2016-07-18 23:07:31', null, '0', '123124123', null, null, null, null, '12415');
INSERT INTO `order_receive` VALUES ('a2cf54538d524c5bb0784c4770efa3ba', null, '2016-07-18 23:06:02', null, '0', '123', null, null, null, null, null);
INSERT INTO `order_receive` VALUES ('a35fa281322d46818026aae1f21a04f7', 'a096e2d819a546a68f93da5e98f20379', '2016-07-19 00:07:05', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '123');
INSERT INTO `order_receive` VALUES ('bf077210636f4c07953fa940c10c3c20', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 23:19:45', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '1235');
INSERT INTO `order_receive` VALUES ('d3e5cc31e0a440debccd3f4c8e6b8e80', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 23:19:45', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '12456');

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
  `receiver_id` varchar(32) DEFAULT NULL COMMENT '接受方id',
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
  `order_receiver_id` varchar(32) DEFAULT NULL COMMENT '接包方id',
  `end_time` datetime DEFAULT NULL COMMENT '任务结束时间',
  PRIMARY KEY (`id`),
  KEY `last_update_userid` (`last_update_userid`),
  KEY `launcher_id` (`launcher_id`),
  KEY `receive_id` (`receiver_id`),
  CONSTRAINT `order_task_ibfk_1` FOREIGN KEY (`last_update_userid`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `order_task_ibfk_2` FOREIGN KEY (`launcher_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `order_task_ibfk_3` FOREIGN KEY (`receiver_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_task
-- ----------------------------
INSERT INTO `order_task` VALUES ('0c4e8c3dc7014610b7ef9b1661b46d76', 'OR_20160712215836', '2016-07-12 21:58:36', '2016-07-12 21:58:36', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, null, null, null, null);
INSERT INTO `order_task` VALUES ('0f192c986cb64a00a979cd90eea1ee73', 'OR_20160712223710', '2016-07-12 22:37:11', '2016-07-12 22:37:11', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null);
INSERT INTO `order_task` VALUES ('108e28ab4d234ae78e35c3d08982b45c', 'OR_20160718233539', '2016-07-18 23:35:39', '2016-07-18 23:35:39', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '123', '123', null, '12312', '3123123', null, null);
INSERT INTO `order_task` VALUES ('1439346cf79a4b798cfa969d508e3917', 'OR_20160712220626', '2016-07-12 22:06:26', '2016-07-12 22:06:26', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, null, null, null, null);
INSERT INTO `order_task` VALUES ('1706c24bcabf4696b2a9a13decbe7ec7', 'OR_20160712220759', '2016-07-12 22:08:22', '2016-07-12 22:08:22', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, '1232123', null, null, null);
INSERT INTO `order_task` VALUES ('28206489feaa4370b0154f7e41034b55', 'OR_20160712215344', '2016-07-12 21:53:44', '2016-07-12 21:53:44', null, null, '0', '0', null, null, null, null, null, null, null, '', null, null, null, null, null, null, null);
INSERT INTO `order_task` VALUES ('2f7ec4839b2c42b99c42c84f91b86930', 'OR_20160712230149', '2016-07-12 23:01:49', '2016-07-12 23:01:49', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null);
INSERT INTO `order_task` VALUES ('30ccb85e556c403ebe0c6c724f0ea441', 'OR_20160712223825', '2016-07-12 22:38:28', '2016-07-12 22:38:28', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null);
INSERT INTO `order_task` VALUES ('361c22e1c27b4997a821548cb767abec', 'OR_20160718234117', '2016-07-18 23:41:17', '2016-07-18 23:41:17', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '123', '123', null, '123', '1235', null, null);
INSERT INTO `order_task` VALUES ('3d39fcab6d744b58876dd84e9ced8e68', 'OR_20160712211513', '2016-07-12 21:15:13', '2016-07-12 21:15:13', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, null, null, null, null);
INSERT INTO `order_task` VALUES ('4e2a3dadadff48d48978191e08ff319b', 'OR_20160712230050', '2016-07-12 23:00:50', '2016-07-12 23:00:50', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null);
INSERT INTO `order_task` VALUES ('5c16b61d59dc49c68334bd18934e3346', 'OR_20160712214619', '2016-07-12 21:46:19', '2016-07-12 21:46:19', null, null, '0', '0', null, null, null, null, null, null, null, '', null, null, null, null, null, null, null);
INSERT INTO `order_task` VALUES ('5d2b008bc0cf467b857bc31eca502373', 'OR_20160712224619', '2016-07-12 22:46:19', '2016-07-12 22:46:19', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null);
INSERT INTO `order_task` VALUES ('63b85b5167214cf2ac0e25943062767f', 'OR_20160705234141', '2016-07-05 23:41:41', '2016-07-05 23:41:41', null, '项目名称', '0', '0', null, null, null, null, null, null, null, '项目名称', '项目介绍', '项目简介', null, null, null, null, null);
INSERT INTO `order_task` VALUES ('64cdae31fff84e028e1a7c333a10fa9a', 'OR_20160718233911', '2016-07-18 23:39:11', '2016-07-18 23:39:11', null, '13', '0', '0', null, null, null, null, null, null, null, '13', '123', '123', null, '123', '123124125', null, null);
INSERT INTO `order_task` VALUES ('6adc27d916f84a8b8462332b87de0664', 'OR_20160712224400', '2016-07-12 22:44:00', '2016-07-12 22:44:00', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null);
INSERT INTO `order_task` VALUES ('80aadfb678cc401e836f14b7d66cbb27', 'OR_20160712223742', '2016-07-12 22:37:42', '2016-07-12 22:37:42', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null);
INSERT INTO `order_task` VALUES ('8eff2f884b074727808307174239bd19', 'OR_20160718233304', '2016-07-18 23:33:04', '2016-07-18 23:33:04', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '124', '121', null, '1231', '2312', null, null);
INSERT INTO `order_task` VALUES ('94ad20b0262a4efd8d5fe02887331340', 'OR_20160718233851', '2016-07-18 23:38:51', '2016-07-18 23:38:51', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '123', '123', null, '2312', '3123', null, null);
INSERT INTO `order_task` VALUES ('9aa43c8daebc4b68a65acd82618e20a9', 'OR_20160705233550', '2016-07-05 23:35:50', null, null, '123', '0', '0', null, null, null, null, null, null, null, '123', null, null, null, null, null, null, null);
INSERT INTO `order_task` VALUES ('a096e2d819a546a68f93da5e98f20379', 'OR_20160718234000', '2016-07-18 23:40:00', '2016-07-18 23:40:00', null, '13', '0', '0', null, null, null, null, null, null, null, '13', '123', '123', null, '123', '123124125', null, null);
INSERT INTO `order_task` VALUES ('a25bbbdf952d410d889c7ee049f4796b', 'OR_20160712221021', '2016-07-12 22:10:31', '2016-07-12 22:10:31', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, '1232123', '1231', null, null);
INSERT INTO `order_task` VALUES ('a9908b3c3f594a448b8255feff40832e', 'OR_20160712224523', '2016-07-12 22:45:23', '2016-07-12 22:45:23', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null);
INSERT INTO `order_task` VALUES ('b0373c90420a4607986665303c4d4588', 'OR_20160712211716', '2016-07-12 21:17:16', '2016-07-12 21:17:16', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, null, null, null, null);
INSERT INTO `order_task` VALUES ('b5ae088366a140a4baaed1c80a48eba0', 'OR_20160712220640', '2016-07-12 22:06:40', '2016-07-12 22:06:40', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, '1232123', null, null, null);
INSERT INTO `order_task` VALUES ('c399e71c769144f087d320cab1885a88', 'OR_20160712220559', '2016-07-12 22:05:59', '2016-07-12 22:05:59', null, null, '0', '0', null, null, null, null, null, null, null, '', '123123', '123123', null, null, null, null, null);
INSERT INTO `order_task` VALUES ('c990251059fc4c27841795a3f0f3e9b6', 'OR_20160712224303', '2016-07-12 22:43:03', '2016-07-12 22:43:03', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null);
INSERT INTO `order_task` VALUES ('c9f5bede11334ffda18f11feee1e540b', 'OR_20160718233303', '2016-07-18 23:33:03', '2016-07-18 23:33:03', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '124', '121', null, '1231', '2312', null, null);
INSERT INTO `order_task` VALUES ('e738ea08d1e5412c994ebf56957ef2fe', 'OR_20160712224413', '2016-07-12 22:44:13', '2016-07-12 22:44:13', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null);
INSERT INTO `order_task` VALUES ('e85212dbc3cf4030b570a05b8bb2ff21', 'OR_20160712223527', '2016-07-12 22:35:31', '2016-07-12 22:35:31', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null);
INSERT INTO `order_task` VALUES ('f93f1e20e7b64bbeb8f3f9aed9626cf2', 'OR_20160712223424', '2016-07-12 22:34:24', '2016-07-12 22:34:24', null, '123', '0', '0', null, null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null);

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
INSERT INTO `sys_file` VALUES ('111034426fa44f1a9122ab6048493c20', '111034426fa44f1a9122ab6048493c20.jpg', '2016-07-18 23:39:03', 'a096e2d819a546a68f93da5e98f20379', null, '1', '0', null, null, null, null, '111034426fa44f1a9122ab6048493c20.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('28f83d9c9da64acb92a2066d28118ca1', '28f83d9c9da64acb92a2066d28118ca1.jpg', '2016-07-18 23:39:53', 'a096e2d819a546a68f93da5e98f20379', null, '1', '0', null, null, null, null, '28f83d9c9da64acb92a2066d28118ca1.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('3b0f1a33f25044e89d91a25c4e96b389', '3b0f1a33f25044e89d91a25c4e96b389.jpg', '2016-07-18 23:40:57', null, null, '0', '0', null, null, null, null, '3b0f1a33f25044e89d91a25c4e96b389.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('3baf89815743405ba003d3a1d654e07c', '3baf89815743405ba003d3a1d654e07c.jpg', '2016-07-12 18:53:51', null, null, '0', '0', null, null, null, null, '3baf89815743405ba003d3a1d654e07c.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('6a6b24dbcde2404ea0edcc3f06dacaa2', '6a6b24dbcde2404ea0edcc3f06dacaa2.jpg', '2016-07-12 18:54:22', null, null, '0', '0', null, null, null, null, '6a6b24dbcde2404ea0edcc3f06dacaa2.jpg', '10.jpg');
INSERT INTO `sys_file` VALUES ('6bdbf973aca8490cb0b00ee1d63d2f47', '6bdbf973aca8490cb0b00ee1d63d2f47.jpg', '2016-07-18 23:29:16', null, null, '0', '0', null, null, null, null, '6bdbf973aca8490cb0b00ee1d63d2f47.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('74b8958cf98947d09a5f50ecc9e05cce', '74b8958cf98947d09a5f50ecc9e05cce.jpg', '2016-07-12 22:12:02', null, null, '0', '0', null, null, null, null, '74b8958cf98947d09a5f50ecc9e05cce.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('7c511043b3ae4120abe346e65da42d11', '7c511043b3ae4120abe346e65da42d11.jpg', '2016-07-12 22:32:22', null, null, '0', '0', null, null, null, null, '7c511043b3ae4120abe346e65da42d11.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('7c962b6989a14d3f89a1821aaef271ec', '7c962b6989a14d3f89a1821aaef271ec.jpg', '2016-07-18 23:30:41', '8eff2f884b074727808307174239bd19', null, '1', '0', null, null, null, null, '7c962b6989a14d3f89a1821aaef271ec.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('7dce16a993334af991ad7ada14364986', '7dce16a993334af991ad7ada14364986.jpg', '2016-07-12 18:52:09', null, null, '0', '0', null, null, null, null, '7dce16a993334af991ad7ada14364986.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('7fd7e56194b84b3db62a6b8372a78d23', '7fd7e56194b84b3db62a6b8372a78d23.jpg', '2016-07-12 18:54:57', null, null, '0', '0', null, null, null, null, '7fd7e56194b84b3db62a6b8372a78d23.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('82514284d8b24284aaa872a714d3c76a', '82514284d8b24284aaa872a714d3c76a.jpg', '2016-07-18 23:40:56', null, null, '0', '0', null, null, null, null, '82514284d8b24284aaa872a714d3c76a.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('8c62d2e6886442eeb4e030a2e9855398', '8c62d2e6886442eeb4e030a2e9855398.jpg', '2016-07-12 22:33:43', '2f7ec4839b2c42b99c42c84f91b86930', null, '1', '0', null, null, null, null, '8c62d2e6886442eeb4e030a2e9855398.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('9a701d4581064c1dae34c4cf911c11e1', '9a701d4581064c1dae34c4cf911c11e1.jpg', '2016-07-12 22:11:51', null, null, '0', '0', null, null, null, null, '9a701d4581064c1dae34c4cf911c11e1.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('a10df7b6898743c9a920375bd3586760', 'a10df7b6898743c9a920375bd3586760.jpg', '2016-07-18 23:36:42', '94ad20b0262a4efd8d5fe02887331340', null, '1', '0', null, null, null, null, 'a10df7b6898743c9a920375bd3586760.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('b157a60edabd48aabc1ef24f8cf39728', 'b157a60edabd48aabc1ef24f8cf39728.jpg', '2016-07-12 18:37:46', null, null, '0', '0', null, null, null, null, 'b157a60edabd48aabc1ef24f8cf39728.jpg', '9.jpg');
INSERT INTO `sys_file` VALUES ('b383ecf83e074b98bd10ad7762061b80', 'b383ecf83e074b98bd10ad7762061b80.jpg', '2016-07-12 22:31:55', null, null, '0', '0', null, null, null, null, 'b383ecf83e074b98bd10ad7762061b80.jpg', '2.jpg');
INSERT INTO `sys_file` VALUES ('da324a32c7ae40ec836175580f122e63', 'da324a32c7ae40ec836175580f122e63.jpg', '2016-07-18 23:40:57', '361c22e1c27b4997a821548cb767abec', null, '1', '0', null, null, null, null, 'da324a32c7ae40ec836175580f122e63.jpg', '2016_innovation_day_video.jpg');
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
  `type` varchar(2) NOT NULL COMMENT '用户类型：标识公司还是个人',
  `account` int(11) NOT NULL DEFAULT '0',
  `last_logindate` datetime DEFAULT NULL,
  `access_token` varchar(32) DEFAULT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
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
  `account_type` varchar(2) DEFAULT NULL COMMENT '用户类型标识接包方还是发包方',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `sys_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1F69B3D54C2F95A014EA3CC131A34D5B', '2016-06-29 22:22:32', 'test', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, null, null, null, '1', '0', null, null, '0', null, null, null, null, '0', '', null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('9bd9768ff9404861a5658db901457a69', '2016-07-04 23:26:55', 'test1', '123456', null, null, null, '123', '123', null, '1', '0', '2016-07-04 23:26:55', null, '0', null, null, null, null, '0', '123', '123', '阿斯顿', null, null, null, null, null, null);
