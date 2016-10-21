/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/3/23 星期一 13:36:29                       */
/*==============================================================*/


drop table if exists  app;
drop table if exists  audit_date;
drop table if exists  audit_flag;
drop table if exists  audit_process;
drop table if exists  bill_define;
drop table if exists  bill_printer;
drop table if exists  bill_scene_link;
drop table if exists  bill_template;
drop table if exists  biz_month;

drop table if exists  code_bankcard_link;
drop table if exists  code_base;
drop table if exists  code_cache;
drop table if exists  code_city;
drop table if exists  code_country;
drop table if exists  code_currency;
drop table if exists  code_division;
drop table if exists  code_province;
drop table if exists  code_table;
drop table if exists  code_town;
drop table if exists  code_transaction;
drop table if exists  hotel;
drop table if exists  hotel_around_traffic;
drop table if exists  hotel_def;
drop table if exists  hotel_group;
drop table if exists  hotel_promotion;
drop table if exists  hotel_service_config;
drop table if exists  hotel_special_prompt;
drop table if exists  ip;
drop table if exists  pos_audit_dish;
drop table if exists  pos_audit_menu;
drop table if exists  pos_deposit_detail;
drop table if exists  pos_deposit_sum;
drop table if exists  pos_deptdai;
drop table if exists  pos_deptdai_history;
drop table if exists  pos_deptjie;
drop table if exists  pos_deptjie_history;
drop table if exists  pos_dish;
drop table if exists  pos_dish_history;
drop table if exists  pos_interface_log;
drop table if exists  pos_interface_map;
drop table if exists  pos_menu;
drop table if exists  pos_menu_history;
drop table if exists  pos_report;
drop table if exists  pos_srv_table;
drop table if exists  rep_dai;

drop table if exists  rep_jie;
drop table if exists  rep_jiedai;
drop table if exists  report_category;
drop table if exists  report_center;
drop table if exists  sales_man;
drop table if exists  sales_man_business;
drop table if exists  sso;
drop table if exists  sync_ip;
drop table if exists  sys_error;
drop table if exists  sys_extra_id;
drop table if exists  sys_list_meta;
drop table if exists  sys_option;
drop table if exists  sys_template;
drop table if exists  tp_audit_report;
drop table if exists  tp_budget;
drop table if exists  user;
drop table if exists  user_auth;
drop table if exists  user_auth_building;
drop table if exists  user_auth_cache;
drop table if exists  user_auth_cache_custom;

drop table if exists  user_auth_cfg_dept_role;
drop table if exists  user_auth_cfg_role_auth;
drop table if exists  user_auth_cfg_role_card;
drop table if exists  user_auth_cfg_role_rep;
drop table if exists  user_auth_cfg_user_role;
drop table if exists  user_auth_temp;
drop table if exists  user_auth_temp_user;
drop table if exists  user_dept;
drop table if exists  user_habits_base;
drop table if exists  user_note;
drop table if exists  user_pwd;
drop table if exists  user_role;
drop table if exists  work_station;
drop table if exists  work_station_scape;
drop table if exists  work_station_status;
drop table if exists  work_station_status_history;
drop table if exists  work_station_verify;
drop table if exists  work_status;



