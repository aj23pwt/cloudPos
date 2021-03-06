ALTER table pos_res modify column type1 varchar(100) ;
ALTER table pos_res modify column type2 varchar(100) ;
ALTER table pos_res modify column type3 varchar(100) ;
ALTER table pos_res modify column type4 varchar(100) ;
ALTER table pos_res modify column type5 varchar(100) ;
ALTER table pos_res modify column market varchar(10) ;
ALTER table pos_res modify column source varchar(10) ;
ALTER table pos_pay modify column foliono varchar(60) ;
ALTER table pos_master modify column type1 varchar(100) ;
ALTER table pos_master modify column type2 varchar(100) ;
ALTER table pos_master modify column type3 varchar(100) ;
ALTER table pos_master modify column type4 varchar(100) ;
ALTER table pos_master modify column type5 varchar(100) ;
ALTER table pos_master modify column market varchar(10) ;
ALTER table pos_master modify column source varchar(10) ;
ALTER table pos_master modify column empid varchar(100) ;
ALTER table pos_master_history modify column type1 varchar(100) ;
ALTER table pos_master_history modify column type2 varchar(100) ;
ALTER table pos_master_history modify column type3 varchar(100) ;
ALTER table pos_master_history modify column type4 varchar(100) ;
ALTER table pos_master_history modify column type5 varchar(100) ;
ALTER table pos_master_history modify column market varchar(10) ;
ALTER table pos_master_history modify column source varchar(10) ;
ALTER table pos_master_history modify column empid varchar(100) ;
ALTER table pos_account modify column empid varchar(100) ;
ALTER table pos_account_history modify column empid varchar(100) ;
ALTER table pos_detail modify column empid varchar(100) ;
ALTER table pos_detail_history modify column empid varchar(100) ;

-- 修改账号 长度
ALTER table pos_accnt_sync modify column accnt varchar(20) ;
ALTER table pos_account modify column accnt varchar(20) ;
ALTER table pos_account modify column billno varchar(20) ;
ALTER table pos_account_history modify column accnt varchar(20) ;
ALTER table pos_account_history modify column billno varchar(20) ;
ALTER table pos_audit_master modify column accnt varchar(20) ;
ALTER table pos_audit_report modify column accnt varchar(20) ;
ALTER table pos_detail modify column accnt varchar(20) ;
ALTER table pos_detail modify column billno varchar(20) ;
ALTER table pos_detail_history modify column accnt varchar(20) ;
ALTER table pos_detail_history modify column billno varchar(20) ;
ALTER table pos_detail_dai modify column accnt varchar(20) ;
ALTER table pos_detail_jie modify column accnt varchar(20) ;

ALTER table pos_dishcard modify column accnt varchar(20) ;
ALTER table pos_dishcard modify column foliono varchar(20) ;
ALTER table pos_dishcard_history modify column accnt varchar(20) ;
ALTER table pos_dishcard_history modify column foliono varchar(20) ;
ALTER table pos_drinks_consume_history modify column accnt varchar(20) ;

ALTER table pos_master modify column accnt varchar(20) ;
ALTER table pos_master modify column billno varchar(20) ;
ALTER table pos_master modify column pcrec varchar(20) ;
ALTER table pos_master modify column resno varchar(20) ;
ALTER table pos_master modify column toaccnt varchar(20) ;
ALTER table pos_master_history modify column accnt varchar(20) ;
ALTER table pos_master_history modify column billno varchar(20) ;
ALTER table pos_master_history modify column pcrec varchar(20) ;
ALTER table pos_master_history modify column resno varchar(20) ;
ALTER table pos_master_history modify column toaccnt varchar(20) ;

ALTER table pos_order modify column accnt varchar(20) ;
ALTER table pos_pay modify column accnt varchar(20) ;
ALTER table pos_pay modify column taccnt varchar(20) ;
ALTER table pos_pay modify column billno varchar(20) ;
ALTER table pos_res modify column accnt varchar(20) ;
ALTER table pos_res modify column toaccnt varchar(20) ;
ALTER table pos_res_order modify column accnt varchar(20) ;


ALTER table pos_table_map modify column accnt varchar(20) ;
ALTER table pos_table_map modify column pcrec varchar(20) ;

ALTER table pos_pccode modify column dec_mode varchar(10) ;
ALTER table pos_pccode modify column exp1 varchar(60) ;
ALTER table pos_pccode modify column exp2 varchar(60) ;
ALTER table pos_pccode modify column exp3 varchar(60) ;
ALTER table pos_pccode modify column exp4 varchar(60) ;

ALTER table pos_account modify column bank varchar(20) ;
ALTER table pos_account_history modify column bank varchar(20) ;

ALTER TABLE pos_account MODIFY COLUMN foliono VARCHAR(60) ;
ALTER TABLE pos_account_history MODIFY COLUMN foliono VARCHAR(60) ;
ALTER TABLE pos_account MODIFY COLUMN orderno VARCHAR(60) ;
ALTER TABLE pos_account_history MODIFY COLUMN orderno VARCHAR(60) ;
ALTER TABLE pos_account MODIFY COLUMN ifno2 VARCHAR(100) ;
ALTER TABLE pos_account_history MODIFY COLUMN info2 VARCHAR(100) ;


-- 新加吧台关联比例，默认为1
/*
----each----:[pos_store_plu_article][#pos_store_plu_article.rate]
*/
-- ALTER table pos_store_plu_article add column rate DECIMAL(10,2) DEFAULT 1 AFTER art_name; 
-- 修改work_station中mac字段长度
-- ALTER TABLE work_station CHANGE mac mac VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci DEFAULT '' NOT NULL;
-- ALTER TABLE hotel ADD COLUMN server_name VARCHAR(50) NULL AFTER client_type, ADD COLUMN area1 VARCHAR(50) NULL AFTER server_name, ADD COLUMN area2 VARCHAR(50) NULL AFTER area1;
-- ALTER table hotel ADD COLUMN client_version varchar(10) DEFAULT ''; 

/*
----each----:[bill_scene_link][#bill_scene_link.copies]
*/
alter table bill_scene_link ADD COLUMN copies int(11) DEFAULT 1;
/*
----each----:[report_center][#report_center.count_sql]
*/
alter table report_center ADD COLUMN count_sql text ;

ALTER TABLE pos_account MODIFY COLUMN bank VARCHAR(20);
ALTER TABLE pos_account_history MODIFY COLUMN bank VARCHAR(20);
-- -----------------------------
-- 2016.08.30 扩字段
-- -----------------------------
/*
----each----:[pos_plu_all][#pos_plu_all.subject_scan_code]
*/
alter table pos_plu_all add subject_scan_code varchar(110)  DEFAULT ''  after remark;
/*
----each----:[pos_plu_all][#pos_plu_all.subject]
*/
alter table pos_plu_all add subject varchar(110)  DEFAULT  ''  after remark;
/*
----each----:[pos_plu_all][#pos_plu_all.scan_code]
*/
alter table pos_plu_all add scan_code varchar(110)  DEFAULT  ''  after remark;
/*
----each----:[pos_plu_all][#pos_plu_all.uid_code]
*/
alter table pos_plu_all add uid_code varchar(110)  DEFAULT  ''  after remark;