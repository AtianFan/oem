/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : oem

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-07-31 13:56:23
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
INSERT INTO `order_receive` VALUES ('14111ec869424aac95662719c912e369', 'c065bbd58f174cf589a072c4f5d714eb', '2016-07-26 23:12:42', '9bd9768ff9404861a5658db901457a69', '0', '123', null, null, null, null, '12314');
INSERT INTO `order_receive` VALUES ('1962a388784b48b18eb980e73e8b7bfa', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:47:18', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12');
INSERT INTO `order_receive` VALUES ('19f9ead60206404fae371aa4994931a5', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:47:09', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12');
INSERT INTO `order_receive` VALUES ('2320414e0dce427b85acb0ae7ed004c7', 'c065bbd58f174cf589a072c4f5d714eb', '2016-07-26 23:13:22', '9bd9768ff9404861a5658db901457a69', '0', '123', null, null, null, null, '1');
INSERT INTO `order_receive` VALUES ('25ba5617485d494085a69c26bc1bb175', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:46:59', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12');
INSERT INTO `order_receive` VALUES ('25ede8922da046c0a4e77ac78219cbc6', 'a096e2d819a546a68f93da5e98f20379', '2016-07-19 00:06:29', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '123');
INSERT INTO `order_receive` VALUES ('289ef5ed81184ac68b160697036985df', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:47:09', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12');
INSERT INTO `order_receive` VALUES ('37eabe2282da4170bf2278b0e9c3b535', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:48:14', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '123');
INSERT INTO `order_receive` VALUES ('4d7b686104b8474cb33e7d9940134880', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 23:19:44', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '12345');
INSERT INTO `order_receive` VALUES ('4faccded4b8f4baf8c44cef315733e8f', null, '2016-07-18 23:04:38', null, '0', '123154', null, null, null, null, null);
INSERT INTO `order_receive` VALUES ('5f7be63fa5fd4eee93c79374c4313788', null, '2016-07-18 23:04:14', null, '0', '1231551', null, null, null, null, null);
INSERT INTO `order_receive` VALUES ('613fe27e5a5742328803fc75eab9fdcf', '5d72b27560fd40d2a5502d31e90b54d1', '2016-07-31 12:51:48', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '23');
INSERT INTO `order_receive` VALUES ('74edb6dcafe544019c88b527f5c865a3', 'a096e2d819a546a68f93da5e98f20379', '2016-07-19 00:06:11', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '1234125');
INSERT INTO `order_receive` VALUES ('7be6ddac28d04aa09be67d5569f72259', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 23:19:45', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '12456');
INSERT INTO `order_receive` VALUES ('89f4047cd9a84c7fa796bfceaab7266e', '21b4eb5d6dc54f8d9a70da0ffb1a0bbc', '2016-07-26 23:45:44', '9bd9768ff9404861a5658db901457a69', '0', '123', null, null, null, null, '123');
INSERT INTO `order_receive` VALUES ('8f11db33d88c43689a551b5b1faf511e', null, '2016-07-18 23:06:15', null, '0', '123412', null, null, null, null, '1231241245');
INSERT INTO `order_receive` VALUES ('8fa949a3b32c4e769862eda7e85c9804', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 23:19:56', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', 'asd123', null, null, null, null, '1245');
INSERT INTO `order_receive` VALUES ('908b2c5d5d0c4644ae37f2b5fa6012ee', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:47:18', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12');
INSERT INTO `order_receive` VALUES ('9ae58ccbcb2a4673b104c9b3abbea97a', null, '2016-07-18 23:07:31', null, '0', '123124123', null, null, null, null, '12415');
INSERT INTO `order_receive` VALUES ('9b74464de6974b5abe25a8fbd24c7e0b', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:49:58', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '1');
INSERT INTO `order_receive` VALUES ('a2cf54538d524c5bb0784c4770efa3ba', null, '2016-07-18 23:06:02', null, '0', '123', null, null, null, null, null);
INSERT INTO `order_receive` VALUES ('a35fa281322d46818026aae1f21a04f7', 'a096e2d819a546a68f93da5e98f20379', '2016-07-19 00:07:05', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '123');
INSERT INTO `order_receive` VALUES ('ab8175808b35441f819f7b0f4bc349b8', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:47:24', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12');
INSERT INTO `order_receive` VALUES ('b309ce8f5e5945f3b5e03ebaabcdcd69', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:46:55', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12');
INSERT INTO `order_receive` VALUES ('bf077210636f4c07953fa940c10c3c20', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 23:19:45', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '1235');
INSERT INTO `order_receive` VALUES ('d3e5cc31e0a440debccd3f4c8e6b8e80', '0c4e8c3dc7014610b7ef9b1661b46d76', '2016-07-18 23:19:45', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '123', null, null, null, null, '12456');
INSERT INTO `order_receive` VALUES ('e5261bd13d1d4e39a3c01341ab919ced', 'bac1dca984774309bdf03b0895af7117', '2016-07-27 15:47:24', '1F69B3D54C2F95A014EA3CC131A34D5B', '0', '我要接单', null, null, null, null, '12');

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
INSERT INTO `order_task` VALUES ('016f3f67e3ba493f98e817eab3d9ae5d', 'OR_20160725152357', '2016-07-25 15:23:57', '2016-07-25 15:23:57', '1F69B3D54C2F95A014EA3CC131A34D5B', '阿斯顿23', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '阿斯顿23', '123', '123', null, '12515123q', '123', null, null, '0', '0', '-1', '5d93e117f43440fd827df6a0ff7d0df2', '0');
INSERT INTO `order_task` VALUES ('05ed56e3420845ccb9278719b04506f9', 'OR_20160731111337', '2016-07-31 11:13:37', '2016-07-31 11:13:37', '9bd9768ff9404861a5658db901457a69', 'icon上传1', '0', '0', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, 'icon上传1', 'icon上传', 'icon上传', '1', 'icon上传', '12314', null, null, '0', '0', '-1', '5d93e117f43440fd827df6a0ff7d0df2', '0');
INSERT INTO `order_task` VALUES ('0c4e8c3dc7014610b7ef9b1661b46d76', 'OR_20160712215836', '2016-07-25 21:58:36', '2016-07-25 21:58:36', null, '有那个什么接包方', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, '', '123123', '123123', null, null, null, '8fa949a3b32c4e769862eda7e85c9804', null, '0', '-1', '-1', '5d93e117f43440fd827df6a0ff7d0df2', '0');
INSERT INTO `order_task` VALUES ('0f192c986cb64a00a979cd90eea1ee73', 'OR_20160712223710', '2016-07-12 22:37:11', '2016-07-12 22:37:11', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('100610d19ff74ff8ad5046dc82a003a3', 'OR_20160726220649', '2016-07-26 22:06:49', '2016-07-26 22:06:49', '1F69B3D54C2F95A014EA3CC131A34D5B', '1231231', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '1231231', '12312', '23123', null, null, null, null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('108e28ab4d234ae78e35c3d08982b45c', 'OR_20160718233539', '2016-07-18 23:35:39', '2016-07-18 23:35:39', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '123', '123', null, '12312', '3123123', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('1439346cf79a4b798cfa969d508e3917', 'OR_20160712220626', '2016-07-12 22:06:26', '2016-07-12 22:06:26', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '123123', '123123', null, null, null, null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('14abd3b8a34241b79db6785607e6dac8', 'OR_20160727004041', '2016-07-27 00:40:41', '2016-07-27 00:40:41', '9bd9768ff9404861a5658db901457a69', 'app', '0', '0', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, 'app', 'app', 'app', null, 'app', '123', null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('15af70245589436a93bc2e3459fbef03', 'OR_20160727102439', '2016-07-27 10:24:39', '2016-07-27 10:24:39', '9bd9768ff9404861a5658db901457a69', '123', '0', '1', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, '123', '123', '123', '1', '123', '123', null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('1706c24bcabf4696b2a9a13decbe7ec7', 'OR_20160712220759', '2016-07-12 22:08:22', '2016-07-12 22:08:22', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '123123', '123123', null, '1232123', null, null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('21b4eb5d6dc54f8d9a70da0ffb1a0bbc', 'OR_20160726220845', '2016-07-26 22:08:45', '2016-07-26 22:08:45', '1F69B3D54C2F95A014EA3CC131A34D5B', '1231231', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '1231231', '12312', '23123', null, null, null, null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('22ba26650b8f4b51954754c68dcd35bf', 'OR_20160727004440', '2016-07-27 00:44:40', '2016-07-27 00:44:40', '9bd9768ff9404861a5658db901457a69', '123', '0', '1', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, '123', '123', '123', null, '123', '1', null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('28206489feaa4370b0154f7e41034b55', 'OR_20160712215344', '2016-07-12 21:53:44', '2016-07-12 21:53:44', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', null, null, null, null, null, null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('2cb842d49c2d483a974b39b716d9bc9d', 'OR_20160728220935', '2016-07-28 22:09:35', '2016-07-28 22:09:35', '9bd9768ff9404861a5658db901457a69', '123', '0', '1', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, '123', '12312', '123', null, null, '3123', null, null, '0', '0', 'bac1dca984774309bdf03b0895af7117', '65284a9d73004b938ad1ddba588b29d6', '0');
INSERT INTO `order_task` VALUES ('2f7ec4839b2c42b99c42c84f91b86930', 'OR_20160712230149', '2016-07-12 23:01:49', '2016-07-12 23:01:49', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('30ccb85e556c403ebe0c6c724f0ea441', 'OR_20160712223825', '2016-07-12 22:38:28', '2016-07-12 22:38:28', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('33b1b8652a5f4ab896c48f279e8ce7d9', 'OR_20160726220333', '2016-07-26 22:03:33', '2016-07-26 22:03:33', '1F69B3D54C2F95A014EA3CC131A34D5B', '1231231', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '1231231', '12312', '23123', null, null, null, null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('361c22e1c27b4997a821548cb767abec', 'OR_20160718234117', '2016-07-18 23:41:17', '2016-07-18 23:41:17', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '123', '123', null, '123', '1235', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('3d39fcab6d744b58876dd84e9ced8e68', 'OR_20160712211513', '2016-07-12 21:15:13', '2016-07-12 21:15:13', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '123123', '123123', null, null, null, null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('499e5476ff9e45e6a70067b22e384aa7', 'OR_20160726220304', '2016-07-26 22:03:04', '2016-07-26 22:03:04', '1F69B3D54C2F95A014EA3CC131A34D5B', '1231231', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '1231231', '12312', '23123', null, null, null, null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('4cd614b1b467445ca0dd8f435cc74af6', 'OR_20160726220503', '2016-07-26 22:05:03', '2016-07-26 22:05:03', '1F69B3D54C2F95A014EA3CC131A34D5B', '1231231', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '1231231', '12312', '23123', null, null, null, null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('4e2a3dadadff48d48978191e08ff319b', 'OR_20160712230050', '2016-07-12 23:00:50', '2016-07-12 23:00:50', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('5c16b61d59dc49c68334bd18934e3346', 'OR_20160712214619', '2016-07-12 21:46:19', '2016-07-12 21:46:19', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', null, null, null, null, null, null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('5d2b008bc0cf467b857bc31eca502373', 'OR_20160712224619', '2016-07-12 22:46:19', '2016-07-12 22:46:19', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('5d72b27560fd40d2a5502d31e90b54d1', 'OR_20160731111755', '2016-07-31 11:17:55', '2016-07-31 11:17:55', '9bd9768ff9404861a5658db901457a69', 'icon上传3', '1', '0', '9bd9768ff9404861a5658db901457a69', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, 'icon上传3', 'icon上传', 'icon上传2', '1', 'icon上传', '12314', '613fe27e5a5742328803fc75eab9fdcf', null, '0', '-1', '-1', '409c636360e848939ce977afa803ea29', '0');
INSERT INTO `order_task` VALUES ('63a4cbb895fe4d2593bc2e4a6664b9fb', 'OR_20160731131216', '2016-07-31 13:12:16', '2016-07-31 13:12:16', '1F69B3D54C2F95A014EA3CC131A34D5B', '测试任务类型', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '测试任务类型', '测试任务类型', '测试任务类型', '3', '测试任务类型', '123', null, null, '0', '0', '-1', '17b76cf425e245f591a4e6c7bc7d1ec9', '0');
INSERT INTO `order_task` VALUES ('63b85b5167214cf2ac0e25943062767f', 'OR_20160705234141', '2016-07-05 23:41:41', '2016-07-05 23:41:41', null, '项目名称', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '项目名称', '项目介绍', '项目简介', null, null, null, null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('64cdae31fff84e028e1a7c333a10fa9a', 'OR_20160718233911', '2016-07-18 23:39:11', '2016-07-18 23:39:11', null, '13', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '13', '123', '123', null, '123', '123124125', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('65f16d5494b840fba71df9072e524e36', 'OR_20160725151933', '2016-07-25 15:19:33', '2016-07-25 15:19:33', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '123', '123412125', null, '123', '123214', null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('680b97d73250420b8e46b3afc50dc929', 'OR_20160726215733', '2016-07-26 21:57:33', '2016-07-26 21:57:33', '1F69B3D54C2F95A014EA3CC131A34D5B', '123124', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123124', '123123', '1234123', null, null, null, null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('6822c30d50aa419881d738cdb49c554f', 'OR_20160726215724', '2016-07-26 21:57:24', '2016-07-26 21:57:24', '1F69B3D54C2F95A014EA3CC131A34D5B', '123124', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123124', '123123', '1234123', null, null, null, null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('6adc27d916f84a8b8462332b87de0664', 'OR_20160712224400', '2016-07-12 22:44:00', '2016-07-12 22:44:00', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('7213ba3b49bf4ca5998815dc1e79d9e2', 'OR_20160725152704', '2016-07-25 15:27:04', '2016-07-25 15:27:04', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '124', '21415', null, '123', '1231', null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('80aadfb678cc401e836f14b7d66cbb27', 'OR_20160712223742', '2016-07-12 22:37:42', '2016-07-12 22:37:42', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', '0f2945440d2f4e06a1513dff76d69002', '0');
INSERT INTO `order_task` VALUES ('8eff2f884b074727808307174239bd19', 'OR_20160718233304', '2016-07-18 23:33:04', '2016-07-18 23:33:04', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '124', '121', null, '1231', '2312', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('94ad20b0262a4efd8d5fe02887331340', 'OR_20160718233851', '2016-07-18 23:38:51', '2016-07-18 23:38:51', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '123', '123', null, '2312', '3123', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('98144c8919f847d5adb848c504572c10', 'OR_20160731123353', '2016-07-31 12:33:53', '2016-07-31 12:33:53', '9bd9768ff9404861a5658db901457a69', '子任务1', '0', '0', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, '子任务1', '子任务1', '子任务1', null, null, '123', null, null, '1', '1', '5d72b27560fd40d2a5502d31e90b54d1', '45d3ce2833a64b2db244c9102eddd06f', '0');
INSERT INTO `order_task` VALUES ('98647034cc394e1db9206786d51fbc27', 'OR_20160731120633', '2016-07-31 12:06:33', '2016-07-31 12:06:33', '9bd9768ff9404861a5658db901457a69', 'icon1子任务', '0', '0', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, 'icon1子任务', 'icon1子任务', 'icon1子任务', null, null, '123', null, null, '0', '0', '05ed56e3420845ccb9278719b04506f9', '432029ebbd1d421693a9e755eede38f1', '0');
INSERT INTO `order_task` VALUES ('9aa43c8daebc4b68a65acd82618e20a9', 'OR_20160705233550', '2016-07-05 23:35:50', null, null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', null, null, null, null, null, null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('a096e2d819a546a68f93da5e98f20379', 'OR_20160718234000', '2016-07-18 23:40:00', '2016-07-18 23:40:00', null, '有附件', '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '13', '123', '123', null, '123', '123124125', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('a25bbbdf952d410d889c7ee049f4796b', 'OR_20160712221021', '2016-07-12 22:10:31', '2016-07-12 22:10:31', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '123123', '123123', null, '1232123', '1231', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('a340e133f0fe4ddda160a17de622bd3f', 'OR_20160727004325', '2016-07-27 00:43:25', '2016-07-27 00:43:25', '9bd9768ff9404861a5658db901457a69', 'app1', '0', '0', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, 'app1', 'app1', 'app1', null, 'app1', '123', null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('a76f0f80a90f460db37534efef8a843b', 'OR_20160726220126', '2016-07-26 22:01:26', '2016-07-26 22:01:26', '1F69B3D54C2F95A014EA3CC131A34D5B', '1231231', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '1231231', '12312', '23123', null, null, null, null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('a7a71e6a4eca4ff2866f6ac8e8f4acbf', 'OR_20160726221017', '2016-07-26 22:10:17', '2016-07-26 22:10:17', '1F69B3D54C2F95A014EA3CC131A34D5B', null, '0', '0', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', null, null, null, null, null, null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('a9908b3c3f594a448b8255feff40832e', 'OR_20160712224523', '2016-07-12 22:45:23', '2016-07-12 22:45:23', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('b0373c90420a4607986665303c4d4588', 'OR_20160712211716', '2016-07-12 21:17:16', '2016-07-12 21:17:16', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '123123', '123123', null, null, null, null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('b11ffe643e33445890b2fecf503049c7', 'OR_20160726215610', '2016-07-26 21:56:10', '2016-07-26 21:56:10', '1F69B3D54C2F95A014EA3CC131A34D5B', 'asd23123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, 'asd23123', '123asd123', '123asd123', null, null, null, null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('b5ae088366a140a4baaed1c80a48eba0', 'OR_20160712220640', '2016-07-12 22:06:40', '2016-07-12 22:06:40', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '123123', '123123', null, '1232123', null, null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('b7d4704ad81e49758a829f34cb5b48eb', 'OR_20160731120546', '2016-07-31 12:05:46', '2016-07-31 12:05:46', '9bd9768ff9404861a5658db901457a69', '123', '0', '1', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, '123', '123', '123', null, null, '123', null, null, '0', '0', '05ed56e3420845ccb9278719b04506f9', '9f2a954ec2a94867aa7a04822f96bcc9', '0');
INSERT INTO `order_task` VALUES ('bac1dca984774309bdf03b0895af7117', 'OR_20160727102825', '2016-07-27 10:28:25', '2016-07-27 10:28:25', '9bd9768ff9404861a5658db901457a69', 'icon上传', '0', '0', '9bd9768ff9404861a5658db901457a69', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, 'icon上传', 'icon上传', 'icon上传', '1', 'icon上传', '12314', '9b74464de6974b5abe25a8fbd24c7e0b', null, '0', '1', '-1', '5d93e117f43440fd827df6a0ff7d0df2', '0');
INSERT INTO `order_task` VALUES ('c065bbd58f174cf589a072c4f5d714eb', 'OR_20160726221159', '2016-07-26 22:11:59', '2016-07-26 22:11:59', '1F69B3D54C2F95A014EA3CC131A34D5B', '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1231', '123', null, '23123', null, null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('c399e71c769144f087d320cab1885a88', 'OR_20160712220559', '2016-07-12 22:05:59', '2016-07-12 22:05:59', null, null, '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '', '123123', '123123', null, null, null, null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('c990251059fc4c27841795a3f0f3e9b6', 'OR_20160712224303', '2016-07-12 22:43:03', '2016-07-12 22:43:03', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('c9f5bede11334ffda18f11feee1e540b', 'OR_20160718233303', '2016-07-18 23:33:03', '2016-07-18 23:33:03', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '124', '121', null, '1231', '2312', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('d9aae5d24128490599b562b394bf07ff', 'OR_20160727004327', '2016-07-27 00:43:27', '2016-07-27 00:43:27', '9bd9768ff9404861a5658db901457a69', 'app1', '0', '0', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, 'app1', 'app1', 'app1', null, 'app1', '123', null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('de58d598302849de9c97cd7793700b94', 'OR_20160726215543', '2016-07-26 21:55:43', '2016-07-26 21:55:43', '1F69B3D54C2F95A014EA3CC131A34D5B', 'asd23123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, 'asd23123', '123asd123', '123asd123', null, null, null, null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('e738ea08d1e5412c994ebf56957ef2fe', 'OR_20160712224413', '2016-07-12 22:44:13', '2016-07-12 22:44:13', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('e85212dbc3cf4030b570a05b8bb2ff21', 'OR_20160712223527', '2016-07-12 22:35:31', '2016-07-12 22:35:31', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0');
INSERT INTO `order_task` VALUES ('ea5f52faa2df447d9c45e8a94d38aa6b', 'OR_20160727004542', '2016-07-27 00:45:42', '2016-07-27 00:45:42', '9bd9768ff9404861a5658db901457a69', 'app2', '0', '0', '9bd9768ff9404861a5658db901457a69', null, null, null, null, null, null, 'app2', 'app2', 'app2', '1', 'app2', '123', null, null, '0', '0', '-1', '0f2945440d2f4e06a1513dff76d69002', '0');
INSERT INTO `order_task` VALUES ('f447d04671284aa1a839e598956a7909', 'OR_20160726215639', '2016-07-26 21:56:39', '2016-07-26 21:56:39', '1F69B3D54C2F95A014EA3CC131A34D5B', 'asd23123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, 'asd23123', '123asd123', '123asd123', null, null, null, null, null, '0', '0', '-1', null, '0');
INSERT INTO `order_task` VALUES ('f93f1e20e7b64bbeb8f3f9aed9626cf2', 'OR_20160712223424', '2016-07-12 22:34:24', '2016-07-12 22:34:24', null, '123', '0', '1', '1F69B3D54C2F95A014EA3CC131A34D5B', null, null, null, null, null, null, '123', '1234', '12345', null, '12345678', '12', null, null, '0', null, '-1', null, '0');

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
INSERT INTO `sys_file` VALUES ('0f2945440d2f4e06a1513dff76d69002', '0f2945440d2f4e06a1513dff76d69002.jpg', '2016-07-27 09:44:25', null, null, '0', '0', null, null, null, null, '0f2945440d2f4e06a1513dff76d69002.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('111034426fa44f1a9122ab6048493c20', '111034426fa44f1a9122ab6048493c20.jpg', '2016-07-18 23:39:03', 'a096e2d819a546a68f93da5e98f20379', null, '1', '0', null, null, null, null, '111034426fa44f1a9122ab6048493c20.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('17b76cf425e245f591a4e6c7bc7d1ec9', '17b76cf425e245f591a4e6c7bc7d1ec9.jpg', '2016-07-31 13:12:08', null, null, '0', '0', null, null, null, null, '17b76cf425e245f591a4e6c7bc7d1ec9.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('20227c752b524844862026dbd992e2cf', '20227c752b524844862026dbd992e2cf.jpg', '2016-07-31 10:43:55', null, null, '0', '0', null, null, null, null, '20227c752b524844862026dbd992e2cf.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('221e9d2b8a8747448c31db7faa2e650f', '221e9d2b8a8747448c31db7faa2e650f.jpg', '2016-07-27 09:51:37', null, null, '0', '0', null, null, null, null, '221e9d2b8a8747448c31db7faa2e650f.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('28f83d9c9da64acb92a2066d28118ca1', '28f83d9c9da64acb92a2066d28118ca1.jpg', '2016-07-18 23:39:53', 'a096e2d819a546a68f93da5e98f20379', null, '1', '0', null, null, null, null, '28f83d9c9da64acb92a2066d28118ca1.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('3b0f1a33f25044e89d91a25c4e96b389', '3b0f1a33f25044e89d91a25c4e96b389.jpg', '2016-07-18 23:40:57', null, null, '0', '0', null, null, null, null, '3b0f1a33f25044e89d91a25c4e96b389.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('3b7353409ac747dba4ad294f0587026d', '3b7353409ac747dba4ad294f0587026d.docx', '2016-07-27 10:24:36', '15af70245589436a93bc2e3459fbef03', null, '1', '0', null, null, null, null, '3b7353409ac747dba4ad294f0587026d.docx', '代工项目接口设计和数据字典_20160711.docx');
INSERT INTO `sys_file` VALUES ('3baf89815743405ba003d3a1d654e07c', '3baf89815743405ba003d3a1d654e07c.jpg', '2016-07-12 18:53:51', null, null, '0', '0', null, null, null, null, '3baf89815743405ba003d3a1d654e07c.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('3f593252af58407a9800865afa1325c7', '3f593252af58407a9800865afa1325c7.docx', '2016-07-27 10:28:21', 'bac1dca984774309bdf03b0895af7117', null, '1', '0', null, null, null, null, '3f593252af58407a9800865afa1325c7.docx', '�?��确认_20160711.docx');
INSERT INTO `sys_file` VALUES ('409c636360e848939ce977afa803ea29', '409c636360e848939ce977afa803ea29.jpg', '2016-07-31 11:17:54', null, null, '0', '0', null, null, null, null, '409c636360e848939ce977afa803ea29.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('42d016c42e464b40bc9de5af480a1dbf', '42d016c42e464b40bc9de5af480a1dbf.jpg', '2016-07-31 10:36:36', null, null, '0', '0', null, null, null, null, '42d016c42e464b40bc9de5af480a1dbf.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('432029ebbd1d421693a9e755eede38f1', '432029ebbd1d421693a9e755eede38f1.jpg', '2016-07-31 12:06:20', null, null, '0', '0', null, null, null, null, '432029ebbd1d421693a9e755eede38f1.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('45d3ce2833a64b2db244c9102eddd06f', '45d3ce2833a64b2db244c9102eddd06f.jpg', '2016-07-31 12:33:42', null, null, '0', '0', null, null, null, null, '45d3ce2833a64b2db244c9102eddd06f.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('53a0629a213847e2af67bc9d56af408f', '53a0629a213847e2af67bc9d56af408f.docx', '2016-07-26 22:11:18', null, null, '0', '0', null, null, null, null, '53a0629a213847e2af67bc9d56af408f.docx', '营销管理系统_0726.docx');
INSERT INTO `sys_file` VALUES ('555326d7ec2240d790cb016d1dfa6713', '555326d7ec2240d790cb016d1dfa6713.jpg', '2016-07-27 09:54:14', null, null, '0', '0', null, null, null, null, '555326d7ec2240d790cb016d1dfa6713.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('56c4755038524c2c9edb86a6c98d6658', '56c4755038524c2c9edb86a6c98d6658.jpg', '2016-07-27 09:52:56', null, null, '0', '0', null, null, null, null, '56c4755038524c2c9edb86a6c98d6658.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('5979f2059900413ab95688d2fe4454f5', '5979f2059900413ab95688d2fe4454f5.jpg', '2016-07-27 22:32:33', null, null, '0', '0', null, null, null, null, '5979f2059900413ab95688d2fe4454f5.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('59a960a66dba4e67bbee71869919c8e4', '59a960a66dba4e67bbee71869919c8e4.jpg', '2016-07-31 10:39:19', null, null, '0', '0', null, null, null, null, '59a960a66dba4e67bbee71869919c8e4.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('5d93e117f43440fd827df6a0ff7d0df2', '5d93e117f43440fd827df6a0ff7d0df2.jpg', '2016-07-27 10:27:49', null, null, '0', '0', null, null, null, null, '5d93e117f43440fd827df6a0ff7d0df2.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('65284a9d73004b938ad1ddba588b29d6', '65284a9d73004b938ad1ddba588b29d6.jpg', '2016-07-28 22:08:46', null, null, '0', '0', null, null, null, null, '65284a9d73004b938ad1ddba588b29d6.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('691c21d080864a7c871c63c486efefea', '691c21d080864a7c871c63c486efefea.jpg', '2016-07-31 11:17:50', '5d72b27560fd40d2a5502d31e90b54d1', null, '1', '0', null, null, null, null, '691c21d080864a7c871c63c486efefea.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('6a6b24dbcde2404ea0edcc3f06dacaa2', '6a6b24dbcde2404ea0edcc3f06dacaa2.jpg', '2016-07-12 18:54:22', null, null, '0', '0', null, null, null, null, '6a6b24dbcde2404ea0edcc3f06dacaa2.jpg', '10.jpg');
INSERT INTO `sys_file` VALUES ('6bdbf973aca8490cb0b00ee1d63d2f47', '6bdbf973aca8490cb0b00ee1d63d2f47.jpg', '2016-07-18 23:29:16', null, null, '0', '0', null, null, null, null, '6bdbf973aca8490cb0b00ee1d63d2f47.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('714de787333b4a4696607fc3339eec71', '714de787333b4a4696607fc3339eec71.docx', '2016-07-27 10:28:17', 'bac1dca984774309bdf03b0895af7117', null, '1', '0', null, null, null, null, '714de787333b4a4696607fc3339eec71.docx', '代工项目接口设计和数据字典_20160711.docx');
INSERT INTO `sys_file` VALUES ('74b8958cf98947d09a5f50ecc9e05cce', '74b8958cf98947d09a5f50ecc9e05cce.jpg', '2016-07-12 22:12:02', null, null, '0', '0', null, null, null, null, '74b8958cf98947d09a5f50ecc9e05cce.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('74de53ec51524f7eabdcd7dc13ecbfb8', '74de53ec51524f7eabdcd7dc13ecbfb8.jpg', '2016-07-27 09:43:25', null, null, '0', '0', null, null, null, null, '74de53ec51524f7eabdcd7dc13ecbfb8.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('7c511043b3ae4120abe346e65da42d11', '7c511043b3ae4120abe346e65da42d11.jpg', '2016-07-12 22:32:22', null, null, '0', '0', null, null, null, null, '7c511043b3ae4120abe346e65da42d11.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('7c962b6989a14d3f89a1821aaef271ec', '7c962b6989a14d3f89a1821aaef271ec.jpg', '2016-07-18 23:30:41', '8eff2f884b074727808307174239bd19', null, '1', '0', null, null, null, null, '7c962b6989a14d3f89a1821aaef271ec.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('7dce16a993334af991ad7ada14364986', '7dce16a993334af991ad7ada14364986.jpg', '2016-07-12 18:52:09', null, null, '0', '0', null, null, null, null, '7dce16a993334af991ad7ada14364986.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('7fd7e56194b84b3db62a6b8372a78d23', '7fd7e56194b84b3db62a6b8372a78d23.jpg', '2016-07-12 18:54:57', null, null, '0', '0', null, null, null, null, '7fd7e56194b84b3db62a6b8372a78d23.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('7ff2e59bec554c77a639af2d12eddd9c', '7ff2e59bec554c77a639af2d12eddd9c.jpg', '2016-07-27 09:55:39', null, null, '0', '0', null, null, null, null, '7ff2e59bec554c77a639af2d12eddd9c.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('82514284d8b24284aaa872a714d3c76a', '82514284d8b24284aaa872a714d3c76a.jpg', '2016-07-18 23:40:56', null, null, '0', '0', null, null, null, null, '82514284d8b24284aaa872a714d3c76a.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('8497f3da03364dc4a3e52961381295f5', '8497f3da03364dc4a3e52961381295f5.docx', '2016-07-26 22:10:11', null, null, '0', '0', null, null, null, null, '8497f3da03364dc4a3e52961381295f5.docx', '营销管理系统_0726.docx');
INSERT INTO `sys_file` VALUES ('87ba2c0853ac4edda2f5dd1faf7f91dc', '87ba2c0853ac4edda2f5dd1faf7f91dc.docx', '2016-07-26 21:55:01', null, null, '0', '0', null, null, null, null, '87ba2c0853ac4edda2f5dd1faf7f91dc.docx', '客户洞察_0725.docx');
INSERT INTO `sys_file` VALUES ('8c62d2e6886442eeb4e030a2e9855398', '8c62d2e6886442eeb4e030a2e9855398.jpg', '2016-07-12 22:33:43', '2f7ec4839b2c42b99c42c84f91b86930', null, '1', '0', null, null, null, null, '8c62d2e6886442eeb4e030a2e9855398.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('9a701d4581064c1dae34c4cf911c11e1', '9a701d4581064c1dae34c4cf911c11e1.jpg', '2016-07-12 22:11:51', null, null, '0', '0', null, null, null, null, '9a701d4581064c1dae34c4cf911c11e1.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('9f2a954ec2a94867aa7a04822f96bcc9', '9f2a954ec2a94867aa7a04822f96bcc9.jpg', '2016-07-31 12:05:42', null, null, '0', '0', null, null, null, null, '9f2a954ec2a94867aa7a04822f96bcc9.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('a081375030a64e108c1bffeb19ad2b1d', 'a081375030a64e108c1bffeb19ad2b1d.jpg', '2016-07-27 09:57:00', null, null, '0', '0', null, null, null, null, 'a081375030a64e108c1bffeb19ad2b1d.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('a10df7b6898743c9a920375bd3586760', 'a10df7b6898743c9a920375bd3586760.jpg', '2016-07-18 23:36:42', '94ad20b0262a4efd8d5fe02887331340', null, '1', '0', null, null, null, null, 'a10df7b6898743c9a920375bd3586760.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('a392f8337482478cacefa6a1b8fe55ff', 'a392f8337482478cacefa6a1b8fe55ff.jpg', '2016-07-27 09:46:50', null, null, '0', '0', null, null, null, null, 'a392f8337482478cacefa6a1b8fe55ff.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('b157a60edabd48aabc1ef24f8cf39728', 'b157a60edabd48aabc1ef24f8cf39728.jpg', '2016-07-12 18:37:46', null, null, '0', '0', null, null, null, null, 'b157a60edabd48aabc1ef24f8cf39728.jpg', '9.jpg');
INSERT INTO `sys_file` VALUES ('b2c13efb71884f1d8dd335ac6feda94d', 'b2c13efb71884f1d8dd335ac6feda94d.jpg', '2016-07-31 13:11:46', null, null, '0', '0', null, null, null, null, 'b2c13efb71884f1d8dd335ac6feda94d.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('b373cae217ad46e4b97852710d2cb2a7', 'b373cae217ad46e4b97852710d2cb2a7.docx', '2016-07-26 22:00:40', null, null, '0', '0', null, null, null, null, 'b373cae217ad46e4b97852710d2cb2a7.docx', '营销管理系统_0726.docx');
INSERT INTO `sys_file` VALUES ('b383ecf83e074b98bd10ad7762061b80', 'b383ecf83e074b98bd10ad7762061b80.jpg', '2016-07-12 22:31:55', null, null, '0', '0', null, null, null, null, 'b383ecf83e074b98bd10ad7762061b80.jpg', '2.jpg');
INSERT INTO `sys_file` VALUES ('bafef29283094fdaa9e320de4451af1e', 'bafef29283094fdaa9e320de4451af1e.jpg', '2016-07-27 10:03:16', null, null, '0', '0', null, null, null, null, 'bafef29283094fdaa9e320de4451af1e.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('bf6dec230abc457d992fe16b3eacbda0', 'bf6dec230abc457d992fe16b3eacbda0.jpg', '2016-07-31 13:48:23', null, '4ee0275972ca4e699570d2f51daa470a', '2', '0', null, null, null, null, 'bf6dec230abc457d992fe16b3eacbda0.jpg', 'u=3425851328,2681317699&fm=21&gp=0.jpg');
INSERT INTO `sys_file` VALUES ('bfffd7c249e84ec3aba485f2f4c8cf01', 'bfffd7c249e84ec3aba485f2f4c8cf01.docx', '2016-07-26 22:11:58', 'c065bbd58f174cf589a072c4f5d714eb', null, '1', '0', null, null, null, null, 'bfffd7c249e84ec3aba485f2f4c8cf01.docx', '客户洞察_0725.docx');
INSERT INTO `sys_file` VALUES ('ceb065618e6e431ba0d84e4d5277fe22', 'ceb065618e6e431ba0d84e4d5277fe22.jpg', '2016-07-27 09:45:39', null, null, '0', '0', null, null, null, null, 'ceb065618e6e431ba0d84e4d5277fe22.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('d24c29bca87c484db4d7aa3c996d8dda', 'd24c29bca87c484db4d7aa3c996d8dda.jpg', '2016-07-27 10:24:15', null, null, '0', '0', null, null, null, null, 'd24c29bca87c484db4d7aa3c996d8dda.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('d5c8d72dada5469bb61eebedc1b0ecdf', 'd5c8d72dada5469bb61eebedc1b0ecdf.jpg', '2016-07-27 09:51:14', null, null, '0', '0', null, null, null, null, 'd5c8d72dada5469bb61eebedc1b0ecdf.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('d7ab37f0ad06455aa7fd2a00bc6555ff', 'd7ab37f0ad06455aa7fd2a00bc6555ff.jpg', '2016-07-27 10:24:33', '15af70245589436a93bc2e3459fbef03', null, '1', '0', null, null, null, null, 'd7ab37f0ad06455aa7fd2a00bc6555ff.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('da324a32c7ae40ec836175580f122e63', 'da324a32c7ae40ec836175580f122e63.jpg', '2016-07-18 23:40:57', '361c22e1c27b4997a821548cb767abec', null, '1', '0', null, null, null, null, 'da324a32c7ae40ec836175580f122e63.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('da3f9fdf67654ee3955f0dc4971a69ab', 'da3f9fdf67654ee3955f0dc4971a69ab.jpg', '2016-07-12 18:53:47', null, null, '0', '0', null, null, null, null, 'da3f9fdf67654ee3955f0dc4971a69ab.jpg', '1.jpg');
INSERT INTO `sys_file` VALUES ('dc953823bbd94e63951cc93e934d2487', 'dc953823bbd94e63951cc93e934d2487.docx', '2016-07-26 21:55:41', null, null, '0', '0', null, null, null, null, 'dc953823bbd94e63951cc93e934d2487.docx', '营销管理系统_0726.docx');
INSERT INTO `sys_file` VALUES ('e86b3e81d3da4706a27432b86728d4f0', 'e86b3e81d3da4706a27432b86728d4f0.docx', '2016-07-26 21:57:23', null, null, '0', '0', null, null, null, null, 'e86b3e81d3da4706a27432b86728d4f0.docx', '客户洞察_0725.docx');
INSERT INTO `sys_file` VALUES ('ec3b4f1048354bc0b1a197d09e89d55c', 'ec3b4f1048354bc0b1a197d09e89d55c.jpg', '2016-07-12 22:34:00', '2f7ec4839b2c42b99c42c84f91b86930', null, '1', '0', null, null, null, null, 'ec3b4f1048354bc0b1a197d09e89d55c.jpg', '9.jpg');
INSERT INTO `sys_file` VALUES ('f0ce8e29e1504487b7a62878496bbed7', 'f0ce8e29e1504487b7a62878496bbed7.jpg', '2016-07-12 22:33:06', null, null, '0', '0', null, null, null, null, 'f0ce8e29e1504487b7a62878496bbed7.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('f344c3ed4caa4937beea77912442c57f', 'f344c3ed4caa4937beea77912442c57f.jpg', '2016-07-27 10:23:34', null, null, '0', '0', null, null, null, null, 'f344c3ed4caa4937beea77912442c57f.jpg', 'QQ图片20160618161232.jpg');
INSERT INTO `sys_file` VALUES ('f9fe384301384084a6240596b41bfeac', 'f9fe384301384084a6240596b41bfeac.jpg', '2016-07-28 22:08:55', '2cb842d49c2d483a974b39b716d9bc9d', null, '1', '0', null, null, null, null, 'f9fe384301384084a6240596b41bfeac.jpg', '2016_innovation_day_video.jpg');
INSERT INTO `sys_file` VALUES ('fb150ecb25844011b3f03e00a3865186', 'fb150ecb25844011b3f03e00a3865186.jpg', '2016-07-12 18:55:32', null, null, '0', '0', null, null, null, null, 'fb150ecb25844011b3f03e00a3865186.jpg', '5.jpg');
INSERT INTO `sys_file` VALUES ('fd76f3080c6f4fbcb3c61978fb28435f', 'fd76f3080c6f4fbcb3c61978fb28435f.jpg', '2016-07-27 09:53:34', null, null, '0', '0', null, null, null, null, 'fd76f3080c6f4fbcb3c61978fb28435f.jpg', 'QQ图片20160618161232.jpg');

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
INSERT INTO `sys_user` VALUES ('1F69B3D54C2F95A014EA3CC131A34D5B', '2016-06-29 22:22:32', 'test', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, null, null, null, '1', '0', null, '', '0', null, null, null, null, '0', '', null, 'test1', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('4ee0275972ca4e699570d2f51daa470a', '2016-07-31 13:48:55', 'test3', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, '15250895562', '11@11.com', null, '1', '0', '2016-07-31 13:48:55', null, '0', null, null, null, null, '0', 'test3', 'as123', 'test3', null, null, null, null, '0', null);
INSERT INTO `sys_user` VALUES ('9bd9768ff9404861a5658db901457a69', '2016-07-04 23:26:55', 'test1', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, '123', '123', null, '1', '0', '2016-07-04 23:26:55', '', '0', null, null, null, null, '0', '123', '123', '阿斯顿', null, null, null, null, null, null);
