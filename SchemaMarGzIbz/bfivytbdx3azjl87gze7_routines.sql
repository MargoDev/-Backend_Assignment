-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: bfivytbdx3azjl87gze7-mysql.services.clever-cloud.com    Database: bfivytbdx3azjl87gze7
-- ------------------------------------------------------
-- Server version	8.0.15-5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'f41d366d-91e5-11e9-8525-cecd028ee826:1-56603834';

--
-- Dumping routines for database 'bfivytbdx3azjl87gze7'
--
/*!50003 DROP PROCEDURE IF EXISTS `createAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ur8xsrz96xriblut`@`%` PROCEDURE `createAccount`(
IN nameUser varchar(50), 
IN lastName varchar(50), 
IN emailUser varchar(50), 
IN phoneUser decimal(10,0),
IN birthdayUser date,
OUT message varchar(100),
OUT estatus tinyint,
OUT idAccount int)
BEGIN
	declare idUser int;
	declare idAccount int;
    declare isNew int;
    
    call createUser(nameUser,lastName,emailUser,phoneUser, birthdayUser, message, estatus);
    
    if estatus =1 then 
		
		set isNew = 1;
        set idUser = last_insert_id();
        
        WHILE isNew >= 1 DO
			select  ROUND(rand() * 10000000000,0) into idAccount;
			select count(*) into isNew from account where idaccount = idAccount;
        END WHILE;
        
        if isNew = 0 then 
			insert into account values (idAccount, idUser,1, 1000, sysdate(), sysdate());
			set estatus = 1;
			set message = 'account created successful';
            set idAccount = last_insert_id();
        end if;        
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ur8xsrz96xriblut`@`%` PROCEDURE `createUser`(
IN nameUser varchar(50), 
IN lastName varchar(50), 
IN emailUser varchar(50), 
IN phoneUser decimal(10,0),
IN birthdayUser date,
OUT message varchar(100),
OUT estatus tinyint
)
BEGIN
  declare exist int;
  
  select count(*) into exist 
  from userAcc 
  where email = emailUser or phone = phoneUser;
  
  if exist >= 1 then 
	set estatus = -1;
    set message = 'email or phone are registered previously, use another one please';
  else
	insert into userAcc (name,last,email,phone,birthday) values(nameUser, lastName, emailUser, phoneUser, birthdayUser);
    set exist = last_insert_id();
    
    if exist >= 0 then 
      set estatus = 1;
	  set message = 'user created successful';
	else 
	  set estatus = -2;
      set message = 'an error occurred during insert';
    end if;
    
  end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getBalance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ur8xsrz96xriblut`@`%` PROCEDURE `getBalance`(
IN accId int)
BEGIN
    update account set lastMove = sysdate() where idaccount = accId;
    
    select idaccount as account, amount as balance, iduser as owner, created as createdAt
    from account where idaccount = accId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMoves` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ur8xsrz96xriblut`@`%` PROCEDURE `getMoves`(
IN idAccount int,
IN outin tinyint)
BEGIN
	truncate tt_moves;
    
    if outin = 0 then
		insert into tt_moves 
		select account_from, account_to, amount, date_move
		from account_move where account_to = idAccount;
	elseif outin =1 then
		insert into tt_moves 
		select account_from, account_to, amount, date_move
		from account_move where account_from = idAccount;
    else
		insert into tt_moves 
		select account_from, account_to, amount, date_move
		from account_move where account_from = idAccount or account_to = idAccount;
    end if;
    
    select * from tt_moves;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `transfers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`ur8xsrz96xriblut`@`%` PROCEDURE `transfers`(
IN accFrom int,
IN accTo int,
IN amountTransfer decimal
)
BEGIN
declare existFrom int;
declare existTo int;
declare balanceFrom decimal;
declare balanceTo decimal;

declare estatus tinyint;
declare messages varchar(100);

SELECT COUNT(*) INTO existFrom FROM account WHERE idaccount = accFrom;
SELECT COUNT(*) INTO existTo FROM account WHERE idaccount = accTo;

if existFrom =1 and existTo =1 then 
  select amount into balanceFrom from account where idaccount = accFrom;
  select amount into balanceTo from account where idaccount = accTo;
  
  if balanceFrom <= -500 or balanceTo <=-500 then
    set estatus = -2;
    set messages = 'one or both account have balance in -$500 or minor';
  else 
    update account set amount = (balanceFrom - amountTransfer), lastMove=sysdate() where idaccount = accFrom;
	update account set amount = (balanceTo + amountTransfer), lastMove=sysdate() where idaccount = accTo;
    insert into account_move (account_from, account_to, date_move, amount, status) 
    values(accFrom, accTo, sysdate(), amountTransfer,'S');
    
    set estatus = 1;
    set messages = 'transfer successful';
  end if;
else
  set estatus = -1;
  set messages = 'one or both account aren\'t exists';
end if;

select estatus, messages;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-27 14:56:00
