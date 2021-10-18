-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.0.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for procedure ems_test.F_TENDER_STS
DROP PROCEDURE IF EXISTS `F_TENDER_STS`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `F_TENDER_STS`(IN `EID` INT)
BEGIN

DECLARE TENDER_STATUS VARCHARACTER(500);

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_CALC_LD
DROP PROCEDURE IF EXISTS `P_CALC_LD`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_CALC_LD`(
	IN `INVITEMID` INT,
	OUT `DELIVERY_PERIOD` INT,
	OUT `LD_FROM` DATE,
	OUT `LD_TO` DATE,
	OUT `TOT_INVITEM_AMT` DECIMAL(20,2),
	OUT `TIME_TAKEN` INT,
	OUT `DELAY_TIME` INT,
	OUT `DEDUCT_LD_PERCENT` DECIMAL(20,2),
	OUT `DEDUCT_LD_AMT` DECIMAL(20,2),
	OUT `EXCESS_AMT` DECIMAL(20,2)
)
BEGIN

SELECT  	
		
	( T1.invoice_qty * (T6.pbid_basicprice  + T6.pbid_salestax + T6.pbid_custtax + T6.pbid_misc + T1.inv_additional_charge ) )
			
	INTO TOT_INVITEM_AMT	
	
FROM invoice_items AS T1 

LEFT JOIN invoice AS T2 ON(T2.invoice_id = T1.invoice_id)
	
LEFT JOIN purchase_order AS T3 ON(T3.purchase_id = T2.purchase_id)
	
LEFT JOIN procure_details AS T4 ON(T4.procure_id = T3.procure_id)

LEFT JOIN purchase_schedule AS T5 ON(T5.purchase_sch_id = T1.purchase_sch_id)

LEFT JOIN v_bidder_price AS T6 ON(T6.bidder_equip_id =T5.bidder_equip_id)

WHERE T1.invoice_item_id = INVITEMID;

-- TIME TAKEN

SELECT  
	
	CEIL 
	
		(CASE 
	
			WHEN T4.install_report_req = 1 THEN  
			
				(CASE 
						
					WHEN  T4.delivery_period_id = 2 THEN DATEDIFF(T1.install_date, COALESCE(T5.delivery_confirm_date, T3.purchase_date))
					
					WHEN  T4.delivery_period_id = 3 THEN ABS(DATEDIFF(T1.install_date,COALESCE(T5.delivery_confirm_date, T3.purchase_date))/7)
						
					WHEN  T4.delivery_period_id = 4 THEN TIMESTAMPDIFF(MONTH,COALESCE(T5.delivery_confirm_date, T3.purchase_date),T1.install_date)
					
				END) 
				
			WHEN T4.install_report_req = 2 THEN  
			
				(CASE 
						
					WHEN  T4.delivery_period_id = 2 THEN DATEDIFF(T1.supply_date,COALESCE(T5.delivery_confirm_date, T3.purchase_date))
					
					WHEN  T4.delivery_period_id = 3 THEN ABS(DATEDIFF(T1.supply_date,COALESCE(T5.delivery_confirm_date, T3.purchase_date))/7)
					
					WHEN  T4.delivery_period_id = 4 THEN TIMESTAMPDIFF(MONTH,COALESCE(T5.delivery_confirm_date, T3.purchase_date),T1.supply_date)
					
				END) 
				
		END) 	
			
	INTO TIME_TAKEN	
	
FROM invoice_items AS T1 

LEFT JOIN invoice AS T2 ON(T2.invoice_id = T1.invoice_id)
	
LEFT JOIN purchase_order AS T3 ON(T3.purchase_id = T2.purchase_id)
	
LEFT JOIN procure_details AS T4 ON(T4.procure_id = T3.procure_id)

LEFT JOIN purchase_schedule AS T5 ON(T5.purchase_sch_id = T1.purchase_sch_id)

LEFT JOIN v_bidder_price AS T6 ON(T6.bidder_equip_id =T5.bidder_equip_id)

WHERE T1.invoice_item_id = INVITEMID;

-- DELAY_TIME

SELECT  	
		
	GREATEST(0,(CEIL 
	
		(CASE 
	
			WHEN T4.install_report_req = 1 THEN  
									
				(CASE 
											
					WHEN  T4.delivery_period_id = 2 THEN DATEDIFF(T1.install_date,COALESCE(T5.delivery_confirm_date, T3.purchase_date)) 
										
					WHEN  T4.delivery_period_id = 3 THEN ABS(DATEDIFF(T1.install_date,COALESCE(T5.delivery_confirm_date, T3.purchase_date))/7)
											
					WHEN  T4.delivery_period_id = 4 THEN TIMESTAMPDIFF(MONTH,COALESCE(T5.delivery_confirm_date, T3.purchase_date),T1.install_date)
										
				END) 
						
				WHEN T4.install_report_req = 2 THEN  
								
					(CASE 
										
						WHEN  T4.delivery_period_id = 2 THEN DATEDIFF(T1.supply_date,COALESCE(T5.delivery_confirm_date, T3.purchase_date))
									
						WHEN  T4.delivery_period_id = 3 THEN ABS(DATEDIFF(T1.supply_date,COALESCE(T5.delivery_confirm_date, T3.purchase_date))/7)
										
						WHEN  T4.delivery_period_id = 4 THEN TIMESTAMPDIFF(MONTH,COALESCE(T5.delivery_confirm_date, T3.purchase_date),T1.supply_date)
									
					END)  
								
		END) - COALESCE(T3.delivery_period_extn, T3.delivery_period, T4.delivery_period) ))
			
	INTO DELAY_TIME	
	
FROM invoice_items AS T1 

LEFT JOIN invoice AS T2 ON(T2.invoice_id = T1.invoice_id)
	
LEFT JOIN purchase_order AS T3 ON(T3.purchase_id = T2.purchase_id)
	
LEFT JOIN procure_details AS T4 ON(T4.procure_id = T3.procure_id)

LEFT JOIN purchase_schedule AS T5 ON(T5.purchase_sch_id = T1.purchase_sch_id)

LEFT JOIN v_bidder_price AS T6 ON(T6.bidder_equip_id =T5.bidder_equip_id)

WHERE T1.invoice_item_id = INVITEMID;


-- DEDUCT_LD_PERCENT

SELECT  	
	
	LEAST(15,GREATEST(0,(CEIL 
	
		(CASE 
	
			WHEN T4.install_report_req = 1 THEN  
									
				(CASE 
											
					WHEN  T4.delivery_period_id = 2 THEN DATEDIFF(T1.install_date,COALESCE(T5.delivery_confirm_date, T3.purchase_date)) 
										
					WHEN  T4.delivery_period_id = 3 THEN ABS(DATEDIFF(T1.install_date,COALESCE(T5.delivery_confirm_date, T3.purchase_date))/7)
											
					WHEN  T4.delivery_period_id = 4 THEN TIMESTAMPDIFF(MONTH,COALESCE(T5.delivery_confirm_date, T3.purchase_date),T1.install_date)
										
				END) 
									
			WHEN T4.install_report_req = 2 THEN  
								
				(CASE 
										
					WHEN  T4.delivery_period_id = 2 THEN DATEDIFF(T1.supply_date,COALESCE(T5.delivery_confirm_date, T3.purchase_date))
									
					WHEN  T4.delivery_period_id = 3 THEN ABS(DATEDIFF(T1.supply_date,COALESCE(T5.delivery_confirm_date, T3.purchase_date))/7)
										
					WHEN  T4.delivery_period_id = 4 THEN TIMESTAMPDIFF(MONTH,COALESCE(T5.delivery_confirm_date, T3.purchase_date),T1.supply_date)
									
				END)  
								
		END) - COALESCE(T3.delivery_period_extn, T3.delivery_period, T4.delivery_period) )) * T4.ld_min)	
			
	INTO DEDUCT_LD_PERCENT	
	
FROM invoice_items AS T1 

LEFT JOIN invoice AS T2 ON(T2.invoice_id = T1.invoice_id)
	
LEFT JOIN purchase_order AS T3 ON(T3.purchase_id = T2.purchase_id)
	
LEFT JOIN procure_details AS T4 ON(T4.procure_id = T3.procure_id)

LEFT JOIN purchase_schedule AS T5 ON(T5.purchase_sch_id = T1.purchase_sch_id)

LEFT JOIN v_bidder_price AS T6 ON(T6.bidder_equip_id =T5.bidder_equip_id)

WHERE T1.invoice_item_id = INVITEMID;


-- DEDUCT_LD_AMT

SELECT  	
	
		ROUND(
	
	( T1.invoice_qty * (T6.pbid_basicprice  + T6.pbid_salestax + T6.pbid_custtax + T6.pbid_misc + T1.inv_additional_charge ) ) *
	
	(LEAST(15,GREATEST(0,(CEIL 
	
		(CASE 
		
			WHEN T4.install_report_req = 1 THEN  
										
				(CASE 
												
					WHEN  T4.delivery_period_id = 2 THEN DATEDIFF(T1.install_date,COALESCE(T5.delivery_confirm_date, T3.purchase_date)) 
											
					WHEN  T4.delivery_period_id = 3 THEN ABS(DATEDIFF(T1.install_date,COALESCE(T5.delivery_confirm_date, T3.purchase_date))/7)
											
					WHEN  T4.delivery_period_id = 4 THEN TIMESTAMPDIFF(MONTH,COALESCE(T5.delivery_confirm_date, T3.purchase_date),T1.install_date)
											
				END) 
										
			WHEN T4.install_report_req = 2 THEN  
									
				(CASE 
											
					WHEN  T4.delivery_period_id = 2 THEN DATEDIFF(T1.supply_date,COALESCE(T5.delivery_confirm_date, T3.purchase_date))
										
					WHEN  T4.delivery_period_id = 3 THEN ABS(DATEDIFF(T1.supply_date,COALESCE(T5.delivery_confirm_date, T3.purchase_date))/7)
											
					WHEN  T4.delivery_period_id = 4 THEN TIMESTAMPDIFF(MONTH,COALESCE(T5.delivery_confirm_date, T3.purchase_date),T1.supply_date)
										
				END)  
									
		END) - COALESCE(T3.delivery_period_extn, T3.delivery_period, T4.delivery_period) )) * T4.ld_min) / 100) ,2) 	
			
	INTO DEDUCT_LD_AMT	
	
FROM invoice_items AS T1 

LEFT JOIN invoice AS T2 ON(T2.invoice_id = T1.invoice_id)
	
LEFT JOIN purchase_order AS T3 ON(T3.purchase_id = T2.purchase_id)
	
LEFT JOIN procure_details AS T4 ON(T4.procure_id = T3.procure_id)

LEFT JOIN purchase_schedule AS T5 ON(T5.purchase_sch_id = T1.purchase_sch_id)

LEFT JOIN v_bidder_price AS T6 ON(T6.bidder_equip_id =T5.bidder_equip_id)

WHERE T1.invoice_item_id = INVITEMID;


-- EXCESS_AMT

SELECT  	

	GREATEST(0, 
	
	( T1.invoice_qty * (T1.inv_basicprice  + T1.inv_salestax + T1.inv_custtax + T1.inv_misc + T1.inv_additional_charge )) - 
	
	(T1.invoice_qty * (T6.pbid_basicprice  + T6.pbid_salestax + T6.pbid_custtax + T6.pbid_misc + T1.inv_additional_charge ))
	
	)
	
	INTO EXCESS_AMT

FROM invoice_items AS T1 

LEFT JOIN invoice AS T2 ON(T2.invoice_id = T1.invoice_id)
	
LEFT JOIN purchase_order AS T3 ON(T3.purchase_id = T2.purchase_id)
	
LEFT JOIN procure_details AS T4 ON(T4.procure_id = T3.procure_id)

LEFT JOIN purchase_schedule AS T5 ON(T5.purchase_sch_id = T1.purchase_sch_id)

LEFT JOIN v_bidder_price AS T6 ON(T6.bidder_equip_id =T5.bidder_equip_id)

WHERE T1.invoice_item_id = INVITEMID;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_CALC_SD
DROP PROCEDURE IF EXISTS `P_CALC_SD`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_CALC_SD`(IN `BEID` INT)
BEGIN

UPDATE bidder_equipments AS T1 

SET T1.loi_sd_val = 

( 

SELECT RES.SD_RS FROM (SELECT 

((IFNULL(SUM(S1.loi_qty),0)*IFNULL(S2.UNIT_PRICE,0)*IFNULL(S3.security_deposit,0))/100 ) SD_RS

FROM  loi_schedule AS S1  

LEFT JOIN v_bidder_price AS S2 ON (S2.bidder_equip_id = S1.bidder_equip_id ) 

LEFT JOIN v_bidder_details AS S3 ON (S3.bidder_equip_id = S1.bidder_equip_id) 

WHERE S1.bidder_equip_id = BEID ) RES

) 

