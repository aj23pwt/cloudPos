﻿/*
MySQL Backup
Source Server Version: 5.5.28
Source Database: portal_pos_pms
Date: 2015/12/14 15:14:11
*/
/*
----each----:[hotel][#hotel.server_name]
*/
-- ALTER TABLE hotel ADD server_name VARCHAR(200) DEFAULT '';


/*
----each----:[hotel][#hotel.area1]
*/
-- ALTER TABLE hotel ADD area1 VARCHAR(200) DEFAULT '';

/*
----each----:[hotel][#hotel.area2]
*/
-- ALTER TABLE hotel ADD area2 VARCHAR(200) DEFAULT '';

SET FOREIGN_KEY_CHECKS=0;
 -- 生成新餐饮预订、开台、账单 单号生成规则配置
delete from sys_extra_id where code in ('POSRSV','POSMASTER','POSBILL');
insert into `sys_extra_id` (`hotel_group_id`, `hotel_id`,`code`, `descript`, `descript_en`, `pointer_type`, `prefix1`, `prefix2`, `prefix3`, `pos_cur`, `pos_begin`, `pos_interval`, `pos_max`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) 
values('2','-1','POSRSV','餐饮预订号','Pos.Rsv','DAY','','','','1','1','1','10000','F','0','ADMIN','2015-04-01 09:57:17','ADMIN','2015-04-07 16:04:33');
insert into `sys_extra_id` (`hotel_group_id`, `hotel_id`,`code`, `descript`, `descript_en`, `pointer_type`, `prefix1`, `prefix2`, `prefix3`, `pos_cur`, `pos_begin`, `pos_interval`, `pos_max`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) 
SELECT t2.hotel_group_id,t2.id,t1.CODE,t1.descript,t1.descript_en,t1.pointer_type,t1.prefix1,t1.prefix2,t1.prefix3,t1.pos_cur,t1.pos_begin,t1.pos_interval,t1.pos_max,t1.is_halt,t1.list_order,t1.create_user,t1.create_datetime,t1.modify_user,t1.modify_datetime
FROM sys_extra_id t1,hotel t2
WHERE t1.hotel_id=-1;
DELETE FROM sys_extra_id WHERE hotel_id=-1;
insert into `sys_extra_id` (`hotel_group_id`, `hotel_id`,`code`, `descript`, `descript_en`, `pointer_type`, `prefix1`, `prefix2`, `prefix3`, `pos_cur`, `pos_begin`, `pos_interval`, `pos_max`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) 
values('2','-1','POSMASTER','餐饮主单号','Pos.Master','DAY','','','','1','1','1','10000','F','0','ADMIN','2015-04-01 09:57:17','ADMIN','2015-04-07 16:04:33');
insert into `sys_extra_id` (`hotel_group_id`, `hotel_id`,`code`, `descript`, `descript_en`, `pointer_type`, `prefix1`, `prefix2`, `prefix3`, `pos_cur`, `pos_begin`, `pos_interval`, `pos_max`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) 
SELECT t2.hotel_group_id,t2.id,t1.CODE,t1.descript,t1.descript_en,t1.pointer_type,t1.prefix1,t1.prefix2,t1.prefix3,t1.pos_cur,t1.pos_begin,t1.pos_interval,t1.pos_max,t1.is_halt,t1.list_order,t1.create_user,t1.create_datetime,t1.modify_user,t1.modify_datetime
FROM sys_extra_id t1,hotel t2
WHERE t1.hotel_id=-1;
DELETE FROM sys_extra_id WHERE hotel_id=-1;
insert into `sys_extra_id` (`hotel_group_id`, `hotel_id`,`code`, `descript`, `descript_en`, `pointer_type`, `prefix1`, `prefix2`, `prefix3`, `pos_cur`, `pos_begin`, `pos_interval`, `pos_max`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) 
values('2','-1','POSBILL','餐饮账单号','Pos.Bill','DAY','','','','1','1','1','10000','F','0','ADMIN','2015-04-01 09:57:17','ADMIN','2015-04-07 16:04:33');
insert into `sys_extra_id` (`hotel_group_id`, `hotel_id`,`code`, `descript`, `descript_en`, `pointer_type`, `prefix1`, `prefix2`, `prefix3`, `pos_cur`, `pos_begin`, `pos_interval`, `pos_max`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) 
SELECT t2.hotel_group_id,t2.id,t1.CODE,t1.descript,t1.descript_en,t1.pointer_type,t1.prefix1,t1.prefix2,t1.prefix3,t1.pos_cur,t1.pos_begin,t1.pos_interval,t1.pos_max,t1.is_halt,t1.list_order,t1.create_user,t1.create_datetime,t1.modify_user,t1.modify_datetime
FROM sys_extra_id t1,hotel t2
WHERE t1.hotel_id=-1;
DELETE FROM sys_extra_id WHERE hotel_id=-1;

-- ----------------------------
--  Table structure for `pos_access`
-- ----------------------------
DROP TABLE IF EXISTS `pos_access`;
CREATE TABLE `pos_access` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL COMMENT '营业日期',
  `plu_code` varchar(10) NOT NULL COMMENT '菜项code',
  `plu_unit` varchar(10) NOT NULL COMMENT '菜项单位',
  `number` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '可用数量',
  `number1` decimal(12,2) DEFAULT '0.00' COMMENT '已用数量',
  `number2` decimal(12,2) DEFAULT '0.00' COMMENT '调整数量',
  `payout` char(1) DEFAULT NULL COMMENT '销售',
  `is_group` char(2) DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) DEFAULT NULL,
  `code_type` varchar(30) DEFAULT NULL,
  `is_halt` char(2) DEFAULT 'F' COMMENT 'T=yes F=no',
  `list_order` mediumint(9) DEFAULT '0' COMMENT '缺省值0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`biz_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='沽清设置表';

-- ----------------------------
--  Table structure for `pos_accnt_sync`
-- ----------------------------
DROP TABLE IF EXISTS `pos_accnt_sync`;
CREATE TABLE `pos_accnt_sync` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `entity_name` varchar(50) DEFAULT '' COMMENT '实体名',
  `accnt` varchar(14) DEFAULT '' COMMENT '主单号',
  `res_accnt` varchar(13) DEFAULT '' COMMENT '预订单号',
  `type` varchar(10) DEFAULT NULL COMMENT '同步类型',
  `is_sync` varchar(2) DEFAULT '' COMMENT '是否已经同步',
  `is_halt` varchar(2) DEFAULT 'F' COMMENT '是否有效',
  `create_user` varchar(20) NOT NULL COMMENT '创建用户',
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL COMMENT '修改用户',
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_win_name` (`hotel_group_id`,`hotel_id`,`accnt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='餐饮账务云端同步';

