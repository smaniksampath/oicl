-- Step 1: check table
SELECT * FROM `motor_idvs_temp_2`;

-- Step 2: delet table data
TRUNCATE TABLE `motor_idvs_temp_2`;


-- Step 3: update col.- 27, 28, 29, 30, 33 in table
UPDATE oicl_dev3.motor_idvs_temp_2 a SET a.col_27 = (SELECT b.ID FROM oicl_dev3.city b WHERE b.IS_ACTIVE = 'Y' AND b.CITY_ID = a.col_1);
UPDATE oicl_dev3.motor_idvs_temp_2 a SET a.col_28 = (SELECT b.ID FROM oicl_dev3.`motor_manufacturer` b WHERE b.DESCRIPTION = a.col_2); -- JAWA MOTOR
UPDATE oicl_dev3.motor_idvs_temp_2 a SET a.col_29 = (SELECT b.ID FROM oicl_dev3.`products` b WHERE b.OICL_IDENTIFICATION_ID = a.col_3);
UPDATE oicl_dev3.motor_idvs_temp_2 a SET a.col_30 = (SELECT b.ID FROM oicl_dev3.`motor_models` b WHERE b.MODEL_ID = a.col_4); -- JAWA, MOJO
UPDATE oicl_dev3.motor_idvs_temp_2 a SET a.col_33 = (SELECT b.stateid FROM oicl_dev3.city b WHERE b.id = a.col_27);

-- if col_28 or col_30 not updated 100% then only uncomment below tow line
-- INSERT INTO `motor_models` (MODEL_ID, CREATE_DATE, UPDATE_DATE) SELECT DISTINCT(col_4), NOW(), NOW() FROM `motor_idvs_temp_2` WHERE col_30 IS NULL ;
-- INSERT INTO motor_manufacturer(manufacturer_name,description,create_date,update_date) SELECT DISTINCT(col_2),col_2, NOW(), NOW() FROM `motor_idvs_temp_2` WHERE col_28 IS NULL ;

-- Step 4: find max count and change in 4 place
SELECT MAX(ID) FROM `motor_variant`;  -- 6683488
UPDATE `motor_idvs_temp_2` SET col_32 = 6683488 + col_32;
UPDATE `motor_idvs_temp_2` SET col_31 = col_32;

-- Step 5: insert data in motor_variant table
INSERT INTO `motor_variant` (ID, VARIANT_NAME, INLIAS_VEHICLE_CODE, CUBIC_CAPACITY, SEATING_CAPACITY, FUEL_TYPE, EX_PRICE, UPTO_6_MONTHS, 
UPTO_1_YEAR, UPTO_2_YEAR, UPTO_3_YEAR, UPTO_4_YEAR, UPTO_5_YEAR, UPTO_6_YEAR, UPTO_7_YEAR, UPTO_8_YEAR, UPTO_9_YEAR, UPTO_10_YEAR, UPTO_11_YEAR, 
UPTO_12_YEAR, UPTO_13_YEAR, UPTO_14_YEAR, UPTO_15_YEAR, REMARKS, CREATE_DATE, CREATED_BY, UPDATED_BY, UPDATE_DATE, IDVS_ID, IS_ACTIVE) 
SELECT NULL, col_5, col_6, col_7, col_8, col_9, col_10, col_11, col_12, col_13, col_14, col_15, col_16, col_17, col_18, col_19,  
col_20, col_21, col_22, col_23, col_24, col_25, col_26, NULL, NOW(), NULL, NULL, NOW(), col_32, 'Y' FROM `motor_idvs_temp_2`;

-- Step 6: check and confurm blanck table greater than max id 
SELECT * FROM motor_variant WHERE ID>6683488;

-- Step 7: update id and reconfurm through above query that record is updated
UPDATE motor_variant m SET m.id=m.idvs_id WHERE m.idvs_id>6683488;

-- Step 8: insert data in motor_relations table
INSERT INTO `motor_relations` (ID, cityid, CITY_NAME, mfgid, MANUFACTURER_NAME, productid, PRODUCT_NAME, modelid, MODEL_NAME, variantid, VARIANT_NAME,
CREATE_DATE, CREATED_BY, UPDATED_BY, UPDATE_DATE, IDVS_ID, IS_ACTIVE, stateid) SELECT NULL, col_27, col_1, col_28, col_2, col_29, col_3, col_30, col_4, col_31, 
col_5, NOW(), NULL, NULL, NOW(), col_32, 'Y', col_33 FROM `motor_idvs_temp_2`;