WHERE T1.bidder_equip_id = BEID;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_CALSD_LOI
DROP PROCEDURE IF EXISTS `P_CALSD_LOI`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_CALSD_LOI`(IN `LOIID` INT)
BEGIN

	UPDATE loi AS T1 
	
	SET 
		
		T1.loi_tot_val = ( SELECT 

								SUM(FORMAT((S1.loi_sch_qty * S12.UNIT_PRICE),"2","EN_IN")) AS TOT_LOISCH_PRICE
								
								FROM loi_schedule AS S1
								
								INNER JOIN v_sanction_allotment AS S11 ON(S11.sanction_allotment_id =S1.sanction_allotment_id)
								
								INNER JOIN v_bidder_price AS S12 ON (S12.bidder_equip_id = S1.bidder_equip_id) 
								
								WHERE S1.loi_id = T1.loi_id ) ,
		
		T1.loi_sd_amt	= ( SELECT 

								SUM(FORMAT(((S3.loi_sch_qty * S4.UNIT_PRICE * S4.security_deposit) / 100 ),"2","EN_IN")) AS LOISCH_SD
								
								FROM loi_schedule AS S3
								
								INNER JOIN v_sanction_allotment AS S31 ON(S31.sanction_allotment_id =S3.sanction_allotment_id)
								
								INNER JOIN v_bidder_price AS S4 ON (S4.bidder_equip_id = S3.bidder_equip_id) 
								
								WHERE S3.loi_id = T1.loi_id)
								
	WHERE T1.loi_id = LOIID;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_CALSD_PO
DROP PROCEDURE IF EXISTS `P_CALSD_PO`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_CALSD_PO`(IN `PURID` INT)
BEGIN

	UPDATE purchase_order AS T1 
	
	SET 
		
		T1.purchase_tot_val = ( SELECT 

								SUM(FORMAT((S1.purchase_qty * S12.UNIT_PRICE),"2","EN_IN")) AS TOT_LOISCH_PRICE
								
								FROM purchase_schedule AS S1
								
								INNER JOIN v_sanction_allotment AS S11 ON(S11.sanction_allotment_id = S1.sanction_allotment_id)
								
								INNER JOIN v_bidder_price AS S12 ON (S12.bidder_equip_id = S1.bidder_equip_id) 
								
								WHERE S1.purchase_id = T1.purchase_id ) ,
		
		T1.purchase_sd_amt	= (SELECT FORMAT(IFNULL(((RES1.EXCESS_SD_QTY * RES2.UNIT_PRICE * RES2.security_deposit)/100),0),"2","EN_IN") AS REQ_SD_AMT  FROM 

										(
										
										SELECT R2.loi_sch_qty, R2.OTH_PO_QTY, R2.CUR_PO_QTY, R2.BAL_FRM_LOI, 

									( CASE WHEN (R2.BAL_FRM_LOI - R2.CUR_PO_QTY) > 0 THEN 0 ELSE (R2.CUR_PO_QTY - R2.BAL_FRM_LOI) END ) AS EXCESS_SD_QTY
										
									FROM 
									
									( SELECT R1.loi_sch_qty, R1.OTH_PO_QTY, R1.CUR_PO_QTY, 
									
									( CASE WHEN (R1.loi_sch_qty - R1.OTH_PO_QTY) < 0 THEN 0 ELSE (R1.loi_sch_qty - R1.OTH_PO_QTY) END ) AS BAL_FRM_LOI
									
									FROM 
									
									( SELECT
													
									DISTINCT	T4.loi_sch_qty, 
													
									(SELECT IFNULL(SUM(S2.purchase_qty),0) FROM purchase_order AS S1 INNER JOIN purchase_schedule AS S2 ON(S2.purchase_id = S1.purchase_id) WHERE S1.bidder_id = T2.bidder_id AND S2.bidder_equip_id = T1.bidder_equip_id AND S1.purchase_id <> T1.purchase_id) AS OTH_PO_QTY,
													
									(SELECT IFNULL(SUM(S2.purchase_qty),0) FROM purchase_order AS S1 INNER JOIN purchase_schedule AS S2 ON(S2.purchase_id = S1.purchase_id) WHERE S2.bidder_equip_id = T1.bidder_equip_id AND S1.purchase_id = T1.purchase_id) AS CUR_PO_QTY
													
									FROM purchase_schedule  AS T1
									
									LEFT JOIN purchase_order AS T2 ON (T2.purchase_id = T1.purchase_id)
													
									LEFT JOIN v_sanction_allotment AS T3 ON(T3.sanction_allotment_id = T1.sanction_allotment_id)
													
									INNER JOIN loi_schedule AS T4 ON(T4.bidder_equip_id = T1.bidder_equip_id)
													
									WHERE T1.purchase_id = T1.purchase_id) AS R1
									
									) AS R2
									
								) AS RES1	,
								
(								SELECT 
								
								S4.UNIT_PRICE , S4.security_deposit,
								
								SUM(FORMAT(((S3.purchase_qty * S4.UNIT_PRICE * S4.security_deposit) / 100 ),"2","EN_IN")) AS LOISCH_SD
								
								FROM purchase_schedule AS S3
								
								INNER JOIN v_sanction_allotment AS S31 ON(S31.sanction_allotment_id = S3.sanction_allotment_id)
								
								INNER JOIN v_bidder_price AS S4 ON (S4.bidder_equip_id = S3.bidder_equip_id) 
								
								WHERE S3.purchase_id = T1.purchase_id) AS RES2)
								
	WHERE T1.purchase_id = PURID;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_COPY_AMC
DROP PROCEDURE IF EXISTS `P_COPY_AMC`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_COPY_AMC`(IN `BEID` INT)
BEGIN

INSERT INTO bidder_original_amc

	(amc_id,bidder_id,pbid_id,bidder_equip_id,amc_yr,amc_charge)
	
(SELECT amc_id,bidder_id,pbid_id,bidder_equip_id,amc_yr,amc_charge 

FROM bidder_amc 

WHERE bidder_equip_id  = BEID);

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_COPY_CAMC
DROP PROCEDURE IF EXISTS `P_COPY_CAMC`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_COPY_CAMC`(IN `BEID` INT)
BEGIN

INSERT INTO bidder_original_camc

(camc_id,bidder_id,pbid_id,bidder_equip_id,camc_yr,camc_charge)

(SELECT camc_id,bidder_id,pbid_id,bidder_equip_id,camc_yr,camc_charge FROM bidder_camc WHERE bidder_equip_id  = BEID);

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_COPY_PRICE
DROP PROCEDURE IF EXISTS `P_COPY_PRICE`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_COPY_PRICE`(IN `BEID` INT)
BEGIN

INSERT INTO bidder_original_price

(pbid_id,bidder_equip_id,bidder_id,pbid_basicprice,pbid_salestax,pbid_custtax,pbid_misc)

(SELECT pbid_id,bidder_equip_id,bidder_id,pbid_basicprice,pbid_salestax,pbid_custtax,pbid_misc FROM bidder_price WHERE bidder_equip_id  = BEID);

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_COPY_PROCURE
DROP PROCEDURE IF EXISTS `P_COPY_PROCURE`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_COPY_PROCURE`(IN `PRCID` INT)
BEGIN

INSERT INTO procure_original_details

(
procure_id, procure_basket_item_id, tag_id, contract_id, procure_no, procure_name,
procure_startdt, procure_enddt, techbid_opendt, prebid_meetdt,
procure_equip_type_id, procure_fees, procure_emd, security_deposit,
ssi_exemption, warranty_period, tender_amcslab, tender_camcslab, demo_required, amc_camc_consider,
min_pmvisit, equip_uptime, equip_maxresponse, maxresponse_unit, delivery_period, delivery_period_id,
ld_min, ld_period_id, ld_max, payratio_id, turnover,
warranty_cert_req, install_report_req, material_receive_cert, sticker, performance_cert_req, photograph_req,
procure_remarks, procure_confirm,
procure_cancel, procure_cancel_dt, procure_cancel_remarks,
procure_amends, procure_amends_dt, procure_amends_remarks 
)

(

SELECT 

procure_id, procure_basket_item_id, tag_id, contract_id, procure_no, procure_name,
procure_startdt, procure_enddt, techbid_opendt, prebid_meetdt,
procure_equip_type_id, procure_fees, procure_emd, security_deposit,
ssi_exemption, warranty_period, tender_amcslab, tender_camcslab, demo_required, amc_camc_consider,
min_pmvisit, equip_uptime, equip_maxresponse, maxresponse_unit, delivery_period, delivery_period_id,
ld_min, ld_period_id, ld_max, payratio_id, turnover,
warranty_cert_req, install_report_req, material_receive_cert, sticker, performance_cert_req, photograph_req,
procure_remarks, procure_confirm,
procure_cancel, procure_cancel_dt, procure_cancel_remarks,
procure_amends, procure_amends_dt, procure_amends_remarks  

FROM procure_details WHERE procure_id  = PRCID

);

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_COPY_PROCURE_ITEM_DETAILS
DROP PROCEDURE IF EXISTS `P_COPY_PROCURE_ITEM_DETAILS`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_COPY_PROCURE_ITEM_DETAILS`(IN `PRCID` INT)
BEGIN

INSERT INTO copy_procure_item_details
(
   procure_item_id, 
   procure_id, 
   procure_basket_item_id, 
   equip_id, 
   procure_item_qty, 
   tender_equip_userSpecific,
   tender_equip_tenderSpecific, 
   tender_equip_spec_print, 
   equip_price_consider, 
   equip_amc_camc_required, 
   demo_Dt, 
   priceBid_openDt, 
   entered_on, 
   entered_by, 
   updated_on, 
   updated_by, 
   ipaddress
)

(
SELECT
   procure_item_id, 
   procure_id, 
   procure_basket_item_id, 
   equip_id, 
   procure_item_qty, 
   tender_equip_userSpecific,
   tender_equip_tenderSpecific, 
   tender_equip_spec_print, 
   equip_price_consider, 
   equip_amc_camc_required, 
   demo_Dt, 
   priceBid_openDt, 
   entered_on, 
   entered_by, 
   updated_on, 
   updated_by, 
   ipaddress
   
FROM procure_item_details 

WHERE procure_id  = PRCID
);

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_EQUIP_UNICODE_GEN
DROP PROCEDURE IF EXISTS `P_EQUIP_UNICODE_GEN`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_EQUIP_UNICODE_GEN`(IN `PURSCHID` INT, IN `EID` INT, IN `PURSCHQTY` INT)
BEGIN

DECLARE ECODE VARCHAR(11);

DECLARE UNI_START INT DEFAULT 0;

DECLARE UNI_END INT ;

SET ECODE 		:= (SELECT equip_code FROM master_equipment WHERE equip_id = EID);

SET UNI_START 	:= (SELECT COUNT(*) FROM equip_uniquecode WHERE equip_id = EID);

SET UNI_START 	:= UNI_START + 01;

SET UNI_END 	:= UNI_START + PURSCHQTY;

L1:LOOP
	
	IF UNI_START >=  UNI_END 
	
		THEN LEAVE L1;
	   
	END IF;
		
	INSERT INTO equip_uniquecode (purchase_sch_id, equip_id, equip_unique_code) VALUES (PURSCHID,EID,CONCAT_WS('/',ECODE,UNI_START));
		
	SET UNI_START := UNI_START + 01;

END LOOP L1;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_EST_SCHEME_AMT
DROP PROCEDURE IF EXISTS `P_EST_SCHEME_AMT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_EST_SCHEME_AMT`(IN `SSID` INT)
BEGIN

SELECT 

	T4.sanction_order_id,
	
	T4.sanction_no,
	
	T3.sanction_project_id,
	
	T3.project_name,
	
	T1.sanction_scheme_id,
	
	T1.scheme_name,
	
	COUNT(T2.sanction_equip_id) TOT_ITEMS_BYSSID,
	
	IFNULL(SUM(T2.sanction_equip_qty * T2.sanction_fund_amt),0) TOT_EST_SCHAMT,
	
	(SELECT IFNULL(SUM(SQ1.fund_dd_amt),0) FROM sanction_fund_received AS SQ1 WHERE SQ1.sanction_scheme_id = T5.sanction_scheme_id) AS TOT_RECAMT_BYSSID,
	
	(IFNULL(SUM(T2.sanction_equip_qty * T2.sanction_fund_amt),0) -
	
	(SELECT IFNULL(SUM(SQ1.fund_dd_amt),0) FROM sanction_fund_received AS SQ1 WHERE SQ1.sanction_scheme_id = T5.sanction_scheme_id) ) AS  BAL_ESTAMT_BYSSID

FROM v_sanction_order_schemes AS T1

LEFT JOIN sanction_equip AS T2 ON (T2.sanction_scheme_id = T1.sanction_scheme_id)
   
LEFT JOIN v_sanction_order_projects AS T3 ON (T3.sanction_project_id = T1.sanction_project_id)
   
LEFT JOIN v_sanction_order AS T4 ON (T4.sanction_order_id = T3.sanction_order_id)
   
LEFT JOIN sanction_fund_received AS T5 ON (T5.sanction_scheme_id = T1.sanction_scheme_id)

WHERE T1.sanction_scheme_id = SSID

GROUP BY T2.sanction_scheme_id;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_ExclaimRefund
DROP PROCEDURE IF EXISTS `P_ExclaimRefund`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_ExclaimRefund`(
	IN `INVID` INT,
	IN `Refund` DECIMAL(10,2)
)
BEGIN

INSERT INTO refund_transaction (

	invoice_id, 
	
	refund_type, 
	
	refund) 
	
	VALUES
	
	(
		INVID, 
		
		2, 
		
		Refund
		
	);


END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_GEN_ASSETCODE
DROP PROCEDURE IF EXISTS `P_GEN_ASSETCODE`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_GEN_ASSETCODE`(
	IN `INVITEM_ID` INT,
	IN `INVITEM_QTY` INT,
	IN `WP` INT,
	IN `PMV` INT,
	IN `ECODE` VARCHAR(50),
	IN `INSTALL_DT` DATE
)
BEGIN

DECLARE RUN_NO INT DEFAULT 1;

DECLARE ASSET_CODE VARCHAR(500);

-- FOR PM SCHEDULE

DECLARE ASTID INT;

DECLARE PMV_NO INT DEFAULT 1;

DECLARE PMV_LIMIT INT DEFAULT 0;

DECLARE SCH_INTERVAL INT DEFAULT 0;

DECLARE INTERVAL_TERM INT DEFAULT 0;

-- SET SCHEDULE VAL

SET PMV_LIMIT  := WP * PMV;

SET SCH_INTERVAL := 12/PMV;

SET INTERVAL_TERM := 12/PMV;
	
WHILE RUN_NO <=  INVITEM_QTY DO
	
	SET ASSET_CODE := (SELECT CONCAT(ECODE,'/',INVITEM_ID,'/',RUN_NO));
		
 	INSERT INTO service_assetcode (invitem_id, invitem_qty, warranty, pmv_year, asset_code) VALUES (INVITEM_ID, INVITEM_QTY, WP, PMV, ASSET_CODE);
	
	SET ASTID  := LAST_INSERT_ID();
	
	L2:LOOP
	
		IF PMV_NO >  PMV_LIMIT
		
			THEN LEAVE L2;
		   
		END IF;
			
