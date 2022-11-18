SELECT COUNT(*) FROM `motor_idvs_temp_1`;
SELECT * FROM `motor_idvs_temp_1`;
DELETE FROM motor_idvs_temp_1 WHERE col_1 ='';
TRUNCATE TABLE `motor_idvs_temp_1`;


UPDATE oicl_dev3.motor_idvs_temp_1 a SET a.col_31 = (SELECT b.ID FROM oicl_dev3.city b WHERE b.IS_ACTIVE = 'Y' AND b.CITY_ID = a.col_1);

UPDATE oicl_dev3.motor_idvs_temp_1 a SET a.col_37 = (SELECT b.stateid FROM oicl_dev3.city b WHERE b.IS_ACTIVE = 'Y' AND b.CITY_ID = a.col_1);

UPDATE oicl_dev3.motor_idvs_temp_1 a SET a.col_32 = (SELECT b.ID FROM oicl_dev3.`motor_manufacturer` b WHERE b.DESCRIPTION = a.col_2);

UPDATE oicl_dev3.motor_idvs_temp_1 a SET a.col_33 = (SELECT b.ID FROM oicl_dev3.`products` b WHERE b.OICL_IDENTIFICATION_ID = a.col_3);

UPDATE oicl_dev3.motor_idvs_temp_1 a SET a.col_34 = (SELECT b.ID FROM oicl_dev3.`motor_models` b WHERE b.MODEL_ID = a.col_4);

-- INSERT INTO `motor_models` (MODEL_ID, CREATE_DATE, UPDATE_DATE) SELECT DISTINCT(col_4), NOW(), NOW() FROM `motor_idvs_temp_1` WHERE col_34 IS NULL

-- INSERT INTO motor_manufacturer(manufacturer_name,description,create_date,update_date) SELECT DISTINCT(col_2),col_2, NOW(), NOW() FROM `motor_idvs_temp_1` WHERE col_32 IS NULL

SELECT MAX(ID) FROM `motor_variant`; -- 6686144

-- SELECT DISTINCT fuel_code,FUEL_TYPE FROM motor_variant;

UPDATE `motor_idvs_temp_1` SET col_36 = 6686144 + col_36;
UPDATE `motor_idvs_temp_1` SET col_35 = col_36;

INSERT INTO `motor_variant` (ID, VARIANT_NAME, INLIAS_VEHICLE_CODE, CUBIC_CAPACITY, SEATING_CAPACITY, FUEL_TYPE, EX_PRICE, UPTO_6_MONTHS, 
UPTO_1_YEAR, UPTO_2_YEAR, UPTO_3_YEAR, UPTO_4_YEAR, UPTO_5_YEAR, UPTO_6_YEAR, UPTO_7_YEAR, UPTO_8_YEAR, UPTO_9_YEAR, UPTO_10_YEAR, UPTO_11_YEAR, 
UPTO_12_YEAR, UPTO_13_YEAR, UPTO_14_YEAR, UPTO_15_YEAR, REMARKS, CREATE_DATE, CREATED_BY, UPDATED_BY, UPDATE_DATE, IDVS_ID, IS_ACTIVE,FUEL_CODE,GVW) 
SELECT NULL, col_5, col_6, col_7, col_8, col_9, col_10, col_11, col_12, col_13, col_14, col_15, col_16, col_17, col_18, col_19,  
col_20, col_21, col_22, col_23, col_24, col_25, col_26, NULL, NOW(), NULL, NULL, NOW(), col_36, 'Y',col_29,col_30 FROM `motor_idvs_temp_1`;


SELECT * FROM motor_variant WHERE ID>6686144;
UPDATE motor_variant m SET m.id=m.idvs_id WHERE m.idvs_id>6686144;

INSERT INTO `motor_relations` (ID, cityid,stateid, CITY_NAME, mfgid, MANUFACTURER_NAME, productid, PRODUCT_NAME, modelid, MODEL_NAME, variantid, VARIANT_NAME,
CREATE_DATE, CREATED_BY, UPDATED_BY, UPDATE_DATE, IDVS_ID, IS_ACTIVE) SELECT NULL, col_31,col_37, col_1, col_32, col_2, col_33, col_3, col_34, col_4, col_35, 
col_5, NOW(), NULL, NULL, NOW(), col_36, 'Y' FROM `motor_idvs_temp_1`;


SELECT COUNT(*) FROM motor_idvs_temp_1 mi
INNER JOIN motor_manufacturer mm ON mm.id = mi.col_32;

UPDATE motor_manufacturer mm
JOIN motor_idvs_temp_1 mi ON mm.id = mi.col_32
SET mm.manufacturer_code =mi.col_27;


SELECT COUNT(*) FROM motor_idvs_temp_1 mi
INNER JOIN motor_models mm ON mm.id = mi.col_34;


UPDATE motor_models mm
JOIN motor_idvs_temp_1 mi ON mm.id = mi.col_34
SET mm.model_code =mi.col_28;


-- ---------------------------------------- END ----------------------------------------------------------------