-- ----------------------------
--  Table structure for `pos_account`
-- ----------------------------
DROP TABLE IF EXISTS `pos_account`;
CREATE TABLE `pos_account` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `accnt` char(13) NOT NULL DEFAULT '' COMMENT '单号',
  `number` int(11) DEFAULT '1' COMMENT '1表示消费，2表示付款',
  `inumber` int(11) DEFAULT '1' COMMENT '序号',
  `subid` int(11) DEFAULT '0',
  `shift` char(1) DEFAULT '' COMMENT '班次',
  `pccode` varchar(10) DEFAULT NULL COMMENT '营业点',
  `tableno` varchar(10) DEFAULT NULL COMMENT '桌号',
  `empid` varchar(10) DEFAULT '' COMMENT '工号',
  `biz_date` datetime DEFAULT NULL COMMENT '营业日期',
  `logdate` datetime DEFAULT NULL COMMENT '物理日期',
  `paycode` varchar(5) NOT NULL DEFAULT '' COMMENT ' 付款代码',
  `descript` varchar(80) DEFAULT '' COMMENT ' 付款名称',
  `descript_en` varchar(80) DEFAULT NULL COMMENT ' 英文名',
  `amount` decimal(12,2) DEFAULT '0.00',
  `credit` decimal(12,2) NOT NULL DEFAULT '0.00',
  `bal` decimal(12,2) DEFAULT '0.00',
  `billno` char(11) DEFAULT '',
  `foliono` varchar(20) DEFAULT '',
  `orderno` varchar(20) DEFAULT '',
  `sign` varchar(20) DEFAULT '00000000000000000000',
  `flag` varchar(20) DEFAULT '',
  `sta` char(1) NOT NULL DEFAULT '',
  `reason` char(3) DEFAULT '',
  `info1` varchar(50) DEFAULT '',
  `info2` varchar(50) DEFAULT '',
  `bank` varchar(20) DEFAULT '',
  `cardno` varchar(20) DEFAULT '' COMMENT '银行卡号、会员卡号',
  `dtl_accnt` varchar(20) DEFAULT '',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`accnt`),
  KEY `hotel_group_id_2` (`hotel_group_id`,`hotel_id`,`accnt`,`pccode`),
  KEY `hotel_group_id_3` (`hotel_group_id`,`hotel_id`,`accnt`,`shift`,`pccode`,`tableno`,`biz_date`),
  KEY `hotel_group_id_4` (`hotel_group_id`,`hotel_id`,`biz_date`,`sta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='餐饮账务表';

-- ----------------------------
--  Table structure for `pos_account_history`
-- ----------------------------
DROP TABLE IF EXISTS `pos_account_history`;
CREATE TABLE `pos_account_history` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL,
  `accnt` char(13) NOT NULL DEFAULT '' COMMENT '单号',
  `number` int(11) DEFAULT '1' COMMENT '1表示消费，2表示付款',
  `inumber` int(11) DEFAULT '1' COMMENT '序号',
  `subid` int(11) DEFAULT '0',
  `shift` char(1) DEFAULT '' COMMENT '班次',
  `pccode` varchar(10) DEFAULT NULL COMMENT '营业点',
  `tableno` varchar(10) DEFAULT NULL COMMENT '桌号',
  `empid` varchar(10) DEFAULT '' COMMENT '工号',
  `biz_date` datetime DEFAULT NULL COMMENT '营业日期',
  `logdate` datetime DEFAULT NULL COMMENT '物理日期',
  `paycode` varchar(5) NOT NULL DEFAULT '' COMMENT ' 付款代码',
  `descript` varchar(80) DEFAULT '' COMMENT ' 付款名称',
  `descript_en` varchar(80) DEFAULT NULL COMMENT ' 英文名',
  `amount` decimal(12,2) DEFAULT '0.00',
  `credit` decimal(12,2) NOT NULL DEFAULT '0.00',
  `bal` decimal(12,2) DEFAULT '0.00',
  `billno` char(11) DEFAULT '',
  `foliono` varchar(20) DEFAULT '',
  `orderno` varchar(20) DEFAULT '',
  `sign` varchar(20) DEFAULT '00000000000000000000',
  `flag` varchar(20) DEFAULT '',
  `sta` char(1) NOT NULL DEFAULT '',
  `reason` char(3) DEFAULT '',
  `info1` varchar(50) DEFAULT '',
  `info2` varchar(50) DEFAULT '',
  `bank` varchar(20) DEFAULT '',
  `cardno` varchar(20) DEFAULT '' COMMENT '银行卡号、会员卡号',
  `dtl_accnt` varchar(20) DEFAULT '',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  KEY `hotel_group_id_2` (`hotel_group_id`,`hotel_id`,`accnt`,`pccode`,`biz_date`,`sta`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`biz_date`,`sta`) USING BTREE,
  KEY `hotel_group_id_3` (`hotel_group_id`,`hotel_id`,`pccode`,`sta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='餐饮账务历史表';

-- ----------------------------
--  Table structure for `pos_audit_master`
-- ----------------------------
DROP TABLE IF EXISTS `pos_audit_master`;
CREATE TABLE `pos_audit_master` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL COMMENT '营业日期',
  `type` varchar(1) NOT NULL DEFAULT '1',
  `accnt` char(14) NOT NULL DEFAULT '',
  `userCode` varchar(10) DEFAULT '' COMMENT '工号',
  `shift` char(1) NOT NULL DEFAULT '' COMMENT '班别',
  `pccode` varchar(10) NOT NULL DEFAULT '' COMMENT '营业点代码 ',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '营业点描叙 ',
  `code` varchar(10) DEFAULT '' COMMENT '报表数据项',
  `descript` varchar(20) DEFAULT '' COMMENT '报表数据项名称',
  `amount0` decimal(12,2) DEFAULT '0.00' COMMENT '针对明细统计数',
  `amount1` decimal(12,2) DEFAULT '0.00' COMMENT '下同',
  `amount2` decimal(12,2) DEFAULT '0.00',
  `amount3` decimal(12,2) DEFAULT '0.00',
  `amount` decimal(12,2) DEFAULT '0.00',
  `ent_ft` decimal(12,2) DEFAULT '0.00',
  `dsc_ft` decimal(12,2) DEFAULT '0.00',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`biz_date`,`type`,`accnt`,`shift`,`pccode`),
  KEY `hotel_group_id_2` (`hotel_group_id`,`hotel_id`,`biz_date`),
  KEY `hotel_group_id_3` (`hotel_group_id`,`hotel_id`,`biz_date`,`type`,`shift`,`pccode`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='餐饮夜审主单表';

-- ----------------------------
--  Table structure for `pos_audit_report`
-- ----------------------------
DROP TABLE IF EXISTS `pos_audit_report`;
CREATE TABLE `pos_audit_report` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL COMMENT '营业日期',
  `type` varchar(1) NOT NULL DEFAULT '1',
  `accnt` char(14) DEFAULT '',
  `userCode` varchar(10) DEFAULT '' COMMENT '工号',
  `shift` char(1) NOT NULL DEFAULT '' COMMENT '班别',
  `pccode` varchar(10) NOT NULL DEFAULT '' COMMENT '营业点代码 ',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '营业点描叙 ',
  `code` varchar(10) DEFAULT '' COMMENT '类型',
  `descript` varchar(20) DEFAULT '' COMMENT '类型描叙',
  `amount0` decimal(12,2) DEFAULT '0.00' COMMENT '针对明细统计数',
  `amount1` decimal(12,2) DEFAULT '0.00' COMMENT '下同',
  `amount2` decimal(12,2) DEFAULT '0.00',
  `amount3` decimal(12,2) DEFAULT '0.00',
  `amount` decimal(12,2) DEFAULT '0.00',
  `ent_ft` decimal(12,2) DEFAULT '0.00',
  `dsc_ft` decimal(12,2) DEFAULT '0.00',
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`biz_date`),
  KEY `hotel_group_id_2` (`hotel_group_id`,`hotel_id`,`biz_date`,`type`,`shift`,`pccode`),
  KEY `hotel_group_id_3` (`hotel_group_id`,`hotel_id`,`biz_date`,`type`,`userCode`,`shift`,`pccode`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='餐饮夜审表';

-- ----------------------------
--  Table structure for `pos_bi_day`
-- ----------------------------
DROP TABLE IF EXISTS `pos_bi_day`;
CREATE TABLE `pos_bi_day` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime DEFAULT NULL,
  `pos_charge` decimal(12,2) DEFAULT NULL,
  `pos_pay` decimal(12,2) DEFAULT NULL,
  `pos_count` decimal(12,2) DEFAULT NULL,
  `pos_persons` decimal(12,2) DEFAULT NULL,
  `pos_rates` decimal(12,2) DEFAULT NULL,
  `pos_avg` decimal(12,2) DEFAULT NULL,
  `pos_suspend` decimal(12,2) DEFAULT NULL,
  `info1` decimal(12,2) DEFAULT NULL,
  `info2` decimal(12,2) DEFAULT NULL,
  `info3` decimal(12,2) DEFAULT NULL,
  `info4` decimal(12,2) DEFAULT NULL,
  `info5` decimal(12,2) DEFAULT NULL,
  `info6` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`biz_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pos_bi_month`
-- ----------------------------
DROP TABLE IF EXISTS `pos_bi_month`;
CREATE TABLE `pos_bi_month` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `month` varchar(20) DEFAULT NULL,
  `pos_charge` decimal(12,2) DEFAULT NULL,
  `pos_pay` decimal(12,2) DEFAULT NULL,
  `pos_count` decimal(12,2) DEFAULT NULL,
  `pos_persons` decimal(12,2) DEFAULT NULL,
  `pos_rates` decimal(12,2) DEFAULT NULL,
  `pos_avg` decimal(12,2) DEFAULT NULL,
  `pos_suspend` decimal(12,2) DEFAULT NULL,
  `info1` decimal(12,2) DEFAULT NULL,
  `info2` decimal(12,2) DEFAULT NULL,
  `info3` decimal(12,2) DEFAULT NULL,
  `info4` decimal(12,2) DEFAULT NULL,
  `info5` decimal(12,2) DEFAULT NULL,
  `info6` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pos_bi_special`
-- ----------------------------
DROP TABLE IF EXISTS `pos_bi_special`;
CREATE TABLE `pos_bi_special` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `year` varchar(4) DEFAULT NULL COMMENT '年份',
  `date_type` varchar(20) DEFAULT NULL COMMENT '节假日、月、周、季、自定义',
  `date_code` varchar(40) DEFAULT NULL,
  `date_desc` varchar(100) DEFAULT NULL,
  `date_short` varchar(40) DEFAULT NULL,
  `pos_charge` decimal(12,2) DEFAULT NULL,
  `pos_pay` decimal(12,2) DEFAULT NULL,
  `pos_count` decimal(12,2) DEFAULT NULL,
  `pos_persons` decimal(12,2) DEFAULT NULL,
  `pos_rates` decimal(12,2) DEFAULT NULL,
  `pos_avg` decimal(12,2) DEFAULT NULL,
  `pos_suspend` decimal(12,2) DEFAULT NULL,
  `info1` decimal(12,2) DEFAULT NULL,
  `info2` decimal(12,2) DEFAULT NULL,
  `info3` decimal(12,2) DEFAULT NULL,
  `info4` decimal(12,2) DEFAULT NULL,
  `info5` decimal(12,2) DEFAULT NULL,
  `info6` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`year`,`date_type`,`date_short`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pos_close`
-- ----------------------------
DROP TABLE IF EXISTS `pos_close`;
CREATE TABLE `pos_close` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `accnt` varchar(20) NOT NULL,
  `billno` varchar(20) NOT NULL,
  `close_flag` varchar(20) DEFAULT NULL,
  `charge` decimal(12,2) DEFAULT NULL,
  `pay` decimal(12,2) DEFAULT NULL,
  `trans_type` varchar(20) DEFAULT NULL,
  `trans_accnt` varchar(20) DEFAULT NULL,
  `gen_biz_date` datetime DEFAULT NULL,
  `gen_user` varchar(20) DEFAULT NULL,
  `gen_cashier` varchar(20) DEFAULT NULL,
  `gen_datetime` datetime DEFAULT NULL,
  `del_biz_date` datetime DEFAULT NULL,
  `del_user` varchar(20) DEFAULT NULL,
  `del_cashier` varchar(20) DEFAULT NULL,
  `del_datetime` datetime DEFAULT NULL,
  `tableno` varchar(20) DEFAULT NULL,
  `audit_user` varchar(20) DEFAULT NULL,
  `audit_remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结账账单记录表';

-- ----------------------------
--  Table structure for `pos_conddtl`
-- ----------------------------
DROP TABLE IF EXISTS `pos_conddtl`;
CREATE TABLE `pos_conddtl` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL COMMENT 'condid',
  `descript` varchar(60) DEFAULT NULL,
  `descript_en` varchar(30) DEFAULT NULL,
  `helpcode` varchar(20) DEFAULT NULL COMMENT '助记码',
  `unit` varchar(4) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `empflag` char(1) DEFAULT NULL,
  `barflag` char(1) DEFAULT NULL,
  `condst_code` varchar(100) DEFAULT NULL COMMENT '所属类别',
  `empid` varchar(10) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `logid` int(11) DEFAULT NULL,
  `wpcode` varchar(12) DEFAULT NULL,
  `numbmode` int(11) DEFAULT NULL,
  `number` decimal(12,2) DEFAULT NULL,
  `ratemode` int(11) DEFAULT NULL,
  `dscmode` int(11) DEFAULT NULL,
  `dscrate` decimal(12,2) DEFAULT NULL,
  `paycode` varchar(5) DEFAULT NULL,
  `billprint` char(1) DEFAULT NULL COMMENT '允许账单打印',
  `is_halt` char(2) DEFAULT NULL,
  `kitchenmsg` char(1) DEFAULT NULL COMMENT '不管是否送厨都有效',
  `list_order` mediumint(9) DEFAULT NULL COMMENT '排序码',
  `is_group` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) NOT NULL,
  `code_type` varchar(30) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='做法明细表';

-- ----------------------------
--  Table structure for `pos_condst`
-- ----------------------------
DROP TABLE IF EXISTS `pos_condst`;
CREATE TABLE `pos_condst` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(30) NOT NULL,
  `pccode` varchar(100) DEFAULT NULL COMMENT '适用营业点',
  `sort_code` varchar(30) DEFAULT NULL COMMENT '适用菜类',
  `is_halt` char(2) DEFAULT NULL,
  `list_order` mediumint(9) DEFAULT NULL,
  `is_group` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) NOT NULL,
  `code_type` varchar(30) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='做法组别';

-- ----------------------------
--  Table structure for `pos_current_price`
-- ----------------------------
DROP TABLE IF EXISTS `pos_current_price`;
CREATE TABLE `pos_current_price` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL COMMENT '营业日期',
  `plu_code` varchar(10) NOT NULL COMMENT '菜项code',
  `plu_unit` varchar(10) NOT NULL COMMENT '菜项单位',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `number` decimal(12,2) NOT NULL DEFAULT '0.00',
  `is_group` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) NOT NULL,
  `code_type` varchar(30) DEFAULT NULL,
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `list_order` mediumint(9) NOT NULL DEFAULT '0' COMMENT '缺省值0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='时价菜定义表';

-- ----------------------------
--  Table structure for `pos_detail`
-- ----------------------------
DROP TABLE IF EXISTS `pos_detail`;
CREATE TABLE `pos_detail` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `accnt` char(14) NOT NULL DEFAULT '' COMMENT '账号 同主账单号码',
  `inumber` int(11) DEFAULT '0' COMMENT '序号',
  `tnumber` int(11) DEFAULT '0' COMMENT '序号  1234567 已此类推',
  `anumber` int(11) DEFAULT '0' COMMENT '退菜关联号 和tnumber 对应',
  `mnumber` int(11) DEFAULT '0' COMMENT ' 关联序号,比如inumber号有退菜。退菜项关联的此号码就是上述菜的号码',
  `type` char(1) DEFAULT '0' COMMENT 'class =1 为正常菜品,class =2 菜的烧法class = 3 为菜的特殊内容,比如退菜理由,换台原因等信息',
  `billno` varchar(13) DEFAULT NULL,
  `orderno` varchar(10) DEFAULT '' COMMENT 'order单号 针对自动开单项目类。ORDERNO 号位AUTO  重新计算的时候 用于茶位费,包厢费等自动类型',
  `sta` char(1) NOT NULL DEFAULT '' COMMENT '状态 I  有效,X 冲销 ',
  `shift` char(1) NOT NULL DEFAULT '' COMMENT '班次',
  `empid` varchar(10) DEFAULT '' COMMENT '点菜工号',
  `biz_date` datetime NOT NULL COMMENT '营业日期',
  `note_code` varchar(10) NOT NULL DEFAULT '' COMMENT '菜本',
  `sort_code` varchar(10) NOT NULL DEFAULT '' COMMENT '菜类',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '菜代码 付款代码 9001 等',
  `tocode` varchar(3) DEFAULT '' COMMENT '报表分类项 针对菜名和有金额的内容',
  `cond_code` varchar(100) DEFAULT '0' COMMENT '物料代码,烧法',
  `cook` varchar(200) DEFAULT NULL,
  `printid` int(11) DEFAULT '0' COMMENT '打印号,用于划菜使用,每天菜都是从1 开始 累计,只针对菜名累加 退菜等这些属性为0 ',
  `descript` varchar(80) NOT NULL DEFAULT '' COMMENT '菜名',
  `descript_en` varchar(80) NOT NULL DEFAULT '' COMMENT '菜英文名',
  `unit` varchar(4) NOT NULL DEFAULT '' COMMENT '单位',
  `number` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '数量',
  `pinumber` int(11) DEFAULT '0' COMMENT '打印次数',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT ' 金额',
  `amount1` decimal(12,2) DEFAULT '0.00' COMMENT '菜品原金额分摊额',
  `amount2` decimal(12,2) DEFAULT '0.00' COMMENT '菜品折扣分摊额',
  `amount3` decimal(12,2) DEFAULT '0.00' COMMENT '菜品服务费分摊额',
  `amount4` decimal(12,2) DEFAULT '0.00',
  `amount5` decimal(12,2) DEFAULT '0.00' COMMENT '打折比率 如0.15  ',
  `cost` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '成本额  ',
  `flag` varchar(30) NOT NULL DEFAULT '' COMMENT '菜名flag 属性,针对菜谱来定,判断是菜的属性',
  `flag1` varchar(30) DEFAULT '0000000000' COMMENT '菜flag1  - 本次点单菜属性 1234567890  先设10   第1 位0 代表模式计算 1单菜折扣,第2位 0 服务费按模式 1按主单 第3位 0服务费不打折 1服务费打折\r\n第4位  0附加税不打折 1附加税打折  第5位 1表示单菜款待   其他具体再定. 付款这些不需要填 第10 最后一位TF 表示是否划菜已上菜',
  `reason` char(3) DEFAULT '' COMMENT '理由 退菜',
  `dsc` decimal(12,2) DEFAULT '0.00' COMMENT '折扣总额',
  `srv` decimal(12,2) DEFAULT '0.00' COMMENT '服务费额',
  `srv0` decimal(12,2) DEFAULT NULL,
  `srv_dsc` decimal(12,2) DEFAULT NULL,
  `tax` decimal(12,2) DEFAULT '0.00' COMMENT '税额',
  `tax0` decimal(12,2) DEFAULT NULL,
  `tax_dsc` decimal(12,2) DEFAULT NULL,
  `tableno` varchar(10) DEFAULT NULL,
  `siteno` varchar(5) DEFAULT '' COMMENT '座位号',
  `info` varchar(50) DEFAULT '' COMMENT '信息备注',
  `cardno` varchar(20) DEFAULT '' COMMENT ' 卡信息信息备注,记录贵宾卡,信用卡等号码,ar账号等',
  `cardinfo` varchar(50) DEFAULT '' COMMENT '卡信息备注,如客人姓名：+卡余额,    分割符号为 `姓名``余额`, 有特殊需要提供给账单打印使用 余额应是记录查询时余额,需要相减后获得当时余额',
  `kitchen` varchar(40) DEFAULT '' COMMENT '厨房打印信息 此菜打印到哪些厨房过',
  `pcid` varchar(20) DEFAULT '' COMMENT ' 记录站点点菜站点 ,可以为空',
  `empid1` varchar(10) DEFAULT '' COMMENT '服务员号',
  `empid2` varchar(10) DEFAULT '' COMMENT '划菜工号等',
  `empid3` varchar(10) DEFAULT '' COMMENT '更改工号',
  `draw_date` datetime DEFAULT NULL COMMENT '划菜时间',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`accnt`,`inumber`,`type`,`sta`,`biz_date`),
  KEY `hotel_group_id_2` (`hotel_group_id`,`hotel_id`,`accnt`,`type`,`billno`,`sta`,`shift`,`biz_date`,`code`),
  KEY `hotel_group_id_3` (`hotel_group_id`,`hotel_id`,`accnt`,`sta`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点菜明细表';

-- ----------------------------
--  Table structure for `pos_detail_dai`
-- ----------------------------
DROP TABLE IF EXISTS `pos_detail_dai`;
CREATE TABLE `pos_detail_dai` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `accnt` char(14) NOT NULL DEFAULT '' COMMENT '账号 同主账单号码',
  `biz_date` datetime NOT NULL COMMENT '营业日期',
  `paycode` varchar(10) NOT NULL DEFAULT '' COMMENT '付款码',
  `descript` varchar(80) NOT NULL DEFAULT '' COMMENT '付款名',
  `descript_en` varchar(80) NOT NULL DEFAULT '' COMMENT '付款名',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT ' 金额',
  `reason3` varchar(50) DEFAULT '' COMMENT '原因',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点菜明细贷方分摊表';

-- ----------------------------
--  Table structure for `pos_detail_history`
-- ----------------------------
DROP TABLE IF EXISTS `pos_detail_history`;
CREATE TABLE `pos_detail_history` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL,
  `accnt` char(14) NOT NULL DEFAULT '' COMMENT '账号 同主账单号码',
  `inumber` int(11) DEFAULT '0' COMMENT '序号',
  `tnumber` int(11) DEFAULT '0' COMMENT '序号  1234567 已此类推',
  `anumber` int(11) DEFAULT '0' COMMENT '退菜关联号 和tnumber 对应',
  `mnumber` int(11) DEFAULT '0' COMMENT ' 关联序号,比如inumber号有退菜。退菜项关联的此号码就是上述菜的号码',
  `type` char(1) DEFAULT '0' COMMENT 'class =1 为正常菜品,class =2 菜的烧法class = 3 为菜的特殊内容,比如退菜理由,换台原因等信息',
  `billno` varchar(13) DEFAULT NULL,
  `orderno` varchar(10) DEFAULT '' COMMENT 'order单号 针对自动开单项目类。ORDERNO 号位AUTO  重新计算的时候 用于茶位费,包厢费等自动类型',
  `sta` char(1) NOT NULL DEFAULT '' COMMENT '状态 I  有效,X 冲销 ',
  `shift` char(1) NOT NULL DEFAULT '' COMMENT '班次',
  `empid` varchar(10) DEFAULT '' COMMENT '点菜工号',
  `biz_date` datetime NOT NULL COMMENT '营业日期',
  `note_code` varchar(10) NOT NULL DEFAULT '' COMMENT '菜本',
  `sort_code` varchar(10) NOT NULL DEFAULT '' COMMENT '菜类',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '菜代码 付款代码 9001 等',
  `tocode` varchar(3) DEFAULT '' COMMENT '报表分类项 针对菜名和有金额的内容',
  `cond_code` varchar(100) DEFAULT '0' COMMENT '物料代码,烧法',
  `cook` varchar(200) DEFAULT NULL,
  `printid` int(11) DEFAULT '0' COMMENT '打印号,用于划菜使用,每天菜都是从1 开始 累计,只针对菜名累加 退菜等这些属性为0 ',
  `descript` varchar(80) NOT NULL DEFAULT '' COMMENT '菜名',
  `descript_en` varchar(80) NOT NULL DEFAULT '' COMMENT '菜英文名',
  `unit` varchar(4) NOT NULL DEFAULT '' COMMENT '单位',
  `number` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '数量',
  `pinumber` int(11) DEFAULT '0' COMMENT '打印次数',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT ' 金额',
  `amount1` decimal(12,2) DEFAULT '0.00' COMMENT '菜品原金额分摊额',
  `amount2` decimal(12,2) DEFAULT '0.00' COMMENT '菜品折扣分摊额',
  `amount3` decimal(12,2) DEFAULT '0.00' COMMENT '菜品服务费分摊额',
  `amount4` decimal(12,2) DEFAULT '0.00',
  `amount5` decimal(12,2) DEFAULT '0.00' COMMENT '打折比率 如0.15  ',
  `cost` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '成本额  ',
  `flag` varchar(30) NOT NULL DEFAULT '' COMMENT '菜名flag 属性,针对菜谱来定,判断是菜的属性',
  `flag1` varchar(30) DEFAULT '0000000000' COMMENT '菜flag1  - 本次点单菜属性 1234567890  先设10   第1 位0 代表模式计算 1单菜折扣,第2位 0 服务费按模式 1按主单 第3位 0服务费不打折 1服务费打折\r\n第4位  0附加税不打折 1附加税打折  第5位 1表示单菜款待   其他具体再定. 付款这些不需要填 第10 最后一位TF 表示是否划菜已上菜',
  `reason` char(3) DEFAULT '' COMMENT '理由 退菜',
  `dsc` decimal(12,2) DEFAULT '0.00' COMMENT '折扣总额',
  `srv` decimal(12,2) DEFAULT '0.00' COMMENT '服务费额',
  `srv0` decimal(12,2) DEFAULT NULL,
  `srv_dsc` decimal(12,2) DEFAULT NULL,
  `tax` decimal(12,2) DEFAULT '0.00' COMMENT '税额',
  `tax0` decimal(12,2) DEFAULT NULL,
  `tax_dsc` decimal(12,2) DEFAULT NULL,
  `tableno` varchar(10) DEFAULT NULL,
  `siteno` varchar(5) DEFAULT '' COMMENT '座位号',
  `info` varchar(50) DEFAULT '' COMMENT '信息备注',
  `cardno` varchar(20) DEFAULT '' COMMENT ' 卡信息信息备注,记录贵宾卡,信用卡等号码,ar账号等',
  `cardinfo` varchar(50) DEFAULT '' COMMENT '卡信息备注,如客人姓名：+卡余额,    分割符号为 `姓名``余额`, 有特殊需要提供给账单打印使用 余额应是记录查询时余额,需要相减后获得当时余额',
  `kitchen` varchar(40) DEFAULT '' COMMENT '厨房打印信息 此菜打印到哪些厨房过',
  `pcid` varchar(20) DEFAULT '' COMMENT ' 记录站点点菜站点 ,可以为空',
  `empid1` varchar(10) DEFAULT '' COMMENT '服务员号',
  `empid2` varchar(10) DEFAULT '' COMMENT '划菜工号等',
  `empid3` varchar(10) DEFAULT '' COMMENT '更改工号',
  `draw_date` datetime DEFAULT NULL COMMENT '划菜时间',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`accnt`,`inumber`,`type`,`sta`,`shift`,`biz_date`,`code`),
  KEY `hotel_group_id_2` (`hotel_group_id`,`hotel_id`,`sta`,`biz_date`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点菜明细历史表';

-- ----------------------------
--  Table structure for `pos_detail_jie`
-- ----------------------------
DROP TABLE IF EXISTS `pos_detail_jie`;
CREATE TABLE `pos_detail_jie` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `deptno` char(4) NOT NULL DEFAULT '20' COMMENT '部门码',
  `accnt` char(14) NOT NULL DEFAULT '' COMMENT '账号 同主账单号码',
  `shift` char(1) NOT NULL DEFAULT '' COMMENT '班次',
  `biz_date` datetime NOT NULL COMMENT '营业日期',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '菜代码',
  `tocode` varchar(3) DEFAULT '' COMMENT '报表分类项 针对菜名和有金额的内容',
  `descript` varchar(80) NOT NULL DEFAULT '' COMMENT '菜名',
  `descript_en` varchar(80) NOT NULL DEFAULT '' COMMENT '菜英文名',
  `unit` varchar(4) NOT NULL DEFAULT '' COMMENT '单位',
  `number` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '数量',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `amount0` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT ' 金额',
  `amount1` decimal(12,2) DEFAULT '0.00' COMMENT '款待分摊额',
  `amount2` decimal(12,2) DEFAULT '0.00' COMMENT '折扣分摊额',
  `amount3` decimal(12,2) DEFAULT '0.00' COMMENT '预留1',
  `srv0` decimal(12,2) DEFAULT '0.00' COMMENT '服务费额',
  `srv1` decimal(12,2) DEFAULT '0.00',
  `srv2` decimal(12,2) DEFAULT '0.00',
  `srv3` decimal(12,2) DEFAULT '0.00',
  `tax0` decimal(12,2) DEFAULT '0.00' COMMENT '税额',
  `tax1` decimal(12,2) DEFAULT '0.00',
  `tax2` decimal(12,2) DEFAULT '0.00',
  `tax3` decimal(12,2) DEFAULT '0.00',
  `reason1` varchar(50) DEFAULT '' COMMENT '原因',
  `reason2` varchar(50) DEFAULT '' COMMENT '原因',
  `reason3` varchar(50) DEFAULT '' COMMENT '原因',
  `special` varchar(4) DEFAULT 'N',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点菜明细借方分摊表';

-- ----------------------------
--  Table structure for `pos_dishcard`
-- ----------------------------
DROP TABLE IF EXISTS `pos_dishcard`;
CREATE TABLE `pos_dishcard` (
  `hotel_group_id` bigint(20) DEFAULT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accnt` varchar(15) DEFAULT NULL,
  `inumber` int(11) DEFAULT NULL,
  `tnumber` int(11) DEFAULT NULL,
  `mnumber` int(11) DEFAULT NULL,
  `biz_date` datetime DEFAULT NULL,
  `pccode` varchar(10) DEFAULT NULL,
  `pccode_name` varchar(50) DEFAULT NULL,
  `table_code` varchar(10) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `gsts` int(11) DEFAULT NULL,
  `printid` int(11) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `sta` char(1) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `descript` varchar(80) DEFAULT NULL,
  `descript_en` varchar(80) DEFAULT NULL,
  `unit` varchar(4) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `number` decimal(12,2) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `cook_all` varchar(50) DEFAULT NULL,
  `cook` varchar(200) DEFAULT NULL,
  `printer` varchar(10) DEFAULT NULL,
  `printer1` varchar(10) DEFAULT NULL,
  `p_number` int(11) DEFAULT NULL,
  `p_number1` int(11) DEFAULT NULL,
  `changed` varchar(1) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `isprint` char(1) DEFAULT NULL,
  `station` varchar(10) DEFAULT NULL,
  `class` char(1) DEFAULT NULL,
  `p_sort` varchar(10) DEFAULT NULL,
  `foliono` varchar(10) DEFAULT NULL,
  `siteno` varchar(10) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pos_dishcard_history`
-- ----------------------------
DROP TABLE IF EXISTS `pos_dishcard_history`;
CREATE TABLE `pos_dishcard_history` (
  `hotel_group_id` bigint(20) DEFAULT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `accnt` varchar(15) DEFAULT NULL,
  `inumber` int(11) DEFAULT NULL,
  `tnumber` int(11) DEFAULT NULL,
  `mnumber` int(11) DEFAULT NULL,
  `biz_date` datetime DEFAULT NULL,
  `pccode` varchar(10) DEFAULT NULL,
  `pccode_name` varchar(50) DEFAULT NULL,
  `table_code` varchar(10) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `gsts` int(11) DEFAULT NULL,
  `printid` int(11) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `sta` char(1) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `descript` varchar(80) DEFAULT NULL,
  `descript_en` varchar(80) DEFAULT NULL,
  `unit` varchar(4) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `number` decimal(12,2) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `cook_all` varchar(50) DEFAULT NULL,
  `cook` varchar(200) DEFAULT NULL,
  `printer` varchar(10) DEFAULT NULL,
  `printer1` varchar(10) DEFAULT NULL,
  `p_number` int(11) DEFAULT NULL,
  `p_number1` int(11) DEFAULT NULL,
  `changed` varchar(1) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `isprint` char(1) DEFAULT NULL,
  `station` varchar(10) DEFAULT NULL,
  `class` char(1) DEFAULT NULL,
  `p_sort` varchar(10) DEFAULT NULL,
  `foliono` varchar(10) DEFAULT NULL,
  `siteno` varchar(10) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  UNIQUE KEY `index1` (`hotel_group_id`,`hotel_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pos_drinks_consume_history`
-- ----------------------------
DROP TABLE IF EXISTS `pos_drinks_consume_history`;
CREATE TABLE `pos_drinks_consume_history` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `accnt` bigint(16) NOT NULL,
  `descript` varchar(20) NOT NULL,
  `volume` varchar(20) DEFAULT NULL,
  `consume_amount` int(11) NOT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`accnt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pos_drinks_deposit_order`
-- ----------------------------
DROP TABLE IF EXISTS `pos_drinks_deposit_order`;
CREATE TABLE `pos_drinks_deposit_order` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT COMMENT '单号',
  `owner` varchar(20) NOT NULL COMMENT '寄存人',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `state` char(2) NOT NULL COMMENT 'I有效，X取消，O用完',
  `remark` varchar(200) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`owner`,`phone`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pos_ip`
-- ----------------------------
DROP TABLE IF EXISTS `pos_ip`;
CREATE TABLE `pos_ip` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `descript` varchar(100) DEFAULT NULL,
  `server_ip` varchar(100) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pos_master`
-- ----------------------------
DROP TABLE IF EXISTS `pos_master`;
CREATE TABLE `pos_master` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `accnt` char(14) NOT NULL DEFAULT '' COMMENT ' 账号 建议P1503151230001  日期收银站点+0001 序列号 固定位数14位 收银站点已ip的后3位 如192.168.0.123 则以123为准 不足3位前面补0',
  `type1` varchar(100) DEFAULT '' COMMENT '客人类别1',
  `type2` varchar(100) DEFAULT '' COMMENT '客人类别2',
  `type3` varchar(100) DEFAULT '' COMMENT '客人类别3',
  `type4` varchar(100) DEFAULT '' COMMENT '客人类别4',
  `type5` varchar(100) DEFAULT '' COMMENT '客人类别5',
  `pccode` varchar(10) NOT NULL DEFAULT '' COMMENT '营业点代码 ',
  `mode` varchar(10) DEFAULT '' COMMENT '模式代码 ',
  `shift` char(1) NOT NULL DEFAULT '' COMMENT '班别',
  `empid` varchar(20) DEFAULT '' COMMENT '工号',
  `sta` char(1) NOT NULL DEFAULT '' COMMENT '状态',
  `osta` char(1) DEFAULT '' COMMENT ' 上次状态',
  `biz_date` datetime NOT NULL COMMENT '营业日期',
  `tableno` varchar(10) DEFAULT '' COMMENT '-桌号',
  `exttableno` varchar(100) DEFAULT '' COMMENT '扩展桌号等',
  `gsts` int(11) NOT NULL DEFAULT '0' COMMENT ' 客人数 ',
  `children` int(11) DEFAULT '0' COMMENT '儿童数',
  `phone` varchar(13) DEFAULT NULL,
  `market` varchar(10) DEFAULT '' COMMENT '市场代码',
  `source` varchar(10) DEFAULT '' COMMENT '来源代码',
  `haccnt` varchar(10) DEFAULT '' COMMENT ' 关联客户档案号',
  `name` varchar(80) DEFAULT '' COMMENT '关联客人姓名',
  `cusno` varchar(10) DEFAULT '' COMMENT '协议单位号',
  `cusinfo` varchar(60) DEFAULT '' COMMENT ' 协议单位名称',
  `cardno` varchar(20) DEFAULT '' COMMENT ' 贵宾卡号',
  `cardinfo` varchar(60) DEFAULT '' COMMENT ' 贵宾卡名称',
  `saleid` varchar(10) DEFAULT '' COMMENT '销售代码',
  `saleinfo` varchar(60) DEFAULT '' COMMENT '销售员信息',
  `dsc` decimal(12,2) DEFAULT '0.00' COMMENT ' 折扣比率',
  `reason` varchar(3) DEFAULT '' COMMENT ' 折扣理由',
  `srv` decimal(12,2) DEFAULT '0.00' COMMENT ' 服务费比率',
  `tax` decimal(12,2) DEFAULT '0.00' COMMENT '税额',
  `dscamount` decimal(12,2) DEFAULT '0.00',
  `srvamount` decimal(12,2) DEFAULT '0.00',
  `taxamount` decimal(12,2) DEFAULT '0.00',
  `amount` decimal(12,2) DEFAULT '0.00' COMMENT '菜品金额',
  `amount1` decimal(12,2) DEFAULT '0.00' COMMENT '菜品分摊额',
  `amount2` decimal(12,2) DEFAULT '0.00' COMMENT '菜品折扣分摊额',
  `amount3` decimal(12,2) DEFAULT '0.00' COMMENT '菜品服务费分摊额',
  `amount4` decimal(12,2) DEFAULT '0.00',
  `amount5` decimal(12,2) DEFAULT '0.00',
  `maxamount` decimal(12,2) DEFAULT '0.00' COMMENT '上次打印总金额',
  `charge` decimal(12,2) DEFAULT '0.00',
  `credit` decimal(12,2) DEFAULT '0.00',
  `bal` decimal(12,2) DEFAULT '0.00',
  `billno` char(11) DEFAULT NULL,
  `paycode` varchar(6) DEFAULT '' COMMENT '付款代码 9001 或9001* 等',
  `extra` varchar(30) DEFAULT '',
  `lastnum` int(11) DEFAULT '0' COMMENT '记录明细行数',
  `lastrnum` int(11) DEFAULT '0' COMMENT '记录打印行数',
  `lastpnum` int(11) DEFAULT '0' COMMENT '记录打印页数 ',
  `pcrec` char(14) DEFAULT '' COMMENT '联单号',
  `cmscode` varchar(10) DEFAULT '' COMMENT '佣金代码',
  `receipt_no` varchar(50) DEFAULT NULL,
  `receipt_amount` decimal(12,2) DEFAULT NULL,
  `info` varchar(200) DEFAULT '' COMMENT '主单备注信息',
  `toaccnt` varchar(10) DEFAULT '' COMMENT '预订挂账账号',
  `accntinfo` varchar(60) DEFAULT '' COMMENT '挂账单位信息',
  `resno` char(13) DEFAULT '' COMMENT '预订单号',
  `qr_code` varchar(512) DEFAULT '' COMMENT '二维码',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`accnt`,`pccode`,`shift`,`sta`,`biz_date`),
  KEY `hotel_group_id_2` (`hotel_group_id`,`hotel_id`,`accnt`,`biz_date`),
  KEY `hotel_group_id_3` (`hotel_group_id`,`hotel_id`,`sta`,`biz_date`),
  KEY `hotel_group_id_4` (`hotel_group_id`,`hotel_id`,`biz_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='餐饮主单表';

-- ----------------------------
--  Table structure for `pos_master_history`
-- ----------------------------
DROP TABLE IF EXISTS `pos_master_history`;
CREATE TABLE `pos_master_history` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL,
  `accnt` char(14) NOT NULL DEFAULT '' COMMENT ' 账号 建议P1503151230001  日期收银站点+0001 序列号 固定位数14位 收银站点已ip的后3位 如192.168.0.123 则以123为准 不足3位前面补0',
  `type1` varchar(100) DEFAULT '' COMMENT '客人类别1',
  `type2` varchar(100) DEFAULT '' COMMENT '客人类别2',
  `type3` varchar(100) DEFAULT '' COMMENT '客人类别3',
  `type4` varchar(100) DEFAULT '' COMMENT '客人类别4',
  `type5` varchar(100) DEFAULT '' COMMENT '客人类别5',
  `pccode` varchar(10) NOT NULL DEFAULT '' COMMENT '营业点代码 ',
  `mode` varchar(10) DEFAULT '' COMMENT '模式代码 ',
  `shift` char(1) NOT NULL DEFAULT '' COMMENT '班别',
  `empid` varchar(20) DEFAULT '' COMMENT '工号',
  `sta` char(1) NOT NULL DEFAULT '' COMMENT '状态',
  `osta` char(1) DEFAULT '' COMMENT ' 上次状态',
  `biz_date` datetime NOT NULL COMMENT '营业日期',
  `tableno` varchar(10) DEFAULT '' COMMENT '-桌号',
  `exttableno` varchar(100) DEFAULT '' COMMENT '扩展桌号等',
  `gsts` int(11) NOT NULL DEFAULT '0' COMMENT ' 客人数 ',
  `children` int(11) DEFAULT '0' COMMENT '儿童数',
  `phone` varchar(13) DEFAULT NULL,
  `market` varchar(10) DEFAULT '' COMMENT '市场代码',
  `source` varchar(10) DEFAULT '' COMMENT '来源代码',
  `haccnt` varchar(10) DEFAULT '' COMMENT ' 关联客户档案号',
  `name` varchar(80) DEFAULT '' COMMENT '关联客人姓名',
  `cusno` varchar(10) DEFAULT '' COMMENT '协议单位号',
  `cusinfo` varchar(60) DEFAULT '' COMMENT ' 协议单位名称',
  `cardno` varchar(20) DEFAULT '' COMMENT ' 贵宾卡号',
  `cardinfo` varchar(60) DEFAULT '' COMMENT ' 贵宾卡名称',
  `saleid` varchar(10) DEFAULT '' COMMENT '销售代码',
  `saleinfo` varchar(60) DEFAULT '' COMMENT '销售员信息',
  `dsc` decimal(12,2) DEFAULT '0.00' COMMENT ' 折扣比率',
  `reason` varchar(3) DEFAULT '' COMMENT ' 折扣理由',
  `srv` decimal(12,2) DEFAULT '0.00' COMMENT ' 服务费比率',
  `tax` decimal(12,2) DEFAULT '0.00' COMMENT '税额',
  `dscamount` decimal(12,2) DEFAULT '0.00',
  `srvamount` decimal(12,2) DEFAULT '0.00',
  `taxamount` decimal(12,2) DEFAULT '0.00',
  `amount` decimal(12,2) DEFAULT '0.00' COMMENT '菜品金额',
  `amount1` decimal(12,2) DEFAULT '0.00' COMMENT '菜品分摊额',
  `amount2` decimal(12,2) DEFAULT '0.00' COMMENT '菜品折扣分摊额',
  `amount3` decimal(12,2) DEFAULT '0.00' COMMENT '菜品服务费分摊额',
  `amount4` decimal(12,2) DEFAULT '0.00',
  `amount5` decimal(12,2) DEFAULT '0.00',
  `maxamount` decimal(12,2) DEFAULT '0.00' COMMENT '上次打印总金额',
  `charge` decimal(12,2) DEFAULT '0.00',
  `credit` decimal(12,2) DEFAULT '0.00',
  `bal` decimal(12,2) DEFAULT '0.00',
  `billno` char(11) DEFAULT NULL,
  `paycode` varchar(6) DEFAULT '' COMMENT '付款代码 9001 或9001* 等',
  `extra` varchar(30) DEFAULT '',
  `lastnum` int(11) DEFAULT '0' COMMENT '记录明细行数',
  `lastrnum` int(11) DEFAULT '0' COMMENT '记录打印行数',
  `lastpnum` int(11) DEFAULT '0' COMMENT '记录打印页数 ',
  `pcrec` char(14) DEFAULT '' COMMENT '联单号',
  `cmscode` varchar(10) DEFAULT '' COMMENT '佣金代码',
  `receipt_no` varchar(50) DEFAULT NULL,
  `receipt_amount` decimal(12,2) DEFAULT NULL,
  `info` varchar(200) DEFAULT '' COMMENT '主单备注信息',
  `toaccnt` varchar(10) DEFAULT '' COMMENT '预订挂账账号',
  `accntinfo` varchar(60) DEFAULT '' COMMENT '挂账单位信息',
  `resno` char(13) DEFAULT '' COMMENT '预订单号',
  `qr_code` varchar(512) DEFAULT '' COMMENT '二维码',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`accnt`,`pccode`,`shift`,`sta`,`biz_date`),
  KEY `hotel_group_id_2` (`hotel_group_id`,`hotel_id`,`accnt`,`biz_date`),
  KEY `hotel_group_id_3` (`hotel_group_id`,`hotel_id`,`sta`,`biz_date`),
  KEY `hotel_group_id_4` (`hotel_group_id`,`hotel_id`,`biz_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='餐饮主单历史表';

-- ----------------------------
--  Table structure for `pos_mode_def`
-- ----------------------------
DROP TABLE IF EXISTS `pos_mode_def`;
CREATE TABLE `pos_mode_def` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT '001' COMMENT '折扣模式代码',
  `descript` varchar(50) DEFAULT NULL COMMENT '模式描述',
  `pccode` varchar(6) NOT NULL COMMENT '营业点代码### 所有营业点,其他按实际点',
  `pccode_descript` varchar(50) DEFAULT NULL,
  `sort_code` varchar(10) NOT NULL COMMENT '菜类代码 ',
  `sort_descript` varchar(50) DEFAULT NULL,
  `plu_code` varchar(10) DEFAULT '0' COMMENT '菜项代码',
  `plu_descript` varchar(50) DEFAULT NULL,
  `type` varchar(10) NOT NULL COMMENT '1折扣.2服务费.3附加费用',
  `class1` char(1) NOT NULL DEFAULT 'T' COMMENT '折扣类型  T 表示固定折扣, F 主单折扣, 服务类 T 表示固定服务费,F 主单服务费',
  `class2` char(1) DEFAULT 'T' COMMENT '折扣 不用 ,服务费计算方式 T 全额计算,折后计算',
  `rate` decimal(12,2) NOT NULL COMMENT '费率',
  `is_group` char(2) DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) DEFAULT 'null',
  `code_type` varchar(30) DEFAULT NULL,
  `is_halt` char(2) DEFAULT 'F' COMMENT 'T=yes F=no',
  `list_order` mediumint(9) DEFAULT '0' COMMENT '缺省值0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`code`,`pccode`,`sort_code`,`type`,`class1`),
  KEY `hotel_group_id_2` (`hotel_group_id`,`hotel_id`,`code`,`pccode`,`sort_code`,`plu_code`,`type`,`class1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pos_mode_name`
-- ----------------------------
DROP TABLE IF EXISTS `pos_mode_name`;
CREATE TABLE `pos_mode_name` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL COMMENT '优惠类型（1优惠 2服务费 3附加费）',
  `code` char(1) NOT NULL COMMENT '计算方式代码',
  `descript` varchar(60) NOT NULL COMMENT '计算方式中文描叙',
  `descript_en` varchar(30) NOT NULL COMMENT '计算方式英文描叙',
  `is_group` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) NOT NULL,
  `code_type` varchar(30) DEFAULT NULL,
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `list_order` mediumint(9) NOT NULL DEFAULT '0' COMMENT '缺省值0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='折扣模式计算方式表';

-- ----------------------------
--  Table structure for `pos_order`
-- ----------------------------
DROP TABLE IF EXISTS `pos_order`;
CREATE TABLE `pos_order` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `pcid` char(20) NOT NULL COMMENT '站点',
  `accnt` char(14) NOT NULL COMMENT '账号 账号为空的时候 位IPAD 点单 到时转入时已桌号计算为准获取账号为准',
  `inumber` int(11) NOT NULL COMMENT '序号 默认从1 开始，转入到pos_dish ,要重新算过',
  `tnumber` int(11) DEFAULT NULL COMMENT '序号',
  `anumber` int(11) DEFAULT NULL,
  `mnumber` int(11) DEFAULT NULL COMMENT '套餐等序号，对应inumber',
  `type` char(1) DEFAULT NULL COMMENT '类型1',
  `orderno` varchar(10) DEFAULT '' COMMENT 'orderno',
  `cond_code` varchar(100) DEFAULT NULL COMMENT '物料ID ,如烧法等',
  `descript` varchar(30) NOT NULL DEFAULT '' COMMENT '名称',
  `descript_en` varchar(80) NOT NULL COMMENT '英文名',
  `note_code` varchar(10) NOT NULL DEFAULT '' COMMENT '菜本',
  `sort_code` varchar(10) NOT NULL DEFAULT '' COMMENT '菜类',
  `plu_code` varchar(10) NOT NULL DEFAULT '' COMMENT ' 菜谱代码',
  `tocode` varchar(3) DEFAULT NULL,
  `pinumber` int(11) DEFAULT NULL COMMENT '打印号',
  `unit` varchar(4) NOT NULL DEFAULT '' COMMENT '单位',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `number` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '数量',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `sta` char(1) DEFAULT NULL COMMENT '状态I  X 取消',
  `flag` varchar(30) NOT NULL COMMENT '菜谱flag',
  `flag1` varchar(30) DEFAULT NULL COMMENT ''' 对应明细 默认值 先暂时用掉10位1-10  第1位000000000F 如套餐则 最后一位是T',
  `empid` varchar(10) DEFAULT NULL COMMENT '点菜工号',
  `logdate` datetime DEFAULT NULL COMMENT '点菜时间',
  `saleid` varchar(10) DEFAULT NULL COMMENT '销售员代码',
  `tableno` varchar(6) NOT NULL COMMENT '桌号',
  `siteno` varchar(5) NOT NULL COMMENT '座位号',
  `cook` varchar(200) DEFAULT NULL COMMENT '烧饭，代码或中午字符',
  `remark` varchar(30) DEFAULT NULL COMMENT '整单备注',
  `printer` varchar(20) DEFAULT NULL COMMENT '打印机代码',
  `empid1` varchar(20) DEFAULT NULL COMMENT '服务员',
  `empid2` varchar(20) DEFAULT NULL COMMENT '工号2',
  `empid3` varchar(20) DEFAULT NULL COMMENT '工号3',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='餐饮预点表';

-- ----------------------------
--  Table structure for `pos_pay`
-- ----------------------------
DROP TABLE IF EXISTS `pos_pay`;
CREATE TABLE `pos_pay` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `accnt` char(13) NOT NULL DEFAULT '' COMMENT '预订单号号',
  `inumber` int(11) DEFAULT '0' COMMENT '序',
  `anumber` int(11) DEFAULT '0' COMMENT '更改序',
  `subid` int(11) DEFAULT '0',
  `trand` char(1) DEFAULT '' COMMENT ' 转走标志 T 已转用',
  `taccnt` char(13) DEFAULT '' COMMENT '对应使用菜单号',
  `tnumber` int(11) DEFAULT '0' COMMENT '对应的菜单付款NUMBER',
  `tsubid` int(11) DEFAULT '0',
  `shift` char(1) DEFAULT '' COMMENT '班次',
  `empid` varchar(10) DEFAULT '' COMMENT '工号',
  `tshift` char(1) DEFAULT '' COMMENT '班次',
  `tempid` varchar(10) DEFAULT '' COMMENT '工号',
  `biz_date` datetime DEFAULT NULL COMMENT '营业日期',
  `logdate` datetime DEFAULT NULL COMMENT '物理日期',
  `tbdate` datetime DEFAULT NULL COMMENT '转走营业日期',
  `oldate` datetime DEFAULT NULL COMMENT '转走物理日期',
  `opccode` varchar(5) DEFAULT '',
  `pccode` varchar(5) NOT NULL DEFAULT '' COMMENT ' 付款代码',
  `descript` varchar(80) DEFAULT '' COMMENT ' 付款名称',
  `descript_en` varchar(80) DEFAULT NULL COMMENT ' 英文名',
  `paytype` char(1) DEFAULT '',
  `numb` decimal(12,2) DEFAULT '0.00',
  `charge` decimal(12,2) DEFAULT '0.00',
  `credit` decimal(12,2) NOT NULL DEFAULT '0.00',
  `bal` decimal(12,2) DEFAULT '0.00',
  `billno` char(11) DEFAULT '',
  `foliono` varchar(60) DEFAULT '',
  `orderno` varchar(20) DEFAULT '',
  `sign` varchar(20) DEFAULT '00000000000000000000',
  `flag` varchar(20) DEFAULT '',
  `sta` char(1) NOT NULL DEFAULT '',
  `reason` char(3) DEFAULT '',
  `info1` varchar(50) DEFAULT '',
  `info2` varchar(50) DEFAULT '',
  `bank` varchar(5) DEFAULT '',
  `cardcode` varchar(20) DEFAULT '',
  `dtl_accnt` varchar(20) DEFAULT '',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='餐饮预付表';

-- ----------------------------
--  Table structure for `pos_pccode`
-- ----------------------------
DROP TABLE IF EXISTS `pos_pccode`;
CREATE TABLE `pos_pccode` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `ta_code` varchar(10) NOT NULL,
  `code` char(3) NOT NULL COMMENT '营业点代码',
  `descript` varchar(60) NOT NULL COMMENT '营业点中文描叙',
  `descript_en` varchar(30) NOT NULL COMMENT '营业点英文描叙',
  `menu_type` varchar(10) DEFAULT '001' COMMENT '默认客人类别',
  `dsc_rate` decimal(12,2) DEFAULT NULL COMMENT '默认折扣费率',
  `serve_rate` decimal(12,2) DEFAULT NULL COMMENT '默认服务费率',
  `tax_rate` decimal(12,2) DEFAULT NULL COMMENT '默认附加费率',
  `dec_length` int(11) DEFAULT '0' COMMENT '保留小数格式 0;0.1;0.01',
  `dec_mode` VARCHAR(20) DEFAULT NULL COMMENT '默认模式 code_base',
  `ground_bmp` varchar(50) DEFAULT NULL COMMENT '图片',
  `quantity` int(11) DEFAULT NULL COMMENT '桌数',
  `overquan` int(11) DEFAULT NULL COMMENT '可超预订桌数',
  `deptno` varchar(5) DEFAULT NULL COMMENT '部门码',
  `language` varchar(10) DEFAULT NULL COMMENT '语言',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `exp1` varchar(20) DEFAULT NULL,
  `exp2` varchar(20) DEFAULT NULL,
  `exp3` varchar(20) DEFAULT NULL,
  `exp4` varchar(20) DEFAULT NULL,
  `is_group` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) NOT NULL,
  `code_type` varchar(30) DEFAULT NULL,
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `list_order` mediumint(9) NOT NULL DEFAULT '0' COMMENT '缺省值0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='营业点表';

-- ----------------------------
--  Table structure for `pos_pccode_note`
-- ----------------------------
DROP TABLE IF EXISTS `pos_pccode_note`;
CREATE TABLE `pos_pccode_note` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `pccode` varchar(6) NOT NULL COMMENT '营业点',
  `note_code` varchar(500) NOT NULL COMMENT '菜本编码',
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `list_order` mediumint(9) NOT NULL DEFAULT '0' COMMENT '缺省值0',
  `is_group` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) NOT NULL,
  `code_type` varchar(30) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='营业点菜本表';

-- ----------------------------
--  Table structure for `pos_pccode_shift`
-- ----------------------------
DROP TABLE IF EXISTS `pos_pccode_shift`;
CREATE TABLE `pos_pccode_shift` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL COMMENT '代码',
  `pccode` varchar(6) NOT NULL COMMENT '营业点代码',
  `shift` char(1) NOT NULL COMMENT '班别',
  `ta_code` varchar(10) DEFAULT NULL,
  `begin_time` varchar(10) NOT NULL COMMENT '开始时间',
  `end_time` varchar(10) NOT NULL COMMENT '结束时间',
  `is_group` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) NOT NULL,
  `code_type` varchar(30) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='营业点时段表';

-- ----------------------------
--  Table structure for `pos_pccode_table`
-- ----------------------------
DROP TABLE IF EXISTS `pos_pccode_table`;
CREATE TABLE `pos_pccode_table` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL COMMENT '桌号',
  `type` varchar(6) DEFAULT NULL COMMENT '桌号类别（ABCD）',
  `pccode` varchar(6) NOT NULL COMMENT '营业点',
  `descript` varchar(60) DEFAULT NULL COMMENT '名称',
  `descript_en` varchar(30) DEFAULT NULL COMMENT '英文名',
  `sta` varchar(6) NOT NULL COMMENT '桌号状态',
  `mode` varchar(6) NOT NULL COMMENT '模式',
  `amount` decimal(12,2) NOT NULL COMMENT '消费金额',
  `min_id` decimal(12,2) DEFAULT NULL COMMENT '最低消费',
  `area` varchar(6) DEFAULT NULL,
  `regcode` varchar(6) DEFAULT NULL,
  `x` int(10) DEFAULT NULL,
  `y` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `height` int(10) DEFAULT NULL,
  `tag` varchar(6) DEFAULT NULL COMMENT '桌号属性',
  `mapcode` varchar(6) DEFAULT NULL,
  `modi` varchar(6) DEFAULT NULL,
  `reason` varchar(30) DEFAULT NULL COMMENT '维修理由',
  `placecode` varchar(6) DEFAULT NULL,
  `is_group` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) NOT NULL,
  `code_type` varchar(30) DEFAULT NULL,
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `list_order` mediumint(9) NOT NULL DEFAULT '0' COMMENT '缺省值0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`code`,`type`,`pccode`,`descript`),
  KEY `hotel_group_id_2` (`hotel_group_id`,`hotel_id`,`code`,`pccode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='营业点桌号管理表';

-- ----------------------------
--  Table structure for `pos_plu_all`
-- ----------------------------
DROP TABLE IF EXISTS `pos_plu_all`;
CREATE TABLE `pos_plu_all` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT COMMENT '菜项ID',
  `code` varchar(10) NOT NULL COMMENT '菜项编号',
  `sort_code` varchar(10) NOT NULL COMMENT '菜类编码',
  `descript` varchar(50) DEFAULT NULL COMMENT '菜名',
  `descript_en` varchar(80) DEFAULT NULL COMMENT '菜名',
  `helpcode` varchar(20) DEFAULT NULL COMMENT '助记码',
  `price` decimal(12,2) DEFAULT NULL COMMENT '默认价格',
  `unit` varchar(10) DEFAULT '份' COMMENT '单位',
  `cost_price` decimal(12,2) DEFAULT '0.00' COMMENT '成本价',
  `mode` varchar(2) DEFAULT NULL COMMENT '是否允许打折',
  `menu` varchar(5) DEFAULT NULL COMMENT '班次默认11111',
  `flag` varchar(30) DEFAULT NULL COMMENT '菜项属性',
  `condgp1` varchar(100) DEFAULT NULL COMMENT '默认烧法',
  `tocode` varchar(100) DEFAULT NULL COMMENT '报表数据项',
  `timecode` varchar(6) DEFAULT NULL COMMENT '时价菜标志',
  `pt_num` int(10) DEFAULT NULL COMMENT '打印次数',
  `has_pic` varchar(2) DEFAULT '0',
  `pic_path1` varchar(60) DEFAULT NULL COMMENT '菜项图片路径',
  `is_central` varchar(2) DEFAULT 'T' COMMENT '是否中央厨房',
  `introduction` varchar(1024) DEFAULT NULL COMMENT '简介',
  `plu_material` varchar(1024) DEFAULT NULL COMMENT '主辅料',
  `remark` varchar(60) DEFAULT NULL COMMENT '备注',
  `list_order` mediumint(9) DEFAULT NULL,
  `is_halt` varchar(2) DEFAULT NULL,
  `is_group` char(2) DEFAULT NULL,
  `group_code` varchar(60) DEFAULT NULL,
  `code_type` varchar(60) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`code`,`sort_code`,`descript`,`descript_en`,`helpcode`,`price`,`unit`,`flag`,`tocode`),
  KEY `hotel_group_id_2` (`hotel_group_id`,`hotel_id`,`code`,`is_halt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜项明细表';

-- ----------------------------
--  Table structure for `pos_plu_printer`
-- ----------------------------
DROP TABLE IF EXISTS `pos_plu_printer`;
CREATE TABLE `pos_plu_printer` (
  `hotel_group_id` bigint(20) DEFAULT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sort_code` varchar(10) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `descript` varchar(50) DEFAULT NULL,
  `descript_en` varchar(50) DEFAULT NULL,
  `flag` varchar(20) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`sort_code`,`code`,`descript`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pos_plu_std`
-- ----------------------------
DROP TABLE IF EXISTS `pos_plu_std`;
CREATE TABLE `pos_plu_std` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `descript` varchar(60) DEFAULT NULL,
  `descript_en` varchar(30) DEFAULT NULL,
  `note_code` varchar(10) DEFAULT NULL,
  `sort_code` varchar(10) NOT NULL COMMENT '菜类',
  `sort_descript` varchar(60) DEFAULT NULL,
  `plu_code` varchar(10) DEFAULT NULL COMMENT '菜项code',
  `plu_descript` varchar(60) DEFAULT NULL,
  `flag` varchar(60) DEFAULT NULL,
  `pinumber` int(11) DEFAULT NULL COMMENT '序号',
  `unit` varchar(10) NOT NULL COMMENT '单位',
  `number` decimal(12,2) NOT NULL COMMENT '数量',
  `price0` decimal(12,2) NOT NULL COMMENT '原价格',
  `price` decimal(12,2) NOT NULL COMMENT '价格',
  `tag` char(1) DEFAULT '0' COMMENT '标记',
  `is_group` char(2) DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) DEFAULT NULL,
  `code_type` varchar(30) DEFAULT NULL,
  `is_halt` char(2) DEFAULT 'F' COMMENT 'T=yes F=no',
  `list_order` mediumint(9) DEFAULT '0' COMMENT '缺省值0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`code`,`plu_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='套菜明细菜表';

-- ----------------------------
--  Table structure for `pos_price`
-- ----------------------------
DROP TABLE IF EXISTS `pos_price`;
CREATE TABLE `pos_price` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `plu_code` bigint(16) NOT NULL COMMENT '菜项code',
  `pccode` varchar(6) NOT NULL COMMENT '营业点',
  `inumber` int(10) NOT NULL COMMENT '菜价序号',
  `unit` varchar(4) NOT NULL COMMENT '单位',
  `price` decimal(12,2) NOT NULL COMMENT '价格',
  `cost` decimal(12,2) NOT NULL COMMENT '成本率',
  `cost_f` decimal(12,2) DEFAULT NULL COMMENT '成本价',
  `baseunit` varchar(10) DEFAULT NULL COMMENT '基本单位',
  `basenumb` decimal(10,2) DEFAULT NULL,
  `is_halt` char(2) DEFAULT NULL,
  `list_order` mediumint(9) DEFAULT NULL,
  `flag` varchar(20) DEFAULT NULL COMMENT '是否寄售',
  `is_group` char(2) DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) DEFAULT NULL,
  `code_type` varchar(30) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜价表';