-- 	INSERT INTO service_pmvisit (invitem_id, pmv_limit, pmv_no, asset_id, pmv_schedule) VALUES (INVITEM_ID, PMV_LIMIT, PMV_NO, AID, DATE_ADD(INSTALL_DT, INTERVAL SCH_INTERVAL MONTH));

		IF PMV > 0 THEN

			INSERT INTO service_pmvisit (invitem_id, pmv_limit, pmv_no, asset_id, install_dt, asset_code,pmv_schedule) VALUES (INVITEM_ID, PMV_LIMIT, PMV_NO, ASTID, INSTALL_DT, ASSET_CODE, DATE_ADD(INSTALL_DT, INTERVAL SCH_INTERVAL MONTH));
				
			SET PMV_NO := PMV_NO + 1;
			
			SET SCH_INTERVAL := SCH_INTERVAL + INTERVAL_TERM;
		
		END IF;

	END LOOP L2;
	
		
	SET RUN_NO := RUN_NO + 1;	
	
	-- RESET 
	
	SET PMV_NO := 1;	
	
	SET SCH_INTERVAL := 12/PMV;

END WHILE;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_GEN_BREAKDOWNREGID
DROP PROCEDURE IF EXISTS `P_GEN_BREAKDOWNREGID`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_GEN_BREAKDOWNREGID`(
	IN `REFID` INT,
	IN `YRID` DATE
)
BEGIN

	DECLARE CURRENT_NO INT(11);
	
	SET CURRENT_NO := (SELECT COALESCE(MAX(T1.complaint_run_no), 0) + 1 FROM service_complaints AS T1 WHERE T1.complaint_receive_on BETWEEN (SELECT S1.start_date FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date) AND (SELECT S1.end_date FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date));
	
	
	UPDATE service_complaints 
	
		SET complaint_run_no = CURRENT_NO, 
		
			     complaint_no = CONCAT(CURRENT_NO,'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date))
	
	WHERE complaint_id = REFID;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_GEN_EUID
DROP PROCEDURE IF EXISTS `P_GEN_EUID`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_GEN_EUID`(
	IN `ID` INT
)
    COMMENT 'For Institutitution - Equip Unique Identification'
BEGIN

	UPDATE ins_stock AS T1 SET T1.stock_euid = CONCAT(T1.institution_id, "/", T1.stock_id) WHERE T1.stock_id = ID;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_GEN_INSASSET
