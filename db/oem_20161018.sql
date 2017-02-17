/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : oem

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-10-18 19:43:08
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
  `receive_status` tinyint(2) DEFAULT '0' COMMENT '任务接受状态',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `receiver_id` (`receiver_id`),
  CONSTRAINT `order_receive_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_task` (`id`),
  CONSTRAINT `order_receive_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_receive
-- ----------------------------
INSERT INTO `order_receive` VALUES ('0c4e8c3dc7014610b7ef9b1661b46d76', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 21:51:02', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123123', null, null, null, null, null, '0');
INSERT INTO `order_receive` VALUES ('14111ec869424aac95662719c912e369', 'c065bbd58f174cf589a072c4f5d714eb', '2016-07-26 23:12:42', '9bd9768ff9404861a5658db901457a69', '0', '123', null, null, null, null, '12314', '0');
INSERT INTO `order_receive` VALUES ('157803d293854ba5b41930b0d7f079b6', '0d62a88e74fa4f45bb153d94fbad4a88', '2016-09-07 10:42:53', null, '0', null, null, null, null, null, '0', '0');
INSERT INTO `order_receive` VALUES ('1962a388784b48b18eb980e73e8b7bfa', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:47:18', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12', '0');
INSERT INTO `order_receive` VALUES ('19f9ead60206404fae371aa4994931a5', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:47:09', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12', '0');
INSERT INTO `order_receive` VALUES ('2320414e0dce427b85acb0ae7ed004c7', 'c065bbd58f174cf589a072c4f5d714eb', '2016-07-26 23:13:22', '9bd9768ff9404861a5658db901457a69', '0', '123', null, null, null, null, '1', '0');
INSERT INTO `order_receive` VALUES ('25ba5617485d494085a69c26bc1bb175', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:46:59', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12', '0');
INSERT INTO `order_receive` VALUES ('25ede8922da046c0a4e77ac78219cbc6', 'a096e2d819a546a68f93da5e98f20379', '2016-07-19 00:06:29', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '123', '0');
INSERT INTO `order_receive` VALUES ('289ef5ed81184ac68b160697036985df', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:47:09', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12', '0');
INSERT INTO `order_receive` VALUES ('37eabe2282da4170bf2278b0e9c3b535', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:48:14', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '123', '0');
INSERT INTO `order_receive` VALUES ('4d7b686104b8474cb33e7d9940134880', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 23:19:44', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '12345', '0');
INSERT INTO `order_receive` VALUES ('4faccded4b8f4baf8c44cef315733e8f', null, '2016-07-18 23:04:38', null, '0', '123154', null, null, null, null, null, '0');
INSERT INTO `order_receive` VALUES ('4fb3af1726d640f2a21ab64db1ead5fa', '664f8e9c8b20489488fe6bf69188be01', '2016-08-11 00:09:19', null, '0', null, null, null, null, null, '19999', '0');
INSERT INTO `order_receive` VALUES ('5554309cd8ee4d0f98fefdd4e7c6aa30', '703a44705f3f4f2ba9c355419266c6af', '2016-08-21 20:36:03', null, '0', null, null, null, null, null, '3424', '0');
INSERT INTO `order_receive` VALUES ('5f7be63fa5fd4eee93c79374c4313788', null, '2016-07-18 23:04:14', null, '0', '1231551', null, null, null, null, null, '0');
INSERT INTO `order_receive` VALUES ('613fe27e5a5742328803fc75eab9fdcf', '5d72b27560fd40d2a5502d31e90b54d1', '2016-07-31 12:51:48', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '23', '1');
INSERT INTO `order_receive` VALUES ('74edb6dcafe544019c88b527f5c865a3', 'a096e2d819a546a68f93da5e98f20379', '2016-07-19 00:06:11', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '1234125', '0');
INSERT INTO `order_receive` VALUES ('7be6ddac28d04aa09be67d5569f72259', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 23:19:45', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '12456', '0');
INSERT INTO `order_receive` VALUES ('89f4047cd9a84c7fa796bfceaab7266e', '21b4eb5d6dc54f8d9a70da0ffb1a0bbc', '2016-07-26 23:45:44', '9bd9768ff9404861a5658db901457a69', '0', '123', null, null, null, null, '123', '0');
INSERT INTO `order_receive` VALUES ('8f11db33d88c43689a551b5b1faf511e', null, '2016-07-18 23:06:15', null, '0', '123412', null, null, null, null, '1231241245', '0');
INSERT INTO `order_receive` VALUES ('8f3fff00466a41a8b69d8a135a7b3d32', 'dd37ed11ce53465ba4bcfa29e9defd28', '2016-08-21 00:20:41', null, '0', null, null, null, null, null, '3', '0');
INSERT INTO `order_receive` VALUES ('8fa949a3b32c4e769862eda7e85c9804', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 23:19:56', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', 'asd123', null, null, null, null, '1245', '0');
INSERT INTO `order_receive` VALUES ('908b2c5d5d0c4644ae37f2b5fa6012ee', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:47:18', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12', '0');
INSERT INTO `order_receive` VALUES ('932d0bbaabac4763ac7ce7d13d6bb1f8', 'be68c316767c4d1eb23d78539123630c', '2016-08-07 19:38:09', null, '0', null, null, null, null, null, '23', '0');
INSERT INTO `order_receive` VALUES ('9ae58ccbcb2a4673b104c9b3abbea97a', null, '2016-07-18 23:07:31', null, '0', '123124123', null, null, null, null, '12415', '0');
INSERT INTO `order_receive` VALUES ('9b74464de6974b5abe25a8fbd24c7e0b', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:49:58', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '1', '0');
INSERT INTO `order_receive` VALUES ('a2cf54538d524c5bb0784c4770efa3ba', null, '2016-07-18 23:06:02', null, '0', '123', null, null, null, null, null, '0');
INSERT INTO `order_receive` VALUES ('a35fa281322d46818026aae1f21a04f7', 'a096e2d819a546a68f93da5e98f20379', '2016-07-19 00:07:05', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '123', '0');
INSERT INTO `order_receive` VALUES ('ab8175808b35441f819f7b0f4bc349b8', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:47:24', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12', '0');
INSERT INTO `order_receive` VALUES ('adb82be034664d01a7319a07859ee30c', '664f8e9c8b20489488fe6bf69188be01', '2016-08-11 00:11:34', null, '0', null, null, null, null, null, '111', '0');
INSERT INTO `order_receive` VALUES ('b309ce8f5e5945f3b5e03ebaabcdcd69', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:46:55', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12', '0');
INSERT INTO `order_receive` VALUES ('bf077210636f4c07953fa940c10c3c20', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 23:19:45', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '1235', '0');
INSERT INTO `order_receive` VALUES ('d3e5cc31e0a440debccd3f4c8e6b8e80', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 23:19:45', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '12456', '0');
INSERT INTO `order_receive` VALUES ('e5261bd13d1d4e39a3c01341ab919ced', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:47:24', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12', '0');
INSERT INTO `order_receive` VALUES ('fb325eda519346dbb7a0eeafe5364710', '283bb89dc1e24c5c9b5aa38b16d70925', '2016-08-20 23:13:32', null, '0', null, null, null, null, null, '1', '0');

-- ----------------------------
-- Table structure for order_receive_info
-- ----------------------------
DROP TABLE IF EXISTS `order_receive_info`;
CREATE TABLE `order_receive_info` (
  `id` varchar(32) NOT NULL,
  `receiver_id` varchar(32) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  `del_flag` tinyint(2) DEFAULT '0',
  `money` double DEFAULT NULL,
  `is_current` tinyint(1) DEFAULT NULL,
  `parent_order_id` varchar(32) NOT NULL,
  `sys_confirm_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_receive_info
-- ----------------------------
INSERT INTO `order_receive_info` VALUES ('04d47807a3ca4f53801474276a4c9977', '0d72f9906ac04332b817e1dd0f651eea', '0f1340c745ea455cb195815b552012c4', '0', '10', '1', '703a44705f3f4f2ba9c355419266c6af', 'e3a8a873916c4abcb33730bc5ee56deb');
INSERT INTO `order_receive_info` VALUES ('0d910e7785a5444baa08d0bd7768fdd6', '7c755b66c53b46c294356f4cbdf62edc', 'cfb9fedb063c472a8adb9ff2a369abca', '0', '1', '1', 'dd37ed11ce53465ba4bcfa29e9defd28', '5588f908bda14370a81c2ee82be4bde8');
INSERT INTO `order_receive_info` VALUES ('0f79a6fdf7634a16892187af3d97334e', '0d72f9906ac04332b817e1dd0f651eea', '53a5cbf347d942d89a9470642cd3e6cb', '0', '100', '1', '703a44705f3f4f2ba9c355419266c6af', '5183f955c8aa49b89524ecf796408782');
INSERT INTO `order_receive_info` VALUES ('11aa39eae4a442d2a3045218e87c2a09', '7c755b66c53b46c294356f4cbdf62edc', '53a5cbf347d942d89a9470642cd3e6cb', '0', '1', '1', '703a44705f3f4f2ba9c355419266c6af', '17e4939190954667b282c8ae680ba3d0');
INSERT INTO `order_receive_info` VALUES ('21eed7a385e249eda96ffbc5ff336aba', '0d72f9906ac04332b817e1dd0f651eea', 'cfb9fedb063c472a8adb9ff2a369abca', '0', '3', '1', 'dd37ed11ce53465ba4bcfa29e9defd28', 'a843051581214713bfdc7e34749647a3');
INSERT INTO `order_receive_info` VALUES ('609ee4151f574531b732b1589d926156', '0d72f9906ac04332b817e1dd0f651eea', 'e796f94aa33a462d84fd9409f85fc5e4', '0', '1000', '1', '703a44705f3f4f2ba9c355419266c6af', '5183f955c8aa49b89524ecf796408782');
INSERT INTO `order_receive_info` VALUES ('614f6eb040a544a39b74e2a3cac4ac02', '0d72f9906ac04332b817e1dd0f651eea', 'a835a8ce483d4739b4982eba0e3c6b3c', '0', '100', '1', '0d62a88e74fa4f45bb153d94fbad4a88', '2c2e80775731461c9d87b0f44fffa542');
INSERT INTO `order_receive_info` VALUES ('6c1af79fc43c4acdb774f843c1d55101', '0d72f9906ac04332b817e1dd0f651eea', '0846cf3615514b93bc7ced0c1cd0a129', '0', '10', '1', '283bb89dc1e24c5c9b5aa38b16d70925', 'b9ee5f4a579741e880d0228a3a2ee247');
INSERT INTO `order_receive_info` VALUES ('779bf471aefd43d8a7c8f118474bec72', '0d72f9906ac04332b817e1dd0f651eea', 'c648a21e97ce401381c3fd26a145d028', '0', '10', '1', '283bb89dc1e24c5c9b5aa38b16d70925', 'b9ee5f4a579741e880d0228a3a2ee247');
INSERT INTO `order_receive_info` VALUES ('88444a965a8b49e686ea2f8ed74e8063', '0d72f9906ac04332b817e1dd0f651eea', '0f1340c745ea455cb195815b552012c4', '0', '10', '1', '703a44705f3f4f2ba9c355419266c6af', '5183f955c8aa49b89524ecf796408782');
INSERT INTO `order_receive_info` VALUES ('9a21710ccd8142ad8b48e704d0508c5a', '7c755b66c53b46c294356f4cbdf62edc', '0f1340c745ea455cb195815b552012c4', '0', '0.1', '1', '703a44705f3f4f2ba9c355419266c6af', '17e4939190954667b282c8ae680ba3d0');
INSERT INTO `order_receive_info` VALUES ('9fcc470bf8974621b427c1b37c8d1430', '7c755b66c53b46c294356f4cbdf62edc', 'e796f94aa33a462d84fd9409f85fc5e4', '0', '10', '1', '703a44705f3f4f2ba9c355419266c6af', '17e4939190954667b282c8ae680ba3d0');
INSERT INTO `order_receive_info` VALUES ('a3d7865eaa384d22b3b5ea2545368874', '0d72f9906ac04332b817e1dd0f651eea', 'e796f94aa33a462d84fd9409f85fc5e4', '0', '1000', '1', '703a44705f3f4f2ba9c355419266c6af', 'e3a8a873916c4abcb33730bc5ee56deb');
INSERT INTO `order_receive_info` VALUES ('cbbb22a94e6845998423372a1201d830', '0d72f9906ac04332b817e1dd0f651eea', '53a5cbf347d942d89a9470642cd3e6cb', '0', '100', '1', '703a44705f3f4f2ba9c355419266c6af', 'e3a8a873916c4abcb33730bc5ee56deb');
INSERT INTO `order_receive_info` VALUES ('db7b4a2350bb4e1db8603a77f9337870', '0d72f9906ac04332b817e1dd0f651eea', 'f12702817076451b8cd2f9b11e8f6582', '0', '10', '1', '283bb89dc1e24c5c9b5aa38b16d70925', 'b9ee5f4a579741e880d0228a3a2ee247');
INSERT INTO `order_receive_info` VALUES ('ec058da28cc64fa0872bfefb900f1973', '0d72f9906ac04332b817e1dd0f651eea', 'a835a8ce483d4739b4982eba0e3c6b3c', '0', '1011', '1', '0d62a88e74fa4f45bb153d94fbad4a88', '148872bd2fc148af9ea48aa57ece5a8d');