-- Step 9: chenge date and run query. -- then check and confurm data
SELECT * FROM motor_relations WHERE create_date LIKE '%2022-08-03%' LIMIT 3000 ;

-- Step 10: chenge date and run query for 4 weelar. 
INSERT INTO motor_relations(cityid,CITY_NAME,mfgid,MANUFACTURER_NAME,productid,PRODUCT_NAME,modelid,MODEL_NAME,variantid,VARIANT_NAME,CREATE_DATE,UPDATE_DATE,IS_ACTIVE,stateid)
 SELECT cityid,CITY_NAME,mfgid,MANUFACTURER_NAME,'246' AS productid,'MOT-PRD-012' AS PRODUCT_NAME,modelid,MODEL_NAME,variantid,VARIANT_NAME,NOW() AS CREATE_DATE,NOW() AS UPDATE_DATE,IS_ACTIVE,stateid FROM motor_relations WHERE productid=188 AND create_date='2022-08-03 18:49:20' ;

-- Step 11: chenge date and run query for SAOD products 4 weelar. 
INSERT INTO motor_relations(cityid,CITY_NAME,mfgid,MANUFACTURER_NAME,productid,PRODUCT_NAME,modelid,MODEL_NAME,variantid,VARIANT_NAME,CREATE_DATE,UPDATE_DATE,IS_ACTIVE,stateid)
 SELECT cityid,CITY_NAME,mfgid,MANUFACTURER_NAME,'246' AS productid,'MOT-PRD-015' AS PRODUCT_NAME,modelid,MODEL_NAME,variantid,VARIANT_NAME,NOW() AS CREATE_DATE,NOW() AS UPDATE_DATE,IS_ACTIVE,stateid FROM motor_relations WHERE productid=188 AND create_date='2022-08-03 18:49:20' ;

-- Step 12: chenge date and run query for SAOD products 4 weelar. 
INSERT INTO motor_relations(cityid,CITY_NAME,mfgid,MANUFACTURER_NAME,productid,PRODUCT_NAME,modelid,MODEL_NAME,variantid,VARIANT_NAME,CREATE_DATE,UPDATE_DATE,IS_ACTIVE,stateid)
 SELECT cityid,CITY_NAME,mfgid,MANUFACTURER_NAME,'246' AS productid,'MOT-POS-012' AS PRODUCT_NAME,modelid,MODEL_NAME,variantid,VARIANT_NAME,NOW() AS CREATE_DATE,NOW() AS UPDATE_DATE,IS_ACTIVE,stateid FROM motor_relations WHERE productid=188 AND create_date='2022-08-03 18:49:20' ;


-- Step 13: chenge date and run query for SAOD products 4 weelar. 
INSERT INTO motor_relations(cityid,CITY_NAME,mfgid,MANUFACTURER_NAME,productid,PRODUCT_NAME,modelid,MODEL_NAME,variantid,VARIANT_NAME,CREATE_DATE,UPDATE_DATE,IS_ACTIVE,stateid)
 SELECT cityid,CITY_NAME,mfgid,MANUFACTURER_NAME,'246' AS productid,'MOT-PRD-005' AS PRODUCT_NAME,modelid,MODEL_NAME,variantid,VARIANT_NAME,NOW() AS CREATE_DATE,NOW() AS UPDATE_DATE,IS_ACTIVE,stateid FROM motor_relations WHERE productid=188 AND create_date='2022-08-03 18:49:20' ;


-- Step 14: chenge date and run query for SAOD products 4 weelar. 
INSERT INTO motor_relations(cityid,CITY_NAME,mfgid,MANUFACTURER_NAME,productid,PRODUCT_NAME,modelid,MODEL_NAME,variantid,VARIANT_NAME,CREATE_DATE,UPDATE_DATE,IS_ACTIVE,stateid)
 SELECT cityid,CITY_NAME,mfgid,MANUFACTURER_NAME,'246' AS productid,'MOT-PRD-014' AS PRODUCT_NAME,modelid,MODEL_NAME,variantid,VARIANT_NAME,NOW() AS CREATE_DATE,NOW() AS UPDATE_DATE,IS_ACTIVE,stateid FROM motor_relations WHERE productid=188 AND create_date='2022-08-03 18:49:20' ;