DROP PROCEDURE IF EXISTS `P_GEN_INSASSET`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_GEN_INSASSET`(
	IN `ID` INT
)
BEGIN

DECLARE RUN_NO INT DEFAULT 1;

DECLARE ASSET_CODE VARCHAR(500);

DECLARE QTY INT;

SET QTY 	:= (SELECT stock_qty FROM ins_stock WHERE stock_id = ID);

-- FOR GENERATE ASSET_CODE

WHILE RUN_NO <= QTY DO
	
	SET ASSET_CODE := (SELECT CONCAT("I",ID,'/',RUN_NO));
		
 	INSERT INTO ins_assetcode (stock_id, stock_qty, ins_asset_code) VALUES (ID, QTY, ASSET_CODE);
	
	SET RUN_NO := RUN_NO + 1;	

END WHILE;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_GEN_ITCOMPLAINTID
DROP PROCEDURE IF EXISTS `P_GEN_ITCOMPLAINTID`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_GEN_ITCOMPLAINTID`(
	IN `ID` INT
)
BEGIN

	DECLARE CURRENT_NO INT(11);
	
	SET CURRENT_NO := (SELECT COALESCE(MAX(T1.complaint_run_no), 0) + 1 FROM it_equip_complaints AS T1 WHERE T1.it_complaint_raised_on BETWEEN (SELECT S1.start_date FROM master_financial_year AS S1 WHERE NOW() BETWEEN start_date AND end_date) AND (SELECT S1.end_date FROM master_financial_year AS S1 WHERE NOW() BETWEEN start_date AND end_date));
	
	
	UPDATE it_equip_complaints 
	
		SET complaint_run_no = CURRENT_NO, 
		
			 complaint_no = CONCAT(CURRENT_NO,'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE NOW() BETWEEN start_date AND end_date))
	
	WHERE it_equip_complaint_id = ID;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_GEN_ITCOMPLAINTNO
DROP PROCEDURE IF EXISTS `P_GEN_ITCOMPLAINTNO`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_GEN_ITCOMPLAINTNO`(
	IN `ID` INT
)
    COMMENT 'Generate Complaint No ( IT )'
BEGIN

	DECLARE CURRENT_NO INT(11);
	
	SET CURRENT_NO := (SELECT COALESCE(MAX(T1.complaint_run_no), 0) + 1 FROM it_complaints AS T1 WHERE T1.it_complaint_raised_on BETWEEN (SELECT S1.cal_start FROM master_financial_year AS S1 WHERE NOW() BETWEEN cal_start AND cal_end) AND (SELECT S1.cal_end FROM master_financial_year AS S1 WHERE NOW() BETWEEN cal_start AND cal_end));
		
	UPDATE it_complaints 
	
		SET complaint_run_no = CURRENT_NO, 
		
			 complaint_no = CONCAT(CURRENT_NO,'/',(SELECT S1.start_year FROM master_financial_year AS S1 WHERE NOW() BETWEEN cal_start AND cal_end))
	
	WHERE it_complaint_id = ID;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_GEN_MRC
DROP PROCEDURE IF EXISTS `P_GEN_MRC`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_GEN_MRC`(
	IN `INVID` INT
)
BEGIN


	DECLARE INSID INT(11);
	DECLARE MRC_NO INT(11);	
	
	SET INSID  := (SELECT  T3.institution_id FROM invoice AS T1 INNER JOIN sanction_allotment AS T3 ON (T3.sanction_allotment_id = T1.sanction_allotment_id) WHERE T1.invoice_id = INVID);	
	SET MRC_NO := (SELECT 
							COALESCE(MAX(t1.mrc_no)+1, 1) 
						FROM invoice_mrc AS t1 
						WHERE t1.institution_id = INSID AND t1.fin_year = (SELECT S1.fn_year FROM master_financial_year AS S1 WHERE CURDATE() BETWEEN S1.start_date AND S1.end_date));

	INSERT INTO invoice_mrc (
	
		invoice_id, 		
		mrc_no,
		fin_year,
		institution_id, 		
		institution_name, 		
		procure_name, 
		supplier_id, 
		supplier_name, 
		purchase_id, 
		purchase_no, 
		purchase_date
		
	)
		
	(
	
		SELECT 
		
			T1.invoice_id,
			
			MRC_NO,
			
			(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE CURDATE() BETWEEN S1.start_date AND S1.end_date),
			
			T3.institution_id,
		
			(SELECT S1.institution_name FROM master_institution AS S1 WHERE S1.institution_id = T3.institution_id) AS Location, 
			
			(SELECT REPLACE(S2.procure_name, "PROCUREMENT FOR ", "") FROM procure_details AS S2 WHERE S2.procure_id  = T2.procure_id) AS Tender,
			
			T4.supplier_id,
			
			(SELECT S3.supplier_name FROM master_supplier AS S3 WHERE S3.supplier_id = T4.supplier_id),
			
			T2.purchase_id,
			
			T2.purchase_no,
			
			T2.purchase_date
	
		FROM invoice AS T1
		
		INNER JOIN purchase_order AS T2 ON (T2.purchase_id = T1.purchase_id) 
		
		INNER JOIN sanction_allotment AS T3 ON (T3.sanction_allotment_id = T1.sanction_allotment_id)
		
		INNER JOIN bidder_details AS T4 ON (T4.bidder_id = T2.bidder_id)
	
		WHERE T1.invoice_id = INVID
		
	);

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_GEN_PMVSCHEDULE
DROP PROCEDURE IF EXISTS `P_GEN_PMVSCHEDULE`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_GEN_PMVSCHEDULE`(IN `INVIID` INT, IN `AID` INT)
BEGIN

DECLARE WARRANTY INT DEFAULT 0;

DECLARE PMV_TERM INT DEFAULT 0;

DECLARE START_DT DATE;

DECLARE PMV_LIMIT INT DEFAULT 0;

DECLARE SCH_INTERVAL INT DEFAULT 0;

DECLARE PMV_NO INT DEFAULT 0;

DECLARE INTERVAL_TERM INT DEFAULT 0;

DECLARE PMV_SCH DATE;

SET WARRANTY 	:= (SELECT DISTINCT T1.warranty_period FROM v_invoice AS T1 WHERE T1.invitem_id  = INVIID);

SET PMV_TERM 	:= (SELECT DISTINCT T1.min_pmvisit FROM v_invoice AS T1 WHERE T1.invitem_id  = INVIID);

SET START_DT 	:= (SELECT DISTINCT (CASE WHEN T1.install_report_req = 1 THEN T1.supply_date ELSE T1.install_date END) FROM v_invoice AS T1 WHERE T1.invoice_id = INVIID);

SET PMV_LIMIT  := WARRANTY * PMV_TERM;

SET SCH_INTERVAL := 12/PMV_TERM;

SET INTERVAL_TERM := 12/PMV_TERM;

SET PMV_NO := 1;

-- SET PMV_SCH := SELECT DATE_ADD(START_DT, INTERVAL SCH_INTERVAL MONTH);

L1:LOOP
	
	IF PMV_NO >  PMV_LIMIT 
	
		THEN LEAVE L1;
	   
	END IF;
		
	INSERT INTO service_pmvisit (invitem_id,asset_id,pmv_no,pmv_schedule) VALUES (INVIID,AID,PMV_NO,DATE_ADD(START_DT, INTERVAL SCH_INTERVAL MONTH));
		
	SET PMV_NO := PMV_NO + 01;
	
	SET SCH_INTERVAL := SCH_INTERVAL + INTERVAL_TERM;

END LOOP L1;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_GEN_PROFORMA
DROP PROCEDURE IF EXISTS `P_GEN_PROFORMA`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_GEN_PROFORMA`(
	IN `PFID` INT
)
BEGIN

DECLARE PFNO INT;

-- SET PFNO := (PFID - 791);

-- SET PFNO := (PFID - 1125);

	SET PFNO := (PFID - 1505);
		
	UPDATE proforma_invoice 
	
		SET  proforma_no = CONCAT(PFNO,'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE CURDATE() BETWEEN S1.start_date AND S1.end_date))
	
	WHERE proforma_id = PFID;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_GEN_SALEINVOICE
DROP PROCEDURE IF EXISTS `P_GEN_SALEINVOICE`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_GEN_SALEINVOICE`(IN `TYP` INT, IN `INVID` INT, IN `SIID` INT
)
BEGIN

	DECLARE SaleInvoiceNo VARCHAR(500) DEFAULT '';
	
	DECLARE PurchaseNo VARCHAR(500) DEFAULT '';
	
	DECLARE PurchaseDate DATE DEFAULT '';
	
	DECLARE Supplier VARCHAR(500) DEFAULT '';
	
	DECLARE Scheme VARCHAR(500) DEFAULT '';
	
	DECLARE BuyerOrderRef VARCHAR(500) DEFAULT '';
	
	DECLARE 	BilledToId int DEFAULT '';
	
	DECLARE BilledTo VARCHAR(500) DEFAULT '';
	
	DECLARE ItemDescription VARCHAR(500) DEFAULT '';		
	
	DECLARE TaxableValue decimal(20,2) DEFAULT 0.00;

	DECLARE KMSCLServiceCh decimal(20,2) DEFAULT 0.00;

	DECLARE KMSCLServiceTax decimal(20,2) DEFAULT 0.00;
	
	DECLARE GST5  decimal(20,2) DEFAULT 0.00;

	DECLARE GST12 decimal(20,2) DEFAULT 0.00;

	DECLARE GST18 decimal(20,2) DEFAULT 0.00;

	DECLARE GST28 decimal(20,2) DEFAULT 0.00;
	
	IF (TYP = 1) THEN  # Generate Sale Invoice
	
		BEGIN
		
		# Cursor Declaration
		
		DECLARE SaleInvoiceValue CURSOR FOR 	
			
		# SELECT 1 AS PurchaseNo, 2 AS BuyerOrderRef, 3 AS BilledTo, 4 AS ItemDescription, 5 AS TaxableValue, 6 AS KMSCLServiceCh, 7 AS KMSCLServiceTax, 8 AS GST5, 9 AS GST12, 10 AS GST18, 11 AS GST28; 
		
		SELECT 
				
			(SELECT 
			
				CONCAT("KMSCL/EP/", LPAD(COALESCE(MAX(ST1.sale_invoice_id),0) + 1, 4,0), "/", YEAR(CURDATE())) 
				
			FROM sale_invoice AS ST1) AS SaleInvoiceNo,		
			
			(CASE 
			
				WHEN T2.dealer_id IS NULL
				
					THEN (SELECT S2.supplier_name FROM bidder_details AS S1 INNER JOIN master_supplier AS S2 ON (S2.supplier_id = S1.supplier_id) WHERE S1.bidder_id = T2.bidder_id)
					
				WHEN T2.dealer_id IS NOT NULL	
				
					THEN (SELECT S2.supplier_name FROM dealer_details AS S1 INNER JOIN master_supplier AS S2 ON (S2.supplier_id = S1.supplier_id) WHERE S1.dealer_id = T2.dealer_id)
					
				WHEN T2.govtagency_id IS NOT NULL	
			
					THEN (SELECT S2.supplier_name FROM govtagency_list AS S1 INNER JOIN master_supplier AS S2 ON (S2.supplier_id = S1.supplier_id) WHERE S1.govtagency_id  = T2.govtagency_id)
				
			END) AS Supplier,	

			T2.purchase_no AS PurchaseNo,
			
			T2.purchase_date AS PurchaseDate,
			
			IF(T2.purchase_type <> 4, 
			
					(SELECT 
					
						DISTINCT CONCAT_WS(", ",(SELECT W2.scheme_name FROM sanction_order_schemes AS W1 INNER JOIN master_scheme AS W2 ON (W2.scheme_master_id = W1.scheme_master_id) WHERE W1.sanction_scheme_id = S4.sanction_scheme_id))
						
					FROM invoice_items AS S1 
					
					INNER JOIN purchase_schedule AS S2 ON (S2.purchase_sch_id = S1.purchase_sch_id) 
					
					INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) 
					
					INNER JOIN sanction_equip AS S4 ON (S4.sanction_equip_id = S3.sanction_equip_id) 
					
					WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id),
					
					(SELECT 
					
						DISTINCT CONCAT_WS(", ",(SELECT W2.scheme_name FROM sanction_order_schemes AS W1 INNER JOIN master_scheme AS W2 ON (W2.scheme_master_id = W1.scheme_master_id) WHERE W1.sanction_scheme_id = S4.sanction_scheme_id))
						
					FROM invoice_items AS S1 
					
					INNER JOIN govtagency_purchase_schedule AS S2 ON (S2.ga_purchase_sch_id = S1.purchase_sch_id) 
					
					INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) 
					
					INNER JOIN sanction_equip AS S4 ON (S4.sanction_equip_id = S3.sanction_equip_id) 
					
					WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id)
					
			) AS Scheme,
			
			IF(T2.purchase_type <> 4, 
			
					(SELECT DISTINCT CONCAT(S4.sanction_no," Dt : ", DATE_FORMAT(S4.sanction_date, "%d-%m-%Y")) FROM invoice_items AS S1 INNER JOIN purchase_schedule AS S2 ON (S2.purchase_sch_id = S1.purchase_sch_id) INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) INNER JOIN sanction_order AS S4 ON (S4.sanction_order_id = S3.sanction_order_id) WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id LIMIT 1),  
					
					(SELECT DISTINCT CONCAT(S4.sanction_no," Dt : ", DATE_FORMAT(S4.sanction_date, "%d-%m-%Y")) FROM invoice_items AS S1 INNER JOIN govtagency_purchase_schedule AS S2 ON (S2.ga_purchase_sch_id = S1.purchase_sch_id) INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) INNER JOIN sanction_order AS S4 ON (S4.sanction_order_id = S3.sanction_order_id) WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id LIMIT 1)
					
			)AS BuyerOrderRef,
			
			IF(T2.purchase_type <> 4, 
			
					(SELECT DISTINCT S4.institution_id FROM invoice_items AS S1 INNER JOIN purchase_schedule AS S2 ON (S2.purchase_sch_id = S1.purchase_sch_id) INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) INNER JOIN master_institution AS S4 ON (S4.institution_id = S3.institution_id) WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id LIMIT 1),  
					
					(SELECT DISTINCT S4.institution_id FROM invoice_items AS S1 INNER JOIN govtagency_purchase_schedule AS S2 ON (S2.ga_purchase_sch_id = S1.purchase_sch_id) INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) INNER JOIN master_institution AS S4 ON (S4.institution_id = S3.institution_id) WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id LIMIT 1)
					
			) AS BilledToId,
			
			IF(T2.purchase_type <> 4, 
			
					(SELECT DISTINCT CONCAT("M/s ", S4.institution_name, ", ", S4.district) FROM invoice_items AS S1 INNER JOIN purchase_schedule AS S2 ON (S2.purchase_sch_id = S1.purchase_sch_id) INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) INNER JOIN master_institution AS S4 ON (S4.institution_id = S3.institution_id) WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id LIMIT 1),  
					
					(SELECT DISTINCT CONCAT("M/s ", S4.institution_name, ", ", S4.district) FROM invoice_items AS S1 INNER JOIN govtagency_purchase_schedule AS S2 ON (S2.ga_purchase_sch_id = S1.purchase_sch_id) INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) INNER JOIN master_institution AS S4 ON (S4.institution_id = S3.institution_id) WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id LIMIT 1)
					
			) AS BilledTo,
			
			IF(T2.purchase_type <> 4, 
			
				(SELECT REPLACE(S5.procure_name, "PROCUREMENT FOR ", "")  FROM procure_details AS S5 WHERE S5.procure_id = T2.procure_id), 
				
				(SELECT S6.equip_name FROM govtagency_items AS S5 INNER JOIN master_equipment AS S6 ON(S6.equip_id = S5.equip_id) WHERE S5.govtagency_item_id = T2.govtagency_item_id)
				
			) AS ItemDescription,
			
			(SELECT SUM(R1.invitem_unitprice * (100/(R1.cgst_ratio + R1.sgst_ratio + R1.igst_ratio + 100)) * R1.invitem_qty) FROM invoice_items AS R1 WHERE R1.invoice_id  = T1.invoice_id) AS TaxableValue,
			
				(SELECT SUM(R1.invitem_unitprice * (100/(R1.cgst_ratio + R1.sgst_ratio + R1.igst_ratio + 100)) * R1.invitem_qty * 0.07) FROM invoice_items AS R1 WHERE R1.invoice_id  = T1.invoice_id) AS KMSCLServiceCh,
			
				(SELECT SUM(R1.invitem_unitprice * (100/(R1.cgst_ratio + R1.sgst_ratio + R1.igst_ratio + 100)) * R1.invitem_qty * 0.07 * 0.18) FROM invoice_items AS R1 WHERE R1.invoice_id  = T1.invoice_id) AS KMSCLServiceTax,
				
				IF(T1.gst_type = "CSGST", 
				
					COALESCE((SELECT 
					
						SUM(G5.invitem_unitprice * (100/(G5.cgst_ratio + G5.sgst_ratio + G5.igst_ratio + 100)) * G5.invitem_qty * 0.05)
					
					FROM invoice_items AS G5 WHERE G5.invoice_id = T1.invoice_id AND G5.cgst_ratio = 2.5 AND G5.sgst_ratio = 2.5), 0) ,
					
					COALESCE((SELECT SUM(G5.invitem_unitprice * (100/(G5.cgst_ratio + G5.sgst_ratio + G5.igst_ratio + 100)) * G5.invitem_qty * 0.05) FROM invoice_items AS G5 WHERE G5.invoice_id = T1.invoice_id AND G5.igst_ratio = 5), 0)
					
				) AS GST5,
					
				IF(T1.gst_type = "CSGST", 
				
					COALESCE((SELECT 
					
						SUM(G12.invitem_unitprice * (100/(G12.cgst_ratio + G12.sgst_ratio + G12.igst_ratio + 100)) * G12.invitem_qty * 0.12)
					
					FROM invoice_items AS G12 WHERE G12.invoice_id = T1.invoice_id AND G12.cgst_ratio = 6 AND G12.sgst_ratio = 6), 0),
					
					COALESCE((SELECT SUM(G12.invitem_unitprice * (100/(G12.cgst_ratio + G12.sgst_ratio + G12.igst_ratio + 100)) * G12.invitem_qty * 0.12) FROM invoice_items AS G12 WHERE G12.invoice_id = T1.invoice_id AND G12.igst_ratio = 12), 0)
					
				) AS GST12,
				
				IF(T1.gst_type = "CSGST", 
				
					COALESCE((SELECT 
					
						SUM(G18.invitem_unitprice * (100/(G18.cgst_ratio + G18.sgst_ratio + G18.igst_ratio + 100)) * G18.invitem_qty * 0.18)
					
					FROM invoice_items AS G18 WHERE G18.invoice_id = T1.invoice_id AND G18.cgst_ratio = 9 AND G18.sgst_ratio = 9), 0),
					
					COALESCE((SELECT SUM(G18.invitem_unitprice * (100/(G18.cgst_ratio + G18.sgst_ratio + G18.igst_ratio + 100)) * G18.invitem_qty * 0.18) FROM invoice_items AS G18 WHERE G18.invoice_id = T1.invoice_id AND G18.igst_ratio = 18), 0)
					
				) AS GST18,
				
				IF(T1.gst_type = "CSGST", 
				
					COALESCE((SELECT 
					
						SUM(G28.invitem_unitprice * (100/(G28.cgst_ratio + G28.sgst_ratio + G28.igst_ratio + 100)) * G28.invitem_qty * 0.28)
					
					FROM invoice_items AS G28 WHERE G28.invoice_id = T1.invoice_id AND G28.cgst_ratio = 14 AND G28.sgst_ratio = 14), 0),
					
					COALESCE((SELECT SUM(G28.invitem_unitprice * (100/(G28.cgst_ratio + G28.sgst_ratio + G28.igst_ratio + 100)) * G28.invitem_qty * 0.28) FROM invoice_items AS G28 WHERE G28.invoice_id = T1.invoice_id AND G28.igst_ratio = 28), 0)
					
				) AS GST28
		
			FROM invoice AS T1 
			
		INNER JOIN purchase_order AS T2 ON (T2.purchase_id = T1.purchase_id)
		
		WHERE T1.invoice_id = INVID
		
		GROUP BY T1.invoice_id;
		
		# Open Cursor
			
		OPEN SaleInvoiceValue;
			
		# Fetch Cursor	
			
		FETCH SaleInvoiceValue INTO SaleInvoiceNo, Supplier, PurchaseNo, PurchaseDate, Scheme, BuyerOrderRef, BilledToId, BilledTo, ItemDescription, TaxableValue, KMSCLServiceCh, KMSCLServiceTax, GST5, GST12, GST18, GST28;		
			
		# Insert Values	
			
		INSERT INTO sale_invoice (sale_invoice_no, sale_invoice_date, invoice_id, supplier, purchase_no, purchase_date, scheme, sanction_order_no, institution_id, institution_name, item_description, item_taxable_amount, kmscl_service_charge, kmscl_service_tax, gst5, gst12, gst18, gst28)
		
			VALUES (SaleInvoiceNo, CURDATE(), INVID, Supplier, PurchaseNo, PurchaseDate, Scheme, BuyerOrderRef, BilledToId, BilledTo, ItemDescription, TaxableValue, KMSCLServiceCh, KMSCLServiceTax, GST5, GST12, GST18, GST28);
		
		# Close Cursor
				
		CLOSE SaleInvoiceValue;		
	
		END;	
	
	ELSEIF (TYP = 2) THEN  # Regenerate Sale Invoice
	
		BEGIN
		
		# Cursor Declaration
		
		DECLARE SaleInvoiceValue CURSOR FOR 	
		
		SELECT 
		
				IF(T2.purchase_type <> 4, 
			
					(SELECT 
					
						DISTINCT CONCAT_WS(", ",(SELECT W2.scheme_name FROM sanction_order_schemes AS W1 INNER JOIN master_scheme AS W2 ON (W2.scheme_master_id = W1.scheme_master_id) WHERE W1.sanction_scheme_id = S4.sanction_scheme_id))
						
					FROM invoice_items AS S1 
					
					INNER JOIN purchase_schedule AS S2 ON (S2.purchase_sch_id = S1.purchase_sch_id) 
					
					INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) 
					
					INNER JOIN sanction_equip AS S4 ON (S4.sanction_equip_id = S3.sanction_equip_id) 
					
					WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id),
					
				  (SELECT 
					
						DISTINCT CONCAT_WS(", ",(SELECT W2.scheme_name FROM sanction_order_schemes AS W1 INNER JOIN master_scheme AS W2 ON (W2.scheme_master_id = W1.scheme_master_id) WHERE W1.sanction_scheme_id = S4.sanction_scheme_id))
						
					FROM invoice_items AS S1 
					
					INNER JOIN govtagency_purchase_schedule AS S2 ON (S2.ga_purchase_sch_id = S1.purchase_sch_id) 
					
					INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) 
					
					INNER JOIN sanction_equip AS S4 ON (S4.sanction_equip_id = S3.sanction_equip_id) 
					
					WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id)
					
			) AS Scheme,
					
				IF(T2.purchase_type <> 4, 
				
						(SELECT DISTINCT CONCAT(S4.sanction_no," Dt : ", DATE_FORMAT(S4.sanction_date, "%d-%m-%Y")) FROM invoice_items AS S1 INNER JOIN purchase_schedule AS S2 ON (S2.purchase_sch_id = S1.purchase_sch_id) INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) INNER JOIN sanction_order AS S4 ON (S4.sanction_order_id = S3.sanction_order_id) WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id LIMIT 1),  
						
						(SELECT DISTINCT CONCAT(S4.sanction_no," Dt : ", DATE_FORMAT(S4.sanction_date, "%d-%m-%Y")) FROM invoice_items AS S1 INNER JOIN govtagency_purchase_schedule AS S2 ON (S2.ga_purchase_sch_id = S1.purchase_sch_id) INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) INNER JOIN sanction_order AS S4 ON (S4.sanction_order_id = S3.sanction_order_id) WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id LIMIT 1)
						
				)AS BuyerOrderRef,
				
			IF(T2.purchase_type <> 4, 
			
					(SELECT DISTINCT S4.institution_id FROM invoice_items AS S1 INNER JOIN purchase_schedule AS S2 ON (S2.purchase_sch_id = S1.purchase_sch_id) INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) INNER JOIN master_institution AS S4 ON (S4.institution_id = S3.institution_id) WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id LIMIT 1),  
					
					(SELECT DISTINCT S4.institution_id FROM invoice_items AS S1 INNER JOIN govtagency_purchase_schedule AS S2 ON (S2.ga_purchase_sch_id = S1.purchase_sch_id) INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) INNER JOIN master_institution AS S4 ON (S4.institution_id = S3.institution_id) WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id LIMIT 1)
					
			) AS BilledToId,
			
			IF(T2.purchase_type <> 4, 
			
					(SELECT DISTINCT CONCAT("M/s ", S4.institution_name, ", ", S4.district) FROM invoice_items AS S1 INNER JOIN purchase_schedule AS S2 ON (S2.purchase_sch_id = S1.purchase_sch_id) INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) INNER JOIN master_institution AS S4 ON (S4.institution_id = S3.institution_id) WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id LIMIT 1),  
					
					(SELECT DISTINCT CONCAT("M/s ", S4.institution_name, ", ", S4.district) FROM invoice_items AS S1 INNER JOIN govtagency_purchase_schedule AS S2 ON (S2.ga_purchase_sch_id = S1.purchase_sch_id) INNER JOIN sanction_allotment AS S3 ON(S3.sanction_allotment_id = S2.sanction_allotment_id) INNER JOIN master_institution AS S4 ON (S4.institution_id = S3.institution_id) WHERE S1.invoice_id = T1.invoice_id AND S2.purchase_id = T2.purchase_id LIMIT 1)
					
			) AS BilledTo,
				
				IF(T2.purchase_type <> 4, 
				
					(SELECT REPLACE(S5.procure_name, "PROCUREMENT FOR ", "")  FROM procure_details AS S5 WHERE S5.procure_id = T2.procure_id), 
					
					(SELECT S6.equip_name FROM govtagency_items AS S5 INNER JOIN master_equipment AS S6 ON(S6.equip_id = S5.equip_id) WHERE S5.govtagency_item_id = T2.govtagency_item_id)
					
				) AS ItemDescription,
				
				(SELECT SUM(R1.invitem_unitprice * (100/(R1.cgst_ratio + R1.sgst_ratio + R1.igst_ratio + 100)) * R1.invitem_qty) FROM invoice_items AS R1 WHERE R1.invoice_id  = T1.invoice_id) AS TaxableValue,
			
				(SELECT SUM(R1.invitem_unitprice * (100/(R1.cgst_ratio + R1.sgst_ratio + R1.igst_ratio + 100)) * R1.invitem_qty * 0.07) FROM invoice_items AS R1 WHERE R1.invoice_id  = T1.invoice_id) AS KMSCLServiceCh,
			
				(SELECT SUM(R1.invitem_unitprice * (100/(R1.cgst_ratio + R1.sgst_ratio + R1.igst_ratio + 100)) * R1.invitem_qty * 0.07 * 0.18) FROM invoice_items AS R1 WHERE R1.invoice_id  = T1.invoice_id) AS KMSCLServiceTax,
				
				IF(T1.gst_type = "CSGST", 
				
					COALESCE((SELECT 
					
						SUM(G5.invitem_unitprice * (100/(G5.cgst_ratio + G5.sgst_ratio + G5.igst_ratio + 100)) * G5.invitem_qty * 0.05)
					
					FROM invoice_items AS G5 WHERE G5.invoice_id = T1.invoice_id AND G5.cgst_ratio = 2.5 AND G5.sgst_ratio = 2.5), 0),
					
					COALESCE((SELECT SUM(G5.invitem_unitprice * (100/(G5.cgst_ratio + G5.sgst_ratio + G5.igst_ratio + 100)) * G5.invitem_qty * 0.05) FROM invoice_items AS G5 WHERE G5.invoice_id = T1.invoice_id AND G5.igst_ratio = 5), 0)
					
				) AS GST5,
					
				IF(T1.gst_type = "CSGST", 
				
					COALESCE((SELECT 
					
						SUM(G12.invitem_unitprice * (100/(G12.cgst_ratio + G12.sgst_ratio + G12.igst_ratio + 100)) * G12.invitem_qty * 0.12)
					
					FROM invoice_items AS G12 WHERE G12.invoice_id = T1.invoice_id AND G12.cgst_ratio = 6 AND G12.sgst_ratio = 6), 0),
					
					COALESCE((SELECT SUM(G12.invitem_unitprice * (100/(G12.cgst_ratio + G12.sgst_ratio + G12.igst_ratio + 100)) * G12.invitem_qty * 0.12) FROM invoice_items AS G12 WHERE G12.invoice_id = T1.invoice_id AND G12.igst_ratio = 12), 0)
					
				) AS GST12,
				
				IF(T1.gst_type = "CSGST", 
				
					COALESCE((SELECT 
					
						SUM(G18.invitem_unitprice * (100/(G18.cgst_ratio + G18.sgst_ratio + G18.igst_ratio + 100)) * G18.invitem_qty * 0.18)
					
					FROM invoice_items AS G18 WHERE G18.invoice_id = T1.invoice_id AND G18.cgst_ratio = 9 AND G18.sgst_ratio = 9), 0),
					
					COALESCE((SELECT SUM(G18.invitem_unitprice * (100/(G18.cgst_ratio + G18.sgst_ratio + G18.igst_ratio + 100)) * G18.invitem_qty * 0.18) FROM invoice_items AS G18 WHERE G18.invoice_id = T1.invoice_id AND G18.igst_ratio = 18), 0)
					
				) AS GST18,
				
				IF(T1.gst_type = "CSGST", 
				
					COALESCE((SELECT 
					
						SUM(G28.invitem_unitprice * (100/(G28.cgst_ratio + G28.sgst_ratio + G28.igst_ratio + 100)) * G28.invitem_qty * 0.28)
					
					FROM invoice_items AS G28 WHERE G28.invoice_id = T1.invoice_id AND G28.cgst_ratio = 14 AND G28.sgst_ratio = 14), 0),
					
					COALESCE((SELECT SUM(G28.invitem_unitprice * (100/(G28.cgst_ratio + G28.sgst_ratio + G28.igst_ratio + 100)) * G28.invitem_qty * 0.28) FROM invoice_items AS G28 WHERE G28.invoice_id = T1.invoice_id AND G28.igst_ratio = 28), 0)
					
				) AS GST28
			
			FROM invoice AS T1 
			
			INNER JOIN purchase_order AS T2 ON (T2.purchase_id = T1.purchase_id)
			
			WHERE T1.invoice_id = (SELECT W.invoice_id FROM sale_invoice AS W WHERE W.sale_invoice_id = SIID)
			
			GROUP BY T1.invoice_id;
			
			# Open Cursor
			
			OPEN SaleInvoiceValue;
			
			# Fetch Cursor
			
			FETCH SaleInvoiceValue INTO Scheme, BuyerOrderRef, BilledToId, BilledTo, ItemDescription, TaxableValue, KMSCLServiceCh, KMSCLServiceTax, GST5, GST12, GST18, GST28;		
			
			# Update the Value
			
			UPDATE sale_invoice 
			
				SET 
					
					sanction_order_no = BuyerOrderRef,
					
					scheme			= Scheme,
					
					institution_id = BilledToId,
					
					institution_name = BilledTo,
					
					item_description = ItemDescription,
					
					item_taxable_amount = TaxableValue,
					
					kmscl_service_charge = KMSCLServiceCh,
					
					kmscl_service_tax = KMSCLServiceTax,
					
					gst5 = GST5,
					
					gst12 = GST12,
					
					gst18 = GST18,
					
					gst28 = GST28
						
			WHERE sale_invoice_id = SIID;			
				
			# Cursor Close
				
			CLOSE SaleInvoiceValue;
		
		END;

	END IF;	

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_GEN_WIBREAKDOWNREGID
DROP PROCEDURE IF EXISTS `P_GEN_WIBREAKDOWNREGID`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_GEN_WIBREAKDOWNREGID`(
	IN `REFID` INT,
	IN `YRID` DATE
)
BEGIN

	DECLARE CURRENT_NO INT(11);
	
	SET CURRENT_NO := (SELECT MAX(T1.complaint_run_no) + 1 FROM service_complaints_viapo AS T1 WHERE T1.complaint_dt BETWEEN (SELECT S1.start_date FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date) AND (SELECT S1.end_date FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date));
	
	
	UPDATE service_complaints_viapo 
	
		SET complaint_run_no = REFID,
		
			complaint_no = CONCAT(CURRENT_NO,'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date))
	
	WHERE complaint_id = REFID;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_INV_AUTOHOLD
DROP PROCEDURE IF EXISTS `P_INV_AUTOHOLD`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_INV_AUTOHOLD`(IN `INVID` INT










)
BEGIN
	
	DECLARE QTY decimal(20,2) DEFAULT '';
	
	DECLARE ORI_INV CHAR(50) DEFAULT "N";	
	DECLARE GST_KMSCL CHAR(50) DEFAULT "N";	
	DECLARE IS_KMSCLBILLED CHAR(50) DEFAULT "N";
	DECLARE STOCK_ENTRY CHAR(50) DEFAULT "N";
	DECLARE SITE_READY CHAR(50) DEFAULT "Y";
	DECLARE IS_SIGNED CHAR(50) DEFAULT "N";
	
	DEClARE test_cursor CURSOR FOR 
		
	SELECT 
	
		T1.inv_original, T1.gst_kmscl, T1.billedto_kmscl, T1.stock_entry, T1.site_ready, T1.supplier_signed 

	FROM invoice AS T1 WHERE T1.invoice_id = INVID;	
		 
	OPEN test_cursor;
		
	FETCH test_cursor INTO ORI_INV, GST_KMSCL, IS_KMSCLBILLED, STOCK_ENTRY, SITE_READY, IS_SIGNED;	
	
		IF (ORI_INV = "Y" AND GST_KMSCL = "Y" AND IS_KMSCLBILLED = "Y" AND ((STOCK_ENTRY = "Y") OR (STOCK_ENTRY = "N" AND SITE_READY = "N")) AND IS_SIGNED = "Y") && EXISTS (SELECT * FROM invoice_processing WHERE invoice_processing.invoice_id = INVID AND invoice_processing.invoice_process_status = 7)
		
			THEN DELETE FROM invoice_processing WHERE invoice_processing.invoice_id = INVID AND invoice_processing.invoice_process_status = 7;
	
		ELSEIF(ORI_INV <> "Y" OR GST_KMSCL <> "Y" OR IS_KMSCLBILLED <> "Y" OR (STOCK_ENTRY <> "Y" AND SITE_READY = "Y") OR IS_SIGNED <> "Y")
		
			THEN INSERT INTO invoice_processing (invoice_id, recom_percent, invoice_process_status) VALUES (INVID, 100, 7) ON DUPLICATE KEY UPDATE invoice_processing.invoice_process_status = 7;
			
		END IF;	
	
	CLOSE test_cursor;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_INV_CALCLD
DROP PROCEDURE IF EXISTS `P_INV_CALCLD`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_INV_CALCLD`(
	IN `INVITEMID` INT

)
BEGIN
	
	DECLARE QTY decimal(20,2) DEFAULT '';
	
	DECLARE ADDTAMT decimal(20,2) DEFAULT 0.00;
	
	DECLARE UNITRATE decimal(20,2) DEFAULT 0.00;
	
	DECLARE LDPERCENT decimal(20,2) DEFAULT 0.00;	
	
	DEClARE test_cursor CURSOR FOR 
	
		SELECT 
		
				T1.invitem_qty, T1.invitem_addt_charge, T1.invitem_unitprice AS UNIT_PRICE, T1.invitem_ld_percent
				
				-- T2.UNIT_PRICE

		FROM invoice_items AS T1 
		 
		-- LEFT JOIN v_purchase AS T2 ON (T2.purchase_sch_id = T1.purchase_sch_id) 

		WHERE T1.invitem_id = INVITEMID;	
	 
	OPEN test_cursor;
	
	FETCH test_cursor INTO QTY, ADDTAMT, UNITRATE, LDPERCENT;	
	
		UPDATE invoice_items 
			
			SET invitem_ld_amt = ROUND(((QTY * (ADDTAMT+UNITRATE)) * (LDPERCENT/100)),2)
		
		WHERE invitem_id = INVITEMID;		
	
	CLOSE test_cursor;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_INV_LDCHANGE
DROP PROCEDURE IF EXISTS `P_INV_LDCHANGE`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_INV_LDCHANGE`(IN `INVITEMID` INT, IN `LDBY` INT)
BEGIN

	DECLARE TIMETAKEN INT DEFAULT '';
	
	DECLARE DELAY INT DEFAULT '';
	
	DECLARE INVLD decimal(20,2) DEFAULT 0.00;
	
	DECLARE CLAIM_AMT decimal(20,2) DEFAULT 0.00;		
		
	DECLARE inv_ldparamchange CURSOR FOR 
	
		SELECT 
		
			(CASE 
			
				WHEN LDBY = 1 THEN 
			
					DATEDIFF(T1.install_date,T3.purchase_date) 
			
				ELSE  
			
					DATEDIFF(T1.supply_date,T3.purchase_date) 
				
			END)AS TIMETAKEN_DAYS,
			
			(CASE 
					
				WHEN LDBY = 1 THEN 
						
					GREATEST((CEIL(DATEDIFF(T1.install_date,T3.purchase_date)/7) - T5.delivery_period),0) 
				
				ELSE 
				
					GREATEST((CEIL(DATEDIFF(T1.supply_date,T3.purchase_date)/7) - T5.delivery_period),0) 
					
			END)AS DELAY_WEEKS,
					
			(CASE 
			
				WHEN LDBY = 1 THEN
					
					LEAST((GREATEST((CEIL(DATEDIFF(T1.install_date,T3.purchase_date)/7) - T5.delivery_period),0)* T5.ld_min), T5.ld_max)
					
				ELSE 	
				
					LEAST((GREATEST((CEIL(DATEDIFF(T1.supply_date,T3.purchase_date)/7) - T5.delivery_period),0)* T5.ld_min), T5.ld_max) 
					
			END)AS INVLD_PERCENT,
			
			(T1.invitem_qty * (T6.UNIT_PRICE + T1.invitem_addt_charge)) AS CLAIM_AMT

		FROM invoice_items AS T1 
		 
		LEFT JOIN invoice AS T2 on (T2.invoice_id = T1.invoice_id)
				
		LEFT JOIN purchase_order AS T3 ON (T3.purchase_id = T2.purchase_id)
				
		LEFT JOIN v_bidder_details AS T4 ON (T4.procure_id = T3.procure_id)
				
		LEFT JOIN v_procure_details AS T5 ON (T5.procure_id = T4.procure_id)
		
		LEFT JOIN v_purchase AS T6 ON (T6.purchase_sch_id = T1.purchase_sch_id)

		WHERE T1.invitem_id = INVITEMID;	
	 
		OPEN inv_ldparamchange;
		
		FETCH inv_ldparamchange INTO TIMETAKEN, DELAY, INVLD, CLAIM_AMT;		
		
			UPDATE invoice_items 
			
			SET 
			
				time_taken = TIMETAKEN,
				
				delay = DELAY,
				
				invitem_ld_percent = INVLD,
				
				invitem_ld_amt = ((CLAIM_AMT * INVLD) / 100)
		
			WHERE invitem_id = INVITEMID;
		
		CLOSE inv_ldparamchange;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_LOINO_GEN
DROP PROCEDURE IF EXISTS `P_LOINO_GEN`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_LOINO_GEN`(
	IN `LOIID` INT,
	IN `YRID` DATE,
	IN `BID` INT
)
BEGIN

	DECLARE RLOINO CHAR(11);
	
	DECLARE CLOIID INT;
	
-- 	SET CLOIID := (LOIID - 1063);

-- 	SET CLOIID := (LOIID - 1376);

	SET CLOIID := (LOIID - 1550);

	IF (CLOIID < 100 && CLOIID < 10) THEN 
	
		SET RLOINO := CONCAT('00',CLOIID);
	
	ELSEIF (CLOIID < 100 && CLOIID > 10) THEN 
		
			SET RLOINO := CONCAT('0',CLOIID);	
	ELSE		
			SET RLOINO := CLOIID;
	
	END IF;


	UPDATE loi 
	
		SET loi_ref_no = CONCAT('LOI/',RLOINO,'/',
		
		(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',
		
		(SELECT S3.equip_code FROM procure_item_details AS S2 LEFT JOIN master_equipment AS S3 ON (S3.equip_id = S2.equip_id)  WHERE S2.procure_item_id = (

			SELECT R1.PRCIID FROM (SELECT MIN(T1.bidder_equip_id), T1.procure_item_id AS PRCIID FROM bidder_equipments AS T1 WHERE T1.BIDDER_ID = BID) AS R1)
		)
		
		) 
	
	WHERE loi_id = LOIID;
	
END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_PURNO_GEN
DROP PROCEDURE IF EXISTS `P_PURNO_GEN`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_PURNO_GEN`(
	IN `POID` INT,
	IN `YRID` DATE,
	IN `BID` INT,
	IN `PRCTYP` INT,
	IN `OPT` INT
)
    COMMENT 'Generate the purchase order number'
BEGIN

	IF PRCTYP = 1 AND OPT = 1 THEN -- FOR PURCHASE ORDER ( Non Govt Agency )
		
-- 	UPDATE purchase_order SET purchase_no = CONCAT('SO/',(POID - 595),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_bidder_details AS S2 WHERE S2.bidder_id = BID LIMIT 1)) where purchase_id = POID;
--		UPDATE purchase_order SET purchase_no = CONCAT('SO/',(POID - 1705),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_bidder_details AS S2 WHERE S2.bidder_id = BID LIMIT 1)) where purchase_id = POID;
--		UPDATE purchase_order SET purchase_no = CONCAT('SO/',(POID - 3874),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_bidder_details AS S2 WHERE S2.bidder_id = BID LIMIT 1)) where purchase_id = POID;
				
		UPDATE purchase_order 
		
			-- SET purchase_no = CONCAT('SO/',(POID - 5982),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_bidder_details AS S2 WHERE S2.bidder_id = BID LIMIT 1)) 
			
			SET purchase_no = CONCAT('SO/',(POID - 8276),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_bidder_details AS S2 WHERE S2.bidder_id = BID LIMIT 1)) 
			
		WHERE purchase_id = POID;
		
	ELSEIF PRCTYP = 1 AND OPT = 2 THEN	-- FOR PURCHASE ORDER ( Govt Agency )
		
--		UPDATE purchase_order SET purchase_no = CONCAT('SO(G)/',(POID - 595),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_govtagency AS S2 WHERE S2.govtagency_item_id = BID LIMIT 1)) where purchase_id = POID;	
--		UPDATE purchase_order SET purchase_no = CONCAT('SO(G)/',(POID - 1705),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_govtagency AS S2 WHERE S2.govtagency_item_id = BID LIMIT 1)) where purchase_id = POID;	
--		UPDATE purchase_order SET purchase_no = CONCAT('SO(G)/',(POID - 3874),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_govtagency AS S2 WHERE S2.govtagency_item_id = BID LIMIT 1)) where purchase_id = POID;	

		UPDATE purchase_order 
		
			-- SET purchase_no = CONCAT('SO(G)/',(POID - 5982),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_govtagency AS S2 WHERE S2.govtagency_item_id = BID LIMIT 1)) 
			
			SET purchase_no = CONCAT('SO(G)/',(POID - 8276),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_govtagency AS S2 WHERE S2.govtagency_item_id = BID LIMIT 1)) 
			
		WHERE purchase_id = POID;	
			
	ELSEIF PRCTYP = 5 AND OPT = 1 THEN 	-- FOR WORK ORDER ( Non Govt Agency )
		
-- 	UPDATE purchase_order SET purchase_no = CONCAT('WO/',(POID - 595),'/','2017','/',(SELECT S2.equip_code FROM v_bidder_details AS S2 WHERE S2.bidder_id = BID LIMIT 1)) where purchase_id = POID;				
--		UPDATE purchase_order SET purchase_no = CONCAT('WO/',(POID - 1705),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_bidder_details AS S2 WHERE S2.bidder_id = BID LIMIT 1)) where purchase_id = POID;				
--		UPDATE purchase_order SET purchase_no = CONCAT('WO/',(POID - 3874),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_bidder_details AS S2 WHERE S2.bidder_id = BID LIMIT 1)) where purchase_id = POID;				
				
		UPDATE purchase_order 
		
			-- SET purchase_no = CONCAT('WO/',(POID - 5982),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_bidder_details AS S2 WHERE S2.bidder_id = BID LIMIT 1)) 
			
			SET purchase_no = CONCAT('WO/',(POID - 8276),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_bidder_details AS S2 WHERE S2.bidder_id = BID LIMIT 1)) 
			
		WHERE purchase_id = POID;				
				
	ELSEIF PRCTYP = 5 AND OPT = 2 THEN 	-- FOR WORK ORDER ( Govt Agency )				
	
		UPDATE purchase_order 
		
			-- SET purchase_no = CONCAT('WO(G)/',(POID - 5982),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT T2.equip_code FROM govtagency_items AS T1 INNER JOIN master_equipment AS T2 ON (T2.equip_id = T1.equip_id) WHERE T1.govtagency_item_id = BID LIMIT 1))
			
			SET purchase_no = CONCAT('WO(G)/',(POID - 8276),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT T2.equip_code FROM govtagency_items AS T1 INNER JOIN master_equipment AS T2 ON (T2.equip_id = T1.equip_id) WHERE T1.govtagency_item_id = BID LIMIT 1))
		
		WHERE purchase_id = POID;
	
	END IF;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_REFUND_CALC
DROP PROCEDURE IF EXISTS `P_REFUND_CALC`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_REFUND_CALC`(
	IN `INVID` INT,
	IN `DATE_FROM` DATE,
	IN `DATE_TO` DATE,
	IN `DELIVERY_PERIOD` INT,
	OUT `TIME_TAKEN` INT,
	OUT `DELAY` INT,
	OUT `LD_PERCENT` DECIMAL(10,2),
	OUT `LD_AMT` DECIMAL(10,2),
	OUT `REFUND_AMT` DECIMAL(10,2)
)
BEGIN

	SELECT CEIL(ABS(DATEDIFF(DATE_FROM, DATE_TO))) INTO TIME_TAKEN;
	
	SELECT GREATEST(0,(CEIL (ABS(DATEDIFF(DATE_FROM, DATE_TO))/7) - DELIVERY_PERIOD)) INTO DELAY;	
		
	SELECT LEAST(15,GREATEST(0,(CEIL (ABS(DATEDIFF(DATE_FROM, DATE_TO))/7)- DELIVERY_PERIOD )) * 0.5) INTO LD_PERCENT;		
	
	SELECT 	
	
		ROUND( 		
		
			GREATEST(0,
			
				(				
					(SUM(T1.invitem_unitprice) - (SELECT S1.ld_refund FROM invoice AS S1 WHERE S1.invoice_id = T1.invoice_id))* (LEAST(15,GREATEST(0,(CEIL (ABS(DATEDIFF(DATE_FROM, DATE_TO))/7)- DELIVERY_PERIOD )) * 0.5)/100)										
				)				
			)
			
		) INTO LD_AMT
	
	FROM invoice_items AS T1 
		
	WHERE T1.invoice_id = INVID;
	
	SELECT 

		ROUND(
		
			GREATEST(0, 
			
				(
					(SUM(T1.invitem_ld_amt) - (SELECT S1.ld_refund FROM invoice AS S1 WHERE S1.invoice_id = T1.invoice_id) ) - (SUM(T1.invitem_unitprice) * (LEAST(15,GREATEST(0,(CEIL (ABS(DATEDIFF(DATE_FROM, DATE_TO))/7)- DELIVERY_PERIOD )) * 0.5)/100))				
				)		
				
			)	
			
		) INTO REFUND_AMT
	
	FROM invoice_items AS T1 
	
	WHERE T1.invoice_id = INVID;
	
-- SELECT @TIME_TAKEN AS TIME_TAKEN, @DELAY AS DELAY, @LD_PERCENT AS LD_PERCENT, @LD_AMT AS LD_AMT, @REFUND_AMT AS REFUND_AMT;	
	
END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_REFUND_UPDATE
DROP PROCEDURE IF EXISTS `P_REFUND_UPDATE`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_REFUND_UPDATE`(
	IN `INVID` INT,
	IN `DATE_FROM` DATE,
	IN `DATE_TO` DATE,
	IN `DELIVERY_PERIOD` INT,
	OUT `LID` INT
)
BEGIN

INSERT INTO refund_transaction (

	invoice_id, 
	
	refund_type, 
	
	ld_from, 
	
	ld_to, 
	
	delivery_weeks, 
	
	delay, 
	
	ld_percent, 
	
	initial_deduct, 
	
	recalc_deduct, 
	
	refund) 
	
	VALUES
	
	(
		INVID, 
		
		1, 
		
		DATE_FROM, 
		
		DATE_TO, 
		
		DELIVERY_PERIOD,
		
		(SELECT GREATEST(0,(CEIL (ABS(DATEDIFF(DATE_FROM, DATE_TO))/7) - DELIVERY_PERIOD))),
		
		(SELECT LEAST(15,GREATEST(0,(CEIL (ABS(DATEDIFF(DATE_FROM, DATE_TO))/7)- DELIVERY_PERIOD )) * 0.5)),
		
		(SELECT 
	
			SUM(T1.invitem_ld_amt)
		
		FROM invoice_items AS T1 
		
		WHERE T1.invoice_id = INVID),
		
		(SELECT 	
	
			ROUND( 		
			
				GREATEST(0,
				
					(				
						(SUM(T1.invitem_unitprice) - (SELECT S1.ld_refund FROM invoice AS S1 WHERE S1.invoice_id = T1.invoice_id))* (LEAST(15,GREATEST(0,(CEIL (ABS(DATEDIFF(DATE_FROM, DATE_TO))/7)- DELIVERY_PERIOD )) * 0.5)/100)										
					)				
				)
				
			)
		
		FROM invoice_items AS T1 
			
		WHERE T1.invoice_id = INVID),
	
		(SELECT 
	
			ROUND(
			
				GREATEST(0, 
				
					(
						(SUM(T1.invitem_ld_amt) - (SELECT S1.ld_refund FROM invoice AS S1 WHERE S1.invoice_id = T1.invoice_id) ) - (SUM(T1.invitem_unitprice) * (LEAST(15,GREATEST(0,(CEIL (ABS(DATEDIFF(DATE_FROM, DATE_TO))/7)- DELIVERY_PERIOD )) * 0.5)/100))				
					)		
					
				)	
				
			)
		
		FROM invoice_items AS T1 
		
		WHERE T1.invoice_id = INVID)
	);
	
SET LID = LAST_INSERT_ID();

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_UPDATE_EXCLAIM
DROP PROCEDURE IF EXISTS `P_UPDATE_EXCLAIM`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_UPDATE_EXCLAIM`(
	IN `INVID` INT
)
BEGIN

	UPDATE invoice 	
	
		SET invoice.excess_claim = 
		
			GREATEST(
			
				(
			
				(invoice.invclaim_amt - invoice.inv_tcs - COALESCE((SELECT SUM(S1.invitem_qty * S1.invitem_claim) FROM invoice_items AS S1 WHERE S1.invoice_id = invoice.invoice_id),0) - invoice.inv_roundplus + invoice.inv_roundminus)
				
				+
				
				COALESCE((SELECT SUM(invitem_qty * invitem_exclaim) FROM invoice_items WHERE invoice_items.invoice_id = invoice.invoice_id),0)
				
				),
			
			0)
	
	WHERE invoice.invoice_id = INVID;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_UPDATE_GROSSAMT
DROP PROCEDURE IF EXISTS `P_UPDATE_GROSSAMT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_UPDATE_GROSSAMT`(
	IN `INVPRSID` INT



)
BEGIN


	UPDATE invoice_processing AS T1
	
	INNER JOIN invoice AS T2 ON (T2.invoice_id = T1.invoice_id)
	
		SET 
		
			T1.gross_payable = ROUND((T2.invclaim_amt - ((SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T2.invoice_id) + T2.sd_deduct + T2.excess_claim + T2.wct + T2.incometax_tds + T1.tds_deduct)) - T1.pterm_deduct + T1.refund_amt),
	
			T1.net_payable	  = ROUND(((T2.invclaim_amt - ((SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T2.invoice_id) + T2.sd_deduct + T2.excess_claim + T2.wct + T2.incometax_tds + T1.tds_deduct)) * T1.recom_percent/100) - T1.pterm_deduct + T1.refund_amt)

	WHERE T1.invoice_processid = INVPRSID;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_UPDATE_LD
DROP PROCEDURE IF EXISTS `P_UPDATE_LD`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_UPDATE_LD`(
	IN `INVID` INT

)
BEGIN

	UPDATE invoice SET ld_deduct = COALESCE((SELECT ROUND(CEIL(SUM(invitem_ld_amt)),0) FROM invoice_items WHERE invoice_items.invoice_id = INVID),0)
	
	WHERE invoice.invoice_id = INVID;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_UPDATE_SDDEDUCT
DROP PROCEDURE IF EXISTS `P_UPDATE_SDDEDUCT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_UPDATE_SDDEDUCT`(
	IN `INVID` INT

)
BEGIN

DECLARE SD_PERCENT DECIMAL (10,2) DEFAULT 0.05; # IF 5% OF SD DEDUCTABLE FROM INVOICE CLAIM (EXCLUDING GST)

	UPDATE invoice 
	
		SET invoice.sd_deduct =  (invoice.inv_exltax - COALESCE((SELECT SUM(invitem_exclaim) FROM invoice_items WHERE invoice_items.invoice_id = INVID),0)) * SD_PERCENT
	
	WHERE invoice.invoice_id = INVID;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.P_WINO_GEN
DROP PROCEDURE IF EXISTS `P_WINO_GEN`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_WINO_GEN`(
	IN `WIID` INT,
	IN `YRID` DATE,
	IN `ID` INT,
	IN `OPT` INT
)
BEGIN
	
	IF(OPT = "1") THEN
	
		UPDATE work_intimation 
		
	-- 	SET workint_no = CONCAT('WI/',WIID,'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_bidder_details AS S2 WHERE S2.bidder_id = BID LIMIT 1))  
	
	--		SET workint_no = CONCAT('WI/',(WIID-71),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_bidder_details AS S2 WHERE S2.bidder_id = ID LIMIT 1))  
	
			SET workint_no = CONCAT('WI/',(WIID-163),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT S2.equip_code FROM v_bidder_details AS S2 WHERE S2.bidder_id = ID LIMIT 1))
			
		WHERE workint_id = WIID;
	
	ELSEIF(OPT = "2") THEN

		UPDATE work_intimation 
	
	--		SET workint_no = CONCAT('WI(G)/',(WIID-71),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT T2.equip_code FROM govtagency_items AS T1 INNER JOIN master_equipment AS T2 ON (T2.equip_id = T1.equip_id) WHERE T1.govtagency_item_id = ID))  
			
			SET workint_no = CONCAT('WI(G)/',(WIID-163),'/',(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE YRID BETWEEN start_date AND end_date),'/',(SELECT T2.equip_code FROM govtagency_items AS T1 INNER JOIN master_equipment AS T2 ON (T2.equip_id = T1.equip_id) WHERE T1.govtagency_item_id = ID))
			
		WHERE workint_id = WIID;	
	
	END IF;

END//
DELIMITER ;


-- Dumping structure for procedure ems_test.temp_pro1
DROP PROCEDURE IF EXISTS `temp_pro1`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `temp_pro1`()
BEGIN

    DECLARE i int DEFAULT 4521;
    
    WHILE i <= 4546 DO
    
	     -- INSERT INTO mytable (code, active, total) VALUES (i, 1, 1);
        
        INSERT INTO sanction_allotment (district_id, dept_id, institution_id, sanction_equip_id, alloted_qty)
        
		  (SELECT T1.district_id, T1.dept_id, T1.institution_id, i, T1.alloted_qty FROM sanction_allotment AS T1 WHERE T1.sanction_equip_id = 4097);

        SET i = i + 1;

    END WHILE;
END//
DELIMITER ;


-- Dumping structure for function ems_test.bal_sanctionAmt
DROP FUNCTION IF EXISTS `bal_sanctionAmt`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `bal_sanctionAmt`(`ASID` INT, `SEID` INT) RETURNS decimal(20,2)
BEGIN

DECLARE BAL_AMT decimal(20,2) DEFAULT 0;

IF (SEID=0) THEN /* New record*/

	SELECT T1.sanction_amt - IFNULL(SUM(T2.sanction_equip_qty * T2.sanction_fund_amt),0) AS AMT INTO BAL_AMT
	FROM sanction_order AS T1
	LEFT JOIN sanction_equip AS T2 ON (T2.sanction_order_id = T1.sanction_order_id) 
	WHERE T1.sanction_order_id = ASID;
/*	GROUP BY T2.sanction_order_id; */

ELSE /* update record*/

	SELECT T1.sanction_amt - IFNULL(SUM(T2.sanction_equip_qty * T2.sanction_fund_amt),0) AS AMT INTO BAL_AMT
  	FROM sanction_order AS T1
	LEFT JOIN sanction_equip AS T2 ON (T2.sanction_order_id = T1.sanction_order_id) 
	WHERE T1.sanction_order_id = ASID AND T2.sanction_equip_id != SEID;

END IF;

RETURN BAL_AMT;

END//
DELIMITER ;


-- Dumping structure for function ems_test.bal_sanctionQty
DROP FUNCTION IF EXISTS `bal_sanctionQty`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `bal_sanctionQty`(`EQUIP_ID` INT, `ALLOT_ID` INT) RETURNS int(11)
BEGIN

DECLARE BAL_QTY INT DEFAULT 0;

IF (ALLOT_ID = 0) THEN  

	SELECT 
	
	CASE 
		WHEN (SELECT COUNT(*) FROM sanction_allotment AS S1 WHERE S1.sanction_equip_id = EQUIP_ID) > 0
			THEN
				(T1.sanction_equip_qty-IFNULL(SUM(T2.alloted_qty),0)) 
			ELSE
				T1.sanction_equip_qty 
	END INTO BAL_QTY
	
	FROM sanction_equip AS T1
	LEFT OUTER JOIN sanction_allotment AS T2 ON (T2.sanction_equip_id = T1.sanction_equip_id)
	WHERE T2.sanction_equip_id = EQUIP_ID;
   
/*	GROUP BY T2.sanction_equip_id; */
	
ELSE 

	SELECT 	
		CASE 
			WHEN (SELECT COUNT(*) FROM sanction_allotment AS S1 WHERE S1.sanction_equip_id = EQUIP_ID AND S1.sanction_allotment_id <> ALLOT_ID) > 0 
		THEN  
			(T1.sanction_equip_qty - IFNULL(SUM(T2.alloted_qty),0))
		ELSE 
			T1.sanction_equip_qty END INTO BAL_QTY 			
	FROM sanction_equip AS T1
	JOIN sanction_allotment AS T2 ON (T2.sanction_equip_id = T1.sanction_equip_id)
	WHERE T1.sanction_equip_id = EQUIP_ID AND T2.sanction_allotment_id <> ALLOT_ID;
	
END IF;

RETURN BAL_QTY;

END//
DELIMITER ;


-- Dumping structure for function ems_test.calc_lower_price
DROP FUNCTION IF EXISTS `calc_lower_price`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `calc_lower_price`(`PBID` INT, `YR` INT, `CNT` INT) RETURNS decimal(20,2)
BEGIN

DECLARE RES DECIMAL(20,2) DEFAULT 0;
DECLARE TEMP_VAL DECIMAL(20,2) DEFAULT 0;
DECLARE MAX_YR INT DEFAULT 0;

SET MAX_YR = YR+CNT+1;
    
L1:LOOP

SET YR := YR+1;

IF YR >=MAX_YR  THEN
   leave L1;
END IF;

SELECT 1/(POWER(1.08,YR))*T3.camc_charge INTO TEMP_VAL FROM bidder_camc AS T3 WHERE T3.pbid_id = PBID AND T3.camc_yr = YR;

SET RES := RES + TEMP_VAL;

END LOOP L1;
	
RETURN RES;	

END//
DELIMITER ;


-- Dumping structure for function ems_test.calc_spare_camc
DROP FUNCTION IF EXISTS `calc_spare_camc`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `calc_spare_camc`(`BEID` INT, `YR` INT, `CNT` INT) RETURNS decimal(20,2)
BEGIN

	DECLARE RES DECIMAL(20,2) DEFAULT 0;
	DECLARE TEMP_VAL DECIMAL(20,2) DEFAULT 0;
	DECLARE MAX_YR INTEGER DEFAULT 0;
	DECLARE BSPID INTEGER DEFAULT NULL;
	DECLARE finished INTEGER DEFAULT 0;

	DEClARE CAL_SPARE_CAMC CURSOR FOR 
	
		SELECT 
		
				T1.bidder_spareprice_id

		FROM bidder_amc AS T1 

		WHERE T1.bidder_equip_id = BEID AND T1.bidder_spareprice_id IS NOT NULL;
		
	DECLARE CONTINUE HANDLER 
    
	     FOR NOT FOUND SET finished = 1;		
	 
	OPEN CAL_SPARE_CAMC;
	
		SET MAX_YR = YR+CNT+1;
	    
		L1:LOOP
		
			FETCH CAL_SPARE_CAMC INTO BSPID;
		
			SET YR := YR+1;
			
			IF YR >= MAX_YR || finished = 1  THEN
			
			   LEAVE L1;
			   
			END IF;
			
			SELECT 
			
				1/(POWER(1.08,YR)) * T3.camc_charge INTO TEMP_VAL 
			
			FROM bidder_camc AS T3 
			
			WHERE T3.bidder_spareprice_id = BSPID AND T3.camc_yr = YR;
			
			SET RES := RES + TEMP_VAL;
		
		END LOOP L1;
		
		RETURN RES;		
	
	CLOSE CAL_SPARE_CAMC;

END//
DELIMITER ;


-- Dumping structure for function ems_test.CAP_FIRST
DROP FUNCTION IF EXISTS `CAP_FIRST`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `CAP_FIRST`(
	`input` VARCHAR(255)
) RETURNS varchar(255) CHARSET latin1
BEGIN
	DECLARE len INT;
	DECLARE i INT;

	SET len   = CHAR_LENGTH(input);
	SET input = LOWER(input);
	SET i = 0;

	WHILE (i < len) DO
		IF (MID(input,i,1) = ' ' OR i = 0) THEN
			IF (i < len) THEN
				SET input = CONCAT(
					LEFT(input,i),
					UPPER(MID(input,i + 1,1)),
					RIGHT(input,len - i - 1)
				);
			END IF;
		END IF;
		SET i = i + 1;
	END WHILE;

	RETURN input;
END//
DELIMITER ;


-- Dumping structure for function ems_test.check_ExceesFundReceive
DROP FUNCTION IF EXISTS `check_ExceesFundReceive`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `check_ExceesFundReceive`(`FRID` INT, `SSID` INT, `RECEIVE_AMT` DECIMAL(30,2)) RETURNS decimal(10,0)
BEGIN

DECLARE BAL_AMT decimal(30,2) DEFAULT 0;

IF (FRID=0) THEN /* NEW RECORD */

   SELECT SUM(T1.fund_receive_amt) AS AMT INTO BAL_AMT
   FROM sanction_fund_received AS T1
   WHERE T1.sanction_scheme_id = SSID
   GROUP BY T1.sanction_scheme_id;

ELSE /* UPDATE RECORD */

   SELECT SUM(T1.fund_receive_amt) AS AMT INTO BAL_AMT
   FROM sanction_fund_received AS T1
   WHERE T1.sanction_scheme_id = SSID AND T1.fund_receive_id <> FRID
   GROUP BY T1.sanction_scheme_id;

END IF;

RETURN BAL_AMT;

END//
DELIMITER ;


-- Dumping structure for function ems_test.FUND_RECEIVED
DROP FUNCTION IF EXISTS `FUND_RECEIVED`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `FUND_RECEIVED`(`orderID` INT) RETURNS varchar(50) CHARSET latin1
BEGIN

declare FUND_STATUS varchar(50);

SELECT 
	(CASE WHEN (T2.sanction_amt <= ifnull(SUM(T1.fund_receive_amt),0)) THEN 'Complete' ELSE ROUND((ifnull(SUM(T1.fund_receive_amt),0)/T2.sanction_amt*100),1) END) INTO FUND_STATUS
FROM fund_receive_details AS T1
RIGHT OUTER JOIN sanction_order AS T2 ON (T2.sanction_order_id = T1.ref_fund_sanction_order_id)
WHERE T2.sanction_order_id = orderID
GROUP BY T2.sanction_order_id;

return FUND_STATUS;

END//
DELIMITER ;


-- Dumping structure for function ems_test.F_ALLOT_LOISTS
DROP FUNCTION IF EXISTS `F_ALLOT_LOISTS`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `F_ALLOT_LOISTS`(`SEID` INT) RETURNS int(11)
BEGIN

DECLARE LOI_QTY INT DEFAULT 0;

SELECT 

	ifnull(SUM(S1.loi_sch_qty),0) INTO LOI_QTY

FROM loi_schedule AS S1 

WHERE S1.bidder_spareprice_id IS NULL AND S1.sanction_allotment_id IN (SELECT S2.sanction_allotment_id FROM sanction_allotment AS S2 WHERE S2.sanction_equip_id = SEID);

RETURN LOI_QTY;

END//
DELIMITER ;


-- Dumping structure for function ems_test.F_ALLOT_LOIVAL
DROP FUNCTION IF EXISTS `F_ALLOT_LOIVAL`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `F_ALLOT_LOIVAL`(`SEID` INT) RETURNS decimal(20,2)
BEGIN

DECLARE LOI_VAL DECIMAL(20,2) DEFAULT 0;

SELECT 

	IFNULL(SUM(S1.loi_sch_qty * S1.loi_sch_unitcost),0) INTO LOI_VAL

FROM loi_schedule AS S1 

WHERE S1.sanction_allotment_id IN (SELECT S2.sanction_allotment_id FROM sanction_allotment AS S2 WHERE S2.sanction_equip_id = SEID);

RETURN LOI_VAL;

END//
DELIMITER ;


-- Dumping structure for function ems_test.F_ALLOT_POSTS
DROP FUNCTION IF EXISTS `F_ALLOT_POSTS`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `F_ALLOT_POSTS`(
	`SEID` INT
) RETURNS int(11)
BEGIN

DECLARE PO_QTY INT DEFAULT 0;

SELECT 

	ifnull(SUM(S1.purchase_qty),0) INTO PO_QTY

FROM purchase_schedule AS S1 

INNER JOIN purchase_order AS S2 ON (S2.purchase_id = S1.purchase_id)

WHERE S1.bidder_spareprice_id IS NULL AND S1.schedule_canceled <> 'Y' AND S2.purchase_status = 'A' AND S1.sanction_allotment_id IN (SELECT S2.sanction_allotment_id FROM sanction_allotment AS S2 WHERE S2.sanction_equip_id = SEID);

RETURN PO_QTY;

END//
DELIMITER ;


-- Dumping structure for function ems_test.F_ALLOT_POVAL
DROP FUNCTION IF EXISTS `F_ALLOT_POVAL`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `F_ALLOT_POVAL`(
	`SEID` INT
) RETURNS decimal(20,2)
BEGIN

DECLARE PO_VAL DECIMAL(20,2) DEFAULT 0;

SELECT 

	IFNULL(SUM(S1.purchase_qty * S1.purchase_sch_unitcost),0) INTO PO_VAL

FROM purchase_schedule AS S1 

INNER JOIN purchase_order AS S2 ON (S2.purchase_id = S1.purchase_id)

WHERE S1.schedule_canceled <> 'Y' AND S2.purchase_status = 'A' AND S1.sanction_allotment_id IN (SELECT S2.sanction_allotment_id FROM sanction_allotment AS S2 WHERE S2.sanction_equip_id = SEID);

RETURN PO_VAL;

END//
DELIMITER ;


-- Dumping structure for function ems_test.F_EMPNAME
DROP FUNCTION IF EXISTS `F_EMPNAME`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `F_EMPNAME`(
	`ID` INT
) RETURNS varchar(50) CHARSET latin1
BEGIN

declare EMP_NAME varchar(500);

SELECT T1.employee_name INTO emp_name FROM master_emsuser AS T1 WHERE T1.acc_user_id = ID;

return EMP_NAME;

END//
DELIMITER ;


-- Dumping structure for function ems_test.F_NARRATION
DROP FUNCTION IF EXISTS `F_NARRATION`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `F_NARRATION`(
	`INVID` INT
) RETURNS varchar(500) CHARSET latin1
BEGIN

   DECLARE INI int DEFAULT 0;
    
   DECLARE CNT int DEFAULT 0;
    
 	DECLARE NARRATION varchar(500) DEFAULT "";
    
	SELECT COUNT(*) INTO CNT FROM invoice_items AS T1 WHERE T1.invoice_id = INVID;

	WHILE INI <= CNT DO
	
		SELECT
			
			CONCAT((SELECT 
			
				CONCAT(
				
						" INV : ", T1.invoice_no, " [ ", DATE_FORMAT(T1.invoice_dt,"%d-%m-%Y"), " ] ",
						
						" SUP : ", (SELECT REPLACE(S2.supplier_name,",", " ") FROM bidder_details AS S1 INNER JOIN master_supplier AS S2 ON(S2.supplier_id = S1.supplier_id) WHERE S1.bidder_id = T4.bidder_id), 
						
						" EQU : ", S1.equip_name, " [ ", T2.invitem_qty ," ] ", 
				
						" LOC : ", REPLACE(S1.institution_name,",","-"), 
						
						" PRJ : ", S1.project_name, 
						
						" SCH : ", S1.scheme_name,
						
						" SO  : ", T4.purchase_no, " [ ", DATE_FORMAT(T4.purchase_date,"%d-%m-%Y"), " ] "
				)
			
			FROM v_sanction_allotment AS S1 
			
			INNER JOIN purchase_schedule AS S2 ON (S2.sanction_allotment_id = S1.sanction_allotment_id) 
			
			WHERE S2.purchase_sch_id = T2.purchase_sch_id
			
			), ", IMP DT :", DATE_FORMAT(CURDATE(),"%d-%b-%Y"), " ; ", NARRATION) INTO NARRATION
		
		FROM invoice AS T1
		
		INNER JOIN invoice_items AS T2 ON (T2.invoice_id = T1.invoice_id)
		
		INNER JOIN purchase_order AS T4 ON (T4.purchase_id = T1.purchase_id)
		
		WHERE T1.invoice_id = INVID 
				
		LIMIT INI,1;
	
	SET INI = INI + 1;
	
	END WHILE;

   RETURN NARRATION;

END//
DELIMITER ;


-- Dumping structure for function ems_test.F_NARRATION_PROJECT
DROP FUNCTION IF EXISTS `F_NARRATION_PROJECT`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `F_NARRATION_PROJECT`(`INVID` INT) RETURNS varchar(500) CHARSET latin1
BEGIN

   DECLARE INI int DEFAULT 0;
    
   DECLARE CNT int DEFAULT 0;
    
 	DECLARE NARRATION varchar(500) DEFAULT "";
    
	SELECT COUNT(*) INTO CNT FROM invoice_items AS T1 WHERE T1.invoice_id = INVID;

	WHILE INI <= CNT DO
	
		SELECT DISTINCT
			
			CONCAT((SELECT 
			
				CONCAT(				

						" PRJ : ", S1.project_name
				)
			
			FROM v_sanction_allotment AS S1 
			
			INNER JOIN purchase_schedule AS S2 ON (S2.sanction_allotment_id = S1.sanction_allotment_id) 
			
			WHERE S2.purchase_sch_id = T2.purchase_sch_id
			
			), "; ", NARRATION) INTO NARRATION
		
		FROM invoice AS T1
		
		INNER JOIN invoice_items AS T2 ON (T2.invoice_id = T1.invoice_id)
		
		INNER JOIN purchase_order AS T4 ON (T4.purchase_id = T1.purchase_id)
		
		WHERE T1.invoice_id = INVID 
				
		LIMIT INI,1;
	
	SET INI = INI + 1;
	
	END WHILE;

   RETURN NARRATION;

END//
DELIMITER ;


-- Dumping structure for function ems_test.F_POVAL_ITEMWISE
DROP FUNCTION IF EXISTS `F_POVAL_ITEMWISE`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `F_POVAL_ITEMWISE`(
	`SEID` INT,
	`POID` INT

) RETURNS decimal(20,2)
    COMMENT 'Based on Equip Sanction Equipment ID (SEID)  with POID wise Value (including Tax) '
BEGIN

DECLARE PO_VAL DECIMAL(20,2) DEFAULT 0;

	SELECT
	
		IFNULL(SUM(T1.purchase_qty * T1.purchase_sch_unitcost),0) INTO PO_VAL
	
	FROM purchase_schedule AS T1
	
	INNER JOIN purchase_order AS T2 ON (T2.purchase_id = T1.purchase_id)
	
	WHERE 
	
		T1.schedule_canceled = "N"
		
		AND T2.purchase_status = "A"
		
		AND EXISTS (SELECT * FROM sanction_allotment AS S1 WHERE S1.sanction_equip_id = SEID AND S1.sanction_allotment_id = T1.sanction_allotment_id);

RETURN PO_VAL;

END//
DELIMITER ;


-- Dumping structure for function ems_test.F_PROCUREMENT_BASKET
DROP FUNCTION IF EXISTS `F_PROCUREMENT_BASKET`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `F_PROCUREMENT_BASKET`(`EID` INT) RETURNS int(11)
    DETERMINISTIC
BEGIN

DECLARE ITEMAVAIL INT DEFAULT 0;

SELECT 

	COUNT(*) INTO ITEMAVAIL 

FROM procurement_basket AS T1 

INNER JOIN v_sanction_equip AS T2 ON (T2.equip_id = T1.equip_id)

WHERE T1.equip_id = EID AND T1.procurement_basket_status = 1;

RETURN ITEMAVAIL;

END//
DELIMITER ;


-- Dumping structure for function ems_test.F_SUPNAME
DROP FUNCTION IF EXISTS `F_SUPNAME`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `F_SUPNAME`(
	`ID` INT
) RETURNS varchar(500) CHARSET latin1
BEGIN

DECLARE SUPPLIER varchar(500);

SELECT T1.supplier_name INTO SUPPLIER FROM master_supplier AS T1 WHERE T1.supplier_id = ID;

RETURN SUPPLIER;

END//
DELIMITER ;


-- Dumping structure for function ems_test.F_TECHEVA_STS
DROP FUNCTION IF EXISTS `F_TECHEVA_STS`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `F_TECHEVA_STS`(`BEID` INT) RETURNS int(11)
BEGIN

DECLARE STS INT;

SELECT T1.techEvaluate_status INTO STS FROM bidder_equipments AS T1 WHERE T1.bidder_equip_id = BEID;

RETURN STS;

END//
DELIMITER ;


-- Dumping structure for function ems_test.F_TENDERSTS
DROP FUNCTION IF EXISTS `F_TENDERSTS`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `F_TENDERSTS`(`EID` INT) RETURNS varchar(50) CHARSET latin1
BEGIN

DECLARE TENDER_STATUS varchar(50);

SELECT 

	(CASE 
	
	WHEN T1.techbid_opendt IS NULL THEN "TECH BID NOT YET OPENED"
	
	WHEN (T1.demo_required = "1" AND T1.demo_res_dt IS NULL) THEN "DEMO PENDING"
	
	WHEN T1.pricebid_open_dt IS NULL THEN "PRICE BID NOT YET OPENED"
	
	ELSE "READY TO SELECT SUPPLIER"
	
	END) INTO TENDER_STATUS

FROM procure_details AS T1

LEFT JOIN procure_item_details AS T2 ON (T2.procure_id = T1.procure_id)   

LEFT JOIN procure_basket_items AS T3 ON (T3.procure_basket_item_id = T2.procure_basket_item_id)

LEFT JOIN procure_basket AS T4 ON (T4.procure_basket_id = T3.procure_basket_id)

LEFT JOIN master_equipment AS T5 ON (T5.equip_id = T4.equip_id)

LEFT JOIN v_bidder_details AS T6 ON (T6.procure_item_id = T2.procure_item_id)

WHERE T1.procure_confirm = "1" AND T4.equip_id = EID AND T6.VALIDITY >=  CURDATE()

LIMIT 1;

RETURN TENDER_STATUS;

END//
DELIMITER ;


-- Dumping structure for function ems_test.F_TENDER_AVAILSTS
DROP FUNCTION IF EXISTS `F_TENDER_AVAILSTS`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `F_TENDER_AVAILSTS`(`EID` INT) RETURNS varchar(500) CHARSET latin1
BEGIN

DECLARE TENDERAVAIL varchar(500) DEFAULT "TO BE INITIATED";

SELECT 

	(CASE WHEN T1.procure_confirm = 1 THEN "TO BE ORDER"
	
			WHEN T1.procure_confirm > 1 THEN "TENDER PROCESSING"
		
			ELSE "RC NOT AVAIL"
		
	END) INTO TENDERAVAIL	

FROM procure_details AS T1

INNER JOIN procure_item_details AS T2 ON (T2.procure_id = T1.procure_id)   

INNER JOIN procure_basket_items AS T3 ON (T3.procure_basket_item_id = T2.procure_basket_item_id)

INNER JOIN procure_basket AS T4 ON (T4.procure_basket_id = T3.procure_basket_id)

WHERE T4.equip_id = 	EID AND T1.procure_cancel ="2" AND (DATE_ADD(T1.pricebid_open_dt, INTERVAL 2 YEAR) - INTERVAL 1 DAY) >= CURDATE()

LIMIT 1;

RETURN TENDERAVAIL;

END//
DELIMITER ;


-- Dumping structure for function ems_test.GET_MAXPMV
DROP FUNCTION IF EXISTS `GET_MAXPMV`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `GET_MAXPMV`(
	`ID` INT
) RETURNS date
BEGIN

declare MPMV DATE;

SELECT MAX(S1.pmv_actual) INTO MPMV FROM service_pmvisit AS S1 WHERE S1.invitem_id = ID;

return MPMV;

END//
DELIMITER ;


-- Dumping structure for event ems_test.evt1
DROP EVENT IF EXISTS `evt1`;
DELIMITER //
CREATE DEFINER=`connect`@`176@192.168.1.176` EVENT `evt1` ON SCHEDULE EVERY 1 MINUTE STARTS '2021-02-22 17:51:00' ON COMPLETION PRESERVE ENABLE DO BEGIN

INSERT INTO test_events (evt_name) VALUES ('Test for Event');

END//
DELIMITER ;


-- Dumping structure for trigger ems_test.prerevision_price
DROP TRIGGER IF EXISTS `prerevision_price`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `prerevision_price` BEFORE UPDATE ON `bidder_price` FOR EACH ROW BEGIN

INSERT INTO bidder_prerevision_price (

pbid_id, 
bidder_equip_id, 
bidder_id, 
basicprice,
salestax,
custtax, 
misc, 
cgst_ratio , 
sgst_ratio, 
igst_ratio,
cgst_amt, 
sgst_amt, 
igst_amt,
gst_revision, 
gst_revision_date

) 

VALUES 

(

OLD.pbid_id,
OLD.bidder_equip_id, 
OLD.bidder_id,
OLD.pbid_basicprice,
OLD.pbid_salestax,
OLD.pbid_custtax,
OLD.pbid_misc, 
OLD.cgst_ratio, 
OLD.sgst_ratio,
OLD.igst_ratio, 
OLD.cgst_amt,
OLD.sgst_amt,  
OLD.igst_amt,
OLD.gst_revision, 
OLD.gst_revision_date
 
); 

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
