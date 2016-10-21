/*
MySQL Backup
Source Server Version: 5.1.57
Source Database: portal_pos_bz
Date: 2016/9/28 10:29:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Procedure definition for `get_data_cancel_zero`
-- ----------------------------
DROP FUNCTION IF EXISTS `get_data_cancel_zero`;
DELIMITER ;;
CREATE  FUNCTION `get_data_cancel_zero`(
	arg_amount         DECIMAL(12,2)
	) RETURNS VARCHAR(20) CHARSET utf8
    NO SQL
    SQL SECURITY INVOKER
BEGIN
	DECLARE var_amount		DECIMAL(10,2);
	DECLARE var_return		VARCHAR(20);
	DECLARE var_amount0		DECIMAL(10,0);
	DECLARE var_amount1 		DECIMAL(10,1);
	
	IF ROUND(arg_amount,0) = arg_amount THEN
		SET var_amount0 = CAST(arg_amount AS DECIMAL(10,0));
		SET var_return = CAST(var_amount0 AS CHAR);
	ELSEIF ROUND(arg_amount,1) = arg_amount THEN
		SET var_amount1 = CAST(arg_amount AS DECIMAL(10,1));
		SET var_return = CAST(var_amount1 AS CHAR);
	ELSE
		SET var_amount = arg_amount;
		SET var_return = CAST(var_amount AS CHAR);
	END IF;
	
	RETURN var_return;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `get_pos_mode_amount`
-- ----------------------------
DROP FUNCTION IF EXISTS `get_pos_mode_amount`;
DELIMITER ;;
CREATE  FUNCTION `get_pos_mode_amount`(arg_hotel_group_id	BIGINT(16),
	arg_hotel_id            BIGINT(16),
	arg_mode           VARCHAR(10),
	arg_pccode         VARCHAR(10),
	arg_sort           VARCHAR(20),
	arg_code           VARCHAR(20),
	arg_amount         DECIMAL(12,2),
	arg_rate          DECIMAL(12,2),
	arg_type	         VARCHAR(20)) RETURNS DECIMAL(12,2)
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
	DECLARE var_amount DECIMAL(12,2); 
	DECLARE var_rate DECIMAL(12,2); 
	DECLARE var_count INT;
	DECLARE var_class  CHAR(1);
	DECLARE var_mode  CHAR(2);
	DECLARE var_pccode     VARCHAR(10);
	
	SELECT MODE INTO var_mode FROM pos_plu_all WHERE hotel_group_id = arg_hotel_group_id	 AND hotel_id = arg_hotel_id AND CODE = arg_code ;
 -- INSERT a(msg) SELECT concat(arg_mode,'/',arg_pccode,'/',arg_sort,'/',arg_code,'/',arg_type);
  -- 单菜折扣 不允许打折
	IF( var_mode = 'F' AND arg_type='1') THEN
		SET var_amount = 0;
	ELSE
   -- 开始模式计算
		-- 指定营业点 菜项
		IF EXISTS(SELECT 1 FROM pos_mode_def  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_mode AND  pccode = arg_pccode  AND  sort_code = arg_sort AND plu_code = arg_code AND TYPE = arg_type) THEN
			SELECT class1,rate INTO var_class,var_rate  FROM  pos_mode_def  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id 
				AND CODE = arg_mode AND  pccode = arg_pccode  AND  sort_code = arg_sort AND plu_code = arg_code AND TYPE = arg_type ORDER BY id DESC LIMIT 1 ;
			-- 模式为准
			IF (var_class = 'T') THEN 
				SELECT IFNULL(ROUND(arg_amount*var_rate,2),0) INTO var_amount ;
			ELSE  
				-- 主单为准
				SELECT IFNULL(ROUND(arg_amount*arg_rate,2),0)  INTO var_amount ;
			END IF ;
		ELSE 
			-- 指定营业点 菜类
			IF EXISTS(SELECT 1 FROM pos_mode_def  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_mode AND  pccode = arg_pccode  AND  sort_code = arg_sort AND TYPE = arg_type) THEN
				SELECT class1,rate INTO var_class,var_rate  FROM  pos_mode_def  WHERE hotel_group_id = arg_hotel_group_id	 AND hotel_id = arg_hotel_id 
					AND CODE = arg_mode AND  pccode = arg_pccode  AND  sort_code = arg_sort  AND TYPE = arg_type ORDER BY id DESC LIMIT 1 ;
				IF (var_class = 'T') THEN 		
					SELECT IFNULL(ROUND(arg_amount*var_rate,2),0) INTO var_amount ;
				ELSE  
					SELECT IFNULL(ROUND(arg_amount*arg_rate,2),0)  INTO var_amount ;
				END IF ;
			ELSE
					-- 所有营业点 菜项
					IF EXISTS(SELECT 1 FROM pos_mode_def  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_mode AND  pccode = '###'  AND  sort_code = arg_sort AND plu_code = arg_code AND TYPE = arg_type) THEN
						SELECT class1,rate INTO var_class,var_rate  FROM  pos_mode_def  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id 
							AND CODE = arg_mode AND  pccode = '###'  AND  sort_code = arg_sort AND plu_code = arg_code AND TYPE = arg_type ORDER BY id DESC LIMIT 1  ;
						IF (var_class = 'T') THEN 
							SELECT IFNULL(ROUND(arg_amount*var_rate,2),0) INTO var_amount ;
						ELSE  
							SELECT IFNULL(ROUND(arg_amount*arg_rate,2),0)  INTO var_amount ;
						END IF ;
					ELSE
						-- 所有营业点 菜类 																		
						IF EXISTS(SELECT 1 FROM pos_mode_def  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_mode AND  pccode = '###'  AND  sort_code = arg_sort AND TYPE = arg_type) THEN									
							SELECT class1,rate INTO var_class,var_rate  FROM  pos_mode_def  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id 
								AND CODE = arg_mode AND  pccode = '###'  AND  sort_code = arg_sort AND TYPE = arg_type ORDER BY id DESC LIMIT 1  ;
							IF (var_class = 'T') THEN 
								 SELECT IFNULL(ROUND(arg_amount*var_rate,2),0) INTO var_amount ;
							ELSE  
								 SELECT IFNULL(ROUND(arg_amount*arg_rate,2),0)  INTO var_amount ;
							END IF ;
						ELSE
							SELECT IFNULL(ROUND(arg_amount*arg_rate,2),0)  INTO var_amount ;
						END IF ;
					END IF ;
			END IF ;
 
		END IF ;
	END IF;
	RETURN var_amount;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `get_pos_mode_amount_bak`
-- ----------------------------
DROP FUNCTION IF EXISTS `get_pos_mode_amount_bak`;
DELIMITER ;;
CREATE  FUNCTION `get_pos_mode_amount_bak`(arg_hotel_group_id	BIGINT(16),
	arg_hotel_id            BIGINT(16),
	arg_mode           VARCHAR(10),
	arg_pccode         VARCHAR(10),
	arg_sort           VARCHAR(20),
	arg_code           VARCHAR(20),
  arg_amount         DECIMAL(12,2),
  arg_rate          DECIMAL(12,2),
	arg_type	         VARCHAR(20)) RETURNS DECIMAL(12,2)
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
  DECLARE var_amount DECIMAL(12,2); 
  DECLARE var_rate DECIMAL(12,2); 
	DECLARE var_count INT;
  DECLARE var_class  CHAR(1);
  DECLARE var_mode  CHAR(2);
	DECLARE var_pccode     VARCHAR(10);
  SELECT MODE INTO var_mode FROM pos_plu_all WHERE hotel_group_id = arg_hotel_group_id	 AND hotel_id = arg_hotel_id AND CODE = arg_code ;
  -- 单菜折扣 不允许打折
 IF( var_mode = 'F' AND arg_type='1') THEN
     SET var_amount = 0;
 ELSE
   -- 开始模式计算
   -- 指定营业点 菜项
 SELECT COUNT(1),class1,rate INTO var_count,var_class,var_rate  FROM  pos_mode_def  WHERE hotel_group_id = arg_hotel_group_id	 AND hotel_id = arg_hotel_id 
                                                                AND CODE = arg_mode AND  pccode = arg_pccode  AND  sort_code = arg_sort AND plu_code = arg_code AND TYPE = arg_type ORDER BY id DESC LIMIT 1 ;
	IF (var_count > 0) THEN
      -- 模式为准
      IF (var_class = 'T') THEN 
           SELECT IFNULL(ROUND(arg_amount*var_rate,2),0) INTO var_amount ;
      ELSE  
      -- 主单为准
	        SELECT IFNULL(ROUND(arg_amount*arg_rate,2),0)  INTO var_amount ;
     END IF ;
  ELSE 
   -- 指定营业点 菜类
      SELECT COUNT(1),class1,rate INTO var_count,var_class,var_rate  FROM  pos_mode_def  WHERE hotel_group_id = arg_hotel_group_id	 AND hotel_id = arg_hotel_id 
                                                                AND CODE = arg_mode AND  pccode = arg_pccode  AND  sort_code = arg_sort  AND TYPE = arg_type ORDER BY id DESC LIMIT 1 ;
      IF (var_count > 0) THEN
             IF (var_class = 'T') THEN 
                SELECT IFNULL(ROUND(arg_amount*var_rate,2),0) INTO var_amount ;
             ELSE  
	              SELECT IFNULL(ROUND(arg_amount*arg_rate,2),0)  INTO var_amount ;
             END IF ;
      ELSE
           -- 所有营业点 菜项
               SELECT COUNT(1),class1,rate INTO var_count,var_class,var_rate  FROM  pos_mode_def  WHERE hotel_group_id = arg_hotel_group_id	 AND hotel_id = arg_hotel_id 
                                                                AND CODE = arg_mode AND  pccode = '###'  AND  sort_code = arg_sort AND plu_code = arg_code AND TYPE = arg_type ORDER BY id DESC LIMIT 1  ;
              
                    IF (var_count > 0) THEN
														IF (var_class = 'T') THEN 
														   SELECT IFNULL(ROUND(arg_amount*var_rate,2),0) INTO var_amount ;
												    ELSE  
														   SELECT IFNULL(ROUND(arg_amount*arg_rate,2),0)  INTO var_amount ;
												    END IF ;
									  ELSE
                    -- 所有营业点 菜类 
											 SELECT COUNT(1),class1,rate INTO var_count,var_class,var_rate  FROM  pos_mode_def  WHERE hotel_group_id = arg_hotel_group_id	 AND hotel_id = arg_hotel_id 
																																											AND CODE = arg_mode AND  pccode = '###'  AND  sort_code = arg_sort AND TYPE = arg_type ORDER BY id DESC LIMIT 1  ;
																		
																					IF (var_count > 0) THEN
																									IF (var_class = 'T') THEN 
																										 SELECT IFNULL(ROUND(arg_amount*var_rate,2),0) INTO var_amount ;
																									ELSE  
																										 SELECT IFNULL(ROUND(arg_amount*arg_rate,2),0)  INTO var_amount ;
																									END IF ;
																						ELSE
                                                   -- SET var_amount = 0;
                                                    SELECT IFNULL(ROUND(arg_amount*arg_rate,2),0)  INTO var_amount ;
                                          END IF ;
                    END IF ;
      END IF ;
 
 END IF ;
END IF;
	RETURN var_amount;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `TO_UPPER_NUM`
-- ----------------------------
DROP FUNCTION IF EXISTS `TO_UPPER_NUM`;
DELIMITER ;;
CREATE  FUNCTION `TO_UPPER_NUM`(
	P_NUM DECIMAL(16,2), 	
	P_ROUND INT(1)	
) RETURNS VARCHAR(200) CHARSET utf8
    DETERMINISTIC
BEGIN
	
	
	
	
	
	
	
	
	
	
	DECLARE RESULT      VARCHAR(100) DEFAULT '';	 
	DECLARE NUM_ROUND   VARCHAR(100) DEFAULT '';  
   
	DECLARE NUM_LEFT    VARCHAR(100) DEFAULT '';  
	DECLARE NUM_RIGHT   VARCHAR(100) DEFAULT '';  
   
	DECLARE STR1        CHAR(10) DEFAULT '零壹贰叁肆伍陆柒捌玖'; 
	DECLARE STR2        CHAR(16) DEFAULT '仟佰拾兆仟佰拾亿仟佰拾万仟佰拾圆'; 
	DECLARE NUM_CURRENT INT(1) DEFAULT 0; 
	DECLARE NUM_COUNT   INT(1) DEFAULT 0; 
   
	DECLARE TAGI	       INT(2) DEFAULT 1; 
   
	IF P_NUM IS NULL THEN
		RETURN('');
	END IF;
	IF P_ROUND IS NULL OR P_ROUND > 2 THEN
		SET P_ROUND = 2;
	END IF;
  
	SET NUM_ROUND = ROUND(P_NUM, P_ROUND)+''; 
	
	IF(INSTR(NUM_ROUND, '.') = 0 ) THEN
		SET NUM_CURRENT = LENGTH(NUM_ROUND);
	ELSE
		SET NUM_CURRENT = INSTR(NUM_ROUND, '.')-1;
	END IF; 
	SET NUM_LEFT = CONCAT(IFNULL(SUBSTR(NUM_ROUND,1,NUM_CURRENT),''));
  
	
	IF(INSTR(NUM_ROUND, '.') = 0 ) THEN
		SET NUM_CURRENT = 0;
	ELSE
		SET NUM_CURRENT = INSTR(NUM_ROUND, '.')+1;
	END IF;
	IF(NUM_CURRENT <> 0) THEN
		SET NUM_RIGHT = SUBSTR(NUM_ROUND,NUM_CURRENT,P_ROUND);	
	END IF;
  
	SET NUM_CURRENT = 0;
    
	
	IF (LENGTH(NUM_LEFT) > 16) THEN
		RETURN('************');
	END IF;
	IF(LENGTH(NUM_LEFT) > 0) THEN
		WHILE (TAGI <= LENGTH(NUM_LEFT)) DO
			SET NUM_CURRENT = SUBSTR(NUM_LEFT, TAGI, 1) + 0;
			SET NUM_COUNT   = 16 - LENGTH(NUM_LEFT) + TAGI;
			
			IF (NUM_CURRENT <> 0) THEN
				SET RESULT = CONCAT(RESULT,SUBSTR(STR1, NUM_CURRENT + 1, 1),SUBSTR(STR2, NUM_COUNT, 1));
			ELSE
				IF(LENGTH(RESULT) > 0 AND TAGI<> LENGTH(NUM_LEFT) AND RIGHT(RESULT,1) <> '零') THEN
					IF(MOD(NUM_COUNT,4) = 0) THEN
						SET RESULT = CONCAT(RESULT,SUBSTR(STR2, NUM_COUNT, 1));
					ELSE
						IF(MOD(NUM_COUNT,3) = 0 AND RIGHT(RESULT,1) <> '拾' AND RIGHT(RESULT,1) <> '佰' AND RIGHT(RESULT,1) <> '仟' AND RIGHT(RESULT,1) <> '万' AND RIGHT(RESULT,1) <> '亿'  AND RIGHT(RESULT,1) <> '兆') THEN
							SET RESULT = CONCAT(RESULT,SUBSTR(STR2, NUM_COUNT, 1));
						ELSE
							IF(MOD(NUM_COUNT,2) = 0 AND RIGHT(RESULT,1) <> '拾' AND RIGHT(RESULT,1) <> '佰' AND RIGHT(RESULT,1) <> '仟' AND RIGHT(RESULT,1) <> '万'  AND RIGHT(RESULT,1) <> '亿'  AND RIGHT(RESULT,1) <> '兆') THEN
								SET RESULT = CONCAT(RESULT,SUBSTR(STR2, NUM_COUNT, 1));
							END IF;
						END IF;	
					END IF;
					IF(LENGTH(RESULT) > 1) THEN
						SET RESULT = CONCAT(RESULT,'零');
					END IF;
				END IF;	
			END IF;
			SET TAGI = TAGI + 1;
		END WHILE;
		SET TAGI = 1;
	END IF;
	IF(LENGTH(RESULT) > 0) THEN
		SET RESULT = CONCAT(RESULT, '圆');
	END IF;
	IF (LENGTH(NUM_RIGHT) > 0) THEN
		WHILE (TAGI <= LENGTH(NUM_RIGHT)) DO
			SET NUM_CURRENT = SUBSTR(NUM_RIGHT,TAGI , 1)+0;
			IF(NUM_CURRENT <> 0) THEN
				IF(TAGI = 1) THEN
					SET RESULT = CONCAT(RESULT,SUBSTR(STR1, NUM_CURRENT + 1, 1),'角');
				ELSE
					SET RESULT = CONCAT(RESULT,SUBSTR(STR1, NUM_CURRENT + 1, 1),'分');
				END IF;
			END IF;
			SET TAGI = TAGI + 1;
		END WHILE;
	ELSE
		SET RESULT = CONCAT(RESULT,'整');
	END IF;
	IF(LENGTH(NUM_RIGHT) = 1) THEN
		SET RESULT = CONCAT(RESULT,'整');
	END IF;
	IF (P_NUM < 0) THEN
		SET RESULT = CONCAT('负',RESULT);
	END IF;
	SET RESULT = REPLACE(RESULT, '万仟', '万');
	SET RESULT = REPLACE(RESULT, '仟佰', '仟');
	SET RESULT = REPLACE(RESULT, '佰拾', '佰');
	SET RESULT = REPLACE(RESULT, '零圆', '圆');
	SET RESULT = REPLACE(RESULT, '壹拾圆', '拾圆');
	SET RESULT = REPLACE(RESULT, '圆圆', '圆');
	IF(RESULT = '整') THEN
		SET RESULT = '零圆';
	END IF;
	RETURN(RESULT);
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_audit_apportion`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_audit_apportion`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_audit_apportion`(IN arg_hotel_group_id	INT,
	IN arg_hotel_id			INT,
  IN arg_biz_date			DATETIME,
	OUT arg_ret				INT)
    SQL SECURITY INVOKER
label_0:
BEGIN
	
  -- 付款为款待、折扣的分摊过程
   DECLARE var_bizdate DATETIME ;
   DECLARE var_billno VARCHAR(20) ;
   DECLARE var_amount DECIMAL(12,2);
	 DECLARE var_apportion DECIMAL(12,2);
   DECLARE var_apportion_ce DECIMAL(12,2);
   DECLARE var_id BIGINT  DEFAULT 0;
   DECLARE i INT DEFAULT 0;
   DECLARE j INT DEFAULT 0;
    DECLARE t_error INTEGER DEFAULT 0;  
    DECLARE done_cursor INT DEFAULT 0 ;
   DECLARE var_cursor CURSOR FOR SELECT billno,amount FROM tmp_account_apportion;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1;
   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error = 1;
	SET @procresult = 0 ;
	SET arg_ret = 1 ;
 -- SELECT ADDDATE(biz_date1, -1) INTO var_bdate FROM audit_flag WHERE hotel_group_id=arg_hotel_group_id AND hotel_id=arg_hotel_id ;
      SELECT set_value INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
     
  
     -- CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
    --  CREATE TEMPORARY TABLE tmp_pos_account SELECT * FROM pos_account WHERE 1=2;
     -- CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2 ;
      
    
     -- 款待金额
     DROP TEMPORARY TABLE IF EXISTS tmp_account_apportion;
	   CREATE TEMPORARY TABLE tmp_account_apportion (
           `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
           `billno` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '单号',
           `amount` DECIMAL(12,2) DEFAULT '0.00',
           PRIMARY KEY (`id`)		
	);
  START TRANSACTION;
      SELECT TO_DAYS(arg_biz_date)-TO_DAYS(var_bizdate) INTO i;
      IF i=0 THEN
        
          INSERT INTO tmp_account_apportion(billno,amount) 
          SELECT a.billno,SUM(a.credit)
          FROM pos_account a LEFT JOIN code_transaction b ON  a.hotel_group_id=b.hotel_group_id AND  a.hotel_id = b.hotel_id AND a.paycode = b.code
          WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id -- AND a.biz_date = arg_biz_date 
                                                      AND a.sta = 'O' AND (b.cat_posting = 'ENT' OR b.cat_posting='DSC')
          GROUP BY a.billno;
      
         -- SELECT * FROM tmp_account_apportion ;
      ELSE
         -- INSERT INTO tmp_pos_master SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
         -- INSERT INTO tmp_pos_account SELECT * FROM pos_account_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
         -- INSERT INTO tmp_pos_detail SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
          INSERT INTO tmp_account_apportion(billno,amount) 
          SELECT a.billno,SUM(a.credit)
          FROM pos_account_history a LEFT JOIN code_transaction b ON  a.hotel_group_id=b.hotel_group_id AND  a.hotel_id = b.hotel_id AND a.paycode = b.code
          WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = arg_biz_date AND a.sta = 'O' AND (b.cat_posting = 'ENT' OR b.cat_posting='DSC') 
          GROUP BY a.billno;
      END IF ;
   
  IF(i=0) THEN
     OPEN var_cursor;
     SET done_cursor = 0;
     SET j=0 ;
     FETCH var_cursor INTO var_billno,var_amount;
     WHILE done_cursor<>1 DO  
           SET j=j+1;
            SELECT ROUND(var_amount/(SUM(amount)-SUM(dsc)+SUM(srv)),2) INTO var_apportion  FROM  pos_detail 
            -- SUBSTRING(flag1,5,1)  为单菜款待，SUBSTRING(flag1,1,1)  为 单菜折扣  不进行再次分摊
            WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id -- AND biz_date = arg_biz_date  
                                                      AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'  AND  SUBSTRING(flag1,5,1) <> '1'  AND  SUBSTRING(flag1,1,1) <> '1';
           
             -- 分摊更新
            UPDATE  pos_detail  SET amount1=ROUND(amount*var_apportion),amount2 = ROUND(dsc*var_apportion),amount3 = ROUND(srv*var_apportion) 
            WHERE   hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date  AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'  AND  SUBSTRING(flag1,5,1) <> '1' AND  SUBSTRING(flag1,1,1) <> '1';
          
            -- 计算分摊后差额 
            SELECT var_amount-(SUM(amount1)+SUM(amount2)+SUM(amount3)) INTO var_apportion_ce FROM pos_detail 
            WHERE   hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date  AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'  AND  SUBSTRING(flag1,5,1) <> '1' AND  SUBSTRING(flag1,1,1) <> '1';
             
            IF var_apportion_ce <> 0 THEN
             -- 分摊后差额 放入最后一个菜里
             SELECT id INTO var_id FROM pos_detail  WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date  AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'   AND  SUBSTRING(flag1,5,1) <> '1' AND  SUBSTRING(flag1,1,1) <> '1' ORDER BY id DESC LIMIT 1 ;
             UPDATE  pos_detail  SET amount1 = amount1 + var_apportion_ce WHERE id = var_id ;
            END IF;
               
     FETCH var_cursor INTO var_billno,var_amount;
     END WHILE; 
     CLOSE var_cursor;
    
ELSE 
     OPEN var_cursor;
     SET done_cursor = 0;
     SET j=0 ;
     FETCH var_cursor INTO var_billno,var_amount;
     WHILE done_cursor<>1 DO  
           SET j=j+1;
          
            SELECT ROUND(var_amount/(SUM(amount)-SUM(dsc)+SUM(srv)),2) INTO var_apportion  FROM  pos_detail_history 
            -- SUBSTRING(flag1,5,1)  为单菜款待，SUBSTRING(flag1,1,1)  为 单菜折扣  不进行再次分摊
            WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date  AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'  AND  SUBSTRING(flag1,5,1) <> '1'  AND  SUBSTRING(flag1,1,1) <> '1';
            
             -- 分摊更新
            UPDATE  pos_detail_history  SET amount1=ROUND(amount*var_apportion),amount2 = ROUND(dsc*var_apportion),amount3 = ROUND(srv*var_apportion) 
            WHERE   hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date  AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'  AND  SUBSTRING(flag1,5,1) <> '1' AND  SUBSTRING(flag1,1,1) <> '1';
            -- 计算分摊后差额
            SELECT var_amount-(SUM(amount1)+SUM(amount2)+SUM(amount3)) INTO var_apportion_ce  FROM pos_deptdai_history 
            WHERE   hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date  AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'  AND  SUBSTRING(flag1,5,1) <> '1' AND  SUBSTRING(flag1,1,1) <> '1';
            
              IF var_apportion_ce <> 0 THEN
             -- 分摊后差额 放入最后一个菜里
             SELECT id INTO var_id FROM pos_detail_history  WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date  AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'   AND  SUBSTRING(flag1,5,1) <> '1' AND  SUBSTRING(flag1,1,1) <> '1' ORDER BY id DESC LIMIT 1 ;
             UPDATE  pos_detail_history  SET amount1 = amount1 + var_apportion_ce WHERE id = var_id ;
            END IF;
          
     FETCH var_cursor INTO var_billno,var_amount;
     END WHILE; 
     CLOSE var_cursor;
  
END IF ;
	  
  -- 分摊完成，更新主单分摊金额  
    SELECT TO_DAYS(arg_biz_date)-TO_DAYS(var_bizdate) INTO i;
IF(i=0) THEN
        --  SELECT hotel_group_id,hotel_id,accnt ,SUM(amount1) AS amount1 ,SUM(amount2) AS amount2 ,SUM(amount3) AS amount3 FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id GROUP BY hotel_group_id,hotel_id,accnt ; 
		 UPDATE pos_master a ,      
		 ( SELECT hotel_group_id,hotel_id,accnt ,SUM(amount1) AS amount1 ,SUM(amount2) AS amount2 ,SUM(amount3) AS amount3  
																								 FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id -- AND biz_date = arg_biz_date 
																								 GROUP BY hotel_group_id,hotel_id,accnt )  b  
     SET a.amount1 = b.amount1,a.amount2 = b.amount2 ,a.amount3 = b.amount3 
     WHERE a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt 
     AND a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id ;-- AND a.biz_date = arg_biz_date ;
     
ELSE    
   
     UPDATE pos_master_history a ,( SELECT hotel_group_id,hotel_id,accnt ,SUM(amount1) AS amount1 ,SUM(amount2) AS amount2 ,SUM(amount3) AS amount3 
                           FROM  pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date GROUP BY hotel_group_id,hotel_id,accnt )  b  
     SET a.amount1 = b.amount1,a.amount2 = b.amount2 ,a.amount3 = b.amount3 
     WHERE a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt AND hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date  ;
END IF ;
  IF t_error = 1 THEN  
           ROLLBACK;  
           SET arg_ret = -1 ;         
       ELSE  
          COMMIT;  
           SET arg_ret = 1 ;
  END IF; 
    
	BEGIN
		DROP TEMPORARY TABLE IF EXISTS tmp_account_apportion; 
		SET @procresult = 0 ;
		LEAVE label_0 ;
	END ;
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_audit_begin_check`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_audit_begin_check`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_audit_begin_check`(
	IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
	IN arg_biz_date		DATETIME)
    SQL SECURITY INVOKER
label_0:
BEGIN
   
	DROP TEMPORARY TABLE IF EXISTS tmp_audit_process_check;
	CREATE TEMPORARY TABLE tmp_audit_process_check (
		hotel_group_id 		BIGINT(16) NOT NULL,
		hotel_id 		BIGINT(16) NOT NULL,
		biz_date 		DATE,
		id 			BIGINT(16) NOT NULL AUTO_INCREMENT,
		TYPE 			VARCHAR(5) NOT NULL,
		accnt 			VARCHAR(20) DEFAULT '',
		CODE 			VARCHAR(20) DEFAULT '',
		sta 			VARCHAR(1) DEFAULT '',
		descript  		VARCHAR(100) DEFAULT '',
		charge 			DECIMAL(12,2) DEFAULT 0,
		detailrows 		INT DEFAULT 0,
		credit 			DECIMAL(12,2) DEFAULT 0,
		accountrows 		INT DEFAULT 0,
		balance 		DECIMAL(12,2) DEFAULT 0,
		resno			VARCHAR(20) DEFAULT '',
		ressta			VARCHAR(1) DEFAULT '',
		flag 			VARCHAR(1),
		PRIMARY KEY (id)
  ) ;
			
	INSERT INTO tmp_audit_process_check(hotel_group_id,hotel_id,biz_date,TYPE,accnt,CODE,sta,descript,charge,detailrows,credit,accountrows,balance,resno,ressta,flag)	
		SELECT arg_hotel_group_id,arg_hotel_id,arg_biz_date,'A',accnt,'',sta,'',0,0,0,0,0,IFNULL(resno,''),'','F' FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ORDER BY accnt;
	
	-- 统计每个单子的消费金额
	UPDATE tmp_audit_process_check a,(SELECT hotel_group_id,hotel_id,accnt,IFNULL(SUM(amount+srv-dsc+tax),0) AS charge FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND sta = 'I' GROUP BY accnt) b
		SET a.charge = IFNULL(b.charge,0) WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt;
	
	-- 统计每个单子pos_detail记录数
	UPDATE tmp_audit_process_check a,(SELECT hotel_group_id,hotel_id,accnt,IFNULL(COUNT(*),0) AS number1 FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date GROUP BY accnt) b
		SET a.detailrows = IFNULL(b.number1,0) WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt;
	-- 统计每个单子付款金额
	UPDATE tmp_audit_process_check a,(SELECT hotel_group_id,hotel_id,accnt,IFNULL(SUM(credit),0) AS credit FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND number = '2' AND sta <> 'X' GROUP BY accnt) b
		SET a.credit = IFNULL(b.credit,0) WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt;
	-- 统计每个单子pos_account记录数
	UPDATE tmp_audit_process_check a,(SELECT hotel_group_id,hotel_id,accnt,IFNULL(COUNT(*),0) AS number2 FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date GROUP BY accnt) b
		SET a.accountrows = IFNULL(b.number2,0) WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt;
	
	-- 统计每个单子pos_account记录数
	UPDATE tmp_audit_process_check a,pos_res b
		SET a.ressta = IFNULL(b.sta,'') WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.resno = b.accnt;
	
	UPDATE tmp_audit_process_check SET balance = IFNULL(charge - credit,0);
	
	SELECT hotel_group_id AS hotelGroupId,hotel_id hotelId,biz_date AS bizDate,id,TYPE,accnt,CODE,sta,descript,charge,detailrows,credit,accountrows,balance,resno,ressta,flag FROM tmp_audit_process_check ORDER BY accnt;
	DROP TEMPORARY TABLE IF EXISTS tmp_audit_process_check;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_audit_init`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_audit_init`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_audit_init`(
	IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
	OUT arg_msg		VARCHAR(60))
    SQL SECURITY INVOKER
label_0:
BEGIN
	-- 餐饮夜审过程
  
	DECLARE var_bizdate DATETIME;
	DECLARE var_maxinum INTEGER;
	DECLARE var_count INTEGER;
	DECLARE var_dsc DECIMAL(12,2);
	DECLARE i INT DEFAULT 0;
	DECLARE j INT DEFAULT 0;
	DECLARE var_sql		VARCHAR(1024);
	DECLARE var_apportion_ret INTEGER DEFAULT 0; 
	DECLARE t_error INTEGER DEFAULT 0;  
  -- DECLARE done_cursor INT DEFAULT 0 ;
 --  DECLARE var_cursor CURSOR FOR SELECT tableno FROM tmp_table;
  -- DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;
	SET  arg_msg = "1,夜审完成!" ;  
	
	   -- 添加夜审前数据备份到back表
	DELETE FROM pos_master_back WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	DELETE FROM pos_account_back WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	DELETE FROM pos_detail_back WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	
	INSERT pos_master_back SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	INSERT pos_account_back SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	INSERT pos_detail_back SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	
   -- SELECT DATE_FORMAT(set_value,'%Y-%m-%d')  INTO var_bizdate FROM sys_option where hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
	SELECT set_value  INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
		
	SELECT TO_DAYS(NOW())-TO_DAYS(var_bizdate) INTO i;
	IF i< 0 THEN 
		SET  arg_msg = "0,夜间稽核已做!" ;  
	ELSE
		SELECT HOUR(NOW())-HOUR(var_bizdate) INTO j;
		IF i=0 AND j<18 THEN 
			SET  arg_msg = "-1,请在下午六点之后再做夜间稽核!" ;  
		ELSE
       -- 开始夜间稽核事物
		START TRANSACTION;
                 -- 夜审自动将I转成S,撤销未结账
			INSERT pos_accnt_sync  (hotel_group_id,hotel_id,entity_name,accnt,res_accnt,TYPE,is_sync,is_halt,create_user,create_datetime,modify_user,modify_datetime)
			SELECT hotel_group_id,hotel_id,'com.greencloud.entity.PosMaster',accnt,resno,'DELETE','F','F','ADMIN',NOW(),'ADMIN',NOW() 
				FROM pos_master WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND (sta = 'I' OR sta = 'C');
			UPDATE pos_master SET sta = 'S' WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND (sta = 'I' OR sta = 'C') AND biz_date = var_bizdate ;
			UPDATE pos_account SET sta = 'S' WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt IN (SELECT accnt FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta = 'S' ) AND sta = 'I' AND number = '1';
			UPDATE pos_account SET sta = 'X' WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt IN (SELECT accnt FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta = 'S' ) AND sta = 'I' AND number = '2';
			UPDATE pos_detail  SET billno = 'S' WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt IN (SELECT accnt FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta = 'S' ) AND sta = 'I' ;
                    -- 款待分摊
			CALL  up_pos_audit_apportion(arg_hotel_group_id,arg_hotel_id,var_bizdate,@a);
			SELECT @a INTO var_apportion_ret ;
			IF(var_apportion_ret = -1)THEN 
				SET t_error = 2;
			END IF;
                    -- 生成夜审报表
			CALL  up_pos_audit_init_report(arg_hotel_group_id,arg_hotel_id,var_bizdate);
    
			INSERT  pos_master_history SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND sta<>'S'  AND biz_date = var_bizdate;
			INSERT  pos_account_history SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id   AND sta<>'S'  AND biz_date = var_bizdate AND number = '1';
			INSERT  pos_account_history SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id   AND sta<>'I'  AND biz_date = var_bizdate AND number = '2';
			INSERT  pos_detail_history SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND IFNULL(billno,'')<>'S'  AND biz_date = var_bizdate;
                   -- 生成前台需要使用的数据，为了适应千恒餐饮接口传数据
                  --  ---------------------------------
                    --  清理数据 AND  (TO_DAYS(biz_date)-TO_DAYS(var_bizdate) = 0)
			DELETE FROM  pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND sta <> 'S' AND biz_date = var_bizdate;
	                DELETE FROM  pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND sta <> 'S' AND biz_date = var_bizdate AND number = '1';
			DELETE FROM  pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND sta <> 'I' AND biz_date = var_bizdate AND number = '2';
	                DELETE FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND IFNULL(billno,'') <> 'S' AND biz_date = var_bizdate;
	                
			INSERT pos_dishcard_history SELECT * FROM pos_dishcard WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = var_bizdate;
			DELETE FROM pos_dishcard WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = var_bizdate;
                  --   清理大表  
			DELETE FROM  pos_detail_jie WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND TO_DAYS(NOW())-TO_DAYS(biz_date)>90;
			DELETE FROM  pos_detail_dai WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND TO_DAYS(NOW())-TO_DAYS(biz_date)>90;  
			DELETE FROM pos_accnt_sync WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND create_datetime <= DATE_ADD(var_bizdate,INTERVAL -3 DAY);    
			DELETE FROM pos_bill_addition WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt NOT IN (SELECT accnt FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id);
			DELETE FROM pos_selected_object WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
			DELETE FROM pos_discount_rate_kaiyuan WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt NOT IN (SELECT accnt FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id);
                  --   处理预订
			UPDATE pos_res  SET sta = 'N' ,osta = sta,modify_datetime=NOW() WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = var_bizdate AND sta IN ('R','G');
                  --   更新营业日期
			UPDATE  sys_extra_id SET pos_cur = 1 WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE IN ('POSRSV','POSMASTER','POSBILL');
			UPDATE  sys_option SET set_value = DATE_ADD(set_value, INTERVAL 1 DAY) ,modify_datetime=NOW() WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
			UPDATE  sys_option SET set_value = DATE_ADD(set_value, INTERVAL 1 DAY) ,modify_datetime=NOW() WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'biz_date';
			
			IF t_error = 1 OR t_error = 2 THEN  
				ROLLBACK;  
				SET  arg_msg = "-1,夜间稽核未完成!" ;  
          
			ELSE  
				COMMIT;  
			SET  arg_msg = "1,夜间稽核完成!" ;  
       END IF; 
     END IF;
END IF;
     	
	
	BEGIN		
		LEAVE label_0;
	END; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_audit_init_check`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_audit_init_check`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_audit_init_check`(IN arg_hotel_group_id	BIGINT(16),	
	  IN arg_hotel_id		BIGINT(16),IN arg_biz_date		DATETIME)
    SQL SECURITY INVOKER
label_0:
BEGIN
   
   DROP TEMPORARY TABLE IF EXISTS tmp_audit_process_check;
   CREATE TEMPORARY TABLE `tmp_audit_process_check` (
		`hotel_group_id` BIGINT(16) NOT NULL,
		`hotel_id` BIGINT(16) NOT NULL,
		`id` BIGINT(16) NOT NULL AUTO_INCREMENT,
		`execType` VARCHAR(10) DEFAULT '' ,
		`execOrder` VARCHAR(30) DEFAULT '',
		`execDescript` VARCHAR(100) DEFAULT '',
		`execValue` VARCHAR(100) DEFAULT '',
		PRIMARY KEY (`id`)
  ) ;
      INSERT INTO tmp_audit_process_check(hotel_group_id, hotel_id,execType,execOrder,execDescript,execValue)
      SELECT arg_hotel_group_id	,arg_hotel_id		,'SQL','1','本日开单总数',COUNT(accnt)
      FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND sta <> 'X' ;
      INSERT INTO tmp_audit_process_check(hotel_group_id, hotel_id,execType,execOrder,execDescript,execValue)
      SELECT arg_hotel_group_id	,arg_hotel_id		,'SQL','2','本日未结单数/金额',CONCAT(IFNULL(COUNT(DISTINCT(a.accnt)),0),'/',IFNULL(SUM(b.amount),0))
      FROM pos_master a LEFT JOIN pos_detail b  ON a.hotel_group_id=b.hotel_group_id AND a.hotel_id=b.hotel_id AND a.accnt=b.accnt
      WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = arg_biz_date AND a.sta IN ('C','I') ;
      INSERT INTO tmp_audit_process_check(hotel_group_id, hotel_id,execType,execOrder,execDescript,execValue)
      SELECT arg_hotel_group_id	,arg_hotel_id		,'SQL','3','本日挂账单数/金额',CONCAT(IFNULL(COUNT(a.accnt),0),'/',IFNULL(SUM(b.amount),0))
      FROM pos_master a LEFT JOIN pos_detail b  ON  a.hotel_group_id=b.hotel_group_id AND a.hotel_id=b.hotel_id AND a.accnt=b.accnt 
      WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = arg_biz_date AND a.sta = 'S' ;
      INSERT INTO tmp_audit_process_check(hotel_group_id, hotel_id,execType,execOrder,execDescript,execValue)
      SELECT arg_hotel_group_id	,arg_hotel_id		,'SQL','4','本日总消费金额',SUM(amount)
      FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND sta <> 'X' ;
      INSERT INTO tmp_audit_process_check(hotel_group_id, hotel_id,execType,execOrder,execDescript,execValue)
      SELECT arg_hotel_group_id	,arg_hotel_id		,'SQL','5','本日总付款金额',SUM(credit)
      FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND sta <> 'X' ;
       
      INSERT INTO tmp_audit_process_check(hotel_group_id, hotel_id,execType,execOrder,execDescript,execValue)
      SELECT arg_hotel_group_id	,arg_hotel_id		,'PosAmount','6','本日转前台发生金额',IFNULL(SUM(credit),0)
      FROM pos_account a,code_transaction b
      WHERE  a.hotel_group_id=b.hotel_group_id AND a.hotel_id=b.hotel_id AND a.paycode=b.code AND 
             a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.number = 2 AND a.biz_date = arg_biz_date AND a.sta <> 'X' AND b.cat_posting IN ('TF','TA','RCV') ;
      INSERT INTO tmp_audit_process_check(hotel_group_id, hotel_id,execType,execOrder,execDescript,execValue)
      SELECT arg_hotel_group_id	,arg_hotel_id		,'PmsCredit','7','本日转前台收到金额','PMS未返回' ;
      
      SELECT hotel_group_id AS hotelGroupId, hotel_id AS hotelId,id,execType,execOrder,execDescript,execValue FROM tmp_audit_process_check ;
      DROP TEMPORARY TABLE IF EXISTS  tmp_audit_process_check; 
	BEGIN
		SET @procresult = 0 ;
		LEAVE label_0 ;
	END ; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_audit_init_report`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_audit_init_report`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_audit_init_report`(IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
 	IN arg_biz_date		DATETIME)
    SQL SECURITY INVOKER
label_0:
BEGIN
	-- 餐饮夜审报表过程
   DECLARE bdate			DATETIME;
	 DECLARE var_ret 		INTEGER;
	 DECLARE var_msg 		VARCHAR(70);
	 DECLARE TYPE			CHAR(1);
	 DECLARE userCode			VARCHAR(10);
	 DECLARE shift			CHAR(1);
	 DECLARE pccodes		VARCHAR(100);
	 DECLARE min_pccode    VARCHAR(5);
	 DECLARE pccode_des	VARCHAR(30) ; 
   DECLARE var_sql		VARCHAR(1024);
	 DECLARE var_bizdate DATETIME;
	 DECLARE var_maxinum INTEGER;
	 DECLARE var_count INTEGER;
	 DECLARE var_dsc DECIMAL(12,2);
   DECLARE i INT DEFAULT 0;
   DECLARE j INT DEFAULT 0;
   DECLARE t_error INTEGER DEFAULT 0;  
   DECLARE done_cursor INT DEFAULT 0 ;
   DECLARE var_cursor CURSOR FOR SELECT tableno FROM tmp_table;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1;
   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;
   SET var_ret = 0;
	 SET var_msg = '成功';
 -- 开始夜间稽核事物
  
    SELECT set_value INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
     	DELETE FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_biz_date;
	    DELETE FROM pos_audit_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_biz_date;  
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_master ;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_account ;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail ;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_pccode ;
      DROP TEMPORARY TABLE IF EXISTS tmp_code_base ;
      CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
      CREATE TEMPORARY TABLE tmp_pos_account SELECT * FROM pos_account WHERE 1=2;
      CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2 ;
      CREATE TEMPORARY TABLE tmp_pos_pccode SELECT * FROM pos_pccode WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
      CREATE TEMPORARY TABLE tmp_code_base SELECT * FROM  code_base  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND parent_code = 'pos_rep_item';
      SELECT TO_DAYS(arg_biz_date)-TO_DAYS(var_bizdate) INTO i;
      IF i=0 THEN
         INSERT INTO tmp_pos_master SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_account SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_detail SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_biz_date ;
      
      ELSE
         INSERT INTO tmp_pos_master SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_account SELECT * FROM pos_account_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_detail SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
      END IF ;
 START TRANSACTION;
    INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'A1','总开单',0,
		IFNULL(COUNT(e.accnt),0) ,
		IFNULL(SUM(e.charge),0),
		IFNULL(SUM(e.credit),0),
		IFNULL(SUM(e.bal),0),0,0,'ADMIN',NOW(),'ADMIN',NOW()
		FROM 
    tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND d.pccode = b.code AND d.number = 1
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
    INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'A2','已结账',0,
		IFNULL(COUNT(e.accnt),0) ,
		IFNULL(SUM(e.charge),0),
		IFNULL(SUM(e.credit),0),
		IFNULL(SUM(e.bal),0),0,0,'ADMIN',NOW(),'ADMIN',NOW()
		FROM 
    tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND d.pccode = b.code  AND e.sta = 'O' AND d.number = 1
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
    
     
    INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'A3','未结账',0,
		IFNULL(COUNT(e.accnt),0) ,
		IFNULL(SUM(e.charge),0),
		IFNULL(SUM(e.credit),0),
		IFNULL(SUM(e.bal),0),0,0,'ADMIN',NOW(),'ADMIN',NOW()
		FROM 
    tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND d.pccode = b.code  AND e.sta IN ('I','C')  AND  d.number = 1
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
 INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'A4','挂账',0,
		IFNULL(COUNT(e.accnt),0) ,
		IFNULL(SUM(e.charge),0),
		IFNULL(SUM(e.credit),0),
		IFNULL(SUM(e.bal),0),0,0,'ADMIN',NOW(),'ADMIN',NOW()
		FROM 
    tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND d.pccode = b.code  AND e.sta = 'S'  AND  d.number = 1
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
    INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'A5','删除',0,
		IFNULL(COUNT(e.accnt),0) ,
		IFNULL(SUM(e.charge),0),
		IFNULL(SUM(e.credit),0),
		IFNULL(SUM(e.bal),0),0,0,'ADMIN',NOW(),'ADMIN',NOW()
		FROM
    tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND d.pccode = b.code  AND e.sta = 'X' AND d.number = 1
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
    INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'B1','就餐人数',
    IFNULL(SUM(e.gsts),0),0,0,0,
		IFNULL(SUM(e.gsts),0),0,0,'ADMIN',NOW(),'ADMIN',NOW() 
		FROM
    tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND d.pccode = b.code  AND e.sta <> 'X' AND  d.number = 1 -- AND e.sta <> 'S' 
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
  
    INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',e.modify_user,e.shift,a.pccode,f.descript,b.code,b.descript,
			IFNULL(SUM(d.amount),0),
			IFNULL(SUM(d.srv),0),
			IFNULL(SUM(d.tax),0),
			IFNULL(SUM(d.dsc),0),
			IFNULL(SUM(d.amount + d.srv + d.tax - d.dsc) ,0),
      IFNULL(SUM(d.amount1),0),
      IFNULL(SUM(d.amount2),0),'ADMIN',NOW(),'ADMIN',NOW()
			FROM 
      tmp_pos_account a,tmp_code_base b ,tmp_pos_detail d,tmp_pos_master e,tmp_pos_pccode f
			WHERE a.accnt = d.accnt  AND b.code = d.tocode 
          AND d.type = '1'  -- 表示都是菜品，否则是单菜的做法或者是退菜      
				  AND a.sta = 'O' AND d.sta = 'I' AND a.accnt = e.accnt AND e.sta = 'O' 
          AND a.pccode = f.code AND a.number = 1
			GROUP BY e.modify_user,e.shift,a.pccode,f.descript,b.code,b.descript 
      ORDER BY a.pccode,b.code ;
 
/*    INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',e.modify_user,e.shift,e.pccode,f.descript,'098','零头',
			IFNULL(SUM(a.amount),0),
			0,
			0,
			0,
			IFNULL(SUM(a.amount),0),0,0,'ADMIN',NOW(),'ADMIN',NOW() 
			FROM 
      tmp_pos_detail a,tmp_pos_master e,tmp_pos_pccode f
			WHERE a.sta = 'I'  AND a.code = 'ML' AND a.accnt = e.accnt AND e.sta = 'O' AND e.pccode = f.code 
			GROUP BY e.modify_user,e.shift,e.pccode,f.descript 
      ORDER BY e.pccode ;
*/
    INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',e.modify_user,e.shift,a.pccode,f.descript,'099','未定义',
			IFNULL(SUM(d.amount),0),
			IFNULL(SUM(d.srv),0),
			IFNULL(SUM(d.tax),0),
			IFNULL(SUM(d.dsc),0),
			IFNULL(SUM(d.amount + d.srv + d.tax - d.dsc) ,0),
      IFNULL(SUM(d.amount1),0),
      IFNULL(SUM(d.amount2),0),'ADMIN',NOW(),'ADMIN',NOW()
		 FROM 
     tmp_pos_account a,tmp_pos_detail d,tmp_pos_master e,tmp_pos_pccode f
		 WHERE a.accnt = d.accnt  AND d.tocode='' 
          AND d.type = '1' 
				  AND a.sta = 'O' AND d.sta = 'I' AND a.accnt = e.accnt AND e.sta = 'O' 
          AND a.pccode = f.code AND a.number = 1
		  	GROUP BY e.modify_user,e.shift,a.pccode,f.descript 
        ORDER BY a.pccode ;
    INSERT pos_audit_master (hotel_group_id,hotel_id,biz_date,TYPE,accnt,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		  SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',e.accnt,e.modify_user,e.shift,a.pccode,f.descript,b.code,b.descript,
			IFNULL(SUM(d.amount),0),
			IFNULL(SUM(d.srv),0),
			IFNULL(SUM(d.tax),0),
			IFNULL(SUM(d.dsc),0),
			IFNULL(SUM(d.amount + d.srv + d.tax - d.dsc) ,0),
      IFNULL(SUM(d.amount1),0),
      IFNULL(SUM(d.amount2),0),'ADMIN',NOW(),'ADMIN',NOW()
			FROM 
      tmp_pos_account a,tmp_code_base b ,tmp_pos_detail d,tmp_pos_master e,tmp_pos_pccode f
			WHERE a.accnt = d.accnt AND b.code = d.tocode 
          AND d.type = '1'  -- 表示都是菜品，否则是单菜的做法或者是退菜      
				  AND a.sta = 'O' AND d.sta = 'I' AND a.accnt = e.accnt AND e.sta = 'O' 
          AND a.pccode = f.code AND a.number = 1
			GROUP BY e.accnt,e.modify_user,e.shift,a.pccode,f.descript,b.code,b.descript 
      ORDER BY a.pccode,b.code ;
    INSERT pos_audit_master (hotel_group_id,hotel_id,biz_date,TYPE,accnt,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',e.accnt,e.modify_user,e.shift,a.pccode,f.descript,'099','未定义',
    	IFNULL(SUM(d.amount),0),
			IFNULL(SUM(d.srv),0),
			IFNULL(SUM(d.tax),0),
			IFNULL(SUM(d.dsc),0),
			IFNULL(SUM(d.amount + d.srv + d.tax - d.dsc) ,0),
      IFNULL(SUM(d.amount1),0),
      IFNULL(SUM(d.amount2),0),'ADMIN',NOW(),'ADMIN',NOW()
		 FROM 
     tmp_pos_account a,tmp_pos_detail d,tmp_pos_master e,tmp_pos_pccode f
		 WHERE a.accnt = d.accnt  AND d.tocode='' 
          AND d.type = '1' 
				  AND a.sta = 'O' AND d.sta = 'I' AND a.accnt = e.accnt AND e.sta = 'O' 
          AND a.pccode = f.code AND a.number = 1
		  	GROUP BY e.accnt,e.modify_user,e.shift,a.pccode,f.descript 
        ORDER BY a.pccode ;
 INSERT pos_audit_report  (hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'2',d.modify_user,d.shift,c.pccode,e.descript,c.paycode,c.descript,
		IFNULL(SUM(0),0),
		IFNULL(SUM(0),0),
		IFNULL(SUM(0),0),
		IFNULL(SUM(0),0),
		IFNULL(SUM(c.credit) ,0),0,0,'ADMIN',NOW(),'ADMIN',NOW()
		 FROM
       tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e
			WHERE c.accnt = d.accnt AND d.sta = 'O'  
      AND (c.sta = 'O' OR c.sta = 'R' ) AND c.number = 2 -- a的营业点  c的付款方式  C可能有预付金
      AND c.pccode = e.code
		  GROUP BY d.modify_user,d.shift,c.pccode,e.descript,c.paycode,c.descript 
      ORDER BY c.pccode,c.paycode ;
 INSERT pos_audit_master (hotel_group_id,hotel_id,biz_date,TYPE,accnt,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'2',d.accnt,d.modify_user,d.shift,c.pccode,e.descript,c.paycode,c.descript,
		0,
		0,
		0,
		0,
		IFNULL(SUM(c.credit) ,0),0,0,'ADMIN',NOW(),'ADMIN',NOW()
		 FROM
     tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e
			WHERE c.accnt = d.accnt AND d.sta = 'O' 
      AND   (c.sta = 'O' OR c.sta = 'R' )  AND  c.number = '2'
      AND c.pccode = e.code
		  GROUP BY  d.accnt,d.modify_user,d.shift,c.pccode,e.descript,c.paycode,c.descript 
      ORDER BY c.pccode,c.paycode ;
 
	-- DROP TEMPORARY TABLE IF EXISTS tmp_pos_audit_report ;
	-- 	 CREATE TEMPORARY TABLE tmp_pos_audit_report SELECT * FROM pos_audit_report WHERE 1=2  ;
	-- 	 INSERT INTO tmp_pos_audit_report SELECT * FROM  pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
SET var_sql = CONCAT("
insert pos_audit_report  (hotel_group_id,hotel_id,biz_date,type,userCode,shift,pccode,name,code,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
		select hotel_group_id,hotel_id,biz_date,type,userCode,shift,'all','所有营业点',code,descript,
		IFNULL(sum(amount0),0),
		IFNULL(sum(amount1),0),
		IFNULL(sum(amount2),0),
		IFNULL(sum(amount3),0),
		IFNULL(sum(amount),0),IFNULL(sum(ent_ft),0),IFNULL(sum(dsc_ft),0),'ADMIN',NOW(),'ADMIN',NOW()
		from pos_audit_report where hotel_group_id = ",arg_hotel_group_id," AND hotel_id =  ",arg_hotel_id," and biz_date = '",arg_biz_date,"'  AND pccode <> 'all'  group by hotel_group_id,hotel_id,biz_date,type,userCode,shift,`code`,descript	;
");
    	SET @exec_sql = var_sql;  
   	 PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
SET var_sql = CONCAT("
insert pos_audit_report  (hotel_group_id,hotel_id,biz_date,type,userCode,shift,pccode,name,code,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		select hotel_group_id,hotel_id,biz_date,type,'{{{',shift,pccode,name,code,descript,
		IFNULL(sum(amount0),0),
		IFNULL(sum(amount1),0),
		IFNULL(sum(amount2),0),
		IFNULL(sum(amount3),0),
		IFNULL(sum(amount),0),IFNULL(sum(ent_ft),0),IFNULL(sum(dsc_ft),0),'ADMIN',NOW(),'ADMIN',NOW()
		from pos_audit_report where hotel_group_id = ",arg_hotel_group_id," AND hotel_id =  ",arg_hotel_id," and biz_date = '",arg_biz_date,"' AND userCode <> '{{{'  group by hotel_group_id,hotel_id,biz_date,type,shift,pccode,name,code,descript	;
");
    	SET @exec_sql = var_sql;  
   	 PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
SET var_sql = CONCAT("
insert pos_audit_report  (hotel_group_id,hotel_id,biz_date,type,userCode,shift,pccode,name,code,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
		select hotel_group_id,hotel_id,biz_date,type,userCode,'9',pccode,name,code,descript,
		IFNULL(sum(amount0),0),
		IFNULL(sum(amount1),0),
		IFNULL(sum(amount2),0),
		IFNULL(sum(amount3),0),
		IFNULL(sum(amount),0),IFNULL(sum(ent_ft),0),IFNULL(sum(dsc_ft),0),'ADMIN',NOW(),'ADMIN',NOW()
		from pos_audit_report where  hotel_group_id = ",arg_hotel_group_id," AND hotel_id =  ",arg_hotel_id," and biz_date = '",arg_biz_date,"'  AND shift <> '9' group by hotel_group_id,hotel_id,biz_date,type,userCode,pccode,name,code,descript	;
");
    	SET @exec_sql = var_sql;  
   	 PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
 IF t_error = 1 THEN  
           ROLLBACK;  
           SET var_ret = '-1' ; 
         
       ELSE  
           COMMIT; 
           SET var_ret = '1' ; 
       END IF;  
 
	BEGIN		
		LEAVE label_0;
	END; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_audit_jour_report`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_audit_jour_report`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_audit_jour_report`(IN arg_hotel_group_id	INT,
	IN arg_hotel_id INT,IN arg_bizdate			DATETIME, IN arg_type VARCHAR(2))
BEGIN
	DECLARE var_m		VARCHAR(2);
	DECLARE var_byear		VARCHAR(4);
	DECLARE var_hotel_code		VARCHAR(20);
  DECLARE var_sql VARCHAR(2048) ;
  DECLARE var_descript		VARCHAR(20);
  DECLARE var_fday  DATETIME ;
  DECLARE var_fyday  DATETIME ;
  DECLARE var_yday  DATETIME ;
  DECLARE var_ymonth DATETIME ;
  -- 去年当天
  SET var_yday = DATE_ADD(arg_bizdate,INTERVAL -1 YEAR);
  -- 本月第一天
  SET var_fday = DATE_ADD(arg_bizdate,INTERVAL -DAY(arg_bizdate)+1 DAY);
 -- 本年第一天
  SET var_fyday = DATE_SUB(arg_bizdate,INTERVAL DAYOFYEAR(arg_bizdate)-1 DAY);
   DROP TEMPORARY TABLE IF EXISTS tmp_code_base ;
   CREATE TEMPORARY TABLE tmp_code_base SELECT * FROM  code_base  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND parent_code = 'pos_rep_item';
   SET var_byear = DATE_FORMAT(arg_bizdate,'%Y');
   SET var_m = DATE_FORMAT(arg_bizdate,'%c');
DROP TEMPORARY TABLE IF EXISTS tmp_jour ;
	CREATE TEMPORARY TABLE  tmp_jour
	( 
    `hotel_group_id` BIGINT(16) NOT NULL,
    `hotel_id` BIGINT(16) NOT NULL,
    `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
    `hotel` VARCHAR(60) NOT NULL DEFAULT '',
	  `code` VARCHAR(20) NOT NULL,
    `descript` VARCHAR(60) NOT NULL DEFAULT '',
    `item` VARCHAR(60) NOT NULL DEFAULT '',
    `shift` VARCHAR(2) NOT NULL,
	  `day01` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    `day02` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    `day03` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    `day04` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    `day05` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    `day06` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    `daytl` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    
	  `m01` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    `m02` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    `m03` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    `m04` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    `m05` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    `m06` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    `mtl` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    `type` VARCHAR(2) NOT NULL,
    PRIMARY KEY (`id`)
	) ;
IF arg_type='G' THEN
    -- 指标
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`day01`,`daytl`,`type`)
    SELECT hotel_group_id,hotel_id,`code`,descript,shift,amount1,amount2,TYPE 
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id
                               AND userCode = '{{{' AND pccode = 'all' AND shift = '9' AND TYPE = '0' AND CODE<>'B1' AND biz_date = arg_bizdate  ;
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`day01`,`daytl`,`type`)
    SELECT hotel_group_id,hotel_id,`code`,descript,shift,amount0,amount,TYPE 
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id
                               AND userCode = '{{{' AND pccode = 'all' AND shift = '9' AND TYPE = '0' AND CODE = 'B1' AND biz_date = arg_bizdate  ;
    -- 付款
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`daytl`,`type`)
    SELECT hotel_group_id,hotel_id,'pay','付款合计:',shift,SUM(amount),TYPE 
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id
                                AND userCode = '{{{' AND pccode = 'all' AND shift = '9' AND TYPE = '2' AND biz_date = arg_bizdate GROUP BY hotel_group_id,hotel_id,shift,TYPE;
    -- 指标
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`m01`,`mtl`,`type`)
    SELECT hotel_group_id,hotel_id,`code`,descript,shift,amount1,amount2,TYPE
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id 
                               AND userCode = '{{{' AND pccode = 'all' AND shift = '9' AND TYPE = '0' AND CODE<>'B1' AND biz_date >= var_fday AND biz_date <= arg_bizdate ;
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`m01`,`mtl`,`type`)
    SELECT hotel_group_id,hotel_id,`code`,descript,shift,amount0,amount,TYPE 
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id
                               AND userCode = '{{{' AND pccode = 'all' AND shift = '9' AND TYPE = '0' AND CODE = 'B1' AND biz_date = arg_bizdate  ;
    -- 付款
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`mtl`,`type`)
    SELECT hotel_group_id,hotel_id,'pay','付款合计:',shift,SUM(amount),TYPE 
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id
                                AND userCode = '{{{' AND pccode = 'all' AND shift = '9' AND TYPE = '2' AND biz_date >= var_fday AND biz_date <= arg_bizdate GROUP BY hotel_group_id,hotel_id,shift,TYPE;
    UPDATE tmp_jour a,hotel b SET a.hotel = b.descript_short  WHERE a.hotel_id = b.id ;
    UPDATE tmp_jour SET descript = CONCAT('   ',descript) WHERE TYPE='0' AND CODE<>'A1'; 
    
   -- SELECT * FROM tmp_jour;
    SELECT hotel,descript,SUM(day01) AS day1,SUM(daytl) AS daytl,SUM(m01) AS m1 ,SUM(mtl) AS mtl 
	 	FROM tmp_jour  GROUP BY hotel,CODE,descript
	 	ORDER BY hotel_id,TYPE,CODE,shift;
ELSE
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`day01`,`type`)
    SELECT hotel_group_id,hotel_id,pccode,NAME,shift,amount-amount1,'1' 
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_bizdate AND TYPE='1' 
    AND CODE IN (SELECT CODE FROM tmp_code_base WHERE flag='1') AND userCode='{{{' ;-- AND pccode<>'all';
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`day02`,`type`)
    SELECT hotel_group_id,hotel_id,pccode,NAME,shift,amount-amount1,'1'
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_bizdate AND TYPE='1' 
    AND CODE IN (SELECT CODE FROM tmp_code_base WHERE flag='2') AND userCode='{{{' ;-- AND pccode<>'all';
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`day03`,`type`)
    SELECT hotel_group_id,hotel_id,pccode,NAME,shift,amount-amount1,'1' 
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_bizdate AND TYPE='1' 
    AND CODE IN (SELECT CODE FROM tmp_code_base WHERE flag='3') AND userCode='{{{' ;-- AND pccode<>'all';
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`day04`,`type`)
    SELECT hotel_group_id,hotel_id,pccode,NAME,shift,amount-amount1,'1' 
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_bizdate AND TYPE='1' 
    AND CODE IN (SELECT CODE FROM tmp_code_base WHERE flag='4') AND userCode='{{{' ;-- AND pccode<>'all';
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`day05`,`type`)
    SELECT hotel_group_id,hotel_id,pccode,NAME,shift,amount-amount1,'1' 
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_bizdate AND TYPE='1' 
    AND CODE IN (SELECT CODE FROM tmp_code_base WHERE flag='8') AND userCode='{{{' ;-- AND pccode<>'all';
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`day06`,`type`)
    SELECT hotel_group_id,hotel_id,pccode,NAME,shift,amount-amount1,'1' 
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_bizdate AND TYPE='1' 
    AND CODE IN (SELECT CODE FROM tmp_code_base WHERE flag NOT IN ('1','2','3','4','8')) AND userCode='{{{' AND pccode<>'all';
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`m01`,`type`)
    SELECT hotel_group_id,hotel_id,pccode,NAME,shift,SUM(amount-amount1),'1' 
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date >= var_fday AND biz_date <= arg_bizdate AND TYPE='1' 
    AND CODE IN (SELECT CODE FROM tmp_code_base WHERE flag='1') AND userCode='{{{' -- AND pccode<>'all'
    GROUP BY hotel_group_id,hotel_id,pccode,NAME,shift;
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`m02`,`type`)
    SELECT hotel_group_id,hotel_id,pccode,NAME,shift,SUM(amount-amount1),'1'  
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id   AND biz_date >= var_fday AND biz_date <= arg_bizdate AND TYPE='1' 
    AND CODE IN (SELECT CODE FROM tmp_code_base WHERE flag='2') AND userCode='{{{' -- AND pccode<>'all'
    GROUP BY hotel_group_id,hotel_id,pccode,NAME,shift;
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`m03`,`type`)
    SELECT hotel_group_id,hotel_id,pccode,NAME,shift,SUM(amount-amount1),'1'  
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id   AND biz_date >= var_fday AND biz_date <= arg_bizdate AND TYPE='1' 
    AND CODE IN (SELECT CODE FROM tmp_code_base WHERE flag='3') AND userCode='{{{' -- AND pccode<>'all'
    GROUP BY hotel_group_id,hotel_id,pccode,NAME,shift;
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`m04`,`type`)
    SELECT hotel_group_id,hotel_id,pccode,NAME,shift,SUM(amount-amount1),'1'  
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id   AND biz_date >= var_fday AND biz_date <= arg_bizdate AND TYPE='1' 
    AND CODE IN (SELECT CODE FROM tmp_code_base WHERE flag='4') AND userCode='{{{' -- AND pccode<>'all'
    GROUP BY hotel_group_id,hotel_id,pccode,NAME,shift;
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`m05`,`type`)
    SELECT hotel_group_id,hotel_id,pccode,NAME,shift,SUM(amount-amount1),'1'  
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id   AND biz_date >= var_fday AND biz_date <= arg_bizdate AND TYPE='1' 
    AND CODE IN (SELECT CODE FROM tmp_code_base WHERE flag='8') AND userCode='{{{' -- AND pccode<>'all'
    GROUP BY hotel_group_id,hotel_id,pccode,NAME,shift;
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`shift`,`m06`,`type`)
    SELECT hotel_group_id,hotel_id,pccode,NAME,shift,SUM(amount-amount1),'1'  
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id   AND biz_date >= var_fday AND biz_date <= arg_bizdate AND TYPE='1' 
    AND CODE IN (SELECT CODE FROM tmp_code_base WHERE flag NOT IN ('1','2','3','4','8')) AND userCode='{{{' -- AND pccode<>'all'
    GROUP BY hotel_group_id,hotel_id,pccode,NAME,shift;
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`item`,`shift`,`daytl`,`type`)
    SELECT hotel_group_id,hotel_id,pccode,NAME,descript,shift,amount,'2' 
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_bizdate AND TYPE='2' AND userCode='{{{' ;
    INSERT INTO  tmp_jour( `hotel_group_id`, `hotel_id`,`code`,`descript`,`item`,`shift`,`mtl`,`type`)
    SELECT hotel_group_id,hotel_id,pccode,NAME,descript,shift,amount,'2' 
    FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date >= var_fday AND biz_date <= arg_bizdate AND TYPE='2' AND userCode='{{{' ;
UPDATE tmp_jour a,hotel b SET a.hotel = b.descript  WHERE a.hotel_id = b.id ;
UPDATE tmp_jour SET daytl = day01+day02+day03+day04+day05+day06,mtl = m01+m02+m03+m04+m05+m06 WHERE TYPE='1';
UPDATE tmp_jour SET descript = CONCAT('<',descript,'> 消费小计:') WHERE shift='9' AND CODE<>'all' AND  TYPE = '1';
UPDATE tmp_jour SET descript = CONCAT('<',descript,'> 消费合计:') WHERE shift='9' AND CODE = 'all' AND  TYPE = '1';
UPDATE tmp_jour SET descript = CONCAT('<',descript,'> 收款小计:') WHERE shift='9' AND CODE<>'all' AND  TYPE = '2';
UPDATE tmp_jour SET descript = CONCAT('<',descript,'> 收款合计:') WHERE shift='9' AND CODE = 'all' AND  TYPE = '2';
UPDATE tmp_jour SET shift = '全天' WHERE shift='9' ;
		SELECT  descript,item,shift,SUM(day01) AS day1,SUM(day02) AS day2 ,SUM(day03) AS day3 ,SUM(day04) AS day4 ,SUM(day05) AS day5 ,SUM(day06) AS day6 ,SUM(daytl) AS daytl
        ,SUM(m01) AS m1 ,SUM(m02) AS m2 ,SUM(m03) AS m3 ,SUM(m04) AS m4 ,SUM(m05) AS m5 ,SUM(m06) AS m6 ,SUM(mtl) AS mtl 
		FROM tmp_jour WHERE hotel_group_id = arg_hotel_group_id	 AND hotel_id = arg_hotel_id  
    GROUP BY  CODE,descript,item,shift 
		ORDER BY TYPE,CODE,shift;
END IF;  
                            
 END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_audit_not_balance_check`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_audit_not_balance_check`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_audit_not_balance_check`(
	IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
	IN arg_biz_date		DATETIME
	)
    SQL SECURITY INVOKER
BEGIN
	-- 底表不平检查过程
	   DECLARE var_pms_date		DATETIME;
	   DECLARE var_pos_date	  	DATETIME;
	   DECLARE var_bizdate 		DATETIME;
	   DECLARE var_maxinum 		INTEGER;
	   DECLARE var_count 		INTEGER;
	   DECLARE var_dsc 		DECIMAL(12,2);
	   DECLARE i 			INT DEFAULT 0;
	   DECLARE j 			INT DEFAULT 0;
	   DECLARE var_sql		VARCHAR(1024);
	   DECLARE var_apportion_ret 	INTEGER DEFAULT 0; 
	   DECLARE t_error 		INTEGER DEFAULT 0; 
	   DECLARE var_ret		INT;
	   DECLARE var_msg		VARCHAR(60) ;
	   DECLARE var_balance	 	DECIMAL(10,0);
	   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1; 
label:BEGIN
--	   SET var_ret = 1, var_msg = '数据重建完成,请进入PMS系统重建报表';
--	   set arg_biz_date = arg_biz_date;
	   DROP TEMPORARY TABLE IF EXISTS tmp_pos_balance_check;
	   CREATE TEMPORARY TABLE tmp_pos_balance_check(
		id 			INT AUTO_INCREMENT PRIMARY KEY,
		accnt 			VARCHAR(20)  	  DEFAULT '@@@',
		charge 			DECIMAL(10,2)     DEFAULT 0,
		credit 			DECIMAL(10,2) 	  DEFAULT 0,
		remark 			VARCHAR(200) 	  DEFAULT '',
		balance	 		DECIMAL(10,2) 	  DEFAULT 0,
		result			VARCHAR(20)       DEFAULT ''
	   );
	   SELECT set_value INTO var_pms_date FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'biz_date'; 
	   SELECT set_value INTO var_pos_date FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date'; 
	
START TRANSACTION; 
	
	   IF arg_biz_date < var_pos_date THEN
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT '',0,0,'********一、pos_master_history,pos_detail_history,pos_account_history三张基础表判断********',0,'';
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT a.accnt,IFNULL(a.charge,0),IFNULL(b.credit,0),CONCAT('单号:',a.accnt,'可能有问题,看是否有联单号,联单号:',IFNULL(a.pcrec,'')),IFNULL(a.charge,0)-IFNULL(b.credit,0),IF(IFNULL(a.pcrec,'') = '','ERROR','MAY ERROR') FROM
				(SELECT a.accnt,a.pcrec,IFNULL(SUM(b.amount+b.srv-b.dsc),0) AS charge FROM pos_master_history a,pos_detail_history b WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt AND a.biz_date = arg_biz_date AND a.sta ='O' GROUP BY accnt,pcrec) a LEFT JOIN
				(SELECT a.accnt,a.pcrec,IFNULL(SUM(IFNULL(b.credit,0)),0) AS credit FROM pos_master_history a,pos_account_history b WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id  AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt AND a.biz_date = arg_biz_date AND a.sta ='O' AND b.sta <> 'X' AND b.number = 2 GROUP BY accnt,pcrec) b
				ON a.accnt = b.accnt WHERE IFNULL(a.charge,0) <> IFNULL(b.credit,0) ORDER BY a.pcrec,a.accnt;
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT b.accnt,IFNULL(a.charge,0),IFNULL(b.credit,0),CONCAT('单号:',b.accnt,'可能有问题,看是否有联单号,联单号:',IFNULL(a.pcrec,'')),IFNULL(a.charge,0)-IFNULL(b.credit,0),IF(IFNULL(a.pcrec,'') = '','ERROR','MAY ERROR') FROM
				(SELECT a.accnt,a.pcrec,IFNULL(SUM(b.amount+b.srv-b.dsc),0) AS charge FROM pos_master_history a,pos_detail_history b WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt AND a.biz_date = arg_biz_date AND a.sta ='O' GROUP BY accnt,pcrec) a RIGHT JOIN
				(SELECT a.accnt,a.pcrec,IFNULL(SUM(IFNULL(b.credit,0)),0) AS credit FROM pos_master_history a,pos_account_history b WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id  AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt AND a.biz_date = arg_biz_date AND a.sta ='O' AND b.sta <> 'X' AND b.number = 2 GROUP BY accnt,pcrec) b
				ON a.accnt = b.accnt WHERE IFNULL(a.charge,0) <> IFNULL(b.credit,0) ;-- AND accnt NOT IN (SELECT accnt FROM tmp_pos_balance_check) ORDER BY a.pcrec,a.accnt;
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT '',0,0,'--------------------END------------------------',0,'';
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT '',0,0,'********二、检查pos_audit_master中type="1"和"2"的是否一致********',0,'';
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT '',IFNULL(a.charge,0),IFNULL(b.credit,0),IF(IFNULL(a.charge,0)<>IFNULL(b.credit,0),'pos_audit_master借贷不平','pos_audit_master借贷相抵'),IFNULL(a.charge,0)-IFNULL(b.credit,0),IF(IFNULL(a.charge,0)<>IFNULL(b.credit,0),'ERROR','RIGHT') FROM 
				(SELECT IFNULL(SUM(amount-amount1),0) AS charge FROM pos_audit_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND TYPE = '1') a,
				(SELECT IFNULL(SUM(amount),0) AS credit FROM pos_audit_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND TYPE = '2') b;
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT '',0,0,'--------------------END------------------------',0,'';		
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT '',0,0,'********三、检查pos_audit_master中type="1"和"2"中不平的单子********',0,'';
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT a.accnt,IFNULL(a.charge,0),IFNULL(b.credit,0),IF(IFNULL(a.charge,0)<>IFNULL(b.credit,0),'pos_audit_master借贷不平','pos_audit_master借贷相抵'),IFNULL(a.charge,0)-IFNULL(b.credit,0),IF(IFNULL(a.charge,0)<>IFNULL(b.credit,0),'ERROR','RIGHT') FROM 
				(SELECT accnt,IFNULL(SUM(amount-amount1),0) AS charge FROM pos_audit_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND TYPE = '1' GROUP BY accnt) a LEFT JOIN
				(SELECT accnt,IFNULL(SUM(amount),0) AS credit FROM pos_audit_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND TYPE = '2' GROUP BY accnt) b
				ON a.accnt = b.accnt WHERE IFNULL(a.charge,0) - IFNULL(b.credit,0) <> 0;
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT b.accnt,IFNULL(a.charge,0),IFNULL(b.credit,0),IF(IFNULL(a.charge,0)<>IFNULL(b.credit,0),'pos_audit_master借贷不平','pos_audit_master借贷相抵'),IFNULL(a.charge,0)-IFNULL(b.credit,0),IF(IFNULL(a.charge,0)<>IFNULL(b.credit,0),'ERROR','RIGHT') FROM 
				(SELECT accnt,IFNULL(SUM(amount-amount1),0) AS charge FROM pos_audit_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND TYPE = '1' GROUP BY accnt) a RIGHT JOIN
				(SELECT accnt,IFNULL(SUM(amount),0) AS credit FROM pos_audit_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND TYPE = '2' GROUP BY accnt) b
				ON a.accnt = b.accnt WHERE IFNULL(b.credit,0) - IFNULL(a.charge,0) <> 0 ;-- AND b.accnt NOT IN(SELECT accnt FROM tmp_pos_balance_check);
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT '',0,0,'--------------------END------------------------',0,'';	
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT '',0,0,'********四、检查pos_deptjie和pos_deptdai是否相平********',0,'';
			
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)		
			SELECT '',IFNULL(a.charge,0),IFNULL(b.credit,0),IF(IFNULL(a.charge,0)<>IFNULL(b.credit,0),'pos_deptjie与pos_deptdai借贷不平','pos_deptjie与pos_deptdai借贷相抵'),IFNULL(a.charge,0)-IFNULL(b.credit,0),IF(IFNULL(a.charge,0)<>IFNULL(b.credit,0),'ERROR','RIGHT') FROM
				(SELECT IFNULL(SUM(amount_day),0) AS charge FROM pos_deptjie WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id) a,
				(SELECT IFNULL(SUM(amount_day),0) AS credit FROM pos_deptdai WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id) b;
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT '',0,0,'--------------------END------------------------',0,'';
			
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT '',0,0,'********五、检查转前台或AR,但是基础表中没有********',0,'';	
			
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)				
			SELECT SUBSTRING(ta_no,5),charge,0,CONCAT('单号:',SUBSTRING(ta_no,5),'在三张基础表中至少有一张没有记录'),charge,'ERROR' FROM account_audit WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND ta_no LIKE '[餐饮]P%' AND 
				SUBSTRING(ta_no,5) NOT IN (SELECT a.accnt FROM pos_master_history a,pos_account_history b WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.sta = 'O' AND a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt AND b.sta = 'O' AND b.number = 2);							   
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT '',0,0,'--------------------END------------------------',0,'';
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT '',0,0,'********六、检查会员卡结账,但是基础表中没有********',0,'';				
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)				
			SELECT source_accnt,charge,0,CONCAT('单号:',source_accnt,'在三张基础表中至少有一张没有记录'),charge,'ERROR' FROM card_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND source_accnt LIKE 'P%' AND 
				source_accnt NOT IN (SELECT a.accnt FROM pos_master_history a,pos_account_history b WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.sta = 'O' AND a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt AND b.sta = 'O' AND b.number = 2);							   
		INSERT tmp_pos_balance_check(accnt,charge,credit,remark,balance,result)
			SELECT '',0,0,'--------------------END------------------------',0,'';
		
	   END IF;
END label; 
	   SELECT * FROM tmp_pos_balance_check;	
	   DROP TEMPORARY TABLE IF EXISTS tmp_pos_balance_check;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_audit_portal_apportion`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_audit_portal_apportion`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_audit_portal_apportion`(IN arg_hotel_group_id	INT,
	IN arg_hotel_id			INT,
	IN arg_biz_date			DATETIME,
	OUT arg_ret				INT)
    SQL SECURITY INVOKER
label_0:
BEGIN
	
  
	DECLARE var_bizdate DATETIME ;
	DECLARE var_billno VARCHAR(20) ;
	DECLARE var_amount DECIMAL(12,2);
	DECLARE var_apportion DECIMAL(12,2);
	DECLARE var_apportion_ce DECIMAL(12,2);
	DECLARE var_id BIGINT  DEFAULT 0;
	DECLARE i INT DEFAULT 0;
	DECLARE j INT DEFAULT 0;
	DECLARE t_error INTEGER DEFAULT 0;  
	DECLARE done_cursor INT DEFAULT 0 ;
	DECLARE var_cursor CURSOR FOR SELECT billno,amount FROM tmp_account_apportion;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error = 1;
	SET arg_ret = 1 ;
 	SET @procresult = 0 ;
   
	SELECT set_value INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
	DROP TEMPORARY TABLE IF EXISTS tmp_account_apportion;
	CREATE TEMPORARY TABLE tmp_account_apportion (
		`id` BIGINT(16) NOT NULL AUTO_INCREMENT,
		`billno` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '单号',
		`amount` DECIMAL(12,2) DEFAULT '0.00',
		PRIMARY KEY (`id`)		
	);
	SELECT TO_DAYS(arg_biz_date)-TO_DAYS(var_bizdate) INTO i;
	IF i=0 THEN
		INSERT INTO tmp_account_apportion(billno,amount) 
		SELECT a.billno,SUM(a.credit)
			FROM pos_account a LEFT JOIN code_transaction b ON  a.hotel_group_id=b.hotel_group_id AND  a.hotel_id = b.hotel_id AND a.paycode = b.code
				WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id 
                                                      AND a.sta = 'O' AND (b.cat_posting = 'ENT' OR b.cat_posting='DSC')
				GROUP BY a.billno;        
	ELSE
		INSERT INTO tmp_account_apportion(billno,amount) 
		SELECT a.billno,SUM(a.credit)
			FROM pos_account_history a LEFT JOIN code_transaction b ON  a.hotel_group_id=b.hotel_group_id AND  a.hotel_id = b.hotel_id AND a.paycode = b.code
				WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = arg_biz_date AND a.sta = 'O' AND (b.cat_posting = 'ENT' OR b.cat_posting='DSC') 
				GROUP BY a.billno;
	END IF ;
   
	IF(i=0) THEN
		OPEN var_cursor;
		SET done_cursor = 0;
		SET j=0 ;
		FETCH var_cursor INTO var_billno,var_amount;
		WHILE done_cursor<>1 DO  
			SET j=j+1;
			SELECT ROUND(var_amount/(SUM(amount)-SUM(dsc)+SUM(srv)),2) INTO var_apportion  FROM  pos_detail             
				WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id 
                                                      AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'  AND  SUBSTRING(flag1,5,1) <> '1'  AND  SUBSTRING(flag1,1,1) <> '1';
           
                         UPDATE  pos_detail  SET amount1=ROUND((amount-dsc)*var_apportion),amount3 = ROUND(srv*var_apportion) 
				WHERE   hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date  AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'  AND  SUBSTRING(flag1,5,1) <> '1' AND  SUBSTRING(flag1,1,1) <> '1';
          
            		 SELECT var_amount-(SUM(amount1)+SUM(amount2)+SUM(amount3)) INTO var_apportion_ce FROM pos_detail 
				WHERE   hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date  AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'  AND  SUBSTRING(flag1,5,1) <> '1' AND  SUBSTRING(flag1,1,1) <> '1';
             
		IF var_apportion_ce <> 0 THEN             
			SELECT id INTO var_id FROM pos_detail  WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date  AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'   AND  SUBSTRING(flag1,5,1) <> '1' AND  SUBSTRING(flag1,1,1) <> '1' ORDER BY id DESC LIMIT 1 ;
			UPDATE  pos_detail  SET amount1 = amount1 + var_apportion_ce WHERE id = var_id ;
		END IF;
               
		FETCH var_cursor INTO var_billno,var_amount;
		END WHILE; 
		CLOSE var_cursor;    
	ELSE 
		OPEN var_cursor;
		SET done_cursor = 0;
		SET j=0 ;
		FETCH var_cursor INTO var_billno,var_amount;
		WHILE done_cursor<>1 DO  
			SET j=j+1;		
			SELECT ROUND(var_amount/(SUM(amount)-SUM(dsc)+SUM(srv)),2) INTO var_apportion  FROM  pos_detail_history             
				WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date  AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'  AND  SUBSTRING(flag1,5,1) <> '1'  AND  SUBSTRING(flag1,1,1) <> '1';
                       
			UPDATE  pos_detail_history  SET amount1=ROUND((amount-dsc)*var_apportion),amount3 = ROUND(srv*var_apportion)
				WHERE   hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date  AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'  AND  SUBSTRING(flag1,5,1) <> '1' AND  SUBSTRING(flag1,1,1) <> '1';
                 
			SELECT var_amount-(SUM(amount1)+SUM(amount2)+SUM(amount3)) INTO var_apportion_ce  FROM pos_detail_history 
				WHERE   hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date  AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'  AND  SUBSTRING(flag1,5,1) <> '1' AND  SUBSTRING(flag1,1,1) <> '1';
   
			IF var_apportion_ce <> 0 THEN             
				SELECT id INTO var_id FROM pos_detail_history  WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date  AND  billno = var_billno  AND TYPE ='1' AND  sta = 'I'   AND  SUBSTRING(flag1,5,1) <> '1' AND  SUBSTRING(flag1,1,1) <> '1' ORDER BY id DESC LIMIT 1 ;
				UPDATE  pos_detail_history  SET amount1 = amount1 + var_apportion_ce WHERE id = var_id ;
			END IF;
		FETCH var_cursor INTO var_billno,var_amount;
		END WHILE; 
		CLOSE var_cursor;  
	END IF ;
	   
	SELECT TO_DAYS(arg_biz_date)-TO_DAYS(var_bizdate) INTO i;
	IF(i=0) THEN
        
		 UPDATE pos_master a ,      
			( SELECT hotel_group_id,hotel_id,accnt ,SUM(amount1) AS amount1 ,SUM(amount2) AS amount2 ,SUM(amount3) AS amount3  
				FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id GROUP BY hotel_group_id,hotel_id,accnt )  b  
			SET a.amount1 = b.amount1,a.amount2 = b.amount2 ,a.amount3 = b.amount3 
			WHERE a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt 
				AND a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id ;
     
	ELSE    
		UPDATE pos_master_history a ,( SELECT hotel_group_id,hotel_id,accnt ,SUM(amount1) AS amount1 ,SUM(amount2) AS amount2 ,SUM(amount3) AS amount3 
                           FROM  pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date GROUP BY hotel_group_id,hotel_id,accnt )  b  
			SET a.amount1 = b.amount1,a.amount2 = b.amount2 ,a.amount3 = b.amount3 
			WHERE a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt AND a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = arg_biz_date  ;
	END IF ;
 
	IF t_error = 1 THEN  
		SET arg_ret = -1 ;         
	END IF; 
    
	BEGIN
		DROP TEMPORARY TABLE IF EXISTS tmp_account_apportion;
		 
		SET @procresult = 0 ;
		LEAVE label_0 ;
	END ;
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_audit_portal_init`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_audit_portal_init`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_audit_portal_init`(
	IN arg_hotel_group_id		BIGINT(16),	
	IN arg_hotel_id			BIGINT(16),
	OUT arg_ret   			INT,
	OUT arg_msg			VARCHAR(60))
    SQL SECURITY INVOKER
BEGIN
	
	DECLARE var_bizdate 	DATETIME;
	DECLARE var_maxinum 	INTEGER;
	DECLARE var_count 		INTEGER;
	DECLARE var_dsc 		DECIMAL(12,2);
	DECLARE var_is_apportion	VARCHAR(5);
	DECLARE var_respaytill		DECIMAL(10,2);
	DECLARE var_earnestshow		VARCHAR(20);
	DECLARE i 				INT DEFAULT 0;
	DECLARE j 				INT DEFAULT 0;
	DECLARE var_sql		VARCHAR(1024);
	DECLARE var_apportion_ret INTEGER DEFAULT 0; 
	DECLARE t_error 		INTEGER DEFAULT 0;  
  
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1; 
	SET arg_ret = 1, arg_msg = 'OK';
label:BEGIN	 
	DELETE FROM pos_master_back  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	DELETE FROM pos_account_back WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	DELETE FROM pos_detail_back  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	INSERT INTO pos_master_back  SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	INSERT INTO pos_account_back SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	INSERT INTO pos_detail_back  SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	IF t_error = 1 THEN
		SET  arg_ret = -1,arg_msg = "-1,数据备份错误!";
		LEAVE label; 
	END IF;
	SELECT IFNULL(set_value,'F') INTO var_is_apportion FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'pos' AND item = 'apportion_data';
	SELECT IFNULL(set_value,'F') INTO var_earnestshow FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'pos' AND item = 'earnest_show_to_repdai';
	SELECT set_value INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
	SELECT TO_DAYS(NOW())- TO_DAYS(var_bizdate) INTO i;
	IF NOT EXISTS (SELECT 1 FROM pos_pccode_audit_flag WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND is_audit = 'T' AND is_rmposted <> 'T' AND biz_date <= var_bizdate) THEN
		IF i < 0 THEN 
			SET  arg_ret = 1,arg_msg = "0,夜间稽核已做!" ;
			LEAVE label;   
		ELSE
			UPDATE pos_master SET sta = 'S' WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND (sta = 'I' OR sta = 'C') AND biz_date = var_bizdate;
			UPDATE pos_account SET sta = 'S' WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt IN (SELECT accnt FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta = 'S' ) AND sta = 'I' AND number = '1';
			UPDATE pos_account SET sta = 'X' WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt IN (SELECT accnt FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta = 'S' ) AND sta = 'I' AND number = '2';
			UPDATE pos_detail  SET billno = 'S' WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt IN (SELECT accnt FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta = 'S' ) AND sta = 'I' ;
			IF t_error = 1 THEN
				SET  arg_ret = -1,arg_msg = "-1,当前表数据处理出错!";
				LEAVE label; 
			END IF;
			CALL  up_pos_audit_portal_apportion(arg_hotel_group_id,arg_hotel_id,var_bizdate,@a);
			SELECT @a INTO var_apportion_ret ;
			IF(var_apportion_ret = -1)THEN 
				SET t_error = 2;
				SET  arg_ret = -1,arg_msg = "-1,分摊过程出错!";
				LEAVE label; 
			END IF;
			CALL  up_pos_audit_portal_init_report(arg_hotel_group_id,arg_hotel_id,var_bizdate);
			INSERT INTO pos_master_history  SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND sta<>'S'  AND biz_date = var_bizdate;
			INSERT INTO pos_account_history SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id   AND sta<>'S' AND biz_date = var_bizdate AND number = '1';
			INSERT INTO pos_account_history SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id   AND sta<>'I' AND biz_date = var_bizdate AND number = '2';
			INSERT INTO pos_detail_history  SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND IFNULL(billno,'')<>'S' AND biz_date = var_bizdate;
			IF t_error = 1 THEN
				SET  arg_ret = -1,arg_msg = "-1,数据转储出错!";
				LEAVE label; 
			END IF;
			DELETE a FROM pos_dish a,pos_menu b WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = var_bizdate AND a.menu_id = b.id AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND b.biz_date = var_bizdate AND b.menu_no LIKE 'P%';     
			DELETE FROM pos_menu WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = var_bizdate AND menu_no LIKE 'P%';
			IF t_error = 1 THEN
				SET  arg_ret = -1,arg_msg = "-1,posmneu和posdish删除出错!";
				LEAVE label; 
			END IF;
			
			IF var_is_apportion = 'T' THEN
				-- 餐饮传分摊后数据
				INSERT INTO pos_menu (hotel_group_id , hotel_id , biz_date ,pos_station ,pos_code,pos_descript,menu_no, table_no,
						cashier,guest_num,pay_code,pay_descript,rmno,guest_id,guest_name,company_id,company_name,
						ar_account,card_code,card_no,discount_mode,fee,fee_srv,fee_dsc,sales,sales_man,last_ls_no,
						sta,remark,inumber,create_user,create_datetime,modify_user,modify_datetime)
					SELECT a.hotel_group_id,a.hotel_id,a.biz_date,'1',b.code,b.descript,a.accnt,a.tableno,a.shift,a.gsts,a.paycode,'',a.toaccnt,a.haccnt,a.name,
						 a.cusno,a.cusinfo,a.toaccnt,a.cardno,a.cardno,a.mode,(a.charge-a.amount1),a.srvamount,a.dscamount,a.saleid,a.saleinfo,'0',a.sta,a.info,a.id,a.create_user,
						 a.create_datetime,a.modify_user,a.modify_datetime 
					FROM pos_master a INNER JOIN pos_interface_map b ON a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.pccode = b.pos_code AND b.link_type = 'ta_code'
					WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = var_bizdate AND a.sta <> 'S';
				IF t_error = 1 THEN
					SET  arg_ret = -1,arg_msg = "-1,posmneu生成出错!";
					LEAVE label; 
				END IF;			
				
				INSERT INTO pos_dish (hotel_group_id,hotel_id,menu_id,biz_date,pos_station ,CODE,descript,fee, list_order,create_user,create_datetime,modify_user,modify_datetime,cashier,inumber,remark)               
					SELECT f.hotel_group_id,f.hotel_id,0,f.biz_date,c.ta_code,a.code,a.descript,(f.amount-f.amount1-f.ent_ft),'0',f.userCode,
						f.create_datetime,f.userCode,f.modify_datetime,f.shift,'1',f.accnt
						FROM pos_audit_master f
						LEFT JOIN pos_interface_map a ON a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id
						LEFT JOIN code_base b ON b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND b.parent_code = 'pos_rep_item'
						LEFT JOIN pos_pccode c ON c.hotel_group_id = arg_hotel_group_id AND c.hotel_id = arg_hotel_id
					WHERE f.hotel_group_id = arg_hotel_group_id AND f.hotel_id = arg_hotel_id AND f.code = b.code AND f.pccode = c.code 
					AND f.biz_date = var_bizdate AND f.type = '1' AND a.pos_code = b.flag AND a.sys_code=c.code
					ORDER BY f.accnt;
				IF t_error = 1 THEN
					SET  arg_ret = -1,arg_msg = "-1,posdish消费生成出错!";
					LEAVE label; 
				END IF;	
				INSERT INTO pos_dish (hotel_group_id,hotel_id,menu_id,biz_date,pos_station ,CODE,descript,fee, list_order,create_user,create_datetime,modify_user,modify_datetime,cashier,inumber,remark)
					SELECT a.hotel_group_id,a.hotel_id,0,a.biz_date, b.code,a.code,a.descript,a.amount,'100',a.userCode,a.create_datetime,a.userCode,a.modify_datetime,a.shift,'1',a.accnt
						FROM pos_audit_master a INNER JOIN pos_interface_map b ON a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.pccode = b.pos_code AND b.link_type = 'ta_code'
						INNER JOIN code_transaction c ON a.hotel_group_id = c.hotel_group_id AND a.hotel_id = c.hotel_id AND c.arrange_code = '98' AND c.cat_posting NOT IN ('ENT','DSC') AND a.code = c.code 
						WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = var_bizdate AND a.type = '2'
						ORDER BY a.accnt;
				IF t_error = 1 THEN
					SET  arg_ret = -1,arg_msg = "-1,posdish付款生成出错!";
					LEAVE label; 
				END IF;	
			ELSE
				-- 餐饮传分摊前数据
				INSERT INTO pos_menu (hotel_group_id , hotel_id , biz_date ,pos_station ,pos_code,pos_descript,menu_no, table_no,
						cashier,guest_num,pay_code,pay_descript,rmno,guest_id,guest_name,company_id,company_name,
						ar_account,card_code,card_no,discount_mode,fee,fee_srv,fee_dsc,sales,sales_man,last_ls_no,
						sta,remark,inumber,create_user,create_datetime,modify_user,modify_datetime)
					SELECT a.hotel_group_id,a.hotel_id,a.biz_date,'1',b.code,b.descript,a.accnt,a.tableno,a.shift,a.gsts,a.paycode,'',a.toaccnt,a.haccnt,a.name,
						 a.cusno,a.cusinfo,a.toaccnt,a.cardno,a.cardno,a.mode,a.charge,a.srvamount,a.dscamount,a.saleid,a.saleinfo,'0',a.sta,a.info,a.id,a.create_user,
						 a.create_datetime,a.modify_user,a.modify_datetime 
					FROM pos_master a INNER JOIN pos_interface_map b ON a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.pccode = b.pos_code AND b.link_type = 'ta_code'
					WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = var_bizdate AND a.sta <> 'S';
				IF t_error = 1 THEN
					SET  arg_ret = -1,arg_msg = "-1,posmneu生成出错!";
					LEAVE label; 
				END IF;			
				
				INSERT INTO pos_dish (hotel_group_id,hotel_id,menu_id,biz_date,pos_station ,CODE,descript,fee, list_order,create_user,create_datetime,modify_user,modify_datetime,cashier,inumber,remark)               
					SELECT f.hotel_group_id,f.hotel_id,0,f.biz_date,c.ta_code,a.code,a.descript,(f.amount-f.amount1),'0',f.userCode,
						f.create_datetime,f.userCode,f.modify_datetime,f.shift,'1',f.accnt
						FROM pos_audit_master f
						LEFT JOIN pos_interface_map a ON a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id
						LEFT JOIN code_base b ON b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND b.parent_code = 'pos_rep_item'
						LEFT JOIN pos_pccode c ON c.hotel_group_id = arg_hotel_group_id AND c.hotel_id = arg_hotel_id
					WHERE f.hotel_group_id = arg_hotel_group_id AND f.hotel_id = arg_hotel_id AND f.code = b.code AND f.pccode = c.code 
					AND f.biz_date = var_bizdate AND f.type = '1' AND a.pos_code = b.flag AND a.sys_code=c.code
					ORDER BY f.accnt;
				IF t_error = 1 THEN
					SET  arg_ret = -1,arg_msg = "-1,posdish消费生成出错!";
					LEAVE label; 
				END IF;	
				INSERT INTO pos_dish (hotel_group_id,hotel_id,menu_id,biz_date,pos_station ,CODE,descript,fee, list_order,create_user,create_datetime,modify_user,modify_datetime,cashier,inumber,remark)
					SELECT a.hotel_group_id,a.hotel_id,0,a.biz_date, b.code,a.code,a.descript,a.amount,'100',a.userCode,a.create_datetime,a.userCode,a.modify_datetime,a.shift,'1',a.accnt
						FROM pos_audit_master a INNER JOIN pos_interface_map b ON a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.pccode = b.pos_code AND b.link_type = 'ta_code'						
						WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = var_bizdate AND a.type = '2'
						ORDER BY a.accnt;
				IF t_error = 1 THEN
					SET  arg_ret = -1,arg_msg = "-1,posdish付款生成出错!";
					LEAVE label; 
				END IF;					
			END IF;
			
			UPDATE pos_dish a,pos_menu b SET a.menu_id = b.id WHERE a.hotel_group_id = b.hotel_group_id AND a.hotel_id=b.hotel_id AND a.biz_date = b.biz_date  AND a.remark = b.menu_no 
				AND a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = var_bizdate;
				
			IF var_earnestshow = 'T' THEN
				SELECT IFNULL(till_bal,0) INTO var_respaytill FROM pos_deposit_sum WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = DATE_ADD(var_bizdate, INTERVAL -1 DAY);
				INSERT INTO pos_deposit_sum(hotel_group_id,hotel_id,biz_date,last_bal,`add`,reduce,till_bal,create_user,create_datetime)
					SELECT arg_hotel_group_id,arg_hotel_id,var_bizdate,IFNULL(var_respaytill,0),0,0,0,'POS',NOW();
				
				UPDATE pos_deposit_sum SET `add` = (SELECT IFNULL(SUM(credit),0) FROM pos_pay WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = var_bizdate) 
					WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = var_bizdate;			
				UPDATE pos_deposit_sum SET reduce = (SELECT IFNULL(SUM(credit),0) FROM pos_pay WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND tbdate = var_bizdate AND sta = 'O') 
					WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = var_bizdate;
				UPDATE pos_deposit_sum SET till_bal = last_bal + `add` - reduce WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = var_bizdate;	
			END IF;
			DELETE FROM  pos_master  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = var_bizdate AND sta <> 'S';
			DELETE FROM  pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = var_bizdate AND sta <> 'S' AND number = '1';
			DELETE FROM  pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id   AND biz_date = var_bizdate AND sta <> 'I' AND number = '2';
			DELETE FROM  pos_detail  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id   AND biz_date = var_bizdate AND IFNULL(billno,'') <> 'S';		              
			DELETE FROM  pos_detail_jie WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND TO_DAYS(NOW())-TO_DAYS(biz_date)>90;
			DELETE FROM  pos_detail_dai WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND TO_DAYS(NOW())-TO_DAYS(biz_date)>90;
			DELETE FROM  pos_accnt_sync WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND create_datetime <= DATE_ADD(var_bizdate,INTERVAL -3 DAY);   
			UPDATE pos_res  SET sta = 'N' ,osta = sta,modify_datetime=NOW() WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = var_bizdate AND sta IN ('R','G');
			UPDATE  sys_option SET set_value = DATE_ADD(set_value, INTERVAL 1 DAY),modify_datetime=NOW() WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
			UPDATE  sys_option SET set_value = DATE_ADD(var_bizdate,INTERVAL 1 DAY) ,modify_datetime=NOW() WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = 0 AND catalog = 'system' AND item = 'pos_biz_date';
			IF EXISTS(SELECT 1 FROM pos_ip WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = 0 AND CODE= 'GROUP') THEN							
				INSERT INTO sync_data(hotel_group_id,hotel_id,flag,entity_name,entity_id,sync_type) 
				SELECT hotel_group_id,hotel_id,DATE_FORMAT( NOW(),'%Y%m%d%H%i%s000'),'SysOption',id,'UPDATE'
				FROM sys_option WHERE item = 'pos_biz_date' AND catalog = 'system' AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			END IF;
			UPDATE sys_extra_id SET pos_cur = 1 WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE IN ('POSRSV','POSMASTER','POSBILL');
			IF t_error = 1 THEN
				SET  arg_ret = -1,arg_msg = "-1,夜审出错未完成!";
				LEAVE label; 
			END IF;			
		END IF;
			
	ELSE      
		SET arg_ret = -1,arg_msg = "-1,还有未关账的服务点,请检查!";
		
	END IF;     
END label;	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_audit_portal_init_rebuild`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_audit_portal_init_rebuild`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_audit_portal_init_rebuild`(
	IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
	IN arg_biz_date		DATETIME
	)
    SQL SECURITY INVOKER
BEGIN
	-- 餐饮夜审过程
  
	   DECLARE var_bizdate 		DATETIME;
	   DECLARE var_maxinum 		INTEGER;
	   DECLARE var_count 		INTEGER;
	   DECLARE var_dsc 		DECIMAL(12,2);
	   DECLARE var_is_apportion	VARCHAR(5);
	   DECLARE var_respaytill		DECIMAL(10,2);
	   DECLARE var_earnestshow		VARCHAR(20);
	   DECLARE i 			INT DEFAULT 0;
	   DECLARE j 			INT DEFAULT 0;
	   DECLARE var_sql		VARCHAR(1024);
	   DECLARE var_apportion_ret 	INTEGER DEFAULT 0; 
	   DECLARE t_error 		INTEGER DEFAULT 0; 
	   DECLARE var_ret		INT;
	   DECLARE var_msg		VARCHAR(60) ;
	   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1; 
label:BEGIN
	   SET var_ret = 1, var_msg = '数据重建完成,请进入PMS系统重建报表';
--	   set arg_biz_date = arg_biz_date;
	   SELECT set_value INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'biz_date'; 
	   SELECT IFNULL(set_value,'F') INTO var_earnestshow FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'pos' AND item = 'earnest_show_to_repdai';
	   SET var_bizdate = DATE_ADD(var_bizdate,INTERVAL -1 DAY);
START TRANSACTION; 
	   IF arg_biz_date > var_bizdate THEN
		SET  var_ret = -1;
		SET  var_msg = "-1,只能重建本日之前的数据!" ; 
		LEAVE label; 		
	   END IF;
 --   -------------------------------------
	-- 款待分摊
	    CALL  up_pos_audit_portal_apportion(arg_hotel_group_id,arg_hotel_id,arg_biz_date,@a);
	    SELECT @a INTO var_apportion_ret ;
	    IF(var_apportion_ret = -1)THEN 
		SET t_error = 2;
-- 		SET  var_ret = -1;
-- 		SET  var_msg = "-1,款待分摊失败，数据重建不成功!" ; 
-- 		LEAVE label; 
	    END IF;
	    -- 生成夜审报表
	    CALL  up_pos_audit_portal_init_report(arg_hotel_group_id,arg_hotel_id,arg_biz_date);
	    IF t_error = 1 THEN
		SET  var_ret = -1;
		SET  var_msg = "-1,夜审报表生成失败，数据重建不成功!" ; 
		LEAVE label; 
	    END IF;
--   --------------------------------------------------------
	   -- 生成前台需要使用的数据，为了适应千恒餐饮接口传数据
	    DELETE FROM pos_menu WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
	    INSERT  INTO pos_menu (`hotel_group_id` , `hotel_id` , `biz_date` ,`pos_station` ,`pos_code`,`pos_descript`,`menu_no`, `table_no`,
			`cashier`,`guest_num`,`pay_code`,`pay_descript`,`rmno`,`guest_id`,`guest_name`,`company_id`,`company_name`,
			`ar_account`,`card_code`,`card_no`,`discount_mode`,`fee`,`fee_srv`,`fee_dsc`,`sales`,`sales_man`,`last_ls_no`,
			`sta`,`remark`,`inumber`,`create_user`,`create_datetime`,`modify_user`,`modify_datetime`)
	    SELECT a.hotel_group_id,a.hotel_id,a.biz_date,'1',b.code,b.descript,a.accnt,a.tableno,a.shift,a.gsts,a.paycode,'',a.toaccnt,a.haccnt,a.`name`,
					 a.cusno,a.cusinfo,a.toaccnt,a.cardno,a.cardno,a.`mode`,a.charge,a.srvamount,a.dscamount,a.saleid,a.saleinfo,'0',a.sta,a.info,a.id,a.create_user,
					 a.create_datetime,a.modify_user,a.modify_datetime 
		 FROM pos_master_history a INNER JOIN pos_interface_map b ON a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.pccode = b.pos_code AND b.link_type = 'ta_code'
	    WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = arg_biz_date AND a.sta <> 'S' ;
	    IF t_error = 1 THEN
		SET  var_ret = -1;
		SET  var_msg = "-1,pos_menu插入失败，数据重建不成功!" ; 
		LEAVE label; 
	    END IF;
	    
	    
	    DELETE FROM pos_dish WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
	-- 插入消费信息
	    INSERT  INTO pos_dish (`hotel_group_id`,`hotel_id`,`menu_id`,`biz_date`,`pos_station` ,`code`,`descript`,`fee`, `list_order`,`create_user`,`create_datetime`,`modify_user`,`modify_datetime`,`cashier`,`inumber`,`remark`)               
			 SELECT f.hotel_group_id,f.hotel_id,0,f.biz_date,e.ta_code,e.code,e.descript,f.amount,'0',f.userCode,f.create_datetime,f.userCode,f.modify_datetime,f.shift,'1',f.accnt
				FROM pos_audit_master f,
				(
						SELECT a.code,a.descript,b.code AS tocode ,b.flag , c.ta_code,c.`code` AS pccode   FROM  pos_interface_map a,
							(SELECT CODE,flag FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_rep_item' ) b ,
							(SELECT `code`,ta_code FROM pos_pccode  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id ) c
							WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.pos_code = b.flag AND a.sys_code=c.`code`
				 ) e
					 
	     WHERE  f.code = e.tocode AND f.pccode =  e.pccode AND f.hotel_group_id = arg_hotel_group_id AND f.hotel_id = arg_hotel_id AND f.biz_date =  arg_biz_date  AND f.type = '1'
				ORDER BY f.accnt;
	    IF t_error = 1 THEN
		SET  var_ret = -1;
		SET  var_msg = "-1,pos_dish消费插入失败，数据重建不成功!" ; 
		LEAVE label; 
	    END IF;
	-- 插入付款信息
	    INSERT  INTO pos_dish (`hotel_group_id`,`hotel_id`,`menu_id`,`biz_date`,`pos_station` ,`code`,`descript`,`fee`, `list_order`,`create_user`,`create_datetime`,`modify_user`,`modify_datetime`,`cashier`,`inumber`,`remark`)
	    SELECT a.hotel_group_id,a.hotel_id,0,a.biz_date, b.code,a.`code`,a.descript,a.amount,'100',a.userCode,a.create_datetime,a.userCode,a.modify_datetime,a.shift,'1',a.accnt
	    FROM pos_audit_master a INNER JOIN pos_interface_map b ON a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.pccode = b.pos_code AND b.link_type = 'ta_code' 
	    WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = arg_biz_date AND a.type = '2'
	    ORDER BY a.accnt;
	    IF t_error = 1 THEN
		SET  var_ret = -1;
		SET  var_msg = "-1,pos_dish付款插入失败，数据重建不成功!" ; 
		LEAVE label; 
	    END IF;
	 
	   UPDATE pos_dish a,pos_menu b SET a.menu_id = b.id WHERE a.hotel_group_id = b.hotel_group_id AND a.hotel_id=b.hotel_id AND a.biz_date = b.biz_date  AND a.remark = b.menu_no 
							   AND  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = arg_biz_date;
	-- 下面为生成pos_deptjie和pos_deptdai数据
	-- 删除当前表
	IF EXISTS(SELECT 1 FROM pos_deptjie WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date) THEN
		DELETE FROM pos_deptjie WHERE hotel_id=arg_hotel_id AND hotel_group_id=arg_hotel_group_id AND biz_date = arg_biz_date;
	END IF;
	
	IF EXISTS(SELECT 1 FROM pos_deptdai WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date) THEN
		DELETE FROM pos_deptdai WHERE hotel_id=arg_hotel_id AND hotel_group_id=arg_hotel_group_id AND biz_date = arg_biz_date;
	END IF;
	
	-- 插入当前表
	INSERT INTO `pos_deptjie` (`hotel_group_id`, `hotel_id`, `biz_date`, `ta_code`, `cashier`, `user_code`, `CODE`, `descript`, `descript_en`, `day_mark`, `amount_day`, `amount_month`, `amount_year`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) 
	SELECT a.hotel_group_id,a.hotel_id,a.biz_date,a.code,a.cashier,a.puser,a.code,a.descript,a.descript,'',a.fee,0,0,a.create_user, a.create_datetime, a.modify_user, a.modify_datetime
	FROM pos_dish a,code_transaction b WHERE a.hotel_group_id=b.hotel_group_id AND a.hotel_id=b.hotel_id AND a.code=b.code AND a.biz_date = arg_biz_date AND  a.hotel_id=arg_hotel_id AND a.hotel_group_id=arg_hotel_group_id AND b.arrange_code<'9';
	    IF t_error = 1 THEN
		SET  var_ret = -1;
		SET  var_msg = "-1,pos_deptjie插入失败，数据重建不成功!" ; 
		LEAVE label; 
	    END IF;
	INSERT INTO `pos_deptdai` (`hotel_group_id`, `hotel_id`, `biz_date`, `ta_code`, `cashier`, `user_code`, `CODE`, `descript`, `descript_en`, `day_mark`, `amount_day`, `amount_month`, `amount_year`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) 
	SELECT a.hotel_group_id,a.hotel_id,a.biz_date,a.code,a.cashier,a.puser,a.code,a.descript,a.descript,'',a.fee,0,0,a.create_user, a.create_datetime, a.modify_user, a.modify_datetime
	FROM pos_dish a,code_transaction b WHERE a.hotel_group_id=b.hotel_group_id AND a.hotel_id=b.hotel_id AND a.code=b.code AND a.biz_date = arg_biz_date AND  a.hotel_id=arg_hotel_id AND a.hotel_group_id=arg_hotel_group_id AND b.arrange_code>'9';
	    IF t_error = 1 THEN
		SET  var_ret = -1;
		SET  var_msg = "-1,pos_deptdai插入失败，数据重建不成功!" ; 
		LEAVE label; 
	    END IF;
	-- 清空历史表
	IF EXISTS(SELECT 1 FROM pos_deptjie_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date) THEN
		DELETE FROM pos_deptjie_history WHERE hotel_id=arg_hotel_id AND hotel_group_id=arg_hotel_group_id AND biz_date = arg_biz_date;
	END IF;
	
	IF EXISTS(SELECT 1 FROM pos_deptdai_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date) THEN
		DELETE FROM pos_deptdai_history WHERE hotel_id=arg_hotel_id AND hotel_group_id=arg_hotel_group_id AND biz_date = arg_biz_date;
	END IF;
	-- 将当前表插入历史表
	INSERT INTO `pos_deptjie_history` (`hotel_group_id`, `hotel_id`, `biz_date`, `id`, `ta_code`, `cashier`, `user_code`, `code`, `descript`, `descript_en`, `day_mark`, `amount_day`, `amount_month`, `amount_year`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) 
		SELECT `hotel_group_id`, `hotel_id`, `biz_date`, `id`, `ta_code`, `cashier`, `user_code`, `code`, `descript`, `descript_en`, `day_mark`, `amount_day`, `amount_month`, `amount_year`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime` FROM pos_deptjie  WHERE  hotel_id=arg_hotel_id AND hotel_group_id=arg_hotel_group_id AND biz_date = arg_biz_date;
	INSERT INTO `pos_deptdai_history` (`hotel_group_id`, `hotel_id`, `biz_date`, `id`, `ta_code`, `cashier`, `user_code`, `code`, `descript`, `descript_en`,`dai_tail`, `day_mark`, `amount_day`, `amount_month`, `amount_year`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) 
		SELECT `hotel_group_id`, `hotel_id`, `biz_date`, `id`, `ta_code`, `cashier`, `user_code`, `code`, `descript`, `descript_en`, `dai_tail`, `day_mark`, `amount_day`, `amount_month`, `amount_year`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime` FROM pos_deptdai WHERE  hotel_id=arg_hotel_id AND hotel_group_id=arg_hotel_group_id AND biz_date = arg_biz_date;
	IF var_earnestshow = 'T' THEN
		DELETE FROM pos_deposit_sum WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date;
		SELECT IFNULL(till_bal,0) INTO var_respaytill FROM pos_deposit_sum WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = DATE_ADD(arg_biz_date, INTERVAL -1 DAY);
		INSERT INTO pos_deposit_sum(hotel_group_id,hotel_id,biz_date,last_bal,`add`,reduce,till_bal,create_user,create_datetime)	
			SELECT arg_hotel_group_id,arg_hotel_id,arg_biz_date,IFNULL(var_respaytill,0),0,0,0,'POS',NOW();	
		UPDATE pos_deposit_sum SET `add` = (SELECT IFNULL(SUM(credit),0) FROM pos_pay WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date) 
			WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date;			
		UPDATE pos_deposit_sum SET reduce = (SELECT IFNULL(SUM(credit),0) FROM pos_pay WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND tbdate = arg_biz_date AND sta = 'O') 
			WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date;
		UPDATE pos_deposit_sum SET till_bal = last_bal + `add` - reduce WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date;				
	END IF;	
	
	-- 如果重建日期不是上一个营业日期，则删除当前表
	IF arg_biz_date < var_bizdate THEN
		DELETE FROM pos_deptjie WHERE hotel_id=arg_hotel_id AND hotel_group_id=arg_hotel_group_id AND biz_date = arg_biz_date;
		DELETE FROM pos_deptdai WHERE hotel_id=arg_hotel_id AND hotel_group_id=arg_hotel_group_id AND biz_date = arg_biz_date;
	END IF;
 
                 --   处理预订
             --     UPDATE pos_res  SET sta = 'N' ,osta = sta,modify_datetime=NOW() WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND sta IN ('R','G');
END label; 
	   IF t_error = 1 OR t_error = 2 THEN  
		ROLLBACK;   
  
	   ELSE  
		COMMIT;       
	   END IF;
	   SELECT var_ret, var_msg ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_audit_portal_init_report`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_audit_portal_init_report`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_audit_portal_init_report`(IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
 	IN arg_biz_date		DATETIME)
    SQL SECURITY INVOKER
label_0:
BEGIN
	
	DECLARE bdate			DATETIME;
	DECLARE var_ret 		INTEGER;
	DECLARE var_msg 		VARCHAR(70);
	DECLARE TYPE			CHAR(1);
	DECLARE userCode			VARCHAR(10);
	DECLARE shift			CHAR(1);
	DECLARE pccodes		VARCHAR(100);
	DECLARE min_pccode    VARCHAR(5);
	DECLARE pccode_des	VARCHAR(30) ; 
	DECLARE var_sql		VARCHAR(1024);
	DECLARE var_bizdate DATETIME;
	DECLARE var_maxinum INTEGER;
	DECLARE var_count INTEGER;
	DECLARE var_dsc DECIMAL(12,2);
	DECLARE i INT DEFAULT 0;
	DECLARE j INT DEFAULT 0;
	DECLARE t_error INTEGER DEFAULT 0;  
	DECLARE done_cursor INT DEFAULT 0 ;
	DECLARE var_cursor CURSOR FOR SELECT tableno FROM tmp_table;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;
	SET @procresult = 0 ;
	SET var_ret = 0;
	SET var_msg = '成功';
 
	SELECT set_value INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
	DELETE FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_biz_date;
	DELETE FROM pos_audit_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_biz_date;  
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master ;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account ;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail ;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_pccode ;
	DROP TEMPORARY TABLE IF EXISTS tmp_code_base ;
	CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
	CREATE TEMPORARY TABLE tmp_pos_account SELECT * FROM pos_account WHERE 1=2;
	CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2 ;
	CREATE TEMPORARY TABLE tmp_pos_pccode SELECT * FROM pos_pccode WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
	CREATE TEMPORARY TABLE tmp_code_base SELECT * FROM  code_base  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_rep_item';
	SELECT TO_DAYS(arg_biz_date)-TO_DAYS(var_bizdate) INTO i;
	IF i=0 THEN
		INSERT INTO tmp_pos_master SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_biz_date ;
		INSERT INTO tmp_pos_account SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_biz_date ;
		INSERT INTO tmp_pos_detail SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_biz_date ;
	ELSE
		INSERT INTO tmp_pos_master SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
		INSERT INTO tmp_pos_account SELECT * FROM pos_account_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
		INSERT INTO tmp_pos_detail SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
	END IF ;
	INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'A1','总开单',0,
			IFNULL(COUNT(e.accnt),0) ,
			IFNULL(SUM(e.charge),0),
			IFNULL(SUM(e.credit),0),
			IFNULL(SUM(e.bal),0),0,0,'ADMIN',NOW(),'ADMIN',NOW()
		FROM tmp_pos_pccode b ,tmp_pos_master e 
		WHERE e.pccode = b.code
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
	INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'A2','已结账',0,
			IFNULL(COUNT(e.accnt),0) ,
			IFNULL(SUM(e.charge),0),
			IFNULL(SUM(e.credit),0),
			IFNULL(SUM(e.bal),0),0,0,'ADMIN',NOW(),'ADMIN',NOW()
		FROM tmp_pos_pccode b ,tmp_pos_master e 
		WHERE e.pccode = b.code  AND e.sta = 'O'
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
         
	INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'A3','未结账',0,
			IFNULL(COUNT(e.accnt),0) ,
			IFNULL(SUM(e.charge),0),
			IFNULL(SUM(e.credit),0),
			IFNULL(SUM(e.bal),0),0,0,'ADMIN',NOW(),'ADMIN',NOW()
		FROM tmp_pos_pccode b ,tmp_pos_master e 
		WHERE e.pccode = b.code  AND e.sta IN ('I','C') 
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
	INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'A4','挂账',0,
			IFNULL(COUNT(e.accnt),0) ,
			IFNULL(SUM(e.charge),0),
			IFNULL(SUM(e.credit),0),
			IFNULL(SUM(e.bal),0),0,0,'ADMIN',NOW(),'ADMIN',NOW()
		FROM tmp_pos_pccode b ,tmp_pos_master e 
		WHERE e.pccode = b.code  AND e.sta = 'S'
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
	INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'A5','删除',0,
			IFNULL(COUNT(e.accnt),0) ,
			IFNULL(SUM(e.charge),0),
			IFNULL(SUM(e.credit),0),
			IFNULL(SUM(e.bal),0),0,0,'ADMIN',NOW(),'ADMIN',NOW()
		FROM tmp_pos_pccode b ,tmp_pos_master e 
		WHERE e.pccode = b.code  AND e.sta = 'X'
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
	INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'B1','就餐人数',
			IFNULL(SUM(e.gsts),0),0,0,0,
			IFNULL(SUM(e.gsts),0),0,0,'ADMIN',NOW(),'ADMIN',NOW() 
		FROM tmp_pos_pccode b ,tmp_pos_master e 
		WHERE e.pccode = b.code  AND e.sta <> 'X' 
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
	INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',e.modify_user,e.shift,e.pccode,f.descript,b.code,b.descript,
			IFNULL(SUM(d.amount),0),
			IFNULL(SUM(d.srv),0),
			IFNULL(SUM(d.tax),0),
			IFNULL(SUM(d.dsc),0),
			IFNULL(SUM(d.amount + d.srv + d.tax - d.dsc) ,0),
			IFNULL(SUM(d.amount1),0),
			IFNULL(SUM(d.amount2),0),'ADMIN',NOW(),'ADMIN',NOW()
		FROM tmp_code_base b ,tmp_pos_detail d,tmp_pos_master e,tmp_pos_pccode f
		WHERE e.accnt = d.accnt  AND b.code = d.tocode AND d.type = '1' AND e.sta = 'O' AND d.sta = 'I'  AND e.sta = 'O' AND e.pccode = f.code 
		GROUP BY e.modify_user,e.shift,e.pccode,f.descript,b.code,b.descript 
		ORDER BY e.pccode,b.code ;
 
	INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',e.modify_user,e.shift,e.pccode,f.descript,'080','服务费',
			IFNULL(SUM(e.srvamount),0),
			0,
			0,
			0,
			IFNULL(SUM(e.srvamount),0),IFNULL(SUM(e.amount3),0),0,'ADMIN',NOW(),'ADMIN',NOW() 
		FROM tmp_pos_master e,tmp_pos_pccode f
		WHERE e.sta = 'O' AND e.pccode = f.code AND e.srvamount <> 0
		GROUP BY e.modify_user,e.shift,e.pccode,f.descript 
		ORDER BY e.pccode ;
      
	INSERT pos_audit_report(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',e.modify_user,e.shift,e.pccode,f.descript,'099','未定义',
			IFNULL(SUM(d.amount),0),
			IFNULL(SUM(d.srv),0),
			IFNULL(SUM(d.tax),0),
			IFNULL(SUM(d.dsc),0),
			IFNULL(SUM(d.amount + d.srv + d.tax - d.dsc) ,0),
			IFNULL(SUM(d.amount1),0),
			IFNULL(SUM(d.amount2),0),'ADMIN',NOW(),'ADMIN',NOW()
		 FROM tmp_pos_detail d,tmp_pos_master e,tmp_pos_pccode f
		 WHERE e.accnt = d.accnt  AND IFNULL(d.tocode,'') NOT IN (SELECT CODE FROM tmp_code_base) 
			AND d.type = '1' AND d.sta = 'I'  AND e.sta = 'O' AND e.pccode = f.code 
		 GROUP BY e.modify_user,e.shift,e.pccode,f.descript 
		 ORDER BY e.pccode ;
	INSERT pos_audit_master (hotel_group_id,hotel_id,biz_date,TYPE,accnt,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		 SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',e.accnt,e.modify_user,e.shift,e.pccode,f.descript,b.code,b.descript,
			IFNULL(SUM(d.amount),0),
			IFNULL(SUM(d.srv),0),
			IFNULL(SUM(d.tax),0),
			IFNULL(SUM(d.dsc),0),
			IFNULL(SUM(d.amount + d.srv + d.tax - d.dsc) ,0),
			IFNULL(SUM(d.amount1),0),
			IFNULL(SUM(d.amount2),0),'ADMIN',NOW(),'ADMIN',NOW()
		FROM tmp_code_base b ,tmp_pos_detail d,tmp_pos_master e,tmp_pos_pccode f
		WHERE e.accnt = d.accnt AND b.code = d.tocode AND d.type = '1' AND d.sta = 'I' AND e.sta = 'O' AND e.pccode = f.code
		GROUP BY e.accnt,e.modify_user,e.shift,e.pccode,f.descript,b.code,b.descript 
		ORDER BY e.pccode,b.code ;
	INSERT pos_audit_master (hotel_group_id,hotel_id,biz_date,TYPE,accnt,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',e.accnt,e.modify_user,e.shift,e.pccode,f.descript,'080','服务费',
			IFNULL(e.srvamount,0),
			0,
			0,
			0,
			IFNULL(SUM(e.srvamount),0),IFNULL(e.amount3,0),0 ,'ADMIN',NOW(),'ADMIN',NOW()
		FROM tmp_pos_master e,tmp_pos_pccode f
		WHERE e.sta = 'O' AND e.pccode = f.code AND e.srvamount <> 0
		GROUP BY e.accnt,e.modify_user,e.shift,e.pccode,f.descript 
		ORDER BY e.pccode ; 
      
	INSERT pos_audit_master (hotel_group_id,hotel_id,biz_date,TYPE,accnt,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',e.accnt,e.modify_user,e.shift,e.pccode,f.descript,'099','未定义',
			IFNULL(SUM(d.amount),0),
			IFNULL(SUM(d.srv),0),
			IFNULL(SUM(d.tax),0),
			IFNULL(SUM(d.dsc),0),
			IFNULL(SUM(d.amount + d.srv + d.tax - d.dsc) ,0),
			IFNULL(SUM(d.amount1),0),
			IFNULL(SUM(d.amount2),0),'ADMIN',NOW(),'ADMIN',NOW()
		FROM tmp_pos_detail d,tmp_pos_master e,tmp_pos_pccode f
		WHERE e.accnt = d.accnt  AND IFNULL(d.tocode,'') NOT IN (SELECT CODE FROM tmp_code_base)
			AND d.type = '1' AND d.sta = 'I' AND e.sta = 'O' AND e.pccode = f.code
		GROUP BY e.accnt,e.modify_user,e.shift,e.pccode,f.descript 
		ORDER BY e.pccode ;
	INSERT pos_audit_report  (hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'2',d.modify_user,d.shift,c.pccode,e.descript,c.paycode,c.descript,
			IFNULL(SUM(0),0),
			IFNULL(SUM(0),0),
			IFNULL(SUM(0),0),
			IFNULL(SUM(0),0),
			IFNULL(SUM(c.credit) ,0),0,0,'ADMIN',NOW(),'ADMIN',NOW()
		FROM tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e
		WHERE c.accnt = d.accnt AND d.sta = 'O' AND (c.sta = 'O' OR c.sta = 'R' ) AND c.number = 2 AND c.pccode = e.code
		GROUP BY d.modify_user,d.shift,c.pccode,e.descript,c.paycode,c.descript 
		ORDER BY c.pccode,c.paycode ;
 
	INSERT pos_audit_master (hotel_group_id,hotel_id,biz_date,TYPE,accnt,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'2',d.accnt,d.modify_user,d.shift,c.pccode,e.descript,c.paycode,c.descript,
			0,
			0,
			0,
			0,
			IFNULL(SUM(c.credit) ,0),0,0,'ADMIN',NOW(),'ADMIN',NOW()
		FROM tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e
		WHERE c.accnt = d.accnt AND d.sta = 'O' AND (c.sta = 'O' OR c.sta = 'R' )  AND  c.number = '2' AND c.pccode = e.code
		GROUP BY  d.accnt,d.modify_user,d.shift,c.pccode,e.descript,c.paycode,c.descript 
		ORDER BY c.pccode,c.paycode ;
	SET var_sql = CONCAT("
		insert pos_audit_report  (hotel_group_id,hotel_id,biz_date,type,userCode,shift,pccode,name,code,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
			select hotel_group_id,hotel_id,biz_date,type,userCode,shift,'all','所有营业点',code,descript,
				IFNULL(sum(amount0),0),
				IFNULL(sum(amount1),0),
				IFNULL(sum(amount2),0),
				IFNULL(sum(amount3),0),
				IFNULL(sum(amount),0),IFNULL(sum(ent_ft),0),IFNULL(sum(dsc_ft),0),'ADMIN',NOW(),'ADMIN',NOW()
			from pos_audit_report where hotel_group_id = ",arg_hotel_group_id," AND hotel_id =  ",arg_hotel_id," and biz_date = '",arg_biz_date,"'  AND pccode <> 'all'  group by hotel_group_id,hotel_id,biz_date,type,userCode,shift,`code`,descript	;
		");
	SET @exec_sql = var_sql;  
   	PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
	SET var_sql = CONCAT("
		insert pos_audit_report  (hotel_group_id,hotel_id,biz_date,type,userCode,shift,pccode,name,code,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft,create_user,create_datetime,modify_user,modify_datetime )
			select hotel_group_id,hotel_id,biz_date,type,'{{{',shift,pccode,name,code,descript,
				IFNULL(sum(amount0),0),
				IFNULL(sum(amount1),0),
				IFNULL(sum(amount2),0),
				IFNULL(sum(amount3),0),
				IFNULL(sum(amount),0),IFNULL(sum(ent_ft),0),IFNULL(sum(dsc_ft),0),'ADMIN',NOW(),'ADMIN',NOW()
			from pos_audit_report where hotel_group_id = ",arg_hotel_group_id," AND hotel_id =  ",arg_hotel_id," and biz_date = '",arg_biz_date,"' AND userCode <> '{{{'  group by hotel_group_id,hotel_id,biz_date,type,shift,pccode,name,code,descript	;
		");
    	SET @exec_sql = var_sql;  
   	PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
	SET var_sql = CONCAT("
		insert pos_audit_report  (hotel_group_id,hotel_id,biz_date,type,userCode,shift,pccode,name,code,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft ,create_user,create_datetime,modify_user,modify_datetime)
			select hotel_group_id,hotel_id,biz_date,type,userCode,'9',pccode,name,code,descript,
				IFNULL(sum(amount0),0),
				IFNULL(sum(amount1),0),
				IFNULL(sum(amount2),0),
				IFNULL(sum(amount3),0),
				IFNULL(sum(amount),0),IFNULL(sum(ent_ft),0),IFNULL(sum(dsc_ft),0),'ADMIN',NOW(),'ADMIN',NOW()
			from pos_audit_report where  hotel_group_id = ",arg_hotel_group_id," AND hotel_id =  ",arg_hotel_id," and biz_date = '",arg_biz_date,"'  AND shift <> '9' group by hotel_group_id,hotel_id,biz_date,type,userCode,pccode,name,code,descript	;
		");
    	SET @exec_sql = var_sql;  
   	PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
	IF t_error = 1 THEN  
		SET var_ret = '-1' ; 
	END IF;  
 
	BEGIN
		DROP TEMPORARY TABLE IF EXISTS tmp_pos_master ;
		DROP TEMPORARY TABLE IF EXISTS tmp_pos_account ;
		DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail ;
		DROP TEMPORARY TABLE IF EXISTS tmp_pos_pccode ;
		DROP TEMPORARY TABLE IF EXISTS tmp_code_base ;	
		
		SET @procresult = 0 ;	
		LEAVE label_0;
	END; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_bill_print`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_bill_print`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_bill_print`(
	IN arg_hotel_id		BIGINT,
	IN arg_hotel_group_id 	BIGINT,
	IN arg_accnt 		VARCHAR(20),
	IN arg_shift_o		VARCHAR(2),
	IN arg_type 		CHAR(1),
	IN arg_mode 		CHAR(1),
	IN arg_empno 		VARCHAR(20)
	)
BEGIN
	DECLARE var_pcrec 		VARCHAR(20);
	DECLARE	var_cashier		VARCHAR(20);
	DECLARE var_shift		VARCHAR(10);
	DECLARE var_shift_o_des		VARCHAR(10);
	DECLARE var_date1		DATETIME;
	DECLARE var_market		VARCHAR(20);
	DECLARE var_maxid		BIGINT;
	DECLARE var_gsts	     	INT;
	DECLARE var_srv_rate		DECIMAL(10,2);
	DECLARE	var_srv_amount		DECIMAL(10,2);
	DECLARE	var_dsc_rate		DECIMAL(10,2);
	DECLARE var_dsc_amount		DECIMAL(10,2);
	DECLARE var_amount_super	VARCHAR(50);
	DECLARE var_amount_total 	DECIMAL(10,2);
	
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_bill_pre;
	DROP TABLE IF EXISTS pos_bill;
	
	CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
	CREATE TEMPORARY TABLE tmp_pos_account SELECT * FROM pos_account WHERE 1=2;
	CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2 ;	
	
	CREATE TEMPORARY TABLE tmp_pos_bill_pre(
		pccode 		VARCHAR(20),
		pccode_des	VARCHAR(50),
		id 		BIGINT,
		TYPE 		CHAR(1),
		accnt 		VARCHAR(20),
		plu_code	VARCHAR(20),
		plu_des		CHAR(20),
		tocode		VARCHAR(10),
		tocode_des	VARCHAR(20),
		sta 		VARCHAR(1),
		number 		DECIMAL(10,2),
		price 		DECIMAL(10,2),
		unit	 	VARCHAR(10),
		amount 		DECIMAL(10,2),
		srv 		DECIMAL(10,2),
		des 	  	DECIMAL(10,2),
		srv_rate	DECIMAL(10,2),
		des_rate 	DECIMAL(10,2),
		info1		VARCHAR(200),
		info2		VARCHAR(200),
		info3		VARCHAR(200),
		info4		VARCHAR(200),
		info5		VARCHAR(200)	
	);
	
	IF EXISTS(SELECT 1 FROM pos_master WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
		SELECT IFNULL(pcrec,'') INTO var_pcrec FROM pos_master WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		IF var_pcrec <> '' THEN
			INSERT tmp_pos_master SELECT * FROM pos_master WHERE pcrec = var_pcrec AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id AND sta <> 'X';
		ELSE
			INSERT tmp_pos_master SELECT * FROM pos_master WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id AND sta <> 'X';
		END IF;
	ELSE 
		SELECT IFNULL(pcrec,'') INTO var_pcrec FROM pos_master_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		IF var_pcrec <> '' THEN
			INSERT tmp_pos_master SELECT * FROM pos_master_history WHERE pcrec = var_pcrec AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account_history WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail_history WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id AND sta <> 'X';
		ELSE
			INSERT tmp_pos_master SELECT * FROM pos_master_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id AND sta <> 'X';
		END IF;	
	END IF;
	UPDATE tmp_pos_detail SET descript = CONCAT(descript,'@') WHERE SUBSTRING(flag,3,1) = '1';
	
	INSERT tmp_pos_bill_pre(pccode,pccode_des,id,TYPE,accnt,plu_code,plu_des,tocode,tocode_des,sta,number,price,unit,amount,srv,des,srv_rate,des_rate,info1,info2,info3,info4,info5)
		SELECT '','',id,'A',accnt,CODE,IFNULL(descript,''),tocode,'',sta,IFNULL(number,0),IFNULL(price,0),unit,IFNULL(amount,0),IFNULL(srv,0.00),IFNULL(dsc,0.00),IFNULL(amount4,0.00),IFNULL(amount5,0.00),'','','','','' FROM tmp_pos_detail;
	
	
	CREATE TABLE pos_bill(
		id BIGINT(16) NOT NULL AUTO_INCREMENT,
		tag 		CHAR(1),
		plu_code	VARCHAR(20),
		plu_des 	VARCHAR(100),
		number 		VARCHAR(20),
		price 		VARCHAR(20),
		unit 		VARCHAR(20),
		info1		VARCHAR(200) DEFAULT '',
		info2		VARCHAR(100) DEFAULT '',
		amount		VARCHAR(20),
		amount_d	DECIMAL(10,2),
		PRIMARY KEY(id)
	);
	
 	INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
 		SELECT 'A',plu_code,plu_des,CAST(IFNULL(number,'') AS CHAR),CAST(IFNULL(price,'') AS CHAR),unit,'','',CAST(IFNULL(amount,'') AS CHAR),IFNULL(amount,0)  FROM tmp_pos_bill_pre WHERE tocode <> '06';
	SELECT IFNULL(SUM(srv),0.00) INTO var_srv_amount FROM tmp_pos_detail;
	SELECT IFNULL(SUM(dsc),0.00) INTO var_dsc_amount FROM tmp_pos_detail;
	SELECT dsc,srv INTO var_dsc_rate,var_srv_rate FROM tmp_pos_master WHERE accnt = arg_accnt;
	IF var_dsc_amount <> 0 THEN
		INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
			SELECT 'A','DSC',CONCAT('折扣[',CAST(IFNULL(var_dsc_rate,0)*100 AS CHAR),'%]'),'','','','','',CAST(IFNULL(-1*var_dsc_amount,'') AS CHAR),-1*IFNULL(var_dsc_amount,0) ;-- FROM tmp_pos_bill_pre WHERE tocode <> '06';
	END IF;
	IF var_srv_amount <> 0 THEN
		INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
			SELECT 'A','SRV',CONCAT('服务费[',CAST(IFNULL(var_srv_rate,0)*100 AS CHAR),'%]'),'','','','','',CAST(IFNULL(var_srv_amount,'') AS CHAR),IFNULL(var_srv_amount,0) ; -- FROM tmp_pos_bill_pre WHERE tocode <> '06';	
	END IF;
	
	INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
		SELECT 'D','D01','合计','','','','','','',SUM(amount_d) FROM pos_bill WHERE tag = 'A';
		
	UPDATE pos_bill SET amount = CAST(amount_d AS CHAR) WHERE tag = 'D';
	INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
		SELECT 'E','','','','','','','','',0;
	INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
		SELECT 'E','','','','','','','','',0;
	SELECT amount_d INTO var_amount_total FROM pos_bill WHERE tag = 'D';
	INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
		SELECT 'F','F01',CONCAT('合计:',TO_UPPER_NUM(var_amount_total,2)),'','','','','',CAST(var_amount_total AS CHAR),var_amount_total;
 	-- INSERT pos_bill(tag,info1,info2,amount)
 	INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
		SELECT 'F','F02',CONCAT(descript,SPACE(2),IFNULL(cardno,''),'-',IFNULL(info2,'')),'','','','','',CAST(credit AS CHAR),credit FROM tmp_pos_account WHERE number = 2 AND sta = 'O' AND paycode <> '9070' ORDER BY id;
			
	SELECT tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d FROM pos_bill ORDER BY id;	
	
		
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_bill_pre;	
	DROP TABLE IF EXISTS pos_bill;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_bill_print_80`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_bill_print_80`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_bill_print_80`(
	IN arg_hotel_group_id 	BIGINT,
	IN arg_hotel_id		BIGINT,
	IN arg_accnt 		VARCHAR(20),
	IN arg_shift_o		VARCHAR(2),
	IN arg_type 		CHAR(1),
	IN arg_mode 		CHAR(1),
	IN arg_empno 		VARCHAR(20)
	)
BEGIN
	DECLARE var_pcrec 		VARCHAR(20);
	DECLARE	var_cashier		VARCHAR(20);
	DECLARE var_shift		VARCHAR(10);
	DECLARE var_shift_o_des		VARCHAR(10);
	DECLARE var_date1		DATETIME;
	DECLARE var_market		VARCHAR(20);
	DECLARE var_maxid		BIGINT;
	DECLARE var_gsts	     	INT;
	DECLARE var_amount		DECIMAL(10,2);
	DECLARE var_srv 		DECIMAL(10,2);
	DECLARE var_dsc			DECIMAL(10,2);
	
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_bill_pre;
	DROP TABLE IF EXISTS pos_bill;
	
	CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
	CREATE TEMPORARY TABLE tmp_pos_account SELECT * FROM pos_account WHERE 1=2;
	CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2 ;	
	
	CREATE TEMPORARY TABLE tmp_pos_bill_pre(
		pccode 		VARCHAR(20),
		pccode_des	VARCHAR(50),
		id 		BIGINT,
		TYPE 		CHAR(1),
		accnt 		VARCHAR(20),
		plu_code	VARCHAR(20),
		plu_des		CHAR(20),
		tocode		VARCHAR(10),
		tocode_des	VARCHAR(20),
		sta 		VARCHAR(1),
		number 		DECIMAL(10,2),
		price 		DECIMAL(10,2),
		amount 		DECIMAL(10,2),
		srv 		DECIMAL(10,2),
		des 	  	DECIMAL(10,2),
		srv_rate	DECIMAL(10,2),
		des_rate 	DECIMAL(10,2),
		info1		VARCHAR(200),
		info2		VARCHAR(200),
		info3		VARCHAR(200),
		info4		VARCHAR(200),
		info5		VARCHAR(200)	
	);
	
	IF EXISTS(SELECT 1 FROM pos_master WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
		SELECT IFNULL(pcrec,'') INTO var_pcrec FROM pos_master WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		IF var_pcrec <> '' THEN
			INSERT tmp_pos_master SELECT * FROM pos_master WHERE pcrec = var_pcrec AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		ELSE
			INSERT tmp_pos_master SELECT * FROM pos_master WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		END IF;
	ELSE 
		SELECT IFNULL(pcrec,'') INTO var_pcrec FROM pos_master_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		IF var_pcrec <> '' THEN
			INSERT tmp_pos_master SELECT * FROM pos_master_history WHERE pcrec = var_pcrec AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account_history WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail_history WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		ELSE
			INSERT tmp_pos_master SELECT * FROM pos_master_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		END IF;	
	END IF;
	UPDATE tmp_pos_detail SET descript = CONCAT(descript,'@') WHERE SUBSTRING(flag,3,1) = '1';
	
	INSERT tmp_pos_bill_pre(pccode,pccode_des,id,TYPE,accnt,plu_code,plu_des,tocode,tocode_des,sta,number,price,amount,srv,des,srv_rate,des_rate,info1,info2,info3,info4,info5)
		SELECT '','',id,'A',accnt,CODE,IFNULL(descript,''),tocode,'',sta,IFNULL(number,0),IFNULL(price,0),IFNULL(amount,0),IFNULL(srv,0.00),IFNULL(dsc,0.00),IFNULL(amount4,0.00),IFNULL(amount5,0.00),'','','','','' FROM tmp_pos_detail;
	CREATE TABLE pos_bill(
		id BIGINT(16) NOT NULL AUTO_INCREMENT,
		tag 		CHAR(1),
		info1		VARCHAR(200) DEFAULT '',
		info2		VARCHAR(100) DEFAULT '',
		amount		DECIMAL(10,2),
		PRIMARY KEY(id)
	);
	-- CAST(IFNULL(gsts,0) AS CHAR)
	SELECT SUM(gsts) INTO var_gsts FROM tmp_pos_master WHERE sta = 'O'; 
	SELECT create_user,shift,create_datetime INTO var_cashier,var_shift,var_date1 FROM tmp_pos_account WHERE sta = 'O' AND number = 2 ORDER BY id LIMIT 1 ;
	SELECT market INTO var_market FROM tmp_pos_master WHERE accnt = arg_accnt;
	SELECT IFNULL(NAME,'') INTO var_cashier FROM USER WHERE CODE = var_cashier AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
	SELECT IFNULL(descript,'') INTO var_shift FROM code_base WHERE parent_code = 'pos_cashier' AND CODE = var_shift AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
	SELECT IFNULL(descript,'') INTO var_market FROM code_base WHERE parent_code = 'pos_market' AND CODE = var_market AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
	INSERT pos_bill(tag,info1,info2,amount)
		SELECT '0',DATE_FORMAT(a.create_datetime, '%Y-%m-%d %h:%i:%s'),b.name,0 FROM tmp_pos_master a,USER b WHERE accnt = arg_accnt AND a.create_user = b.code AND b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id;
	INSERT pos_bill(tag,info1,info2,amount)
		SELECT 'A',CONCAT(SPACE(5-CHAR_LENGTH(get_data_cancel_zero(number))),CAST(get_data_cancel_zero(number) AS CHAR),SPACE(5),plu_des),CAST(amount AS CHAR),amount FROM tmp_pos_bill_pre WHERE tocode <> '06';
				
	IF EXISTS(SELECT 1 FROM tmp_pos_bill_pre) THEN
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'B','本次货品总价',CAST(ROUND(IFNULL(SUM(amount),00),2) AS CHAR),ROUND(SUM(amount),0) FROM tmp_pos_bill_pre;
	END IF;
	
	SELECT SUM(srv) INTO var_srv FROM tmp_pos_bill_pre;
	IF(var_srv <> 0) THEN
		INSERT pos_bill(tag,info1,info2,amount)	
			SELECT 'C','服务费',CAST(IFNULL(var_srv,00) AS CHAR),var_srv;
	END IF;
	
	SELECT SUM(des) INTO var_dsc FROM tmp_pos_bill_pre;
	IF(var_dsc <> 0) THEN
		INSERT pos_bill(tag,info1,info2,amount)	
			SELECT 'D','百分比折扣',CAST(-1*IFNULL(var_dsc,0.00) AS CHAR),-1*var_dsc;
	END IF;
	INSERT pos_bill(tag,info1,info2,amount)
		SELECT 'E','','',0;
	
	INSERT 	pos_bill(tag,info1,info2,amount)
		SELECT 'F','合计',CAST(ROUND(SUM(amount),2) AS CHAR),ROUND(SUM(amount),2) FROM pos_bill WHERE tag IN('B','C','D');
	IF arg_type = '1' THEN	
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'G',CONCAT(DATE_FORMAT(var_date1, '%Y-%m-%d %h:%i:%s'),SPACE(3),var_shift),var_cashier,0;
			
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'H','付款','',0;
			
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'I',CONCAT(SPACE(3),descript,SPACE(3),IFNULL(info2,'')),credit,credit FROM tmp_pos_account WHERE number = 2 AND sta = 'O'  ORDER BY id;
		
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'J','','',0;
			
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'K','其中:','',0;
			
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'L',CONCAT(SPACE(3),a.descript),CAST(SUM(b.amount+b.srv-b.des) AS CHAR),SUM(b.amount+b.srv-b.des) FROM code_base a,tmp_pos_bill_pre b WHERE a.parent_code = 'pos_rep_item' 
				AND a.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND a.code = b.tocode GROUP BY b.tocode ORDER BY a.list_order,a.code;
				
	ELSEIF arg_type = '2' THEN
		SELECT IFNULL(descript,'') INTO var_shift_o_des FROM code_base WHERE parent_code = 'pos_cashier' AND CODE = arg_shift_o AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'G',CONCAT(DATE_FORMAT(NOW(), '%Y-%m-%d %h:%i:%s'),SPACE(3),var_shift_o_des),arg_empno,0;		
	END IF;
		
	SELECT tag,info1,info2,amount FROM pos_bill ORDER BY id;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_bill_pre;	
	DROP TABLE IF EXISTS pos_bill;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_bill_print_a4`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_bill_print_a4`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_bill_print_a4`(
	IN arg_hotel_group_id 	BIGINT,
	IN arg_hotel_id		BIGINT,
	IN arg_accnt 		VARCHAR(20),
	IN arg_shift_o		VARCHAR(2),
	IN arg_type 		CHAR(1),
	IN arg_mode 		CHAR(1),
	IN arg_empno 		VARCHAR(20)
	)
BEGIN
	DECLARE var_pcrec 		VARCHAR(20);
	DECLARE	var_cashier		VARCHAR(20);
	DECLARE var_shift		VARCHAR(10);
	DECLARE var_shift_o_des		VARCHAR(10);
	DECLARE var_date1		DATETIME;
	DECLARE var_market		VARCHAR(20);
	DECLARE var_maxid		BIGINT;
	DECLARE var_gsts	     	INT;
	DECLARE var_srv_rate		DECIMAL(10,2);
	DECLARE	var_srv_amount		DECIMAL(10,2);
	DECLARE	var_dsc_rate		DECIMAL(10,2);
	DECLARE var_dsc_amount		DECIMAL(10,2);
	DECLARE var_amount_super	VARCHAR(50);
	DECLARE var_amount_total 	DECIMAL(10,2);
	
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_bill_pre;
	DROP TABLE IF EXISTS pos_bill;
	
	CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
	CREATE TEMPORARY TABLE tmp_pos_account SELECT * FROM pos_account WHERE 1=2;
	CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2 ;	
	
	CREATE TEMPORARY TABLE tmp_pos_bill_pre(
		pccode 		VARCHAR(20),
		pccode_des	VARCHAR(50),
		id 		BIGINT,
		TYPE 		CHAR(1),
		accnt 		VARCHAR(20),
		plu_code	VARCHAR(20),
		plu_des		CHAR(20),
		tocode		VARCHAR(10),
		tocode_des	VARCHAR(20),
		sta 		VARCHAR(1),
		number 		DECIMAL(10,2),
		price 		DECIMAL(10,2),
		unit	 	VARCHAR(10),
		amount 		DECIMAL(10,2),
		srv 		DECIMAL(10,2),
		des 	  	DECIMAL(10,2),
		srv_rate	DECIMAL(10,2),
		des_rate 	DECIMAL(10,2),
		info1		VARCHAR(200),
		info2		VARCHAR(200),
		info3		VARCHAR(200),
		info4		VARCHAR(200),
		info5		VARCHAR(200)	
	);
	
	IF EXISTS(SELECT 1 FROM pos_master WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
		SELECT IFNULL(pcrec,'') INTO var_pcrec FROM pos_master WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		IF var_pcrec <> '' THEN
			INSERT tmp_pos_master SELECT * FROM pos_master WHERE pcrec = var_pcrec AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id AND sta <> 'X';
		ELSE
			INSERT tmp_pos_master SELECT * FROM pos_master WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id AND sta <> 'X';
		END IF;
	ELSE 
		SELECT IFNULL(pcrec,'') INTO var_pcrec FROM pos_master_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		IF var_pcrec <> '' THEN
			INSERT tmp_pos_master SELECT * FROM pos_master_history WHERE pcrec = var_pcrec AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account_history WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail_history WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id AND sta <> 'X';
		ELSE
			INSERT tmp_pos_master SELECT * FROM pos_master_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account_history WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail_history WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id AND sta <> 'X';
		END IF;	
	END IF;
	
	UPDATE tmp_pos_detail SET descript = CONCAT(descript,'@') WHERE SUBSTRING(flag,3,1) = '1';
	
	INSERT tmp_pos_bill_pre(pccode,pccode_des,id,TYPE,accnt,plu_code,plu_des,tocode,tocode_des,sta,number,price,unit,amount,srv,des,srv_rate,des_rate,info1,info2,info3,info4,info5)
		SELECT '','',id,'A',accnt,CODE,IFNULL(descript,''),tocode,'',sta,IFNULL(number,0),IFNULL(price,0),unit,IFNULL(amount,0),IFNULL(srv,0.00),IFNULL(dsc,0.00),IFNULL(amount4,0.00),IFNULL(amount5,0.00),'','','','','' FROM tmp_pos_detail;
	
	
	CREATE TABLE pos_bill(
		id BIGINT(16) NOT NULL AUTO_INCREMENT,
		tag 		CHAR(1),
		plu_code	VARCHAR(20),
		plu_des 	VARCHAR(100),
		number 		VARCHAR(20),
		price 		VARCHAR(20),
		unit 		VARCHAR(20),
		info1		VARCHAR(200) DEFAULT '',
		info2		VARCHAR(100) DEFAULT '',
		amount		VARCHAR(20),
		amount_d	DECIMAL(10,2),
		PRIMARY KEY(id)
	);
	
 	INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
 		SELECT 'A',plu_code,plu_des,CAST(IFNULL(number,'') AS CHAR),CAST(IFNULL(price,'') AS CHAR),unit,'','',CAST(IFNULL(amount,'') AS CHAR),IFNULL(amount,0)  FROM tmp_pos_bill_pre ;
	SELECT IFNULL(SUM(srv),0.00) INTO var_srv_amount FROM tmp_pos_detail;
	SELECT IFNULL(SUM(dsc),0.00) INTO var_dsc_amount FROM tmp_pos_detail;
	SELECT dsc,srv INTO var_dsc_rate,var_srv_rate FROM tmp_pos_master WHERE accnt = arg_accnt;
	IF var_dsc_amount <> 0 THEN
		INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
			SELECT 'A','DSC',CONCAT('折扣[',CAST(IFNULL(var_dsc_rate,0)*100 AS CHAR),'%]'),'','','','','',CAST(IFNULL(-1*var_dsc_amount,'') AS CHAR),-1*IFNULL(var_dsc_amount,0) ;-- FROM tmp_pos_bill_pre WHERE tocode <> '06';
	END IF;
	IF var_srv_amount <> 0 THEN
		INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
			SELECT 'A','SRV',CONCAT('服务费[',CAST(IFNULL(var_srv_rate,0)*100 AS CHAR),'%]'),'','','','','',CAST(IFNULL(var_srv_amount,'') AS CHAR),IFNULL(var_srv_amount,0) ; -- FROM tmp_pos_bill_pre WHERE tocode <> '06';	
	END IF;
	
	INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
		SELECT 'D','D01','合计','','','','','','',SUM(amount_d) FROM pos_bill WHERE tag = 'A';
		
	UPDATE pos_bill SET amount = CAST(amount_d AS CHAR) WHERE tag = 'D';
	INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
		SELECT 'E','','','','','','','','',0;
	INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
		SELECT 'E','','','','','','','','',0;
	SELECT amount_d INTO var_amount_total FROM pos_bill WHERE tag = 'D';
	INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
		SELECT 'F','F01',CONCAT('合计:',TO_UPPER_NUM(var_amount_total,2)),'','','','','',CAST(var_amount_total AS CHAR),var_amount_total;
 	-- INSERT pos_bill(tag,info1,info2,amount)
 	INSERT pos_bill(tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d)
		SELECT 'F','F02',CONCAT(descript,SPACE(2),IFNULL(cardno,''),'-',IFNULL(info2,'')),'','','','','',CAST(credit AS CHAR),credit FROM tmp_pos_account WHERE number = 2 AND sta = 'O'  ORDER BY id;
			
	SELECT tag,plu_code,plu_des,number,price,unit,info1,info2,amount,amount_d FROM pos_bill ORDER BY id;	
	
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_bill_pre;	
	DROP TABLE IF EXISTS pos_bill;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_bill_print_new`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_bill_print_new`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_bill_print_new`(
	IN arg_hotel_group_id 	BIGINT,
	IN arg_hotel_id		BIGINT,
	IN arg_accnt 		VARCHAR(20),
	IN arg_shift_o		VARCHAR(2),
	IN arg_type 		CHAR(1),
	IN arg_mode 		CHAR(1),
	IN arg_empno 		VARCHAR(20),
	IN arg_lang		VARCHAR(5),
	IN arg_billdefine	VARCHAR(10)
	)
BEGIN
	DECLARE var_pcrec 		VARCHAR(20);
	DECLARE	var_cashier		VARCHAR(20);
	DECLARE var_shift		VARCHAR(10);
	DECLARE var_market		VARCHAR(20);
	DECLARE var_maxid		BIGINT;
	DECLARE var_detailcount		INT;
	DECLARE var_gsts	     	INT;
	DECLARE var_amount		DECIMAL(10,2);
	DECLARE var_srv 		DECIMAL(10,2) DEFAULT 0;  
	DECLARE var_dsc			DECIMAL(10,2) DEFAULT 0;  
	DECLARE var_srvtotal		DECIMAL(10,2) DEFAULT 0;  
	DECLARE var_dectotal		DECIMAL(10,2) DEFAULT 0;
	DECLARE var_srv_bal		DECIMAL(10,2) DEFAULT 0;
	DECLARE var_dsc_bal		DECIMAL(10,2) DEFAULT 0;
	DECLARE var_tax_bal		DECIMAL(10,2) DEFAULT 0;  
	DECLARE var_lastrnum		BIGINT;
	DECLARE var_lastpnum		BIGINT;
	DECLARE var_accnt		VARCHAR(20);
	DECLARE var_pccode		VARCHAR(20);
	DECLARE var_blankline		INT;
	DECLARE var_delpagerows 	INT DEFAULT 0;
	DECLARE var_maxdetailid		BIGINT;
	DECLARE var_paycode		VARCHAR(20);
	DECLARE var_paydesc		VARCHAR(50);
	DECLARE var_credit 		DECIMAL(10,2);
	DECLARE var_info1		VARCHAR(50);
	DECLARE var_info2 		VARCHAR(50);
	DECLARE var_cardno 		VARCHAR(20);
	DECLARE var_dsc_rate		DECIMAL(10,2);
	DECLARE var_dsc_des		VARCHAR(20);
	DECLARE var_bank		VARCHAR(20);
	DECLARE var_catposting		VARCHAR(20);
	DECLARE var_payremark		VARCHAR(500);
	DECLARE var_biz_date		DATETIME;
	DECLARE var_ishistory		CHAR(1) DEFAULT 'T';
	DECLARE var_sta			CHAR(1);
	DECLARE var_tableno		VARCHAR(20);
	DECLARE var_credittotal		DECIMAL(10,2);
	DECLARE var_charge		DECIMAL(10,2) DEFAULT 0;
	DECLARE var_chargetotal		DECIMAL(10,2) DEFAULT 0;
	DECLARE var_isshow		CHAR(1);
	DECLARE var_pagecolums		INT;
	DECLARE var_billrows		INT;
	DECLARE done_cursor 		INT DEFAULT 0 ;
	DECLARE t_error 		INT DEFAULT 0 ;
	DECLARE var_master_cus CURSOR FOR SELECT accnt,IFNULL(lastpnum,0) FROM tmp_pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta <> 'X' AND pcrec = var_pcrec ORDER BY accnt;
	DECLARE var_account_cus CURSOR FOR SELECT a.paycode,a.descript,a.credit,a.info1,a.info2,a.cardno,a.bank,b.cat_posting FROM tmp_pos_account a LEFT JOIN code_transaction b ON a.paycode = b.code WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.sta <> 'X' AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND b.arrange_code = '98' ;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1; 
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;
	
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_bill_pre;
	
	CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
	CREATE TEMPORARY TABLE tmp_pos_account SELECT * FROM pos_account WHERE 1=2;
	CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2 ;	
--	insert a(msg) select CONCAT(arg_hotel_group_id,'/',arg_hotel_id,'/',arg_accnt,'/',arg_shift_o,'/',arg_type,'/',arg_mode,'/',arg_empno,'/',arg_lang);
	CREATE TEMPORARY TABLE tmp_pos_bill_pre(
		hotel_group_id	BIGINT,
		hotel_id 	BIGINT,
		id 		BIGINT NOT NULL AUTO_INCREMENT,
		pccode 		VARCHAR(20) DEFAULT NULL,
		pccode_des	VARCHAR(50) DEFAULT NULL,
		biz_date 	DATETIME    DEFAULT NULL,
		shift 		VARCHAR(10) DEFAULT NULL,
		shift_desc	VARCHAR(10) DEFAULT NULL,
		cashier 	VARCHAR(20) DEFAULT NULL,
		cashier_desc	VARCHAR(20) DEFAULT NULL,
		tableno	 	VARCHAR(20) DEFAULT NULL,
		tableno_desc 	VARCHAR(50) DEFAULT NULL,
		gsts 		INT 	    DEFAULT NULL,		
		TYPE 		CHAR(1)     DEFAULT NULL,
		accnt 		VARCHAR(20) DEFAULT NULL,
		plu_code	VARCHAR(20) DEFAULT NULL,
		plu_des		CHAR(20)    DEFAULT NULL,
		tocode		VARCHAR(10) DEFAULT NULL,
		tocode_des	VARCHAR(20) DEFAULT NULL,
		sta 		VARCHAR(1)  DEFAULT NULL,
		number 		DECIMAL(10,2) DEFAULT NULL,
		price 		DECIMAL(10,2) DEFAULT NULL,
		amount 		DECIMAL(10,2) DEFAULT NULL,
		srv 		DECIMAL(10,2) DEFAULT NULL,
		dsc 	  	DECIMAL(10,2) DEFAULT NULL,
		srv_rate	DECIMAL(10,2) DEFAULT NULL,
		dsc_rate 	DECIMAL(10,2) DEFAULT NULL,
		paydesc		VARCHAR(500) DEFAULT NULL,
		info1		VARCHAR(200) DEFAULT NULL,
		info2		VARCHAR(200) DEFAULT NULL,
		info3		VARCHAR(200) DEFAULT NULL,
		info4		VARCHAR(200) DEFAULT NULL,
		info5		VARCHAR(200) DEFAULT NULL,
		PRIMARY KEY(id)	
	);
	
	SELECT IFNULL(b.detail_rows,0) INTO var_pagecolums FROM bill_define a,bill_template b WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.code = arg_billdefine AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND a.template = b.code AND b.language = arg_lang;
	SET var_chargetotal = 0;
	IF EXISTS(SELECT 1 FROM pos_master WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
		SET var_ishistory = 'F';
		-- 当前数据考虑接打
		-- 判断是否有联单
		SELECT IFNULL(pcrec,''),IFNULL(lastrnum,0),pccode,biz_date,sta,shift,tableno INTO var_pcrec,var_lastrnum,var_pccode,var_biz_date,var_sta,var_shift,var_tableno FROM pos_master WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		IF (var_pcrec <> '') THEN
			INSERT tmp_pos_master SELECT * FROM pos_master WHERE pcrec = var_pcrec AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			-- 判断是否是新账单
			IF (arg_mode = 'N') THEN
				OPEN var_master_cus;
				FETCH var_master_cus INTO var_accnt,var_lastpnum;
				WHILE done_cursor<>1 DO
					-- 如果是打印新账单,则删除上一次打印所保留的服务费,折扣金额,下一次打印以本次为准.
					DELETE FROM pos_bill_addition WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = var_accnt;		
					INSERT tmp_pos_detail SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = var_accnt ;
					
					SELECT IFNULL(MAX(id),0) INTO var_maxdetailid FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = var_accnt;
					UPDATE pos_master SET lastpnum = var_maxdetailid WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = var_accnt;
					
					INSERT INTO pos_bill_addition(hotel_group_id,hotel_id,accnt,pcrec,amount,srv,tax,dsc,amount_bal,srv_bal,tax_bal,dsc_bal,create_user,create_datetime,modify_user,modify_datetime)
						SELECT arg_hotel_group_id,arg_hotel_id,var_accnt,var_pcrec,IFNULL(SUM(amount+srv+tax-dsc),0),IFNULL(SUM(srv),0),IFNULL(SUM(tax),0),IFNULL(SUM(dsc),0),0,0,0,0,arg_empno,NOW(),arg_empno,NOW() 
							FROM tmp_pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = var_accnt AND sta = 'I';
				FETCH var_master_cus INTO var_accnt,var_lastpnum;
				END WHILE; 
				CLOSE var_master_cus;
				SET done_cursor = 0; 
				SELECT SUM(amount+srv-dsc),SUM(srv),SUM(dsc) INTO var_chargetotal,var_srvtotal,var_dectotal FROM tmp_pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta <> 'X';			
			-- 接打
			ELSE
				OPEN var_master_cus;
				FETCH var_master_cus INTO var_accnt,var_lastpnum;
				WHILE done_cursor<>1 DO 
					INSERT tmp_pos_detail SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = var_accnt AND id > var_lastpnum;
					
					SELECT IFNULL(MAX(id),0) INTO var_maxdetailid FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = var_accnt;
					UPDATE pos_master SET lastpnum = var_maxdetailid WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = var_accnt;
					SELECT SUM(amount+srv-dsc),SUM(srv),SUM(dsc) INTO var_charge,var_srv,var_dsc FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = var_accnt AND sta <> 'X';
					SET var_chargetotal = var_chargetotal + var_charge,var_srvtotal = var_srvtotal + var_srv,var_dectotal = var_dectotal + var_dsc;
					
					IF EXISTS(SELECT 1 FROM pos_bill_addition WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = var_accnt) THEN
						UPDATE pos_bill_addition a,(SELECT accnt,IFNULL(SUM(amount+srv+tax-dsc),0) AS damount,IFNULL(SUM(srv),0) AS dsrv,IFNULL(SUM(tax),0) AS dtax,IFNULL(SUM(dsc),0) AS ddsc FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = var_accnt AND sta = 'I' AND id <= var_lastpnum) b
							SET a.amount_bal = a.damount - b.amount,a.srv_bal = a.dsrv - b.srv,a.tax_bal = a.dtax - b.tax,a.dsc_bal = a.ddsc - b.dsc WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = b.accnt;
						
						UPDATE pos_bill_addition a SET amount = var_charge,srv = var_srv,dsc = var_dsc WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = var_accnt;
					ELSE
						INSERT INTO pos_bill_addition(hotel_group_id,hotel_id,accnt,pcrec,amount,srv,tax,dsc,amount_bal,srv_bal,tax_bal,dsc_bal,create_user,create_datetime,modify_user,modify_datetime)
							SELECT arg_hotel_group_id,arg_hotel_id,var_accnt,var_pcrec,IFNULL(SUM(amount+srv+tax-dsc),0),IFNULL(SUM(srv),0),IFNULL(SUM(tax),0),IFNULL(SUM(dsc),0),0,0,0,0,arg_empno,NOW(),arg_empno,NOW() 
							FROM tmp_pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = var_accnt AND sta = 'I';					
					END IF;
					
				FETCH var_master_cus INTO var_accnt,var_lastpnum;
				END WHILE; 
				CLOSE var_master_cus;
				SET done_cursor = 0; 
			END IF;
			
			SELECT SUM(srv_bal),SUM(tax_bal),SUM(dsc_bal) INTO var_srv_bal,var_tax_bal,var_dsc_bal FROM pos_bill_addition WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND pcrec = var_pcrec;
		-- 未联单
		ELSE
			INSERT tmp_pos_master SELECT * FROM pos_master WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			-- 未联单,新账单
			IF (arg_mode = 'N') THEN
				DELETE FROM pos_bill_addition WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt;
				INSERT tmp_pos_detail SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND sta <> 'X';
				
				SELECT IFNULL(MAX(id),0) INTO var_maxdetailid FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt;
				UPDATE pos_master SET lastpnum = var_maxdetailid WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt;
				INSERT INTO pos_bill_addition(hotel_group_id,hotel_id,accnt,pcrec,amount,srv,tax,dsc,amount_bal,srv_bal,tax_bal,dsc_bal,create_user,create_datetime,modify_user,modify_datetime)
					SELECT arg_hotel_group_id,arg_hotel_id,arg_accnt,var_pcrec,IFNULL(SUM(amount+srv+tax-dsc),0),IFNULL(SUM(srv),0),IFNULL(SUM(tax),0),IFNULL(SUM(dsc),0),0,0,0,0,arg_empno,NOW(),arg_empno,NOW() 
						FROM tmp_pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND sta = 'I';
			-- 未联单,接打
			ELSE
				SELECT IFNULL(lastpnum,0) INTO var_lastpnum FROM tmp_pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND sta <> 'X';
				INSERT tmp_pos_detail SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND id > var_lastpnum;
				
				SELECT IFNULL(MAX(id),0) INTO var_maxdetailid FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt;
				UPDATE pos_master SET lastpnum = var_maxdetailid WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt;
					
				IF EXISTS(SELECT 1 FROM pos_bill_addition WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt) THEN
					UPDATE pos_bill_addition a,(SELECT accnt,IFNULL(SUM(amount+srv+tax-dsc),0) AS damount,IFNULL(SUM(srv),0) AS dsrv,IFNULL(SUM(tax),0) AS dtax,IFNULL(SUM(dsc),0) AS ddsc FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND sta = 'I' AND id <= var_lastpnum) b
						SET a.amount_bal = b.damount - a.amount,a.srv_bal = b.dsrv - a.srv,a.tax_bal = b.dtax - a.tax,a.dsc_bal = b.ddsc - a.dsc 
						WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = b.accnt;
				ELSE
					INSERT INTO pos_bill_addition(hotel_group_id,hotel_id,accnt,pcrec,amount,srv,tax,dsc,amount_bal,srv_bal,tax_bal,dsc_bal,create_user,create_datetime,modify_user,modify_datetime)
						SELECT arg_hotel_group_id,arg_hotel_id,arg_accnt,var_pcrec,IFNULL(SUM(amount+srv+tax-dsc),0),IFNULL(SUM(srv),0),IFNULL(SUM(tax),0),IFNULL(SUM(dsc),0),0,0,0,0,arg_empno,NOW(),arg_empno,NOW() 
						FROM tmp_pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND sta = 'I';					
				END IF;			
			END IF;
			SELECT SUM(amount+srv-dsc),SUM(srv),SUM(dsc) INTO var_chargetotal,var_srvtotal,var_dectotal FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND sta <> 'X';	
			UPDATE pos_bill_addition a SET amount = var_chargetotal,srv = var_srvtotal,dsc = var_dectotal WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt;			
					
			SELECT SUM(srv_bal),SUM(tax_bal),SUM(dsc_bal) INTO var_srv_bal,var_tax_bal,var_dsc_bal FROM pos_bill_addition WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt;
		END IF;
	-- 历史账单,暂时不考虑接打
	ELSE
		-- 历史数据不管,全部不用接打
		SELECT IFNULL(pcrec,''),biz_date,sta,shift,tableno INTO var_pcrec,var_biz_date,var_sta,var_shift,var_tableno FROM pos_master_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		IF var_pcrec <> '' THEN
			INSERT tmp_pos_master SELECT * FROM pos_master_history WHERE pcrec = var_pcrec AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account_history WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail_history WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		ELSE
			INSERT tmp_pos_master SELECT * FROM pos_master_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		END IF;	
		SELECT SUM(amount+srv-dsc),SUM(srv),SUM(dsc) INTO var_chargetotal,var_srvtotal,var_dectotal FROM tmp_pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = var_accnt AND sta <> 'X';			
	END IF;
	-- 不打套餐明细
	DELETE FROM tmp_pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND SUBSTRING(flag,10,1) = '1';
	UPDATE tmp_pos_detail SET descript = SUBSTRING(descript,4) WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND descript LIKE '[退]%';
--	update tmp_pos_detail a,tmp_pos_master b set a.descript = concat('[',ifnull(1-b.dsc,0),']',a.descript) where a.hotel_group_id = b.hotel_group_id and a.hotel_id = b.hotel_id and a.hotel_group_id = arg_hotel_group_id and a.hotel_id = arg_hotel_id and a.accnt = b.accnt and b.dsc <> 0 and substring(b.flag1,5,1) <> '1' AND SUBSTRING(b.flag1,1,1) <> '1';
--	UPDATE tmp_pos_detail SET descript = CONCAT('[',IFNULL(1-amount5,0),']',descript) WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND dsc <> 0 AND (SUBSTRING(flag1,5,1) = '1' or SUBSTRING(flag1,1,1) = '1');
	SET var_delpagerows = 0;
	IF (arg_mode <> 'N') THEN
		IF var_lastrnum > 0 THEN
			-- 到上一次为止已经打了多少行(var_lastrnum),插入空行
			SET var_blankline = 1;
			-- 20为账单一页所能打的明细行数,总空行除以明细行数取余,是因为假如前面几页全是空行,那是不用打印的,避免纸多次放入,但什么都没打印的情况
			SET var_delpagerows = IFNULL(var_lastrnum DIV var_pagecolums,0);
			SET var_lastrnum = IFNULL(MOD(var_lastrnum,var_pagecolums),var_lastrnum);
		--	select var_delpagerows,var_lastrnum;
			WHILE var_blankline <= var_lastrnum DO
				INSERT tmp_pos_bill_pre(hotel_group_id,hotel_id,pccode,biz_date,shift,tableno,TYPE) SELECT arg_hotel_group_id,arg_hotel_id,var_pccode,var_biz_date,var_shift,var_tableno,'A';
				SET var_blankline = var_blankline + 1;
			END WHILE;
		END IF;	
	END IF;
	
	SELECT dsc INTO var_dsc_rate FROM tmp_pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt;
	IF var_dsc_rate <> 0 THEN
		SET var_dsc_des = CONCAT('[',IFNULL(1-var_dsc_rate,0),']');
	ELSE
		SET var_dsc_des = '';
	END IF;
	
	-- 添加点菜明细	
	INSERT INTO tmp_pos_bill_pre(hotel_group_id,hotel_id,pccode,pccode_des,shift,biz_date,tableno,TYPE,accnt,plu_code,plu_des,tocode,tocode_des,sta,number,price,amount,srv,dsc,srv_rate,dsc_rate,paydesc,info1,info2,info3,info4,info5)
		SELECT arg_hotel_group_id,arg_hotel_id,var_pccode,'',var_shift,var_biz_date,var_tableno,'A',arg_accnt,CODE,IFNULL(descript,''),tocode,'',sta,SUM(IFNULL(number,0)),IFNULL(price,0),SUM(IFNULL(amount,0)),SUM(IFNULL(srv,0.00)),SUM(IFNULL(dsc,0.00)),IFNULL(amount4,0.00),IFNULL(amount5,0.00),'','','','','','' 
			FROM tmp_pos_detail WHERE sta = 'I' AND TRIM(CODE) <> 'ML' GROUP BY CODE,descript,tocode,price,amount4,amount5 HAVING SUM(IFNULL(number,0)) <> 0;
	IF EXISTS(SELECT 1 FROM tmp_pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND TRIM(CODE) <> 'ML') THEN
		INSERT INTO tmp_pos_bill_pre(hotel_group_id,hotel_id,pccode,pccode_des,shift,biz_date,tableno,TYPE,accnt,plu_code,plu_des,tocode,tocode_des,sta,number,price,amount,srv,dsc,srv_rate,dsc_rate,paydesc,info1,info2,info3,info4,info5)
			SELECT arg_hotel_group_id,arg_hotel_id,var_pccode,'',var_shift,var_biz_date,var_tableno,'B',arg_accnt,'XFXJ',' *应收小计*','','','I',NULL,NULL,IFNULL(SUM(amount),0.00),IFNULL(SUM(srv),0.00),IFNULL(SUM(srv),0.00),0,0,'','','','','','' FROM tmp_pos_detail WHERE sta = 'I';
		INSERT INTO tmp_pos_bill_pre(hotel_group_id,hotel_id,pccode,pccode_des,shift,biz_date,tableno,TYPE,accnt,plu_code,plu_des,tocode,tocode_des,sta,number,price,amount,srv,dsc,srv_rate,dsc_rate,paydesc,info1,info2,info3,info4,info5)
			SELECT arg_hotel_group_id,arg_hotel_id,var_pccode,'',var_shift,var_biz_date,var_tableno,'B',arg_accnt,'FWF',' *服务费*','','','I',NULL,NULL,IFNULL(SUM(srv),0.00)+var_srv_bal,IFNULL(SUM(srv),0.00),0,0,0,'','','','','','' FROM tmp_pos_detail WHERE sta = 'I';
		INSERT INTO tmp_pos_bill_pre(hotel_group_id,hotel_id,pccode,pccode_des,shift,biz_date,tableno,TYPE,accnt,plu_code,plu_des,tocode,tocode_des,sta,number,price,amount,srv,dsc,srv_rate,dsc_rate,paydesc,info1,info2,info3,info4,info5)
			SELECT arg_hotel_group_id,arg_hotel_id,var_pccode,'',var_shift,var_biz_date,var_tableno,'B',arg_accnt,'DSC',CONCAT(' *折扣*',var_dsc_des),'','','I',NULL,NULL,-1*(IFNULL(SUM(dsc)+var_dsc_bal,0.00)),IFNULL(SUM(dsc),0.00),0,0,0,'','','','','','' FROM tmp_pos_detail WHERE sta = 'I';
		INSERT INTO tmp_pos_bill_pre(hotel_group_id,hotel_id,pccode,pccode_des,shift,biz_date,tableno,TYPE,accnt,plu_code,plu_des,tocode,tocode_des,sta,number,price,amount,srv,dsc,srv_rate,dsc_rate,paydesc,info1,info2,info3,info4,info5)
			SELECT arg_hotel_group_id,arg_hotel_id,var_pccode,'',var_shift,var_biz_date,var_tableno,'B',arg_accnt,'XFXJ',' *应收合计*','','','I',NULL,NULL,IFNULL(var_chargetotal,0.00),IFNULL(var_srvtotal,0.00),IFNULL(var_dectotal,0.00),0,0,'','','','','','';
	END IF;
	IF (var_srv_bal <> 0) THEN
		INSERT INTO tmp_pos_bill_pre(hotel_group_id,hotel_id,pccode,pccode_des,shift,biz_date,tableno,TYPE,accnt,plu_code,plu_des,tocode,tocode_des,sta,number,price,amount,srv,dsc,srv_rate,dsc_rate,paydesc,info1,info2,info3,info4,info5)
			SELECT arg_hotel_group_id,arg_hotel_id,var_pccode,'',var_shift,var_biz_date,var_tableno,'B',arg_accnt,'FWF',' *服务费*','','','I',NULL,NULL,IFNULL(SUM(var_srv_bal),0.00),IFNULL(SUM(var_srv_bal),0.00),0,0,0,'','','','','','';
	END IF;
 --	if (var_tax_bal <> 0) then	
 --		INSERT INTO tmp_pos_bill_pre(hotel_group_id,hotel_id,pccode,pccode_des,shift,biz_date,tableno,TYPE,accnt,plu_code,plu_des,tocode,tocode_des,sta,number,price,amount,srv,dsc,srv_rate,dsc_rate,paydesc,info1,info2,info3,info4,info5)
 --			SELECT arg_hotel_group_id,arg_hotel_id,var_pccode,'',var_shift,var_biz_date,var_tableno,'B',arg_accnt,'SF',' *税费*','080','','I',NULL,NULL,IFNULL(SUM(var_tax_bal),0.00),IFNULL(SUM(var_tax_bal),0.00),0,0,0,'','','','','','';
 --	end if;
	IF (var_dsc_bal <> 0) THEN	
		INSERT INTO tmp_pos_bill_pre(hotel_group_id,hotel_id,pccode,pccode_des,shift,biz_date,tableno,TYPE,accnt,plu_code,plu_des,tocode,tocode_des,sta,number,price,amount,srv,dsc,srv_rate,dsc_rate,paydesc,info1,info2,info3,info4,info5)
			SELECT arg_hotel_group_id,arg_hotel_id,var_pccode,'',var_shift,var_biz_date,var_tableno,'B',arg_accnt,'DSC',CONCAT(' *折扣*',var_dsc_des),'','','I',NULL,NULL,-1*IFNULL(SUM(var_dsc_bal),0.00),IFNULL(SUM(var_dsc_bal),0.00),0,0,0,'','','','','','';		
	END IF;
	IF (var_srv_bal <> 0 OR var_tax_bal <> 0 OR var_dsc_bal <> 0) THEN
		INSERT INTO tmp_pos_bill_pre(hotel_group_id,hotel_id,pccode,pccode_des,shift,biz_date,tableno,TYPE,accnt,plu_code,plu_des,tocode,tocode_des,sta,number,price,amount,srv,dsc,srv_rate,dsc_rate,paydesc,info1,info2,info3,info4,info5)
			SELECT arg_hotel_group_id,arg_hotel_id,var_pccode,'',var_shift,var_biz_date,var_tableno,'B',arg_accnt,'XFXJ',' *应收合计*','','','I',NULL,NULL,IFNULL(var_chargetotal,0.00),IFNULL(var_srvtotal,0.00),IFNULL(var_dectotal,0.00),0,0,'','','','','','';		
	END IF;
	-- 如果是已经结账的,则添加付款方式
	IF var_sta = 'O' THEN
		SELECT IFNULL(COUNT(*),0) INTO var_billrows FROM tmp_pos_bill_pre WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
		-- 当第一张刚好全部打完,而第二张接打付款方式时,没有记录会导致付款方式无法打印
		IF (var_billrows = 0) THEN
			INSERT tmp_pos_bill_pre(hotel_group_id,hotel_id,pccode,biz_date,shift,tableno,TYPE) SELECT arg_hotel_group_id,arg_hotel_id,var_pccode,var_biz_date,var_shift,var_tableno,'A';
		END IF;
		SELECT create_user INTO var_cashier FROM tmp_pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND number = 2 AND sta = 'O' ORDER BY id DESC LIMIT 1;
		SET var_payremark = '付款:  ';
		SET var_credittotal = 0;
		OPEN var_account_cus;
		FETCH var_account_cus INTO var_paycode,var_paydesc,var_credit,var_info1,var_info2,var_cardno,var_bank,var_catposting;
		WHILE done_cursor<>1 DO 
			IF (var_catposting = 'RCV') THEN
				SET var_payremark = CONCAT(var_payremark,var_paydesc,' ',IFNULL(var_credit,0),'(余额:',IFNULL(var_bank,0)-IFNULL(var_credit,0),');');
			ELSEIF(var_catposting = 'TF' OR var_catposting = 'TA') THEN
				SET var_payremark = CONCAT(var_payremark,var_paydesc,' ',IFNULL(var_credit,0),'-',var_cardno,'-',var_info2,';');
			ELSEIF(var_catposting = 'ENT' OR var_catposting = 'DSC') THEN
				SET var_payremark = CONCAT(var_payremark,var_paydesc,' ',IFNULL(var_credit,0),'-',var_info1,';');
			ELSE
				SET var_payremark = CONCAT(var_payremark,var_paydesc,' ',IFNULL(var_credit,0),';',CHAR(10),SPACE(12));
			END IF;
			SET var_credittotal = var_credittotal + IFNULL(var_credit,0);
		FETCH var_account_cus INTO var_paycode,var_paydesc,var_credit,var_info1,var_info2,var_cardno,var_bank,var_catposting;
		END WHILE; 
		CLOSE var_account_cus;
		UPDATE tmp_pos_bill_pre SET paydesc = var_payremark ;
		UPDATE tmp_pos_bill_pre SET cashier = var_cashier WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
		UPDATE tmp_pos_bill_pre a,USER b SET cashier_desc = b.name WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND a.cashier = b.code;
		UPDATE tmp_pos_bill_pre SET info1 = CONCAT('合计:  ',TO_UPPER_NUM(var_credittotal,2)) WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	END IF;
	-- 打印当前单子是,修改主单上打印的函数var_delpagerows*20 + var_maxid为:删除的页数*每页行数+本次打印行数
	IF var_ishistory = 'F' THEN
	--	SELECT MAX(id) INTO var_maxid FROM tmp_pos_bill_pre WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
		SELECT IFNULL(COUNT(*),0) INTO var_detailcount FROM tmp_pos_bill_pre WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
		IF (var_pcrec <> '') THEN
			UPDATE pos_master SET lastrnum = var_delpagerows*var_pagecolums + var_detailcount WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND pcrec = var_pcrec;
		ELSE
			UPDATE pos_master SET lastrnum = var_delpagerows*var_pagecolums + var_detailcount WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt;
		END IF;		
	END IF;
		
	-- 更新一些中文描述信息,比如营业点名称,班次描述
	SELECT SUM(gsts) INTO var_gsts FROM tmp_pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	UPDATE tmp_pos_bill_pre SET gsts = var_gsts WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	UPDATE tmp_pos_bill_pre a,pos_pccode b SET pccode_des = b.descript WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND a.pccode = b.code;
	UPDATE tmp_pos_bill_pre a,code_base b SET shift_desc = b.descript WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND b.parent_code = 'pos_cashier' AND a.shift = b.code;
	UPDATE tmp_pos_bill_pre a,pos_pccode_table b SET tableno_desc = b.descript WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND b.pccode = var_pccode AND a.tableno = b.code;
	IF (arg_mode = 'N') THEN
		SET var_isshow = 'Y';
	ELSEIF (arg_mode <> 'N' AND var_lastrnum = 0) THEN
		SET var_isshow = 'Y';
	ELSE
		SET var_isshow = 'N';
	END IF;
	
	SELECT id,hotel_group_id,hotel_id,pccode,pccode_des,biz_date,shift,shift_desc,cashier,cashier_desc,tableno,tableno_desc,gsts,TYPE,accnt,plu_code,plu_des,sta,number,price,amount,srv,dsc,srv_rate,dsc_rate,paydesc,info1,info2,info3,info4,var_isshow AS isShow FROM tmp_pos_bill_pre ORDER BY id;
	
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_bill_pre;	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_bill_print_small`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_bill_print_small`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_bill_print_small`(
	IN arg_hotel_id		BIGINT,
	IN arg_hotel_group_id 	BIGINT,
	IN arg_accnt 		VARCHAR(20),
	IN arg_shift_o		VARCHAR(2),
	IN arg_type 		CHAR(1),
	IN arg_mode 		CHAR(1),
	IN arg_empno 		VARCHAR(20)
	)
BEGIN
	DECLARE var_pcrec 		VARCHAR(20);
	DECLARE	var_cashier		VARCHAR(20);
	DECLARE var_shift		VARCHAR(10);
	DECLARE var_shift_o_des		VARCHAR(10);
	DECLARE var_date1		DATETIME;
	DECLARE var_market		VARCHAR(20);
	DECLARE var_maxid		BIGINT;
	DECLARE var_gsts	     	INT;
	
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_bill_pre;
	DROP TABLE IF EXISTS pos_bill;
	
	CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
	CREATE TEMPORARY TABLE tmp_pos_account SELECT * FROM pos_account WHERE 1=2;
	CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2 ;	
	
	CREATE TEMPORARY TABLE tmp_pos_bill_pre(
		pccode 		VARCHAR(20),
		pccode_des	VARCHAR(50),
		id 		BIGINT,
		TYPE 		CHAR(1),
		accnt 		VARCHAR(20),
		plu_code	VARCHAR(20),
		plu_des		CHAR(20),
		tocode		VARCHAR(10),
		tocode_des	VARCHAR(20),
		sta 		VARCHAR(1),
		number 		DECIMAL(10,2),
		price 		DECIMAL(10,2),
		amount 		DECIMAL(10,2),
		srv 		DECIMAL(10,2),
		des 	  	DECIMAL(10,2),
		srv_rate	DECIMAL(10,2),
		des_rate 	DECIMAL(10,2),
		info1		VARCHAR(200),
		info2		VARCHAR(200),
		info3		VARCHAR(200),
		info4		VARCHAR(200),
		info5		VARCHAR(200)	
	);
	
	IF EXISTS(SELECT 1 FROM pos_master WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
		SELECT IFNULL(pcrec,'') INTO var_pcrec FROM pos_master WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		IF var_pcrec <> '' THEN
			INSERT tmp_pos_master SELECT * FROM pos_master WHERE pcrec = var_pcrec AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		ELSE
			INSERT tmp_pos_master SELECT * FROM pos_master WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		END IF;
	ELSE 
		SELECT IFNULL(pcrec,'') INTO var_pcrec FROM pos_master_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		IF var_pcrec <> '' THEN
			INSERT tmp_pos_master SELECT * FROM pos_master_history WHERE pcrec = var_pcrec AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account_history WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail_history WHERE accnt IN (SELECT accnt FROM tmp_pos_master) AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		ELSE
			INSERT tmp_pos_master SELECT * FROM pos_master_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_account SELECT * FROM pos_account_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			INSERT tmp_pos_detail SELECT * FROM pos_detail_history WHERE accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		END IF;	
	END IF;
	UPDATE tmp_pos_detail SET descript = CONCAT(descript,'@') WHERE SUBSTRING(flag,3,1) = '1';
	
	INSERT tmp_pos_bill_pre(pccode,pccode_des,id,TYPE,accnt,plu_code,plu_des,tocode,tocode_des,sta,number,price,amount,srv,des,srv_rate,des_rate,info1,info2,info3,info4,info5)
		SELECT '','',id,'A',accnt,CODE,IFNULL(descript,''),tocode,'',sta,IFNULL(number,0),IFNULL(price,0),IFNULL(amount,0),IFNULL(srv,0.00),IFNULL(dsc,0.00),IFNULL(amount4,0.00),IFNULL(amount5,0.00),'','','','','' FROM tmp_pos_detail;
	CREATE TABLE pos_bill(
		id BIGINT(16) NOT NULL AUTO_INCREMENT,
		tag 		CHAR(1),
		info1		VARCHAR(200) DEFAULT '',
		info2		VARCHAR(100) DEFAULT '',
		amount		DECIMAL(10,2),
		PRIMARY KEY(id)
	);
	-- CAST(IFNULL(gsts,0) AS CHAR)
	SELECT SUM(gsts) INTO var_gsts FROM tmp_pos_master WHERE sta = 'O'; 
	SELECT MAX(id) INTO var_maxid FROM tmp_pos_account WHERE sta = 'O' AND number = 2;
	SELECT create_user,shift,create_datetime INTO var_cashier,var_shift,var_date1 FROM tmp_pos_account WHERE id = var_maxid AND sta = 'O' AND number = 2 ;
	SELECT market INTO var_market FROM tmp_pos_master WHERE accnt = arg_accnt;
	SELECT IFNULL(NAME,'') INTO var_cashier FROM USER WHERE CODE = var_cashier AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
	SELECT IFNULL(descript,'') INTO var_shift FROM code_base WHERE parent_code = 'pos_cashier' AND CODE = var_shift AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
	SELECT IFNULL(descript,'') INTO var_market FROM code_base WHERE parent_code = 'pos_market' AND CODE = var_market AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
	INSERT pos_bill(tag,info1,info2,amount)
		SELECT '0',DATE_FORMAT(a.create_datetime, '%Y-%m-%d %h:%i:%s'),b.name,0 FROM tmp_pos_master a,USER b WHERE accnt = arg_accnt AND a.create_user = b.code AND b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id;
	INSERT pos_bill(tag,info1,info2,amount)
		SELECT 'A',CONCAT(SPACE(5-CHAR_LENGTH(get_data_cancel_zero(number))),CAST(get_data_cancel_zero(number) AS CHAR),SPACE(5),plu_des),CAST(amount AS CHAR),amount FROM tmp_pos_bill_pre WHERE tocode <> '06';
		
	IF EXISTS(SELECT 1 FROM tmp_pos_bill_pre WHERE tocode <> '06') THEN
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'B','本次货品总价',CAST(ROUND(IFNULL(SUM(amount),00),0) AS CHAR),ROUND(SUM(amount),0) FROM tmp_pos_bill_pre WHERE tocode <> '06';
	END IF;
	IF EXISTS(SELECT 1 FROM tmp_pos_bill_pre WHERE tocode = '06') THEN
		INSERT pos_bill(tag,info1,info2,amount)	
			SELECT 'C','服务费',CAST(IFNULL(SUM(amount),00) AS CHAR),SUM(amount) FROM tmp_pos_bill_pre WHERE tocode = '06';
	END IF;
	IF EXISTS(SELECT 1 FROM tmp_pos_account WHERE paycode = '9070' AND sta = 'O' AND number = 2) THEN
		INSERT pos_bill(tag,info1,info2,amount)	
			SELECT 'D','手工折扣',CAST(-1*IFNULL(SUM(credit),0.00) AS CHAR),-1*SUM(credit) FROM tmp_pos_account WHERE number = 2 AND paycode = '9070' AND sta = 'O';
	END IF;
	INSERT pos_bill(tag,info1,info2,amount)
		SELECT 'E','','',0;
	
	INSERT 	pos_bill(tag,info1,info2,amount)
		SELECT 'F','合计',CAST(ROUND(SUM(amount),0) AS CHAR),ROUND(SUM(amount),0) FROM pos_bill WHERE tag IN('B','C','D');
	IF arg_type = '1' THEN	
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'G',CONCAT(DATE_FORMAT(var_date1, '%Y-%m-%d %h:%i:%s'),SPACE(3),var_shift),var_cashier,0;
			
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'H',CONCAT('付款(',var_market,'*',var_gsts,')'),'',0;
			
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'I',IF(paycode = '9700',CONCAT(SPACE(3),descript,SPACE(3),IFNULL(info2,'')),CONCAT(SPACE(3),descript,SPACE(3),IFNULL(cardno,''))),credit,credit FROM tmp_pos_account WHERE number = 2 AND sta = 'O' AND paycode <> '9070' ORDER BY id;
			
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'J','','',0;
			
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'K','其中:','',0;
			
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'L',CONCAT(SPACE(3),a.descript),CAST(SUM(b.amount) AS CHAR),SUM(b.amount) FROM code_base a,tmp_pos_bill_pre b WHERE a.parent_code = 'pos_rep_item' 
				AND a.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND a.code = b.tocode GROUP BY b.tocode ORDER BY a.list_order,a.code;
		IF EXISTS(SELECT 1 FROM tmp_pos_account WHERE paycode = '9070' AND sta = 'O' AND number = 2) THEN
			INSERT pos_bill(tag,info1,info2,amount)	
				SELECT 'M','手工折扣',CAST(-1*IFNULL(SUM(credit),0.00) AS CHAR),-1*SUM(credit) FROM tmp_pos_account WHERE number = 2 AND paycode = '9070' AND sta = 'O';
		END IF;
	ELSEIF arg_type = '2' THEN
		SELECT IFNULL(descript,'') INTO var_shift_o_des FROM code_base WHERE parent_code = 'pos_cashier' AND CODE = arg_shift_o AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		INSERT pos_bill(tag,info1,info2,amount)
			SELECT 'G',CONCAT(DATE_FORMAT(NOW(), '%Y-%m-%d %h:%i:%s'),SPACE(3),var_shift_o_des),arg_empno,0;		
	END IF;
		
	SELECT tag,info1,info2,amount FROM pos_bill ORDER BY id;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_bill_pre;	
	DROP TABLE IF EXISTS pos_bill;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_biz_hotel_analysis`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_biz_hotel_analysis`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_biz_hotel_analysis`(IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
  IN arg_biz_date		DATETIME)
    SQL SECURITY INVOKER
label_0:
BEGIN
	DECLARE var_bizdate DATETIME;
	DECLARE i INT DEFAULT 0;
	DECLARE j INT DEFAULT 0;
  DECLARE var_sql		VARCHAR(1024);
  
    DECLARE var_hotel_id BIGINT DEFAULT 0;
    DECLARE t_error INTEGER DEFAULT 0;  
    DECLARE done_cursor INT DEFAULT 0 ;
    DECLARE var_cursor CURSOR FOR SELECT id FROM hotel WHERE hotel_group_id = arg_hotel_group_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1; 
   
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_pccode;
      DROP TEMPORARY TABLE IF EXISTS tmp_code_tran;                 
      CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
      CREATE TEMPORARY TABLE tmp_pos_account SELECT * FROM pos_account WHERE 1=2;
      CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2 ;
      CREATE TEMPORARY TABLE tmp_code_tran SELECT * FROM  code_transaction  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND arrange_code > '9' ;
      
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_analysis ;
      CREATE TEMPORARY TABLE tmp_pos_analysis (
		  `hotel_group_id` BIGINT(16) NOT NULL,
		  `hotel_id` BIGINT(16) NOT NULL,
		  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
		  `biz_date` DATETIME NOT NULL COMMENT '营业日期',
      `code`  VARCHAR(10) DEFAULT '' ,
		  `number`  DECIMAL(12,2) DEFAULT '0' ,
		  `gsts`   DECIMAL(12,2) DEFAULT '0' ,
		  `charge` DECIMAL(12,2) DEFAULT '0' ,
		  `gstsAvg` DECIMAL(12,2) DEFAULT '0' ,
		  `Atran` DECIMAL(12,2) DEFAULT '0' ,
		  `Btran` DECIMAL(12,2) DEFAULT '0' ,
		  `Ctran` DECIMAL(12,2) DEFAULT '0' ,
      `Ipmstran` DECIMAL(12,2) DEFAULT '0' , 
      `Enttran` DECIMAL(12,2) DEFAULT '0' ,
      `Othertran` DECIMAL(12,2) DEFAULT '0' ,
		  PRIMARY KEY (`id`)
		  );
IF(arg_hotel_id = 0) THEN
     OPEN var_cursor;
     SET done_cursor = 0;
     FETCH var_cursor INTO  var_hotel_id;
     
     WHILE done_cursor<>1 DO 
          
			IF EXISTS(SELECT 1 FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = var_hotel_id AND catalog = 'system' AND item = 'pos_biz_date') THEN
				          SELECT set_value INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = var_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
			  ELSE
				      SET var_bizdate = arg_biz_date;
			  END IF;		
		    DROP TEMPORARY TABLE IF EXISTS tmp_pos_pccode;
					CREATE TEMPORARY TABLE tmp_pos_pccode SELECT * FROM pos_pccode WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = var_hotel_id ;
					 SELECT TO_DAYS(arg_biz_date)-TO_DAYS(var_bizdate) INTO i;
							IF i=0 THEN
								 INSERT INTO tmp_pos_master SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = var_hotel_id  AND biz_date = arg_biz_date ;
								 INSERT INTO tmp_pos_account SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id  AND hotel_id = var_hotel_id  AND biz_date = arg_biz_date ;
								 INSERT INTO tmp_pos_detail SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id  AND hotel_id = var_hotel_id   AND biz_date = arg_biz_date ;
							
							ELSE
								 INSERT INTO tmp_pos_master SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id  AND hotel_id = var_hotel_id AND biz_date = arg_biz_date ;
								 INSERT INTO tmp_pos_account SELECT * FROM pos_account_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = var_hotel_id  AND biz_date = arg_biz_date ;
								 INSERT INTO tmp_pos_detail SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id  AND hotel_id = var_hotel_id  AND biz_date = arg_biz_date ;
							END IF ;
					 
							INSERT tmp_pos_analysis(hotel_group_id,hotel_id,biz_date,CODE,number,charge )
							SELECT arg_hotel_group_id, var_hotel_id,arg_biz_date,b.code,IFNULL(COUNT(e.accnt),0) ,IFNULL(SUM(e.charge),0)
							FROM 
							tmp_pos_pccode b,tmp_pos_master e 
							WHERE e.pccode = b.code
							GROUP BY b.code ;
							
							INSERT tmp_pos_analysis(hotel_group_id,hotel_id,biz_date,CODE,gsts,gstsAvg)
							SELECT arg_hotel_group_id, var_hotel_id,arg_biz_date,b.code,IFNULL(SUM(e.gsts),0),IFNULL(ROUND(SUM(e.charge)/SUM(e.gsts),2),0)
							FROM
							tmp_pos_pccode b ,tmp_pos_master e 
							WHERE e.pccode = b.code  AND e.sta <> 'X' AND e.sta <> 'S'
							GROUP BY b.code ;
					
					
					 INSERT tmp_pos_analysis  (hotel_group_id,hotel_id,biz_date,CODE,Atran)
							SELECT arg_hotel_group_id, var_hotel_id,arg_biz_date,d.pccode,IFNULL(SUM(c.credit) ,0)
							FROM
								 tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e,tmp_code_tran f
								WHERE c.accnt = d.accnt AND c.paycode = f.code AND d.sta = 'O'  
								AND c.sta = 'O' AND c.number = 2 
								AND c.pccode = e.code AND f.category_code = 'A'
								GROUP BY d.pccode;
					 
					INSERT tmp_pos_analysis  (hotel_group_id,hotel_id,biz_date,CODE,Btran)
							SELECT arg_hotel_group_id, var_hotel_id,arg_biz_date,d.pccode,IFNULL(SUM(c.credit) ,0)
							FROM
								 tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e,tmp_code_tran f
								WHERE c.accnt = d.accnt AND c.paycode = f.code AND d.sta = 'O'  
								AND c.sta = 'O' AND c.number = 2 
								AND c.pccode = e.code AND f.category_code IN ('C','D')
								GROUP BY d.pccode;
					
					INSERT tmp_pos_analysis  (hotel_group_id,hotel_id,biz_date,CODE,Ctran)
							SELECT arg_hotel_group_id, var_hotel_id,arg_biz_date,d.pccode,IFNULL(SUM(c.credit) ,0)
							FROM
								 tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e,tmp_code_tran f
								WHERE c.accnt = d.accnt AND c.paycode = f.code AND d.sta = 'O'  
								AND c.sta = 'O' AND c.number = 2 
								AND c.pccode = e.code AND f.category_code = 'E'
								GROUP BY d.pccode;
					
					INSERT tmp_pos_analysis  (hotel_group_id,hotel_id,biz_date,CODE,Ipmstran)
							SELECT arg_hotel_group_id, var_hotel_id,arg_biz_date,d.pccode,IFNULL(SUM(c.credit) ,0)
							FROM
								 tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e,tmp_code_tran f
								WHERE c.accnt = d.accnt AND c.paycode = f.code AND d.sta = 'O'  
								AND c.sta = 'O' AND c.number = 2 
								AND c.pccode = e.code AND f.category_code IN ('I','J')
								GROUP BY d.pccode;
					
					INSERT tmp_pos_analysis  (hotel_group_id,hotel_id,biz_date,CODE,Enttran)
							SELECT arg_hotel_group_id, var_hotel_id,arg_biz_date,d.pccode,IFNULL(SUM(c.credit) ,0)
							FROM
								 tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e,tmp_code_tran f
								WHERE c.accnt = d.accnt AND c.paycode = f.code AND d.sta = 'O'  
								AND c.sta = 'O' AND c.number = 2 
								AND c.pccode = e.code AND f.category_code = 'H'
								GROUP BY d.pccode;
					
					INSERT tmp_pos_analysis  (hotel_group_id,hotel_id,biz_date,CODE,Othertran)
							SELECT arg_hotel_group_id, var_hotel_id,arg_biz_date,d.pccode,IFNULL(SUM(c.credit) ,0)
							FROM
								 tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e,tmp_code_tran f
								WHERE c.accnt = d.accnt AND c.paycode = f.code AND d.sta = 'O'  
								AND c.sta = 'O' AND c.number = 2 
								AND c.pccode = e.code AND f.category_code NOT IN ('A','C','D','E','I','J','H')
								GROUP BY d.pccode;
     
     TRUNCATE TABLE tmp_pos_master ;
     TRUNCATE TABLE tmp_pos_account ;
     TRUNCATE TABLE tmp_pos_detail ;
     FETCH var_cursor INTO var_hotel_id; 
     END WHILE; 
     CLOSE var_cursor;
  SELECT b.descript,SUM(a.number),SUM(a.gsts),SUM(charge),IFNULL(ROUND(SUM(charge)/SUM(a.gsts),2),0),SUM(Atran),SUM(Btran),SUM(Ctran),SUM(Ipmstran),SUM(Enttran),SUM(Othertran) 
  FROM tmp_pos_analysis a,hotel b WHERE  a.hotel_id  = b.id  GROUP BY   b.descript ;
ELSE
				SELECT set_value INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
						 CREATE TEMPORARY TABLE tmp_pos_pccode SELECT * FROM pos_pccode WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
						
						SELECT TO_DAYS(arg_biz_date)-TO_DAYS(var_bizdate) INTO i;
						IF i=0 THEN
							 INSERT INTO tmp_pos_master SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
							 INSERT INTO tmp_pos_account SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
							 INSERT INTO tmp_pos_detail SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
						
						ELSE
							 INSERT INTO tmp_pos_master SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
							 INSERT INTO tmp_pos_account SELECT * FROM pos_account_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
							 INSERT INTO tmp_pos_detail SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
						END IF ;
				
					INSERT tmp_pos_analysis(hotel_group_id,hotel_id,biz_date,CODE,number,charge )
					SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,b.code,IFNULL(COUNT(e.accnt),0) ,IFNULL(SUM(e.charge),0)
					FROM 
					tmp_pos_pccode b ,tmp_pos_master e 
					WHERE e.pccode = b.code
					GROUP BY b.code ;
					
					INSERT tmp_pos_analysis(hotel_group_id,hotel_id,biz_date,CODE,gsts,gstsAvg)
					SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,b.code,IFNULL(SUM(e.gsts),0),IFNULL(ROUND(SUM(e.charge)/SUM(e.gsts),2),0)
					FROM
					tmp_pos_pccode b ,tmp_pos_master e 
					WHERE e.pccode = b.code  AND e.sta <> 'X' AND e.sta <> 'S' 
					GROUP BY b.code ;
			
			
			 INSERT tmp_pos_analysis  (hotel_group_id,hotel_id,biz_date,CODE,Atran)
					SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,d.pccode,IFNULL(SUM(c.credit) ,0)
					FROM
						 tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e,tmp_code_tran f
						WHERE c.accnt = d.accnt AND c.paycode = f.code AND d.sta = 'O'  
						AND c.sta = 'O' AND c.number = 2 
						AND c.pccode = e.code AND f.category_code = 'A'
						GROUP BY d.pccode;
			 
			INSERT tmp_pos_analysis  (hotel_group_id,hotel_id,biz_date,CODE,Btran)
					SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,d.pccode,IFNULL(SUM(c.credit) ,0)
					FROM
						 tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e,tmp_code_tran f
						WHERE c.accnt = d.accnt AND c.paycode = f.code AND d.sta = 'O'  
						AND c.sta = 'O' AND c.number = 2 
						AND c.pccode = e.code AND f.category_code IN ('C','D')
						GROUP BY d.pccode;
			
			INSERT tmp_pos_analysis  (hotel_group_id,hotel_id,biz_date,CODE,Ctran)
					SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,d.pccode,IFNULL(SUM(c.credit) ,0)
					FROM
						 tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e,tmp_code_tran f
						WHERE c.accnt = d.accnt AND c.paycode = f.code AND d.sta = 'O'  
						AND c.sta = 'O' AND c.number = 2 
						AND c.pccode = e.code AND f.category_code = 'E'
						GROUP BY d.pccode;
			
			INSERT tmp_pos_analysis  (hotel_group_id,hotel_id,biz_date,CODE,Ipmstran)
					SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,d.pccode,IFNULL(SUM(c.credit) ,0)
					FROM
						 tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e,tmp_code_tran f
						WHERE c.accnt = d.accnt AND c.paycode = f.code AND d.sta = 'O'  
						AND c.sta = 'O' AND c.number = 2 
						AND c.pccode = e.code AND f.category_code IN ('I','J')
						GROUP BY d.pccode;
			
			INSERT tmp_pos_analysis  (hotel_group_id,hotel_id,biz_date,CODE,Enttran)
					SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,d.pccode,IFNULL(SUM(c.credit) ,0)
					FROM
						 tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e,tmp_code_tran f
						WHERE c.accnt = d.accnt AND c.paycode = f.code AND d.sta = 'O'  
						AND c.sta = 'O' AND c.number = 2 
						AND c.pccode = e.code AND f.category_code = 'H'
						GROUP BY d.pccode;
			
			INSERT tmp_pos_analysis  (hotel_group_id,hotel_id,biz_date,CODE,Othertran)
					SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,d.pccode,IFNULL(SUM(c.credit) ,0)
					FROM
						 tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e,tmp_code_tran f
						WHERE c.accnt = d.accnt AND c.paycode = f.code AND d.sta = 'O'  
						AND c.sta = 'O' AND c.number = 2 
						AND c.pccode = e.code AND f.category_code NOT IN ('A','C','D','E','I','J','H')
						GROUP BY d.pccode;
  SELECT b.descript,SUM(a.number),SUM(a.gsts),SUM(charge),IFNULL(ROUND(SUM(charge)/SUM(a.gsts),2),0),SUM(Atran),SUM(Btran),SUM(Ctran),SUM(Ipmstran),SUM(Enttran),SUM(Othertran) 
  FROM tmp_pos_analysis a,tmp_pos_pccode b WHERE  a.code  = b.code  GROUP BY   b.descript ;
END IF ;
 DROP TEMPORARY TABLE IF EXISTS tmp_pos_analysis;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_biz_hotel_analysis_shift`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_biz_hotel_analysis_shift`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_biz_hotel_analysis_shift`(
    IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
    IN arg_biz_date		DATETIME, 
    IN arg_flag			CHAR(1))
    SQL SECURITY INVOKER
label_0:
BEGIN
	DECLARE var_bizdate DATETIME;
	DECLARE i INT DEFAULT 0;
	DECLARE j INT DEFAULT 0;
  DECLARE var_sql		VARCHAR(1024);
  
    DECLARE var_hotel_id BIGINT DEFAULT 0;
    DECLARE t_error INTEGER DEFAULT 0;  
    DECLARE done_cursor INT DEFAULT 0 ;
    DECLARE var_cursor CURSOR FOR SELECT id FROM hotel WHERE hotel_group_id = arg_hotel_group_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1; 
   
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_pccode;
      DROP TEMPORARY TABLE IF EXISTS tmp_code_tran;                 
      CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
      CREATE TEMPORARY TABLE tmp_pos_account SELECT * FROM pos_account WHERE 1=2;
      CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2 ;
      CREATE TEMPORARY TABLE tmp_code_tran SELECT * FROM  code_transaction  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND arrange_code > '9' ;
      
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_analysis ;
      CREATE TEMPORARY TABLE tmp_pos_analysis (
		  `hotel_group_id` BIGINT(16) NOT NULL,
		  `hotel_id` BIGINT(16) NOT NULL,
		  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
		  `biz_date` DATETIME NOT NULL COMMENT '营业日期',
      `code`  VARCHAR(10) DEFAULT '' ,
      `shift`  VARCHAR(10) DEFAULT '' ,
		  `number`  DECIMAL(12,2) DEFAULT '0' ,
		  `gsts`   DECIMAL(12,2) DEFAULT '0' ,
		  `charge` DECIMAL(12,2) DEFAULT '0' ,
		  `gstsAvg` DECIMAL(12,2) DEFAULT '0' ,
		  `Atran` DECIMAL(12,2) DEFAULT '0' ,
		  `Btran` DECIMAL(12,2) DEFAULT '0' ,
		  `Ctran` DECIMAL(12,2) DEFAULT '0' ,
      `Ipmstran` DECIMAL(12,2) DEFAULT '0' , 
      `Enttran` DECIMAL(12,2) DEFAULT '0' ,
      `Othertran` DECIMAL(12,2) DEFAULT '0' ,
		  PRIMARY KEY (`id`)
		  );
IF(arg_hotel_id = 0) THEN
     OPEN var_cursor;
     SET done_cursor = 0;
     FETCH var_cursor INTO  var_hotel_id;
     
     WHILE done_cursor<>1 DO 
          -- SELECT set_value INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = var_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
			IF EXISTS(SELECT 1 FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = var_hotel_id AND catalog = 'system' AND item = 'pos_biz_date') THEN
				          SELECT set_value INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = var_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
			  ELSE
				      SET var_bizdate = arg_biz_date;
			  END IF;
		      DROP TEMPORARY TABLE IF EXISTS tmp_pos_pccode;
					CREATE TEMPORARY TABLE tmp_pos_pccode SELECT * FROM pos_pccode WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = var_hotel_id ;
					 SELECT TO_DAYS(arg_biz_date)-TO_DAYS(var_bizdate) INTO i;
							IF i=0 THEN
								 INSERT INTO tmp_pos_master SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = var_hotel_id  AND biz_date = arg_biz_date ;
								 INSERT INTO tmp_pos_account SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id  AND hotel_id = var_hotel_id  AND biz_date = arg_biz_date ;
								 INSERT INTO tmp_pos_detail SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id  AND hotel_id = var_hotel_id   AND biz_date = arg_biz_date ;
							
							ELSE
								 INSERT INTO tmp_pos_master SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id  AND hotel_id = var_hotel_id AND biz_date = arg_biz_date ;
								 INSERT INTO tmp_pos_account SELECT * FROM pos_account_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = var_hotel_id  AND biz_date = arg_biz_date ;
								 INSERT INTO tmp_pos_detail SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id  AND hotel_id = var_hotel_id  AND biz_date = arg_biz_date ;
							END IF ;
					 -- 营业点单数、营业收入
							INSERT tmp_pos_analysis(hotel_group_id,hotel_id,biz_date,CODE,shift,number,charge )
							SELECT arg_hotel_group_id, var_hotel_id,arg_biz_date,b.code,e.shift,IFNULL(COUNT(e.accnt),0) ,IFNULL(SUM(e.charge),0)
							FROM 
							tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
							WHERE e.accnt = d.accnt AND d.pccode = b.code AND d.number = 1
							GROUP BY b.code,e.shift ;
							-- 营业点人数、人均
							INSERT tmp_pos_analysis(hotel_group_id,hotel_id,biz_date,CODE,shift,gsts,gstsAvg)
							SELECT arg_hotel_group_id, var_hotel_id,arg_biz_date,b.code,e.shift,IFNULL(SUM(e.gsts),0),IFNULL(ROUND(SUM(e.charge)/SUM(e.gsts),2),0)
							FROM
							tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
							WHERE e.accnt = d.accnt AND d.pccode = b.code  AND e.sta <> 'X' AND e.sta <> 'S' AND d.number = 1
							GROUP BY b.code,e.shift ;
					--  ---------------------------------
     TRUNCATE TABLE tmp_pos_master ;
     TRUNCATE TABLE tmp_pos_account ;
     TRUNCATE TABLE tmp_pos_detail ;
     FETCH var_cursor INTO var_hotel_id; 
     END WHILE; 
     CLOSE var_cursor;
  SELECT a.shift,SUM(a.number),SUM(a.gsts),SUM(charge),IFNULL(ROUND(SUM(charge)/SUM(a.gsts),2),0)
  FROM tmp_pos_analysis a,hotel b WHERE  a.hotel_id  = b.id  GROUP BY  a.shift;
ELSE
				SELECT set_value INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
						 CREATE TEMPORARY TABLE tmp_pos_pccode SELECT * FROM pos_pccode WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
						--  准备数据
						SELECT TO_DAYS(arg_biz_date)-TO_DAYS(var_bizdate) INTO i;
						IF i=0 THEN
							 INSERT INTO tmp_pos_master SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
							 INSERT INTO tmp_pos_account SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
							 INSERT INTO tmp_pos_detail SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
						
						ELSE
							 INSERT INTO tmp_pos_master SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
							 INSERT INTO tmp_pos_account SELECT * FROM pos_account_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
							 INSERT INTO tmp_pos_detail SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
						END IF ;
				-- 营业点单数、营业收入
					INSERT tmp_pos_analysis(hotel_group_id,hotel_id,biz_date,CODE,shift,number,charge )
					SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,b.code,e.shift,IFNULL(COUNT(e.accnt),0) ,IFNULL(SUM(e.charge),0)
					FROM 
					tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
					WHERE e.accnt = d.accnt AND d.pccode = b.code AND d.number = 1
					GROUP BY b.code,e.shift ;
					-- 营业点人数、人均
					INSERT tmp_pos_analysis(hotel_group_id,hotel_id,biz_date,CODE,shift,gsts,gstsAvg)
					SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,b.code,e.shift,IFNULL(SUM(e.gsts),0),IFNULL(ROUND(SUM(e.charge)/SUM(e.gsts),2),0)
					FROM
					tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
					WHERE e.accnt = d.accnt AND d.pccode = b.code  AND e.sta <> 'X' AND e.sta <> 'S' AND d.number = 1
					GROUP BY b.code,e.shift ;
			--  ---------------------------------
  SELECT a.shift,SUM(a.number),SUM(a.gsts),SUM(charge),IFNULL(ROUND(SUM(charge)/SUM(a.gsts),2),0) 
  FROM tmp_pos_analysis a,tmp_pos_pccode b WHERE  a.code  = b.code  GROUP BY  a.shift ;
END IF ;
 DROP TEMPORARY TABLE IF EXISTS tmp_pos_analysis;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_check_out`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_check_out`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_check_out`(IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
	IN arg_biz_date		DATETIME,
	IN arg_shift VARCHAR(1),
	IN arg_accnts VARCHAR(100),
	IN arg_billno		VARCHAR(20),
	IN arg_user  VARCHAR(20) , 
 	OUT arg_ret				INT)
    SQL SECURITY INVOKER
BEGIN
-- 结账过程
-- 		
  
	DECLARE var_num			INT;
	DECLARE var_hotel_group_id			INT;
	DECLARE var_hotel_id			INT;
	DECLARE var_logdate			DATETIME;
	DECLARE var_accnts VARCHAR(100);
	DECLARE i INT DEFAULT 0;
	DECLARE j INT DEFAULT 0;
	DECLARE t_error INTEGER DEFAULT 0;  
	DECLARE done_cursor INT DEFAULT 0 ;
	DECLARE var_cardno	VARCHAR(20) DEFAULT '';
	DECLARE var_name	VARCHAR(50) DEFAULT '';
   
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1; 
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;  
	SET arg_ret = '1' ; 
label:BEGIN
--	insert a(msg) select concat(ifnull(arg_biz_date,''),'/',ifnull(arg_shift,''),'/',ifnull(arg_accnts,''),'/',ifnull(arg_billno,''),'/',ifnull(arg_user,''));
	DROP TEMPORARY TABLE IF EXISTS tmp_accnt ;
	CREATE TEMPORARY TABLE  tmp_accnt
	 (  
		`accnt` VARCHAR(20) NOT NULL
	);
	
	DROP TEMPORARY TABLE IF EXISTS tmp_accnt2 ;
	CREATE TEMPORARY TABLE  tmp_accnt2
	 (  
		`accnt` VARCHAR(20) 
	);
		
	IF LENGTH(arg_accnts) > 0 THEN
		SET var_accnts = arg_accnts ;
		SELECT LENGTH(var_accnts)-LENGTH(REPLACE(var_accnts,',',''))+1 INTO i ;
		SET j = 0;
		WHILE j< i DO
			SET j=j+1;
			IF(LENGTH(REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_accnts,',',j)),',',1)) )>0 ) THEN
				INSERT  tmp_accnt
				SELECT REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_accnts,',',j)),',',1));
			END IF;
		END WHILE ;
	END IF;
 
-- 开启计算事务
--	START TRANSACTION;
-- ------------------------------------------------------------------------
   --  'S帐账务、处理营业日期' 
	IF EXISTS (SELECT 1 FROM pos_master a,tmp_accnt b WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = b.accnt AND a.sta = 'S') THEN
		INSERT INTO tmp_accnt2  
			SELECT a.accnt FROM pos_master a,tmp_accnt b WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = b.accnt AND a.sta = 'S' ;
  
		UPDATE pos_master a, tmp_accnt2 b
			SET a.biz_date = arg_biz_date
			WHERE a.hotel_group_id = arg_hotel_group_id AND  a.hotel_id = arg_hotel_id AND a.accnt = b.accnt ;
	  
		UPDATE pos_account a,tmp_accnt2 b
			SET a.biz_date = arg_biz_date
			WHERE a.hotel_group_id = arg_hotel_group_id AND  a.hotel_id = arg_hotel_id AND a.accnt = b.accnt AND a.number = '1';
	  
		UPDATE pos_detail a, tmp_accnt2 b
			SET a.biz_date = arg_biz_date
			WHERE a.hotel_group_id = arg_hotel_group_id AND  a.hotel_id = arg_hotel_id AND a.accnt = b.accnt ;
	END IF;
-- ------------------------------------------------------------------------
	-- 处理pos_detail
	UPDATE pos_detail a,tmp_accnt b SET a.billno = arg_billno ,a.biz_date = arg_biz_date,a.modify_user = arg_user ,a.modify_datetime = NOW() WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = b.accnt   ;
	-- 更新主单付款信息
	UPDATE pos_master d ,  
		(SELECT a.hotel_group_id,a.hotel_id,a.accnt,SUM(credit) AS credit  FROM pos_account a  LEFT JOIN tmp_accnt  b ON a.accnt = b.accnt WHERE a.hotel_group_id = arg_hotel_group_id AND  a.hotel_id = arg_hotel_id AND a.sta = 'I' GROUP BY a.hotel_group_id,a.hotel_id,a.accnt) c
		SET d.credit = c.credit  WHERE  d.hotel_group_id = c.hotel_group_id AND d.hotel_id = c.hotel_id AND d.accnt = c.accnt ;
	-- 处理pos_master 
	UPDATE pos_master a,tmp_accnt b SET a.bal= a.charge-a.credit,a.billno=arg_billno ,a.biz_date = arg_biz_date,a.osta=a.sta, a.sta = 'O',a.shift = arg_shift , a.modify_user = arg_user ,a.modify_datetime = NOW() WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = b.accnt   ;
	-- 处理pos_account
	UPDATE pos_account a,tmp_accnt b SET a.billno = arg_billno ,a.biz_date = arg_biz_date, a.sta = 'O',a.shift = arg_shift, a.modify_user = arg_user ,a.modify_datetime = NOW() WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = b.accnt AND  a.number = 1  ;
	UPDATE pos_account a,tmp_accnt b SET a.billno = arg_billno ,a.biz_date = arg_biz_date, a.sta = 'O',a.shift = arg_shift, a.create_user = arg_user, a.modify_user = arg_user ,a.modify_datetime = NOW() WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = b.accnt AND  a.number = 2 AND a.sta = 'I' ;   
	-- 处理台位资源pos_table_map
	UPDATE pos_table_map a,tmp_accnt b SET a.sta = '0' ,a.accnt = '' ,a.pcrec = '' WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = b.accnt   ;  
	-- 插入同步表
	DELETE FROM pos_accnt_sync  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt IN (SELECT accnt FROM tmp_accnt)  ;
	INSERT pos_accnt_sync  (hotel_group_id,hotel_id,entity_name,accnt,res_accnt,TYPE,is_sync,is_halt,create_user,create_datetime,modify_user,modify_datetime)
		SELECT arg_hotel_group_id,arg_hotel_id,'com.greencloud.entity.PosMaster',accnt,'','UPDATE','F','F','ADMIN',NOW(),'ADMIN',NOW() FROM tmp_accnt ;
	IF t_error = 1 THEN
		SET arg_ret = '-1';
		LEAVE label; 
	END IF;
END label;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_check_out_revoke`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_check_out_revoke`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_check_out_revoke`(IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
	IN arg_biz_date		DATETIME,
	IN arg_billno		VARCHAR(20),
	IN arg_shift  VARCHAR(2) ,
	IN arg_flag  VARCHAR(2) , IN arg_user  VARCHAR(20) , 
 	OUT arg_ret				 VARCHAR(20))
    SQL SECURITY INVOKER
label_0:
BEGIN
  
	DECLARE var_num			INT;
	DECLARE var_hotel_group_id			INT;
	DECLARE var_hotel_id			INT;
	DECLARE var_logdate			DATETIME;
	DECLARE var_accnts VARCHAR(100);
	DECLARE var_pcrec	VARCHAR(20);
	DECLARE i INT DEFAULT 0;
	DECLARE j INT DEFAULT 0;
	DECLARE t_error INTEGER DEFAULT 0;  
	DECLARE done_cursor INT DEFAULT 0 ;
   
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1; 
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;  
	SET arg_ret = '-1' ; 
 
	IF(arg_flag = 'C') THEN
		UPDATE pos_detail a SET a.billno = 'X' ,a.modify_user = arg_user ,a.modify_datetime = NOW()  WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.billno = arg_billno ;
		UPDATE pos_master a SET a.sta = 'C', a.credit = '0.00' ,a.bal = a.charge ,a.lastrnum = 0,lastpnum = 0, a.modify_user = arg_user ,a.modify_datetime = NOW()  WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.billno = arg_billno  ;
--		UPDATE pos_account a  SET a.billno = 'X' , a.sta = 'X',a.shift = arg_shift, a.modify_user = arg_user ,a.modify_datetime = NOW() WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.billno = arg_billno AND  a.number = 2 AND a.sta = 'O' ;
		UPDATE pos_account a  SET a.billno = 'X' , a.sta = 'X',a.shift = arg_shift, a.modify_user = arg_user ,a.modify_datetime = NOW() WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.billno = arg_billno AND  a.number = 2 AND a.sta = 'O' AND a.flag <> 'DJ';
		UPDATE pos_account a  SET a.billno = 'X' , a.sta = 'I',a.shift = arg_shift, a.modify_user = arg_user ,a.modify_datetime = NOW() WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.billno = arg_billno AND  a.number = 2 AND a.sta = 'O' AND a.flag = 'DJ';
		UPDATE pos_close a  SET a.del_biz_date = arg_biz_date , a.del_user = arg_user ,a.del_cashier = arg_shift,a.del_datetime = NOW() WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.billno = arg_billno ;
	    
    -- 插入同步表
		INSERT pos_accnt_sync  (hotel_group_id,hotel_id,entity_name,accnt,res_accnt,TYPE,is_sync,is_halt,create_user,create_datetime,modify_user,modify_datetime)
		SELECT hotel_group_id,hotel_id,'com.greencloud.entity.PosMaster',accnt,resno,'REVOKE','F','F','ADMIN',NOW(),'ADMIN',NOW() 
		FROM pos_master WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND billno = arg_billno  ;
 
		IF t_error = 1 THEN  
			SET arg_ret = '-1' ; 
         
		ELSE  
			SET arg_ret = '1' ; 
		END IF;  
	ELSEIF(arg_flag = 'S') THEN	
		SELECT IFNULL(pcrec,'') INTO var_pcrec FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_billno;			
		IF var_pcrec IS NULL OR var_pcrec = '' THEN	
			SELECT IFNULL(COUNT(*),0) INTO var_num FROM 
				(SELECT tableno FROM pos_account  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_billno AND  number = 1 AND sta = 'S' ) a 
				INNER JOIN 
				(SELECT tableno FROM pos_account  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND  number = 1 AND sta = 'I' ) b
				ON a.tableno = b.tableno ;	
			IF var_num > 0 THEN
				SET arg_ret = '-1,桌号已经被占用' ;
			ELSE
				UPDATE pos_detail a SET a.billno = '' ,a.biz_date = arg_biz_date,a.modify_user = arg_user ,a.modify_datetime = NOW()  WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_billno ;
				UPDATE pos_master a SET a.osta=a.sta,a.sta = 'I',a.shift = arg_shift ,a.biz_date = arg_biz_date, a.modify_user = arg_user ,a.modify_datetime = NOW()  WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_billno  ;
				UPDATE pos_account a  SET a.billno = 'I' , a.sta = 'I',a.shift = arg_shift,a.biz_date = arg_biz_date, a.modify_user = arg_user ,a.modify_datetime = NOW() WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_billno AND  a.number = 1 AND a.sta = 'S' ;
				
				-- 插入同步表
				INSERT pos_accnt_sync  (hotel_group_id,hotel_id,entity_name,accnt,res_accnt,TYPE,is_sync,is_halt,create_user,create_datetime,modify_user,modify_datetime)
				SELECT hotel_group_id,hotel_id,'com.greencloud.entity.PosMaster',accnt,resno,'READD','F','F','ADMIN',NOW(),'ADMIN',NOW() 
					FROM pos_master WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_billno  ; 
				
				IF t_error = 1 THEN  
					SET arg_ret = '-1,桌号已经被占用' ; 	 
				ELSE  
					SET arg_ret = '2' ; 
				END IF; 
			END IF;			
		ELSE
			SELECT COUNT(*) INTO var_num FROM 
				(SELECT a.tableno FROM pos_account a,pos_master b WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND a.accnt = b.accnt AND b.pcrec = var_pcrec AND  a.number = 1 AND a.sta = 'S' ) a 
				INNER JOIN 
				(SELECT tableno FROM pos_account  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND  number = 1 AND sta = 'I' ) b
				ON a.tableno = b.tableno ;
			IF var_num > 0 THEN
				SET arg_ret = '-1,桌号已经被占用' ;
			ELSE
				UPDATE pos_detail a,pos_master b SET a.billno = '' ,a.biz_date = arg_biz_date,a.modify_user = arg_user ,a.modify_datetime = NOW()  WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND a.accnt = b.accnt AND b.pcrec = var_pcrec;
				UPDATE pos_master a SET a.osta=a.sta,a.sta = 'I',a.shift = arg_shift ,a.biz_date = arg_biz_date, a.modify_user = arg_user ,a.modify_datetime = NOW()  WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.pcrec = var_pcrec  ;
				UPDATE pos_account a,pos_master b  SET a.billno = '' , a.sta = 'I',a.shift = arg_shift,a.biz_date = arg_biz_date, a.modify_user = arg_user ,a.modify_datetime = NOW() WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND a.accnt = b.accnt AND b.pcrec = var_pcrec AND  a.number = 1 AND a.sta = 'S' ;
				-- 插入同步表
				INSERT pos_accnt_sync  (hotel_group_id,hotel_id,entity_name,accnt,res_accnt,TYPE,is_sync,is_halt,create_user,create_datetime,modify_user,modify_datetime)
				SELECT hotel_group_id,hotel_id,'com.greencloud.entity.PosMaster',accnt,resno,'READD','F','F','ADMIN',NOW(),'ADMIN',NOW() 
					FROM pos_master WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND pcrec = var_pcrec  ; 
				IF t_error = 1 THEN  
					SET arg_ret = '-1,桌号已经被占用' ; 	 
				ELSE  
					SET arg_ret = '2' ; 
				END IF; 
			END IF;
		END IF;
	ELSEIF(arg_flag = 'T') THEN	
		SELECT IFNULL(pcrec,'') INTO var_pcrec FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_billno;			
		IF var_pcrec IS NULL OR var_pcrec = '' THEN
			SELECT COUNT(*) INTO var_num FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_billno AND sta = 'I' AND number = '2';
			IF var_num > 0 THEN
				SET arg_ret = '-1,含有有效付款，请先删除付款!' ; 
			ELSE
				UPDATE pos_master SET osta = sta,sta = 'S',modify_user = arg_user,modify_datetime= NOW() WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_billno AND (sta = 'I' OR sta = 'C');
				UPDATE pos_account SET sta='S' , modify_datetime = NOW(),modify_user = arg_user WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_billno AND sta = 'I' AND number = '1';
-- 				UPDATE pos_account SET sta='X' , modify_datetime = NOW(),modify_user = arg_user,shift =  arg_shift WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_billno AND sta = 'I' AND number = '2';
				UPDATE pos_detail SET billno='S' WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_billno AND sta = 'I';
				INSERT pos_accnt_sync  (hotel_group_id,hotel_id,entity_name,accnt,res_accnt,TYPE,is_sync,is_halt,create_user,create_datetime,modify_user,modify_datetime)
					SELECT hotel_group_id,hotel_id,'com.greencloud.entity.PosMaster',accnt,resno,'READD','F','F','ADMIN',NOW(),'ADMIN',NOW() 
						FROM pos_master WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_billno  ; 
				IF t_error = 1 THEN  
					SET arg_ret = '-1,挂账失败' ;         
				ELSE  
					SET arg_ret = '2' ; 
				END IF; 
			END IF;
		ELSE
			SELECT COUNT(*) INTO var_num FROM pos_account a,pos_master b WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND a.accnt = b.accnt AND b.pcrec = var_pcrec AND a.sta = 'I' AND a.number = '2' AND (b.sta = 'I' OR b.sta = 'C');
			IF var_num > 0 THEN
				SET arg_ret = '-1,含有有效付款，请先删除付款!' ; 
			ELSE			
				UPDATE pos_master SET osta = sta,sta = 'S',modify_user = arg_user,modify_datetime= NOW() WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND pcrec = var_pcrec AND (sta = 'I' OR sta = 'C');
				UPDATE pos_account a,pos_master b SET a.sta='S' , a.modify_datetime = NOW(),a.modify_user = arg_user WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND a.accnt = b.accnt AND b.pcrec = var_pcrec AND a.sta = 'I' AND a.number = '1' AND (b.sta = 'I' OR b.sta = 'C' OR b.sta = 'S');
-- 			UPDATE pos_account a,pos_master b SET a.sta='S' , a.modify_datetime = NOW(),a.modify_user = arg_user WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND a.accnt = b.acct AND b.pcrec = var_pcrec AND a.sta = 'I' AND a.number = '1' ;
				UPDATE pos_detail a,pos_master b SET a.billno='S' WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND a.accnt = b.accnt AND b.pcrec = var_pcrec AND a.sta = 'I' AND (b.sta = 'I' OR b.sta = 'C' OR b.sta = 'S');
				INSERT pos_accnt_sync  (hotel_group_id,hotel_id,entity_name,accnt,res_accnt,TYPE,is_sync,is_halt,create_user,create_datetime,modify_user,modify_datetime)
					SELECT hotel_group_id,hotel_id,'com.greencloud.entity.PosMaster',accnt,resno,'READD','F','F','ADMIN',NOW(),'ADMIN',NOW() 
						FROM pos_master WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND pcrec = var_pcrec ; 
				IF t_error = 1 THEN  
					SET arg_ret = '-1,挂账失败' ;         
				ELSE  
					SET arg_ret = '2' ; 
				END IF; 
			END IF;
		END IF;				
		-- end if;
	ELSE
		SELECT COUNT(*) INTO var_num FROM 
			(SELECT tableno FROM pos_account  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND billno = arg_billno AND  number = 1 AND sta = 'O' ) a 
			INNER JOIN 
			(SELECT tableno FROM pos_account  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND  number = 1 AND sta = 'I' ) b
			ON a.tableno = b.tableno ;
		IF(var_num>0) THEN
		-- 资源被占用 不允许重新登记
			SET arg_ret = '-1,桌号已经被占用' ;
		ELSE
			UPDATE pos_detail a SET a.billno = 'I' ,a.modify_user = arg_user ,a.modify_datetime = NOW()  WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.billno = arg_billno ;
			UPDATE pos_master a SET a.sta = 'I',a.shift = arg_shift , a.credit = '0.00' ,a.bal = a.charge , a.modify_user = arg_user ,a.modify_datetime = NOW()  WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.billno = arg_billno  ;
			UPDATE pos_account a  SET a.billno = 'I' , a.sta = 'I',a.shift = arg_shift, a.modify_user = arg_user ,a.modify_datetime = NOW() WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.billno = arg_billno AND  a.number = 1 AND a.sta = 'O' ;
			-- 插入同步表
			INSERT pos_accnt_sync  (hotel_group_id,hotel_id,entity_name,accnt,res_accnt,TYPE,is_sync,is_halt,create_user,create_datetime,modify_user,modify_datetime)
			SELECT hotel_group_id,hotel_id,'com.greencloud.entity.PosMaster',accnt,resno,'READD','F','F','ADMIN',NOW(),'ADMIN',NOW() 
				FROM pos_master WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND billno = arg_billno  ; 
			IF t_error = 1 THEN  
				SET arg_ret = '-1,桌号已经被占用' ; 								        
			ELSE  
				SET arg_ret = '2' ; 
			END IF; 
		END IF ;
	END IF ;      
	BEGIN
		SET @procresult = 0 ;
		LEAVE label_0 ;
	END ; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_create_new_posmaster`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_create_new_posmaster`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_create_new_posmaster`(IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
  IN arg_accnt VARCHAR(20),	
  IN arg_pcid		VARCHAR(10),
	IN arg_shift		VARCHAR(10),	
	IN arg_pccode		VARCHAR(10),
  IN arg_gsts		VARCHAR(10),
	IN arg_tableNo		VARCHAR(10),	
  IN arg_exttableNo		VARCHAR(50),
  IN arg_split CHAR(2),
  IN arg_user VARCHAR(20), IN arg_info  VARCHAR(50),IN arg_empid  VARCHAR(20),	
  OUT arg_msg		VARCHAR(60))
    SQL SECURITY INVOKER
label_0:
BEGIN
	-- 新餐饮开台过程
   DECLARE var_accnt CHAR(20);
	 DECLARE var_date DATETIME;
	 DECLARE var_syspccode CHAR(5);
	 DECLARE var_name CHAR(30);
	 DECLARE var_maxinum INTEGER;
	 DECLARE var_count INTEGER;
	 DECLARE var_dsc DECIMAL(12,2);
	 DECLARE var_srv DECIMAL(12,2);
	 DECLARE var_tax DECIMAL(12,2);
	 DECLARE var_class CHAR(10);
   DECLARE var_menutype VARCHAR(10);
	 DECLARE var_ename VARCHAR(50);
	 DECLARE var_deptplchk	VARCHAR(10);
	 DECLARE var_flag	VARCHAR(70);
	 DECLARE var_empid1	VARCHAR(10) ;
	 DECLARE var_market		VARCHAR(10);
   DECLARE var_source		VARCHAR(10);
   DECLARE var_type1		VARCHAR(10);
	 DECLARE var_type2		VARCHAR(10);
	 DECLARE var_type3		VARCHAR(10);
	 DECLARE var_type4		VARCHAR(10);
   DECLARE var_spli_table VARCHAR(200);
   DECLARE var_table		VARCHAR(20);
   DECLARE var_table_c		VARCHAR(20);
   DECLARE var_exp1		VARCHAR(10);
   DECLARE var_exp2		DECIMAL(12,2);
   DECLARE flag INT DEFAULT 0;
   DECLARE i INT DEFAULT 0;
   DECLARE j INT DEFAULT 0;
   DECLARE var_mode		VARCHAR(10);
   DECLARE t_error INTEGER DEFAULT 0;  
    
   
   DECLARE done_cursor INT DEFAULT 0 ;
   DECLARE var_cursor CURSOR FOR SELECT tableno FROM tmp_table;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1;
  
   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;  
  -- 事物开始
  -- insert a(msg) select concat(ifnull(arg_accnt,''),'/',ifnull(arg_pcid,''),'/',ifnull(arg_shift,''),'/',ifnull(arg_tableNo,''),'/',ifnull(arg_split,''));
    SET  arg_msg = "-1,开台失败" ;  
 	
   SELECT descript,descript_en,menu_type,IFNULL(dec_mode,"") INTO var_name,var_ename,var_menutype,var_mode FROM pos_pccode WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_pccode;
   SELECT dsc_rate,serve_rate,tax_rate,exp1,exp2 INTO var_dsc,var_srv,var_tax,var_exp1,var_exp2 FROM pos_pccode WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_pccode;
   SELECT set_value INTO var_date  FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date' ;
  -- set var_mode = '001';
   IF var_mode = "" THEN
   	 SELECT CODE INTO var_mode  FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_desc_mode' ORDER BY CODE  LIMIT 1 ;
   END IF;	 
   SELECT CODE INTO var_market  FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_market' ORDER BY CODE  LIMIT 1 ;
   SELECT CODE INTO var_source  FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_source' ORDER BY CODE  LIMIT 1 ;
   SELECT CODE INTO var_type1  FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_menu_type1' ORDER BY CODE  LIMIT 1 ;
 -- 对扩展桌号进行遍历判断
 -- 扩展桌号分解表  
  DROP TEMPORARY TABLE IF EXISTS tmp_table ;
	CREATE TEMPORARY TABLE  tmp_table
	 (  
   `tableno` VARCHAR(20) NOT NULL
   );
   INSERT tmp_table VALUES (arg_tableNo);
   SET var_spli_table = arg_exttableNo ;
   IF(LENGTH(arg_exttableNo)>0) THEN
    
   SELECT LENGTH(var_spli_table)-LENGTH(REPLACE(var_spli_table,',',''))+1 INTO i ;
   SET j = 0;
   WHILE j< i DO
      SET j=j+1;
        IF(LENGTH(REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_spli_table,',',j)),',',1)) )>0 ) THEN
        INSERT  tmp_table
        SELECT REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_spli_table,',',j)),',',1));
        END IF;
      END WHILE ;
   END IF;
 
  
-- 分单不判断桌号 
   IF arg_split = '0' THEN
     OPEN var_cursor;
     SET done_cursor = 0;
     FETCH var_cursor INTO var_table_c;
     
     WHILE done_cursor<>1 DO  
       -- 判断桌号是否存在
         SELECT COUNT(1) INTO var_count FROM pos_pccode_table WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = var_table_c AND pccode = arg_pccode ;
         IF var_count = 0 THEN 
            SET arg_msg = CONCAT("-1,",var_table_c,"桌号不存在!");
            SET flag = -1 ;
         END IF;
       -- 判断桌号是否可用
         SELECT COUNT(1) INTO var_count FROM pos_account WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND tableno = var_table_c AND pccode = arg_pccode AND sta='I' ; -- AND shift = arg_shift;
         IF var_count > 0 THEN 
            SET arg_msg = CONCAT("-1,",var_table_c,"桌号已被占用!");
            SET flag = -1 ;
         END IF;
     FETCH var_cursor INTO var_table_c;
     END WHILE; 
     CLOSE var_cursor;
   END IF;
-- 表示桌号全部可用,继续往下执行
IF flag = 0 THEN
       -- 开始写入主单、账务 事物
        SET var_accnt = arg_accnt ;
               INSERT pos_master (hotel_group_id,hotel_id,accnt,type1,pccode,MODE,shift,empid,sta,biz_date,tableno,exttableno,gsts,market,
                         source,dsc,srv,tax,info,create_user,create_datetime,modify_user,modify_datetime) 
               VALUES     (arg_hotel_group_id,arg_hotel_id,arg_accnt,var_type1,arg_pccode,var_mode,arg_shift,arg_empid,'I',var_date,arg_tableNo,arg_exttableNo,arg_gsts,var_market,
                          var_source,var_dsc,var_srv,var_tax,arg_info,arg_user,NOW(),arg_user,NOW());
     -- 账务表,分桌号,inumber='1' 表示消费 inumber='2' 表示付款信息
    
     OPEN var_cursor;
     SET done_cursor = 0;
     SET j=0 ;
     FETCH var_cursor INTO var_table_c;
     WHILE done_cursor<>1 DO  
           SET j=j+1;
           INSERT pos_account (hotel_group_id,hotel_id,accnt,number,inumber,pccode,tableno,shift,empid,sta,biz_date,logdate,amount,
                             create_user,create_datetime,modify_user,modify_datetime) 
           VALUES     (arg_hotel_group_id,arg_hotel_id,arg_accnt,'1',j,arg_pccode,var_table_c,arg_shift,arg_empid,'I',var_date,NOW(),0,
                             arg_user,NOW(),arg_user,NOW());
     FETCH var_cursor INTO var_table_c;
     END WHILE; 
     CLOSE var_cursor;
     -- 开单项目生成到pos_order 
        --    if(var_exp1='T')THEN
        --    INSERT pos_order (hotel_group_id,hotel_id,pcid,accnt,type,inumber,descript,descript_en,note_code,sort_code,plu_code,unit,price,number,amount,sta,flag,tableno,siteno,
        --                     create_user,create_datetime,modify_user,modify_datetime) 
         --  VALUES   (arg_hotel_group_id,arg_hotel_id,arg_pcid,arg_accnt,1,1,'茶位费','Tea','SYS','SYS','CWF','位',var_exp2,arg_gsts,arg_gsts*var_exp2,'I','',arg_tableNo,arg_tableNo,
         --                    arg_user,NOW(),arg_user,NOW()) ;
       --             (arg_hotel_group_id,arg_hotel_id,arg_pcid,arg_accnt,1,2,'附加费','Tax','Y','','0.00','1','0.00','I','',arg_tableNo,arg_tableNo,
        --                     arg_user,NOW(),arg_user,NOW()),
         --           (arg_hotel_group_id,arg_hotel_id,arg_pcid,arg_accnt,1,3,'服务费','server','Z','','0.00','1','0.00','I','',arg_tableNo,arg_tableNo,
         --                    arg_user,NOW(),arg_user,NOW());
        --  END IF;
      
       IF(var_exp1='T' AND arg_gsts <> 0 AND var_exp2<> 0)THEN
		INSERT pos_order (hotel_group_id,hotel_id,pcid,accnt,TYPE,inumber,tnumber,anumber,mnumber,orderno,cond_code,descript,descript_en,note_code,sort_code,plu_code,tocode,unit,price,number,amount,sta,flag,flag1,empid,logdate,tableno,siteno,
			    create_user,create_datetime,modify_user,modify_datetime) 
			VALUES   (arg_hotel_group_id,arg_hotel_id,arg_pcid,arg_accnt,1,0,1,0,0,0,'','茶位费','Tea','SYS','SYS','CWF','010','位',var_exp2,arg_gsts,arg_gsts*var_exp2,'I','00000000000000000000','0000000000','ADMIN',NOW(),arg_tableNo,'',
				arg_user,NOW(),arg_user,NOW()) ;
        END IF;
-- ------------------------------------------------------------------------------------
-- 插入同步表
    INSERT pos_accnt_sync  (hotel_group_id,hotel_id,entity_name,accnt,res_accnt,TYPE,is_sync,is_halt,create_user,create_datetime,modify_user,modify_datetime)
    VALUES (arg_hotel_group_id,arg_hotel_id,'com.greencloud.entity.PosMaster',arg_accnt,'','ADD','F','F','ADMIN',NOW(),'ADMIN',NOW());
-- ------------------------------------------------------------------------------------
        IF t_error = 1 THEN  
              SET  arg_msg = CONCAT("-1,开台失败了!") ;  
       ELSE  
           SET  arg_msg = CONCAT(arg_accnt,",桌号:",arg_tableNo,",开台成功!") ; 
       END IF;  
 END IF ; 
    
	
	 SELECT arg_msg; 
	
	BEGIN
		DROP TEMPORARY TABLE IF EXISTS tmp_table; 
		
		SET @procresult = 0 ;
		LEAVE label_0 ;
	END ; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_create_new_posmaster_wm`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_create_new_posmaster_wm`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_create_new_posmaster_wm`(
    IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
    IN arg_accnt VARCHAR(20),	
    IN arg_pcid		VARCHAR(10),
	IN arg_shift		VARCHAR(10),	
	IN arg_pccode		VARCHAR(10),
    IN arg_gsts		VARCHAR(10),
	IN arg_tableNo		VARCHAR(10),	
    IN arg_type1		VARCHAR(50),
    IN arg_split CHAR(2),
    IN arg_user VARCHAR(20), 
    IN arg_info  VARCHAR(50),
    IN arg_empid  VARCHAR(20),	
    OUT arg_msg		VARCHAR(60))
    SQL SECURITY INVOKER
label_0:
BEGIN
	-- 新餐饮外卖开台过程
   DECLARE var_accnt CHAR(20);
	 DECLARE var_date DATETIME;
	 DECLARE var_syspccode CHAR(5);
	 DECLARE var_name CHAR(30);
	 DECLARE var_maxinum INTEGER;
	 DECLARE var_count INTEGER;
	 DECLARE var_dsc DECIMAL(12,2);
	 DECLARE var_srv DECIMAL(12,2);
	 DECLARE var_tax DECIMAL(12,2);
	 DECLARE var_class CHAR(10);
     DECLARE var_menutype VARCHAR(10);
	 DECLARE var_ename VARCHAR(50);
	 DECLARE var_deptplchk	VARCHAR(10);
	 DECLARE var_flag	VARCHAR(70);
	 DECLARE var_empid1	VARCHAR(10) ;
	 DECLARE var_market		VARCHAR(10);
     DECLARE var_source		VARCHAR(10);
     DECLARE var_type1		VARCHAR(10);
	 DECLARE var_type2		VARCHAR(10);
	 DECLARE var_type3		VARCHAR(10);
	 DECLARE var_type4		VARCHAR(10);
   DECLARE var_spli_table VARCHAR(200);
   DECLARE var_table		VARCHAR(20);
   DECLARE var_table_c		VARCHAR(20);
   DECLARE var_exp1		VARCHAR(10);
   DECLARE var_exp2		DECIMAL(12,2);
   DECLARE flag INT DEFAULT 0;
   DECLARE i INT DEFAULT 0;
   DECLARE j INT DEFAULT 0;
   DECLARE var_mode		VARCHAR(10);
   DECLARE t_error INTEGER DEFAULT 0;  
   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;  
  -- 事物开始
   
    SET  arg_msg = "-1,开台失败" ;  
 
  -- SELECT descript,descript_en,menu_type INTO var_name,var_ename,var_menutype FROM pos_pccode WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_pccode;
   SELECT dsc_rate,serve_rate,tax_rate,exp1,exp2 INTO var_dsc,var_srv,var_tax,var_exp1,var_exp2 FROM pos_pccode WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_pccode;
   SELECT set_value INTO var_date  FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date' ;
  -- SELECT CODE INTO var_mode  FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_desc_mode' ORDER BY CODE  LIMIT 1 ;
   SELECT CODE INTO var_market  FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_market' ORDER BY CODE  LIMIT 1 ;
   SELECT CODE INTO var_source  FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_source' ORDER BY CODE  LIMIT 1 ;
   SELECT descript,descript_en,menu_type,IFNULL(dec_mode,"") INTO var_name,var_ename,var_menutype,var_mode FROM pos_pccode WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_pccode;
   IF var_mode = "" THEN
   	 SELECT CODE INTO var_mode  FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_desc_mode' ORDER BY CODE  LIMIT 1 ;
   END IF;
-- 表示桌号全部可用,继续往下执行
IF flag = 0 THEN
       -- 开始写入主单、账务 事物
        START TRANSACTION;
        SET var_accnt = arg_accnt ;
               INSERT pos_master (hotel_group_id,hotel_id,accnt,type1,pccode,MODE,shift,empid,sta,biz_date,tableno,exttableno,gsts,market,
                         source,dsc,srv,tax,info,create_user,create_datetime,modify_user,modify_datetime) 
               VALUES     (arg_hotel_group_id,arg_hotel_id,arg_accnt,arg_type1,arg_pccode,'',arg_shift,arg_empid,'I',var_date,arg_tableNo,'',arg_gsts,var_market,
                          var_source,var_dsc,var_srv,var_tax,arg_info,arg_user,NOW(),arg_user,NOW());
     -- 账务表,分桌号,inumber='1' 表示消费 inumber='2' 表示付款信息    
           INSERT pos_account (hotel_group_id,hotel_id,accnt,number,inumber,pccode,tableno,shift,empid,sta,biz_date,logdate,amount,
                             create_user,create_datetime,modify_user,modify_datetime) 
           VALUES     (arg_hotel_group_id,arg_hotel_id,arg_accnt,'1',j,arg_pccode,arg_tableNo,arg_shift,arg_empid,'I',var_date,NOW(),0,
                             arg_user,NOW(),arg_user,NOW());
   
     -- 开单项目生成到pos_order 
        --    if(var_exp1='T')THEN
        --    INSERT pos_order (hotel_group_id,hotel_id,pcid,accnt,type,inumber,descript,descript_en,note_code,sort_code,plu_code,unit,price,number,amount,sta,flag,tableno,siteno,
        --                     create_user,create_datetime,modify_user,modify_datetime) 
         --  VALUES   (arg_hotel_group_id,arg_hotel_id,arg_pcid,arg_accnt,1,1,'茶位费','Tea','SYS','SYS','CWF','位',var_exp2,arg_gsts,arg_gsts*var_exp2,'I','',arg_tableNo,arg_tableNo,
         --                    arg_user,NOW(),arg_user,NOW()) ;
       --             (arg_hotel_group_id,arg_hotel_id,arg_pcid,arg_accnt,1,2,'附加费','Tax','Y','','0.00','1','0.00','I','',arg_tableNo,arg_tableNo,
        --                     arg_user,NOW(),arg_user,NOW()),
         --           (arg_hotel_group_id,arg_hotel_id,arg_pcid,arg_accnt,1,3,'服务费','server','Z','','0.00','1','0.00','I','',arg_tableNo,arg_tableNo,
         --                    arg_user,NOW(),arg_user,NOW());
        --  END IF;
-- ------------------------------------------------------------------------------------
-- 插入同步表
    INSERT pos_accnt_sync  (hotel_group_id,hotel_id,entity_name,accnt,res_accnt,TYPE,is_sync,is_halt,create_user,create_datetime,modify_user,modify_datetime)
    VALUES (arg_hotel_group_id,arg_hotel_id,'com.greencloud.entity.PosMaster',arg_accnt,'','ADD','F','F','ADMIN',NOW(),'ADMIN',NOW());
-- ------------------------------------------------------------------------------------
        IF t_error = 1 THEN  
           ROLLBACK;  
              SET  arg_msg = CONCAT("-1,开台失败了!") ;  
       ELSE  
           COMMIT; 
           SET  arg_msg = CONCAT(arg_accnt,",桌号:",arg_tableNo,",开台成功!") ; 
       END IF;  
 END IF ; 
    
	
	 SELECT arg_msg; 
	
	BEGIN
		DROP TEMPORARY TABLE IF EXISTS tmp_table; 
		
		SET @procresult = 0 ;
		LEAVE label_0 ;
	END ; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_create_res_posmaster`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_create_res_posmaster`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_create_res_posmaster`(IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
  IN arg_accnt VARCHAR(20),	
  IN arg_resAccnt VARCHAR(20),
  IN arg_pcid		VARCHAR(10),
  IN arg_tableno      VARCHAR(10),	IN arg_shift		VARCHAR(10),	
  IN arg_split CHAR(2),
  IN arg_user VARCHAR(20),	
  OUT arg_msg		VARCHAR(60))
    SQL SECURITY INVOKER
label_0:
BEGIN
	-- 新餐预订转登记
	 DECLARE var_resname CHAR(60);
     DECLARE var_accnt CHAR(20);
	 DECLARE var_date DATETIME;
	 DECLARE var_syspccode CHAR(5);
	 DECLARE var_name CHAR(30);
	 DECLARE var_maxinum INTEGER;
	 DECLARE var_count INTEGER;
	 DECLARE var_dsc DECIMAL(12,2);
	 DECLARE var_srv DECIMAL(12,2);
	 DECLARE var_tax DECIMAL(12,2);
	 DECLARE var_class CHAR(10);
     DECLARE var_menutype VARCHAR(10);
	 DECLARE var_ename VARCHAR(50);
	 DECLARE var_deptplchk	VARCHAR(10);
	 DECLARE var_flag	VARCHAR(70);
	 DECLARE var_empid1	VARCHAR(10) ;
	 DECLARE var_market		VARCHAR(10);
   DECLARE var_saleid		VARCHAR(10);
   DECLARE var_saleinfo		VARCHAR(60);
   DECLARE var_haccnt		VARCHAR(10);
   DECLARE var_hname		VARCHAR(80);
   DECLARE var_cusno		VARCHAR(10);
   DECLARE var_cusinfo		VARCHAR(60);
   DECLARE var_cardno		VARCHAR(20);
   DECLARE var_cardinfo		VARCHAR(60);
   DECLARE var_phone		VARCHAR(60);
   DECLARE var_source		VARCHAR(10);
   DECLARE var_type1		VARCHAR(10);
   DECLARE var_type2		VARCHAR(10);
   DECLARE var_type3		VARCHAR(10);
   DECLARE var_type4		VARCHAR(10);
   DECLARE var_spli_table VARCHAR(200);
   DECLARE var_pccode		VARCHAR(10);
   DECLARE var_mode		VARCHAR(10);
   DECLARE var_table_type		VARCHAR(10);
   DECLARE var_table		VARCHAR(20);
   DECLARE var_table_c		VARCHAR(20);
   DECLARE var_exttable VARCHAR(200);
   DECLARE var_info VARCHAR(200);
   DECLARE var_gsts INTEGER;
   DECLARE bz INT DEFAULT 0;
   DECLARE i INT DEFAULT 0;
   DECLARE j INT DEFAULT 0;
   DECLARE t_error INTEGER DEFAULT 0;  
   DECLARE done_cursor INT DEFAULT 0 ;
   DECLARE var_cursor CURSOR FOR SELECT tableno FROM tmp_table;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1;
   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;
  
   -- SET  arg_msg = "-1,登记失败!" ;  
 SELECT type1,pccode,biz_date,MODE,table_type,tableno,exttableno,gsts,market,source,saleid,saleinfo,phone,info,haccnt,`name`,cusno,cusinfo,cardno,cardinfo,res_name 
   INTO var_type1,var_pccode,var_date,var_mode,var_table_type,var_table,var_exttable,var_gsts,var_market,var_source,var_saleid,var_saleinfo,var_phone,var_info,var_haccnt,var_hname,var_cusno,var_cusinfo,var_cardno,var_cardinfo,var_resname
   FROM pos_res WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_resAccnt;
 
 
   SELECT descript,descript_en,menu_type,dsc_rate,serve_rate,tax_rate  INTO var_name,var_ename,var_menutype,var_dsc,var_srv,var_tax
          FROM pos_pccode WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = var_pccode;
   -- select dsc_rate,serve_rate,tax_rate INTO var_dsc,var_srv,var_tax from pos_pccode where  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND code = var_pccode;
    
   IF LENGTH(var_mode)<1 THEN
   		SELECT IFNULL(dec_mode,"") INTO var_mode FROM pos_pccode WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = var_pccode;
   		IF (var_mode = "") THEN
   			SELECT CODE INTO var_mode  FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_desc_mode' ORDER BY CODE  LIMIT 1 ;
   		END IF;
   END IF;
   IF LENGTH(var_market)<1 THEN
   SELECT CODE INTO var_market  FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_market' ORDER BY CODE  LIMIT 1 ;
   END IF;
   IF LENGTH(var_source)<1 THEN
   SELECT CODE INTO var_source  FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_source' ORDER BY CODE  LIMIT 1 ;
   END IF;
 -- 对扩展桌号进行遍历判断
 -- 扩展桌号分解表  
  DROP TEMPORARY TABLE IF EXISTS tmp_table ;
	CREATE TEMPORARY TABLE  tmp_table
	 (  
   `tableno` VARCHAR(20) NOT NULL
   );
   -- 预订选择了桌号
   IF LENGTH(var_table) >0 THEN 
       INSERT tmp_table VALUES (var_table);
   END IF;
   -- 预订选择了扩展桌号
   IF LENGTH(var_exttable) > 0 THEN
   SET var_spli_table = var_exttable ;
   SELECT LENGTH(var_spli_table)-LENGTH(REPLACE(var_spli_table,',',''))+1 INTO i ;
   SET j = 0;
   WHILE j< i DO
      SET j=j+1;
        IF(LENGTH(REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_spli_table,',',j)),',',1)) )>0 ) THEN
        INSERT  tmp_table
        SELECT REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_spli_table,',',j)),',',1));
        END IF;
      END WHILE ;
    END IF;
-- 分单不判断桌号 
   IF arg_split = '0' THEN
     OPEN var_cursor;
     SET done_cursor = 0;
     FETCH var_cursor INTO var_table_c;
     
     WHILE done_cursor<>1 DO  
       -- 判断桌号是否存在
         SELECT COUNT(1) INTO var_count FROM pos_pccode_table WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = var_table_c AND pccode = var_pccode ;
         IF var_count = 0 THEN 
            SET arg_msg = CONCAT("-1,",var_table_c,"桌号不存在!");
            SET bz = -1 ;
         END IF;
       -- 判断桌号是否可用
         SELECT COUNT(1) INTO var_count FROM pos_account WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND tableno = var_table_c AND pccode = var_pccode AND sta='I' ; -- AND shift = arg_shift;
         IF var_count > 0 THEN 
            SET arg_msg = CONCAT("-1,",var_table_c,"桌号已被占用!");
            SET bz = -1 ;
         END IF;
     FETCH var_cursor INTO var_table_c;
     END WHILE; 
     CLOSE var_cursor;
   END IF;
-- 如果预订选择了桌号类型，未选择具体桌号，查询可用桌号
IF LENGTH(var_table_type) >0 AND LENGTH(var_table) = 0 THEN
  -- 该类型下的存在桌号
   SELECT  CODE INTO var_table FROM pos_pccode_table WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND TYPE = var_table_type AND pccode = var_pccode
   AND CODE NOT IN 
   (SELECT tableno FROM pos_account WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND pccode = var_pccode AND sta='I' )
   ORDER BY CODE DESC LIMIT 1 ;
   IF LENGTH(var_table) = 0 THEN 
            SET arg_msg = CONCAT("-1,",var_table_type,"类型无可用桌号!");
            SET bz = -1 ;
   ELSE 
        TRUNCATE TABLE  tmp_table;
        INSERT tmp_table VALUES (var_table);
   END IF;
END IF;
  -- SELECT * FROM tmp_table; 
-- 表示
IF bz = 0 THEN
       -- 开始写入主单、账务 事物
        START TRANSACTION;
          SET  var_accnt = arg_accnt ;
               INSERT pos_master (hotel_group_id,hotel_id,accnt,type1,pccode,MODE,shift,empid,sta,biz_date,tableno,exttableno,gsts,saleid,saleinfo,phone,market,
                           source,dsc,srv,tax,info,haccnt,`name`,cusno,cusinfo,cardno,cardinfo,resno,accntinfo,create_user,create_datetime,modify_user,modify_datetime) 
               VALUES     (arg_hotel_group_id,arg_hotel_id,arg_accnt,var_type1,var_pccode,var_mode,arg_shift,arg_user,'I',var_date,var_table,var_exttable,var_gsts,var_saleid,var_saleinfo,var_phone,var_market,
                          var_source,var_dsc,var_srv,var_tax,var_info,var_haccnt,var_hname,var_cusno,var_cusinfo,var_cardno,var_cardinfo,arg_resAccnt,var_resname,arg_user,NOW(),arg_user,NOW());
     OPEN var_cursor;
     SET done_cursor = 0;
     SET j=0 ;
     FETCH var_cursor INTO var_table_c;
     WHILE done_cursor<>1 DO  
           SET j=j+1;
           INSERT pos_account (hotel_group_id,hotel_id,accnt,number,inumber,pccode,tableno,shift,empid,sta,biz_date,logdate,amount,
                             create_user,create_datetime,modify_user,modify_datetime) 
           VALUES     (arg_hotel_group_id,arg_hotel_id,arg_accnt,'1',j,var_pccode,var_table_c,arg_shift,arg_user,'I',var_date,NOW(),0,
                             arg_user,NOW(),arg_user,NOW());
     FETCH var_cursor INTO var_table_c;
     END WHILE; 
     CLOSE var_cursor;
     -- 开单项目生成到pos_order  暂不使用
          -- INSERT pos_order (hotel_group_id,hotel_id,pcid,accnt,type,inumber,descript,descript_en,plu_code,unit,price,number,amount,sta,flag,tableno,siteno,
         --                    create_user,create_datetime,modify_user,modify_datetime) 
        --   VALUES   (arg_hotel_group_id,arg_hotel_id,arg_pcid,arg_accnt,1,1,'茶位费','Tea','X','','0.00','1','0.00','I','',var_table,var_table,
         --                    arg_user,NOW(),arg_user,NOW()),
        --            (arg_hotel_group_id,arg_hotel_id,arg_pcid,arg_accnt,1,2,'附加费','Tax','Y','','0.00','1','0.00','I','',var_table,var_table,
          --                   arg_user,NOW(),arg_user,NOW()),
           --         (arg_hotel_group_id,arg_hotel_id,arg_pcid,arg_accnt,1,3,'服务费','server','Z','','0.00','1','0.00','I','',var_table,var_table,
           --                  arg_user,NOW(),arg_user,NOW());
 -- 预订菜式生成到pos_order
       IF EXISTS (SELECT 1 FROM pos_res_order a WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND  a.accnt = arg_resAccnt ) THEN
           INSERT pos_order (hotel_group_id,hotel_id,pcid,accnt,inumber,tnumber,anumber,mnumber,TYPE,orderno,cond_code,descript,descript_en,note_code,sort_code,plu_code,tocode,unit,price,number,amount,sta,flag,flag1,empid,logdate,tableno,siteno,
                 create_user,create_datetime,modify_user,modify_datetime) 
           SELECT  hotel_group_id,hotel_id,arg_pcid,arg_accnt,inumber,tnumber,anumber,mnumber,TYPE,orderno,'',REPLACE(descript,'**',''),IFNULL(descript_en,''),note_code,sort_code,plu_code,cond_code,unit,price,number,price*number,IFNULL(sta,'I'),flag,flag1,arg_user,NOW(),var_table,var_table,
                             create_user,create_datetime,modify_user,modify_datetime
           FROM pos_res_order WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_resAccnt AND sta = 'I';
           IF t_error = 1 THEN
		SET  arg_msg = "-1,预点菜转储失败!" ;  
	    END IF;
           -- 更新套菜明细菜对应  废弃 预点菜的时候已经处理了 2016-02-26
   /*               UPDATE pos_order a,  
                   (SELECT tnumber,plu_code FROM  pos_order WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt )b
                  SET a.inumber = b.tnumber,a.descript = replace(descript,'**','')
                  WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt AND a.flag1 = b.plu_code   ;
                  UPDATE pos_order a  SET a.flag1 = '0000000000' 
                  WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt ;
  */
           -- 更新主单
                   UPDATE pos_master SET lastnum = lastnum +(SELECT COUNT(*) FROM pos_res_order WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_resAccnt )
                   WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt ;
       END IF;
          
     -- 更新预订主单状态
          UPDATE pos_res  SET sta = 'I',modify_user = arg_user ,modify_datetime = NOW()  WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_resAccnt;
         IF EXISTS (SELECT 1 FROM pos_pay a WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND  a.accnt = arg_resAccnt ) THEN
     -- 预订金转进pos_account
          INSERT pos_account (hotel_group_id,hotel_id,accnt,number,inumber,shift,pccode,tableno,empid,biz_date,logdate,paycode,descript,credit,foliono,orderno,flag,sta,info1,
                             create_user,create_datetime,modify_user,modify_datetime) 
          SELECT a.hotel_group_id,a.hotel_id,arg_accnt,2,0,b.shift,a.pccode,a.tableno,b.modify_user,b.biz_date,NOW(),b.pccode,b.descript,b.credit,b.foliono,a.accnt,'DJ','I',b.info1,arg_user,NOW(),arg_user,NOW() 
          FROM pos_res a LEFT JOIN pos_pay b ON a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt  
          WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND  a.accnt = arg_resAccnt ;
           IF t_error = 1 THEN
		SET  arg_msg = "-1,定金转储失败!" ;  
	    END IF;
    -- 定金管理pos_pay 状态改成已经使用  
           UPDATE pos_pay  SET  trand = 'T',taccnt = arg_accnt ,tshift = arg_shift,sta= 'O' ,tempid = arg_user, tbdate = var_date,dtl_accnt = arg_accnt ,modify_user = arg_user ,modify_datetime = NOW() 
                            WHERE hotel_group_id = arg_hotel_group_id AND  hotel_id = arg_hotel_id AND  accnt = arg_resAccnt ;
           END IF;
-- ------------------------------------------------------------------------------------
-- 插入同步表
    INSERT pos_accnt_sync  (hotel_group_id,hotel_id,entity_name,accnt,res_accnt,TYPE,is_sync,is_halt,create_user,create_datetime,modify_user,modify_datetime)
    VALUES (arg_hotel_group_id,arg_hotel_id,'com.greencloud.entity.PosMaster',arg_accnt,arg_resAccnt,'ADD','F','F','ADMIN',NOW(),'ADMIN',NOW());
-- ------------------------------------------------------------------------------------
    IF t_error = 1 THEN  
           ROLLBACK;  
           IF (IFNULL(arg_msg,'') = '') THEN
		SET  arg_msg = "-1,登记失败!" ;  
	    END IF;
          
       ELSE  
           COMMIT;  
           SET  arg_msg = CONCAT(arg_accnt,",桌号:",var_table,",",var_exttable, "登记成功!") ;  
       END IF; 
 END IF ; 
     
	SELECT arg_msg;
	 
	
	BEGIN
		DROP TEMPORARY TABLE IF EXISTS tmp_table; 
		
		SET @procresult = 0 ;
		LEAVE label_0 ;
	END ; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_data_init`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_data_init`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_data_init`(IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
  OUT arg_msg		VARCHAR(60))
    SQL SECURITY INVOKER
label_0:
BEGIN
	-- 餐饮初始化过程
  
   DECLARE t_error INTEGER DEFAULT 0;  
   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;
   SET  arg_msg = "1,系统初始化完成!" ;  
  
        START TRANSACTION;
                  DELETE FROM  pos_res WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
									DELETE FROM  pos_pay WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
								  DELETE FROM  pos_res_order WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
                  DELETE FROM  pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
	                DELETE FROM  pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id ;
	                DELETE FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
                  DELETE FROM  pos_order WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
                  DELETE FROM  pos_master_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
	                DELETE FROM  pos_account_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id ;
	                DELETE FROM  pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
					 DELETE FROM  pos_accnt_sync WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
                  -- DELETE FROM  pos_sort_all where hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
									-- DELETE FROM  pos_plu_all where hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
									
                  -- DELETE FROM  pos_mode_def where hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
               
                  DELETE FROM  pos_detail_jie WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id ;
                  DELETE FROM  pos_detail_dai WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id ;      
                
                  UPDATE  sys_option SET set_value = DATE(NOW())  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
                  UPDATE  sys_option SET set_value = DATE(NOW())  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'biz_date';
 
                     IF t_error = 1 THEN  
                     ROLLBACK;  
                     SET  arg_msg = "-1,系统初始化失败!" ;  
          
                     ELSE  
                     COMMIT;  
                     SET  arg_msg = "1,系统初始化完成!" ;  
                     END IF; 
	
	BEGIN		
		LEAVE label_0;
	END; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_detail_dsc_for_ky`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_detail_dsc_for_ky`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_detail_dsc_for_ky`(IN arg_hotel_group_id	INT,
	IN arg_hotel_id			INT,
	IN arg_biz_date			DATETIME,
	IN arg_accnt			VARCHAR(20),
	IN arg_cardno			VARCHAR(20),
	IN arg_mode			VARCHAR(20),
	IN arg_dsc    			DECIMAL(12,2),
	IN arg_srv    			DECIMAL(12,2),
	IN arg_tax    			DECIMAL(12,2),
	OUT arg_ret			VARCHAR(50))
    SQL SECURITY INVOKER
BEGIN
	DECLARE var_fdcode		VARCHAR(20);
	DECLARE	var_becode		VARCHAR(20);
	DECLARE	var_mccode		VARCHAR(20);
	DECLARE	var_discode1		VARCHAR(20);
	DECLARE	var_discode2		VARCHAR(20);
	DECLARE var_discode3		VARCHAR(20);
	DECLARE	var_discode4		VARCHAR(20);
	DECLARE	var_discode5		VARCHAR(20);
	DECLARE	var_discode6		VARCHAR(20);
	DECLARE var_discode7		VARCHAR(20);
	DECLARE	var_discode8		VARCHAR(20);
	DECLARE var_discode9		VARCHAR(20);
	DECLARE	var_discode10		VARCHAR(20);
	
	DECLARE var_fdrate		DECIMAL(10,2);
	DECLARE var_berate		DECIMAL(10,2);
	DECLARE var_mcrate		DECIMAL(10,2);
	DECLARE var_disrate1		DECIMAL(10,2);
	DECLARE var_disrate2		DECIMAL(10,2);
	
	DECLARE var_amount		DECIMAL(10,2);
	DECLARE	var_dsc			DECIMAL(10,2);
	DECLARE var_tax			DECIMAL(10,2);
	DECLARE var_srv			DECIMAL(10,2);
	DECLARE var_ml_amount 		DECIMAL(12,2);
	DECLARE var_ml 			INT DEFAULT 0;
	DECLARE var_shift 		VARCHAR(10) ;
	DECLARE var_table 		VARCHAR(10) ;
	DECLARE var_credit		DECIMAL(12,2);
	DECLARE var_pccode		VARCHAR(20);
	
label:BEGIN	
	SET arg_ret = '1,折扣修改成功';
	SELECT pccode INTO var_pccode FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt ;
	
	IF EXISTS(SELECT 1 FROM pos_discount_rate_kaiyuan WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND cardno = arg_cardno) THEN
		SELECT fooddiscount,beveDiscount,miscDiscount,discount1,discount2 INTO var_fdrate,var_berate,var_mcrate,var_disrate1,var_disrate2 FROM pos_discount_rate_kaiyuan 
			WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND cardno = arg_cardno;
		IF var_fdrate <> 0 THEN
		--	SELECT * FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_item_type' AND descript_en = 'FoodDiscount';
			SELECT CODE INTO var_fdcode FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_item_type' AND descript_en = 'FoodDiscount' LIMIT 1;
			IF (IFNULL(var_fdcode,'') <> '') THEN
				UPDATE pos_detail a,code_base b SET a.dsc = ROUND(IFNULL(amount*var_fdrate,0),2),a.flag1 = CONCAT('1',SUBSTRING(a.flag1,2,LENGTH(a.flag1))),reason = 'KL',reason = 'KL' WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id 
					AND b.hotel_id = arg_hotel_id AND a.accnt = arg_accnt AND a.sta = 'I' AND b.parent_code = 'pos_rep_item' AND b.group_code = var_fdcode AND a.tocode = b.code;
			END IF;
		END IF;
		
		IF var_berate <> 0 THEN
			SELECT CODE INTO var_becode FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_item_type' AND descript_en = 'BeveDiscount';
			IF (IFNULL(var_fdcode,'') <> '') THEN
				UPDATE pos_detail a,code_base b SET a.dsc = ROUND(IFNULL(amount*var_berate,0),2),a.flag1 = CONCAT('1',SUBSTRING(a.flag1,2,LENGTH(a.flag1))),reason = 'KL' WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id 
					AND b.hotel_id = arg_hotel_id AND a.accnt = arg_accnt  AND a.sta = 'I' AND b.parent_code = 'pos_rep_item' AND b.group_code = var_becode AND a.tocode = b.code;
			END IF;
		END IF;
		IF var_mcrate <> 0 THEN
			SELECT CODE INTO var_mccode FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_item_type' AND descript_en = 'MiscDiscount';
			IF (IFNULL(var_fdcode,'') <> '') THEN
				UPDATE pos_detail a,code_base b SET a.dsc = ROUND(IFNULL(amount*var_mcrate,0),2),a.flag1 = CONCAT('1',SUBSTRING(a.flag1,2,LENGTH(a.flag1))),reason = 'KL' WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id 
					AND b.hotel_id = arg_hotel_id AND a.accnt = arg_accnt  AND a.sta = 'I' AND b.parent_code = 'pos_rep_item' AND b.group_code = var_mccode AND a.tocode = b.code;
			END IF;
		END IF;
		IF var_disrate1 <> 0 THEN
			SELECT CODE INTO var_discode1 FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_item_type' AND descript_en = 'Discount_1';
			IF (IFNULL(var_fdcode,'') <> '') THEN
				UPDATE pos_detail a,code_base b SET a.dsc = ROUND(IFNULL(amount*var_disrate1,0),2),a.flag1 = CONCAT('1',SUBSTRING(a.flag1,2,LENGTH(a.flag1))),reason = 'KL' WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id 
					AND b.hotel_id = arg_hotel_id AND a.accnt = arg_accnt  AND a.sta = 'I' AND b.parent_code = 'pos_rep_item' AND b.group_code = var_discode1 AND a.tocode = b.code;
			END IF;
		END IF;
		IF var_disrate2 <> 0 THEN
			SELECT CODE INTO var_discode2 FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_item_type' AND descript_en = 'Discount_2';
			IF (IFNULL(var_fdcode,'') <> '') THEN
				UPDATE pos_detail a,code_base b SET a.dsc = ROUND(IFNULL(amount*var_disrate2,0),2),a.flag1 = CONCAT('1',SUBSTRING(a.flag1,2,LENGTH(a.flag1))),reason = 'KL' WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id 
					AND b.hotel_id = arg_hotel_id AND a.accnt = arg_accnt  AND a.sta = 'I' AND b.parent_code = 'pos_rep_item' AND b.group_code = var_discode2 AND a.tocode = b.code;
			END IF;
		END IF;
	END IF;
	
 -- 计算每个菜的服务费，明细有效菜、非免服务费
	UPDATE pos_detail SET srv = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,arg_mode,var_pccode,sort_code,CODE,amount,arg_srv,'2'),0)
		WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND TYPE ='1' AND  sta='I' AND amount<>0 AND SUBSTRING(flag1,6,1)<>'1' AND CODE <> 'ML';   
 -- 计算没个菜的税费，明细有效菜
	UPDATE pos_detail SET tax = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,arg_mode,var_pccode,sort_code,CODE,amount,arg_tax,'3'),0)
		WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND TYPE ='1' AND  sta='I' AND amount<>0  AND CODE <> 'ML';
	
		    --  抹零处理
	SELECT b.dec_length ,a.shift,a.tableno INTO var_ml,var_shift,var_table  FROM pos_master a LEFT JOIN pos_pccode b ON a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.pccode = b.code 
										    WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt ;    
	IF(var_ml = 0) THEN
		SELECT  ROUND(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax),0)-(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)) INTO var_ml_amount
				    FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND  sta='I' ;
	ELSEIF(var_ml = 1) THEN
		SELECT  ROUND(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax),1)-(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)) INTO var_ml_amount
				    FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND  sta='I' ;
	ELSEIF(var_ml = 2) THEN
		SELECT  ROUND(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax),2)-(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)) INTO var_ml_amount
				    FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND  sta='I' ;
	ELSEIF(var_ml = 3) THEN
		SELECT  TRUNCATE((SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)),0)-(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)) INTO var_ml_amount
				    FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND  sta='I' ; 
	ELSEIF(var_ml = 4) THEN
		SELECT  TRUNCATE((SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)),1)-(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)) INTO var_ml_amount
				    FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND  sta='I' ; 
	ELSEIF(var_ml = 5) THEN
		SELECT  TRUNCATE((SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)),2)-(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)) INTO var_ml_amount
				    FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND  sta='I' ; 
	END IF;
				    
	IF(var_ml_amount <> '0.00') THEN
		INSERT INTO pos_detail (`hotel_group_id`, `hotel_id`, `accnt`,  `type`,  `sta`, `shift`,`biz_date`, `note_code`, `sort_code`, `code`, `tocode`, `descript`, `descript_en`, `unit`, `number`, 
			     `price`, `amount`, `tableno`, `flag`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) 
			VALUES(arg_hotel_group_id,arg_hotel_id,arg_accnt,'1','I',var_shift,arg_biz_date,'SYS','SYS','ML','098','抹零','Maling','份','1',var_ml_amount,var_ml_amount,var_table,'000000000000000000000000000000','ADMIN',NOW(),'ADMIN',NOW());
	   
	END IF;
	SELECT IFNULL(SUM(amount),0) AS amount ,IFNULL(SUM(dsc),0) AS dsc ,IFNULL(SUM(srv),0) AS srv ,IFNULL(SUM(tax),0) AS tax  
		INTO var_amount,var_dsc,var_srv,var_tax
			FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta='I' AND accnt = arg_accnt GROUP BY hotel_group_id,hotel_id,accnt;
	      -- 折扣 服务费计算完成 后 更新master  
	UPDATE pos_master a
		SET a.amount = var_amount, a.dscamount = var_dsc,a.srvamount = var_srv ,a.taxamount = var_tax ,a.charge = var_amount+var_srv+var_tax-var_dsc
				WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt;
	    -- 对应detail桌号 更新account 消费信息
	UPDATE pos_account a  SET a.amount  = 0  WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt AND a.number = '1' ;
	    
	UPDATE pos_account a ,( SELECT hotel_group_id,hotel_id,accnt,tableno,SUM(amount) AS amount
			    FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND sta='I'  AND accnt = arg_accnt GROUP BY hotel_group_id,hotel_id,accnt,tableno )  b  
			SET a.amount = b.amount 
				WHERE a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt AND a.tableno=b.tableno 
					AND a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = arg_biz_date AND a.accnt = arg_accnt AND a.number = '1';
	    
	 -- 更新master 的付款信息
	SELECT IFNULL(SUM(credit),0) INTO var_credit  FROM  pos_account  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND sta = 'I'  AND number = '2' ;
	UPDATE pos_master a SET a.credit =  var_credit WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt;
END label; 	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_detail_mode_calc`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_detail_mode_calc`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_detail_mode_calc`(IN arg_hotel_group_id	INT,
	IN arg_hotel_id			INT,
	IN arg_biz_date			DATETIME,
	IN arg_accnt			VARCHAR(20),
	IN arg_mode			VARCHAR(10),
	IN arg_dsc    DECIMAL(12,2),
	IN arg_srv    DECIMAL(12,2),
	IN arg_tax    DECIMAL(12,2),
	OUT arg_ret				INT)
    SQL SECURITY INVOKER
label_0:
BEGIN
	
  --  主单模式计算过程
   DECLARE var_bizdate DATETIME ;
   DECLARE var_billno VARCHAR(20) ;
   DECLARE var_apportion DECIMAL(12,2);
   DECLARE var_apportion_ce DECIMAL(12,2);
   DECLARE var_ml_amount DECIMAL(12,2);
   DECLARE var_ml INT DEFAULT 0;
   DECLARE var_credit DECIMAL(12,2);
   DECLARE var_sta VARCHAR(10) ;
   DECLARE var_pccode VARCHAR(10) ;
   DECLARE var_shift VARCHAR(10) ;
   DECLARE var_table VARCHAR(10) ;
   DECLARE var_amount DECIMAL(12,2)  DEFAULT 0;
   DECLARE var_dsc DECIMAL(12,2) DEFAULT 0;
   DECLARE var_srv DECIMAL(12,2) DEFAULT 0;
   DECLARE var_tax DECIMAL(12,2) DEFAULT 0;
   DECLARE i INT DEFAULT 0;
   DECLARE j INT DEFAULT 0;
   DECLARE detail_id BIGINT ;
   DECLARE t_error INTEGER DEFAULT 0;  
   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;
	SET @procresult = 0 ;
	SET arg_ret = -1 ;
      SELECT sta INTO var_sta FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt ;
--  计算 折扣金额 服务费金额 附加税金额
   IF var_sta='I' OR var_sta = 'C' THEN 
 
	    SELECT pccode INTO var_pccode FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt ;
	 -- 明细菜项有效 而且 非单菜折扣  且非 单菜款待
	    DELETE FROM  pos_detail WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND CODE = 'ML';
	 -- 计算每个菜的折扣金额，明细有效菜、非单菜折扣、非赠送
	    UPDATE pos_detail SET dsc = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,arg_mode,var_pccode,sort_code,CODE,amount,arg_dsc,'1'),0)
			WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND TYPE ='1' AND  sta='I' AND amount<>0 AND SUBSTRING(flag1,1,1)<>'1' AND SUBSTRING(flag1,5,1)<>'1' AND CODE <> 'ML';   
	 -- 计算每个菜的服务费，明细有效菜、非免服务费
	    UPDATE pos_detail SET srv = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,arg_mode,var_pccode,sort_code,CODE,amount,arg_srv,'2'),0)
			WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND TYPE ='1' AND  sta='I' AND amount<>0 AND SUBSTRING(flag1,6,1)<>'1' AND CODE <> 'ML';   
	 -- 计算没个菜的税费，明细有效菜
	    UPDATE pos_detail SET tax = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,arg_mode,var_pccode,sort_code,CODE,amount,arg_tax,'3'),0)
			WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND TYPE ='1' AND  sta='I' AND amount<>0  AND CODE <> 'ML';
			
	    --  抹零处理
	    SELECT b.dec_length ,a.shift,a.tableno INTO var_ml,var_shift,var_table  FROM pos_master a LEFT JOIN pos_pccode b ON a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.pccode = b.code 
										    WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt ;    
	    IF(var_ml = 0) THEN
		    SELECT  ROUND(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax),0)-(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)) INTO var_ml_amount
				    FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND  sta='I' ;
	    ELSEIF(var_ml = 1) THEN
		SELECT  ROUND(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax),1)-(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)) INTO var_ml_amount
				    FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND  sta='I' ;
	    ELSEIF(var_ml = 2) THEN
		SELECT  ROUND(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax),2)-(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)) INTO var_ml_amount
				    FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND  sta='I' ;
	    ELSEIF(var_ml = 3) THEN
		    SELECT  TRUNCATE((SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)),0)-(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)) INTO var_ml_amount
				    FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND  sta='I' ; 
	    ELSEIF(var_ml = 4) THEN
		    SELECT  TRUNCATE((SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)),1)-(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)) INTO var_ml_amount
				    FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND  sta='I' ; 
	    ELSEIF(var_ml = 5) THEN
		    SELECT  TRUNCATE((SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)),2)-(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)) INTO var_ml_amount
				    FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND  sta='I' ; 
	    END IF;
				    
	    IF(var_ml_amount <> '0.00') THEN
			INSERT INTO pos_detail (`hotel_group_id`, `hotel_id`, `accnt`,  `type`,  `sta`, `shift`,`biz_date`, `note_code`, `sort_code`, `code`, `tocode`, `descript`, `descript_en`, `unit`, `number`, 
				     `price`, `amount`, `tableno`, `flag`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) 
				VALUES(arg_hotel_group_id,arg_hotel_id,arg_accnt,'1','I',var_shift,arg_biz_date,'SYS','SYS','ML','098','抹零','Maling','份','1',var_ml_amount,var_ml_amount,var_table,'000000000000000000000000000000','ADMIN',NOW(),'ADMIN',NOW());
	   
	    END IF;
	    SELECT IFNULL(SUM(amount),0) AS amount ,IFNULL(SUM(dsc),0) AS dsc ,IFNULL(SUM(srv),0) AS srv ,IFNULL(SUM(tax),0) AS tax  
		INTO var_amount,var_dsc,var_srv,var_tax
			FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta='I' AND accnt = arg_accnt GROUP BY hotel_group_id,hotel_id,accnt;
	      -- 折扣 服务费计算完成 后 更新master  
	    UPDATE pos_master a
			SET a.amount = var_amount, a.dscamount = var_dsc,a.srvamount = var_srv ,a.taxamount = var_tax ,a.charge = var_amount+var_srv+var_tax-var_dsc
				WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt;
	    -- 对应detail桌号 更新account 消费信息
	    UPDATE pos_account a  SET a.amount  = 0  WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt AND a.number = '1' ;
	    
	    UPDATE pos_account a ,( SELECT hotel_group_id,hotel_id,accnt,tableno,SUM(amount) AS amount
				    FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND sta='I'  AND accnt = arg_accnt GROUP BY hotel_group_id,hotel_id,accnt,tableno )  b  
			SET a.amount = b.amount 
				WHERE a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt AND a.tableno=b.tableno 
					AND a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = arg_biz_date AND a.accnt = arg_accnt AND a.number = '1';
	    
	 -- 更新master 的付款信息
	    SELECT IFNULL(SUM(credit),0) INTO var_credit  FROM  pos_account  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND sta = 'I'  AND number = '2' ;
	    UPDATE pos_master a SET a.credit =  var_credit WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt;
	     -- 完成返回
	    SET arg_ret = 1 ;
   ELSE IF var_sta = 'S' THEN
	    -- 历史账务 
	    SELECT pccode INTO var_pccode FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt ;
	 -- 计算每个菜的折扣金额，明细有效菜、非单菜折扣、非赠送
	    UPDATE pos_detail SET dsc = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,arg_mode,var_pccode,sort_code,CODE,amount,arg_dsc,'1'),0)
			WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND TYPE ='1' AND  sta='I' AND amount<>0 AND SUBSTRING(flag1,1,1)<>'1' AND SUBSTRING(flag1,5,1)<>'1' AND CODE <> 'ML';   
	 -- 计算每个菜的服务费，明细有效菜、非免服务费
	    UPDATE pos_detail SET srv = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,arg_mode,var_pccode,sort_code,CODE,amount,arg_srv,'2'),0)
			WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND TYPE ='1' AND  sta='I' AND amount<>0 AND SUBSTRING(flag1,6,1)<>'1' AND CODE <> 'ML';   
	 -- 计算没个菜的税费，明细有效菜
	    UPDATE pos_detail SET tax = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,arg_mode,var_pccode,sort_code,CODE,amount,arg_tax,'3'),0)
			WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND TYPE ='1' AND  sta='I' AND amount<>0  AND CODE <> 'ML';
	    SELECT IFNULL(SUM(amount),0) AS amount ,IFNULL(SUM(dsc),0) AS dsc ,IFNULL(SUM(srv),0) AS srv ,IFNULL(SUM(tax),0) AS tax  
			INTO var_amount,var_dsc,var_srv,var_tax
				FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta='I' AND accnt = arg_accnt GROUP BY hotel_group_id,hotel_id,accnt;
	      -- 折扣 服务费计算完成 后 更新master  
	    UPDATE pos_master a
			SET a.amount = var_amount, a.dscamount = var_dsc,a.srvamount = var_srv ,a.taxamount = var_tax ,a.charge = var_amount+var_srv+var_tax-var_dsc
				WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt;
	      -- 对应detail桌号 更新account 消费信息
	    UPDATE pos_account a  SET a.amount  = 0  WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt AND a.number = '1' ;
	     -- 更新master 的付款信息
	    SELECT IFNULL(SUM(credit),0) INTO var_credit  FROM  pos_account  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND sta = 'S'  AND number = '2' ;
	    UPDATE pos_master a  
	    SET a.credit =  var_credit
	    WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt;
	     -- 完成返回
	    SET arg_ret = 1 ;
     END IF; 
  END IF;
	BEGIN
		SET @procresult = 0 ;
		LEAVE label_0 ;
	END ; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_detail_mode_view`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_detail_mode_view`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_detail_mode_view`(IN arg_hotel_group_id	INT,
	IN arg_hotel_id			INT,
  IN arg_biz_date			DATETIME,
  IN arg_accnts			VARCHAR(100), IN arg_flag			VARCHAR(10))
    SQL SECURITY INVOKER
label_0:
BEGIN
	
   DECLARE i INT DEFAULT 0;
   DECLARE j INT DEFAULT 0;
   DECLARE var_bizdate DATETIME;
   DECLARE var_accnts VARCHAR(100);
   DECLARE var_number DECIMAL(12,2);
   DECLARE var_amount DECIMAL(12,2);
   DECLARE var_dsc DECIMAL(12,2);
   DECLARE var_srv DECIMAL(12,2);
   DECLARE var_tax DECIMAL(12,2);
   DECLARE var_amount0 DECIMAL(12,2);
 DROP TEMPORARY TABLE IF EXISTS `pos_detail_view` ;
CREATE TEMPORARY TABLE `pos_detail_view` (
  `accnt` CHAR(20)  DEFAULT '' ,   
  `tableno` VARCHAR(10) DEFAULT '',
  `descript` VARCHAR(80)  DEFAULT '' COMMENT '菜名',
  `number` DECIMAL(12,2)  DEFAULT '0.00' COMMENT '数量',
  `price` DECIMAL(12,2)  DEFAULT '0.00' COMMENT '单价',
  `amount` DECIMAL(12,2)  DEFAULT '0.00' COMMENT ' 金额',
  `dsc` DECIMAL(12,2) DEFAULT '0.00' ,
  `srv` DECIMAL(12,2) DEFAULT '0.00' ,
  `tax` DECIMAL(12,2) DEFAULT '0.00' ,
  `amount0` DECIMAL(12,2) DEFAULT '0.00' ,
  `tocode` VARCHAR(3) DEFAULT '' ,
  `sort_code` VARCHAR(10)  DEFAULT '' ,
  `code` VARCHAR(10)  DEFAULT '' 
);
     DROP TEMPORARY TABLE IF EXISTS tmp_pos_accnt;
	   CREATE TEMPORARY TABLE tmp_pos_accnt (
           `accnt` VARCHAR(14) DEFAULT ''         
	    );
IF LENGTH(arg_accnts) > 0 THEN
   SET var_accnts = arg_accnts ;
   SELECT LENGTH(var_accnts)-LENGTH(REPLACE(var_accnts,',',''))+1 INTO i ;
   SET j = 0;
   WHILE j< i DO
      SET j=j+1;
        IF(LENGTH(REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_accnts,',',j)),',',1)) )>0 ) THEN
        INSERT  tmp_pos_accnt(accnt)
        SELECT REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_accnts,',',j)),',',1));
        END IF;
      END WHILE ;
    END IF;
      SELECT set_value INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'biz_date';
     SELECT TO_DAYS(arg_biz_date)-TO_DAYS(var_bizdate) INTO i;
      IF i=0 THEN  
           
           INSERT INTO pos_detail_view SELECT a.accnt,a.tableno,a.descript,a.number,a.price,a.amount,a.dsc,a.srv,a.tax,a.amount+a.srv+a.tax-a.dsc,a.tocode,a.sort_code,a.`code`
                                       FROM pos_detail a , tmp_pos_accnt b 
                                       WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = arg_biz_date  AND a.sta = 'I' AND a.type = '1' AND a.accnt = b.accnt  ORDER BY a.accnt,a.id;
         
     ELSE
          INSERT INTO pos_detail_view SELECT a.accnt,a.tableno,a.descript,a.number,a.price,a.amount,a.dsc,a.srv,a.tax,a.amount+a.srv+a.tax-a.dsc,a.tocode,a.sort_code,a.`code`
                                       FROM pos_detail a , tmp_pos_accnt b 
                                       WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = arg_biz_date  AND a.sta = 'I' AND a.type = '1' AND a.accnt = b.accnt  ORDER BY a.accnt,a.id;
          INSERT INTO pos_detail_view SELECT a.accnt,a.tableno,a.descript,a.number,a.price,a.amount,a.dsc,a.srv,a.tax,a.amount+a.srv+a.tax-a.dsc,a.tocode,a.sort_code,a.`code`
                                      FROM pos_detail_history a , tmp_pos_accnt b 
                                      WHERE    a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = arg_biz_date AND a.sta = 'I' AND a.type = '1' AND a.accnt = b.accnt  ORDER BY a.accnt,a.id;
      END IF ;
      SELECT SUM(number),SUM(amount),SUM(dsc),SUM(srv),SUM(tax),SUM(amount0) INTO var_number,var_amount,var_dsc,var_srv,var_tax,var_amount0  FROM pos_detail_view ;
     -- INSERT INTO pos_detail_view(accnt,amount,dsc,srv,tax,amount0) VALUES ('合计:',var_amount,var_dsc,var_srv,var_tax,var_amount0) ;
          -- 按菜品明细
          IF(arg_flag	 = '0') THEN  
                    INSERT INTO pos_detail_view(accnt,amount,dsc,srv,tax,amount0) VALUES ('合计:',var_amount,var_dsc,var_srv,var_tax,var_amount0) ;
                    SELECT a.accnt,a.tableno,a.descript,a.amount,a.dsc,a.srv,a.tax,a.amount0 FROM pos_detail_view a ;
          -- 按菜类
           ELSEIF (arg_flag	 = '1')  THEN
                   UPDATE  pos_detail_view a , pos_sort_all b SET a.descript = b.descript  WHERE a.sort_code = b.code AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id ;
                   INSERT INTO pos_detail_view(accnt,amount,dsc,srv,tax,amount0) VALUES ('合计:',var_amount,var_dsc,var_srv,var_tax,var_amount0) ;
                    SELECT a.accnt,'',a.descript,SUM(a.amount),SUM(a.dsc),SUM(a.srv),SUM(a.tax),SUM(a.amount0) FROM pos_detail_view a GROUP BY a.accnt,a.descript;
           -- 按桌号
           ELSEIF (arg_flag	 = '2')  THEN
                   INSERT INTO pos_detail_view(accnt,amount,dsc,srv,tax,amount0) VALUES ('合计:',var_amount,var_dsc,var_srv,var_tax,var_amount0) ;
                      SELECT a.accnt,a.tableno,'',SUM(a.amount),SUM(a.dsc),SUM(a.srv),SUM(a.tax),SUM(a.amount0) 
                      FROM pos_detail_view a
                      GROUP BY a.accnt , a.tableno ;
           --  按报表数据项
          ELSEIF (arg_flag	 = '3')  THEN
                   INSERT INTO pos_detail_view(accnt,amount,dsc,srv,tax,amount0) VALUES ('合计:',var_amount,var_dsc,var_srv,var_tax,var_amount0) ;
                   DROP TEMPORARY TABLE IF EXISTS tmp_code_base;
                   CREATE TEMPORARY TABLE tmp_code_base SELECT * FROM  code_base  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND parent_code = 'pos_rep_item';
                      SELECT a.accnt,'',b.descript,SUM(a.amount),SUM(a.dsc),SUM(a.srv),SUM(a.tax),SUM(a.amount0) 
                      FROM pos_detail_view a LEFT JOIN tmp_code_base b  ON a.tocode = b.code
                      GROUP BY a.accnt , a.tocode ;
           END IF ;
	BEGIN
		DROP TEMPORARY TABLE IF EXISTS pos_detail_view; 
    DROP TEMPORARY TABLE IF EXISTS tmp_code_base;
		LEAVE label_0 ;
	END ; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_input_dishcard_kitmsg`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_input_dishcard_kitmsg`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_input_dishcard_kitmsg`(
	IN 	arg_hotel_group_id	BIGINT(16),	
	IN 	arg_hotel_id		BIGINT(16),
	IN 	arg_accnt		VARCHAR(20),
	IN 	arg_type		CHAR(1),
	IN 	arg_mode 		CHAR(1),
	IN 	arg_id			BIGINT(16),
	IN 	arg_otableno		VARCHAR(20),
	IN 	arg_ntableno		VARCHAR(20),
	IN 	arg_station		BIGINT,
	IN 	arg_empno		VARCHAR(20),
	IN 	arg_kitmsg		VARCHAR(80),
	OUT 	arg_ret			INT,
	OUT 	arg_msg			VARCHAR(60)
	)
    SQL SECURITY INVOKER
BEGIN
	DECLARE 	var_tag			CHAR(1);
	DECLARE		var_tableno		VARCHAR(20);
	DECLARE		var_plucode		VARCHAR(20);
	DECLARE		var_printer		VARCHAR(10);
	DECLARE 	var_station_code	VARCHAR(20);
	DECLARE		var_biz_date		DATETIME;
	DECLARE		var_gsts		INT;
	DECLARE		var_pccode		VARCHAR(20);
	DECLARE		var_pccode_desc		VARCHAR(50);
	DECLARE		var_ntable_name		VARCHAR(50);
	DECLARE		var_otable_name		VARCHAR(50);
	DECLARE		var_kitmsg		VARCHAR(80);
	DECLARE t_error INTEGER DEFAULT 0;  
	DECLARE done_cursor 		INT DEFAULT 0 ;
	DECLARE var_printer_cus CURSOR FOR SELECT DISTINCT printer FROM pos_dishcard WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt ORDER BY printer;
	DECLARE var_printer_sin_cus CURSOR FOR SELECT DISTINCT printer FROM pos_dishcard WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND printid = arg_id ORDER BY printer;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1; 
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1; 
label:BEGIN
	-- arg_type='3' 厨房消息   arg_mode='A':换桌消息,'B':整单厨房消息,'C':单菜厨房消息
	SET arg_ret = 1,arg_msg = '1,厨房消息发送成功!';
	
	INSERT INTO a(msg) SELECT CONCAT(arg_accnt,'/',arg_type,'/',arg_mode,'/',arg_id,'/',arg_otableno,'/',arg_ntableno);
	SELECT CODE INTO var_station_code FROM work_station WHERE id = arg_station AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
	-- 获取送单站点总单相关信息
	SELECT tag INTO var_tag FROM pos_station WHERE CODE = var_station_code AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
	IF var_tag <> '1' THEN
		SET arg_ret = 1,arg_msg = '1,该站点不需要出单!';
		LEAVE label;
	END IF;
	SELECT a.gsts,a.pccode,b.descript,a.biz_date INTO var_gsts,var_pccode,var_pccode_desc,var_biz_date FROM pos_master a,pos_pccode b WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt AND b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND a.pccode = b.code;
	
	IF (arg_mode = 'A') THEN
		SELECT IFNULL(descript,'') INTO var_ntable_name FROM pos_pccode_table WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_ntableno;
		SELECT IFNULL(descript,'') INTO var_otable_name FROM pos_pccode_table WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_otableno;
		SET var_kitmsg = CONCAT('转台:',var_otable_name,'-->',var_ntable_name);
		OPEN var_printer_cus;
		FETCH var_printer_cus INTO var_printer;
		WHILE done_cursor<>1 DO 
			INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
				SELECT arg_hotel_group_id,arg_hotel_id,arg_accnt,0,0,0,var_biz_date,var_pccode,var_pccode_desc,arg_ntableno,var_ntable_name,var_gsts,0,arg_type,'I','',var_kitmsg,var_kitmsg,NULL,NULL,NULL,NULL,'','',var_printer,var_printer,1,1,'C',0,'F',var_station_code,NULL,'',0,'',arg_empno,NOW(),NULL,NULL;
		FETCH var_printer_cus INTO var_printer;
		END WHILE; 
		CLOSE var_printer_cus;
		
		IF t_error <> 0 THEN
			SET arg_ret = 0,arg_msg = '0,消息插入出错!';
			LEAVE label;
		END IF;
	END IF;
	
	IF (arg_mode = 'B') THEN
		SELECT IFNULL(descript,'') INTO var_ntable_name FROM pos_pccode_table WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_ntableno;
		-- SELECT IFNULL(descript,'') INTO var_otable_name FROM pos_pccode_table WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_otableno;
		-- SET var_kitmsg = CONCAT('转台:',var_otable_name,'-->',var_ntable_name);
		OPEN var_printer_cus;
		FETCH var_printer_cus INTO var_printer;
		WHILE done_cursor<>1 DO 
			INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
				SELECT arg_hotel_group_id,arg_hotel_id,arg_accnt,0,0,0,var_biz_date,var_pccode,var_pccode_desc,arg_ntableno,var_ntable_name,var_gsts,0,arg_type,'I','',arg_kitmsg,arg_kitmsg,NULL,NULL,NULL,NULL,'','',var_printer,var_printer,1,1,'C',0,'F',var_station_code,NULL,'',0,'',arg_empno,NOW(),NULL,NULL;
		FETCH var_printer_cus INTO var_printer;
		END WHILE; 
		CLOSE var_printer_cus;
		IF t_error <> 0 THEN
			SET arg_ret = 0,arg_msg = '0,消息插入出错!';
			LEAVE label;
		END IF;
	END IF;	
	IF (arg_mode = 'C') THEN
		IF (IFNULL(arg_kitmsg,'') = '') THEN
			SET arg_ret = 0,arg_msg = '0,厨房消息为空!';
			LEAVE label;		
		END IF;
		
		SELECT IFNULL(descript,'') INTO var_ntable_name FROM pos_pccode_table WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_ntableno;
		OPEN var_printer_sin_cus;
		FETCH var_printer_sin_cus INTO var_printer;
		WHILE done_cursor<>1 DO 
			INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
				SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, var_biz_date, var_pccode, var_pccode_desc, arg_ntableno, var_ntable_name, var_gsts, 0, arg_type, 'I', a.code, CONCAT('[',arg_kitmsg,']',a.descript), a.descript_en, a.unit, a.price, a.number, a.amount, '', '', var_printer, var_printer, 1, 1, 'C', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, arg_empno, a.create_datetime, NULL, NULL 
					FROM pos_detail a WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt AND a.id = arg_id ;
		FETCH var_printer_sin_cus INTO var_printer;
		END WHILE; 
		CLOSE var_printer_sin_cus;
		IF t_error <> 0 THEN
			SET arg_ret = 0,arg_msg = '0,消息插入出错!';
			LEAVE label;
		END IF;
	END IF;	
	
END label; 
SELECT arg_ret,arg_msg;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_kitchen_get_data`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_kitchen_get_data`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_kitchen_get_data`(
	IN p_accnt CHAR(15),
	IN p_code CHAR(10),
	IN p_changed CHAR(1),
	IN arg_hotel_group_id BIGINT,
	IN arg_hotel_id BIGINT
	)
BEGIN
	#Routine body goes here...
	DECLARE var_printer_name        CHAR(20);   -- 打印机名称
	DECLARE	var_print_type_des     VARCHAR(20); -- 打印小单类型
	DECLARE print_times    INT;   -- 最多重复打印的次数
	DECLARE var_shift_des 		VARCHAR(10);
	
	SET print_times = 2;
	IF p_changed= '1' THEN
		SET var_print_type_des ='传菜总单';
	ELSEIF p_changed = '2' THEN
		SET var_print_type_des ='清单总单';
	ELSEIF p_changed = '3' THEN
		SET var_print_type_des ='厨师总单';
	ELSEIF p_changed = 'F' THEN
		SET var_print_type_des ='厨房分单';
	ELSEIF p_changed = 'H' THEN
		SET var_print_type_des ='合并打单';
	ELSEIF p_changed = 'C' THEN
		SET var_print_type_des ='厨房消息';
	END IF;
	
	SELECT shift INTO var_shift_des FROM pos_master WHERE accnt = p_accnt;
	IF var_shift_des = '1' THEN
		SET var_shift_des = '早班';
	ELSEIF var_shift_des = '2' THEN
		SET var_shift_des = '中班';
	ELSEIF var_shift_des = '3' THEN
		SET var_shift_des = '晚班';
	ELSEIF var_shift_des = '4' THEN
		SET var_shift_des = '夜班';
	ELSE
		SET var_shift_des = '未知';
	END IF;
	
	-- 获取传入打印机编码对应的打印机描述
	SELECT pos_printer.descript INTO var_printer_name FROM pos_printer WHERE pos_printer.`code` = p_code;
	SELECT id, p_number1 AS p_number1, descript AS descript, descript_en AS descript_en, number AS number,unit AS unit, price AS price,  cook AS cook, printid AS printid,
	TYPE AS TYPE,accnt AS accnt, modify_datetime AS modify_datetime, foliono AS foliono, sta AS sta, modify_user AS modify_user, CHANGED AS CHANGED, NULL AS top01, 
	CONCAT('桌号:',table_name,'  班次:',var_shift_des) AS top02, 
	CONCAT('档口:',var_printer_name,'    人数:',CAST(IFNULL(gsts,0) AS CHAR)) AS top03,
	-- CONCAT('营业点:',pccode_name,'    ','单号:',accnt,'*',var_print_type_des,'*',p_number) AS top03, 
	CONCAT('整单备注:',cook_all) AS top04, 
	NULL AS top05, 
	NULL AS top06, 
	NULL AS top07, 
	NULL AS top08, 
	NULL AS top09, 
	NULL AS top10, 
	'' AS tail1, 	
	CONCAT('点菜员:',IFNULL(create_user,'         '),'  点菜时间:',IFNULL(DATE_FORMAT( create_datetime, '%Y-%m-%d %h:%i:%s'),'        ')) AS tail2, 
	'--' AS tail3
	FROM pos_dishcard
	WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND `accnt`= p_accnt
	AND FIND_IN_SET(p_code,printer)> 0
	AND `changed` = p_changed
	AND times < print_times
	AND p_number > 0 
	ORDER BY accnt,inumber ;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_kitchen_get_task_id`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_kitchen_get_task_id`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_kitchen_get_task_id`(
	
	IN `pcode` CHAR(10),IN `pservercode` CHAR(3),IN `photel_group_id` CHAR(10),IN `photel_id` CHAR(10)
	)
BEGIN
	DECLARE	var_prt_name	          VARCHAR(60);-- 打印机名
	DECLARE list_id            INT;     -- 小单唯一序列号
	DECLARE rowcount					 INT;	
	SELECT  descript INTO var_prt_name  FROM pos_printer WHERE TRIM(print_server) = pservercode AND TRIM(`code`) = pcode;
	SET rowcount = FOUND_ROWS();
	IF rowcount = 0 THEN
		SET list_id=1;
	ELSE	
		SELECT list_order INTO list_id FROM code_base WHERE parent_code = 'portal_kitchen' AND `code` = pcode;
		SET rowcount = FOUND_ROWS();
		IF rowcount = 0 THEN -- 如果没有记录这台打印机序号
			INSERT INTO `code_base`(`hotel_group_id`,`hotel_id`,`code`,`parent_code`,`descript`,`descript_en`,`create_user`,`create_datetime`,`modify_user`,`modify_datetime`,list_order) 
				SELECT photel_group_id,photel_id, pcode, 'portal_kitchen',var_prt_name, var_prt_name,'SYS','2012-10-1 10:00:00','SYS','2012-10-1 10:00:00', 1 FROM DUAL;
			SET list_id=1;
		END IF;
		UPDATE `code_base` SET `list_order` = `list_order`  + 1 WHERE `parent_code` = 'portal_kitchen' AND `code` = pcode;
	END IF;
	SELECT list_id;
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_kitchen_input_dishcard`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_kitchen_input_dishcard`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_kitchen_input_dishcard`(
	IN 	arg_hotel_group_id	BIGINT(16),	
	IN 	arg_hotel_id		BIGINT(16),
	IN 	arg_accnt		VARCHAR(20),
	IN 	arg_id			BIGINT(16),
	IN 	arg_type		CHAR(1),
	IN 	arg_station		BIGINT,
	OUT 	arg_ret			INT,
	OUT 	arg_msg			VARCHAR(60)
	)
    SQL SECURITY INVOKER
BEGIN
	DECLARE 	var_tag			CHAR(1);
	DECLARE 	var_printer1 		VARCHAR(10);
	DECLARE 	var_printer2		VARCHAR(10);
	DECLARE 	var_printer3 		VARCHAR(10);
	DECLARE 	var_printer4 		VARCHAR(10);
	DECLARE 	var_printer5 		VARCHAR(10);
	DECLARE 	var_printer1_tbl 	VARCHAR(10);
	DECLARE 	var_printer2_tbl	VARCHAR(10);
	DECLARE 	var_printer3_tbl	VARCHAR(10);
	DECLARE 	var_printer4_tbl	VARCHAR(10);
	DECLARE 	var_printer5_tbl	VARCHAR(10);
	DECLARE		var_tableno		VARCHAR(10);
	DECLARE		var_tableno_desc	VARCHAR(10);
	DECLARE		var_pccode		VARCHAR(10);
	DECLARE		var_pccode_desc		VARCHAR(50);
	DECLARE		var_printers		VARCHAR(40);
	DECLARE		var_printer		VARCHAR(10);
	DECLARE		var_plucode		VARCHAR(20);
	DECLARE		var_flag11		CHAR(1);
	DECLARE		var_flag12		CHAR(1);
	DECLARE		var_flag13		CHAR(1);
	DECLARE 	var_flag14		CHAR(1);
	DECLARE	 	var_flag15		CHAR(1);
	DECLARE 	var_flag16		CHAR(1);
	DECLARE		var_flag17		CHAR(1);
	DECLARE 	var_flag18		CHAR(1);
	DECLARE		var_i			INT;
	DECLARE		var_descript		VARCHAR(50);
	DECLARE 	var_sort		VARCHAR(10);
	DECLARE 	var_code		VARCHAR(20);
	DECLARE 	var_station_code	VARCHAR(20);
	DECLARE t_error INTEGER DEFAULT 0;  
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1; 
label:BEGIN
	
--	insert gdsmsg select concat(arg_accnt,'/',arg_id);
	SET arg_ret = 1,arg_msg = '成功!';
	IF arg_type = '1' THEN
		-- 正常送单打印
		
		SELECT CODE INTO var_station_code FROM work_station WHERE id = arg_station AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		-- 获取送单站点总单相关信息
		SELECT tag,printer1,printer2,printer3,printer4,printer5 INTO var_tag,var_printer1,var_printer2,var_printer3,var_printer4,var_printer5 FROM pos_station WHERE CODE = var_station_code AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		IF var_tag <> '1' THEN
			LEAVE label;
		END IF;
		-- 获取桌号及营业点，及桌号中的清单和总单设置
		SELECT a.tableno,a.pccode,b.descript INTO var_tableno,var_pccode,var_pccode_desc FROM pos_master a,pos_pccode b WHERE a.accnt = arg_accnt AND a.pccode = b.code AND a.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id;
		SELECT descript,mapcode,placecode INTO var_tableno_desc,var_printer1_tbl,var_printer2_tbl FROM pos_pccode_table WHERE CODE = var_tableno AND pccode = var_pccode AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		-- select 1;
		-- 获取桌号描述，如果为空则和桌号一致
		IF var_tableno_desc = '' OR var_tableno_desc IS NULL THEN
			SET var_tableno_desc = var_tableno;
		END IF;
		-- 如果着好中总单有设置，则总单打印机跟着桌号走
		IF var_printer1_tbl <> '' AND var_printer1_tbl IS NOT NULL THEN
			SET var_printer1 = var_printer1_tbl;
		END IF;
		IF var_printer2_tbl <> '' OR var_printer2_tbl IS NOT NULL THEN
			SET var_printer2 = var_printer2_tbl;
		END IF;
		-- SELECT 2;
		-- 获取本菜的厨打相关信息
		IF EXISTS(SELECT 1 FROM pos_detail WHERE accnt = arg_accnt AND id = arg_id AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
			SELECT sort_code,CODE INTO var_sort,var_plucode FROM pos_detail WHERE accnt = arg_accnt AND id = arg_id AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			IF EXISTS(SELECT 1 FROM pos_plu_printer WHERE CODE = var_plucode AND sort_code = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT SUBSTRING(flag,11,1),SUBSTRING(flag,12,1),SUBSTRING(flag,13,1),SUBSTRING(flag,14,1),SUBSTRING(flag,15,1),SUBSTRING(flag,16,1),SUBSTRING(flag,17,1),SUBSTRING(flag,18,1)
					INTO var_flag11,var_flag12,var_flag13,var_flag14,var_flag15,var_flag16,var_flag17,var_flag18 FROM pos_plu_printer WHERE CODE = var_plucode AND sort_code = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSEIF EXISTS(SELECT 1 FROM pos_plu_printer WHERE CODE = 'all' AND sort_code = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT SUBSTRING(flag,11,1),SUBSTRING(flag,12,1),SUBSTRING(flag,13,1),SUBSTRING(flag,14,1),SUBSTRING(flag,15,1),SUBSTRING(flag,16,1),SUBSTRING(flag,17,1),SUBSTRING(flag,18,1)
					INTO var_flag11,var_flag12,var_flag13,var_flag14,var_flag15,var_flag16,var_flag17,var_flag18 FROM pos_plu_printer WHERE CODE = 'all' AND sort_code = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSE
				SET var_flag11 = '0',var_flag12 = '0',var_flag13 = '0',var_flag14 = '0',var_flag15 = '0',var_flag16 = '0',var_flag17 = '0',var_flag18 = '0';
			END IF;	
			-- select 	var_plucode,var_sort;
			-- 判断分单打印机的出单口，判断属性是 本营业点本菜项 - 默认营业点本菜项 - 本营业点本菜类 - 默认营业点本菜类 - 没有
			IF  EXISTS(SELECT 1 FROM pos_prnscope WHERE plucode = var_plucode AND pccode = var_pccode AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT IFNULL(printers,'') INTO var_printers FROM pos_prnscope WHERE plucode = var_plucode AND pccode = var_pccode AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSEIF EXISTS(SELECT 1 FROM pos_prnscope WHERE plucode = var_plucode AND pccode = '###' AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT IFNULL(printers,'') INTO var_printers FROM pos_prnscope WHERE plucode = var_plucode AND pccode = '###' AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSEIF EXISTS(SELECT 1 FROM pos_prnscope WHERE plucode = 'all' AND pccode = var_pccode AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT IFNULL(printers,'') INTO var_printers FROM pos_prnscope WHERE plucode = 'all' AND pccode = var_pccode AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSEIF EXISTS(SELECT 1 FROM pos_prnscope WHERE plucode = 'all' AND pccode = '###' AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT IFNULL(printers,'') INTO var_printers FROM pos_prnscope WHERE plucode = 'all' AND pccode = '###' AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSE
				SET var_printers = '';
			END IF;
			
			
		ELSE
			LEAVE label;
		END IF;
		-- 如果该菜没有设置对应的档口，则该菜所有的打印机都不出	
		-- IF var_printers = '' OR var_printers IS NULL THEN
		-- 	LEAVE label;
		-- END IF;
		-- var_flag18='1'表述厨房不打印，这时候就不用出单
		-- var_pccode = '110' 不出单，只出客人清单
		IF var_flag17 <> '1' AND var_printers <> '' THEN
			WHILE LENGTH(var_printers) > 0 DO
				SET var_i = INSTR(var_printers,'#');
				IF var_i > 0 THEN
					SET var_printer = SUBSTRING(var_printers,1,var_i-1);
				ELSE
					SET var_printer = var_printers;
				END IF;
				-- 区分合并打单和非合并打单，主要通过CHANGED='F'或'H'来区分
				IF var_flag11 <> '1' THEN
					INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
						SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, b.biz_date, b.pccode, var_pccode_desc, b.tableno, var_tableno_desc, b.gsts, a.printid, arg_type, a.sta, a.code, a.descript, a.descript_en, a.unit, a.price, a.number, a.amount, a.info, a.cook, var_printer, var_printer, 1, 1, 'F', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, a.create_user, a.create_datetime, NULL, NULL 
						FROM pos_detail a,pos_master b WHERE a.accnt = arg_accnt AND a.id = arg_id AND b.accnt = arg_accnt AND a.hotel_id = arg_hotel_id AND b.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_group_id = arg_hotel_group_id;
					IF t_error = 1 THEN
						SELECT descript INTO var_descript FROM pos_detail WHERE id = arg_id AND accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
						SET arg_ret = -1,arg_msg = '单号['+IFNULL(arg_accnt,'')+']菜品['+IFNULL(var_descript,'')+']插入分单时失败!';
						LEAVE label;
					END IF;
					
				ELSE
					INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
						SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, b.biz_date, b.pccode, var_pccode_desc, b.tableno, var_tableno_desc, b.gsts, a.printid, arg_type, a.sta, a.code, a.descript, a.descript_en, a.unit, a.price, a.number, a.amount, a.info, a.cook, var_printer, var_printer, 1, 1, 'H', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, a.create_user, a.create_datetime, NULL, NULL 
						FROM pos_detail a,pos_master b WHERE a.accnt = arg_accnt AND a.id = arg_id AND b.accnt = arg_accnt AND a.hotel_id = arg_hotel_id AND b.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_group_id = arg_hotel_group_id;
	
					IF t_error = 1 THEN
						SELECT descript INTO var_descript FROM pos_detail WHERE id = arg_id AND accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
						SET arg_ret = -1,arg_msg = '单号['+IFNULL(arg_accnt,'')+']菜品['+IFNULL(var_descript,'')+']插入分单时失败!';
						LEAVE label;
					END IF;
				END IF;				
				SET var_printers = IFNULL(SUBSTRING(var_printers,var_i+1,LENGTH(var_printers)),'');
			END WHILE;
			
		END IF;
		-- SELECT 4;
		-- 总单插入
		IF var_flag12 = '1' AND var_printer1 <> '' THEN
			INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
				SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, b.biz_date, b.pccode, var_pccode_desc, b.tableno, var_tableno_desc, b.gsts, a.printid, arg_type, a.sta, a.code, a.descript, a.descript_en, a.unit, a.price, a.number, a.amount, a.info, a.cook, var_printer1, var_printer1, 1, 1, '1', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, a.create_user, a.create_datetime, NULL, NULL 
				FROM pos_detail a,pos_master b WHERE a.accnt = arg_accnt AND a.id = arg_id AND b.accnt = arg_accnt AND a.hotel_id = arg_hotel_id AND b.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_group_id = arg_hotel_group_id;
	
			IF t_error = 1 THEN
				SELECT descript INTO var_descript FROM pos_detail WHERE id = arg_id AND accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
				SET arg_ret = -1,arg_msg = '单号['+IFNULL(arg_accnt,'')+']菜品['+IFNULL(var_descript,'')+']插入总单1时失败!';
				LEAVE label;
			END IF;
		END IF;
		IF var_flag13 = '1' AND var_printer2 <> '' THEN
			INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
				SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, b.biz_date, b.pccode, var_pccode_desc, b.tableno, var_tableno_desc, b.gsts, a.printid, arg_type, a.sta, a.code, a.descript, a.descript_en, a.unit, a.price, a.number, a.amount, a.info, a.cook, var_printer2, var_printer2, 1, 1, '2', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, a.create_user, a.create_datetime, NULL, NULL 
				FROM pos_detail a,pos_master b WHERE a.accnt = arg_accnt AND a.id = arg_id AND b.accnt = arg_accnt AND a.hotel_id = arg_hotel_id AND b.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_group_id = arg_hotel_group_id;
	
			IF t_error = 1 THEN
				SELECT descript INTO var_descript FROM pos_detail WHERE id = arg_id AND accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
				SET arg_ret = -1,arg_msg = '单号['+IFNULL(arg_accnt,'')+']菜品['+IFNULL(var_descript,'')+']插入总单2时失败!';
				LEAVE label;
			END IF;
		END IF;
		IF var_flag14 = '1' AND var_printer3 <> '' THEN
			INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
				SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, b.biz_date, b.pccode, var_pccode_desc, b.tableno, var_tableno_desc, b.gsts, a.printid, arg_type, a.sta, a.code, a.descript, a.descript_en, a.unit, a.price, a.number, a.amount, a.info, a.cook, var_printer3, var_printer3, 1, 1, '3', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, a.create_user, a.create_datetime, NULL, NULL 
				FROM pos_detail a,pos_master b WHERE a.accnt = arg_accnt AND a.id = arg_id AND b.accnt = arg_accnt AND a.hotel_id = arg_hotel_id AND b.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_group_id = arg_hotel_group_id;
			IF t_error = 1 THEN
				SELECT descript INTO var_descript FROM pos_detail WHERE id = arg_id AND accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
				SET arg_ret = -1,arg_msg = '单号['+IFNULL(arg_accnt,'')+']菜品['+IFNULL(var_descript,'')+']插入总单3时失败!';
				LEAVE label;
			END IF;
		END IF;
		IF var_flag15 = '1' AND var_printer4 <> '' THEN
			INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
				SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, b.biz_date, b.pccode, var_pccode_desc, b.tableno, var_tableno_desc, b.gsts, a.printid, arg_type, a.sta, a.code, a.descript, a.descript_en, a.unit, a.price, a.number, a.amount, a.info, a.cook, var_printer4, var_printer4, 1, 1, '4', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, a.create_user, a.create_datetime, NULL, NULL 
				FROM pos_detail a,pos_master b WHERE a.accnt = arg_accnt AND a.id = arg_id AND b.accnt = arg_accnt AND a.hotel_id = arg_hotel_id AND b.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_group_id = arg_hotel_group_id;
			IF t_error = 1 THEN
				SELECT descript INTO var_descript FROM pos_detail WHERE id = arg_id AND accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
				SET arg_ret = -1,arg_msg = '单号['+IFNULL(arg_accnt,'')+']菜品['+IFNULL(var_descript,'')+']插入总单4时失败!';
				LEAVE label;
			END IF;
		END IF;
		IF var_flag16 = '1' AND var_printer5 <> '' THEN
			INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
				SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, b.biz_date, b.pccode, var_pccode_desc, b.tableno, var_tableno_desc, b.gsts, a.printid, arg_type, a.sta, a.code, a.descript, a.descript_en, a.unit, a.price, a.number, a.amount, a.info, a.cook, var_printer5, var_printer5, 1, 1, '5', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, a.create_user, a.create_datetime, NULL, NULL 
				FROM pos_detail a,pos_master b WHERE a.accnt = arg_accnt AND a.id = arg_id AND b.accnt = arg_accnt AND a.hotel_id = arg_hotel_id AND b.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_group_id = arg_hotel_group_id;
			IF t_error = 1 THEN
				SELECT descript INTO var_descript FROM pos_detail WHERE id = arg_id AND accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
				SET arg_ret = -1,arg_msg = '单号['+IFNULL(arg_accnt,'')+']菜品['+IFNULL(var_descript,'')+']插入总单5时失败!';
				LEAVE label;
			END IF;
		END IF;
	ELSEIF arg_type = '2' THEN
		-- 分单补打
		
		SELECT CODE INTO var_station_code FROM work_station WHERE id = arg_station AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		-- 获取送单站点总单相关信息
		SELECT tag INTO var_tag FROM pos_station WHERE CODE = var_station_code AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		IF var_tag <> '1' THEN
			LEAVE label;
		END IF;
		
		-- 获取桌号及营业点，及桌号中的清单和总单设置
		SELECT a.tableno,a.pccode,b.descript INTO var_tableno,var_pccode,var_pccode_desc FROM pos_master a,pos_pccode b WHERE a.accnt = arg_accnt AND a.pccode = b.code AND a.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id;
		SELECT descript INTO var_tableno_desc FROM pos_pccode_table WHERE CODE = var_tableno AND pccode = var_pccode AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		
		-- 获取本菜的厨打相关信息
		IF EXISTS(SELECT 1 FROM pos_detail WHERE accnt = arg_accnt AND id = arg_id AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
			SELECT sort_code,CODE INTO var_sort,var_plucode FROM pos_detail WHERE accnt = arg_accnt AND id = arg_id AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			IF EXISTS(SELECT 1 FROM pos_plu_printer WHERE CODE = var_plucode AND sort_code = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT SUBSTRING(flag,17,1) INTO var_flag17 FROM pos_plu_printer WHERE CODE = var_plucode AND sort_code = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSEIF EXISTS(SELECT 1 FROM pos_plu_printer WHERE CODE = 'all' AND sort_code = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT SUBSTRING(flag,17,1) INTO var_flag17 FROM pos_plu_printer WHERE CODE = 'all' AND sort_code = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSE
				SET var_flag17 = '0';
			END IF;	
			-- select 	var_plucode,var_sort;
			-- 判断分单打印机的出单口，判断属性是 本营业点本菜项 - 默认营业点本菜项 - 本营业点本菜类 - 默认营业点本菜类 - 没有
			IF  EXISTS(SELECT 1 FROM pos_prnscope WHERE plucode = var_plucode AND pccode = var_pccode AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT IFNULL(printers,'') INTO var_printers FROM pos_prnscope WHERE plucode = var_plucode AND pccode = var_pccode AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSEIF EXISTS(SELECT 1 FROM pos_prnscope WHERE plucode = var_plucode AND pccode = '###' AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT IFNULL(printers,'') INTO var_printers FROM pos_prnscope WHERE plucode = var_plucode AND pccode = '###' AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSEIF EXISTS(SELECT 1 FROM pos_prnscope WHERE plucode = 'all' AND pccode = var_pccode AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT IFNULL(printers,'') INTO var_printers FROM pos_prnscope WHERE plucode = 'all' AND pccode = var_pccode AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSEIF EXISTS(SELECT 1 FROM pos_prnscope WHERE plucode = 'all' AND pccode = '###' AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT IFNULL(printers,'') INTO var_printers FROM pos_prnscope WHERE plucode = 'all' AND pccode = '###' AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSE
				SET var_printers = '';
			END IF;			
		ELSE
			LEAVE label;
		END IF;
		
		IF var_flag17 <> '1' AND var_printers <> '' THEN
			WHILE LENGTH(var_printers) > 0 DO
				SET var_i = INSTR(var_printers,'#');
				IF var_i > 0 THEN
					SET var_printer = SUBSTRING(var_printers,1,var_i-1);
				ELSE
					SET var_printer = var_printers;
				END IF;
				
				INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
					SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, b.biz_date, b.pccode, var_pccode_desc, b.tableno, var_tableno_desc, b.gsts, a.printid, arg_type, a.sta, a.code, a.descript, a.descript_en, a.unit, a.price, a.number, a.amount, a.info, a.cook, var_printer, var_printer, 1, 1, 'F', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, a.create_user, a.create_datetime, NULL, NULL 
					FROM pos_detail a,pos_master b WHERE a.accnt = arg_accnt AND a.id = arg_id AND b.accnt = arg_accnt AND a.hotel_id = arg_hotel_id AND b.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_group_id = arg_hotel_group_id;
				IF t_error = 1 THEN
					SELECT descript INTO var_descript FROM pos_detail WHERE id = arg_id AND accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
					SET arg_ret = -1,arg_msg = '单号['+IFNULL(arg_accnt,'')+']菜品['+IFNULL(var_descript,'')+']插入分单时失败!';
					LEAVE label;
				END IF;
							
				SET var_printers = IFNULL(SUBSTRING(var_printers,var_i+1,LENGTH(var_printers)),'');
			END WHILE;
		END IF;			
	END IF;	
END label; 
SELECT arg_ret,arg_msg;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_master_revoke`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_master_revoke`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_master_revoke`(
    IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
    IN arg_accnt  VARCHAR(20) ,
    IN arg_shift  VARCHAR(2) ,
    IN arg_user  VARCHAR(20) , 
    IN arg_workStation  VARCHAR(20) ,
	IN arg_reason  VARCHAR(20) ,	
	OUT arg_ret				 VARCHAR(10))
    SQL SECURITY INVOKER
label_0:
BEGIN
-- 消单过程
-- 		
    DECLARE var_sta			VARCHAR(2);
	DECLARE var_biz_date			DATETIME;
    DECLARE var_id			INT;
  	DECLARE var_num			INT;
    DECLARE var_hotel_group_id			INT;
	DECLARE var_hotel_id			INT;
	DECLARE var_logdate			DATETIME;
    DECLARE var_accnts VARCHAR(100);
    DECLARE var_printResult VARCHAR(2);
    DECLARE i INT DEFAULT 0;
    DECLARE j INT DEFAULT 0;
    DECLARE t_error INTEGER DEFAULT 0;  
    DECLARE done_cursor INT DEFAULT 0 ;
    DECLARE var_cursor CURSOR FOR SELECT id FROM pos_detail a WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt  AND a.sta = 'T'; 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1; 
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1; 
 
SET arg_ret = '-1' ;  
-- 开启计算事务
  START TRANSACTION;
-- -----------------------------
  SELECT  a.sta INTO var_sta FROM pos_master a WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt ;
IF var_sta <> 'S' THEN
	INSERT INTO `pos_detail` 
	(`hotel_group_id`, `hotel_id`, `accnt`, `inumber`, `tnumber`, `anumber`, `mnumber`, `type`, `billno`, `orderno`, `sta`, `shift`, `empid`, `biz_date`, `note_code`, `sort_code`, `code`, `tocode`, `cond_code`, `cook`, `printid`, `descript`, `descript_en`, `unit`, `number`, `pinumber`, `price`, `amount`, `amount1`, `amount2`, `amount3`, `amount4`, `amount5`, `cost`, `flag`, `flag1`, `reason`, `dsc`, `srv`, `srv0`, `srv_dsc`, `tax`, `tax0`, `tax_dsc`, `tableno`, `siteno`, `info`, `cardno`, `cardinfo`, `kitchen`, `pcid`, `empid1`, `empid2`, `empid3`, `draw_date`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) 
	SELECT 
	`hotel_group_id`, `hotel_id`, `accnt`, `inumber`, `tnumber`, `anumber`, `mnumber`, `type`, `billno`, `orderno`, 'T', `shift`, `empid`, `biz_date`, `note_code`, `sort_code`, `code`, `tocode`, `cond_code`, `cook`, `printid`, `descript`, `descript_en`, `unit`,0-number, `pinumber`, `price`, `amount`, `amount1`, `amount2`, `amount3`, `amount4`, `amount5`, `cost`, `flag`, `flag1`, `reason`, `dsc`, `srv`, `srv0`, `srv_dsc`, `tax`, `tax0`, `tax_dsc`, `tableno`, `siteno`,arg_reason, `cardno`, `cardinfo`, `kitchen`, `pcid`, `empid1`, `empid2`, `empid3`, `draw_date`, arg_user  , NOW(), arg_user  , NOW()
	FROM pos_detail  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND sta = 'I';
-- 调用厨打过程 插入 退菜需要打印的单据
  OPEN var_cursor;
     SET done_cursor = 0;
     FETCH var_cursor INTO var_id;
     
     WHILE done_cursor<>1 DO 
         
     CALL  up_pos_kitchen_input_dishcard(arg_hotel_group_id,arg_hotel_id,arg_accnt,var_id,'1',arg_workStation,@ret,@msg);
                   -- SELECT @ret INTO var_printResult ;
                   -- IF(var_printResult = -1)THEN 
                   -- SET t_error = 1;
                   -- END IF;
     FETCH var_cursor INTO var_id;
     END WHILE; 
     CLOSE var_cursor;
-- 处理pos_detail
   UPDATE pos_detail a SET a.sta = 'X' ,a.shift = arg_shift ,a.modify_user = arg_user ,a.modify_datetime = NOW()  WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt  AND a.sta IN ('I','T');
-- 更新主单付款信息
   UPDATE pos_master a SET a.sta = 'X' ,a.amount = '0.00',a.charge='0.00',a.credit='0.00',a.info =  CONCAT(IFNULL(a.info,''),'消单:',arg_reason),a.modify_user = arg_user ,a.modify_datetime = NOW()  WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt  ;
-- 处理pos_account
   UPDATE pos_account a  SET  a.sta = 'X',a.shift = arg_shift, a.modify_user = arg_user ,a.modify_datetime = NOW() WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt  AND a.sta = 'I';
-- 处理pos_order
   DELETE FROM pos_order  WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt ;
-- ------------------------
ELSE 
   -- --------------
	INSERT INTO `pos_detail` 
	(`hotel_group_id`, `hotel_id`, `accnt`, `inumber`, `tnumber`, `anumber`, `mnumber`, `type`, `billno`, `orderno`, `sta`, `shift`, `empid`, `biz_date`, `note_code`, `sort_code`, `code`, `tocode`, `cond_code`, `cook`, `printid`, `descript`, `descript_en`, `unit`, `number`, `pinumber`, `price`, `amount`, `amount1`, `amount2`, `amount3`, `amount4`, `amount5`, `cost`, `flag`, `flag1`, `reason`, `dsc`, `srv`, `srv0`, `srv_dsc`, `tax`, `tax0`, `tax_dsc`, `tableno`, `siteno`, `info`, `cardno`, `cardinfo`, `kitchen`, `pcid`, `empid1`, `empid2`, `empid3`, `draw_date`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) 
	SELECT 
	`hotel_group_id`, `hotel_id`, `accnt`, `inumber`, `tnumber`, `anumber`, `mnumber`, `type`, `billno`, `orderno`, 'T', `shift`, `empid`, `biz_date`, `note_code`, `sort_code`, `code`, `tocode`, `cond_code`, `cook`, `printid`, `descript`, `descript_en`, `unit`,0-number, `pinumber`, `price`, `amount`, `amount1`, `amount2`, `amount3`, `amount4`, `amount5`, `cost`, `flag`, `flag1`, `reason`, `dsc`, `srv`, `srv0`, `srv_dsc`, `tax`, `tax0`, `tax_dsc`, `tableno`, `siteno`,arg_reason, `cardno`, `cardinfo`, `kitchen`, `pcid`, `empid1`, `empid2`, `empid3`, `draw_date`, arg_user  , NOW(), arg_user  , NOW()
	FROM pos_detail  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND sta = 'I';
   SELECT set_value INTO var_biz_date FROM sys_option  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
-- 处理pos_detail
   UPDATE pos_detail a SET a.sta = 'X' ,a.biz_date = var_biz_date,a.shift = arg_shift ,a.modify_user = arg_user ,a.modify_datetime = NOW()  WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt  AND a.sta IN ('I','T');
-- 更新主单付款信息
   UPDATE pos_master a SET a.sta = 'X' ,a.biz_date = var_biz_date,a.info = CONCAT(IFNULL(a.info,''),'消单:',arg_reason),a.amount = '0.00',a.charge='0.00',a.credit='0.00', a.modify_user = arg_user ,a.modify_datetime = NOW()  WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt  ;
-- 处理pos_account
   UPDATE pos_account a  SET  a.sta = 'X',a.biz_date = var_biz_date,a.shift = arg_shift, a.modify_user = arg_user ,a.modify_datetime = NOW() WHERE   a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt  AND a.sta = 'S';
-- 处理pos_order
   DELETE FROM pos_order  WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt ;
END IF;
   -- 插入同步表
    INSERT pos_accnt_sync  (hotel_group_id,hotel_id,entity_name,accnt,res_accnt,TYPE,is_sync,is_halt,create_user,create_datetime,modify_user,modify_datetime)
    SELECT hotel_group_id,hotel_id,'com.greencloud.entity.PosMaster',accnt,resno,'DELETE','F','F','ADMIN',NOW(),'ADMIN',NOW() 
    FROM pos_master WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  ;
        IF t_error = 1 THEN  
           ROLLBACK;  
           SET arg_ret = '-1' ; 
         
       ELSE  
           COMMIT; 
           SET arg_ret = '1' ; 
       END IF;  
	BEGIN
		SET @procresult = 0 ;
		LEAVE label_0 ;
	END ; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_menu_audit_data`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_menu_audit_data`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_menu_audit_data`(
	IN arg_hotel_group_id BIGINT(16),
	IN arg_hotel_id BIGINT(16),
	IN arg_biz_date DATETIME,
	OUT arg_count INT
)
    SQL SECURITY INVOKER
label_0:
    BEGIN
	
	DECLARE var_sys_set VARCHAR(20);
	
	SET arg_count = 0;
	
	SELECT set_value INTO var_sys_set FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'interface' AND item = 'pos_menu_link_bill';
	
	IF(var_sys_set = 'F')THEN
		SET arg_count = 1;
		LEAVE label_0;
	END IF;
	
	IF NOT EXISTS(SELECT 1 FROM pos_menu WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date)THEN
		SET arg_count = 1;
		LEAVE label_0;
	END IF;
	
	IF EXISTS(SELECT 1 FROM pos_audit_menu WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date)THEN
		DELETE FROM pos_audit_menu WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date;
		DELETE FROM pos_audit_dish WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date;
	END IF;
	
	
	INSERT  INTO `pos_audit_menu`(`hotel_group_id`,`hotel_id`,`biz_date`,`menu_no`,`link_menu_no`,`pc_station`,`pos_station`,`guest_id`,`company_id`,`sales_man`,`card_no`,`source`,`table_no`,`guest_num`,`pos_type`,`remark`,`charge`,`charge1`,`charge2`,`charge3`,`charge4`,`charge5`,`charge6`,`charge7`,`charge8`,`charge9`,`billno`,`pos_user1`,`cashier1`,`pos_createtime`,`pos_user2`,`cashier2`,`pos_checkoutTime`,`create_user`,`create_datetime`,`modify_user`,`modify_datetime`)
	SELECT h.hotel_group_id,h.id,atm.bz_bdate,atm.accnt,atm.pcrec,pim.code,atm.pccode,atm.haccnt,atm.cusno,atm.saleid,atm.cardno,atm.source,atm.tableno,atm.gsts,atm.type1,atm.remark,atm.ttl,atm.a1,
	atm.a2,atm.a3,atm.a4,atm.a5,atm.a6,atm.a7,atm.a8,atm.a9,atm.billno,atm.empno1,atm.shift1,atm.log_date1,atm.empno2,atm.shift2,atm.log_date2,'POS',NOW(),'POS',NOW()
	FROM hotel h,pos_interface.audit_tp_menu atm,pos_interface_map pim WHERE h.hotel_group_id = arg_hotel_group_id AND h.id = arg_hotel_id AND h.code = atm.hotelid AND pim.hotel_group_id = arg_hotel_group_id
	AND pim.hotel_id = arg_hotel_id AND atm.bz_bdate = arg_biz_date AND pim.pos_code = atm.pccode AND pim.sys_code = '04';
	
	
	
	INSERT INTO `pos_audit_dish`(hotel_group_id,hotel_id,biz_date,link_am_id,ta_code,ta_descript,ta_descript_en,charge,create_user,create_datetime,modify_user,modify_datetime)
	SELECT pam.hotel_group_id,pam.hotel_id,pam.biz_date,pam.id,pim.code,pim.descript,pim.descript_en,pam.charge1,pam.create_user,NOW(),pam.modify_user,NOW()
	FROM pos_audit_menu pam INNER JOIN pos_interface_map pim ON pam.hotel_group_id = pim.hotel_group_id AND pam.hotel_id = pim.hotel_id 
	AND pam.pos_station = pim.sys_code AND pim.pos_code = 1
	WHERE pam.hotel_group_id = arg_hotel_group_id AND pam.hotel_id = arg_hotel_id AND pam.biz_date = arg_biz_date AND charge1 <> 0;
	
	INSERT INTO `pos_audit_dish`(hotel_group_id,hotel_id,biz_date,link_am_id,ta_code,ta_descript,ta_descript_en,charge,create_user,create_datetime,modify_user,modify_datetime)
	SELECT pam.hotel_group_id,pam.hotel_id,pam.biz_date,pam.id,pim.code,pim.descript,pim.descript_en,pam.charge2,pam.create_user,NOW(),pam.modify_user,NOW()
	FROM pos_audit_menu pam INNER JOIN pos_interface_map pim ON pam.hotel_group_id = pim.hotel_group_id AND pam.hotel_id = pim.hotel_id 
	AND pam.pos_station = pim.sys_code AND pim.pos_code = 2
	WHERE pam.hotel_group_id = arg_hotel_group_id AND pam.hotel_id = arg_hotel_id AND pam.biz_date = arg_biz_date AND charge2 <> 0;
	
	INSERT INTO `pos_audit_dish`(hotel_group_id,hotel_id,biz_date,link_am_id,ta_code,ta_descript,ta_descript_en,charge,create_user,create_datetime,modify_user,modify_datetime)
	SELECT pam.hotel_group_id,pam.hotel_id,pam.biz_date,pam.id,pim.code,pim.descript,pim.descript_en,pam.charge3,pam.create_user,NOW(),pam.modify_user,NOW()
	FROM pos_audit_menu pam INNER JOIN pos_interface_map pim ON pam.hotel_group_id = pim.hotel_group_id AND pam.hotel_id = pim.hotel_id 
	AND pam.pos_station = pim.sys_code AND pim.pos_code = 3
	WHERE pam.hotel_group_id = arg_hotel_group_id AND pam.hotel_id = arg_hotel_id AND pam.biz_date = arg_biz_date AND charge3 <> 0;
	
	INSERT INTO `pos_audit_dish`(hotel_group_id,hotel_id,biz_date,link_am_id,ta_code,ta_descript,ta_descript_en,charge,create_user,create_datetime,modify_user,modify_datetime)
	SELECT pam.hotel_group_id,pam.hotel_id,pam.biz_date,pam.id,pim.code,pim.descript,pim.descript_en,pam.charge4,pam.create_user,NOW(),pam.modify_user,NOW()
	FROM pos_audit_menu pam INNER JOIN pos_interface_map pim ON pam.hotel_group_id = pim.hotel_group_id AND pam.hotel_id = pim.hotel_id 
	AND pam.pos_station = pim.sys_code AND pim.pos_code = 4
	WHERE pam.hotel_group_id = arg_hotel_group_id AND pam.hotel_id = arg_hotel_id AND pam.biz_date = arg_biz_date AND charge4 <> 0;
	INSERT INTO `pos_audit_dish`(hotel_group_id,hotel_id,biz_date,link_am_id,ta_code,ta_descript,ta_descript_en,charge,create_user,create_datetime,modify_user,modify_datetime)
	SELECT pam.hotel_group_id,pam.hotel_id,pam.biz_date,pam.id,pim.code,pim.descript,pim.descript_en,pam.charge5,pam.create_user,NOW(),pam.modify_user,NOW()
	FROM pos_audit_menu pam INNER JOIN pos_interface_map pim ON pam.hotel_group_id = pim.hotel_group_id AND pam.hotel_id = pim.hotel_id 
	AND pam.pos_station = pim.sys_code AND pim.pos_code = 5
	WHERE pam.hotel_group_id = arg_hotel_group_id AND pam.hotel_id = arg_hotel_id AND pam.biz_date = arg_biz_date AND charge5 <> 0;
	
	INSERT INTO `pos_audit_dish`(hotel_group_id,hotel_id,biz_date,link_am_id,ta_code,ta_descript,ta_descript_en,charge,create_user,create_datetime,modify_user,modify_datetime)
	SELECT pam.hotel_group_id,pam.hotel_id,pam.biz_date,pam.id,pim.code,pim.descript,pim.descript_en,pam.charge6,pam.create_user,NOW(),pam.modify_user,NOW()
	FROM pos_audit_menu pam INNER JOIN pos_interface_map pim ON pam.hotel_group_id = pim.hotel_group_id AND pam.hotel_id = pim.hotel_id 
	AND pam.pos_station = pim.sys_code AND pim.pos_code = 6
	WHERE pam.hotel_group_id = arg_hotel_group_id AND pam.hotel_id = arg_hotel_id AND pam.biz_date = arg_biz_date AND charge6 <> 0;
	
	
	INSERT INTO `pos_audit_dish`(hotel_group_id,hotel_id,biz_date,link_am_id,ta_code,ta_descript,ta_descript_en,charge,create_user,create_datetime,modify_user,modify_datetime)
	SELECT pam.hotel_group_id,pam.hotel_id,pam.biz_date,pam.id,pim.code,pim.descript,pim.descript_en,pam.charge7,pam.create_user,NOW(),pam.modify_user,NOW()
	FROM pos_audit_menu pam INNER JOIN pos_interface_map pim ON pam.hotel_group_id = pim.hotel_group_id AND pam.hotel_id = pim.hotel_id 
	AND pam.pos_station = pim.sys_code AND pim.pos_code = 7
	WHERE pam.hotel_group_id = arg_hotel_group_id AND pam.hotel_id = arg_hotel_id AND pam.biz_date = arg_biz_date AND charge7 <> 0;
	
	
	INSERT INTO `pos_audit_dish`(hotel_group_id,hotel_id,biz_date,link_am_id,ta_code,ta_descript,ta_descript_en,charge,create_user,create_datetime,modify_user,modify_datetime)
	SELECT pam.hotel_group_id,pam.hotel_id,pam.biz_date,pam.id,pim.code,pim.descript,pim.descript_en,pam.charge8,pam.create_user,NOW(),pam.modify_user,NOW()
	FROM pos_audit_menu pam INNER JOIN pos_interface_map pim ON pam.hotel_group_id = pim.hotel_group_id AND pam.hotel_id = pim.hotel_id 
	AND pam.pos_station = pim.sys_code AND pim.pos_code = 8
	WHERE pam.hotel_group_id = arg_hotel_group_id AND pam.hotel_id = arg_hotel_id AND pam.biz_date = arg_biz_date AND charge8 <> 0;
	
	
	INSERT INTO `pos_audit_dish`(hotel_group_id,hotel_id,biz_date,link_am_id,ta_code,ta_descript,ta_descript_en,charge,create_user,create_datetime,modify_user,modify_datetime)
	SELECT pam.hotel_group_id,pam.hotel_id,pam.biz_date,pam.id,pim.code,pim.descript,pim.descript_en,pam.charge9,pam.create_user,NOW(),pam.modify_user,NOW()
	FROM pos_audit_menu pam INNER JOIN pos_interface_map pim ON pam.hotel_group_id = pim.hotel_group_id AND pam.hotel_id = pim.hotel_id 
	AND pam.pos_station = pim.sys_code AND pim.pos_code = 9
	WHERE pam.hotel_group_id = arg_hotel_group_id AND pam.hotel_id = arg_hotel_id AND pam.biz_date = arg_biz_date AND charge9 <> 0;
	
	
	UPDATE pos_interface.audit_tp_menu atm,hotel h SET atm.flag1 = 'T' WHERE h.hotel_group_id = arg_hotel_group_id AND h.id = arg_hotel_id AND h.code = atm.hotelid AND atm.bz_bdate = arg_biz_date; 
	
	SELECT COUNT(1) INTO arg_count FROM pos_audit_menu WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date;
	
    END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_new_hotel_init`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_new_hotel_init`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_new_hotel_init`(
	IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
	IN arg_mode		VARCHAR(10))
    SQL SECURITY INVOKER
BEGIN
	TRUNCATE TABLE `pos_account`;
	TRUNCATE TABLE `pos_account_history`;
	TRUNCATE TABLE `pos_audit_dish`;
	TRUNCATE TABLE `pos_audit_master`;
	TRUNCATE TABLE `pos_audit_menu`;
	TRUNCATE TABLE `pos_audit_report`;
	TRUNCATE TABLE `pos_close`;
	TRUNCATE TABLE `pos_deposit_detail`;
	TRUNCATE TABLE `pos_deposit_sum`;
	TRUNCATE TABLE `pos_deptdai`;
	TRUNCATE TABLE `pos_deptdai_history`;
	TRUNCATE TABLE `pos_deptjie`;
	TRUNCATE TABLE `pos_deptjie_history`;
	TRUNCATE TABLE `pos_detail`;
	TRUNCATE TABLE `pos_detail_dai`;
	TRUNCATE TABLE `pos_detail_history`;
	TRUNCATE TABLE `pos_detail_jie`;
	TRUNCATE TABLE `pos_dish`;
	TRUNCATE TABLE `pos_dish_history`;
	TRUNCATE TABLE `pos_master`;
	TRUNCATE TABLE `pos_master_history`;
	TRUNCATE TABLE `pos_menu`;
	TRUNCATE TABLE `pos_menu_history`;
	TRUNCATE TABLE `pos_order`;
	TRUNCATE TABLE `pos_pay`;
	TRUNCATE TABLE `pos_report`;
	TRUNCATE TABLE `pos_res`;
	TRUNCATE TABLE `pos_res_order`;
	TRUNCATE TABLE `rep_dai`;
	TRUNCATE TABLE `rep_jie`;
	TRUNCATE TABLE `rep_jiedai`;
	TRUNCATE TABLE `sys_error`;
	TRUNCATE TABLE `pos_dishcard`;
	TRUNCATE TABLE `pos_dishcard_history`;
	TRUNCATE TABLE `pos_accnt_sync`;
	
	IF INSTR(arg_mode,'A') > 0 THEN	
	--	TRUNCATE TABLE  code_base;
		TRUNCATE TABLE `pos_conddtl`;
		TRUNCATE TABLE `pos_condst`;
		TRUNCATE TABLE `pos_current_price`;
		TRUNCATE TABLE `pos_mode_def`;
		TRUNCATE TABLE `pos_mode_name`;
		TRUNCATE TABLE `pos_pccode`;
		TRUNCATE TABLE `pos_pccode_note`;
		TRUNCATE TABLE `pos_pccode_shift`;
		TRUNCATE TABLE `pos_pccode_table`;
		TRUNCATE TABLE `pos_plu_all`;
		TRUNCATE TABLE `pos_plu_std`;
		TRUNCATE TABLE `pos_price`;
		TRUNCATE TABLE `pos_sort_all`;
		TRUNCATE TABLE `pos_srv_table`;
		TRUNCATE TABLE `pos_station`;
		TRUNCATE TABLE `pos_sys_reason`;
		TRUNCATE TABLE `pos_table_map`;
		TRUNCATE TABLE `report_category`;
		TRUNCATE TABLE `report_center`;
		TRUNCATE TABLE `sales_man`;
		TRUNCATE TABLE `sales_man_business`;
		TRUNCATE TABLE `work_station`;
		TRUNCATE TABLE `work_station_scape`;
		TRUNCATE TABLE `work_station_status`;
		TRUNCATE TABLE `work_station_status_history`;
		TRUNCATE TABLE `work_station_verify`;
		TRUNCATE TABLE `work_status`;
	END IF;
	
	IF INSTR(arg_mode,'N') > 0 THEN	
		UPDATE hotel SET id = arg_hotel_id,hotel_group_id = arg_hotel_group_id WHERE hotel_group_id = 1 AND id = 1;
		UPDATE hotel_group SET id = arg_hotel_group_id WHERE id = 1;
		UPDATE USER SET hotel_id = arg_hotel_id,hotel_group_id = arg_hotel_group_id WHERE hotel_group_id = 1 AND hotel_id = 1;
		UPDATE user_auth_cache SET hotel_id = arg_hotel_id,hotel_group_id = arg_hotel_group_id,auth_hotel_id = arg_hotel_id,auth_hotel_group_id = arg_hotel_group_id WHERE hotel_group_id = 1 AND hotel_id = 1;
		UPDATE user_auth_cfg_user_role SET hotel_id = arg_hotel_id,hotel_group_id = arg_hotel_group_id,auth_hotel_id = arg_hotel_id,auth_hotel_group_id = arg_hotel_group_id WHERE hotel_group_id = 1 AND hotel_id = 1;
		UPDATE code_base SET hotel_id = arg_hotel_id,hotel_group_id = arg_hotel_group_id WHERE hotel_group_id = 1 AND hotel_id = 1;
		UPDATE sys_option SET hotel_id = arg_hotel_id,hotel_group_id = arg_hotel_group_id WHERE hotel_group_id = 1 AND hotel_id = 1;
		UPDATE user_pos_auth_user_auth SET hotel_id = arg_hotel_id,hotel_group_id = arg_hotel_group_id,auth_hotel_id = arg_hotel_id,auth_hotel_group_id = arg_hotel_group_id WHERE hotel_group_id = 1 AND hotel_id = 1;
		UPDATE work_station SET hotel_id = arg_hotel_id,hotel_group_id = arg_hotel_group_id WHERE hotel_group_id = 1 AND hotel_id = 1;
		UPDATE pos_station SET hotel_id = arg_hotel_id,hotel_group_id = arg_hotel_group_id WHERE hotel_group_id = 1 AND hotel_id = 1;
	END IF;
	
	UPDATE user_pos_auth SET hotel_group_id = arg_hotel_group_id,hotel_id = arg_hotel_id;
	UPDATE log_info_config SET hotel_group_id = arg_hotel_group_id,hotel_id = arg_hotel_id;
	UPDATE code_cache SET hotel_group_id = arg_hotel_group_id,hotel_id = arg_hotel_id;
	UPDATE pos_table_sync SET hotel_group_id = arg_hotel_group_id,hotel_id = arg_hotel_id;
	UPDATE pos_ip SET hotel_group_id = arg_hotel_group_id,hotel_id = arg_hotel_id;
	UPDATE sys_extra_id SET hotel_group_id = arg_hotel_group_id,hotel_id = arg_hotel_id,pos_cur= 0;
	UPDATE bill_define SET hotel_group_id = arg_hotel_group_id,hotel_id = arg_hotel_id;
 	UPDATE pos_printer_type SET hotel_group_id = arg_hotel_group_id,hotel_id = arg_hotel_id;
 	UPDATE sys_option SET set_value = DATE_FORMAT(NOW(),'%Y-%m-%d') WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND item = 'pos_biz_date';
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_plu_charts_analysis_new`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_plu_charts_analysis_new`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_plu_charts_analysis_new`(IN arg_hotel_group_id	INT,
	IN arg_hotel_ids			VARCHAR(1024),
  IN arg_sorts			VARCHAR(1024),
  IN arg_begin_date DATE,
  IN arg_end_date DATE,
	IN arg_class			CHAR(1))
BEGIN
	DECLARE var_m		VARCHAR(2);
	DECLARE var_byear		VARCHAR(4);
	DECLARE var_sorts		VARCHAR(1024);
  -- DECLARE var_hotel_name		VARCHAR(30);
  DECLARE var_sql VARCHAR(2048) ;
  -- SET var_byear = DATE_FORMAT(arg_bdate,'%Y');
 --  SET var_m = DATE_FORMAT(arg_bdate,'%c');		
 --  SET var_byear = DATE_FORMAT(BIZ_DATE,'%Y');
  SET var_sorts = CONCAT('\'',REPLACE(arg_sorts,',','\',\''),'\'') ;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_plu_table ;
	CREATE TEMPORARY TABLE  tmp_pos_plu_table
	(  
	  `sort` VARCHAR(10) NOT NULL DEFAULT '',
	  `sort_name` VARCHAR(20) NOT NULL DEFAULT '',
	  `plu` VARCHAR(10) NOT NULL DEFAULT '',
    `plu_name` VARCHAR(20) NOT NULL DEFAULT '',
    `price` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    `num` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
	  `amount` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
    `dsc` DECIMAL(12,2) NOT NULL DEFAULT '0.00',	  
	  `list_order` VARCHAR(2) DEFAULT NULL
	) ;
DROP TEMPORARY TABLE IF EXISTS tmp_pos_ll_table ;
	CREATE TEMPORARY TABLE  tmp_pos_ll_table
	(  
	  `code` VARCHAR(20) NOT NULL,	  
	  `lmonth_gsts` DECIMAL(12,0) NOT NULL DEFAULT '0',   
	  `lmonth_avg` DECIMAL(12,2) NOT NULL DEFAULT '0.00',
	  `lmonthtl` DECIMAL(12,2) NOT NULL DEFAULT '0.00',   
	  `lyear_gsts` DECIMAL(12,0) NOT NULL DEFAULT '0',    
	  `lyear_avg` DECIMAL(12,2) NOT NULL DEFAULT '0.00',   
	  `lyeartl` DECIMAL(12,2) NOT NULL DEFAULT '0.00'
   
	) ;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail ;
      CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail_history WHERE 1=2  ;
      INSERT INTO tmp_pos_detail SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id  AND biz_date >= arg_begin_date  AND  biz_date<= arg_end_date AND CODE<>'ML';
      INSERT INTO tmp_pos_detail SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id  AND biz_date >= arg_begin_date  AND  biz_date<= arg_end_date AND CODE<>'ML';
IF INSTR(arg_hotel_ids, ',') >0 THEN 
 -- 酒店为多选，表示集团菜谱销售排行榜
IF (LENGTH(var_sorts) > 3) THEN
SET var_sql = CONCAT("
INSERT INTO tmp_pos_plu_table
 (sort,sort_name,plu,plu_name,price,num,amount,dsc,list_order)
SELECT a.sort_code,b.descript,a.code,d.descript as sortname ,sum(a.amount)/sum(a.number) as price ,sum(a.number) as num,sum(a.amount) as amount ,sum(a.dsc) as dsc ,'A1' 
FROM tmp_pos_detail a
LEFT JOIN pos_sort_all b ON a.sort_code = b.code  AND b.hotel_group_id = ",arg_hotel_group_id," AND b.hotel_id = ",arg_hotel_ids," 
LEFT JOIN pos_plu_all d ON a.code = d.code  AND d.hotel_group_id = ",arg_hotel_group_id," AND d.hotel_id = ",arg_hotel_ids," 
LEFT JOIN hotel c ON a.hotel_group_id = c.hotel_group_id AND a.hotel_id = c.id  
WHERE a.hotel_id IN (SELECT id FROM hotel where hotel_group_id = ",arg_hotel_group_id," AND id in (",arg_hotel_ids,")) AND a.sort_code in (",var_sorts,")  
AND a.biz_date>= '",arg_begin_date,"' AND a.biz_date <= '",arg_end_date,"' AND  a.sta = 'I' and a.type  = '1'
group by a.sort_code,a.`code`,b.descript,c.descript,d.descript
ORDER BY a.sort_code,sum(a.number) DESC
");
    	SET @exec_sql = var_sql;  
   	 PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
ELSE
SET var_sql = CONCAT("
INSERT INTO tmp_pos_plu_table
 (sort,sort_name,plu,plu_name,price,num,amount,dsc,list_order)
SELECT a.sort_code,b.descript,a.code,d.descript as sortname ,sum(a.amount)/sum(a.number) as price ,sum(a.number) as num,sum(a.amount) as amount ,sum(a.dsc) as dsc ,'A1' 
FROM tmp_pos_detail a
LEFT JOIN pos_sort_all b ON a.sort_code = b.code  AND b.hotel_group_id = ",arg_hotel_group_id," AND b.hotel_id = ",arg_hotel_ids," 
LEFT JOIN pos_plu_all d ON a.code = d.code  AND d.hotel_group_id = ",arg_hotel_group_id," AND d.hotel_id = ",arg_hotel_ids,"  
LEFT JOIN hotel c ON a.hotel_group_id = c.hotel_group_id AND a.hotel_id = c.id  
WHERE a.hotel_id IN (SELECT id FROM hotel where hotel_group_id = ",arg_hotel_group_id," AND id in (",arg_hotel_ids,"))
AND a.biz_date>= '",arg_begin_date,"' AND a.biz_date <= '",arg_end_date,"' AND  a.sta = 'I' and a.type  = '1'  
group by a.sort_code,a.`code`,b.descript,c.descript,d.descript
ORDER BY a.sort_code,sum(a.number) DESC
");
    	SET @exec_sql = var_sql;  
   	 PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
END IF;
UPDATE tmp_pos_plu_table SET dsc = 0 WHERE dsc IS NULL ;
ELSEIF LENGTH(arg_hotel_ids)=0 OR arg_hotel_ids IS NULL THEN 
IF  (LENGTH(var_sorts) > 3) THEN
SET var_sql = CONCAT("
INSERT INTO tmp_pos_plu_table
 (sort,sort_name,plu,plu_name,price,num,amount,dsc,list_order)
SELECT a.sort_code,b.descript,a.code,d.descript as sortname ,sum(a.amount)/sum(a.number) as price ,sum(a.number) as num,sum(a.amount) as amount ,sum(a.dsc) as dsc ,'A1' 
FROM tmp_pos_detail a
LEFT JOIN pos_sort_all b ON a.sort_code = b.code  AND b.hotel_group_id = ",arg_hotel_group_id," AND b.hotel_id = ",arg_hotel_ids," 
LEFT JOIN pos_plu_all d ON a.code = d.code  AND d.hotel_group_id = ",arg_hotel_group_id," AND d.hotel_id = ",arg_hotel_ids," 
LEFT JOIN hotel c ON a.hotel_group_id = c.hotel_group_id AND a.hotel_id = c.id  
WHERE a.hotel_id IN (SELECT id FROM hotel where hotel_group_id = ",arg_hotel_group_id," ) AND a.sort_code in (",var_sorts,")  
AND a.biz_date>= '",arg_begin_date,"' AND a.biz_date <= '",arg_end_date,"' AND  a.sta = 'I' and a.type  = '1'
group by a.sort_code,a.`code`,b.descript,c.descript,d.descript
ORDER BY a.sort_code,sum(a.number) DESC
");
    	SET @exec_sql = var_sql;  
   	 PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
ELSE 
SET var_sql = CONCAT("
INSERT INTO tmp_pos_plu_table
 (sort,sort_name,plu,plu_name,price,num,amount,dsc,list_order)
SELECT a.sort_code,b.descript,a.code,d.descript as sortname ,sum(a.amount)/sum(a.number) as price ,sum(a.number) as num,sum(a.amount) as amount ,sum(a.dsc) as dsc ,'A1' 
FROM tmp_pos_detail a
LEFT JOIN pos_sort_all b ON a.sort_code = b.code  AND b.hotel_group_id = ",arg_hotel_group_id," AND b.hotel_id = ",arg_hotel_ids," 
LEFT JOIN pos_plu_all d ON a.code = d.code  AND d.hotel_group_id = ",arg_hotel_group_id," AND d.hotel_id = ",arg_hotel_ids," 
LEFT JOIN hotel c ON a.hotel_group_id = c.hotel_group_id AND a.hotel_id = c.id  
WHERE a.hotel_id IN (SELECT id FROM hotel where hotel_group_id = ",arg_hotel_group_id," )
AND a.biz_date>= '",arg_begin_date,"' AND a.biz_date <= '",arg_end_date,"' AND  a.sta = 'I' and a.type  = '1'
group by a.sort_code,a.`code`,b.`name`,c.descript,d.descript
ORDER BY a.sort_code,sum(a.number) DESC
");
	SET @exec_sql = var_sql;  
   	 PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
END IF;
UPDATE tmp_pos_plu_table SET dsc = 0 WHERE dsc IS NULL ;
ELSE
IF (LENGTH(var_sorts) > 3) THEN
SET var_sql = CONCAT("
INSERT INTO tmp_pos_plu_table
 (sort,sort_name,plu,plu_name,price,num,amount,dsc,list_order)
SELECT a.sort_code,b.descript,a.code,d.descript as sortname ,sum(a.amount)/sum(a.number) as price ,sum(a.number) as num,sum(a.amount) as amount ,sum(a.dsc) as dsc ,'A1' 
FROM tmp_pos_detail a
LEFT JOIN pos_sort_all b ON a.sort_code = b.code  AND b.hotel_group_id = ",arg_hotel_group_id," AND b.hotel_id = ",arg_hotel_ids," 
LEFT JOIN pos_plu_all d ON a.code = d.code  AND d.hotel_group_id = ",arg_hotel_group_id," AND d.hotel_id = ",arg_hotel_ids,"  
LEFT JOIN hotel c ON a.hotel_group_id = c.hotel_group_id AND a.hotel_id = c.id  
WHERE a.hotel_group_id = ",arg_hotel_group_id," AND a.hotel_id = '",arg_hotel_ids,"' AND a.sort_code in (",var_sorts,")  
AND a.biz_date>= '",arg_begin_date,"' AND a.biz_date <= '",arg_end_date,"' AND  a.sta = 'I' and a.type  = '1'
group by a.sort_code,a.`code`,b.descript,c.descript,d.descript
ORDER BY a.sort_code,sum(a.number) DESC
");
    	SET @exec_sql = var_sql;  
   	 PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
ELSE 
SET var_sql = CONCAT("
INSERT INTO tmp_pos_plu_table
 (sort,sort_name,plu,plu_name,price,num,amount,dsc,list_order)
SELECT a.sort_code,b.descript,a.code,d.descript as sortname ,sum(a.amount)/sum(a.number) as price ,sum(a.number) as num,sum(a.amount) as amount ,sum(a.dsc) as dsc ,'A1' 
FROM tmp_pos_detail a
LEFT JOIN pos_sort_all b ON a.sort_code = b.code  AND b.hotel_group_id = ",arg_hotel_group_id," AND b.hotel_id = ",arg_hotel_ids," 
LEFT JOIN pos_plu_all d ON a.code = d.code  AND d.hotel_group_id = ",arg_hotel_group_id," AND d.hotel_id = ",arg_hotel_ids," 
LEFT JOIN hotel c ON a.hotel_group_id = c.hotel_group_id AND a.hotel_id = c.id  
WHERE a.hotel_group_id = ",arg_hotel_group_id," AND a.hotel_id = '",arg_hotel_ids,"' 
AND a.biz_date>= '",arg_begin_date,"' AND a.biz_date <= '",arg_end_date,"' AND  a.sta = 'I' and a.type  = '1'
group by a.sort_code,a.`code`,b.descript,c.descript,d.descript
ORDER BY a.sort_code,sum(a.number) DESC
");
    	SET @exec_sql = var_sql;  
   	 PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
END IF;
UPDATE tmp_pos_plu_table SET dsc = 0 WHERE dsc IS NULL ;
END IF ;  
IF arg_class = '1'  THEN 
SELECT    sort,sort_name,plu,plu_name,ROUND(price,0) AS price ,ROUND(num,0) AS num ,ROUND(amount,0) AS amount, dsc
                                 FROM tmp_pos_plu_table ORDER BY num DESC;
ELSEIF arg_class = '0'  THEN
SELECT    sort,sort_name,plu,plu_name,ROUND(price,0) AS price ,ROUND(num,0) AS num ,ROUND(amount,0) AS amount, dsc
                                 FROM tmp_pos_plu_table ORDER BY sort,num DESC;
END IF;
  DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail ;
 END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_produce_extra_id`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_produce_extra_id`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_produce_extra_id`(
	IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),	
	IN arg_code		VARCHAR(30),	
	OUT arg_msg		VARCHAR(60)	
)
    SQL SECURITY INVOKER
label_0:
BEGIN
	
	
	
	
	
	
	
	DECLARE var_rsv_no_create_mode 		VARCHAR(2);	
	DECLARE var_pos_cur			BIGINT(16);	
	DECLARE var_pos_max			BIGINT(16);	
	
	DECLARE var_count			INTEGER;
	
	SET var_rsv_no_create_mode = '0',var_count = 0,arg_msg = '';
	
	
	
	
	SELECT COUNT(1) INTO var_count FROM hotel WHERE hotel_group_id=arg_hotel_group_id AND id = arg_hotel_id; 	
	IF arg_hotel_id > 0 AND var_count = 0 THEN 
		SET arg_msg = 'Group Hotel id or Hotel id Error !';
		SELECT arg_msg; 
		LEAVE label_0;
	END IF; 
	
	
	
	
	SELECT a.pos_cur,a.pos_max INTO var_pos_cur,var_pos_max FROM sys_extra_id AS a 
	WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id 
		AND a.code = arg_code FOR UPDATE;
	
	
	IF var_pos_cur IS NULL OR var_pos_max IS NULL  THEN 
		SET arg_msg =  CONCAT('Sys Extra Id Error ! Code Is ',arg_code,' Not Find !');
		SELECT arg_msg; 
		LEAVE label_0;
	END IF;
	
	
	IF var_pos_cur >= var_pos_max THEN
		UPDATE sys_extra_id AS a SET a.pos_cur = a.pos_begin,a.modify_datetime 	= NOW()
		WHERE a.hotel_group_id = arg_hotel_group_id 
			AND a.hotel_id = arg_hotel_id
			AND a.code = arg_code;
	ELSE
		UPDATE sys_extra_id AS a SET a.pos_cur = a.pos_cur + a.pos_interval,a.modify_datetime 	= NOW()
		WHERE a.hotel_group_id = arg_hotel_group_id 
			AND a.hotel_id = arg_hotel_id
			AND a.code = arg_code;
	END IF;
	
	
	
	SET arg_msg = var_pos_cur;
	
	SELECT arg_msg; 
	
	BEGIN		
		LEAVE label_0;
	END; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_rep_bus_statistics`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_rep_bus_statistics`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_rep_bus_statistics`(
	IN arg_hotel_group_id	BIGINT(16),
	IN arg_hotel_id 	BIGINT(16),
	IN arg_tag 	   	CHAR(1),
	IN arg_pccodes		VARCHAR(255),
	IN arg_shift		CHAR(1),
	IN arg_empid		VARCHAR(10),
	IN arg_begin		DATETIME,
	IN arg_end		DATETIME
)
BEGIN
	DECLARE	var_counts	INT;
	DECLARE	var_gsts	INT;
	DECLARE var_idmax 	INT;
	DECLARE var_index	INT;
	
	
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TABLE IF EXISTS tmp_bus_statistics;
	
	
	IF arg_pccodes = '' OR arg_pccodes IS NULL THEN
		SET arg_pccodes = 'all';
	END IF;
	
	IF arg_shift = '' OR arg_shift IS NULL THEN
		SET arg_shift = '%';
	END IF;
	
	IF arg_empid = '' OR arg_empid IS NULL THEN
		SET arg_empid = '{{{';
	END IF; 
	
	CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2  ;
	CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
	
	INSERT INTO tmp_pos_master 
		SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date >= arg_begin AND biz_date <= arg_end
			UNION
		SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date >= arg_begin AND biz_date <= arg_end ;	
	
	INSERT INTO tmp_pos_detail 
		SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date >= arg_begin AND biz_date <= arg_end AND sta <> 'X'
		UNION
		SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date >= arg_begin AND biz_date <= arg_end AND sta <> 'X';
		
	SELECT IFNULL(COUNT(*),0) INTO var_counts FROM tmp_pos_master;	
	SELECT IFNULL(SUM(gsts),0) INTO var_gsts FROM tmp_pos_master;
	
	IF var_counts = 0 THEN
		SET var_counts = 1;
	END IF;
	
	IF var_gsts = 0 THEN
		SET var_gsts = 1;
	END IF;
	
	IF arg_tag = '1' THEN
		CREATE TABLE tmp_bus_statistics
		(
			descript 	VARCHAR(20),
			tocode 		VARCHAR(5),
			tag 		CHAR(1),
			amount 		DECIMAL(10,2),
			dsc 		DECIMAL(10,2),		
			srv 		DECIMAL(10,2),
			tax 		DECIMAL(10,2),
			total 		DECIMAL(10,2),
			gsts 		INT,
			counts		INT,
			ent 		DECIMAL(10,2),
			profit		DECIMAL(10,2),
			avg_gsts	DECIMAL(10,2),
			avg_count	DECIMAL(10,2)	
		);
		
		INSERT tmp_bus_statistics(descript,tocode,tag,amount,dsc,srv,tax,total,gsts,counts,ent,profit,avg_gsts,avg_count)
			SELECT c.descript,b.tocode,'1',IFNULL(SUM(b.amount),0),IFNULL(SUM(b.dsc),0),IFNULL(SUM(b.srv),0),IFNULL(SUM(b.tax),0),0,0,0,0,0,0,0 FROM tmp_pos_master a,tmp_pos_detail b,code_base c 
				WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.hotel_group_id = c.hotel_group_id 
			AND a.hotel_id = c.hotel_id AND a.sta = 'O' AND b.sta <> 'X' AND a.accnt = b.accnt AND c.parent_code = 'pos_rep_item' AND b.tocode = c.code 
			GROUP BY c.descript,b.tocode
			ORDER BY c.code;
		 	
		UPDATE tmp_bus_statistics SET counts = var_counts,gsts = var_gsts,total = amount-dsc+srv+tax,profit = amount-dsc+srv+tax,avg_gsts=ROUND(profit/gsts,2),avg_count = ROUND(profit/counts,2);
		
		INSERT tmp_bus_statistics(descript,tocode,tag,amount,dsc,srv,tax,total,gsts,counts,ent,profit,avg_gsts,avg_count) 
			SELECT '合计','','9',IFNULL(SUM(amount),0),IFNULL(SUM(dsc),0),IFNULL(SUM(srv),0),IFNULL(SUM(tax),0),IFNULL(SUM(total),0),IFNULL(SUM(gsts),0),IFNULL(SUM(counts),0),IFNULL(SUM(ent),0),
				IFNULL(SUM(profit),0),IFNULL(SUM(avg_gsts),0),IFNULL(SUM(avg_count),0) FROM tmp_bus_statistics WHERE tag='1';
		
		
		
		SELECT descript,tocode,tag,amount,dsc,srv,tax,total,gsts,counts,ent,profit,avg_gsts,avg_count FROM tmp_bus_statistics ORDER BY tag,tocode;
	END IF;
	
	IF arg_tag = '2' THEN
		
		DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
		CREATE TEMPORARY TABLE tmp_pos_account SELECT * FROM pos_account WHERE 1=2  ;
	
		INSERT INTO tmp_pos_account 
			SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date >= arg_begin AND biz_date <= arg_end
				UNION
			SELECT * FROM pos_account_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date >= arg_begin AND biz_date <= arg_end ;	
				
		CREATE TABLE tmp_bus_statistics
		(	
			id 		INT AUTO_INCREMENT PRIMARY KEY,
			tag 		VARCHAR(1),
			descript1 	VARCHAR(20),
			paycode 	VARCHAR(5),
			amount1 	DECIMAL(10,2),
			count1		INT,
			blank 		VARCHAR(10) DEFAULT '',
			
			descript2 	VARCHAR(10),		
			amount2 	DECIMAL(10,2),
			gsts	 	INT,
			count2 		INT
		);
				
		INSERT tmp_bus_statistics(tag,descript1,paycode,amount1,count1,blank,descript2,amount2,gsts,count2)
			SELECT DISTINCT '1',descript,paycode,0,0,'-','-',0,0,0 FROM tmp_pos_account WHERE paycode <> '';
		
		UPDATE tmp_bus_statistics a SET amount1 = (SELECT SUM(b.credit) FROM tmp_pos_account b,tmp_pos_master c WHERE b.accnt = c.accnt AND a.paycode = b.paycode AND c.sta = 'O' AND b.sta = 'O');
		UPDATE tmp_bus_statistics a SET count1 = (SELECT COUNT(b.accnt) FROM tmp_pos_account b,tmp_pos_master c WHERE b.accnt = c.accnt AND a.paycode = b.paycode AND c.sta = 'O' AND b.sta = 'O');
		
		SELECT IFNULL(MAX(id),0) INTO var_idmax FROM tmp_bus_statistics;
		
		WHILE var_idmax < 4 DO
			INSERT tmp_bus_statistics(descript1,paycode,amount1,count1,blank,descript2,amount2,gsts,count2) VALUE('','',0,0,'-','-',0,0,0) ;
			SET var_idmax = var_idmax + 1;
		END WHILE;
		
		UPDATE tmp_bus_statistics a SET a.descript2 = '已结单',a.amount2 = (SELECT IFNULL(SUM(charge),0) FROM tmp_pos_master WHERE sta = 'O' AND osta = ''),a.gsts = var_gsts WHERE a.id = 1;
		UPDATE tmp_bus_statistics a SET a.descript2 = '重结单',a.amount2 = (SELECT IFNULL(SUM(charge),0) FROM tmp_pos_master WHERE sta = 'O' AND osta <> ''),a.gsts = var_gsts WHERE a.id = 2;
		UPDATE tmp_bus_statistics a SET a.descript2 = '未结单',a.amount2 = (SELECT IFNULL(SUM(charge),0) FROM tmp_pos_master WHERE sta <> 'O' AND sta <> 'X'),a.gsts = var_gsts WHERE a.id = 3;
		UPDATE tmp_bus_statistics a SET a.descript2 = '取消单',a.amount2 = (SELECT IFNULL(SUM(charge),0) FROM tmp_pos_master WHERE sta = 'X'),a.gsts = var_gsts WHERE a.id = 4;
		
		INSERT tmp_bus_statistics(tag,descript1,paycode,amount1,count1,blank,descript2,amount2,gsts,count2)
			SELECT '9','合计','',IFNULL(SUM(amount1),0),IFNULL(SUM(count1),0),'-','-',0,0,0 FROM tmp_bus_statistics WHERE tag = '1';
		
		SELECT descript1,paycode,amount1,count1,blank,descript2,amount2,gsts,count2 FROM tmp_bus_statistics ORDER BY id;
	END IF;
	
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
	DROP TABLE IF EXISTS tmp_bus_statistics;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_rep_daily_month`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_rep_daily_month`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_rep_daily_month`(
	IN arg_hotel_group_id	BIGINT(16),
	IN arg_hotel_id 	BIGINT(16),
	IN arg_biz_date		DATETIME,
	IN arg_tag		CHAR(1)
)
BEGIN
	DECLARE		var_counts		INT;
	DECLARE		var_gsts		INT;
	DECLARE 	var_idmax 		INT;
	DECLARE 	var_index		INT;
	DECLARE 	var_max_id 		INT;
	DECLARE 	var_pccode		VARCHAR(10);
	DECLARE 	var_pccode_des		VARCHAR(50);
	DECLARE	 	var_shift 		CHAR(1);
	DECLARE 	var_shift_des 		VARCHAR(10);
	DECLARE 	var_month_first 	DATETIME;
	DECLARE 	done_cursor 		INT DEFAULT 0 ;
	DECLARE var_pccode_cus CURSOR FOR SELECT DISTINCT a.pccode,a.name FROM tmp_pos_audti_report a,pos_pccode b WHERE b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND a.pccode = b.code ORDER BY b.list_order,a.pccode,a.shift;
 	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1; 
	
	
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_audti_report;
	DROP TABLE IF EXISTS tmp_bus_daily_month;
	SET var_month_first = DATE_ADD(DATE_ADD(LAST_DAY(arg_biz_date),INTERVAL 1 DAY),INTERVAL -1 MONTH);	
	
	CREATE TEMPORARY TABLE tmp_pos_audti_report SELECT * FROM pos_audit_report WHERE 1=2;	
	INSERT tmp_pos_audti_report
		SELECT * FROM pos_audit_report WHERE hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id AND usercode = '{{{' AND shift <> '9' AND pccode <> 'all' AND biz_date >= var_month_first AND biz_date <= arg_biz_date ;
	CREATE TABLE tmp_bus_daily_month(
		id 			INT   	NOT NULL AUTO_INCREMENT,
		pccode 			VARCHAR(20),
		pccode_des 		VARCHAR(50),
		shift 			VARCHAR(10),
		shift_des 		VARCHAR(20),
		gsts			VARCHAR(10) DEFAULT '0',
		p1			VARCHAR(10) DEFAULT '0.00',
		p2 			VARCHAR(10) DEFAULT '0.00',
		p3 			VARCHAR(10) DEFAULT '0.00',
		p4			VARCHAR(10) DEFAULT '0.00',
		p5 			VARCHAR(10) DEFAULT '0.00',
		p6 			VARCHAR(10) DEFAULT '0.00',
		p7			VARCHAR(10) DEFAULT '0.00',
		p8 			VARCHAR(10) DEFAULT '0.00',
		p9 			VARCHAR(10) DEFAULT '0.00',
		p10			VARCHAR(10) DEFAULT '0.00',
		pttl			VARCHAR(10) DEFAULT '0.00',
		gsts_avg 		VARCHAR(10) DEFAULT '0.00',
		PRIMARY KEY (id)
	);
	
	OPEN var_pccode_cus;
	FETCH var_pccode_cus INTO  var_pccode,var_pccode_des;
	WHILE done_cursor<>1 DO
		INSERT tmp_bus_daily_month(pccode,pccode_des,shift,shift_des)
			SELECT var_pccode,var_pccode_des,CODE,descript FROM code_base WHERE parent_code = 'pos_cashier' AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id ORDER BY CODE;		
		INSERT tmp_bus_daily_month(pccode,pccode_des,shift,shift_des,gsts,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,pttl,gsts_avg)
			VALUES('A','','','','','','','','','','','','','','','','') ;
	FETCH var_pccode_cus INTO var_pccode,var_pccode_des; 
	END WHILE; 
	CLOSE var_pccode_cus;
	IF arg_tag = 'D' THEN
		UPDATE tmp_bus_daily_month a,tmp_pos_audti_report b SET a.gsts = ROUND(IFNULL(b.amount,'0'),0) WHERE b.biz_date = arg_biz_date AND b.type = '0' AND b.code = 'B1' AND a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,tmp_pos_audti_report b SET a.p1 = IFNULL(b.amount-b.amount1,'0.00') WHERE b.biz_date = arg_biz_date AND b.type = '1' AND b.code = '01' AND a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,tmp_pos_audti_report b SET a.p2 = IFNULL(b.amount-b.amount1,'0.00') WHERE b.biz_date = arg_biz_date AND b.type = '1' AND b.code = '02' AND a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,tmp_pos_audti_report b SET a.p3 = IFNULL(b.amount-b.amount1,'0.00') WHERE b.biz_date = arg_biz_date AND b.type = '1' AND b.code = '07' AND a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,tmp_pos_audti_report b SET a.p4 = IFNULL(b.amount-b.amount1,'0.00') WHERE b.biz_date = arg_biz_date AND b.type = '1' AND b.code = '03' AND a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,tmp_pos_audti_report b SET a.p5 = IFNULL(b.amount-b.amount1,'0.00') WHERE b.biz_date = arg_biz_date AND b.type = '1' AND b.code = '05' AND a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,tmp_pos_audti_report b SET a.p6 = IFNULL(b.amount-b.amount1,'0.00') WHERE b.biz_date = arg_biz_date AND b.type = '1' AND b.code = '08' AND a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,tmp_pos_audti_report b SET a.p7 = IFNULL(b.amount-b.amount1,'0.00') WHERE b.biz_date = arg_biz_date AND b.type = '1' AND b.code = '06' AND a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,tmp_pos_audti_report b SET a.p8 = IFNULL(b.amount-b.amount1,'0.00') WHERE b.biz_date = arg_biz_date AND b.type = '1' AND b.code = '04' AND a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,tmp_pos_audti_report b SET a.p9 = IFNULL(b.amount-b.amount1,'0.00') WHERE b.biz_date = arg_biz_date AND b.type = '1' AND b.code NOT IN ('01','02','07','03','05','08','06','04') AND a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,tmp_pos_audti_report b SET a.p10 = IFNULL(-1*b.amount,'0.00') WHERE b.biz_date = arg_biz_date AND b.type = '2' AND b.code = '9070' AND a.pccode = b.pccode AND a.shift = b.shift;
	ELSEIF arg_tag = 'M' THEN
		UPDATE tmp_bus_daily_month a,(SELECT pccode,shift,SUM(amount-amount1) AS amount FROM tmp_pos_audti_report WHERE biz_date >= var_month_first AND biz_date <= arg_biz_date AND TYPE = '0' AND CODE = 'B1' GROUP BY pccode,shift) b SET a.gsts = ROUND(IFNULL(b.amount,'0'),0) WHERE a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,(SELECT pccode,shift,SUM(amount-amount1) AS amount FROM tmp_pos_audti_report WHERE biz_date >= var_month_first AND biz_date <= arg_biz_date AND TYPE = '1' AND CODE = '01' GROUP BY pccode,shift) b SET a.p1 = IFNULL(b.amount,'0.00') WHERE a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,(SELECT pccode,shift,SUM(amount-amount1) AS amount FROM tmp_pos_audti_report WHERE biz_date >= var_month_first AND biz_date <= arg_biz_date AND TYPE = '1' AND CODE = '02' GROUP BY pccode,shift) b SET a.p2 = IFNULL(b.amount,'0.00') WHERE a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,(SELECT pccode,shift,SUM(amount-amount1) AS amount FROM tmp_pos_audti_report WHERE biz_date >= var_month_first AND biz_date <= arg_biz_date AND TYPE = '1' AND CODE = '03' GROUP BY pccode,shift) b SET a.p3 = IFNULL(b.amount,'0.00') WHERE a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,(SELECT pccode,shift,SUM(amount-amount1) AS amount FROM tmp_pos_audti_report WHERE biz_date >= var_month_first AND biz_date <= arg_biz_date AND TYPE = '1' AND CODE = '07' GROUP BY pccode,shift) b SET a.p4 = IFNULL(b.amount,'0.00') WHERE a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,(SELECT pccode,shift,SUM(amount-amount1) AS amount FROM tmp_pos_audti_report WHERE biz_date >= var_month_first AND biz_date <= arg_biz_date AND TYPE = '1' AND CODE = '05' GROUP BY pccode,shift) b SET a.p5 = IFNULL(b.amount,'0.00') WHERE a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,(SELECT pccode,shift,SUM(amount-amount1) AS amount FROM tmp_pos_audti_report WHERE biz_date >= var_month_first AND biz_date <= arg_biz_date AND TYPE = '1' AND CODE = '08' GROUP BY pccode,shift) b SET a.p6 = IFNULL(b.amount,'0.00') WHERE a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,(SELECT pccode,shift,SUM(amount-amount1) AS amount FROM tmp_pos_audti_report WHERE biz_date >= var_month_first AND biz_date <= arg_biz_date AND TYPE = '1' AND CODE = '06' GROUP BY pccode,shift) b SET a.p7 = IFNULL(b.amount,'0.00') WHERE a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,(SELECT pccode,shift,SUM(amount-amount1) AS amount FROM tmp_pos_audti_report WHERE biz_date >= var_month_first AND biz_date <= arg_biz_date AND TYPE = '1' AND CODE = '04' GROUP BY pccode,shift) b SET a.p8 = IFNULL(b.amount,'0.00') WHERE a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,(SELECT pccode,shift,SUM(amount-amount1) AS amount FROM tmp_pos_audti_report WHERE biz_date >= var_month_first AND biz_date <= arg_biz_date AND TYPE = '1' AND CODE NOT IN ('01','02','07','03','05','08','06','04') GROUP BY pccode,shift) b SET a.p9 = IFNULL(b.amount,'0.00') WHERE a.pccode = b.pccode AND a.shift = b.shift;
		UPDATE tmp_bus_daily_month a,(SELECT pccode,shift,SUM(amount) AS amount FROM tmp_pos_audti_report WHERE biz_date >= var_month_first AND biz_date <= arg_biz_date AND TYPE = '2' AND CODE = '9070' GROUP BY pccode,shift) b SET a.p10 = IFNULL(-1*b.amount,'0.00') WHERE a.pccode = b.pccode AND a.shift = b.shift;
	END IF;
	UPDATE tmp_bus_daily_month SET pttl = IFNULL(CAST(p1 AS DECIMAL(10,2))+CAST(p2 AS DECIMAL(10,2))+CAST(p3 AS DECIMAL(10,2))+CAST(p4 AS DECIMAL(10,2))+CAST(p5 AS DECIMAL(10,2))+CAST(p6 AS DECIMAL(10,2))+CAST(p7 AS DECIMAL(10,2))+CAST(p8 AS DECIMAL(10,2))+CAST(p9 AS DECIMAL(10,2))+CAST(p10 AS DECIMAL(10,2)),'0.00') WHERE pccode <> 'A';
	SELECT MAX(id) INTO var_max_id FROM tmp_bus_daily_month;
	DELETE FROM tmp_bus_daily_month WHERE id = var_max_id;
	INSERT tmp_bus_daily_month(pccode,pccode_des,shift,shift_des)
		SELECT 'B','<<合计>>','','-';
	UPDATE tmp_bus_daily_month a,(SELECT SUM(CAST(gsts AS DECIMAL(10,2))) AS gsts FROM tmp_bus_daily_month WHERE pccode <> 'A' AND pccode <> 'B') b SET a.gsts = ROUND(b.gsts,0) WHERE a.pccode = 'B';
	UPDATE tmp_bus_daily_month a,(SELECT SUM(CAST(p1 AS DECIMAL(10,2))) AS p1 FROM tmp_bus_daily_month WHERE pccode <> 'A' AND pccode <> 'B') b SET a.p1 = b.p1 WHERE a.pccode = 'B';			
	UPDATE tmp_bus_daily_month a,(SELECT SUM(CAST(p2 AS DECIMAL(10,2))) AS p2 FROM tmp_bus_daily_month WHERE pccode <> 'A' AND pccode <> 'B') b SET a.p2 = b.p2 WHERE a.pccode = 'B';
	UPDATE tmp_bus_daily_month a,(SELECT SUM(CAST(p3 AS DECIMAL(10,2))) AS p3 FROM tmp_bus_daily_month WHERE pccode <> 'A' AND pccode <> 'B') b SET a.p3 = b.p3 WHERE a.pccode = 'B';
	UPDATE tmp_bus_daily_month a,(SELECT SUM(CAST(p4 AS DECIMAL(10,2))) AS p4 FROM tmp_bus_daily_month WHERE pccode <> 'A' AND pccode <> 'B') b SET a.p4 = b.p4 WHERE a.pccode = 'B';
	UPDATE tmp_bus_daily_month a,(SELECT SUM(CAST(p5 AS DECIMAL(10,2))) AS p5 FROM tmp_bus_daily_month WHERE pccode <> 'A' AND pccode <> 'B') b SET a.p5 = b.p5 WHERE a.pccode = 'B';
	UPDATE tmp_bus_daily_month a,(SELECT SUM(CAST(p6 AS DECIMAL(10,2))) AS p6 FROM tmp_bus_daily_month WHERE pccode <> 'A' AND pccode <> 'B') b SET a.p6 = b.p6 WHERE a.pccode = 'B';
	UPDATE tmp_bus_daily_month a,(SELECT SUM(CAST(p7 AS DECIMAL(10,2))) AS p7 FROM tmp_bus_daily_month WHERE pccode <> 'A' AND pccode <> 'B') b SET a.p7 = b.p7 WHERE a.pccode = 'B';
	UPDATE tmp_bus_daily_month a,(SELECT SUM(CAST(p8 AS DECIMAL(10,2))) AS p8 FROM tmp_bus_daily_month WHERE pccode <> 'A' AND pccode <> 'B') b SET a.p8 = b.p8 WHERE a.pccode = 'B';
	UPDATE tmp_bus_daily_month a,(SELECT SUM(CAST(p9 AS DECIMAL(10,2))) AS p9 FROM tmp_bus_daily_month WHERE pccode <> 'A' AND pccode <> 'B') b SET a.p9 = b.p9 WHERE a.pccode = 'B';		
	UPDATE tmp_bus_daily_month a,(SELECT SUM(CAST(p10 AS DECIMAL(10,2))) AS p10 FROM tmp_bus_daily_month WHERE pccode <> 'A' AND pccode <> 'B') b SET a.p10 = b.p10 WHERE a.pccode = 'B';
	UPDATE tmp_bus_daily_month a,(SELECT SUM(CAST(pttl AS DECIMAL(10,2))) AS pttl FROM tmp_bus_daily_month WHERE pccode <> 'A' AND pccode <> 'B') b SET a.pttl = b.pttl WHERE a.pccode = 'B';
	UPDATE tmp_bus_daily_month SET gsts_avg = IFNULL(ROUND(CAST(pttl AS DECIMAL(10,2))/CAST(gsts AS DECIMAL(10,2)),2),'0.00') WHERE pccode <> 'A';
	SELECT pccode_des,shift_des,gsts,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,pttl,gsts_avg FROM tmp_bus_daily_month ORDER BY id;
	
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_audti_report;
	DROP TABLE IF EXISTS tmp_bus_daily_month;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_rep_first_blood`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_rep_first_blood`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_rep_first_blood`(
			IN arg_hotel_group_id 	BIGINT(16),  -- 更新集团ID
			IN arg_hotel_id 	BIGINT(16),  -- 需要更新酒店ID
			IN arg_start_date	DATETIME     -- 开始日期
			)
    SQL SECURITY INVOKER
label_0:
BEGIN
	
	-- 定义变量
	DECLARE var_hotel_group_id	BIGINT(16);  	-- 集团ID 
	DECLARE var_hotel_id	 	BIGINT(16);  	-- 酒店ID
	
	DECLARE var_msg  		VARCHAR(100); 	-- 错误信息
	
	DECLARE var_pccode		VARCHAR(10); 	-- 营业点
	DECLARE var_type1		VARCHAR(100); 	-- 类别
	DECLARE var_shift 		VARCHAR(10); 	-- 班别
	DECLARE var_gsts 		DECIMAL(16,2); 	-- 人数
	DECLARE var_times 		DECIMAL(16,2); 	-- 桌号
	DECLARE var_charge 		DECIMAL(16,2); 	-- 收入
	
	
	-- 早班
	DECLARE var_gsts_1 		BIGINT(16); 	-- 人数
	DECLARE var_tables_1 		BIGINT(16); 	-- 桌数
	DECLARE var_amount_1 		BIGINT(16); 	-- 消费
	
	-- 中班
	DECLARE var_gsts_2 		BIGINT(16); 	-- 人数
	DECLARE var_tables_2 		BIGINT(16); 	-- 桌数
	DECLARE var_amount_2 		BIGINT(16); 	-- 消费
	
	-- 晚班
	DECLARE var_gsts_3 		BIGINT(16); 	-- 人数
	DECLARE var_tables_3 		BIGINT(16); 	-- 桌数
	DECLARE var_amount_3 		BIGINT(16); 	-- 消费
	
	-- 合计
	DECLARE var_gsts_tall 		BIGINT(16); 	-- 人总数
	DECLARE var_tables__tall 	BIGINT(16); 	-- 桌总数
	DECLARE var_amount__tall 	BIGINT(16); 	-- 消总费
	
	-- 定义 while循环游标 
	DECLARE done_cursor     INT DEFAULT 0;
	
	-- 1.1 定义游标
	  -- 定义轮寻 pos_master 表
		DECLARE cur_yb  CURSOR FOR SELECT  pos_pccode, type1,  shift ,SUM(gsts) , SUM(charge),SUM(times)
			FROM Panta_Kill GROUP BY pos_pccode,type1 ;
			-- WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id and biz_date = arg_start_date;
	
		
		-- 定义游标结束标志
		DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done_cursor = 1;
		-- 跳出
	
	-- 1.2 定义临时表 存储报表显示数据
       	DROP TEMPORARY TABLE IF EXISTS firt_blood;
	CREATE TEMPORARY TABLE firt_blood
	(
		pos_pccode 		VARCHAR(10),	-- 营业点
		pos_pccode_descript	VARCHAR(60)  DEFAULT NULL,	-- 营业点描述		
		type1 			VARCHAR(60),	-- 类型		
		type1_descript		VARCHAR(60)  DEFAULT NULL,	-- 类型描述
		
		gsts_1 			DECIMAL(16) DEFAULT 0, 	-- 早班人数
		gsts_2 			DECIMAL(16) DEFAULT 0, 	-- 中班人数
		gsts_3 			DECIMAL(16) DEFAULT 0, 	-- 晚班人数
		gsts_tall 		DECIMAL(16) DEFAULT 0, 	-- 人数合计
				
		tables_1 		DECIMAL(16) DEFAULT 0, 	-- 早班桌数
		tables_2 		DECIMAL(16) DEFAULT 0, 	-- 中班桌数
		tables_3 		DECIMAL(16) DEFAULT 0, 	-- 晚班桌数
		tables__tall 		DECIMAL(16) DEFAULT 0, 	-- 桌数合计
				
		amount_1 		DECIMAL(16,2) DEFAULT 0.00, 	-- 早班收入
		amount_2 		DECIMAL(16,2) DEFAULT 0.00, 	-- 中班收入
		amount_3 		DECIMAL(16,2) DEFAULT 0.00, 	-- 晚班收入
		amount__tall 		DECIMAL(16,2) DEFAULT 0.00  	-- 收入合计	
	); 
	
	DROP TEMPORARY TABLE IF EXISTS Panta_Kill;
	CREATE TEMPORARY TABLE Panta_Kill
	(
	   pos_pccode 		VARCHAR(10),	-- 营业点
	   type1 		VARCHAR(60),	-- 类型
	   shift 		VARCHAR(10),	-- 班别
	   gsts  		DECIMAL(16,2),  -- 人数
	   charge 		DECIMAL(16,2),    -- 消费
	   times 		INT DEFAULT 1 	-- 记录条数
	);
	
	-- 参数arg_hotel_group_id校验
	IF NOT EXISTS (SELECT 1 FROM hotel_group  WHERE id = arg_hotel_group_id) THEN
	SET var_msg = '错误 : hotel_group_id 不存在' ;
	SELECT var_msg ;
	BEGIN
	LEAVE label_0; 
	END;
	END IF;
	
        -- 参数arg_hotel_id 校验
	IF NOT EXISTS (SELECT 1 FROM hotel  WHERE hotel_group_id= arg_hotel_group_id AND id = arg_hotel_id ) THEN
	SET var_msg = '错误 : hotel_id 不存在' ;
	SELECT var_msg ;
	BEGIN
	LEAVE label_0; 
	END;
	END IF;
	
	INSERT  Panta_Kill(pos_pccode,type1,shift ,gsts  , charge)
	SELECT  pccode, type1,  shift ,gsts  , charge 
	FROM pos_master_history 
	WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_start_date;
	
	-- 1.3 开启游标进行首次取值
	OPEN cur_yb;
	FETCH  cur_yb   INTO  var_pccode, var_type1,  var_shift ,var_gsts  , var_charge,var_times ;
	
	-- 设置while循环条件标准
	
	SET done_cursor = 0 ;
	
	WHILE done_cursor = 0 DO
		BEGIN
			-- 查看 firt_blood 表中是否有pos_pccode = var_pccode的营业点，没有直接插入，有就进行更新
			IF NOT EXISTS (SELECT 1 FROM firt_blood  WHERE pos_pccode = var_pccode AND type1 = var_type1  ) THEN
				IF var_shift = '1' THEN				
					INSERT  firt_blood (pos_pccode,type1,gsts_1,tables_1,amount_1)
					SELECT var_pccode,var_type1,var_gsts,var_times,var_charge ;				
				ELSEIF var_shift = '2' THEN
					INSERT  firt_blood (pos_pccode,type1,gsts_2,tables_2,amount_2)
					SELECT var_pccode,var_type1,var_gsts,var_times,var_charge ;	
				ELSEIF var_shift = '3' THEN
					INSERT  firt_blood (pos_pccode,type1,gsts_3,tables_3,amount_3)
					SELECT var_pccode,var_type1,var_gsts,var_times,var_charge ;			
				END IF ; 
			ELSE
				IF var_shift = '1' THEN				
					UPDATE firt_blood SET gsts_1 = var_gsts,tables_1 = var_times,amount_1 = var_charge
					WHERE  pos_pccode = var_pccode AND type1 = var_type1 ;
				ELSEIF var_shift = '2' THEN
					UPDATE firt_blood SET gsts_2 = var_gsts,tables_2 = var_times,amount_2 = var_charge
					WHERE  pos_pccode = var_pccode AND type1 = var_type1 ;	
				ELSEIF var_shift = '3' THEN
					UPDATE firt_blood SET gsts_3 = var_gsts,tables_3 = var_times,amount_3 = var_charge
					WHERE  pos_pccode = var_pccode AND type1 = var_type1 ;			
				END IF ; 
			
			END IF;	
			
			SET done_cursor = 0 ;
			-- 轮寻游标
			FETCH  cur_yb   INTO  var_pccode, var_type1,  var_shift ,var_gsts  , var_charge,var_times ;
		
 	 	END;	
	 END WHILE ;
	
	CLOSE cur_yb;
	-- 更新总和
	UPDATE firt_blood SET gsts_tall = gsts_1 + gsts_2 + gsts_3 ;
	UPDATE firt_blood SET tables__tall = tables_1 + tables_2 + tables_3 ;
	UPDATE firt_blood SET amount__tall = amount_1 + amount_2 + amount_3 ;
	
	-- 营业点、类型描述描述  code_base WHERE parent_code = 'pos_menu_type1'
	UPDATE firt_blood a, code_base b SET a.type1_descript = b.descript  
		WHERE a.type1 = b.code AND b.parent_code = 'pos_menu_type1';
	
	UPDATE firt_blood a, pos_pccode b SET a.pos_pccode_descript = b.descript  
		WHERE a.pos_pccode = b.code AND b.hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id;
	
	-- 更新 类型为空的类别
	UPDATE firt_blood SET type1 = '099',type1_descript='未定义类别' WHERE type1 IS NULL ;
	
	SELECT * FROM firt_blood ORDER BY pos_pccode,type1;
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_rep_for_daily`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_rep_for_daily`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_rep_for_daily`(
	IN 	arg_hotel_group_id	BIGINT(16),	
	IN 	arg_hotel_id		BIGINT(16),
	IN 	arg_begin_date	 	DATETIME,
	IN 	arg_end_date	 	DATETIME
	)
    SQL SECURITY INVOKER
BEGIN
	DECLARE 	var_tag			CHAR(1);
	DECLARE 	var_printer1 		VARCHAR(10);
	DECLARE 	var_printer2		VARCHAR(10);
	DECLARE 	var_pccode		VARCHAR(10);
	DECLARE 	var_pccode_des		VARCHAR(10);
	DECLARE 	var_amount_ttl		DECIMAL(10,2);
	DECLARE 	var_gsts_ttl 		INT;
	DECLARE		var_id	 		INT DEFAULT 0;
	DECLARE 	done_cursor 		INT DEFAULT 0 ;
	DECLARE var_pccode_cus CURSOR FOR SELECT CODE,descript,id FROM tmp_pos_daily_pre WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND TYPE = 'P' ORDER BY CODE;
 	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1; 
	
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_daily_pre;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_audit_report;
	DROP TABLE IF EXISTS pos_daily_tmp;
	
	CREATE TEMPORARY TABLE tmp_pos_audit_report SELECT * FROM pos_audit_report WHERE 1=2;
	INSERT INTO tmp_pos_audit_report 
		SELECT * FROM pos_audit_report WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date >= arg_begin_date AND biz_date <= arg_end_date
			AND usercode = '{{{' AND shift = '9' AND pccode <> 'all' ;
				
	CREATE TEMPORARY TABLE tmp_pos_daily_pre(
		hotel_group_id		BIGINT 		NOT NULL,
		hotel_id 		BIGINT 		NOT NULL,
		id 			INT   	NOT NULL AUTO_INCREMENT,
		TYPE 			CHAR(1) 	NOT NULL,
		CODE 			VARCHAR(10) 	NOT NULL,
		descript 		VARCHAR(50) 	NOT NULL,
		PRIMARY KEY (id)
	);
	INSERT tmp_pos_daily_pre(hotel_group_id,hotel_id,TYPE,CODE,descript) SELECT arg_hotel_group_id,arg_hotel_id,'A','A01','已结账数';
	INSERT tmp_pos_daily_pre(hotel_group_id,hotel_id,TYPE,CODE,descript) SELECT arg_hotel_group_id,arg_hotel_id,'A','A02','删除单据';
	INSERT tmp_pos_daily_pre(hotel_group_id,hotel_id,TYPE,CODE,descript) SELECT arg_hotel_group_id,arg_hotel_id,'A','A03','就餐人数';
	INSERT tmp_pos_daily_pre(hotel_group_id,hotel_id,TYPE,CODE,descript) SELECT arg_hotel_group_id,arg_hotel_id,'A','A04','营收合计';
	INSERT tmp_pos_daily_pre(hotel_group_id,hotel_id,TYPE,CODE,descript) SELECT arg_hotel_group_id,arg_hotel_id,'A','A05','人均消费';
				
	INSERT tmp_pos_daily_pre(hotel_group_id,hotel_id,TYPE,CODE,descript)
		SELECT DISTINCT arg_hotel_group_id,arg_hotel_id,'B',CODE,descript FROM tmp_pos_audit_report WHERE TYPE = '1' ORDER BY TYPE,CODE;
	INSERT tmp_pos_daily_pre(hotel_group_id,hotel_id,TYPE,CODE,descript) SELECT arg_hotel_group_id,arg_hotel_id,'B','B99','<<消费合计>>';
	INSERT tmp_pos_daily_pre(hotel_group_id,hotel_id,TYPE,CODE,descript)
		SELECT DISTINCT arg_hotel_group_id,arg_hotel_id,'C',CODE,descript FROM tmp_pos_audit_report WHERE TYPE = '2' ORDER BY TYPE,CODE;
	INSERT tmp_pos_daily_pre(hotel_group_id,hotel_id,TYPE,CODE,descript) SELECT arg_hotel_group_id,arg_hotel_id,'C','C99','<<付款合计>>';
				
	INSERT tmp_pos_daily_pre(hotel_group_id,hotel_id,TYPE,CODE,descript)
		SELECT DISTINCT arg_hotel_group_id,arg_hotel_id,'P',CODE,descript FROM pos_pccode WHERE hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id ORDER BY CODE;
		
	CREATE TABLE pos_daily_tmp(
		hotel_group_id 		BIGINT 		NOT NULL,
		hotel_id 		BIGINT 		NOT NULL,
		TYPE 			CHAR(1) 	NOT NULL,
		pccode 			VARCHAR(10) 	NOT NULL,
		pccode_des 		VARCHAR(50)	NOT NULL,
		CODE 			VARCHAR(10) 	NOT NULL,
		code_des 		VARCHAR(20) 	NOT NULL,
		amount			DECIMAL(10,2)   DEFAULT 0
	);
	OPEN var_pccode_cus;
	FETCH var_pccode_cus INTO  var_pccode,var_pccode_des,var_id;
	WHILE done_cursor<>1 DO 
		INSERT pos_daily_tmp(hotel_group_id,hotel_id,TYPE,pccode,pccode_des,CODE,code_des,amount)
			SELECT arg_hotel_group_id,arg_hotel_id,'A',var_pccode,CONCAT(1000+var_id,var_pccode_des),'A01','已结账数',IFNULL(SUM(amount1),0) FROM tmp_pos_audit_report 
			WHERE TYPE = '0' AND pccode = var_pccode AND CODE = 'A2';
		INSERT pos_daily_tmp(hotel_group_id,hotel_id,TYPE,pccode,pccode_des,CODE,code_des,amount)
			SELECT arg_hotel_group_id,arg_hotel_id,'A',var_pccode,CONCAT(1000+var_id,var_pccode_des),'A02','删除单据',IFNULL(SUM(amount1),0) FROM tmp_pos_audit_report
			WHERE TYPE = '0' AND pccode = var_pccode AND CODE = 'A5';
		SELECT SUM(amount) INTO var_gsts_ttl FROM tmp_pos_audit_report WHERE TYPE = '0' AND pccode = var_pccode AND CODE = 'B1';	
		SELECT SUM(amount3) INTO var_amount_ttl FROM tmp_pos_audit_report WHERE TYPE = '0' AND pccode = var_pccode AND CODE = 'A2';				
		INSERT pos_daily_tmp(hotel_group_id,hotel_id,TYPE,pccode,pccode_des,CODE,code_des,amount)
			SELECT arg_hotel_group_id,arg_hotel_id,'A',var_pccode,CONCAT(1000+var_id,var_pccode_des),'A03','就餐人数',IFNULL(var_gsts_ttl,0);
		INSERT pos_daily_tmp(hotel_group_id,hotel_id,TYPE,pccode,pccode_des,CODE,code_des,amount)
			SELECT arg_hotel_group_id,arg_hotel_id,'A',var_pccode,CONCAT(1000+var_id,var_pccode_des),'A04','营收合计',IFNULL(var_amount_ttl,0);
		INSERT pos_daily_tmp(hotel_group_id,hotel_id,TYPE,pccode,pccode_des,CODE,code_des,amount)
			SELECT arg_hotel_group_id,arg_hotel_id,'A',var_pccode,CONCAT(1000+var_id,var_pccode_des),'A05','<<人均消费>>',IFNULL(var_amount_ttl/var_gsts_ttl,0);
		
		INSERT pos_daily_tmp(hotel_group_id,hotel_id,TYPE,pccode,pccode_des,CODE,code_des,amount)
			SELECT arg_hotel_group_id,arg_hotel_id,'B',var_pccode,CONCAT(1000+var_id,var_pccode_des),CODE,descript,IFNULL(SUM(amount-amount1),0)
				FROM tmp_pos_audit_report WHERE TYPE = '1' AND pccode = var_pccode GROUP BY CODE,descript ORDER BY CODE;
		INSERT pos_daily_tmp(hotel_group_id,hotel_id,TYPE,pccode,pccode_des,CODE,code_des,amount)
			SELECT arg_hotel_group_id,arg_hotel_id,'B',var_pccode,CONCAT(1000+var_id,var_pccode_des),'B99','<<消费合计>>',IFNULL(SUM(amount-amount1),0) FROM tmp_pos_audit_report WHERE TYPE = '1' AND pccode = var_pccode;
		INSERT pos_daily_tmp(hotel_group_id,hotel_id,TYPE,pccode,pccode_des,CODE,code_des,amount)
			SELECT arg_hotel_group_id,arg_hotel_id,'C',var_pccode,CONCAT(1000+var_id,var_pccode_des),CODE,descript,IFNULL(SUM(amount),0)
				FROM tmp_pos_audit_report WHERE TYPE = '2' AND pccode = var_pccode GROUP BY CODE,descript ORDER BY CODE;
		INSERT pos_daily_tmp(hotel_group_id,hotel_id,TYPE,pccode,pccode_des,CODE,code_des,amount)
			SELECT arg_hotel_group_id,arg_hotel_id,'C',var_pccode,CONCAT(1000+var_id,var_pccode_des),'C99','<<付款合计>>',IFNULL(SUM(amount),0) FROM tmp_pos_audit_report WHERE TYPE = '2' AND pccode = var_pccode;
	FETCH var_pccode_cus INTO var_pccode,var_pccode_des,var_id; 
	END WHILE; 
	CLOSE var_pccode_cus;
	
	UPDATE pos_daily_tmp a,tmp_pos_daily_pre b SET code_des = CONCAT(1000+b.id,code_des) WHERE a.type = b.type AND a.code = b.code;
 	
	SELECT TYPE,pccode,pccode_des,CODE,code_des,amount FROM pos_daily_tmp ORDER BY pccode,TYPE,CODE;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_daily_pre;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_audit_report;
	DROP TABLE IF EXISTS pos_daily_tmp;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_rep_menu_sum`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_rep_menu_sum`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_rep_menu_sum`(
	IN arg_hotel_group_id	BIGINT(16),
	IN arg_hotel_id 	BIGINT(16),
	IN arg_begin		DATETIME,
	IN arg_end		DATETIME
)
BEGIN
	DECLARE	var_sbegin	VARCHAR(10);
	DECLARE	var_send	VARCHAR(10);
	DECLARE var_biz_date	DATETIME;
	
	
	
	DROP TEMPORARY TABLE IF EXISTS tmp_menu_sum;
	DROP TEMPORARY TABLE IF EXISTS tmp_item_list;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
	
	CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2  ;
	CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
	CREATE TEMPORARY TABLE tmp_pos_account SELECT * FROM pos_account WHERE 1=2  ;
	
	
	INSERT INTO tmp_pos_master 
		SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date >= arg_begin AND biz_date <= arg_end
		UNION
		SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date >= arg_begin AND biz_date <= arg_end;
	
	INSERT INTO tmp_pos_detail 
		SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt IN (SELECT accnt FROM tmp_pos_master);
	INSERT INTO tmp_pos_detail 
		SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt IN (SELECT accnt FROM tmp_pos_master);
	
	INSERT INTO tmp_pos_account 
		SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt IN (SELECT accnt FROM tmp_pos_master);
	INSERT INTO tmp_pos_account 
		SELECT * FROM pos_account_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt IN (SELECT accnt FROM tmp_pos_master);
	CREATE TEMPORARY TABLE tmp_item_list
	(
		hotel_group_id		BIGINT 		NOT NULL,
		hotel_id 		BIGINT 		NOT NULL,
		id 			INT   	NOT NULL AUTO_INCREMENT,
		TYPE 			CHAR(1) 	NOT NULL,
		CODE 			VARCHAR(10) 	NOT NULL,
		descript 		VARCHAR(50) 	NOT NULL,
		PRIMARY KEY (id)
	);
	SELECT set_value INTO var_biz_date FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
	
	INSERT tmp_item_list(hotel_group_id,hotel_id,TYPE,CODE,descript)
		SELECT arg_hotel_group_id,arg_hotel_id,'A',CODE,descript FROM pos_pccode WHERE hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id AND is_halt <> 'T' ORDER BY list_order,CODE;
	-- INSERT tmp_item_list(hotel_group_id,hotel_id,TYPE,CODE,descript)
	-- 	SELECT arg_hotel_group_id,arg_hotel_id,'B',CODE,descript FROM code_transaction WHERE hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id ORDER BY list_order,CODE;
	
			
	INSERT tmp_item_list(hotel_group_id,hotel_id,TYPE,CODE,descript)
		SELECT DISTINCT arg_hotel_group_id,arg_hotel_id,'B',a.code,a.descript FROM code_transaction a,tmp_pos_master b,tmp_pos_account c
			WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.hotel_group_id = c.hotel_group_id AND a.hotel_id = c.hotel_id
				AND b.biz_date >= arg_begin AND b.biz_date <= arg_end AND b.sta = 'O' AND b.accnt = c.accnt AND c.sta <> 'X' AND a.code = c.paycode ORDER BY a.list_order,a.code;
	
	
	INSERT tmp_item_list(hotel_group_id,hotel_id,TYPE,CODE,descript)
		SELECT arg_hotel_group_id,arg_hotel_id,'B','9999','<付款合计>';
				
		 -- pccode,accnt,CODE,SUM(amount) AS pay FROM pos_audit_master WHERE TYPE = '2' AND biz_date >= arg_begin AND biz_date <= arg_end AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id GROUP BY pccode,accnt,CODE ORDER BY pccode,accnt	
	
	CREATE TEMPORARY TABLE tmp_menu_sum
	(
		hotel_group_id		BIGINT 		NOT NULL,
		hotel_id 		BIGINT 		NOT NULL,
		pccode 		VARCHAR(10),
		pccode_name	VARCHAR(20),
		menu  		VARCHAR(20),
		tableno		VARCHAR(20),
		gsts		INT,
		gsts_avg	DECIMAL(10,2),
		charge 		DECIMAL(10,2),
		srv 		DECIMAL(10,2),
		dsc 		DECIMAL(10,2),
		tax 		DECIMAL(10,2),
		charge_total	DECIMAL(10,2),
		paycode		DECIMAL(10,2),
		pay_name	VARCHAR(50),
		pay 		DECIMAL(10,2)	
	);
	
			
	INSERT tmp_menu_sum(hotel_group_id,hotel_id,pccode,pccode_name,menu,tableno,gsts,gsts_avg,charge,srv,dsc,tax,charge_total,paycode,pay_name,pay)
		SELECT arg_hotel_group_id,arg_hotel_id,a.pccode,'',a.accnt,a.tableno,a.gsts,'',IFNULL(SUM(b.amount),0),IFNULL(SUM(b.srv),0),IFNULL(SUM(b.dsc),0),IFNULL(SUM(b.tax),0),IFNULL(SUM(b.amount+b.srv+b.tax-b.dsc),0),c.paycode,c.descript,c.credit FROM tmp_pos_master a,tmp_pos_detail b,
			(SELECT accnt,paycode,descript,IFNULL(SUM(credit),'') AS credit FROM tmp_pos_account WHERE sta <> 'X' AND number = 2 GROUP BY accnt,paycode,descript ORDER BY accnt,paycode) c
			WHERE a.sta = 'O' AND a.accnt = b.accnt AND b.sta <> 'X' AND a.accnt = c.accnt
			GROUP BY a.pccode,a.tableno,a.gsts,a.accnt,c.paycode,c.descript ORDER BY a.accnt;
			
	INSERT tmp_menu_sum(hotel_group_id,hotel_id,pccode,pccode_name,menu,tableno,gsts,gsts_avg,charge,srv,dsc,tax,charge_total,paycode,pay_name,pay)
		SELECT arg_hotel_group_id,arg_hotel_id,a.pccode,'',a.accnt,a.tableno,a.gsts,'',IFNULL(SUM(b.amount),0),IFNULL(SUM(b.srv),0),IFNULL(SUM(b.dsc),0),IFNULL(SUM(b.tax),0),IFNULL(SUM(b.amount+b.srv+b.tax-b.dsc),0),'9999','<付款合计>',c.credit FROM tmp_pos_master a,tmp_pos_detail b,
			(SELECT accnt,paycode,descript,IFNULL(SUM(credit),'') AS credit FROM tmp_pos_account WHERE sta <> 'X' AND number = 2 GROUP BY accnt ORDER BY accnt,paycode) c
			WHERE a.sta = 'O' AND a.accnt = b.accnt AND b.sta <> 'X' AND a.accnt = c.accnt
			GROUP BY a.pccode,a.tableno,a.gsts,a.accnt,c.paycode,c.descript ORDER BY a.accnt;
	UPDATE tmp_menu_sum a,
		(SELECT pccode,accnt,CODE,SUM(amount) AS pay FROM pos_audit_master WHERE TYPE = '2' AND biz_date >= arg_begin AND biz_date <= arg_end AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id GROUP BY pccode,accnt,CODE ORDER BY pccode,accnt) b
		SET a.pay = IFNULL(b.pay,0) WHERE a.pccode = b.pccode AND a.menu = b.accnt AND a.paycode = b.code;
	UPDATE tmp_menu_sum SET gsts_avg = ROUND(charge_total/gsts,2) WHERE hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id AND gsts <> 0;
	UPDATE tmp_menu_sum a,pos_master_history b SET a.gsts = b.gsts,a.tableno = b.tableno WHERE a.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id 
		AND b.biz_date >= arg_begin AND b.biz_date <= arg_end AND a.menu = b.accnt;
	UPDATE tmp_menu_sum a,tmp_item_list b SET a.pccode_name = CONCAT(1000+b.id,b.descript) WHERE a.hotel_id = b.hotel_id AND a.hotel_group_id = b.hotel_group_id AND b.type = 'A' AND a.pccode = b.code;
	UPDATE tmp_menu_sum a,tmp_item_list b SET a.pay_name = CONCAT(1000+b.id,b.descript) WHERE a.hotel_id = b.hotel_id AND a.hotel_group_id = b.hotel_group_id AND b.type = 'B' AND a.paycode = b.code;
	SELECT pccode,pccode_name,menu,tableno,gsts,gsts_avg,charge,srv,dsc,tax,charge_total,paycode,pay_name,pay,'*' AS blank FROM  tmp_menu_sum ORDER BY pccode,menu,paycode;
	
	DROP TEMPORARY TABLE IF EXISTS tmp_menu_sum;
	DROP TEMPORARY TABLE IF EXISTS tmp_item_list;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_rep_possale`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_rep_possale`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_rep_possale`(
	IN arg_hotel_group_id	BIGINT(16),
	IN arg_hotel_id 	BIGINT(16),
	IN arg_pccodes		VARCHAR(255),
	IN arg_empid		VARCHAR(20),
	IN arg_shift 		VARCHAR(1),
	IN arg_sorts		VARCHAR(255),
	IN arg_begin		DATETIME,
	IN arg_end		DATETIME
)
BEGIN
	DECLARE	var_sbegin	VARCHAR(10);
	DECLARE	var_send	VARCHAR(10);
	
	IF IFNULL(arg_pccodes,'') = '' OR arg_pccodes = 'ALL' THEN
		SET arg_pccodes = 'all';
	END IF;
	IF IFNULL(arg_empid,'') = '' THEN
		SET arg_empid = '{{{';
	END IF;
	IF IFNULL(arg_shift,'') = '' THEN
		SET arg_shift = '9';
	END IF;
	
	IF arg_sorts IS NULL THEN
		SET arg_sorts = '';
	END IF;
	
	SET var_sbegin = CONCAT(DATE_FORMAT(arg_begin,'%y%m%d'),'0000');
	SET var_send = CONCAT(DATE_FORMAT(arg_end,'%y%m%d'),'9999');
	
	
	DROP TEMPORARY TABLE IF EXISTS tmp_possale;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	
	CREATE TEMPORARY TABLE tmp_possale
	(
		pccode 		VARCHAR(10),
		pccode_name	VARCHAR(20),
		sort  		VARCHAR(10),
		sort_name	VARCHAR(30),
		plu_code	VARCHAR(10),
		plu_name	VARCHAR(80),
		new_name	VARCHAR(80),
		number 		DECIMAL(10,2),
		price 		DECIMAL(10,2),
		unit 		VARCHAR(4),
		srv 		DECIMAL(10,2),
		dsc 		DECIMAL(10,2),
		amount 		DECIMAL(10,2),
		cost 		DECIMAL(10,2)
	
	);
	
	CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2  ;
	CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
	
	
	INSERT INTO tmp_pos_master 
		SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND RIGHT(accnt,10) >= var_sbegin AND RIGHT(accnt,10) <= var_send 
			AND sta <> 'X' AND (INSTR(arg_pccodes,pccode)>= 0 OR arg_pccodes = 'all') AND (shift = arg_shift OR arg_shift = '9');
	INSERT INTO tmp_pos_master 
		SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND RIGHT(accnt,10) >= var_sbegin AND RIGHT(accnt,10) <= var_send 
			AND sta <> 'X' AND (INSTR(arg_pccodes,pccode)>= 0 OR arg_pccodes = 'all') AND (shift = arg_shift OR arg_shift = '9');		
			
	INSERT INTO tmp_pos_detail 
		SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND RIGHT(accnt,10) >= var_sbegin AND RIGHT(accnt,10) <= var_send 
			AND sta <> 'X' AND accnt IN (SELECT accnt FROM tmp_pos_master) AND (create_user = arg_empid OR arg_empid = '{{{');
	INSERT INTO tmp_pos_detail 
		SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND RIGHT(accnt,10) >= var_sbegin AND RIGHT(accnt,10) <= var_send 
			AND sta <> 'X' AND accnt IN (SELECT accnt FROM tmp_pos_master) AND (create_user = arg_empid OR arg_empid = '{{{');
	
	UPDATE tmp_pos_detail SET descript = SUBSTRING(descript,4,CHAR_LENGTH(descript)) WHERE descript LIKE '[退]%';
		
 	INSERT INTO tmp_possale(pccode,pccode_name,sort,sort_name,plu_code,plu_name,new_name,number,price,unit,srv,dsc,amount,cost)
		SELECT a.pccode,c.descript,b.sort_code,d.descript,b.code,e.descript,b.descript AS new_name,SUM(b.number),b.price,b.unit,SUM(b.srv),SUM(b.dsc),SUM(b.amount),SUM(b.cost)
		FROM tmp_pos_master a,tmp_pos_detail b,pos_pccode c,pos_sort_all d,pos_plu_all e
			WHERE c.hotel_group_id = arg_hotel_group_id AND c.hotel_id = arg_hotel_id AND d.hotel_group_id = arg_hotel_group_id AND d.hotel_id = arg_hotel_id
				AND a.accnt = b.accnt AND (INSTR(arg_pccodes,a.pccode) > 0 OR arg_pccodes = 'all') AND (INSTR(arg_sorts,b.sort_code) > 0 OR arg_sorts = '') AND RIGHT(a.accnt,10) >= var_sbegin
				AND RIGHT(a.accnt,10) <= var_send AND a.pccode = c.code AND b.sort_code = d.code AND e.hotel_id = arg_hotel_id AND e.hotel_group_id = arg_hotel_group_id AND b.code = e.code -- AND e.code = f.code 
				AND e.hotel_id = arg_hotel_id AND e.hotel_group_id = arg_hotel_group_id AND b.code = e.code AND b.sort_code = e.sort_code
			GROUP BY c.descript,b.sort_code,d.descript,b.code,e.descript,b.price,b.unit 
			ORDER BY b.sort_code,b.code;
	
	IF arg_pccodes = 'all' THEN
		SELECT '' AS pccode,'餐厅' AS pccode_name,sort,sort_name,plu_code,plu_name,new_name,SUM(number) AS number,price,unit,SUM(srv) AS srv,SUM(dsc) AS dsc,SUM(amount) AS amount,SUM(cost) AS cost FROM tmp_possale GROUP BY sort,sort_name,plu_code,plu_name,new_name,price,unit  ORDER BY sort,plu_name,number DESC;
	ELSE
		SELECT pccode,pccode_name,sort,sort_name,plu_code,plu_name,new_name,number,price,unit,srv,dsc,amount,cost FROM tmp_possale ORDER BY sort,pccode,number DESC;
	END IF;
		
	DROP TEMPORARY TABLE IF EXISTS tmp_possale;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_rep_possale_view`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_rep_possale_view`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_rep_possale_view`(IN arg_hotel_group_id	BIGINT(16),
	IN arg_hotel_id 	BIGINT(16),
	IN arg_pccodes		VARCHAR(255),
	IN arg_empid		VARCHAR(20),
	IN arg_shift 		VARCHAR(1),
	IN arg_sorts		VARCHAR(255),
  IN arg_plus		VARCHAR(20),
	IN arg_begin		DATETIME,
	IN arg_end		DATETIME)
BEGIN
	DECLARE	var_sbegin	VARCHAR(10);
	DECLARE	var_send	VARCHAR(10);
  DECLARE var_sql VARCHAR(512);
	
	IF IFNULL(arg_pccodes,'') = '' OR arg_pccodes = 'ALL' THEN
		SET arg_pccodes = 'all';
	END IF;
	IF IFNULL(arg_empid,'') = '' THEN
		SET arg_empid = '{{{';
	END IF;
	IF IFNULL(arg_shift,'') = '' THEN
		SET arg_shift = '9';
	END IF;
	
	IF arg_sorts IS NULL OR arg_sorts='*' THEN
		SET arg_sorts = '*';
	END IF;
	
	SET var_sbegin = CONCAT(DATE_FORMAT(arg_begin,'%y%m%d'),'0000');
	SET var_send = CONCAT(DATE_FORMAT(arg_end,'%y%m%d'),'9999');
	
--	INSERT gdsmsg SELECT CONCAT(IFNULL(arg_pccodes,''),'/',IFNULL(arg_empid,''),'/',IFNULL(arg_shift,''),'/',IFNULL(arg_sorts,''),'/',arg_begin);
	
	DROP TEMPORARY TABLE IF EXISTS tmp_possale;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	
	CREATE TEMPORARY TABLE tmp_possale
	(
		pccode 		VARCHAR(10),
		pccode_name	VARCHAR(20),
		sort  		VARCHAR(10),
		sort_name	VARCHAR(30),
		plu_code	VARCHAR(10),
		plu_name	VARCHAR(80),
		new_name	VARCHAR(80),
		number 		DECIMAL(10,2),
		price 		DECIMAL(10,2),
		unit 		VARCHAR(4),
		srv 		DECIMAL(10,2),
		dsc 		DECIMAL(10,2),
		amount 		DECIMAL(10,2),
		cost 		DECIMAL(10,2)
	
	);
	
	CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2  ;
	CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
	
	
	INSERT INTO tmp_pos_master 
		SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND RIGHT(accnt,10) >= var_sbegin AND RIGHT(accnt,10) <= var_send 
			AND sta <> 'X' AND (INSTR(arg_pccodes,pccode)>= 0 OR arg_pccodes = 'all') AND (shift = arg_shift OR arg_shift = '9');
	INSERT INTO tmp_pos_master 
		SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND RIGHT(accnt,10) >= var_sbegin AND RIGHT(accnt,10) <= var_send 
			AND sta <> 'X' AND (INSTR(arg_pccodes,pccode)>= 0 OR arg_pccodes = 'all') AND (shift = arg_shift OR arg_shift = '9');		
-- 如果有菜品名称输入		
IF LENGTH(arg_plus)>1 THEN --
    SET var_sql = CONCAT(" 
    INSERT INTO tmp_pos_detail 
		SELECT * FROM pos_detail WHERE hotel_group_id = ",arg_hotel_group_id," AND hotel_id = ",arg_hotel_id," AND RIGHT(accnt,10) >= '",var_sbegin,"' AND RIGHT(accnt,10) <= '",var_send, 
			"' AND sta <> 'X' AND accnt IN (SELECT accnt FROM tmp_pos_master)  AND (create_user = '",arg_empid,"' OR '",arg_empid,"' = '{{{' )   AND ( descript like '%",arg_plus,"%'  or code like '%",arg_plus,"%' ) ;
    ");
    	SET @exec_sql = var_sql;  
   	  PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
       SET var_sql = CONCAT("
    INSERT INTO tmp_pos_detail 
		SELECT * FROM pos_detail_history WHERE hotel_group_id = ",arg_hotel_group_id," AND hotel_id = ",arg_hotel_id," AND RIGHT(accnt,10) >= '",var_sbegin,"' AND RIGHT(accnt,10) <= '",var_send, 
			"' AND sta <> 'X' AND accnt IN (SELECT accnt FROM tmp_pos_master)   AND (create_user = '",arg_empid,"' OR '",arg_empid,"' = '{{{' )   AND ( descript like '%",arg_plus,"%'  or code like '%",arg_plus,"%' ) ;
    ");
    	SET @exec_sql = var_sql;  
   	  PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
ELSE	
	INSERT INTO tmp_pos_detail 
		SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND RIGHT(accnt,10) >= var_sbegin AND RIGHT(accnt,10) <= var_send 
			AND sta <> 'X' AND accnt IN (SELECT accnt FROM tmp_pos_master) AND (create_user = arg_empid OR arg_empid = '{{{');
	INSERT INTO tmp_pos_detail 
		SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND RIGHT(accnt,10) >= var_sbegin AND RIGHT(accnt,10) <= var_send 
			AND sta <> 'X' AND accnt IN (SELECT accnt FROM tmp_pos_master) AND (create_user = arg_empid OR arg_empid = '{{{');
END IF ;
	UPDATE tmp_pos_detail SET descript = SUBSTRING(descript,4,CHAR_LENGTH(descript)) WHERE descript LIKE '[退]%';
		
 	INSERT INTO tmp_possale(pccode,pccode_name,sort,sort_name,plu_code,plu_name,new_name,number,price,unit,srv,dsc,amount,cost)
		SELECT a.pccode,c.descript,b.sort_code,d.descript,b.code,e.descript,b.descript AS new_name,SUM(b.number),b.price,b.unit,SUM(b.srv),SUM(b.dsc),SUM(b.amount),SUM(b.cost)
		FROM tmp_pos_master a,tmp_pos_detail b,pos_pccode c,pos_sort_all d,pos_plu_all e
			WHERE c.hotel_group_id = arg_hotel_group_id AND c.hotel_id = arg_hotel_id AND d.hotel_group_id = arg_hotel_group_id AND d.hotel_id = arg_hotel_id
				AND a.accnt = b.accnt AND (INSTR(arg_pccodes,a.pccode) > 0 OR arg_pccodes = 'all') AND (INSTR(arg_sorts,b.sort_code) > 0 OR arg_sorts = '*') AND RIGHT(a.accnt,10) >= var_sbegin
				AND RIGHT(a.accnt,10) <= var_send AND a.pccode = c.code AND b.sort_code = d.code AND e.hotel_id = arg_hotel_id AND e.hotel_group_id = arg_hotel_group_id AND b.code = e.code -- AND e.code = f.code 
				AND e.hotel_id = arg_hotel_id AND e.hotel_group_id = arg_hotel_group_id AND b.code = e.code AND b.sort_code = e.sort_code
			GROUP BY c.descript,b.sort_code,d.descript,b.code,e.descript,b.price,b.unit 
			ORDER BY b.sort_code,b.code;
	
	IF arg_pccodes = 'all' THEN
		SELECT '' AS pccode,'餐厅' AS pccode_name,sort,sort_name,plu_code,plu_name,new_name,SUM(number) AS number,price,unit,SUM(srv) AS srv,SUM(dsc) AS dsc,SUM(amount) AS amount,SUM(cost) AS cost FROM tmp_possale GROUP BY sort,sort_name,plu_code,plu_name,new_name,price,unit  ORDER BY sort,plu_name,number DESC;
	ELSE
		SELECT pccode,pccode_name,sort,sort_name,plu_code,plu_name,new_name,number,price,unit,srv,dsc,amount,cost FROM tmp_possale ORDER BY sort,pccode,number DESC;
	END IF;
		
	DROP TEMPORARY TABLE IF EXISTS tmp_possale;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_shift_report`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_shift_report`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_shift_report`(IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
        IN arg_biz_date		DATETIME,
 	IN arg_pccode  VARCHAR(100),
	IN arg_empid   VARCHAR(10),
	IN arg_shift CHAR(1),
  IN arg_reportNo CHAR(1))
    SQL SECURITY INVOKER
label_0:
BEGIN
	DECLARE var_bizdate DATETIME;
	DECLARE i INT DEFAULT 0;
	DECLARE j INT DEFAULT 0;
  DECLARE var_sql		VARCHAR(1024);
  DECLARE var_pccodes		VARCHAR(100);
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_pccode;
      DROP TEMPORARY TABLE IF EXISTS tmp_code_base;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_shift;
      	DROP TEMPORARY TABLE IF EXISTS tmp_pos_cashier;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_cashier1;
        
                      
      CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
      CREATE TEMPORARY TABLE tmp_pos_account SELECT * FROM pos_account WHERE 1=2;
      CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2 ;
      CREATE TEMPORARY TABLE tmp_pos_pccode SELECT * FROM pos_pccode WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id ;
      CREATE TEMPORARY TABLE tmp_code_base SELECT * FROM  code_base  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND parent_code = 'pos_rep_item';
--	insert a(msg) select concat(ifnull(arg_biz_date,''),'/',ifnull(arg_pccode,''),'/',ifnull(arg_empid,''),'/',ifnull(arg_shift,''));
	IF(arg_empid = '' OR arg_empid = 'ALL') THEN
		SET arg_empid = 'all';
	END IF;
	
	IF arg_reportNo IN('4','5','6','7') THEN
		SET arg_reportNo = '0';
	END IF;
      
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_shift;
      CREATE TEMPORARY TABLE tmp_pos_shift (
		  `hotel_group_id` BIGINT(16) NOT NULL,
		  `hotel_id` BIGINT(16) NOT NULL,
		  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
		  `biz_date` DATETIME NOT NULL COMMENT '营业日期',
		  `type` VARCHAR(1) NOT NULL DEFAULT '1',
		  `accnt` CHAR(20) NOT NULL DEFAULT '',
		  `userCode` VARCHAR(10) DEFAULT '' COMMENT '工号',
		  `shift` CHAR(3) NOT NULL DEFAULT '' COMMENT '班别',
		  `pccode` VARCHAR(10) NOT NULL DEFAULT '' COMMENT '营业点代码 ',
		  `name` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '营业点描叙 ',
		  `code` VARCHAR(10) DEFAULT '' COMMENT '类型',
		  `descript` VARCHAR(20) DEFAULT '' COMMENT '类型描叙',
		  `amount0`  VARCHAR(20) DEFAULT '' ,
		  `amount1` VARCHAR(20) DEFAULT '' ,  
		  `amount2` VARCHAR(20) DEFAULT '',
		  `amount3` VARCHAR(20) DEFAULT '',
		  `amount` VARCHAR(20) DEFAULT '',
		  `ent_ft` VARCHAR(20) DEFAULT '',
		  `dsc_ft` VARCHAR(20) DEFAULT '',
		  PRIMARY KEY (`id`)
		  );
     SELECT set_value INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
     DROP TEMPORARY TABLE IF EXISTS tmp_pos_pccodes;
	   CREATE TEMPORARY TABLE tmp_pos_pccodes (
           `pccode` VARCHAR(10) DEFAULT ''         
	    );
IF LENGTH(arg_pccode) > 0 THEN
   SET var_pccodes = arg_pccode ;
   SELECT LENGTH(var_pccodes)-LENGTH(REPLACE(var_pccodes,',',''))+1 INTO i ;
   SET j = 0;
   WHILE j< i DO
      SET j=j+1;
        IF(LENGTH(REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_pccodes,',',j)),',',1)) )>0 ) THEN
        INSERT  tmp_pos_pccodes(pccode)
        SELECT REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_pccodes,',',j)),',',1));
        END IF;
      END WHILE ;
    END IF;    
      --  准备数据
      SELECT TO_DAYS(arg_biz_date)-TO_DAYS(var_bizdate) INTO i;
      IF i=0 THEN
         IF(arg_pccode = 'all') THEN
         INSERT INTO tmp_pos_master SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id ;-- AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_account SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;-- AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_detail SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;-- AND biz_date = arg_biz_date ;
         ELSE 
         INSERT INTO tmp_pos_master SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND pccode IN (SELECT pccode FROM tmp_pos_pccodes);-- AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_account SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt IN (SELECT accnt FROM tmp_pos_master) ;-- AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_detail SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND accnt IN (SELECT accnt FROM tmp_pos_master) ;-- AND biz_date = arg_biz_date ;
         END IF;
      
      ELSE
         IF(arg_pccode = 'all') THEN
         INSERT INTO tmp_pos_master SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_account SELECT * FROM pos_account_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id   AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_detail SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id   AND biz_date = arg_biz_date ;
         ELSE 
         INSERT INTO tmp_pos_master SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND pccode IN (SELECT pccode FROM tmp_pos_pccodes) AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_account SELECT * FROM pos_account_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt IN (SELECT accnt FROM tmp_pos_master)  AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_detail SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND accnt IN (SELECT accnt FROM tmp_pos_master) AND biz_date = arg_biz_date ;
         END IF;
      END IF ;
      
  	CREATE TEMPORARY TABLE tmp_pos_cashier(
		hotel_group_id 		BIGINT 		NOT NULL,
		hotel_id 		BIGINT 		NOT NULL,	
		accnt 			VARCHAR(20)	NOT NULL,
		shift			CHAR(1)		NOT NULL,
		cashier 		VARCHAR(10)	NOT NULL
	);
	
	CREATE TEMPORARY TABLE tmp_pos_cashier1(
		hotel_group_id 		BIGINT 		NOT NULL,
		hotel_id 		BIGINT 		NOT NULL,	
		accnt 			VARCHAR(20)	NOT NULL,
		pcrec			VARCHAR(20)	NOT NULL,
		shift			CHAR(1)		NOT NULL,
		cashier 		VARCHAR(10)	NOT NULL
	);
	INSERT INTO tmp_pos_cashier(hotel_group_id,hotel_id,accnt,shift,cashier)
		SELECT DISTINCT arg_hotel_group_id,arg_hotel_id,accnt,shift,create_user FROM tmp_pos_account WHERE number = 2 AND (create_user = arg_empid OR arg_empid = 'all') AND (shift = arg_shift OR arg_shift = '9');
	INSERT INTO tmp_pos_cashier1(hotel_group_id,hotel_id,accnt,pcrec,shift,cashier)
		SELECT DISTINCT arg_hotel_group_id,arg_hotel_id,a.accnt,b.pcrec,a.shift,a.create_user FROM tmp_pos_account a,tmp_pos_master b WHERE a.accnt = b.accnt AND a.number = 2 AND (a.create_user = arg_empid OR arg_empid = 'all') AND (a.shift = arg_shift OR arg_shift = '9') AND IFNULL(b.pcrec,'') <> '';
	
	INSERT INTO tmp_pos_cashier(hotel_group_id,hotel_id,accnt,shift,cashier)
		SELECT DISTINCT arg_hotel_group_id,arg_hotel_id,b.accnt,a.shift,a.cashier FROM tmp_pos_cashier1 a,tmp_pos_master b WHERE a.pcrec = b.pcrec AND a.accnt <> b.accnt;   
    
IF(arg_reportNo = '0' OR arg_reportNo = '2' OR arg_reportNo = 'U' ) THEN
      INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',d.cashier,e.shift,b.code,b.descript,'A1','总开单',
    IFNULL(COUNT(e.accnt),0) ,
    0,
		IFNULL(SUM(e.credit),0),
		IFNULL(SUM(e.bal),0),
	  IFNULL(SUM(e.charge),0),0,0 
		FROM 
    tmp_pos_pccode b ,tmp_pos_cashier d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND e.pccode = b.code
		GROUP BY d.cashier,e.shift,b.code,b.descript ;
		
    INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',d.cashier,e.shift,b.code,b.descript,'A2','   已结账',
		IFNULL(COUNT(e.accnt),0) ,
    0,
		IFNULL(SUM(e.credit),0),
		IFNULL(SUM(e.bal),0),
	  IFNULL(SUM(e.charge),0),0,0 
		FROM 
    tmp_pos_pccode b ,tmp_pos_cashier d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND e.pccode = b.code  AND e.sta = 'O' 
		GROUP BY d.cashier,e.shift,b.code,b.descript ;
      
    INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',d.cashier,e.shift,b.code,b.descript,'A3','   未结账',
		IFNULL(COUNT(e.accnt),0) ,
    0,
		IFNULL(SUM(e.credit),0),
		IFNULL(SUM(e.bal),0),
	  IFNULL(SUM(e.charge),0),0,0 
		FROM 
    tmp_pos_pccode b ,tmp_pos_cashier d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND e.pccode = b.code  AND e.sta IN ('I','C') 
		GROUP BY d.cashier,e.shift,b.code,b.descript ;
  
    INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',d.cashier,e.shift,b.code,b.descript,'A4','  挂账',
		IFNULL(COUNT(e.accnt),0) ,
    0,
		IFNULL(SUM(e.credit),0),
		IFNULL(SUM(e.bal),0),
	  IFNULL(SUM(e.charge),0),0,0 
		FROM 
    tmp_pos_pccode b ,tmp_pos_cashier d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND e.pccode = b.code  AND e.sta='S' 
		GROUP BY d.cashier,e.shift,b.code,b.descript ;
		
    INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',d.cashier,e.shift,b.code,b.descript,'A5','   删除',
		IFNULL(COUNT(e.accnt),0) ,
    0,
		IFNULL(SUM(e.credit),0),
		IFNULL(SUM(e.bal),0),
	  IFNULL(SUM(e.charge),0),0,0 
		FROM
    tmp_pos_pccode b ,tmp_pos_cashier d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND e.pccode = b.code  AND e.sta = 'X'
		GROUP BY d.cashier,e.shift,b.code,b.descript ;
		
    INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',d.cashier,e.shift,b.code,b.descript,'B1','   就餐人数',
    IFNULL(SUM(e.gsts),0),0,0,0,
		IFNULL(ROUND(SUM(e.charge)/SUM(e.gsts),2),0),0,0  
		FROM
    tmp_pos_pccode b ,tmp_pos_cashier d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND e.pccode = b.code  AND e.sta <> 'X' AND e.sta <> 'S'
		GROUP BY d.cashier,e.shift,b.code,b.descript ;
		
  
    INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',a.cashier,e.shift,e.pccode,f.descript,b.code,CONCAT('   其中',b.descript,':'),
			IFNULL(SUM(d.amount),0),
			IFNULL(SUM(d.srv),0),
			IFNULL(SUM(d.tax),0),
			IFNULL(SUM(d.dsc),0),
			IFNULL(SUM(d.amount + d.srv + d.tax - d.dsc) ,0),
      IFNULL(SUM(d.amount1),0),
      IFNULL(SUM(d.amount2),0) 
			FROM 
      tmp_pos_cashier a,tmp_code_base b ,tmp_pos_detail d,tmp_pos_master e,tmp_pos_pccode f
			WHERE a.accnt = d.accnt  AND b.code = d.tocode 
          AND d.type = '1'  -- 表示都是菜品，否则是单菜的做法或者是退菜      
				  AND d.sta = 'I' AND a.accnt = e.accnt AND e.sta = 'O' 
          AND e.pccode = f.code
			GROUP BY e.modify_user,e.shift,e.pccode,f.descript,b.code,b.descript 
      ORDER BY e.pccode,b.code ;
 
 /*   INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',e.modify_user,e.shift,e.pccode,f.descript,'098','零头',
			IFNULL(SUM(a.amount),0),
			0,
			0,
			0,
			IFNULL(SUM(a.amount),0),0,0  
			FROM 
      tmp_pos_detail a,tmp_pos_master e,tmp_pos_pccode f
			WHERE a.sta = 'I'  AND a.code = 'ML' AND a.accnt = e.accnt AND e.sta = 'O' AND e.pccode = f.code 
			GROUP BY e.modify_user,e.shift,e.pccode,f.descript 
      ORDER BY e.pccode ;
*/
    INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',a.cashier,e.shift,e.pccode,f.descript,'099',CONCAT('   其中','<未定义>',':'),
			IFNULL(SUM(d.amount),0),
			IFNULL(SUM(d.srv),0),
			IFNULL(SUM(d.tax),0),
			IFNULL(SUM(d.dsc),0),
			IFNULL(SUM(d.amount + d.srv + d.tax - d.dsc) ,0),
      IFNULL(SUM(d.amount1),0),
      IFNULL(SUM(d.amount2),0) 
		 FROM 
     tmp_pos_cashier a,tmp_pos_detail d,tmp_pos_master e,tmp_pos_pccode f
		 WHERE a.accnt = d.accnt  AND IFNULL(d.tocode,'')='' 
          AND d.type = '1' 
				  AND d.sta = 'I' AND a.accnt = e.accnt AND e.sta = 'O' 
          AND e.pccode = f.code
		  	GROUP BY a.cashier,e.shift,e.pccode,f.descript 
        ORDER BY e.pccode ;
 INSERT tmp_pos_shift  (hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'2',c.modify_user,d.shift,c.pccode,e.descript,c.paycode,c.descript,
		IFNULL(SUM(0),0),
		IFNULL(SUM(0),0),
		IFNULL(SUM(0),0),
		IFNULL(SUM(0),0),
		IFNULL(SUM(c.credit) ,0),0,0 
		 FROM
       tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e
			WHERE c.accnt = d.accnt AND d.sta = 'O'  
      AND c.sta = 'O' AND c.number = 2 -- a的营业点  c的付款方式
      AND c.pccode = e.code
		  GROUP BY d.modify_user,d.shift,c.pccode,e.descript,c.paycode,c.descript 
      ORDER BY c.pccode,c.paycode ;
      
IF(arg_shift = '9' OR arg_empid = 'all') THEN 
     DROP TEMPORARY TABLE IF EXISTS tmp_pos_shift2 ;
	 	 CREATE TEMPORARY TABLE tmp_pos_shift2 SELECT * FROM tmp_pos_shift WHERE 1=2  ;
	 	 INSERT INTO tmp_pos_shift2 SELECT * FROM  tmp_pos_shift WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
/*
SET var_sql = CONCAT("
insert tmp_pos_shift  (hotel_group_id,hotel_id,biz_date,type,userCode,shift,pccode,name,code,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		select hotel_group_id,hotel_id,biz_date,type,userCode,shift,'all','所有营业点',code,descript,
		IFNULL(sum(amount0),0),
		IFNULL(sum(amount1),0),
		IFNULL(sum(amount2),0),
		IFNULL(sum(amount3),0),
		IFNULL(sum(amount),0),IFNULL(sum(ent_ft),0),IFNULL(sum(dsc_ft),0) 
		from tmp_pos_shift2 where hotel_group_id = ",arg_hotel_group_id," AND hotel_id =  ",arg_hotel_id," and biz_date = '",arg_biz_date,"'  AND pccode <> 'all'  group by hotel_group_id,hotel_id,biz_date,type,userCode,shift,`code`,descript	;
");
    	SET @exec_sql = var_sql;  
   	 PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
*/
SET var_sql = CONCAT("
insert tmp_pos_shift  (hotel_group_id,hotel_id,biz_date,type,userCode,shift,pccode,name,code,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		select hotel_group_id,hotel_id,biz_date,type,userCode,'9',pccode,name,code,descript,
		IFNULL(sum(amount0),0),
		IFNULL(sum(amount1),0),
		IFNULL(sum(amount2),0),
		IFNULL(sum(amount3),0),
		IFNULL(sum(amount),0),IFNULL(sum(ent_ft),0),IFNULL(sum(dsc_ft),0) 
		from tmp_pos_shift2 where  hotel_group_id = ",arg_hotel_group_id," AND hotel_id =  ",arg_hotel_id," and biz_date = '",arg_biz_date,"'  AND shift <> '9' group by hotel_group_id,hotel_id,biz_date,type,userCode,pccode,name,code,descript	;
");
    	SET @exec_sql = var_sql;  
   	 PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
SET var_sql = CONCAT("
insert tmp_pos_shift  (hotel_group_id,hotel_id,biz_date,type,userCode,shift,pccode,name,code,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		select hotel_group_id,hotel_id,biz_date,type,'all',shift,pccode,name,code,descript,
		IFNULL(sum(amount0),0),
		IFNULL(sum(amount1),0),
		IFNULL(sum(amount2),0),
		IFNULL(sum(amount3),0),
		IFNULL(sum(amount),0),IFNULL(sum(ent_ft),0),IFNULL(sum(dsc_ft),0) 
		from tmp_pos_shift2 where hotel_group_id = ",arg_hotel_group_id," AND hotel_id =  ",arg_hotel_id," and biz_date = '",arg_biz_date,"' AND userCode <> '{{{'  group by hotel_group_id,hotel_id,biz_date,type,shift,pccode,name,code,descript	;
");
    	SET @exec_sql = var_sql;  
   	 PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
END IF ;
  IF (arg_reportNo = '0') THEN
      -- APP2交班报表
			UPDATE tmp_pos_shift SET amount = ROUND(amount,2),amount0 = ROUND(amount0,2);
			UPDATE tmp_pos_shift SET amount0 = CONCAT('数量:',amount0),amount = CONCAT('/金额合计:',amount) WHERE CODE IN ('A1','A2','A3','A4','A5')  ;
			UPDATE tmp_pos_shift SET amount0 = CONCAT('数量:',amount0),amount = CONCAT('/人均消费:',amount) WHERE CODE  = 'B1'  ;
			UPDATE tmp_pos_shift SET amount0 = '' ,amount = CONCAT('类别合计:',amount) WHERE TYPE = '1'  ;
			UPDATE tmp_pos_shift SET amount0 = '' ,amount = CONCAT('付款合计:',amount) WHERE TYPE = '2'  ;
      IF(arg_empid = 'all' AND arg_shift = '9') THEN
          SELECT NAME,shift,descript,CONCAT(amount0,amount) AS amount FROM tmp_pos_shift WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND pccode IN (SELECT pccode FROM tmp_pos_pccodes) AND userCode = arg_empid  ORDER BY shift,TYPE ;
      ELSE
		      SELECT NAME,shift,descript,CONCAT(amount0,amount) AS amount FROM tmp_pos_shift WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND pccode IN (SELECT pccode FROM tmp_pos_pccodes) AND userCode = arg_empid  AND shift = arg_shift ORDER BY pccode,shift,TYPE ;
      END IF ;
 ELSEIF(arg_reportNo = '2') THEN
      -- APP2折扣款单表
	     UPDATE tmp_pos_shift SET  amount1 = CONCAT(',服务费:',amount1),amount3 = CONCAT(',折扣:',amount3), amount = CONCAT(',合计:',amount) WHERE TYPE = '1'  ;
       IF(arg_empid = 'all' AND arg_shift = '9') THEN
            SELECT NAME,shift,descript,CONCAT(amount0,'',amount1,amount3,amount) AS amount FROM tmp_pos_shift WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND pccode IN (SELECT pccode FROM tmp_pos_pccodes) AND userCode = arg_empid AND TYPE = '1'  ORDER BY shift;
      ELSE
           SELECT NAME,shift,descript,CONCAT(amount0,'',amount1,amount3,amount) AS amount FROM tmp_pos_shift WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND pccode IN (SELECT pccode FROM tmp_pos_pccodes) AND userCode = arg_empid AND shift = arg_shift AND TYPE = '1';
      END IF ;
  ELSEIF(arg_reportNo = 'U') THEN
      -- APP2 用户信息统计
      SELECT  CODE,descript,SUM(amount0),SUM(amount) FROM tmp_pos_shift WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND ( userCode = arg_empid OR arg_empid = 'all') AND shift = arg_shift AND TYPE IN ('0','2') AND CODE NOT IN ('A5','B1') GROUP BY CODE,descript;
 
 END IF ;
ELSEIF(arg_reportNo = '1') THEN
    -- APP2 收款明细表
   SELECT b.descript AS NAME,a.shift,a.descript, CONCAT(CAST(a.credit AS CHAR(12)),'  Time:',a.modify_datetime) FROM tmp_pos_account a LEFT JOIN  tmp_pos_pccode b ON a.pccode=b.`code` WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id  AND  a.pccode IN (SELECT pccode FROM tmp_pos_pccodes)
   AND (a.modify_user = arg_empid OR arg_empid = 'all') AND (a.shift = arg_shift OR arg_shift = '9') AND a.number = '2' AND a.sta IN ('I','O') ORDER BY b.code,a.shift,a.modify_datetime ;
   
ELSEIF(arg_reportNo = '3') THEN
   -- APP2 销售明细表
   SELECT c.descript  AS NAME ,a.shift, a.descript,CONCAT('数量:',SUM(a.number)) FROM tmp_pos_detail a LEFT JOIN tmp_pos_master b ON a.hotel_group_id = b.hotel_group_id AND a.hotel_id =b.hotel_id AND a.accnt = b.accnt
   LEFT JOIN tmp_pos_pccode c ON b.hotel_group_id = c.hotel_group_id AND b.hotel_id = c.hotel_id AND b.pccode = c.code
   WHERE  b.pccode IN (SELECT pccode FROM tmp_pos_pccodes)  AND (a.modify_user = arg_empid OR arg_empid = 'all') AND (a.shift = arg_shift OR arg_shift = '9') 
   GROUP BY a.shift,a.code ORDER BY c.code ;
ELSE 
   SELECT '未查询到相关数据' ;
END IF ;
 DROP TEMPORARY TABLE IF EXISTS tmp_pos_shift;
 	DROP TEMPORARY TABLE IF EXISTS tmp_pos_cashier;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_cashier1;
	      DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_pccode;
      DROP TEMPORARY TABLE IF EXISTS tmp_code_base;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_shift_report1_for_app2`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_shift_report1_for_app2`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_shift_report1_for_app2`(
	IN 	arg_hotel_group_id	BIGINT(16),	
	IN 	arg_hotel_id		BIGINT(16),
	IN 	arg_biz_date	 	DATETIME,
	IN 	arg_pccodes		VARCHAR(50),
	IN 	arg_empid		VARCHAR(10),
	IN 	arg_shift		CHAR(1),
	IN 	arg_reportNo		CHAR(5)
	)
    SQL SECURITY INVOKER
BEGIN
	DECLARE 	var_tag			CHAR(1);
	DECLARE 	var_printer1 		VARCHAR(10);
	DECLARE 	var_printer2		VARCHAR(10);
	DECLARE 	var_pccode		VARCHAR(10);
	DECLARE 	var_pccode_des		VARCHAR(10);
	DECLARE 	var_lintou 		DECIMAL(10,2);
	DECLARE		var_list_order_pc	INT DEFAULT 0;
	DECLARE 	done_cursor 		INT DEFAULT 0 ;
 	DECLARE var_pccode_cus CURSOR FOR SELECT CODE,descript,IFNULL(list_order,0) FROM pos_pccode WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND (INSTR(arg_pccodes,CODE) >0 OR arg_pccodes = 'all') ORDER BY CODE;
 	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1; 
 	
 	IF IFNULL(arg_empid,'') = '' OR arg_empid = 'ALL' THEN
		SET arg_empid = '{{{';
 	END IF;
 	
 	 IF IFNULL(arg_shift,'') = '' THEN
		SET arg_shift = '9';
 	END IF;
	
	IF IFNULL(arg_pccodes,'') = '' THEN
		SET arg_pccodes = 'all';
 	END IF; 
	
	DROP TABLE IF EXISTS pos_shift_tmp;
	CREATE TABLE pos_shift_tmp(
		hotel_group_id 		BIGINT 		NOT NULL,
		hotel_id 		BIGINT 		NOT NULL,
		biz_date 		DATETIME 	NOT NULL,
		TYPE 			CHAR(1) 	NOT NULL,
		pccode 			VARCHAR(10) 	NOT NULL,
		pccode_des 		VARCHAR(50)	NOT NULL,
		CODE 			VARCHAR(10) 	NOT NULL,
		code_des 		VARCHAR(20) 	NOT NULL,
		cashier 		VARCHAR(10) 	NOT NULL,
		shift 			CHAR(1) 	,
		amount			DECIMAL(10,2)   DEFAULT 0,
		list_order_pc		INT		DEFAULT 0,
		list_order_co		INT		DEFAULT 0
	);
	
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_cashier;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_cashier1;
	
	CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2  ;
	CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
	CREATE TEMPORARY TABLE tmp_pos_account SELECT * FROM pos_account WHERE 1=2  ;
	
	INSERT INTO tmp_pos_master 
		SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date 
			UNION
		SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;	
	
	INSERT INTO tmp_pos_detail 
		SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND sta <> 'X'
		UNION
		SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND sta <> 'X';	
	INSERT INTO tmp_pos_account 
		SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND sta <> 'X'
		UNION
		SELECT * FROM pos_account_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND sta <> 'X';
	
	CREATE TEMPORARY TABLE tmp_pos_cashier(
		hotel_group_id 		BIGINT 		NOT NULL,
		hotel_id 		BIGINT 		NOT NULL,	
		accnt 			VARCHAR(20)	NOT NULL,
		shift			CHAR(1)		NOT NULL,
		cashier 		VARCHAR(10)	NOT NULL
	);
	
	CREATE TEMPORARY TABLE tmp_pos_cashier1(
		hotel_group_id 		BIGINT 		NOT NULL,
		hotel_id 		BIGINT 		NOT NULL,	
		accnt 			VARCHAR(20)	NOT NULL,
		pcrec			VARCHAR(20)	NOT NULL,
		shift			CHAR(1)		NOT NULL,
		cashier 		VARCHAR(10)	NOT NULL
	);
	INSERT INTO tmp_pos_cashier(hotel_group_id,hotel_id,accnt,shift,cashier)
		SELECT DISTINCT arg_hotel_group_id,arg_hotel_id,accnt,shift,create_user FROM tmp_pos_account WHERE number = 2 AND (create_user = arg_empid OR arg_empid = '{{{') AND (shift = arg_shift OR arg_shift = '9');
	INSERT INTO tmp_pos_cashier1(hotel_group_id,hotel_id,accnt,pcrec,shift,cashier)
		SELECT DISTINCT arg_hotel_group_id,arg_hotel_id,a.accnt,b.pcrec,a.shift,a.create_user FROM tmp_pos_account a,tmp_pos_master b WHERE a.accnt = b.accnt AND a.number = 2 AND (a.create_user = arg_empid OR arg_empid = '{{{') AND (a.shift = arg_shift OR arg_shift = '9') AND IFNULL(b.pcrec,'') <> '';
	
	INSERT INTO tmp_pos_cashier(hotel_group_id,hotel_id,accnt,shift,cashier)
		SELECT DISTINCT arg_hotel_group_id,arg_hotel_id,b.accnt,a.shift,.a.cashier FROM tmp_pos_cashier1 a,tmp_pos_master b WHERE a.pcrec = b.pcrec AND a.accnt <> b.accnt;
				
	OPEN var_pccode_cus;
	FETCH var_pccode_cus INTO  var_pccode,var_pccode_des,var_list_order_pc;
	WHILE done_cursor<>1 DO 
		INSERT INTO pos_shift_tmp(hotel_group_id,hotel_id,biz_date,TYPE,pccode,pccode_des,CODE,code_des,cashier,shift,amount,list_order_pc,list_order_co)
			SELECT arg_hotel_group_id,arg_hotel_id,arg_biz_date,'A',var_pccode,var_pccode_des,'A01','总开单数',arg_empid,arg_shift,COUNT(a.accnt),var_list_order_pc,1 FROM tmp_pos_master a,pos_pccode b
			WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.pccode = var_pccode AND b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND b.code = var_pccode;
			
		INSERT INTO pos_shift_tmp(hotel_group_id,hotel_id,biz_date,TYPE,pccode,pccode_des,CODE,code_des,cashier,shift,amount,list_order_pc,list_order_co)
			SELECT arg_hotel_group_id,arg_hotel_id,arg_biz_date,'A',var_pccode,var_pccode_des,'A02','已结单数',arg_empid,arg_shift,COUNT(a.accnt),var_list_order_pc,2 FROM tmp_pos_master a,pos_pccode b 
			WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.pccode = var_pccode AND a.sta = 'O' AND b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND b.code = var_pccode;
			
		INSERT INTO pos_shift_tmp(hotel_group_id,hotel_id,biz_date,TYPE,pccode,pccode_des,CODE,code_des,cashier,shift,amount,list_order_pc,list_order_co)	
			SELECT arg_hotel_group_id,arg_hotel_id,arg_biz_date,'A',var_pccode,var_pccode_des,'A03','未结单数',arg_empid,arg_shift,COUNT(a.accnt),var_list_order_pc,3 FROM tmp_pos_master a,pos_pccode b 
			WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.pccode = var_pccode AND a.sta <> 'O' AND a.sta <> 'X' AND b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND b.code = var_pccode;
			
		INSERT INTO pos_shift_tmp(hotel_group_id,hotel_id,biz_date,TYPE,pccode,pccode_des,CODE,code_des,cashier,shift,amount,list_order_pc,list_order_co)	
			SELECT arg_hotel_group_id,arg_hotel_id,arg_biz_date,'A',var_pccode,var_pccode_des,'A04','删除单数',arg_empid,arg_shift,COUNT(a.accnt),var_list_order_pc,4 FROM tmp_pos_master a,pos_pccode b 
			WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.pccode = var_pccode AND a.sta = 'X' AND b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND b.code = var_pccode;
		
		INSERT INTO pos_shift_tmp(hotel_group_id,hotel_id,biz_date,TYPE,pccode,pccode_des,CODE,code_des,cashier,shift,amount,list_order_pc,list_order_co)
			SELECT arg_hotel_group_id,arg_hotel_id,arg_biz_date,'A',var_pccode,var_pccode_des,'A05','就餐人数',arg_empid,arg_shift,IFNULL(SUM(gsts),0),var_list_order_pc,5 FROM tmp_pos_master 
			WHERE hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id AND pccode = var_pccode AND sta = 'O';
		
		INSERT INTO pos_shift_tmp(hotel_group_id,hotel_id,biz_date,TYPE,pccode,pccode_des,CODE,code_des,cashier,shift,amount,list_order_pc,list_order_co)
			SELECT arg_hotel_group_id,arg_hotel_id,arg_biz_date,'A',var_pccode,var_pccode_des,'A99','<<营收合计>>',arg_empid,arg_shift,IFNULL(SUM(credit),0),var_list_order_pc,6 FROM tmp_pos_master 
			WHERE hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id AND pccode = var_pccode AND sta = 'O';
		
		INSERT INTO pos_shift_tmp(hotel_group_id,hotel_id,biz_date,TYPE,pccode,pccode_des,CODE,code_des,cashier,shift,amount,list_order_pc,list_order_co)
			SELECT arg_hotel_group_id,arg_hotel_id,arg_biz_date,'B',var_pccode,var_pccode_des,b.tocode,c.descript,arg_empid,arg_shift,IFNULL(SUM(b.amount-b.dsc+b.srv+b.tax),0),var_list_order_pc,IFNULL(c.list_order,0)
			FROM tmp_pos_master a,tmp_pos_detail b,code_base c,tmp_pos_cashier d 
			WHERE a.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id AND c.hotel_id = arg_hotel_id AND c.hotel_group_id = arg_hotel_group_id 
			AND a.sta = 'O' AND a.pccode = var_pccode AND a.accnt = b.accnt AND b.sta = 'I' AND b.tocode = c.code AND c.parent_code = 'pos_rep_item' AND a.accnt = d.accnt 
			GROUP BY b.tocode
			ORDER BY b.tocode;
		INSERT INTO pos_shift_tmp(hotel_group_id,hotel_id,biz_date,TYPE,pccode,pccode_des,CODE,code_des,cashier,shift,amount,list_order_pc,list_order_co)
			SELECT arg_hotel_group_id,arg_hotel_id,arg_biz_date,'B',var_pccode,var_pccode_des,'099','未定义',arg_empid,arg_shift,IFNULL(SUM(b.amount-b.dsc+b.srv+b.tax),0),var_list_order_pc,99
			FROM tmp_pos_master a,tmp_pos_detail b,tmp_pos_cashier d 
			WHERE a.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id 
			AND a.sta = 'O' AND a.pccode = var_pccode AND a.accnt = b.accnt AND b.sta = 'I' AND IFNULL(b.tocode,'') NOT IN (SELECT CODE FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_rep_item') AND a.accnt = d.accnt 
			GROUP BY b.tocode
			ORDER BY b.tocode;
				
 		SELECT IFNULL(SUM(b.amount),0) INTO var_lintou FROM tmp_pos_master a,tmp_pos_detail b,tmp_pos_cashier c WHERE a.accnt = b.accnt AND a.accnt = c.accnt AND a.pccode = var_pccode AND b.sta <> 'X' AND tocode = '098';
			
		INSERT INTO pos_shift_tmp(hotel_group_id,hotel_id,biz_date,TYPE,pccode,pccode_des,CODE,code_des,cashier,shift,amount,list_order_pc,list_order_co)
			SELECT arg_hotel_group_id,arg_hotel_id,arg_biz_date,'B',var_pccode,var_pccode_des,'B99','<<消费合计>>',arg_empid,arg_shift,IFNULL(SUM(b.amount-b.dsc+b.srv+b.tax),0),var_list_order_pc,9999
			FROM tmp_pos_master a,tmp_pos_detail b,tmp_pos_cashier d
			WHERE a.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id 
			AND a.sta = 'O' AND a.pccode = var_pccode AND a.accnt = b.accnt AND b.sta = 'I' AND a.accnt = d.accnt;
		
		
		
		INSERT INTO pos_shift_tmp(hotel_group_id,hotel_id,biz_date,TYPE,pccode,pccode_des,CODE,code_des,cashier,shift,amount,list_order_pc,list_order_co)
			SELECT arg_hotel_group_id,arg_hotel_id,arg_biz_date,'C',var_pccode,var_pccode_des,b.paycode,c.descript,arg_empid,arg_shift,IFNULL(SUM(b.credit),0),var_list_order_pc,c.list_order
			FROM tmp_pos_master a,tmp_pos_account b,code_transaction c,tmp_pos_cashier d  
			WHERE a.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND a.accnt = b.accnt AND a.pccode = var_pccode AND a.sta = 'O' AND b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id 
			AND b.number = 2 AND b.paycode <> '' AND b.sta = 'O' AND b.paycode = c.code AND c.hotel_id = arg_hotel_id AND c.hotel_group_id = arg_hotel_group_id AND c.arrange_code > '9' AND a.accnt = d.accnt
			GROUP BY b.paycode
			ORDER BY c.list_order,b.paycode;
			
		INSERT INTO pos_shift_tmp(hotel_group_id,hotel_id,biz_date,TYPE,pccode,pccode_des,CODE,code_des,cashier,shift,amount,list_order_pc,list_order_co)
			SELECT arg_hotel_group_id,arg_hotel_id,arg_biz_date,'C',var_pccode,var_pccode_des,'C99','<<付款合计>>',arg_empid,arg_shift,IFNULL(SUM(b.credit),0),var_list_order_pc,9999
			FROM tmp_pos_master a,tmp_pos_account b,code_transaction c,tmp_pos_cashier d 
			WHERE a.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND a.accnt = b.accnt AND a.pccode = var_pccode AND a.sta = 'O' AND b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id  
			AND b.number = 2 AND b.paycode <> '' AND b.sta = 'O' AND b.paycode = c.code AND c.hotel_id = arg_hotel_id AND c.hotel_group_id = arg_hotel_group_id AND c.arrange_code > '9' AND a.accnt = d.accnt
			ORDER BY c.list_order,b.paycode;
						
	FETCH var_pccode_cus INTO var_pccode,var_pccode_des,var_list_order_pc; 
	END WHILE; 
	CLOSE var_pccode_cus;
	
	
 	INSERT INTO pos_shift_tmp(hotel_group_id,hotel_id,biz_date,TYPE,pccode,pccode_des,CODE,code_des,cashier,shift,amount,list_order_pc,list_order_co)
 		SELECT arg_hotel_group_id,arg_hotel_id,arg_biz_date,TYPE,'999','合计',CODE,code_des,arg_empid,arg_shift,SUM(amount),999,list_order_co FROM pos_shift_tmp GROUP BY TYPE,CODE,code_des,list_order_co;
	
	UPDATE pos_shift_tmp SET code_des = CONCAT(TYPE,10000+list_order_co,code_des),pccode_des = CONCAT(10000+list_order_pc,pccode_des);
	
	SELECT TYPE,pccode,pccode_des,CODE,code_des,amount FROM pos_shift_tmp ORDER BY pccode,TYPE,CODE;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
	DROP TEMPORARY TABLE IF EXISTS tmp_pos_cashier;
	DROP TABLE IF EXISTS pos_shift_tmp;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_shift_report_app1`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_shift_report_app1`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_shift_report_app1`(IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
  IN arg_biz_date		DATETIME,
 	IN arg_pccode  VARCHAR(100),
	IN arg_empid   VARCHAR(10),
	IN arg_shift CHAR(1),
  IN arg_reportNo CHAR(5))
    SQL SECURITY INVOKER
label_0:
BEGIN
	DECLARE var_bizdate DATETIME;
	DECLARE i INT DEFAULT 0;
	DECLARE j INT DEFAULT 0;
  DECLARE var_sql		VARCHAR(1024);
  DECLARE var_pccodes		VARCHAR(100);
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_master;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_account;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_detail;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_pccode;
      DROP TEMPORARY TABLE IF EXISTS tmp_code_base;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_shift;
        
                      
      CREATE TEMPORARY TABLE tmp_pos_master SELECT * FROM pos_master WHERE 1=2  ;
      CREATE TEMPORARY TABLE tmp_pos_account SELECT * FROM pos_account WHERE 1=2;
      CREATE TEMPORARY TABLE tmp_pos_detail SELECT * FROM pos_detail WHERE 1=2 ;
      CREATE TEMPORARY TABLE tmp_pos_pccode SELECT * FROM pos_pccode WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id ;
      CREATE TEMPORARY TABLE tmp_code_base SELECT * FROM  code_base  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND parent_code = 'pos_rep_item';
   
  -- INSERT gdsmsg(msg) SELECT CONCAT(ifnull(arg_biz_date,''),'/',IFNULL(arg_pccode,''),'/',IFNULL(arg_empid,''),'/',IFNULL(arg_shift,''));
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_shift;
      
	IF(IFNULL(arg_shift,'') = '') THEN
		SET arg_shift = '9';
	END IF;
	
	IF(IFNULL(arg_pccode,'') = '') THEN
		SET arg_pccode = 'all';
	END IF;
	
	IF (IFNULL(arg_empid,'') = '' OR arg_empid = 'all') THEN
		 SET arg_empid = '';
	  END IF;
      
      CREATE TEMPORARY TABLE tmp_pos_shift (
		  `hotel_group_id` BIGINT(16) NOT NULL,
		  `hotel_id` BIGINT(16) NOT NULL,
		  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
		  `biz_date` DATETIME NOT NULL COMMENT '营业日期',
		  `type` VARCHAR(1) NOT NULL DEFAULT '1',
		  `accnt` CHAR(20) NOT NULL DEFAULT '',
		  `userCode` VARCHAR(10) DEFAULT '' COMMENT '工号',
		  `shift` CHAR(12) NOT NULL DEFAULT '' COMMENT '班别',
		  `pccode` VARCHAR(10) NOT NULL DEFAULT '' COMMENT '营业点代码 ',
		  `name` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '营业点描叙 ',
		  `code` VARCHAR(10) DEFAULT '' COMMENT '类型',
		  `descript` VARCHAR(20) DEFAULT '' COMMENT '类型描叙',
		  `amount0`  VARCHAR(20) DEFAULT '' ,
		  `amount1` VARCHAR(20) DEFAULT '' ,  
		  `amount2` VARCHAR(20) DEFAULT '',
		  `amount3` VARCHAR(20) DEFAULT '',
		  `amount` VARCHAR(20) DEFAULT '',
      `pay` VARCHAR(20) DEFAULT '',
		  `ent_ft` VARCHAR(20) DEFAULT '',
		  `dsc_ft` VARCHAR(20) DEFAULT '',
		  PRIMARY KEY (`id`)
		  );
     SELECT set_value INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
     DROP TEMPORARY TABLE IF EXISTS tmp_pos_pccodes;
	   CREATE TEMPORARY TABLE tmp_pos_pccodes (
           `pccode` VARCHAR(10) DEFAULT ''         
	    );
	    
IF (LENGTH(arg_pccode) > 0 AND arg_pccode <> 'all') THEN
   SET var_pccodes = arg_pccode ;
   SELECT LENGTH(var_pccodes)-LENGTH(REPLACE(var_pccodes,',',''))+1 INTO i ;
   SET j = 0;
   WHILE j< i DO
      SET j=j+1;
        IF(LENGTH(REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_pccodes,',',j)),',',1)) )>0 ) THEN
        INSERT  tmp_pos_pccodes(pccode)
        SELECT REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_pccodes,',',j)),',',1));
        END IF;
      END WHILE ;
ELSE 
     INSERT  tmp_pos_pccodes(pccode) SELECT CODE FROM pos_pccode WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
END IF;   
      --  准备数据
      SELECT TO_DAYS(arg_biz_date)-TO_DAYS(var_bizdate) INTO i;
      IF i=0 THEN
         IF(arg_pccode = 'all') THEN
         INSERT INTO tmp_pos_master SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id ;-- AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_account SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;-- AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_detail SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;-- AND biz_date = arg_biz_date ;
         ELSE 
         INSERT INTO tmp_pos_master SELECT * FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND pccode IN (SELECT pccode FROM tmp_pos_pccodes);-- AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_account SELECT * FROM pos_account WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt IN (SELECT accnt FROM tmp_pos_master) ;-- AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_detail SELECT * FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND accnt IN (SELECT accnt FROM tmp_pos_master) ;-- AND biz_date = arg_biz_date ;
         END IF;
      
      ELSE
         IF(arg_pccode = 'all') THEN
         INSERT INTO tmp_pos_master SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_account SELECT * FROM pos_account_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_detail SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id   AND biz_date = arg_biz_date ;
         ELSE 
         INSERT INTO tmp_pos_master SELECT * FROM pos_master_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND pccode IN (SELECT pccode FROM tmp_pos_pccodes) AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_account SELECT * FROM pos_account_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt IN (SELECT accnt FROM tmp_pos_master)  AND biz_date = arg_biz_date ;
         INSERT INTO tmp_pos_detail SELECT * FROM pos_detail_history WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND accnt IN (SELECT accnt FROM tmp_pos_master) AND biz_date = arg_biz_date ;
         END IF;
      END IF ;
     
IF(arg_reportNo <> '820') THEN
    INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'A1','总开单',
    IFNULL(COUNT(e.accnt),0) ,
    0,
		IFNULL(SUM(e.credit),0),
		IFNULL(SUM(e.bal),0),
	  IFNULL(SUM(e.charge),0),0,0 
		FROM 
    tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND d.pccode = b.code AND d.number = 1
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
    INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'A2','   已结账',
		IFNULL(COUNT(e.accnt),0) ,
    0,
		IFNULL(SUM(e.credit),0),
		IFNULL(SUM(e.bal),0),
	  IFNULL(SUM(e.charge),0),0,0 
		FROM 
    tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND d.pccode = b.code  AND e.sta = 'O' AND d.number = 1
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
    
     
    INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'A3','   未结账',
		IFNULL(COUNT(e.accnt),0) ,
    0,
		IFNULL(SUM(e.credit),0),
		IFNULL(SUM(e.bal),0),
	  IFNULL(SUM(e.charge),0),0,0 
		FROM 
    tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND d.pccode = b.code  AND e.sta IN ('I','C')  AND  d.number = 1
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
  
    INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'A4','  挂账',
		IFNULL(COUNT(e.accnt),0) ,
    0,
		IFNULL(SUM(e.credit),0),
		IFNULL(SUM(e.bal),0),
	  IFNULL(SUM(e.charge),0),0,0 
		FROM 
    tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND d.pccode = b.code  AND e.sta='S'  AND  d.number = 1
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
    INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'A5','   删除',
		IFNULL(COUNT(e.accnt),0) ,
    0,
		IFNULL(SUM(e.credit),0),
		IFNULL(SUM(e.bal),0),
	  IFNULL(SUM(e.charge),0),0,0 
		FROM
    tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND d.pccode = b.code  AND e.sta = 'X' AND d.number = 1
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
    INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'0',e.modify_user,e.shift,b.code,b.descript,'B1','   就餐人数',
    IFNULL(SUM(e.gsts),0),0,0,0,
		IFNULL(ROUND(SUM(e.charge)/SUM(e.gsts),2),0),0,0  
		FROM
    tmp_pos_pccode b ,tmp_pos_account d,tmp_pos_master e 
    WHERE e.accnt = d.accnt AND d.pccode = b.code  AND e.sta <> 'X' AND e.sta <> 'S' AND d.number = 1
		GROUP BY e.modify_user,e.shift,b.code,b.descript ;
  
    INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',e.modify_user,e.shift,a.pccode,f.descript,b.code,CONCAT('   其中',b.descript,':'),
			IFNULL(SUM(d.amount),0),
			IFNULL(SUM(d.srv),0),
			IFNULL(SUM(d.tax),0),
			IFNULL(SUM(d.dsc),0),
			IFNULL(SUM(d.amount + d.srv + d.tax - d.dsc) ,0),
      IFNULL(SUM(d.amount1),0),
      IFNULL(SUM(d.amount2),0) 
			FROM 
      tmp_pos_account a,tmp_code_base b ,tmp_pos_detail d,tmp_pos_master e,tmp_pos_pccode f
			WHERE a.accnt = d.accnt  AND b.code = d.tocode 
          AND d.type = '1'  -- 表示都是菜品，否则是单菜的做法或者是退菜      
				  AND a.sta = 'O' AND d.sta = 'I' AND a.accnt = e.accnt AND e.sta = 'O' 
          AND a.pccode = f.code AND a.number = 1
			GROUP BY e.modify_user,e.shift,a.pccode,f.descript,b.code,b.descript 
      ORDER BY a.pccode,b.code ;
 
 /*   INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',e.modify_user,e.shift,e.pccode,f.descript,'098','零头',
			IFNULL(SUM(a.amount),0),
			0,
			0,
			0,
			IFNULL(SUM(a.amount),0),0,0  
			FROM 
      tmp_pos_detail a,tmp_pos_master e,tmp_pos_pccode f
			WHERE a.sta = 'I'  AND a.code = 'ML' AND a.accnt = e.accnt AND e.sta = 'O' AND e.pccode = f.code 
			GROUP BY e.modify_user,e.shift,e.pccode,f.descript 
      ORDER BY e.pccode ;
*/
    INSERT tmp_pos_shift(hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'1',e.modify_user,e.shift,a.pccode,f.descript,'099',CONCAT('   其中','<未定义>',':'),
			IFNULL(SUM(d.amount),0),
			IFNULL(SUM(d.srv),0),
			IFNULL(SUM(d.tax),0),
			IFNULL(SUM(d.dsc),0),
			IFNULL(SUM(d.amount + d.srv + d.tax - d.dsc) ,0),
      IFNULL(SUM(d.amount1),0),
      IFNULL(SUM(d.amount2),0) 
		 FROM 
     tmp_pos_account a,tmp_pos_detail d,tmp_pos_master e,tmp_pos_pccode f
		 WHERE a.accnt = d.accnt  AND d.tocode='' 
          AND d.type = '1' 
				  AND a.sta = 'O' AND d.sta = 'I' AND a.accnt = e.accnt AND e.sta = 'O' 
          AND a.pccode = f.code AND a.number = 1
		  	GROUP BY e.modify_user,e.shift,a.pccode,f.descript 
        ORDER BY a.pccode ;
 INSERT tmp_pos_shift  (hotel_group_id,hotel_id,biz_date,TYPE,userCode,shift,pccode,NAME,CODE,descript,amount0,amount1,amount2,amount3,amount,pay,ent_ft,dsc_ft  )
		SELECT arg_hotel_group_id, arg_hotel_id,arg_biz_date,'2',d.modify_user,d.shift,c.pccode,e.descript,c.paycode,c.descript,
		IFNULL(SUM(0),0),
		IFNULL(SUM(0),0),
		IFNULL(SUM(0),0),
		IFNULL(SUM(0),0),
    IFNULL(SUM(0),0),
		IFNULL(SUM(c.credit) ,0),0,0 
		 FROM
       tmp_pos_account c,tmp_pos_master d,tmp_pos_pccode e
			WHERE c.accnt = d.accnt AND d.sta = 'O'  
      AND c.sta = 'O' AND c.number = 2 -- a的营业点  c的付款方式
      AND c.pccode = e.code
		  GROUP BY d.modify_user,d.shift,c.pccode,e.descript,c.paycode,c.descript 
      ORDER BY c.pccode,c.paycode ;
/*
IF LENGTH(arg_shift)=0 THEN 
     DROP TEMPORARY TABLE IF EXISTS tmp_pos_shift2 ;
	 	 CREATE TEMPORARY TABLE tmp_pos_shift2 SELECT * FROM tmp_pos_shift WHERE 1=2  ;
	 	 INSERT INTO tmp_pos_shift2 SELECT * FROM  tmp_pos_shift WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date ;
SET var_sql = CONCAT("
insert tmp_pos_shift  (hotel_group_id,hotel_id,biz_date,type,userCode,shift,pccode,name,code,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		select hotel_group_id,hotel_id,biz_date,type,userCode,shift,'all','所有营业点',code,descript,
		IFNULL(sum(amount0),0),
		IFNULL(sum(amount1),0),
		IFNULL(sum(amount2),0),
		IFNULL(sum(amount3),0),
		IFNULL(sum(amount),0),IFNULL(sum(ent_ft),0),IFNULL(sum(dsc_ft),0) 
		from tmp_pos_shift2 where hotel_group_id = ",arg_hotel_group_id," AND hotel_id =  ",arg_hotel_id," and biz_date = '",arg_biz_date,"'  AND pccode <> 'all'  group by hotel_group_id,hotel_id,biz_date,type,userCode,shift,`code`,descript	;
");
    	SET @exec_sql = var_sql;  
   	 PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
SET var_sql = CONCAT("
insert tmp_pos_shift  (hotel_group_id,hotel_id,biz_date,type,userCode,shift,pccode,name,code,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		select hotel_group_id,hotel_id,biz_date,type,'{{{',shift,pccode,name,code,descript,
		IFNULL(sum(amount0),0),
		IFNULL(sum(amount1),0),
		IFNULL(sum(amount2),0),
		IFNULL(sum(amount3),0),
		IFNULL(sum(amount),0),IFNULL(sum(ent_ft),0),IFNULL(sum(dsc_ft),0) 
		from tmp_pos_shift2 where hotel_group_id = ",arg_hotel_group_id," AND hotel_id =  ",arg_hotel_id," and biz_date = '",arg_biz_date,"' AND userCode <> '{{{'  group by hotel_group_id,hotel_id,biz_date,type,shift,pccode,name,code,descript	;
");
    	SET @exec_sql = var_sql;  
   	 PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
SET var_sql = CONCAT("
insert tmp_pos_shift  (hotel_group_id,hotel_id,biz_date,type,userCode,shift,pccode,name,code,descript,amount0,amount1,amount2,amount3,amount,ent_ft,dsc_ft  )
		select hotel_group_id,hotel_id,biz_date,type,userCode,'9',pccode,name,code,descript,
		IFNULL(sum(amount0),0),
		IFNULL(sum(amount1),0),
		IFNULL(sum(amount2),0),
		IFNULL(sum(amount3),0),
		IFNULL(sum(amount),0),IFNULL(sum(ent_ft),0),IFNULL(sum(dsc_ft),0) 
		from tmp_pos_shift2 where  hotel_group_id = ",arg_hotel_group_id," AND hotel_id =  ",arg_hotel_id," and biz_date = '",arg_biz_date,"'  AND shift <> '9' group by hotel_group_id,hotel_id,biz_date,type,userCode,pccode,name,code,descript	;
");
    	SET @exec_sql = var_sql;  
   	 PREPARE stmt FROM @exec_sql;
    	EXECUTE stmt;
END IF ;
*/
  IF (arg_reportNo = '810') THEN
      -- 交班报表
      UPDATE tmp_pos_shift SET shift = '合计:' WHERE shift = '9';
		  SELECT NAME,shift,descript,amount0,amount,pay FROM tmp_pos_shift WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND pccode IN (SELECT pccode FROM tmp_pos_pccodes) AND (userCode = arg_empid OR arg_empid = '' ) AND (shift = arg_shift OR arg_shift = '9' ) ORDER BY pccode,shift,TYPE,CODE ;
     
  ELSEIF(arg_reportNo = '830') THEN
       -- 折扣款单表
      SELECT NAME,shift,descript,amount0,amount1,amount2,amount3,amount AS pay FROM tmp_pos_shift WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  AND pccode IN (SELECT pccode FROM tmp_pos_pccodes) AND (userCode = arg_empid OR arg_empid = '' ) AND (shift = arg_shift OR arg_shift = '9' ) AND TYPE = '1';
END IF;
ELSEIF(arg_reportNo = '820') THEN
   SELECT b.descript AS NAME,a.accnt,a.tableno,a.shift,a.modify_datetime,a.descript AS ta_descript,a.modify_user,a.billno,a.info1,a.credit AS pay FROM tmp_pos_account a 
   LEFT JOIN  tmp_pos_pccode b ON a.pccode=b.`code`
   WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id  AND  a.pccode IN (SELECT pccode FROM tmp_pos_pccodes)
    AND (a.modify_user = arg_empid OR  arg_empid = '') AND (a.shift = arg_shift OR arg_shift = '9') AND a.number = '2' AND a.sta IN ('I','O') ORDER BY a.paycode,a.modify_datetime ;
END IF ;
 DROP TEMPORARY TABLE IF EXISTS tmp_pos_shift;
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_split`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_split`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_split`(inputstring VARCHAR(512),
    delim CHAR(1))
label_0:
BEGIN
    DECLARE strlen INT DEFAULT LENGTH(inputstring);
    DECLARE last_index INT DEFAULT 0;
    DECLARE cur_index INT DEFAULT 1;
    DECLARE cur_char VARCHAR(200);
    DECLARE len INT;
    DROP TEMPORARY TABLE IF EXISTS tmp_pos_splittable;
    CREATE TEMPORARY TABLE tmp_pos_splittable(
        pos_value VARCHAR(20)
    ) ;
    WHILE(cur_index<=strlen) DO    
    BEGIN
        IF SUBSTRING(inputstring FROM cur_index FOR 1)=delim OR cur_index=strlen THEN
            SET len=cur_index-last_index-1;
            IF cur_index=strlen THEN
               SET len=len+1;
            END IF;
            INSERT INTO tmp_pos_splittable(`pos_value`)VALUES(SUBSTRING(inputstring FROM (last_index+1) FOR len));
            SET last_index=cur_index;
        END IF;
        SET cur_index=cur_index+1;
    END;
    END WHILE;
	BEGIN		
		LEAVE label_0;
	END; 
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_table_change`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_table_change`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_table_change`(IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
  IN arg_date		DATETIME,
  IN arg_accnt VARCHAR(20),
  IN arg_shift VARCHAR(3),
  IN arg_oldTable VARCHAR(10),
  IN arg_newTable VARCHAR(10),
  IN arg_flag			CHAR(1),
IN arg_user  VARCHAR(20),  OUT arg_msg  VARCHAR(100))
    SQL SECURITY INVOKER
label_0:
BEGIN
	DECLARE var_sta			CHAR(1);
	DECLARE var_box			CHAR(1);
	DECLARE var_timesta		CHAR(1);
	DECLARE var_showtimes	INT;
	DECLARE var_num			INT;
  DECLARE var_hotel_group_id			INT;
	DECLARE var_hotel_id			INT;
	DECLARE var_logdate			DATETIME;
  DECLARE var_pccode VARCHAR(10);
  DECLARE var_accnt CHAR(20);
  DECLARE var_exttable VARCHAR(200);
  
  DECLARE i INT DEFAULT 0;
  DECLARE j INT DEFAULT 0;
   DECLARE t_error INTEGER DEFAULT 0;  
    DECLARE done_cursor INT DEFAULT 0 ;
    DECLARE var_cursor CURSOR FOR SELECT hotel_group_id,hotel_id,exttableno  FROM tmp_pos_tableno WHERE LENGTH(exttableno) >0 AND sta = 'R' ;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1; 
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;  
  SET arg_msg =  CONCAT("-1,桌号:",arg_newTable,",换桌失败!") ; 
     DROP TEMPORARY TABLE IF EXISTS tmp_pos_tableno;
      CREATE TEMPORARY TABLE tmp_pos_tableno (
		  `hotel_group_id` BIGINT(16) NOT NULL,
		  `hotel_id` BIGINT(16) NOT NULL,
		  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
		  `exttableno` VARCHAR(100)  DEFAULT '',
		  `tableno` VARCHAR(10) DEFAULT '' ,
      `sta` VARCHAR(2) NOT NULL DEFAULT '' ,
		  PRIMARY KEY (`id`)
		  );
 START TRANSACTION;
INSERT tmp_pos_tableno (hotel_group_id,hotel_id,tableno,exttableno,sta)
	  SELECT a.hotel_group_id,a.hotel_id,a.tableno,a.exttableno,a.sta
    FROM pos_res a
    WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND  a.sta IN ('R','G')  AND (TO_DAYS(a.biz_date)-TO_DAYS(arg_date) = 0)  AND  a.shift = arg_shift;
   -- 预订单扩展桌号分解
   -- 预订选择了扩展桌号
   
  OPEN var_cursor;
     SET done_cursor = 0;
     FETCH var_cursor INTO var_hotel_group_id,var_hotel_id,var_exttable ;
     
     WHILE done_cursor<>1 DO 
         
     IF LENGTH(var_exttable) > 0 THEN
            SELECT LENGTH(var_exttable)-LENGTH(REPLACE(var_exttable,',',''))+1 INTO i ;
               SET j = 0;
             WHILE j< i DO
                SET j=j+1;
                   IF (LENGTH(REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_exttable,',',j)),',',1)))>0) THEN
                   INSERT tmp_pos_tableno (hotel_group_id,hotel_id,tableno,sta)
                   SELECT  var_hotel_group_id,var_hotel_id,REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_exttable,',',j)),',',1)),'R';  
                   END IF;  
              END WHILE ;
          END IF;
     FETCH var_cursor INTO var_hotel_group_id,var_hotel_id,var_exttable;
     END WHILE; 
     CLOSE var_cursor;
     DELETE FROM tmp_pos_tableno WHERE LENGTH(tableno) = 0 ;
INSERT tmp_pos_tableno(hotel_group_id,hotel_id,tableno,sta) 
SELECT  a.hotel_group_id,a.hotel_id,a.tableno,a.sta FROM pos_account a  WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.sta = 'I' AND  a.number = '1' ;
 
 
        SELECT COUNT(*) INTO var_num  FROM tmp_pos_tableno WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND tableno = arg_newTable ;
IF (var_num = 0) THEN
 -- 新桌可用，更新表记录
      UPDATE pos_account SET tableno = arg_newTable,info1 = CONCAT("原桌号:",arg_oldTable),modify_user = arg_user,modify_datetime = NOW()  WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND tableno = arg_oldTable ;
      UPDATE pos_order SET tableno = arg_newTable,remark = CONCAT("原桌号:",arg_oldTable),modify_user = arg_user,modify_datetime = NOW()  WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND tableno = arg_oldTable ;
      UPDATE pos_detail SET tableno = arg_newTable,modify_user = arg_user,modify_datetime = NOW()  WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND tableno = arg_oldTable ;
      SELECT COUNT(*) INTO i  FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND tableno = arg_oldTable ; 
      IF(i=0) THEN
            -- 换辅桌
            SELECT GROUP_CONCAT(a.tableno SEPARATOR ',') INTO var_exttable  
                     FROM pos_account a , pos_master b  
                      WHERE a.hotel_group_id = b.hotel_group_id AND a.hotel_id=b.hotel_id AND a.accnt = b.accnt AND a.tableno<>b.tableno AND
                            a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt  ; 
            UPDATE  pos_master  SET exttableno = var_exttable ,modify_user = arg_user,modify_datetime = NOW()  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt ; 
      ELSE
            -- 换主桌
            UPDATE  pos_master  SET tableno = arg_newTable ,modify_user = arg_user,modify_datetime = NOW()  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt ; 
      END IF; 
      SET arg_msg =  CONCAT("1,桌号:",arg_newTable,",换桌成功!") ;   
 
ELSE
     SET arg_msg =  CONCAT("-1,桌号:",arg_newTable,",已经被占用,换桌失败!") ;
END IF;
  IF t_error = 1 THEN  
           ROLLBACK;  
       ELSE  
           COMMIT; 
            
       END IF;  
	BEGIN
		SET @procresult = 0 ;
		LEAVE label_0 ;
	END ; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_table_map`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_table_map`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_table_map`(IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
	IN arg_date		DATETIME,
	IN arg_shift 		VARCHAR(1),
	IN arg_pccode 		VARCHAR(256),
	IN arg_status		CHAR(4),
	IN arg_type  		VARCHAR(20) , 
	IN arg_flag		CHAR(1))
    SQL SECURITY INVOKER
label_0:
BEGIN
    DECLARE time_diff INT DEFAULT 0;
    DECLARE var_accnt_pcrecs VARCHAR(1024) DEFAULT '';
	DECLARE t_error INTEGER DEFAULT 0;  
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;  
   -- 餐位图过程优化beta1.0 2016-08-11 改为临时表,不会存在pos_table_map锁表的问题了
  -- SELECT TIMESTAMPDIFF(SECOND,(SELECT IFNULL(MAX(logdate),'2016-08-01') FROM pos_table_map WHERE  hotel_group_id = arg_hotel_group_id AND  hotel_id = arg_hotel_id),NOW()) INTO time_diff ;
	-- IF (time_diff>5) THEN
 
	     -- DELETE FROM pos_table_map WHERE hotel_group_id = arg_hotel_group_id AND  hotel_id = arg_hotel_id ;
				DROP TEMPORARY TABLE IF EXISTS tmp_pos_table_map ;
				CREATE TABLE `tmp_pos_table_map` (
					`hotel_group_id` BIGINT(16) NOT NULL,
					`hotel_id` BIGINT(16) NOT NULL,
					`id` BIGINT(16) NOT NULL AUTO_INCREMENT,
					`type` VARCHAR(6) DEFAULT NULL COMMENT '桌号类别（ABCD）',
					`type_descript` VARCHAR(30) DEFAULT NULL,
					`pccode` VARCHAR(6) NOT NULL COMMENT '营业点',
					`pccode_descript` VARCHAR(30) DEFAULT NULL,
					`tableno` VARCHAR(30) NOT NULL COMMENT '桌号',
					`exttableno` VARCHAR(100) DEFAULT NULL,
					`accnt` VARCHAR(20) DEFAULT NULL,
					`inumber` INT(10) DEFAULT '1',
					`gsts` INT(10) DEFAULT '1',
					`sta` VARCHAR(10) NOT NULL COMMENT '桌号状态',
					`logdate` DATETIME DEFAULT NULL,
					`dishs` INT(10) DEFAULT '1',
					`checks` INT(10) DEFAULT '1',
					`pcrec` VARCHAR(20) DEFAULT NULL,
					`amount` DECIMAL(12,2) DEFAULT NULL COMMENT '消费金额',
					`empid` VARCHAR(10) DEFAULT NULL,
					`tblchk` VARCHAR(10) DEFAULT NULL,
					`base` VARCHAR(10) DEFAULT NULL,
					`selected` VARCHAR(10) DEFAULT NULL,
					`unitname` VARCHAR(60) DEFAULT NULL,
					`phone` VARCHAR(60) DEFAULT NULL,
					`shift` VARCHAR(10) DEFAULT NULL,
					`arrtime` VARCHAR(10) DEFAULT NULL,
					`tblname` VARCHAR(60) DEFAULT NULL,
          -- 支持横店集团 主单是否需要厨师长排菜功能
          `masterExtra` VARCHAR(60) DEFAULT NULL,
					PRIMARY KEY (`id`),
					KEY `hotel_group_id` (`hotel_group_id`,`hotel_id`,`tableno`,`type`,`pccode`)
				) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='台位图实时资源';
						-- 基础信息插入
				INSERT tmp_pos_table_map
							(hotel_group_id,hotel_id,TYPE,type_descript,pccode,pccode_descript,tableno,exttableno,accnt,inumber,gsts,sta,logdate,dishs,checks,pcrec,amount,empid,tblchk,base,selected,unitname,phone,shift,arrtime,tblname)
							SELECT a.hotel_group_id,a.hotel_id,a.type,c.descript,a.pccode,b.descript,a.code,'','',0,0,'0',NOW(),0,b.list_order,'',0,'','','','','','','','',a.descript 
							FROM  pos_pccode_table a LEFT JOIN pos_pccode b ON a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.pccode = b.code
																			 LEFT JOIN code_base c ON a.hotel_group_id = c.hotel_group_id AND a.hotel_id = c.hotel_id AND a.type = c.code AND c.parent_code = 'pos_table_type' 
							 WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.is_halt = 'F' ;
				-- 预订信息更新	
          DROP TEMPORARY TABLE IF EXISTS tmp_pos_res ;
          CREATE TEMPORARY TABLE tmp_pos_res SELECT * FROM pos_res b WHERE b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id 
									                                                    AND (b.sta = 'R' OR b.sta = 'G') AND (b.shift = arg_shift OR arg_shift = '')
                                                                      AND  b.biz_date>= arg_date AND b.biz_date<= arg_date ;
					UPDATE tmp_pos_table_map a, tmp_pos_res b SET a.accnt = b.accnt ,a.exttableno = b.exttableno,a.sta='1',a.gsts=b.gsts,a.logdate=NOW(),a.pcrec=b.accnt,a.empid=b.empid,a.base='R',a.unitname=b.res_name,a.phone=b.phone,
																								a.shift = b.shift,a.arrtime=b.arrtime
						WHERE  a.hotel_group_id=b.hotel_group_id AND a.hotel_id = b.hotel_id  AND a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id
									 AND  (TO_DAYS(b.biz_date)-TO_DAYS(arg_date) = 0 ) 
									 AND (b.sta = 'R' OR b.sta = 'G') AND (  b.shift = arg_shift OR arg_shift = '') 
								   AND INSTR(CONCAT(',',CONCAT(b.tableno,',',b.exttableno),','),CONCAT(',',a.tableno,',')) > 0  ;
       
         IF(arg_flag='0' OR arg_flag='1') THEN
				-- 已开单pos_account为准 信息插入 预订信息插叙
					UPDATE tmp_pos_table_map a,( SELECT b.hotel_group_id,b.hotel_id,b.accnt,c.gsts,c.pcrec,c.empid,c.phone,c.shift,b.biz_date,b.tableno,CASE LENGTH(c.extra) WHEN '10' THEN c.extra ELSE '0000000000' END  as extra 
                                       FROM pos_account b 
																	     LEFT JOIN  pos_master c  ON  b.hotel_group_id = c.hotel_group_id AND b.hotel_id = c.hotel_id AND b.accnt = c.accnt
																	     WHERE b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND b.number = '1' AND b.sta = 'I' AND IFNULL(c.type1,'') NOT IN ('WM','KC') AND IFNULL(c.type2,'') <>'FD')  d 
					  SET a.accnt = d.accnt ,a.sta='2',a.gsts=d.gsts,a.logdate=NOW(),a.pcrec=d.pcrec,a.empid=d.empid,a.base='I',a.phone=d.phone, a.shift = d.shift , a.masterExtra = d.extra
						WHERE  a.hotel_group_id = d.hotel_group_id AND a.hotel_id = d.hotel_id  AND a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id
									 AND  (TO_DAYS(d.biz_date)-TO_DAYS(arg_date) = 0 ) 
									 AND  (d.shift = arg_shift OR arg_shift = '')
									 AND  d.tableno = a.tableno ;
         	ELSE 
            -- 已开单pos_account为准 信息插入 台位资源查询
					UPDATE tmp_pos_table_map a,( SELECT b.hotel_group_id,b.hotel_id,b.accnt,c.gsts,c.pcrec,c.empid,c.phone,c.shift,b.biz_date,b.tableno,CASE LENGTH(c.extra) WHEN '10' THEN c.extra ELSE '0000000000' END  as extra 
                                       FROM pos_account b 
																	     LEFT JOIN  pos_master c  ON  b.hotel_group_id = c.hotel_group_id AND b.hotel_id = c.hotel_id AND b.accnt = c.accnt
																	     WHERE b.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND b.number = '1' AND b.sta = 'I'  AND IFNULL(c.type1,'') NOT IN ('WM','KC') ) d 
					  SET a.accnt = d.accnt ,a.sta='2',a.gsts=d.gsts,a.logdate=NOW(),a.pcrec=d.pcrec,a.empid=d.empid,a.base='I',a.phone=d.phone, a.shift = d.shift , a.masterExtra = d.extra
						WHERE  a.hotel_group_id = d.hotel_group_id AND a.hotel_id = d.hotel_id  AND a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id
									 AND  (TO_DAYS(d.biz_date)-TO_DAYS(arg_date) = 0 ) 
								    -- AND  (d.shift = arg_shift OR arg_shift = '')
									 AND  d.tableno = a.tableno ;
          END IF ;
        -- 插入分单信息
        INSERT tmp_pos_table_map (hotel_group_id,hotel_id,pccode,tableno,accnt,inumber,gsts,sta,logdate,dishs,checks,pcrec,amount,empid,tblchk,base,selected,unitname,phone,shift,arrtime,tblname,masterExtra)
				SELECT  arg_hotel_group_id,arg_hotel_id,a.pccode,a.tableno,a.accnt,'1',c.gsts,'2',a.biz_date,0,0,c.pcrec,0,a.empid,'','I','','','',a.shift,'',a.tableno,CASE LENGTH(c.extra) WHEN '10' THEN c.extra ELSE '0000000000' END  as extra 
				FROM pos_account a -- pos_pccode_table b,
				LEFT JOIN  pos_master c  ON  a.hotel_group_id = c.hotel_group_id AND a.hotel_id = c.hotel_id AND a.accnt = c.accnt
				WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.number = '1' AND IFNULL(c.type1,'') NOT IN ('WM','KC') AND IFNULL(c.type2,'') = 'FD'
								  -- AND INSTR(b.code,a.tableno) > 0 
								  -- AND (INSTR(CONCAT(',',arg_pccode,','),CONCAT(',',a.pccode,',')) > 0 OR arg_pccode = 'all')
							      -- (a.pccode IN ( SELECT pos_value FROM tmp_pos_splittable ) OR arg_pccode = 'all') 
								  AND a.sta = 'I' 
								  AND (TO_DAYS(a.biz_date)-TO_DAYS(arg_date) = 0 );
             -- 已确认下单菜品
						 UPDATE tmp_pos_table_map a, ( SELECT accnt FROM pos_detail WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta = 'I' GROUP BY accnt ) b 
                   SET a.base = '2',a.logdate=NOW() 
                   WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.sta = '2' AND a.accnt = b.accnt ;
             -- 预点菜还有未下单的菜品
						 UPDATE tmp_pos_table_map a, ( SELECT accnt FROM pos_order WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta = 'I' GROUP BY accnt ) b 
                   SET a.base = '1',a.logdate=NOW() 
                   WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.sta = '2' AND a.accnt = b.accnt ;
            -- 更新联单信息
            SELECT GROUP_CONCAT(pcrec) INTO  var_accnt_pcrecs FROM tmp_pos_table_map  WHERE hotel_group_id = arg_hotel_group_id AND  hotel_id = arg_hotel_id AND sta = '2' GROUP BY pcrec HAVING COUNT(pcrec)>1 ;
            UPDATE tmp_pos_table_map  SET tblchk = '0',logdate=NOW() WHERE  hotel_group_id = arg_hotel_group_id AND  hotel_id = arg_hotel_id AND sta = '2' AND (INSTR(var_accnt_pcrecs,accnt)>0 OR accnt <> pcrec );
            -- 更新主单进入点菜或者结账界面时提醒
             UPDATE tmp_pos_table_map a, ( SELECT accnt FROM pos_selected_object WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id GROUP BY accnt ) b 
                   SET a.masterExtra = CONCAT(SUBSTR(a.masterExtra,1,1),'1',SUBSTR(a.masterExtra,3,8))  
                   WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.sta = '2' AND a.accnt = b.accnt ;
	-- END IF ;
	
	IF(arg_flag='0') THEN
		SELECT hotel_group_id,hotel_id,type_descript,pccode_descript,tableno,tblname,sta,CASE sta
			    WHEN '0' THEN '空闲'
			    WHEN '1' THEN '预订'
			    WHEN '2' THEN '开台'
			    WHEN '3' THEN '点单'
			    ELSE '已上菜' END  AS staDesc
		 FROM tmp_pos_table_map WHERE  INSTR(CONCAT(',',arg_pccode,','),CONCAT(',',pccode,',')) > 0 /* sta = '0' AND (arg_type='all' OR TYPE=arg_type )*/ ORDER BY pccode,tableno;
	ELSEIF(arg_flag='1') THEN
		SELECT hotel_group_id,hotel_id,type_descript,pccode_descript,tableno,tblname,sta,CASE sta
			    WHEN '0' THEN '空闲'
			    WHEN '1' THEN '预订'
			    WHEN '2' THEN '开台'
			    WHEN '3' THEN '点单'
			    ELSE '已上菜' END  AS staDesc
		FROM tmp_pos_table_map  WHERE  INSTR(CONCAT(',',arg_pccode,','),CONCAT(',',pccode,',')) > 0 ORDER BY pccode,sta,tableno;-- WHERE (arg_type='all' OR TYPE=arg_type ) ORDER BY pccode,sta,tableno;
 
	ELSEIF(arg_flag='2') THEN
		SELECT hotel_group_id,hotel_id,pccode,pccode_descript,TYPE,type_descript,tableno,tblname,sta,CASE sta
			    WHEN '0' THEN '空闲'
			    WHEN '1' THEN '预订'
			    WHEN '2' THEN '开台'
			    WHEN '3' THEN '点单'
			    ELSE '已上菜' END  AS staDesc,accnt,masterExtra,pcrec,tblchk,base 
			   FROM tmp_pos_table_map  WHERE (arg_type='all' OR TYPE=arg_type ) AND (INSTR(CONCAT(',',arg_pccode,','),CONCAT(',',pccode,',')) > 0 OR arg_pccode = 'all')
			   -- AND pccode IN ( SELECT pos_value FROM tmp_pos_splittable ) 
			   ORDER BY pccode,tableno;
	ELSEIF(arg_flag='3') THEN
    -- app2 开台界面 扩展 桌号使用，结果集不允许修改  请注意！
		SELECT type_descript,tableno,tblname,sta  FROM tmp_pos_table_map  WHERE pccode = arg_pccode  AND  sta = '0' ORDER BY tableno;
	ELSEIF(arg_flag='4') THEN
    -- app2 开台界面 联单使用，结果集不允许修改  请注意！
		SELECT tableno,tblname,accnt,IFNULL(pcrec,'')  FROM tmp_pos_table_map  WHERE -- pccode = arg_pccode  AND  AND accnt<> arg_type
                                                                 sta = '2' ORDER BY tableno;
	ELSE 
		   SELECT  *  FROM tmp_pos_table_map ;
	END IF;
         DROP TABLE tmp_pos_res ;
         DROP TABLE tmp_pos_table_map ;
	BEGIN
		SET @procresult = 0 ;
		LEAVE label_0 ;
	END ; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_table_map_bak`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_table_map_bak`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_table_map_bak`(
    IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
    IN arg_date		DATETIME,
    IN arg_shift VARCHAR(1),
    IN arg_pccode VARCHAR(256),
	IN arg_status		CHAR(4),
    IN arg_type  VARCHAR(20) , 
	IN arg_flag			CHAR(1))
    SQL SECURITY INVOKER
label_0:
BEGIN
    DECLARE var_sql		VARCHAR(1024);
	DECLARE var_sta			CHAR(1);
	DECLARE var_box			CHAR(1);
	DECLARE var_timesta		CHAR(1);
	DECLARE var_showtimes	INT;
	DECLARE var_num			INT;
    DECLARE var_hotel_group_id			INT;
	DECLARE var_hotel_id			INT;
	DECLARE var_logdate			DATETIME;
    DECLARE var_pccode VARCHAR(10);
    DECLARE var_accnt CHAR(13);
    DECLARE var_exttable VARCHAR(200);
    DECLARE i INT DEFAULT 0;
    DECLARE j INT DEFAULT 0;
    DECLARE t_error INTEGER DEFAULT 0;  
    DECLARE done_cursor INT DEFAULT 0 ;
    DECLARE var_cursor CURSOR FOR SELECT hotel_group_id,hotel_id,pccode,exttableno,accnt,sta,logdate FROM pos_table_map WHERE LENGTH(exttableno) >0 AND base = 'R' ;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1; 
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;  
  CALL up_pos_split(arg_pccode,',');
  SELECT COUNT(*) INTO var_num FROM pos_table_map WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = var_hotel_id  AND (pccode IN ( SELECT pos_value FROM tmp_pos_splittable ) OR arg_pccode = 'all') ;
 IF (var_num = 0) THEN
 
  START TRANSACTION;
INSERT pos_table_map 
(hotel_group_id,hotel_id,pccode,tableno,exttableno,accnt,inumber,gsts,sta,logdate,dishs,checks,pcrec,amount,empid,tblchk,base,selected,unitname,phone,shift,arrtime,tblname)
	  SELECT arg_hotel_group_id,arg_hotel_id,a.pccode,a.tableno,a.exttableno,a.accnt,'1',a.gsts,'1',a.biz_date,0,0,a.accnt,0,a.empid,'','R','',a.res_name,a.phone,a.shift,a.arrtime,''
    FROM pos_res a
    WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id
		AND (a.pccode IN ( SELECT pos_value FROM tmp_pos_splittable ) OR arg_pccode = 'all') AND a.sta IN ('R','G') 
		AND (TO_DAYS(a.biz_date)-TO_DAYS(arg_date) = 0 )
	  AND (  a.shift = arg_shift OR arg_shift = '');
   -- 预订单扩展桌号分解
   -- 预订选择了扩展桌号
    OPEN var_cursor;
     SET done_cursor = 0;
     FETCH var_cursor INTO var_hotel_group_id,var_hotel_id,var_pccode,var_exttable,var_accnt,var_sta,var_logdate;
     
     WHILE done_cursor<>1 DO 
         
     IF LENGTH(var_exttable) > 0 THEN
            SELECT LENGTH(var_exttable)-LENGTH(REPLACE(var_exttable,',',''))+1 INTO i ;
               SET j = 0;
             WHILE j< i DO
                SET j=j+1;
                   IF (LENGTH(REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_exttable,',',j)),',',1)))>0) THEN
                   INSERT pos_table_map (hotel_group_id,hotel_id,pccode,tableno,accnt,inumber,sta,base,logdate)
                   SELECT  var_hotel_group_id,var_hotel_id,var_pccode,REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_exttable,',',j)),',',1)),var_accnt,'2',var_sta,'E',var_logdate;  
                   END IF;  
              END WHILE ;
          END IF;
     FETCH var_cursor INTO var_hotel_group_id,var_hotel_id,var_pccode,var_exttable,var_accnt,var_sta,var_logdate;
     END WHILE; 
     CLOSE var_cursor;
     DELETE FROM pos_table_map WHERE LENGTH(tableno) = 0 ;
IF(arg_flag='0' OR arg_flag='1') THEN
 -- 预订查询台位资源
INSERT pos_table_map (hotel_group_id,hotel_id,pccode,tableno,accnt,inumber,gsts,sta,logdate,dishs,checks,pcrec,amount,empid,tblchk,base,selected,unitname,phone,shift,arrtime,tblname)
             SELECT  arg_hotel_group_id,arg_hotel_id,a.pccode,a.tableno,a.accnt,'1',c.gsts,'2',a.biz_date,0,0,c.pcrec,0,a.empid,'','I','','','',a.shift,'',''
            FROM pos_account a -- pos_pccode_table b,
            LEFT JOIN  pos_master c  ON  a.hotel_group_id = c.hotel_group_id AND a.hotel_id = c.hotel_id AND a.accnt = c.accnt
            WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.number = '1' 
					 -- AND INSTR(b.code,a.tableno) > 0 
						AND (a.pccode IN ( SELECT pos_value FROM tmp_pos_splittable ) OR arg_pccode = 'all') AND a.sta = 'I' 
					  AND (TO_DAYS(a.biz_date)-TO_DAYS(arg_date) = 0 )
					  AND (  a.shift = arg_shift OR arg_shift = '');
ELSE 
INSERT pos_table_map (hotel_group_id,hotel_id,pccode,tableno,accnt,inumber,gsts,sta,logdate,dishs,checks,pcrec,amount,empid,tblchk,base,selected,unitname,phone,shift,arrtime,tblname)
             SELECT  arg_hotel_group_id,arg_hotel_id,a.pccode,a.tableno,a.accnt,'1',c.gsts,'2',a.biz_date,0,0,c.pcrec,0,a.empid,'','I','','','',a.shift,'',''
            FROM pos_account a -- pos_pccode_table b,
            LEFT JOIN  pos_master c  ON  a.hotel_group_id = c.hotel_group_id AND a.hotel_id = c.hotel_id AND a.accnt = c.accnt
            WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.number = '1' 
						AND (a.pccode IN ( SELECT pos_value FROM tmp_pos_splittable ) OR arg_pccode = 'all') AND a.sta = 'I' 
					  -- AND (TO_DAYS(a.biz_date)-TO_DAYS(arg_date) = 0 )
					  -- and (  a.shift = arg_shift or arg_shift = '')
            ;
END IF;
INSERT pos_table_map
(hotel_group_id,hotel_id,pccode,tableno,accnt,inumber,gsts,sta,logdate,dishs,checks,pcrec,amount,empid,tblchk,base,selected,unitname,phone,shift,arrtime,tblname)
	SELECT arg_hotel_group_id,arg_hotel_id,pccode,CODE,'',0,0,'0',NULL,NULL,NULL,NULL,0,'','','','','','',arg_shift,'','' 
  FROM pos_pccode_table WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND (pccode IN ( SELECT pos_value FROM tmp_pos_splittable ) OR arg_pccode  = 'all') AND CODE NOT IN (SELECT tableno FROM pos_table_map) ;
  UPDATE pos_table_map SET base = '2' WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta = '2' AND EXISTS(SELECT 1 FROM pos_detail WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = pos_table_map.accnt AND sta = 'I') ;
  UPDATE pos_table_map SET base = '1' WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta = '2' AND EXISTS(SELECT 1 FROM pos_order WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = pos_table_map.accnt AND sta = 'I') ;
                           --  AND NOT EXISTS(SELECT 1 FROM pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND  accnt = pos_table_map.accnt AND inumber = pos_table_map.inumber AND sta = 'I' AND SUBSTRING(flag1,28,1) <> 'T') ;
                                 -- WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id ;
                                 -- WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id ;
UPDATE pos_table_map a, (SELECT CODE,descript,TYPE,list_order FROM pos_pccode_table WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id ) b,
      (SELECT CODE,descript FROM pos_pccode WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id ) c,
      (SELECT CODE,descript FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_table_type') d
                                  SET a.pccode_descript = c.descript , a.tblname = b.descript ,a.type= d.code ,a.type_descript = d.descript,a.checks = b.list_order 
                                  WHERE a.tableno = b.code AND b.type = d.code AND a.pccode = c.code  
                                  AND a.hotel_group_id=arg_hotel_group_id AND a.hotel_id=arg_hotel_id ;
UPDATE pos_table_map SET tblchk = '0' WHERE sta = '2' AND  pcrec <> '' AND accnt <> pcrec;
UPDATE pos_table_map a, (SELECT pcrec  FROM pos_table_map WHERE sta = '2' GROUP BY pcrec HAVING COUNT(pcrec)>1) b 
SET a.tblchk = '0' WHERE a.sta = '2' AND  a.accnt = a.pcrec  AND a.pcrec = b.pcrec ;
        IF t_error = 1 THEN  
           ROLLBACK;  
         
       ELSE  
           COMMIT; 
           
       END IF;  
END IF ;
IF(arg_flag='0') THEN
SELECT hotel_group_id,hotel_id,type_descript,pccode_descript,tableno,tblname,sta,CASE sta
            WHEN '0' THEN '空闲'
            WHEN '1' THEN '预订'
            WHEN '2' THEN '开台'
            WHEN '3' THEN '点单'
            ELSE '已上菜' END  AS staDesc
 FROM pos_table_map  WHERE sta = '0' ORDER BY pccode,tableno;
ELSEIF(arg_flag='1') THEN
SELECT hotel_group_id,hotel_id,type_descript,pccode_descript,tableno,tblname,sta,CASE sta
            WHEN '0' THEN '空闲'
            WHEN '1' THEN '预订'
            WHEN '2' THEN '开台'
            WHEN '3' THEN '点单'
            ELSE '已上菜' END  AS staDesc
 FROM pos_table_map  ORDER BY pccode,sta,tableno;
 -- 修改checks 排序 来源pos_pccode_table 的listorder @pwt 2015-12-23
 ELSEIF(arg_flag='2') THEN
SELECT hotel_group_id,hotel_id,pccode,pccode_descript,TYPE,type_descript,tableno,tblname,sta,CASE sta
            WHEN '0' THEN '空闲'
            WHEN '1' THEN '预订'
            WHEN '2' THEN '开台'
            WHEN '3' THEN '点单'
            ELSE '已上菜' END  AS staDesc,accnt,arrtime,pcrec,tblchk,base
           FROM pos_table_map  WHERE (arg_type='all' OR TYPE=arg_type ) AND pccode IN ( SELECT pos_value FROM tmp_pos_splittable ) ORDER BY pccode,checks,tableno;
 ELSEIF(arg_flag='3') THEN
    -- app2 开台界面 扩展 桌号使用，结果集不允许修改  请注意！
   SELECT type_descript,tableno,tblname,sta  FROM pos_table_map  WHERE pccode = arg_pccode  AND  sta = '0' ORDER BY tableno;
 ELSEIF(arg_flag='4') THEN
    -- app2 开台界面 联单使用，结果集不允许修改  请注意！
   SELECT tableno,tblname,accnt,IFNULL(pcrec,'')  FROM pos_table_map  WHERE -- pccode = arg_pccode  AND  AND accnt<> arg_type
                                                                 sta = '2' ORDER BY tableno;
ELSE 
SELECT * FROM pos_table_map ;
END IF;
     -- DELETE  FROM   pos_table_map WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id  ;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_splittable; 
	    TRUNCATE TABLE pos_table_map ;
	BEGIN
		SET @procresult = 0 ;
		LEAVE label_0 ;
	END ; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_table_map_interface`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_table_map_interface`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_table_map_interface`(IN arg_hotel_group_id	BIGINT(16),	
	  IN arg_hotel_id		BIGINT(16),
    IN arg_date		DATETIME,
    IN arg_shift VARCHAR(1),
    IN arg_pccode VARCHAR(256),
	  IN arg_status		CHAR(4),
    IN arg_type  VARCHAR(20) , 
	  IN arg_flag			CHAR(1))
    SQL SECURITY INVOKER
label_0:
BEGIN
    DECLARE var_sql		VARCHAR(1024);
	  DECLARE var_sta			CHAR(1);
	  DECLARE var_box			CHAR(1);
	  DECLARE var_timesta		CHAR(1);
	  DECLARE var_showtimes	INT;
	  DECLARE var_num			INT;
    DECLARE var_hotel_group_id			INT;
	  DECLARE var_hotel_id			INT;
	  DECLARE var_logdate			DATETIME;
    DECLARE var_pccode VARCHAR(10);
    DECLARE var_accnt CHAR(20);
    DECLARE var_exttable VARCHAR(200);
    DECLARE i INT DEFAULT 0;
    DECLARE j INT DEFAULT 0;
    DECLARE t_error INTEGER DEFAULT 0;  
    DECLARE done_cursor INT DEFAULT 0 ;
    DECLARE var_cursor CURSOR FOR SELECT hotel_group_id,hotel_id,pccode,exttableno,accnt,sta,logdate FROM tmp_pos_table_map WHERE LENGTH(exttableno) >0 AND base = 'R' ;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1; 
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;  
DROP TEMPORARY TABLE IF EXISTS tmp_pos_table_map;
CREATE TEMPORARY TABLE `tmp_pos_table_map` (
  `hotel_group_id` BIGINT(16) NOT NULL,
  `hotel_id` BIGINT(16) NOT NULL,
  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(6) DEFAULT NULL COMMENT '桌号类别（ABCD）',
  `type_descript` VARCHAR(30) DEFAULT NULL,
  `pccode` VARCHAR(6) NOT NULL COMMENT '营业点',
  `pccode_descript` VARCHAR(30) DEFAULT NULL,
  `tableno` VARCHAR(30) NOT NULL COMMENT '桌号',
  `exttableno` VARCHAR(100) DEFAULT NULL,
  `accnt` CHAR(20) DEFAULT NULL COMMENT '单号',
  `inumber` INT(10) DEFAULT '1',
  `gsts` INT(10) DEFAULT '1',
  `sta` VARCHAR(1) NOT NULL COMMENT '桌号状态',
  `logdate` DATETIME DEFAULT NULL,
  `dishs` INT(10) DEFAULT '1',
  `checks` INT(10) DEFAULT '1',
  `pcrec` CHAR(13) DEFAULT NULL COMMENT '联单号',
  `amount` DECIMAL(12,2) DEFAULT NULL COMMENT '消费金额',
  `empid` VARCHAR(10) DEFAULT NULL,
  `tblchk` VARCHAR(1) DEFAULT NULL,
  `base` VARCHAR(1) DEFAULT NULL,
  `selected` VARCHAR(1) DEFAULT NULL,
  `unitname` VARCHAR(60) DEFAULT NULL,
  `phone` VARCHAR(60) DEFAULT NULL,
  `shift` VARCHAR(1) DEFAULT NULL,
  `arrtime` VARCHAR(10) DEFAULT NULL,
  `tblname` VARCHAR(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
DROP TEMPORARY TABLE IF EXISTS tmp_pos_table_map2;
CREATE TEMPORARY TABLE `tmp_pos_table_map2` (
  `hotel_group_id` BIGINT(16) NOT NULL,
  `hotel_id` BIGINT(16) NOT NULL,
  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(6) DEFAULT NULL COMMENT '桌号类别（ABCD）',
  `type_descript` VARCHAR(30) DEFAULT NULL,
  `pccode` VARCHAR(6) NOT NULL COMMENT '营业点',
  `pccode_descript` VARCHAR(30) DEFAULT NULL,
  `tableno` VARCHAR(30) NOT NULL COMMENT '桌号',
  `exttableno` VARCHAR(100) DEFAULT NULL,
  `accnt` CHAR(20) DEFAULT NULL COMMENT '单号',
  `inumber` INT(10) DEFAULT '1',
  `gsts` INT(10) DEFAULT '1',
  `sta` VARCHAR(1) NOT NULL COMMENT '桌号状态',
  `logdate` DATETIME DEFAULT NULL,
  `dishs` INT(10) DEFAULT '1',
  `checks` INT(10) DEFAULT '1',
  `pcrec` CHAR(13) DEFAULT NULL COMMENT '联单号',
  `amount` DECIMAL(12,2) DEFAULT NULL COMMENT '消费金额',
  `empid` VARCHAR(10) DEFAULT NULL,
  `tblchk` VARCHAR(1) DEFAULT NULL,
  `base` VARCHAR(1) DEFAULT NULL,
  `selected` VARCHAR(1) DEFAULT NULL,
  `unitname` VARCHAR(60) DEFAULT NULL,
  `phone` VARCHAR(60) DEFAULT NULL,
  `shift` VARCHAR(1) DEFAULT NULL,
  `arrtime` VARCHAR(10) DEFAULT NULL,
  `tblname` VARCHAR(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
  CALL up_pos_split(arg_pccode,',');
  START TRANSACTION;
  INSERT tmp_pos_table_map 
  (hotel_group_id,hotel_id,pccode,tableno,exttableno,accnt,inumber,gsts,sta,logdate,dishs,checks,pcrec,amount,empid,tblchk,base,selected,unitname,phone,shift,arrtime,tblname)
	  SELECT arg_hotel_group_id,arg_hotel_id,a.pccode,a.tableno,a.exttableno,a.accnt,'1',a.gsts,'1',a.biz_date,0,0,a.accnt,0,a.empid,'','R','',a.res_name,a.phone,a.shift,a.arrtime,''
    FROM pos_res a
    WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id
		AND (a.pccode IN ( SELECT pos_value FROM tmp_pos_splittable ) OR arg_pccode = 'all') AND a.sta IN ('R','G') 
		AND (TO_DAYS(a.biz_date)-TO_DAYS(arg_date) = 0 )
	  AND (  a.shift = arg_shift OR arg_shift = '');
   -- 预订单扩展桌号分解
   -- 预订选择了扩展桌号
     OPEN var_cursor;
     SET done_cursor = 0;
     FETCH var_cursor INTO var_hotel_group_id,var_hotel_id,var_pccode,var_exttable,var_accnt,var_sta,var_logdate;
     
     WHILE done_cursor<>1 DO 
         
     IF LENGTH(var_exttable) > 0 THEN
            SELECT LENGTH(var_exttable)-LENGTH(REPLACE(var_exttable,',',''))+1 INTO i ;
               SET j = 0;
             WHILE j< i DO
                SET j=j+1;
                   IF (LENGTH(REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_exttable,',',j)),',',1)))>0) THEN
                   INSERT tmp_pos_table_map (hotel_group_id,hotel_id,pccode,tableno,accnt,inumber,sta,base,logdate)
                   SELECT  var_hotel_group_id,var_hotel_id,var_pccode,REVERSE(SUBSTRING_INDEX(REVERSE(SUBSTRING_INDEX(var_exttable,',',j)),',',1)),var_accnt,'2',var_sta,'E',var_logdate;  
                   END IF;  
              END WHILE ;
          END IF;
     FETCH var_cursor INTO var_hotel_group_id,var_hotel_id,var_pccode,var_exttable,var_accnt,var_sta,var_logdate;
     END WHILE; 
     CLOSE var_cursor;
     DELETE FROM tmp_pos_table_map WHERE LENGTH(tableno) = 0 ;
INSERT tmp_pos_table_map (hotel_group_id,hotel_id,pccode,tableno,accnt,inumber,gsts,sta,logdate,dishs,checks,pcrec,amount,empid,tblchk,base,selected,unitname,phone,shift,arrtime,tblname)
            SELECT  arg_hotel_group_id,arg_hotel_id,a.pccode,a.tableno,a.accnt,'1',c.gsts,'2',a.biz_date,0,0,c.pcrec,0,a.empid,'','I','','','',a.shift,'',''
            FROM pos_account a -- pos_pccode_table b,
            LEFT JOIN  pos_master c  ON  a.hotel_group_id = c.hotel_group_id AND a.hotel_id = c.hotel_id AND a.accnt = c.accnt
            WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.number = '1' 
					 -- AND INSTR(b.code,a.tableno) > 0 
						AND (a.pccode IN ( SELECT pos_value FROM tmp_pos_splittable ) OR arg_pccode = 'all') AND a.sta = 'I' 
					  AND (TO_DAYS(a.biz_date)-TO_DAYS(arg_date) = 0 )
					  AND (  a.shift = arg_shift OR arg_shift = '');
INSERT tmp_pos_table_map2(hotel_group_id,hotel_id,pccode,pccode_descript,TYPE,type_descript,tableno,tblname,sta)
	    SELECT arg_hotel_group_id,arg_hotel_id,c.`CODE`,c.descript,d.`CODE`,d.descript,b.`code`,b.descript,'0'  
      FROM 
      (SELECT CODE,descript,pccode,TYPE FROM  pos_pccode_table WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id )b,
      (SELECT CODE,descript FROM pos_pccode WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id ) c,
      (SELECT CODE,descript FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_table_type') d
      WHERE  b.type = d.code AND b.pccode = c.code  ;
        IF t_error = 1 THEN  
           ROLLBACK;  
         
       ELSE  
           COMMIT; 
           
       END IF;  
IF (arg_flag='2') THEN 
SELECT hotel_group_id,hotel_id,pccode,pccode_descript,TYPE,type_descript,tableno,tblname,sta,CASE sta
            WHEN '0' THEN '空闲'
            WHEN '1' THEN '预订'
            WHEN '2' THEN '开台'
            WHEN '3' THEN '点单'
            ELSE '已上菜' END  AS staDesc,accnt,arrtime,pcrec,tblchk,base
            FROM tmp_pos_table_map2  WHERE sta = '0' AND (arg_type='all' OR TYPE=arg_type ) AND pccode IN ( SELECT pos_value FROM tmp_pos_splittable )
            AND  tableno NOT IN (SELECT tableno FROM tmp_pos_table_map WHERE sta<>'0' )
            ORDER BY pccode,checks,tableno;
ELSE 
       SELECT * FROM tmp_pos_table_map ;
END IF;
      DROP TEMPORARY TABLE IF EXISTS tmp_pos_splittable; 
	    DROP TEMPORARY TABLE tmp_pos_table_map ;
	BEGIN
		SET @procresult = 0 ;
		LEAVE label_0 ;
	END ; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `up_pos_table_map_wm`
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_table_map_wm`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_table_map_wm`(
    IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
    IN arg_date		DATETIME,
    IN arg_shift VARCHAR(1),
    IN arg_pccode VARCHAR(256),
	IN arg_status		CHAR(4),
    IN arg_type  VARCHAR(20) , 
	IN arg_flag			CHAR(10))
    SQL SECURITY INVOKER
label_0:
BEGIN
      DECLARE var_sql		VARCHAR(1024);
	  DECLARE var_sta			CHAR(1);
	  DECLARE var_box			CHAR(1);
	  DECLARE var_timesta		CHAR(1);
	  DECLARE var_showtimes	INT;
	  DECLARE var_num			INT;
      DECLARE var_hotel_group_id			INT;
	  DECLARE var_hotel_id			INT;
	  DECLARE var_logdate			DATETIME;
    DECLARE var_pccode VARCHAR(10);
    DECLARE var_accnt CHAR(20);
    DECLARE var_exttable VARCHAR(200);
    DECLARE i INT DEFAULT 0;
    DECLARE j INT DEFAULT 0;
    DECLARE t_error INTEGER DEFAULT 0;  
   
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;  
    DROP TEMPORARY TABLE IF EXISTS tmp_pos_table_map_wm;
CREATE TEMPORARY TABLE `tmp_pos_table_map_wm` (
  `hotel_group_id` BIGINT(16) NOT NULL,
  `hotel_id` BIGINT(16) NOT NULL,
  `id` BIGINT(16) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(6) DEFAULT NULL COMMENT '桌号类别（ABCD）',
  `type_descript` VARCHAR(30) DEFAULT NULL,
  `pccode` VARCHAR(6) NOT NULL COMMENT '营业点',
  `pccode_descript` VARCHAR(30) DEFAULT NULL,
  `tableno` VARCHAR(30) NOT NULL COMMENT '桌号',
  `exttableno` VARCHAR(100) DEFAULT NULL,
  `accnt` CHAR(20) DEFAULT NULL COMMENT '单号',
  `inumber` INT(10) DEFAULT '1',
  `gsts` INT(10) DEFAULT '1',
  `sta` VARCHAR(1) NOT NULL COMMENT '桌号状态',
  `logdate` DATETIME DEFAULT NULL,
  `dishs` INT(10) DEFAULT '1',
  `checks` INT(10) DEFAULT '1',
  `pcrec` CHAR(13) DEFAULT NULL COMMENT '联单号',
  `amount` DECIMAL(12,2) DEFAULT '0' COMMENT '消费金额',
  `empid` VARCHAR(10) DEFAULT NULL,
  `tblchk` VARCHAR(1) DEFAULT NULL,
  `base` VARCHAR(1) DEFAULT NULL,
  `selected` VARCHAR(1) DEFAULT NULL,
  `unitname` VARCHAR(60) DEFAULT NULL,
  `phone` VARCHAR(60) DEFAULT NULL,
  `shift` VARCHAR(1) DEFAULT NULL,
  `arrtime` DATETIME NOT NULL,
  `tblname` VARCHAR(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
  START TRANSACTION;
INSERT tmp_pos_table_map_wm 
(hotel_group_id,hotel_id,pccode,tableno,accnt,inumber,gsts,sta,logdate,dishs,checks,pcrec,amount,empid,tblchk,base,selected,unitname,phone,shift,arrtime,tblname)
            SELECT  arg_hotel_group_id,arg_hotel_id,a.pccode,a.tableno,a.accnt,'1',c.gsts,c.sta,a.biz_date,0,0,c.pcrec,0,a.empid,'','I','','','',a.shift,c.create_datetime,c.type1
            FROM pos_account a
            LEFT JOIN  pos_master c  ON  a.hotel_group_id = c.hotel_group_id AND a.hotel_id = c.hotel_id AND a.accnt = c.accnt
            WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id  AND a.number = '1'   AND c.sta IN ('I','C') AND c.type1  IN ('WM','KC');
    UPDATE tmp_pos_table_map_wm SET sta = '2' WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta = 'I' ;
    UPDATE tmp_pos_table_map_wm SET sta = '3' WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta = 'C' ;
	  UPDATE tmp_pos_table_map_wm SET base = '2' WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta = '2' AND EXISTS(SELECT 1 FROM pos_detail WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = tmp_pos_table_map_wm.accnt AND sta = 'I') ;
		UPDATE tmp_pos_table_map_wm SET base = '1' WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta = '2' AND EXISTS(SELECT 1 FROM pos_order WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = tmp_pos_table_map_wm.accnt AND sta = 'I') ;
    UPDATE tmp_pos_table_map_wm a , 
    (SELECT hotel_group_id,hotel_id,accnt,IFNULL(SUM(amount),0) AS amount 
    FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta='I'  GROUP BY hotel_group_id,hotel_id,accnt ) b 
    SET a.amount = b.amount 
    WHERE  a.hotel_group_id =  b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt ;
        IF t_error = 1 THEN  
           ROLLBACK;  
         
       ELSE  
           COMMIT; 
           
       END IF;  
IF (arg_flag='WM') THEN 
SELECT hotel_group_id,hotel_id,pccode,pccode_descript,TYPE,type_descript,tableno,CASE tblname
			    WHEN 'WM' THEN  CONCAT('商场-',tableno) 
			    WHEN 'KC' THEN  CONCAT('快餐-',tableno) 
			    ELSE tblname 
          END  AS tblname1,sta,amount,accnt,arrtime,pcrec,TIMESTAMPDIFF(MINUTE,arrtime,NOW()) AS wmtm ,base
FROM tmp_pos_table_map_wm    WHERE (arg_pccode = 'all'  OR  pccode = arg_pccode )  ORDER BY tableno;
ELSE 
       SELECT * FROM tmp_pos_table_map_wm ;
END IF;
	    DROP TEMPORARY TABLE tmp_pos_table_map_wm ;
	BEGIN
		SET @procresult = 0 ;
		LEAVE label_0 ;
	END ; 
	
END
;;
DELIMITER ;

-- ----------------------------
--  Records  点菜宝接口账务计算过程
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_tp_detail_mode_calc`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_tp_detail_mode_calc`(IN arg_hotel_group_id	INT,
	IN arg_hotel_id			INT,
    IN arg_biz_date			DATETIME,
    IN arg_accnt			VARCHAR(20),
    IN arg_user  VARCHAR(20),
    IN  arg_ret				INT)
    SQL SECURITY INVOKER
label_0:
BEGIN
  	
   DECLARE var_bizdate DATETIME ;
   DECLARE var_billno VARCHAR(20) ;
   DECLARE var_apportion DECIMAL(12,2);
   DECLARE var_apportion_ce DECIMAL(12,2);
   DECLARE var_ml_amount DECIMAL(12,2);
   DECLARE var_ml INT DEFAULT 0;
   DECLARE var_credit DECIMAL(12,2);
   DECLARE var_sta VARCHAR(10) ;
   DECLARE var_pccode VARCHAR(10) ;
   DECLARE var_shift VARCHAR(10) ;
   DECLARE var_table VARCHAR(10) ;
   DECLARE var_amount DECIMAL(12,2)  DEFAULT 0;
   DECLARE var_mode VARCHAR(10) ;
   DECLARE var_dsc DECIMAL(12,2) DEFAULT 0;
   DECLARE var_srv DECIMAL(12,2) DEFAULT 0;
   DECLARE var_tax DECIMAL(12,2) DEFAULT 0;
   DECLARE i INT DEFAULT 0;
   DECLARE j INT DEFAULT 0;
   DECLARE detail_id BIGINT ;
   DECLARE t_error INTEGER DEFAULT 0;  
   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;
	SET @procresult = 0 ;
	
	SET arg_ret = -1 ;
      SELECT sta INTO var_sta FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt ;

   IF var_sta='I' OR var_sta = 'C' THEN 
 
      SELECT pccode,MODE,dsc,srv,tax  INTO var_pccode,var_mode,var_dsc,var_srv,var_tax FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt ;
 
     DELETE FROM  pos_detail WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND CODE = 'ML';
     UPDATE pos_detail  SET   dsc = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,var_mode,var_pccode,sort_code,CODE,amount,var_dsc,'1'),0),
																							 srv = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,var_mode,var_pccode,sort_code,CODE,amount,var_srv,'2'),0), 
																							 tax = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,var_mode,var_pccode,sort_code,CODE,amount,var_tax,'3'),0),
																						   modify_datetime = NOW()  
     WHERE 
     hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND TYPE ='1' AND  sta='I' AND amount<>0 AND SUBSTRING(flag1,1,1)<>'1' AND SUBSTRING(flag1,5,1)<>'1' AND  SUBSTRING(flag1,6,1)<>'1' ; 
     
     UPDATE pos_detail  SET  srv = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,var_mode,var_pccode,sort_code,CODE,amount,var_srv,'2'),0), 
																							 tax = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,var_mode,var_pccode,sort_code,CODE,amount,var_tax,'3'),0),
																							 modify_datetime = NOW() 
     WHERE
     hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND TYPE ='1' AND  sta='I' AND amount<>0 AND SUBSTRING(flag1,1,1)<>'1' AND SUBSTRING(flag1,5,1)<>'1' AND  SUBSTRING(flag1,6,1)<>'1' ; 
     
    
    
    
    
    SELECT b.dec_length ,a.shift,a.tableno INTO var_ml,var_shift,var_table  FROM pos_master a LEFT JOIN pos_pccode b ON a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.pccode = b.code 
                                                                            WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt ;
    
    SELECT  ROUND(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax),0)-(SUM(amount)-SUM(dsc)+SUM(srv)+SUM(tax)) INTO var_ml_amount
                            FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND  sta='I' ;
    IF(var_ml_amount <> '0.00') THEN
    INSERT INTO pos_detail (`hotel_group_id`, `hotel_id`, `accnt`,  `type`,  `sta`, `shift`,`biz_date`, `note_code`, `sort_code`, `code`, `tocode`, `descript`, `descript_en`, `unit`, `number`, 
                             `price`, `amount`, `tableno`, `flag`, `create_user`, `create_datetime`, `modify_user`, `modify_datetime`) 
    VALUES(arg_hotel_group_id,arg_hotel_id,arg_accnt,'1','I',var_shift,arg_biz_date,'SYS','SYS','ML','098','抹零','Maling','份','1',var_ml_amount,var_ml_amount,var_table,'000000000000000000000000000000','ADMIN',NOW(),'ADMIN',NOW());
   
    END IF;
      SELECT IFNULL(SUM(amount),0) AS amount ,IFNULL(SUM(dsc),0) AS dsc ,IFNULL(SUM(srv),0) AS srv ,IFNULL(SUM(tax),0) AS tax  
      INTO var_amount,var_dsc,var_srv,var_tax
      FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta='I' AND accnt = arg_accnt GROUP BY hotel_group_id,hotel_id,accnt;
      
     UPDATE pos_master a
     SET a.amount = var_amount, a.dscamount = var_dsc,a.srvamount = var_srv ,a.taxamount = var_tax ,a.charge = var_amount+var_srv+var_tax-var_dsc
     WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt;
      
     UPDATE pos_account a  SET a.amount  = 0  WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt AND a.number = '1' ;
    
     UPDATE pos_account a ,( SELECT hotel_group_id,hotel_id,accnt,tableno,SUM(amount) AS amount
                            FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND biz_date = arg_biz_date AND sta='I'  AND accnt = arg_accnt GROUP BY hotel_group_id,hotel_id,accnt,tableno )  b  
     SET a.amount = b.amount 
     WHERE a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id AND a.accnt = b.accnt AND a.tableno=b.tableno 
           AND a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.biz_date = arg_biz_date AND a.accnt = arg_accnt AND a.number = '1';
    
 
     SELECT IFNULL(SUM(credit),0) INTO var_credit  FROM  pos_account  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND sta = 'I'  AND number = '2' ;
     UPDATE pos_master a  
   
     SET a.credit =  var_credit 
   
      WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt;
     
     SET arg_ret = 0 ;
   ELSE IF var_sta = 'S' THEN
    
     SELECT pccode INTO var_pccode FROM pos_master WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt ;
    
     UPDATE pos_detail  SET   dsc = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,var_mode,var_pccode,sort_code,CODE,amount,var_dsc,'1'),0),
																							 srv = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,var_mode,var_pccode,sort_code,CODE,amount,var_srv,'2'),0), 
																							 tax = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,var_mode,var_pccode,sort_code,CODE,amount,var_tax,'3'),0),
																						   modify_datetime = NOW()  
     WHERE 
     hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND TYPE ='1' AND  sta='I' AND amount<>0 AND SUBSTRING(flag1,1,1)<>'1' AND SUBSTRING(flag1,5,1)<>'1' AND  SUBSTRING(flag1,6,1)<>'1' ;  
     
     UPDATE pos_detail  SET  srv = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,var_mode,var_pccode,sort_code,CODE,amount,var_srv,'2'),0), 
																							 tax = IFNULL(get_pos_mode_amount(arg_hotel_group_id,arg_hotel_id,var_mode,var_pccode,sort_code,CODE,amount,var_tax,'3'),0),
																							 modify_datetime = NOW() 
     WHERE
     hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt  AND TYPE ='1' AND  sta='I' AND amount<>0 AND SUBSTRING(flag1,1,1)<>'1' AND SUBSTRING(flag1,5,1)<>'1' AND  SUBSTRING(flag1,6,1)<>'1' ;   
     
     SELECT IFNULL(SUM(amount),0) AS amount ,IFNULL(SUM(dsc),0) AS dsc ,IFNULL(SUM(srv),0) AS srv ,IFNULL(SUM(tax),0) AS tax  
      INTO var_amount,var_dsc,var_srv,var_tax
      FROM  pos_detail WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND sta='I' AND accnt = arg_accnt GROUP BY hotel_group_id,hotel_id,accnt;
      
     UPDATE pos_master a
     SET a.amount = var_amount, a.dscamount = var_dsc,a.srvamount = var_srv ,a.taxamount = var_tax ,a.charge = var_amount+var_srv+var_tax-var_dsc
     WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt;
      
     UPDATE pos_account a  SET a.amount  = 0  WHERE  a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt AND a.number = '1' ;
     
     SELECT IFNULL(SUM(credit),0) INTO var_credit  FROM  pos_account  WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND sta = 'S'  AND number = '2' ;
     UPDATE pos_master a  
     SET a.credit =  var_credit
     WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt;
     
     SET arg_ret = 0 ;
     END IF; 
  END IF;
	BEGIN
		SELECT arg_ret,'OK!' ;
		SET @procresult = 0 ;
		LEAVE label_0 ;
	END ; 
	
END
;;
DELIMITER ;
-- ----------------------------
--  Records 点菜宝接口开台过程
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_tp_create_new_posmaster`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_tp_create_new_posmaster`(IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),
    IN arg_pccode		VARCHAR(10), 
    IN arg_user  VARCHAR(20),
    IN arg_tableNo		VARCHAR(10),
    IN arg_gsts		VARCHAR(10),
	IN arg_shift		VARCHAR(10),	
	IN arg_empid VARCHAR(20),	
	IN arg_pcid		VARCHAR(10),	
    IN arg_split CHAR(2),
    IN arg_info  VARCHAR(50),
    IN  arg_msg		VARCHAR(100))
    SQL SECURITY INVOKER
label_0:
BEGIN
	
	DECLARE var_id CHAR(20);
	DECLARE var_accnt CHAR(20) DEFAULT '-1';
	DECLARE var_date DATETIME;
	DECLARE var_syspccode CHAR(5);
	DECLARE var_name CHAR(30);
	DECLARE var_maxinum INTEGER;
	DECLARE var_count INTEGER;
	DECLARE var_dsc DECIMAL(12,2);
	DECLARE var_srv DECIMAL(12,2);
	DECLARE var_tax DECIMAL(12,2);
	DECLARE var_class CHAR(10);
	DECLARE var_menutype VARCHAR(10);
	DECLARE var_ename VARCHAR(50);
	DECLARE var_deptplchk	VARCHAR(10);
	DECLARE var_flag	VARCHAR(70);
	DECLARE var_empid1	VARCHAR(10) ;
	DECLARE var_market		VARCHAR(10);
	DECLARE var_source		VARCHAR(10);
	DECLARE var_type1		VARCHAR(10);
	DECLARE var_type2		VARCHAR(10);
	DECLARE var_type3		VARCHAR(10);
	DECLARE var_type4		VARCHAR(10);
	DECLARE var_spli_table VARCHAR(200);
	DECLARE var_table		VARCHAR(20);
	DECLARE var_exp1		VARCHAR(10);
	DECLARE var_exp2		DECIMAL(12,2);
	DECLARE flag INT DEFAULT 0;
	DECLARE i INT DEFAULT 0;
	DECLARE j INT DEFAULT 0;
	DECLARE var_mode		VARCHAR(10);
	DECLARE t_error INTEGER DEFAULT 0;  
    
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;  
  
   SET t_error = 1;
   SET  arg_msg = "-1,开台失败" ;  
   
 
   SELECT descript,descript_en,menu_type,IFNULL(dec_mode,"") INTO var_name,var_ename,var_menutype,var_mode FROM pos_pccode WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_pccode;
   SELECT dsc_rate,serve_rate,tax_rate,exp1,exp2 INTO var_dsc,var_srv,var_tax,var_exp1,var_exp2 FROM pos_pccode WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_pccode;
   SELECT set_value INTO var_date  FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date' ;
  -- set var_mode = '001';
   IF var_mode = "" THEN
   	 SELECT CODE INTO var_mode  FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_desc_mode' ORDER BY CODE  LIMIT 1 ;
   END IF;	 
   SELECT CODE INTO var_market  FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_market' ORDER BY CODE  LIMIT 1 ;
   SELECT CODE INTO var_source  FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_source' ORDER BY CODE  LIMIT 1 ;
   SELECT CODE INTO var_type1  FROM code_base WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND parent_code = 'pos_menu_type1' ORDER BY CODE  LIMIT 1 ;

  IF arg_split = 'S' THEN
       
         SELECT COUNT(1) INTO var_count FROM pos_pccode_table WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND CODE = arg_tableNo AND pccode = arg_pccode ;
         IF var_count = 0 THEN 
            SET arg_msg = CONCAT("-1,",arg_tableNo,"桌号不存在!");
             SET t_error = 1;
            SET flag = -1 ;
         END IF;
       
         SELECT COUNT(1) INTO var_count FROM pos_account WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND tableno = arg_tableNo AND pccode = arg_pccode AND sta='I' ; 
         IF var_count > 0 THEN 
            SET arg_msg = CONCAT("-1,",arg_tableNo,"桌号已被占用!");
             SET t_error = 1;
            SET flag = -1 ;
         END IF;
 
   END IF;

IF flag = 0 THEN
       
      
        CALL  up_pos_tp_produce_extra_id(arg_hotel_group_id,arg_hotel_id,'POSMASTER',@a);
                    SET var_id = @a ;
                    IF(LENGTH(var_id)>16)THEN 
                    SET t_error = 1;
                    END IF;
        
        SET var_id = CONCAT('0000',var_id);

        SET var_accnt = CONCAT('P',arg_pccode,SUBSTR(DATE_FORMAT(var_date, '%Y%m%d'),3,6),RIGHT(var_id,4)) ;
               INSERT pos_master (hotel_group_id,hotel_id,accnt,type1,pccode,MODE,shift,empid,sta,biz_date,tableno,exttableno,gsts,market,
                         source,dsc,srv,tax,info,create_user,create_datetime,modify_user,modify_datetime) 
               VALUES     (arg_hotel_group_id,arg_hotel_id,var_accnt,var_type1,arg_pccode,var_mode,arg_shift,arg_empid,'I',var_date,arg_tableNo,'',arg_gsts,var_market,
                          var_source,var_dsc,var_srv,var_tax,arg_info,arg_user,NOW(),arg_user,NOW());
     
              INSERT pos_account (hotel_group_id,hotel_id,accnt,number,inumber,pccode,tableno,shift,empid,sta,biz_date,logdate,amount,
                             create_user,create_datetime,modify_user,modify_datetime) 
              VALUES     (arg_hotel_group_id,arg_hotel_id,var_accnt,'1','1',arg_pccode,arg_tableNo,arg_shift,arg_empid,'I',var_date,NOW(),0,
                             arg_user,NOW(),arg_user,NOW());
	      SET t_error = 0;

    INSERT pos_accnt_sync  (hotel_group_id,hotel_id,entity_name,accnt,res_accnt,TYPE,is_sync,is_halt,create_user,create_datetime,modify_user,modify_datetime)
    VALUES (arg_hotel_group_id,arg_hotel_id,'com.greencloud.entity.PosMaster',var_accnt,'','ADD','F','F','ADMIN',NOW(),'ADMIN',NOW());

        IF t_error = 1 THEN   
              SET  arg_msg = "-1,开台失败了!" ;  
       ELSE              
              SET  arg_msg = CONCAT(var_accnt,",桌号:",arg_tableNo,",开台成功!") ; 
              SET t_error =0;
       END IF;  
    END IF ; 
	  SELECT t_error,arg_msg,var_accnt,1;
	BEGIN
		LEAVE label_0 ;
	END ; 
	
 
	
END
;;
DELIMITER ;
-- ----------------------------
--  Records 点菜宝接口 开单过程调用的当前单号规则流水
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_tp_produce_extra_id`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_tp_produce_extra_id`(
	IN arg_hotel_group_id	BIGINT(16),	
	IN arg_hotel_id		BIGINT(16),	
	IN arg_code		VARCHAR(30),	
	OUT arg_msg		VARCHAR(60)	
)
    SQL SECURITY INVOKER
label_0:
BEGIN

	
	DECLARE var_rsv_no_create_mode 		VARCHAR(2);	
	DECLARE var_pos_cur			BIGINT(16);	
	DECLARE var_pos_max			BIGINT(16);	
	
	DECLARE var_count			INTEGER;
	
	SET var_rsv_no_create_mode = '0',var_count = 0,arg_msg = '';
	
	
	
	
	SELECT COUNT(1) INTO var_count FROM hotel WHERE hotel_group_id=arg_hotel_group_id AND id = arg_hotel_id; 	
	IF arg_hotel_id > 0 AND var_count = 0 THEN 
		SET arg_msg = 'Group Hotel id or Hotel id Error !';
		SELECT arg_msg; 
		LEAVE label_0;
	END IF; 
	
	
	
	
	SELECT a.pos_cur,a.pos_max INTO var_pos_cur,var_pos_max FROM sys_extra_id AS a 
	WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id 
		AND a.code = arg_code FOR UPDATE;
	
	
	IF var_pos_cur IS NULL OR var_pos_max IS NULL  THEN 
		SET arg_msg =  CONCAT('Sys Extra Id Error ! Code Is ',arg_code,' Not Find !');
		SELECT arg_msg; 
		LEAVE label_0;
	END IF;
	
	
	IF var_pos_cur >= var_pos_max THEN
		UPDATE sys_extra_id AS a SET a.pos_cur = a.pos_begin,a.modify_datetime 	= NOW()
		WHERE a.hotel_group_id = arg_hotel_group_id 
			AND a.hotel_id = arg_hotel_id
			AND a.code = arg_code;
	ELSE
		UPDATE sys_extra_id AS a SET a.pos_cur = a.pos_cur + a.pos_interval,a.modify_datetime 	= NOW()
		WHERE a.hotel_group_id = arg_hotel_group_id 
			AND a.hotel_id = arg_hotel_id
			AND a.code = arg_code;
	END IF;
	
	
	
	SET arg_msg = var_pos_cur;
	
	-- SELECT arg_msg; 
	
	BEGIN		
		LEAVE label_0;
	END; 
	
END
;;
DELIMITER ;
-- ----------------------------
--  Records 点菜宝接口预点菜品下单
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_tp_order_to_detail`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_tp_order_to_detail`(IN arg_hotel_group_id	BIGINT(16),	
  IN arg_hotel_id		BIGINT(16),
  IN arg_accnt VARCHAR(20),	
  IN arg_tableno  VARCHAR(10),	
  IN arg_shift		VARCHAR(10),	
  IN arg_pcid		VARCHAR(10),
  IN arg_user VARCHAR(20),	
  IN arg_msg		VARCHAR(60))
    SQL SECURITY INVOKER
label_0:
BEGIN 
	    declare var_ret int;
        DECLARE var_dsc DECIMAL(12,2) DEFAULT 0;
        DECLARE var_srv DECIMAL(12,2) DEFAULT 0;
        DECLARE var_tax DECIMAL(12,2) DEFAULT 0;
	    DECLARE var_count INT DEFAULT 0;
        DECLARE var_count2 INT DEFAULT 0;
        DECLARE var_maxTnumber INT DEFAULT 0;
        DECLARE var_bizdate DATETIME;
        DECLARE var_id			INT;
        DECLARE done_cursor INT DEFAULT 0 ;
       
	DECLARE var_cursor CURSOR FOR SELECT id FROM pos_detail a WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND a.accnt = arg_accnt  AND a.kitchen = 'T'; 
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_cursor = 1; 
--	insert into a(msg) select concat(ifnull(arg_accnt,''),'/',ifnull(arg_tableno,''),'/',ifnull(arg_shift,''),'/',ifnull(arg_pcid,''));
	SET var_ret =0;
        SELECT set_value INTO var_bizdate FROM sys_option WHERE hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND catalog = 'system' AND item = 'pos_biz_date';
            SELECT COUNT(1)  INTO var_count  FROM pos_account WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND tableno = arg_tableno AND accnt = arg_accnt AND sta='I' ; 
          
            SELECT COUNT(1)  INTO var_count2 FROM pos_order a INNER JOIN pos_detail b    ON a.hotel_group_id = b.hotel_group_id AND a.hotel_id = b.hotel_id 
			and a.accnt = b.accnt AND a.tableno = b.tableno and a.orderno = b.orderno   and a.orderno >0
			 WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND  a.accnt = arg_accnt AND a.tableno = arg_tableno AND LENGTH(a.orderno)>0 ; 
					 IF var_count < 1 THEN
 
							    SET var_ret= -1,arg_msg = '-1,未存在指定有效的账号和桌号';
				 
					 ELSEIF var_count2 > 0 THEN 
							    SET var_ret= -1,arg_msg = '-1,该order单已经下过单';
					 ELSE 
					 IF EXISTS (SELECT 1 FROM pos_order a WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND  a.accnt = arg_accnt AND a.tableno = arg_tableno  ) THEN
                     		           SELECT IFNULL(MAX(tnumber),0)  INTO  var_maxTnumber FROM pos_detail a WHERE a.hotel_group_id = arg_hotel_group_id AND a.hotel_id = arg_hotel_id AND  a.accnt = arg_accnt; -- AND a.tableno = arg_tableno ORDER BY tnumber DESC LIMIT 1 ;
				
				INSERT pos_detail (hotel_group_id,hotel_id,pcid,accnt,inumber,tnumber,anumber,mnumber,TYPE,
					billno,orderno,sta,shift,empid,biz_date,note_code,sort_code,CODE,tocode,cond_code,cook,printid,descript,descript_en,unit,number,pinumber,price,amount,
					amount1,amount2,amount3,amount4,amount5,cost,flag,flag1,reason,tableno,siteno,info,empid1,kitchen,
					create_user,create_datetime,modify_user,modify_datetime) 
					SELECT  hotel_group_id,hotel_id,arg_pcid,arg_accnt,IF(inumber=0,inumber,inumber+var_maxTnumber),tnumber+var_maxTnumber,anumber,mnumber,TYPE,
					'',orderno,sta,arg_shift,arg_user,var_bizdate,note_code,sort_code,plu_code,tocode,cond_code,cook,0,descript,descript_en,unit,number,pinumber,price,amount,
					'0','0', '0','0','0','0',flag,flag1,'',tableno,siteno,remark,arg_user,'T',
					arg_user,NOW(),arg_user,NOW()
				     FROM pos_order WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND sta = 'I'  AND tableno = arg_tableno ;
					
					   DELETE   FROM pos_order WHERE  hotel_group_id = arg_hotel_group_id AND hotel_id = arg_hotel_id AND accnt = arg_accnt AND sta = 'I'  AND tableno = arg_tableno ;
			           END IF ; 
					  
					  
					OPEN var_cursor;
					SET done_cursor = 0;
					FETCH var_cursor INTO var_id;    
					 WHILE done_cursor<>1 DO         
					-- CALL  up_pos_kitchen_input_dishcard(arg_hotel_group_id,arg_hotel_id,arg_accnt,var_id,'1','7783',@ret,@msg);
		 			CALL   up_pos_kitchen_input_dishcard_wdt(arg_hotel_group_id,arg_hotel_id,arg_accnt,var_id,'1',arg_pcid,@ret,@msg);							 
					FETCH var_cursor INTO var_id;
					 END WHILE; 
					 CLOSE var_cursor;
                         UPDATE pos_detail SET kitchen = '' WHERE hotel_group_id = arg_hotel_group_id AND  hotel_id = arg_hotel_id AND accnt = arg_accnt AND kitchen = 'T'; 
		      END IF;
       
		SELECT var_ret,arg_msg ;
	 
	
END
;;
DELIMITER ;
-- ----------------------------
--  Records 点菜宝接口 厨打过程
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_pos_kitchen_input_dishcard_wdt`;
DELIMITER ;;
CREATE  PROCEDURE `up_pos_kitchen_input_dishcard_wdt`(IN 	arg_hotel_group_id	BIGINT(16),	
	IN 	arg_hotel_id		BIGINT(16),
	IN 	arg_accnt		VARCHAR(20),
	IN 	arg_id			BIGINT(16),
	IN 	arg_type		CHAR(1),
	IN 	arg_station		varchar(4),
	OUT 	arg_ret			INT,
	OUT 	arg_msg			VARCHAR(60))
    SQL SECURITY INVOKER
BEGIN
	DECLARE 	var_tag			CHAR(1);
	DECLARE 	var_printer1 		VARCHAR(10);
	DECLARE 	var_printer2		VARCHAR(10);
	DECLARE 	var_printer3 		VARCHAR(10);
	DECLARE 	var_printer4 		VARCHAR(10);
	DECLARE 	var_printer5 		VARCHAR(10);
	DECLARE 	var_printer1_tbl 	VARCHAR(10);
	DECLARE 	var_printer2_tbl	VARCHAR(10);
	DECLARE 	var_printer3_tbl	VARCHAR(10);
	DECLARE 	var_printer4_tbl	VARCHAR(10);
	DECLARE 	var_printer5_tbl	VARCHAR(10);
	DECLARE		var_tableno		VARCHAR(10);
	DECLARE		var_tableno_desc	VARCHAR(10);
	DECLARE		var_pccode		VARCHAR(10);
	DECLARE		var_pccode_desc		VARCHAR(50);
	DECLARE		var_printers		VARCHAR(40);
	DECLARE		var_printer		VARCHAR(10);
	DECLARE		var_plucode		VARCHAR(20);
	DECLARE		var_flag11		CHAR(1);
	DECLARE		var_flag12		CHAR(1);
	DECLARE		var_flag13		CHAR(1);
	DECLARE 	var_flag14		CHAR(1);
	DECLARE	 	var_flag15		CHAR(1);
	DECLARE 	var_flag16		CHAR(1);
	DECLARE		var_flag17		CHAR(1);
	DECLARE 	var_flag18		CHAR(1);
	DECLARE		var_i			INT;
	DECLARE		var_descript		VARCHAR(50);
	DECLARE 	var_sort		VARCHAR(10);
	DECLARE 	var_code		VARCHAR(20);
	DECLARE 	var_station_code	VARCHAR(20);
	DECLARE t_error INTEGER DEFAULT 0;  
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1; 
label:BEGIN
	
	SET arg_ret = 1,arg_msg = '成功!';
	set var_station_code = right(arg_station,length(arg_station)-1);
	IF arg_type = '1' THEN
		-- SELECT CODE INTO var_station_code FROM work_station WHERE id = arg_station AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		
		
		SELECT tag,printer1,printer2,printer3,printer4,printer5 INTO var_tag,var_printer1,var_printer2,var_printer3,var_printer4,var_printer5 FROM pos_wdt_dev WHERE devid = var_station_code AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		IF var_tag <> '1' THEN
			LEAVE label;
		END IF;
		
		SELECT a.tableno,a.pccode,b.descript INTO var_tableno,var_pccode,var_pccode_desc FROM pos_master a,pos_pccode b WHERE a.accnt = arg_accnt AND a.pccode = b.code AND a.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_id = arg_hotel_id AND b.hotel_group_id = arg_hotel_group_id;
		SELECT descript,mapcode,placecode INTO var_tableno_desc,var_printer1_tbl,var_printer2_tbl FROM pos_pccode_table WHERE CODE = var_tableno AND pccode = var_pccode AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
		
		
		IF var_tableno_desc = '' OR var_tableno_desc IS NULL THEN
			SET var_tableno_desc = var_tableno;
		END IF;
		
		IF var_printer1_tbl <> '' AND var_printer1_tbl IS NOT NULL THEN
			SET var_printer1 = var_printer1_tbl;
		END IF;
		IF var_printer2_tbl <> '' OR var_printer2_tbl IS NOT NULL THEN
			SET var_printer2 = var_printer2_tbl;
		END IF;
		
		
		IF EXISTS(SELECT 1 FROM pos_detail WHERE accnt = arg_accnt AND id = arg_id AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
			SELECT sort_code,CODE INTO var_sort,var_plucode FROM pos_detail WHERE accnt = arg_accnt AND id = arg_id AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			IF EXISTS(SELECT 1 FROM pos_plu_printer WHERE CODE = var_plucode AND sort_code = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT SUBSTRING(flag,11,1),SUBSTRING(flag,12,1),SUBSTRING(flag,13,1),SUBSTRING(flag,14,1),SUBSTRING(flag,15,1),SUBSTRING(flag,16,1),SUBSTRING(flag,17,1),SUBSTRING(flag,18,1)
					INTO var_flag11,var_flag12,var_flag13,var_flag14,var_flag15,var_flag16,var_flag17,var_flag18 FROM pos_plu_printer WHERE CODE = var_plucode AND sort_code = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSEIF EXISTS(SELECT 1 FROM pos_plu_printer WHERE CODE = 'all' AND sort_code = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT SUBSTRING(flag,11,1),SUBSTRING(flag,12,1),SUBSTRING(flag,13,1),SUBSTRING(flag,14,1),SUBSTRING(flag,15,1),SUBSTRING(flag,16,1),SUBSTRING(flag,17,1),SUBSTRING(flag,18,1)
					INTO var_flag11,var_flag12,var_flag13,var_flag14,var_flag15,var_flag16,var_flag17,var_flag18 FROM pos_plu_printer WHERE CODE = 'all' AND sort_code = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSE
				SET var_flag11 = '0',var_flag12 = '0',var_flag13 = '0',var_flag14 = '0',var_flag15 = '0',var_flag16 = '0',var_flag17 = '0',var_flag18 = '0';
			END IF;	
			
			
			IF  EXISTS(SELECT 1 FROM pos_prnscope WHERE plucode = var_plucode AND pccode = var_pccode AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT IFNULL(printers,'') INTO var_printers FROM pos_prnscope WHERE plucode = var_plucode AND pccode = var_pccode AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSEIF EXISTS(SELECT 1 FROM pos_prnscope WHERE plucode = var_plucode AND pccode = '###' AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT IFNULL(printers,'') INTO var_printers FROM pos_prnscope WHERE plucode = var_plucode AND pccode = '###' AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSEIF EXISTS(SELECT 1 FROM pos_prnscope WHERE plucode = 'all' AND pccode = var_pccode AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT IFNULL(printers,'') INTO var_printers FROM pos_prnscope WHERE plucode = 'all' AND pccode = var_pccode AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSEIF EXISTS(SELECT 1 FROM pos_prnscope WHERE plucode = 'all' AND pccode = '###' AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id) THEN
				SELECT IFNULL(printers,'') INTO var_printers FROM pos_prnscope WHERE plucode = 'all' AND pccode = '###' AND plusort = var_sort AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
			ELSE
				SET var_printers = '';
			END IF;
			
			
		ELSE
			LEAVE label;
		END IF;
		
		IF var_flag17 <> '1' AND var_printers <> '' THEN
			WHILE LENGTH(var_printers) > 0 DO
				SET var_i = INSTR(var_printers,'#');
				IF var_i > 0 THEN
					SET var_printer = SUBSTRING(var_printers,1,var_i-1);
				ELSE
					SET var_printer = var_printers;
				END IF;
			
				IF var_flag11 <> '1' THEN
					INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
						SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, b.biz_date, b.pccode, var_pccode_desc, b.tableno, var_tableno_desc, b.gsts, a.id, arg_type, a.sta, a.code, a.descript, a.descript_en, a.unit, a.price, a.number, a.amount, a.info, a.cook, var_printer, var_printer, 1, 1, 'F', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, a.create_user, a.create_datetime, NULL, NULL 
						FROM pos_detail a,pos_master b WHERE a.accnt = arg_accnt AND a.id = arg_id AND b.accnt = arg_accnt AND a.hotel_id = arg_hotel_id AND b.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_group_id = arg_hotel_group_id;	
					IF t_error = 1 THEN
						SELECT descript INTO var_descript FROM pos_detail WHERE id = arg_id AND accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
						SET arg_ret = -1,arg_msg = '单号['+IFNULL(arg_accnt,'')+']菜品['+IFNULL(var_descript,'')+']插入分单时失败!';
						LEAVE label;
					END IF;
					
				ELSE
					INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
						SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, b.biz_date, b.pccode, var_pccode_desc, b.tableno, var_tableno_desc, b.gsts, a.id, arg_type, a.sta, a.code, a.descript, a.descript_en, a.unit, a.price, a.number, a.amount, a.info, a.cook, var_printer, var_printer, 1, 1, 'H', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, a.create_user, a.create_datetime, NULL, NULL 
						FROM pos_detail a,pos_master b WHERE a.accnt = arg_accnt AND a.id = arg_id AND b.accnt = arg_accnt AND a.hotel_id = arg_hotel_id AND b.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_group_id = arg_hotel_group_id;
	
					IF t_error = 1 THEN
						SELECT descript INTO var_descript FROM pos_detail WHERE id = arg_id AND accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
						SET arg_ret = -1,arg_msg = '单号['+IFNULL(arg_accnt,'')+']菜品['+IFNULL(var_descript,'')+']插入分单时失败!';
						LEAVE label;
					END IF;
				END IF;				
				SET var_printers = IFNULL(SUBSTRING(var_printers,var_i+1,LENGTH(var_printers)),'');
			END WHILE;
			
		END IF;
		
		
		IF var_flag12 = '1' AND var_printer1 <> '' THEN
			INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
				SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, b.biz_date, b.pccode, var_pccode_desc, b.tableno, var_tableno_desc, b.gsts, a.id, arg_type, a.sta, a.code, a.descript, a.descript_en, a.unit, a.price, a.number, a.amount, a.info, a.cook, var_printer1, var_printer1, 1, 1, '1', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, a.create_user, a.create_datetime, NULL, NULL 
				FROM pos_detail a,pos_master b WHERE a.accnt = arg_accnt AND a.id = arg_id AND b.accnt = arg_accnt AND a.hotel_id = arg_hotel_id AND b.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_group_id = arg_hotel_group_id;
	
			IF t_error = 1 THEN
				SELECT descript INTO var_descript FROM pos_detail WHERE id = arg_id AND accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
				SET arg_ret = -1,arg_msg = '单号['+IFNULL(arg_accnt,'')+']菜品['+IFNULL(var_descript,'')+']插入总单1时失败!';
				LEAVE label;
			END IF;
		END IF;
		IF var_flag13 = '1' AND var_printer2 <> '' THEN
			INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
				SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, b.biz_date, b.pccode, var_pccode_desc, b.tableno, var_tableno_desc, b.gsts, a.id, arg_type, a.sta, a.code, a.descript, a.descript_en, a.unit, a.price, a.number, a.amount, a.info, a.cook, var_printer2, var_printer2, 1, 1, '2', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, a.create_user, a.create_datetime, NULL, NULL 
				FROM pos_detail a,pos_master b WHERE a.accnt = arg_accnt AND a.id = arg_id AND b.accnt = arg_accnt AND a.hotel_id = arg_hotel_id AND b.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_group_id = arg_hotel_group_id;
	
			IF t_error = 1 THEN
				SELECT descript INTO var_descript FROM pos_detail WHERE id = arg_id AND accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
				SET arg_ret = -1,arg_msg = '单号['+IFNULL(arg_accnt,'')+']菜品['+IFNULL(var_descript,'')+']插入总单2时失败!';
				LEAVE label;
			END IF;
		END IF;
		IF var_flag14 = '1' AND var_printer3 <> '' THEN
			INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
				SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, b.biz_date, b.pccode, var_pccode_desc, b.tableno, var_tableno_desc, b.gsts, a.id, arg_type, a.sta, a.code, a.descript, a.descript_en, a.unit, a.price, a.number, a.amount, a.info, a.cook, var_printer3, var_printer3, 1, 1, '3', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, a.create_user, a.create_datetime, NULL, NULL 
				FROM pos_detail a,pos_master b WHERE a.accnt = arg_accnt AND a.id = arg_id AND b.accnt = arg_accnt AND a.hotel_id = arg_hotel_id AND b.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_group_id = arg_hotel_group_id;
			IF t_error = 1 THEN
				SELECT descript INTO var_descript FROM pos_detail WHERE id = arg_id AND accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
				SET arg_ret = -1,arg_msg = '单号['+IFNULL(arg_accnt,'')+']菜品['+IFNULL(var_descript,'')+']插入总单3时失败!';
				LEAVE label;
			END IF;
		END IF;
		IF var_flag15 = '1' AND var_printer4 <> '' THEN
			INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
				SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, b.biz_date, b.pccode, var_pccode_desc, b.tableno, var_tableno_desc, b.gsts, a.id, arg_type, a.sta, a.code, a.descript, a.descript_en, a.unit, a.price, a.number, a.amount, a.info, a.cook, var_printer4, var_printer4, 1, 1, '4', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, a.create_user, a.create_datetime, NULL, NULL 
				FROM pos_detail a,pos_master b WHERE a.accnt = arg_accnt AND a.id = arg_id AND b.accnt = arg_accnt AND a.hotel_id = arg_hotel_id AND b.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_group_id = arg_hotel_group_id;
			IF t_error = 1 THEN
				SELECT descript INTO var_descript FROM pos_detail WHERE id = arg_id AND accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
				SET arg_ret = -1,arg_msg = '单号['+IFNULL(arg_accnt,'')+']菜品['+IFNULL(var_descript,'')+']插入总单4时失败!';
				LEAVE label;
			END IF;
		END IF;
		IF var_flag16 = '1' AND var_printer5 <> '' THEN
			INSERT INTO pos_dishcard (hotel_group_id, hotel_id, accnt, inumber, tnumber, mnumber, biz_date, pccode, pccode_name, table_code, table_name, gsts, printid, TYPE, sta, CODE, descript, descript_en, unit, price, number, amount, cook_all, cook, printer, printer1, p_number, p_number1, CHANGED, times, isprint, station, class1, p_sort, foliono, siteno, create_user, create_datetime, modify_user, modify_datetime)
				SELECT arg_hotel_group_id, arg_hotel_id, arg_accnt, a.inumber, a.tnumber, a.mnumber, b.biz_date, b.pccode, var_pccode_desc, b.tableno, var_tableno_desc, b.gsts, a.id, arg_type, a.sta, a.code, a.descript, a.descript_en, a.unit, a.price, a.number, a.amount, a.info, a.cook, var_printer5, var_printer5, 1, 1, '5', 0, 'F', var_station_code, NULL, a.sort_code, '0', a.siteno, a.create_user, a.create_datetime, NULL, NULL 
				FROM pos_detail a,pos_master b WHERE a.accnt = arg_accnt AND a.id = arg_id AND b.accnt = arg_accnt AND a.hotel_id = arg_hotel_id AND b.hotel_id = arg_hotel_id AND a.hotel_group_id = arg_hotel_group_id AND b.hotel_group_id = arg_hotel_group_id;
			IF t_error = 1 THEN
				SELECT descript INTO var_descript FROM pos_detail WHERE id = arg_id AND accnt = arg_accnt AND hotel_id = arg_hotel_id AND hotel_group_id = arg_hotel_group_id;
				SET arg_ret = -1,arg_msg = '单号['+IFNULL(arg_accnt,'')+']菜品['+IFNULL(var_descript,'')+']插入总单5时失败!';
				LEAVE label;
			END IF;
		END IF;
	END IF;
	
END label; 
END
;;
DELIMITER ;