-- ----------------------------
-- Table structure for order_remark
-- ----------------------------
DROP TABLE IF EXISTS `order_remark`;
CREATE TABLE `order_remark` (
  `id` varchar(32) NOT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `del_flag` tinyint(4) NOT NULL DEFAULT '0',
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
  `create_date` datetime NOT NULL,
  `last_update_date` datetime DEFAULT NULL,
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
  `launcher_status` tinyint(4) DEFAULT '0' COMMENT '发包方状态',
  `receiver_status` tinyint(4) DEFAULT '0' COMMENT '接包方状态',
  `parent_id` varchar(32) DEFAULT '-1' COMMENT '父节点id（-1表示没有子任务）',
  `icon_id` varchar(255) DEFAULT NULL,
  `sort_num` int(255) DEFAULT '0' COMMENT '子任务排序字段',
  `orinin_money` double DEFAULT '0' COMMENT '原始金额',
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
INSERT INTO `order_task` VALUES ('016f3f67e3ba493f98e817eab3d9ae5d', 'OR_20160725152357', '2016-07-25 15:23:57', '2016-07-25 15:23:57', '1F69B3D54C2F95A014EA3CC131A34D5B', '阿斯顿23', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '阿斯顿23', '123', '123', null, '12515123q', '123', null, null, '0', '0', '-1', '5d93e117f43440fd827df6a0ff7d0df2', '0', '0');
INSERT INTO `order_task` VALUES ('05c4e52ab61546e79d4460780fdf95b9', 'OR_20160821001937', '2016-08-21 00:19:37', '2016-08-21 00:19:37', '1F69B3D54C2F95A014EA3CC131A34D5B', '0819_01', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '0819_01', '0819_01', '0819_01', null, null, null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('05ed56e3420845ccb9278719b04506f9', 'OR_20160731111337', '2016-07-31 11:13:37', '2016-07-31 11:13:37', '9bd9768ff9404861a5658db901457a69', 'icon上传1', '1', '0', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, 'icon上传1', 'icon上传', 'icon上传', '1', 'icon上传', '12314', null, null, '0', '0', '-1', '5d93e117f43440fd827df6a0ff7d0df2', '0', '0');
INSERT INTO `order_task` VALUES ('0846cf3615514b93bc7ced0c1cd0a129', 'OR_20160820225940', '2016-08-20 22:59:40', '2016-08-20 22:59:40', '1F69B3D54C2F95A014EA3CC131A34D5B', '0819子任务测试。', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '0819子任务测试。', '0819子任务测试。', '0819子任务测试。', null, null, '10', null, null, '0', '0', '283bb89dc1e24c5c9b5aa38b16d70925', '', '0', '1');
INSERT INTO `order_task` VALUES ('0a009804ac0646b8886c337404f270a2', 'OR_20161011222439', '2016-10-11 22:24:39', '2016-10-11 22:24:39', '1F69B3D54C2F95A014EA3CC131A34D5B', '123123', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123123', '123', null, null, null, '123123123', null, null, '0', '0', 'ecb148784bd84faa861258fb7b33395e', '', '0', '123123123');
INSERT INTO `order_task` VALUES ('0c4e8c3dc7014610b7ef9b1661b46d76', 'OR_20160712215836', '2016-07-25 21:58:36', '2016-07-25 21:58:36', null, '有那个什么接包方', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, '', '123123', '123123', null, null, null, '8fa949a3b32c4e769862eda7e85c9804', null, '0', '-1', '-1', '5d93e117f43440fd827df6a0ff7d0df2', '0', '0');
INSERT INTO `order_task` VALUES ('0d62a88e74fa4f45bb153d94fbad4a88', 'OR_20160826210733', '2016-08-26 21:07:33', '2016-08-26 21:07:33', '1F69B3D54C2F95A014EA3CC131A34D5B', '826', '2', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', null, null, null, null, null, '826', '826', '826', '1', '826', null, '3c387af58b944b36ac4c3a2736230932', null, '0', '0', '-1', '4510a1af059c40fcb3ac75a285935821', '0', '0');
INSERT INTO `order_task` VALUES ('0f1340c745ea455cb195815b552012c4', 'OR_20160821202057', '2016-08-21 20:20:57', '2016-08-21 20:20:57', '1F69B3D54C2F95A014EA3CC131A34D5B', 'zi renwu', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, 'zi renwu', 'zi renwu', 'zi renwu', null, null, '10', null, null, '0', '0', '703a44705f3f4f2ba9c355419266c6af', '', '0', '1');
INSERT INTO `order_task` VALUES ('0f192c986cb64a00a979cd90eea1ee73', 'OR_20160712223710', '2016-07-12 22:37:11', '2016-07-12 22:37:11', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('100610d19ff74ff8ad5046dc82a003a3', 'OR_20160726220649', '2016-07-26 22:06:49', '2016-07-26 22:06:49', '1F69B3D54C2F95A014EA3CC131A34D5B', '1231231', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '1231231', '12312', '23123', null, null, null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('108e28ab4d234ae78e35c3d08982b45c', 'OR_20160718233539', '2016-07-18 23:35:39', '2016-07-18 23:35:39', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '123', '123', null, '12312', '3123123', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('140257ef1ea343c0a51be2b4b080fb48', 'OR_20160902193134', '2016-09-02 19:31:34', '2016-09-02 19:31:34', '1F69B3D54C2F95A014EA3CC131A34D5B', '201692', '1', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '201692', '201692', '201692', '1', '201692', null, null, null, '0', '0', '-1', '', '0', '0');
INSERT INTO `order_task` VALUES ('1439346cf79a4b798cfa969d508e3917', 'OR_20160712220626', '2016-07-12 22:06:26', '2016-07-12 22:06:26', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '123123', '123123', null, null, null, null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('14abd3b8a34241b79db6785607e6dac8', 'OR_20160727004041', '2016-07-27 00:40:41', '2016-07-27 00:40:41', '9bd9768ff9404861a5658db901457a69', 'app', '0', '0', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, 'app', 'app', 'app', null, 'app', '123', null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('15af70245589436a93bc2e3459fbef03', 'OR_20160727102439', '2016-07-27 10:24:39', '2016-07-27 10:24:39', '9bd9768ff9404861a5658db901457a69', '123', '0', '1', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, '123', '123', '123', '1', '123', '123', null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('1706c24bcabf4696b2a9a13decbe7ec7', 'OR_20160712220759', '2016-07-12 22:08:22', '2016-07-12 22:08:22', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '123123', '123123', null, '1232123', null, null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('18ff348d8cc14ab8b3c534fe715f8d36', 'OR_20160819200348', '2016-08-19 20:03:48', '2016-08-19 20:03:48', '1F69B3D54C2F95A014EA3CC131A34D5B', 'moto animation', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, 'moto animation', 'aerstesci87908-446666666666666666', 'stdjyfytfyfjtfygfdfgdgfdfgdgfdgfdg ytk uyggfxvcxbvxv', '5', 'dfghkl;[asdfghjotresz3rw3567890------======87654edttsdfyuhfswadfghkl;[asdfghjotresz3rw3567890------======87654edttsdfyuhfswadfghkl;[asdfghjotresz3rw3567890------======87654edttsdfyuhfswadfghkl;[asdfghjotresz3rw3567890------======87654edttsdfyuhfswadfghkl;[asdfghjotresz3rw3567890------======87654edttsdfyuhfswadfghkl;[asdfghjotresz3rw3567890------======87654edttsdfyuhfswadfghkl;[asdfghjotresz3rw3567890------======87654edttsdfyuhfswadfghkl;[asdfghjotresz3rw3567890------======87654edttsdfyuhfswa', null, null, null, '0', '0', '-1', 'ddf4b46a78d64f68bd7b627972ab6973', '0', '0');
INSERT INTO `order_task` VALUES ('21b4eb5d6dc54f8d9a70da0ffb1a0bbc', 'OR_20160726220845', '2016-07-26 22:08:45', '2016-07-26 22:08:45', '1F69B3D54C2F95A014EA3CC131A34D5B', '1231231', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '1231231', '12312', '23123', null, null, null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('22ba26650b8f4b51954754c68dcd35bf', 'OR_20160727004440', '2016-07-27 00:44:40', '2016-07-27 00:44:40', '9bd9768ff9404861a5658db901457a69', '123', '0', '1', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, '123', '123', '123', null, '123', '1', null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('28206489feaa4370b0154f7e41034b55', 'OR_20160712215344', '2016-07-12 21:53:44', '2016-07-12 21:53:44', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', null, null, null, null, null, null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('283bb89dc1e24c5c9b5aa38b16d70925', 'OR_20160820221310', '2016-08-20 22:13:10', '2016-08-20 22:13:10', '1F69B3D54C2F95A014EA3CC131A34D5B', '0819测试。', '2', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', null, null, null, null, null, '0819测试。', '0819测试。', '0819测试。', '3', '0819测试，暂时没有任务细节。', null, 'b950af07b70d48719fe0061748654277', null, '0', '0', '-1', '', '0', '0');
INSERT INTO `order_task` VALUES ('2cb842d49c2d483a974b39b716d9bc9d', 'OR_20160728220935', '2016-07-28 22:09:35', '2016-07-28 22:09:35', '9bd9768ff9404861a5658db901457a69', '123', '0', '1', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, '123', '12312', '123', null, null, '3123', null, null, '0', '0', 'bac1dca984774309bdf03b0895af7117', '65284a9d73004b938ad1ddba588b29d6', '0', '0');
INSERT INTO `order_task` VALUES ('2f7ec4839b2c42b99c42c84f91b86930', 'OR_20160712230149', '2016-07-12 23:01:49', '2016-07-12 23:01:49', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('300af2819c3749328f5a91a5f74b1708', 'OR_20160821001939', '2016-08-21 00:19:39', '2016-08-21 00:19:39', '1F69B3D54C2F95A014EA3CC131A34D5B', '0819_01', '1', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '0819_01', '0819_01', '0819_01', null, null, null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('30ccb85e556c403ebe0c6c724f0ea441', 'OR_20160712223825', '2016-07-12 22:38:28', '2016-07-12 22:38:28', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('33b1b8652a5f4ab896c48f279e8ce7d9', 'OR_20160726220333', '2016-07-26 22:03:33', '2016-07-26 22:03:33', '1F69B3D54C2F95A014EA3CC131A34D5B', '1231231', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '1231231', '12312', '23123', null, null, null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('361c22e1c27b4997a821548cb767abec', 'OR_20160718234117', '2016-07-18 23:41:17', '2016-07-18 23:41:17', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '123', '123', null, '123', '1235', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('3d39fcab6d744b58876dd84e9ced8e68', 'OR_20160712211513', '2016-07-12 21:15:13', '2016-07-12 21:15:13', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '123123', '123123', null, null, null, null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('44159d122cf5494b98137425e16012e5', 'OR_20160824013240', '2016-08-24 01:32:40', '2016-08-24 01:32:40', '1F69B3D54C2F95A014EA3CC131A34D5B', '1', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '1', '1', '1', '1', '1', null, null, null, '0', '0', '-1', 'ce239050a51048739630f702a8a85ce9', '0', '0');
INSERT INTO `order_task` VALUES ('48c7391a0b3a405fbe21bee22d235f92', 'OR_20160914000003', '2016-09-14 00:00:03', '2016-09-14 00:00:03', '1F69B3D54C2F95A014EA3CC131A34D5B', '', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '', '', '1', '', null, null, null, '0', '0', '-1', '', '0', '0');
INSERT INTO `order_task` VALUES ('499e5476ff9e45e6a70067b22e384aa7', 'OR_20160726220304', '2016-07-26 22:03:04', '2016-07-26 22:03:04', '1F69B3D54C2F95A014EA3CC131A34D5B', '1231231', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '1231231', '12312', '23123', null, null, null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('4ca850fae94240929e2237ac6d80cf1f', 'OR_20160823215723', '2016-08-23 21:57:23', '2016-08-23 21:57:23', '1F69B3D54C2F95A014EA3CC131A34D5B', '', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '', '', '1', '', null, null, null, '0', '0', '-1', '', '0', '0');
INSERT INTO `order_task` VALUES ('4cd614b1b467445ca0dd8f435cc74af6', 'OR_20160726220503', '2016-07-26 22:05:03', '2016-07-26 22:05:03', '1F69B3D54C2F95A014EA3CC131A34D5B', '1231231', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '1231231', '12312', '23123', null, null, null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('4dbc7fb8f6ca444fbada5f748b1a2f50', 'OR_20160820234948', '2016-08-20 23:49:48', '2016-08-20 23:49:48', '1F69B3D54C2F95A014EA3CC131A34D5B', '之前任务已完成。', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '之前任务已完成。', '之前任务已完成。', '之前任务已完成。', null, null, '100', null, null, '0', '0', '283bb89dc1e24c5c9b5aa38b16d70925', '', '0', '100');
INSERT INTO `order_task` VALUES ('4e2a3dadadff48d48978191e08ff319b', 'OR_20160712230050', '2016-07-12 23:00:50', '2016-07-12 23:00:50', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('50b10c3e2dc349638849facceac97c0a', 'OR_20160914231418', '2016-09-14 23:14:18', '2016-09-14 23:14:18', '1F69B3D54C2F95A014EA3CC131A34D5B', '', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '', null, '1', '', null, null, null, '0', '0', '-1', '', '0', '0');
INSERT INTO `order_task` VALUES ('53a5cbf347d942d89a9470642cd3e6cb', 'OR_20160821202036', '2016-08-21 20:20:36', '2016-08-21 20:20:36', '1F69B3D54C2F95A014EA3CC131A34D5B', 'zi renwu', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, 'zi renwu', 'zi renwu', 'zi renwu', null, null, '100', null, null, '0', '0', '703a44705f3f4f2ba9c355419266c6af', '', '0', '10');
INSERT INTO `order_task` VALUES ('54ae26c0e08945e99fbf2a69428276b7', 'OR_20161011232255', '2016-10-11 23:22:55', '2016-10-11 23:22:55', '1F69B3D54C2F95A014EA3CC131A34D5B', '123', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '12312', null, null, null, '123123', null, null, '0', '0', 'ecb148784bd84faa861258fb7b33395e', '92d1a41a9d534f8b9e8abb54cdf7975f', '0', '123123');
INSERT INTO `order_task` VALUES ('55dcc5fd7a50490ab3b7829306f24910', 'OR_20160808230049', '2016-08-08 23:00:49', '2016-08-08 23:00:49', '1F69B3D54C2F95A014EA3CC131A34D5B', '0808测试项目。', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '0808测试项目。', '0808测试项目。', '0808测试项目。', null, null, null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('55df36fdc80a476fb67cc45a22d3c2a0', 'OR_20160810185852', '2016-08-10 18:58:52', '2016-08-10 18:58:52', '1F69B3D54C2F95A014EA3CC131A34D5B', '徐涛test1', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '徐涛test1', '徐涛test1任务描述', '徐涛test1任务简介', '1', '徐涛test1接任务要求\n\n', '123', null, null, '0', '0', '-1', '1b42ce644c39426f8626a8a8f1fccae5', '0', '0');
INSERT INTO `order_task` VALUES ('5c16b61d59dc49c68334bd18934e3346', 'OR_20160712214619', '2016-07-12 21:46:19', '2016-07-12 21:46:19', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', null, null, null, null, null, null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('5d2b008bc0cf467b857bc31eca502373', 'OR_20160712224619', '2016-07-12 22:46:19', '2016-07-12 22:46:19', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('5d72b27560fd40d2a5502d31e90b54d1', 'OR_20160731111755', '2016-07-31 11:17:55', '2016-07-31 11:17:55', '9bd9768ff9404861a5658db901457a69', 'icon上传3', '1', '0', '9bd9768ff9404861a5658db901457a69', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, 'icon上传3', 'icon上传', 'icon上传2', '1', 'icon上传', '12314', '613fe27e5a5742328803fc75eab9fdcf', null, '0', '-1', '-1', '409c636360e848939ce977afa803ea29', '0', '0');
INSERT INTO `order_task` VALUES ('5ef4139c29a640f4a8719e62670bbf17', 'OR_20160819200504', '2016-08-19 20:05:04', '2016-08-19 20:05:04', '1F69B3D54C2F95A014EA3CC131A34D5B', '124335', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '124335', 'fgdfg', 'dfgjhgkjhkjhkj', null, null, '125', null, null, '0', '0', 'a60ef33ceace4c13bc5f016b40e2d863', '35b6f0424a84454994db5f2ddc1bd726', '0', '125');
INSERT INTO `order_task` VALUES ('6296c73410fb4b14a15d97691dbc61ea', 'OR_20160823215845', '2016-08-23 21:58:45', '2016-08-23 21:58:45', '1F69B3D54C2F95A014EA3CC131A34D5B', '', '1', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '', '', '1', '', null, null, null, '0', '0', '-1', '9f60bea013ed4e56a5bdd276e59c0301', '0', '0');
INSERT INTO `order_task` VALUES ('63a4cbb895fe4d2593bc2e4a6664b9fb', 'OR_20160731131216', '2016-07-31 13:12:16', '2016-07-31 13:12:16', '1F69B3D54C2F95A014EA3CC131A34D5B', '测试任务类型', '1', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '测试任务类型', '测试任务类型', '测试任务类型', '3', '测试任务类型', '123', null, null, '0', '0', '-1', '17b76cf425e245f591a4e6c7bc7d1ec9', '0', '0');
INSERT INTO `order_task` VALUES ('63b85b5167214cf2ac0e25943062767f', 'OR_20160705234141', '2016-07-05 23:41:41', '2016-07-05 23:41:41', null, '项目名称', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '项目名称', '项目介绍', '项目简介', null, null, null, null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('64cdae31fff84e028e1a7c333a10fa9a', 'OR_20160718233911', '2016-07-18 23:39:11', '2016-07-18 23:39:11', null, '13', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '13', '123', '123', null, '123', '123124125', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('65f16d5494b840fba71df9072e524e36', 'OR_20160725151933', '2016-07-25 15:19:33', '2016-07-25 15:19:33', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '123', '123412125', null, '123', '123214', null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('664f8e9c8b20489488fe6bf69188be01', 'OR_20160810224910', '2016-08-10 22:49:10', '2016-08-10 22:49:10', '1F69B3D54C2F95A014EA3CC131A34D5B', '徐涛test2', '1', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', '11c9570194824c8ea0698b4df490b74e', null, null, null, null, null, '徐涛test2', '任务简介任务描述', '徐涛test2任务简介', '1', '徐涛test2', '123', '3a10b014f056453daf0ac07f665db04b', null, '0', '0', '-1', '4906d3cdc7194c42995e25b0bf92009f', '0', '0');
INSERT INTO `order_task` VALUES ('680b97d73250420b8e46b3afc50dc929', 'OR_20160726215733', '2016-07-26 21:57:33', '2016-07-26 21:57:33', '1F69B3D54C2F95A014EA3CC131A34D5B', '123124', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123124', '123123', '1234123', null, null, null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('6822c30d50aa419881d738cdb49c554f', 'OR_20160726215724', '2016-07-26 21:57:24', '2016-07-26 21:57:24', '1F69B3D54C2F95A014EA3CC131A34D5B', '123124', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123124', '123123', '1234123', null, null, null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('6adc27d916f84a8b8462332b87de0664', 'OR_20160712224400', '2016-07-12 22:44:00', '2016-07-12 22:44:00', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('6ef20b74ab274e049d13c39757252a3a', 'OR_20160824211439', '2016-08-24 21:14:39', '2016-08-24 21:14:39', '1F69B3D54C2F95A014EA3CC131A34D5B', '8-24', '1', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '8-24', '824824824824824824', '824824824824824824824824824', '1', '824824824824824824824824824', null, null, null, '0', '0', '-1', 'fca017fd016247198943437542e59142', '0', '0');
INSERT INTO `order_task` VALUES ('703a44705f3f4f2ba9c355419266c6af', 'OR_20160821195854', '2016-08-21 19:58:54', '2016-08-21 19:58:54', '1F69B3D54C2F95A014EA3CC131A34D5B', '8021', '2', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', null, null, null, null, null, '8021', '8021', '8021', '3', '8021', null, 'c824cc66cd8c42368f35cf078d09b13b', null, '0', '0', '-1', '', '0', '0');
INSERT INTO `order_task` VALUES ('7213ba3b49bf4ca5998815dc1e79d9e2', 'OR_20160725152704', '2016-07-25 15:27:04', '2016-07-25 15:27:04', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '124', '21415', null, '123', '1231', null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('80aadfb678cc401e836f14b7d66cbb27', 'OR_20160712223742', '2016-07-12 22:37:42', '2016-07-12 22:37:42', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', '0f2945440d2f4e06a1513dff76d69002', '0', '0');
INSERT INTO `order_task` VALUES ('8eff2f884b074727808307174239bd19', 'OR_20160718233304', '2016-07-18 23:33:04', '2016-07-18 23:33:04', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '124', '121', null, '1231', '2312', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('94ad20b0262a4efd8d5fe02887331340', 'OR_20160718233851', '2016-07-18 23:38:51', '2016-07-18 23:38:51', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '123', '123', null, '2312', '3123', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('98144c8919f847d5adb848c504572c10', 'OR_20160731123353', '2016-07-31 12:33:53', '2016-07-31 12:33:53', '9bd9768ff9404861a5658db901457a69', '子任务1', '0', '0', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, '子任务1', '子任务1', '子任务1', null, null, '123', null, null, '1', '1', '5d72b27560fd40d2a5502d31e90b54d1', '45d3ce2833a64b2db244c9102eddd06f', '0', '0');
INSERT INTO `order_task` VALUES ('98647034cc394e1db9206786d51fbc27', 'OR_20160731120633', '2016-07-31 12:06:33', '2016-07-31 12:06:33', '9bd9768ff9404861a5658db901457a69', 'icon1子任务', '0', '0', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, 'icon1子任务', 'icon1子任务', 'icon1子任务', null, null, '123', null, null, '0', '0', '05ed56e3420845ccb9278719b04506f9', '432029ebbd1d421693a9e755eede38f1', '0', '0');
INSERT INTO `order_task` VALUES ('9aa43c8daebc4b68a65acd82618e20a9', 'OR_20160705233550', '2016-07-05 23:35:50', null, null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', null, null, null, null, null, null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('a096e2d819a546a68f93da5e98f20379', 'OR_20160718234000', '2016-07-18 23:40:00', '2016-07-18 23:40:00', null, '有附件', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '13', '123', '123', null, '123', '123124125', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('a25bbbdf952d410d889c7ee049f4796b', 'OR_20160712221021', '2016-07-12 22:10:31', '2016-07-12 22:10:31', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '123123', '123123', null, '1232123', '1231', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('a340e133f0fe4ddda160a17de622bd3f', 'OR_20160727004325', '2016-07-27 00:43:25', '2016-07-27 00:43:25', '9bd9768ff9404861a5658db901457a69', 'app12', '0', '0', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, 'app12', 'app1', 'app1', null, 'app1', '123', null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('a4c59d762a24491288d49a04d79e5914', 'OR_20160810230445', '2016-08-10 23:04:45', '2016-08-10 23:04:45', '1F69B3D54C2F95A014EA3CC131A34D5B', '子任务1', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '子任务1', '子任务1', '子任务1', null, null, '12', null, null, '0', '0', '664f8e9c8b20489488fe6bf69188be01', '2e592ec7412843a5ab3fc9d06d4da83d', '0', '0');
INSERT INTO `order_task` VALUES ('a60ef33ceace4c13bc5f016b40e2d863', 'OR_20160810224544', '2016-08-10 22:45:44', '2016-08-10 22:45:44', '1F69B3D54C2F95A014EA3CC131A34D5B', '徐涛test_1', '1', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '徐涛test_1', '徐涛test_1任务描述', '徐涛test_1任务简介', '1', '徐涛test_1接任务要求', '123', null, null, '0', '0', '-1', '7d1e90e413144b459a8dc7e30f7179b7', '0', '0');
INSERT INTO `order_task` VALUES ('a76f0f80a90f460db37534efef8a843b', 'OR_20160726220126', '2016-07-26 22:01:26', '2016-07-26 22:01:26', '1F69B3D54C2F95A014EA3CC131A34D5B', '1231231', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '1231231', '12312', '23123', null, null, null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('a7a71e6a4eca4ff2866f6ac8e8f4acbf', 'OR_20160726221017', '2016-07-26 22:10:17', '2016-07-26 22:10:17', '1F69B3D54C2F95A014EA3CC131A34D5B', null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', null, null, null, null, null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('a835a8ce483d4739b4982eba0e3c6b3c', 'OR_20160826211500', '2016-08-26 21:15:00', '2016-08-26 21:15:00', '1F69B3D54C2F95A014EA3CC131A34D5B', '1', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '1', '1111111111', '1111111111', null, null, '1011', null, null, '0', '0', '0d62a88e74fa4f45bb153d94fbad4a88', '727d239909904065a9faada112902cb9', '0', '10');
INSERT INTO `order_task` VALUES ('a9908b3c3f594a448b8255feff40832e', 'OR_20160712224523', '2016-07-12 22:45:23', '2016-07-12 22:45:23', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('ae8ba80d625f4b14906f6c2412cf0b53', 'OR_20160810230510', '2016-08-10 23:05:10', '2016-08-10 23:05:10', '1F69B3D54C2F95A014EA3CC131A34D5B', '子任务3', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '子任务3', '子任务3', '子任务3', null, null, '3', null, null, '0', '0', '664f8e9c8b20489488fe6bf69188be01', 'a5437891c6744b87b63881aeab07b529', '0', '0');
INSERT INTO `order_task` VALUES ('b0373c90420a4607986665303c4d4588', 'OR_20160712211716', '2016-07-12 21:17:16', '2016-07-12 21:17:16', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '123123', '123123', null, null, null, null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('b11ffe643e33445890b2fecf503049c7', 'OR_20160726215610', '2016-07-26 21:56:10', '2016-07-26 21:56:10', '1F69B3D54C2F95A014EA3CC131A34D5B', 'asd23123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, 'asd23123', '123asd123', '123asd123', null, null, null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('b5ae088366a140a4baaed1c80a48eba0', 'OR_20160712220640', '2016-07-12 22:06:40', '2016-07-12 22:06:40', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '123123', '123123', null, '1232123', null, null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('b7d4704ad81e49758a829f34cb5b48eb', 'OR_20160731120546', '2016-07-31 12:05:46', '2016-07-31 12:05:46', '9bd9768ff9404861a5658db901457a69', '123', '0', '1', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, '123', '123', '123', null, null, '123', null, null, '0', '0', '05ed56e3420845ccb9278719b04506f9', '9f2a954ec2a94867aa7a04822f96bcc9', '0', '0');
INSERT INTO `order_task` VALUES ('bac1dca984774309bdf03b0895af7117', 'OR_20160727102825', '2016-07-27 10:28:25', '2016-07-27 10:28:25', '9bd9768ff9404861a5658db901457a69', 'icon上传', '0', '0', '9bd9768ff9404861a5658db901457a69', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, 'icon上传', 'icon上传', 'icon上传', '1', 'icon上传', '12314', '9b74464de6974b5abe25a8fbd24c7e0b', null, '0', '1', '-1', '5d93e117f43440fd827df6a0ff7d0df2', '0', '0');
INSERT INTO `order_task` VALUES ('bb607ea310da49db92eb6c27dce7318b', 'OR_20160821210112', '2016-08-21 21:01:12', '2016-08-21 21:01:12', '1F69B3D54C2F95A014EA3CC131A34D5B', 'zirenwu', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, 'zirenwu', 'zirenwu', 'zirenwu', null, null, '100', null, null, '0', '0', '703a44705f3f4f2ba9c355419266c6af', '', '0', '100');
INSERT INTO `order_task` VALUES ('be68c316767c4d1eb23d78539123630c', 'OR_20160807164850', '2016-08-07 16:48:50', '2016-08-07 16:48:50', '1F69B3D54C2F95A014EA3CC131A34D5B', '测试任务确认流程1', '1', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, '测试任务确认流程1', '测试任务确认任务描述', '测试任务确认流程1任务简介', '1', '测试任务确认接任务要求', '124', '26f5ec13c1414821a96215d882fd2323', null, '0', '1', '-1', 'cf2366014eb34908b50710a8389fa130', '0', '0');
INSERT INTO `order_task` VALUES ('c065bbd58f174cf589a072c4f5d714eb', 'OR_20160726221159', '2016-07-26 22:11:59', '2016-07-26 22:11:59', '1F69B3D54C2F95A014EA3CC131A34D5B', '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1231', '123', null, '23123', null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('c146f3d713d5438b8b6675d385d1bb34', 'OR_20160822232101', '2016-08-22 23:21:01', '2016-08-22 23:21:01', '1F69B3D54C2F95A014EA3CC131A34D5B', 'order123', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, 'order123', 'order123', 'order123', '1', 'order123', null, null, null, '0', '0', '-1', '', '0', '0');
INSERT INTO `order_task` VALUES ('c399e71c769144f087d320cab1885a88', 'OR_20160712220559', '2016-07-12 22:05:59', '2016-07-12 22:05:59', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '123123', '123123', null, null, null, null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('c648a21e97ce401381c3fd26a145d028', 'OR_20160820225808', '2016-08-20 22:58:08', '2016-08-20 22:58:08', '1F69B3D54C2F95A014EA3CC131A34D5B', '0819子任务测试。', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '0819子任务测试。', '0819子任务测试。', '0819子任务测试。', null, null, '10', null, null, '0', '0', '283bb89dc1e24c5c9b5aa38b16d70925', '', '0', '1000');
INSERT INTO `order_task` VALUES ('c76770b3e8e6476287e59aedcaea7694', 'OR_20160808230057', '2016-08-08 23:00:57', '2016-08-08 23:00:57', '1F69B3D54C2F95A014EA3CC131A34D5B', '0808测试项目。', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '0808测试项目。', '0808测试项目。', '0808测试项目。', '1', '0808测试项目。', '1', null, null, '0', '0', '-1', 'f4b7ebfb4c3346609828576fe5ea6454', '0', '0');
INSERT INTO `order_task` VALUES ('c990251059fc4c27841795a3f0f3e9b6', 'OR_20160712224303', '2016-07-12 22:43:03', '2016-07-12 22:43:03', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('c9f5bede11334ffda18f11feee1e540b', 'OR_20160718233303', '2016-07-18 23:33:03', '2016-07-18 23:33:03', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '124', '121', null, '1231', '2312', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('ca53a9f0bdcd4cc3905a236ac2dc60da', 'OR_20160810230459', '2016-08-10 23:04:59', '2016-08-10 23:04:59', '1F69B3D54C2F95A014EA3CC131A34D5B', '子任务2', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '子任务2', '子任务2', '子任务2', null, null, '12', null, null, '0', '0', '664f8e9c8b20489488fe6bf69188be01', '8a66893a8d074120927ed4223456d399', '0', '0');
INSERT INTO `order_task` VALUES ('cc40e42da4ca4d9ab564643bd67b52d4', 'OR_20160807165120', '2016-08-07 16:51:20', '2016-08-07 16:51:20', '1F69B3D54C2F95A014EA3CC131A34D5B', '子任务1', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '子任务1', '子任务1任务描述', '子任务1任务简介', null, null, '12', null, null, '0', '0', 'be68c316767c4d1eb23d78539123630c', '5eb32b950764496b915c13cd10c06c44', '0', '0');
INSERT INTO `order_task` VALUES ('cfb9fedb063c472a8adb9ff2a369abca', 'OR_20160821001950', '2016-08-21 00:19:50', '2016-08-21 00:19:50', '1F69B3D54C2F95A014EA3CC131A34D5B', '0819_01', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '0819_01', '0819_01', '0819_01', null, null, '3', null, null, '0', '0', 'dd37ed11ce53465ba4bcfa29e9defd28', '', '0', '1');
INSERT INTO `order_task` VALUES ('d65fd59dff094e7e9ae598d669ad6166', 'OR_20160807232225', '2016-08-07 23:22:25', '2016-08-07 23:22:25', '1F69B3D54C2F95A014EA3CC131A34D5B', '子任务2', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '子任务2', '子任务2任务描述', '子任务2任务简介', null, null, '13', null, null, '0', '0', 'be68c316767c4d1eb23d78539123630c', '8997dc5b6d8f45c1b2e82371a9d49e70', '0', '0');
INSERT INTO `order_task` VALUES ('d9aae5d24128490599b562b394bf07ff', 'OR_20160727004327', '2016-07-27 00:43:27', '2016-07-27 00:43:27', '9bd9768ff9404861a5658db901457a69', 'app1', '0', '0', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, 'app1', 'app1', 'app1', null, 'app1', '123', null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('da3358a3560e4194a7776575c67b245e', 'OR_20160821175853', '2016-08-21 17:58:53', '2016-08-21 17:58:53', '1F69B3D54C2F95A014EA3CC131A34D5B', '8-21测试', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '8-21测试', '随便描述随便描述描述描述', '灵然创智公司发展图形化界面', '1', '如海报所示做出类似的', null, null, null, '0', '0', '-1', '565161d4787340a2abcfead78deb2705', '0', '0');
INSERT INTO `order_task` VALUES ('dd37ed11ce53465ba4bcfa29e9defd28', 'OR_20160821000228', '2016-08-21 00:02:28', '2016-08-21 00:02:28', '1F69B3D54C2F95A014EA3CC131A34D5B', '0819_1', '2', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', null, null, null, null, null, '0819_1', '0819_1', '0819_1', '6', '0819_1', null, '1eaaa25e3fae4eceb878d5afdaf5b851', null, '0', '0', '-1', '', '0', '0');
INSERT INTO `order_task` VALUES ('de58d598302849de9c97cd7793700b94', 'OR_20160726215543', '2016-07-26 21:55:43', '2016-07-26 21:55:43', '1F69B3D54C2F95A014EA3CC131A34D5B', 'asd23123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, 'asd23123', '123asd123', '123asd123', null, null, null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('e738ea08d1e5412c994ebf56957ef2fe', 'OR_20160712224413', '2016-07-12 22:44:13', '2016-07-12 22:44:13', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('e796f94aa33a462d84fd9409f85fc5e4', 'OR_20160821202116', '2016-08-21 20:21:16', '2016-08-21 20:21:16', '1F69B3D54C2F95A014EA3CC131A34D5B', 'zi renwu', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, 'zi renwu', 'zi renwu', 'zi renwu', null, null, '1000', null, null, '0', '0', '703a44705f3f4f2ba9c355419266c6af', '', '0', '100');
INSERT INTO `order_task` VALUES ('e85212dbc3cf4030b570a05b8bb2ff21', 'OR_20160712223527', '2016-07-12 22:35:31', '2016-07-12 22:35:31', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('ea5f52faa2df447d9c45e8a94d38aa6b', 'OR_20160727004542', '2016-07-27 00:45:42', '2016-07-27 00:45:42', '9bd9768ff9404861a5658db901457a69', 'app2', '0', '0', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, 'app2', 'app2', 'app2', '1', 'app2', '123', null, null, '0', '0', '-1', '0f2945440d2f4e06a1513dff76d69002', '0', '0');
INSERT INTO `order_task` VALUES ('eba96965d6e8483d8a15abc159ba102c', 'OR_20160808230219', '2016-08-08 23:02:19', '2016-08-08 23:02:19', '1F69B3D54C2F95A014EA3CC131A34D5B', '0808测试项目。', '1', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '0808测试项目。', '0808测试项目。', '0808测试项目。', '2', '0808测试项目。', '11111', null, null, '0', '0', '-1', '', '0', '0');
INSERT INTO `order_task` VALUES ('ecb148784bd84faa861258fb7b33395e', 'OR_20161011220232', '2016-10-11 22:02:32', '2016-10-11 22:02:32', '1F69B3D54C2F95A014EA3CC131A34D5B', '测试任务', '1', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '测试任务', '测试任务的简介或者描述', null, '1', '接任务要求', null, null, null, '0', '0', '-1', '54b756ed5eaa4e1cbbe43bbd0f22df6a', '0', '0');
INSERT INTO `order_task` VALUES ('f12702817076451b8cd2f9b11e8f6582', 'OR_20160820225718', '2016-08-20 22:57:18', '2016-08-20 22:57:18', '1F69B3D54C2F95A014EA3CC131A34D5B', '0819子任务测试。', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '0819子任务测试。', '0819子任务测试。', '0819子任务测试。', null, null, '10', null, null, '0', '0', '283bb89dc1e24c5c9b5aa38b16d70925', '', '0', '1000');
INSERT INTO `order_task` VALUES ('f447d04671284aa1a839e598956a7909', 'OR_20160726215639', '2016-07-26 21:56:39', '2016-07-26 21:56:39', '1F69B3D54C2F95A014EA3CC131A34D5B', 'asd23123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, 'asd23123', '123asd123', '123asd123', null, null, null, null, null, '0', '0', '-1', null, '0', '0');
INSERT INTO `order_task` VALUES ('f93f1e20e7b64bbeb8f3f9aed9626cf2', 'OR_20160712223424', '2016-07-12 22:34:24', '2016-07-12 22:34:24', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0', '0');

-- ----------------------------
-- Table structure for order_task_flow
-- ----------------------------
DROP TABLE IF EXISTS `order_task_flow`;
CREATE TABLE `order_task_flow` (
  `id` varchar(32) NOT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `flow_id` varchar(32) DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_task_flow
-- ----------------------------

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
INSERT INTO `order_type` VALUES ('1', '平面设计', null, '0', null);
INSERT INTO `order_type` VALUES ('2', '网站设计', null, '0', null);
INSERT INTO `order_type` VALUES ('3', 'app设计', null, '0', null);
INSERT INTO `order_type` VALUES ('4', '二维动画', null, '0', null);
INSERT INTO `order_type` VALUES ('5', '三维动画', null, '0', null);
INSERT INTO `order_type` VALUES ('6', '多媒体', null, '0', null);
INSERT INTO `order_type` VALUES ('7', '影视特效', null, '0', null);
INSERT INTO `order_type` VALUES ('8', '影视后期', null, '0', null);

-- ----------------------------
-- Table structure for sys_account_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_detail`;
CREATE TABLE `sys_account_detail` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT '0',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `receiver_id` varchar(32) DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `pay_type` tinyint(4) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `account` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_account_detail
-- ----------------------------
INSERT INTO `sys_account_detail` VALUES ('5a44417cd97644568526bb4a0c5433d4', null, '123124', '0', '2016-08-30 00:54:23', '1F69B3D54C2F95A014EA3CC131A34D5B', '1', '2', '1', null, '4123');

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
-- Table structure for sys_confirm
-- ----------------------------
DROP TABLE IF EXISTS `sys_confirm`;
CREATE TABLE `sys_confirm` (
  `id` varchar(32) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  `one_partner_id` varchar(32) NOT NULL,
  `sec_partner_id` varchar(32) NOT NULL,
  `del_flag` tinyint(4) DEFAULT '0',
  `one_partner_status` tinyint(4) DEFAULT NULL,
  `sec_partner_status` tinyint(4) DEFAULT NULL,
  `on_partner_remark` varchar(255) DEFAULT NULL,
  `sec_partner_remark` varchar(255) DEFAULT NULL,
  `one_partner_date` datetime DEFAULT NULL,
  `sec_partner_date` datetime DEFAULT NULL,
  `is_current` tinyint(1) DEFAULT '0' COMMENT '是否当前生效',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `taker` tinyint(1) DEFAULT '0' COMMENT '发起方是1手或者2手',
  `order_status` tinyint(2) DEFAULT '0' COMMENT '任务状态',
  `result` tinyint(2) DEFAULT '0' COMMENT '结果',
  `money` double(255,0) DEFAULT '0' COMMENT '金额',
  `type` tinyint(2) DEFAULT NULL COMMENT '确认的类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_confirm
-- ----------------------------
INSERT INTO `sys_confirm` VALUES ('0135a4f8a1924376ae83774cef78b256', '664f8e9c8b20489488fe6bf69188be01', '1F69B3D54C2F95A014EA3CC131A34D5B', '11c9570194824c8ea0698b4df490b74e', '0', '1', '1', '同意', '原因', '2016-08-10 22:56:03', '2016-08-10 22:54:28', '1', '2016-08-10 22:54:28', '0', '1', '1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('067c68c75fc648b385b2d8f0d3ada027', 'c648a21e97ce401381c3fd26a145d028', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', null, '1', null, '已经到位。', null, '2016-08-20 23:41:27', '1', '2016-08-20 23:41:27', '0', '0', '-2', '0', '4');
INSERT INTO `sys_confirm` VALUES ('06e1248eb13540f09d5376e5af5993ec', 'a60ef33ceace4c13bc5f016b40e2d863', '1F69B3D54C2F95A014EA3CC131A34D5B', '7c755b66c53b46c294356f4cbdf62edc', '0', null, '1', null, '查看', null, '2016-08-20 23:59:57', '1', '2016-08-20 23:59:57', '0', '1', '-2', '0', '1');
INSERT INTO `sys_confirm` VALUES ('095d16ace4d843788e868baa99ce8718', '0846cf3615514b93bc7ced0c1cd0a129', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', null, '1', null, '第三次确认收钱？？？？？？？', null, '2016-08-20 23:47:54', '1', '2016-08-20 23:47:54', '0', '0', '-2', '0', '4');
INSERT INTO `sys_confirm` VALUES ('12983edb41034813940c4ff636d24070', 'c648a21e97ce401381c3fd26a145d028', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '可以付款了。', '制作完。', '2016-08-20 23:20:43', '2016-08-20 23:16:06', '1', '2016-08-20 23:16:06', '0', '0', '1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('148872bd2fc148af9ea48aa57ece5a8d', '0d62a88e74fa4f45bb153d94fbad4a88', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '好好好', 'nhgcnc', '2016-09-07 10:42:53', '2016-09-02 19:45:52', '1', '2016-09-02 19:45:52', '0', '1', '1', '0', '2');
INSERT INTO `sys_confirm` VALUES ('17e4939190954667b282c8ae680ba3d0', '703a44705f3f4f2ba9c355419266c6af', '1F69B3D54C2F95A014EA3CC131A34D5B', '7c755b66c53b46c294356f4cbdf62edc', '0', null, '1', null, 'wo ye xiang jie dan', null, '2016-08-21 20:27:29', '1', '2016-08-21 20:27:29', '0', '1', '-2', '1', '2');
INSERT INTO `sys_confirm` VALUES ('19cdbc06a8ad4b19ba10d846eee51526', '0846cf3615514b93bc7ced0c1cd0a129', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', null, '1', null, '又一次确认两次收钱？？？ ', null, '2016-08-20 23:47:30', '1', '2016-08-20 23:47:30', '0', '0', '-2', '0', '4');
INSERT INTO `sys_confirm` VALUES ('1ca1cf505eef49bca28f5f2858edbeca', '53a5cbf347d942d89a9470642cd3e6cb', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '-1', '1', 'budui gai', 'zheg e ye zuowanle ', '2016-08-21 20:50:16', '2016-08-21 20:49:46', '0', '2016-08-21 20:49:46', '0', '0', '-1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('2933469df9264619b711e5f001228d05', '6296c73410fb4b14a15d97691dbc61ea', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', null, '1', null, '啦啦啦啦啦啦', null, '2016-08-26 19:09:51', '1', '2016-08-26 19:09:51', '0', '1', '-2', '1000', '2');
INSERT INTO `sys_confirm` VALUES ('2c2e80775731461c9d87b0f44fffa542', '0d62a88e74fa4f45bb153d94fbad4a88', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '-1', '1', 'srgshdyjfghj', '而饿死人', '2016-09-02 19:44:36', '2016-09-02 19:39:25', '0', '2016-09-02 19:39:25', '0', '1', '-1', '0', '2');
INSERT INTO `sys_confirm` VALUES ('2f421122dc6a4a8a94570e7a362baf98', 'be68c316767c4d1eb23d78539123630c', '1F69B3D54C2F95A014EA3CC131A34D5B', '6a092c67f5674730ab1301501b30e8f1', '0', '-1', '1', '不能看', '申请查看test4', '2016-08-07 20:19:47', '2016-08-07 20:17:27', '0', '2016-08-07 20:17:27', '0', '1', '-1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('36b222c88d75425a85921351e12debfc', 'e796f94aa33a462d84fd9409f85fc5e4', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', 'zuowanle', 'zuowanle', '2016-08-21 20:55:38', '2016-08-21 20:55:15', '1', '2016-08-21 20:55:15', '0', '0', '1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('3703bc5d34bd4928ab536a4368541865', 'ecb148784bd84faa861258fb7b33395e', '1F69B3D54C2F95A014EA3CC131A34D5B', '9bd9768ff9404861a5658db901457a69', '0', '1', '1', '123123', '123123', '2016-10-12 00:24:43', '2016-10-11 23:33:38', '1', '2016-10-11 23:33:38', '0', '1', '1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('3712eba4132044729345318f9cef8b5e', '703a44705f3f4f2ba9c355419266c6af', '1F69B3D54C2F95A014EA3CC131A34D5B', '7c755b66c53b46c294356f4cbdf62edc', '0', '-1', '1', 'butongyi', '我想查看任务.', '2016-08-21 20:15:18', '2016-08-21 20:05:16', '0', '2016-08-21 20:05:16', '0', '1', '-1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('3cad5db75f9944239794b1f7bfa33404', 'cc40e42da4ca4d9ab564643bd67b52d4', '1F69B3D54C2F95A014EA3CC131A34D5B', '9bd9768ff9404861a5658db901457a69', '0', '1', '1', '经检验，已经完成', '我已经完成。', '2016-08-07 23:17:21', '2016-08-07 23:17:05', '1', '2016-08-07 23:17:05', '0', '0', '1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('3cd27cd7d50747c4a3253c5d1b3ba587', 'e796f94aa33a462d84fd9409f85fc5e4', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', 'renke', 'qiandaole ', '2016-08-21 21:03:50', '2016-08-21 20:58:40', '1', '2016-08-21 20:58:40', '0', '0', '1', '0', '4');
INSERT INTO `sys_confirm` VALUES ('3dc7a6b8955b469da96da96d56595b56', '6296c73410fb4b14a15d97691dbc61ea', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '   ', '   ', '2016-08-23 22:35:15', '2016-08-23 22:34:37', '1', '2016-08-23 22:34:37', '0', '1', '1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('3f64ac25ec9040c4ad2ecb26d2a71cd1', '0d62a88e74fa4f45bb153d94fbad4a88', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '-1', '1', 'no', '我想看看啊', '2016-09-02 17:47:42', '2016-09-02 17:44:13', '0', '2016-09-02 17:44:13', '0', '1', '-1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('45eb7cb907874643a504dd2fbdd3a0f4', '703a44705f3f4f2ba9c355419266c6af', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '-1', '1', 'bugeikan', 'i want chakan xiangqing', '2016-08-21 20:07:24', '2016-08-21 20:04:35', '0', '2016-08-21 20:04:35', '0', '1', '-1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('48e396f51b8845a5a433d56628ccae42', 'dd37ed11ce53465ba4bcfa29e9defd28', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '申请 ', '申请 ', '2016-08-21 00:18:46', '2016-08-21 00:18:38', '1', '2016-08-21 00:18:38', '0', '1', '1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('4bafd41e8db44e63990af929101509ea', '664f8e9c8b20489488fe6bf69188be01', '1F69B3D54C2F95A014EA3CC131A34D5B', '7c755b66c53b46c294356f4cbdf62edc', '0', null, '1', null, '查看任务 。', null, '2016-08-20 23:58:58', '1', '2016-08-20 23:58:58', '0', '1', '-2', '0', '1');
INSERT INTO `sys_confirm` VALUES ('4d4a3886112b46d98a773509ba649dcf', '53a5cbf347d942d89a9470642cd3e6cb', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', null, '1', null, 'q', null, '2016-08-21 21:04:15', '1', '2016-08-21 21:04:15', '0', '0', '-2', '0', '4');
INSERT INTO `sys_confirm` VALUES ('4d64d599363b4ba2bb1c624f4c0874fa', '4dbc7fb8f6ca444fbada5f748b1a2f50', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', null, '1', null, 'fsdf', null, '2016-08-20 23:50:36', '1', '2016-08-20 23:50:36', '0', '0', '-2', '0', '4');
INSERT INTO `sys_confirm` VALUES ('5183f955c8aa49b89524ecf796408782', '703a44705f3f4f2ba9c355419266c6af', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', 'ni gui ni jie', 'wo jiu xiang zuo zhege huo', '2016-08-21 20:36:03', '2016-08-21 20:35:28', '1', '2016-08-21 20:35:28', '0', '1', '1', '3424', '2');
INSERT INTO `sys_confirm` VALUES ('522eb268abfb41bbb5a4d7f302cbb4f6', 'be68c316767c4d1eb23d78539123630c', '1F69B3D54C2F95A014EA3CC131A34D5B', '9bd9768ff9404861a5658db901457a69', '0', '1', '1', '同意查看详情', '我想接任务，想看一下任务详情。', '2016-08-07 17:15:30', '2016-08-07 16:54:52', '1', '2016-08-07 16:54:52', '0', '1', '1', null, '1');
INSERT INTO `sys_confirm` VALUES ('54222392ea5c41c88d88eb21886a03e0', '4dbc7fb8f6ca444fbada5f748b1a2f50', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', null, '1', null, '确认收款确实有问题。', null, '2016-08-20 23:50:47', '1', '2016-08-20 23:50:47', '0', '0', '-2', '0', '4');
INSERT INTO `sys_confirm` VALUES ('546ccf8202ed4ae68a09e4b5ad962af9', 'bb607ea310da49db92eb6c27dce7318b', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', ' ', 'tijiao renwu', '2016-08-21 21:05:39', '2016-08-21 21:03:35', '1', '2016-08-21 21:03:35', '0', '0', '1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('5588f908bda14370a81c2ee82be4bde8', 'dd37ed11ce53465ba4bcfa29e9defd28', '1F69B3D54C2F95A014EA3CC131A34D5B', '7c755b66c53b46c294356f4cbdf62edc', '0', null, '1', null, '0819_01', null, '2016-08-21 00:20:12', '1', '2016-08-21 00:20:12', '0', '1', '-2', '1', '2');
INSERT INTO `sys_confirm` VALUES ('6c6175220f19427d886f3ba28a582ed1', 'a60ef33ceace4c13bc5f016b40e2d863', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', null, '1', null, '测试申请察看。', null, '2016-08-20 22:53:17', '1', '2016-08-20 22:53:17', '0', '1', '-2', '0', '1');
INSERT INTO `sys_confirm` VALUES ('711f91a9a6894ee1b10b4767e4d73083', 'd65fd59dff094e7e9ae598d669ad6166', '1F69B3D54C2F95A014EA3CC131A34D5B', '9bd9768ff9404861a5658db901457a69', '0', '1', '1', '确认已经完成', '我完成了 ，请确认', '2016-08-07 23:42:34', '2016-08-07 23:36:24', '1', '2016-08-07 23:36:23', '0', '0', '1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('7404cbf92a5441cc9560d7df24fb804f', '53a5cbf347d942d89a9470642cd3e6cb', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', 'geini qian', 'zuowanle', '2016-08-21 20:55:43', '2016-08-21 20:55:10', '1', '2016-08-21 20:55:10', '0', '0', '1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('79154272b5724ce7bfb98f33f96ee268', 'ca53a9f0bdcd4cc3905a236ac2dc60da', '1F69B3D54C2F95A014EA3CC131A34D5B', '11c9570194824c8ea0698b4df490b74e', '0', '1', '1', '同意', '子任务2', '2016-08-11 00:35:11', '2016-08-11 00:34:45', '1', '2016-08-11 00:34:45', '0', '0', '1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('7cd6491d62d340229c71fa20c1e1c6f6', '283bb89dc1e24c5c9b5aa38b16d70925', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '-1', '1', '暂时没有任务列表，拒绝查看。', '0819任务,test_1用户申请查看。', '2016-08-20 22:33:21', '2016-08-20 22:22:00', '0', '2016-08-20 22:22:00', '0', '1', '-1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('7de6859ae2b04c6c902d2e17fd48a600', 'cc40e42da4ca4d9ab564643bd67b52d4', '1F69B3D54C2F95A014EA3CC131A34D5B', '9bd9768ff9404861a5658db901457a69', '0', '-1', '1', '任务未完成', '我已经完成了 请确认', '2016-08-07 23:16:25', '2016-08-07 22:41:42', '0', '2016-08-07 22:41:42', '0', '0', '-1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('7fe13b1014234ff39728ba201d1ab7bf', 'f12702817076451b8cd2f9b11e8f6582', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '确认付款', '制作完。', '2016-08-20 23:43:26', '2016-08-20 23:19:48', '1', '2016-08-20 23:19:48', '0', '0', '1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('82a00d8547dd4a349e6fc40eb82b94df', 'ecb148784bd84faa861258fb7b33395e', '1F69B3D54C2F95A014EA3CC131A34D5B', '4ee0275972ca4e699570d2f51daa470a', '0', null, '1', null, '我要看', null, '2016-10-17 22:09:07', '1', '2016-10-17 22:09:07', '0', '1', '0', '0', '1');
INSERT INTO `sys_confirm` VALUES ('836581ec65d841b79077a8010c9702e5', 'f12702817076451b8cd2f9b11e8f6582', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '确认付款', '确认款', '2016-08-20 23:46:51', '2016-08-20 23:43:56', '1', '2016-08-20 23:43:56', '0', '0', '1', '0', '4');
INSERT INTO `sys_confirm` VALUES ('841454f1b01347f3912747a0ab8a54cf', '0f1340c745ea455cb195815b552012c4', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', 'womei xiazai    danshi yi dianhua lianxi', 'zuowan le ', '2016-08-21 20:46:36', '2016-08-21 20:42:24', '1', '2016-08-21 20:42:24', '0', '0', '1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('84bcc0511f49400ca734e7d033e4ab6b', 'ae8ba80d625f4b14906f6c2412cf0b53', '1F69B3D54C2F95A014EA3CC131A34D5B', '11c9570194824c8ea0698b4df490b74e', '0', null, '-1', null, '没做完', null, '2016-08-11 00:23:33', '0', '2016-08-11 00:23:33', '0', '0', '-1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('85901630c404400a8f39c660b1411eed', '0f1340c745ea455cb195815b552012c4', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', ' ', 'f', '2016-08-21 21:05:44', '2016-08-21 21:05:26', '1', '2016-08-21 21:05:26', '0', '0', '1', '0', '4');
INSERT INTO `sys_confirm` VALUES ('87ffdfb4566341498b874e7b7a690355', '0d62a88e74fa4f45bb153d94fbad4a88', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '-1', '1', '不行', '啊啊啊啊啊啊啊看', '2016-09-02 17:41:36', '2016-08-26 21:15:54', '0', '2016-08-26 21:15:54', '0', '1', '-1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('8bcd195b896f4a76800e87fa21ffa7e4', '0846cf3615514b93bc7ced0c1cd0a129', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', null, '1', null, '确认付款', null, '2016-08-20 23:47:10', '1', '2016-08-20 23:47:10', '0', '0', '-2', '0', '4');
INSERT INTO `sys_confirm` VALUES ('8ec58628ab7a463b9612b4f914529a84', '0846cf3615514b93bc7ced0c1cd0a129', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '-1', '1', '这个任务不正确', '制作完。', '2016-08-20 23:20:19', '2016-08-20 23:16:03', '0', '2016-08-20 23:16:02', '0', '0', '-1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('9491a0d4964c4c1495ecb9b8813a7fb2', '4dbc7fb8f6ca444fbada5f748b1a2f50', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', 'fsdf', '之前任务已完成。', '2016-08-20 23:50:29', '2016-08-20 23:50:03', '1', '2016-08-20 23:50:03', '0', '0', '1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('95a3992f6b1c4177809ee35718b19562', '664f8e9c8b20489488fe6bf69188be01', '1F69B3D54C2F95A014EA3CC131A34D5B', '11c9570194824c8ea0698b4df490b74e', '0', '-1', '1', '随便的拒绝掉这个用户', 'ztc', '2016-08-19 19:27:42', '2016-08-10 23:06:52', '0', '2016-08-10 23:06:52', '0', '1', '-1', '123', '2');
INSERT INTO `sys_confirm` VALUES ('9796f32f9b46412b9a6cf46a6b96d8c4', 'c648a21e97ce401381c3fd26a145d028', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '文件已经到位', '已到位', '2016-08-20 23:43:06', '2016-08-20 23:41:36', '1', '2016-08-20 23:41:36', '0', '0', '1', '0', '4');
INSERT INTO `sys_confirm` VALUES ('a119a129b737491fb48f6aaac7e91a2f', 'bb607ea310da49db92eb6c27dce7318b', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '   ', 'f', '2016-08-21 21:06:26', '2016-08-21 21:06:12', '1', '2016-08-21 21:06:12', '0', '0', '1', '0', '4');
INSERT INTO `sys_confirm` VALUES ('a63a9ad8b3f14c8ba9752b205350adbd', 'ae8ba80d625f4b14906f6c2412cf0b53', '1F69B3D54C2F95A014EA3CC131A34D5B', '11c9570194824c8ea0698b4df490b74e', '0', '1', '1', '同一', '子任务3', '2016-08-11 00:34:52', '2016-08-11 00:34:38', '1', '2016-08-11 00:34:38', '0', '0', '1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('a6e325a58acd4ce4851598550560126d', 'be68c316767c4d1eb23d78539123630c', '1F69B3D54C2F95A014EA3CC131A34D5B', '9bd9768ff9404861a5658db901457a69', '0', '1', '1', '任务已经完成，货款已经下发。', '任务已经完成，请付款！', '2016-08-08 00:03:58', '2016-08-07 23:46:17', '1', '2016-08-07 23:46:17', '0', '1', '1', '0', '4');
INSERT INTO `sys_confirm` VALUES ('a843051581214713bfdc7e34749647a3', 'dd37ed11ce53465ba4bcfa29e9defd28', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '0819_01', '0819_01', '2016-08-21 00:20:41', '2016-08-21 00:20:19', '1', '2016-08-21 00:20:19', '0', '1', '1', '3', '2');
INSERT INTO `sys_confirm` VALUES ('aaa4f0ae10b645259c7599c96cabc7db', '283bb89dc1e24c5c9b5aa38b16d70925', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '第三次允许。', '第三次申请察看，会被通过，注意一点。', '2016-08-20 22:52:13', '2016-08-20 22:48:59', '1', '2016-08-20 22:48:59', '0', '1', '1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('aafac15e54634b5f8a509cdfef4ce7a4', '664f8e9c8b20489488fe6bf69188be01', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '-1', '1', '不同意查看', '八月十号，测试申请察看任务详情。', '2016-08-10 22:55:42', '2016-08-10 22:53:30', '0', '2016-08-10 22:53:29', '0', '1', '-1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('ac5dae05d6d74af395969759992acd96', '0846cf3615514b93bc7ced0c1cd0a129', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', null, '1', null, '第四次确认钱。', null, '2016-08-20 23:48:25', '1', '2016-08-20 23:48:25', '0', '0', '-2', '0', '4');
INSERT INTO `sys_confirm` VALUES ('ad4075d361cf4d759ac070d4aeca617e', '703a44705f3f4f2ba9c355419266c6af', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', 'hao  geinikan', 'haishixiang kan', '2016-08-21 20:15:45', '2016-08-21 20:15:28', '1', '2016-08-21 20:15:28', '0', '1', '1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('b79629d2eee841bf88998d5e71cd7d73', '664f8e9c8b20489488fe6bf69188be01', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '同意', '这个价格合适嘛？', '2016-08-11 00:09:19', '2016-08-10 23:21:27', '1', '2016-08-10 23:21:27', '0', '1', '1', '19999', '2');
INSERT INTO `sys_confirm` VALUES ('b9ee5f4a579741e880d0228a3a2ee247', '283bb89dc1e24c5c9b5aa38b16d70925', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '通过接单。', '如何修改任务价格？', '2016-08-20 23:13:32', '2016-08-20 23:03:33', '1', '2016-08-20 23:03:33', '0', '1', '1', '1', '2');
INSERT INTO `sys_confirm` VALUES ('baf2ed410ded44dfb22a9d3cd816c477', '283bb89dc1e24c5c9b5aa38b16d70925', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '-1', '1', '再次拒绝查看。', '再次申请察看。', '2016-08-20 22:48:26', '2016-08-20 22:48:14', '0', '2016-08-20 22:48:14', '0', '1', '-1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('be51688420df4dd9992f5aa7ad94e103', '63a4cbb895fe4d2593bc2e4a6664b9fb', '1F69B3D54C2F95A014EA3CC131A34D5B', '9bd9768ff9404861a5658db901457a69', '0', '1', '1', '123', '123123', '2016-08-10 22:42:51', '2016-08-07 10:55:27', '1', '2016-08-07 10:55:27', '0', '1', '1', null, '1');
INSERT INTO `sys_confirm` VALUES ('c18463fa71084803a76c5263e4168943', 'be68c316767c4d1eb23d78539123630c', '1F69B3D54C2F95A014EA3CC131A34D5B', '9bd9768ff9404861a5658db901457a69', '0', '1', '1', '同意接受此单', '个人能力高超', '2016-08-07 19:38:09', '2016-08-07 19:23:17', '1', '2016-08-07 19:23:17', '0', '1', '1', '23', '2');
INSERT INTO `sys_confirm` VALUES ('c2812987d02440f7afe13b2842319222', 'dd37ed11ce53465ba4bcfa29e9defd28', '1F69B3D54C2F95A014EA3CC131A34D5B', '7c755b66c53b46c294356f4cbdf62edc', '0', '1', '1', '申请 ', '申请 ', '2016-08-21 00:18:49', '2016-08-21 00:18:21', '1', '2016-08-21 00:18:21', '0', '1', '1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('ca9ab36225774b41bb755de30ed6d865', '0d62a88e74fa4f45bb153d94fbad4a88', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '给你看\n', '给我看看拜托了', '2016-09-02 19:12:00', '2016-09-02 17:48:09', '1', '2016-09-02 17:48:09', '0', '1', '1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('cd5f39ecbde542eea7e1d878320f0d50', 'ecb148784bd84faa861258fb7b33395e', '1F69B3D54C2F95A014EA3CC131A34D5B', '6a092c67f5674730ab1301501b30e8f1', '0', '1', '1', 'asd', '123124124', '2016-10-11 23:41:07', '2016-10-11 23:33:48', '1', '2016-10-11 23:33:48', '0', '1', '1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('d1f18adf804f4b11b924b0d699147f5e', '664f8e9c8b20489488fe6bf69188be01', '1F69B3D54C2F95A014EA3CC131A34D5B', '11c9570194824c8ea0698b4df490b74e', '0', '1', '1', '同一', 'ztcztc', '2016-08-11 00:11:34', '2016-08-10 23:07:54', '1', '2016-08-10 23:07:54', '0', '1', '1', '111', '2');
INSERT INTO `sys_confirm` VALUES ('d26de50b2e64460097edea2aea51cc6c', 'a4c59d762a24491288d49a04d79e5914', '1F69B3D54C2F95A014EA3CC131A34D5B', '11c9570194824c8ea0698b4df490b74e', '0', '1', '1', '验证通过', '做完了子任务1', '2016-08-11 00:26:54', '2016-08-11 00:15:27', '1', '2016-08-11 00:15:27', '0', '0', '1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('d34c942734134e5fb77712f5218b8031', 'be68c316767c4d1eb23d78539123630c', '1F69B3D54C2F95A014EA3CC131A34D5B', '6a092c67f5674730ab1301501b30e8f1', '0', '-1', '1', '不同意', '申请查看', '2016-08-07 20:12:14', '2016-08-07 20:02:02', '0', '2016-08-07 20:02:02', '0', '1', '-1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('da974b578a874d0fa5ea9eccf9f2b5e0', '4dbc7fb8f6ca444fbada5f748b1a2f50', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '确认收款确实有问题。', '确认收款确实有问题。', '2016-08-20 23:51:01', '2016-08-20 23:50:52', '1', '2016-08-20 23:50:52', '0', '0', '1', '0', '4');
INSERT INTO `sys_confirm` VALUES ('dde3754741cf4ba6b6a975201e649929', 'be68c316767c4d1eb23d78539123630c', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '已经有人接单，再接一次？', '申请制作。', '2016-08-08 23:08:52', '2016-08-08 22:48:32', '1', '2016-08-08 22:48:32', '0', '1', '1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('de4aee2717ca4fa2947c8f39cb0f04fd', 'be68c316767c4d1eb23d78539123630c', '1F69B3D54C2F95A014EA3CC131A34D5B', '4ee0275972ca4e699570d2f51daa470a', '0', '1', '1', '不同意查看', '我要申请查看任务列表给次机会吧', '2016-08-07 19:42:42', '2016-08-07 19:10:06', '1', '2016-08-07 19:10:06', '0', '1', '1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('df3d1aeb8efa4b0a88dd3d15962505ef', '664f8e9c8b20489488fe6bf69188be01', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '同意查看', '八月十号申请察看，为什么拒绝我。', '2016-08-10 22:58:18', '2016-08-10 22:56:18', '1', '2016-08-10 22:56:18', '0', '1', '1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('e009c488c8c542d99704097626678608', '664f8e9c8b20489488fe6bf69188be01', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '-1', '1', '价格太贵', 'test_1申请接单，任务列表已经察看过了，可以制作。我的联系方式：XXXXXXX', '2016-08-10 23:15:07', '2016-08-10 23:10:23', '0', '2016-08-10 23:10:23', '0', '1', '-1', '785676786', '2');
INSERT INTO `sys_confirm` VALUES ('e3a8a873916c4abcb33730bc5ee56deb', '703a44705f3f4f2ba9c355419266c6af', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '-1', '1', 'bugei ni zuo', 'liu yiju hua yong lai jiedan', '2016-08-21 20:33:45', '2016-08-21 20:26:47', '0', '2016-08-21 20:26:47', '0', '1', '-1', '1', '2');
INSERT INTO `sys_confirm` VALUES ('e565a58bbdc44da9a6590b004e161640', '53a5cbf347d942d89a9470642cd3e6cb', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', 'f', 'queren shoukuan', '2016-08-21 21:04:52', '2016-08-21 21:04:40', '1', '2016-08-21 21:04:40', '0', '0', '1', '0', '4');
INSERT INTO `sys_confirm` VALUES ('ecf992cdf9774a34a1c097805372804e', '0846cf3615514b93bc7ced0c1cd0a129', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '确认付款', '修改完。', '2016-08-20 23:46:56', '2016-08-20 23:46:40', '1', '2016-08-20 23:46:40', '0', '0', '1', '0', '3');
INSERT INTO `sys_confirm` VALUES ('f1ca486125d3491eaae06fc559990923', 'be68c316767c4d1eb23d78539123630c', '1F69B3D54C2F95A014EA3CC131A34D5B', '6a092c67f5674730ab1301501b30e8f1', '0', '-1', '1', '不给看', '我就要看', '2016-08-07 20:20:17', '2016-08-07 20:20:04', '0', '2016-08-07 20:20:04', '0', '1', '-1', '0', '1');
INSERT INTO `sys_confirm` VALUES ('f6ab31d684284581bbf749f50717c6dd', '0846cf3615514b93bc7ced0c1cd0a129', '1F69B3D54C2F95A014EA3CC131A34D5B', '0d72f9906ac04332b817e1dd0f651eea', '0', '1', '1', '五次确认才确认的钱。', '第四次确认钱。', '2016-08-20 23:49:21', '2016-08-20 23:48:29', '1', '2016-08-20 23:48:29', '0', '0', '1', '0', '4');
INSERT INTO `sys_confirm` VALUES ('fc684991664f4aad802290476aab6fbc', '703a44705f3f4f2ba9c355419266c6af', '1F69B3D54C2F95A014EA3CC131A34D5B', '7c755b66c53b46c294356f4cbdf62edc', '0', '1', '1', 'ye geini kan', '已经接了。', '2016-08-21 20:25:59', '2016-08-21 20:25:21', '1', '2016-08-21 20:25:21', '0', '1', '1', '0', '1');

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
INSERT INTO `sys_file` VALUES ('083b3070a9354bfba200ec670e87ed94', '083b3070a9354bfba200ec670e87ed94.jpg', '2016-10-11 22:02:30', 'ecb148784bd84faa861258fb7b33395e', null, '1', '0', null, null, null, null, '083b3070a9354bfba200ec670e87ed94.jpg', '1475134_1331559643qMzc.jpg');
INSERT INTO `sys_file` VALUES ('0f2945440d2f4e06a1513dff76d69002', '0f2945440d2f4e06a1513dff76d69002.jpg', '2016-07-27 09:44:25', null, null, '0', '0', null, null, null, null, '0f2945440d2f4e06a1513dff76d69002.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('111034426fa44f1a9122ab6048493c20', '111034426fa44f1a9122ab6048493c20.jpg', '2016-07-18 23:39:03', 'a096e2d819a546a68f93da5e98f20379', null, '1', '0', null, null, null, null, '111034426fa44f1a9122ab6048493c20.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('17b76cf425e245f591a4e6c7bc7d1ec9', '17b76cf425e245f591a4e6c7bc7d1ec9.jpg', '2016-07-31 13:12:08', null, null, '0', '0', null, null, null, null, '17b76cf425e245f591a4e6c7bc7d1ec9.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('1b42ce644c39426f8626a8a8f1fccae5', '1b42ce644c39426f8626a8a8f1fccae5.jpg', '2016-08-10 18:58:19', null, null, '0', '0', null, null, null, null, '1b42ce644c39426f8626a8a8f1fccae5.jpg', 'u=1367060798,1544427162&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('20227c752b524844862026dbd992e2cf', '20227c752b524844862026dbd992e2cf.jpg', '2016-07-31 10:43:55', null, null, '0', '0', null, null, null, null, '20227c752b524844862026dbd992e2cf.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('221e9d2b8a8747448c31db7faa2e650f', '221e9d2b8a8747448c31db7faa2e650f.jpg', '2016-07-27 09:51:37', null, null, '0', '0', null, null, null, null, '221e9d2b8a8747448c31db7faa2e650f.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('24e9af41c74d47b6a2dbf2a7d716569d', '24e9af41c74d47b6a2dbf2a7d716569d.jpg', '2016-08-21 17:56:05', 'da3358a3560e4194a7776575c67b245e', null, '1', '0', null, null, null, null, '24e9af41c74d47b6a2dbf2a7d716569d.jpg', 'ux_shot.jpg');
INSERT INTO `sys_file` VALUES ('28f83d9c9da64acb92a2066d28118ca1', '28f83d9c9da64acb92a2066d28118ca1.jpg', '2016-07-18 23:39:53', 'a096e2d819a546a68f93da5e98f20379', null, '1', '0', null, null, null, null, '28f83d9c9da64acb92a2066d28118ca1.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('2d79375e50af4ad390aad44536c5bc7f', '2d79375e50af4ad390aad44536c5bc7f.jpg', '2016-08-21 17:51:58', null, null, '0', '0', null, null, null, null, '2d79375e50af4ad390aad44536c5bc7f.jpg', '22492613.jpg');
INSERT INTO `sys_file` VALUES ('2e592ec7412843a5ab3fc9d06d4da83d', '2e592ec7412843a5ab3fc9d06d4da83d.png', '2016-08-10 23:04:37', null, null, '0', '0', null, null, null, null, '2e592ec7412843a5ab3fc9d06d4da83d.png', 'QQ截图20160810230423.png');
INSERT INTO `sys_file` VALUES ('2f6e71d128be4b419ac719db631cb929', '2f6e71d128be4b419ac719db631cb929.jpg', '2016-08-07 23:22:24', 'd65fd59dff094e7e9ae598d669ad6166', null, '1', '0', null, null, null, null, '2f6e71d128be4b419ac719db631cb929.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('35b6f0424a84454994db5f2ddc1bd726', '35b6f0424a84454994db5f2ddc1bd726.jpg', '2016-08-19 20:04:38', null, null, '0', '0', null, null, null, null, '35b6f0424a84454994db5f2ddc1bd726.jpg', '22492613.jpg');
INSERT INTO `sys_file` VALUES ('3b0f1a33f25044e89d91a25c4e96b389', '3b0f1a33f25044e89d91a25c4e96b389.jpg', '2016-07-18 23:40:57', null, null, '0', '0', null, null, null, null, '3b0f1a33f25044e89d91a25c4e96b389.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('3b7353409ac747dba4ad294f0587026d', '3b7353409ac747dba4ad294f0587026d.docx', '2016-07-27 10:24:36', '15af70245589436a93bc2e3459fbef03', null, '1', '0', null, null, null, null, '3b7353409ac747dba4ad294f0587026d.docx', '代工项目接口设计和数据字典_20160711.docx');
INSERT INTO `sys_file` VALUES ('3baf89815743405ba003d3a1d654e07c', '3baf89815743405ba003d3a1d654e07c.jpg', '2016-07-12 18:53:51', null, null, '0', '0', null, null, null, null, '3baf89815743405ba003d3a1d654e07c.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('3d73a116519c4a458cae69ebafda293a', '3d73a116519c4a458cae69ebafda293a.jpg', '2016-08-07 16:48:48', 'be68c316767c4d1eb23d78539123630c', null, '1', '0', null, null, null, null, '3d73a116519c4a458cae69ebafda293a.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('3f593252af58407a9800865afa1325c7', '3f593252af58407a9800865afa1325c7.docx', '2016-07-27 10:28:21', 'bac1dca984774309bdf03b0895af7117', null, '1', '0', null, null, null, null, '3f593252af58407a9800865afa1325c7.docx', '�?��确认_20160711.docx');
INSERT INTO `sys_file` VALUES ('409c636360e848939ce977afa803ea29', '409c636360e848939ce977afa803ea29.jpg', '2016-07-31 11:17:54', null, null, '0', '0', null, null, null, null, '409c636360e848939ce977afa803ea29.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('42d016c42e464b40bc9de5af480a1dbf', '42d016c42e464b40bc9de5af480a1dbf.jpg', '2016-07-31 10:36:36', null, null, '0', '0', null, null, null, null, '42d016c42e464b40bc9de5af480a1dbf.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('432029ebbd1d421693a9e755eede38f1', '432029ebbd1d421693a9e755eede38f1.jpg', '2016-07-31 12:06:20', null, null, '0', '0', null, null, null, null, '432029ebbd1d421693a9e755eede38f1.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('4510a1af059c40fcb3ac75a285935821', '4510a1af059c40fcb3ac75a285935821.jpg', '2016-08-26 21:07:32', null, null, '0', '0', null, null, null, null, '4510a1af059c40fcb3ac75a285935821.jpg', '2.pic.jpg');
INSERT INTO `sys_file` VALUES ('45d3ce2833a64b2db244c9102eddd06f', '45d3ce2833a64b2db244c9102eddd06f.jpg', '2016-07-31 12:33:42', null, null, '0', '0', null, null, null, null, '45d3ce2833a64b2db244c9102eddd06f.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('4652ef2e4b5c4dbeb2112be5afd89af6', '4652ef2e4b5c4dbeb2112be5afd89af6.png', '2016-09-09 23:11:14', null, null, '0', '0', null, null, null, null, '4652ef2e4b5c4dbeb2112be5afd89af6.png', '屏幕快照 2016-09-07 下午8.36.48.png');
INSERT INTO `sys_file` VALUES ('4906d3cdc7194c42995e25b0bf92009f', '4906d3cdc7194c42995e25b0bf92009f.jpg', '2016-08-10 22:47:59', null, null, '0', '0', null, null, null, null, '4906d3cdc7194c42995e25b0bf92009f.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('49f1175386534da5b4d3b4acbc0fb1bb', '49f1175386534da5b4d3b4acbc0fb1bb.jpg', '2016-09-14 22:27:52', null, null, '0', '0', null, null, null, null, '49f1175386534da5b4d3b4acbc0fb1bb.jpg', '紫水晶logo-01.jpg');
INSERT INTO `sys_file` VALUES ('515454d4875c405291d163772b21d037', '515454d4875c405291d163772b21d037.jpg', '2016-08-10 22:46:07', null, null, '0', '0', null, null, null, null, '515454d4875c405291d163772b21d037.jpg', 'u=2113947894,743125157&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('525f8eb90f4749d3b9c7f3ca0a10630e', '525f8eb90f4749d3b9c7f3ca0a10630e.jpg', '2016-09-14 22:27:37', null, null, '0', '0', null, null, null, null, '525f8eb90f4749d3b9c7f3ca0a10630e.jpg', '紫水晶logo-01.jpg');
INSERT INTO `sys_file` VALUES ('53a0629a213847e2af67bc9d56af408f', '53a0629a213847e2af67bc9d56af408f.docx', '2016-07-26 22:11:18', null, null, '0', '0', null, null, null, null, '53a0629a213847e2af67bc9d56af408f.docx', '营销管理系统_0726.docx');
INSERT INTO `sys_file` VALUES ('54b756ed5eaa4e1cbbe43bbd0f22df6a', '54b756ed5eaa4e1cbbe43bbd0f22df6a.jpg', '2016-10-11 22:02:05', null, null, '0', '0', null, null, null, null, '54b756ed5eaa4e1cbbe43bbd0f22df6a.jpg', '1475134_1331559643qMzc.jpg');
INSERT INTO `sys_file` VALUES ('555326d7ec2240d790cb016d1dfa6713', '555326d7ec2240d790cb016d1dfa6713.jpg', '2016-07-27 09:54:14', null, null, '0', '0', null, null, null, null, '555326d7ec2240d790cb016d1dfa6713.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('558a930547974deeb0efd83803c6396e', '558a930547974deeb0efd83803c6396e.jpg', '2016-08-10 18:58:51', '55df36fdc80a476fb67cc45a22d3c2a0', null, '1', '0', null, null, null, null, '558a930547974deeb0efd83803c6396e.jpg', 'u=1367060798,1544427162&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('565161d4787340a2abcfead78deb2705', '565161d4787340a2abcfead78deb2705.png', '2016-08-21 17:57:06', null, null, '0', '0', null, null, null, null, '565161d4787340a2abcfead78deb2705.png', '灵然创智logo-01.png');
INSERT INTO `sys_file` VALUES ('56c4755038524c2c9edb86a6c98d6658', '56c4755038524c2c9edb86a6c98d6658.jpg', '2016-07-27 09:52:56', null, null, '0', '0', null, null, null, null, '56c4755038524c2c9edb86a6c98d6658.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('571fa63463d84c9daea83d1f1ab28237', '571fa63463d84c9daea83d1f1ab28237.jpg', '2016-08-23 21:58:10', '6296c73410fb4b14a15d97691dbc61ea', null, '1', '0', null, null, null, null, '571fa63463d84c9daea83d1f1ab28237.jpg', 'Unnamed QQ Screenshot20160823215647.jpg');
INSERT INTO `sys_file` VALUES ('5979f2059900413ab95688d2fe4454f5', '5979f2059900413ab95688d2fe4454f5.jpg', '2016-07-27 22:32:33', null, null, '0', '0', null, null, null, null, '5979f2059900413ab95688d2fe4454f5.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('59a960a66dba4e67bbee71869919c8e4', '59a960a66dba4e67bbee71869919c8e4.jpg', '2016-07-31 10:39:19', null, null, '0', '0', null, null, null, null, '59a960a66dba4e67bbee71869919c8e4.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('5d93e117f43440fd827df6a0ff7d0df2', '5d93e117f43440fd827df6a0ff7d0df2.jpg', '2016-07-27 10:27:49', null, null, '0', '0', null, null, null, null, '5d93e117f43440fd827df6a0ff7d0df2.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('5eb32b950764496b915c13cd10c06c44', '5eb32b950764496b915c13cd10c06c44.jpg', '2016-08-07 16:50:56', null, null, '0', '0', null, null, null, null, '5eb32b950764496b915c13cd10c06c44.jpg', 'u=2113947894,743125157&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('6025be78547c449aaf7f4aecdbf8f4f1', '6025be78547c449aaf7f4aecdbf8f4f1.jpg', '2016-09-19 18:45:52', null, null, '0', '0', null, null, null, null, '6025be78547c449aaf7f4aecdbf8f4f1.jpg', '2016072614451378952.jpg');
INSERT INTO `sys_file` VALUES ('65284a9d73004b938ad1ddba588b29d6', '65284a9d73004b938ad1ddba588b29d6.jpg', '2016-07-28 22:08:46', null, null, '0', '0', null, null, null, null, '65284a9d73004b938ad1ddba588b29d6.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('6563fe33f9844b3682e94aa4baaf8543', '6563fe33f9844b3682e94aa4baaf8543.jpeg', '2016-08-19 20:03:43', '18ff348d8cc14ab8b3c534fe715f8d36', null, '1', '0', null, null, null, null, '6563fe33f9844b3682e94aa4baaf8543.jpeg', 'xmind.jpeg');
INSERT INTO `sys_file` VALUES ('66a055ddb6a741b8bea0b76451259156', '66a055ddb6a741b8bea0b76451259156.jpg', '2016-08-07 16:45:28', null, null, '0', '0', null, null, null, null, '66a055ddb6a741b8bea0b76451259156.jpg', 'u=2113947894,743125157&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('691c21d080864a7c871c63c486efefea', '691c21d080864a7c871c63c486efefea.jpg', '2016-07-31 11:17:50', '5d72b27560fd40d2a5502d31e90b54d1', null, '1', '0', null, null, null, null, '691c21d080864a7c871c63c486efefea.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('6a6b24dbcde2404ea0edcc3f06dacaa2', '6a6b24dbcde2404ea0edcc3f06dacaa2.jpg', '2016-07-12 18:54:22', null, null, '0', '0', null, null, null, null, '6a6b24dbcde2404ea0edcc3f06dacaa2.jpg', '10.jpg');
INSERT INTO `sys_file` VALUES ('6bdbf973aca8490cb0b00ee1d63d2f47', '6bdbf973aca8490cb0b00ee1d63d2f47.jpg', '2016-07-18 23:29:16', null, null, '0', '0', null, null, null, null, '6bdbf973aca8490cb0b00ee1d63d2f47.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('6cb261e51d6349a7af7c6ef052f3815a', '6cb261e51d6349a7af7c6ef052f3815a.jpg', '2016-08-24 21:14:38', '6ef20b74ab274e049d13c39757252a3a', null, '1', '0', null, null, null, null, '6cb261e51d6349a7af7c6ef052f3815a.jpg', '22492613.jpg');
INSERT INTO `sys_file` VALUES ('714de787333b4a4696607fc3339eec71', '714de787333b4a4696607fc3339eec71.docx', '2016-07-27 10:28:17', 'bac1dca984774309bdf03b0895af7117', null, '1', '0', null, null, null, null, '714de787333b4a4696607fc3339eec71.docx', '代工项目接口设计和数据字典_20160711.docx');
INSERT INTO `sys_file` VALUES ('727d239909904065a9faada112902cb9', '727d239909904065a9faada112902cb9.jpg', '2016-08-26 21:15:00', null, null, '0', '0', null, null, null, null, '727d239909904065a9faada112902cb9.jpg', '2.pic.jpg');
INSERT INTO `sys_file` VALUES ('74b8958cf98947d09a5f50ecc9e05cce', '74b8958cf98947d09a5f50ecc9e05cce.jpg', '2016-07-12 22:12:02', null, null, '0', '0', null, null, null, null, '74b8958cf98947d09a5f50ecc9e05cce.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('74de53ec51524f7eabdcd7dc13ecbfb8', '74de53ec51524f7eabdcd7dc13ecbfb8.jpg', '2016-07-27 09:43:25', null, null, '0', '0', null, null, null, null, '74de53ec51524f7eabdcd7dc13ecbfb8.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('758c62cfbc8a470e942d622f953ea28f', '758c62cfbc8a470e942d622f953ea28f.jpg', '2016-08-21 17:57:13', 'da3358a3560e4194a7776575c67b245e', null, '1', '0', null, null, null, null, '758c62cfbc8a470e942d622f953ea28f.jpg', '22492613.jpg');
INSERT INTO `sys_file` VALUES ('7c511043b3ae4120abe346e65da42d11', '7c511043b3ae4120abe346e65da42d11.jpg', '2016-07-12 22:32:22', null, null, '0', '0', null, null, null, null, '7c511043b3ae4120abe346e65da42d11.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('7c962b6989a14d3f89a1821aaef271ec', '7c962b6989a14d3f89a1821aaef271ec.jpg', '2016-07-18 23:30:41', '8eff2f884b074727808307174239bd19', null, '1', '0', null, null, null, null, '7c962b6989a14d3f89a1821aaef271ec.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('7d1e90e413144b459a8dc7e30f7179b7', '7d1e90e413144b459a8dc7e30f7179b7.jpg', '2016-08-10 22:45:03', null, null, '0', '0', null, null, null, null, '7d1e90e413144b459a8dc7e30f7179b7.jpg', 'u=2113947894,743125157&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('7dce16a993334af991ad7ada14364986', '7dce16a993334af991ad7ada14364986.jpg', '2016-07-12 18:52:09', null, null, '0', '0', null, null, null, null, '7dce16a993334af991ad7ada14364986.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('7fd7e56194b84b3db62a6b8372a78d23', '7fd7e56194b84b3db62a6b8372a78d23.jpg', '2016-07-12 18:54:57', null, null, '0', '0', null, null, null, null, '7fd7e56194b84b3db62a6b8372a78d23.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('7ff2e59bec554c77a639af2d12eddd9c', '7ff2e59bec554c77a639af2d12eddd9c.jpg', '2016-07-27 09:55:39', null, null, '0', '0', null, null, null, null, '7ff2e59bec554c77a639af2d12eddd9c.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('82514284d8b24284aaa872a714d3c76a', '82514284d8b24284aaa872a714d3c76a.jpg', '2016-07-18 23:40:56', null, null, '0', '0', null, null, null, null, '82514284d8b24284aaa872a714d3c76a.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('8339d1e16dc6464383987006858df33f', '8339d1e16dc6464383987006858df33f.jpg', '2016-08-10 22:45:41', 'a60ef33ceace4c13bc5f016b40e2d863', null, '1', '0', null, null, null, null, '8339d1e16dc6464383987006858df33f.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('8497f3da03364dc4a3e52961381295f5', '8497f3da03364dc4a3e52961381295f5.docx', '2016-07-26 22:10:11', null, null, '0', '0', null, null, null, null, '8497f3da03364dc4a3e52961381295f5.docx', '营销管理系统_0726.docx');
INSERT INTO `sys_file` VALUES ('87ba2c0853ac4edda2f5dd1faf7f91dc', '87ba2c0853ac4edda2f5dd1faf7f91dc.docx', '2016-07-26 21:55:01', null, null, '0', '0', null, null, null, null, '87ba2c0853ac4edda2f5dd1faf7f91dc.docx', '客户洞察_0725.docx');
INSERT INTO `sys_file` VALUES ('8997dc5b6d8f45c1b2e82371a9d49e70', '8997dc5b6d8f45c1b2e82371a9d49e70.jpg', '2016-08-07 23:22:09', null, null, '0', '0', null, null, null, null, '8997dc5b6d8f45c1b2e82371a9d49e70.jpg', 'u=2113947894,743125157&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('8a66893a8d074120927ed4223456d399', '8a66893a8d074120927ed4223456d399.png', '2016-08-10 23:04:54', null, null, '0', '0', null, null, null, null, '8a66893a8d074120927ed4223456d399.png', 'QQ截图20160810230423.png');
INSERT INTO `sys_file` VALUES ('8c62d2e6886442eeb4e030a2e9855398', '8c62d2e6886442eeb4e030a2e9855398.jpg', '2016-07-12 22:33:43', '2f7ec4839b2c42b99c42c84f91b86930', null, '1', '0', null, null, null, null, '8c62d2e6886442eeb4e030a2e9855398.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('9077ff418b534e948189668819570b7d', '9077ff418b534e948189668819570b7d.jpg', '2016-08-07 16:45:52', null, null, '0', '0', null, null, null, null, '9077ff418b534e948189668819570b7d.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('92d1a41a9d534f8b9e8abb54cdf7975f', '92d1a41a9d534f8b9e8abb54cdf7975f.jpg', '2016-10-11 23:22:49', null, null, '0', '0', null, null, null, null, '92d1a41a9d534f8b9e8abb54cdf7975f.jpg', '1475134_1331559643qMzc.jpg');
INSERT INTO `sys_file` VALUES ('948c977aaa0740259e2ab153e16505b7', '948c977aaa0740259e2ab153e16505b7.jpg', '2016-09-19 18:46:00', null, null, '0', '0', null, null, null, null, '948c977aaa0740259e2ab153e16505b7.jpg', '2016072614451378952.jpg');
INSERT INTO `sys_file` VALUES ('98b0314dfca949549f06d9b4397ddf86', '98b0314dfca949549f06d9b4397ddf86.jpg', '2016-08-21 17:56:34', null, null, '0', '0', null, null, null, null, '98b0314dfca949549f06d9b4397ddf86.jpg', '紫水晶logo-01.jpg');
INSERT INTO `sys_file` VALUES ('9a701d4581064c1dae34c4cf911c11e1', '9a701d4581064c1dae34c4cf911c11e1.jpg', '2016-07-12 22:11:51', null, null, '0', '0', null, null, null, null, '9a701d4581064c1dae34c4cf911c11e1.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('9ed17784f3b046448d6800e4fe60348a', '9ed17784f3b046448d6800e4fe60348a.jpg', '2016-09-14 22:27:15', null, null, '0', '0', null, null, null, null, '9ed17784f3b046448d6800e4fe60348a.jpg', '2016072614451378952.jpg');
INSERT INTO `sys_file` VALUES ('9f2a954ec2a94867aa7a04822f96bcc9', '9f2a954ec2a94867aa7a04822f96bcc9.jpg', '2016-07-31 12:05:42', null, null, '0', '0', null, null, null, null, '9f2a954ec2a94867aa7a04822f96bcc9.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('9f60bea013ed4e56a5bdd276e59c0301', '9f60bea013ed4e56a5bdd276e59c0301.jpg', '2016-08-23 21:58:00', null, null, '0', '0', null, null, null, null, '9f60bea013ed4e56a5bdd276e59c0301.jpg', 'Unnamed QQ Screenshot20160823215647.jpg');
INSERT INTO `sys_file` VALUES ('a081375030a64e108c1bffeb19ad2b1d', 'a081375030a64e108c1bffeb19ad2b1d.jpg', '2016-07-27 09:57:00', null, null, '0', '0', null, null, null, null, 'a081375030a64e108c1bffeb19ad2b1d.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('a10df7b6898743c9a920375bd3586760', 'a10df7b6898743c9a920375bd3586760.jpg', '2016-07-18 23:36:42', '94ad20b0262a4efd8d5fe02887331340', null, '1', '0', null, null, null, null, 'a10df7b6898743c9a920375bd3586760.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('a392f8337482478cacefa6a1b8fe55ff', 'a392f8337482478cacefa6a1b8fe55ff.jpg', '2016-07-27 09:46:50', null, null, '0', '0', null, null, null, null, 'a392f8337482478cacefa6a1b8fe55ff.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('a5437891c6744b87b63881aeab07b529', 'a5437891c6744b87b63881aeab07b529.png', '2016-08-10 23:05:08', null, null, '0', '0', null, null, null, null, 'a5437891c6744b87b63881aeab07b529.png', 'QQ截图20160810230423.png');
INSERT INTO `sys_file` VALUES ('a78b50af27434ea6bc6edb3add471ec8', 'a78b50af27434ea6bc6edb3add471ec8.jpg', '2016-08-19 20:03:26', '18ff348d8cc14ab8b3c534fe715f8d36', null, '1', '0', null, null, null, null, 'a78b50af27434ea6bc6edb3add471ec8.jpg', '紫水晶logo-01.jpg');
INSERT INTO `sys_file` VALUES ('af01491ebb50408f989ec478db7815d7', 'af01491ebb50408f989ec478db7815d7.docx', '2016-08-10 22:49:06', '664f8e9c8b20489488fe6bf69188be01', null, '1', '0', null, null, null, null, 'af01491ebb50408f989ec478db7815d7.docx', 'test1.docx');
INSERT INTO `sys_file` VALUES ('afc073a882f4458abda575578e3f12cd', 'afc073a882f4458abda575578e3f12cd.jpg', '2016-08-07 16:51:18', 'cc40e42da4ca4d9ab564643bd67b52d4', null, '1', '0', null, null, null, null, 'afc073a882f4458abda575578e3f12cd.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('b157a60edabd48aabc1ef24f8cf39728', 'b157a60edabd48aabc1ef24f8cf39728.jpg', '2016-07-12 18:37:46', null, null, '0', '0', null, null, null, null, 'b157a60edabd48aabc1ef24f8cf39728.jpg', '9.jpg');
INSERT INTO `sys_file` VALUES ('b2c13efb71884f1d8dd335ac6feda94d', 'b2c13efb71884f1d8dd335ac6feda94d.jpg', '2016-07-31 13:11:46', null, null, '0', '0', null, null, null, null, 'b2c13efb71884f1d8dd335ac6feda94d.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('b373cae217ad46e4b97852710d2cb2a7', 'b373cae217ad46e4b97852710d2cb2a7.docx', '2016-07-26 22:00:40', null, null, '0', '0', null, null, null, null, 'b373cae217ad46e4b97852710d2cb2a7.docx', '营销管理系统_0726.docx');
INSERT INTO `sys_file` VALUES ('b383ecf83e074b98bd10ad7762061b80', 'b383ecf83e074b98bd10ad7762061b80.jpg', '2016-07-12 22:31:55', null, null, '0', '0', null, null, null, null, 'b383ecf83e074b98bd10ad7762061b80.jpg', '2.jpg');
INSERT INTO `sys_file` VALUES ('b95d320c6559410581a45a3643d1161d', 'b95d320c6559410581a45a3643d1161d.jpg', '2016-09-14 23:12:11', null, null, '0', '0', null, null, null, null, 'b95d320c6559410581a45a3643d1161d.jpg', 'Unnamed QQ Screenshot20160914231202.jpg');
INSERT INTO `sys_file` VALUES ('bafef29283094fdaa9e320de4451af1e', 'bafef29283094fdaa9e320de4451af1e.jpg', '2016-07-27 10:03:16', null, null, '0', '0', null, null, null, null, 'bafef29283094fdaa9e320de4451af1e.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('bf6dec230abc457d992fe16b3eacbda0', 'bf6dec230abc457d992fe16b3eacbda0.jpg', '2016-07-31 13:48:23', null, '4ee0275972ca4e699570d2f51daa470a', '2', '0', null, null, null, null, 'bf6dec230abc457d992fe16b3eacbda0.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('bfffd7c249e84ec3aba485f2f4c8cf01', 'bfffd7c249e84ec3aba485f2f4c8cf01.docx', '2016-07-26 22:11:58', 'c065bbd58f174cf589a072c4f5d714eb', null, '1', '0', null, null, null, null, 'bfffd7c249e84ec3aba485f2f4c8cf01.docx', '客户洞察_0725.docx');
INSERT INTO `sys_file` VALUES ('c907ac9e09d04f15a197b0784f4ee677', 'c907ac9e09d04f15a197b0784f4ee677.png', '2016-09-19 18:46:12', null, null, '0', '0', null, null, null, null, 'c907ac9e09d04f15a197b0784f4ee677.png', 'drop -shadow阴影参数要求.png');
INSERT INTO `sys_file` VALUES ('ce239050a51048739630f702a8a85ce9', 'ce239050a51048739630f702a8a85ce9.jpg', '2016-08-24 01:32:38', null, null, '0', '0', null, null, null, null, 'ce239050a51048739630f702a8a85ce9.jpg', '2.jpg');
INSERT INTO `sys_file` VALUES ('ceb065618e6e431ba0d84e4d5277fe22', 'ceb065618e6e431ba0d84e4d5277fe22.jpg', '2016-07-27 09:45:39', null, null, '0', '0', null, null, null, null, 'ceb065618e6e431ba0d84e4d5277fe22.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('cf2366014eb34908b50710a8389fa130', 'cf2366014eb34908b50710a8389fa130.jpg', '2016-08-07 16:47:56', null, null, '0', '0', null, null, null, null, 'cf2366014eb34908b50710a8389fa130.jpg', 'u=2113947894,743125157&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('d24c29bca87c484db4d7aa3c996d8dda', 'd24c29bca87c484db4d7aa3c996d8dda.jpg', '2016-07-27 10:24:15', null, null, '0', '0', null, null, null, null, 'd24c29bca87c484db4d7aa3c996d8dda.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('d5c8d72dada5469bb61eebedc1b0ecdf', 'd5c8d72dada5469bb61eebedc1b0ecdf.jpg', '2016-07-27 09:51:14', null, null, '0', '0', null, null, null, null, 'd5c8d72dada5469bb61eebedc1b0ecdf.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('d6353703732a4633a3cb8f8bd08cd3d3', 'd6353703732a4633a3cb8f8bd08cd3d3.jpg', '2016-09-14 23:13:28', '50b10c3e2dc349638849facceac97c0a', null, '1', '0', null, null, null, null, 'd6353703732a4633a3cb8f8bd08cd3d3.jpg', 'Unnamed QQ Screenshot20160914231202.jpg');
INSERT INTO `sys_file` VALUES ('d7ab37f0ad06455aa7fd2a00bc6555ff', 'd7ab37f0ad06455aa7fd2a00bc6555ff.jpg', '2016-07-27 10:24:33', '15af70245589436a93bc2e3459fbef03', null, '1', '0', null, null, null, null, 'd7ab37f0ad06455aa7fd2a00bc6555ff.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('d8b20ab8e18b4ff7aff6cc7e4c7932ef', 'd8b20ab8e18b4ff7aff6cc7e4c7932ef.jpg', '2016-09-14 20:49:41', null, null, '0', '0', null, null, null, null, 'd8b20ab8e18b4ff7aff6cc7e4c7932ef.jpg', '2016072614451378952.jpg');
INSERT INTO `sys_file` VALUES ('d99b524c31b04317b758e8f4b872e4b1', 'd99b524c31b04317b758e8f4b872e4b1.png', '2016-09-13 23:59:01', null, null, '0', '0', null, null, null, null, 'd99b524c31b04317b758e8f4b872e4b1.png', 'genimage.png');
INSERT INTO `sys_file` VALUES ('da324a32c7ae40ec836175580f122e63', 'da324a32c7ae40ec836175580f122e63.jpg', '2016-07-18 23:40:57', '361c22e1c27b4997a821548cb767abec', null, '1', '0', null, null, null, null, 'da324a32c7ae40ec836175580f122e63.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('da3f9fdf67654ee3955f0dc4971a69ab', 'da3f9fdf67654ee3955f0dc4971a69ab.jpg', '2016-07-12 18:53:47', null, null, '0', '0', null, null, null, null, 'da3f9fdf67654ee3955f0dc4971a69ab.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('dc953823bbd94e63951cc93e934d2487', 'dc953823bbd94e63951cc93e934d2487.docx', '2016-07-26 21:55:41', null, null, '0', '0', null, null, null, null, 'dc953823bbd94e63951cc93e934d2487.docx', '营销管理系统_0726.docx');
INSERT INTO `sys_file` VALUES ('ddf4b46a78d64f68bd7b627972ab6973', 'ddf4b46a78d64f68bd7b627972ab6973.png', '2016-08-19 20:01:27', null, null, '0', '0', null, null, null, null, 'ddf4b46a78d64f68bd7b627972ab6973.png', 'BPM_img002_cn.png');
INSERT INTO `sys_file` VALUES ('e2aa4f6eb1b74500835e5b98bb63ef10', 'e2aa4f6eb1b74500835e5b98bb63ef10.jpg', '2016-09-14 23:13:56', '50b10c3e2dc349638849facceac97c0a', null, '1', '0', null, null, null, null, 'e2aa4f6eb1b74500835e5b98bb63ef10.jpg', 'QQ Photo20160914231343.jpg');
INSERT INTO `sys_file` VALUES ('e86b3e81d3da4706a27432b86728d4f0', 'e86b3e81d3da4706a27432b86728d4f0.docx', '2016-07-26 21:57:23', null, null, '0', '0', null, null, null, null, 'e86b3e81d3da4706a27432b86728d4f0.docx', '客户洞察_0725.docx');
INSERT INTO `sys_file` VALUES ('ec3b4f1048354bc0b1a197d09e89d55c', 'ec3b4f1048354bc0b1a197d09e89d55c.jpg', '2016-07-12 22:34:00', '2f7ec4839b2c42b99c42c84f91b86930', null, '1', '0', null, null, null, null, 'ec3b4f1048354bc0b1a197d09e89d55c.jpg', '9.jpg');
INSERT INTO `sys_file` VALUES ('f0ce8e29e1504487b7a62878496bbed7', 'f0ce8e29e1504487b7a62878496bbed7.jpg', '2016-07-12 22:33:06', null, null, '0', '0', null, null, null, null, 'f0ce8e29e1504487b7a62878496bbed7.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('f1399e1e4cea448785118f17fbf30f11', 'f1399e1e4cea448785118f17fbf30f11.jpg', '2016-09-14 23:14:16', '50b10c3e2dc349638849facceac97c0a', null, '1', '0', null, null, null, null, 'f1399e1e4cea448785118f17fbf30f11.jpg', 'QQ Photo20160914231409.jpg');
INSERT INTO `sys_file` VALUES ('f244ddbdfbf7420d91303c8d8c01840c', 'f244ddbdfbf7420d91303c8d8c01840c.jpg', '2016-09-09 22:50:39', null, null, '0', '0', null, null, null, null, 'f244ddbdfbf7420d91303c8d8c01840c.jpg', '2016072614451378952.jpg');
INSERT INTO `sys_file` VALUES ('f344c3ed4caa4937beea77912442c57f', 'f344c3ed4caa4937beea77912442c57f.jpg', '2016-07-27 10:23:34', null, null, '0', '0', null, null, null, null, 'f344c3ed4caa4937beea77912442c57f.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('f4b7ebfb4c3346609828576fe5ea6454', 'f4b7ebfb4c3346609828576fe5ea6454.jpg', '2016-08-08 22:49:46', null, null, '0', '0', null, null, null, null, 'f4b7ebfb4c3346609828576fe5ea6454.jpg', 'Unnamed QQ Screenshot20160808224942.jpg');
INSERT INTO `sys_file` VALUES ('f7b72da1d4dd4f8cbec6e33680a476a5', 'f7b72da1d4dd4f8cbec6e33680a476a5.jpg', '2016-08-01 22:56:47', null, '0d72f9906ac04332b817e1dd0f651eea', '2', '0', null, null, null, null, 'f7b72da1d4dd4f8cbec6e33680a476a5.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('f9fe384301384084a6240596b41bfeac', 'f9fe384301384084a6240596b41bfeac.jpg', '2016-07-28 22:08:55', '2cb842d49c2d483a974b39b716d9bc9d', null, '1', '0', null, null, null, null, 'f9fe384301384084a6240596b41bfeac.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('fad2eaf3dd534154beb7f3af997dcaaf', 'fad2eaf3dd534154beb7f3af997dcaaf.png', '2016-09-13 23:59:54', '48c7391a0b3a405fbe21bee22d235f92', null, '1', '0', null, null, null, null, 'fad2eaf3dd534154beb7f3af997dcaaf.png', 'genimage.png');
INSERT INTO `sys_file` VALUES ('fb150ecb25844011b3f03e00a3865186', 'fb150ecb25844011b3f03e00a3865186.jpg', '2016-07-12 18:55:32', null, null, '0', '0', null, null, null, null, 'fb150ecb25844011b3f03e00a3865186.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('fca017fd016247198943437542e59142', 'fca017fd016247198943437542e59142.jpg', '2016-08-24 21:14:14', null, null, '0', '0', null, null, null, null, 'fca017fd016247198943437542e59142.jpg', 'ux_shot.jpg');
INSERT INTO `sys_file` VALUES ('fd76f3080c6f4fbcb3c61978fb28435f', 'fd76f3080c6f4fbcb3c61978fb28435f.jpg', '2016-07-27 09:53:34', null, null, '0', '0', null, null, null, null, 'fd76f3080c6f4fbcb3c61978fb28435f.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('fea5958af43b440e83df5a00fcffc002', 'fea5958af43b440e83df5a00fcffc002.jpg', '2016-08-26 21:14:48', 'a835a8ce483d4739b4982eba0e3c6b3c', null, '1', '0', null, null, null, null, 'fea5958af43b440e83df5a00fcffc002.jpg', '2.pic.jpg');

-- ----------------------------
-- Table structure for sys_flow
-- ----------------------------
DROP TABLE IF EXISTS `sys_flow`;
CREATE TABLE `sys_flow` (
  `id` varchar(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `per_code` varchar(255) DEFAULT '0' COMMENT '上层工作流',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_flow
-- ----------------------------

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
-- Table structure for sys_trade_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_trade_info`;
CREATE TABLE `sys_trade_info` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT '0',
  `trade_id` varchar(32) DEFAULT NULL,
  `pay_account` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_trade_info
-- ----------------------------
INSERT INTO `sys_trade_info` VALUES ('5978a6441387480996661a4b7f2a1360', '1F69B3D54C2F95A014EA3CC131A34D5B', '123124', '4', '-1', '0', '5a44417cd97644568526bb4a0c5433d4', null);

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
  `money` double DEFAULT '0' COMMENT '金额',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `sys_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('0d72f9906ac04332b817e1dd0f651eea', '2016-08-01 22:57:54', 'test_1', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, '15250986654', '12@11.com', null, '1', '0', '2016-08-01 22:57:54', '', '0', null, null, null, null, '0', '123', '123', 'as', '321492199023132012', 'f7b72da1d4dd4f8cbec6e33680a476a5', null, null, '0', null, '0');
INSERT INTO `sys_user` VALUES ('11c9570194824c8ea0698b4df490b74e', '2016-08-10 22:53:27', 'test_3', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, '13443334332', '', null, '1', '0', '2016-08-10 22:53:27', null, '0', null, null, null, null, '0', 'ztctest', '', 'ztc', '320938394839383948', '', null, null, '0', null, '0');
INSERT INTO `sys_user` VALUES ('1F69B3D54C2F95A014EA3CC131A34D5B', '2016-06-29 22:22:32', 'test1', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, null, null, null, '2', '0', null, '', '1', null, null, null, null, '0', '', null, 'test', null, null, null, null, null, null, '126247');
INSERT INTO `sys_user` VALUES ('4ee0275972ca4e699570d2f51daa470a', '2016-07-31 13:48:55', 'test3', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, '15250895562', '11@11.com', null, '2', '0', '2016-07-31 13:48:55', '', '1', null, null, null, null, '0', 'test3', 'as123', 'test3', null, null, null, null, '0', null, '0');
INSERT INTO `sys_user` VALUES ('6a092c67f5674730ab1301501b30e8f1', '2016-08-01 23:01:27', 'test4', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, '15250895501', 'qq@qq.com', null, '2', '0', '2016-08-01 23:01:27', '', '1', null, null, null, null, '0', 'as', 'as123', 'test4', '321048199201391425', '', null, null, '0', null, '0');
INSERT INTO `sys_user` VALUES ('7c755b66c53b46c294356f4cbdf62edc', '2016-08-20 22:30:53', 'test_n', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, '13011111111', '807656484@qq.com', null, '1', '0', '2016-08-20 22:30:53', '', '0', null, null, null, null, '0', 'test_n', 'test_n', 'test_n', '110111111111111111', '', null, null, '0', null, '0');
INSERT INTO `sys_user` VALUES ('98cb5bf02e574b52b65bbbebe387cb9f', '2016-08-01 23:03:26', 'test5', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, '15209889900', 'qq@qq.com', null, '2', '0', '2016-08-01 23:03:26', '', '1', null, null, null, null, '0', '12314', 'asd', 'asd', '123098100989123098', '', null, null, '0', null, '0');
INSERT INTO `sys_user` VALUES ('9bd9768ff9404861a5658db901457a69', '2016-07-04 23:26:55', 'test2', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, '123', '123', null, '2', '0', '2016-07-04 23:26:55', '', '1', null, null, null, null, '0', '123', '123', '阿斯顿', null, null, null, null, null, null, '0');