/*==============================================================*/
/* User: portal                                                 */
/*==============================================================*/
CREATE TABLE `app` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL,
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL DEFAULT '',
  `app_type` varchar(20) NOT NULL DEFAULT 'HOTEL',
  `remark` varchar(255) DEFAULT NULL,
  `exe_name` varchar(30) NOT NULL COMMENT '不含路径',
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=停用 F=正常使用',
  `list_order` mediumint(9) NOT NULL DEFAULT '0' COMMENT '缺省值0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`code`),
  UNIQUE KEY `Index_2` (`descript`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='所有应用的代码定义';
CREATE TABLE `audit_date` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL,
  `date_begin` datetime NOT NULL COMMENT '包含准确时间',
  `date_end` datetime NOT NULL COMMENT '包含准确时间',
  `audit_user` varchar(20) NOT NULL COMMENT 'user.code',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`biz_date`),
  UNIQUE KEY `Index_2` (`hotel_group_id`,`hotel_id`,`date_begin`,`date_end`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `audit_flag` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL,
  `biz_date1` datetime NOT NULL,
  `is_rmposted` char(2) NOT NULL DEFAULT 'F' COMMENT 'T/F',
  `station_rmcheck` varchar(20) NOT NULL DEFAULT '',
  `station_rmpost` varchar(20) NOT NULL DEFAULT '',
  `rmpost_biz_date` datetime NOT NULL,
  `rmpost_datetime` datetime NOT NULL,
  `is_audit` char(2) NOT NULL DEFAULT 'F' COMMENT 'T/F',
  `audit_user` varchar(20) NOT NULL DEFAULT '',
  `station_audit` varchar(20) NOT NULL DEFAULT '',
  `is_exclude_part` char(2) NOT NULL DEFAULT 'F' COMMENT 'T/F',
  `station_exclude_part` varchar(20) NOT NULL DEFAULT '',
  `is_can_checkout` char(2) NOT NULL DEFAULT 'T' COMMENT 'T/F',
  `is_keypart` char(2) NOT NULL DEFAULT 'F' COMMENT 'T/F',
  `is_year_first_day` char(2) NOT NULL DEFAULT 'F' COMMENT 'T/F',
  `is_month_first_day` char(2) NOT NULL DEFAULT 'F' COMMENT 'T/F',
  `is_report_done` char(2) NOT NULL DEFAULT 'T' COMMENT 'T/F',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `audit_process` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `exec_type` varchar(10) NOT NULL DEFAULT 'A',
  `exec_order` int(11) NOT NULL DEFAULT '0',
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL DEFAULT '',
  `exec_service_name` varchar(200) NOT NULL,
  `exec_method_name` varchar(200) NOT NULL,
  `exec_script` varchar(120) NOT NULL DEFAULT '',
  `start_time` datetime NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `duration_pre` int(11) NOT NULL DEFAULT '0',
  `modu_code` char(2) NOT NULL COMMENT 'code_base.modu_code.code',
  `is_done` char(2) NOT NULL DEFAULT 'F',
  `is_rebuild` char(2) NOT NULL DEFAULT 'F',
  `is_halt` char(2) NOT NULL DEFAULT 'F',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mi_gid_hid_descript` (`hotel_group_id`,`hotel_id`,`descript`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `bill_define` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL DEFAULT '',
  `template` varchar(20) NOT NULL COMMENT 'bill_template.code',
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=YES F=NO',
  `list_order` mediumint(9) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `meta_code1` varchar(20) DEFAULT '',
  `meta_code2` varchar(20) DEFAULT '',
  `rep_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='实际业务的各类单据，每个单据需要对应一个单据模板';
CREATE TABLE `bill_printer` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `descript` varchar(60) NOT NULL COMMENT '冗余字段',
  `descript_en` varchar(60) NOT NULL DEFAULT '' COMMENT '冗余字段',
  `station_code` varchar(20) NOT NULL COMMENT 'work_station.code',
  `bill_code` varchar(20) NOT NULL COMMENT 'bill_template.code',
  `printer1` varchar(60) NOT NULL COMMENT '打印机名',
  `printer2` varchar(60) DEFAULT NULL COMMENT '打印机名',
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=YES F=NO ',
  `list_order` mediumint(9) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`station_code`,`bill_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定义各种单据需要输出的缺省打印机。当第一个打印机无效的时候，自动启用第二个打印机 ';
CREATE TABLE `bill_scene_link` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `scene_code` varchar(20) NOT NULL COMMENT 'code_base.bill_scene.code ',
  `bill_code` varchar(20) NOT NULL COMMENT 'bill_define.code',
  `is_default` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=YES F=NO',
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=YES F=NO',
  `list_order` mediumint(9) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`scene_code`,`bill_code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='定义各个业务场景包括的单据及其缺省单据。一般一个场景对应多个单据，但是有且只有一个缺省单据。';
CREATE TABLE `bill_template` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL COMMENT 'code_base.language.code',
  `show_ctrl` varchar(10) NOT NULL DEFAULT 'PREVIEW' COMMENT 'PRINT=直接打印 PREVIEW=预览 WORDDOT=WORD模板',
  `paper_width` mediumint(9) NOT NULL DEFAULT '0',
  `paper_length` mediumint(9) NOT NULL DEFAULT '0',
  `detail_rows` tinyint(4) NOT NULL DEFAULT '0',
  `paper_zoom` tinyint(4) NOT NULL DEFAULT '100',
  `is_save_modi` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=YES F=NO',
  `bill_define` text NOT NULL COMMENT '定义语法或者模板文件',
  `word_dot` varchar(512) DEFAULT NULL COMMENT '模板文件名及其路径',
  `extra_ctrl` varchar(30) DEFAULT NULL COMMENT '预留控制属性',
  `remark` varchar(512) DEFAULT NULL,
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=YES F=NO',
  `list_order` mediumint(9) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`code`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='纯粹的格式定义。关键索引是 code+language ';
CREATE TABLE `biz_month` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_year` smallint(6) NOT NULL,
  `biz_month` tinyint(4) NOT NULL,
  `begin_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `day_num` smallint(6) NOT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`biz_year`,`biz_month`),
  KEY `mi_gid_hid_begin_date` (`hotel_group_id`,`hotel_id`,`begin_date`),
  KEY `mi_gid_hid_end_date` (`hotel_group_id`,`hotel_id`,`end_date`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='财务月度日期定义，不一定跟物理日期一致 ';

CREATE TABLE `code_bankcard_link` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `ta_code` varchar(10) NOT NULL COMMENT 'code_transaction.code',
  `bank_code` varchar(10) NOT NULL COMMENT 'code_base.bankcode',
  `arno` varchar(20) NOT NULL COMMENT 'ar_master.arno',
  `commission` decimal(8,2) NOT NULL DEFAULT '0.00',
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `is_group` varchar(20) DEFAULT '',
  `group_code` varchar(20) DEFAULT '',
  `code_type` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`ta_code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='界定付款代码、收单行、AR帐户的关系。如果信用卡不用AR管理，则AR帐户不用定义。';
CREATE TABLE `code_base` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `parent_code` varchar(30) NOT NULL COMMENT '这里的代码便于理解',
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL DEFAULT '',
  `max_len` tinyint(4) NOT NULL DEFAULT '0',
  `flag` varchar(30) NOT NULL DEFAULT '',
  `code_category` varchar(30) NOT NULL DEFAULT '',
  `is_sys` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `is_group` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `group_code` varchar(30) NOT NULL DEFAULT '',
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `list_order` mediumint(9) NOT NULL DEFAULT '0' COMMENT '缺省值0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `code_type` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`parent_code`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='系统所有简单代码都在这里定义。该代码可以定义父子关系。 ';
CREATE TABLE `code_cache` (
  `hotel_id` bigint(16) DEFAULT NULL,
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(180) DEFAULT NULL,
  `create_user` varchar(60) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(60) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  `flex_service` varchar(180) DEFAULT NULL,
  `flex_method` varchar(180) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modeindex_hotel_group_id_hotel_id_modify_datetime` (`hotel_group_id`,`hotel_id`,`modify_datetime`),
  KEY `modeindex_hotel_group_id_hotel_id_entity_name` (`hotel_group_id`,`hotel_id`,`entity_name`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `code_city` (
  `hotel_group_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(32) NOT NULL DEFAULT '',
  `descript` varchar(32) NOT NULL DEFAULT '',
  `descript_short` varchar(32) NOT NULL DEFAULT '',
  `descript_en` varchar(64) NOT NULL DEFAULT '',
  `descript_en_short` varchar(32) NOT NULL DEFAULT '',
  `pinyin` varchar(32) NOT NULL DEFAULT '',
  `pinyin_short` varchar(32) NOT NULL DEFAULT '',
  `phone_code` varchar(32) NOT NULL DEFAULT '',
  `post_code` varchar(32) NOT NULL DEFAULT '',
  `is_halt` varchar(2) NOT NULL DEFAULT 'F',
  `country_id` bigint(20) DEFAULT NULL,
  `country_code` varchar(32) NOT NULL DEFAULT '',
  `province_id` bigint(20) DEFAULT NULL,
  `province_code` varchar(32) NOT NULL DEFAULT '',
  `is_foreign` varchar(2) NOT NULL DEFAULT 'F',
  `is_capital` varchar(2) NOT NULL DEFAULT 'F',
  `is_province_capital` varchar(2) NOT NULL DEFAULT 'F',
  `is_recommend` varchar(2) NOT NULL DEFAULT 'F',
  `recommend_list_order` int(11) NOT NULL DEFAULT '0',
  `list_order` int(11) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `code_type` varchar(30) DEFAULT '',
  `group_code` varchar(30) DEFAULT '',
  `is_group` varchar(2) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `code_country` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL DEFAULT '',
  `help_code` varchar(20) NOT NULL DEFAULT '' COMMENT '中文描述首字母拼音，一般自动生成',
  `language` varchar(10) NOT NULL COMMENT 'code_base.language.code',
  `short_code` varchar(10) NOT NULL,
  `iso_code` varchar(10) NOT NULL,
  `addr_format` varchar(10) DEFAULT NULL COMMENT '预留',
  `world_region` varchar(10) NOT NULL COMMENT 'code_base.world_region.code',
  `flag1` varchar(10) DEFAULT NULL COMMENT 'CN=中国 HK=香港 MO=澳门  TW=台湾',
  `flag2` varchar(10) DEFAULT NULL,
  `flag3` varchar(10) DEFAULT NULL,
  `flag4` varchar(10) DEFAULT NULL,
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes  F=no',
  `list_order` mediumint(9) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `descript_short` varchar(32) DEFAULT NULL,
  `descript_en_short` varchar(32) DEFAULT NULL,
  `pinyin` varchar(64) DEFAULT NULL,
  `pinyin_short` varchar(32) DEFAULT NULL,
  `phone_code` varchar(32) DEFAULT NULL,
  `is_foreign` varchar(2) DEFAULT NULL,
  `code_type` varchar(30) DEFAULT '',
  `group_code` varchar(30) DEFAULT '',
  `is_group` varchar(2) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`code`),
  UNIQUE KEY `Index_2` (`hotel_group_id`,`hotel_id`,`descript`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='国家代码';
CREATE TABLE `code_currency` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL COMMENT '币种代码，引用名currency',
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL DEFAULT '',
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '仅针对旅行支票的时候使用',
  `base` decimal(8,2) NOT NULL DEFAULT '0.00',
  `buying_rate` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `cash_buying_rate` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `selling_rate` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T/F',
  `list_order` mediumint(9) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`code`),
  UNIQUE KEY `Index_2` (`hotel_group_id`,`hotel_id`,`descript`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='汇率定义。需要有非常完备的日志，非常重要。 涉及到金额的计算。';
CREATE TABLE `code_division` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `country` varchar(10) NOT NULL COMMENT 'code_country.code',
  `province` varchar(10) NOT NULL COMMENT 'code_province.code',
  `code` varchar(10) NOT NULL,
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL DEFAULT '',
  `help_code` varchar(20) NOT NULL DEFAULT '' COMMENT '中文描述首字母拼音，一般自动生成',
  `zipcode_begin` varchar(10) DEFAULT NULL COMMENT '一般是6位',
  `zipcode_end` varchar(10) DEFAULT NULL COMMENT '一般是6位',
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes  F=no',
  `list_order` mediumint(9) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `descript_short` varchar(32) DEFAULT NULL,
  `descript_en_short` varchar(32) DEFAULT NULL,
  `pinyin` varchar(64) DEFAULT NULL,
  `pinyin_short` varchar(32) DEFAULT NULL,
  `phone_code` varchar(32) DEFAULT NULL,
  `post_code` varchar(32) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `city_code` varchar(32) DEFAULT NULL,
  `province_id` bigint(20) DEFAULT NULL,
  `is_foreign` varchar(2) DEFAULT NULL,
  `is_city_capital` varchar(2) DEFAULT NULL,
  `is_province_capital` varchar(2) DEFAULT NULL,
  `code_type` varchar(30) DEFAULT '',
  `group_code` varchar(30) DEFAULT '',
  `is_group` varchar(2) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`country`,`province`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='行政区划代码。针对具体每个国家，每个省，每个城市和区域来定义 ';

CREATE TABLE `code_province` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `country` varchar(10) NOT NULL COMMENT 'code_country.code',
  `code` varchar(10) NOT NULL,
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL DEFAULT '',
  `help_code` varchar(20) NOT NULL DEFAULT '' COMMENT '中文描述首字母拼音，一般自动生成',
  `short_code` varchar(10) NOT NULL DEFAULT '',
  `zipcode_begin` varchar(10) DEFAULT NULL COMMENT '一般是6位',
  `zipcode_end` varchar(10) DEFAULT NULL COMMENT '一般是6位',
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes  F=no',
  `list_order` mediumint(9) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `descript_short` varchar(32) DEFAULT NULL,
  `descript_en_short` varchar(32) DEFAULT NULL,
  `pinyin` varchar(64) DEFAULT NULL,
  `pinyin_short` varchar(32) DEFAULT NULL,
  `phone_code` varchar(32) DEFAULT NULL,
  `country_code` varchar(32) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `is_foreign` varchar(2) DEFAULT NULL,
  `code_type` varchar(30) DEFAULT '',
  `group_code` varchar(30) DEFAULT '',
  `is_group` varchar(2) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`country`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='省州代码。跟国家代码组成唯一关键字。';

CREATE TABLE `code_table` (
  `table_name` varchar(30) NOT NULL,
  `table_flag` varchar(20) NOT NULL COMMENT 'code, business, parameter',
  `table_action` varchar(20) NOT NULL COMMENT 'init',
  `remark` varchar(255) DEFAULT NULL,
  `have_grp_id` char(2) DEFAULT 'F',
  `have_htl_id` char(2) DEFAULT 'F'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `code_town` (
  `hotel_group_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(32) NOT NULL DEFAULT '',
  `descript` varchar(32) NOT NULL DEFAULT '',
  `descript_short` varchar(32) NOT NULL DEFAULT '',
  `descript_en` varchar(64) NOT NULL DEFAULT '',
  `descript_en_short` varchar(32) NOT NULL DEFAULT '',
  `pinyin` varchar(64) NOT NULL DEFAULT '',
  `pinyin_short` varchar(32) NOT NULL DEFAULT '',
  `phone_code` varchar(32) NOT NULL DEFAULT '',
  `post_code` varchar(32) NOT NULL DEFAULT '',
  `is_halt` varchar(2) NOT NULL DEFAULT 'F',
  `city_id` bigint(20) DEFAULT NULL,
  `city_code` varchar(32) NOT NULL DEFAULT '',
  `district_id` bigint(20) DEFAULT NULL,
  `district_code` varchar(32) NOT NULL DEFAULT '',
  `is_foreign` varchar(2) NOT NULL DEFAULT 'F',
  `is_city_capital` varchar(2) NOT NULL DEFAULT 'F',
  `is_district_capital` varchar(2) NOT NULL DEFAULT 'F',
  `list_order` int(11) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `code_type` varchar(30) DEFAULT '',
  `group_code` varchar(30) DEFAULT '',
  `is_group` varchar(2) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `code_transaction` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL COMMENT '代码<9表示费用，>=9表示收款。其他表引用 ta_code',
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL DEFAULT '',
  `modu_code` varchar(10) NOT NULL COMMENT 'code_base.moduno',
  `code_tag` varchar(10) NOT NULL DEFAULT '' COMMENT '房费服务费=RMSRV 房费税=RMTAX 早餐=BF ',
  `commission` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '信用卡用',
  `credit_limit` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '信用卡用',
  `is_need_reason` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=需要 F=不需要',
  `category_code` varchar(10) NOT NULL COMMENT 'code_base.revenue_category, payment_category',
  `app_scope` varchar(10) NOT NULL DEFAULT '' COMMENT 'F=前台 A=应收帐 P=POS',
  `is_rebate` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=是 F=不是',
  `cat_dept` varchar(10) NOT NULL COMMENT 'code_base.accnt_dept.code',
  `cat_posting` varchar(10) NOT NULL COMMENT 'code_base.posting_category.code',
  `cat_bal` varchar(10) NOT NULL COMMENT 'code_base.balance_category.code',
  `cat_sum` varchar(10) NOT NULL COMMENT 'code_base.production_category.code',
  `cat_inv` varchar(10) NOT NULL COMMENT 'code_base.invoice_category.code',
  `tail_code` varchar(10) NOT NULL COMMENT 'code_base.jiedai_tail.code',
  `arrange_code` varchar(10) NOT NULL COMMENT 'code_base.arrangement_bill',
  `ar_accnt` varchar(10) NOT NULL COMMENT '对应到AR账户表的账户',
  `extra_categroy1` varchar(10) DEFAULT NULL COMMENT '应用暂缓',
  `extra_categroy2` varchar(10) DEFAULT NULL COMMENT '应用暂缓',
  `extra_categroy3` varchar(10) DEFAULT NULL COMMENT '应用暂缓',
  `extra_categroy4` varchar(10) DEFAULT NULL COMMENT '应用暂缓',
  `is_show` char(2) DEFAULT 'T' COMMENT 'T=显示 F=隐藏',
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=是 F=不是',
  `list_order` mediumint(9) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `code_type` varchar(30) DEFAULT '',
  `group_code` varchar(30) DEFAULT '',
  `is_group` varchar(2) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`code`),
  UNIQUE KEY `Index_2` (`hotel_group_id`,`hotel_id`,`descript`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='入帐代码，包括收入代码、付款代码等 ';
CREATE TABLE `hotel` (
  `hotel_group_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `sta` char(2) NOT NULL DEFAULT '0' COMMENT 'R=初始 H=停用 I=在用',
  `audit` char(2) NOT NULL DEFAULT '0' COMMENT '0=正常 1=不正常',
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL DEFAULT '',
  `descript_short` varchar(20) DEFAULT NULL,
  `country` varchar(3) NOT NULL COMMENT 'code_country.code',
  `city` varchar(60) NOT NULL DEFAULT '' COMMENT '自由输入',
  `address1` varchar(256) NOT NULL DEFAULT '',
  `address2` varchar(256) NOT NULL DEFAULT '',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `fax` varchar(30) NOT NULL DEFAULT '',
  `phone_rsv` varchar(30) DEFAULT NULL,
  `website` varchar(128) DEFAULT NULL,
  `email` varchar(64) NOT NULL DEFAULT '',
  `dns` varchar(64) DEFAULT NULL,
  `remark` text,
  `logo` blob,
  `photo` varchar(256) DEFAULT NULL,
  `html_info` varchar(256) DEFAULT NULL,
  `list_order` mediumint(9) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `province_code` varchar(32) DEFAULT NULL,
  `city_code` varchar(32) DEFAULT NULL,
  `district_code` varchar(32) DEFAULT NULL,
  `town_code` varchar(32) DEFAULT NULL,
  `shopping_district_code` varchar(32) DEFAULT NULL,
  `scenic_spot_code` varchar(32) DEFAULT NULL,
  `book_list_order` varchar(32) DEFAULT NULL,
  `start_level_code` varchar(32) DEFAULT NULL,
  `brand_code` varchar(32) DEFAULT NULL,
  `score` varchar(5) DEFAULT '5.0',
  `category_code` varchar(10) DEFAULT NULL,
  `manage_type` varchar(10) DEFAULT '',
  `map_html` text,
  `pair_pic` varchar(350) DEFAULT NULL,
  `app_type` varchar(20) DEFAULT '',
  `client_type` varchar(10) DEFAULT '',
  `client_version` varchar(10) DEFAULT '',
  `area1` varchar(20) DEFAULT NULL,
  `area2` varchar(20) DEFAULT NULL,
  `server_name` varchar(50) DEFAULT NULL,
  `online_check` char(2) DEFAULT 'T',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`code`),
  UNIQUE KEY `Index_2` (`descript`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
CREATE TABLE `hotel_around_traffic` (
  `hotel_group_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descript` varchar(32) NOT NULL DEFAULT '',
  `descript_en` varchar(32) NOT NULL DEFAULT '',
  `position_code` varchar(32) NOT NULL DEFAULT '',
  `distance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `position_id` bigint(20) DEFAULT NULL,
  `ht_hotel_id` bigint(20) DEFAULT NULL,
  `ht_hotel_code` varchar(32) NOT NULL DEFAULT '',
  `is_halt` varchar(2) NOT NULL DEFAULT 'F',
  `list_order` int(11) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`position_code`,`ht_hotel_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='周边交通';

CREATE TABLE `hotel_def` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adapter_id` bigint(20) NOT NULL,
  `hotel_group_id` bigint(20) NOT NULL,
  `city_code` varchar(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `hotel_code` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edsa` (`hotel_id`),
  UNIQUE KEY `asd` (`hotel_code`),
  KEY `asfd` (`adapter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `hotel_group` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `sta` char(2) NOT NULL DEFAULT '0' COMMENT '0=正常 1=禁用',
  `audit` char(2) NOT NULL DEFAULT '',
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL DEFAULT '',
  `descript_short` varchar(20) DEFAULT NULL,
  `country` varchar(3) NOT NULL COMMENT 'code_country.code',
  `city` varchar(60) NOT NULL DEFAULT '' COMMENT '自由输入',
  `address1` varchar(256) NOT NULL DEFAULT '',
  `address2` varchar(256) NOT NULL DEFAULT '',
  `phone` varchar(30) NOT NULL,
  `fax` varchar(30) NOT NULL,
  `phone_rsv` varchar(30) DEFAULT NULL,
  `website` varchar(128) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `dns` varchar(64) DEFAULT NULL,
  `remark` text,
  `logo` blob,
  `photo` varchar(256) DEFAULT NULL,
  `html_info` varchar(256) DEFAULT NULL,
  `list_order` mediumint(9) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `is_single` varchar(2) DEFAULT 'F',
  `app_type` varchar(20) DEFAULT '',
  `server_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`code`),
  UNIQUE KEY `Index_2` (`descript`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='酒店集团包含父子关系的 ';
CREATE TABLE `hotel_promotion` (
  `hotel_group_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL COMMENT '活动类别描述，仅描述',
  `code` varchar(20) NOT NULL COMMENT '活动代码唯一，标题可以多相同',
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` varchar(512) NOT NULL DEFAULT '',
  `logo` varchar(100) DEFAULT NULL COMMENT '活动图片，冗余字段，看网站是否需要',
  `list_order` int(11) NOT NULL DEFAULT '0',
  `is_halt` varchar(2) NOT NULL DEFAULT 'F',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `begin_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `hotel_service_config` (
  `hotel_group_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ht_hotel_id` bigint(20) DEFAULT NULL,
  `ht_hotel_code` varchar(32) NOT NULL DEFAULT '',
  `service_category_code` varchar(32) NOT NULL DEFAULT '',
  `service_category_descript` varchar(32) NOT NULL DEFAULT '',
  `service_code` varchar(512) NOT NULL DEFAULT '' COMMENT '多个服务用逗号隔开',
  `extend_info` varchar(512) NOT NULL DEFAULT '',
  `list_order` int(11) NOT NULL DEFAULT '0',
  `is_halt` varchar(2) NOT NULL DEFAULT 'F',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`ht_hotel_code`,`service_category_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `hotel_special_prompt` (
  `hotel_group_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descript` varchar(512) NOT NULL DEFAULT '',
  `descript_en` varchar(512) NOT NULL DEFAULT '',
  `ht_hotel_id` bigint(20) DEFAULT NULL,
  `ht_hotel_code` varchar(32) NOT NULL DEFAULT '',
  `list_order` int(11) NOT NULL DEFAULT '0',
  `is_halt` varchar(2) NOT NULL DEFAULT 'F',
  `begin_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`descript`(255),`begin_datetime`,`end_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='特别提示';

CREATE TABLE `pos_audit_dish` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL,
  `link_am_id` bigint(16) NOT NULL,
  `ta_code` varchar(30) NOT NULL,
  `ta_descript` varchar(60) DEFAULT NULL,
  `ta_descript_en` varchar(60) DEFAULT NULL,
  `charge` decimal(12,2) NOT NULL DEFAULT '0.00',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `pos_audit_menu` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL COMMENT '营业日期',
  `menu_no` varchar(30) DEFAULT NULL COMMENT '餐单号',
  `link_menu_no` varchar(30) DEFAULT NULL COMMENT '联单号',
  `pc_station` varchar(20) DEFAULT NULL COMMENT '营业点',
  `pos_station` varchar(20) DEFAULT NULL COMMENT '餐饮系统营业点代码',
  `guest_id` varchar(20) DEFAULT NULL COMMENT '宾客档案号',
  `company_id` varchar(20) DEFAULT NULL COMMENT '协议单位号',
  `sales_man` varchar(20) DEFAULT NULL COMMENT '销售员',
  `card_no` varchar(20) DEFAULT NULL COMMENT '卡号',
  `source` varchar(20) DEFAULT NULL COMMENT '市场码',
  `table_no` varchar(20) DEFAULT NULL COMMENT '桌号',
  `guest_num` int(10) DEFAULT NULL COMMENT '人数',
  `pos_type` varchar(10) DEFAULT NULL COMMENT '餐单类型',
  `remark` varchar(512) DEFAULT NULL COMMENT '餐单备注',
  `charge` decimal(12,2) DEFAULT NULL COMMENT '总消费',
  `charge1` decimal(12,2) DEFAULT NULL COMMENT '食品',
  `charge2` decimal(12,2) DEFAULT NULL COMMENT '酒水',
  `charge3` decimal(12,2) DEFAULT NULL COMMENT '香烟',
  `charge4` decimal(12,2) DEFAULT NULL,
  `charge5` decimal(12,2) DEFAULT NULL,
  `charge6` decimal(12,2) DEFAULT NULL,
  `charge7` decimal(12,2) DEFAULT NULL,
  `charge8` decimal(12,2) DEFAULT NULL,
  `charge9` decimal(12,2) DEFAULT NULL,
  `billno` varchar(30) DEFAULT NULL COMMENT '使用该信用卡的帐单号',
  `pos_user1` varchar(20) DEFAULT NULL COMMENT '接单工号',
  `cashier1` varchar(10) DEFAULT NULL COMMENT '接单班别',
  `pos_createtime` datetime DEFAULT NULL COMMENT '接单时间',
  `pos_user2` varchar(20) DEFAULT NULL COMMENT '结账工号',
  `cashier2` varchar(10) DEFAULT NULL COMMENT '结账班别',
  `pos_checkoutTime` datetime DEFAULT NULL COMMENT '结账时间',
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_biz_date` (`hotel_group_id`,`hotel_id`,`biz_date`),
  KEY `index_pc_station` (`hotel_group_id`,`hotel_id`,`pc_station`),
  KEY `index_link_menu_no` (`hotel_group_id`,`hotel_id`,`link_menu_no`,`pc_station`),
  KEY `index_menu_no` (`hotel_group_id`,`hotel_id`,`menu_no`,`pc_station`),
  KEY `index_unique` (`hotel_group_id`,`hotel_id`,`biz_date`,`menu_no`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `pos_deposit_detail` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `amount` decimal(12,2) DEFAULT NULL COMMENT '金额',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_bizdate` (`hotel_group_id`,`hotel_id`,`biz_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pos_deposit_sum` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL,
  `last_bal` decimal(12,2) DEFAULT NULL COMMENT '上日余额',
  `add` decimal(12,2) DEFAULT NULL COMMENT '本日发生',
  `reduce` decimal(12,2) DEFAULT NULL COMMENT '本日收回',
  `till_bal` decimal(12,2) DEFAULT NULL COMMENT '本日余额',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_bizdate` (`hotel_group_id`,`hotel_id`,`biz_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `pos_deptdai` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `biz_date` datetime NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `ta_code` varchar(10) NOT NULL COMMENT 'code_transaction.code --- {{{表示所有',
  `cashier` tinyint(4) NOT NULL COMMENT 'code_cashier.cashier --- 999表示合计',
  `user_code` varchar(10) NOT NULL COMMENT 'user.code --- {{{表示所有',
  `CODE` varchar(10) NOT NULL COMMENT 'pos_interface_map.code',
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) DEFAULT NULL,
  `dai_tail` varchar(2) DEFAULT NULL COMMENT '预留',
  `day_mark` varchar(2) DEFAULT NULL COMMENT '预留',
  `amount_day` decimal(12,2) NOT NULL DEFAULT '0.00',
  `amount_month` decimal(12,2) NOT NULL DEFAULT '0.00',
  `amount_year` decimal(12,2) NOT NULL DEFAULT '0.00',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`,`hotel_group_id`,`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE `pos_deptdai_history` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `biz_date` datetime NOT NULL,
  `id` bigint(16) NOT NULL,
  `ta_code` varchar(10) NOT NULL COMMENT 'code_transaction.code --- {{{表示所有',
  `cashier` tinyint(4) NOT NULL COMMENT 'code_cashier.cashier --- 999表示合计',
  `user_code` varchar(10) NOT NULL COMMENT 'user.code --- {{{表示所有',
  `CODE` varchar(10) NOT NULL COMMENT 'pos_interface_map.code',
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) DEFAULT NULL,
  `dai_tail` varchar(2) DEFAULT NULL COMMENT '预留',
  `day_mark` varchar(2) DEFAULT NULL COMMENT '预留',
  `amount_day` decimal(12,2) NOT NULL DEFAULT '0.00',
  `amount_month` decimal(12,2) NOT NULL DEFAULT '0.00',
  `amount_year` decimal(12,2) NOT NULL DEFAULT '0.00',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pos_deptjie` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `biz_date` datetime NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `ta_code` varchar(10) NOT NULL COMMENT 'code_transaction.code --- {{{表示所有',
  `cashier` tinyint(4) NOT NULL COMMENT 'code_cashier.cashier --- 999表示合计',
  `user_code` varchar(10) NOT NULL COMMENT 'user.code --- {{{表示所有',
  `CODE` varchar(10) NOT NULL COMMENT 'pos_interface_map.code',
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) DEFAULT NULL,
  `day_mark` varchar(2) DEFAULT NULL COMMENT '预留',
  `amount_day` decimal(12,2) NOT NULL DEFAULT '0.00',
  `amount_month` decimal(12,2) NOT NULL DEFAULT '0.00',
  `amount_year` decimal(12,2) NOT NULL DEFAULT '0.00',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`,`hotel_group_id`,`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE `pos_deptjie_history` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `biz_date` datetime NOT NULL,
  `id` bigint(16) NOT NULL,
  `ta_code` varchar(10) NOT NULL COMMENT 'code_transaction.code --- {{{表示所有',
  `cashier` tinyint(4) NOT NULL COMMENT 'code_cashier.cashier --- 999表示合计',
  `user_code` varchar(10) NOT NULL COMMENT 'user.code --- {{{表示所有',
  `CODE` varchar(10) NOT NULL COMMENT 'pos_interface_map.code',
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) DEFAULT NULL,
  `day_mark` varchar(2) DEFAULT NULL COMMENT '预留',
  `amount_day` decimal(12,2) NOT NULL DEFAULT '0.00',
  `amount_month` decimal(12,2) NOT NULL DEFAULT '0.00',
  `amount_year` decimal(12,2) NOT NULL DEFAULT '0.00',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `pos_dish` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(16) NOT NULL COMMENT 'pos_menu.id',
  `biz_date` datetime NOT NULL,
  `pos_station` varchar(20) NOT NULL,
  `code` varchar(20) NOT NULL COMMENT '例如食品，酒水,香烟，pos_interface_map.code',
  `descript` varchar(20) DEFAULT NULL COMMENT 'code 的中文翻译',
  `fee` decimal(12,2) NOT NULL,
  `type` char(4) DEFAULT NULL COMMENT 'TA转前台，AF转应收，VIP转VIP，其余为MO',
  `list_order` bigint(10) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `cashier` varchar(20) DEFAULT NULL,
  `sys_order` char(1) DEFAULT NULL,
  `accnt` bigint(16) DEFAULT NULL,
  `link_accnt_id` bigint(16) DEFAULT NULL,
  `inumber` bigint(16) DEFAULT NULL,
  `puser` varchar(20) DEFAULT NULL,
  `deposit` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`menu_id`),
  KEY `Index_2` (`hotel_group_id`,`hotel_id`,`biz_date`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='记录餐单';
CREATE TABLE `pos_dish_history` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL,
  `menu_id` bigint(16) NOT NULL COMMENT 'pos_menu.id',
  `biz_date` datetime NOT NULL,
  `pos_station` varchar(20) NOT NULL,
  `code` varchar(20) NOT NULL COMMENT '例如食品，酒水,香烟，pos_interface_map.code',
  `descript` varchar(20) DEFAULT NULL COMMENT 'code 的中文翻译',
  `fee` decimal(12,2) NOT NULL,
  `type` char(4) DEFAULT NULL COMMENT 'TA转前台，AF转应收，VIP转VIP，其余为MO',
  `list_order` bigint(10) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `cashier` varchar(20) DEFAULT NULL,
  `sys_order` char(1) DEFAULT NULL,
  `accnt` bigint(16) DEFAULT NULL,
  `link_accnt_id` bigint(16) DEFAULT NULL,
  `inumber` bigint(16) DEFAULT NULL,
  `puser` varchar(20) DEFAULT NULL,
  `deposit` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`menu_id`),
  KEY `Index_2` (`hotel_group_id`,`hotel_id`,`biz_date`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录餐单历史';

CREATE TABLE `pos_interface_log` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL,
  `DATA` varchar(10240) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`biz_date`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `pos_interface_map` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `link_type` varchar(10) NOT NULL COMMENT '营业项目ta_code，付款代码pay_code，统计项目item_code，班别casher',
  `code` varchar(10) NOT NULL COMMENT '查询:宾客 FE,会员VE,应收AE 入账:宾客 FI,会员VI,应收AI',
  `descript` varchar(60) DEFAULT NULL,
  `descript_en` varchar(60) DEFAULT NULL,
  `pos_code` varchar(10) NOT NULL COMMENT '对方接口的操作识别码。',
  `sys_code` varchar(10) DEFAULT NULL COMMENT 'AF为转前台，TA为转应收，VIP为会员卡',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `other` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`sys_code`,`pos_code`),
  KEY `Index_2` (`hotel_group_id`,`hotel_id`,`link_type`,`code`),
  KEY `Index_3` (`hotel_group_id`,`hotel_id`,`link_type`,`pos_code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='用于翻译接口放的代码，用于确定如何远程调用java方法，是宾客，会员，Ar账的操作';
CREATE TABLE `ip` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ipstart` varchar(16) DEFAULT NULL,
  `ipend` varchar(16) DEFAULT NULL,
  `ipname` varchar(22) DEFAULT NULL,
  `ipstart_num` bigint(20) DEFAULT NULL,
  `ipend_num` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`ipstart_num`,`ipend_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `pos_menu` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL,
  `pos_station` varchar(20) NOT NULL COMMENT '餐饮接口传入',
  `pos_code` varchar(10) NOT NULL COMMENT 'code_transacttion.code',
  `pos_descript` varchar(60) DEFAULT NULL,
  `menu_no` varchar(20) DEFAULT NULL,
  `table_no` varchar(10) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `market` varchar(20) DEFAULT NULL,
  `cashier` varchar(20) DEFAULT NULL,
  `guest_num` bigint(4) DEFAULT NULL,
  `pay_code` varchar(10) DEFAULT NULL COMMENT 'code_transacttion.code 如果多种付款呢？ ',
  `pay_descript` varchar(60) DEFAULT NULL,
  `rmno` varchar(10) DEFAULT NULL,
  `guest_id` bigint(16) DEFAULT NULL,
  `guest_name` varchar(60) DEFAULT NULL,
  `company_id` bigint(16) DEFAULT NULL,
  `company_name` varchar(60) DEFAULT NULL,
  `ar_account` bigint(16) DEFAULT NULL COMMENT 'ar_master.id',
  `card_code` varchar(10) DEFAULT NULL,
  `card_id` bigint(16) DEFAULT NULL,
  `card_no` varchar(20) DEFAULT NULL,
  `discount_mode` varchar(10) DEFAULT NULL,
  `fee` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '实际付款=总额+服务费-折扣',
  `fee_srv` decimal(12,2) DEFAULT '0.00',
  `fee_dsc` decimal(12,2) DEFAULT '0.00',
  `discount_guest` bigint(16) DEFAULT NULL,
  `sales` varchar(20) DEFAULT NULL,
  `sales_man` varchar(20) DEFAULT NULL,
  `last_ls_no` varchar(20) DEFAULT NULL,
  `sta` char(2) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `first_fee` decimal(12,2) DEFAULT NULL,
  `inumber` bigint(16) DEFAULT NULL,
  `infra_menu_no` varchar(30) DEFAULT '',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`biz_date`,`pos_station`),
  KEY `Index_2` (`hotel_group_id`,`hotel_id`,`biz_date`,`pos_code`),
  KEY `Index_3` (`hotel_group_id`,`hotel_id`,`biz_date`,`pay_code`),
  KEY `Index_4` (`hotel_group_id`,`hotel_id`,`biz_date`,`guest_id`),
  KEY `Index_5` (`hotel_group_id`,`hotel_id`,`biz_date`,`company_id`),
  KEY `Index_6` (`hotel_group_id`,`hotel_id`,`biz_date`,`card_id`),
  KEY `Index_7` (`hotel_group_id`,`hotel_id`,`biz_date`,`menu_no`),
  KEY `Index_8` (`hotel_group_id`,`hotel_id`,`biz_date`,`menu_no`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='餐单总单';
CREATE TABLE `pos_menu_history` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL,
  `biz_date` datetime NOT NULL,
  `pos_station` varchar(20) NOT NULL COMMENT '餐饮接口传入',
  `pos_code` varchar(10) NOT NULL COMMENT 'code_transacttion.code',
  `pos_descript` varchar(60) DEFAULT NULL,
  `menu_no` varchar(20) DEFAULT NULL,
  `table_no` varchar(10) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `market` varchar(20) DEFAULT NULL,
  `cashier` varchar(20) DEFAULT NULL,
  `guest_num` bigint(4) DEFAULT NULL,
  `pay_code` varchar(10) DEFAULT NULL COMMENT 'code_transacttion.code 如果多种付款呢？ ',
  `pay_descript` varchar(60) DEFAULT NULL,
  `rmno` varchar(10) DEFAULT NULL,
  `guest_id` bigint(16) DEFAULT NULL,
  `guest_name` varchar(60) DEFAULT NULL,
  `company_id` bigint(16) DEFAULT NULL,
  `company_name` varchar(60) DEFAULT NULL,
  `ar_account` bigint(16) DEFAULT NULL COMMENT 'ar_master.id',
  `card_code` varchar(10) DEFAULT NULL,
  `card_id` bigint(16) DEFAULT NULL,
  `card_no` varchar(20) DEFAULT NULL,
  `discount_mode` varchar(10) DEFAULT NULL,
  `fee` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '实际付款=总额+服务费-折扣',
  `fee_srv` decimal(12,2) DEFAULT '0.00',
  `fee_dsc` decimal(12,2) DEFAULT '0.00',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `discount_guest` bigint(16) DEFAULT NULL,
  `sales` varchar(20) DEFAULT NULL,
  `sales_man` varchar(20) DEFAULT NULL,
  `last_ls_no` varchar(20) DEFAULT NULL,
  `sta` char(2) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `first_fee` decimal(12,2) DEFAULT NULL,
  `inumber` bigint(16) DEFAULT NULL,
  `infra_menu_no` varchar(30) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`biz_date`,`pos_station`),
  KEY `Index_2` (`hotel_group_id`,`hotel_id`,`biz_date`,`pos_code`),
  KEY `Index_3` (`hotel_group_id`,`hotel_id`,`biz_date`,`pay_code`),
  KEY `Index_4` (`hotel_group_id`,`hotel_id`,`biz_date`,`guest_id`),
  KEY `Index_5` (`hotel_group_id`,`hotel_id`,`biz_date`,`company_id`),
  KEY `Index_6` (`hotel_group_id`,`hotel_id`,`biz_date`,`card_id`),
  KEY `Index_8` (`hotel_group_id`,`hotel_id`,`biz_date`,`menu_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='餐单总单历史';
CREATE TABLE `pos_report` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `biz_date` datetime NOT NULL,
  `v00` varchar(20) DEFAULT NULL,
  `v01` varchar(60) DEFAULT NULL,
  `v02` varchar(50) DEFAULT NULL,
  `v03` varchar(30) DEFAULT NULL,
  `v04` varchar(30) DEFAULT NULL,
  `v05` varchar(30) DEFAULT NULL,
  `v06` varchar(30) DEFAULT NULL,
  `v07` varchar(30) DEFAULT NULL,
  `v08` varchar(30) DEFAULT NULL,
  `v09` varchar(30) DEFAULT NULL,
  `v10` varchar(30) DEFAULT NULL,
  `v11` varchar(30) DEFAULT NULL,
  `v12` varchar(30) DEFAULT NULL,
  `v13` varchar(30) DEFAULT NULL,
  `v14` varchar(30) DEFAULT NULL,
  `v15` varchar(30) DEFAULT NULL,
  `v16` varchar(30) DEFAULT NULL,
  `v17` varchar(30) DEFAULT NULL,
  `v18` varchar(30) DEFAULT NULL,
  `v19` varchar(30) DEFAULT NULL,
  `v20` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`code`,`biz_date`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='存放数据，读出制作报表';

CREATE TABLE `pos_srv_table` (
  `biz_date` datetime DEFAULT NULL,
  `audit_index` varchar(10) DEFAULT NULL,
  `descript` varchar(10) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `rep_dai` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL,
  `orderno` char(2) DEFAULT NULL,
  `itemno` int(11) DEFAULT NULL,
  `modeno` varchar(200) DEFAULT NULL,
  `classno` char(8) DEFAULT NULL,
  `descript` varchar(50) DEFAULT NULL,
  `descript1` varchar(50) DEFAULT NULL,
  `sequence` int(8) DEFAULT NULL,
  `credit01` decimal(12,2) DEFAULT NULL,
  `credit02` decimal(12,2) DEFAULT NULL,
  `credit03` decimal(12,2) DEFAULT NULL,
  `credit04` decimal(12,2) DEFAULT NULL,
  `credit05` decimal(12,2) DEFAULT NULL,
  `credit06` decimal(12,2) DEFAULT NULL,
  `credit07` decimal(12,2) DEFAULT NULL,
  `sumcre` decimal(12,2) DEFAULT NULL,
  `last_bl` decimal(12,2) DEFAULT NULL,
  `debit` decimal(12,2) DEFAULT NULL,
  `credit` decimal(12,2) DEFAULT NULL,
  `till_bl` decimal(12,2) DEFAULT NULL,
  `credit01m` decimal(12,2) DEFAULT NULL,
  `credit02m` decimal(12,2) DEFAULT NULL,
  `credit03m` decimal(12,2) DEFAULT NULL,
  `credit04m` decimal(12,2) DEFAULT NULL,
  `credit05m` decimal(12,2) DEFAULT NULL,
  `credit06m` decimal(12,2) DEFAULT NULL,
  `credit07m` decimal(12,2) DEFAULT NULL,
  `sumcrem` decimal(12,2) DEFAULT NULL,
  `last_blm` decimal(12,2) DEFAULT NULL,
  `debitm` decimal(12,2) DEFAULT NULL,
  `creditm` decimal(12,2) DEFAULT NULL,
  `till_blm` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE `rep_jie` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL,
  `orderno` char(2) DEFAULT NULL,
  `itemno` decimal(12,2) DEFAULT NULL,
  `modeno` varchar(200) DEFAULT NULL,
  `classno` char(8) DEFAULT NULL,
  `descript` varchar(50) DEFAULT NULL,
  `descript1` varchar(50) DEFAULT NULL,
  `rectype` char(1) DEFAULT NULL,
  `toop` char(1) DEFAULT NULL,
  `toclass` char(8) DEFAULT NULL,
  `sequence` int(8) DEFAULT NULL,
  `day01` decimal(12,2) DEFAULT NULL,
  `day02` decimal(12,2) DEFAULT NULL,
  `day03` decimal(12,2) DEFAULT NULL,
  `day04` decimal(12,2) DEFAULT NULL,
  `day05` decimal(12,2) DEFAULT NULL,
  `day06` decimal(12,2) DEFAULT NULL,
  `day07` decimal(12,2) DEFAULT NULL,
  `day08` decimal(12,2) DEFAULT NULL,
  `day09` decimal(12,2) DEFAULT NULL,
  `day99` decimal(12,2) DEFAULT NULL,
  `month01` decimal(12,2) DEFAULT NULL,
  `month02` decimal(12,2) DEFAULT NULL,
  `month03` decimal(12,2) DEFAULT NULL,
  `month04` decimal(12,2) DEFAULT NULL,
  `month05` decimal(12,2) DEFAULT NULL,
  `month06` decimal(12,2) DEFAULT NULL,
  `month07` decimal(12,2) DEFAULT NULL,
  `month08` decimal(12,2) DEFAULT NULL,
  `month09` decimal(12,2) DEFAULT NULL,
  `month99` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modeindex_classno` (`hotel_group_id`,`hotel_id`,`classno`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `rep_jiedai` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `biz_date` datetime NOT NULL,
  `orderno` char(2) DEFAULT NULL,
  `itemno` int(8) DEFAULT NULL,
  `modeno` varchar(200) DEFAULT NULL,
  `classno` char(8) DEFAULT NULL,
  `descript` varchar(50) DEFAULT NULL,
  `descript1` varchar(50) DEFAULT NULL,
  `sequence` int(8) DEFAULT NULL,
  `last_charge` decimal(12,2) DEFAULT NULL,
  `last_credit` decimal(12,2) DEFAULT NULL,
  `charge` decimal(12,2) DEFAULT NULL,
  `credit` decimal(12,2) DEFAULT NULL,
  `apply` decimal(12,2) DEFAULT NULL,
  `till_charge` decimal(12,2) DEFAULT NULL,
  `till_credit` decimal(12,2) DEFAULT NULL,
  `last_chargem` decimal(16,2) DEFAULT NULL,
  `last_creditm` decimal(16,2) DEFAULT NULL,
  `chargem` decimal(16,2) DEFAULT NULL,
  `creditm` decimal(16,2) DEFAULT NULL,
  `applym` decimal(16,2) DEFAULT NULL,
  `till_chargem` decimal(16,2) DEFAULT NULL,
  `till_creditm` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `report_category` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL,
  `is_sys` char(2) NOT NULL DEFAULT 'F',
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=停用 F=不停用',
  `list_order` mediumint(9) NOT NULL DEFAULT '100',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `is_dispatch` varchar(2) DEFAULT 'F',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`code`),
  UNIQUE KEY `Index_2` (`hotel_group_id`,`hotel_id`,`descript`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `report_center` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `rep_category` varchar(20) NOT NULL,
  `list_split` varchar(16) DEFAULT NULL COMMENT '报表列表的间隔分组标记',
  `rep_type` varchar(10) NOT NULL,
  `code` varchar(20) NOT NULL COMMENT '系统代码，程序调用识别。酒店不可更改',
  `alias_code` varchar(20) DEFAULT NULL COMMENT '酒店用户自定义代码',
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `allow_appcode` varchar(30) NOT NULL COMMENT '多选 app.code ',
  `rep_define` longtext NOT NULL,
  `param_win` varchar(256) NOT NULL,
  `lic_code` varchar(20) NOT NULL,
  `is_orientation` char(2) NOT NULL DEFAULT 'F' COMMENT 'T/F',
  `is_sys` char(2) NOT NULL DEFAULT 'F' COMMENT 'T/F',
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T=停用 F=不停用',
  `list_order` mediumint(9) NOT NULL DEFAULT '100',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `is_dispatch` varchar(2) DEFAULT 'F',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`code`),
  KEY `Index_2` (`hotel_group_id`,`hotel_id`,`rep_category`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE `sales_man` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL COMMENT '销售员代码，引用名 salesman',
  `name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL DEFAULT '',
  `first_name` varchar(60) NOT NULL DEFAULT '',
  `name2` varchar(512) NOT NULL,
  `name3` varchar(60) NOT NULL DEFAULT '',
  `extension` varchar(20) DEFAULT NULL,
  `territory` varchar(30) DEFAULT NULL COMMENT 'code_base.sale_territory.code',
  `extra_flag` varchar(30) NOT NULL DEFAULT '000000000000000000000000000000' COMMENT '位置状态列',
  `is_fulltime` char(2) NOT NULL DEFAULT 'T' COMMENT 'T=YES F=NO',
  `join_date` datetime DEFAULT NULL,
  `date_begin` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `sex` char(2) DEFAULT NULL COMMENT 'code_base.sex.code',
  `id_code` varchar(10) DEFAULT NULL COMMENT 'code_base.idcode.code',
  `id_no` varchar(20) DEFAULT NULL,
  `language` char(10) DEFAULT NULL COMMENT 'code_base.language.code',
  `birth` datetime DEFAULT NULL,
  `nation` varchar(10) NOT NULL COMMENT 'code_country.code',
  `country` varchar(10) NOT NULL COMMENT 'code_country.code',
  `state` varchar(10) DEFAULT NULL COMMENT 'code_province.code',
  `town` varchar(40) DEFAULT NULL,
  `street` varchar(60) DEFAULT NULL,
  `zipcode` varchar(6) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `phone` varchar(30) NOT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `website` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `remark` varchar(2048) DEFAULT NULL,
  `pic_photo` bigint(16) DEFAULT NULL COMMENT '相片图片路径',
  `pic_sign` bigint(16) DEFAULT NULL COMMENT '签字图片路径',
  `list_order` mediumint(9) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='所有销售员记录';
CREATE TABLE `sales_man_business` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `sales_man` varchar(10) NOT NULL COMMENT 'sales_man.code',
  `sta` char(2) DEFAULT 'I',
  `dept` varchar(10) DEFAULT NULL,
  `job` varchar(30) DEFAULT NULL,
  `sales_group` varchar(10) DEFAULT NULL COMMENT 'sales_group.code',
  `login_user` char(10) DEFAULT NULL,
  `production_to` varchar(64) DEFAULT '',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`sales_man`,`sales_group`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE `sso` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(16) DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `client_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mi_token_user_id` (`token`,`user_id`),
  KEY `mi_user_id_token` (`user_id`,`token`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `sync_ip` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `server_name` varchar(50) NOT NULL COMMENT '服务器名,如服务器组A',
  `server_type` varchar(10) NOT NULL COMMENT 'group,member,ipms,thef',
  `server_ip` varchar(50) NOT NULL COMMENT 'localhost:8080',
  `is_local` varchar(2) DEFAULT 'T',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
CREATE TABLE `sys_error` (
  `hotel_group_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `destination` varchar(50) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `body` text,
  `fault` text,
  `stack_trace` text,
  `station_code` varchar(60) DEFAULT NULL,
  `app_descript` varchar(60) NOT NULL DEFAULT '酒店系统',
  `app_code` varchar(20) NOT NULL DEFAULT '1',
  `user_code` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`),
  KEY `mi_gid_hid_app_code_user_code` (`hotel_group_id`,`hotel_id`,`app_code`,`user_code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE `sys_extra_id` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL COMMENT '比如虚拟房号 VROOM, 预订号 RESRVNO',
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL DEFAULT '',
  `pointer_type` varchar(10) NOT NULL COMMENT '有每日重复的，有一直延续的',
  `prefix1` varchar(10) NOT NULL DEFAULT '',
  `prefix2` varchar(10) NOT NULL DEFAULT '',
  `prefix3` varchar(10) NOT NULL DEFAULT '',
  `pos_cur` bigint(16) NOT NULL DEFAULT '0',
  `pos_begin` bigint(16) NOT NULL DEFAULT '0',
  `pos_interval` bigint(16) NOT NULL DEFAULT '0',
  `pos_max` bigint(16) NOT NULL DEFAULT '0',
  `is_halt` varchar(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes  F=no',
  `list_order` mediumint(9) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `sys_list_meta` (
  `hotel_group_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `save_id` bigint(16) DEFAULT NULL,
  `code` varchar(30) DEFAULT NULL,
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) DEFAULT NULL,
  `count_sql` mediumtext,
  `sql_define` mediumtext,
  `column_sta` varchar(30) DEFAULT NULL COMMENT '系统工作表需要',
  `column_key` varchar(30) DEFAULT NULL COMMENT '系统工作表需要',
  `page_size` int(11) DEFAULT '0' COMMENT '0表示不分页',
  `format_define` text,
  `is_halt` varchar(2) DEFAULT NULL,
  `list_order` mediumint(9) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT '',
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT '',
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`id`),
  KEY `Index_2` (`hotel_group_id`,`hotel_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `sys_option` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `catalog` varchar(32) NOT NULL COMMENT 'code_base.sys_option_catalog',
  `item` varchar(32) NOT NULL,
  `set_value` varchar(512) NOT NULL DEFAULT '''''',
  `def_value` varchar(512) NOT NULL DEFAULT '''''',
  `is_mod` char(2) NOT NULL DEFAULT 'F' COMMENT 'T/F',
  `lic_code` varchar(20) NOT NULL DEFAULT '''''',
  `descript` varchar(60) NOT NULL DEFAULT '''''',
  `descript_en` varchar(60) NOT NULL DEFAULT '''''',
  `remark` varchar(512) NOT NULL DEFAULT '',
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T/F',
  `list_order` mediumint(9) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL DEFAULT '''''',
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL DEFAULT '''''',
  `modify_datetime` datetime NOT NULL,
  `ctrl_str` varchar(4) DEFAULT '10',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`catalog`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='系统参数表';
CREATE TABLE `tp_audit_report` (
  `hotel_group_id` int(12) DEFAULT NULL,
  `hotel_code` varchar(20) DEFAULT NULL,
  `sysdate` datetime DEFAULT NULL,
  `class` char(1) DEFAULT NULL,
  `empid` varchar(10) DEFAULT NULL,
  `shift` char(1) DEFAULT NULL,
  `pccode` varchar(5) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `descript` varchar(30) DEFAULT NULL,
  `amount0` decimal(12,2) DEFAULT NULL,
  `amount1` decimal(12,2) DEFAULT NULL,
  `amount2` decimal(12,2) DEFAULT NULL,
  `amount3` decimal(12,2) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `ent_ft` decimal(12,2) DEFAULT NULL,
  `dsc_ft` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tp_budget` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `year` varchar(20) DEFAULT NULL,
  `sort_code` varchar(20) DEFAULT NULL,
  `sort_descr` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `descr` varchar(20) DEFAULT NULL,
  `p01` decimal(12,2) DEFAULT NULL,
  `i01` decimal(12,2) DEFAULT NULL,
  `o01` decimal(12,2) DEFAULT NULL,
  `p02` decimal(12,2) DEFAULT NULL,
  `i02` decimal(12,2) DEFAULT NULL,
  `o02` decimal(12,2) DEFAULT NULL,
  `p03` decimal(12,2) DEFAULT NULL,
  `i03` decimal(12,2) DEFAULT NULL,
  `o03` decimal(12,2) DEFAULT NULL,
  `p04` decimal(12,2) DEFAULT NULL,
  `i04` decimal(12,2) DEFAULT NULL,
  `o04` decimal(12,2) DEFAULT NULL,
  `p05` decimal(12,2) DEFAULT NULL,
  `i05` decimal(12,2) DEFAULT NULL,
  `o05` decimal(12,2) DEFAULT NULL,
  `p06` decimal(12,2) DEFAULT NULL,
  `i06` decimal(12,2) DEFAULT NULL,
  `o06` decimal(12,2) DEFAULT NULL,
  `p07` decimal(12,2) DEFAULT NULL,
  `i07` decimal(12,2) DEFAULT NULL,
  `o07` decimal(12,2) DEFAULT NULL,
  `p08` decimal(12,2) DEFAULT NULL,
  `i08` decimal(12,2) DEFAULT NULL,
  `o08` decimal(12,2) DEFAULT NULL,
  `p09` decimal(12,2) DEFAULT NULL,
  `i09` decimal(12,2) DEFAULT NULL,
  `o09` decimal(12,2) DEFAULT NULL,
  `p010` decimal(12,2) DEFAULT NULL,
  `i010` decimal(12,2) DEFAULT NULL,
  `o010` decimal(12,2) DEFAULT NULL,
  `p011` decimal(12,2) DEFAULT NULL,
  `i011` decimal(12,2) DEFAULT NULL,
  `o011` decimal(12,2) DEFAULT NULL,
  `p012` decimal(12,2) DEFAULT NULL,
  `i012` decimal(12,2) DEFAULT NULL,
  `o012` decimal(12,2) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`year`,`sort_code`,`code`),
  KEY `Index_2` (`hotel_group_id`,`hotel_id`,`year`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='餐饮预算';
CREATE TABLE `user` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `save_id` bigint(16) DEFAULT NULL,
  `dept_id` bigint(16) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL COMMENT '引用名 xxx_user',
  `cardno` varchar(30) DEFAULT NULL,
  `cashier` tinyint(4) DEFAULT NULL COMMENT 'code_cashier.cashier',
  `name` varchar(60) DEFAULT NULL,
  `name_en` varchar(60) DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `dept_code` varchar(10) DEFAULT NULL COMMENT 'dept.code',
  `job` varchar(10) DEFAULT NULL COMMENT 'code_base.hotel_job',
  `lock_date` datetime DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL COMMENT 'code_base.language',
  `phone` varchar(30) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `lock_status` varchar(10) DEFAULT NULL COMMENT 'L=维修 l=锁定 N=正常',
  `is_func_special` char(2) DEFAULT NULL COMMENT 'T=yes, F=no',
  `login_date` datetime DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL COMMENT 'code_base.sex',
  `bb` varchar(20) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL COMMENT 'code_country',
  `cache_id` bigint(16) DEFAULT NULL,
  `is_halt` char(2) DEFAULT NULL COMMENT 'T=yes, F=no',
  `list_order` mediumint(9) DEFAULT NULL COMMENT '缺省值0',
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  `extra_flag` varchar(20) DEFAULT '00000000000000000000',
  `email` varchar(50) DEFAULT NULL,
  `auth_password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mi_gid_code` (`hotel_group_id`,`code`),
  KEY `mi_gid_hid_code` (`hotel_group_id`,`hotel_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='操作系统的用户管理。不需要进入系统操作的，没有必要在这里定义。那是ehr ';
CREATE TABLE `user_auth` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `save_id` bigint(16) DEFAULT NULL,
  `parent_id` bigint(16) DEFAULT NULL,
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
  KEY `FK_Ref_user_auth_id_parent_id` (`parent_id`),
  KEY `indexmode1` (`hotel_group_id`,`hotel_id`,`code`,`parent_code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='系统权限定义，允许嵌套';
CREATE TABLE `user_auth_building` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `save_id` bigint(16) DEFAULT NULL,
  `auth_hotel_group_id` bigint(16) DEFAULT NULL,
  `auth_hotel_id` bigint(16) DEFAULT NULL,
  `building_string` varchar(512) DEFAULT NULL COMMENT '逗号分开的权限字符串，为空表示所有楼号',
  `entity_type` varchar(20) DEFAULT NULL,
  `entity_id` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`auth_hotel_group_id`,`auth_hotel_id`,`entity_type`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='缓存针对角色，部门和用户。 记录的方式是根据hotel_group_id, hotel_id 分开。 ';
CREATE TABLE `user_auth_cache` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `save_id` bigint(16) DEFAULT NULL,
  `auth_hotel_group_id` bigint(16) DEFAULT NULL,
  `auth_hotel_id` bigint(16) DEFAULT NULL,
  `cache_string` varchar(10240) DEFAULT NULL COMMENT '逗号分开的权限字符串',
  `entity_type` varchar(10) DEFAULT NULL,
  `entity_id` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modeindex_unique` (`hotel_group_id`,`hotel_id`,`entity_type`,`entity_id`,`auth_hotel_group_id`,`auth_hotel_id`),
  KEY `mi_auth_gid_auth_hid_entity_type_entity_id` (`auth_hotel_group_id`,`auth_hotel_id`,`entity_type`,`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='缓存针对角色，部门和用户。 记录的方式是根据hotel_group_id, hotel_id 分开。 ';
CREATE TABLE `user_auth_cache_custom` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(16) NOT NULL,
  `auth_cache_str` varchar(10240) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_auth_cfg_dept_role` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `save_id` bigint(16) DEFAULT NULL,
  `dept_id` bigint(16) NOT NULL COMMENT 'user_dept.id',
  `role_id` bigint(16) NOT NULL COMMENT 'user_role.id',
  `auth_hotel_group_id` bigint(16) DEFAULT NULL,
  `auth_hotel_id` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modeindex_unique` (`hotel_group_id`,`hotel_id`,`dept_id`,`role_id`,`auth_hotel_group_id`,`auth_hotel_id`),
  KEY `FK_Ref_dept_role_dept` (`dept_id`),
  KEY `FK_Ref_dept_role_role` (`role_id`),
  KEY `mi_auth_gid_auth_hid_dept_id_role_id` (`auth_hotel_group_id`,`auth_hotel_id`,`dept_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE `user_auth_cfg_role_auth` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `save_id` bigint(16) DEFAULT NULL,
  `role_id` bigint(16) NOT NULL COMMENT 'user_role.id',
  `auth_hotel_group_id` bigint(16) DEFAULT NULL,
  `auth_hotel_id` bigint(16) DEFAULT NULL,
  `auth_id` bigint(16) NOT NULL COMMENT 'user_auth.id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `modeindex_unique` (`hotel_group_id`,`hotel_id`,`role_id`,`auth_id`,`auth_hotel_group_id`,`auth_hotel_id`),
  KEY `FK_Ref_role_auth_auth` (`auth_id`),
  KEY `FK_Ref_role_auth_role` (`role_id`),
  KEY `mi_role_id_auth_id_gid_hid` (`role_id`,`auth_id`,`hotel_group_id`,`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `user_auth_cfg_role_rep` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `save_id` bigint(16) DEFAULT NULL,
  `role_code` varchar(10) DEFAULT NULL,
  `rep_code` varchar(25) DEFAULT NULL,
  `rep_level` varchar(10) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AK_Key_1` (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`role_code`,`rep_code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;



CREATE TABLE `user_auth_cfg_user_role` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `save_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(16) NOT NULL COMMENT 'user.id',
  `role_id` bigint(16) NOT NULL COMMENT 'user_role.id',
  `auth_hotel_group_id` bigint(16) DEFAULT NULL,
  `auth_hotel_id` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modeindex_unique` (`hotel_group_id`,`hotel_id`,`user_id`,`role_id`,`auth_hotel_group_id`,`auth_hotel_id`),
  KEY `FK_Ref_user_role_role` (`role_id`),
  KEY `FK_Ref_user_role_user` (`user_id`),
  KEY `mi_auth_gid_auth_hid_user_id_role_id` (`auth_hotel_group_id`,`auth_hotel_id`,`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `user_auth_temp` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `auth_code` varchar(60) DEFAULT NULL,
  `auth_content` varchar(60) DEFAULT NULL,
  `ope_content` varchar(100) DEFAULT NULL,
  `ope_remark` varchar(200) DEFAULT NULL,
  `accnt` bigint(16) DEFAULT NULL,
  `guest_name` varchar(60) DEFAULT NULL,
  `oper_user` varchar(20) DEFAULT NULL,
  `auth_user` varchar(20) DEFAULT NULL,
  `biz_date` datetime DEFAULT NULL,
  `is_give` varchar(2) DEFAULT NULL,
  `give_datetime` datetime DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='临时授权记录表';
CREATE TABLE `user_auth_temp_user` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `auth_hotel_code` varchar(20) DEFAULT NULL,
  `oper_user` varchar(20) DEFAULT NULL,
  `auth_user` varchar(20) DEFAULT NULL,
  `auth_type` varchar(10) DEFAULT NULL COMMENT 'USER=用户代码 ROLE=角色代码',
  `auth_code` varchar(100) DEFAULT NULL COMMENT '用户代码或者角色代码',
  `begin_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色授权表\n把一个用户的权限，赋予另一个人，后者拥有两人的权限';

CREATE TABLE `user_dept` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `save_id` bigint(16) DEFAULT NULL,
  `parent_id` bigint(16) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL COMMENT '引用名 dept',
  `parent_code` varchar(10) DEFAULT NULL,
  `descript` varchar(60) DEFAULT NULL,
  `descript_en` varchar(60) DEFAULT NULL,
  `cache_id` bigint(16) DEFAULT NULL,
  `is_halt` char(2) DEFAULT NULL COMMENT 'T=yes, F=no',
  `is_group` varchar(2) DEFAULT 'F',
  `list_order` mediumint(9) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Ref_dept_id_parent_id` (`parent_id`),
  KEY `mi_gid_hid_code` (`hotel_group_id`,`hotel_id`,`code`),
  KEY `mi_gid_hid_parent_code` (`hotel_group_id`,`hotel_id`,`parent_code`),
  KEY `mi_gid_hid_parent_code_code` (`hotel_group_id`,`hotel_id`,`parent_code`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='酒店部门定义，允许嵌套，表现多级部门。大部分都是2-3层 ';

CREATE TABLE `user_habits_base` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `set_value` varchar(30) NOT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`create_user`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='记录用户操作痕迹的';
CREATE TABLE `user_note` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `send_user` varchar(20) DEFAULT NULL COMMENT '发送人',
  `recv_user` varchar(20) DEFAULT NULL COMMENT '接受人',
  `title` varchar(256) DEFAULT NULL COMMENT '主题',
  `content` varchar(1000) DEFAULT NULL COMMENT '正文',
  `status` varchar(10) DEFAULT NULL COMMENT '状态:已发送(send), 已暂存(pause),已废弃(disuse)',
  `is_emergency` char(2) DEFAULT 'F' COMMENT '是否紧急',
  `is_attachment` char(2) DEFAULT 'F' COMMENT '是否有附件',
  `is_read` char(2) DEFAULT 'F' COMMENT '是否阅读',
  `read_datetime` datetime DEFAULT NULL,
  `attachment_address` varchar(256) DEFAULT NULL COMMENT '附件地址',
  `create_datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`send_user`,`create_datetime`),
  KEY `Index_2` (`hotel_group_id`,`hotel_id`,`recv_user`,`create_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用于集团或者酒店内部的员工之间的留言等信息服务';

CREATE TABLE `user_pwd` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `type` varchar(10) NOT NULL,
  `user_code` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `create_user` varchar(30) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(30) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index1` (`hotel_group_id`,`hotel_id`,`user_code`,`modify_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `user_role` (
  `hotel_group_id` bigint(16) DEFAULT NULL,
  `hotel_id` bigint(16) DEFAULT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `save_id` bigint(16) DEFAULT NULL,
  `parent_id` bigint(16) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL COMMENT '引用名role',
  `descript` varchar(60) DEFAULT NULL,
  `descript_en` varchar(60) DEFAULT NULL,
  `cache_id` bigint(16) DEFAULT NULL,
  `is_halt` char(2) DEFAULT NULL COMMENT 'T=yes, F=no',
  `is_group` varchar(2) DEFAULT 'F',
  `is_sys` varchar(2) DEFAULT 'F',
  `list_order` mediumint(9) DEFAULT NULL,
  `create_user` varchar(20) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) DEFAULT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mi_gid_hid_code` (`hotel_group_id`,`hotel_id`,`code`),
  KEY `mi_gid_hid_parent_id` (`hotel_group_id`,`hotel_id`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='用户角色定义，没有嵌套关系，一层即可 ';

CREATE TABLE `work_station` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL DEFAULT '',
  `principal` varchar(60) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `app_codes` varchar(64) DEFAULT NULL COMMENT 'app.code 多选，空表示不限制',
  `app_codes_must_run` varchar(32) DEFAULT NULL COMMENT 'app.code 多选，空表示不限制',
  `login_users` varchar(64) DEFAULT NULL COMMENT 'user.code 多选，空表示不限制',
  `notify_users` varchar(64) DEFAULT NULL COMMENT 'user.code 多选，空表示不限制',
  `mac` varchar(16) NOT NULL DEFAULT '',
  `computer_info` varchar(1024) DEFAULT NULL COMMENT '电脑名称，多个ip等',
  `feecode` varchar(100) DEFAULT NULL,
  `is_halt` varchar(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes  F=no',
  `list_order` mediumint(9) NOT NULL DEFAULT '0' COMMENT '缺省值0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `code_type` varchar(30) DEFAULT '',
  `group_code` varchar(30) DEFAULT '',
  `is_group` varchar(2) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='系统工作站 - 所有应用系统的站点登记。如果没有登记，则在系统登录的时候，自动提取信息插入到该表 \n';
CREATE TABLE `work_station_scape` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `station_code` varchar(20) NOT NULL COMMENT '站点code',
  `set_value` text COMMENT '根据catelog(授权类型)下的具体,例如01,02,03',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `catalog` varchar(16) DEFAULT 'floor' COMMENT '授权类型:(楼号:building;楼层:floor;房号:roomNo)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点楼层权限';

CREATE TABLE `work_station_status` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `station_code` varchar(20) NOT NULL,
  `descript` varchar(60) DEFAULT NULL COMMENT '冗余信息',
  `descript_en` varchar(60) DEFAULT NULL COMMENT '冗余信息',
  `run_datetime` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `exit_datetime` datetime DEFAULT NULL,
  `status` char(2) NOT NULL COMMENT 'R=运行 S=挂起 H=停机',
  `work_user` varchar(20) DEFAULT NULL,
  `user_name` varchar(60) DEFAULT NULL COMMENT '冗余信息',
  `app_code` char(3) NOT NULL DEFAULT '1',
  `shift` char(2) DEFAULT NULL COMMENT 'pos系统有这个概念，前台没有',
  `localIP` varchar(256) DEFAULT NULL,
  `wlanIP` varchar(256) DEFAULT NULL,
  `wlanIP_num` bigint(20) DEFAULT NULL,
  `city_descript` varchar(100) DEFAULT NULL,
  `net_descript` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_1` (`hotel_group_id`,`hotel_id`,`station_code`,`app_code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `work_station_status_history` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL,
  `station_code` varchar(20) NOT NULL,
  `descript` varchar(60) DEFAULT NULL COMMENT '冗余信息',
  `descript_en` varchar(60) DEFAULT NULL COMMENT '冗余信息',
  `run_datetime` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `exit_datetime` datetime DEFAULT NULL,
  `status` char(2) NOT NULL COMMENT 'R=运行 S=挂起 H=停机',
  `work_user` varchar(20) DEFAULT NULL,
  `user_name` varchar(60) DEFAULT NULL COMMENT '冗余信息',
  `app_code` char(3) NOT NULL DEFAULT '1',
  `shift` char(2) DEFAULT NULL COMMENT 'pos系统有这个概念，前台没有',
  `localIP` varchar(256) DEFAULT NULL,
  `wlanIP` varchar(256) DEFAULT NULL,
  `wlanIP_num` bigint(20) DEFAULT NULL,
  `city_descript` varchar(100) DEFAULT NULL,
  `net_descript` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`station_code`,`app_code`,`login_date`),
  KEY `Index_2` (`hotel_group_id`,`hotel_id`,`work_user`,`station_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `work_station_verify` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `handware_type` varchar(10) NOT NULL COMMENT '目前是MAC，以后可能有其他控制方法',
  `handware_value` varchar(30) NOT NULL,
  `station_des` varchar(60) DEFAULT NULL COMMENT '可以自动从 work_station提取，也可以人工输入',
  `app_codes` varchar(64) DEFAULT NULL COMMENT '可多选，空代码所有',
  `user_code` varchar(64) DEFAULT NULL,
  `is_halt` char(2) NOT NULL DEFAULT 'F' COMMENT 'T/F',
  `list_order` mediumint(9) NOT NULL DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_1` (`hotel_group_id`,`hotel_id`,`handware_type`,`handware_value`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='物理信息验证';
CREATE TABLE `work_status` (
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `save_id` bigint(16) DEFAULT NULL,
  `work_sheet_id` bigint(16) NOT NULL COMMENT 'work_sheet.id',
  `sta` varchar(200) NOT NULL,
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL DEFAULT '',
  `is_default` varchar(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `is_halt` varchar(2) NOT NULL DEFAULT 'F' COMMENT 'T=yes F=no',
  `list_order` mediumint(9) NOT NULL DEFAULT '0' COMMENT '缺省值=0',
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mi_gid_hid_work_sheet_id` (`hotel_group_id`,`hotel_id`,`work_sheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
CREATE TABLE `sys_template` (
  `id` bigint(16) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_group_id` bigint(16) NOT NULL,
  `hotel_id` bigint(16) NOT NULL,
  `template_type` varchar(2) NOT NULL,
  `descript` varchar(60) NOT NULL,
  `descript_en` varchar(60) NOT NULL,
  `template_content` text,
  `is_halt` char(2) NOT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `modify_user` varchar(20) NOT NULL,
  `modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_sys_template` (`hotel_group_id`,`hotel_id`,`template_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






















































