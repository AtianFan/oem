-- 去除无效数据
update order_task set del_flag=1 where order_name='';
update order_task set del_flag=1 where name='';

-- 20160803 添加字段
alter table sys_confirm add is_current TINYINT(1) default 0 COMMENT "是否当前生效";
alter table sys_confirm add create_date datetime COMMENT "创建时间";
alter table sys_confirm add taker TINYINT(1) DEFAULT 0 COMMENT "发起方是1手或者2手";
alter table sys_confirm add order_status TINYINT(2) DEFAULT 0 COMMENT "任务状态";
alter table sys_confirm add result TINYINT(2) DEFAULT 0	 COMMENT "最终状态";
alter table order_receive add column receive_status tinyint(2) DEFAULT 0 COMMENT "任务接受状态";
-- 20160817 增加任务字段并且增加表
alter table order_task add column orinin_money double DEFAULT 0 COMMENT "原始金额";

DROP TABLE IF EXISTS `order_receive_info`;
CREATE TABLE `order_receive_info` (
  `id` varchar(32) NOT NULL,
  `receiver_id` varchar(32) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  `del_flag` tinyint(2) DEFAULT '0',
  `money` double DEFAULT NULL,
  `is_current` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 添加任务的父级id
alter table order_receive_info add COLUMN parent_order_id VARCHAR(32) not null;
alter table order_receive_info add COLUMN sys_confirm_id VARCHAR(32) not NULL;

--
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
	`pay_type` tinyint Default null,
	`remark` varchar(256) default null,
	`account` varchar(256) default null,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table sys_user add column money Double default 0 comment '金额'

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


-- 添加user只读信息 20161114
alter table sys_user add column is_reader_only tinyint(1) default 0 comment "是否只读";
alter table order_task add column pay_type tinyint(2) default 0 comment "支付类型包含线上线下";


-- 只读账号
alter table sys_user add column `account_readonly` varchar(255) DEFAULT NULL comment "只读账号";
alter table sys_user add column `lock_money` int default 0 COMMENT "锁定金额";
alter table sys_user add column `readonly_flag` tinyint(1) default 0;

alter table order_type modify COLUMN `id` TINYINT(2)  default null comment ''