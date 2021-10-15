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

-- Dumping structure for view ems_test.v_amc_camc_price
DROP VIEW IF EXISTS `v_amc_camc_price`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_amc_camc_price` (
	`bidder_id` INT(11) NULL,
	`bidder_equip_id` INT(11) NOT NULL,
	`tender_amcslab` INT(11) NULL,
	`tender_camcslab` INT(11) NULL,
	`amc_camc_consider` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`CONAMC` VARCHAR(3) NULL COLLATE 'utf8mb4_general_ci',
	`techEvaluate_status` INT(11) NOT NULL,
	`demo_status` INT(11) NOT NULL,
	`AMC_PRICE` DECIMAL(42,2) NULL,
	`CAMC_PRICE` DECIMAL(42,2) NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_bidder_details
DROP VIEW IF EXISTS `v_bidder_details`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_bidder_details` (
	`tag_id` INT(11) NULL,
	`tag_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_type_id` INT(11) NULL COMMENT '1 = By Tender (T); 2 = By Quotation (Q); ',
	`procure_type_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_id` INT(11) NULL,
	`procure_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_publishdt` DATE NULL,
	`procure_equip_type_id` INT(11) NULL,
	`procure_equip_type_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`security_deposit` DECIMAL(20,2) NULL,
	`warranty_period` INT(11) NULL,
	`tender_amcslab` INT(11) NULL,
	`tender_camcslab` INT(11) NULL,
	`amc_camc_consider` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`techbid_opendt` DATE NULL,
	`techeve_res_dt` DATE NULL,
	`procure_clarification_dt` DATE NULL,
	`procure_committe_dt` DATE NULL,
	`rep_techres_dt` DATE NULL,
	`demo_dt` DATE NULL,
	`demo_res_dt` DATE NULL,
	`rep_demores_dt` DATE NULL,
	`pricebid_open_dt` DATE NULL,
	`final_res_dt` DATE NULL,
	`rep_priceres_dt` DATE NULL,
	`delivery_to` INT(11) NULL COMMENT '1- Concenerd Institution, 2 - Concenered District WhareHouse',
	`valid_extn` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`valid_extn_dt` DATE NULL,
	`VALIDITY` DATE NULL,
	`VALID_UPTO` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`procure_item_id` INT(11) NULL,
	`equip_id` INT(11) NULL,
	`parent_equip_id` INT(11) NULL,
	`equip_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`item_alias` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`dept_id` INT(11) NULL,
	`procure_item_qty` INT(11) NULL,
	`procure_item_qty_extn` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`bidder_id` INT(11) NULL,
	`bidder_equip_id` INT(11) NOT NULL,
	`supplier_id` INT(11) NULL,
	`supplier_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`supplier_gstin` VARCHAR(500) NULL COMMENT 'Goods and Services Tax' COLLATE 'latin1_swedish_ci',
	`supplier_address` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`contact_person` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`supplier_mobile` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`supplier_phone` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`supplier_email` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`IsAvailBank` BIGINT(21) NULL,
	`bidder_make_model` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`techEvaluate_status` INT(11) NOT NULL,
	`TECHEVA_RES` VARCHAR(7) NOT NULL COLLATE 'utf8mb4_general_ci',
	`demo_status` INT(11) NOT NULL,
	`DEMO_RES` VARCHAR(7) NOT NULL COLLATE 'utf8mb4_general_ci',
	`bidder_confirm` INT(11) NULL COMMENT '1-> Confirm, 2->Not Yet,   Confirm all the details against the bidder',
	`promote_supplier` INT(11) NOT NULL COMMENT '1->Supplier, 2->Bidder',
	`loi_issued` INT(11) NOT NULL COMMENT '1-> LOI Issued & Confirm, 2-> LOI Issued & Not Confirm, 3-> Not Issued',
	`rc_closed` CHAR(50) NULL COMMENT 'N -> Not Closed, Y -> Closed (Manually)' COLLATE 'latin1_swedish_ci',
	`LOI_NO` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_confirm` INT(11) NULL COMMENT '1 =  APPROVED, 2 = COMPLETE & NOT YET  APPROVED,  3 = INCOMPLETE',
	`procure_cancel` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`procure_item_cancelled` CHAR(50) NULL COMMENT 'Item cancelled from tender (Partiall cancel applicable to group item)' COLLATE 'latin1_swedish_ci',
	`CURRENCY_TYP` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`publish_intitution` CHAR(50) NULL COMMENT 'Publish To Institution User' COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_bidder_details_2
DROP VIEW IF EXISTS `v_bidder_details_2`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_bidder_details_2` (
	`bidder_id` INT(11) NOT NULL,
	`supplier_id` INT(11) NULL,
	`supplier_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`supplier_address` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`tag_id` INT(11) NULL,
	`tag_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_id` INT(11) NULL,
	`procure_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`techbid_opendt` DATE NULL,
	`techeve_res_dt` DATE NULL,
	`procure_clarification_dt` DATE NULL,
	`procure_committe_dt` DATE NULL,
	`rep_techres_dt` DATE NULL,
	`demo_dt` DATE NULL,
	`demo_res_dt` DATE NULL,
	`rep_demores_dt` DATE NULL,
	`pricebid_open_dt` DATE NULL,
	`final_res_dt` DATE NULL,
	`rep_priceres_dt` DATE NULL,
	`procure_type_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_equip_type_id` INT(11) NULL,
	`procure_equip_type_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`tender_amcslab` INT(11) NULL,
	`tender_camcslab` INT(11) NULL,
	`amc_camc_consider` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`bidder_confirm` INT(11) NOT NULL COMMENT '1-> Confirm, 2->Not Yet,   Confirm all the details against the bidder',
	`procure_confirm` INT(11) NULL COMMENT '1 =  APPROVED, 2 = COMPLETE & NOT YET  APPROVED,  3 = INCOMPLETE'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_bidder_equiplist
DROP VIEW IF EXISTS `v_bidder_equiplist`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_bidder_equiplist` (
	`bidder_id` INT(11) NOT NULL,
	`bidder_equip_id` INT(11) NOT NULL,
	`supplier_id` INT(11) NOT NULL,
	`supplier_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`procure_id` INT(11) NOT NULL,
	`procure_no` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`procure_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`equip_id` INT(11) NOT NULL,
	`equip_code` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`equip_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_bidder_price
DROP VIEW IF EXISTS `v_bidder_price`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_bidder_price` (
	`bidder_id` INT(11) NULL,
	`bidder_equip_id` INT(11) NOT NULL,
	`supplier_id` INT(11) NULL,
	`supplier_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`supplier_gstin` VARCHAR(500) NULL COMMENT 'Goods and Services Tax' COLLATE 'latin1_swedish_ci',
	`procure_item_qty` INT(11) NULL,
	`BIDDER_CNT` BIGINT(21) NULL,
	`procure_id` INT(11) NULL,
	`procure_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_startdt` DATE NULL,
	`final_res_dt` DATE NULL,
	`procure_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`tag_id` INT(11) NULL,
	`fn_year_id` INT(11) NULL,
	`procure_item_id` INT(11) NULL,
	`equip_id` INT(11) NULL,
	`equip_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`item_alias` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`bidder_make_model` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`master_siunit_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`tender_amcslab` INT(11) NULL,
	`tender_camcslab` INT(11) NULL,
	`procure_equip_type_id` INT(11) NULL,
	`sticker` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`install_report_req` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`warranty_period` INT(11) NULL,
	`security_deposit` DECIMAL(20,2) NULL,
	`delivery_period` INT(11) NULL,
	`delivery_period_id` INT(11) NULL,
	`DELIVERY_TIME` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`DELIVERY` VARCHAR(512) NULL COLLATE 'latin1_swedish_ci',
	`techEvaluate_status` INT(11) NOT NULL,
	`demo_status` INT(11) NOT NULL,
	`amc_camc_consider` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`pbid_id` INT(11) NULL,
	`gst_active` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`pbid_currency` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`pbid_basicprice` DECIMAL(20,2) NULL,
	`pbid_salestax` DECIMAL(20,2) NULL,
	`pbid_custtax` DECIMAL(20,2) NULL,
	`pbid_misc` DECIMAL(20,2) NULL,
	`cgst_ratio` DECIMAL(10,2) NULL,
	`cgst_amt` DECIMAL(20,2) NULL,
	`sgst_ratio` DECIMAL(10,2) NULL,
	`sgst_amt` DECIMAL(20,2) NULL,
	`igst_ratio` DECIMAL(10,2) NULL,
	`igst_amt` DECIMAL(20,2) NULL,
	`MAIN_EQUIP_PRICE_EXLSTAX` DECIMAL(22,2) NULL,
	`MAIN_EQUIP_PRICE` DECIMAL(23,2) NULL,
	`old_pbid_basicprice` DECIMAL(20,2) NULL,
	`old_pbid_salestax` DECIMAL(20,2) NULL,
	`old_pbid_custtax` DECIMAL(20,2) NULL,
	`old_pbid_misc` DECIMAL(20,2) NULL,
	`OLD_MAIN_EQUIP_PRICE` DECIMAL(23,2) NULL,
	`npvadjust` DECIMAL(20,2) NULL,
	`OLD_SPARE_PRICE` DECIMAL(55,2) NULL,
	`SPARE_PRICE` DECIMAL(55,2) NULL,
	`OLD_UNIT_PRICE` DECIMAL(56,2) NOT NULL,
	`UNIT_PRICE` DECIMAL(56,2) NOT NULL,
	`AMC_PRICE` DECIMAL(42,2) NULL,
	`CAMC_PRICE` DECIMAL(42,2) NULL,
	`NPV` DECIMAL(20,2) NULL,
	`TOTAL_PRICE` DECIMAL(57,2) NOT NULL,
	`pricebid_open_dt` DATE NULL,
	`EXPIRE` DATE NULL,
	`VALID_UPTO` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`EXTENDED_EXPIRE` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`valid_extn` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`valid_extn_dt` DATE NULL,
	`procure_confirm` INT(11) NULL COMMENT '1 =  APPROVED, 2 = COMPLETE & NOT YET  APPROVED,  3 = INCOMPLETE',
	`procure_cancel` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`is_negotiated` INT(11) NULL COMMENT '1- NEGOTIATED , 2- YES & NOT CNF, 3 = NOT YET',
	`price_status` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`promote_supplier` INT(11) NOT NULL COMMENT '1->Supplier, 2->Bidder'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_bidder_selection_status
DROP VIEW IF EXISTS `v_bidder_selection_status`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_bidder_selection_status` (
	`procure_id` INT(11) NOT NULL,
	`procure_no` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`procure_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`procure_confirm` INT(11) NULL COMMENT '1 =  APPROVED, 2 = COMPLETE & NOT YET  APPROVED,  3 = INCOMPLETE',
	`procure_equip_type_id` INT(11) NOT NULL,
	`procure_equip_type_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`ITEM_CNT` BIGINT(21) NOT NULL,
	`SUPPLIER_CNT` BIGINT(21) NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_bidder_spare_price
DROP VIEW IF EXISTS `v_bidder_spare_price`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_bidder_spare_price` (
	`SPARE_PROCURE_ID` INT(11) NULL,
	`procure_equip_type_id` INT(11) NULL,
	`SPARE_PROCURE_ITEM_ID` INT(11) NULL,
	`DELIVERY` VARCHAR(512) NULL COLLATE 'latin1_swedish_ci',
	`bidder_id` INT(11) NULL,
	`bidder_equip_id` INT(11) NOT NULL,
	`spare_category` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`bidder_spareprice_id` INT(11) NULL,
	`equip_spare_id` INT(11) NULL,
	`equip_spare_name` TEXT NULL COLLATE 'latin1_swedish_ci',
	`spare_alias` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`SPARE_PARENT_ID` INT(11) NULL,
	`gst_active` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`spare_basicprice` DECIMAL(20,2) NULL,
	`spare_salestax` DECIMAL(20,2) NULL,
	`spare_custtax` DECIMAL(20,2) NULL,
	`spare_cgst_ratio` DECIMAL(20,2) NULL,
	`spare_sgst_ratio` DECIMAL(20,2) NULL,
	`spare_igst_ratio` DECIMAL(20,2) NULL,
	`spare_misc` DECIMAL(20,2) NULL,
	`SPARE_UNIT_PRICE` DECIMAL(23,2) NOT NULL,
	`SPARE_UNIT_PRICE_EXLTAX` DECIMAL(22,2) NOT NULL,
	`procure_spare_qty` DECIMAL(20,2) NULL,
	`master_siunit_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_spare_type` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`spare_make` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`orderwise` INT(11) NULL,
	`SPARE_WITH_QTY` DECIMAL(43,4) NULL,
	`promote_supplier` INT(11) NOT NULL,
	`price_status` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_cur_year
DROP VIEW IF EXISTS `v_cur_year`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_cur_year` (
	`fn_year_id` INT(11) NOT NULL,
	`fn_year` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`CURYR` INT(11) NOT NULL,
	`PREYR` BIGINT(12) NOT NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_fundreceived_schemewise
DROP VIEW IF EXISTS `v_fundreceived_schemewise`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_fundreceived_schemewise` (
	`sanction_scheme_id` INT(11) NOT NULL,
	`FUND_REQ_SCHEMEWISE` DECIMAL(62,4) NULL,
	`FUND_REC_SCHEMEWISE` DECIMAL(52,2) NOT NULL,
	`FUND_BALREQ_SCHEMEWISE` DECIMAL(63,4) NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_govtagency
DROP VIEW IF EXISTS `v_govtagency`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_govtagency` (
	`govtagency_id` INT(11) NOT NULL,
	`govtagency_item_id` INT(11) NULL,
	`supplier_id` INT(11) NULL,
	`supplier_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`govtagency_gorefno` VARCHAR(500) NULL COMMENT 'KMSCL or Go Ref No ' COLLATE 'latin1_swedish_ci',
	`equip_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`MODEL` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`BASIC_PRICE` DECIMAL(20,2) NULL,
	`STAX` DECIMAL(20,2) NULL,
	`CUST_DUTY` DECIMAL(20,2) NULL,
	`MISC_CH` DECIMAL(20,2) NULL,
	`GOVTAGENCY_UNITCOST` DECIMAL(23,2) NULL,
	`GOVTAGENCY_UNITCOST_EXLTAX` DECIMAL(22,2) NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_govtpurchase
DROP VIEW IF EXISTS `v_govtpurchase`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_govtpurchase` (
	`purchase_type` INT(11) NULL COMMENT '1 - PO through LOI, 2 - Direct PO, 3 - Quotation, 4 - Govt, 5 - WO',
	`purchase_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`purchase_date` DATE NULL,
	`purchase_file_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`bill_file_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`purchase_status` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`purchase_cancel` TIMESTAMP NULL,
	`sanction_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`AS_DATE` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`district_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`dept_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`project_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`scheme_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`alloted_qty` DECIMAL(20,2) NULL,
	`ga_purchase_qty` BIGINT(20) NULL,
	`sanction_allotment_id` INT(11) NULL,
	`ga_purchase_sch_id` INT(11) NOT NULL,
	`purchase_id` INT(11) NULL,
	`govtagency_item_id` INT(11) NULL,
	`govtagency_spare_id` INT(11) NULL,
	`supplier_id` INT(11) NULL,
	`SUPPLIER` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`supplier_gstin` VARCHAR(500) NULL COMMENT 'Goods and Services Tax' COLLATE 'latin1_swedish_ci',
	`procure_id` INT(11) NULL COMMENT '#',
	`bidder_id` INT(11) NULL,
	`govtagency_id` INT(11) NULL,
	`UNIT_PRICE` DECIMAL(23,2) NULL,
	`IS_SPARE` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci',
	`SPARE_NAME` TEXT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_invoice
DROP VIEW IF EXISTS `v_invoice`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_invoice` (
	`supplier_id` INT(11) NULL,
	`supplier_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`supplier_gstin` VARCHAR(500) NULL COMMENT 'Goods and Services Tax' COLLATE 'latin1_swedish_ci',
	`procure_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`PRCDT` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`procure_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`purchase_id` INT(11) NOT NULL,
	`purchase_type` INT(11) NULL COMMENT '1 - PO through LOI, 2 - Direct PO, 3 - Quotation, 4 - Govt, 5 - WO',
	`purchase_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`purchase_date` DATE NULL,
	`purchase_file_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`bill_file_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`sanction_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`AS_DATE` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`institution_id` INT(11) NULL,
	`district_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`dept_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`project_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`scheme_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`ITEM_NAME` TEXT NULL COLLATE 'latin1_swedish_ci',
	`invoice_id` INT(11) NOT NULL,
	`invoice_no` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`INVDT` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`INVTAPALDT` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`invclaim_amt` DECIMAL(20,2) NULL,
	`sd_deduct` DECIMAL(20,2) NULL,
	`excess_claim` DECIMAL(20,4) NULL,
	`pterm_deduct` DECIMAL(20,2) NULL,
	`tds` DECIMAL(20,2) NULL,
	`wct` DECIMAL(20,2) NULL,
	`inv_addtion` DECIMAL(20,2) NULL,
	`invitem_id` INT(11) NULL,
	`purchase_sch_id` INT(11) NULL,
	`sanction_allotment_id` INT(11) NULL,
	`SUPPLYDT` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`INSTALLDT` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`OMPDT` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`site_status` INT(11) NULL COMMENT '1 : Site Ready, 2 : Not Ready',
	`ldcal_basedon` INT(11) NULL,
	`invitem_qty` DECIMAL(20,4) NULL,
	`ITEM_UNITPRICE` DECIMAL(20,4) NULL COMMENT 'Inv Unit Price',
	`ITEM_ADDTCH` DECIMAL(20,4) NULL,
	`ITEMWISE_PAYABLE` DECIMAL(41,8) NULL,
	`time_taken` INT(11) NULL,
	`delay` INT(11) NULL,
	`invitem_ld_percent` DECIMAL(20,1) NULL,
	`invitem_ld_amt` DECIMAL(20,4) NULL,
	`invitem_remarks` VARCHAR(767) NULL COLLATE 'latin1_swedish_ci',
	`ITEMWISE_DEDUCTION` DECIMAL(27,4) NULL,
	`invoice_processid` INT(11) NULL,
	`payment_term` INT(11) NULL,
	`recom_percent` INT(11) NULL,
	`inv_shortfall` INT(11) NULL,
	`inv_chklist1` INT(11) NULL,
	`inv_chklist2` INT(11) NULL,
	`inv_chklist3` INT(11) NULL,
	`inv_chklist4` INT(11) NULL,
	`invoice_process_status` INT(11) NULL COMMENT '1: C, NYV(EP) - 2 : NYV(F) - 3 : NYA - 4 : A,P - 5 : REJECT - 6 : REV(EP) - 7 : HOLD - 8 : REV(F) - 9 - NOTEFILE - 10 - PROCEED',
	`warranty_period` INT(11) NULL,
	`min_pmvisit` INT(11) NULL,
	`CAMC` INT(11) NULL,
	`install_report_req` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`supply_date` DATE NULL,
	`install_date` DATE NULL,
	`omp_date` DATE NULL,
	`DELIVERY` VARCHAR(512) NULL COLLATE 'latin1_swedish_ci',
	`equip_id` INT(11) NULL COMMENT '#',
	`proceeding_id` INT(11) NULL,
	`refund_amt` DECIMAL(20,2) NULL,
	`WARRANTY_EXP` DATE NULL,
	`bidder_equip_id` INT(11) NULL,
	`bidder_spareprice_id` INT(11) NULL,
	`delivery_confirm_date` DATE NULL,
	`delivery_period_extn` INT(11) NULL COMMENT 'IN WEEKS',
	`MAIN_EQUIP_REC_QTY` DECIMAL(42,4) NULL,
	`SPARE_EQUIP_REC_QTY` DECIMAL(42,4) NULL,
	`MAIN_EQUIP_PO_QTY` DECIMAL(42,3) NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_invoice_process
DROP VIEW IF EXISTS `v_invoice_process`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_invoice_process` (
	`supplier_id` INT(11) NULL,
	`SUPPLIER` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`bank_accno` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`bank_ifsc` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`bank_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_id` INT(11) NULL,
	`bidder_id` INT(11) NULL,
	`ITEM` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`purchase_id` INT(11) NULL,
	`PONO` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`PODT` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`POFILE_NO` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`INVNO` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`INVDT` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`invoice_id` INT(11) NOT NULL,
	`invoice_processid` INT(11) NOT NULL,
	`invoice_process_status` INT(11) NULL,
	`PTERM` INT(11) NULL,
	`RECOM_PERCENT` INT(11) NULL,
	`INVWISE_PAYABLE` DECIMAL(64,8) NULL,
	`refund_amt` DECIMAL(20,2) NULL,
	`tds_deduct` DECIMAL(20,2) NULL,
	`new_ittds` DECIMAL(20,2) NULL,
	`TOT_DEDUCTION` DECIMAL(51,4) NULL,
	`TOT_PAYABLE` DECIMAL(50,0) NULL,
	`TOBE_PAID` DECIMAL(58,0) NULL,
	`notefile_id` INT(11) NULL,
	`proceeding_id` INT(11) NULL,
	`gross_payable` DECIMAL(20,2) NULL,
	`net_payable` DECIMAL(20,2) NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_inv_prs
DROP VIEW IF EXISTS `v_inv_prs`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_inv_prs` (
	`SUPPLIER` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_id` INT(11) NULL,
	`supplier_id` INT(11) NULL,
	`bidder_id` INT(11) NULL,
	`ITEM` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`purchase_id` INT(11) NULL,
	`PONO` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`PODT` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`POFILE_NO` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`bank_accno` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`bank_ifsc` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`bank_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`INVNO` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`INVDT` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`invoice_id` INT(11) NOT NULL,
	`invoice_processid` INT(11) NOT NULL,
	`invoice_process_status` INT(11) NULL,
	`PTERM` INT(11) NULL,
	`RECOM_PERCENT` INT(11) NULL,
	`INVWISE_PAYABLE` DECIMAL(64,8) NULL,
	`refund_amt` DECIMAL(20,2) NULL,
	`tds_deduct` DECIMAL(20,2) NULL,
	`TOT_DEDUCTION` DECIMAL(50,4) NULL,
	`TOT_PAYABLE` DECIMAL(49,0) NULL,
	`TOBE_PAID` DECIMAL(58,0) NULL,
	`notefile_id` INT(11) NULL,
	`proceeding_id` INT(11) NULL,
	`gross_payable` DECIMAL(20,2) NULL,
	`net_payable` DECIMAL(20,2) NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_itequip_details
DROP VIEW IF EXISTS `v_itequip_details`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_itequip_details` (
	`stock_id` INT(11) NOT NULL,
	`ite_office_id` INT(11) NULL,
	`acc_user_id` INT(11) NULL,
	`ite_equip_id` INT(11) NULL,
	`ite_brand_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`ite_model` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`ite_stockregno` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`ite_serial_no` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`it_location_id` INT(11) NOT NULL,
	`ite_location_qty` INT(11) NULL,
	`trans_from` INT(11) NULL COMMENT 'From Location Id',
	`trans_date` DATE NULL COMMENT 'Transfer Date ( entry on stock inward by transfer)',
	`transout_qty` INT(11) NULL COMMENT 'Transfer out Qty  (update on outward)',
	`ite_stock_buyback` INT(11) NULL COMMENT '1 : Yes 2 : No',
	`ite_working_status` INT(11) NULL,
	`ite_warranty_status` INT(11) NULL,
	`ite_warranty_upto` DATE NULL,
	`ite_service_provider_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`ite_service_person` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`ite_service_email` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`ite_service_mobile` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`ite_service_phone` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`ite_service_fax` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`ite_remarks` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`stock_confirm` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`entry_on` TIMESTAMP NULL,
	`entry_by` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`update_on` TIMESTAMP NULL,
	`update_by` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`ipaddress` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`WORKING_STS` VARCHAR(3) NULL COLLATE 'utf8mb4_general_ci',
	`WARRANTY_STS` VARCHAR(11) NULL COLLATE 'utf8mb4_general_ci',
	`VALID_UPTO` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`WARRANTY_EXP` INT(1) NULL,
	`it_equip_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`employee_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`it_location_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_loi
DROP VIEW IF EXISTS `v_loi`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_loi` (
	`loi_id` INT(11) UNSIGNED NOT NULL,
	`bidder_id` INT(11) NULL,
	`loi_ref_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`loi_sch_id` INT(11) NOT NULL,
	`bidder_equip_id` INT(11) NOT NULL,
	`bidder_spareprice_id` INT(11) NULL COMMENT 'FOR BIDDER SPARE ID & PRE NAMED: procure_item_spare_id',
	`sanction_allotment_id` INT(11) NOT NULL,
	`loi_sch_qty` INT(11) NOT NULL,
	`QTY` DECIMAL(32,0) NULL,
	`UNIT_PRICE` DECIMAL(56,2) NULL,
	`PRICE` DECIMAL(55,2) NULL,
	`procure_id` INT(11) NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_loisch_details
DROP VIEW IF EXISTS `v_loisch_details`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_loisch_details` (
	`loi_id` INT(11) UNSIGNED NOT NULL,
	`loi_ref_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`loi_file_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`LOIDT` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`loi_sch_id` INT(11) NOT NULL,
	`bidder_equip_id` INT(11) NOT NULL,
	`bidder_id` INT(11) NOT NULL,
	`supplier_id` INT(11) NOT NULL,
	`supplier_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`supplier_address` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_item_id` INT(11) NULL,
	`procure_no` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`procure_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`equip_code` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`equip_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`sanction_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`sanction_allotment_id` INT(11) NOT NULL,
	`district_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`dept_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`project_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`scheme_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`loi_sch_qty` INT(11) NOT NULL,
	`UNIT_PRICE` VARCHAR(110) NOT NULL COLLATE 'utf8mb4_general_ci',
	`TOT_LOISCH_PRICE` VARCHAR(122) NOT NULL COLLATE 'utf8mb4_general_ci',
	`security_deposit` DECIMAL(20,2) NULL,
	`LOISCH_SD` VARCHAR(122) NULL COLLATE 'utf8mb4_general_ci',
	`LOISTS` CHAR(50) NULL COMMENT 'IC = In Complete; NYV = Not Yet Verified; NYA = Not Yet Approved; A = Approved; CAN = Cancelled; ' COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_loisch_itemwise
DROP VIEW IF EXISTS `v_loisch_itemwise`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_loisch_itemwise` (
	`procure_id` INT(11) NULL,
	`procure_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_item_id` INT(11) NULL,
	`equip_id` INT(11) NULL,
	`procure_item_spare_id` INT(11) NULL,
	`equip_spare_id` INT(11) NULL,
	`bidder_id` INT(11) NULL,
	`supplier_id` INT(11) NULL,
	`supplier_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`bidder_equip_id` INT(11) NULL,
	`bidder_spareprice_id` INT(11) NOT NULL,
	`spare_make` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`spare_basicprice` DECIMAL(20,2) NOT NULL,
	`spare_salestax` DECIMAL(20,2) NOT NULL,
	`spare_custtax` DECIMAL(20,2) NOT NULL,
	`spare_misc` DECIMAL(20,2) NOT NULL,
	`equip_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_spare_name` TEXT NULL COLLATE 'latin1_swedish_ci',
	`master_siunit_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_mainequip_price
DROP VIEW IF EXISTS `v_mainequip_price`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_mainequip_price` (
	`bidder_id` INT(11) NULL,
	`bidder_equip_id` INT(11) NOT NULL,
	`pbid_id` INT(11) NULL,
	`pbid_currency` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`pbid_basicprice` DECIMAL(20,2) NULL,
	`pbid_salestax` DECIMAL(20,2) NULL,
	`pbid_custtax` DECIMAL(20,2) NULL,
	`pbid_misc` DECIMAL(20,2) NULL,
	`old_pbid_basicprice` DECIMAL(20,2) NULL,
	`old_pbid_salestax` DECIMAL(20,2) NULL,
	`old_pbid_custtax` DECIMAL(20,2) NULL,
	`old_pbid_misc` DECIMAL(20,2) NULL,
	`is_negotiated` INT(11) NULL COMMENT '1- NEGOTIATED , 2- YES & NOT CNF, 3 = NOT YET',
	`MAIN_EQUIP_PRICE` DECIMAL(23,2) NULL,
	`OLD_MAIN_EQUIP_PRICE` DECIMAL(23,2) NULL,
	`MAIN_EQUIP_PRICE_EXLSTAX` DECIMAL(22,2) NULL,
	`npvadjust` DECIMAL(20,2) NULL,
	`gst_active` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`cgst_ratio` DECIMAL(10,2) NULL,
	`cgst_amt` DECIMAL(20,2) NULL,
	`sgst_ratio` DECIMAL(10,2) NULL,
	`sgst_amt` DECIMAL(20,2) NULL,
	`igst_ratio` DECIMAL(10,2) NULL,
	`igst_amt` DECIMAL(20,2) NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_master_equipment
DROP VIEW IF EXISTS `v_master_equipment`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_master_equipment` (
	`equip_id` INT(11) NOT NULL,
	`equip_code` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`equip_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`parent_equip_id` INT(11) NULL,
	`equip_type_id` INT(11) NOT NULL,
	`equip_type_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`hsn_code` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`equip_category_id` INT(11) NULL,
	`equip_category_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`dept_id` INT(11) NULL,
	`dept_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_specify` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_status` INT(11) NOT NULL COMMENT '1-> Activated, 2-> Deactivated ',
	`entered_on` TIMESTAMP NULL,
	`entered_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`updated_on` TIMESTAMP NULL,
	`updated_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_master_institution
DROP VIEW IF EXISTS `v_master_institution`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_master_institution` (
	`institution_id` INT(11) NOT NULL,
	`district_id` INT(11) NOT NULL,
	`district_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_type_id` INT(11) NOT NULL,
	`institution_type_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_category_id` INT(11) NOT NULL,
	`institution_category_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`institution_address` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_email` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_phone` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_fax` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_status` INT(11) NULL COMMENT '1-> Activated, 2-> Deactivated ',
	`entered_on` TIMESTAMP NULL,
	`entered_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`updated_on` TIMESTAMP NULL,
	`updated_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_master_project
DROP VIEW IF EXISTS `v_master_project`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_master_project` (
	`fn_year_id` INT(11) NOT NULL,
	`AS_FN_YEAR` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`project_master_id` INT(11) NOT NULL,
	`project_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`project_remarks` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`project_activation` INT(11) NOT NULL COMMENT '1->Activate, 2->De-activate',
	`entered_on` TIMESTAMP NULL,
	`entered_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`updated_on` TIMESTAMP NULL,
	`updated_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_procure_details
DROP VIEW IF EXISTS `v_procure_details`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_procure_details` (
	`procure_id` INT(11) NOT NULL,
	`fn_year_id` INT(11) NULL,
	`fn_year` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_no` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`procure_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`procure_startdt` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`procure_enddt` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`techbid_opendt` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`procure_basket_item_id` INT(11) NOT NULL,
	`tag_id` INT(11) NOT NULL,
	`tag_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`contract_id` INT(11) NULL,
	`contract_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_type_id` INT(11) NULL COMMENT '1 = By Tender (T); 2 = By Quotation (Q); ',
	`procure_type_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_equip_type_id` INT(11) NOT NULL,
	`procure_equip_type_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_fees` VARCHAR(62) NULL COLLATE 'utf8mb4_general_ci',
	`procure_emd` VARCHAR(62) NULL COLLATE 'utf8mb4_general_ci',
	`security_deposit` DECIMAL(20,2) NULL,
	`ssi_exemption` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`REQSSI` VARCHAR(11) NULL COLLATE 'utf8mb4_general_ci',
	`warranty_period` INT(11) NOT NULL,
	`tender_amcslab` INT(11) NULL,
	`tender_camcslab` INT(11) NULL,
	`demo_required` INT(11) NOT NULL COMMENT '1-> Yes, 2->No',
	`REQDM` VARCHAR(12) NOT NULL COLLATE 'utf8mb4_general_ci',
	`amc_camc_consider` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`REQSC` VARCHAR(12) NULL COLLATE 'utf8mb4_general_ci',
	`REQCS` VARCHAR(12) NULL COLLATE 'utf8mb4_general_ci',
	`min_pmvisit` INT(11) NULL,
	`equip_uptime` DECIMAL(20,2) NULL,
	`equip_maxresponse` INT(11) NULL,
	`maxresponse_unit` INT(11) NULL,
	`RESPONSE_TIME` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`delivery_period` INT(11) NULL,
	`delivery_period_id` INT(11) NULL,
	`DELIVERY_TIME` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`delivery_period_wo` INT(11) NULL COMMENT 'Turnkey (WO) based Delivery Period',
	`ld_min` DECIMAL(20,2) NULL,
	`ld_period_id` INT(11) NULL,
	`LDMIN_TIME` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`ld_max` DECIMAL(20,2) NULL,
	`delivery_to` INT(11) NULL COMMENT '1- Concenerd Institution, 2 - Concenered District WhareHouse',
	`DELIVERYTO` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`payratio_id` INT(11) NULL,
	`int_payratio` INT(11) NULL,
	`final_payratio` INT(11) NULL,
	`final_payratioII` INT(11) NULL,
	`PAYRATIO` VARCHAR(35) NULL COLLATE 'utf8mb4_general_ci',
	`turnover` VARCHAR(47) NULL COLLATE 'utf8mb4_general_ci',
	`warranty_cert_req` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`REQWC` VARCHAR(12) NULL COLLATE 'utf8mb4_general_ci',
	`install_report_req` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`REQIR` VARCHAR(12) NULL COLLATE 'utf8mb4_general_ci',
	`material_receive_cert` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`REQMRC` VARCHAR(12) NULL COLLATE 'utf8mb4_general_ci',
	`sticker` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`REQSTK` VARCHAR(12) NULL COLLATE 'utf8mb4_general_ci',
	`performance_cert_req` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`REQPC` VARCHAR(12) NULL COLLATE 'utf8mb4_general_ci',
	`photograph_req` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`REQPH` VARCHAR(12) NULL COLLATE 'utf8mb4_general_ci',
	`procure_remarks` TEXT NULL COLLATE 'latin1_swedish_ci',
	`procure_cancel` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`PRC_CANCEL_DT` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`procure_cancel_remarks` TEXT NULL COLLATE 'latin1_swedish_ci',
	`procure_confirm` INT(11) NULL COMMENT '1 =  APPROVED, 2 = COMPLETE & NOT YET  APPROVED,  3 = INCOMPLETE',
	`procure_bidder_entry` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`entered_on` TIMESTAMP NULL,
	`entered_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`updated_on` TIMESTAMP NULL,
	`updated_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_procure_item_details
DROP VIEW IF EXISTS `v_procure_item_details`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_procure_item_details` (
	`procure_item_id` INT(11) NOT NULL,
	`procure_id` INT(11) NOT NULL,
	`procure_basket_item_id` INT(11) NULL COMMENT 'RENAMED : tender_sanction_equip_id',
	`equip_id` INT(11) NULL,
	`procure_item_qty` INT(11) NULL,
	`procure_equip_type_id` INT(11) NULL,
	`procure_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_confirm` INT(11) NULL COMMENT '1 =  APPROVED, 2 = COMPLETE & NOT YET  APPROVED,  3 = INCOMPLETE',
	`procure_basket_id` INT(11) NULL,
	`equip_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_equip_type_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_purchase
DROP VIEW IF EXISTS `v_purchase`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_purchase` (
	`purchase_qty` DECIMAL(20,3) NULL,
	`sanction_allotment_id` INT(11) NOT NULL,
	`purchase_sch_id` INT(11) NOT NULL,
	`purchase_id` INT(11) NOT NULL,
	`bidder_equip_id` INT(11) NOT NULL,
	`bidder_spareprice_id` INT(11) NULL,
	`equip_id` INT(11) NOT NULL COMMENT '#',
	`delivery_confirm_date` DATE NULL,
	`delivery_period_extn` INT(11) NULL COMMENT 'IN WEEKS',
	`procure_id` INT(11) NULL COMMENT '#',
	`bidder_id` INT(11) NULL,
	`govtagency_item_id` INT(11) NULL,
	`govtagency_id` INT(11) NULL,
	`purchase_type` INT(11) NULL COMMENT '1 - PO through LOI, 2 - Direct PO, 3 - Quotation, 4 - Govt, 5 - WO',
	`purchase_no` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`purchase_date` DATE NULL,
	`purchase_file_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`bill_file_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`purchase_status` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`purchase_cancel` TIMESTAMP NULL,
	`schedule_canceled` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`sanction_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`sanction_order_id` INT(11) NULL,
	`AS_DATE` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`institution_id` INT(11) NULL,
	`district_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`dept_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`project_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`SCHID` INT(11) NULL,
	`scheme_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`qtyamend_from` INT(11) NULL COMMENT 'POSCHID',
	`equip_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_type_id` INT(11) NULL,
	`alloted_qty` DECIMAL(20,2) NULL,
	`procure_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_startdt` DATE NULL,
	`pricebid_open_dt` DATE NULL,
	`final_res_dt` DATE NULL,
	`procure_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`install_report_req` INT(11) NULL COMMENT '1-> Yes, 2->No',
	`tender_amcslab` INT(11) NULL,
	`tender_camcslab` INT(11) NULL,
	`supplier_id` INT(11) NULL,
	`supplier_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`supplier_gstin` VARCHAR(500) NULL COMMENT 'Goods and Services Tax' COLLATE 'latin1_swedish_ci',
	`warranty_period` INT(11) NULL,
	`min_pmvisit` INT(11) NULL,
	`DELIVERY` VARCHAR(512) NULL COLLATE 'latin1_swedish_ci',
	`TaxableAmount` DECIMAL(22,2) NULL,
	`TaxAmount` DECIMAL(20,2) NULL,
	`OrderValue` DECIMAL(43,5) NULL,
	`UNIT_PRICE` DECIMAL(23,2) NULL,
	`IS_SPARE` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci',
	`SPARE_NAME` TEXT NULL COLLATE 'latin1_swedish_ci',
	`MODEL` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_purchase_order
DROP VIEW IF EXISTS `v_purchase_order`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_purchase_order` (
	`purchase_id` INT(11) NOT NULL,
	`purchase_no` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`PUR_DATE` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`purchase_status` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`procure_id` INT(11) NULL,
	`procure_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`procure_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`bidder_id` INT(11) NULL,
	`dealer_id` INT(11) NULL,
	`bidder_equip_id` INT(11) NOT NULL,
	`SID` INT(11) NULL,
	`supplier_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`supplier_address` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`contact_person` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`supplier_mobile` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`supplier_phone` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`supplier_email` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_id` INT(11) NULL,
	`equip_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`bidder_make_model` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_purchase_qty
DROP VIEW IF EXISTS `v_purchase_qty`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_purchase_qty` (
	`bidder_id` INT(11) NULL,
	`purchase_id` INT(11) NOT NULL,
	`purchase_no` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`PUR_DATE` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`purchase_status` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`TOT_PO_QTY` DECIMAL(42,3) NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_purchase_schdule
DROP VIEW IF EXISTS `v_purchase_schdule`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_purchase_schdule` (
	`purchase_id` INT(11) NOT NULL,
	`bidder_id` INT(11) NULL,
	`purchase_no` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`purchase_file_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`purchase_creationdate` DATE NULL,
	`purchase_date` DATE NULL,
	`purchase_status` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`purchase_sch_id` INT(11) NULL,
	`bidder_equip_id` INT(11) NULL,
	`equip_id` INT(11) NULL COMMENT '#',
	`bidder_spareprice_id` INT(11) NULL,
	`sanction_allotment_id` INT(11) NULL,
	`purchase_type` INT(11) NULL COMMENT '1 - PO through LOI, 2 - Direct PO, 3 - Quotation, 4 - Govt, 5 - WO',
	`purchase_qty` DECIMAL(20,3) NULL,
	`purchase_basicprice` DECIMAL(20,2) NULL,
	`purchase_taxamt` DECIMAL(20,2) NULL,
	`purchase_cduty` DECIMAL(20,2) NULL,
	`purchase_misc` DECIMAL(20,2) NULL,
	`purchase_cgst` DECIMAL(20,2) NULL,
	`purchase_sgst` DECIMAL(20,2) NULL,
	`purchase_igst` DECIMAL(20,2) NULL,
	`purchase_sch_unitcost` DECIMAL(20,2) NULL,
	`supplier_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_sanction_allotment
DROP VIEW IF EXISTS `v_sanction_allotment`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_sanction_allotment` (
	`sanction_allotment_id` INT(11) NOT NULL,
	`district_id` INT(11) NOT NULL,
	`dept_id` INT(11) NOT NULL,
	`institution_id` INT(11) NOT NULL,
	`sanction_equip_id` INT(11) NOT NULL,
	`sanction_order_id` INT(11) NULL,
	`sanction_project_id` INT(11) NULL,
	`sanction_scheme_id` INT(11) NULL,
	`alloted_qty` DECIMAL(20,2) NOT NULL,
	`relocate_from` INT(11) NULL,
	`sanction_allotment_remarks` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`sanction_allotment_status` INT(11) NULL COMMENT '1 - Active 0 - Deactive',
	`entered_on` TIMESTAMP NULL,
	`entered_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`updated_on` TIMESTAMP NULL,
	`updated_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`ipaddress` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`active` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`gen_remarks` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_type_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_category_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`district_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`dept_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`sanction_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`AS_FN_YEAR` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`AS_DATE` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`project_master_id` INT(11) NULL,
	`project_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`SCHID` INT(11) NULL,
	`scheme_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_id` INT(11) NULL,
	`equip_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`hsn_code` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`equip_type_id` INT(11) NULL,
	`sanction_equip_qty` DECIMAL(20,2) NULL,
	`sanction_fund_amt` DECIMAL(20,2) NULL,
	`TOT_AS_AMT` DECIMAL(30,2) NULL,
	`sanction_status` CHAR(50) NULL COMMENT '1 =  INCOMPLETE, 2 = COMPLETE & NOT APPROVED,  3 = APPROVED' COLLATE 'latin1_swedish_ci',
	`EST_AMT` DECIMAL(20,2) NULL,
	`moved_to_basket` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`PROJECT_MASTER_FYID` INT(11) NULL,
	`fn_year_id` INT(11) NULL COMMENT 'Sanction Finance Year',
	`is_freezed` INT(11) NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_sanction_details
DROP VIEW IF EXISTS `v_sanction_details`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_sanction_details` (
	`sanction_order_id` INT(11) NOT NULL,
	`fn_year_id` INT(11) NOT NULL COMMENT 'Sanction Finance Year',
	`proforma_id` INT(11) NULL,
	`sanction_date` DATE NOT NULL,
	`sanction_no` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`sanction_amt` DECIMAL(30,2) NULL,
	`utr_no` BIGINT(20) NULL,
	`utr_txn_date` DATE NULL,
	`sanction_remarks` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`sanction_status` CHAR(50) NOT NULL COMMENT '1 =  INCOMPLETE, 2 = COMPLETE & NOT APPROVED,  3 = APPROVED' COLLATE 'latin1_swedish_ci',
	`is_fund_raised` CHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`ref_fund_raised` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`is_revert` INT(11) NULL,
	`sanctionrevert_remarks` TEXT NULL COLLATE 'latin1_swedish_ci',
	`is_freezed` INT(11) NULL,
	`freezed_remarks` TEXT NULL COLLATE 'latin1_swedish_ci',
	`freezed_on` DATE NULL,
	`un_freezed_remarks` TEXT NULL COLLATE 'latin1_swedish_ci',
	`entered_on` TIMESTAMP NULL,
	`entered_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`updated_on` TIMESTAMP NULL,
	`updated_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`complete_by` INT(11) NULL,
	`verify_by` INT(11) NULL,
	`approved_by` INT(11) NULL,
	`ipaddress` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`active` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`gen_remarks` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`sanction_project_id` INT(11) NULL,
	`project_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`project_master_id` INT(11) NULL,
	`sanction_scheme_id` INT(11) NULL,
	`scheme_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`scheme_master_id` INT(11) NULL,
	`equip_id` INT(11) NULL,
	`sanction_equip_id` INT(11) NULL,
	`equip_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`sanction_equip_qty` DECIMAL(20,2) NULL,
	`EST_UNIT_PRICE` DECIMAL(20,2) NULL,
	`sanction_allotment_id` INT(11) NULL,
	`district_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_id` INT(11) NULL,
	`institution_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`dept_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`alloted_qty` DECIMAL(20,2) NULL,
	`AS_FN_YEAR` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_sanction_equip
DROP VIEW IF EXISTS `v_sanction_equip`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_sanction_equip` (
	`sanction_equip_id` INT(11) NOT NULL,
	`parent_sanction_equip_id` INT(11) NOT NULL,
	`sanction_order_id` INT(11) NULL,
	`sanction_project_id` INT(11) NULL,
	`sanction_scheme_id` INT(11) NOT NULL,
	`equip_id` INT(11) NOT NULL,
	`spare_only` CHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`sanction_equip_qty` DECIMAL(20,2) NOT NULL,
	`sanction_fund_amt` DECIMAL(20,2) NOT NULL,
	`unitcost_revised` CHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`existing_est_unitcost` DECIMAL(20,2) NULL,
	`sanction_equip_remarks` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`moved_to_basket` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`procure_basket_id` INT(11) NULL,
	`entered_on` TIMESTAMP NULL,
	`entered_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`updated_on` TIMESTAMP NULL,
	`updated_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`ipaddress` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`active` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`readonly` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`gen_remarks` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`PARENT_EQUIP_NAME` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`EST_PRICE` DECIMAL(40,4) NOT NULL,
	`EST_UNIT_PRICE` DECIMAL(20,2) NOT NULL,
	`equip_type_id` INT(11) NULL,
	`equip_type_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_category_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_code` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`equip_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`hsn_code` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`parent_equip_id` INT(11) NULL,
	`PROJECT_MASTER_FYID` INT(11) NULL,
	`project_master_id` INT(11) NULL,
	`project_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`SCHID` INT(11) NULL,
	`scheme_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`sanction_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`fn_year_id` INT(11) NULL COMMENT 'Sanction Finance Year',
	`utr_no` BIGINT(20) NULL,
	`UTR_TXN_DT` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`AS_FN_YEAR` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`sanction_status` CHAR(50) NULL COMMENT '1 =  INCOMPLETE, 2 = COMPLETE & NOT APPROVED,  3 = APPROVED' COLLATE 'latin1_swedish_ci',
	`AS_DATE` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`TOT_AS_AMT` DECIMAL(30,2) NULL,
	`is_freezed` INT(11) NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_sanction_order
DROP VIEW IF EXISTS `v_sanction_order`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_sanction_order` (
	`fn_year_id` INT(11) NOT NULL COMMENT 'Sanction Finance Year',
	`AS_FN_YEAR` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`sanction_order_id` INT(11) NOT NULL,
	`sanction_no` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`sanction_date` DATE NOT NULL,
	`AS_DATE` VARCHAR(40) NULL COLLATE 'utf8mb4_general_ci',
	`sanction_amt` DECIMAL(30,2) NULL,
	`sanction_status` CHAR(50) NOT NULL COMMENT '1 =  INCOMPLETE, 2 = COMPLETE & NOT APPROVED,  3 = APPROVED' COLLATE 'latin1_swedish_ci',
	`project_master_id` INT(11) NULL,
	`is_revert` INT(11) NULL,
	`sanctionrevert_remarks` TEXT NULL COLLATE 'latin1_swedish_ci',
	`sanction_remarks` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_sanction_order_projects
DROP VIEW IF EXISTS `v_sanction_order_projects`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_sanction_order_projects` (
	`fn_year_id` INT(11) NOT NULL COMMENT 'Sanction Finance Year',
	`AS_FN_YEAR` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`sanction_order_id` INT(11) NOT NULL,
	`sanction_no` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`sanction_project_id` INT(11) NOT NULL,
	`project_master_id` INT(11) NOT NULL,
	`project_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`sanction_project_remarks` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`sanction_status` CHAR(50) NOT NULL COMMENT '1 =  INCOMPLETE, 2 = COMPLETE & NOT APPROVED,  3 = APPROVED' COLLATE 'latin1_swedish_ci',
	`entered_on` TIMESTAMP NULL,
	`entered_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`updated_on` TIMESTAMP NULL,
	`updated_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`readonly` CHAR(50) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_sanction_order_schemes
DROP VIEW IF EXISTS `v_sanction_order_schemes`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_sanction_order_schemes` (
	`fn_year_id` INT(11) NOT NULL COMMENT 'Sanction Finance Year',
	`AS_FN_YEAR` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`sanction_order_id` INT(11) NOT NULL,
	`sanction_no` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`PROJECT_MASTER_FYID` INT(11) NOT NULL,
	`sanction_project_id` INT(11) NOT NULL,
	`project_master_id` INT(11) NOT NULL,
	`project_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`sanction_scheme_id` INT(11) NOT NULL,
	`scheme_master_id` INT(11) NOT NULL,
	`scheme_name` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`sanction_scheme_remarks` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`sanction_status` CHAR(50) NOT NULL COMMENT '1 =  INCOMPLETE, 2 = COMPLETE & NOT APPROVED,  3 = APPROVED' COLLATE 'latin1_swedish_ci',
	`entered_on` TIMESTAMP NULL,
	`entered_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`updated_on` TIMESTAMP NULL,
	`updated_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`readonly` CHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`SCHEME_FUND_RECEIVED` DECIMAL(52,2) NOT NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_sd_details
DROP VIEW IF EXISTS `v_sd_details`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_sd_details` (
	`sd_rec_id` INT(11) NOT NULL,
	`sd_rec_for` INT(11) NOT NULL COMMENT '1-> LOI 2-> PO',
	`sd_bgexpiredt` DATE NULL COMMENT 'Present or Extended BG Exp Date',
	`SD_FOR` VARCHAR(7) NOT NULL COLLATE 'utf8mb4_general_ci',
	`SUP_NAME` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`PRC_NAME` TEXT NULL COLLATE 'latin1_swedish_ci',
	`loi_id` INT(11) UNSIGNED NULL,
	`loi_ref_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`LOI_DT` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`purchase_id` INT(11) NULL,
	`purchase_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`PO_DT` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`sd_paymode` INT(11) NULL COMMENT '1 : DD  2 : BG  3 : Adjust With Payment 4 : FD',
	`PAYMODE` VARCHAR(2) NULL COLLATE 'utf8mb4_general_ci',
	`bank_id` INT(11) NULL,
	`bank_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`sd_ref_number` VARCHAR(500) NOT NULL COLLATE 'latin1_swedish_ci',
	`SD_ISSUE_DT` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`SD_REC_DT` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`BG_EXP_DT` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci',
	`SD_AMT` DECIMAL(20,2) NULL,
	`sd_remarks` TEXT NULL COLLATE 'latin1_swedish_ci',
	`entered_on` TIMESTAMP NULL,
	`entered_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`updated_on` TIMESTAMP NULL,
	`updated_by` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`ipaddress` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_spare_price
DROP VIEW IF EXISTS `v_spare_price`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_spare_price` (
	`bidder_id` INT(11) NULL,
	`bidder_equip_id` INT(11) NOT NULL,
	`OLD_SPARE_PRICE` DECIMAL(55,2) NULL,
	`SPARE_PRICE` DECIMAL(55,2) NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_tag_details
DROP VIEW IF EXISTS `v_tag_details`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_tag_details` (
	`fn_year_id` INT(11) NULL,
	`fn_year` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`start_year` INT(11) NULL,
	`end_year` INT(11) NULL,
	`procure_type_id` INT(11) NOT NULL COMMENT '1 = By Tender (T); 2 = By Quotation (Q); ',
	`procure_type_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`tag_id` INT(11) NOT NULL,
	`tag_no` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`TAG` VARCHAR(512) NULL COLLATE 'latin1_swedish_ci',
	`tag_remarks` MEDIUMTEXT NULL COLLATE 'latin1_swedish_ci',
	`PRC_IC` BIGINT(21) NULL,
	`PRC_NYV` BIGINT(21) NULL,
	`PRC_A` BIGINT(21) NULL,
	`PRC_CAN` BIGINT(21) NULL,
	`PRC_TOT` BIGINT(21) NULL
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_workint
DROP VIEW IF EXISTS `v_workint`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_workint` (
	`workint_id` INT(11) NOT NULL,
	`sanction_allotment_id` INT(11) NULL,
	`institution_id` INT(11) NULL,
	`district_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`institution_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`dept_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`project_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`scheme_name` VARCHAR(500) NULL COLLATE 'latin1_swedish_ci',
	`LOCATION` TEXT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view ems_test.v_amc_camc_price
DROP VIEW IF EXISTS `v_amc_camc_price`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_amc_camc_price`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_amc_camc_price` AS SELECT 

	T1.bidder_id, 
	
	T1.bidder_equip_id, 
	
	T3.tender_amcslab, 
	
	T3.tender_camcslab, 
	
	T3.amc_camc_consider, 
	
	(CASE WHEN T3.amc_camc_consider = 1 THEN "YES"  WHEN T3.amc_camc_consider = 2 THEN "NO" ELSE "NA" END) AS CONAMC,
	
	T1.techEvaluate_status, 
	
	T1.demo_status,
		
 	(SELECT SUM(S1.amc_charge) FROM bidder_amc AS S1 WHERE S1.bidder_equip_id = T1.bidder_equip_id) AS AMC_PRICE,
	
 	(SELECT SUM(S2.camc_charge) FROM bidder_camc AS S2 WHERE S2.bidder_equip_id = T1.bidder_equip_id) AS CAMC_PRICE

FROM bidder_equipments AS T1

LEFT JOIN bidder_details AS T2 ON (T2.bidder_id = T1.bidder_id)

LEFT JOIN procure_details AS T3 ON (T3.procure_id = T2.procure_id)

GROUP BY T1.bidder_equip_id

ORDER BY T3.amc_camc_consider ;


-- Dumping structure for view ems_test.v_bidder_details
DROP VIEW IF EXISTS `v_bidder_details`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_bidder_details`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_bidder_details` AS SELECT 

	T4.tag_id, 
	
	T9.tag_no, 
	
	T9.procure_type_id, 
	
	T11.procure_type_name,
	
	T4.procure_id, 
	
	T4.procure_no, 
	
	T4.procure_name, 
	
	T4.procure_publishdt, 
	
	T4.procure_equip_type_id, 
	
	T10.procure_equip_type_name, 
	
	T4.security_deposit, 
	
	T4.warranty_period, 
	
	T4.tender_amcslab, 
	
	T4.tender_camcslab, 
	
	T4.amc_camc_consider, 
	
	T4.techbid_opendt, 
	
	T4.techeve_res_dt, 
	
	T4.procure_clarification_dt, 
	
	T4.procure_committe_dt, 
	
	T4.rep_techres_dt,
	
	T4.demo_dt, 
	
	T4.demo_res_dt, 
	
	T4.rep_demores_dt, 
	
	T4.pricebid_open_dt, 
	
	T4.final_res_dt, 
	
	T4.rep_priceres_dt, 
	
	T4.delivery_to,
	
	T4.valid_extn,
	
	T4.valid_extn_dt,
	
	(CASE 
	
		WHEN T4.valid_extn = "Y" THEN T4.valid_extn_dt
	
		ELSE (DATE_ADD(T4.pricebid_open_dt, INTERVAL 2 YEAR) - INTERVAL 1 DAY)
	
	END) AS VALIDITY,

	(CASE 
	
		WHEN T4.valid_extn = "Y" THEN DATE_FORMAT((T4.valid_extn_dt),"%d-%b-%Y")
	
		ELSE DATE_FORMAT((DATE_ADD(T4.pricebid_open_dt, INTERVAL 2 YEAR) - INTERVAL 1 DAY),"%d-%b-%Y")
	
	END) AS VALID_UPTO,
	
	T3.procure_item_id, 
	
	T7.equip_id, 
	
	T7.parent_equip_id,
	
	T7.equip_code, 
	
	T7.equip_name, 
	
	T1.item_alias,
	
	T7.dept_id,
	
	T3.procure_item_qty,
	
	T3.procure_item_qty_extn,
	
	T1.bidder_id, 
	
	T1.bidder_equip_id, 
	
	T8.supplier_id, 
	
	T8.supplier_name, 
	
	T8.supplier_gstin,
	
	T8.supplier_address, 
	
	T8.contact_person, 
	
	T8.supplier_mobile, 
	
	T8.supplier_phone, 
	
	T8.supplier_email,
	
	(SELECT COUNT(S1.suppliers_bank_id) FROM master_suppliers_bank AS S1 WHERE S1.supplier_id = T8.supplier_id) AS IsAvailBank, 
	
	T1.bidder_make_model,
	
	T1.techEvaluate_status, 
	
	(CASE WHEN T1.techEvaluate_status = 1 THEN 'PENDING' WHEN T1.techEvaluate_status = 2 THEN 'PASSED' ELSE 'FAILED' END) TECHEVA_RES,
	
	T1.demo_status, 
	
	(CASE WHEN T1.demo_status = 1 THEN 'PENDING' WHEN T1.demo_status = 2 THEN 'PASSED' ELSE 'FAILED' END) DEMO_RES,
	
	T2.bidder_confirm, 
	
	T1.promote_supplier, 
	
	T1.loi_issued,
	
	T1.rc_closed,
	
-- 	(CASE WHEN 	T1.loi_issued = 1 THEN (SELECT loi_ref_no FROM loi WHERE loi.bidder_id = T1.bidder_id AND loi.loi_status = "A") ELSE T1.loi_type END) AS LOI_NO,

	(CASE WHEN 	T1.loi_issued = 1 THEN COALESCE((SELECT loi_ref_no FROM loi WHERE loi.bidder_id = T1.bidder_id AND loi.loi_status = "A"),T1.loi_type) ELSE T1.loi_type END) AS LOI_NO,
		
	T4.procure_confirm, 
	
	T4.procure_cancel,
	
	T3.procure_item_cancelled,
	
	(SELECT S1.pbid_currency FROM bidder_price AS S1 WHERE S1.bidder_equip_id = T1.bidder_equip_id) AS CURRENCY_TYP,
	
	T2.publish_intitution

FROM bidder_equipments AS T1

LEFT JOIN bidder_details AS T2 ON (T2.bidder_id = T1.bidder_id)

LEFT JOIN procure_item_details AS T3 ON (T3.procure_item_id = T1.procure_item_id)

LEFT JOIN procure_details AS T4 ON (T4.procure_id = T2.procure_id) 

LEFT JOIN procure_basket_items AS T5 ON (T5.procure_basket_item_id = T3.procure_basket_item_id)

-- LEFT JOIN procure_basket AS T6 ON (T6.procure_basket_id = T5.procure_basket_id)

LEFT JOIN master_equipment AS T7 ON (T7.equip_id = T5.equip_id)

LEFT JOIN master_supplier AS T8 ON (T8.supplier_id = T2.supplier_id)

LEFT JOIN tag_details AS T9 ON (T9.tag_id = T4.tag_id)

LEFT JOIN master_procure_equip_type AS T10 ON (T10.procure_equip_type_id = T4.procure_equip_type_id) 

LEFT JOIN master_procure_type AS T11 ON (T11.procure_type_id = T9.procure_type_id)

ORDER BY T4.tag_id, T4.procure_id

-- UPD @ 23 Jan 19 ;


-- Dumping structure for view ems_test.v_bidder_details_2
DROP VIEW IF EXISTS `v_bidder_details_2`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_bidder_details_2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_bidder_details_2` AS SELECT 

	T1.bidder_id,
	
	T3.supplier_id, T3.supplier_name, T3.supplier_address,
	
	T2.tag_id, T4.tag_no,
	
	T2.procure_id, T2.procure_no, T2.procure_name, T2.techbid_opendt, T2.techeve_res_dt, T2.procure_clarification_dt, T2.procure_committe_dt, T2.rep_techres_dt,
	
	T2.demo_dt, T2.demo_res_dt, T2.rep_demores_dt, T2.pricebid_open_dt, T2.final_res_dt, T2.rep_priceres_dt,
	
	T7.procure_type_name, T2.procure_equip_type_id, T5.procure_equip_type_name,
	
	T2.tender_amcslab, T2.tender_camcslab, T2.amc_camc_consider,
	
	T1.bidder_confirm, T2.procure_confirm

FROM bidder_details AS T1 

LEFT JOIN procure_details AS T2 ON (T2.procure_id = T1.procure_id) 

LEFT JOIN master_supplier AS T3 ON (T3.supplier_id = T1.supplier_id)

LEFT JOIN tag_details AS T4 ON (T4.tag_id = T2.tag_id)

LEFT JOIN master_procure_equip_type AS T5 ON (T5.procure_equip_type_id = T2.procure_equip_type_id) 

LEFT JOIN procure_basket_items AS T6 ON (T6.procure_basket_item_id = T2.procure_basket_item_id)

LEFT JOIN master_procure_type AS T7 ON (T7.procure_type_id = T6.procure_type_id) ;


-- Dumping structure for view ems_test.v_bidder_equiplist
DROP VIEW IF EXISTS `v_bidder_equiplist`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_bidder_equiplist`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_bidder_equiplist` AS SELECT 

	T1.bidder_id, T2.bidder_equip_id, T1.supplier_id, T3.supplier_name,
	
	T4.procure_id, T4.procure_no, T4.procure_name,
	
	T6.equip_id, T8.equip_code, T8.equip_name

FROM bidder_details AS T1

INNER JOIN bidder_equipments AS T2 ON (T2.bidder_id = T1.bidder_id)

INNER JOIN master_supplier AS T3 ON (T3.supplier_id = T1.supplier_id)

INNER JOIN procure_details AS T4 ON (T4.procure_id = T1.procure_id)

INNER JOIN procure_item_details AS T5  ON (T5.procure_item_id = T2.procure_item_id)

INNER JOIN procure_basket_items AS T6 ON (T6.procure_basket_item_id = T5.procure_basket_item_id)

-- INNER JOIN procure_basket AS T7 ON (T7.procure_basket_id = T6.procure_basket_id)

INNER JOIN master_equipment AS T8 ON (T8.equip_id = T6.equip_id)

ORDER BY T1.bidder_id, T6.equip_id 

-- UPD @ 07-10-2016 ;


-- Dumping structure for view ems_test.v_bidder_price
DROP VIEW IF EXISTS `v_bidder_price`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_bidder_price`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_bidder_price` AS SELECT 

	T1.bidder_id, 
	
	T1.bidder_equip_id, 
	
	T3.supplier_id, 
		
	T3.supplier_name,
	
	T3.supplier_gstin,
	
	T4.procure_item_qty,
	
	(SELECT COUNT(*) FROM bidder_details WHERE bidder_details.procure_id = T4.procure_id) AS BIDDER_CNT,
	
	T5.procure_id, 
	
	T5.procure_no, 
	
	T5.procure_startdt, 
	
	T5.final_res_dt,
	
	T5.procure_name,
	
	T5.tag_id, 
	
	T13.fn_year_id,
	
	T1.procure_item_id, 
	
	T8.equip_id, 
	
	T8.equip_code, 
	
	T8.equip_name, 
	
	T1.item_alias,
	
	T1.bidder_make_model,
	
	T12.master_siunit_name,
	
	T5.tender_amcslab, 
	
	T5.tender_camcslab, 
	
	T5.procure_equip_type_id, 
	
	T5.sticker,
	
	T5.install_report_req, 
	
	T5.warranty_period, 
	
	T5.security_deposit,
	
	T5.delivery_period, 
	
	T5.delivery_period_id, 
	
	(SELECT time_period_desc FROM master_time_period WHERE time_period_id = T5.delivery_period_id) AS DELIVERY_TIME,
	
	CONCAT(T5.delivery_period," ",(SELECT time_period_desc FROM master_time_period WHERE time_period_id = T5.delivery_period_id)) AS DELIVERY,
	
	T1.techEvaluate_status, 
	
	T1.demo_status, 
	
	T5.amc_camc_consider,
	
	T9.pbid_id,
	
	T9.gst_active,
	
	T9.pbid_currency,
	
	T9.pbid_basicprice, 
	
	T9.pbid_salestax, 
	
	T9.pbid_custtax, 
	
	T9.pbid_misc, 
	
	T9.cgst_ratio, T9.cgst_amt,
	
	T9.sgst_ratio, T9.sgst_amt,
	
	T9.igst_ratio, T9.igst_amt,
	
	MAIN_EQUIP_PRICE_EXLSTAX,
	
	T9.MAIN_EQUIP_PRICE, 
	
	T9.old_pbid_basicprice,

	T9.old_pbid_salestax,

	T9.old_pbid_custtax,

	T9.old_pbid_misc,
	
	T9.OLD_MAIN_EQUIP_PRICE,
	
	T9.npvadjust,
	
	T11.OLD_SPARE_PRICE,
	
	T11.SPARE_PRICE, 
	
	(IFNULL(T9.OLD_MAIN_EQUIP_PRICE,0) + IFNULL(T11.OLD_SPARE_PRICE,0)) AS OLD_UNIT_PRICE,
	
	(IFNULL(T9.MAIN_EQUIP_PRICE,0) + IFNULL(T11.SPARE_PRICE,0)) AS UNIT_PRICE,
	
	T10.AMC_PRICE, 
	
	T10.CAMC_PRICE, 
	
	calc_lower_price(T9.pbid_id,T5.warranty_period,T5.tender_camcslab) AS NPV,
	
	( IFNULL(T9.MAIN_EQUIP_PRICE,0) + IFNULL(T11.SPARE_PRICE,0) + IFNULL( calc_lower_price(T9.pbid_id,T5.warranty_period,T5.tender_camcslab) ,0) ) AS TOTAL_PRICE,
	
	T5.pricebid_open_dt, 
	
	(DATE_ADD(T5.pricebid_open_dt, INTERVAL 2 YEAR) - INTERVAL 1 DAY) AS EXPIRE,
	
	DATE_FORMAT((DATE_ADD(T5.pricebid_open_dt, INTERVAL 2 YEAR) - INTERVAL 1 DAY),"%d-%b-%Y") AS VALID_UPTO,
	
	IF(T5.valid_extn = "Y", T5.valid_extn, (DATE_ADD(T5.pricebid_open_dt, INTERVAL 2 YEAR) - INTERVAL 1 DAY)) AS EXTENDED_EXPIRE,
	
	T5.valid_extn,
	
	T5.valid_extn_dt,
	
	T5.procure_confirm,
	
	T5.procure_cancel,
	
	T9.is_negotiated, 
	
	T1.price_status, 
	
	T1.promote_supplier

FROM bidder_equipments AS T1

LEFT JOIN bidder_details AS T2 ON (T2.bidder_id = T1.bidder_id)

LEFT JOIN master_supplier T3 ON(T3.supplier_id = T2.supplier_id)

LEFT JOIN procure_item_details T4 ON(T4.procure_item_id = T1.procure_item_id)

LEFT JOIN procure_details T5 ON(T5.procure_id = T4.procure_id)

LEFT JOIN procure_basket_items T6 ON(T6.procure_basket_item_id = T4.procure_basket_item_id)

-- LEFT JOIN procure_basket T7 ON(T7.procure_basket_id = T6.procure_basket_id)

-- LEFT JOIN master_equipment T8 ON(T8.equip_id = T7.equip_id)

LEFT JOIN master_equipment T8 ON(T8.equip_id = T6.equip_id)

LEFT JOIN v_mainequip_price AS T9 ON (T9.bidder_equip_id = T1.bidder_equip_id)

LEFT JOIN v_amc_camc_price AS T10 ON (T10.bidder_equip_id = T1.bidder_equip_id)

LEFT JOIN v_spare_price AS T11 ON (T11.bidder_equip_id = T1.bidder_equip_id) 

LEFT JOIN master_siunit T12 ON(T12.master_siunit_id = T8.unit_name)

LEFT JOIN tag_details AS T13 ON(T13.tag_id = T5.tag_id)

WHERE T2.bidder_confirm = 1 

-- UPD @ 28 Nov 18 ;


-- Dumping structure for view ems_test.v_bidder_selection_status
DROP VIEW IF EXISTS `v_bidder_selection_status`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_bidder_selection_status`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_bidder_selection_status` AS SELECT 

	T1.procure_id, 
	
	T1.procure_no, 
	
	T1.procure_name, 
	
	T1.procure_confirm, 
	
	T1.procure_equip_type_id, 
	
	T3.procure_equip_type_name, 
	
	COUNT(T2.procure_item_id) AS ITEM_CNT,
	
	(
	
		SELECT COUNT(*)
			
		FROM bidder_details AS S1 
					
		INNER JOIN bidder_equipments AS S2 ON (S2.bidder_id = S1.bidder_id AND S2.promote_supplier = '1')
					
		WHERE S1.procure_id = T1.procure_id
	
	) AS SUPPLIER_CNT

FROM procure_details AS T1

INNER JOIN procure_item_details AS T2 ON(T2.procure_id = T1.procure_id)

INNER JOIN master_procure_equip_type AS T3 ON (T3.procure_equip_type_id = T1.procure_equip_type_id) 

WHERE T1.procure_bidder_entry = 'C'

GROUP BY T1.procure_id

ORDER BY T1.procure_equip_type_id DESC ;


-- Dumping structure for view ems_test.v_bidder_spare_price
DROP VIEW IF EXISTS `v_bidder_spare_price`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_bidder_spare_price`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_bidder_spare_price` AS SELECT 

	DISTINCT

	T8.procure_id AS SPARE_PROCURE_ID,
	
	T8.procure_equip_type_id, 
	
	T7.procure_item_id AS SPARE_PROCURE_ITEM_ID,
	
	CONCAT(T8.delivery_period,' ',T9.time_period_desc) AS DELIVERY,
	
	T1.bidder_id, 
	
	T1.bidder_equip_id, 
	
	T3.spare_category,
	
	T3.bidder_spareprice_id, 
	
	T4.equip_spare_id, 
	
	T5.equip_spare_name,
	
	T3.spare_alias,
	
	T5.equip_id AS SPARE_PARENT_ID,
	
	T3.gst_active,
	
	T3.spare_basicprice, 
	
	T3.spare_salestax, 
	
	T3.spare_custtax, 
	
	T3.spare_cgst_ratio,
	
	T3.spare_sgst_ratio,
	
	T3.spare_igst_ratio, 
	
	T3.spare_misc,
	
	IFNULL((T3.spare_basicprice + T3.spare_salestax + T3.spare_custtax + T3.spare_misc),0) AS SPARE_UNIT_PRICE,
	
	IFNULL((T3.spare_basicprice + T3.spare_custtax + T3.spare_misc),0) AS SPARE_UNIT_PRICE_EXLTAX,
	
	T4.procure_spare_qty, 
	
	T6.master_siunit_name, 
	
	T5.equip_spare_type, 
	
	T3.spare_make,
	
	T4.orderwise,
	
	(T4.procure_spare_qty * (T3.spare_basicprice + T3.spare_salestax + T3.spare_custtax + T3.spare_misc)) AS SPARE_WITH_QTY,
	
	T1.promote_supplier, 
	
	T1.price_status

FROM bidder_equipments AS T1

LEFT JOIN bidder_details AS T2 ON (T2.bidder_id = T1.bidder_id)

LEFT JOIN bidder_spare_price AS T3 ON (T3.bidder_equip_id = T1.bidder_equip_id)

LEFT JOIN procure_item_spare_details AS T4 ON (T4.procure_item_spare_id = T3.procure_item_spare_id)

LEFT JOIN master_equip_spares AS T5 ON (T5.equip_spare_id = T4.equip_spare_id)

LEFT JOIN master_siunit AS T6 ON (T6.master_siunit_id = T5.equip_spare_unit)

LEFT JOIN procure_item_details AS T7 ON (T7.procure_item_id = T4.procure_item_id)

LEFT JOIN procure_details AS T8 ON (T8.procure_id = T7.procure_id)

LEFT JOIN master_time_period AS T9 ON (T9.time_period_id = T8.delivery_period_id)

HAVING equip_spare_name IS NOT NULL

-- where T4.procure_spare_inclcal = 1

UNION 

SELECT 

	DISTINCT

	T8.procure_id AS SPARE_PROCURE_ID,
	
	T8.procure_equip_type_id, 
	
	T7.procure_item_id AS SPARE_PROCURE_ITEM_ID,
	
	CONCAT(T8.delivery_period,' ',T9.time_period_desc) AS DELIVERY,
	
	T1.bidder_id, 
	
	T1.bidder_equip_id, 
	
	T3.spare_category,
	
	T3.bidder_spareprice_id, 
	
	NULL AS equip_spare_id, 
	
	T3.setitem_name AS equip_spare_name,
	
	T3.spare_alias,
	
	T7.equip_id AS SPARE_PARENT_ID,
	
	T3.gst_active,
	
	T3.spare_basicprice, 
	
	T3.spare_salestax,
	
	T3.spare_custtax,
	
	T3.spare_cgst_ratio,
	
	T3.spare_sgst_ratio,
	
	T3.spare_igst_ratio,  	
	
	T3.spare_misc,
	
	IFNULL((T3.spare_basicprice + T3.spare_salestax + T3.spare_custtax + T3.spare_misc),0) AS SPARE_UNIT_PRICE,
	
	IFNULL((T3.spare_basicprice + T3.spare_custtax + T3.spare_misc),0) AS SPARE_UNIT_PRICE_EXLTAX,
	
	T3.setitem_qty as procure_spare_qty, 
	
	"No(s)" AS master_siunit_name, 
	
	"SP" AS equip_spare_type, 
	
	T3.spare_make,
	
	NULL AS orderwise,
	
	(T3.setitem_qty * (T3.spare_basicprice + T3.spare_salestax + T3.spare_custtax + T3.spare_misc)) AS SPARE_WITH_QTY,
	
	T1.promote_supplier, 
	
	T1.price_status

FROM bidder_equipments AS T1

LEFT JOIN bidder_details AS T2 ON (T2.bidder_id = T1.bidder_id)

LEFT JOIN bidder_spare_price AS T3 ON (T3.bidder_equip_id = T1.bidder_equip_id)

INNER JOIN procure_item_details AS T7 ON (T7.procure_item_id = T1.procure_item_id)

INNER JOIN procure_details AS T8 ON (T8.procure_id = T7.procure_id)

INNER JOIN master_time_period AS T9 ON (T9.time_period_id = T8.delivery_period_id)

HAVING equip_spare_name IS NOT NULL

ORDER BY bidder_equip_id, bidder_id, bidder_spareprice_id

-- UPD @ 29 May 19




/*
SELECT 

	T8.procure_id AS SPARE_PROCURE_ID,
	
	T8.procure_equip_type_id, 
	
	T7.procure_item_id AS SPARE_PROCURE_ITEM_ID,
	
	CONCAT(T8.delivery_period,' ',T9.time_period_desc) AS DELIVERY,
	
	T1.bidder_id, 
	
	T1.bidder_equip_id, 
	
	T3.bidder_spareprice_id, 
	
	T4.equip_spare_id, 
	
	T5.equip_spare_name,
	
	T3.spare_alias,
	
	T5.equip_id AS SPARE_PARENT_ID,
	
	T3.gst_active,
	
	T3.spare_basicprice, 
	
	T3.spare_salestax, 
	
	T3.spare_custtax, 
	
	T3.spare_misc,
	
	IFNULL((T3.spare_basicprice + T3.spare_salestax + T3.spare_custtax + T3.spare_misc),0) AS SPARE_UNIT_PRICE,
	
	IFNULL((T3.spare_basicprice + T3.spare_custtax + T3.spare_misc),0) AS SPARE_UNIT_PRICE_EXLTAX,
	
	T4.procure_spare_qty, 
	
	T6.master_siunit_name, 
	
	T5.equip_spare_type, 
	
	T3.spare_make,
	
	T4.orderwise,
	
	(T4.procure_spare_qty * (T3.spare_basicprice + T3.spare_salestax + T3.spare_custtax + T3.spare_misc)) AS SPARE_WITH_QTY,
	
	T1.promote_supplier, 
	
	T1.price_status

FROM bidder_equipments AS T1

LEFT JOIN bidder_details AS T2 ON (T2.bidder_id = T1.bidder_id)

LEFT JOIN bidder_spare_price AS T3 ON (T3.bidder_equip_id = T1.bidder_equip_id)

LEFT JOIN procure_item_spare_details AS T4 ON (T4.procure_item_spare_id = T3.procure_item_spare_id)

LEFT JOIN master_equip_spares AS T5 ON (T5.equip_spare_id = T4.equip_spare_id)

LEFT JOIN master_siunit AS T6 ON (T6.master_siunit_id = T5.equip_spare_unit)

INNER JOIN procure_item_details AS T7 ON (T7.procure_item_id = T4.procure_item_id)

INNER JOIN procure_details AS T8 ON (T8.procure_id = T7.procure_id)

INNER JOIN master_time_period AS T9 ON (T9.time_period_id = T8.delivery_period_id)

UNION 

SELECT 

	T8.procure_id AS SPARE_PROCURE_ID,
	
	T8.procure_equip_type_id, 
	
	T7.procure_item_id AS SPARE_PROCURE_ITEM_ID,
	
	CONCAT(T8.delivery_period,' ',T9.time_period_desc) AS DELIVERY,
	
	T1.bidder_id, 
	
	T1.bidder_equip_id, 
	
	T3.bidder_spareprice_id, 
	
	NULL AS equip_spare_id, 
	
	T3.setitem_name AS equip_spare_name,
	
	T3.spare_alias,
	
	NULL AS SPARE_PARENT_ID,
	
	T3.gst_active,
	
	T3.spare_basicprice, 
	
	T3.spare_salestax, 
	
	T3.spare_custtax, 
	
	T3.spare_misc,
	
	IFNULL((T3.spare_basicprice + T3.spare_salestax + T3.spare_custtax + T3.spare_misc),0) AS SPARE_UNIT_PRICE,
	
	IFNULL((T3.spare_basicprice + T3.spare_custtax + T3.spare_misc),0) AS SPARE_UNIT_PRICE_EXLTAX,
	
	T3.setitem_qty as procure_spare_qty, 
	
	"No(s)" AS master_siunit_name, 
	
	NULL equip_spare_type, 
	
	T3.spare_make,
	
	NULL AS orderwise,
	
	(T3.setitem_qty * (T3.spare_basicprice + T3.spare_salestax + T3.spare_custtax + T3.spare_misc)) AS SPARE_WITH_QTY,
	
	T1.promote_supplier, 
	
	T1.price_status

FROM bidder_equipments AS T1

LEFT JOIN bidder_details AS T2 ON (T2.bidder_id = T1.bidder_id)

LEFT JOIN bidder_spare_price AS T3 ON (T3.bidder_equip_id = T1.bidder_equip_id)

INNER JOIN procure_item_details AS T7 ON (T7.procure_item_id = T1.procure_item_id)

INNER JOIN procure_details AS T8 ON (T8.procure_id = T7.procure_id)

INNER JOIN master_time_period AS T9 ON (T9.time_period_id = T8.delivery_period_id)

HAVING equip_spare_id IS NOT NULL

ORDER BY bidder_equip_id, bidder_id, bidder_spareprice_id

-- UPD @ 30 Apr 2019

*/

/*

SELECT 

	T8.procure_id AS SPARE_PROCURE_ID,
	
	T8.procure_equip_type_id, 
	
	T7.procure_item_id AS SPARE_PROCURE_ITEM_ID,
	
	CONCAT(T8.delivery_period,' ',T9.time_period_desc) AS DELIVERY,
	
	T1.bidder_id, 
	
	T1.bidder_equip_id, 
	
	T3.bidder_spareprice_id, 
	
	T4.equip_spare_id, 
	
	T5.equip_spare_name,
	
	T3.spare_alias,
	
	T5.equip_id AS SPARE_PARENT_ID,
	
	T3.gst_active,
	
	T3.spare_basicprice, 
	
	T3.spare_salestax, 
	
	T3.spare_custtax, 
	
	T3.spare_misc,
	
	IFNULL((T3.spare_basicprice + T3.spare_salestax + T3.spare_custtax + T3.spare_misc),0) AS SPARE_UNIT_PRICE,
	
	IFNULL((T3.spare_basicprice + T3.spare_custtax + T3.spare_misc),0) AS SPARE_UNIT_PRICE_EXLTAX,
	
	T4.procure_spare_qty, 
	
	T6.master_siunit_name, 
	
	T5.equip_spare_type, 
	
	T3.spare_make,
	
	T4.orderwise,
	
	(T4.procure_spare_qty * (T3.spare_basicprice + T3.spare_salestax + T3.spare_custtax + T3.spare_misc)) AS SPARE_WITH_QTY,
	
	T1.promote_supplier, 
	
	T1.price_status

FROM bidder_equipments AS T1

LEFT JOIN bidder_details AS T2 ON (T2.bidder_id = T1.bidder_id)

LEFT JOIN bidder_spare_price AS T3 ON (T3.bidder_equip_id = T1.bidder_equip_id)

LEFT JOIN procure_item_spare_details AS T4 ON (T4.procure_item_spare_id = T3.procure_item_spare_id)

LEFT JOIN master_equip_spares AS T5 ON (T5.equip_spare_id = T4.equip_spare_id)

LEFT JOIN master_siunit AS T6 ON (T6.master_siunit_id = T5.equip_spare_unit)

INNER JOIN procure_item_details AS T7 ON (T7.procure_item_id = T4.procure_item_id)

INNER JOIN procure_details AS T8 ON (T8.procure_id = T7.procure_id)

INNER JOIN master_time_period AS T9 ON (T9.time_period_id = T8.delivery_period_id)

-- where T4.procure_spare_inclcal = 1

HAVING equip_spare_name IS NOT NULL

ORDER BY T1.bidder_equip_id, T1.bidder_id, T3.bidder_spareprice_id

-- UPD @ 01 Apr 17 

*/

/*

SELECT 

	T8.procure_id AS SPARE_PROCURE_ID,
	
	T8.procure_equip_type_id, 
	
	T7.procure_item_id AS SPARE_PROCURE_ITEM_ID,
	
	CONCAT(T8.delivery_period,' ',T9.time_period_desc) AS DELIVERY,
	
	T1.bidder_id, 
	
	T1.bidder_equip_id, 
	
	T3.bidder_spareprice_id, 
	
	T4.equip_spare_id, 
	
	T5.equip_spare_name,
	
	T3.spare_alias,
	
	T5.equip_id AS SPARE_PARENT_ID,
	
	T3.gst_active,
	
	T3.spare_basicprice, 
	
	T3.spare_salestax, 
	
	T3.spare_custtax, 
	
	T3.spare_misc,
	
	IFNULL((T3.spare_basicprice + T3.spare_salestax + T3.spare_custtax + T3.spare_misc),0) AS SPARE_UNIT_PRICE,
	
	IFNULL((T3.spare_basicprice + T3.spare_custtax + T3.spare_misc),0) AS SPARE_UNIT_PRICE_EXLTAX,
	
	T4.procure_spare_qty, 
	
	T6.master_siunit_name, 
	
	T5.equip_spare_type, 
	
	T3.spare_make,
	
	T4.orderwise,
	
	(T4.procure_spare_qty * (T3.spare_basicprice + T3.spare_salestax + T3.spare_custtax + T3.spare_misc)) AS SPARE_WITH_QTY,
	
	T1.promote_supplier, 
	
	T1.price_status

FROM bidder_equipments AS T1

LEFT JOIN bidder_details AS T2 ON (T2.bidder_id = T1.bidder_id)

LEFT JOIN bidder_spare_price AS T3 ON (T3.bidder_equip_id = T1.bidder_equip_id)

LEFT JOIN procure_item_spare_details AS T4 ON (T4.procure_item_spare_id = T3.procure_item_spare_id)

LEFT JOIN master_equip_spares AS T5 ON (T5.equip_spare_id = T4.equip_spare_id)

LEFT JOIN master_siunit AS T6 ON (T6.master_siunit_id = T5.equip_spare_unit)

INNER JOIN procure_item_details AS T7 ON (T7.procure_item_id = T4.procure_item_id)

INNER JOIN procure_details AS T8 ON (T8.procure_id = T7.procure_id)

INNER JOIN master_time_period AS T9 ON (T9.time_period_id = T8.delivery_period_id)

-- where T4.procure_spare_inclcal = 1

UNION 

SELECT 

	T8.procure_id AS SPARE_PROCURE_ID,
	
	T8.procure_equip_type_id, 
	
	T7.procure_item_id AS SPARE_PROCURE_ITEM_ID,
	
	CONCAT(T8.delivery_period,' ',T9.time_period_desc) AS DELIVERY,
	
	T1.bidder_id, 
	
	T1.bidder_equip_id, 
	
	T3.bidder_spareprice_id, 
	
	NULL AS equip_spare_id, 
	
	T3.setitem_name AS equip_spare_name,
	
	T3.spare_alias,
	
	NULL AS SPARE_PARENT_ID,
	
	T3.gst_active,
	
	T3.spare_basicprice, 
	
	T3.spare_salestax, 
	
	T3.spare_custtax, 
	
	T3.spare_misc,
	
	IFNULL((T3.spare_basicprice + T3.spare_salestax + T3.spare_custtax + T3.spare_misc),0) AS SPARE_UNIT_PRICE,
	
	IFNULL((T3.spare_basicprice + T3.spare_custtax + T3.spare_misc),0) AS SPARE_UNIT_PRICE_EXLTAX,
	
	T3.setitem_qty as procure_spare_qty, 
	
	"No(s)" AS master_siunit_name, 
	
	NULL equip_spare_type, 
	
	T3.spare_make,
	
	NULL AS orderwise,
	
	(T3.setitem_qty * (T3.spare_basicprice + T3.spare_salestax + T3.spare_custtax + T3.spare_misc)) AS SPARE_WITH_QTY,
	
	T1.promote_supplier, 
	
	T1.price_status

FROM bidder_equipments AS T1

LEFT JOIN bidder_details AS T2 ON (T2.bidder_id = T1.bidder_id)

LEFT JOIN bidder_spare_price AS T3 ON (T3.bidder_equip_id = T1.bidder_equip_id)

INNER JOIN procure_item_details AS T7 ON (T7.procure_item_id = T1.procure_item_id)

INNER JOIN procure_details AS T8 ON (T8.procure_id = T7.procure_id)

INNER JOIN master_time_period AS T9 ON (T9.time_period_id = T8.delivery_period_id)

HAVING equip_spare_name IS NOT NULL

ORDER BY bidder_equip_id, bidder_id, bidder_spareprice_id

-- UPD @ 01 Apr 17 

*/ ;


-- Dumping structure for view ems_test.v_cur_year
DROP VIEW IF EXISTS `v_cur_year`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_cur_year`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_cur_year` AS SELECT 
	
	S1.fn_year_id, S1.fn_year, S1.start_year AS CURYR, (S1.start_year-1) AS PREYR

FROM master_financial_year AS S1

WHERE S1.start_year = YEAR(CURDATE())

-- CRT@ NOV 27 ;


-- Dumping structure for view ems_test.v_fundreceived_schemewise
DROP VIEW IF EXISTS `v_fundreceived_schemewise`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_fundreceived_schemewise`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_fundreceived_schemewise` AS SELECT 

	T1.sanction_scheme_id,
	
	(SELECT IFNULL(SUM(S1.sanction_equip_qty * S1.sanction_fund_amt),0) FROM sanction_equip AS S1 WHERE S1.sanction_scheme_id = T1.sanction_scheme_id GROUP BY S1.sanction_scheme_id) AS FUND_REQ_SCHEMEWISE,
	
	IFNULL(SUM(T2.fund_dd_amt),0) AS FUND_REC_SCHEMEWISE,
	
	(	
		(SELECT IFNULL(SUM(S1.sanction_equip_qty * S1.sanction_fund_amt),0) FROM sanction_equip AS S1 WHERE S1.sanction_scheme_id = T1.sanction_scheme_id GROUP BY S1.sanction_scheme_id)
	
		-
	
		IFNULL(SUM(T2.fund_dd_amt),0)
	
	) AS FUND_BALREQ_SCHEMEWISE

FROM sanction_order_schemes AS T1

LEFT JOIN sanction_fund_received AS T2 ON (T2.sanction_scheme_id = T1.sanction_scheme_id)

INNER JOIN sanction_order_projects AS T3 ON (T3.sanction_project_id = T1.sanction_project_id)

INNER JOIN sanction_order AS T4 ON (T4.sanction_order_id = T3.sanction_order_id)

WHERE T4.sanction_status = "A"

GROUP BY T1.sanction_scheme_id ;


-- Dumping structure for view ems_test.v_govtagency
DROP VIEW IF EXISTS `v_govtagency`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_govtagency`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_govtagency` AS SELECT 

	T1.govtagency_id, T2.govtagency_item_id, T3.supplier_id, T3.supplier_name, 
	
	T2.govtagency_gorefno,
	
	T4.equip_code, T4.equip_name,	T2.govtagency_modelmake AS MODEL, 
	
	T2.govtagency_basicprice AS BASIC_PRICE, T2.govtagency_salestax AS STAX, T2.govtagency_customsduty AS CUST_DUTY, T2.govtagency_misccharges AS MISC_CH,
	
	(T2.govtagency_basicprice + T2.govtagency_salestax + T2.govtagency_customsduty + T2.govtagency_misccharges) AS GOVTAGENCY_UNITCOST,
	
	(T2.govtagency_basicprice + T2.govtagency_customsduty + T2.govtagency_misccharges) AS GOVTAGENCY_UNITCOST_EXLTAX
	
	
	
	-- ,T6.equip_spare_name		

FROM govtagency_list AS T1

LEFT JOIN govtagency_items AS T2 ON (T2.govtagency_id = T1.govtagency_id)

LEFT JOIN master_supplier AS T3 ON (T3.supplier_id = T1.supplier_id)

LEFT JOIN master_equipment AS T4 ON (T4.equip_id = T2.equip_id) 

LEFT JOIN govtagency_spares AS T5 ON (T5.govtagency_item_id = T2.govtagency_item_id)

-- LEFT JOIN master_equip_spares AS T6 ON (T6.equip_spare_id = T5.govtagency_spare_id)

-- UPD ON 15-07-2017 ;


-- Dumping structure for view ems_test.v_govtpurchase
DROP VIEW IF EXISTS `v_govtpurchase`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_govtpurchase`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_govtpurchase` AS SELECT
	
 	T2.purchase_type, 
	 
	T2.purchase_no, 
	 
	T2.purchase_date, 
	 
	T2.purchase_file_no, 
	
	T2.bill_file_no, 
	
	T2.purchase_status, 
	
	T2.purchase_cancel,
	
-- 	T4.procure_no, T4.procure_startdt, T4.procure_name, T4.install_report_req, T4.tender_amcslab, T4.tender_camcslab, 

	T3.sanction_no,

	T3.AS_DATE,
	
	T3.district_name, 
	
	T3.institution_name, 
	
	T3.dept_name, 
	
	T3.project_name, 
	
	T3.scheme_name, 
	
	T3.equip_code, 
	
	T3.equip_name, 
	
	T3.alloted_qty, 
	
	T1.ga_purchase_qty,
	
	T1.sanction_allotment_id,	
	
	T1.ga_purchase_sch_id, 
	
	T1.purchase_id, 
	
	T1.govtagency_item_id, 
	
	T1.govtagency_spare_id, 
	
	T7.supplier_id,
	
	T7.supplier_name AS SUPPLIER,
	
	T7.supplier_gstin,
	
	-- T1.equip_id, 
	
	T2.procure_id, T2.bidder_id, T2.govtagency_id,
	
-- 	T6.warranty_period, T6.min_pmvisit, 
	
-- 	CONCAT(T6.delivery_period, ' ', T7.time_period_desc) AS DELIVERY,
	
	(CASE 
	
		WHEN T1.govtagency_spare_id IS NOT NULL THEN (T5.govtagency_spare_basicprice + T5.govtagency_spare_salestax + T5.govtagency_spare_customsduty + T5.govtagency_spare_misccharges)
		
		ELSE (T4.govtagency_basicprice + T4.govtagency_salestax + T4.govtagency_customsduty + T4.govtagency_misccharges)
	
	END) AS UNIT_PRICE,
		
	(CASE 
	
		WHEN T1.govtagency_spare_id IS NULL THEN "N"
		
		ELSE "Y"
	
	END) AS IS_SPARE,
	
	(CASE 
	
		WHEN T1.govtagency_spare_id IS NULL THEN "NIL"
		
		ELSE (SELECT S1.equip_spare_name FROM master_equip_spares AS S1 WHERE S1.equip_spare_id = T5.equip_spare_id)
	
	END) AS SPARE_NAME

FROM govtagency_purchase_schedule AS T1

LEFT JOIN purchase_order AS T2 ON (T2.purchase_id = T1.purchase_id)

LEFT JOIN v_sanction_allotment AS T3 ON (T3.sanction_allotment_id = T1.sanction_allotment_id)

LEFT JOIN govtagency_items AS T4 ON (T4.govtagency_item_id = T1.govtagency_item_id)

LEFT JOIN govtagency_spares AS T5 ON (T5.govtagency_spare_id = T1.govtagency_spare_id) 

LEFT JOIN govtagency_list AS T6 ON (T6.govtagency_id = T4.govtagency_id)

LEFT JOIN master_supplier AS T7 ON (T7.supplier_id = T6.supplier_id)

/*
SELECT
	
 	T2.purchase_type, 
	 
	T2.purchase_no, 
	 
	T2.purchase_date, 
	 
	T2.purchase_file_no, 
	
	T2.bill_file_no, 
	
	T2.purchase_status, 
	
	T2.purchase_cancel,
	
-- 	T4.procure_no, T4.procure_startdt, T4.procure_name, T4.install_report_req, T4.tender_amcslab, T4.tender_camcslab, 
	
	T3.district_name, T3.institution_name, T3.dept_name, T3.project_name, T3.scheme_name, 
	
	T3.equip_code, T3.equip_name, T3.alloted_qty, 
	
	T1.ga_purchase_qty,
	
-- 	T4.supplier_id, 
	
-- 	T4.supplier_name, 
	
	T1.sanction_allotment_id,	
	
	T1.ga_purchase_sch_id, 
	
	T1.purchase_id, 
	
	T1.govtagency_item_id, 
	
	T1.govtagency_spare_id, 
	
	(SELECT 

			DISTINCT S3.supplier_name
		
		FROM govtagency_items AS S1
		
		INNER JOIN govtagency_list AS S2 ON (S2.govtagency_id = S1.govtagency_id)
		
		INNER JOIN master_supplier AS S3 ON (S3.supplier_id = S2.supplier_id)
		
		WHERE S1.govtagency_item_id = T1.govtagency_item_id
	
	) AS SUPPLIER,
	
	
	(SELECT S4.supplier_id FROM govtagency_list AS S4 WHERE S4.govtagency_id = T4.govtagency_id) AS supplier_id,
	
	-- T1.equip_id, 
	
	T2.procure_id, T2.bidder_id, T2.govtagency_id,
	
-- 	T6.warranty_period, T6.min_pmvisit, 
	
-- 	CONCAT(T6.delivery_period, ' ', T7.time_period_desc) AS DELIVERY,
	
	(CASE 
	
		WHEN T1.govtagency_spare_id IS NOT NULL THEN (T5.govtagency_spare_basicprice + T5.govtagency_spare_salestax + T5.govtagency_spare_customsduty + T5.govtagency_spare_misccharges)
		
		ELSE (T4.govtagency_basicprice + T4.govtagency_salestax + T4.govtagency_customsduty + T4.govtagency_misccharges)
	
	END) AS UNIT_PRICE,
		
	(CASE 
	
		WHEN T1.govtagency_spare_id IS NULL THEN "N"
		
		ELSE "Y"
	
	END) AS IS_SPARE,
	
	(CASE 
	
		WHEN T1.govtagency_spare_id IS NULL THEN "NIL"
		
		ELSE (SELECT S1.equip_spare_name FROM master_equip_spares AS S1 WHERE S1.equip_spare_id = T5.equip_spare_id)
	
	END) AS SPARE_NAME

FROM govtagency_purchase_schedule AS T1

LEFT JOIN purchase_order AS T2 ON (T2.purchase_id = T1.purchase_id)

LEFT JOIN v_sanction_allotment AS T3 ON (T3.sanction_allotment_id = T1.sanction_allotment_id)

LEFT JOIN govtagency_items AS T4 ON (T4.govtagency_item_id = T1.govtagency_item_id)

LEFT JOIN govtagency_spares AS T5 ON (T5.govtagency_spare_id = T1.govtagency_spare_id) 
*/ ;


-- Dumping structure for view ems_test.v_invoice
DROP VIEW IF EXISTS `v_invoice`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_invoice`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_invoice` AS SELECT 

	T4.supplier_id,

	T4.supplier_name, 
	
	T4.supplier_gstin,
	
	T4.procure_no, 
	
	DATE_FORMAT(T4.procure_startdt, "%d-%m-%Y") AS PRCDT,  
	
	T4.procure_name,
	
	T1.purchase_id, 
	
	T4.purchase_type,
	
	T4.purchase_no, 
	
	T4.purchase_date,
	
	T4.purchase_file_no,
	
	T4.bill_file_no,
	
	T4.sanction_no,

	T4.AS_DATE,
	
	T4.institution_id,
	
	T4.district_name, 
	
	T4.institution_name, 
	
	T4.dept_name, 
	
	T4.project_name, 
	
	T4.scheme_name, 
	
	(CASE WHEN T4.IS_SPARE = "Y" THEN T4.SPARE_NAME ELSE T4.equip_name END) AS ITEM_NAME,
	
	T1.invoice_id, 
	
	T1.invoice_no, 
	
	DATE_FORMAT(T1.invoice_dt, "%d-%m-%Y") AS INVDT, 
	
	DATE_FORMAT(T1.invoice_tapal_dt, "%d-%m-%Y") AS INVTAPALDT, 
	
	T1.invclaim_amt,
	
	T1.sd_deduct,
	
	T1.excess_claim,
	
	T3.pterm_deduct,
	
	T1.tds,
	
	T1.wct,
	
	T1.inv_addtion,
	
	T2.invitem_id, 
	
	T2.purchase_sch_id, 
	
	T4.sanction_allotment_id,
	
	DATE_FORMAT(T2.supply_date, "%d-%m-%Y") AS SUPPLYDT, 
	
	DATE_FORMAT(T2.install_date, "%d-%m-%Y") AS INSTALLDT, 
	
	DATE_FORMAT(T2.omp_date, "%d-%m-%Y") AS OMPDT, 
	
	T2.site_status, 
	
	T2.ldcal_basedon, 
	
	T2.invitem_qty, 
	
	T2.invitem_unitprice AS ITEM_UNITPRICE, 
	
	T2.invitem_addt_charge AS ITEM_ADDTCH, 
	
	((T2.invitem_qty * T2.invitem_unitprice) + T2.invitem_addt_charge) AS ITEMWISE_PAYABLE, 
	
	T2.time_taken, 
	
	T2.delay, 
	
	T2.invitem_ld_percent, 
	
	T2.invitem_ld_amt, 
	
	T2.invitem_remarks,
		
	(T1.sd_deduct + T1.excess_claim + T3.pterm_deduct + T1.tds + T1.wct + T2.invitem_ld_amt) AS ITEMWISE_DEDUCTION,
	
	T3.invoice_processid, 
	
	T3.payment_term, 
	
	T3.recom_percent,
	
	T3.inv_shortfall, 
	
	T3.inv_chklist1, 
	
	T3.inv_chklist2, 
	
	T3.inv_chklist3, 
	
	T3.inv_chklist4, 
	
	T3.invoice_process_status,
	
	T4.warranty_period,
	
	T4.min_pmvisit,
	
	T4.tender_camcslab AS CAMC,
	
	T4.install_report_req,
	
	T2.supply_date,
	
	T2.install_date,
	
	T2.omp_date,
	
	T4.DELIVERY,
	
	T4.equip_id,
	
	T3.proceeding_id,
	
	T3.refund_amt,
	
	(CASE
	
		WHEN T4.install_report_req = "1" THEN (DATE_ADD(T2.install_date, INTERVAL T4.warranty_period YEAR) - INTERVAL 1 DAY)
		
		ELSE (DATE_ADD(T2.install_date, INTERVAL T4.warranty_period YEAR) - INTERVAL 1 DAY)
		
	END) AS WARRANTY_EXP,
	
	T4.bidder_equip_id, 
	
	T4.bidder_spareprice_id,
	
	T4.delivery_confirm_date,
	
	T4.delivery_period_extn,
	
	(
	
	SELECT 
	
		SUM(QS1.invitem_qty) 
		
	FROM invoice_items AS QS1 
	
	INNER JOIN purchase_schedule AS QS2 ON (QS2.purchase_sch_id = QS1.purchase_sch_id)
	
	WHERE QS1.invoice_id = T1.invoice_id AND QS2.bidder_spareprice_id IS NULL
		
	) AS MAIN_EQUIP_REC_QTY,

	COALESCE((
	
		SELECT 
		
			SUM(QS1.invitem_qty) 
			
		FROM invoice_items AS QS1 
		
		INNER JOIN purchase_schedule AS QS2 ON (QS2.purchase_sch_id = QS1.purchase_sch_id)
		
		WHERE QS1.invoice_id = T1.invoice_id AND QS2.bidder_spareprice_id IS NOT NULL
		
	),0) AS SPARE_EQUIP_REC_QTY,
		
	(SELECT SUM(QS3.purchase_qty) FROM v_purchase AS QS3 WHERE QS3.purchase_id	= T1.purchase_id AND QS3.bidder_spareprice_id IS NULL GROUP BY QS3.purchase_id) AS MAIN_EQUIP_PO_QTY		

FROM invoice AS T1

LEFT JOIN invoice_items AS T2 ON (T2.invoice_id = T1.invoice_id)

LEFT JOIN invoice_processing AS T3 ON (T3.invoice_id = T2.invoice_id)

LEFT JOIN v_purchase AS T4 ON (T4.purchase_sch_id = T2.purchase_sch_id)

-- UPD @ 29 Mar 2019 ;


-- Dumping structure for view ems_test.v_invoice_process
DROP VIEW IF EXISTS `v_invoice_process`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_invoice_process`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_invoice_process` AS SELECT

	DISTINCT 
	
	T6.supplier_id, 
	
	(SELECT S1.supplier_name FROM master_supplier AS S1 WHERE S1.supplier_id = T6.supplier_id) AS SUPPLIER,
	
	T4.bank_accno, 
	
	T4.bank_ifsc, 
	
	T4.bank_name,
	
	T3.procure_id, 
	
	T3.bidder_id,
	
	(SELECT REPLACE(S2.procure_name,"PROCUREMENT FOR", "") FROM procure_details AS S2 WHERE S2.procure_id = T3.procure_id) AS ITEM,
	
	T3.purchase_id,
	
	T3.purchase_no AS PONO,
	
	DATE_FORMAT(T3.purchase_date,"%d-%b-%Y") AS PODT,
	
	T3.bill_file_no AS POFILE_NO,
	
	T2.invoice_no AS INVNO,
	
	DATE_FORMAT(T2.invoice_dt,"%d-%b-%Y") AS INVDT,
	
	T1.invoice_id,
						
	T1.invoice_processid,
	
	T1.invoice_process_status,
	
	T1.payment_term AS PTERM,
	
	T1.recom_percent AS RECOM_PERCENT,
	
	(SELECT SUM((S1.invitem_qty * S1.invitem_unitprice ) + S1.invitem_addt_charge + ifnull(T2.inv_addtion,0)) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id) AS INVWISE_PAYABLE,
	
	T1.refund_amt,
	
	T1.tds_deduct,
	
	T1.new_ittds,

	(
	
		(SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)		
		
		+ T2.excess_claim 
		
		+ T2.tds 
		
		+ T2.wct 
		
		+ T2.sd_deduct 
		
		+ T2.incometax_tds
		
		+ T1.pterm_deduct 
		
		+ T1.tds_deduct
		
		+ T1.new_ittds
		
		+ T2.retention_money
		
	) AS TOT_DEDUCTION,
	
	ROUND(
	
 		T2.invclaim_amt
		
		- (		
		
			(SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id) 
			
			+ T2.excess_claim 			
			
			+ T2.tds 
			
			+ T2.wct 
			
			+ T2.sd_deduct 
			
			+ T2.incometax_tds 
						
			+ T1.tds_deduct 
			
			+ T1.new_ittds
			
			+ T2.retention_money
			
		  )
		  
		- T1.pterm_deduct   	
		
		+ T1.refund_amt 	
	
	) AS TOT_PAYABLE,


	ROUND(
	
		(
		
			T2.invclaim_amt 
			
			- (
			
				(SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)
				
				+ T2.excess_claim
				
				+ T2.tds 
				
				+ T2.wct
				
				+ T2.sd_deduct
				
				+ T2.incometax_tds
			
				+ T1.tds_deduct  
				
				+ T1.new_ittds
				
				+ T2.retention_money 
				
			  )
		
		) *  (T1.recom_percent/100) 
		
		- T1.pterm_deduct 
		
		+ T1.refund_amt
			
	) AS TOBE_PAID,	

	T1.notefile_id,
	
	T1.proceeding_id,
	
	T1.gross_payable,
	
	T1.net_payable

FROM invoice_processing AS T1

INNER JOIN invoice AS T2 ON (T2.invoice_id = T1.invoice_id)

-- LEFT JOIN v_purchase AS T3 ON (T3.purchase_id = T2.purchase_id)

LEFT JOIN purchase_order AS T3 ON (T3.purchase_id = T2.purchase_id)

LEFT JOIN bidder_details AS T6 ON (T6.bidder_id = T3.bidder_id)

LEFT JOIN master_suppliers_bank AS T4 ON(T4.supplier_id = T6.supplier_id)

LEFT JOIN master_bank AS T5 ON (T5.bank_id = T4.bank_id)

WHERE T3.purchase_type <> "4"

	AND T3.dealer_id IS NULL


UNION


SELECT

	DISTINCT 
	
	T6.supplier_id, 
	
	(SELECT S1.supplier_name FROM master_supplier AS S1 WHERE S1.supplier_id = T6.supplier_id) AS SUPPLIER, 
	
	T4.bank_accno, 
	
	T4.bank_ifsc, 
	
	T4.bank_name,
	
	T3.procure_id, 
	
	T3.bidder_id,
	
	(SELECT REPLACE(S2.procure_name,"PROCUREMENT FOR", "") FROM procure_details AS S2 WHERE S2.procure_id = T3.procure_id) AS ITEM,
	
	T3.purchase_id,
	
	T3.purchase_no AS PONO,
	
	DATE_FORMAT(T3.purchase_date,"%d-%b-%Y") AS PODT,
	
	T3.bill_file_no AS POFILE_NO,
	
	T2.invoice_no AS INVNO,
	
	DATE_FORMAT(T2.invoice_dt,"%d-%b-%Y") AS INVDT,
	
	T1.invoice_id,
						
	T1.invoice_processid,
	
	T1.invoice_process_status,
	
	T1.payment_term AS PTERM,
	
	T1.recom_percent AS RECOM_PERCENT,
	
	(SELECT SUM((S1.invitem_qty * S1.invitem_unitprice ) + S1.invitem_addt_charge + ifnull(T2.inv_addtion,0)) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id) AS INVWISE_PAYABLE,
	
	T1.refund_amt,
	
	T1.tds_deduct,
	
	T1.new_ittds,

	(
	
		(SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)		
		
		+ T2.excess_claim 
		
		+ T2.tds 
		
		+ T2.wct 
		
		+ T2.sd_deduct 
		
		+ T2.incometax_tds
		
		+ T1.pterm_deduct 
		
		+ T1.tds_deduct
		
		+ T1.new_ittds
		
		+ T2.retention_money
		
	) AS TOT_DEDUCTION,
	
	ROUND(
	
 		T2.invclaim_amt
		
		- (		
		
			(SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id) 
			
			+ T2.excess_claim 			
			
			+ T2.tds 
			
			+ T2.wct 
			
			+ T2.sd_deduct 
			
			+ T2.incometax_tds 
						
			+ T1.tds_deduct 
			
			+ T1.new_ittds
			
			+ T2.retention_money
			
		  )
		  
		- T1.pterm_deduct   	
		
		+ T1.refund_amt 	
	
	) AS TOT_PAYABLE,


	ROUND(
	
		(
		
			T2.invclaim_amt 
			
			- (
			
				(SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)
				
				+ T2.excess_claim
				
				+ T2.tds 
				
				+ T2.wct
				
				+ T2.sd_deduct
				
				+ T2.incometax_tds
			
				+ T1.tds_deduct  
				
				+ T1.new_ittds
				
				+ T2.retention_money 
				
			  )
		
		) *  (T1.recom_percent/100) 
		
		- T1.pterm_deduct 
		
		+ T1.refund_amt
			
	) AS TOBE_PAID,	

	T1.notefile_id,
	
	T1.proceeding_id,
	
	T1.gross_payable,
	
	T1.net_payable

FROM invoice_processing AS T1

INNER JOIN invoice AS T2 ON (T2.invoice_id = T1.invoice_id)

LEFT JOIN purchase_order AS T3 ON (T3.purchase_id = T2.purchase_id)

LEFT JOIN dealer_details AS T6 ON (T6.dealer_id = T3.dealer_id)

LEFT JOIN master_suppliers_bank AS T4 ON(T4.supplier_id = T6.supplier_id)

LEFT JOIN master_bank AS T5 ON (T5.bank_id = T4.bank_id)

WHERE T3.purchase_type <> "4"

	AND T3.dealer_id IS NOT NULL


UNION


SELECT

	DISTINCT 
	
	T3.supplier_id,
	
	T3.SUPPLIER,
	
	T4.bank_accno, 
	
	T4.bank_ifsc, 
	
	T4.bank_name,
	
	NULL AS procure_id, 
	
	NULL AS bidder_id,
	
	T3.equip_name AS ITEM,
	
	T3.purchase_id,
	
	T3.purchase_no AS PONO,
	
	DATE_FORMAT(T3.purchase_date,"%d-%b-%Y") AS PODT,
	
	T3.bill_file_no AS POFILE_NO,
	
	T2.invoice_no AS INVNO,
	
	DATE_FORMAT(T2.invoice_dt,"%d-%b-%Y") AS INVDT,
	
	T1.invoice_id,
						
	T1.invoice_processid,
	
	T1.invoice_process_status,
	
	T1.payment_term AS PTERM,
	
	T1.recom_percent AS RECOM_PERCENT,
	
	(SELECT SUM((S1.invitem_qty * S1.invitem_unitprice ) + S1.invitem_addt_charge + T2.inv_addtion) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id) AS INVWISE_PAYABLE,
	
	T1.refund_amt,
	
	T1.tds_deduct,	
	
	T1.new_ittds,

	(
	
		(SELECT IFNULL(SUM(S1.invitem_ld_amt),0) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)
				
		+ T2.excess_claim 
		
		+ T2.tds 
		
		+ T2.wct 
		
		+ T2.sd_deduct 
		
		+ T2.incometax_tds
		
		+ T1.pterm_deduct 
		
		+ T1.tds_deduct
		
		+ T1.new_ittds
		
		+ T2.retention_money
		
	) AS TOT_DEDUCTION,
		
	ROUND(
	
		T2.invclaim_amt 
		
		- (
		
			(SELECT IFNULL(SUM(S1.invitem_ld_amt),2) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)
			
			+ T2.excess_claim
			
			+ T2.tds 
			
			+ T2.wct
			
			+ T2.sd_deduct
			
			+ T2.incometax_tds
			
			+ T1.tds_deduct
			
			+ T1.new_ittds
			
			+ T2.retention_money
				
		  )
		  
		- T1.pterm_deduct  
		  
		+ T1.refund_amt  
		
	) AS TOT_PAYABLE,

	ROUND(
	
		(
		
			T2.invclaim_amt
			
			- (
			
				(SELECT IFNULL(SUM(S1.invitem_ld_amt),0) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)
				
				+ T2.excess_claim
				
				+ T2.tds
				
				+ T2.wct
				
				+ T2.sd_deduct
				
				+ T2.incometax_tds
				
				+ T1.tds_deduct 
				
				+ T1.new_ittds
				
				+ T2.retention_money
				
			  )
		
		) * (T1.recom_percent/100) 
		
		- T1.pterm_deduct
		
		+ T1.refund_amt
			
	) AS TOBE_PAID,
	
	T1.notefile_id,
	
	T1.proceeding_id,
	
	T1.gross_payable,
	
	T1.net_payable

FROM invoice_processing AS T1

INNER JOIN invoice AS T2 ON (T2.invoice_id = T1.invoice_id)

INNER JOIN v_govtpurchase AS T3 ON (T3.purchase_id = T2.purchase_id)

LEFT JOIN master_suppliers_bank AS T4 ON(T4.supplier_id = T3.supplier_id)

LEFT JOIN master_bank AS T5 ON (T5.bank_id = T4.bank_id) 

WHERE T4.acc_preference = "1"

-- Updated on 09.08.2021

/*

SELECT

	DISTINCT 
	
	T6.supplier_id, 
	
	(SELECT S1.supplier_name FROM master_supplier AS S1 WHERE S1.supplier_id = T6.supplier_id) AS SUPPLIER,
	
	T4.bank_accno, 
	
	T4.bank_ifsc, 
	
	T4.bank_name,
	
	T3.procure_id, 
	
	T3.bidder_id,
	
	(SELECT REPLACE(S2.procure_name,"PROCUREMENT FOR", "") FROM procure_details AS S2 WHERE S2.procure_id = T3.procure_id) AS ITEM,
	
	T3.purchase_id,
	
	T3.purchase_no AS PONO,
	
	DATE_FORMAT(T3.purchase_date,"%d-%b-%Y") AS PODT,
	
	T3.bill_file_no AS POFILE_NO,
	
	T2.invoice_no AS INVNO,
	
	DATE_FORMAT(T2.invoice_dt,"%d-%b-%Y") AS INVDT,
	
	T1.invoice_id,
						
	T1.invoice_processid,
	
	T1.invoice_process_status,
	
	T1.payment_term AS PTERM,
	
	T1.recom_percent AS RECOM_PERCENT,
	
	(SELECT SUM((S1.invitem_qty * S1.invitem_unitprice ) + S1.invitem_addt_charge + ifnull(T2.inv_addtion,0)) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id) AS INVWISE_PAYABLE,
	
	T1.refund_amt,
	
	T1.tds_deduct,

	(
	
		(SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)		
		
		+ T2.excess_claim 
		
		+ T2.tds 
		
		+ T2.wct 
		
		+ T2.sd_deduct 
		
		+ T2.incometax_tds
		
		+ T1.pterm_deduct 
		
		+ T1.tds_deduct
		
		+ T2.retention_money
		
	) AS TOT_DEDUCTION,
	
	ROUND(
	
 		T2.invclaim_amt
		
		- (		
		
			(SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id) 
			
			+ T2.excess_claim 			
			
			+ T2.tds 
			
			+ T2.wct 
			
			+ T2.sd_deduct 
			
			+ T2.incometax_tds 
						
			+ T1.tds_deduct 
			
			+ T2.retention_money
			
		  )
		  
		- T1.pterm_deduct   	
		
		+ T1.refund_amt 	
	
	) AS TOT_PAYABLE,


	ROUND(
	
		(
		
			T2.invclaim_amt 
			
			- (
			
				(SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)
				
				+ T2.excess_claim
				
				+ T2.tds 
				
				+ T2.wct
				
				+ T2.sd_deduct
				
				+ T2.incometax_tds
			
				+ T1.tds_deduct  
				
				+ T2.retention_money 
				
			  )
		
		) *  (T1.recom_percent/100) 
		
		- T1.pterm_deduct 
		
		+ T1.refund_amt
			
	) AS TOBE_PAID,	

	T1.notefile_id,
	
	T1.proceeding_id,
	
	T1.gross_payable,
	
	T1.net_payable

FROM invoice_processing AS T1

INNER JOIN invoice AS T2 ON (T2.invoice_id = T1.invoice_id)

-- LEFT JOIN v_purchase AS T3 ON (T3.purchase_id = T2.purchase_id)

LEFT JOIN purchase_order AS T3 ON (T3.purchase_id = T2.purchase_id)

LEFT JOIN bidder_details AS T6 ON (T6.bidder_id = T3.bidder_id)

LEFT JOIN master_suppliers_bank AS T4 ON(T4.supplier_id = T6.supplier_id)

LEFT JOIN master_bank AS T5 ON (T5.bank_id = T4.bank_id)

WHERE T3.purchase_type <> "4"

	AND T3.dealer_id IS NULL


UNION


SELECT

	DISTINCT 
	
	T6.supplier_id, 
	
	(SELECT S1.supplier_name FROM master_supplier AS S1 WHERE S1.supplier_id = T6.supplier_id) AS SUPPLIER, 
	
	T4.bank_accno, 
	
	T4.bank_ifsc, 
	
	T4.bank_name,
	
	T3.procure_id, 
	
	T3.bidder_id,
	
	(SELECT REPLACE(S2.procure_name,"PROCUREMENT FOR", "") FROM procure_details AS S2 WHERE S2.procure_id = T3.procure_id) AS ITEM,
	
	T3.purchase_id,
	
	T3.purchase_no AS PONO,
	
	DATE_FORMAT(T3.purchase_date,"%d-%b-%Y") AS PODT,
	
	T3.bill_file_no AS POFILE_NO,
	
	T2.invoice_no AS INVNO,
	
	DATE_FORMAT(T2.invoice_dt,"%d-%b-%Y") AS INVDT,
	
	T1.invoice_id,
						
	T1.invoice_processid,
	
	T1.invoice_process_status,
	
	T1.payment_term AS PTERM,
	
	T1.recom_percent AS RECOM_PERCENT,
	
	(SELECT SUM((S1.invitem_qty * S1.invitem_unitprice ) + S1.invitem_addt_charge + ifnull(T2.inv_addtion,0)) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id) AS INVWISE_PAYABLE,
	
	T1.refund_amt,
	
	T1.tds_deduct,

	(
	
		(SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)		
		
		+ T2.excess_claim 
		
		+ T2.tds 
		
		+ T2.wct 
		
		+ T2.sd_deduct 
		
		+ T2.incometax_tds
		
		+ T1.pterm_deduct 
		
		+ T1.tds_deduct
		
		+ T2.retention_money
		
	) AS TOT_DEDUCTION,
	
	ROUND(
	
 		T2.invclaim_amt
		
		- (		
		
			(SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id) 
			
			+ T2.excess_claim 			
			
			+ T2.tds 
			
			+ T2.wct 
			
			+ T2.sd_deduct 
			
			+ T2.incometax_tds 
						
			+ T1.tds_deduct 
			
			+ T2.retention_money
			
		  )
		  
		- T1.pterm_deduct   	
		
		+ T1.refund_amt 	
	
	) AS TOT_PAYABLE,


	ROUND(
	
		(
		
			T2.invclaim_amt 
			
			- (
			
				(SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)
				
				+ T2.excess_claim
				
				+ T2.tds 
				
				+ T2.wct
				
				+ T2.sd_deduct
				
				+ T2.incometax_tds
			
				+ T1.tds_deduct  
				
				+ T2.retention_money 
				
			  )
		
		) *  (T1.recom_percent/100) 
		
		- T1.pterm_deduct 
		
		+ T1.refund_amt
			
	) AS TOBE_PAID,	

	T1.notefile_id,
	
	T1.proceeding_id,
	
	T1.gross_payable,
	
	T1.net_payable

FROM invoice_processing AS T1

INNER JOIN invoice AS T2 ON (T2.invoice_id = T1.invoice_id)

LEFT JOIN purchase_order AS T3 ON (T3.purchase_id = T2.purchase_id)

LEFT JOIN dealer_details AS T6 ON (T6.dealer_id = T3.dealer_id)

LEFT JOIN master_suppliers_bank AS T4 ON(T4.supplier_id = T6.supplier_id)

LEFT JOIN master_bank AS T5 ON (T5.bank_id = T4.bank_id)

WHERE T3.purchase_type <> "4"

	AND T3.dealer_id IS NOT NULL


UNION


SELECT

	DISTINCT 
	
	T3.supplier_id,
	
	T3.SUPPLIER,
	
	T4.bank_accno, 
	
	T4.bank_ifsc, 
	
	T4.bank_name,
	
	NULL AS procure_id, 
	
	NULL AS bidder_id,
	
	T3.equip_name AS ITEM,
	
	T3.purchase_id,
	
	T3.purchase_no AS PONO,
	
	DATE_FORMAT(T3.purchase_date,"%d-%b-%Y") AS PODT,
	
	T3.bill_file_no AS POFILE_NO,
	
	T2.invoice_no AS INVNO,
	
	DATE_FORMAT(T2.invoice_dt,"%d-%b-%Y") AS INVDT,
	
	T1.invoice_id,
						
	T1.invoice_processid,
	
	T1.invoice_process_status,
	
	T1.payment_term AS PTERM,
	
	T1.recom_percent AS RECOM_PERCENT,
	
	(SELECT SUM((S1.invitem_qty * S1.invitem_unitprice ) + S1.invitem_addt_charge + T2.inv_addtion) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id) AS INVWISE_PAYABLE,
	
	T1.refund_amt,
	
	T1.tds_deduct,	

	(
	
		(SELECT IFNULL(SUM(S1.invitem_ld_amt),0) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)
				
		+ T2.excess_claim 
		
		+ T2.tds 
		
		+ T2.wct 
		
		+ T2.sd_deduct 
		
		+ T2.incometax_tds
		
		+ T1.pterm_deduct 
		
		+ T1.tds_deduct
		
		+ T2.retention_money
		
	) AS TOT_DEDUCTION,
		
	ROUND(
	
		T2.invclaim_amt 
		
		- (
		
			(SELECT IFNULL(SUM(S1.invitem_ld_amt),2) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)
			
			+ T2.excess_claim
			
			+ T2.tds 
			
			+ T2.wct
			
			+ T2.sd_deduct
			
			+ T2.incometax_tds
			
			+ T1.tds_deduct
			
			+ T2.retention_money
				
		  )
		  
		- T1.pterm_deduct  
		  
		+ T1.refund_amt  
		
	) AS TOT_PAYABLE,

	ROUND(
	
		(
		
			T2.invclaim_amt
			
			- (
			
				(SELECT IFNULL(SUM(S1.invitem_ld_amt),0) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)
				
				+ T2.excess_claim
				
				+ T2.tds
				
				+ T2.wct
				
				+ T2.sd_deduct
				
				+ T2.incometax_tds
				
				+ T1.tds_deduct 
				
				+ T2.retention_money
				
			  )
		
		) * (T1.recom_percent/100) 
		
		- T1.pterm_deduct
		
		+ T1.refund_amt
			
	) AS TOBE_PAID,
	
	T1.notefile_id,
	
	T1.proceeding_id,
	
	T1.gross_payable,
	
	T1.net_payable

FROM invoice_processing AS T1

INNER JOIN invoice AS T2 ON (T2.invoice_id = T1.invoice_id)

INNER JOIN v_govtpurchase AS T3 ON (T3.purchase_id = T2.purchase_id)

LEFT JOIN master_suppliers_bank AS T4 ON(T4.supplier_id = T3.supplier_id)

LEFT JOIN master_bank AS T5 ON (T5.bank_id = T4.bank_id) 

WHERE T4.acc_preference = "1"

-- Updated on 09.08.2019 

*/ ;


-- Dumping structure for view ems_test.v_inv_prs
DROP VIEW IF EXISTS `v_inv_prs`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_inv_prs`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_inv_prs` AS SELECT

	DISTINCT 
	
	(SELECT S2.supplier_name FROM bidder_details AS S1 INNER JOIN master_supplier AS S2 ON (S2.supplier_id = S1.supplier_id) WHERE S1.bidder_id = T3.bidder_id) AS SUPPLIER,
	
	T3.procure_id, 
	
	T6.supplier_id, 
	
	T3.bidder_id,
	
	(SELECT REPLACE(S1.procure_name, "PROCUREMENT FOR ", "") FROM procure_details AS S1 WHERE S1.procure_id = T3.procure_id) AS ITEM,
	
	T3.purchase_id,
	
	T3.purchase_no AS PONO,
	
	DATE_FORMAT(T3.purchase_date,"%d-%b-%Y") AS PODT,
	
	T3.bill_file_no AS POFILE_NO,
	
	T4.bank_accno, 
	
	T4.bank_ifsc, 
	
	T4.bank_name,
	
	T2.invoice_no AS INVNO,
	
	DATE_FORMAT(T2.invoice_dt,"%d-%b-%Y") AS INVDT,
	
	T1.invoice_id,
						
	T1.invoice_processid,
	
	T1.invoice_process_status,
	
	T1.payment_term AS PTERM,
	
	T1.recom_percent AS RECOM_PERCENT,
	
	(SELECT SUM((S1.invitem_qty * S1.invitem_unitprice ) + S1.invitem_addt_charge + ifnull(T2.inv_addtion,0)) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id) AS INVWISE_PAYABLE,
	
	T1.refund_amt,
	
	T1.tds_deduct,

	(
	
		(SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)		
		
		+ T2.excess_claim 
		
		+ T2.tds 
		
		+ T2.wct 
		
		+ T2.sd_deduct 
		
		+ T2.incometax_tds
		
		+ T1.pterm_deduct 
		
		+ T1.tds_deduct
		
		+ T2.retention_money
		
	) AS TOT_DEDUCTION,
	
	ROUND(
	
 		T2.invclaim_amt
		
		- (		
		
			(SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id) 
			
			+ T2.excess_claim 			
			
			+ T2.tds 
			
			+ T2.wct 
			
			+ T2.sd_deduct 
			
			+ T2.incometax_tds 
			
			+ T1.pterm_deduct 
						
			+ T1.tds_deduct 
			
			+ T2.retention_money
			
		  )	
		
		+ T1.refund_amt 	
	
	) AS TOT_PAYABLE,


	ROUND(
	
		(
		
			T2.invclaim_amt 
			
			- (
			
				(SELECT SUM(S1.invitem_ld_amt) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)
				
				+ T2.excess_claim
				
				+ T2.tds 
				
				+ T2.wct
				
				+ T2.sd_deduct
				
				+ T2.incometax_tds
			
				+ T1.pterm_deduct 
				
				+ T1.tds_deduct  
				
				+ T2.retention_money 
				
			  )
		
		) *  (T1.recom_percent/100) 
		
		+ T1.refund_amt
			
	) AS TOBE_PAID,	

	T1.notefile_id,
	
	T1.proceeding_id,
	
	T1.gross_payable,
	
	T1.net_payable

FROM invoice_processing AS T1

INNER JOIN invoice AS T2 ON (T2.invoice_id = T1.invoice_id)

LEFT JOIN purchase_order AS T3 ON (T3.purchase_id = T2.purchase_id)

INNER JOIN bidder_details AS T6 ON (T6.bidder_id = T3.bidder_id)

LEFT JOIN master_suppliers_bank AS T4 ON(T4.supplier_id = T6.supplier_id)

LEFT JOIN master_bank AS T5 ON (T5.bank_id = T4.bank_id)

WHERE T3.purchase_type <> "4"

	AND T4.acc_preference = "1"

UNION

SELECT

	DISTINCT 
	
	T3.SUPPLIER,
	
	NULL AS procure_id, 
	
 	T3.supplier_id, 
	
	NULL AS bidder_id,
	
	T3.equip_name AS ITEM,
	
	T3.purchase_id,
	
	T3.purchase_no AS PONO,
	
	DATE_FORMAT(T3.purchase_date,"%d-%b-%Y") AS PODT,
	
	T3.bill_file_no AS POFILE_NO,
	
	T4.bank_accno, 
	
	T4.bank_ifsc, 
	
	T4.bank_name,
	
	T2.invoice_no AS INVNO,
	
	DATE_FORMAT(T2.invoice_dt,"%d-%b-%Y") AS INVDT,
	
	T1.invoice_id,
						
	T1.invoice_processid,
	
	T1.invoice_process_status,
	
	T1.payment_term AS PTERM,
	
	T1.recom_percent AS RECOM_PERCENT,
	
	(SELECT SUM((S1.invitem_qty * S1.invitem_unitprice ) + S1.invitem_addt_charge + T2.inv_addtion) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id) AS INVWISE_PAYABLE,
	
	T1.refund_amt,
	
	T1.tds_deduct,	

	(
	
		(SELECT IFNULL(SUM(S1.invitem_ld_amt),0) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)
				
		+ T2.excess_claim 
		
		+ T2.tds 
		
		+ T2.wct 
		
		+ T2.sd_deduct 
		
		+ T2.incometax_tds
		
		+ T1.pterm_deduct 
		
		+ T1.tds_deduct
		
		+ T2.retention_money
		
	) AS TOT_DEDUCTION,
		
	ROUND(
	
		T2.invclaim_amt 
		
		- (
		
			(SELECT IFNULL(SUM(S1.invitem_ld_amt),2) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)
			
			+ T2.excess_claim
			
			+ T2.tds 
			
			+ T2.wct
			
			+ T2.sd_deduct
			
			+ T2.incometax_tds
			
			+ T1.pterm_deduct
			
			+ T1.tds_deduct
			
			+ T2.retention_money
				
		  )
		  
		+ T1.refund_amt  
		
	) AS TOT_PAYABLE,

	ROUND(
	
		(
		
			T2.invclaim_amt
			
			- (
			
				(SELECT IFNULL(SUM(S1.invitem_ld_amt),0) FROM invoice_items AS S1 WHERE S1.invoice_id = T1.invoice_id)
				
				+ T2.excess_claim
				
				+ T2.tds
				
				+ T2.wct
				
				+ T2.sd_deduct
				
				+ T2.incometax_tds
			
				+ T1.pterm_deduct  
				
				+ T1.tds_deduct 
				
				+ T2.retention_money
				
			  )
		
		) * (T1.recom_percent/100) 
		
		+ T1.refund_amt
			
	) AS TOBE_PAID,
	
	T1.notefile_id,
	
	T1.proceeding_id,
	
	T1.gross_payable,
	
	T1.net_payable

FROM invoice_processing AS T1

INNER JOIN invoice AS T2 ON (T2.invoice_id = T1.invoice_id)

INNER JOIN v_govtpurchase AS T3 ON (T3.purchase_id = T2.purchase_id)

LEFT JOIN master_suppliers_bank AS T4 ON(T4.supplier_id = T3.supplier_id)

LEFT JOIN master_bank AS T5 ON (T5.bank_id = T4.bank_id) 

WHERE T4.acc_preference = "1" ;


-- Dumping structure for view ems_test.v_itequip_details
DROP VIEW IF EXISTS `v_itequip_details`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_itequip_details`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_itequip_details` AS SELECT 

T1.*, 

ELT(FIELD(T1.ite_working_status,'1','2'),'YES','NO') AS WORKING_STS,

ELT(FIELD(T1.ite_warranty_status,'1','2','3'),'NA','By Warranty','By AMC/CAMC') AS WARRANTY_STS,

DATE_FORMAT(T1.ite_warranty_upto,"%d-%b-%Y") AS VALID_UPTO, 

(T1.ite_warranty_upto < NOW()) WARRANTY_EXP,

T2.it_equip_name,

T3.employee_name,

T6.institution_name,

T7.it_location_name

FROM it_equipments_stocks AS T1

LEFT JOIN it_equipments AS T2 ON (T2.IT_equip_id = T1.ite_equip_id)

LEFT JOIN master_emsuser AS T3 ON (T3.acc_user_id = T1.acc_user_id)

-- LEFT JOIN master_role T4 ON (T4.role_id = T1.role_id)

-- LEFT JOIN master_kmscl_dept AS T5 ON (T5.kmscl_dept_id = T1.kmscl_dept_id) 

LEFT JOIN master_institution AS T6 ON (T6.institution_id = T1.ite_office_id) 

LEFT JOIN it_locations AS T7 ON (T7.it_location_id = T1.it_location_id) ;


-- Dumping structure for view ems_test.v_loi
DROP VIEW IF EXISTS `v_loi`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_loi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_loi` AS SELECT 

	T1.loi_id, 
	
	T1.bidder_id, 
	
	T1.loi_ref_no, 
	
	T2.loi_sch_id, 
	
	T2.bidder_equip_id, 
	
	T2.bidder_spareprice_id,
	
	T2.sanction_allotment_id, 
	
	T2.loi_sch_qty, 
	
	(SELECT IFNULL(SUM(S1.loi_sch_qty),0) FROM loi_schedule AS S1 WHERE S1.loi_id = T2.loi_id AND S1.bidder_equip_id = T2.bidder_equip_id) AS QTY, 
	
	T3.UNIT_PRICE,
	
-- 	((SELECT IFNULL(SUM(S1.loi_sch_qty),0) FROM loi_schedule AS S1 WHERE S1.loi_id = T2.loi_id AND S1.bidder_equip_id = T2.bidder_equip_id) * T3.MAIN_EQUIP_PRICE) AS PRICE,

	((SELECT IFNULL(SUM(S1.loi_sch_qty),0) FROM loi_schedule AS S1 WHERE S1.loi_id = T2.loi_id AND S1.bidder_equip_id = T2.bidder_equip_id AND S1.bidder_spareprice_id = T2.bidder_spareprice_id) * T3.MAIN_EQUIP_PRICE) AS PRICE,
	
	T3.procure_id 
	
	-- , T3.procure_no, T3.procure_item_id

FROM loi AS T1 

INNER JOIN loi_schedule AS T2 ON (T2.loi_id = T1.loi_id)

-- LEFT JOIN loi_schedule AS T2 ON (T2.loi_id = T1.loi_id)

LEFT JOIN v_bidder_price AS T3 ON(T3.bidder_equip_id = T2.bidder_equip_id) ;


-- Dumping structure for view ems_test.v_loisch_details
DROP VIEW IF EXISTS `v_loisch_details`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_loisch_details`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_loisch_details` AS SELECT 

	T2.loi_id, 
	
	T2.loi_ref_no, 
	
	T2.loi_file_no, 
	
	DATE_FORMAT(T2.loi_approval_date,"%d-%b-%Y") AS LOIDT,
	
	T1.loi_sch_id,
	
	T1.bidder_equip_id, 
	
	T4.bidder_id, 
	
	T4.supplier_id, 
	
	T5.supplier_name, 
	
	T5.supplier_address,
	
	T3.procure_item_id, 
	
	T7.procure_no, 
	
	T7.procure_name,
	
	T10.equip_code, 
	
	T10.equip_name,
	
	T11.sanction_no, 
	
	T1.sanction_allotment_id,
	
	T11.district_name, 
	
	T11.institution_name, 
	
	T11.dept_name, 
	
	T11.project_name, 
	
	T11.scheme_name, 
	
	T1.loi_sch_qty,

	FORMAT(T12.UNIT_PRICE,"2","EN_IN") AS UNIT_PRICE,

	FORMAT((T1.loi_sch_qty * T12.UNIT_PRICE),"2","EN_IN") AS TOT_LOISCH_PRICE,

	T12.security_deposit,

	FORMAT(((T1.loi_sch_qty * T12.UNIT_PRICE * T12.security_deposit) / 100 ),"2","EN_IN") AS LOISCH_SD,

	T2.loi_status AS LOISTS

FROM loi_schedule AS T1

INNER JOIN loi AS T2 ON(T2.loi_id =T1.loi_id)

INNER JOIN bidder_equipments AS T3 ON(T3.bidder_equip_id = T1.bidder_equip_id)

INNER JOIN bidder_details AS T4 ON (T4.bidder_id = T2.bidder_id)

INNER JOIN master_supplier AS T5 ON (T5.supplier_id =T4.supplier_id)

INNER JOIN procure_item_details AS T6 ON (T6.procure_item_id = T3.procure_item_id)

INNER JOIN procure_details AS T7 ON(T7.procure_id =T6.procure_id)

INNER JOIN procure_basket_items AS T8 ON (T8.procure_basket_item_id = T6.procure_basket_item_id)

-- INNER JOIN procure_basket AS T9 ON (T9.procure_basket_id = T8.procure_basket_id)

INNER JOIN master_equipment AS T10 ON(T10.equip_id = T8.equip_id)

INNER JOIN v_sanction_allotment AS T11 ON(T11.sanction_allotment_id =T1.sanction_allotment_id)

INNER JOIN v_bidder_price AS T12 ON (T12.bidder_equip_id = T1.bidder_equip_id) ;


-- Dumping structure for view ems_test.v_loisch_itemwise
DROP VIEW IF EXISTS `v_loisch_itemwise`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_loisch_itemwise`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_loisch_itemwise` AS SELECT 

	T6.procure_id,
	
	T6.procure_no,
	
	T6.procure_name,
	
	T5.procure_item_id,
	
	T5.equip_id,
	
	T4.procure_item_spare_id,
	
	T4.equip_spare_id,
	
	T3.bidder_id,
	
	T3.supplier_id,
	
	T10.supplier_name,
	
	T2.bidder_equip_id,
	
	T1.bidder_spareprice_id,
	
	T1.spare_make,
	
	T1.spare_basicprice,
	
	T1.spare_salestax,
	
	T1.spare_custtax,
	
	T1.spare_misc,
	
	T7.equip_code,
	
	T7.equip_name,
	
	T8.equip_spare_name,
	
	T9.master_siunit_name

FROM bidder_spare_price AS T1

LEFT JOIN bidder_equipments AS T2 ON (T2.bidder_equip_id = T1.bidder_equip_id)

LEFT JOIN bidder_details AS T3 ON (T3.bidder_id = T2.bidder_id)

LEFT JOIN procure_item_spare_details AS T4 ON (T4.procure_item_spare_id = T1.procure_item_spare_id)

LEFT JOIN procure_item_details AS T5 ON (T5.procure_item_id = T4.procure_item_id)

LEFT JOIN procure_details AS T6 ON (T6.procure_id = T2.procure_id)

LEFT JOIN master_equipment AS T7 ON (T7.equip_id = T5.equip_id)

LEFT JOIN master_equip_spares AS T8 ON (T8.equip_spare_id = T4.equip_spare_id)

LEFT JOIN master_siunit AS T9 ON (T9.master_siunit_id = T8.equip_spare_unit)

LEFT JOIN master_supplier AS T10 ON (T10.supplier_id = T3.supplier_id) ;


-- Dumping structure for view ems_test.v_mainequip_price
DROP VIEW IF EXISTS `v_mainequip_price`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_mainequip_price`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_mainequip_price` AS SELECT 

T1.bidder_id, 

T1.bidder_equip_id, 

T3.pbid_id,

T3.pbid_currency,

T3.pbid_basicprice, 

T3.pbid_salestax, 

T3.pbid_custtax, 

T3.pbid_misc, 

T3.old_pbid_basicprice,

T3.old_pbid_salestax,

T3.old_pbid_custtax,

T3.old_pbid_misc,

T3.is_negotiated,

(T3.pbid_basicprice + T3.pbid_salestax + T3.pbid_custtax + T3.pbid_misc) AS MAIN_EQUIP_PRICE,

(T3.old_pbid_basicprice + T3.old_pbid_salestax + T3.old_pbid_custtax + T3.old_pbid_misc) AS OLD_MAIN_EQUIP_PRICE,

(T3.pbid_basicprice + T3.pbid_custtax + T3.pbid_misc) AS MAIN_EQUIP_PRICE_EXLSTAX,

T3.npvadjust,

T3.gst_active,

T3.cgst_ratio,

T3.cgst_amt,

T3.sgst_ratio,

T3.sgst_amt,

T3.igst_ratio,

T3.igst_amt

FROM bidder_equipments AS T1

LEFT JOIN bidder_details AS T2 ON (T2.bidder_id = T1.bidder_id)

LEFT JOIN bidder_price AS T3 ON (T3.bidder_equip_id = T1.bidder_equip_id) ;


-- Dumping structure for view ems_test.v_master_equipment
DROP VIEW IF EXISTS `v_master_equipment`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_master_equipment`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_master_equipment` AS SELECT

	T1.equip_id, 
	
	T1.equip_code, 
	
	T1.equip_name,
	
	T1.parent_equip_id,
	
	T1.equip_type_id, 
	
	T2.equip_type_name,
	
	T5.hsn_code,
	
	T1.equip_category_id, 
	
	T3.equip_category_code,
	
	T1.dept_id, 
	
	T4.dept_name,
	
	T1.equip_specify, 
	
	T1.equip_status,
	
	T1.entered_on, T1.entered_by, T1.updated_on, T1.updated_by

FROM master_equipment AS T1

LEFT JOIN master_equip_type AS T2 ON (T2.equip_type_id = T1.equip_type_id)

LEFT JOIN master_equip_category AS T3 ON (T3.equip_category_id = T1.equip_category_id) 

LEFT JOIN master_department AS T4 ON (T4.dept_id = T1.dept_id)

LEFT JOIN master_hsncode AS T5 ON (T5.hsn_id = T1.hsn_id)

-- Update @ 05 April 2021 ;


-- Dumping structure for view ems_test.v_master_institution
DROP VIEW IF EXISTS `v_master_institution`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_master_institution`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_master_institution` AS SELECT

	T1.institution_id, 
	
	T1.district_id, 
	
	T4.district_name,
	
	T1.institution_type_id, 
	
	T2.institution_type_code,
	
	T1.institution_category_id, 
	
	T3.institution_category_code,
	
	T1.institution_name, 
	
	T1.institution_address, 
	
	T1.institution_email, 
	
	T1.institution_phone, 
	
	T1.institution_fax, 
	
	T1.institution_status,
	
	T1.entered_on, T1.entered_by, T1.updated_on, T1.updated_by

FROM master_institution AS T1

LEFT JOIN master_institution_type AS T2 ON (T2.institution_type_id = T1.institution_type_id) 

LEFT JOIN master_institution_category AS T3 ON (T3.institution_category_id = T1.institution_category_id) 

LEFT JOIN master_district AS T4 ON (T4.district_id = T1.district_id) 

ORDER BY T1.district_id, T1.institution_category_id, T1.institution_name

-- UPD @ 04 DEC 16 ;


-- Dumping structure for view ems_test.v_master_project
DROP VIEW IF EXISTS `v_master_project`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_master_project`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_master_project` AS SELECT

	T1.fn_year_id, 
	
	(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE S1.fn_year_id = T1.fn_year_id) AS AS_FN_YEAR, 
	
	T1.project_master_id, 
	
	T1.project_name, 
	
	T1.project_remarks, 
	
	T1.project_activation,
	
	T1.entered_on, T1.entered_by, T1.updated_on, T1.updated_by

FROM master_project AS T1

ORDER BY T1.fn_year_id DESC, T1.project_name

-- UPD @ 11 DEC ;


-- Dumping structure for view ems_test.v_procure_details
DROP VIEW IF EXISTS `v_procure_details`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_procure_details`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_procure_details` AS SELECT 

	T1.procure_id, 
	
	T6.fn_year_id, 
	
	T6.fn_year, 
	
	T1.procure_no, 
	
	T1.procure_name,
	
	DATE_FORMAT(T1.procure_startdt,'%d-%b-%Y') AS procure_startdt,
	
	DATE_FORMAT(T1.procure_enddt,'%d-%b-%Y') AS procure_enddt,
	
	DATE_FORMAT(T1.techbid_opendt,'%d-%b-%Y') AS techbid_opendt,
	
	-- DATE_FORMAT(T1.prebid_meetdt,'%d-%b-%Y') AS prebid_meetdt,
	
	T1.procure_basket_item_id, 
	
	T1.tag_id, 
	
	T6.tag_no, 
	
	T1.contract_id, 
	
	T5.contract_name,
	
	T6.procure_type_id, 
	
	T6.procure_type_name,
	
	T1.procure_equip_type_id, 
	
	T2.procure_equip_type_name, 
	
	FORMAT(T1.procure_fees,2,'EN_IN') AS procure_fees, 
	
	FORMAT(T1.procure_emd,2,'EN_IN') AS procure_emd, 
	
	T1.security_deposit, 
	
	T1.ssi_exemption, 
	
	(CASE WHEN T1.ssi_exemption = 1 THEN 'ALLOWED' ELSE 'NOT ALLOWED' END) AS REQSSI,
	
	T1.warranty_period, 
	
	T1.tender_amcslab,
	
	T1.tender_camcslab, 
	
	T1.demo_required, 
	
	(CASE WHEN T1.demo_required = 1 THEN 'REQUIRED' ELSE 'NOT REQUIRED' END) AS REQDM,
	
	T1.amc_camc_consider, 
	
	(CASE WHEN T1.amc_camc_consider = 1 THEN 'CONSIDER' ELSE 'NOT CONSIDER' END) AS REQSC,
	
	(CASE WHEN T1.spare_camc_consider = 1 THEN 'CONSIDER' ELSE 'NOT CONSIDER' END) AS REQCS,
	
	T1.min_pmvisit, 
	
	T1.equip_uptime, 
	
	T1.equip_maxresponse, 
	
	T1.maxresponse_unit, 
	
	(SELECT time_period_desc FROM master_time_period WHERE time_period_id = T1.maxResponse_unit) AS RESPONSE_TIME,
	
	T1.delivery_period, 
	
	T1.delivery_period_id, 
	
	(SELECT time_period_desc FROM master_time_period WHERE time_period_id = T1.delivery_period_id) AS DELIVERY_TIME,
	
	T1.delivery_period_wo,
	
	T1.ld_min, 
	
	T1.ld_period_id, 
	
	(SELECT time_period_desc FROM master_time_period WHERE time_period_id = T1.ld_period_id) AS LDMIN_TIME, 
	
	T1.ld_max, 
	
	T1.delivery_to, 
	
	(CASE WHEN T1.delivery_to = 1 THEN 'SPECIFIED LOCATION' WHEN T1.delivery_to = 2 THEN 'DISTRICT WHARE HOUSE' ELSE 'NA' END) AS DELIVERYTO,
	
	T1.payratio_id, 
	
	T3.int_payratio, 
	
	T3.final_payratio, 
	
	T3.final_payratioII,
	
	(SELECT if(S1.final_payratioII > 0, CONCAT(S1.int_payratio,'-',S1.final_payratio,'-',S1.final_payratioII), CONCAT(S1.int_payratio,'-',S1.final_payratio)) FROM master_payment_ratio AS S1 WHERE S1.payratio_id = T1.payratio_id) AS PAYRATIO,

	-- CONCAT(T3.int_payratio,'-',T3.final_payratio,(IF T3.final_payratio > 1 : T3.final_payratio )) AS PAYRATIO,
	
	FORMAT(T1.turnover,2,'EN_IN') AS turnover,
	
	T1.warranty_cert_req, 
	
	(CASE WHEN T1.warranty_cert_req = 1 THEN 'REQUIRED' ELSE 'NOT REQUIRED' END) AS REQWC,
	
	T1.install_report_req, 
	
	(CASE WHEN T1.install_report_req = 1 THEN 'REQUIRED' ELSE 'NOT REQUIRED' END) AS REQIR,
	
	T1.material_receive_cert, 
	
	(CASE WHEN T1.material_receive_cert = 1 THEN 'REQUIRED' ELSE 'NOT REQUIRED' END) AS REQMRC,
	
	T1.sticker, 
	
	(CASE WHEN T1.sticker = 1 THEN 'REQUIRED' ELSE 'NOT REQUIRED' END) AS REQSTK,
	
	T1.performance_cert_req, 
	
	(CASE WHEN T1.performance_cert_req = 1 THEN 'REQUIRED' ELSE 'NOT REQUIRED' END) AS REQPC,
	
	T1.photograph_req, 
	
	(CASE WHEN T1.photograph_req = 1 THEN 'REQUIRED' ELSE 'NOT REQUIRED' END) AS REQPH,
	
	T1.procure_remarks,
	
	T1.procure_cancel, 
	
	DATE_FORMAT(T1.procure_cancel_dt, "%d-%b-%Y") AS PRC_CANCEL_DT, 
	
	T1.procure_cancel_remarks,
	
	T1.procure_confirm, 
	
	T1.procure_bidder_entry,
	
	T1.entered_on, T1.entered_by, T1.updated_on, T1.updated_by

FROM procure_details T1

LEFT JOIN master_procure_equip_type AS T2 ON (T2.procure_equip_type_id = T1.procure_equip_type_id)

LEFT JOIN master_payment_ratio AS T3 ON (T3.payratio_id = T1.payratio_id)

LEFT JOIN master_contract_type AS T5 ON (T5.contract_id = T1.contract_id) 

LEFT JOIN v_tag_details AS T6 ON (T6.tag_id = T1.tag_id)

-- UPD @ 30 NOV 15 ;


-- Dumping structure for view ems_test.v_procure_item_details
DROP VIEW IF EXISTS `v_procure_item_details`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_procure_item_details`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_procure_item_details` AS SELECT 

	T1.procure_item_id, 
	
	T1.procure_id,
	
	T1.procure_basket_item_id, 
	
	T1.equip_id, 
	
	T1.procure_item_qty,
	
	T2.procure_equip_type_id,
	
	T2.procure_no, 
	
	T2.procure_name,
	
	T2.procure_confirm,
	
	T3.procure_basket_id, 
	 	
	T5.equip_code, 
	
	T5.equip_name,
	
	T6.procure_equip_type_name

FROM procure_item_details AS T1

LEFT JOIN procure_details AS T2 ON (T2.procure_id = T1.procure_id)

LEFT JOIN procure_basket_items AS T3 ON(T3.procure_basket_item_id = T1.procure_basket_item_id)

-- LEFT JOIN procure_basket AS T4 ON(T4.procure_basket_id = T3.procure_basket_id)

-- LEFT JOIN v_master_equipment AS T5 ON(T5.equip_id = T1.equip_id)

LEFT JOIN v_master_equipment AS T5 ON(T5.equip_id = T3.equip_id)

LEFT JOIN master_procure_equip_type AS T6 ON (T6.procure_equip_type_id = T2.procure_equip_type_id)

-- UPD @ 29 Nov 2018 ;


-- Dumping structure for view ems_test.v_purchase
DROP VIEW IF EXISTS `v_purchase`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_purchase`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_purchase` AS -- Non Govt Agency Order Details

SELECT

	T1.purchase_qty,	
	
	T1.sanction_allotment_id,	
		
	T1.purchase_sch_id, 
		
	T1.purchase_id, 
	
	T1.bidder_equip_id, 
	
	T1.bidder_spareprice_id, 
	
	T1.equip_id, 
	
	T1.delivery_confirm_date,
	
	T2.delivery_period_extn,
	
	T2.procure_id, 
	
	T2.bidder_id, 
	
	T2.govtagency_item_id, 
	
	T2.govtagency_id,	
	
	T2.purchase_type, 
	 
	T2.purchase_no, 
	 
	T2.purchase_date, 
	
	T2.purchase_file_no, 
	 
	T2.bill_file_no, 
	 
	T2.purchase_status, 
	 
	T2.purchase_cancel,
	
	T1.schedule_canceled,
	
	T3.sanction_no,
	
	T3.sanction_order_id,

	T3.AS_DATE,
	
	T3.institution_id,
	
	T3.district_name, 
	 
	T3.institution_name, 
	 
	T3.dept_name, 
	 
	T3.project_name, 
	
	T3.SCHID,
	 
	T3.scheme_name, 
	
	T1.qtyamend_from,
	
	T3.equip_code, 
	 
	T3.equip_name, 
	
	T3.equip_type_id,
	 
	T3.alloted_qty, 
	
	T4.procure_no, 
	 
	T4.procure_startdt, 
	
	T4.pricebid_open_dt,
	
	T4.final_res_dt,
	 
	T4.procure_name, 
	 
	T4.install_report_req, 
	 
	T4.tender_amcslab, 
	 
	T4.tender_camcslab, 
		
	T4.supplier_id, 
		
	T4.supplier_name, 
	
	T4.supplier_gstin,
		
	T6.warranty_period, 
	
	T6.min_pmvisit, 
	
	CONCAT(T6.delivery_period, ' ', T7.time_period_desc) AS DELIVERY,
	
	(T1.purchase_basicprice + T1.purchase_cduty + T1.purchase_misc) AS TaxableAmount,
	
	T1.purchase_taxamt AS TaxAmount,
	
	(T1.purchase_qty * (T1.purchase_basicprice + T1.purchase_taxamt + T1.purchase_cduty + T1.purchase_misc)) AS OrderValue,
	
	(CASE 
	
		WHEN T1.bidder_spareprice_id IS NOT NULL THEN T5.SPARE_UNIT_PRICE
		
		ELSE T4.MAIN_EQUIP_PRICE
	
	END) AS UNIT_PRICE,
		
	(CASE 
	
		WHEN T1.bidder_spareprice_id IS NULL THEN "N"
		
		ELSE "Y"
	
	END) AS IS_SPARE,
	
	(CASE 
	
		WHEN T1.bidder_spareprice_id IS NULL THEN "NIL"
		
		ELSE T5.equip_spare_name
	
	END) AS SPARE_NAME,
	
	(CASE 
	
		WHEN T1.bidder_spareprice_id IS NULL THEN T4.bidder_make_model
		
		ELSE T5.spare_make
	
	END) AS MODEL

FROM purchase_schedule AS T1

INNER JOIN purchase_order AS T2 ON (T2.purchase_id = T1.purchase_id)

LEFT JOIN v_sanction_allotment AS T3 ON (T3.sanction_allotment_id = T1.sanction_allotment_id)

LEFT JOIN v_bidder_price AS T4 ON (T4.bidder_equip_id = T1.bidder_equip_id)

LEFT JOIN v_bidder_spare_price AS T5 ON (T5.bidder_spareprice_id = T1.bidder_spareprice_id) 

LEFT JOIN procure_details AS T6 ON (T6.procure_id = T2.procure_id) 

LEFT JOIN master_time_period AS T7 ON (T7.time_period_id = T6.delivery_period_id)

-- WHERE T2.purchase_type <> 4

-- UPD @ 27 Mar 2019 ;


-- Dumping structure for view ems_test.v_purchase_order
DROP VIEW IF EXISTS `v_purchase_order`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_purchase_order`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_purchase_order` AS -- LOI REQ FOR TENDER

SELECT 

	DISTINCT 
	
	T1.purchase_id, 
	
	T1.purchase_no, 
	
	DATE_FORMAT(T1.purchase_date,'%d-%b-%Y') AS PUR_DATE, 
	
	T1.purchase_status,
	
	T1.procure_id, 
	
	T2.procure_no, 
	
	T2.procure_name,
	
	T1.bidder_id, 
	
	T1.dealer_id,
	
	T2.bidder_equip_id, 
	
	T2.supplier_id AS SID, 
	
	T2.supplier_name, 
	
	T2.supplier_address, 
	
	T2.contact_person, 
	
	T2.supplier_mobile, 
	
	T2.supplier_phone, 
	
	T2.supplier_email, 
	
	T2.equip_id, 
	
	T2.equip_code, 
	
	T2.equip_name, 
	
	T2.bidder_make_model

FROM purchase_order AS T1

INNER JOIN v_bidder_details AS T2 ON (T2.bidder_id = T1.bidder_id AND T2.promote_supplier ='1' AND T2.bidder_confirm ='1' AND T2.procure_type_id ='1')

WHERE T1.purchase_type <> '5' -- EXCLUDE WORK ORDER
-- AND T2.loi_issued ='1'
UNION

-- LOI NOT REQ (OPTIONAL) FOR WORK ORDER

SELECT 

	DISTINCT 
	
	T1.purchase_id, 
	
	T1.purchase_no, 
	
	DATE_FORMAT(T1.purchase_date,'%d-%b-%Y') AS PUR_DATE, 
	
	T1.purchase_status,
	
	T1.procure_id, 
	
	T2.procure_no, 
	
	T2.procure_name,
	
	T1.bidder_id, 
	
	T1.dealer_id,
	
	T2.bidder_equip_id, 
	
	T2.supplier_id AS SID, 
	
	T2.supplier_name, 
	
	T2.supplier_address, 
	
	T2.contact_person, 
	
	T2.supplier_mobile, 
	
	T2.supplier_phone, 
	
	T2.supplier_email, 
	
	T2.equip_id, 
	
	T2.equip_code, 
	
	T2.equip_name, 
	
	T2.bidder_make_model

FROM purchase_order AS T1

INNER JOIN v_bidder_details AS T2 ON (T2.bidder_id = T1.bidder_id AND T2.promote_supplier ='1' AND T2.bidder_confirm ='1' AND T2.procure_type_id ='1')

WHERE T1.purchase_type = '5'

UNION 

-- LOI NOT REQ FOR QUOTATION, WORK ORDER (Not Mandatory)

SELECT 

	T1.purchase_id, 
	
	T1.purchase_no, 
	
	DATE_FORMAT(T1.purchase_date,'%d-%b-%Y') AS PUR_DATE, 
	
	T1.purchase_status,
	
	T1.procure_id, 
	
	T2.procure_no, 
	
	T2.procure_name,
	
	T1.bidder_id, 
	
	T1.dealer_id,
	
	T2.bidder_equip_id,  
	
	T2.supplier_id AS SID,
	
	T2.supplier_name, 
	
	T2.supplier_address, 
	
	T2.contact_person, 
	
	T2.supplier_mobile, 
	
	T2.supplier_phone, 
	
	T2.supplier_email, 
	
	T2.equip_id, 
	
	T2.equip_code, 
	
	T2.equip_name, 
	
	T2.bidder_make_model

FROM purchase_order AS T1

INNER JOIN v_bidder_details AS T2 ON (T2.bidder_id = T1.bidder_id AND T2.promote_supplier ='1' AND T2.bidder_confirm ='1' AND T2.procure_type_id ='2')

-- UPD @ 30 MAR 17 ;


-- Dumping structure for view ems_test.v_purchase_qty
DROP VIEW IF EXISTS `v_purchase_qty`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_purchase_qty`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_purchase_qty` AS SELECT 

	T1.bidder_id, 
	
	T1.purchase_id, 
	
	T1.purchase_no, 
	
	DATE_FORMAT(T1.purchase_date,'%d-%b-%Y') AS PUR_DATE, 
	
	T1.purchase_status,
	
	(SELECT IFNULL(SUM(S1.purchase_qty),0) FROM purchase_schedule AS S1 where S1.purchase_id = T1.purchase_id) AS TOT_PO_QTY 

FROM purchase_order AS T1 ;


-- Dumping structure for view ems_test.v_purchase_schdule
DROP VIEW IF EXISTS `v_purchase_schdule`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_purchase_schdule`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_purchase_schdule` AS SELECT 

	T1.purchase_id, 
	
	T1.bidder_id, 
	
	T1.purchase_no, 
	
	T1.purchase_file_no, 
	
	T1.purchase_creationdate, 
	
	T1.purchase_date,
	
	T1.purchase_status, 
	
	T2.purchase_sch_id, 
	
	T2.bidder_equip_id, 
	
	T2.equip_id, 
	
	T2.bidder_spareprice_id,
	
	T2.sanction_allotment_id, 
	
	T1.purchase_type,
	
	T2.purchase_qty, 
	
	T2.purchase_basicprice,
	
	T2.purchase_taxamt,
	
	T2.purchase_cduty,
	
	T2.purchase_misc,
	
	T2.purchase_cgst,
	
	T2.purchase_sgst,
	
	T2.purchase_igst,
	
	T2.purchase_sch_unitcost,
	
	T4.supplier_name

FROM purchase_order AS T1

LEFT JOIN purchase_schedule AS T2 ON (T2.purchase_id = T1.purchase_id)

LEFT JOIN bidder_details AS T3 ON (T3.bidder_id = T1.bidder_id)

LEFT JOIN master_supplier AS T4 ON (T4.supplier_id = T3.supplier_id)

-- INCOMPLETE ;


-- Dumping structure for view ems_test.v_sanction_allotment
DROP VIEW IF EXISTS `v_sanction_allotment`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_sanction_allotment`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_sanction_allotment` AS SELECT

	T1.*,
	
	T2.institution_type_code, 
	
	T2.institution_category_code, 

	T2.district_name, 
	
	T2.institution_name, 
	
	T3.dept_name,
	
-- 	T4.sanction_order_id, 
	
	T4.sanction_no, 
	
	T4.AS_FN_YEAR,
	
	T4.AS_DATE, 
	
	T4.project_master_id,
	
	T4.project_name, 
	
	-- T4.sanction_scheme_id,
	
	T4.SCHID,
	
	T4.scheme_name, 
	
	T4.equip_id, 
	
	T4.equip_code, 
	
	T4.equip_name, 
	
	T4.hsn_code,
	
	T4.equip_type_id,
	
	T4.sanction_equip_qty,
	
	T4.sanction_fund_amt,
	
	T4.TOT_AS_AMT,
	
	T4.sanction_status,
	
--	FORMAT(T4.sanction_fund_amt,"2","EN_IN") AS EST_AMT,

	T4.sanction_fund_amt AS EST_AMT,
	
	T4.moved_to_basket,
	
	T4.PROJECT_MASTER_FYID,
	
	T4.fn_year_id,
	
	T4.is_freezed

FROM sanction_allotment AS T1

LEFT JOIN v_master_institution AS T2 ON (T2.institution_id = T1.institution_id) 

LEFT JOIN master_department AS T3 ON (T3.dept_id = T1.dept_id) 

LEFT JOIN v_sanction_equip AS T4 ON (T4.sanction_equip_id = T1.sanction_equip_id)

-- UPD @ 05 April 2021 ;


-- Dumping structure for view ems_test.v_sanction_details
DROP VIEW IF EXISTS `v_sanction_details`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_sanction_details`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_sanction_details` AS SELECT

	T1.*, 
	
	T2.sanction_project_id, 
	
	T2.project_name, 
	
	T2.project_master_id,
	
	T3.sanction_scheme_id, 
	
	T3.scheme_name, 
	
	T3.scheme_master_id,
	
	T4.equip_id, 
	
	T4.sanction_equip_id, 
	
	T4.equip_code, 
	
	T4.equip_name, 
	
	T4.sanction_equip_qty, 
	
	-- T4.moved_to_basket,
	
	T4.sanction_fund_amt AS EST_UNIT_PRICE, 
	
	T5.sanction_allotment_id, 
	
	T5.district_name, 
	
	T5.institution_id,
	
	T5.institution_name, 
	
	T5.dept_name, 
	
	T5.alloted_qty,
	
	T6.fn_year AS AS_FN_YEAR

FROM sanction_order AS T1

LEFT JOIN v_sanction_order_projects AS T2 ON (T2.sanction_order_id = T1.sanction_order_id) 

LEFT JOIN v_sanction_order_schemes AS T3 ON (T3.sanction_project_id = T2.sanction_project_id) 

LEFT JOIN v_sanction_equip AS T4 ON (T4.sanction_scheme_id = T3.sanction_scheme_id) 

LEFT JOIN v_sanction_allotment AS T5 ON (T5.sanction_equip_id = T4.sanction_equip_id)

LEFT JOIN master_financial_year AS T6 ON(T6.fn_year_id = T1.fn_year_id) 

-- UPD @ JUN 09 16 

/*
SELECT

T1.*, 

T2.sanction_project_id, T2.project_name, T2.project_master_id,

T3.sanction_scheme_id, T3.scheme_name, T3.scheme_master_id,

T4.sanction_equip_id, T4.equip_id, T4.equip_code, T4.equip_name, T4.sanction_equip_qty,

T5.sanction_allotment_id, T5.district_name, T5.institution_name, T5.dept_name, T5.alloted_qty, T5.institution_id

FROM sanction_order AS T1

LEFT JOIN v_sanction_order_projects AS T2 ON (T2.sanction_order_id = T1.sanction_order_id) 

LEFT JOIN v_sanction_order_schemes AS T3 ON (T3.sanction_project_id = T2.sanction_project_id) 

LEFT JOIN v_sanction_equip AS T4 ON (T4.sanction_scheme_id = T3.sanction_scheme_id) 

LEFT JOIN v_sanction_allotment AS T5 ON (T5.sanction_equip_id = T4.sanction_equip_id)

-- UPD @ NOV 26 
*/ ;


-- Dumping structure for view ems_test.v_sanction_equip
DROP VIEW IF EXISTS `v_sanction_equip`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_sanction_equip`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_sanction_equip` AS SELECT 

	T1.*,

--	T1.sanction_project_id,

	(CASE
	
	WHEN T1.parent_sanction_equip_id > 0 THEN (SELECT S2.equip_name FROM sanction_equip AS S1 INNER JOIN master_equipment AS S2 ON (S1.equip_id = S2.equip_id) WHERE S1.sanction_equip_id = T1.parent_sanction_equip_id)
	
	ELSE ""
	
	END) AS PARENT_EQUIP_NAME,

	(T1.sanction_equip_qty * T1.sanction_fund_amt) AS EST_PRICE,
	
	T1.sanction_fund_amt AS EST_UNIT_PRICE,
	
	T2.equip_type_id, 
	
	T2.equip_type_name, 
	
	T2.equip_category_code, 
	
	T2.equip_code, 
	
	T2.equip_name, 
	
	T2.hsn_code,
	
	T2.parent_equip_id,
	
	T3.PROJECT_MASTER_FYID,
	
	T3.project_master_id,
	
	T3.project_name,
	
	T3.scheme_master_id AS SCHID, 
	
	T3.scheme_name, 
	
	T3.sanction_no, 
	
	T4.fn_year_id, 
	
	T4.utr_no,
	
	DATE_FORMAT(T4.utr_txn_date, "%d-%b-%Y") AS UTR_TXN_DT, 
	
	T5.fn_year AS  AS_FN_YEAR, 
	
	T4.sanction_status, 
	
	DATE_FORMAT(T4.sanction_date, "%d-%b-%Y") AS AS_DATE, 
	
	T4.sanction_amt AS TOT_AS_AMT,
	
	T4.is_freezed	

FROM sanction_equip AS T1 

LEFT JOIN v_master_equipment AS T2  ON(T2.equip_id = T1.equip_id)

LEFT JOIN v_sanction_order_schemes AS T3 ON (T3.sanction_scheme_id = T1.sanction_scheme_id) 

-- LEFT JOIN v_sanction_order AS T4 ON (T4.sanction_order_id = T1.sanction_order_id)

LEFT JOIN sanction_order AS T4 ON (T4.sanction_order_id = T1.sanction_order_id)

LEFT JOIN master_financial_year AS T5 ON (T5.fn_year_id = T4.fn_year_id)

-- UPD @ 05 April 2021 ;


-- Dumping structure for view ems_test.v_sanction_order
DROP VIEW IF EXISTS `v_sanction_order`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_sanction_order`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_sanction_order` AS SELECT 

	DISTINCT
	
	T1.fn_year_id, 
	
	T2.fn_year AS AS_FN_YEAR,
	
	T1.sanction_order_id, 
	
	T1.sanction_no, 
	
	T1.sanction_date, 
	
	DATE_FORMAT(T1.sanction_date,'%d-%b-%Y') AS AS_DATE,
	
	T1.sanction_amt, 
	
	T1.sanction_status,
	
	T3.project_master_id,
	
	T1.is_revert,
	
	T1.sanctionrevert_remarks,
	
	T1.sanction_remarks
	
	-- T1.entered_on, T1.entered_by, T1.updated_on, T1.updated_by

FROM sanction_order AS T1

LEFT JOIN master_financial_year AS T2 ON(T2.fn_year_id = T1.fn_year_id) 

LEFT JOIN sanction_order_projects AS T3 ON (T3.sanction_order_id = T1.sanction_order_id)

ORDER BY T1.fn_year_id DESC, T1.sanction_order_id

-- UPD @ JAN 21 ;


-- Dumping structure for view ems_test.v_sanction_order_projects
DROP VIEW IF EXISTS `v_sanction_order_projects`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_sanction_order_projects`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_sanction_order_projects` AS SELECT 

	DISTINCT 
	
 	T3.fn_year_id, 
	
 	(SELECT S1.fn_year FROM master_financial_year AS S1 WHERE S1.fn_year_id = T3.fn_year_id) AS AS_FN_YEAR,
	
	T1.sanction_order_id, 
	
 	T3.sanction_no, 
	
	T1.sanction_project_id,
	
	T1.project_master_id, 
	
	T2.project_name,
	
	T1.sanction_project_remarks, 
	
 	T3.sanction_status,
	
	T1.entered_on, 
	
	T1.entered_by, 
	
	T1.updated_on, 
	
	T1.updated_by,
	
	T1.readonly

FROM sanction_order_projects AS T1 

INNER JOIN master_project AS T2 ON (T2.project_master_id = T1.project_master_id)

INNER JOIN sanction_order AS T3 ON (T3.sanction_order_id = T1.sanction_order_id)

ORDER BY T3.fn_year_id DESC, T1.sanction_order_id, T1.project_master_id

--  Upd @ 08.03.2018

/*

SELECT 

	DISTINCT 
	
	T3.fn_year_id, 
	
	T3.AS_FN_YEAR,
	
	T1.sanction_order_id, 
	
	T3.sanction_no, 
	
	T1.sanction_project_id,
	
	T1.project_master_id, 
	
	T2.project_name,
	
	T1.sanction_project_remarks, 
	
	T3.sanction_status,
	
	T1.entered_on, 
	
	T1.entered_by, 
	
	T1.updated_on, 
	
	T1.updated_by

FROM sanction_order_projects AS T1 

-- INNER JOIN v_master_project AS T2 ON (T2.project_master_id = T1.project_master_id) 

INNER JOIN master_project AS T2 ON (T2.project_master_id = T1.project_master_id)

INNER JOIN v_sanction_order AS T3 ON (T3.sanction_order_id = T1.sanction_order_id)

ORDER BY T3.fn_year_id DESC, T1.sanction_order_id, T1.project_master_id

-- UPD @ NOV 26 

*/ ;


-- Dumping structure for view ems_test.v_sanction_order_schemes
DROP VIEW IF EXISTS `v_sanction_order_schemes`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_sanction_order_schemes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_sanction_order_schemes` AS SELECT 
	
	DISTINCT
	
 	T5.fn_year_id, 

	S2.fn_year AS AS_FN_YEAR,
	
	T1.sanction_order_id, 
	
 	T5.sanction_no,
 	
 	S1.fn_year_id AS PROJECT_MASTER_FYID,
	
	T1.sanction_project_id, 
	
	S1.project_master_id,

	S1.project_name,
	
	T1.sanction_scheme_id, 
	
	T1.scheme_master_id, 
	
	T2.scheme_name, 
	
	T1.sanction_scheme_remarks,
	
	T5.sanction_status, 
	
	T1.entered_on, 
	
	T1.entered_by, 
	
	T1.updated_on, 
	
	T1.updated_by,
	
	T1.readonly,
	
	IFNULL(SUM(T4.fund_dd_amt),0) AS SCHEME_FUND_RECEIVED

FROM sanction_order_schemes AS T1

INNER JOIN master_scheme AS T2 ON (T2.scheme_master_id = T1.scheme_master_id)

INNER JOIN sanction_order_projects AS T3 ON (T3.sanction_project_id = T1.sanction_project_id)

LEFT JOIN sanction_fund_received AS T4 ON (T4.sanction_scheme_id = T1.sanction_scheme_id)

INNER JOIN sanction_order AS T5 ON (T5.sanction_order_id = T3.sanction_order_id)

INNER JOIN master_project AS S1 ON ( S1.project_master_id = T3.project_master_id)

INNER JOIN master_financial_year AS S2 ON( S2.fn_year_id = T5.fn_year_id)

GROUP BY T1.sanction_scheme_id 

ORDER BY T5.fn_year_id DESC, T3.sanction_order_id, T1.sanction_project_id, T1.sanction_scheme_id 

-- Upd @ 08.03.2018

/*
SELECT 
	
	DISTINCT
	
	T3.fn_year_id, 
	
	T3.AS_FN_YEAR,
	
	T1.sanction_order_id, 
	
	T3.sanction_no,
	
	T1.sanction_project_id, 
	
	T3.project_name,
	
	T1.sanction_scheme_id, 
	
	T1.scheme_master_id, 
	
	T2.scheme_name, 
	
	T1.sanction_scheme_remarks,
	
	T3.sanction_status, 
	
	T1.entered_on, 
	
	T1.entered_by, 
	
	T1.updated_on, 
	
	T1.updated_by,
	
	IFNULL(SUM(T4.fund_dd_amt),0) AS SCHEME_FUND_RECEIVED

FROM sanction_order_schemes AS T1

INNER JOIN master_scheme AS T2 ON (T2.scheme_master_id = T1.scheme_master_id)

INNER JOIN v_sanction_order_projects AS T3 ON (T3.sanction_project_id = T1.sanction_project_id)

LEFT JOIN sanction_fund_received AS T4 ON (T4.sanction_scheme_id = T1.sanction_scheme_id)

GROUP BY T1.sanction_scheme_id 

ORDER BY T3.fn_year_id DESC, T3.sanction_order_id, T1.sanction_project_id, T1.sanction_scheme_id 

-- UPD @ NOV 26 

*/ ;


-- Dumping structure for view ems_test.v_sd_details
DROP VIEW IF EXISTS `v_sd_details`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_sd_details`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_sd_details` AS SELECT 

	T1.sd_rec_id, T1.sd_rec_for, T1.sd_bgexpiredt,
	
	(CASE 	
	
		WHEN T1.sd_rec_for = "1" THEN "FOR LOI"
	
		WHEN T1.sd_rec_for = "2" THEN "FOR PO"
	
		ELSE "INVALID"		
	
	END) AS SD_FOR,
	
	(CASE 	
	
		WHEN T1.sd_rec_for = "1" THEN (SELECT T2.supplier_name FROM bidder_details AS T1 INNER JOIN master_supplier AS T2 ON(T1.supplier_id = T2.supplier_id) WHERE T1.bidder_id = T3.bidder_id)
	
		WHEN T1.sd_rec_for = "2" THEN (SELECT T2.supplier_name FROM bidder_details AS T1 INNER JOIN master_supplier AS T2 ON(T1.supplier_id = T2.supplier_id) WHERE T1.bidder_id = T4.bidder_id)
	
		ELSE "NA"		
	
	END) AS SUP_NAME,
	
(CASE 	
	
		WHEN T1.sd_rec_for = "1" THEN (SELECT CONCAT(T2.procure_name," [",T2.procure_no,"]") FROM bidder_details AS T1 INNER JOIN procure_details AS T2 ON(T1.procure_id = T2.procure_id) WHERE T1.bidder_id = T3.bidder_id)
	
		WHEN T1.sd_rec_for = "2" THEN (SELECT CONCAT(T2.procure_name," [",T2.procure_no,"]") FROM bidder_details AS T1 INNER JOIN procure_details AS T2 ON(T1.procure_id = T2.procure_id) WHERE T1.bidder_id = T4.bidder_id)
	
		ELSE "NA"		
	
	END) AS PRC_NAME,	
	
	T1.loi_id, T3.loi_ref_no, DATE_FORMAT(T3.loi_approval_date, "%d-%m-%Y") AS LOI_DT, 
	
	T1.purchase_id, T4.purchase_no, DATE_FORMAT(T4.purchase_date, "%d-%m-%Y") AS PO_DT,
	
	T1.sd_paymode,
	
	(CASE 
	
		WHEN T1.sd_paymode = "1" THEN "DD"
	
		WHEN T1.sd_paymode = "2" THEN "BG"
		
		ELSE "NA"
	
	END) AS PAYMODE,
	
	T1.bank_id, T2.bank_name, T1.sd_ref_number, 
	
	DATE_FORMAT(T1.sd_bankissuedt, "%d-%m-%Y") AS SD_ISSUE_DT, 
	
	DATE_FORMAT(T1.sd_rec_date, "%d-%m-%Y") AS SD_REC_DT, 
	
	DATE_FORMAT(T1.sd_bgexpiredt, "%d-%m-%Y") AS BG_EXP_DT, 
	
	T1.sd_rec_amt AS SD_AMT, 
	
	T1.sd_remarks, 
	
	T1.entered_on, T1.entered_by, T1.updated_on, T1.updated_by, T1.ipaddress
	

FROM sd_details AS T1

LEFT JOIN master_bank AS T2 ON (T2.bank_id = T1.bank_id) 

LEFT JOIN loi AS T3 ON (T3.loi_id = T1.loi_id)

LEFT JOIN purchase_order AS T4 ON (T4.purchase_id = T1.purchase_id) 

-- UPD @ 07-OCT-2016 ;


-- Dumping structure for view ems_test.v_spare_price
DROP VIEW IF EXISTS `v_spare_price`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_spare_price`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_spare_price` AS SELECT 

T1.bidder_id, 

T1.bidder_equip_id, 

-- T3.bidder_spareprice_id,
/*
T3.spare_basicprice, 

T3.spare_salestax, 

T3.spare_custtax, 

T3.spare_misc,

T4.procure_spare_qty,

*/

SUM(T4.procure_spare_qty * (T3.old_spare_basicprice + T3.old_spare_salestax + T3.old_spare_custtax + T3.old_spare_misc)) AS OLD_SPARE_PRICE,

SUM(T4.procure_spare_qty * (T3.spare_basicprice + T3.spare_salestax + T3.spare_custtax + T3.spare_misc)) AS SPARE_PRICE

FROM bidder_equipments AS T1

LEFT JOIN bidder_details AS T2 ON (T2.bidder_id = T1.bidder_id)

LEFT JOIN bidder_spare_price AS T3 ON (T3.bidder_equip_id = T1.bidder_equip_id)

LEFT JOIN procure_item_spare_details AS T4 ON (T4.procure_item_spare_id = T3.procure_item_spare_id)

WHERE T4.procure_spare_inclcal = 1

GROUP BY T1.bidder_equip_id

-- UPD ON 20 AUG 2017

-- PURPOSE : All spares total cost against the Main Equipment ( BEID ) ;


-- Dumping structure for view ems_test.v_tag_details
DROP VIEW IF EXISTS `v_tag_details`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_tag_details`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_tag_details` AS SELECT 

	T1.fn_year_id, 
	
	T2.fn_year, 
	
	T2.start_year, 
	
	T2.end_year, 
	
	T1.procure_type_id, 
	
	T3.procure_type_name,
	
	T1.tag_id, 
	
	T1.tag_no, 
	
	CONCAT(T1.tag_no,"/",T2.start_year) AS TAG,
	
	T1.tag_remarks,
	
	(
		SELECT COUNT(S1.procure_id) AS CNT
		
		FROM procure_details AS S1 
		
		WHERE S1.tag_id = T1.tag_id AND S1.procure_confirm <> '1' AND  S1.procure_cancel <> '1' AND ( 
		
			S1.procure_bidder_entry <> 'C' OR 
		
			(SELECT MIN(WS1.promote_supplier) FROM bidder_equipments AS WS1 WHERE WS1.procure_id = S1.procure_id) <> '1')
		
	) AS PRC_IC,
		
	(
	
		SELECT 
		
		COUNT(S1.procure_id) 
		
		FROM procure_details AS S1 
		
		WHERE S1.tag_id = T1.tag_id AND S1.procure_bidder_entry = 'C' AND 
		
			S1.procure_cancel = '2' AND 
			
			S1.procure_confirm ='2' AND
		
			(SELECT MIN(WS1.promote_supplier) FROM bidder_equipments AS WS1 WHERE WS1.procure_id = S1.procure_id) = '1'
			
	) AS PRC_NYV,	
	
	(SELECT COUNT(S1.procure_id) FROM procure_details AS S1 WHERE S1.tag_id = T1.tag_id AND S1.procure_confirm ='1' AND S1.procure_cancel <> '1') AS PRC_A,
	
	(SELECT COUNT(S1.procure_id) FROM procure_details AS S1 WHERE S1.tag_id = T1.tag_id AND S1.procure_cancel = '1') AS PRC_CAN,
	
	(SELECT COUNT(S1.procure_id) FROM procure_details AS S1 WHERE S1.tag_id = T1.tag_id ) AS PRC_TOT

FROM tag_details AS T1

LEFT JOIN master_financial_year AS T2 ON (T2.fn_year_id = T1.fn_year_id) 

LEFT JOIN master_procure_type AS T3 ON (T3.procure_type_id = T1.procure_type_id) 

ORDER BY T1.fn_year_id DESC, T1.tag_id DESC

-- UPD @ 22 AUG 18

/*
SELECT 

	T1.fn_year_id, 
	
	T2.fn_year, 
	
	T2.start_year, 
	
	T2.end_year, 
	
	T1.procure_type_id, 
	
	T3.procure_type_name,
	
	T1.tag_id, 
	
	T1.tag_no, 
	
	T1.tag_remarks,
	
-- 	T1.entered_on, T1.entered_by, T1.updated_on, T1.updated_by,
	
	(SELECT COUNT(S1.procure_id) FROM procure_details AS S1 WHERE S1.tag_id = T1.tag_id AND S1.procure_confirm ='3' AND S1.procure_cancel <> '1') AS PRC_IC,
	
	(SELECT COUNT(S1.procure_id) FROM procure_details AS S1 WHERE S1.tag_id = T1.tag_id AND S1.procure_confirm ='2' AND S1.procure_cancel <> '1') AS PRC_NYV,
	
	(SELECT COUNT(S1.procure_id) FROM procure_details AS S1 WHERE S1.tag_id = T1.tag_id AND S1.procure_confirm ='1' AND S1.procure_cancel <> '1') AS PRC_A,
	
	(SELECT COUNT(S1.procure_id) FROM procure_details AS S1 WHERE S1.tag_id = T1.tag_id AND S1.procure_cancel = '1') AS PRC_CAN,
	
	(SELECT COUNT(S1.procure_id) FROM procure_details AS S1 WHERE S1.tag_id = T1.tag_id ) AS PRC_TOT

FROM tag_details AS T1

LEFT JOIN master_financial_year AS T2 ON (T2.fn_year_id = T1.fn_year_id) 

LEFT JOIN master_procure_type AS T3 ON (T3.procure_type_id = T1.procure_type_id) 

ORDER BY T1.fn_year_id DESC, T1.tag_id DESC

-- UPD @ 11 DEC
*/ ;


-- Dumping structure for view ems_test.v_workint
DROP VIEW IF EXISTS `v_workint`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_workint`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `v_workint` AS SELECT 

DISTINCT

T1.workint_id,

-- T2.workint_sch_id, T2.bidder_equip_id, T2.equip_id, T2.bidder_spareprice_id, 

T2.sanction_allotment_id, 

-- T2.workint_qty, T2.workint_sch_unitcost, T2.workint_sch_status,

T3.institution_id, T3.district_name, T3.institution_name, T3.dept_name, T3.project_name, T3.scheme_name,

CONCAT(T3.district_name, " - " ,T3.institution_name, " [ " ,T3.dept_name, " ] ") AS LOCATION

FROM work_intimation AS T1

LEFT JOIN work_intimation_schedule AS T2 ON (T2.workint_id = T1.workint_id)

LEFT JOIN v_sanction_allotment AS T3 ON (T3.sanction_allotment_id = T2.sanction_allotment_id) ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