-- ----------------------------
--  Table structure for `pos_printer`
-- ----------------------------
DROP TABLE IF EXISTS `pos_printer`;
CREATE TABLE `pos_printer` (
  `hotel_group_id` bigint(20) DEFAULT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `descript` varchar(60) DEFAULT NULL,
  `descript_en` varchar(60) DEFAULT NULL,
  `ip_addr` varchar(48) DEFAULT NULL,
  `print_mode` varchar(12) DEFAULT NULL,
  `printer_type` varchar(30) DEFAULT NULL,
  `print_server` varchar(30) DEFAULT NULL,
  `dish_chk` varchar(30) DEFAULT NULL,
  `sta` char(3) DEFAULT NULL,
  `osta` char(3) DEFAULT NULL,
  `value_sta` varchar(60) DEFAULT NULL,
  `comm` varchar(3) DEFAULT NULL,
  `printer1` varchar(30) DEFAULT NULL,
  `set0` char(3) DEFAULT NULL,
  `set1` char(3) DEFAULT NULL,
  `set2` char(3) DEFAULT NULL,
  `set3` char(3) DEFAULT NULL,
  `set4` char(3) DEFAULT NULL,
  `set5` char(3) DEFAULT NULL,
  `set6` char(3) DEFAULT NULL,
  `create_user` varchar(60) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(60) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pos_printer_type`
-- ----------------------------
DROP TABLE IF EXISTS `pos_printer_type`;
CREATE TABLE `pos_printer_type` (
  `hotel_group_id` bigint(20) DEFAULT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `descript` varchar(96) DEFAULT NULL,
  `descript_en` varchar(96) DEFAULT NULL,
  `value_nr` varchar(60) DEFAULT NULL,
  `value_paperoff` varchar(60) DEFAULT NULL,
  `value_off` varchar(60) DEFAULT NULL,
  `ptype` varchar(3) DEFAULT NULL,
  `object` varchar(30) DEFAULT NULL,
  `printercmd` varchar(30) DEFAULT NULL,
  `dishlen` varchar(6) DEFAULT NULL,
  `numlen` varchar(6) DEFAULT NULL,
  `unitlen` varchar(6) DEFAULT NULL,
  `linelen` varchar(6) DEFAULT NULL,
  `pricelen` varchar(6) DEFAULT NULL,
  `printspeed` varchar(30) DEFAULT NULL,
  `printport` varchar(30) DEFAULT NULL,
  `sleep` varchar(30) DEFAULT NULL,
  `maxlooptimes` varchar(30) DEFAULT NULL,
  `create_user` varchar(60) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(60) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pos_prnscope`
-- ----------------------------
DROP TABLE IF EXISTS `pos_prnscope`;
CREATE TABLE `pos_prnscope` (
  `hotel_group_id` bigint(20) DEFAULT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pccode` varchar(3) DEFAULT NULL,
  `plusort` varchar(10) DEFAULT NULL,
  `plucode` varchar(10) DEFAULT NULL,
  `printers` varchar(50) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`pccode`,`plusort`,`plucode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pos_pserver`
-- ----------------------------
DROP TABLE IF EXISTS `pos_pserver`;
CREATE TABLE `pos_pserver` (
  `hotel_group_id` bigint(20) DEFAULT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `descript` varchar(32) DEFAULT NULL,
  `descript_en` varchar(32) DEFAULT NULL,
  `station` varchar(10) DEFAULT NULL,
  `sta_freshen` int(11) DEFAULT NULL,
  `print_freshen` int(11) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `pos_res`
-- ----------------------------
DROP TABLE IF EXISTS `pos_res`;
CREATE TABLE `pos_res` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `accnt` char(13) NOT NULL DEFAULT '' COMMENT ' 预订账号 建议R1503150001  日期+0001 序列号',
  `type1` varchar(100) DEFAULT '' COMMENT '客人类别1  和主单客人保持一致',
  `type2` varchar(100) DEFAULT '' COMMENT '客人类别2',
  `type3` varchar(100) DEFAULT '' COMMENT '客人类别3',
  `type4` varchar(100) DEFAULT '' COMMENT '客人类别4',
  `type5` varchar(100) DEFAULT '' COMMENT '客人类别5',
  `res_name` varchar(60) NOT NULL COMMENT '预订名称',
  `res_date` datetime NOT NULL COMMENT '预订日期',
  `pccode` varchar(10) NOT NULL DEFAULT '' COMMENT '营业点代码，',
  `mode` varchar(10) NOT NULL DEFAULT '' COMMENT '模式代码，',
  `shift` char(1) NOT NULL DEFAULT '' COMMENT '班别',
  `empid` varchar(10) DEFAULT '' COMMENT '工号',
  `sta` char(1) NOT NULL DEFAULT '' COMMENT '状态，R 预订 G 确认预订 I登记 X取消',
  `osta` char(1) DEFAULT '' COMMENT ' 上次状态',
  `biz_date` datetime NOT NULL COMMENT '营业日期',
  `table_type` varchar(5) DEFAULT '' COMMENT '-桌号类别',
  `tableno` varchar(10) DEFAULT '' COMMENT '-桌号',
  `exttableno` varchar(100) DEFAULT '' COMMENT '扩展桌号等',
  `numb` decimal(12,2) DEFAULT '0.00' COMMENT '桌数',
  `gsts` int(11) NOT NULL DEFAULT '0' COMMENT ' 客人数 ',
  `children` int(11) DEFAULT '0' COMMENT '儿童数',
  `market` varchar(10) DEFAULT '' COMMENT '市场代码',
  `source` varchar(10) DEFAULT '' COMMENT '来源代码',
  `haccnt` varchar(10) DEFAULT '' COMMENT ' 关联客户档案号',
  `name` varchar(80) DEFAULT '' COMMENT '关联客人姓名',
  `cusno` varchar(10) DEFAULT '' COMMENT '协议单位号',
  `cusinfo` varchar(60) DEFAULT '' COMMENT ' 协议单位名称',
  `cardno` varchar(20) DEFAULT '' COMMENT ' 贵宾卡号',
  `cardinfo` varchar(60) DEFAULT '' COMMENT ' 贵宾卡名称',
  `saleid` varchar(10) DEFAULT '' COMMENT '销售代码',
  `saleinfo` varchar(60) DEFAULT '' COMMENT '销售员信息',
  `phone` varchar(60) NOT NULL DEFAULT '' COMMENT '预订电话',
  `email` varchar(60) DEFAULT '' COMMENT 'email',
  `begin_time` varchar(10) DEFAULT '' COMMENT '预订时间点 exp:1200',
  `end_time` varchar(10) DEFAULT '' COMMENT '截止时间点 exp:1600',
  `arrtime` varchar(5) DEFAULT '12:00' COMMENT '到达时间',
  `amount` decimal(12,2) DEFAULT '0.00' COMMENT '标准金额',
  `type` char(1) DEFAULT '' COMMENT ' A/ 按桌 B/按人',
  `paytype` varchar(5) DEFAULT NULL COMMENT '付款方式 RMB 现付，TAR挂账。OTH 其他',
  `pay` decimal(12,2) DEFAULT '0.00' COMMENT '定金金额',
  `charge` decimal(12,2) DEFAULT '0.00' COMMENT '消费金额',
  `toaccnt` varchar(10) DEFAULT NULL COMMENT '挂账单位',
  `accntinfo` varchar(60) DEFAULT NULL COMMENT ' 挂账单位信息',
  `cmscode` varchar(10) DEFAULT '' COMMENT '佣金代码',
  `info` varchar(200) DEFAULT '' COMMENT '主单备注信息',
  `love` varchar(200) DEFAULT '' COMMENT '客人喜好',
  `qr_code` varchar(512) DEFAULT '' COMMENT '二维码 网站二维码',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`accnt`,`pccode`,`shift`,`sta`,`biz_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='餐饮预定表';

-- ----------------------------
--  Table structure for `pos_res_order`
-- ----------------------------
DROP TABLE IF EXISTS `pos_res_order`;
CREATE TABLE `pos_res_order` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `pcid` char(20) NOT NULL COMMENT '站点',
  `accnt` char(13) NOT NULL COMMENT '账号 账号11,预订单号目前按R+8位日期+4位流水0001  先按13位处理',
  `inumber` int(11) DEFAULT '1' COMMENT '序号 默认从1 开始,转入到pos_dish  要重新算过',
  `tnumber` int(11) DEFAULT NULL COMMENT '序号',
  `anumber` int(11) DEFAULT NULL,
  `mnumber` int(11) DEFAULT NULL COMMENT '套餐等序号,对应inumber',
  `type` char(1) DEFAULT NULL COMMENT '类型1',
  `orderno` varchar(10) DEFAULT '' COMMENT 'orderno ',
  `cond_code` varchar(11) DEFAULT NULL COMMENT '物料ID  如烧法等',
  `descript` varchar(30) NOT NULL DEFAULT '' COMMENT '名称',
  `descript_en` varchar(80) DEFAULT NULL COMMENT '英文名    ',
  `note_code` varchar(10) DEFAULT '' COMMENT '菜本',
  `sort_code` varchar(10) DEFAULT '' COMMENT '菜类',
  `plu_code` varchar(10) NOT NULL DEFAULT '' COMMENT ' 菜谱代码',
  `pinumber` int(11) DEFAULT NULL COMMENT '打印号,',
  `unit` varchar(4) DEFAULT '' COMMENT '单位',
  `price` decimal(12,2) DEFAULT '0.00' COMMENT '单价',
  `number` decimal(12,2) DEFAULT '0.00' COMMENT '数量',
  `amount` decimal(12,2) DEFAULT '0.00' COMMENT '金额',
  `sta` char(1) DEFAULT NULL COMMENT '状态I  X 取消',
  `flag` varchar(30) DEFAULT NULL COMMENT '菜谱flag ',
  `flag1` varchar(30) DEFAULT NULL COMMENT '对应明细 默认值 先暂时用掉10位1-10  第1位000000000F 如套餐则 最后一位是T',
  `empid` varchar(10) DEFAULT NULL COMMENT '点菜工号',
  `logdate` datetime DEFAULT NULL COMMENT '点菜时间',
  `saleid` varchar(10) DEFAULT NULL COMMENT '销售员代码',
  `tableno` varchar(6) DEFAULT NULL COMMENT '桌号',
  `siteno` varchar(5) DEFAULT NULL COMMENT '座位号',
  `cook` varchar(200) DEFAULT NULL COMMENT '烧饭,代码或中午字符',
  `remark` varchar(30) DEFAULT NULL COMMENT '整单备注 ',
  `printer` varchar(20) DEFAULT NULL COMMENT '打印机代码',
  `empid1` varchar(10) DEFAULT NULL COMMENT '服务员',
  `empid2` varchar(10) DEFAULT NULL COMMENT '工号2',
  `empid3` varchar(10) DEFAULT NULL COMMENT '工号3',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`accnt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='餐饮预订菜式表';

-- ----------------------------
--  Table structure for `pos_sort_all`
-- ----------------------------
DROP TABLE IF EXISTS `pos_sort_all`;
CREATE TABLE `pos_sort_all` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL COMMENT '菜类',
  `plu_code` varchar(10) NOT NULL COMMENT '菜本编码',
  `descript` varchar(30) NOT NULL COMMENT '名称',
  `descript_en` varchar(50) NOT NULL COMMENT '英文描述',
  `condst` varchar(100) DEFAULT NULL COMMENT '烧法组别',
  `tocode` varchar(100) DEFAULT NULL COMMENT '报表数据项',
  `is_halt` char(4) NOT NULL DEFAULT 'F' COMMENT '默认F',
  `list_order` mediumint(9) DEFAULT NULL,
  `is_group` char(2) DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) DEFAULT NULL,
  `code_type` varchar(30) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`,`code`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`code`,`plu_code`,`descript`,`tocode`,`is_halt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜本菜类表';

-- ----------------------------
--  Table structure for `pos_station`
-- ----------------------------
DROP TABLE IF EXISTS `pos_station`;
CREATE TABLE `pos_station` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL COMMENT '站点地址',
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(30) DEFAULT NULL,
  `pccodes` varchar(300) DEFAULT NULL COMMENT '管辖的营业点',
  `pccode` char(3) DEFAULT NULL COMMENT '默认营业点',
  `printers` varchar(120) DEFAULT NULL COMMENT '监控打印机',
  `tag` char(1) DEFAULT NULL,
  `tag1` char(1) DEFAULT NULL,
  `tag2` char(1) DEFAULT NULL,
  `tag3` char(1) DEFAULT NULL,
  `tag4` char(1) DEFAULT NULL,
  `tag5` char(1) DEFAULT NULL,
  `billprinter` char(3) DEFAULT NULL COMMENT '账单打印机',
  `localprinter` char(3) DEFAULT NULL COMMENT '本地打印机',
  `printer1` char(3) DEFAULT NULL COMMENT '传菜总单',
  `printer2` char(3) DEFAULT NULL COMMENT '清单总单',
  `printer3` char(3) DEFAULT NULL COMMENT '总单打印机3',
  `printer4` char(3) DEFAULT NULL COMMENT '总单打印机4',
  `printer5` char(3) DEFAULT NULL COMMENT '总单打印机5',
  `list_order` mediumint(9) DEFAULT NULL,
  `is_halt` char(2) DEFAULT NULL,
  `is_group` char(2) DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) DEFAULT NULL,
  `code_type` varchar(30) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='餐饮站点定义表';

-- ----------------------------
--  Table structure for `pos_sys_reason`
-- ----------------------------
DROP TABLE IF EXISTS `pos_sys_reason`;
CREATE TABLE `pos_sys_reason` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `dsc_type` varchar(10) DEFAULT '001' COMMENT '优惠类别',
  `code` char(3) NOT NULL COMMENT '优惠代码',
  `descript` varchar(60) NOT NULL COMMENT '营业点中文描叙',
  `descript_en` varchar(30) NOT NULL COMMENT '营业点英文描叙',
  `p01` decimal(20,4) DEFAULT NULL COMMENT '客房折扣率',
  `p02` decimal(20,4) DEFAULT NULL COMMENT '餐饮折扣率',
  `p03` decimal(20,4) DEFAULT NULL COMMENT '娱乐折扣率',
  `p04` decimal(20,4) DEFAULT NULL COMMENT '其他折扣率',
  `p90` decimal(20,4) DEFAULT NULL COMMENT '款待折扣率',
  `is_group` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) NOT NULL,
  `code_type` varchar(30) DEFAULT NULL,
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `list_order` mediumint(9) NOT NULL DEFAULT '0' COMMENT '缺省值0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠明细表';

-- ----------------------------
--  Table structure for `pos_table_map`
-- ----------------------------
DROP TABLE IF EXISTS `pos_table_map`;
CREATE TABLE `pos_table_map` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `type` varchar(6) DEFAULT NULL COMMENT '桌号类别（ABCD）',
  `type_descript` varchar(30) DEFAULT NULL,
  `pccode` varchar(6) NOT NULL COMMENT '营业点',
  `pccode_descript` varchar(30) DEFAULT NULL,
  `tableno` varchar(30) NOT NULL COMMENT '桌号',
  `exttableno` varchar(100) DEFAULT NULL,
  `accnt` char(13) DEFAULT NULL COMMENT '单号',
  `inumber` int(10) DEFAULT '1',
  `gsts` int(10) DEFAULT '1',
  `sta` varchar(1) NOT NULL COMMENT '桌号状态',
  `logdate` datetime DEFAULT NULL,
  `dishs` int(10) DEFAULT '1',
  `checks` int(10) DEFAULT '1',
  `pcrec` char(13) DEFAULT NULL COMMENT '联单号',
  `amount` decimal(12,2) DEFAULT NULL COMMENT '消费金额',
  `empid` varchar(10) DEFAULT NULL,
  `tblchk` varchar(1) DEFAULT NULL,
  `base` varchar(1) DEFAULT NULL,
  `selected` varchar(1) DEFAULT NULL,
  `unitname` varchar(60) DEFAULT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `shift` varchar(1) DEFAULT NULL,
  `arrtime` varchar(10) DEFAULT NULL,
  `tblname` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`type`,`pccode`,`tableno`),
  KEY `hotel_group_id_2` (`hotel_group_id`,`hotel_id`,`type`,`type_descript`,`pccode`,`pccode_descript`,`tableno`,`accnt`,`sta`,`pcrec`,`shift`,`tblname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='台位图实时资源';

-- ----------------------------
--  Table structure for `pos_table_sync`
-- ----------------------------
DROP TABLE IF EXISTS `pos_table_sync`;
CREATE TABLE `pos_table_sync` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `entity_name` varchar(50) DEFAULT '' COMMENT '实体名',
  `data_from` varchar(14) DEFAULT '',
  `data_to` varchar(14) DEFAULT '',
  `type` varchar(10) DEFAULT NULL COMMENT '同步类型',
  `is_sync` varchar(2) DEFAULT '' COMMENT '是否已经同步',
  `is_halt` varchar(2) DEFAULT 'F' COMMENT '是否有效',
  `create_user` varchar(20) NOT NULL COMMENT '创建用户',
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL COMMENT '修改用户',
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_win_name` (`hotel_group_id`,`hotel_id`,`entity_name`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COMMENT='PMS-POS云端同步';

-- ----------------------------
--  Table structure for `user_auth_cache_custom`
-- ----------------------------
DROP TABLE IF EXISTS `user_auth_cache_custom`;
CREATE TABLE `user_auth_cache_custom` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(16) NOT NULL,
  `auth_cache_str` varchar(10240) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user_pos_auth`
-- ----------------------------
DROP TABLE IF EXISTS `user_pos_auth`;
CREATE TABLE `user_pos_auth` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `app_code` varchar(3) DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL COMMENT '引用名auth_code',
  `parent_code` varchar(25) DEFAULT NULL,
  `descript` varchar(60) DEFAULT NULL,
  `descript_en` varchar(60) DEFAULT NULL,
  `auth_flag` varchar(30) DEFAULT NULL,
  `is_halt` char(2) DEFAULT NULL COMMENT 'T=yes, F=no',
  `list_order` mediumint(9) DEFAULT NULL COMMENT '缺省值0',
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indexmode1` (`hotel_group_id`,`hotel_id`,`code`,`parent_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='云餐饮权限定义表';

-- ----------------------------
--  Table structure for `user_pos_auth_user_auth`
-- ----------------------------
DROP TABLE IF EXISTS `user_pos_auth_user_auth`;
CREATE TABLE `user_pos_auth_user_auth` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(20) DEFAULT NULL COMMENT 'user.code 用户名',
  `role_code` varchar(10) DEFAULT NULL COMMENT 'user_role.code',
  `auth_hotel_group_id` bigint(16) DEFAULT NULL,
  `auth_hotel_id` bigint(16) DEFAULT NULL,
  `auth_code` varchar(25) NOT NULL COMMENT 'user_pos_auth.code',
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modeindex_unique` (`hotel_group_id`,`hotel_id`,`role_code`,`auth_code`,`auth_hotel_group_id`,`auth_hotel_id`),
  KEY `FK_Ref_role_auth_auth` (`auth_code`),
  KEY `FK_Ref_role_auth_role` (`role_code`),
  KEY `mi_role_id_auth_id_gid_hid` (`role_code`,`auth_code`,`hotel_group_id`,`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pos_web_interface_log`;
CREATE TABLE `pos_web_interface_log` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `hotel_group_code` varchar(30) DEFAULT '' COMMENT '集团代码 - src',
  `hotel_code` varchar(30) DEFAULT '' COMMENT '酒店代码 - src',
  `log_type` varchar(10) DEFAULT 'UP' COMMENT 'UP:上行;DOWN:下行',
  `model` varchar(20) DEFAULT NULL COMMENT '所属模块',
  `message_type` varchar(20) DEFAULT '' COMMENT '数据类型 - d_type',
  `message_no` varchar(30) DEFAULT '' COMMENT '消息编号 [P/C]+yyyyMMdd+8位流水',
  `status` varchar(10) DEFAULT 'SUCCESS' COMMENT '处理状态 SUCCESS:成功;FALT:失败',
  `pos_rsv_no` varchar(30) DEFAULT '' COMMENT '订单号',
  `other_no` varchar(60) DEFAULT '' COMMENT '其他订单号',
  `resource` varchar(30) DEFAULT '' COMMENT '请求渠道',
  `openid` varchar(30) DEFAULT '',
  `appid` varchar(30) DEFAULT '',
  `request_xml` text COMMENT 'request请求xml详情',
  `result_xml` text COMMENT 'result结果xml详情',
  `remark` varchar(512) DEFAULT '' COMMENT '备注信息,用于存放转换关系备注',
  `biz_date` datetime DEFAULT NULL COMMENT '营业日期',
  `flag` varchar(2) DEFAULT 'F' COMMENT 'T/F',
  `create_datetime` datetime DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`log_type`),
  KEY `Index_2` (`hotel_group_id`,`hotel_id`,`status`),
  KEY `Index_3` (`hotel_group_id`,`hotel_id`,`biz_date`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='绿云餐饮接口记录表 - 此表仅记录30天数据,过期数据将被清理或转储';


CREATE TABLE IF NOT EXISTS `pos_drinks_deposit_order` (
  `hotel_group_id` BIGINT(16) NOT NULL,
  `hotel_id` BIGINT(16) NOT NULL,
  `id` BIGINT(16) NOT NULL AUTO_INCREMENT COMMENT '单号',
  `owner` VARCHAR(20) NOT NULL COMMENT '寄存人',
  `phone` VARCHAR(20) NOT NULL COMMENT '电话',
  `state` CHAR(2) NOT NULL COMMENT 'I有效，X取消，O用完',
  `remark` VARCHAR(200) DEFAULT NULL,
  `create_user` VARCHAR(20) NOT NULL,
  `create_datetime` DATETIME NOT NULL,
  `modify_user` VARCHAR(20) NOT NULL,
  `modify_datetime` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pos_drinks_consume_history` (
  `hotel_group_id` BIGINT(16) NOT NULL,
  `hotel_id` BIGINT(16) NOT NULL,
  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
  `accnt` BIGINT(16) NOT NULL,
  `descript` VARCHAR(20) NOT NULL,
  `volume` VARCHAR(20) DEFAULT NULL,
  `consume_amount` INT(11) NOT NULL,
  `create_user` VARCHAR(20) NOT NULL,
  `create_datetime` DATETIME NOT NULL,
  `modify_user` VARCHAR(20) NOT NULL,
  `modify_datetime` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pos_store_article` (
  `hotel_group_id` BIGINT(16) NOT NULL,
  `hotel_id` BIGINT(16) NOT NULL,
  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(12) NOT NULL COMMENT '物品代码',
  `name` VARCHAR(20) NOT NULL COMMENT '物料名称',
  `unit` VARCHAR(6) NOT NULL COMMENT '单位',
  `price` DECIMAL(12,2) DEFAULT '0.00' COMMENT '价格',
  `max_quan` DECIMAL(12,2) DEFAULT '0.00',
  `min_quan` DECIMAL(12,2) DEFAULT '0.00',
  `sseg` VARCHAR(12) DEFAULT '' COMMENT '小类代码',
  `sname` VARCHAR(16) DEFAULT '' COMMENT '小类名称',
  `cseg` VARCHAR(12) DEFAULT '' COMMENT '大类代码',
  `cname` VARCHAR(10) DEFAULT '' COMMENT '大类名称',
  `oactmode` VARCHAR(10) DEFAULT 'RR 2',
  `actmode` VARCHAR(10) DEFAULT 'RR 2',
  `helpcode` VARCHAR(60) DEFAULT '' COMMENT '助记码',
  `standent` VARCHAR(16) DEFAULT '' COMMENT '规格',
  `band` VARCHAR(10) DEFAULT '',
  `warning` INT(11) DEFAULT '0',
  `lpno` INT(11) DEFAULT '0',
  `lprice` DECIMAL(12,2) DEFAULT '0.00',
  `unit2` VARCHAR(6) DEFAULT '',
  `equn2` DECIMAL(12,2) DEFAULT '0.00',
  `minprice` DECIMAL(12,2) DEFAULT '0.00',
  `minsup` VARCHAR(14) DEFAULT '',
  `maxprice` DECIMAL(12,2) DEFAULT '0.00',
  `maxsup` VARCHAR(14) DEFAULT '',
  `avprice` DECIMAL(12,2) DEFAULT '0.00',
  `storage` VARCHAR(2) DEFAULT '',
  `quocode` VARCHAR(3) DEFAULT '0',
  `csnumber` DECIMAL(12,2) DEFAULT '0.00' COMMENT '折换率',
  `csunit` VARCHAR(4) DEFAULT '' COMMENT '成本单位',
  `csbili` INT(11) DEFAULT '0',
  `cstype` VARCHAR(2) DEFAULT '' COMMENT '属性',
  `safe_quan` DECIMAL(12,2) DEFAULT '0.00',
  `valid` CHAR(1) DEFAULT '1',
  `ref` CHAR(60) DEFAULT '' COMMENT '备注',
  `sale_price` DECIMAL(12,2) DEFAULT '0.00',
  `limitnumber` DECIMAL(12,2) DEFAULT '0.00',
  `eng_name` VARCHAR(60) DEFAULT '',
  `eng_sname` VARCHAR(60) DEFAULT '',
  `eng_cname` VARCHAR(60) DEFAULT '',
  `create_user` VARCHAR(20) NOT NULL,
  `create_datetime` DATETIME NOT NULL,
  `modify_user` VARCHAR(20) NOT NULL,
  `modify_datetime` DATETIME NOT NULL,
  `is_group` CHAR(2) DEFAULT 'T' COMMENT 'T=yes F=no',
  `group_code` VARCHAR(30) DEFAULT '',
  `code_type` VARCHAR(30) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=3072 DEFAULT CHARSET=utf8 COMMENT='餐饮物品表';

/*
SQLyog Ultimate v8.32 
MySQL - 5.1.57-community-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

CREATE TABLE IF NOT EXISTS `pos_store_bar` (
  `hotel_group_id` BIGINT(16) NOT NULL,
  `hotel_id` BIGINT(16) NOT NULL,
  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) NOT NULL,
  `descript` VARCHAR(20) NOT NULL,
  `descript_en` VARCHAR(20) DEFAULT NULL,
  `pccodes` VARCHAR(50) DEFAULT NULL COMMENT '所管理的营业点',
  `staffId` VARCHAR(20) DEFAULT NULL COMMENT '工号',
  `create_user` VARCHAR(20) NOT NULL,
  `create_datetime` DATETIME NOT NULL,
  `modify_user` VARCHAR(20) NOT NULL,
  `modify_datetime` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*
SQLyog Ultimate v8.32 
MySQL - 5.1.57-community-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

CREATE TABLE IF NOT EXISTS `pos_store_detail` (
  `hotel_group_id` BIGINT(16) NOT NULL,
  `hotel_id` BIGINT(16) NOT NULL,
  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
  `accnt` VARCHAR(20) NOT NULL,
  `article_code` VARCHAR(12) NOT NULL,
  `article_name` VARCHAR(20) NOT NULL,
  `packing_size` VARCHAR(20) DEFAULT NULL COMMENT '规格',
  `price` DECIMAL(12,2) DEFAULT NULL,
  `unit` CHAR(4) DEFAULT NULL,
  `number` INT(11) DEFAULT NULL,
  `amount` DECIMAL(12,2) DEFAULT NULL,
  `create_user` VARCHAR(20) DEFAULT NULL,
  `create_datetime` DATETIME DEFAULT NULL,
  `modify_user` VARCHAR(20) DEFAULT NULL,
  `modify_datetime` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*
SQLyog Ultimate v8.32 
MySQL - 5.1.57-community-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

CREATE TABLE IF NOT EXISTS `pos_store_class` (
  `hotel_group_id` BIGINT(16) NOT NULL,
  `hotel_id` BIGINT(16) NOT NULL,
  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) NOT NULL COMMENT '物品类别编码',
  `name` VARCHAR(24) NOT NULL COMMENT '描述',
  `eng_name` VARCHAR(24) DEFAULT NULL COMMENT '英文描述',
  `create_user` VARCHAR(20) NOT NULL,
  `create_datetime` DATETIME NOT NULL,
  `modify_user` VARCHAR(20) NOT NULL,
  `modify_datetime` DATETIME NOT NULL,
  `is_group` CHAR(2) DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` VARCHAR(30) DEFAULT '',
  `code_type` VARCHAR(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index1` (`code`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='餐饮物品大类表';

/*
SQLyog Ultimate v8.32 
MySQL - 5.1.57-community-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

CREATE TABLE IF NOT EXISTS `pos_store_master` (
  `hotel_group_id` BIGINT(16) NOT NULL,
  `hotel_id` BIGINT(16) NOT NULL,
  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
  `accnt` VARCHAR(20) NOT NULL COMMENT '单号',
  `type` CHAR(2) NOT NULL COMMENT '账单类型（入库01，销售02，调拨03，盘点04，结转05，等）',
  `source_code` VARCHAR(20) DEFAULT NULL COMMENT '出货库',
  `target_code` VARCHAR(20) DEFAULT NULL COMMENT '目标库或营业点',
  `date` DATETIME DEFAULT NULL,
  `invoice` VARCHAR(20) DEFAULT NULL COMMENT '发票号',
  `user_code` VARCHAR(20) DEFAULT NULL,
  `remark` VARCHAR(200) DEFAULT NULL,
  `create_user` VARCHAR(20) DEFAULT NULL,
  `create_datetime` DATETIME DEFAULT NULL,
  `modify_user` VARCHAR(20) DEFAULT NULL,
  `modify_datetime` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*
SQLyog Ultimate v8.32 
MySQL - 5.1.57-community-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;



CREATE TABLE IF NOT EXISTS `pos_store_plu_article` (
  `hotel_group_id` BIGINT(16) NOT NULL,
  `hotel_id` BIGINT(16) NOT NULL,
  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
  `plu_code` VARCHAR(10) NOT NULL,
  `plu_name` VARCHAR(50) DEFAULT NULL,
  `art_code` VARCHAR(12) NOT NULL,
  `art_name` VARCHAR(20) DEFAULT NULL,
  `create_user` VARCHAR(20) NOT NULL,
  `create_datetime` DATETIME NOT NULL,
  `modify_user` VARCHAR(20) NOT NULL,
  `modify_datetime` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用于plu_code和art_code的绑定';

/*
SQLyog Ultimate v8.32 
MySQL - 5.1.57-community-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

CREATE TABLE IF NOT EXISTS `pos_store_inventory` (
  `hotel_group_id` BIGINT(16) DEFAULT NULL,
  `hotel_id` BIGINT(16) DEFAULT NULL,
  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
  `bar_code` VARCHAR(20) DEFAULT NULL COMMENT '目标库或营业点',
  `article_code` VARCHAR(12) NOT NULL,
  `article_name` VARCHAR(20) NOT NULL,
  `unit` CHAR(4) DEFAULT NULL,
  `number` DECIMAL(33,2) DEFAULT NULL,
  `amount` DECIMAL(35,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='吧台库存表';

/*
SQLyog Ultimate v8.32 
MySQL - 5.1.57-community-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

CREATE TABLE IF NOT EXISTS `pos_store_unit` (
  `hotel_group_id` BIGINT(16) NOT NULL,
  `hotel_id` BIGINT(16) NOT NULL,
  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
  `code` CHAR(4) NOT NULL,
  `descript` CHAR(4) NOT NULL,
  `descript_en` VARCHAR(20) DEFAULT NULL,
  `create_user` VARCHAR(20) NOT NULL,
  `create_datetime` DATETIME NOT NULL,
  `modify_user` VARCHAR(20) NOT NULL,
  `modify_datetime` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*
SQLyog Ultimate v8.32 
MySQL - 5.1.57-community-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

CREATE TABLE IF NOT EXISTS `pos_store_subclass` (
  `hotel_group_id` BIGINT(16) NOT NULL,
  `hotel_id` BIGINT(16) NOT NULL,
  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) NOT NULL COMMENT '物品类别编码',
  `name` VARCHAR(24) NOT NULL COMMENT '描述',
  `eng_name` VARCHAR(24) DEFAULT NULL COMMENT '英文描述',
  `cseg` VARCHAR(10) DEFAULT NULL COMMENT '所属大类',
  `cname` VARCHAR(24) DEFAULT NULL COMMENT '英文描述',
  `cstype` VARCHAR(10) DEFAULT NULL,
  `eng_cname` VARCHAR(24) DEFAULT NULL COMMENT '英文描述',
  `create_user` VARCHAR(20) NOT NULL,
  `create_datetime` DATETIME NOT NULL,
  `modify_user` VARCHAR(20) NOT NULL,
  `modify_datetime` DATETIME NOT NULL,
  `is_group` CHAR(2) DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` VARCHAR(30) DEFAULT '',
  `code_type` VARCHAR(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index1` (`code`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='餐饮物料二级类表';

DROP TABLE IF EXISTS `pos_pccode_audit_flag`;
CREATE TABLE `pos_pccode_audit_flag` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `pos_pccode` varchar(20) NOT NULL DEFAULT '',
  `pos_pccode_descript` varchar(60) DEFAULT '',
  `biz_date` datetime NOT NULL,
  `biz_date1` datetime NOT NULL,
  `is_audit` char(2) NOT NULL DEFAULT 'F' COMMENT 'T/F',
  `audit_user` varchar(20) NOT NULL DEFAULT '',
  `station_audit` varchar(20) NOT NULL DEFAULT '',
  `is_rmposted` char(2) DEFAULT 'F' COMMENT 'T/F',
  `station_rmcheck` varchar(20) DEFAULT '',
  `station_rmpost` varchar(20) DEFAULT '',
  `is_exclude_part` char(2) DEFAULT 'F' COMMENT 'T/F',
  `station_exclude_part` varchar(20) DEFAULT '',
  `is_can_checkout` char(2) DEFAULT 'T' COMMENT 'T/F',
  `is_keypart` char(2) DEFAULT 'F' COMMENT 'T/F',
  `is_year_first_day` char(2) DEFAULT 'F' COMMENT 'T/F',
  `is_month_first_day` char(2) DEFAULT 'F' COMMENT 'T/F',
  `is_report_done` char(2) DEFAULT 'T' COMMENT 'T/F',
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`pos_pccode`,`biz_date`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 权限代码生成
truncate table user_pos_auth;
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','posMode','0','模块设置','模块设置',NULL,'F','0','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','posSystemGroup','0','集团系统设置','集团系统设置',NULL,'F','0','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','posSystem','0','系统设置','系统设置',NULL,'F','0','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','posSystemLocal','0','本地设置','本地设置',NULL,'F','0','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','posCashier','0','收银设置','收银设置',NULL,'F','0','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','posOrder','0','点菜设置','点菜设置',NULL,'F','0','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','posRes','0','预订设置','预订设置',NULL,'F','0','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posMode!Cashier','posMode','综合收银','综合收银',NULL,'F','1001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posMode!System','posMode','系统维护','系统维护',NULL,'F','1001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posMode!SystemLocal','posMode','本地维护','本地维护',NULL,'F','1001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posOrder!create','posOrder','新开单','新开单',NULL,'F','6001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posOrder!order','posOrder','点菜下单','点菜下单',NULL,'F','6001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posOrder!delete','posOrder','退菜','退菜',NULL,'F','6001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posOrder!orderOffline','posOrder','离线点菜','离线点菜',NULL,'F','6001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!masterEdit','posCashier','主单信息修改','主单信息修改',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!link','posCashier','联单','联单',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!change','posCashier','换桌','换桌',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!merger','posCashier','并桌','并桌',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!revoke','posCashier','消单','消单',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!pluDsc','posCashier','单菜折扣','单菜折扣',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!pluEnt','posCashier','单菜赠送','单菜赠送',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!YJbill','posCashier','预结单打印','预结单打印',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!bill','posCashier','账单打印','账单打印',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!checkOut','posCashier','结账','结账',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!res','posCashier','预订详情','预订详情',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!resOpen','posCashier','预订转登记','预订转登记',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!report','posCashier','交班报表','交班报表',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!checkRe','posCashier','撤销结账','撤销结账',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!checkS','posCashier','挂S账','挂S账',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!checkReC','posCashier','重登','重登',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!syncUp','posCashier','云同步','云同步',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!audit','posCashier','夜间稽核','夜间稽核',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!access','posCashier','沽清设置','沽清设置',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!accessDel','posCashier','沽清取消','沽清取消',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!station','posCashier','站点管理','站点管理',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!getData','posCashier','数据更新','数据更新',NULL,'F','7001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posRes!resList','posRes','预订列表查询','预订列表查询',NULL,'F','5001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posRes!res','posRes','新建预订','新建预订',NULL,'F','5001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posRes!resEdit','posRes','预订主单修改','预订主单修改',NULL,'F','5001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posRes!resPlu','posRes','预订菜式','预订菜式',NULL,'F','5001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posRes!resPay','posRes','预定金','预定金',NULL,'F','5001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posRes!resDel','posRes','预订取消','预订取消',NULL,'F','5001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posRes!resRe','posRes','预订恢复','预订恢复',NULL,'F','5001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posRes!resPayList','posRes','定金列表','定金列表',NULL,'F','5001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posSystemGroup!code','posSystemGroup','基本代码设置','基本代码设置',NULL,'F','2001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posSystem!mode','posSystem','模式设置','模式设置',NULL,'F','3001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posSystemGroup!pluE','posSystemGroup','菜谱编辑','菜谱编辑',NULL,'F','2001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posSystemGroup!condst','posSystemGroup','做法设置','做法设置',NULL,'F','2001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posSystemGroup!sysopt','posSystemGroup','参数设置','参数设置',NULL,'F','2001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posSystemGroup!report','posSystemGroup','集团报表','集团报表',NULL,'F','2001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posSystem!code','posSystem','代码设置','代码设置',NULL,'F','3001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posSystem!pluE','posSystem','菜谱设置','菜谱设置',NULL,'F','3001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posSystem!pccode','posSystem','营业点设置','营业点设置',NULL,'F','3001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posSystem!report','posSystem','酒店报表','酒店报表',NULL,'F','3001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posSystem!master','posSystem','餐单查询','餐单查询',NULL,'F','3001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posSystemGroup!master','posSystemGroup','餐单查询','餐单查询',NULL,'F','2001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posSystem!editAuth','posSystem','权限设置','权限设置',NULL,'F','3001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posSystemLocal!print','posSystemLocal','厨打设置','厨打设置',NULL,'F','4001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posSystemLocal!interf','posSystemLocal','接口设置','接口设置',NULL,'F','4001','ADMIN','2015-11-25 17:21:21','ADMIN','2015-11-25 17:21:21');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) values('2','-1','pos','pos!posCashier!SstaChange','posCashier','S状态下修改','S状态下修改',NULL,'F','7001','ADMIN','2016-03-24 11:27:00','ADMIN','2016-03-24 11:27:06');
insert into `user_pos_auth` (`hotel_group_id`, `hotel_id`, `app_code`, `code`, `parent_code`, `descript`, `descript_en`, `auth_flag`, `is_halt`, `list_order`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`)
SELECT t2.hotel_group_id,t2.id,t1.app_code,t1.code,t1.parent_code,t1.descript,t1.descript_en,t1.auth_flag,t1.is_halt,t1.list_order,t1.create_user,t1.create_datetime,t1.modify_user,t1.modify_datetime
FROM user_pos_auth t1,hotel t2
WHERE t1.hotel_id=-1;
DELETE FROM user_pos_auth WHERE hotel_id=-1;