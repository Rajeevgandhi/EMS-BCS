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

-- Dumping structure for procedure ems_test.P_INV_CALCLD
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
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
