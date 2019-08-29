-- MySQL dump 10.13  Distrib 5.6.17, for Linux (x86_64)
--
-- Host: rm-bp1k9p25tjq1d86i9.mysql.rds.aliyuncs.com    Database: reinsure
-- ------------------------------------------------------
-- Server version	5.6.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_blob_triggers` (
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_calendars` (
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_cron_triggers` (
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_fired_triggers` (
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `IS_VOLATILE` varchar(1) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_STATEFUL` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_job_details` (
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_VOLATILE` varchar(1) NOT NULL,
  `IS_STATEFUL` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qrtz_job_listeners`
--

DROP TABLE IF EXISTS `qrtz_job_listeners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_job_listeners` (
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `JOB_LISTENER` varchar(200) NOT NULL,
  PRIMARY KEY (`JOB_NAME`,`JOB_GROUP`,`JOB_LISTENER`),
  KEY `JOB_NAME` (`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_job_listeners_ibfk_1` FOREIGN KEY (`JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_locks` (
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_scheduler_state` (
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simple_triggers` (
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qrtz_trigger_listeners`
--

DROP TABLE IF EXISTS `qrtz_trigger_listeners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_trigger_listeners` (
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `TRIGGER_LISTENER` varchar(200) NOT NULL,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_LISTENER`),
  KEY `TRIGGER_NAME` (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_trigger_listeners_ibfk_1` FOREIGN KEY (`TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_triggers` (
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `IS_VOLATILE` varchar(1) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `JOB_NAME` (`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `v_cont_cnm`
--

DROP TABLE IF EXISTS `v_cont_cnm`;
/*!50001 DROP VIEW IF EXISTS `v_cont_cnm`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_cont_cnm` (
  `c_cont_cde` tinyint NOT NULL,
  `c_cont_id` tinyint NOT NULL,
  `c_cont_enm` tinyint NOT NULL,
  `cont` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_app_cargo`
--

DROP TABLE IF EXISTS `web_app_cargo`;
/*!50001 DROP VIEW IF EXISTS `web_app_cargo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_app_cargo` (
  `C_APP_NO` tinyint NOT NULL,
  `C_CRGO_CDE` tinyint NOT NULL,
  `C_ENG_NME` tinyint NOT NULL,
  `C_TRANS_TOOL` tinyint NOT NULL,
  `C_INVC_NO` tinyint NOT NULL,
  `C_PICK_NO` tinyint NOT NULL,
  `C_CARRIAGE_CDE` tinyint NOT NULL,
  `C_SAIL_NO` tinyint NOT NULL,
  `C_FROM_PRT` tinyint NOT NULL,
  `C_TO_PRT` tinyint NOT NULL,
  `C_PASS_PRT` tinyint NOT NULL,
  `C_CERT_MRK` tinyint NOT NULL,
  `C_CERT_NO` tinyint NOT NULL,
  `C_PRN_FRM` tinyint NOT NULL,
  `C_SHIP_NME` tinyint NOT NULL,
  `C_VSL_LVL_CDE` tinyint NOT NULL,
  `C_SHIP_NAT` tinyint NOT NULL,
  `C_SHIP_AGE` tinyint NOT NULL,
  `C_WATER_LINE` tinyint NOT NULL,
  `C_TRA_MRK` tinyint NOT NULL,
  `C_TRA_INFO` tinyint NOT NULL,
  `C_CHECKER_CDE` tinyint NOT NULL,
  `C_CHECK_ADDR` tinyint NOT NULL,
  `C_FRM_PRT_ARA` tinyint NOT NULL,
  `C_TO_PRT_ARA` tinyint NOT NULL,
  `C_TRAN_TOOL` tinyint NOT NULL,
  `C_NO_TEXT` tinyint NOT NULL,
  `C_PRN_FORM` tinyint NOT NULL,
  `T_ARRIVE_DATE` tinyint NOT NULL,
  `C_SRVY_NME` tinyint NOT NULL,
  `C_PAY_ADDR` tinyint NOT NULL,
  `N_INV_AMT` tinyint NOT NULL,
  `C_INV_CUR` tinyint NOT NULL,
  `N_ADD_QUOT` tinyint NOT NULL,
  `N_EXC_RATE` tinyint NOT NULL,
  `N_RATE` tinyint NOT NULL,
  `N_AMT` tinyint NOT NULL,
  `C_AMT_CUR` tinyint NOT NULL,
  `N_PRM` tinyint NOT NULL,
  `C_PRM_CUR` tinyint NOT NULL,
  `C_RESV_TXT_1` tinyint NOT NULL,
  `C_RESV_TXT_2` tinyint NOT NULL,
  `C_RESV_TXT_3` tinyint NOT NULL,
  `C_RESV_TXT_4` tinyint NOT NULL,
  `C_RESV_TXT_5` tinyint NOT NULL,
  `C_RESV_TXT_6` tinyint NOT NULL,
  `C_RESV_TXT_7` tinyint NOT NULL,
  `C_RESV_TXT_8` tinyint NOT NULL,
  `C_RESV_TXT_9` tinyint NOT NULL,
  `C_RESV_TXT_10` tinyint NOT NULL,
  `C_RESV_TXT_11` tinyint NOT NULL,
  `C_RESV_TXT_12` tinyint NOT NULL,
  `C_RESV_TXT_13` tinyint NOT NULL,
  `C_RESV_TXT_14` tinyint NOT NULL,
  `C_RESV_TXT_15` tinyint NOT NULL,
  `C_RESV_TXT_16` tinyint NOT NULL,
  `C_RESV_TXT_17` tinyint NOT NULL,
  `C_RESV_TXT_18` tinyint NOT NULL,
  `C_RESV_TXT_19` tinyint NOT NULL,
  `C_RESV_TXT_20` tinyint NOT NULL,
  `N_RESV_NUM_1` tinyint NOT NULL,
  `N_RESV_NUM_2` tinyint NOT NULL,
  `N_RESV_NUM_3` tinyint NOT NULL,
  `N_RESV_NUM_4` tinyint NOT NULL,
  `N_RESV_NUM_5` tinyint NOT NULL,
  `N_RESV_NUM_6` tinyint NOT NULL,
  `N_RESV_NUM_7` tinyint NOT NULL,
  `N_RESV_NUM_8` tinyint NOT NULL,
  `N_RESV_NUM_9` tinyint NOT NULL,
  `N_RESV_NUM_10` tinyint NOT NULL,
  `N_RESV_NUM_11` tinyint NOT NULL,
  `N_RESV_NUM_12` tinyint NOT NULL,
  `N_RESV_NUM_13` tinyint NOT NULL,
  `N_RESV_NUM_14` tinyint NOT NULL,
  `N_RESV_NUM_15` tinyint NOT NULL,
  `N_RESV_NUM_16` tinyint NOT NULL,
  `N_RESV_NUM_17` tinyint NOT NULL,
  `N_RESV_NUM_18` tinyint NOT NULL,
  `N_RESV_NUM_19` tinyint NOT NULL,
  `N_RESV_NUM_20` tinyint NOT NULL,
  `T_RESV_TM_2` tinyint NOT NULL,
  `T_RESV_TM_3` tinyint NOT NULL,
  `T_RESV_TM_4` tinyint NOT NULL,
  `T_RESV_TM_5` tinyint NOT NULL,
  `T_RESV_TM_6` tinyint NOT NULL,
  `T_RESV_TM_7` tinyint NOT NULL,
  `T_RESV_TM_8` tinyint NOT NULL,
  `T_RESV_TM_9` tinyint NOT NULL,
  `T_RESV_TM_10` tinyint NOT NULL,
  `T_RESV_TM_1` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `C_LTXT_FLD_1` tinyint NOT NULL,
  `C_RESV_TXT_21` tinyint NOT NULL,
  `C_RESV_TXT_22` tinyint NOT NULL,
  `C_RESV_TXT_23` tinyint NOT NULL,
  `C_RESV_TXT_24` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL,
  `C_RESV_TXT_25` tinyint NOT NULL,
  `C_RESV_TXT_26` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_app_cargo_list`
--

DROP TABLE IF EXISTS `web_app_cargo_list`;
/*!50001 DROP VIEW IF EXISTS `web_app_cargo_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_app_cargo_list` (
  `C_PK_ID` tinyint NOT NULL,
  `C_APP_NO` tinyint NOT NULL,
  `C_ROW_ID` tinyint NOT NULL,
  `N_SEQ_NO` tinyint NOT NULL,
  `C_MARKS_NO` tinyint NOT NULL,
  `C_DESC_GOD` tinyint NOT NULL,
  `C_QTY` tinyint NOT NULL,
  `C_PACK` tinyint NOT NULL,
  `C_WEIT` tinyint NOT NULL,
  `C_RESV_TXT_1` tinyint NOT NULL,
  `C_RESV_TXT_2` tinyint NOT NULL,
  `C_RESV_TXT_3` tinyint NOT NULL,
  `C_RESV_TXT_4` tinyint NOT NULL,
  `N_RESV_NUM_1` tinyint NOT NULL,
  `N_RESV_NUM_2` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `C_RESV_TXT_5` tinyint NOT NULL,
  `C_RESV_TXT_6` tinyint NOT NULL,
  `T_STARTGO_TM` tinyint NOT NULL,
  `T_RESV_TM1` tinyint NOT NULL,
  `C_TRA_INFO` tinyint NOT NULL,
  `C_PACKAGE_FIRST_TYP` tinyint NOT NULL,
  `C_PACKAGE_SECOND_TYP` tinyint NOT NULL,
  `C_GOODS_FIRST_TYP` tinyint NOT NULL,
  `C_GOODS_SECOND_TYP` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL,
  `C_RESV_TXT_7` tinyint NOT NULL,
  `C_RESV_TXT_8` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_app_ent_tgt_obj`
--

DROP TABLE IF EXISTS `web_app_ent_tgt_obj`;
/*!50001 DROP VIEW IF EXISTS `web_app_ent_tgt_obj`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_app_ent_tgt_obj` (
  `C_PK_ID` tinyint NOT NULL,
  `C_APP_NO` tinyint NOT NULL,
  `C_ROW_ID` tinyint NOT NULL,
  `N_SEQ_NO` tinyint NOT NULL,
  `C_PRJ_TYP` tinyint NOT NULL,
  `C_PRJ_NME` tinyint NOT NULL,
  `C_TGT_QTY` tinyint NOT NULL,
  `C_AMT_DETERMINE_METHOD_CDE` tinyint NOT NULL,
  `C_CUR_TYP` tinyint NOT NULL,
  `N_AMT` tinyint NOT NULL,
  `N_RATE` tinyint NOT NULL,
  `N_PRM` tinyint NOT NULL,
  `N_TGT_NO` tinyint NOT NULL,
  `C_DDUCT_DESC` tinyint NOT NULL,
  `C_CANCEL_MARK` tinyint NOT NULL,
  `C_TGT_OBJ_TXT_FLD_1` tinyint NOT NULL,
  `T_TGT_OBJ_TM_FLD_1` tinyint NOT NULL,
  `N_TGT_OBJ_NUM_FLD_1` tinyint NOT NULL,
  `L_TGT_OBJ_LTXT_FLD_1` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `C_TGT_OBJ_TXT_FLD_2` tinyint NOT NULL,
  `C_TGT_OBJ_TXT_FLD_3` tinyint NOT NULL,
  `C_TGT_OBJ_TXT_FLD_4` tinyint NOT NULL,
  `C_TGT_OBJ_TXT_FLD_5` tinyint NOT NULL,
  `N_TGT_OBJ_NUM_FLD_2` tinyint NOT NULL,
  `N_TGT_OBJ_NUM_FLD_3` tinyint NOT NULL,
  `N_TGT_OBJ_NUM_FLD_4` tinyint NOT NULL,
  `N_TGT_OBJ_NUM_FLD_5` tinyint NOT NULL,
  `T_TGT_OBJ_TM_FLG_2` tinyint NOT NULL,
  `N_DDUCT_RATE` tinyint NOT NULL,
  `N_DDUCT_AMT` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_app_prj_rel`
--

DROP TABLE IF EXISTS `web_app_prj_rel`;
/*!50001 DROP VIEW IF EXISTS `web_app_prj_rel`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_app_prj_rel` (
  `C_PK_ID` tinyint NOT NULL,
  `C_APP_NO` tinyint NOT NULL,
  `C_ROW_ID` tinyint NOT NULL,
  `N_SEQ_NO` tinyint NOT NULL,
  `C_PRJ_REL` tinyint NOT NULL,
  `C_NAME` tinyint NOT NULL,
  `C_ORG_CDE` tinyint NOT NULL,
  `C_ADDR` tinyint NOT NULL,
  `C_ZIP` tinyint NOT NULL,
  `C_INSRANT_FLG` tinyint NOT NULL,
  `C_RESV_TXT_1` tinyint NOT NULL,
  `C_RESV_TXT_2` tinyint NOT NULL,
  `C_RESV_TXT_3` tinyint NOT NULL,
  `N_RESV_NUM_1` tinyint NOT NULL,
  `N_RESV_NUM_2` tinyint NOT NULL,
  `N_RESV_NUM_3` tinyint NOT NULL,
  `C_CANCEL_MARK` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_app_sub`
--

DROP TABLE IF EXISTS `web_app_sub`;
/*!50001 DROP VIEW IF EXISTS `web_app_sub`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_app_sub` (
  `C_APP_NO` tinyint NOT NULL,
  `N_GOV_SUB_AMT` tinyint NOT NULL,
  `N_GOV_SUB_VAR` tinyint NOT NULL,
  `N_GOV_SUB_PROP` tinyint NOT NULL,
  `N_SELF_PAY_AMT` tinyint NOT NULL,
  `N_SELF_PAY_VAR` tinyint NOT NULL,
  `N_SELF_PAY_PROP` tinyint NOT NULL,
  `C_RESV_TXT_1` tinyint NOT NULL,
  `C_RESV_TXT_2` tinyint NOT NULL,
  `C_RESV_TXT_3` tinyint NOT NULL,
  `C_RESV_TXT_4` tinyint NOT NULL,
  `C_RESV_TXT_5` tinyint NOT NULL,
  `C_RESV_TXT_6` tinyint NOT NULL,
  `C_RESV_TXT_7` tinyint NOT NULL,
  `C_RESV_TXT_8` tinyint NOT NULL,
  `C_RESV_TXT_9` tinyint NOT NULL,
  `C_RESV_TXT_10` tinyint NOT NULL,
  `N_RESV_NUM_1` tinyint NOT NULL,
  `N_RESV_NUM_2` tinyint NOT NULL,
  `N_RESV_NUM_3` tinyint NOT NULL,
  `N_RESV_NUM_4` tinyint NOT NULL,
  `N_RESV_NUM_5` tinyint NOT NULL,
  `N_RESV_NUM_6` tinyint NOT NULL,
  `N_RESV_NUM_7` tinyint NOT NULL,
  `N_RESV_NUM_8` tinyint NOT NULL,
  `N_RESV_NUM_9` tinyint NOT NULL,
  `N_RESV_NUM_10` tinyint NOT NULL,
  `T_RESV_TM_1` tinyint NOT NULL,
  `T_RESV_TM_2` tinyint NOT NULL,
  `T_RESV_TM_3` tinyint NOT NULL,
  `T_RESV_TM_4` tinyint NOT NULL,
  `T_RESV_TM_5` tinyint NOT NULL,
  `T_RESV_TM_6` tinyint NOT NULL,
  `T_RESV_TM_7` tinyint NOT NULL,
  `T_RESV_TM_8` tinyint NOT NULL,
  `T_RESV_TM_9` tinyint NOT NULL,
  `T_RESV_TM_10` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `web_bas_accident_rsn`
--

DROP TABLE IF EXISTS `web_bas_accident_rsn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bas_accident_rsn` (
  `C_ACCDNT_RSN_PK_ID` varchar(50) NOT NULL DEFAULT '',
  `C_KIND_NO` varchar(2) DEFAULT NULL,
  `C_PROD_NO` varchar(6) DEFAULT NULL,
  `C_ACCDNT_RSN_TYP` varchar(30) DEFAULT NULL,
  `C_ACCDNT_RSN_CDE` varchar(30) DEFAULT NULL,
  `C_ACCDNT_RSN_CNM` varchar(100) DEFAULT NULL,
  `C_IS_VALID` varchar(1) DEFAULT NULL,
  `T_ADB_TM` datetime DEFAULT NULL,
  `C_CRT_CDE` varchar(30) DEFAULT NULL,
  `T_CRT_TM` datetime DEFAULT NULL,
  `C_UPD_CDE` varchar(30) DEFAULT NULL,
  `T_UPD_TM` datetime DEFAULT NULL,
  `C_TRANS_MRK` varchar(1) DEFAULT NULL,
  `T_TRANS_TM` datetime DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`C_ACCDNT_RSN_PK_ID`),
  UNIQUE KEY `PK_ACCIDENT_RSN` (`C_ACCDNT_RSN_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_bas_area`
--

DROP TABLE IF EXISTS `web_bas_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bas_area` (
  `C_AREA_CDE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_AREA_CNM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_AREA_ENM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_PAR_CDE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_ZIP_CDE` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  0 国家,1 省,2 市,3 县/区,4 镇/村',
  `C_AB_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_DISRANGE_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_UPPER_PATH` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_TRANS_TM` datetime DEFAULT NULL,
  `DZ_PAR_CDE` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_BAS_AREA` (`C_AREA_CDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_bas_codelist`
--

DROP TABLE IF EXISTS `web_bas_codelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bas_codelist` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PAR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PAR_CNM` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CNM` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_MAP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_MAP_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RESV_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RESV_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RESV_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_REMARK` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_ADB_TM` datetime DEFAULT NULL,
  `C_ENM` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_TRANS_TM` datetime DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `IDX_UNI_BAS_CODELIST` (`C_PAR_CDE`,`C_CDE`,`C_MAP_CDE`),
  UNIQUE KEY `PK_BAS_CODELIST` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_bas_codetb`
--

DROP TABLE IF EXISTS `web_bas_codetb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bas_codetb` (
  `CODE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `KIND` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PARE_CODE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FLAG` bigint(22) DEFAULT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_TRANS_TM` datetime DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_bas_comm_code`
--

DROP TABLE IF EXISTS `web_bas_comm_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bas_comm_code` (
  `C_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PAR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '  根节点为 -1',
  `C_CNM` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_OUT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  存保标委代码',
  `C_DISP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  界面显示代码,缺省与标委代码相同',
  `C_ENM` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_REMARK` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `N_VALUE` decimal(20,6) DEFAULT NULL,
  `N_MAX_VALUE` decimal(20,6) DEFAULT NULL COMMENT '  对于数值区间，存区间的上限值',
  `C_REL_CDE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  用以存储代码的关系信息，以代码加;组成',
  `N_LEVEL` decimal(6,0) DEFAULT NULL,
  `T_ADB_TM` datetime DEFAULT NULL,
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_TRANS_TM` datetime DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`C_CDE`,`C_PAR_CDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_bas_dic_dt`
--

DROP TABLE IF EXISTS `web_bas_dic_dt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bas_dic_dt` (
  `C_DI_CDE` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PATER_CDE` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  父代码',
  `C_DICT_TYPE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  字典类型',
  `C_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  名称',
  `C_DESCRIBE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  描述',
  `C_STATE` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  状态',
  `N_ORDERBY` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  值',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_TRANS_TM` datetime DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_BAS_DIC_DT` (`C_DI_CDE`),
  KEY `IDX_WEB_BAS_DIC_DT_C_DICT_TYPE` (`C_DICT_TYPE`),
  KEY `IDX_WEB_BAS_DIC_DT_N_ORDERBY` (`N_ORDERBY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CLM_C_DICD_DATAS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_bas_edr_rsn`
--

DROP TABLE IF EXISTS `web_bas_edr_rsn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bas_edr_rsn` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'PKID',
  `C_RSN_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_KIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_RSN_NME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_RSN_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_RSN_TXT` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '批文内容',
  `C_CALC_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1' COMMENT '计算保费标志, 0 ：不需计算  1 :需计算',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间',
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `C_PAR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '父级代码',
  `C_FLAG` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '标识（0:除开快捷批改和保险合同解除 1:快捷批改,2:保险合同解除）',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_BAS_EDR_RSN` (`C_RSN_CDE`,`C_KIND_NO`,`C_RSN_TYP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='批改原因设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_bas_edr_rsn_item`
--

DROP TABLE IF EXISTS `web_bas_edr_rsn_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bas_edr_rsn_item` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_RSN_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_EDR_ITEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_TAB_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_FLD_ID` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_OPER_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鎿嶄綔绫诲瀷',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_TRANS_TM` datetime DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_BAS_EDR_RSN_ITEM` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `web_bas_fin_banknet`
--

DROP TABLE IF EXISTS `web_bas_fin_banknet`;
/*!50001 DROP VIEW IF EXISTS `web_bas_fin_banknet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_bas_fin_banknet` (
  `C_BANKCODE` tinyint NOT NULL,
  `C_BANKNAME` tinyint NOT NULL,
  `C_BANKKIND` tinyint NOT NULL,
  `C_BANKZONE` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `T_ADB_TM` tinyint NOT NULL,
  `C_IS_VALID` tinyint NOT NULL,
  `C_BANK_PROVINCE` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `web_bas_fin_cha`
--

DROP TABLE IF EXISTS `web_bas_fin_cha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bas_fin_cha` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CHA_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_FINCHA_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_FINCHA_CNM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '璐㈠姟娓犻亾鍚嶇О',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_BAS_FIN_CHA` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='娓犻亾璁剧疆琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `web_bas_fin_chg_rate`
--

DROP TABLE IF EXISTS `web_bas_fin_chg_rate`;
/*!50001 DROP VIEW IF EXISTS `web_bas_fin_chg_rate`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_bas_fin_chg_rate` (
  `C_CHGRATE_PK_ID` tinyint NOT NULL,
  `C_CUR_CDE1` tinyint NOT NULL,
  `C_CUR_CDE2` tinyint NOT NULL,
  `N_CHG_RTE` tinyint NOT NULL,
  `T_EFFC_TM` tinyint NOT NULL,
  `T_EXPD_TM` tinyint NOT NULL,
  `T_ADB_TM` tinyint NOT NULL,
  `C_IS_VALID` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `web_bas_fin_cur`
--

DROP TABLE IF EXISTS `web_bas_fin_cur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bas_fin_cur` (
  `C_CUR_CDE` varchar(30) NOT NULL,
  `C_CUR_CNM` varchar(50) DEFAULT NULL COMMENT '币种名称',
  `C_CUR_ENM` varchar(50) DEFAULT NULL COMMENT '币种英文名',
  `C_CUR_UNT` varchar(30) DEFAULT NULL COMMENT '单位',
  `C_CUR_SBL` varchar(30) DEFAULT NULL COMMENT '货币符号',
  `C_CUR_TTH_UNT` varchar(30) DEFAULT NULL COMMENT 'TTH单位',
  `C_CUR_HTH_UNT` varchar(30) DEFAULT NULL COMMENT 'HTH单位',
  `C_REMARK` text COMMENT '备注',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间',
  `C_IS_VALID` varchar(1) DEFAULT '1' COMMENT '是否有效',
  `C_CRT_CDE` varchar(30) DEFAULT 'user' COMMENT '创建人员',
  `T_CRT_TM` datetime DEFAULT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) DEFAULT 'user' COMMENT '修改人员',
  `T_UPD_TM` datetime DEFAULT NULL COMMENT '修改时间',
  `C_FIN_MRK` varchar(1) DEFAULT '0' COMMENT '财务标识',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标识',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `SYS_C00643342` (`C_CUR_CDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_bas_fin_fee_typ`
--

DROP TABLE IF EXISTS `web_bas_fin_fee_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bas_fin_fee_typ` (
  `C_FEETYP_CDE` varchar(30) NOT NULL,
  `C_FEETYP_CNM` varchar(50) NOT NULL,
  `C_FEETYP_ENM` varchar(50) DEFAULT NULL COMMENT '费用类型英文名称',
  `C_TYP_MRK` varchar(1) NOT NULL,
  `C_DESC` varchar(200) DEFAULT NULL COMMENT '费用描述',
  `C_DC_DIR` varchar(1) DEFAULT NULL COMMENT '收付方向(DEBIT(收)，CREDIT(付))',
  `C_IS_VALID` varchar(1) NOT NULL DEFAULT '1',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间',
  `C_CRT_CDE` varchar(30) NOT NULL DEFAULT 'admin',
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) NOT NULL DEFAULT 'admin',
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标识',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_FIN_FEETYPE` (`C_FEETYP_CDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_bas_version_info`
--

DROP TABLE IF EXISTS `web_bas_version_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_bas_version_info` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_VERSION_NUM` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_STR_TM` datetime DEFAULT NULL,
  `T_END_TM` datetime DEFAULT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_CRT_TM` datetime DEFAULT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_UPD_TM` datetime DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_VERSION_ID` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_clm_ls_medical_main`
--

DROP TABLE IF EXISTS `web_clm_ls_medical_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_clm_ls_medical_main` (
  `C_ID` varchar(100) DEFAULT NULL,
  `C_INJU_PK_ID` varchar(100) DEFAULT NULL,
  `C_CVRG_AMT` decimal(11,0) DEFAULT NULL,
  `c_cvrg_no` varchar(30) DEFAULT NULL,
  `c_cvrg_nme` varchar(1000) DEFAULT NULL,
  `C_CLM_NO` varchar(50) DEFAULT NULL,
  `N_CLM_TMS` decimal(11,0) DEFAULT NULL,
  `C_CRT_CDE` varchar(100) DEFAULT NULL,
  `C_CRT_TM` datetime DEFAULT NULL,
  `T_UP_TM` datetime DEFAULT NULL,
  `T_UP_CDE` varchar(100) DEFAULT NULL,
  `C_PALY_AMT` decimal(11,0) DEFAULT NULL,
  `C_ADJUST_PK_ID` varchar(100) DEFAULT NULL,
  `C_INSURED_CDE` varchar(100) DEFAULT NULL,
  `C_PLY_NO` varchar(100) DEFAULT NULL,
  `C_LAIMED_AMT` decimal(11,0) DEFAULT NULL,
  `C_PALY_AMT_RMB` decimal(11,0) DEFAULT NULL,
  `C_AMT_CUR` varchar(30) DEFAULT NULL,
  `C_FORMULA` varchar(30) DEFAULT NULL,
  `N_EXEM_PERIOD` decimal(10,0) DEFAULT NULL,
  `C_RESEV_FLD1` varchar(300) DEFAULT NULL,
  `N_DDUCT_AMT` decimal(10,0) DEFAULT NULL,
  `N_DDUCT_RATE` decimal(10,0) DEFAULT NULL,
  `N_DAY_ALLOWANCE` decimal(10,0) DEFAULT NULL,
  `N_PER_INDEM_LMT` decimal(10,0) DEFAULT NULL,
  `N_PER_MEDICAL_LMT` decimal(10,0) DEFAULT NULL,
  `C_MEBER_ID` varchar(100) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `C_ID` (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_clm_riskunit_amtappo`
--

DROP TABLE IF EXISTS `web_clm_riskunit_amtappo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_clm_riskunit_amtappo` (
  `C_RISKUNIT_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '风险单位赔款分摊信息ID',
  `C_CHKCLM_PK_ID` varchar(50) DEFAULT NULL COMMENT '核赔信息ID',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `C_RISK_UNIT_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '风险单位名称',
  `N_THIS_APPOAMT` decimal(20,2) DEFAULT NULL COMMENT '本次分摊赔款',
  `N_OLD_APPOAMT` decimal(20,2) DEFAULT NULL COMMENT '已分摊赔款',
  `N_AMT` decimal(20,2) DEFAULT NULL COMMENT '保额',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `N_SEQ_NO` decimal(6,0) NOT NULL COMMENT '序号',
  `C_CLM_CUR` varchar(30) DEFAULT NULL COMMENT '赔款币种',
  `C_RICLM_CUR` varchar(30) DEFAULT NULL COMMENT '再保赔款币种',
  `N_RI_CLM` decimal(20,2) DEFAULT NULL COMMENT '折再保币种赔款',
  `N_RICUR_CHG_RATE` decimal(10,6) DEFAULT NULL COMMENT '折再保币种汇率',
  `C_CLM_TYP` varchar(1) DEFAULT NULL COMMENT '赔案类型',
  `N_CLM_TMS` decimal(6,0) DEFAULT NULL COMMENT '赔付次数',
  `C_AMT_CUR` varchar(30) DEFAULT NULL COMMENT '支付币种',
  `C_RISK_LVL_CDE` varchar(30) DEFAULT NULL COMMENT '风险等级',
  `N_EDR_PRJ_NO` decimal(6,0) DEFAULT NULL COMMENT '批改次数',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `T_ACCDNT_TM` datetime DEFAULT NULL COMMENT '出险时间',
  `C_ACCDNT_CAUS_NME` varchar(500) DEFAULT NULL COMMENT '出险原因',
  `C_PLACE_LOSS` varchar(500) DEFAULT NULL COMMENT '出险地点',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_CLM_RISKUNIT_AMTAPPO` (`C_RISKUNIT_PK_ID`),
  KEY `IYA_CLM_RISKUNIT_AMTAPPO` (`C_CLM_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='风险单位赔款分摊信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_cus_com_acct`
--

DROP TABLE IF EXISTS `web_cus_com_acct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_cus_com_acct` (
  `C_ACC_CDE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_REL_SRC` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_REL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CUR_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_BANK_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_BANK` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ACCNT_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_ACCNT_NO` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_PAYEE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_BANK_ADDR` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_ADB_TM` datetime DEFAULT NULL,
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_TRANS_TM` datetime DEFAULT NULL,
  `C_PROVINCES` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  省份',
  `C_CITY` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  城市',
  `C_ACCNT_TYPE` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '账户类型 1 手续费支付专用账户（保险公司提供）2 手续费收取专用账户（代理方提供）3保费结算账户（保险公司提供）4 保费代收账户（代理人提供） 5 业务员绩效4跟的银行账户',
  `C_IS_SYSNCH` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否同步 0-否, 1-是',
  `C_SYS_STAT` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '同步结果状态 0-同步失败, 1-同步成功',
  `C_ERROR_INFO` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '同步信息 主要记录错误信息',
  `T_SYSNCH_TIME` datetime DEFAULT NULL COMMENT '同步时间',
  `C_ACTION_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '操作类型0-add,1-update,2-del',
  `C_DEL` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '逻辑删除标志 0-无效 1-有效',
  `C_PUB_PRI` varchar(2) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_CUS_COM_ACCT` (`C_ACC_CDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_edr_grp_member`
--

DROP TABLE IF EXISTS `web_edr_grp_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_edr_grp_member` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  成员记录唯一ID,成员记录唯一ID,从投保单带过来的是投保单的PKID，对于批改新增的记录是上一张批单的PKID，需注意投保单的PKID与批单的PKID不能重复',
  `C_EDR_APP_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  批改申请单号',
  `C_PREV_EDR_APP_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  上次批改申请单号,批改申请单号',
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  批单号',
  `C_PLY_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL,
  `C_PLY_APP_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  投保单号',
  `N_SEQ_NO` decimal(8,0) NOT NULL,
  `C_CLNT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  客户码,唯一客户号',
  `C_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  姓名',
  `C_CERT_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  证件类型',
  `C_CERT_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  证件号码',
  `C_OCCUP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  职业代码',
  `C_BNFC_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  受益人',
  `C_BNFC_CERT_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  受益人证件类型,证件类型',
  `C_BNFC_CERT_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  受益人证件号码,证件号码',
  `C_UDR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  核保标志',
  `C_OP_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  操作标志,记录新增A、删除D、修改U标识',
  `T_UDR_TM` datetime DEFAULT NULL COMMENT '  批单核保时间',
  `T_BGN_TM` datetime DEFAULT NULL COMMENT '  批改生效起期',
  `T_END_TM` datetime DEFAULT NULL COMMENT '  批改生效止期',
  `T_NEXT_EDR_UDR_TM` datetime DEFAULT NULL COMMENT '  下次批改核保时间',
  `C_COUNTRY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  国籍',
  `C_OCCUP_SUB_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  职业细分',
  `C_WORK_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  工种',
  `C_WORK_LVL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  级别',
  `C_RESEV_FLD1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  文本预留1',
  `C_RESEV_FLD2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  文本预留2',
  `C_RESEV_FLD3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  文本预留3',
  `C_RESEV_FLD4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  文本预留4',
  `C_RESEV_FLD5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  文本预留5',
  `N_RESEV_FLD1` decimal(20,6) DEFAULT NULL COMMENT '  数字预留1',
  `N_RESEV_FLD2` decimal(20,6) DEFAULT NULL COMMENT '  数字预留2',
  `N_RESEV_FLD3` decimal(20,6) DEFAULT NULL COMMENT '  数字预留3',
  `N_RESEV_FLD4` decimal(20,6) DEFAULT NULL COMMENT '  数字预留4',
  `N_RESEV_FLD5` decimal(20,6) DEFAULT NULL COMMENT '  数字预留5',
  `N_RESEV_FLD6` decimal(20,6) DEFAULT NULL COMMENT '  数字预留6',
  `N_RESEV_FLD7` decimal(20,6) DEFAULT NULL COMMENT '  数字预留7',
  `N_RESEV_FLD8` decimal(20,6) DEFAULT NULL COMMENT '  数字预留8',
  `N_RESEV_FLD9` decimal(20,6) DEFAULT NULL COMMENT '  数字预留9',
  `N_RESEV_FLD10` decimal(20,6) DEFAULT NULL COMMENT '  数字预留10',
  `N_RESEV_FLD11` decimal(20,6) DEFAULT NULL COMMENT '  数字预留11',
  `N_RESEV_FLD12` decimal(20,6) DEFAULT NULL COMMENT '  数字预留12',
  `N_RESEV_FLD13` decimal(20,6) DEFAULT NULL COMMENT '  数字预留13',
  `N_RESEV_FLD14` decimal(20,6) DEFAULT NULL COMMENT '  数字预留14',
  `N_RESEV_FLD15` decimal(20,6) DEFAULT NULL COMMENT '  数字预留15',
  `N_RESEV_FLD16` decimal(20,6) DEFAULT NULL COMMENT '  数字预留16',
  `N_RESEV_FLD17` decimal(20,6) DEFAULT NULL COMMENT '  数字预留17',
  `N_RESEV_FLD18` decimal(20,6) DEFAULT NULL COMMENT '  数字预留18',
  `N_RESEV_FLD19` decimal(20,6) DEFAULT NULL COMMENT '  数字预留19',
  `N_RESEV_FLD20` decimal(20,6) DEFAULT NULL COMMENT '  数字预留20',
  `T_RESEV_FLD1` datetime DEFAULT NULL COMMENT '  日期预留1',
  `T_RESEV_FLD2` datetime DEFAULT NULL COMMENT '  日期预留2',
  `T_RESEV_FLD3` datetime DEFAULT NULL COMMENT '  日期预留3',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_APP_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_RESEV_FLD6` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RESEV_FLD7` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RESEV_FLD8` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RESEV_FLD9` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RESEV_FLD10` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_SUB_GRP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '子团单号',
  `C_BENF_DISTRIB` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '受益分配方式',
  `C_BENF_ORD` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '顺序号',
  `N_BEND_PROP` decimal(20,6) DEFAULT NULL COMMENT '比例值',
  `C_PLAN_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '方案号',
  `N_PRM` decimal(20,6) DEFAULT NULL COMMENT '合计保费',
  `C_GRP_TYPE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '分单类别',
  `C_RESEV_FLD11` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段11',
  `C_APP_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保人名称',
  `C_APP_CER_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保人证件类别',
  `C_APP_CERT_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保人证件号码',
  `C_RESEV_FLD12` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段12',
  `C_RESEV_FLD13` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段13',
  `C_MEDICAL_SIGN` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '医保标志',
  `C_MEDICAL_NO` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '医保卡编号',
  `C_PLY_PLAN_NO` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保险计划代码',
  `C_MEDICAL_LIAB` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否享有公共补充住院医疗保险责任',
  `C_RESEV_FLD14` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '与主被保险人关系',
  `C_BENF_DISTRIB2` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '受益分配方式类型',
  `C_NME_EN` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '英文名',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_EDR_GRP_MEMBER` (`C_PK_ID`),
  KEY `IDX_EDRGRPM_CAPPNO` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `web_grt_menu`
--

DROP TABLE IF EXISTS `web_grt_menu`;
/*!50001 DROP VIEW IF EXISTS `web_grt_menu`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_grt_menu` (
  `C_OPER_ID` tinyint NOT NULL,
  `C_DPT_CDE` tinyint NOT NULL,
  `C_OP_CDE` tinyint NOT NULL,
  `C_PARENT_CDE` tinyint NOT NULL,
  `C_OP_CNM` tinyint NOT NULL,
  `C_OP_ACT` tinyint NOT NULL,
  `N_OP_ORDER` tinyint NOT NULL,
  `C_OP_IMG` tinyint NOT NULL,
  `C_TARGET` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_grt_op`
--

DROP TABLE IF EXISTS `web_grt_op`;
/*!50001 DROP VIEW IF EXISTS `web_grt_op`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_grt_op` (
  `C_OP_CDE` tinyint NOT NULL,
  `C_PARENT_CDE` tinyint NOT NULL,
  `C_OP_CNM` tinyint NOT NULL,
  `C_OP_ACT` tinyint NOT NULL,
  `C_OP_MEMO` tinyint NOT NULL,
  `N_OP_ORDER` tinyint NOT NULL,
  `C_OP_IMG` tinyint NOT NULL,
  `C_TARGET` tinyint NOT NULL,
  `C_OP_TYPE` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_SUB_SYS_CDE` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_grt_role`
--

DROP TABLE IF EXISTS `web_grt_role`;
/*!50001 DROP VIEW IF EXISTS `web_grt_role`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_grt_role` (
  `C_OPGRP_CDE` tinyint NOT NULL,
  `C_OPGRP_CNM` tinyint NOT NULL,
  `C_OPGRP_MEMO` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `C_SUPER_ROLE` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_grt_role_op`
--

DROP TABLE IF EXISTS `web_grt_role_op`;
/*!50001 DROP VIEW IF EXISTS `web_grt_role_op`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_grt_role_op` (
  `C_PK_ID` tinyint NOT NULL,
  `C_OPGRP_CDE` tinyint NOT NULL,
  `C_OP_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_grt_subsys_prod_map`
--

DROP TABLE IF EXISTS `web_grt_subsys_prod_map`;
/*!50001 DROP VIEW IF EXISTS `web_grt_subsys_prod_map`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_grt_subsys_prod_map` (
  `C_PK_ID` tinyint NOT NULL,
  `C_PROD_NO` tinyint NOT NULL,
  `C_SUBSYS_CDE` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_grt_usr_dpt`
--

DROP TABLE IF EXISTS `web_grt_usr_dpt`;
/*!50001 DROP VIEW IF EXISTS `web_grt_usr_dpt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_grt_usr_dpt` (
  `C_PK_ID` tinyint NOT NULL,
  `C_OPER_ID` tinyint NOT NULL,
  `C_DPT_CDE` tinyint NOT NULL,
  `C_DAT_DPT_CDE` tinyint NOT NULL,
  `C_SUB_DPT` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_grt_usr_dpt_diff`
--

DROP TABLE IF EXISTS `web_grt_usr_dpt_diff`;
/*!50001 DROP VIEW IF EXISTS `web_grt_usr_dpt_diff`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_grt_usr_dpt_diff` (
  `C_PK_ID` tinyint NOT NULL,
  `C_OPER_ID` tinyint NOT NULL,
  `C_DPT_CDE` tinyint NOT NULL,
  `C_OP_CDE` tinyint NOT NULL,
  `C_DAT_DPT_CDE` tinyint NOT NULL,
  `C_SUB_DPT` tinyint NOT NULL,
  `C_ENABLED` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_grt_usr_op`
--

DROP TABLE IF EXISTS `web_grt_usr_op`;
/*!50001 DROP VIEW IF EXISTS `web_grt_usr_op`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_grt_usr_op` (
  `C_PK_ID` tinyint NOT NULL,
  `C_OPER_ID` tinyint NOT NULL,
  `C_DPT_CDE` tinyint NOT NULL,
  `C_OPGRP_CDE` tinyint NOT NULL,
  `C_OP_CDE` tinyint NOT NULL,
  `C_ENABLED` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_grt_usr_op_dpt`
--

DROP TABLE IF EXISTS `web_grt_usr_op_dpt`;
/*!50001 DROP VIEW IF EXISTS `web_grt_usr_op_dpt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_grt_usr_op_dpt` (
  `C_PK_ID` tinyint NOT NULL,
  `C_OPER_ID` tinyint NOT NULL,
  `C_DPT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_grt_usr_prod`
--

DROP TABLE IF EXISTS `web_grt_usr_prod`;
/*!50001 DROP VIEW IF EXISTS `web_grt_usr_prod`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_grt_usr_prod` (
  `C_PK_ID` tinyint NOT NULL,
  `C_OPER_ID` tinyint NOT NULL,
  `C_DPT_CDE` tinyint NOT NULL,
  `C_PROD_NO` tinyint NOT NULL,
  `C_NME_CN` tinyint NOT NULL,
  `C_PROD_CAT` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_grt_usr_prod_diff`
--

DROP TABLE IF EXISTS `web_grt_usr_prod_diff`;
/*!50001 DROP VIEW IF EXISTS `web_grt_usr_prod_diff`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_grt_usr_prod_diff` (
  `C_PK_ID` tinyint NOT NULL,
  `C_OPER_ID` tinyint NOT NULL,
  `C_DPT_CDE` tinyint NOT NULL,
  `C_OP_CDE` tinyint NOT NULL,
  `C_PROD_NO` tinyint NOT NULL,
  `C_NME_CN` tinyint NOT NULL,
  `C_PROD_CAT` tinyint NOT NULL,
  `C_ENABLED` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_grt_usr_role`
--

DROP TABLE IF EXISTS `web_grt_usr_role`;
/*!50001 DROP VIEW IF EXISTS `web_grt_usr_role`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_grt_usr_role` (
  `C_PK_ID` tinyint NOT NULL,
  `C_OPER_ID` tinyint NOT NULL,
  `C_DPT_CDE` tinyint NOT NULL,
  `C_OPGRP_CDE` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `web_mid_ply_risk_unit`
--

DROP TABLE IF EXISTS `web_mid_ply_risk_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_mid_ply_risk_unit` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PLY_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '投保单号',
  `N_EDR_PRJ_NO` decimal(6,0) DEFAULT '0' COMMENT '批改次数 Times of Endorsement',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险种',
  `C_AMT_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保额币种',
  `N_AMT` decimal(20,2) DEFAULT NULL COMMENT '原始保额',
  `C_PRM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '原始保费币种',
  `N_PRM` decimal(20,2) DEFAULT NULL COMMENT '原始保费',
  `N_RMB_AMT` decimal(20,2) DEFAULT NULL COMMENT '人民币保额',
  `N_RMB_CHG_RATE` decimal(10,6) DEFAULT NULL COMMENT '人民币汇率',
  `N_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '保额变化，批单保额-上一批单（保单）保额',
  `N_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '保费变化，批单保费上一批单（保单）保费',
  `N_RMB_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '折人民币保额变化',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CI_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '共保方式,0=非共保业务,1=内部共保（我方主共）,2=内部共保（我方从共）,3=外部共保（我方主共）,4=外部共保（我方从共）',
  `N_CI_PRPT` decimal(10,6) DEFAULT NULL COMMENT '共保比例，自身占的比例',
  `N_CI_AMT` decimal(20,2) DEFAULT NULL COMMENT '共保全单保额',
  `N_CI_PRM` decimal(20,2) DEFAULT NULL COMMENT '共保全单保费',
  `C_DOC_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '单证类型,A:保单,E:批单',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '保险起期',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '保险止期',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构代码',
  `C_STOCK_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '股东业务标志',
  `C_SUB_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '补贴业务标志',
  `T_EDR_BGN_TM` datetime DEFAULT NULL COMMENT '批改生效起期',
  `T_EDR_END_TM` datetime DEFAULT NULL COMMENT '批改生效止期',
  `C_EDR_RSN` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批改原因',
  `C_EQ_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否含地震险责任标志，''0''否,''1''是',
  `C_EDR_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批改大类,1 一般批改，2 注销和增减保，3退保，注意，安邦是批改大类和批改原因组合才能唯一确定一类批改',
  `C_BSNS_TYP` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '业务来源',
  `C_IS_READ` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '轮询标识，0/null：再保未轮询，1：再保已轮询',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保单号 Policy No',
  `N_PRICE` decimal(20,2) DEFAULT NULL,
  `N_VAT` decimal(20,2) DEFAULT NULL,
  `N_VAT_VAR` decimal(20,2) DEFAULT NULL,
  `N_PRICE_VAR` decimal(20,2) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `N_VERSION` decimal(20,0) NOT NULL DEFAULT '1' COMMENT '版本信息',
  `N_PER_AMT` decimal(20,2) DEFAULT '0.00' COMMENT '每人保额',
  UNIQUE KEY `WEB_MID_PLY_RISK_UNIT` (`C_PK_ID`),
  UNIQUE KEY `IDX_MIDPLYRISK_APP_NO` (`C_PLY_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保单风险单位中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_mid_ri_plyedr`
--

DROP TABLE IF EXISTS `web_mid_ri_plyedr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_mid_ri_plyedr` (
  `C_PLYEDRINTF_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '  PKID',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '批改申请单号',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号 Policy No',
  `N_EDR_PRJ_NO` decimal(6,0) NOT NULL COMMENT '批改次数 Times of Endorsement',
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批单号',
  `N_TMS` decimal(6,0) NOT NULL COMMENT '期别 Premium Term',
  `N_INST_PRM` decimal(20,2) NOT NULL COMMENT '当前期次保费',
  `C_INSRNT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '被保人代码',
  `C_INSRNT_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '被保人名称',
  `T_UDR_TM` datetime NOT NULL COMMENT '核保时间',
  `C_INST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '分期标识，A = 一般保单,B = 分期付款,C = 多年期（需要按自然年拆分）',
  `T_CRT_TM` datetime DEFAULT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime DEFAULT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人员',
  `C_IS_READ` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '转入标识，0：未转入，1：已转入',
  `T_SIGN_TM` datetime DEFAULT NULL COMMENT '签单日期',
  `T_DUE_TM` datetime DEFAULT NULL COMMENT '业务挂账时间',
  `C_EDR_RSN` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批改原因',
  `C_EDR_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批改类型',
  `T_PAY_TM` datetime DEFAULT NULL COMMENT '缴费时间',
  `C_SPECIAL_AGREEMENT` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '特别约定--华海需求',
  `C_PROVINCE` varchar(30) DEFAULT NULL,
  `C_CITY` varchar(30) DEFAULT NULL,
  `C_GRP_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '团单标志( 0 个单; 1 团单) Group Insurance Flag',
  `C_LONG_TERM_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '多年期标志( 0 短期; 1 一年期;2 多年期) Long Term Flag',
  `C_DUTY_FREE_MRK` varchar(1) DEFAULT NULL COMMENT '免税标志',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `N_VERSION` decimal(20,0) NOT NULL DEFAULT '1' COMMENT '版本信息',
  `C_TGT_ADDR` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '标的地址',
  `C_DDUCT_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '免赔说明',
  `C_UNFIX_SPC` varchar(3999) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '特别约定',
  `C_EDR_CTNT` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '批文',
  `N_PRICE` decimal(20,2) DEFAULT NULL COMMENT '当前期次价',
  `N_VAT` decimal(20,2) DEFAULT NULL COMMENT '当前期次税',
  `LIKE_JSON_PARAMS` varchar(3999) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '类似于KEY1=VALUE1##KEY2=VALUE2的参数',
  UNIQUE KEY `IDX_MIDRI_PLYEDR_PKID` (`C_PLYEDRINTF_PK_ID`),
  KEY `IDX_MIDRI_PLYEDR_APP_NO` (`C_APP_NO`) USING BTREE,
  KEY `IDX_MIDRI_PLYEDR_PLY_NO` (`C_PLY_NO`,`N_EDR_PRJ_NO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保批单转入中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `web_org_dpt`
--

DROP TABLE IF EXISTS `web_org_dpt`;
/*!50001 DROP VIEW IF EXISTS `web_org_dpt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_org_dpt` (
  `C_DPT_CDE` tinyint NOT NULL,
  `C_SNR_DPT` tinyint NOT NULL,
  `C_DPT_DISP_CDE` tinyint NOT NULL,
  `C_DPT_OUT_CDE` tinyint NOT NULL,
  `C_DPT_CNM` tinyint NOT NULL,
  `C_DPT_ABR` tinyint NOT NULL,
  `N_DPT_LEVL` tinyint NOT NULL,
  `T_FND_TM` tinyint NOT NULL,
  `C_DPT_CADDR` tinyint NOT NULL,
  `C_ZIP_CDE` tinyint NOT NULL,
  `C_DPT_ENM` tinyint NOT NULL,
  `C_DPT_EADDR` tinyint NOT NULL,
  `C_TEL` tinyint NOT NULL,
  `C_FAX` tinyint NOT NULL,
  `C_CTCT_PRSN` tinyint NOT NULL,
  `C_RPT_TEL` tinyint NOT NULL,
  `T_ADB_TM` tinyint NOT NULL,
  `C_CONS_TEL` tinyint NOT NULL,
  `C_INSPRMT_NO` tinyint NOT NULL,
  `C_TAXRGST_NO` tinyint NOT NULL,
  `C_BNSRGST_NO` tinyint NOT NULL,
  `C_ALARM_MRK` tinyint NOT NULL,
  `C_DPT_REL_CDE` tinyint NOT NULL,
  `C_RPT_ADDR` tinyint NOT NULL,
  `C_LCN_ABR` tinyint NOT NULL,
  `C_DPT_SERNO` tinyint NOT NULL,
  `C_SRVY_DPT_MRK` tinyint NOT NULL,
  `C_SIGN_DPT_MRK` tinyint NOT NULL,
  `C_VCH_DPT_MRK` tinyint NOT NULL,
  `C_ACCT_DPT_MRK` tinyint NOT NULL,
  `C_COUNTRY` tinyint NOT NULL,
  `C_PROVINCE` tinyint NOT NULL,
  `C_CITY` tinyint NOT NULL,
  `C_COUNTY` tinyint NOT NULL,
  `C_SUFFIX_ADDR` tinyint NOT NULL,
  `C_PLY_PRN_INSR` tinyint NOT NULL,
  `C_IS_VALID` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_DPT_CLS` tinyint NOT NULL,
  `C_DPT_ATTR` tinyint NOT NULL,
  `C_GRANT_DPT_CDE` tinyint NOT NULL,
  `C_DEPARTMENT_CDE` tinyint NOT NULL,
  `C_COMPANY_CDE` tinyint NOT NULL,
  `C_DEPARTMENT_MRK` tinyint NOT NULL,
  `C_FIN_COUNT_SET` tinyint NOT NULL,
  `C_SWITCH_FLAG` tinyint NOT NULL,
  `C_TACTIC_LEVEL` tinyint NOT NULL,
  `C_FEERATE_LEVEL` tinyint NOT NULL,
  `C_CLOSE_FLAG` tinyint NOT NULL,
  `C_DEPT_LICENCE` tinyint NOT NULL,
  `C_DPTACC_CDE` tinyint NOT NULL,
  `C_TEL_AREA_NO` tinyint NOT NULL,
  `C_PHONE_CODE_NO` tinyint NOT NULL,
  `C_INTER_CDE` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `C_SBU_CDE` tinyint NOT NULL,
  `C_DPT_PRNNME` tinyint NOT NULL,
  `C_DPT_XZQH` tinyint NOT NULL,
  `C_BOSS` tinyint NOT NULL,
  `C_BASE_SERNO` tinyint NOT NULL,
  `NC_MSG` tinyint NOT NULL,
  `NC_STATUS` tinyint NOT NULL,
  `NC_OPR_STATUS` tinyint NOT NULL,
  `NC_OPR_MSG` tinyint NOT NULL,
  `C_DPT_FNM` tinyint NOT NULL,
  `C_CLM_DPT_CDE` tinyint NOT NULL,
  `C_SALES_CHANNEL_CODE` tinyint NOT NULL,
  `C_BANK_NAME` tinyint NOT NULL,
  `C_BANK_NO` tinyint NOT NULL,
  `C_DISPTSTTL_ORG` tinyint NOT NULL,
  `N_DPT_LEVL_OA` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_org_emp`
--

DROP TABLE IF EXISTS `web_org_emp`;
/*!50001 DROP VIEW IF EXISTS `web_org_emp`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_org_emp` (
  `C_EMP_CDE` tinyint NOT NULL,
  `C_EMP_CNM` tinyint NOT NULL,
  `C_DPT_CDE` tinyint NOT NULL,
  `T_BIRTHDAY` tinyint NOT NULL,
  `C_SEX` tinyint NOT NULL,
  `C_NTN_CDE` tinyint NOT NULL,
  `C_EDU_CDE` tinyint NOT NULL,
  `C_MRG_CDE` tinyint NOT NULL,
  `C_CTFCT_TYP` tinyint NOT NULL,
  `C_CTFCT_NO` tinyint NOT NULL,
  `C_REGIST` tinyint NOT NULL,
  `T_ENT_TM` tinyint NOT NULL,
  `C_EMP_ENM` tinyint NOT NULL,
  `C_MAJOR_CDE` tinyint NOT NULL,
  `C_TITLE_CDE` tinyint NOT NULL,
  `C_HOBBY` tinyint NOT NULL,
  `C_PRTY_TYP` tinyint NOT NULL,
  `C_HOME_ADDR` tinyint NOT NULL,
  `C_ZIP_CDE` tinyint NOT NULL,
  `C_MOBILE` tinyint NOT NULL,
  `T_REG_TM` tinyint NOT NULL,
  `T_LEV_TM` tinyint NOT NULL,
  `C_EMP_DOC` tinyint NOT NULL,
  `C_REMARK` tinyint NOT NULL,
  `C_DRE_CDE` tinyint NOT NULL,
  `C_STATUS` tinyint NOT NULL,
  `C_GRNT_CDE1` tinyint NOT NULL,
  `C_GRNT_CDE2` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_IS_VALID` tinyint NOT NULL,
  `C_HR_CDE` tinyint NOT NULL,
  `C_TEL` tinyint NOT NULL,
  `C_SENDMSG_FLG` tinyint NOT NULL,
  `NC_MSG` tinyint NOT NULL,
  `NC_STATUS` tinyint NOT NULL,
  `NC_OPR_STATUS` tinyint NOT NULL,
  `NC_OPR_MSG` tinyint NOT NULL,
  `C_EMAIL` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `C_PASSWD` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_org_oper`
--

DROP TABLE IF EXISTS `web_org_oper`;
/*!50001 DROP VIEW IF EXISTS `web_org_oper`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_org_oper` (
  `C_OPER_ID` tinyint NOT NULL,
  `c_call_center_oper_id` tinyint NOT NULL,
  `C_OPER_CNM` tinyint NOT NULL,
  `C_PASSWD` tinyint NOT NULL,
  `C_IS_VALID` tinyint NOT NULL,
  `T_PWD_STRT_TM` tinyint NOT NULL,
  `T_PWD_END_TM` tinyint NOT NULL,
  `C_SRC` tinyint NOT NULL,
  `C_REL_CDE` tinyint NOT NULL,
  `C_DPT_PERM` tinyint NOT NULL,
  `C_DPT_DIFF` tinyint NOT NULL,
  `C_PRD_DIFF` tinyint NOT NULL,
  `C_OP_DIFF` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_OWN_DPT_CDE` tinyint NOT NULL,
  `C_CSS_STYLE` tinyint NOT NULL,
  `C_EDU_CDE` tinyint NOT NULL,
  `C_STATUS` tinyint NOT NULL,
  `C_LMT_FLAG` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `C_ID_NO` tinyint NOT NULL,
  `C_OPER_CNM_BAK` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL,
  `NUMBER` tinyint NOT NULL,
  `LOCKED` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `web_pay_seemoney_config`
--

DROP TABLE IF EXISTS `web_pay_seemoney_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_pay_seemoney_config` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_DPTACC_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  做账机构,v6用到',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_BGN_TM` datetime NOT NULL,
  `C_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  处理标识,0 不处理1 处理,v6用到',
  `C_CONN_BANK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'XXX' COMMENT '  连接银行,UNIONPAY （通用版本）银联ICBC 北京分公司专,v6用到',
  `C_CUST_TYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  客户类型,预留',
  `C_BANK_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  银行代码,关联表WEB_BAS_FIN_BANK,v6用到',
  `C_ABBY_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  安邦邦业标识,1 安邦2 邦业公估',
  `C_COMPUTER_CODE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  计算机代码,北京地区用',
  `C_BFN_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  商户号,上海地区才配置',
  `N_CONTROL_DAYS` decimal(20,0) DEFAULT NULL COMMENT '  缴费控制天数,如果是刷卡缴费，缴费日期必须控制在保单起期X天前；如果是支票审核，必须控制在保单起期X天前',
  `N_INTERVAL` decimal(20,0) DEFAULT NULL COMMENT '  时间间隔',
  `N_TIMES` decimal(20,0) DEFAULT NULL COMMENT '  次数,通赔用',
  `N_MIN_AMT` decimal(20,2) DEFAULT NULL COMMENT '  审核最小值,通赔用',
  `N_MAX_AMT` decimal(20,2) DEFAULT NULL COMMENT '  审核最大值,通赔用',
  `C_DPT_LEVEL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  机构等级,通赔用',
  `C_AUDIT_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  审核标识,通赔用',
  `C_RESV_TXT_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段1,预留',
  `C_RESV_TXT_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段2,预留',
  `C_RESV_TXT_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段3,预留',
  `C_RESV_TXT_4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段4,预留',
  `C_RESV_TXT_5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段5,预留',
  `C_RESV_TXT_6` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段6,预留',
  `C_RESV_TXT_7` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段7,预留',
  `C_RESV_TXT_8` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段8,用作是否POS机刷卡标志：0 不连接POS刷卡缴费1 连接POS刷卡缴费,v6用到',
  `N_RESV_NUM_1` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段1,预留',
  `N_RESV_NUM_2` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段2,预留',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `N_EXT_LEN` decimal(8,0) DEFAULT NULL COMMENT '  报文扩充长度,v6用到',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_BSNS_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  业务来源, Source Type of Business,预留',
  `C_BRKR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  渠道,代理人/经纪人 Agent/Broker No',
  `C_PAY_TYP` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  状态,0停用,1启用',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '  失效时间,删除操作时间',
  `C_CONN_POS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1' COMMENT '  是否连POS机标志,0 不连接POS刷卡缴费,1 连接POS刷卡缴费',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_PAY_SEEMONEY_CONFIG` (`C_PK_ID`),
  KEY `IDX_PAY_SEEMONEY_CONFIG_DAYS` (`N_CONTROL_DAYS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `web_ply_cargo`
--

DROP TABLE IF EXISTS `web_ply_cargo`;
/*!50001 DROP VIEW IF EXISTS `web_ply_cargo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_ply_cargo` (
  `C_APP_NO` tinyint NOT NULL,
  `C_PLY_NO` tinyint NOT NULL,
  `N_EDR_PRJ_NO` tinyint NOT NULL,
  `C_EDR_NO` tinyint NOT NULL,
  `C_CRGO_CDE` tinyint NOT NULL,
  `C_ENG_NME` tinyint NOT NULL,
  `C_TRANS_TOOL` tinyint NOT NULL,
  `C_INVC_NO` tinyint NOT NULL,
  `C_PICK_NO` tinyint NOT NULL,
  `C_CARRIAGE_CDE` tinyint NOT NULL,
  `C_SAIL_NO` tinyint NOT NULL,
  `C_FROM_PRT` tinyint NOT NULL,
  `C_TO_PRT` tinyint NOT NULL,
  `C_PASS_PRT` tinyint NOT NULL,
  `C_CERT_MRK` tinyint NOT NULL,
  `C_CERT_NO` tinyint NOT NULL,
  `C_PRN_FRM` tinyint NOT NULL,
  `C_SHIP_NME` tinyint NOT NULL,
  `C_VSL_LVL_CDE` tinyint NOT NULL,
  `C_SHIP_NAT` tinyint NOT NULL,
  `C_SHIP_AGE` tinyint NOT NULL,
  `C_WATER_LINE` tinyint NOT NULL,
  `C_TRA_MRK` tinyint NOT NULL,
  `C_TRA_INFO` tinyint NOT NULL,
  `C_CHECKER_CDE` tinyint NOT NULL,
  `C_CHECK_ADDR` tinyint NOT NULL,
  `C_FRM_PRT_ARA` tinyint NOT NULL,
  `C_TO_PRT_ARA` tinyint NOT NULL,
  `C_TRAN_TOOL` tinyint NOT NULL,
  `C_NO_TEXT` tinyint NOT NULL,
  `C_PRN_FORM` tinyint NOT NULL,
  `T_ARRIVE_DATE` tinyint NOT NULL,
  `C_SRVY_NME` tinyint NOT NULL,
  `C_PAY_ADDR` tinyint NOT NULL,
  `N_INV_AMT` tinyint NOT NULL,
  `C_INV_CUR` tinyint NOT NULL,
  `N_ADD_QUOT` tinyint NOT NULL,
  `N_EXC_RATE` tinyint NOT NULL,
  `N_RATE` tinyint NOT NULL,
  `N_AMT` tinyint NOT NULL,
  `C_AMT_CUR` tinyint NOT NULL,
  `N_PRM` tinyint NOT NULL,
  `C_PRM_CUR` tinyint NOT NULL,
  `C_RESV_TXT_1` tinyint NOT NULL,
  `C_RESV_TXT_2` tinyint NOT NULL,
  `C_RESV_TXT_3` tinyint NOT NULL,
  `C_RESV_TXT_4` tinyint NOT NULL,
  `C_RESV_TXT_5` tinyint NOT NULL,
  `C_RESV_TXT_6` tinyint NOT NULL,
  `C_RESV_TXT_7` tinyint NOT NULL,
  `C_RESV_TXT_8` tinyint NOT NULL,
  `C_RESV_TXT_9` tinyint NOT NULL,
  `C_RESV_TXT_10` tinyint NOT NULL,
  `C_RESV_TXT_11` tinyint NOT NULL,
  `C_RESV_TXT_12` tinyint NOT NULL,
  `C_RESV_TXT_13` tinyint NOT NULL,
  `C_RESV_TXT_14` tinyint NOT NULL,
  `C_RESV_TXT_15` tinyint NOT NULL,
  `C_RESV_TXT_16` tinyint NOT NULL,
  `C_RESV_TXT_17` tinyint NOT NULL,
  `C_RESV_TXT_18` tinyint NOT NULL,
  `C_RESV_TXT_19` tinyint NOT NULL,
  `C_RESV_TXT_20` tinyint NOT NULL,
  `N_RESV_NUM_1` tinyint NOT NULL,
  `N_RESV_NUM_2` tinyint NOT NULL,
  `N_RESV_NUM_3` tinyint NOT NULL,
  `N_RESV_NUM_4` tinyint NOT NULL,
  `N_RESV_NUM_5` tinyint NOT NULL,
  `N_RESV_NUM_6` tinyint NOT NULL,
  `N_RESV_NUM_7` tinyint NOT NULL,
  `N_RESV_NUM_8` tinyint NOT NULL,
  `N_RESV_NUM_9` tinyint NOT NULL,
  `N_RESV_NUM_10` tinyint NOT NULL,
  `N_RESV_NUM_11` tinyint NOT NULL,
  `N_RESV_NUM_12` tinyint NOT NULL,
  `N_RESV_NUM_13` tinyint NOT NULL,
  `N_RESV_NUM_14` tinyint NOT NULL,
  `N_RESV_NUM_15` tinyint NOT NULL,
  `N_RESV_NUM_16` tinyint NOT NULL,
  `N_RESV_NUM_17` tinyint NOT NULL,
  `N_RESV_NUM_18` tinyint NOT NULL,
  `N_RESV_NUM_19` tinyint NOT NULL,
  `N_RESV_NUM_20` tinyint NOT NULL,
  `T_RESV_TM_2` tinyint NOT NULL,
  `T_RESV_TM_3` tinyint NOT NULL,
  `T_RESV_TM_4` tinyint NOT NULL,
  `T_RESV_TM_5` tinyint NOT NULL,
  `T_RESV_TM_6` tinyint NOT NULL,
  `T_RESV_TM_7` tinyint NOT NULL,
  `T_RESV_TM_8` tinyint NOT NULL,
  `T_RESV_TM_9` tinyint NOT NULL,
  `T_RESV_TM_10` tinyint NOT NULL,
  `T_RESV_TM_1` tinyint NOT NULL,
  `C_LATEST_MRK` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `C_LTXT_FLD_1` tinyint NOT NULL,
  `C_RESV_TXT_21` tinyint NOT NULL,
  `C_RESV_TXT_22` tinyint NOT NULL,
  `C_RESV_TXT_23` tinyint NOT NULL,
  `C_RESV_TXT_24` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL,
  `C_RESV_TXT_25` tinyint NOT NULL,
  `C_RESV_TXT_26` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_ply_cargo_list`
--

DROP TABLE IF EXISTS `web_ply_cargo_list`;
/*!50001 DROP VIEW IF EXISTS `web_ply_cargo_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_ply_cargo_list` (
  `C_PK_ID` tinyint NOT NULL,
  `C_APP_NO` tinyint NOT NULL,
  `C_ROW_ID` tinyint NOT NULL,
  `C_PLY_NO` tinyint NOT NULL,
  `N_EDR_PRJ_NO` tinyint NOT NULL,
  `C_EDR_NO` tinyint NOT NULL,
  `N_SEQ_NO` tinyint NOT NULL,
  `C_MARKS_NO` tinyint NOT NULL,
  `C_DESC_GOD` tinyint NOT NULL,
  `C_QTY` tinyint NOT NULL,
  `C_PACK` tinyint NOT NULL,
  `C_WEIT` tinyint NOT NULL,
  `C_RESV_TXT_1` tinyint NOT NULL,
  `C_RESV_TXT_2` tinyint NOT NULL,
  `C_RESV_TXT_3` tinyint NOT NULL,
  `C_RESV_TXT_4` tinyint NOT NULL,
  `N_RESV_NUM_1` tinyint NOT NULL,
  `N_RESV_NUM_2` tinyint NOT NULL,
  `C_LATEST_MRK` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `C_RESV_TXT_5` tinyint NOT NULL,
  `C_RESV_TXT_6` tinyint NOT NULL,
  `T_STARTGO_TM` tinyint NOT NULL,
  `T_RESV_TM1` tinyint NOT NULL,
  `C_TRA_INFO` tinyint NOT NULL,
  `C_PACKAGE_FIRST_TYP` tinyint NOT NULL,
  `C_PACKAGE_SECOND_TYP` tinyint NOT NULL,
  `C_GOODS_FIRST_TYP` tinyint NOT NULL,
  `C_GOODS_SECOND_TYP` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL,
  `C_RESV_TXT_7` tinyint NOT NULL,
  `C_RESV_TXT_8` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_ply_ent_tgt_obj`
--

DROP TABLE IF EXISTS `web_ply_ent_tgt_obj`;
/*!50001 DROP VIEW IF EXISTS `web_ply_ent_tgt_obj`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_ply_ent_tgt_obj` (
  `C_PK_ID` tinyint NOT NULL,
  `C_APP_NO` tinyint NOT NULL,
  `C_ROW_ID` tinyint NOT NULL,
  `C_PLY_NO` tinyint NOT NULL,
  `N_EDR_PRJ_NO` tinyint NOT NULL,
  `C_EDR_NO` tinyint NOT NULL,
  `N_SEQ_NO` tinyint NOT NULL,
  `C_PRJ_TYP` tinyint NOT NULL,
  `C_PRJ_NME` tinyint NOT NULL,
  `C_TGT_QTY` tinyint NOT NULL,
  `C_AMT_DETERMINE_METHOD_CDE` tinyint NOT NULL,
  `C_CUR_TYP` tinyint NOT NULL,
  `N_AMT` tinyint NOT NULL,
  `N_RATE` tinyint NOT NULL,
  `N_PRM` tinyint NOT NULL,
  `N_TGT_NO` tinyint NOT NULL,
  `C_DDUCT_DESC` tinyint NOT NULL,
  `C_CANCEL_MARK` tinyint NOT NULL,
  `C_TGT_OBJ_TXT_FLD_1` tinyint NOT NULL,
  `T_TGT_OBJ_TM_FLD_1` tinyint NOT NULL,
  `N_TGT_OBJ_NUM_FLD_1` tinyint NOT NULL,
  `L_TGT_OBJ_LTXT_FLD_1` tinyint NOT NULL,
  `C_LATEST_MRK` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `C_TGT_OBJ_TXT_FLD_2` tinyint NOT NULL,
  `C_TGT_OBJ_TXT_FLD_3` tinyint NOT NULL,
  `C_TGT_OBJ_TXT_FLD_4` tinyint NOT NULL,
  `C_TGT_OBJ_TXT_FLD_5` tinyint NOT NULL,
  `N_TGT_OBJ_NUM_FLD_2` tinyint NOT NULL,
  `N_TGT_OBJ_NUM_FLD_3` tinyint NOT NULL,
  `N_TGT_OBJ_NUM_FLD_4` tinyint NOT NULL,
  `N_TGT_OBJ_NUM_FLD_5` tinyint NOT NULL,
  `T_TGT_OBJ_TM_FLG_2` tinyint NOT NULL,
  `N_DDUCT_RATE` tinyint NOT NULL,
  `N_DDUCT_AMT` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `web_ply_eq_info`
--

DROP TABLE IF EXISTS `web_ply_eq_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ply_eq_info` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PLY_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `N_EDR_PRJ_NO` decimal(6,0) DEFAULT '0',
  `N_SEQ_NO` decimal(6,0) NOT NULL,
  `N_AMT` decimal(20,2) DEFAULT NULL,
  `N_PRM` decimal(20,2) DEFAULT NULL,
  `N_RMB_AMT` decimal(20,2) DEFAULT NULL,
  `N_RI_PRM` decimal(20,2) DEFAULT NULL,
  `N_AMT_VAR` decimal(20,2) DEFAULT NULL,
  `N_PRM_VAR` decimal(20,2) DEFAULT NULL,
  `N_RMB_AMT_VAR` decimal(20,2) DEFAULT NULL,
  `N_RI_PRM_VAR` decimal(20,2) DEFAULT NULL,
  `N_EML` decimal(20,2) DEFAULT NULL,
  `C_REMARK` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_RU_PK_ID` varchar(50) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_PLY_EQ_INFO` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `web_ply_prj_rel`
--

DROP TABLE IF EXISTS `web_ply_prj_rel`;
/*!50001 DROP VIEW IF EXISTS `web_ply_prj_rel`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_ply_prj_rel` (
  `C_PK_ID` tinyint NOT NULL,
  `C_APP_NO` tinyint NOT NULL,
  `C_ROW_ID` tinyint NOT NULL,
  `C_PLY_NO` tinyint NOT NULL,
  `N_EDR_PRJ_NO` tinyint NOT NULL,
  `C_EDR_NO` tinyint NOT NULL,
  `N_SEQ_NO` tinyint NOT NULL,
  `C_PRJ_REL` tinyint NOT NULL,
  `C_NAME` tinyint NOT NULL,
  `C_ORG_CDE` tinyint NOT NULL,
  `C_ADDR` tinyint NOT NULL,
  `C_ZIP` tinyint NOT NULL,
  `C_INSRANT_FLG` tinyint NOT NULL,
  `C_RESV_TXT_1` tinyint NOT NULL,
  `C_RESV_TXT_2` tinyint NOT NULL,
  `C_RESV_TXT_3` tinyint NOT NULL,
  `N_RESV_NUM_1` tinyint NOT NULL,
  `N_RESV_NUM_2` tinyint NOT NULL,
  `N_RESV_NUM_3` tinyint NOT NULL,
  `C_CANCEL_MARK` tinyint NOT NULL,
  `C_LATEST_MRK` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `web_ply_risk_unit`
--

DROP TABLE IF EXISTS `web_ply_risk_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ply_risk_unit` (
  `C_PK_ID` varchar(50) NOT NULL COMMENT '主键',
  `C_PLY_APP_NO` varchar(50) NOT NULL COMMENT '投保单号',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `N_EDR_PRJ_NO` decimal(6,0) DEFAULT '0' COMMENT '批改次数 Times of Endorsement',
  `C_PROD_NO` varchar(6) NOT NULL COMMENT '险种',
  `N_SEQ_NO` decimal(6,0) NOT NULL COMMENT '风险单位序号(对应再保拆分序号)',
  `C_RISK_UNIT_NME` varchar(100) DEFAULT NULL COMMENT '风险单位名称',
  `C_RISK_LVL_CDE` varchar(30) DEFAULT NULL COMMENT '风险等级 Risk Grade Code',
  `N_KEEP_AMT` decimal(20,2) DEFAULT NULL COMMENT '风险等级对应的自留额',
  `N_RET_AMT` decimal(20,2) DEFAULT NULL COMMENT '自留保额',
  `N_RET_PRPT` decimal(10,6) DEFAULT NULL COMMENT '自留 比例',
  `C_AMT_CUR` varchar(30) DEFAULT NULL COMMENT '保额币种',
  `N_AMT` decimal(20,2) DEFAULT NULL COMMENT '原始保额',
  `N_PRM_CUR` varchar(30) DEFAULT NULL COMMENT '原始保费币种',
  `N_PRM` decimal(20,2) DEFAULT NULL COMMENT '原始保费',
  `N_NET_PRM` decimal(20,2) DEFAULT NULL COMMENT '净保费,除去手续费后的保费',
  `C_CED_PRM_WAY` varchar(1) DEFAULT NULL COMMENT '''G''毛保费,''N''净保费',
  `N_RMB_AMT` decimal(20,2) DEFAULT NULL COMMENT '人民币保额',
  `N_RMB_CHG_RATE` decimal(10,6) DEFAULT NULL COMMENT '人民币汇率',
  `N_RI_PRM` decimal(20,2) DEFAULT NULL COMMENT '再保保费',
  `C_RIPRM_CUR` varchar(30) DEFAULT NULL COMMENT '再保币种',
  `N_RICUR_CHG_RATE` decimal(10,6) DEFAULT NULL COMMENT '再保币种汇率',
  `N_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '保额变化，批单保额-上一批单（保单）保额',
  `N_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '保费变化，批单保费上一批单（保单）保费',
  `N_RMB_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '折人民币保额变化',
  `N_RI_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '再保保费变化',
  `N_EML` decimal(20,2) unsigned DEFAULT NULL,
  `C_BLOCK_NO` varchar(30) DEFAULT NULL COMMENT '风险区域号',
  `C_REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `C_CRT_CDE` varchar(30) NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `N_ODD_RET_AMT` decimal(20,2) DEFAULT '0.00' COMMENT '剩余自留金额',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `N_ADD_RET_AMT` decimal(20,2) DEFAULT NULL COMMENT '附加自留保额，合约之外指定自留保额',
  `C_CVRG_NO` varchar(6) DEFAULT NULL COMMENT '险别，现主要用于区分工程险中物质部分与三者部分',
  `C_CI_MRK` varchar(1) DEFAULT '0' COMMENT '共保方式,"0"=非共保业务,"1"=内部共保（我方主共）,"2"=内部共保（我方从共）,"3"=外部共保（我方主共）,"4"=外部共保（我方从共）',
  `N_CI_PRPT` decimal(10,6) DEFAULT NULL COMMENT '共保比例，自身占的比例',
  `N_CI_AMT` decimal(20,2) DEFAULT NULL COMMENT '共保全单保额',
  `N_CI_PRM` decimal(20,2) DEFAULT NULL COMMENT '共保全单保费',
  `C_FAC_TYP` varchar(1) DEFAULT '0' COMMENT '临分类型，0=不需要临分，1=自主临分，2=提示临分，3=补打临分',
  `C_BUSINESS_CONFIRM` varchar(1) DEFAULT '0' COMMENT '临分业务确认，0为默认，2=未确认，1=已确认',
  `C_RESV_TXT_1` varchar(200) DEFAULT NULL COMMENT '永安：是否农银代理业务',
  `C_RESV_TXT_2` varchar(200) DEFAULT NULL COMMENT '文本预留字段2',
  `C_RESV_TXT_3` varchar(200) DEFAULT NULL COMMENT '文本预留字段3',
  `C_PRM_CUR` varchar(30) DEFAULT NULL COMMENT '原始保费币种',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '保险起期',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '保险止期',
  `T_EDR_BGN_TM` datetime DEFAULT NULL COMMENT '批改生效起期',
  `T_EDR_END_TM` datetime DEFAULT NULL COMMENT '批改生效止期',
  `C_STOCK_MRK` varchar(1) DEFAULT NULL COMMENT '股东业务标志',
  `C_SUB_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '补贴业务标志',
  `C_FAC_MRK` varchar(1) DEFAULT NULL COMMENT '临分标志,0:非临分,1:临分',
  `C_EQ_MRK` varchar(1) DEFAULT NULL COMMENT '是否含地震险责任标志',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '机构代码',
  `C_BSNS_TYP` varchar(30) DEFAULT NULL COMMENT '业务来源',
  `N_VAT` decimal(20,2) DEFAULT NULL,
  `N_PRICE` decimal(20,2) DEFAULT NULL,
  `N_VAT_VAR` decimal(20,2) DEFAULT NULL,
  `N_PRICE_VAR` decimal(20,2) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `N_PER_AMT` decimal(20,2) DEFAULT '0.00' COMMENT '每人保额',
  UNIQUE KEY `PK_WEB_PLY_RISK_UNIT` (`C_PK_ID`),
  UNIQUE KEY `C_PLY_APP_NO_N_SEQ_NO` (`C_PLY_APP_NO`,`N_SEQ_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保单风险单位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `web_ply_sub`
--

DROP TABLE IF EXISTS `web_ply_sub`;
/*!50001 DROP VIEW IF EXISTS `web_ply_sub`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_ply_sub` (
  `C_APP_NO` tinyint NOT NULL,
  `C_PLY_NO` tinyint NOT NULL,
  `N_EDR_PRJ_NO` tinyint NOT NULL,
  `C_EDR_NO` tinyint NOT NULL,
  `N_GOV_SUB_AMT` tinyint NOT NULL,
  `N_GOV_SUB_VAR` tinyint NOT NULL,
  `N_GOV_SUB_PROP` tinyint NOT NULL,
  `N_SELF_PAY_AMT` tinyint NOT NULL,
  `N_SELF_PAY_VAR` tinyint NOT NULL,
  `N_SELF_PAY_PROP` tinyint NOT NULL,
  `C_RESV_TXT_1` tinyint NOT NULL,
  `C_RESV_TXT_2` tinyint NOT NULL,
  `C_RESV_TXT_3` tinyint NOT NULL,
  `C_RESV_TXT_4` tinyint NOT NULL,
  `C_RESV_TXT_5` tinyint NOT NULL,
  `C_RESV_TXT_6` tinyint NOT NULL,
  `C_RESV_TXT_7` tinyint NOT NULL,
  `C_RESV_TXT_8` tinyint NOT NULL,
  `C_RESV_TXT_9` tinyint NOT NULL,
  `C_RESV_TXT_10` tinyint NOT NULL,
  `N_RESV_NUM_1` tinyint NOT NULL,
  `N_RESV_NUM_2` tinyint NOT NULL,
  `N_RESV_NUM_3` tinyint NOT NULL,
  `N_RESV_NUM_4` tinyint NOT NULL,
  `N_RESV_NUM_5` tinyint NOT NULL,
  `N_RESV_NUM_6` tinyint NOT NULL,
  `N_RESV_NUM_7` tinyint NOT NULL,
  `N_RESV_NUM_8` tinyint NOT NULL,
  `N_RESV_NUM_9` tinyint NOT NULL,
  `N_RESV_NUM_10` tinyint NOT NULL,
  `C_LATEST_MRK` tinyint NOT NULL,
  `T_RESV_TM_1` tinyint NOT NULL,
  `T_RESV_TM_2` tinyint NOT NULL,
  `T_RESV_TM_3` tinyint NOT NULL,
  `T_RESV_TM_4` tinyint NOT NULL,
  `T_RESV_TM_5` tinyint NOT NULL,
  `T_RESV_TM_6` tinyint NOT NULL,
  `T_RESV_TM_7` tinyint NOT NULL,
  `T_RESV_TM_8` tinyint NOT NULL,
  `T_RESV_TM_9` tinyint NOT NULL,
  `T_RESV_TM_10` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_prd_cvrg`
--

DROP TABLE IF EXISTS `web_prd_cvrg`;
/*!50001 DROP VIEW IF EXISTS `web_prd_cvrg`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_prd_cvrg` (
  `C_CVRG_NO` tinyint NOT NULL,
  `C_KIND_NO` tinyint NOT NULL,
  `C_RISK_TYP` tinyint NOT NULL,
  `C_NME_CN` tinyint NOT NULL,
  `C_NME_EN` tinyint NOT NULL,
  `C_RDR_TYP` tinyint NOT NULL,
  `C_CVRG_DESC` tinyint NOT NULL,
  `C_STATUS` tinyint NOT NULL,
  `T_ADB_TM` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `C_JY_FLG` tinyint NOT NULL,
  `C_YWORJK` tinyint NOT NULL,
  `C_IFMEDICAL` tinyint NOT NULL,
  `C_FEETYP` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_prd_kind`
--

DROP TABLE IF EXISTS `web_prd_kind`;
/*!50001 DROP VIEW IF EXISTS `web_prd_kind`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_prd_kind` (
  `C_KIND_NO` tinyint NOT NULL,
  `C_NME_CN` tinyint NOT NULL,
  `C_NME_EN` tinyint NOT NULL,
  `C_STATUS` tinyint NOT NULL,
  `T_ADB_TM` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `N_DISP_ORD` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_prd_pic_tab_rel`
--

DROP TABLE IF EXISTS `web_prd_pic_tab_rel`;
/*!50001 DROP VIEW IF EXISTS `web_prd_pic_tab_rel`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_prd_pic_tab_rel` (
  `C_PK_ID` tinyint NOT NULL,
  `C_PIC_ID` tinyint NOT NULL,
  `C_TAB_NO` tinyint NOT NULL,
  `N_SHOW_SEQ` tinyint NOT NULL,
  `C_REC_NULL_MRK` tinyint NOT NULL,
  `C_PROD_NO` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `C_MAIN_CVRG_FLAG` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_prd_prod`
--

DROP TABLE IF EXISTS `web_prd_prod`;
/*!50001 DROP VIEW IF EXISTS `web_prd_prod`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_prd_prod` (
  `C_PROD_NO` tinyint NOT NULL,
  `C_NME_CN` tinyint NOT NULL,
  `C_KIND_NO` tinyint NOT NULL,
  `C_NME_EN` tinyint NOT NULL,
  `C_CNM_ABR` tinyint NOT NULL,
  `C_STATUS` tinyint NOT NULL,
  `C_DOC_FMP` tinyint NOT NULL,
  `C_DOC_ID` tinyint NOT NULL,
  `C_INSRNC_LONG` tinyint NOT NULL,
  `C_PLYNO_FLAG` tinyint NOT NULL,
  `C_RATE_FLAG` tinyint NOT NULL,
  `C_INST_FLAG` tinyint NOT NULL,
  `C_FINCVRG_FLAG` tinyint NOT NULL,
  `C_CLMEDR_FLAG` tinyint NOT NULL,
  `C_BS_TYPE` tinyint NOT NULL,
  `C_PKG_FLAG` tinyint NOT NULL,
  `C_PKG_PLY_FLAG` tinyint NOT NULL,
  `N_DISP_ORD` tinyint NOT NULL,
  `C_REL_PROD_NO` tinyint NOT NULL,
  `C_VER_INFO` tinyint NOT NULL,
  `T_ADB_TM` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `C_INS_END_FLAG` tinyint NOT NULL,
  `C_FIXED_AMT_FLAG` tinyint NOT NULL,
  `T_BGN_TM` tinyint NOT NULL,
  `C_TAB_DISP_FLAG` tinyint NOT NULL,
  `C_GRP_FLAG` tinyint NOT NULL,
  `C_PER_FLAG` tinyint NOT NULL,
  `C_ADD_TYPE` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `C_IS_GIFT` tinyint NOT NULL,
  `C_SUBPROD_NO` tinyint NOT NULL,
  `C_JOIN_MAIN_PROD_NO` tinyint NOT NULL,
  `C_JOIN_ATTACH_PROD_NO` tinyint NOT NULL,
  `C_SEPA_CVRG_FLAG` tinyint NOT NULL,
  `N_CRITERION_TIME` tinyint NOT NULL,
  `C_CRITERION_TIME_UNIT` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_prd_prod_cvrg_rel`
--

DROP TABLE IF EXISTS `web_prd_prod_cvrg_rel`;
/*!50001 DROP VIEW IF EXISTS `web_prd_prod_cvrg_rel`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_prd_prod_cvrg_rel` (
  `C_PK_ID` tinyint NOT NULL,
  `C_PROD_NO` tinyint NOT NULL,
  `C_CVRG_NO` tinyint NOT NULL,
  `C_PKG_REL_PROD` tinyint NOT NULL,
  `C_CHK` tinyint NOT NULL,
  `C_TYP` tinyint NOT NULL,
  `N_DISP_ORD` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `C_SUM_FLAG` tinyint NOT NULL,
  `C_BIAODI_LB` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `web_prd_prod_pic`
--

DROP TABLE IF EXISTS `web_prd_prod_pic`;
/*!50001 DROP VIEW IF EXISTS `web_prd_prod_pic`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_prd_prod_pic` (
  `C_PK_ID` tinyint NOT NULL,
  `C_PROD_NO` tinyint NOT NULL,
  `C_NME_EN` tinyint NOT NULL,
  `C_NME_CN` tinyint NOT NULL,
  `C_FILE` tinyint NOT NULL,
  `C_FLAG` tinyint NOT NULL,
  `C_NEED_GENE` tinyint NOT NULL,
  `N_SHOW_SEQ` tinyint NOT NULL,
  `C_TYPE` tinyint NOT NULL,
  `C_REUSE_ID` tinyint NOT NULL,
  `T_CRT_TM` tinyint NOT NULL,
  `C_CRT_CDE` tinyint NOT NULL,
  `T_UPD_TM` tinyint NOT NULL,
  `C_UPD_CDE` tinyint NOT NULL,
  `C_POSTLOAD` tinyint NOT NULL,
  `C_ONLOAD` tinyint NOT NULL,
  `C_LINKSRC` tinyint NOT NULL,
  `C_GRP_FLAG` tinyint NOT NULL,
  `C_TRANS_MRK` tinyint NOT NULL,
  `T_TRANS_TM` tinyint NOT NULL,
  `T_MODIFY_TM` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `web_ri_amt_range`
--

DROP TABLE IF EXISTS `web_ri_amt_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_amt_range` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_RANGE_NME` varchar(100) DEFAULT NULL COMMENT '区间段名称',
  `N_RANGE_START` decimal(20,6) DEFAULT NULL COMMENT '区间段起始值',
  `N_RANGE_END` decimal(20,6) DEFAULT NULL COMMENT '区间段结束值',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `N_ORDER` decimal(10,0) DEFAULT NULL COMMENT '排列顺序',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `C_CONT_CDE` varchar(50) DEFAULT NULL COMMENT '合约代码',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保额区间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_acctinfo`
--

DROP TABLE IF EXISTS `web_ri_app_acctinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_acctinfo` (
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ACCT_NME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  账户名,特别约定代码',
  `C_ACCT_NO` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  账号,中文名',
  `C_BANK_REL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  收款行联行号',
  `C_BANK_PRO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  银行省',
  `C_BANK_AREA` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  银行市',
  `C_BANK_CDE` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  开户行',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_BANK_COUNTY` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  银行县',
  `C_BANK_REL_TYP` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '收款银行大类',
  `C_BANK_CNAPS` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'CNAPS号',
  `C_BANK_ADDR` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '开户行地址',
  `C_PUB_PRI` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '对公对私',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_APP_ACCTINFO` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_agro`
--

DROP TABLE IF EXISTS `web_ri_app_agro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_agro` (
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_SEQ_NO` decimal(22,0) NOT NULL,
  `C_ARG_REL` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_NAT_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  涉农性质,特别约定代码',
  `C_FIN_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  财政来源类型,英文名',
  `C_PRM_SOU` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_PRM_SUSD_SOU` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_INSRNT_GATG` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_INSRNT_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_INSRNT_CNM` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PLY_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  政策类型,中文名',
  `N_RESV_NUM_1` decimal(22,0) DEFAULT NULL COMMENT '  预留数值字段1,附加保费',
  `C_RESV_TXT_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段1',
  `C_RESV_TXT_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段2',
  `C_RESV_TXT_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段3',
  `C_RESV_TXT_4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段4',
  `C_RESV_TXT_5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段5',
  `C_RESV_TXT_6` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段6',
  `C_RESV_TXT_7` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段7',
  `C_RESV_TXT_8` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段8',
  `C_RESV_TXT_9` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段9',
  `C_RESV_TXT_10` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段10',
  `C_RESV_TXT_11` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  预留文本字段11',
  `C_RESV_TXT_12` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  预留文本字段12',
  `C_RESV_TXT_13` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  预留文本字段13',
  `C_RESV_TXT_14` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  预留文本字段14',
  `C_RESV_TXT_15` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  预留文本字段15',
  `C_RESV_TXT_16` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  预留文本字段16',
  `N_RESV_NUM_2` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段2,附加保费',
  `N_RESV_NUM_3` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段3,附加保费',
  `N_RESV_NUM_4` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段4,附加保费',
  `N_RESV_NUM_5` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段5,附加保费',
  `N_RESV_NUM_6` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段6,附加保费',
  `N_RESV_NUM_7` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段7,附加保费',
  `N_RESV_NUM_8` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段8,附加保费',
  `N_RESV_NUM_9` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段9,附加保费',
  `N_RESV_NUM_10` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段10,附加保费',
  `N_RESV_NUM_11` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段11,附加保费',
  `T_RESV_TM_1` datetime DEFAULT NULL COMMENT '  预留日期字段1',
  `T_RESV_TM_2` datetime DEFAULT NULL COMMENT '  预留日期字段2',
  `T_RESV_TM_3` datetime DEFAULT NULL COMMENT '  预留日期字段3',
  `T_RESV_TM_4` datetime DEFAULT NULL COMMENT '  预留日期字段4',
  `T_RESV_TM_5` datetime DEFAULT NULL COMMENT '  预留日期字段5',
  `T_RESV_TM_6` datetime DEFAULT NULL COMMENT '  预留日期字段6',
  `T_RESV_TM_7` datetime DEFAULT NULL COMMENT '  预留日期字段7',
  `T_RESV_TM_8` datetime DEFAULT NULL COMMENT '  预留日期字段8',
  `T_RESV_TM_9` datetime DEFAULT NULL COMMENT '  预留日期字段9',
  `T_RESV_TM_10` datetime DEFAULT NULL COMMENT '  预留日期字段10',
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  记录唯一标识号,投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID，如为新增记录则为批改申请单的PKID',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `SYS_C00613441` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_applicant`
--

DROP TABLE IF EXISTS `web_ri_app_applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_applicant` (
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保人代码,投保人唯一客户代码',
  `C_APP_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保人名称',
  `C_CERTF_CLS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '证件类型',
  `C_CERTF_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `C_CLNT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户分类,客户分类,0 法人，1 个人',
  `C_CUS_LVL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户等级',
  `C_STK_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '股东客户标志',
  `C_TRD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '行业代码',
  `C_SUB_TRD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '行业细分代码',
  `C_CNTR_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系人,投保人联系人',
  `C_TEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '固定电话,电话',
  `C_MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '移动电话',
  `C_COUNTRY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '国家',
  `C_PROVINCE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '省份',
  `C_CITY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '地市',
  `C_COUNTY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '县',
  `C_SUFFIX_ADDR` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '街',
  `C_CLNT_ADDR` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `C_ZIP_CDE` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `C_EMAIL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'EMAIL',
  `C_WORK_DPT` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '工作单位',
  `C_MRG_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '婚姻状况代码,婚姻状况',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_FAX` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系传真',
  `N_APP_SUM` decimal(8,0) DEFAULT NULL COMMENT '投保人数',
  `C_APP_WAY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保方式',
  `N_JOB_SUM` decimal(8,0) DEFAULT NULL COMMENT '在职员工数',
  `N_RET_SUM` decimal(8,0) DEFAULT NULL COMMENT '退休员工数',
  `C_WORK_CTT` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '经营内容',
  `C_APP_DPT_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保部门',
  `C_WORK_AREA` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域',
  `C_WEB_ADDR` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '单位网址',
  `C_RESV_TXT_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '字符预留1',
  `C_RESV_TXT_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '字符预留2',
  `N_RESV_NUM_1` decimal(8,0) DEFAULT NULL COMMENT '数字预留1',
  `N_RESV_NUM_2` decimal(8,0) DEFAULT NULL COMMENT '数字预留2',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `C_REL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '与被保人关系',
  `C_CUS_RISK_LVL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户风险等级,新客户、普通客户等',
  `C_SEX` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `C_OCCUP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '职业代码',
  `T_BIRTHDAY` datetime DEFAULT NULL COMMENT '出生日期',
  `T_CERTF_END_DATE` datetime DEFAULT NULL COMMENT '证件有效期止',
  `C_LEGAL_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法定代表人姓名',
  `C_LEGAL_CERTF_CLS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法定代表人证件类型',
  `C_LEGAL_CERTF_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法定代表人证件号码',
  `T_LEGAL_CERTF_END_TM` datetime DEFAULT NULL COMMENT '法定代表人证件有效期限',
  `C_RESV_TXT_12` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段12',
  `C_ORGANIZATION_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '组织机构代码',
  `C_ORG_VALID` datetime DEFAULT NULL COMMENT '组织机构代码有效期',
  `C_BUSLICENCE_VALID` datetime DEFAULT NULL COMMENT '营业执照号有效期',
  `C_LEGAL_REP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法人代表',
  `C_IDENTIFICATION_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法人代表证件号码',
  `C_CERTIFICATE_VALID` datetime DEFAULT NULL COMMENT '法人代表证件号码有效期',
  `C_IDENTIFICATION_NO_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法人代表证件类型',
  `C_CEVENUE_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '税务登记号',
  `C_MANAGE_AREA` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '经营范围',
  `C_CUST_RISK_RANK` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '反洗钱客户风险等级',
  `C_CERT_VALID` datetime DEFAULT NULL COMMENT '税务有效期',
  `C_RESV_TXT_3` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '营业执照号',
  `C_RESV_TXT_4` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段4',
  `C_RESV_TXT_5` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段5',
  `C_RESV_TXT_6` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段6',
  `C_RESV_TXT_7` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段7',
  `C_RESV_TXT_8` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段8',
  `C_RESV_TXT_9` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段9',
  `C_RESV_TXT_10` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段10',
  `C_RESV_TXT_11` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段11',
  `C_RESV_TXT_13` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段13',
  `N_RESV_NUM_3` decimal(8,0) DEFAULT NULL COMMENT '数字预留3',
  `N_RESV_NUM_4` decimal(8,0) DEFAULT NULL COMMENT '数字预留4',
  `N_RESV_NUM_5` decimal(8,0) DEFAULT NULL COMMENT '数字预留5',
  `N_RESV_NUM_6` decimal(8,0) DEFAULT NULL COMMENT '数字预留6',
  `N_RESV_NUM_7` decimal(8,0) DEFAULT NULL COMMENT '数字预留7',
  `N_RESV_NUM_8` decimal(8,0) DEFAULT NULL COMMENT '数字预留8',
  `C_APP_CATE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保人类别',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_APP_APPLICANT` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB_APP_APPLICANT申请单投保人';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_base`
--

DROP TABLE IF EXISTS `web_ri_app_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_base` (
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '申请单据类型, A  投保单, E 批改申请单, Q 报价单, O 开口保单',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保单号,保单号 Policy No',
  `N_EDR_PRJ_NO` decimal(6,0) DEFAULT NULL COMMENT '批改序号,批改次数 Times of Endorsement',
  `C_REL_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '关联保单号,依赖关联保单号 ，如财产险与利损险，车险商业与交强险',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品代码,产品代码 Product Code',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '机构代码,机构代码 Department No',
  `C_SLS_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '业务员',
  `C_BSNS_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '业务来源,业务来源 Source Type of Business',
  `C_BSNS_SUBTYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '业务来源细分,业务来源细分 Source Subtype of Business',
  `C_BRKR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '代理人/经纪人,代理人/经纪人 Agent/Broker No',
  `C_AGT_AGR_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '代理协议或合作协议号,代理协议或合作协议号 Agency Agreement No',
  `N_SUB_CO_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '补充协议号,补充协议号 Supplemental Agreement No',
  `C_OC_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预约保单号,开口保单业务的预约保单号',
  `N_DISC_RATE` decimal(10,6) DEFAULT NULL COMMENT '折扣率,整张单的折扣率',
  `N_RATE` decimal(10,6) DEFAULT NULL COMMENT '费率,整张保单的费率',
  `N_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '手续费比例,手续费比例 Proportion of Commission to Premium',
  `C_RENEW_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '续保标志,续保标志: 0 新保; 1 续保 Renewal Flag',
  `C_ORIG_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '原保单号,续保单上年保单号 Original Policy No of Renewal',
  `C_ORIG_INSURER` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '原保险公司,上年保险公司 Former Insurer',
  `C_AMT_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保额币种,保额币种 Currency of Amount {Code}',
  `N_AMT` decimal(20,2) DEFAULT NULL COMMENT '保额合计,保额合计 Amount Insured',
  `N_AMT_RMB_EXCH` decimal(10,6) DEFAULT NULL COMMENT '保额币种汇率',
  `C_PRM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保费币种,保费币种 Currency of Premium',
  `N_CALC_PRM` decimal(20,2) DEFAULT NULL COMMENT '计算保费合计,计算保费合计,系统自动计算的保费金额',
  `N_PRM` decimal(20,2) DEFAULT NULL COMMENT '保费合计,保费合计 Premium',
  `N_PRM_RMB_EXCH` decimal(10,6) DEFAULT NULL COMMENT '保费币种汇率,保费人民币汇率',
  `N_INDEM_LMT` decimal(20,2) DEFAULT NULL COMMENT '赔偿限额合计,赔偿限额合计 Limits of Idemnity',
  `C_RATIO_TYP` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '短期费率方式,短期费率方式 Part-term Rate Type',
  `N_RATIO_COEF` decimal(10,6) DEFAULT NULL COMMENT '短期系数,短期系数 Part-term Coefficient',
  `N_SAVING_AMT` decimal(20,2) DEFAULT NULL COMMENT '储金,储金  Amount of Saving Fund',
  `C_PLY_STS` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保单状态,保单状态 Policy Status，标识为正常还是注退',
  `T_TERMN_TM` datetime DEFAULT NULL COMMENT '保单终止时间,保单终止时间 Time of Policy Termination，初始为保险止期，注退后填上注退时间',
  `C_INWD_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '分入业务标志,分入业务标志( 0 非分入; 1 分入) Reinsurance Inward Flag',
  `C_CI_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '共保标志,共保标志( 0 非共保 1 共保) Coinsurance Flag',
  `C_CI_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '共保方式,共保方式代码 Coinsurance Type {Code}',
  `N_CI_JNT_AMT` decimal(20,2) DEFAULT NULL COMMENT '共保总保额,共保总保额 Joint Amount of Coinsurance',
  `N_CI_JNT_PRM` decimal(20,2) DEFAULT NULL COMMENT '共保总保费,共保总保费 Joint Premium of Coinsurance',
  `C_LONG_TERM_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '多年期标志,多年期标志( 0 短期; 1 多年期) Long Term Flag',
  `T_APP_TM` datetime DEFAULT NULL COMMENT '投保日期,投保日期 Applying Time',
  `C_OPR_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保单号生成方式,保单号生成方式, 0  自动, 1  手动',
  `C_PRN_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '印刷号,印刷号 Print No',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '保险起期,保险起期 Policy Effective Date',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '保险止期,保险止期 Policy Expire Date',
  `C_TM_SYS_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '时制,时制(0-24时/12-12时) Time System Code (0-24hr/12-12hr)',
  `C_UNFIX_SPC` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '非固定特别约定,非固定特别约定 Unfixed Special Provision',
  `C_MULT_INSRNT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '多被保人标志, 0 否  , 1 是',
  `C_GRP_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '团单标志,团单标志( 0 个单; 1 团单) Group Insurance Flag',
  `C_LISTORCOL_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '清单或汇总标志,清单/汇总标志( 0 输入清单, 1 输入汇总  ; )，人身险需要',
  `C_MASTER_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '统括保单标志,统括保单标志 Master Policy Flag',
  `C_BID_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投标业务标志',
  `C_PKG_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '保险套餐标志, 0 否, 1 是',
  `C_PKG_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保险套餐编号,一揽子编号 Package Business Flag',
  `N_PRM_DISC` decimal(10,6) DEFAULT NULL COMMENT '套餐优折扣',
  `C_REG_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '记名标志,记名标志: 0 不记名; 1 记名 Registered Flag',
  `C_DEC_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '法定申报标志,法定申报标志(0非申报;1申报) Legal Declaration Flag',
  `C_JURI_CDE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '司法管辖代码,司法管辖代码 Jurisdition Code',
  `C_AGRI_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '涉农标志,涉农标志  Agriculture Related Flag',
  `C_FOREIGN_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '境内外标志,境内外标志(0:境内;1:境外) Domestic/Foreign Flag',
  `C_IMPOREXP_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '进出口标志',
  `C_MANUAL_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '手工出单标志,手工出单标志(0非手工1手工)',
  `C_INST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '分期付款标志,分期付款标志 Installment Flag',
  `C_VIP_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT 'VIP标志,VIP标志 VIP Flag',
  `C_OPEN_COVER_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预约协议,预约协议 Open Cover No',
  `C_DISPT_STTL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '争议解决方式,诉讼方式 Dispute settle method {Code}',
  `C_DISPT_STTL_ORG` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '仲裁机构,仲裁机构  Dispute settle Organ',
  `C_OPR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '操作员代码,操作员代码 Operator s No',
  `T_OPR_TM` datetime DEFAULT NULL COMMENT '操作日期,操作日期 Operate Time',
  `C_CHK_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '复核人代码,复核人代码 Checker s No',
  `T_ISSUE_TM` datetime DEFAULT NULL COMMENT '签单日期,签单日期 Issue Time',
  `T_UDR_TM` datetime DEFAULT NULL COMMENT '核保日期,核保日期 Underwrite Time',
  `C_UDR_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '核保机构,核保机构 Underwriting Department No',
  `C_UDR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '核保人代码,核保人代码 Underwriter s No',
  `C_UDR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '核保标志',
  `C_RI_FAC_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '临分标志,临分标志 Facultative Reinsurance Flag',
  `C_RI_CHK_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '再保审核人代码,再保审核人代码 Reinsurance Approver s No',
  `C_RI_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '再保确认标志,再保确认标志 Reinsurance Approved Flag',
  `T_NEXT_EDR_BGN_TM` datetime DEFAULT NULL COMMENT '下次批改生效起期,批改生效起期 Beginning of Successive Edorsement  Effective Time',
  `T_NEXT_EDR_END_TM` datetime DEFAULT NULL COMMENT '下次批改生效止期,批改生效止期 End of Successive Edorsement Effective Time',
  `T_NEXT_EDR_UDR_TM` datetime DEFAULT NULL COMMENT '下次批改核保日期,下次批改核保日期 Underwriting Time of Endorsement in Succession',
  `C_REMARK` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '备注,备注 Remark',
  `C_APP_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '申请单状态,申请单状态 1;//暂存(录入，未提核) 2;//已提核 3;//核保退回 4;//已核保 5;//已签发保单 9; //已拒保',
  `T_EDR_APP_TM` datetime DEFAULT NULL COMMENT '批改申请日期',
  `T_EDR_BGN_TM` datetime DEFAULT NULL COMMENT '批改生效起期',
  `T_EDR_END_TM` datetime DEFAULT NULL COMMENT '批改生效止期',
  `C_EDR_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批改申请标志,申请类型,0 客户申请 1 内部批单，',
  `C_EDR_TYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批改类型,批改类型,1 一般批改，2 注销，3退保 0 批单注销',
  `C_EDR_RSN_BUNDLE_CDE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批改原因或组合代码',
  `N_BEF_EDR_PRJ_NO` decimal(6,0) DEFAULT NULL COMMENT '批改前序号,批改业务原保单记录序批改号 Predecessor Endorsement Prj No',
  `N_BEF_EDR_AMT` decimal(20,2) DEFAULT NULL COMMENT '批改前保额',
  `N_BEF_EDR_PRM` decimal(20,2) DEFAULT NULL COMMENT '批改前保费',
  `N_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '保额变化,保额变化，批单保额-上一批单（保单）保额',
  `N_CALC_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '计算保费变化',
  `N_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '保费变化,保费变化，批单保费上一批单（保单）保费',
  `N_INDEM_LMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '赔偿限额变化',
  `C_APP_PRSN_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '申请人代码',
  `C_APP_PRSN_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '申请人名称',
  `C_EDR_CTNT` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '批文内容',
  `C_RESV_TXT_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符字段1,预留 Reserved Field',
  `C_RESV_TXT_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符字段2,预留 Reserved Field',
  `C_RESV_TXT_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符字段3,预留 Reserved Field',
  `C_RESV_TXT_4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符字段4,预留 Reserved Field',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人代码',
  `T_CRT_TM` datetime DEFAULT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人代码',
  `T_UPD_TM` datetime DEFAULT NULL COMMENT '修改时间',
  `N_ORIG_TIMES` decimal(4,0) DEFAULT NULL COMMENT '续保次数',
  `C_FIN_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收费方式',
  `N_MAX_FEE_PROP` decimal(10,6) DEFAULT NULL COMMENT '费用最高比例',
  `C_VIP_CUS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'VIP客户',
  `C_GRANT_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '经营单位',
  `C_DPT_ATTR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '部门属性',
  `C_SALEGRP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '销售团队',
  `C_SLS_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '业务员身份证号',
  `C_SLS_TEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '业务员联系电话',
  `C_SLS_NME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '业务员名称',
  `C_MIN_UNDR_DPT` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '最低核保机构',
  `C_MIN_UNDR_CLS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '最低核保级别',
  `C_FEE_CAL_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '费用计算基数',
  `C_RATE_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '费率码',
  `C_SAVE_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '留存标志',
  `N_BEF_EDR_SAVING` decimal(20,2) DEFAULT NULL COMMENT '批改前储金',
  `N_SAVING_VAR` decimal(20,2) DEFAULT NULL COMMENT '储金变化',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `C_COMMON_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '大客户标志',
  `C_IMMEFF_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '即时生效标志',
  `C_DATA_SRC` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_QUOTE_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `N_BASE_PRM` decimal(20,2) DEFAULT NULL COMMENT '应交基准保费',
  `N_ALL_PRM` decimal(20,2) DEFAULT NULL COMMENT '整期保费',
  `N_IRR_RATIO` decimal(20,2) DEFAULT NULL COMMENT '浮动率',
  `C_PROD_NO_OLD` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '老系统产品代码',
  `C_QUOTA_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否定额单 1 定额单 0 非定额单',
  `C_LARGE_BUSINESS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '大额交易标记 0非大额 1 是大额交易',
  `C_SUS_BUSINESS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '可疑交易标记 0非可疑交易 1是可疑交易 ',
  `C_CHA_TYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '渠道中级分类',
  `C_CHA_SUBTYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '渠道子类',
  `C_SUR_FORMULA` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '退保公式',
  `C_NOENDCLM_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '有在途赔案标记 1 有 0 没有',
  `N_TAX_AMT` decimal(20,2) DEFAULT '0.00' COMMENT '车船税-冗余字段',
  `T_REPSTOPEXT_BGN_TM` datetime DEFAULT NULL COMMENT '停驶起期',
  `T_REPSTOPEXT_END_TM` datetime DEFAULT NULL COMMENT '停驶展期',
  `C_REPSTOPEXT_RLE_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '报停展期的总天数',
  `T_REPSTOPEXT_LAST_END_TM` datetime DEFAULT NULL COMMENT '上次展期',
  `T_SRC_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '原始保单起期',
  `T_SRC_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '原始保单止期',
  `C_REPSTOPEXT_STATUS` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '停展状态 T停  Z展  N 非停展状态',
  `C_REPSTOPEXT_SRC_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '做报停展期批改前的最新投保单，如果是做第二此报停展期批改则还是原来的最新投保单号',
  `C_SLS_CDE_OLD` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '老系统业务员代码',
  `C_DPT_CDE_OLD` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '老系统承保机构代码',
  `C_EFFECTIVE_APP` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '有效申请单 标志1 有效 0/其他 无效',
  `C_BRK_SLS_CDE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '代理业务员',
  `C_TENDER_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '政府采购任务编码',
  `C_APPROVE_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保险公司审批人员代码',
  `C_PREFERENTIAL` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '减免信息',
  `N_COMMISSION_RATE_UPPER` decimal(20,2) DEFAULT NULL COMMENT '手续费支付比例上限(宁波手续费上传)',
  `C_TRD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '国民经济行业分类与代码',
  `C_JOINT_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联合投保号,为null是为非联合投保',
  `C_DDUCT_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '免赔说明(new)',
  `N_DDUCT_RATE` decimal(10,6) DEFAULT NULL COMMENT '免赔率(new)',
  `N_DDUCT_AMT` decimal(20,2) DEFAULT NULL COMMENT '绝对免赔额(new)',
  `C_RESV_TXT_6` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留 Reserved Field',
  `C_RESV_TXT_7` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留 Reserved Field',
  `C_RESV_TXT_8` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留 Reserved Field',
  `C_RI_FAC_OPN` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '临分意见',
  `N_CI_OWN_AMT` decimal(20,2) DEFAULT NULL COMMENT '共保我司净保额',
  `N_CI_OWN_PRM` decimal(20,2) DEFAULT NULL COMMENT '共保我司净保费',
  `C_CI_INP_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '[共保]录单方式',
  `C_CI_PRI_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '[共保]单证打印方式',
  `C_RESV_TXT_5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_AREA_FLAG` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '地区标识',
  `C_CERTF_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '代理业务跟单销售人员职业证号',
  `C_NEEDFEE_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '是否规定见费出单标志 0 否 1 是',
  `C_CANCLFEE_FLG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT ' 特殊取消见费出单标志 0 否 1 是',
  `C_CANCLFEERSN_CDE` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT ' 特殊取消见费出单原因',
  `T_LAST_BILL_DATE` datetime DEFAULT NULL COMMENT '上张保单签单日期',
  `T_LAST_START_DATE` datetime DEFAULT NULL COMMENT '上张保单起保日期/浮动因素计算期间起期',
  `T_LAST_END_DATE` datetime DEFAULT NULL COMMENT '上张保单终保日期/浮动因素计算区间止期',
  `T_RUN_BGN_TM` datetime DEFAULT NULL COMMENT '追溯起期',
  `T_RUN_END_TM` datetime DEFAULT NULL COMMENT '追溯止期',
  `C_UNFIX_SPC_CHANGE` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否修改特别约定（是否走自核）：0-否；1-是；',
  `C_UNFIX_SPC_HIDDEN` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '隐藏特别约定',
  `C_DANZHENG_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '单证类型',
  `N_SURR_RATE` decimal(20,2) DEFAULT NULL COMMENT '注销手续费率',
  `C_MONITOR_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '时间监控ID',
  `N_RESV_NUM_1` decimal(20,2) DEFAULT NULL COMMENT '预留数值字段1',
  `N_RESV_NUM_2` decimal(20,2) DEFAULT NULL COMMENT '预留数值字段2',
  `N_RESV_NUM_3` decimal(20,2) DEFAULT NULL COMMENT '预留数值字段3',
  `N_CHARGE_PRM` decimal(20,2) DEFAULT NULL COMMENT '换算保额(人民币)',
  `C_QUICK_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否快速出单：0-否；1-是；',
  `C_ISLOG_BACK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否ilog返回修改，1为ilog返回修改，0为自核通过，或者自核转人工',
  `C_BRK_SLS_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '代理业务员名称',
  `C_UNFIX_SPC_ILOG` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '特别约定按照:特约编号---特约内容###特约编号---特约内容,传递给ilog',
  `C_QTE_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '申请单据类型, X  报价单转投保单',
  `C_UNDR_OPN` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'ilog申请核保返回修改原因',
  `C_EDR_RATIO_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批改短期费率类型',
  `N_FUND_RATE` decimal(20,2) DEFAULT NULL COMMENT '计提救助基金比例',
  `N_FUND_AMOUNT` decimal(20,2) DEFAULT NULL COMMENT '计提救助基金金额',
  `C_PKG_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_PKG_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_MARKET_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_AGREE_START_TM` datetime DEFAULT NULL COMMENT '协议（大保单）起期',
  `T_AGREE_STOP_TM` datetime DEFAULT NULL COMMENT '协议（大保单）止期',
  `C_AGREEMENT_DAYS` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '协议天数',
  `C_WATER_MARK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否涉水涉海 0否，1是',
  `C_OC_AGR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '开口保单协议号',
  `C_SPEC_NO` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '特别约定序号集',
  `C_INTRO_DPTCDE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '服务机构',
  `C_RECEI_TITLE_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发票抬头',
  `C_RECEI_TITLE_NME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发票标题',
  `C_COUNTRY_FLAG` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '县/区',
  `C_APP_AREA_CODE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '指定查询区域',
  `C_PURE_PRM_FLAG` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '纯风险保费标识',
  `C_RECEI_HS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Y为回收发票，N未回收（发票丢失）',
  `C_CITY` varchar(30) DEFAULT NULL,
  `c_province` varchar(30) DEFAULT NULL COMMENT '省',
  `c_paper_mrk` varchar(1) DEFAULT NULL COMMENT '是否需要纸质保单及发票,0：不需要 ，1：需要',
  `c_send_per` varchar(100) DEFAULT NULL COMMENT '配送人',
  `c_send_mobile` varchar(100) DEFAULT NULL COMMENT '配送人电话',
  `c_send_addr` varchar(200) DEFAULT NULL COMMENT '配送地址',
  `C_PRE_NO` varchar(50) DEFAULT NULL COMMENT '无单预收',
  `C_ORDER_NO` varchar(50) DEFAULT NULL,
  `N_VAT` decimal(20,2) DEFAULT NULL COMMENT '税',
  `N_PRICE` decimal(20,2) DEFAULT NULL COMMENT '价',
  `N_VAT_VAR` decimal(20,2) DEFAULT NULL COMMENT '税变化量',
  `N_PRICE_VAR` decimal(20,2) DEFAULT NULL COMMENT '价变化量',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_APP_BASE` (`C_APP_NO`),
  KEY `IDX_APPBASE_APPTM` (`T_APP_TM`),
  KEY `IDX_APPBASE_CRESVTXT2` (`C_RESV_TXT_2`),
  KEY `IDX_APPBASE_EDRAPPTM` (`T_EDR_APP_TM`),
  KEY `IDX_APPBASE_PLYNO` (`C_PLY_NO`),
  KEY `IDX_APP_BASE_C_DPT_CDE` (`C_DPT_CDE`),
  KEY `UI_APPBASE_PROD` (`C_PROD_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_bnfc`
--

DROP TABLE IF EXISTS `web_ri_app_bnfc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_bnfc` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  记录唯一标识号,投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID，如为新增记录则为批改申请单的PKID',
  `N_SEQ_NO` decimal(6,0) DEFAULT '1' COMMENT '  序号',
  `C_BNFC_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  受益人代码,投保人唯一客户代码',
  `C_BNFC_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  受益人名称,投保人名称',
  `C_INSURED_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  被保人编号,被保险人',
  `C_REL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  与被保人关系',
  `C_BENF_ORD` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  受益顺序',
  `N_BENF_PROP` decimal(10,6) DEFAULT NULL COMMENT '  受益比例,受费比例',
  `C_CERTF_CLS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  证件类型',
  `C_CERTF_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  证件号码',
  `C_SEX` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  性别',
  `T_BIRTHDAY` datetime DEFAULT NULL COMMENT '  出生日期,出生年月',
  `C_CLNT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  客户分类,客户分类,0 法人，1 个人',
  `C_CUS_LVL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  客户等级',
  `C_STK_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  股东客户标志',
  `C_CNTR_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  联系人',
  `C_TEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  固定电话',
  `C_MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  移动电话',
  `C_SUFFIX_ADDR` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  街',
  `C_COUNTY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  县',
  `C_CITY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  地市',
  `C_PROVINCE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  省份',
  `C_COUNTRY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  国家',
  `C_ADDR` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  联系地址,地址',
  `C_ZIP_CDE` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  联系地址邮编,邮编',
  `C_EMAIL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  电子邮箱,EMAIL',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_RESV_TXT_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_APP_BNFC` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_ci`
--

DROP TABLE IF EXISTS `web_ri_app_ci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_ci` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  记录唯一标识号,投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID，如为新增记录则为批改申请单的PKID',
  `N_SEQ_NO` decimal(6,0) NOT NULL,
  `C_CI_AGRMNT_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  共保协议号',
  `C_MAJOR_AGRMNT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  主从协议标志',
  `C_COINSURER_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  共保人',
  `C_CHIEF_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  主共标志',
  `C_ISSUE_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  出单标志,出单机构标志',
  `N_CI_SHARE` decimal(10,6) DEFAULT NULL COMMENT '  共保比例',
  `N_CI_AMT` decimal(20,2) DEFAULT NULL COMMENT '  共保保额',
  `N_CI_RATE` decimal(10,6) DEFAULT NULL COMMENT '  共保费率',
  `N_CI_PRM` decimal(20,2) DEFAULT NULL COMMENT '  共保保费',
  `N_COMM` decimal(20,2) DEFAULT NULL COMMENT '  代理经纪费',
  `N_PLY_FEE` decimal(20,2) DEFAULT NULL COMMENT '  出单及相关费用',
  `N_CI_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '  保额变化',
  `N_CI_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '  保费变化',
  `N_COMM_VAR` decimal(20,2) DEFAULT NULL COMMENT '  代理经纪费变化',
  `N_PLY_FEE_VAR` decimal(20,2) DEFAULT NULL COMMENT '  出单费变化',
  `C_SELF_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  本公司标志,表示本公司',
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_CI_SUB_COMP` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '共保子公司',
  `C_DPT_MRK` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `N_PLY_FEE_RATE` decimal(10,6) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_APP_CI` (`C_PK_ID`),
  KEY `UI_APP_CI` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_cvrg`
--

DROP TABLE IF EXISTS `web_ri_app_cvrg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_cvrg` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '记录唯一标识号,投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID， 如为新增记录则为批改申请单的PKID',
  `N_SEQ_NO` decimal(6,0) NOT NULL,
  `C_CVRG_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '险别（扩展条款）编号,险别（扩展条款）编号 Coverage Code',
  `C_CUST_CVRG_NME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '自定义险别名称,自定义险别名称 Customized Coverage Name',
  `C_CUST_CL_CTNT` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '自定义条款内容,自定义条款内容 Customized Clause Content',
  `N_AMT` decimal(20,2) DEFAULT NULL COMMENT '保额,保额 Amount Insured',
  `N_RATE` decimal(20,6) DEFAULT NULL COMMENT '费率,费率 Premium Rate',
  `N_BASE_PRM` decimal(20,2) DEFAULT '0.00' COMMENT '基本保费,基本保费 Base Premium',
  `N_BEF_PRM` decimal(20,2) DEFAULT NULL COMMENT '折前保费,折前保费 Premium without Discount',
  `N_DIS_COEF` decimal(10,6) DEFAULT '1.000000' COMMENT '折扣系数,优惠系数 Discount Coefficient',
  `N_CALC_PRM` decimal(20,2) DEFAULT NULL COMMENT '折后保费,计算保费 Calculated Premium',
  `N_PRM` decimal(20,2) DEFAULT NULL COMMENT '实际保费,保费 Premium',
  `N_BEF_ANN_PRM` decimal(20,2) DEFAULT NULL COMMENT '年折前保费,年折前保费 Annual Premium without Discount',
  `N_CALC_ANN_PRM` decimal(20,2) DEFAULT NULL COMMENT '年折后保费,年计算保费 Calculated Annual Premium',
  `T_PRM_CHG_TM` datetime DEFAULT NULL COMMENT '保费变化时间,保费变化时间，缺省为保单起保日期',
  `N_DUT_PRM` decimal(20,2) DEFAULT NULL COMMENT '变化前已了责任保费,已了责任保费，缺省为0',
  `C_REMARK` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '备注,备注 Remark',
  `C_TGT_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '标的类型代码,标的类型代码 Subject-matter Type',
  `C_TGT_NME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '标的名称,标的名称 Subject-matter Name',
  `N_TGT_QTY` decimal(8,0) DEFAULT NULL COMMENT '标的数量,标的数量 Quantity of Subject-matters',
  `N_INDEM_LMT` decimal(20,2) DEFAULT NULL COMMENT '赔偿限额,赔偿限额 Indemnity Limit',
  `C_DDUCT_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '不计免赔标志, 0  否, 1  是',
  `N_DDUCT_RATE` decimal(10,6) DEFAULT NULL COMMENT '免赔率,免赔率 Deductable Rate',
  `C_DDUCT_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '免赔说明,免赔说明 Deductable Description',
  `N_DDUCT_AMT` decimal(20,2) DEFAULT NULL COMMENT '绝对免赔额,绝对免赔额 Straight Deductible Amount',
  `C_CANCEL_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '退保标志,退保标志 Cancel Flag，缺省为 1 ，当批改退保时为‘0’',
  `C_INDEM_LMT_LVL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT ' 赔偿限额档次,赔偿限额档次(车险) Level of Indemnity Limit,起付限额[063013产品]',
  `N_LIAB_DAYS_LMT` decimal(4,0) DEFAULT NULL COMMENT '责任天数,责任时限(车险) Days Limit of Liability',
  `N_PER_AMT` decimal(20,2) DEFAULT NULL COMMENT '每标的保额,每标的保额  Amount for Each Subject-matter',
  `N_PER_INDEM_LMT` decimal(20,2) DEFAULT NULL COMMENT '每标的赔偿限额,每标的赔偿限额 Indemnity Limit for Each Subject-matter',
  `N_PER_PRM` decimal(20,2) DEFAULT NULL COMMENT '每标的保费,每标的保费 Premium for Each Subject-matter',
  `N_ONCE_INDEM_LMT` decimal(20,2) DEFAULT NULL COMMENT '单次赔偿限额,单次赔偿限额 Indemnity Limit for Any One Claim',
  `N_SAVING_AMT` decimal(20,2) DEFAULT NULL COMMENT '储金,储金 Amount of Saving Fund',
  `T_BGN_TM` datetime DEFAULT NULL COMMENT '有效起期,险别的有效起期，保单为保单的保险起期，批单为批单的生效起期',
  `T_END_TM` datetime DEFAULT NULL COMMENT '有效止期,险别的有效起期，保单为保单的保险止期，批单为批单的生效止期',
  `N_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '保额变化',
  `N_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '保费变化',
  `N_CALC_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '计算保费变化,计算保费 Calculated Premium',
  `N_INDEM_VAR` decimal(20,2) DEFAULT NULL COMMENT '赔偿限额变化',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_RESV_TXT_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段1,预留',
  `C_RESV_TXT_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段2,预留',
  `C_RESV_TXT_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段3,预留',
  `C_RESV_TXT_4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段4,预留',
  `C_RESV_TXT_5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段5,预留',
  `C_RESV_TXT_6` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段6,预留',
  `C_RESV_TXT_7` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段7,预留',
  `C_RESV_TXT_8` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段8,预留',
  `C_RESV_TXT_9` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段9,预留',
  `C_RESV_TXT_10` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段10,预留',
  `C_RESV_TXT_11` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段11,预留',
  `C_RESV_TXT_12` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段12,预留',
  `C_RESV_TXT_13` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段13,预留',
  `C_RESV_TXT_14` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段14,预留',
  `C_RESV_TXT_15` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '预留字符串字段15,预留',
  `C_RESV_TXT_16` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段16,预留',
  `C_RESV_TXT_17` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段17,预留',
  `C_RESV_TXT_18` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段18,预留',
  `C_RESV_TXT_19` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段19,预留',
  `C_RESV_TXT_20` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段20,预留',
  `C_RESV_TXT_21` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段21,预留',
  `C_RESV_TXT_22` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段22,预留',
  `C_RESV_TXT_23` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段23,预留',
  `C_RESV_TXT_24` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段24,预留',
  `C_RESV_TXT_25` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段25,预留',
  `C_RESV_TXT_26` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段26,预留',
  `C_RESV_TXT_27` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段27,预留',
  `C_RESV_TXT_28` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段28,预留',
  `C_RESV_TXT_29` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段29,预留',
  `C_RESV_TXT_30` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段30,预留',
  `N_RESV_NUM_1` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段1,预留',
  `N_RESV_NUM_2` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段2,预留',
  `N_RESV_NUM_3` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段3,预留',
  `N_RESV_NUM_4` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段4,预留',
  `N_RESV_NUM_5` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段5,预留',
  `N_RESV_NUM_6` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段6,预留',
  `N_RESV_NUM_7` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段7,预留',
  `N_RESV_NUM_8` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段8,预留',
  `N_RESV_NUM_9` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段9,预留',
  `N_RESV_NUM_10` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段10,预留',
  `N_RESV_NUM_11` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段11,预留',
  `N_RESV_NUM_12` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段12,预留',
  `N_RESV_NUM_13` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段13,预留',
  `N_RESV_NUM_14` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段14,预留',
  `N_RESV_NUM_15` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段15,预留',
  `N_RESV_NUM_16` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段16,预留',
  `N_RESV_NUM_17` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段17,预留',
  `N_RESV_NUM_18` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段18,预留',
  `N_RESV_NUM_19` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段19,预留',
  `N_RESV_NUM_20` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段20,预留',
  `N_RESV_NUM_21` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段21,预留',
  `N_RESV_NUM_22` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段22,预留',
  `N_RESV_NUM_23` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段23,预留',
  `N_RESV_NUM_24` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段24,预留',
  `N_RESV_NUM_25` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段25,预留',
  `N_RESV_NUM_26` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段26,预留',
  `N_RESV_NUM_27` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段27,预留',
  `N_RESV_NUM_28` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段28,预留',
  `N_RESV_NUM_29` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段29,预留',
  `N_RESV_NUM_30` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段30,预留',
  `T_RESV_TM_1` datetime DEFAULT NULL COMMENT '预留时间字段1,预留',
  `T_RESV_TM_2` datetime DEFAULT NULL COMMENT '预留时间字段2,预留',
  `T_RESV_TM_3` datetime DEFAULT NULL COMMENT '预留时间字段3,预留',
  `T_RESV_TM_4` datetime DEFAULT NULL COMMENT '预留时间字段4,预留',
  `T_RESV_TM_5` datetime DEFAULT NULL COMMENT '预留时间字段5,预留',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `N_DDUCT_PRM` decimal(20,2) DEFAULT NULL COMMENT '不计免赔保费',
  `C_UNDER_INSURANCE_FLAG` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '不足额投保标志:0:足额投保,1:不足额投保',
  `C_CVRG_NO_OLD` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '老系统险别代码',
  `N_FLOAT_RATE` decimal(20,6) DEFAULT NULL COMMENT '浮动率',
  `N_EXEM_PERIOD` decimal(6,0) DEFAULT NULL COMMENT '免责期（天）',
  `C_PLAN_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '方案号',
  `C_FORMULA` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'CFormula保费计算过程  C_FORMULA',
  `N_PRM_ZB` decimal(20,2) DEFAULT NULL COMMENT '分入全单保费',
  `N_COMPEN_RATE` decimal(20,2) DEFAULT NULL COMMENT '赔付比例',
  `C_ADD_MRK` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '增加险别标志',
  `C_GLASS_TYP` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '玻璃单独破碎险-玻璃类型',
  `N_AMT_ZB` decimal(20,2) DEFAULT NULL COMMENT '分入全单保额',
  `IF_BY_RATIOCOEF` decimal(2,0) DEFAULT NULL COMMENT '是否需要乘短期费率系数',
  `C_EXT_AREA_RAD` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展区域半径 字段（机动车出境保险 使用）',
  `C_ACCIDENT_TYP` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '事故类型 字段（约定区域通行费特约 使用）',
  `C_AGREEMENT_RATIO` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '协定比例 字段（新车特约A，新车特约B 使用）',
  `C_DDUCT_MONEY_MRK` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '添加 免赔额标记 字段（可选不计免赔 使用）',
  `N_AUTO_CHE_COEF` decimal(10,6) DEFAULT NULL COMMENT '自主核保系数',
  `N_DDUCT_BEF_PRM` decimal(20,6) DEFAULT NULL COMMENT '不计免赔折前保费',
  `N_DDUCT_PRM_VAR` decimal(20,6) DEFAULT NULL COMMENT '不计免赔变化值',
  `N_FRANCHISE_RATE` decimal(20,6) DEFAULT NULL COMMENT '可选免赔额费率',
  `N_BASE_PURE_PRM` decimal(20,6) DEFAULT NULL COMMENT '基准纯风险保费',
  `N_ORIG_VAT` decimal(20,2) DEFAULT NULL COMMENT '原保单税金额',
  `N_ORIG_PRICE` decimal(20,2) DEFAULT NULL COMMENT '原保单价金额',
  `N_ORIG_VAT_VAR` decimal(20,2) DEFAULT NULL COMMENT '原保单税变化量',
  `N_ORIG_PRICE_VAR` decimal(20,2) DEFAULT NULL COMMENT '原保单价变化量',
  `N_OWN_VAT` decimal(20,2) DEFAULT NULL COMMENT '我司税金额',
  `N_OWN_PRICE` decimal(20,2) DEFAULT NULL COMMENT '我司价金额',
  `N_OWN_VAT_VAR` decimal(20,2) DEFAULT NULL COMMENT '我司税变化量',
  `N_OWN_PRICE_VAR` decimal(20,2) DEFAULT NULL COMMENT '我司价变化量',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_APP_CVRG` (`C_PK_ID`),
  KEY `IDX_APPCVRG_APPNO` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_ent_tgt`
--

DROP TABLE IF EXISTS `web_ri_app_ent_tgt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_ent_tgt` (
  `C_PK_ID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '  PKID',
  `C_APP_NO` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '  申请单号,批改申请单号',
  `C_ROW_ID` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '  记录唯一标识号,投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID，如为新增记录则为批改申请单的PKID',
  `N_SEQ_NO` decimal(6,0) NOT NULL COMMENT '  标的序号',
  `C_ADDR_SEC_1` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段1',
  `C_ADDR_SEC_2` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段2',
  `C_ADDR_SEC_3` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段3',
  `C_ADDR_SEC_4` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段4',
  `C_ADDR_SEC_5` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段5',
  `C_TGT_ADDR` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  标的地址',
  `C_TGT_ZIP` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '  标的邮编',
  `C_MATERIAL` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '  主要原料及辅料',
  `C_PROCESS_TECH` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '  生产工艺',
  `C_JURI_CDE` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  司法管辖',
  `C_TRD_CDE` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  行业类型',
  `C_SUB_TRD_CDE` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  行业细分',
  `C_BLD_TYP_CDE` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  建筑类型',
  `C_IMPKID_CDE` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  占用性质',
  `C_SAFETY_DEV_1_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  安全设施1,安全设施',
  `C_SAFETY_DEV_2_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  安全设施2,安全设施',
  `C_SAFETY_DEV_3_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  安全设施3,安全设施',
  `C_SAFETY_DEV_4_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  安全设施4,安全设施',
  `C_SAFETY_DEV_5_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  安全设施5,安全设施',
  `C_NEARBY_RIVER_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  临近河流标志',
  `C_NEARBY_WAY_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  临近公路标志',
  `C_NEARBY_FLAM_EXPLO_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  临近易燃易爆物标志,临近易燃易爆物标志 Nearby Flamable, Explosive Goods Flag',
  `C_NEARBY_OTHER_BLD_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  临近其它建筑物标志',
  `C_NCLM_DESC` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  免赔说明',
  `C_CUR_TYP` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  币种',
  `N_AMT` decimal(20,2) DEFAULT NULL COMMENT '  保额',
  `N_PRM` decimal(20,2) DEFAULT NULL COMMENT '  保费',
  `N_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '  保额变化,保额变化，批单保额-上一批单（保单）保额',
  `N_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '  保费变化,保费变化，批单保费上一批单（保单）保费',
  `T_CRT_TM` datetime NOT NULL COMMENT '  创建时间',
  `C_CRT_CDE` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '  创建人代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '  修改时间',
  `C_UPD_CDE` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '  修改人代码',
  `C_RESV_TXT_1` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留-文本1,预留',
  `C_RESV_TXT_2` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段2,预留',
  `C_RESV_TXT_3` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段3,预留',
  `C_RESV_TXT_5` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段5,预留',
  `C_RESV_TXT_6` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段6,预留',
  `C_RESV_TXT_7` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段7,预留',
  `C_RESV_TXT_8` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段8,预留',
  `C_RESV_TXT_9` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段9,预留',
  `C_RESV_TXT_10` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段10,预留',
  `C_RESV_TXT_20` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段20,预留',
  `N_RESV_NUM_1` decimal(20,6) DEFAULT NULL COMMENT '  预留-数值1,预留',
  `N_RESV_NUM_20` decimal(20,6) DEFAULT NULL COMMENT '  预留-数值20,预留',
  `T_RESV_TM_1` datetime DEFAULT NULL COMMENT '  预留-时间1,预留',
  `T_RESV_TM_10` datetime DEFAULT NULL COMMENT '  预留-时间10,预留',
  `N_RESV_NUM_2` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段2,预留',
  `N_RESV_NUM_3` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段3,预留',
  `N_RESV_NUM_4` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段4,预留',
  `N_RESV_NUM_5` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段5,预留',
  `N_RESV_NUM_6` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段6,预留',
  `N_RESV_NUM_7` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段7,预留',
  `N_RESV_NUM_8` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段8,预留',
  `N_RESV_NUM_9` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段9,预留',
  `N_RESV_NUM_10` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段10,预留',
  `T_RESV_TM_2` datetime DEFAULT NULL COMMENT '  预留-时间2,预留',
  `T_RESV_TM_3` datetime DEFAULT NULL COMMENT '  预留-时间3,预留',
  `C_RESV_TXT_4` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段4,预留',
  `C_RESV_TXT_13` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `C_TRANS_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_RESV_TXT_11` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段11预留',
  `C_RESV_TXT_12` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段12,预留',
  `C_RESV_TXT_14` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段14,预留',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_fee`
--

DROP TABLE IF EXISTS `web_ri_app_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_fee` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID， 如为新增记录则为批改申请单的PKID',
  `C_FEETYP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_FEE_PROP` decimal(10,6) DEFAULT NULL COMMENT '  费用比例',
  `N_FEE` decimal(20,2) NOT NULL,
  `N_GOT_PRM` decimal(20,2) DEFAULT NULL COMMENT '  N_GOT_PRM',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `N_UPD_FEE` decimal(20,2) DEFAULT NULL COMMENT '新费用金额',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `UI_APP_FEE` (`C_APP_NO`,`C_FEETYP_CDE`),
  UNIQUE KEY `PK_WEB_APP_FEE` (`C_PK_ID`),
  KEY `IDX_APPFEE_APPNO` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请单费用信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_grp_member`
--

DROP TABLE IF EXISTS `web_ri_app_grp_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_grp_member` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_SEQ_NO` decimal(8,0) NOT NULL,
  `C_PLY_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保单号',
  `N_EDR_PRJ_NO` decimal(6,0) DEFAULT NULL COMMENT '批改次数 Times of Endorsement',
  `C_OP_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '记录新增A、删除D、修改U标识',
  `C_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `C_CERT_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '证件类型',
  `C_CERT_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `C_OCCUP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '职业代码',
  `C_BNFC_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '受益人',
  `C_BNFC_CERT_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '受益人证件类型',
  `C_BNFC_CERT_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '受益人证件号码',
  `C_UDR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '核保标志',
  `T_UDR_TM` datetime DEFAULT NULL COMMENT '  核保时间',
  `T_BGN_TM` datetime DEFAULT NULL COMMENT '批改生效起期',
  `T_END_TM` datetime DEFAULT NULL COMMENT '批改生效止期',
  `T_NEXT_EDR_UDR_TM` datetime DEFAULT NULL COMMENT '  下次批改核保时间',
  `C_COUNTRY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  国籍',
  `C_OCCUP_SUB_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  职业细分',
  `C_WORK_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  工种',
  `C_WORK_LVL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  级别',
  `C_RESEV_FLD1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  文本预留1',
  `C_RESEV_FLD2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  文本预留2',
  `C_RESEV_FLD3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  文本预留3',
  `C_RESEV_FLD4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  文本预留4',
  `C_RESEV_FLD5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  文本预留5',
  `N_RESEV_FLD1` decimal(20,6) DEFAULT NULL COMMENT '投保险人年龄',
  `N_RESEV_FLD2` decimal(20,6) DEFAULT NULL COMMENT '  数字预留2',
  `N_RESEV_FLD3` decimal(20,6) DEFAULT NULL COMMENT '  数字预留3',
  `N_RESEV_FLD4` decimal(20,6) DEFAULT NULL COMMENT '  数字预留4',
  `N_RESEV_FLD5` decimal(20,6) DEFAULT NULL COMMENT '  数字预留5',
  `N_RESEV_FLD6` decimal(20,6) DEFAULT NULL COMMENT '  数字预留6',
  `N_RESEV_FLD7` decimal(20,6) DEFAULT NULL COMMENT '  数字预留7',
  `N_RESEV_FLD8` decimal(20,6) DEFAULT NULL COMMENT '  数字预留8',
  `N_RESEV_FLD9` decimal(20,6) DEFAULT NULL COMMENT '  数字预留9',
  `N_RESEV_FLD10` decimal(20,6) DEFAULT NULL COMMENT '  数字预留10',
  `N_RESEV_FLD11` decimal(20,6) DEFAULT NULL COMMENT '  数字预留11',
  `N_RESEV_FLD12` decimal(20,6) DEFAULT NULL COMMENT '  数字预留12',
  `N_RESEV_FLD13` decimal(20,6) DEFAULT NULL COMMENT '  数字预留13',
  `N_RESEV_FLD14` decimal(20,6) DEFAULT NULL COMMENT '  数字预留14',
  `N_RESEV_FLD15` decimal(20,6) DEFAULT NULL COMMENT '  数字预留15',
  `N_RESEV_FLD16` decimal(20,6) DEFAULT NULL COMMENT '  数字预留16',
  `N_RESEV_FLD17` decimal(20,6) DEFAULT NULL COMMENT '  数字预留17',
  `N_RESEV_FLD18` decimal(20,6) DEFAULT NULL COMMENT '  数字预留18',
  `N_RESEV_FLD19` decimal(20,6) DEFAULT NULL COMMENT '  数字预留19',
  `N_RESEV_FLD20` decimal(20,6) DEFAULT NULL COMMENT '  数字预留20',
  `T_RESEV_FLD1` datetime DEFAULT NULL COMMENT '  日期预留1',
  `T_RESEV_FLD2` datetime DEFAULT NULL COMMENT '  日期预留2',
  `T_RESEV_FLD3` datetime DEFAULT NULL COMMENT '  日期预留3',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  成员记录唯一ID,从投保单带过来的是投保单的PKID，对于批改新增的记录是上一张批单的PKID，需注意投保单的PKID与批单的PKID不能重复',
  `C_CLNT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '唯一客户号',
  `C_RESEV_FLD6` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RESEV_FLD7` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RESEV_FLD8` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RESEV_FLD9` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RESEV_FLD10` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_SUB_GRP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '子团单号',
  `C_GRP_TYPE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '分单类别',
  `C_BENF_DISTRIB` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '受益分配方式',
  `C_BENF_ORD` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '顺序号',
  `C_PLAN_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '方案号',
  `N_PRM` decimal(20,6) DEFAULT NULL COMMENT '合计保费',
  `N_BEND_PROP` decimal(20,6) DEFAULT NULL COMMENT '比例值',
  `C_RESEV_FLD11` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段11',
  `C_APP_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保人名称',
  `C_APP_CER_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保人证件类别',
  `C_APP_CERT_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保人证件号码',
  `C_RESEV_FLD12` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段12',
  `C_RESEV_FLD13` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段13',
  `C_MEDICAL_SIGN` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '医保标志',
  `C_MEDICAL_NO` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '医保卡编号',
  `C_PLY_PLAN_NO` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保险计划代码',
  `C_MEDICAL_LIAB` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否享有公共补充住院医疗保险责任',
  `C_RESEV_FLD14` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '与主被保险人关系',
  `C_BENF_DISTRIB2` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '受益分配方式类型',
  `C_ENROLLED_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '参保类型',
  `C_BENF_DISIGNATE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否指定受益人',
  `C_NME_EN` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '英文名',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_APPGRP_MEMBER` (`C_PK_ID`),
  UNIQUE KEY `UI_APP_GRP_MEMBER` (`C_APP_NO`,`N_SEQ_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团单成员信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_insured`
--

DROP TABLE IF EXISTS `web_ri_app_insured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_insured` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '记录唯一标识号,投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID， 如为新增记录则为批改申请单的PKID',
  `N_SEQ_NO` decimal(8,0) DEFAULT NULL COMMENT '序号',
  `C_INSURED_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '被保人编码',
  `C_INSURED_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '被保人名称',
  `C_INSURED_CLS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `C_REL_INSURED_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '副被保人对应主被保人代码',
  `C_CERTF_CLS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '证件类型',
  `C_CERTF_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `C_CLNT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户分类,0 法人，1 个人',
  `C_CUS_LVL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户等级',
  `C_STK_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '股东客户标志',
  `C_TRD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '行业代码',
  `C_SUB_TRD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '行业细分代码',
  `C_CNTR_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保人联系人',
  `C_TEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `C_MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '移动电话',
  `C_COUNTRY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '国家',
  `C_PROVINCE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '省份',
  `C_CITY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '地市',
  `C_COUNTY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '县',
  `C_SUFFIX_ADDR` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '街',
  `C_CLNT_ADDR` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `C_ZIP_CDE` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `C_EMAIL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'EMAIL',
  `C_RESID_ADDR` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '居住地址',
  `C_RESID_ZIP` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '居住地址邮编',
  `C_WORK_DPT` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '工作单位',
  `C_WORK_DPT_ADDR` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '工作单位地址',
  `C_WORK_DPT_ZIP` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '工作单位邮编',
  `C_SEX` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `T_BIRTHDAY` datetime DEFAULT NULL COMMENT '出生年月',
  `C_HEALTH_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '健康状况代码',
  `C_HEALTH_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '健康状况说明',
  `C_OCCUP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '职业代码',
  `C_SIDELINE_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '副业标志',
  `C_POSITION` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '职位',
  `C_DUTY` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '职务内容',
  `N_INCOME` decimal(20,2) DEFAULT NULL COMMENT '年薪',
  `C_EDU_LVL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文化程度',
  `C_MRG_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '婚姻状况',
  `C_CHLD_STS_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '子女状况',
  `N_DRV_AGE` decimal(4,0) DEFAULT NULL COMMENT '驾龄',
  `C_CONVEYANCE_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '日常主要代步工具',
  `C_INS_HISTORY` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '以住三年保险记录',
  `T_UPD_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_RESV_TXT_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符字段1,预留 Reserved Field',
  `C_RESV_TXT_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符字段2,预留 Reserved Field',
  `C_RESV_TXT_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符字段3,预留 Reserved Field',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `C_CUS_RISK_LVL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户风险等级',
  `T_CERTF_END_DATE` datetime DEFAULT NULL COMMENT '证件有效期止',
  `C_CUS_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户类型',
  `C_LEGAL_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法定代表人姓名',
  `C_LEGAL_CERTF_CLS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法定代表人证件类型',
  `C_LEGAL_CERTF_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法定代表人证件号码',
  `T_LEGAL_CERTF_END_TM` datetime DEFAULT NULL COMMENT '法定代表人证件有效期限',
  `C_OPERATER_CERTF_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '经办人身份证号码',
  `T_OPERATER_CERTF_END_TM` datetime DEFAULT NULL COMMENT '经办人身份证有效期至',
  `C_FAX` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '传真',
  `N_AGE` decimal(4,0) DEFAULT NULL COMMENT '年龄',
  `C_ORGANIZATION_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '组织机构代码',
  `C_BUSLICENCE_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '营业执照号',
  `C_ORG_VALID` datetime DEFAULT NULL COMMENT '组织机构代码有效期',
  `C_BUSLICENCE_VALID` datetime DEFAULT NULL COMMENT '营业执照号有效期',
  `C_LEGAL_REP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法人代表',
  `C_IDENTIFICATION_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法人代表证件号码',
  `C_CERTIFICATE_VALID` datetime DEFAULT NULL COMMENT '法人代表证件号码有效期',
  `C_IDENTIFICATION_NO_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法人代表证件类型',
  `C_CEVENUE_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '税务登记号',
  `C_MANAGE_AREA` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '经营范围',
  `C_CUST_RISK_RANK` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '反洗钱客户风险等级',
  `C_CERT_VALID` datetime DEFAULT NULL COMMENT '税务有效期',
  `C_WORK_CTT` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '经营范围',
  `C_CUST_RISKRANK_LVL` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '反洗钱客户风险等级',
  `C_RESV_TXT_4` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段4',
  `C_RESV_TXT_5` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段5',
  `C_RESV_TXT_6` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段6',
  `C_RESV_TXT_7` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段7',
  `C_RESV_TXT_8` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段8',
  `C_RESV_TXT_9` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段9',
  `C_RESV_TXT_10` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段10',
  `C_RESV_TXT_11` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段11',
  `C_RESV_TXT_12` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段12',
  `N_RESV_NUM_3` decimal(8,0) DEFAULT NULL COMMENT '预留数值字段3',
  `N_RESV_NUM_2` decimal(8,0) DEFAULT NULL COMMENT '预留数值字段2',
  `N_RESV_NUM_1` decimal(8,0) DEFAULT NULL COMMENT '预留数值字段1',
  `C_RESV_TXT_20` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段20',
  `C_RESV_TXT_19` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段19',
  `C_RESV_TXT_18` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段18',
  `C_RESV_TXT_17` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段17',
  `C_RESV_TXT_16` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段16',
  `C_RESV_TXT_15` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段15',
  `C_RESV_TXT_14` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段14',
  `C_RESV_TXT_13` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段13',
  `C_RESV_TXT_21` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段21',
  `C_RESV_TXT_22` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段22',
  `C_RESV_TXT_23` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段23',
  `C_RESV_TXT_24` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段24',
  `C_RESV_TXT_25` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段25',
  `C_RESV_TXT_26` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段26',
  `C_RESV_TXT_27` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段27',
  `C_RESV_TXT_28` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段28',
  `N_RESV_NUM_4` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段4',
  `N_RESV_NUM_5` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段5',
  `N_RESV_NUM_6` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段6',
  `N_RESV_NUM_7` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段7',
  `N_RESV_NUM_8` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段8',
  `C_RESV_TXT_29` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段29',
  `C_RESV_TXT_30` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段30',
  `C_RESV_TXT_31` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段31',
  `C_RESV_TXT_32` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段32',
  `C_RESV_TXT_33` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段33',
  `C_RESV_TXT_34` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段34',
  `C_RESV_TXT_35` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段35',
  `C_RESV_TXT_36` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段36',
  `C_RESV_TXT_37` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段37',
  `C_RESV_TXT_38` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段38',
  `C_RESV_TXT_39` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段39',
  `C_RESV_TXT_40` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段40',
  `N_RESV_NUM_9` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段9',
  `N_RESV_NUM_10` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段10',
  `N_RESV_NUM_11` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段11',
  `N_RESV_NUM_12` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段12',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_APP_INSURED` (`C_PK_ID`),
  KEY `IDX_APPINSURED_APPNO` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请单被保人';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_inwd`
--

DROP TABLE IF EXISTS `web_ri_app_inwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_inwd` (
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PRJ_NME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  项目名称',
  `C_INWD_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  临时分入类型',
  `C_CLAUSE` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  使用条款',
  `C_ORIG_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  原保险保单号',
  `C_ORIG_INSR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  原保险保险人',
  `C_CED_COM_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  分出公司',
  `C_RI_BRK_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  再保经纪人',
  `C_INWD_BIZ_SRC` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  分入业务来源',
  `C_INWD_DATE` datetime DEFAULT NULL COMMENT '  分入日期',
  `C_ORIG_CUR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  原保险币种',
  `C_INWD_CUR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  分入币种',
  `N_EXCH_RATE` decimal(10,6) DEFAULT NULL COMMENT '  兑换率',
  `N_ORIG_AMT` decimal(20,2) DEFAULT NULL COMMENT '  原保险保额',
  `N_ORIG_RATE` decimal(10,6) DEFAULT NULL COMMENT '  原保险费率',
  `N_INWD_RATE` decimal(10,6) DEFAULT NULL COMMENT '  分入费率',
  `N_ORIG_PRM` decimal(20,2) DEFAULT NULL COMMENT '  原保险保费',
  `N_OWN_SHARE_RATIO` decimal(10,6) DEFAULT NULL COMMENT '  我司份额',
  `N_OWN_AMT` decimal(20,2) DEFAULT NULL COMMENT '  我司保额',
  `N_OWN_GR_PRM` decimal(20,2) DEFAULT NULL COMMENT '  我司毛保费',
  `N_INWD_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '  分保手续费率,分保手续费比例',
  `N_INWD_COMM` decimal(20,2) DEFAULT NULL COMMENT '  分保手续费',
  `N_OWN_NT_PRM` decimal(20,2) DEFAULT NULL COMMENT '  我司净保费',
  `C_JURI_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  司法管辖',
  `C_LOS_REC` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  损失纪录',
  `C_RI_CL` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  再保条件/条款',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `N_INWD_TAX_RATE` decimal(10,6) DEFAULT NULL COMMENT '  税率',
  `C_INWD_TAX_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  是否含税',
  `N_INWD_TAX_AMT` decimal(20,2) DEFAULT NULL COMMENT '  应缴税额',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `N_OWN_GR_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '我司毛保费变化量',
  `N_INWD_COMM_VAR` decimal(20,2) DEFAULT NULL COMMENT '分保手续费变化量',
  `N_INWD_TAX_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '应缴税额变化量',
  `C_INWD_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否含经纪费',
  `N_INWD_ELSE_FEE_RATE` decimal(10,6) DEFAULT NULL COMMENT '其他费用费率',
  `N_INWD_ELSE_FEE` decimal(20,2) DEFAULT NULL COMMENT '其它费用所占金额变化量',
  `N_INWD_ELSE_FEE_VAR` decimal(20,2) DEFAULT NULL COMMENT '其他费用金额',
  `C_PROVINCE` varchar(30) DEFAULT NULL COMMENT '省',
  `C_CITY` varchar(30) DEFAULT NULL COMMENT '市',
  `N_ORIG_VAT` decimal(20,2) DEFAULT NULL COMMENT '原保单税金额',
  `N_ORIG_PRICE` decimal(20,2) DEFAULT NULL COMMENT '原保单价金额',
  `N_ORIG_VAT_VAR` decimal(20,2) DEFAULT NULL COMMENT '原保单税变化量',
  `N_ORIG_PRICE_VAR` decimal(20,2) DEFAULT NULL COMMENT '原保单价变化量',
  `N_OWN_VAT` decimal(20,2) DEFAULT NULL COMMENT '我司税金额',
  `N_OWN_PRICE` decimal(20,2) DEFAULT NULL COMMENT '我司价金额',
  `N_OWN_VAT_VAR` decimal(20,2) DEFAULT NULL COMMENT '我司税变化量',
  `N_OWN_PRICE_VAR` decimal(20,2) DEFAULT NULL COMMENT '我司价变化量',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_APP_INWD` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_pay`
--

DROP TABLE IF EXISTS `web_ri_app_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_pay` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID， 如为新增记录则为批改申请单的PKID',
  `N_TMS` decimal(6,0) NOT NULL,
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PAYOR_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '付款人姓名 Payer s Name',
  `C_PAYOR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '付款人代码 Payer s Client No',
  `N_PAYABLE_PRM` decimal(20,2) DEFAULT NULL COMMENT '应付保费 Payable Premium',
  `C_PAY_MODE_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '付款方式 Payment Mode Code',
  `T_PAY_BGN_TM` datetime DEFAULT NULL COMMENT '缴费起始日期 Beginning of Payment Period',
  `T_PAY_END_TM` datetime DEFAULT NULL COMMENT '缴费截止日期 End of Payment Period',
  `T_PAID_TM` datetime DEFAULT NULL COMMENT '收费日期 Payment Time',
  `C_VCH_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '单证类型 Voucher Type',
  `C_RECPT_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收据号 Receipt NO',
  `N_PAID_PRM` decimal(20,2) DEFAULT NULL COMMENT '实收保费 Paid-in Premium',
  `C_CUR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '付款币种 Currency Code',
  `C_BANK_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '开户银行',
  `C_AC_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '账户 Account No',
  `T_CRT_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `N_PRM_VAR` decimal(20,2) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_APP_PAY` (`C_PK_ID`),
  KEY `IDX_APPPAY_APPNO` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_risk_qust`
--

DROP TABLE IF EXISTS `web_ri_app_risk_qust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_risk_qust` (
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_RISK_QUERY1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY6` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY7` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY8` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY9` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY10` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY11` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY12` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY13` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY14` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY15` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY16` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY17` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY18` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY19` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY20` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY21` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY22` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY23` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY24` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY25` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY26` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '风险询问',
  `C_RISK_QUERY27` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY28` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY29` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY30` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `N_RISK_QUERY1` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY2` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY3` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY4` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY5` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY6` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY7` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY8` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY9` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY10` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY11` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY12` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY13` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY14` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY15` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY16` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY17` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY18` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY19` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `N_RISK_QUERY20` decimal(20,6) DEFAULT NULL COMMENT '风险询问（数值）',
  `T_RISK_QUERY1` datetime DEFAULT NULL COMMENT '风险询问（时间）',
  `T_RISK_QUERY2` datetime DEFAULT NULL COMMENT '风险询问（时间）',
  `T_RISK_QUERY3` datetime DEFAULT NULL COMMENT '风险询问（时间）',
  `T_RISK_QUERY4` datetime DEFAULT NULL COMMENT '风险询问（时间）',
  `T_RISK_QUERY5` datetime DEFAULT NULL COMMENT '风险询问（时间）',
  `T_RISK_QUERY6` datetime DEFAULT NULL COMMENT '风险询问（时间）',
  `T_RISK_QUERY7` datetime DEFAULT NULL COMMENT '风险询问（时间）',
  `T_RISK_QUERY8` datetime DEFAULT NULL COMMENT '风险询问（时间）',
  `T_RISK_QUERY9` datetime DEFAULT NULL COMMENT '风险询问（时间）',
  `T_RISK_QUERY10` datetime DEFAULT NULL COMMENT '风险询问（时间）',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_RISK_QUERY31` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY32` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY33` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY34` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY35` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY36` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY37` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY38` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY39` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY40` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY41` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY42` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY43` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY44` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY45` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY46` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY47` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY48` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY49` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY50` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY51` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY52` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY53` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY54` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY55` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY56` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY57` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY58` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY59` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY60` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY61` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY62` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY63` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY64` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_APP_RISK_QUST` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请单风险问询信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_tgt`
--

DROP TABLE IF EXISTS `web_ri_app_tgt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_tgt` (
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_TGT_TXT_FLD_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本1,标的字段',
  `C_TGT_TXT_FLD_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本2,标的字段',
  `C_TGT_TXT_FLD_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本3,标的字段',
  `C_TGT_TXT_FLD_4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本4,标的字段',
  `C_TGT_TXT_FLD_5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本5,标的字段',
  `C_TGT_TXT_FLD_6` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本6,标的字段',
  `C_TGT_TXT_FLD_7` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本7,标的字段',
  `C_TGT_TXT_FLD_8` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本8,标的字段',
  `C_TGT_TXT_FLD_9` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本9,标的字段',
  `C_TGT_TXT_FLD_10` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本10,标的字段',
  `C_TGT_TXT_FLD_11` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本11,标的字段',
  `C_TGT_TXT_FLD_12` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本12,标的字段',
  `C_TGT_TXT_FLD_13` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本13,标的字段',
  `C_TGT_TXT_FLD_14` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本14,标的字段',
  `C_TGT_TXT_FLD_15` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本15,标的字段',
  `C_TGT_TXT_FLD_16` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本16,标的字段',
  `C_TGT_TXT_FLD_17` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本17,标的字段',
  `C_TGT_TXT_FLD_18` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本18,标的字段',
  `C_TGT_TXT_FLD_19` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本19,标的字段',
  `C_TGT_TXT_FLD_20` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本20,标的字段',
  `C_TGT_TXT_FLD_21` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本21,标的字段',
  `C_TGT_TXT_FLD_22` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本22,标的字段',
  `C_TGT_TXT_FLD_23` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本23,标的字段',
  `C_TGT_TXT_FLD_24` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本24,标的字段',
  `C_TGT_TXT_FLD_25` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本25,标的字段',
  `C_TGT_TXT_FLD_26` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本26,标的字段',
  `C_TGT_TXT_FLD_27` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本27,标的字段',
  `C_TGT_TXT_FLD_28` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本28,标的字段',
  `C_TGT_TXT_FLD_29` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本29,标的字段',
  `C_TGT_TXT_FLD_30` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本30,标的字段',
  `C_TGT_TXT_FLD_31` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本31,标的字段',
  `C_TGT_TXT_FLD_32` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本32,标的字段',
  `C_TGT_TXT_FLD_33` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本33,标的字段',
  `C_TGT_TXT_FLD_34` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本34,标的字段',
  `C_TGT_TXT_FLD_35` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本35,标的字段',
  `C_TGT_TXT_FLD_36` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本36,标的字段',
  `C_TGT_TXT_FLD_37` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本37,标的字段',
  `C_TGT_TXT_FLD_38` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本38,标的字段',
  `C_TGT_TXT_FLD_39` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本39,标的字段',
  `C_TGT_TXT_FLD_40` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本40,标的字段',
  `N_TGT_NUM_FLD_1` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值1,标的字段',
  `N_TGT_NUM_FLD_2` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值2,标的字段',
  `N_TGT_NUM_FLD_3` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值3,标的字段',
  `N_TGT_NUM_FLD_4` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值4,标的字段',
  `N_TGT_NUM_FLD_5` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值5,标的字段',
  `N_TGT_NUM_FLD_6` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值6,标的字段',
  `N_TGT_NUM_FLD_7` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值7,标的字段',
  `N_TGT_NUM_FLD_8` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值8,标的字段',
  `N_TGT_NUM_FLD_9` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值9,标的字段',
  `N_TGT_NUM_FLD_10` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值10,标的字段',
  `N_TGT_NUM_FLD_11` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值11,标的字段',
  `N_TGT_NUM_FLD_12` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值12,标的字段',
  `N_TGT_NUM_FLD_13` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值13,标的字段',
  `N_TGT_NUM_FLD_14` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值14,标的字段',
  `N_TGT_NUM_FLD_15` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值15,标的字段',
  `N_TGT_NUM_FLD_16` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值16,标的字段',
  `N_TGT_NUM_FLD_17` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值17,标的字段',
  `N_TGT_NUM_FLD_18` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值18,标的字段',
  `N_TGT_NUM_FLD_19` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值19,标的字段',
  `N_TGT_NUM_FLD_20` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值20,标的字段',
  `N_TGT_NUM_FLD_21` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值21,标的字段',
  `N_TGT_NUM_FLD_22` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值22,标的字段',
  `N_TGT_NUM_FLD_23` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值23,标的字段',
  `N_TGT_NUM_FLD_24` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值24,标的字段',
  `N_TGT_NUM_FLD_25` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值25,标的字段',
  `N_TGT_NUM_FLD_26` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值26,标的字段',
  `N_TGT_NUM_FLD_27` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值27,标的字段',
  `N_TGT_NUM_FLD_28` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值28,标的字段',
  `N_TGT_NUM_FLD_29` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值29,标的字段',
  `N_TGT_NUM_FLD_30` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值30,标的字段',
  `T_TGT_TM_FLD_1` datetime DEFAULT NULL COMMENT '  标的字段-日期1,标的字段',
  `T_TGT_TM_FLD_2` datetime DEFAULT NULL COMMENT '  标的字段-日期2,标的字段',
  `T_TGT_TM_FLD_3` datetime DEFAULT NULL COMMENT '  标的字段-日期3,标的字段',
  `T_TGT_TM_FLD_4` datetime DEFAULT NULL COMMENT '  标的字段-日期4,标的字段',
  `T_TGT_TM_FLD_5` datetime DEFAULT NULL COMMENT '  标的字段-日期5,标的字段',
  `T_TGT_TM_FLD_6` datetime DEFAULT NULL COMMENT '  标的字段-日期6,标的字段',
  `T_TGT_TM_FLD_7` datetime DEFAULT NULL COMMENT '  标的字段-日期7,标的字段',
  `T_TGT_TM_FLD_8` datetime DEFAULT NULL COMMENT '  标的字段-日期8,标的字段',
  `T_TGT_TM_FLD_9` datetime DEFAULT NULL COMMENT '  标的字段-日期9,标的字段',
  `T_TGT_TM_FLD_10` datetime DEFAULT NULL COMMENT '  标的字段-日期10,标的字段',
  `T_TGT_TM_FLD_11` datetime DEFAULT NULL COMMENT '  标的字段-日期11,标的字段',
  `T_TGT_TM_FLD_12` datetime DEFAULT NULL COMMENT '  标的字段-日期12,标的字段',
  `T_TGT_TM_FLD_13` datetime DEFAULT NULL COMMENT '  标的字段-日期13,标的字段',
  `T_TGT_TM_FLD_14` datetime DEFAULT NULL COMMENT '  标的字段-日期14,标的字段',
  `T_TGT_TM_FLD_15` datetime DEFAULT NULL COMMENT '  标的字段-日期15,标的字段',
  `T_TGT_TM_FLD_16` datetime DEFAULT NULL COMMENT '  标的字段-日期16,标的字段',
  `T_TGT_TM_FLD_17` datetime DEFAULT NULL COMMENT '  标的字段-日期17,标的字段',
  `T_TGT_TM_FLD_18` datetime DEFAULT NULL COMMENT '  标的字段-日期18,标的字段',
  `T_TGT_TM_FLD_19` datetime DEFAULT NULL COMMENT '  标的字段-日期19,标的字段',
  `T_TGT_TM_FLD_20` datetime DEFAULT NULL COMMENT '  标的字段-日期20,标的字段',
  `L_TGT_LTXT_FLD_1` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的字段-长文本1,标的字段',
  `L_TGT_LTXT_FLD_2` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的字段-长文本2,标的字段',
  `L_TGT_LTXT_FLD_3` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的字段-长文本3,标的字段',
  `L_TGT_LTXT_FLD_4` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的字段-长文本4,标的字段',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_ADDR_SEC_1` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段1',
  `C_ADDR_SEC_2` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段2',
  `C_ADDR_SEC_3` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段3',
  `C_ADDR_SEC_4` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段4',
  `C_ADDR_SEC_5` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段5',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `N_TGT_NUM_CHECKED` bigint(22) DEFAULT NULL COMMENT '核定载客人数',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_APP_TGT` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_app_tgt_obj`
--

DROP TABLE IF EXISTS `web_ri_app_tgt_obj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_app_tgt_obj` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  记录唯一标识号,投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID，如为新增记录则为批改申请单的PKID',
  `N_SEQ_NO` decimal(6,0) NOT NULL,
  `C_TGT_OBJ_TXT_FLD_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)1,标的物字段',
  `C_TGT_OBJ_TXT_FLD_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)2,标的物字段',
  `C_TGT_OBJ_TXT_FLD_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)3,标的物字段',
  `C_TGT_OBJ_TXT_FLD_4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)4,标的物字段',
  `C_TGT_OBJ_TXT_FLD_5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)5,标的物字段',
  `C_TGT_OBJ_TXT_FLD_6` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)6,标的物字段',
  `C_TGT_OBJ_TXT_FLD_7` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)7,标的物字段',
  `C_TGT_OBJ_TXT_FLD_8` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)8,标的物字段',
  `C_TGT_OBJ_TXT_FLD_9` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)9,标的物字段',
  `C_TGT_OBJ_TXT_FLD_10` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)10,标的物字段',
  `C_TGT_OBJ_TXT_FLD_11` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)11,标的物字段',
  `C_TGT_OBJ_TXT_FLD_12` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)12,标的物字段',
  `C_TGT_OBJ_TXT_FLD_13` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)13,标的物字段',
  `C_TGT_OBJ_TXT_FLD_14` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)14,标的物字段',
  `C_TGT_OBJ_TXT_FLD_15` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)15,标的物字段',
  `C_TGT_OBJ_TXT_FLD_16` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)16,标的物字段',
  `C_TGT_OBJ_TXT_FLD_17` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)17,标的物字段',
  `C_TGT_OBJ_TXT_FLD_18` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)18,标的物字段',
  `C_TGT_OBJ_TXT_FLD_19` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)19,标的物字段',
  `C_TGT_OBJ_TXT_FLD_20` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)20,标的物字段',
  `T_TGT_OBJ_TM_FLD_1` datetime DEFAULT NULL COMMENT '  标的物字段(日期)1,标的物字段',
  `T_TGT_OBJ_TM_FLD_2` datetime DEFAULT NULL COMMENT '  标的物字段(日期)2,标的物字段',
  `T_TGT_OBJ_TM_FLD_3` datetime DEFAULT NULL COMMENT '  标的物字段(日期)3,标的物字段',
  `T_TGT_OBJ_TM_FLD_4` datetime DEFAULT NULL COMMENT '  标的物字段(日期)4,标的物字段',
  `T_TGT_OBJ_TM_FLD_5` datetime DEFAULT NULL COMMENT '  标的物字段(日期)5,标的物字段',
  `N_TGT_OBJ_NUM_FLD_1` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)1,标的物字段',
  `N_TGT_OBJ_NUM_FLD_2` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)2,标的物字段',
  `N_TGT_OBJ_NUM_FLD_3` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)3,标的物字段',
  `N_TGT_OBJ_NUM_FLD_4` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)4,标的物字段',
  `N_TGT_OBJ_NUM_FLD_5` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)5,标的物字段',
  `N_TGT_OBJ_NUM_FLD_6` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)6,标的物字段',
  `N_TGT_OBJ_NUM_FLD_7` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)7,标的物字段',
  `N_TGT_OBJ_NUM_FLD_8` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)8,标的物字段',
  `N_TGT_OBJ_NUM_FLD_9` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)9,标的物字段',
  `N_TGT_OBJ_NUM_FLD_10` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)10,标的物字段',
  `L_TGT_OBJ_LTXT_FLD_1` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的物字段(长文本)1,标的物字段',
  `L_TGT_OBJ_LTXT_FLD_2` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的物字段(长文本)2,标的物字段',
  `L_TGT_OBJ_LTXT_FLD_3` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的物字段(长文本)3,标的物字段',
  `L_TGT_OBJ_LTXT_FLD_4` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的物字段(长文本)4,标的物字段',
  `L_TGT_OBJ_LTXT_FLD_5` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的物字段(长文本)5,标的物字段',
  `C_CANCEL_MARK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  取消标志',
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_TGT_OBJ_TXT_FLD_21` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_22` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_23` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_24` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_25` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_26` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_27` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_28` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_29` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_30` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_APP_TGT_OBJ` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_auto_task`
--

DROP TABLE IF EXISTS `web_ri_auto_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_auto_task` (
  `C_TASK_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务ID',
  `C_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务类型,B = 出帐单,C = 计算,R = 报表',
  `C_EXEC_TIME` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '自动启动时间,格式:几点几分 HH24MI',
  `N_CYCLE` decimal(4,0) NOT NULL COMMENT '执行周期',
  `T_LAST_EXEC_DATE` datetime NOT NULL COMMENT '上次执行日期',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '状态,W = 未执行,R = 正在执行',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '是否启用标志，0=未启用，1=启用',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_AUTO_TASK` (`C_TASK_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_bill_task`
--

DROP TABLE IF EXISTS `web_ri_bill_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_bill_task` (
  `C_BILL_YM` varchar(9) DEFAULT NULL COMMENT '出账年月',
  `C_PREVIEW_DATE` varchar(10) DEFAULT NULL COMMENT '试出帐日期',
  `C_CONFIRM_DATE` varchar(10) DEFAULT NULL COMMENT '确认日期',
  `C_CONFIRM_USER` varchar(30) DEFAULT NULL COMMENT '确认用户',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '状态A= 未出帐B= 正在试出帐C= 已经试出帐D= 正在确认E= 已经确认(月度)F=试出账失败G=出账确认失败H=已经确认(季度)',
  `C_CONSISTENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '数据是否一致，0=否，1=是',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_BILL_TASK` (`C_BILL_YM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出账任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_brkr_com_rel`
--

DROP TABLE IF EXISTS `web_ri_brkr_com_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_brkr_com_rel` (
  `C_CONTPRIO_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键 ',
  `C_BRKR_COM_CDE` varchar(30) DEFAULT NULL COMMENT '经纪公司代码',
  `C_COM_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保公司代码',
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '有效状态,''0''失效,''1''有效',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_BRKR_COM_REL` (`C_CONTPRIO_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='再保公司与经纪公司关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cal_task`
--

DROP TABLE IF EXISTS `web_ri_cal_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cal_task` (
  `C_TASK_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务ID',
  `C_INSRNC_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '承保公司',
  `C_RECALCULATE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否重计算',
  `C_BEGIN_DATE` datetime NOT NULL COMMENT '起始日期',
  `C_END_DATE` datetime NOT NULL COMMENT '终止日期',
  `C_RIKIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品大类',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员 ',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CAL_TASK` (`C_TASK_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手工计算任务参数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ced_fin_dtl`
--

DROP TABLE IF EXISTS `web_ri_ced_fin_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ced_fin_dtl` (
  `C_CED_FIN_DTL_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分出收付明细PKID',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '出单机构',
  `C_DPTACC_CDE` varchar(30) DEFAULT NULL COMMENT '做账机构',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `C_APP_NO` varchar(50) DEFAULT NULL COMMENT '投保单号',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号',
  `C_CLM_NO` varchar(50) DEFAULT NULL COMMENT '赔案号',
  `N_TMS` decimal(4,0) DEFAULT NULL COMMENT '保费期次',
  `C_BSNS_TYP` varchar(30) DEFAULT NULL COMMENT '01直销业务；02代理业务；03经纪业务。',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码',
  `C_FEETYP_CDE` varchar(30) DEFAULT NULL COMMENT '费用类型代码',
  `C_BALA_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '"0"正常（default）当保单做了注销或退保批改时，将该保单及其所有批单的未收付的记录，此字段置为“1”，致使在收付模块不能检索收付；当保单做了退保恢复批改时，将该保单的退保批单和退保恢复批单的此字段置为“2”，致使在收付模块也不能检索收付。"3"批改缴费计划时，标识冲销相应记录（未收付和冲负的记录都需标识）',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '保险起期',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '保险止期',
  `C_BS_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务接口写入币种',
  `N_BS_AMT` decimal(20,2) NOT NULL COMMENT '业务接口写入金额',
  `C_DUE_CUR` varchar(30) DEFAULT NULL COMMENT '挂账币种',
  `N_DUE_AMT` decimal(20,2) DEFAULT NULL COMMENT '挂账金额',
  `T_DUE_TM` datetime DEFAULT NULL COMMENT '挂账日期',
  `C_DUE_MRK` varchar(1) DEFAULT NULL COMMENT '是否已挂账：0未挂账；1已挂账。',
  `C_RP_CUR` varchar(30) DEFAULT NULL COMMENT '收付币种',
  `N_RP_AMT` decimal(20,2) DEFAULT NULL COMMENT '收付总金额',
  `T_RP_TM` datetime DEFAULT NULL COMMENT '收付日期',
  `C_RP_FLAG` varchar(1) DEFAULT NULL COMMENT '1：已收付。',
  `T_PAID_TM` datetime DEFAULT NULL COMMENT '收付复核日期',
  `N_PAID_AMT` decimal(20,2) DEFAULT NULL COMMENT '复核总金额',
  `C_PAY_MDE_CDE` varchar(30) DEFAULT NULL COMMENT '付款方式',
  `C_SLSGRP_CDE` varchar(30) DEFAULT NULL COMMENT '售销团队',
  `C_SLS_CDE` varchar(30) DEFAULT NULL COMMENT '业务员',
  `C_CHA_MRK` varchar(1) DEFAULT NULL COMMENT '0：法人；1：个人。',
  `C_CHA_CLS` varchar(30) DEFAULT NULL COMMENT '渠道类别',
  `C_CHA_CDE` varchar(30) DEFAULT NULL COMMENT '渠道编码',
  `C_APP_NME` varchar(100) DEFAULT NULL COMMENT '投保人名称',
  `N_TAX_RATE` decimal(10,6) DEFAULT NULL COMMENT '税率',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建日期',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_ACCNT_FLAG` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '00 未收付-未确认,01 未收付-已确认,10 已收付-未确认,11 已收付-已确认',
  `N_OTHER_AMT` decimal(20,2) DEFAULT NULL COMMENT '其他应收金额。如车船税',
  `C_CUSTOMER_ACCOUNTS` varchar(50) DEFAULT NULL COMMENT '客户帐号',
  `C_BATCH_NO` varchar(50) DEFAULT NULL COMMENT '1．选单导入回写2．上海平台缴费确认成功回写',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `C_MEMO` varchar(255) DEFAULT NULL COMMENT '备注',
  `C_TYPE` varchar(1) DEFAULT NULL COMMENT '合约类型',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保人',
  `C_BILL_YM` varchar(7) DEFAULT NULL COMMENT '账单年月',
  `C_BILL_NO` varchar(50) DEFAULT NULL COMMENT '帐单号',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约ID',
  `C_DOC_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '1 分出保费2 分出摊回分保费用3 分出摊回分保赔款4 分出现金赔款5 分出存入分保准备金6 分出分保准备金利息',
  `C_BUSI_SOURCE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '0．?? 分出1．?? 分入',
  `C_BILL_NO2` varchar(50) DEFAULT NULL COMMENT '月账单编号',
  `C_SETT_NO` varchar(50) DEFAULT NULL COMMENT '结算单号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `C_FAC_BID_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报价单号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CED_FIN_DTL` (`C_CED_FIN_DTL_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='再保分出收付明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_accdnt`
--

DROP TABLE IF EXISTS `web_ri_clm_accdnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_accdnt` (
  `C_INS_ACC_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_INSURED_CDE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_INSURED_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_SEX` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `N_AGE` decimal(3,0) DEFAULT NULL COMMENT '年龄',
  `C_CERT_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '证件类型',
  `C_CERT_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `C_OCCUP_CDE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_ACCDNT_TM` datetime NOT NULL,
  `C_ACCDNT_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '险因类型',
  `C_ACCDNT_RSN` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '出险原因',
  `C_ACCDNT_PLACE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '出险地点',
  `C_ACCDNT_PROC` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '出险经过',
  `N_RPT_AMT` decimal(20,2) DEFAULT NULL COMMENT '报损金额',
  `C_RPT_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '报损金额币种',
  `C_REMARK` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '备注',
  `T_RPT_ACCDNT_TM` datetime NOT NULL,
  `C_RPT_ACCDNT_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '报案时录入的险因类型',
  `C_RPT_ACCDNT_RSN` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_RPT_ACCDNT_PLACE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_RPT_ACCDNT_PROC` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '报案时录入的出险经过',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `N_DISASTER_RPT_AMT` decimal(20,2) DEFAULT NULL,
  `N_NOGAIN_RPT_AMT` decimal(20,2) DEFAULT NULL,
  `C_RPT_ACCDNT_WITH_RSN` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '报案伴随原因',
  `N_YL1` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `N_YL2` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `N_YL3` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `N_YL4` bigint(22) DEFAULT NULL,
  `N_YL5` bigint(22) DEFAULT NULL,
  `N_YL6` bigint(22) DEFAULT NULL,
  `N_YL7` bigint(22) DEFAULT NULL,
  `N_YL8` bigint(22) DEFAULT NULL,
  `T_DEAD` datetime DEFAULT NULL,
  `N_DEAD_NUM` bigint(22) DEFAULT NULL,
  `N_CALAM_AREA1` bigint(22) DEFAULT NULL,
  `N_CALAM_AREA2` bigint(22) DEFAULT NULL,
  `N_NOGAIN_AREA3` bigint(22) DEFAULT NULL,
  `C_IS_INJURY` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `N_PSN_NUM` decimal(4,0) DEFAULT NULL,
  `C_HOSPITAL` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '医院',
  `C_COST_PROC` text CHARACTER SET utf8 COLLATE utf8_bin,
  `C_INSTANT_DELAY` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '即时、延时报案标识',
  `C_HUGE_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '巨灾编码',
  `C_HUGE_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '0否、1是',
  `C_YL1` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保单身份',
  `T_DATE_BIRTH` datetime DEFAULT NULL COMMENT '出生日期',
  `C_PROVINCE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '省份',
  `C_CITY` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '城市',
  `C_COUNTY` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '县',
  `C_INJURY_REASON_CODE` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '损伤外部原因代码',
  `C_GROW_TYP` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '生长阶段',
  `C_SCALE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '赔偿比例',
  `C_IS_PAY` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否立即赔付；‘1’是、‘0’否',
  `C_HUGE_ONE_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '巨灾一级编码',
  `C_HUGE_TWO_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '巨灾二级编码',
  `C_RPT_ACCDNT_PLACE_DETAIL` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`C_INS_ACC_PK_ID`),
  UNIQUE KEY `PK_WEB_CLM_ACCDNT` (`C_INS_ACC_PK_ID`),
  KEY `IYA_WEB_CLM_ACCDNT` (`C_CLM_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_cal_err`
--

DROP TABLE IF EXISTS `web_ri_clm_cal_err`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_cal_err` (
  `C_CLM_CALERR_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '已决出错PKID',
  `C_CLM_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '已决PKID',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_CLM_TMS` decimal(4,0) NOT NULL COMMENT '赔付次数',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_RBK_SEQ` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单',
  `C_CAL_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '计算方式,A-自动 B-手工',
  `T_CAL_TM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '计算时间',
  `C_ERR_RSN` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '错误原因',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CLM_CAL_ERR` (`C_CLM_CALERR_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_cash_accdnt_note`
--

DROP TABLE IF EXISTS `web_ri_clm_cash_accdnt_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_cash_accdnt_note` (
  `C_CLM_CASH_NOTEACCDNTAC_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '现金赔款出险通知单PKID',
  `C_CLM_CASH_NOTE_ACCDNT_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '现金赔款出险通知单号',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_CLM_TMS` decimal(4,0) DEFAULT NULL COMMENT '赔付次数',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号',
  `C_UW_YEAR` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务年度',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码 Product Code',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '机构代码 Department No',
  `C_INSRNT_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '被保人名称',
  `T_INSRNC_BGN_TM` datetime NOT NULL COMMENT '保险起期 Policy Effective Date',
  `T_INSRNC_END_TM` datetime NOT NULL COMMENT '保险止期 Policy Expire Date',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险日期',
  `C_ACCDNT_CAUS_CDE` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '出险原因代码',
  `C_ACCDNT_CAUS_NME` varchar(500) DEFAULT NULL COMMENT '出险原因',
  `C_PLACE_LOSS` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '出险地点',
  `N_SUM_AMT` decimal(20,2) DEFAULT NULL COMMENT '总保额',
  `N_SUM_CLM_PAID` decimal(20,2) NOT NULL COMMENT '总赔付金额',
  `C_CLM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '总赔付金额币种',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `C_CONT_CDE` varchar(30) DEFAULT NULL COMMENT '合约代码',
  `C_RI_COM` varchar(30) DEFAULT NULL COMMENT '再保公司代码',
  `N_SHARE_PRPT` decimal(10,6) DEFAULT NULL COMMENT '参与比例',
  `N_CLM_PAID` decimal(20,6) DEFAULT NULL COMMENT '摊回赔款',
  `C_CONFIRM_MRK` varchar(1) DEFAULT '0' COMMENT '确认标识',
  `C_CRT_CDE` varchar(30) DEFAULT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime DEFAULT NULL COMMENT '建立时间',
  `C_UPD_CDE` varchar(30) DEFAULT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime DEFAULT NULL COMMENT '修改日期',
  `C_ACCDNT_TGT` varchar(100) DEFAULT NULL COMMENT '出险标的信息',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT '0' COMMENT '批改序号,批改次数 Times of Endorsement',
  `N_NOTE_TYP` decimal(4,0) DEFAULT '1' COMMENT '类型：1-现金赔款通知；2-注销现金赔款通知',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CLM_CASH_ACCDNT_NOTE` (`C_CLM_CASH_NOTEACCDNTAC_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='现金赔款通知单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_cash_bill`
--

DROP TABLE IF EXISTS `web_ri_clm_cash_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_cash_bill` (
  `C_CASH_BILL_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '现金赔款账单PKID',
  `C_BILL_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '现金赔款单号',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号',
  `C_UW_YM` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务年度',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码 Product Code',
  `N_SUM_CLM_PAID` decimal(20,2) NOT NULL COMMENT '总赔付金额',
  `C_CLM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '总赔付金额币种',
  `C_INSRNT_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '被保人名称',
  `T_INSRNC_BGN_TM` datetime NOT NULL COMMENT '保险起期 Policy Effective Date',
  `T_INSRNC_END_TM` datetime NOT NULL COMMENT '保险止期 Policy Expire Date',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险日期',
  `N_SUM_AMT` decimal(20,2) DEFAULT NULL COMMENT '总保额',
  `C_ACCDNT_CAUS_CDE` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '出险原因代码',
  `C_PLACE_LOSS` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '出险地点',
  `T_PAID_TM` datetime NOT NULL COMMENT '结算日期',
  `C_CONFIRM_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '确认标识',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CLM_CASH_BILL` (`C_CASH_BILL_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='现金赔款帐单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_cash_bill_dtl`
--

DROP TABLE IF EXISTS `web_ri_clm_cash_bill_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_cash_bill_dtl` (
  `C_CASH_BILL_DTL_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '现金赔款账单PKID',
  `C_BILL_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '现金赔款单号',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保公司代码',
  `N_SHARE_PRPT` decimal(10,6) NOT NULL COMMENT '参与比例',
  `N_CLM_PAID` decimal(20,6) NOT NULL COMMENT '摊回赔款',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_OUT_BILL_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '现金赔款对外账单号',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CLM_CASH_BILL_DTL` (`C_CASH_BILL_DTL_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='现金赔款帐单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_ced`
--

DROP TABLE IF EXISTS `web_ri_clm_ced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_ced` (
  `C_CLMCED_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '已决分出PKID',
  `C_CLM_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '已决PKID',
  `N_CLM_TMS` decimal(4,0) NOT NULL COMMENT '赔付次数',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_RBK_SEQ` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否经纪公司,''0''否,''1''是',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪公司下的再保公司',
  `C_RI_BRKR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪公司/再保公司',
  `N_CLM_AMT` decimal(20,6) NOT NULL COMMENT '摊回赔款',
  `N_CLM_PRPT` decimal(15,10) NOT NULL COMMENT '摊回比例',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `C_BILL_YM` varchar(7) DEFAULT NULL COMMENT '帐单年月',
  `C_UW_YM` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务年月',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码 Product Code',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构代码 Department No,默认保险总公司',
  `C_RICLM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保赔款币种',
  `C_CED_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '分出类型,A 正常，B 混合溢额成数分出,C 临分超赔,D 类地震溢额分出,Z 其他',
  `C_INNER_BILL_NO` varchar(50) DEFAULT NULL COMMENT '月度对内账单号，出账汇总时回写',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源,01=直销业务,02=代理业务,03=邮寄销售业务,04=网络销售业务,05=经纪业务,06=专业代理业务,07=个人代理,08=电话销售业务',
  `T_RIDUE_TM` datetime DEFAULT NULL COMMENT '再保挂账日期',
  `C_CVRG_NO` varchar(6) DEFAULT NULL COMMENT '工程险险别',
  `C_INNER_BILL_NO_FORMAL` varchar(50) DEFAULT NULL COMMENT '月度对内正式账单号，正式月度账汇总时回写',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_RIBUS_DUE_TM` date DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CLM_CED` (`C_CLMCED_PK_ID`),
  KEY `IDX_RI_CLM_CED_C_CLM_NO` (`C_CLM_NO`,`N_CLM_TMS`),
  KEY `IDX_RI_CLM_CED_N_RBK_SEQ` (`N_RBK_SEQ`),
  KEY `IDX_RI_CLM_CED_N_SPLIT_SEQ` (`N_SPLIT_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_ced_bill_detail`
--

DROP TABLE IF EXISTS `web_ri_clm_ced_bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_ced_bill_detail` (
  `C_CLM_CED_BILL_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '已决分出PKID',
  `C_INNER_BILL_NO` varchar(200) NOT NULL COMMENT '内账单号',
  `C_BILL_NO` varchar(200) NOT NULL COMMENT '账单号',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_CLM_TMS` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '次数：已决中间表赔付类型 拼接 赔付次数 组成',
  `C_CLM_TYP` varchar(1) DEFAULT '1' COMMENT '赔付类型，等于已决中间表赔付类型',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_RBK_SEQ` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单',
  `N_TMS` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '分期',
  `T_RIDUE_TM` datetime NOT NULL COMMENT '再保挂账日期',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '状态,A可分,B已分,C确认,D不计算,E错误,F 已更正',
  `C_BILL_YM` varchar(7) DEFAULT NULL COMMENT '帐单年月',
  `C_BILL_QUARTER` varchar(2) DEFAULT NULL COMMENT '账单季',
  `C_UW_YM` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务年月',
  `C_RI_BRKR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪公司/再保公司',
  `C_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否经纪公司,''0''否,''1''是',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪公司下的再保公司',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构代码 Department No,默认保险总公司',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码 Product Code',
  `C_RICLM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保赔款币种',
  `C_CED_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '分出类型,A 正常，B 混合溢额成数分出,C 临分超赔,D 类地震溢额分出,Z 其他',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源,01=直销业务,02=代理业务,03=邮寄销售业务,04=网络销售业务,05=经纪业务,06=专业代理业务,07=个人代理,08=电话销售业务',
  `C_CVRG_NO` varchar(6) DEFAULT NULL COMMENT '工程险险别',
  `C_SEC_ID` varchar(30) NOT NULL COMMENT 'Section ID',
  `N_CLM_PRPT` decimal(15,10) NOT NULL COMMENT '摊回比例',
  `N_CLM_AMT` decimal(20,6) NOT NULL COMMENT '摊回赔款',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_cvrg`
--

DROP TABLE IF EXISTS `web_ri_clm_cvrg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_cvrg` (
  `C_CLM_CVRG_PK_ID` varchar(50) COLLATE utf8_bin NOT NULL,
  `C_CLM_NO` varchar(50) COLLATE utf8_bin NOT NULL,
  `N_CLM_TMS` decimal(4,0) NOT NULL,
  `C_CVRG_NO` varchar(6) COLLATE utf8_bin NOT NULL,
  `C_CVRG_NME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `N_EXP_CLM_AMT` decimal(20,2) DEFAULT NULL,
  `N_CVRG_CLM_AMT` decimal(20,2) DEFAULT NULL,
  `N_SUM_CLM_AMT` decimal(20,2) DEFAULT NULL,
  `N_PRPT` decimal(10,6) DEFAULT NULL,
  `C_CRT_CDE` varchar(30) COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `N_SUM_EXP_CLM_AMT` decimal(20,2) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`C_CLM_CVRG_PK_ID`),
  KEY `IDX_RI_CLM_CVRG_C_CLM_NO` (`C_CLM_NO`,`N_CLM_TMS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_due`
--

DROP TABLE IF EXISTS `web_ri_clm_due`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_due` (
  `C_CLM_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '已决PKID',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_CLM_TMS` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '次数：已决中间表赔付类型 拼接 赔付次数 组成',
  `N_PLY_TMS` decimal(4,0) DEFAULT '1' COMMENT '分期序号,分期缴费的序号',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号 Policy No',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_RBK_SEQ` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单',
  `N_PLY_SPLIT_SEQ` decimal(4,0) DEFAULT NULL COMMENT '保单拆分序号',
  `N_PLY_RBK_SEQ` decimal(4,0) DEFAULT NULL COMMENT '保单冲正序号',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码 Product Code',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构代码 Department No',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险日期',
  `T_RGST_TM` datetime NOT NULL COMMENT '立案日期',
  `T_CLS_TM` datetime DEFAULT NULL COMMENT '结案日期',
  `C_ACCDNT_CAUS_CDE` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '出险原因代码',
  `C_BALE_CDE` varchar(30) DEFAULT NULL COMMENT '巨灾代码',
  `C_ORG_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '原币种,原赔付金额的币种',
  `N_ORG_CLM_AMT` decimal(20,2) NOT NULL COMMENT '原赔付金额',
  `C_RI_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保币种',
  `N_RI_CLM_AMT` decimal(20,2) NOT NULL COMMENT '再保赔付金额',
  `N_CHG_RATE` decimal(10,6) NOT NULL COMMENT '兑换率',
  `C_CAL_YM` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '分出年月',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '状态,A可分,B已分,C确认,D不计算,E错误,F 已更正',
  `C_CI_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '共保方式,"0"=非共保业务,"1"=内部共保（我方主共）,"2"=内部共保（我方从共）,"3"=外部共保（我方主共）,"4"=外部共保（我方从共）',
  `C_INW_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '分入业务标志',
  `C_STOCK_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '股东业务标志',
  `C_CASH_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '现金赔款标志',
  `N_CASH_AMT` decimal(20,2) DEFAULT NULL COMMENT '现金赔款金额',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_DUE_TM` datetime NOT NULL COMMENT '业务单挂账时间，业务写入，与财务接口表的挂账时间相同',
  `T_RIDUE_TM` datetime NOT NULL COMMENT '再保挂账日期',
  `C_RETRO_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '不转分保标识,0=转分(默认),1=不转分保，标记临分分入业务是否转分保',
  `C_EL_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '超赔标识,超赔摊赔处理后回写，0=无超赔,1=险位超赔摊回,2=事故超赔摊回,3=临分超赔摊回',
  `C_EVENT_ID` varchar(30) DEFAULT NULL COMMENT '事故超赔标识号',
  `C_BALE_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '巨灾标识',
  `C_PLACE_LOSS` text COMMENT '出险地点，现金赔款账单用',
  `C_SPLIT_MRK` varchar(1) DEFAULT '0' COMMENT '合并/拆散标志,0 = 正常保单(默认)  1 = 被合并 2= 合并后 -1= 被拆分 -2= 拆分后',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT NULL COMMENT '批改序号',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源',
  `C_FAC_PAYMENT_STS` varchar(1) DEFAULT '0' COMMENT '临分摊赔状态,0=未摊回,1=已摊回,2=已生成账单,3=传财务',
  `C_FAC_XL_PAYMENT_STS` varchar(1) DEFAULT '0' COMMENT '临分超赔摊赔状态,0=未摊回,1=已摊回,2=已生成账单,3=传财务',
  `N_CI_PAY_AMT` decimal(20,2) DEFAULT NULL COMMENT '共保总赔款',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标识：再保历史数据标识为1；非再保历史数据标识为0或者空',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '数据迁移时间',
  `C_CLM_TYP` varchar(1) DEFAULT '1' COMMENT '赔付类型，等于已决中间表赔付类型',
  `N_SOURCE_FLAG` decimal(1,0) DEFAULT NULL COMMENT '数据来源。0非车；1车险；2其它',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '保险起期',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '保险止期',
  `N_APP_NUM` decimal(8,0) DEFAULT NULL COMMENT '理算序号--华海需求(目前暂为送收付区分险别用)',
  `C_READ_FLG` varchar(1) DEFAULT NULL,
  `C_PROCESS` text COMMENT '出险经过--华海需求',
  `N_PAID_TMS` decimal(4,0) DEFAULT NULL COMMENT '分期缴费',
  `C_CITY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '市',
  `C_PROVINCE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '省',
  `T_RIBUS_DUE_TM` date DEFAULT NULL,
  `C_GRP_MRK` varchar(1) DEFAULT NULL COMMENT '团单标志( 0 个单; 1 团单)',
  `C_LONG_TERM_MRK` varchar(1) DEFAULT NULL COMMENT '长短期标志：短期：0  一年期 ：1  长期 ：2 ',
  `C_USAGE_CDE` varchar(30) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CLM_DUE` (`C_CLM_PK_ID`),
  KEY `IDX_RI_CLM_DUE_C_CLM_NO` (`C_CLM_NO`,`N_CLM_TMS`),
  KEY `IDX_RI_CLM_DUE_C_PLY_NO` (`C_PLY_NO`),
  KEY `IDX_RI_CLM_DUE_N_RBK_SEQ` (`N_RBK_SEQ`),
  KEY `IDX_RI_CLM_DUE_N_SPLIT_SEQ` (`N_SPLIT_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已决接口表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_el_accdnt_note`
--

DROP TABLE IF EXISTS `web_ri_clm_el_accdnt_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_el_accdnt_note` (
  `C_CLM_EL_NOTEACCDNTAC_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '超赔出险通知单PKID',
  `C_CLM_EL_NOTE_ACCDNT_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '超赔出险通知单号',
  `C_STATUS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '通知状态： 0、未打印，1、已打印',
  `C_LOSS_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '损失类型 1险位损失，2事故损失',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号',
  `C_BALE_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '巨灾标识',
  `C_BALE_CDE` varchar(30) DEFAULT NULL COMMENT '巨灾代码',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品代码 Product Code',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '机构代码 Department No',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险日期',
  `C_ACCDNT_CAUS_NME` varchar(500) DEFAULT NULL COMMENT '出险原因',
  `C_PLACE_LOSS` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '出险地点',
  `C_ACCDNT_PROC` text COMMENT '出险经过',
  `N_CLM_AMT` decimal(20,2) DEFAULT '0.00' COMMENT '总报损金额',
  `N_SUM_CLM_PAID` decimal(20,2) DEFAULT '0.00' COMMENT '总赔付金额',
  `C_CLM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '总赔付金额币种',
  `N_SELF_CLM_PAID` decimal(20,2) DEFAULT '0.00' COMMENT '自留比例赔款',
  `C_CRT_CDE` varchar(30) DEFAULT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime DEFAULT NULL COMMENT '建立时间',
  `C_UPD_CDE` varchar(30) DEFAULT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime DEFAULT NULL COMMENT '修改日期',
  KEY `IDX_CLM_SEQ_CONT` (`C_CLM_NO`,`N_SPLIT_SEQ`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_CATA_CONT` (`C_BALE_CDE`,`C_CONT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超赔出险通知单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_el_accdnt_note_dtl`
--

DROP TABLE IF EXISTS `web_ri_clm_el_accdnt_note_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_el_accdnt_note_dtl` (
  `C_CLM_EL_NOTEACCDNTACDTL_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '超赔出险通知单明细PKID',
  `C_CLM_EL_NOTE_ACCDNT_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '超赔出险通知单号',
  `C_CLMORCATA_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '巨灾号/赔案号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `C_LOSS_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '损失类型 1险位损失，2事故损失',
  `C_BRKR_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪人代码',
  `C_BRKR_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司，0否，1是',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保人代码',
  `N_SHARE_PRPT` decimal(10,6) DEFAULT NULL COMMENT '参与比例',
  `N_CLM_PAID` decimal(20,6) DEFAULT NULL COMMENT '摊回赔款',
  `C_CRT_CDE` varchar(30) DEFAULT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime DEFAULT NULL COMMENT '建立时间',
  `C_UPD_CDE` varchar(30) DEFAULT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime DEFAULT NULL COMMENT '修改日期',
  KEY `IDX_CLMORCATA_SEQ_CONT` (`C_CLMORCATA_CDE`,`N_SPLIT_SEQ`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_CLMORCATA_CONT` (`C_CLMORCATA_CDE`,`C_CONT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超赔出险通知单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_el_accdnt_note_map`
--

DROP TABLE IF EXISTS `web_ri_clm_el_accdnt_note_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_el_accdnt_note_map` (
  `C_CLM_EL_NOTEACCDNTACMAP_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '超赔出险通知单清单PKID',
  `C_CLM_EL_NOTE_ACCDNT_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '超赔出险通知单号',
  `C_LOSS_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '损失类型 1险位损失，2事故损失',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号',
  `C_BALE_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '巨灾标识',
  `C_BALE_CDE` varchar(30) DEFAULT NULL COMMENT '巨灾代码',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `C_ACCT_CDE` varchar(30) DEFAULT NULL COMMENT '事故代码',
  `T_ACCDNT_TM` datetime DEFAULT NULL COMMENT '出险日期',
  `C_ACCDNT_CAUS_NME` varchar(500) DEFAULT NULL COMMENT '出险原因',
  `C_PLACE_LOSS` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '出险地点',
  `C_ACCDNT_PROC` text COMMENT '出险经过',
  `N_CLM_AMT` decimal(20,2) DEFAULT '0.00' COMMENT '报损金额',
  `N_SUM_CLM_PAID` decimal(20,2) DEFAULT NULL COMMENT '总赔付金额',
  `C_CLM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '总赔付金额币种',
  `N_SELF_PRPT` decimal(15,10) DEFAULT NULL COMMENT '自留比例',
  `N_SELF_CLM_PAID` decimal(20,2) DEFAULT NULL COMMENT '自留比例赔款',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保单号',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT '0' COMMENT '批改序号',
  `C_PROD_NO` varchar(6) DEFAULT NULL COMMENT '产品代码',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '机构代码',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '保险起期',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '保险止期',
  `C_CRT_CDE` varchar(30) DEFAULT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime DEFAULT NULL COMMENT '建立时间',
  `C_UPD_CDE` varchar(30) DEFAULT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime DEFAULT NULL COMMENT '修改日期',
  KEY `IDX_CLM_SEQ_CONT` (`C_CLM_NO`,`N_SPLIT_SEQ`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_CATA_CONT` (`C_BALE_CDE`,`C_CONT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超赔出险通知单清单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_inwd`
--

DROP TABLE IF EXISTS `web_ri_clm_inwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_inwd` (
  `C_CLM_INWD_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '理赔分入ID',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '我司赔案号',
  `C_ORIG_CLM_NO` varchar(50) DEFAULT NULL COMMENT '原保单赔案号',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `N_CLM_AMT` decimal(20,2) DEFAULT NULL COMMENT '未决金额',
  `N_ORIG_CLM_AMT` decimal(20,2) DEFAULT NULL COMMENT '原保单未决金额',
  `C_LATEST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '最新标志',
  `C_CLM_STS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案状态：0、暂存；1、提交；2、未决审核退回；3、未决审核通过；4、已决暂存；5、已决提交；6、已决审核退回；7、已决审核通过',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `C_INSURED_NME` varchar(100) DEFAULT NULL COMMENT '被保险人',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `AK_ID_WEB_RI_C` (`C_CLM_INWD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='理赔分入表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_inwd_track`
--

DROP TABLE IF EXISTS `web_ri_clm_inwd_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_inwd_track` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '我司赔案号',
  `N_CLM_AMT` decimal(20,2) DEFAULT NULL COMMENT '未决金额',
  `C_LATEST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '最新标志',
  `C_CLM_STS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案状态：0、暂存；1、提交；2、未决审核退回；3、未决审核通过；4、已决暂存；5、已决提交；6、已决审核退回；7、已决审核通过',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_ID_RI_CLM_INWD_TRACK` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='理赔分入轨迹表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_relat`
--

DROP TABLE IF EXISTS `web_ri_clm_relat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_relat` (
  `C_CLMRELAT_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案关系PKID',
  `C_CLM_NO_OLD` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '原赔案号',
  `N_CLM_TMS_OLD` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '原赔付次数',
  `N_SPLIT_SEQ_OLD` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '原拆分序号,标的风险单位拆分的序号',
  `C_RELAT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '合并/拆散关系0 = 合并(默认) 1 = 拆分',
  `C_CLM_NO_NEW` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '新赔案号',
  `N_CLM_TMS_NEW` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '新赔付次数',
  `N_SPLIT_SEQ_NEW` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '新拆分序号,标的风险单位拆分的序号',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CLM_RELAT` (`C_CLMRELAT_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赔案风险单位拆分或合并单之间的关系,已决赔案和未决赔案公用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_rpt`
--

DROP TABLE IF EXISTS `web_ri_clm_rpt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_rpt` (
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_NOINFO_RPT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_NOINFO_RPT_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RPT_DPT` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_RPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_DSPT_WAY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_SRVY_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_RPT_TM` datetime NOT NULL,
  `C_RPT_WAY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RPTMAN_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RPTMAN_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_RPTMAN_TEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RPTMAN_EMAIL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RPTMAN_ADDR` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_INSURED_REL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_TRANS_TM` datetime DEFAULT NULL,
  `N_CALAM_AREA1` decimal(20,2) DEFAULT NULL,
  `N_CALAM_AREA2` decimal(20,2) DEFAULT NULL,
  `N_NOGAIN_AREA3` decimal(20,2) DEFAULT NULL,
  `N_DEAD_NUM` bigint(22) DEFAULT NULL,
  `T_DEAD` datetime DEFAULT NULL,
  `N_YL1` bigint(22) DEFAULT NULL,
  `N_YL2` bigint(22) DEFAULT NULL,
  `C_YL1` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_YL2` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_YL1` datetime DEFAULT NULL,
  `T_YL2` datetime DEFAULT NULL,
  `N_YL3` decimal(20,2) DEFAULT NULL,
  `N_YL4` decimal(20,2) DEFAULT NULL,
  `N_YL5` bigint(22) DEFAULT NULL,
  `N_YL6` bigint(22) DEFAULT NULL,
  `N_YL7` bigint(22) DEFAULT NULL,
  `N_YL8` decimal(20,2) DEFAULT NULL,
  `C_YL3` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_YL4` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_PROVINCE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '省份',
  `C_CITY` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '城市',
  `C_COUNTY` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '县',
  `C_DSPT_NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '调度员名',
  `C_DSPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '调度员编码',
  `C_CONTACT_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_CONTACT_TEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_CHANNEL` varchar(2) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`C_CLM_NO`),
  UNIQUE KEY `PK_WEB_CLM_RPT` (`C_CLM_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_clm_sts`
--

DROP TABLE IF EXISTS `web_ri_clm_sts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_clm_sts` (
  `C_CLM_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '已决PKID',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `C_CLM_STS_CDE` varchar(100) NOT NULL COMMENT '理赔环节代码',
  `C_CLM_STS_NME` varchar(100) NOT NULL COMMENT '理赔环节名称',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号 Policy No',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL COMMENT '批改序号',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码 Product Code',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构代码 Department No',
  `C_BSNS_TYP` varchar(10) NOT NULL COMMENT '业务来源',
  `T_INSRNC_BGN_TM` datetime NOT NULL COMMENT '保险起期',
  `T_INSRNC_END_TM` datetime NOT NULL COMMENT '保险止期',
  `C_BALE_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '巨灾标识',
  `C_BALE_CDE` varchar(30) DEFAULT NULL COMMENT '巨灾代码',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险日期',
  `C_ACCDNT_CAUS` text COMMENT '出险原因',
  `C_PLACE_LOSS` text COMMENT '出险地点',
  `C_ACCDNT_PROC` text COMMENT '出险经过',
  `T_RGST_TM` datetime DEFAULT NULL COMMENT '立案日期',
  `T_CLS_TM` datetime DEFAULT NULL COMMENT '结案日期',
  `C_RPT_CLS_MRK` varchar(3) NOT NULL COMMENT '理赔环节标志：0=其他，1=报案环节，2=结案环节',
  `C_REOPEN_MRK` varchar(3) NOT NULL COMMENT '重开案标志：0=非重开案环节，1=重开案环节',
  `C_ORG_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '原币种,原赔付金额的币种',
  `N_ORG_CLM_AMT` decimal(20,2) NOT NULL COMMENT '原赔付金额',
  `N_CLM_AMT` decimal(20,2) DEFAULT '0.00' COMMENT '报损金额',
  `C_RI_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保币种：人民币',
  `N_RI_CLM_AMT` decimal(20,2) NOT NULL COMMENT '再保赔付金额',
  `N_CHG_RATE` decimal(10,6) NOT NULL COMMENT '兑换率',
  `C_IS_READ` varchar(2) DEFAULT '0' COMMENT '轮询标识',
  `N_TMS` decimal(4,0) DEFAULT '1' COMMENT '转入次数',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  KEY `IDX_CLM_SEQ` (`C_CLM_NO`,`N_SPLIT_SEQ`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='案件最新环节状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_close_bill_date`
--

DROP TABLE IF EXISTS `web_ri_close_bill_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_close_bill_date` (
  `C_YM` varchar(9) DEFAULT NULL COMMENT '年月',
  `T_BGN_TM` datetime DEFAULT NULL COMMENT '账单起始日期,上一账单期止期+1',
  `T_END_TM` datetime DEFAULT NULL COMMENT '账单终止日期',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '状态A= 未出帐B= 正在试出帐C= 已经试出帐D= 正在确认E= 已经确认(月度)F=试出账失败G=出账确认失败H=已经确认(季度)',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CLOSE_BILL_DATE` (`C_YM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关账日期设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_com`
--

DROP TABLE IF EXISTS `web_ri_com`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_com` (
  `C_COM_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保公司代码',
  `C_COM_CNM` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '中文名称',
  `C_COM_ENM` varchar(100) DEFAULT NULL COMMENT '英文名称',
  `C_ABBR` varchar(50) DEFAULT NULL COMMENT '缩写',
  `C_ADDRESS` text COMMENT '地址',
  `C_PHONE` varchar(50) DEFAULT NULL COMMENT '电话',
  `C_FAX` varchar(30) DEFAULT NULL COMMENT '传真',
  `C_ATTRIB` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公司属性,''A''境内,''B''境外',
  `C_SELF_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '我司标志,''0''否,''1''是',
  `C_LINKMAN` varchar(100) DEFAULT NULL COMMENT '联系人',
  `C_COUNTRY` varchar(30) DEFAULT NULL COMMENT '国家地区',
  `C_CREDIT` varchar(30) DEFAULT NULL COMMENT '信用等级',
  `C_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务类型,''I'' 分入,''O'' 分出,''B'' Both',
  `C_NATURE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公司类型,''A''保险公司,''B''经纪公司,''C''再保公司',
  `C_BILL_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'C' COMMENT '账单类型,''C''中文,''E''英文',
  `C_PAY_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'C' COMMENT '付款方式,''C''支票,''T''电汇',
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '有效状态,''0''失效,''1''有效',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '更新时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人代码',
  `C_EVAL_DPT_CDE` varchar(50) DEFAULT NULL COMMENT '评级机构',
  `N_CAPITAL` decimal(20,2) DEFAULT NULL COMMENT '资本金',
  `C_CAPITAL_CUR` varchar(30) DEFAULT NULL COMMENT '资本金币种',
  `N_RMB_CAPITAL` decimal(20,2) DEFAULT NULL COMMENT '资本金折人民币金额',
  `N_INTER_SOLV` decimal(10,6) DEFAULT NULL COMMENT '境内偿付能力,境内再保人的偿付能力,是一个百分数比例',
  `C_EXTER_SOLV` varchar(1) DEFAULT NULL COMMENT '境外偿付能力,境外再保人的偿付能力:‘1’是，‘2’ 否',
  `C_RELAT` varchar(1) DEFAULT NULL COMMENT '是否关联方,是否关联方 ''A'' 股东, ''B'' 股东的控制方, ''C'' 受同一第三方控制, ''D'' 子公司, ''E'' 其它关联关系 ''F'' 非关联方',
  `C_ADDRESS_ENM` text COMMENT '英文详细地址',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `C_MAP_COM_CDE` varchar(30) DEFAULT NULL COMMENT '收付映射再保人代码',
  `C_COUNTRY_FINAL` varchar(30) DEFAULT NULL COMMENT '最终风险承担者所在国家或地区',
  `C_MARKET_FINAL` varchar(30) DEFAULT NULL COMMENT '最终风险承担者所属再保险市场',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `C_CIRC_REINSURER_CDE` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保监对应再保人编码',
  `C_BLACKLIST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否黑名单',
  UNIQUE KEY `PK_WEB_RI_COM` (`C_COM_CDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='再保公司/再保经纪公司/其他保险公司';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_brkr_com_share`
--

DROP TABLE IF EXISTS `web_ri_cont_brkr_com_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_brkr_com_share` (
  `C_BRKRCOM_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约经纪公司PKID',
  `C_COMSHARE_PK_ID` varchar(50) DEFAULT NULL COMMENT '再保公司PKID',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_BRKR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪公司代码',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保公司代码',
  `N_SHARE_PRPT` decimal(10,6) DEFAULT NULL COMMENT '参与比例',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_BRKR_COM_SHARE` (`C_BRKRCOM_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约经纪公司分出比例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_cmp_item`
--

DROP TABLE IF EXISTS `web_ri_cont_cmp_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_cmp_item` (
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `N_CONT_EDR_PRJ_NO` decimal(4,0) DEFAULT '1' COMMENT '合同批改次数,用来区分合同号与合同分项号所确定的合约的多次批改',
  `N_SECTION_NO` decimal(4,0) DEFAULT '1' COMMENT '合同分项号,用来区分同一个合同不同的分项(或称SECTION)',
  `N_SEQ_NO` decimal(4,0) DEFAULT NULL COMMENT '变化项序号',
  `C_FIELD_ID` varchar(30) DEFAULT NULL COMMENT '字段ID',
  `C_REL_TABLE` varchar(50) DEFAULT NULL COMMENT '参考数据库表',
  `C_REL_FLD` varchar(50) DEFAULT NULL COMMENT '参考字段',
  `C_FLD_NME` varchar(200) DEFAULT NULL COMMENT '字段名称',
  `C_OLD_VAL` text COMMENT '字段旧值',
  `C_NEW_VAL` text COMMENT '字段新值',
  `C_CHG_VAL` varchar(200) DEFAULT NULL COMMENT '变化量',
  `C_DATA_TYP` varchar(30) DEFAULT NULL COMMENT '字段类型',
  `C_TAB_NME` varchar(200) DEFAULT NULL COMMENT '表名称',
  `N_TAB_ROW_NO` decimal(8,0) DEFAULT NULL COMMENT '表的行号',
  `C_DEL_MRK` varchar(1) DEFAULT NULL COMMENT '是否删除标志',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '自然主键',
  `C_CONT_MAIN_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约主档表PKID',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_CMP_ITEM` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='再保合约批改项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_code`
--

DROP TABLE IF EXISTS `web_ri_cont_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_code` (
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_TYP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约类型码',
  `C_CONT_CNM` varchar(100) DEFAULT NULL COMMENT '合约中文名',
  `C_CONT_ENM` varchar(100) DEFAULT NULL COMMENT '合约英文名',
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '有效状态,''0''失效,''1''有效',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间 ',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_CODE` (`C_CONT_CDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_com_share`
--

DROP TABLE IF EXISTS `web_ri_cont_com_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_com_share` (
  `C_COMSHARE_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保公司PKID',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保公司代码',
  `C_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司,''0''否,''1''是',
  `N_SHARE_PRPT` decimal(10,6) DEFAULT NULL COMMENT '参与比例',
  `N_QUOTA` decimal(20,2) DEFAULT NULL COMMENT '接受限额,预留',
  `N_LAYER` decimal(4,0) DEFAULT NULL COMMENT '超赔层数,非比例合约需要',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `C_CONT_MAIN_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约主档表PKID',
  `C_BRKR_COM` varchar(30) DEFAULT NULL COMMENT '经纪公司代码',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_COM_SHARE` (`C_COMSHARE_PK_ID`),
  KEY `IDX_COM_SHARE_1` (`C_CONT_ID`),
  KEY `IDX_COM_SHARE_2` (`C_RI_COM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约再保公司分出比例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_comm_adjust`
--

DROP TABLE IF EXISTS `web_ri_cont_comm_adjust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_comm_adjust` (
  `C_COMMADJUST_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '合约手续费调整主键ID',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_PROD_NO` varchar(6) DEFAULT '*' COMMENT '险种,当为*时，表示全部',
  `C_RI_COM` varchar(30) DEFAULT '*' COMMENT '再保公司,当为*时，表示全部',
  `C_SEC_ID` varchar(30) DEFAULT '*' COMMENT 'SECTION ID,当为*时，表示全部',
  `N_ADJUST_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '调整后手续费率',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_RISK_LVL_CDE` varchar(30) DEFAULT '*' COMMENT '风险等级',
  `C_STATUS` varchar(1) DEFAULT '0' COMMENT '状态,''0''未确认,''1''已确认',
  `C_CONT_MAIN_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约主档表PKID',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_COMM_ADJUST` (`C_COMMADJUST_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约手续费调整表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_dtl`
--

DROP TABLE IF EXISTS `web_ri_cont_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_dtl` (
  `C_CONTDTL_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约明细主键ID',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_CONT_CDE` varchar(30) DEFAULT NULL COMMENT '合约代码,冗余字段',
  `C_DPT_CDE` varchar(30) DEFAULT '*' COMMENT '合约分出机构,缺省为*表示全部机构适应，如为某一指定机构代码则只适应该机构',
  `C_RIKIND_NO` varchar(2) DEFAULT NULL COMMENT '险类代码',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码',
  `C_RISK_LVL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '*' COMMENT '风险等级',
  `C_RI_COM` varchar(30) DEFAULT NULL COMMENT '再保公司',
  `N_QS_PRPT` decimal(10,6) DEFAULT '0.000000' COMMENT '合约成数比例,成数合约、成数溢额合约时用',
  `N_SHARE_PRPT` decimal(10,6) DEFAULT NULL COMMENT '再保公司比例',
  `N_RET_LMT` decimal(20,2) DEFAULT '0.00' COMMENT '自留限额(人民币),溢额合约使用',
  `N_LINE` decimal(4,0) DEFAULT '0' COMMENT '线数,溢额合约使用',
  `N_CONT_LMT` decimal(20,2) DEFAULT '0.00' COMMENT '合约限额',
  `C_CONT_CUR` varchar(30) DEFAULT NULL COMMENT '合约限额币种,固定为人民币',
  `N_INW_COEF` decimal(10,6) DEFAULT '1.000000' COMMENT '分入业务系数,溢额合约使用',
  `N_VIP_LINE` decimal(4,0) DEFAULT '0' COMMENT 'VIP线数,溢额合约使用',
  `N_VIP_LMT` decimal(20,2) DEFAULT '0.00' COMMENT 'VIP自留额,溢额合约使用',
  `C_RIPRM_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'G' COMMENT '保费基础,''G''毛保费,''N''净保费，冗余字段',
  `C_SEC_ID` varchar(30) DEFAULT NULL COMMENT 'SECTION ID',
  `N_ACT_COMM_RATE` decimal(10,6) DEFAULT '0.000000' COMMENT '实际手续费率',
  `N_DUTY_RATE` decimal(10,6) DEFAULT '0.000000' COMMENT '税率',
  `N_DUTY_ADD_RATE` decimal(10,6) DEFAULT '0.000000' COMMENT '附加税率',
  `T_CONT_BGN_TM` datetime NOT NULL COMMENT '生效起期',
  `T_CONT_END_TM` datetime NOT NULL COMMENT '生效止期',
  `C_APPEND_MRK` varchar(1) DEFAULT '0' COMMENT '追加标志,''0''否,''1''是，当合约生效后，后续追加的产品进行标识',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `C_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否经纪公司,''0''否,''1''是',
  `C_HAS_TAX_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '手续费含税标志,''0''否,''1''是',
  `C_BRKR_CDE` varchar(30) DEFAULT NULL COMMENT '经纪公司/再保公司代码',
  `N_COMM_RATE_LINE` decimal(10,6) DEFAULT '0.000000' COMMENT '溢额手续费率,成数溢额混合合约和溢额合约的溢额部分手续费率',
  `N_CI_MAIN_COEF` decimal(10,6) DEFAULT '1.000000' COMMENT '主共溢额系数,我方主共保时溢额合约使用',
  `N_CI_FROM_COEF` decimal(10,6) DEFAULT '1.000000' COMMENT '从共溢额系数,我方从共保时溢额合约使用',
  `N_CI_MAIN_STOCK_COEF` decimal(10,6) DEFAULT '1.000000' COMMENT '主共股东溢额系数,我方主共保并且为股东业务时溢额合约使用',
  `N_CI_FROM_STOCK_COEF` decimal(10,6) DEFAULT '1.000000' COMMENT '从共股东溢额系数,我方从共保并且为股东业务时溢额合约使用',
  `C_CONT_MAIN_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约主档表PKID',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `N_SUBSIDY_LINE` decimal(4,0) DEFAULT NULL COMMENT '补贴线数,补贴业务',
  `N_SUBSIDY_LMT` decimal(20,2) DEFAULT NULL COMMENT '补贴自留额,补贴业务',
  UNIQUE KEY `PK_WEB_RI_CONT_DTL` (`C_CONTDTL_PK_ID`),
  KEY `IDX_CONT_DTL_1` (`C_CONT_ID`),
  KEY `IDX_CONT_DTL_2` (`C_CONT_CDE`),
  KEY `IDX_CONT_DTL_3` (`C_PROD_NO`),
  KEY `IDX_CONT_DTL_4` (`C_RISK_LVL_CDE`),
  KEY `IDX_CONT_DTL_5` (`C_RI_COM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_el_adj_main`
--

DROP TABLE IF EXISTS `web_ri_cont_el_adj_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_el_adj_main` (
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_CONT_CNM` varchar(50) DEFAULT NULL COMMENT '合约名称',
  `C_EL_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '超赔类型,R=险位超赔(默认),E=事故超赔,P=赔付率超赔、H=险位事故混合超赔',
  `C_UW_YEAR` varchar(4) DEFAULT NULL COMMENT '业务年度',
  `T_CONT_BGN_TM` datetime NOT NULL COMMENT '起始日期',
  `T_CONT_END_TM` datetime NOT NULL COMMENT '结束日期',
  `N_MDP` decimal(20,2) NOT NULL COMMENT 'MDP',
  `N_MDP_ADJ` decimal(20,2) DEFAULT NULL COMMENT 'MDP调整保费',
  `N_RESET_PRM_ADJ` decimal(20,2) DEFAULT NULL COMMENT '重置调整保费',
  `C_EL_CALC_TYPE` varchar(1) DEFAULT NULL COMMENT '超赔计算方式，R：GNPI、A：EGNPI',
  `C_ADJ_STATUS` varchar(1) DEFAULT NULL COMMENT '调整保费状态(0:未调整；1：已调整；2：已确认；3：已生成)',
  `T_CRT_TM` datetime DEFAULT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) DEFAULT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime DEFAULT NULL COMMENT '修改日期',
  `C_UPD_CDE` varchar(30) DEFAULT NULL COMMENT '修改人员',
  `T_BILL_TM` datetime DEFAULT NULL COMMENT '账单生成时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_EL_ADJ_MAIN` (`C_CONT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超赔保费调整基本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_el_class`
--

DROP TABLE IF EXISTS `web_ri_cont_el_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_el_class` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_CONT_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `C_KIND_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险类代码',
  `C_PROD_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险种代码',
  `C_PROD_NME` varchar(100) DEFAULT NULL COMMENT '险种名称',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `N_RET_AMT` decimal(20,2) DEFAULT NULL COMMENT '自留额',
  `N_GNPI` decimal(20,2) DEFAULT NULL COMMENT '预估GNPI',
  `C_ADD_TYPE` varchar(1) DEFAULT NULL COMMENT '追加类型：0非追加、1追加',
  `C_STATUS` varchar(1) DEFAULT NULL COMMENT '状态：1未审核、2已审核',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_EL_CLASS` (`C_PK_ID`),
  KEY `IDX_WEB_RI_CONT_EL_CLASS` (`C_CONT_ID`,`N_LAYER`,`C_KIND_NO`,`C_PROD_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约层下险种信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_el_com_share`
--

DROP TABLE IF EXISTS `web_ri_cont_el_com_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_el_com_share` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `C_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司,''0''否,''1''是',
  `C_BRKR_CDE` varchar(30) DEFAULT NULL COMMENT '经纪公司代码',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保公司',
  `N_SHARE_PRPT` decimal(10,6) NOT NULL COMMENT '参与比例',
  `N_CED_PRM` decimal(20,2) DEFAULT NULL COMMENT '预付分保费',
  `N_DUTY` decimal(20,2) DEFAULT NULL COMMENT '增值税',
  `N_DUTY_ADD` decimal(20,2) DEFAULT NULL COMMENT '增值税附加税',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_EL_CONT_SHARE` (`C_PK_ID`),
  KEY `IDX_WEB_RI_CONT_EL_COM_SHARE` (`C_CONT_ID`,`N_LAYER`,`C_BRKR_CDE`,`C_RI_COM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约层下再保人参与比例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_el_com_share_20190524`
--

DROP TABLE IF EXISTS `web_ri_cont_el_com_share_20190524`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_el_com_share_20190524` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `C_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司,''0''否,''1''是',
  `C_BRKR_CDE` varchar(30) DEFAULT NULL COMMENT '经纪公司代码',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保公司',
  `N_SHARE_PRPT` decimal(10,6) NOT NULL COMMENT '参与比例',
  `N_CED_PRM` decimal(20,2) DEFAULT NULL COMMENT '预付分保费',
  `N_DUTY` decimal(20,2) DEFAULT NULL COMMENT '增值税',
  `N_DUTY_ADD` decimal(20,2) DEFAULT NULL COMMENT '增值税附加税',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_el_estimate_gnpi`
--

DROP TABLE IF EXISTS `web_ri_cont_el_estimate_gnpi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_el_estimate_gnpi` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_CONT_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_KIND_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险类代码',
  `C_PROD_NO` varchar(30) DEFAULT NULL COMMENT '险种代码',
  `N_GNPI` decimal(20,2) DEFAULT NULL COMMENT '预估GNPI值',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `N_RET_AMT` decimal(20,2) DEFAULT NULL COMMENT '自留额',
  `C_TYPE` varchar(1) DEFAULT NULL COMMENT '数据状态：0有效、1排除',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  KEY `IDX_RI_CONT_EL_ESTIMATE_GNPI` (`C_CONT_ID`,`C_KIND_NO`,`C_PROD_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='险种预估GNPI信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_el_layer`
--

DROP TABLE IF EXISTS `web_ri_cont_el_layer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_el_layer` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `N_START_POINT` decimal(20,6) NOT NULL COMMENT '起赔点，赔付率超赔为：起损率',
  `N_LAYER_LMT` decimal(20,6) NOT NULL COMMENT '限额，赔付率超赔为：止损率',
  `N_BUFFER` decimal(10,6) DEFAULT NULL COMMENT 'BUFFER',
  `C_RI_CUR` varchar(30) DEFAULT NULL COMMENT '再保币种',
  `N_ESTIMATE_GNPI` decimal(20,2) DEFAULT NULL COMMENT '层预估GNPI',
  `N_LAYER_RATE` decimal(14,10) DEFAULT NULL COMMENT '层费率',
  `N_ROL` decimal(10,6) DEFAULT NULL COMMENT 'ROL',
  `N_LAYER_PRM` decimal(20,2) DEFAULT NULL COMMENT '层保费',
  `N_FLAT_PRM` decimal(20,2) DEFAULT '0.00' COMMENT '附加保费',
  `N_PRE_PRPT` decimal(10,6) DEFAULT NULL COMMENT '预付比例',
  `N_MDP` decimal(20,2) DEFAULT NULL COMMENT 'MDP最低预付分保费',
  `N_DUTY_RATE` decimal(10,6) NOT NULL COMMENT '增值税率',
  `N_DUTY_ADD_RATE` decimal(10,6) NOT NULL COMMENT '增值税附加税率',
  `N_DUTY` decimal(20,2) DEFAULT NULL COMMENT '增值税',
  `N_DUTY_ADD` decimal(20,2) DEFAULT NULL COMMENT '增值税附加税',
  `N_RECOVER_TMS` decimal(4,0) DEFAULT NULL COMMENT '层责任恢复次数',
  `N_TOTAL_LMT` decimal(20,2) NOT NULL COMMENT '总责任限额',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `C_LAYER_TYP` varchar(1) DEFAULT NULL COMMENT '层类型：0 险位、1 事故、2 混合',
  `N_LAYER_LMTPRM` decimal(20,2) DEFAULT NULL COMMENT '最大赔偿金额',
  `N_STARTPOINT_PRM` decimal(20,2) DEFAULT NULL COMMENT '最低起赔限额',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `N_REMAIN_LMT` decimal(20,2) DEFAULT '-1.00' COMMENT '剩余总责任限额',
  KEY `IDX_WEB_RI_CONT_EL_LAYER` (`C_CONT_ID`,`N_LAYER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约层信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_el_layer_20190524`
--

DROP TABLE IF EXISTS `web_ri_cont_el_layer_20190524`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_el_layer_20190524` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `N_START_POINT` decimal(20,6) NOT NULL COMMENT '起赔点，赔付率超赔为：起损率',
  `N_LAYER_LMT` decimal(20,6) NOT NULL COMMENT '限额，赔付率超赔为：止损率',
  `N_BUFFER` decimal(10,6) DEFAULT NULL COMMENT 'BUFFER',
  `C_RI_CUR` varchar(30) DEFAULT NULL COMMENT '再保币种',
  `N_ESTIMATE_GNPI` decimal(20,2) DEFAULT NULL COMMENT '层预估GNPI',
  `N_LAYER_RATE` decimal(14,10) DEFAULT NULL COMMENT '层费率',
  `N_ROL` decimal(10,6) DEFAULT NULL COMMENT 'ROL',
  `N_LAYER_PRM` decimal(20,2) DEFAULT NULL COMMENT '层保费',
  `N_PRE_PRPT` decimal(10,6) DEFAULT NULL COMMENT '预付比例',
  `N_MDP` decimal(20,2) DEFAULT NULL COMMENT 'MDP最低预付分保费',
  `N_DUTY_RATE` decimal(10,6) NOT NULL COMMENT '增值税率',
  `N_DUTY_ADD_RATE` decimal(10,6) NOT NULL COMMENT '增值税附加税率',
  `N_DUTY` decimal(20,2) DEFAULT NULL COMMENT '增值税',
  `N_DUTY_ADD` decimal(20,2) DEFAULT NULL COMMENT '增值税附加税',
  `N_RECOVER_TMS` decimal(4,0) DEFAULT NULL COMMENT '层责任恢复次数',
  `N_TOTAL_LMT` decimal(20,2) NOT NULL COMMENT '总责任限额',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `C_LAYER_TYP` varchar(1) DEFAULT NULL COMMENT '层类型：0 险位、1 事故、2 混合',
  `N_LAYER_LMTPRM` decimal(20,2) DEFAULT NULL COMMENT '最大赔偿金额',
  `N_STARTPOINT_PRM` decimal(20,2) DEFAULT NULL COMMENT '最低起赔限额',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_el_layer_reset`
--

DROP TABLE IF EXISTS `web_ri_cont_el_layer_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_el_layer_reset` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '恢复次数',
  `C_RESET_TYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '恢复类型，0 FREE，1固定比例，2 时间比例',
  `N_RESET_PRPT` decimal(10,6) DEFAULT NULL COMMENT '恢复比例',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `N_REMAIN_RESET_LMT` decimal(20,2) DEFAULT '-1.00' COMMENT '剩余恢复限额',
  UNIQUE KEY `PK_WEB_RI_CONT_EL_LAYER_RESET` (`C_PK_ID`),
  KEY `IDX_WEB_RI_CONT_EL_LAYER_RESET` (`C_CONT_ID`,`N_LAYER`,`N_TMS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='层恢复信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_el_main`
--

DROP TABLE IF EXISTS `web_ri_cont_el_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_el_main` (
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_CNM` varchar(50) DEFAULT NULL COMMENT '合约名称',
  `C_CONT_NO` varchar(30) DEFAULT NULL COMMENT '合同号',
  `T_CONT_SIGN_TM` datetime DEFAULT NULL COMMENT '合约签订日期',
  `C_UW_YEAR` varchar(4) DEFAULT NULL COMMENT '业务年度',
  `T_CONT_BGN_TM` datetime NOT NULL COMMENT '起始日期',
  `T_CONT_END_TM` datetime NOT NULL COMMENT '结束日期',
  `C_EL_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '超赔类型,R=险位超赔(默认),E=事故超赔,P=赔付率超赔、H=险位事故混合超赔',
  `C_EL_CALC_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '超赔计算方式，R：GNPI、A：EGNPI',
  `C_CONT_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约币种',
  `N_CHG_RATE` decimal(10,6) NOT NULL COMMENT '合约币种兑人民币汇率',
  `C_REMARK` text COMMENT '备注',
  `C_CONT_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约状态,''T''未审核,''E''已审核,''P''已终止',
  `C_MDP_STATUS` varchar(1) DEFAULT NULL COMMENT '预付分保费状态',
  `C_ADJ_STATUS` varchar(1) DEFAULT NULL COMMENT '调整保费状态:0未调整，1已调整，2已生成账单，3已收付',
  `C_AUD_CDE` varchar(30) DEFAULT NULL COMMENT '合约审核人',
  `T_AUD_TM` datetime DEFAULT NULL COMMENT '合约审核时间',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `C_CEK_STATUS` varchar(1) DEFAULT NULL COMMENT '赔付率核算状态，0:未核算，1:已核算，2:已确认',
  `N_PEND_CONF_PRPT` decimal(10,6) DEFAULT NULL COMMENT '未决确认比例',
  `T_BILL_TM` datetime DEFAULT NULL COMMENT '账单生成时间(赔付率核算处理)',
  `T_PEND_CONF_TM` datetime DEFAULT NULL COMMENT '未决确认时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_EL_MAIN` (`C_CONT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约超赔基本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_el_mechanismdpt`
--

DROP TABLE IF EXISTS `web_ri_cont_el_mechanismdpt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_el_mechanismdpt` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_EL_MECHANISMDPT` (`C_PK_ID`),
  KEY `IDX_RI_CONT_EL_MECHANISMDPT` (`C_CONT_ID`,`C_DPT_CDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约适用机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_el_pay`
--

DROP TABLE IF EXISTS `web_ri_cont_el_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_el_pay` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '期次',
  `T_PAY_BGN_TM` datetime NOT NULL COMMENT '付款起期',
  `T_PAY_END_TM` datetime NOT NULL COMMENT '付款止期',
  `N_PAY_AMT` decimal(20,2) NOT NULL COMMENT '付款金额',
  `N_DUTY` decimal(20,2) DEFAULT NULL COMMENT '境内增值税',
  `N_DUTY_B` decimal(20,2) DEFAULT NULL COMMENT '境外增值税',
  `N_DUTY_ADD` decimal(20,2) DEFAULT NULL COMMENT '增值税附加税',
  `N_PAY_PRPT` decimal(10,6) DEFAULT NULL COMMENT '付款比例',
  `N_MDP_AMT` decimal(20,2) DEFAULT NULL COMMENT 'MDP(元)',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRTDATA_STATUS` varchar(1) DEFAULT NULL COMMENT '是否已生成分摊基础数据:0(未生成)、1(已生成)',
  `C_BILL_STATUS` varchar(1) DEFAULT NULL COMMENT '是否已生成账单基础数据:0(未生成账单基础数据)、1(已生成账单基础数据或未生成账单)，2(已生成账单)',
  `T_BILL_TM` datetime DEFAULT NULL COMMENT '账单生成时间',
  `C_REMARK` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_EL_PAY` (`C_PK_ID`),
  KEY `IDX_WEB_RI_CONT_EL_PAY` (`C_CONT_ID`,`N_LAYER`,`N_TMS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约层下分期缴费计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_el_pay_20190524`
--

DROP TABLE IF EXISTS `web_ri_cont_el_pay_20190524`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_el_pay_20190524` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '期次',
  `T_PAY_BGN_TM` datetime NOT NULL COMMENT '付款起期',
  `T_PAY_END_TM` datetime NOT NULL COMMENT '付款止期',
  `N_PAY_AMT` decimal(20,2) NOT NULL COMMENT '付款金额',
  `N_DUTY` decimal(20,2) DEFAULT NULL COMMENT '境内增值税',
  `N_DUTY_B` decimal(20,2) DEFAULT NULL COMMENT '境外增值税',
  `N_DUTY_ADD` decimal(20,2) DEFAULT NULL COMMENT '增值税附加税',
  `N_PAY_PRPT` decimal(10,6) DEFAULT NULL COMMENT '付款比例',
  `N_MDP_AMT` decimal(20,2) DEFAULT NULL COMMENT 'MDP(元)',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRTDATA_STATUS` varchar(1) DEFAULT NULL COMMENT '是否已生成分摊基础数据:0(未生成)、1(已生成)',
  `C_BILL_STATUS` varchar(1) DEFAULT NULL COMMENT '是否已生成账单基础数据:0(未生成账单基础数据)、1(已生成账单基础数据或未生成账单)，2(已生成账单)',
  `T_BILL_TM` datetime DEFAULT NULL COMMENT '账单生成时间',
  `C_REMARK` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_excl_info`
--

DROP TABLE IF EXISTS `web_ri_cont_excl_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_excl_info` (
  `C_EXCLINFO_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键id',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_DPT_CDE` varchar(30) DEFAULT '*' COMMENT '分支机构,*表示忽略该项',
  `C_RI_COM` varchar(30) DEFAULT '*' COMMENT '再保公司',
  `C_PROD_NO` varchar(6) DEFAULT '*' COMMENT '险种',
  `C_CVRG_NO` varchar(6) DEFAULT '*' COMMENT '险别',
  `C_RISK_LVL_CDE` varchar(30) DEFAULT '*' COMMENT '风险等级',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `C_CONT_MAIN_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约主档表PKID',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_EXCL_INFO` (`C_EXCLINFO_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包括除外机构、产品、险别、风险等级等信息的描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_float_comm`
--

DROP TABLE IF EXISTS `web_ri_cont_float_comm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_float_comm` (
  `C_FLOATCOMM_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约浮动手续费率PKID',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LOSS_RATIO` decimal(10,6) NOT NULL COMMENT '赔付率',
  `N_ACT_COMM_RATE` decimal(10,6) NOT NULL COMMENT '手续费率',
  `N_COMM_RATE_LINE` decimal(10,6) DEFAULT '0.000000' COMMENT '溢额手续费率,成数溢额混合合约和溢额合约的溢额部分手续费率',
  `N_DUTY_RATE` decimal(10,6) DEFAULT NULL COMMENT '税率',
  `C_HAS_TAX_MRK` varchar(1) DEFAULT '0' COMMENT '手续费是否含税,''0''否(默认),''1''是',
  `N_MARGIN_RATE` decimal(10,6) DEFAULT NULL COMMENT '再保人准备金比例',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `C_CONT_MAIN_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约主档表PKID',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_FLOAT_COMM` (`C_FLOATCOMM_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约浮动手续费率表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_main`
--

DROP TABLE IF EXISTS `web_ri_cont_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_main` (
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_DESC` text COMMENT '合约描述',
  `C_CONTRACT_NO` varchar(30) DEFAULT NULL COMMENT '合同号',
  `T_CONT_BGN_TM` datetime DEFAULT NULL COMMENT '有效起期，合约实际生效的起期',
  `T_CONT_END_TM` datetime DEFAULT NULL COMMENT '有效止期，合约实际生效的止期',
  `T_CONT_SIGN_TM` datetime DEFAULT NULL COMMENT '合约签订日期',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '合约分出机构',
  `C_CONTI_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '新/续标志,''0''新,''1''续',
  `C_ORIG_CONT_ID` varchar(50) DEFAULT NULL COMMENT '原合约标识号',
  `C_CONT_CUR` varchar(30) DEFAULT NULL COMMENT '合约币种',
  `C_RICAL_MRK` varchar(1) DEFAULT 'R' COMMENT '分保基础,''P''保单,''R''风险单位',
  `C_RIPRM_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'G' COMMENT '保费基础,''G''毛保费,''N''净保费',
  `C_STL_TYP` varchar(1) DEFAULT NULL COMMENT '结清类型,''0''按合同终止日，''1''按责任终止日',
  `C_UW_YEAR` varchar(4) DEFAULT NULL COMMENT '业务年度',
  `C_ACC_CYCLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Q' COMMENT '账单周期,''M''月,''Q''季度,''H''半年,''Y''年',
  `T_LOGOUT_TM` datetime DEFAULT NULL COMMENT '合同注销时限',
  `N_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '手续费率',
  `N_DUTY_RATE` decimal(10,6) DEFAULT NULL COMMENT '税率',
  `C_HAS_TAX_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '手续费是否含税,''0''否,''1''是',
  `N_ACT_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '实际手续费率',
  `N_QS_PRPT` decimal(10,6) DEFAULT NULL COMMENT '成数比例',
  `N_LINE` decimal(4,0) DEFAULT NULL COMMENT '线数',
  `N_CASHLOSS_BGN` decimal(20,2) DEFAULT NULL COMMENT '现金赔款起点',
  `N_MNGFEE_RATE` decimal(10,6) DEFAULT NULL COMMENT '管理费率',
  `C_CHIEF_RICOM` varchar(30) DEFAULT NULL COMMENT '首席再保人',
  `N_CHIEF_SHARE` decimal(10,6) DEFAULT NULL COMMENT '首席再保人份额',
  `C_PRM_RESV_WAY` varchar(1) DEFAULT '0' COMMENT '保费准备金提取方式,''0''按未到期责任计算,''1''指定比例',
  `N_PRM_RESV_PRPT` decimal(10,6) DEFAULT NULL COMMENT '保费准备金比例',
  `N_CLM_RESV_PRPT` decimal(10,6) DEFAULT NULL COMMENT '赔款准备金比例',
  `N_CYCLE` decimal(4,0) DEFAULT NULL COMMENT '核算周期',
  `C_LOSS_CVT_MRK` varchar(1) DEFAULT '0' COMMENT '亏损转换标志''0''否,''1''是',
  `N_LOSS_CVT_YEAR` decimal(4,0) DEFAULT NULL COMMENT '亏损滚转年数',
  `N_PROF_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '纯益手续费率',
  `N_UE_PRM_PRPT` decimal(10,6) DEFAULT NULL COMMENT '未满期保费比例,合同结清时的转入，转出',
  `N_OS_CLM_PRPT` decimal(10,6) DEFAULT NULL COMMENT '未决赔款比例,合同结清时的转入，转出',
  `N_EQ_PRM_PRPT` decimal(10,6) DEFAULT NULL COMMENT '地震险保费比例',
  `N_EQ_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '地震险手续费率',
  `C_INW_QS_WAY` varchar(1) DEFAULT '0' COMMENT '分入业务溢额系数方式,''0''按分入比例,''1''指定系数',
  `N_INW_QS_COEF` decimal(10,6) DEFAULT NULL COMMENT '分入业务限额系数',
  `C_REMARK` text COMMENT '备注',
  `C_CONT_STATUS` varchar(1) DEFAULT NULL COMMENT '合约状态,''T''未审核,''E''已审核,''P''已终止',
  `C_AUD_CDE` varchar(30) DEFAULT NULL COMMENT '合约审核人',
  `T_AUD_TM` datetime DEFAULT NULL COMMENT '合约审核时间',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `N_CONT_LMT` decimal(20,2) DEFAULT NULL COMMENT '限额，合约中公用限额',
  `N_CONT_CHG_RATE` decimal(10,6) DEFAULT NULL COMMENT '合约币种兑人民币汇率,分保计算用人民币比较',
  `N_COMM_RATE_LINE` decimal(10,6) DEFAULT '0.000000' COMMENT '溢额手续费率,成数溢额混合合约和溢额合约的溢额部分手续费率',
  `T_CONT_ORIG_BGN_TM` datetime DEFAULT NULL COMMENT '合同起期,合同上约定起期，不代表当前合约实际生效的起期。',
  `T_CONT_ORIG_END_TM` datetime DEFAULT NULL COMMENT '合同止期,合同上约定止期，不代表当前合约实际生效的止期。',
  `N_CONT_EDR_PRJ_NO` decimal(4,0) DEFAULT '1' COMMENT '合同批改次数,用来区分合同号与合同分项号所确定的合约的多次批改',
  `N_SECTION_NO` decimal(4,0) DEFAULT '1' COMMENT '合同分项号,用来区分同一个合同不同的分项(或称SECTION)',
  `C_CI_MAIN_WAY` varchar(1) DEFAULT '0' COMMENT '主共溢额系数方式,''0''按共保比例,''1''指定系数',
  `N_CI_MAIN_COEF` decimal(10,6) DEFAULT '1.000000' COMMENT '主共溢额系数,我方主共保时溢额合约使用',
  `C_CI_FROM_WAY` varchar(1) DEFAULT '0' COMMENT '从共溢额系数方式,''0''按共保比例,''1''指定系数',
  `N_CI_FROM_COEF` decimal(10,6) DEFAULT '1.000000' COMMENT '从共溢额系数,我方从共保时溢额合约使用',
  `C_CI_MAIN_STOCK_WAY` varchar(1) DEFAULT '0' COMMENT '主共股东溢额系数方式,''0''按共保比例,''1''指定系数',
  `N_CI_MAIN_STOCK_COEF` decimal(10,6) DEFAULT '1.000000' COMMENT '主共股东溢额系数,我方主共保并且为股东业务时溢额合约使用',
  `C_CI_FROM_STOCK_WAY` varchar(1) DEFAULT '0' COMMENT '从共股东溢额系数方式,''0''按共保比例,''1''指定系数',
  `N_CI_FROM_STOCK_COEF` decimal(10,6) DEFAULT '1.000000' COMMENT '从共股东溢额系数,我方从共保并且为股东业务时溢额合约使用',
  `N_BILL_DUNNING_DAYS` decimal(6,0) DEFAULT NULL COMMENT '账单缴费期限',
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '自然主键',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `N_FEE_AMT` decimal(20,2) DEFAULT NULL COMMENT '合约起点，提供核心用',
  `N_ENSURE_CYCLE` decimal(4,0) DEFAULT NULL,
  `N_ENSURE_RATE` decimal(10,6) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `N_VAT_RATE` decimal(10,6) DEFAULT NULL COMMENT '增值税费率',
  `N_VAT_EXTRA_RATE` decimal(10,6) DEFAULT NULL COMMENT '增值税代扣代缴附加税费率',
  UNIQUE KEY `PK_WEB_RI_CONT_MAIN` (`C_PK_ID`),
  KEY `IDX_CONT_MAIN_1` (`C_UW_YEAR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约资料主档信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_priority`
--

DROP TABLE IF EXISTS `web_ri_cont_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_priority` (
  `C_CONTPRIO_PK_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_CONT_CDE` varchar(50) DEFAULT NULL COMMENT '合约代码',
  `C_PRIO_YM` varchar(10) DEFAULT NULL COMMENT '年月',
  `T_BGN_TM` datetime DEFAULT NULL COMMENT '起期',
  `T_END_TM` datetime DEFAULT NULL COMMENT '止期',
  `N_PRIORITY` decimal(4,0) DEFAULT NULL COMMENT '优先级',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员 ',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_PRIORITY` (`C_CONTPRIO_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约优先级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_quota`
--

DROP TABLE IF EXISTS `web_ri_cont_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_quota` (
  `C_QUOTA_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_RIKIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险类代码',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险种代码',
  `C_RISK_LVL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '*' COMMENT '风险等级',
  `N_QS_PRPT` decimal(10,6) DEFAULT NULL COMMENT '成数比例',
  `N_RET_LMT` decimal(20,2) DEFAULT NULL COMMENT '自留限额',
  `N_LINE` decimal(4,0) DEFAULT NULL COMMENT '线数',
  `N_CONT_LMT` decimal(20,2) DEFAULT NULL COMMENT '合约人民币限额',
  `C_CONT_CUR` varchar(30) DEFAULT NULL COMMENT '合约币种,不一定为人民币，与合约主档表中合约币种一致，汇率从主档读取，用于页面显示冗余字段',
  `N_CI_COEF` decimal(10,6) DEFAULT NULL COMMENT '共保业务系数',
  `N_INW_COEF` decimal(10,6) DEFAULT NULL COMMENT '分入业务系数',
  `N_VIP_LINE` decimal(4,0) DEFAULT NULL COMMENT 'VIP线数,股东业务',
  `N_VIP_LMT` decimal(20,2) DEFAULT NULL COMMENT 'VIP自留额',
  `C_APPEND_MRK` varchar(1) DEFAULT '0' COMMENT '追加标志,''0''否,''1''是,当合约生效后追加新的险种时需做此标志',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `N_CONT_ORI_LMT` decimal(20,2) DEFAULT NULL COMMENT '合约币种限额，不一定为人民币',
  `C_DECLARE_MRK` varchar(1) DEFAULT '0' COMMENT '申报标志,''0''否,''1''是',
  `C_APPEND_TM` datetime DEFAULT NULL COMMENT '追加审核时间',
  `C_CONT_MAIN_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约主档表PKID',
  `N_PROD_LMT` decimal(20,2) DEFAULT NULL COMMENT '产品限额',
  `T_PROD_DEADLINE` datetime DEFAULT NULL COMMENT '产品期限',
  `C_RISK_LVL_CNM` varchar(200) DEFAULT NULL COMMENT '  风险等级中文名称',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `N_SUBSIDY_LINE` decimal(4,0) DEFAULT NULL COMMENT '补贴线数,补贴业务',
  `N_SUBSIDY_LMT` decimal(20,2) DEFAULT NULL COMMENT '补贴自留额,补贴业务',
  UNIQUE KEY `PK_WEB_RI_CONT_QUOTA` (`C_QUOTA_PK_ID`),
  KEY `IDX_CONT_QUOTA_1` (`C_CONT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约险种限额表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_sec_prod_rel`
--

DROP TABLE IF EXISTS `web_ri_cont_sec_prod_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_sec_prod_rel` (
  `C_PRODREL_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `C_SEC_ID` varchar(50) DEFAULT NULL COMMENT '关联SECTION ID',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约ID',
  `C_CONTSEC_PK_ID` varchar(50) DEFAULT NULL COMMENT '关联合约SECTION表主键',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_SEC_PROD_REL` (`C_PRODREL_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约section险种关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_section`
--

DROP TABLE IF EXISTS `web_ri_cont_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_section` (
  `C_CONTSEC_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约SECTION PKID',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_SEC_ID` varchar(30) DEFAULT NULL COMMENT 'SECTION ID',
  `C_SEC_NME` varchar(100) DEFAULT NULL COMMENT 'SECTION名,预留',
  `N_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '手续费率',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `C_RI_COM` varchar(30) DEFAULT NULL COMMENT '再保公司',
  `C_CONT_MAIN_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约主档表PKID',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_SECTION` (`C_CONTSEC_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约section设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_section_count`
--

DROP TABLE IF EXISTS `web_ri_cont_section_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_section_count` (
  `C_CONT_SECTION_COUNT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约Section统计id',
  `N_CED_PRM` decimal(20,2) DEFAULT '0.00' COMMENT '分出保费',
  `N_COMM` decimal(20,2) DEFAULT '0.00' COMMENT '手续费',
  `N_DUTY` decimal(20,2) DEFAULT '0.00' COMMENT '税',
  `N_DUTY_ADD` decimal(20,2) DEFAULT '0.00' COMMENT '附加税',
  `N_CLM_AMT` decimal(20,2) DEFAULT '0.00' COMMENT '摊回赔款',
  `C_COM_CDE` varchar(30) DEFAULT NULL COMMENT '再保公司/经纪公司代码',
  `N_CASH_CALL_AMT` decimal(20,2) DEFAULT '0.00' COMMENT '现金赔款金额',
  `N_OUTSTANDING_AMT` decimal(20,2) DEFAULT '0.00' COMMENT '未决赔款金额',
  `C_SECTION_TYP` varchar(30) DEFAULT NULL COMMENT 'Section类型 QS 成数，Surplus 溢额',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `C_SECTION_NME` varchar(100) DEFAULT NULL COMMENT 'Section名称',
  `C_UW_YEAR` varchar(10) DEFAULT NULL COMMENT '账单年',
  `C_FEE_CUR` varchar(30) DEFAULT NULL COMMENT '费用币种',
  `T_BILL_TM` datetime DEFAULT NULL COMMENT '做账日期',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `C_BILL_NO` varchar(50) DEFAULT NULL COMMENT '外账单号',
  `C_BILL_PRD` varchar(20) DEFAULT NULL COMMENT '账单期',
  `T_CONT_BGN_TM` datetime DEFAULT NULL COMMENT '有效起期，合约实际生效的起期',
  `T_CONT_END_TM` datetime DEFAULT NULL COMMENT '有效止期，合约实际生效的止期',
  `T_BILL_PRD_BGN` datetime DEFAULT NULL COMMENT '有效起期，合约实际生效的起期',
  `T_BILL_PRD_END` datetime DEFAULT NULL COMMENT '有效止期，合约实际生效的止期',
  `N_BRKR` decimal(20,2) DEFAULT '0.00' COMMENT '经纪费',
  `C_CONT_CDE` varchar(30) DEFAULT NULL COMMENT '合约代码',
  `C_CONT_ENM` varchar(100) DEFAULT NULL COMMENT '合约英文名',
  `C_PAY_YM` varchar(6) DEFAULT NULL COMMENT '分期缴费年月',
  `N_TMS` decimal(4,0) DEFAULT NULL COMMENT '缴费期次',
  `N_PRE_CLM_AMT` decimal(20,2) DEFAULT NULL,
  `C_CITY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_PROVINCE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `C_BILL_YEAR` varchar(4) DEFAULT NULL COMMENT '账单年',
  `C_BILL_QUARTER` varchar(2) DEFAULT NULL COMMENT '账单季',
  `N_ADD_DUTY` decimal(20,2) DEFAULT '0.00' COMMENT '附加税',
  `C_BRKR_MRK` varchar(1) DEFAULT '0' COMMENT '是否经纪公司标志',
  `C_FIN_MRK` varchar(1) DEFAULT '0' COMMENT '是否传收付标志 0=未传收付,1=已传收付',
  UNIQUE KEY `PK_WEB_RI_CONT_SECTION_COUNT` (`C_CONT_SECTION_COUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='按照再保合约的Section统计成熟与溢额的分出保费、手续费、税和摊回赔款等信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_sett_comm_adj_dtl`
--

DROP TABLE IF EXISTS `web_ri_cont_sett_comm_adj_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_sett_comm_adj_dtl` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_INNER_BILL_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内账单号',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约ID',
  `N_ADJUST_TM` decimal(6,0) NOT NULL COMMENT '手续费调整次数',
  `N_CED_PRM` decimal(30,10) NOT NULL COMMENT '分保费',
  `N_LAST_COMM_RATE` decimal(30,10) NOT NULL COMMENT '前手续费率',
  `N_COMM_RATE` decimal(30,10) NOT NULL COMMENT '手续费率',
  `N_LAST_COMM` decimal(30,10) NOT NULL COMMENT '前手续费',
  `N_COMM` decimal(30,10) NOT NULL COMMENT '手续费',
  `N_COMM_VAR` decimal(30,10) NOT NULL COMMENT '手续费变化量',
  `T_CRT_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_SEC_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'SECTION ID',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同核算手续费调整明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_sett_comm_adjust`
--

DROP TABLE IF EXISTS `web_ri_cont_sett_comm_adjust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_sett_comm_adjust` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约ID',
  `N_ADJUST_TM` decimal(6,0) NOT NULL COMMENT '手续费调整次数',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态:0未计算;1已计算;3生成账单;4传收付',
  `T_ADJ_BGN_TM` datetime NOT NULL COMMENT '调整起期',
  `T_ADJ_END_TM` datetime NOT NULL COMMENT '调整止期',
  `N_COMM_RATE` decimal(15,10) NOT NULL COMMENT '调整手续费率',
  `T_CRT_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_SEC_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'SECTION ID',
  `N_LOSS_RATIO` decimal(15,10) DEFAULT NULL COMMENT '调整赔付率',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同核算手续费调整信息设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_type`
--

DROP TABLE IF EXISTS `web_ri_cont_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_type` (
  `C_CONT_TYP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约类型码',
  `C_CONT_TYP_CNM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约类型中文名',
  `C_CONT_TYP_ENM` varchar(50) DEFAULT NULL COMMENT '合约类型英文名',
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '有效状态,''0''失效,''1''有效',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员 ',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `C_IS_PRPT` varchar(1) DEFAULT NULL COMMENT '比例非比例,''0''非比例,''1''比例',
  `C_BIZ_DIRECT` varchar(1) DEFAULT '0' COMMENT '业务方向,分出=0(默认)，分入=1',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_TYPE` (`C_CONT_TYP_CDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_xl_inst`
--

DROP TABLE IF EXISTS `web_ri_cont_xl_inst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_xl_inst` (
  `C_XLINST_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分期付款PKID',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `C_RI_COM` varchar(30) DEFAULT NULL COMMENT '再保公司',
  `N_LAYER` decimal(4,0) DEFAULT NULL COMMENT '层数',
  `N_TMS` decimal(4,0) DEFAULT NULL COMMENT '期次',
  `T_PAY_BGN_TM` datetime DEFAULT NULL COMMENT '付款起期',
  `T_PAY_END_TM` datetime DEFAULT NULL COMMENT '付款止期',
  `N_PAY_AMT` decimal(20,2) DEFAULT NULL COMMENT '付款金额',
  `C_UPD_CDE` varchar(30) DEFAULT NULL COMMENT '修改人员',
  `T_CRT_TM` datetime DEFAULT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) DEFAULT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime DEFAULT NULL COMMENT '修改时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_CONT_XL_INST` (`C_XLINST_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cont_xl_layer`
--

DROP TABLE IF EXISTS `web_ri_cont_xl_layer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cont_xl_layer` (
  `C_XLLAYER_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分层信息PKID',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) DEFAULT NULL COMMENT '层数',
  `N_START_POINT` decimal(20,2) DEFAULT NULL COMMENT '起赔点',
  `N_LAYER_LMT` decimal(20,2) DEFAULT NULL COMMENT '限额',
  `C_CUR` varchar(30) DEFAULT NULL COMMENT '币种',
  `N_MDP` decimal(20,2) DEFAULT NULL COMMENT 'MDP',
  `N_MDP_RATE` decimal(10,6) DEFAULT NULL COMMENT 'MDP_RATE',
  `N_RECOVER_TMS` decimal(4,0) DEFAULT NULL COMMENT '责任恢复次数',
  `T_CRT_TM` datetime DEFAULT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) DEFAULT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime DEFAULT NULL COMMENT '修改时间 ',
  `C_UPD_CDE` varchar(30) DEFAULT NULL COMMENT '创建人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_cus_com_acct`
--

DROP TABLE IF EXISTS `web_ri_cus_com_acct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_cus_com_acct` (
  `c_acc_cde` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `c_rel_src` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '  0 客户；1 渠道； 2再保人',
  `c_rel_cde` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '  对应为客户代码、渠道代码、再保人代码',
  `c_cur_typ` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `c_bank_cde` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_bank_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_bank_name_over` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  境外银行名称',
  `c_bank` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_accnt_nme` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_accnt_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_accnt_nme_over` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  境外银行开户名',
  `c_accnt_no_over` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  境外银行账号',
  `c_payee` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_bank_addr` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_cust_addr` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `t_adb_tm` datetime DEFAULT NULL,
  `c_is_valid` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_crt_cde` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `t_crt_tm` datetime NOT NULL,
  `c_upd_cde` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `t_upd_tm` datetime NOT NULL,
  `c_trans_mrk` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `t_trans_tm` datetime DEFAULT NULL,
  `c_country` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  国家',
  `c_provinces` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  省份',
  `c_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  城市',
  `c_accnt_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '账户类型 1 手续费支付专用账户（保险公司提供）2 手续费收取专用账户（代理方提供）3保费结算账户（保险公司提供）4 保费代收账户（代理人提供） 5 业务员绩效4跟的银行账户',
  `c_bank_over` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT ' 境内外标志 0 境内 1 境外',
  `c_card_mark` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  卡/折标志 1 存折、2 借记卡、3 贷记卡、4准贷记卡',
  `c_is_sysnch` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否同步 0-否, 1-是',
  `c_sys_stat` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '同步结果状态 0-同步失败, 1-同步成功',
  `c_error_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '同步信息 主要记录错误信息',
  `t_sysnch_time` datetime DEFAULT NULL COMMENT '同步时间',
  `c_action_typ` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '操作类型0-add,1-update,2-del',
  `c_del` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '逻辑删除标志 0-无效 1-有效',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`c_acc_cde`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='再保银行账户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_declare_flow_info`
--

DROP TABLE IF EXISTS `web_ri_declare_flow_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_declare_flow_info` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '申请单号',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '批改序号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_RIKIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险类',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品',
  `C_RISK_LVL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '*' COMMENT '风险等级代码',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '状态,0=待确认,1=已确认',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_DECLARE_FLOW_INFO` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申报流程信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_declare_info`
--

DROP TABLE IF EXISTS `web_ri_declare_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_declare_info` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '申请单号',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '批改序号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_RIKIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险类',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品',
  `C_RISK_LVL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '*' COMMENT '风险等级',
  `N_QS_PRPT` decimal(10,6) DEFAULT NULL COMMENT '成数比例',
  `N_RET_LMT` decimal(20,2) DEFAULT NULL COMMENT '自留限额',
  `N_LINE` decimal(4,0) DEFAULT NULL COMMENT '线数',
  `N_CONT_LMT` decimal(20,2) DEFAULT NULL COMMENT '合约人民币限额',
  `C_CONT_CUR` varchar(30) DEFAULT NULL COMMENT '合约币种,不一定为人民币，与合约主档表中合约币种一致，汇率从主档读取，用于页面显示冗余字段',
  `N_VIP_LINE` decimal(4,0) DEFAULT NULL COMMENT '共保业务系数',
  `N_VIP_LMT` decimal(20,2) DEFAULT NULL COMMENT 'VIP限额',
  `N_CONT_ORI_LMT` decimal(20,2) DEFAULT NULL COMMENT '合约币种限额，不一定为人民币',
  `N_SEQ_NO` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '序号',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '状态,0=待确认,1=已确认',
  `C_EXCL_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '除外标志,0=不除外,1=除外',
  `C_SOURCE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '数据来源,0=数据转入,1=除外转申报',
  `C_CVRG_NO` varchar(6) DEFAULT '*' COMMENT '险别代码',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `N_ACT_COMM_RATE` decimal(10,6) DEFAULT '0.000000' COMMENT '实际手续费率',
  `N_COMM_RATE_LINE` decimal(10,6) DEFAULT '0.000000' COMMENT '溢额手续费率,成数溢额混合合约和溢额合约的溢额部分手续费率',
  `N_EQ_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '地震险手续费率',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_DECLARE_INFO` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申报信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_edr_cmp_item`
--

DROP TABLE IF EXISTS `web_ri_edr_cmp_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_edr_cmp_item` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_EDR_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_EDR_PRJ_NO` decimal(6,0) DEFAULT '0' COMMENT '  批改序号,批改次数 Times of Endorsement',
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  批单号',
  `N_SEQ_NO` decimal(4,0) DEFAULT NULL COMMENT '  序号',
  `C_FIELD_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  字段ID',
  `C_REL_TABLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  关联表',
  `C_REL_FLD` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  关联字段',
  `C_FLD_NME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  批改项目名',
  `C_OLD_VAL` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  旧值',
  `C_NEW_VAL` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  新值',
  `C_CHG_VAL` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  变化值',
  `C_DATA_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  数据类型',
  `C_TAB_NME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  表格名称,表格名称，说明表格名及操作',
  `N_TAB_ROW_NO` decimal(8,0) DEFAULT NULL COMMENT '  表格行号',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_EDR_CMP_ITEM` (`C_PK_ID`),
  KEY `IDX_EDRCMPITEM_EDRAPPNO` (`C_EDR_APP_NO`),
  KEY `IDX_EDRCMPITEM_PLYNO` (`C_PLY_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_edr_rsn`
--

DROP TABLE IF EXISTS `web_ri_edr_rsn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_edr_rsn` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_EDR_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_EDR_PRJ_NO` decimal(6,0) DEFAULT '0' COMMENT '批改次数 Times of Endorsement',
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批单号',
  `N_SEQ_NO` decimal(4,0) DEFAULT NULL COMMENT '  序号',
  `C_EDR_RSN_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  批改原因',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_EDR_RSN` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='批单批改原因';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_cata`
--

DROP TABLE IF EXISTS `web_ri_el_cata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_cata` (
  `C_CATA_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '巨灾代码',
  `C_CATA_CNM` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '巨灾名称',
  `N_LEVEL` decimal(4,0) DEFAULT NULL COMMENT '巨灾编码层级,按照巨灾编码规则，共有3级',
  `C_PAR_CDE` varchar(30) DEFAULT NULL COMMENT '上级代码',
  `C_DESC` text COMMENT '详细说明',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '有效状态,0:未生效,1:已生效，2:失效',
  `T_VALID_TM` datetime DEFAULT NULL COMMENT '生效时间',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立日期',
  `C_APPLY_TO_DPT` text COMMENT '适用机构',
  `C_APPLY_TO_KIND` varchar(200) DEFAULT NULL COMMENT '适用险类',
  `C_APPLY_TO_ELCONT` varchar(1) DEFAULT NULL COMMENT '是否适用超赔合约',
  `T_EL_ACCOUNT_END_TM` datetime DEFAULT NULL COMMENT '超赔合约核算止期',
  `C_APPLY_TO_DPTNM` text COMMENT '适用机构名称',
  `C_APPLY_TO_KINDNM` varchar(200) DEFAULT NULL COMMENT '适用险类名称',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_EL_CATA` (`C_CATA_CDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='巨灾信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_clm_info`
--

DROP TABLE IF EXISTS `web_ri_el_clm_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_clm_info` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_CLM_TMS` decimal(4,0) NOT NULL COMMENT '赔付次数',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '险位序号',
  `N_RBK_SEQ` decimal(4,0) NOT NULL COMMENT '冲正标志',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险时间',
  `C_ACCDNT_CAUS_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '出险原因代码',
  `C_PLACE_LOSS` text COMMENT '出险地点',
  `T_RIDUE_TM` datetime NOT NULL COMMENT '再保挂账日期',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险种',
  `N_RI_CLM_AMT` decimal(20,2) DEFAULT NULL COMMENT '再保已决赔款',
  `N_REFUNDCLM_AMT` decimal(20,6) DEFAULT NULL COMMENT '已决摊回赔款',
  `N_RETCLM_AMT` decimal(20,6) DEFAULT NULL COMMENT '已决自留赔款',
  `C_READ_FLAG` varchar(1) DEFAULT NULL COMMENT '读写标志',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '机构代码',
  `C_CATA_CDE` varchar(30) DEFAULT NULL COMMENT '巨灾代码',
  `C_LOSS_TYPE` varchar(1) DEFAULT NULL COMMENT '损失类型 1险位损失，2事故损失',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超赔已决信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_cont_custom_task`
--

DROP TABLE IF EXISTS `web_ri_el_cont_custom_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_cont_custom_task` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_TASK_REMARKS` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '方法备注',
  `T_TASK_BGN_TM` datetime NOT NULL COMMENT '任务启动时间',
  `T_TASK_END_TM` datetime DEFAULT NULL COMMENT '任务结束时间',
  `C_PARAM` varchar(200) DEFAULT NULL COMMENT '参数（格式：name:value;name:value）',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务状态  0：未开始，1：已结束',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_EL_CONT_CUSTOM_TASK` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超赔自定义任务信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_cont_gnpi`
--

DROP TABLE IF EXISTS `web_ri_el_cont_gnpi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_cont_gnpi` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_CONT_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_KIND_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险类代码',
  `C_PROD_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险种代码',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '机构',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '渠道',
  `N_GNPI` decimal(20,6) DEFAULT NULL COMMENT '实际GNPI值',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `C_STATS_BEG` varchar(30) DEFAULT NULL COMMENT '统计开始时间',
  `C_STATS_END` varchar(30) DEFAULT NULL COMMENT '统计结束时间',
  UNIQUE KEY `PK_WEB_RI_EL_CONT_CNPI` (`C_PK_ID`),
  KEY `IDX_WEB_RI_EL_CONT_GNPI` (`C_CONT_ID`,`C_KIND_NO`,`C_PROD_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='险种实际GNPI信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_cust_acct`
--

DROP TABLE IF EXISTS `web_ri_el_cust_acct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_cust_acct` (
  `C_ACCT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '事故代码',
  `C_ACCT_CNM` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '事故名称',
  `C_CATA_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '上级代码',
  `T_ACCT_BGN_TM` datetime DEFAULT NULL COMMENT '事故区间起期',
  `T_ACCT_END_TM` datetime DEFAULT NULL COMMENT '事故区间止期',
  `N_CLM_AMT` decimal(20,6) DEFAULT NULL COMMENT '已决赔款',
  `N_PEND_AMT` decimal(20,6) DEFAULT NULL COMMENT '未决赔款',
  `N_CLM_RET_AMT` decimal(20,6) DEFAULT NULL COMMENT '自留已决赔款',
  `N_PEND_RET_AMT` decimal(20,6) DEFAULT NULL COMMENT '自留未决赔款',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_EL_CUST_ACCT` (`C_ACCT_CDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='三级事故信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_loss_adj_info`
--

DROP TABLE IF EXISTS `web_ri_el_loss_adj_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_loss_adj_info` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CLM_NO` varchar(30) DEFAULT NULL COMMENT '赔案号',
  `C_CATA_CDE` varchar(30) DEFAULT NULL COMMENT '巨灾代码',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '险位序号',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险时间',
  `C_ACCDNT_CAUS_CDE` varchar(30) DEFAULT NULL COMMENT '出险原因代码',
  `C_PLACE_LOSS` text COMMENT '出险地点',
  `C_RI_CUR` varchar(30) DEFAULT NULL COMMENT '再保币种',
  `N_CLM_AMT` decimal(20,6) NOT NULL COMMENT '已决赔款',
  `N_PEND_AMT` decimal(20,6) DEFAULT NULL COMMENT '未决赔款',
  `N_CLM_RET_AMT` decimal(20,6) NOT NULL COMMENT '自留已决赔款',
  `N_PEND_RET_AMT` decimal(20,6) DEFAULT NULL COMMENT '自留未决赔款',
  `N_CLM_RET_ADJ_AMT` decimal(20,6) DEFAULT NULL COMMENT '自留已决损失确认金额',
  `N_PEND_RET_ADJ_AMT` decimal(20,6) DEFAULT NULL COMMENT '自留未决损失确认金额',
  `N_ADJ_PRPT` decimal(10,6) DEFAULT NULL COMMENT '损失确认比例',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `C_RISK_LVL_CDE` varchar(30) DEFAULT NULL COMMENT '风险等级',
  `N_RET_AMT` decimal(20,2) DEFAULT NULL COMMENT '自留额',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '保险起期',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '保险止期',
  `N_RI_AMT` decimal(20,2) DEFAULT NULL COMMENT '再保保额',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '写入次数',
  `C_LOSS_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '损失类型 1险位损失，2事故损失',
  `C_CLMORCATA_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号/巨灾代码',
  `C_PROD_NO` varchar(30) DEFAULT NULL COMMENT '产品代码',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '机构代码',
  `C_STATUS` varchar(1) DEFAULT NULL COMMENT '状态：0有效，1除外',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_EL_LOSS_ADJ_INFO` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超赔摊回赔案损失确认信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_loss_clm_map`
--

DROP TABLE IF EXISTS `web_ri_el_loss_clm_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_loss_clm_map` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_REL_ID` varchar(50) DEFAULT NULL,
  `C_CLM_NO` varchar(30) DEFAULT NULL COMMENT '赔案号',
  `C_CATA_CDE` varchar(30) DEFAULT NULL COMMENT '巨灾代码',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '写入次数',
  `N_SPLIT_SEQ` decimal(4,0) DEFAULT NULL COMMENT '险位序号',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险时间',
  `C_ACCDNT_CAUS_CDE` varchar(30) DEFAULT NULL COMMENT '出险原因代码',
  `N_CLM_AMT` decimal(20,6) NOT NULL COMMENT '已决赔款',
  `N_CLM_RET_AMT` decimal(20,6) NOT NULL COMMENT '自留已决赔款',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CLMORACCT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号/事故代码',
  `N_CLM_TMS` decimal(4,0) NOT NULL COMMENT '赔付次数',
  `C_RI_CUR` varchar(30) DEFAULT NULL COMMENT '再保币种',
  `N_RBK_SEQ` decimal(4,0) NOT NULL COMMENT '冲正标志',
  `C_STATUS` varchar(30) DEFAULT NULL COMMENT '摊回状态： 0、未摊回，1、已摊回、2已确认、3已生成账单、4已收付',
  `C_LOSS_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '损失类型 1险位损失，2事故损失',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `C_ACCT_CDE` varchar(30) DEFAULT NULL COMMENT '事故代码',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT '0' COMMENT '批改序号',
  `C_PROD_NO` varchar(6) DEFAULT NULL COMMENT '产品代码',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '机构代码',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源',
  `N_SELF_PRPT` decimal(15,10) DEFAULT NULL COMMENT '自留比例',
  UNIQUE KEY `PK_WEB_RI_EL_LOSS_CLM_MAP` (`C_PK_ID`),
  KEY `IDX_CLMORACCT_SEQ_CONT` (`C_CLMORACCT_CDE`,`N_SPLIT_SEQ`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_CLMORACCT_CONT` (`C_CLMORACCT_CDE`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_ACCT_CONT` (`C_ACCT_CDE`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_CATA_CONT` (`C_CATA_CDE`,`C_CONT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已决赔案映射表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_loss_info`
--

DROP TABLE IF EXISTS `web_ri_el_loss_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_loss_info` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CLM_NO` varchar(30) DEFAULT NULL COMMENT '赔案号',
  `C_CATA_CDE` varchar(30) DEFAULT NULL COMMENT '巨灾代码',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '险位序号',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险时间',
  `C_PLACE_LOSS` text COMMENT '出险地点',
  `C_ACCDNT_CAUS` varchar(200) DEFAULT NULL COMMENT '出险原因',
  `C_RI_CUR` varchar(30) DEFAULT NULL COMMENT '再保币种',
  `N_CLM_AMT` decimal(20,6) NOT NULL COMMENT '已决赔款',
  `N_PEND_AMT` decimal(20,6) DEFAULT NULL COMMENT '未决赔款',
  `N_CLM_RET_AMT` decimal(20,6) NOT NULL COMMENT '自留已决赔款',
  `N_PEND_RET_AMT` decimal(20,6) DEFAULT NULL COMMENT '自留未决赔款',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CLMORCATA_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号/巨灾代码',
  `C_CATA_CNM` varchar(100) DEFAULT NULL COMMENT '巨灾名称',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '写入次数',
  `C_IS_REFUND` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否可摊回 0否，1是',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否作废，0已作废，1有效',
  `C_LOSS_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '损失类型 1险位损失，2事故损失',
  `N_CLM_RET_ADJ_AMT` decimal(20,6) DEFAULT NULL COMMENT '自留已决损失确认金额',
  `N_PEND_RET_ADJ_AMT` decimal(20,6) DEFAULT NULL COMMENT '自留未决损失确认金额',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `C_PROD_NO` varchar(6) DEFAULT NULL COMMENT '产品代码',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '机构代码',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源',
  UNIQUE KEY `PK_WEB_RI_EL_LOSS_INFO` (`C_PK_ID`),
  KEY `IDX_CLMORCATA_SEQ_CONT` (`C_CLMORCATA_CDE`,`N_SPLIT_SEQ`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_CLMORCATA_CONT` (`C_CLMORCATA_CDE`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_CATA_CONT` (`C_CATA_CDE`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_CLM_SEQ_CONT` (`C_CLM_NO`,`N_SPLIT_SEQ`,`C_CONT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超赔摊回赔案信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_loss_pend_map`
--

DROP TABLE IF EXISTS `web_ri_el_loss_pend_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_loss_pend_map` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_REL_ID` varchar(50) DEFAULT NULL,
  `C_CLM_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `C_CATA_CDE` varchar(30) DEFAULT NULL COMMENT '巨灾代码',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '写入次数',
  `N_SPLIT_SEQ` decimal(4,0) DEFAULT NULL COMMENT '险位序号',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险时间',
  `C_ACCDNT_CAUS_CDE` varchar(30) DEFAULT NULL COMMENT '出险原因代码',
  `N_PEND_AMT` decimal(20,6) NOT NULL COMMENT '未决赔款',
  `N_PEND_RET_AMT` decimal(20,6) NOT NULL COMMENT '自留未决赔款',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CLMORCATA_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号/巨灾代码',
  `C_LOSS_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '损失类型 1险位损失，2事故损失',
  `T_TORI_TM` datetime DEFAULT NULL COMMENT '转入时间',
  `N_RBK_SEQ` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '冲正标志',
  `C_RI_CUR` varchar(30) DEFAULT NULL COMMENT '再保币种',
  `N_PEND_TMS` decimal(4,0) DEFAULT NULL COMMENT '未决调整次数',
  `C_PEND_YM` varchar(30) DEFAULT NULL COMMENT '未决年月',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_EL_LOSS_PEND_MAP` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='未决赔案映射表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_loss_refund`
--

DROP TABLE IF EXISTS `web_ri_el_loss_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_loss_refund` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CLM_NO` varchar(30) DEFAULT NULL COMMENT '赔案号',
  `C_ACCT_CDE` varchar(30) DEFAULT NULL COMMENT '事故代码',
  `N_SPLIT_SEQ` decimal(4,0) DEFAULT NULL COMMENT '险位序号',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `C_RI_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保币种',
  `C_BRKR_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪人代码',
  `C_BRKR_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司，0否，1是',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保人代码',
  `C_ATTRIB` varchar(1) DEFAULT 'A' COMMENT '境内外属性',
  `N_SHARE_PRPT` decimal(10,6) NOT NULL COMMENT '摊回比例',
  `N_RESET_PRM` decimal(20,2) DEFAULT NULL COMMENT '重置保费',
  `N_RESET_DUTY` decimal(20,2) DEFAULT '0.00' COMMENT '保额恢复增值税',
  `N_RESET_DUTY_ADD` decimal(20,2) DEFAULT '0.00' COMMENT '保额恢复增值税附加税',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `N_REFUND_TMS` decimal(4,0) NOT NULL COMMENT '摊回次数',
  `N_REFUND_AMT` decimal(20,2) NOT NULL COMMENT '摊回金额',
  `T_RECOVER_TM` datetime DEFAULT NULL COMMENT '恢复时间',
  `N_RECOVER_NO` decimal(4,0) DEFAULT NULL COMMENT '恢复次数',
  `C_CLMORACCT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '事故号/赔案号',
  `C_LOSS_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '损失类型 1险位损失，2事故损失',
  `N_RESET_PRPT` decimal(20,15) DEFAULT NULL COMMENT '重置保费恢复比例',
  `N_CONGTREFUND_AMT` decimal(20,2) DEFAULT NULL COMMENT '历史累积摊回金额',
  `N_GNPI` decimal(20,6) DEFAULT NULL COMMENT '实际GNPI',
  `N_LOSS_PRPT` decimal(20,15) DEFAULT NULL COMMENT '损失比例',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `C_RECOVER_INTO` varchar(300) DEFAULT NULL COMMENT '层恢复信息JSON对象：恢复次数、恢复保额、恢复保费、恢复比例',
  UNIQUE KEY `PK_WEB_RI_LOSS_REFUND` (`C_PK_ID`),
  KEY `IDX_WEB_RI_LOSS_REFUND` (`C_CLMORACCT_CDE`,`N_SPLIT_SEQ`,`N_REFUND_TMS`,`C_CONT_ID`,`N_LAYER`,`C_BRKR_COM`,`C_RI_COM`,`N_RECOVER_NO`),
  KEY `IDX_CLM_SEQ_CONT` (`C_CLM_NO`,`N_SPLIT_SEQ`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_CLMORACCT_SEQ_CONT` (`C_CLMORACCT_CDE`,`N_SPLIT_SEQ`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_CLMORACCT_CONT` (`C_CLMORACCT_CDE`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_ACCT_CONT` (`C_ACCT_CDE`,`C_CONT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超赔摊回结果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_loss_refund_base`
--

DROP TABLE IF EXISTS `web_ri_el_loss_refund_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_loss_refund_base` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_KIND_NO` varchar(30) DEFAULT NULL COMMENT '险类',
  `C_PROD_NO` varchar(30) DEFAULT NULL COMMENT '险种',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构代码',
  `N_TOTAL_PRM` decimal(20,2) NOT NULL COMMENT '总保费',
  `N_CLM_AMT` decimal(20,2) DEFAULT NULL COMMENT '总已决赔款',
  `N_PEND_AMT` decimal(20,2) DEFAULT NULL COMMENT '总未决赔款',
  `N_EL_PRM` decimal(20,6) DEFAULT NULL COMMENT '毛净自留保费',
  `N_EL_CLM_AMT` decimal(20,2) DEFAULT NULL COMMENT '毛净自留已决金额',
  `N_EL_PEND_AMT` decimal(20,2) DEFAULT NULL COMMENT '毛净自留未决金额',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `N_TMS` decimal(4,0) DEFAULT NULL COMMENT '期次',
  `C_STATUS` varchar(10) DEFAULT NULL COMMENT '摊赔统计状态，1：统计业务基础数据、2：分摊基础数据统计',
  `C_PROVINCE` varchar(30) DEFAULT NULL,
  `C_CITY` varchar(30) DEFAULT NULL,
  `C_LONG_TERM_MRK` varchar(1) DEFAULT NULL,
  `C_GRP_MRK` varchar(1) DEFAULT NULL,
  `C_BSNS_TYP` varchar(10) DEFAULT NULL,
  `C_USAGE_CDE` varchar(30) DEFAULT NULL,
  `C_CVRG_NO` varchar(6) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_RI_EL_LOSS_REFUND_BASE` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赔付率摊赔业务基础表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_loss_refund_dtl`
--

DROP TABLE IF EXISTS `web_ri_el_loss_refund_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_loss_refund_dtl` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_REL_ID` varchar(50) DEFAULT NULL,
  `C_CLM_NO` varchar(30) DEFAULT NULL COMMENT '赔案号',
  `C_ACCT_CDE` varchar(30) DEFAULT NULL COMMENT '事故代码',
  `N_SPLIT_SEQ` decimal(4,0) DEFAULT NULL COMMENT '险位序号',
  `C_REFUND_TMS` decimal(4,0) NOT NULL COMMENT '摊回次数',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `C_KIND_NO` varchar(30) DEFAULT NULL COMMENT '险类',
  `C_PROD_NO` varchar(30) DEFAULT NULL COMMENT '险种',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构',
  `C_RI_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保币种',
  `C_BRKR_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪人代码',
  `C_BRKR_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司，0否，1是',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保人代码',
  `C_ATTRIB` varchar(1) DEFAULT 'A' COMMENT '境内外属性',
  `N_SHARE_PRPT` decimal(10,6) NOT NULL COMMENT '摊回比例',
  `N_PROD_BNS_PRPT` decimal(10,6) DEFAULT '1.000000' COMMENT '产品渠道分摊比例',
  `N_REFUND_PRM` decimal(20,2) NOT NULL COMMENT '摊回金额',
  `N_RESET_PRM` decimal(20,2) DEFAULT NULL COMMENT '重置保费',
  `N_RESET_DUTY` decimal(20,2) DEFAULT '0.00' COMMENT '保额恢复增值税',
  `N_RESET_DUTY_ADD` decimal(20,2) DEFAULT '0.00' COMMENT '保额恢复增值税附加税',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CLMORACCT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '事故号/赔案号',
  `C_LOSS_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '损失类型 1险位损失，2事故损失',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源',
  UNIQUE KEY `PK_WEB_RI_EL_LOSS_REFUND_DTL` (`C_PK_ID`),
  KEY `IDX_WEB_RI_EL_LOSS_REFUND_DTL` (`C_CLMORACCT_CDE`,`N_SPLIT_SEQ`,`C_REFUND_TMS`,`C_CONT_ID`,`N_LAYER`,`C_BRKR_COM`,`C_RI_COM`,`C_KIND_NO`,`C_PROD_NO`,`C_DPT_CDE`),
  KEY `IDX_CLM_SEQ_CONT` (`C_CLM_NO`,`N_SPLIT_SEQ`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_CLMORACCT_SEQ_CONT` (`C_CLMORACCT_CDE`,`N_SPLIT_SEQ`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_CLMORACCT_CONT` (`C_CLMORACCT_CDE`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_ACCT_CONT` (`C_ACCT_CDE`,`C_CONT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超赔摊回分摊明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_loss_torefund`
--

DROP TABLE IF EXISTS `web_ri_el_loss_torefund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_loss_torefund` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CLM_NO` varchar(30) DEFAULT NULL COMMENT '赔案号',
  `C_ACCT_CDE` varchar(30) DEFAULT NULL COMMENT '事故代码',
  `N_SPLIT_SEQ` decimal(4,0) DEFAULT NULL COMMENT '险位序号',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险时间',
  `C_PLACE_LOSS` text COMMENT '出险地点',
  `C_ACCDNT_CAUS` varchar(200) DEFAULT NULL COMMENT '出险原因',
  `N_REFUND_TMS` decimal(4,0) NOT NULL COMMENT '摊回次数',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_STATUS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '摊回状态： 0、未摊回，1、已摊回、2已确认、3已生成账单、4已收付',
  `C_RI_CUR` varchar(30) DEFAULT NULL COMMENT '再保币种',
  `N_CLM_AMT` decimal(20,6) NOT NULL COMMENT '已决赔款',
  `N_PEND_AMT` decimal(20,6) DEFAULT NULL COMMENT '未决赔款',
  `N_CLM_RET_AMT` decimal(20,6) NOT NULL COMMENT '自留已决赔款',
  `N_PEND_RET_AMT` decimal(20,6) DEFAULT NULL COMMENT '自留未决赔款',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CLMORACCT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '事故号/赔案号',
  `C_LOSS_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '损失类型 1险位损失，2事故损失',
  `C_CLMORCATA_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '巨灾代码号/赔案号',
  `N_CLM_RET_ADJ_AMT` decimal(20,6) DEFAULT NULL COMMENT '自留已决损失确认金额',
  `N_PEND_RET_ADJ_AMT` decimal(20,6) DEFAULT NULL COMMENT '自留未决损失确认金额',
  `N_REFUND_AMT` decimal(20,2) DEFAULT NULL COMMENT '本次摊回金额',
  `N_RESET_PRM` decimal(20,2) DEFAULT NULL COMMENT '重置保费金额',
  `C_PROD_NO` varchar(30) DEFAULT NULL COMMENT '险种代码',
  `N_TMS` decimal(4,0) DEFAULT NULL COMMENT '转入次数',
  `T_BILL_TM` datetime DEFAULT NULL COMMENT '账单生成时间',
  `N_CAL_TMS` decimal(4,0) DEFAULT NULL COMMENT '未决计算顺序',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_EL_LOSS_TOREFUND` (`C_PK_ID`),
  UNIQUE KEY `IDX_WEB_RI_EL_LOSS_TOREFUND` (`C_CLMORACCT_CDE`,`N_SPLIT_SEQ`,`N_REFUND_TMS`),
  KEY `IDX_CLM_SEQ_CONT` (`C_CLM_NO`,`N_SPLIT_SEQ`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_CLMORACCT_SEQ_CONT` (`C_CLMORACCT_CDE`,`N_SPLIT_SEQ`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_CLMORACCT_CONT` (`C_CLMORACCT_CDE`,`C_CONT_ID`) USING BTREE,
  KEY `IDX_ACCT_CONT` (`C_ACCT_CDE`,`C_CONT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超赔待摊回损失表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_loss_trace`
--

DROP TABLE IF EXISTS `web_ri_el_loss_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_loss_trace` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_REL_ID` varchar(50) DEFAULT NULL,
  `C_CLM_NO` varchar(30) DEFAULT NULL COMMENT '赔案号',
  `C_CATA_CDE` varchar(30) DEFAULT NULL COMMENT '巨灾代码',
  `N_SPLIT_SEQ` decimal(4,0) DEFAULT NULL COMMENT '险位序号',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险时间',
  `C_ACCDNT_CAUS_CDE` varchar(30) DEFAULT NULL COMMENT '出险原因代码',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '写入次数',
  `N_CLM_AMT` decimal(20,6) NOT NULL COMMENT '已决赔款',
  `N_PEND_AMT` decimal(20,6) DEFAULT NULL COMMENT '未决赔款',
  `N_CLM_RET_AMT` decimal(20,6) NOT NULL COMMENT '自留已决赔款',
  `N_PEND_RET_AMT` decimal(20,6) DEFAULT NULL COMMENT '自留未决赔款',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CLMORCATA_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号/巨灾代码',
  `C_LOSS_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '损失类型 1险位损失，2事故损失',
  `C_RI_CUR` varchar(30) DEFAULT NULL COMMENT '再保币种',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_EL_LOSS_TRACE` (`C_PK_ID`),
  UNIQUE KEY `IDX_WEB_RI_EL_LOSS_TRACE` (`C_CLMORCATA_CDE`,`N_SPLIT_SEQ`,`N_TMS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超赔摊回赔案轨迹表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_loss_unnomal`
--

DROP TABLE IF EXISTS `web_ri_el_loss_unnomal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_loss_unnomal` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CLM_NO` varchar(30) DEFAULT NULL COMMENT '赔案号',
  `N_CLM_TMS` decimal(4,0) NOT NULL COMMENT '赔付次数',
  `N_SPLIT_SEQ` decimal(4,0) DEFAULT NULL COMMENT '险位序号',
  `C_CATA_CDE` varchar(30) DEFAULT NULL COMMENT '巨灾代码',
  `C_ACCT_CDE` varchar(30) DEFAULT NULL COMMENT '事故代码',
  `C_CONT_CDE` varchar(30) DEFAULT NULL COMMENT '合约代码',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险时间',
  `C_ACCDNT_CAUS_CDE` varchar(30) DEFAULT NULL COMMENT '出险原因代码',
  `C_CLM_STS_CDE` varchar(100) NOT NULL COMMENT '理赔环节代码',
  `C_CLM_STS_NME` varchar(100) NOT NULL COMMENT '理赔环节名称',
  `N_CLM_AMT` decimal(20,6) NOT NULL COMMENT '已决赔款',
  `N_CLM_RET_AMT` decimal(20,6) NOT NULL COMMENT '自留已决赔款',
  `N_CLM_AMT_FIRST` decimal(20,6) DEFAULT NULL COMMENT '第一次赔款',
  `N_CLM_RET_AMT_FIRST` decimal(20,6) DEFAULT NULL COMMENT '第一次自留赔款',
  `N_DIFF_RET_AMT` decimal(20,6) DEFAULT '0.000000' COMMENT '差异值',
  `N_SELF_PRPT` decimal(15,10) DEFAULT NULL COMMENT '自留比例',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT '0' COMMENT '批改序号',
  `C_PROD_NO` varchar(6) DEFAULT NULL COMMENT '产品代码',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '机构代码',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源',
  `C_CLMORACCT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号/事故代码',
  `C_RI_CUR` varchar(30) DEFAULT NULL COMMENT '再保币种',
  `C_STATUS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '账单状态： 0、未生成，1、已生成、2、已收付',
  `C_LOSS_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '损失类型 1险位损失，2事故损失',
  `C_REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_web_ri_el_loss_unnomal` (`C_PK_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手工账单清单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_mdp_adj`
--

DROP TABLE IF EXISTS `web_ri_el_mdp_adj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_mdp_adj` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `C_RI_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保币种',
  `C_BRKR_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪人代码',
  `C_BRKR_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司，0否，1是',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保人代码',
  `C_ATTRIB` varchar(1) DEFAULT NULL COMMENT '境内外属性',
  `N_SHARE_PRPT` decimal(10,6) NOT NULL COMMENT '分出比例',
  `N_MDP_ADJ` decimal(20,2) NOT NULL COMMENT '预付分保费-调整保费',
  `N_DUTY_ADJ` decimal(20,2) DEFAULT NULL COMMENT '预付分保费-调整税',
  `N_DUTY_ADD_ADJ` decimal(20,2) DEFAULT NULL COMMENT '预付分保费-调整附加税',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `N_MDP` decimal(20,2) DEFAULT NULL COMMENT 'MDP',
  `N_ACTUAL_PRM` decimal(20,2) DEFAULT NULL COMMENT '实际保费',
  `N_REAL_GNPI` decimal(20,2) DEFAULT NULL COMMENT '实际GNPI',
  `N_TMS` decimal(4,0) DEFAULT NULL COMMENT '期次',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_EL_MDP_ADJ` (`C_PK_ID`),
  KEY `IDX_WEB_RI_EL_MDP_ADJ` (`C_CONT_ID`,`N_LAYER`,`C_BRKR_COM`,`C_RI_COM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MDP调整明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_mdp_adj_dtl`
--

DROP TABLE IF EXISTS `web_ri_el_mdp_adj_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_mdp_adj_dtl` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_REL_ID` varchar(50) DEFAULT NULL,
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `C_KIND_NO` varchar(30) DEFAULT NULL COMMENT '险类',
  `C_PROD_NO` varchar(30) DEFAULT NULL COMMENT '险种',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构',
  `C_RI_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保币种',
  `C_BRKR_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪人代码',
  `C_BRKR_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司，0否，1是',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保人代码',
  `N_SHARE_PRPT` decimal(10,6) NOT NULL COMMENT '分出比例',
  `N_MDP_ADJ` decimal(20,2) NOT NULL COMMENT '预付分保费-调整保费',
  `N_DUTY_ADJ` decimal(20,2) DEFAULT NULL COMMENT '预付分保费-调整税',
  `N_DUTY_ADD_ADJ` decimal(20,2) DEFAULT NULL COMMENT '预付分保费-调整附加税',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `N_TMS` decimal(4,0) DEFAULT NULL COMMENT '期次',
  `C_PROVINCE` varchar(30) DEFAULT NULL,
  `C_CITY` varchar(30) DEFAULT NULL,
  `C_LONG_TERM_MRK` varchar(1) DEFAULT NULL,
  `C_GRP_MRK` varchar(1) DEFAULT NULL,
  `C_BSNS_TYP` varchar(10) DEFAULT NULL,
  `C_USAGE_CDE` varchar(30) DEFAULT NULL,
  `C_CVRG_NO` varchar(6) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_EL_MDP_ADJ_DTL` (`C_PK_ID`),
  KEY `IDX_WEB_RI_EL_MDP_ADJ_DTL` (`C_CONT_ID`,`N_LAYER`,`C_KIND_NO`,`C_PROD_NO`,`C_DPT_CDE`,`C_BRKR_COM`,`C_RI_COM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MDP调整分摊明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_mdp_dtl`
--

DROP TABLE IF EXISTS `web_ri_el_mdp_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_mdp_dtl` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '期次',
  `C_KIND_NO` varchar(30) DEFAULT NULL COMMENT '险类',
  `C_PROD_NO` varchar(30) DEFAULT NULL COMMENT '险种',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构',
  `C_RI_CUR` varchar(30) DEFAULT NULL COMMENT '再保币种',
  `C_BRKR_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪人代码',
  `C_BRKR_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司，0否，1是',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保人代码',
  `N_SHARE_PRPT` decimal(10,6) NOT NULL COMMENT '分出比例',
  `N_CED_PRM` decimal(20,2) NOT NULL COMMENT '分保费',
  `N_DUTY` decimal(20,2) DEFAULT NULL COMMENT '境内增值税',
  `N_DUTY_ADD` decimal(20,2) DEFAULT NULL COMMENT '增值税附加税',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_PROVINCE` varchar(30) DEFAULT NULL,
  `C_CITY` varchar(30) DEFAULT NULL,
  `C_LONG_TERM_MRK` varchar(1) DEFAULT NULL,
  `C_GRP_MRK` varchar(1) DEFAULT NULL,
  `C_BSNS_TYP` varchar(10) DEFAULT NULL,
  `N_COM_CED_PRM` decimal(20,2) DEFAULT NULL COMMENT '再保人参与保费',
  `N_PRDBS_PRM_PRPT` decimal(10,6) DEFAULT NULL COMMENT '再保人产品渠道分摊比例',
  `N_TMS_PRM_PRPT` decimal(10,6) DEFAULT NULL COMMENT '再保人分期分摊比例',
  `C_USAGE_CDE` varchar(30) DEFAULT NULL,
  `C_CVRG_NO` varchar(6) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_EL_MDP_DTL` (`C_PK_ID`),
  KEY `IDX_WEB_RI_EL_MDP_DTL` (`C_CONT_ID`,`N_LAYER`,`N_TMS`,`C_KIND_NO`,`C_DPT_CDE`,`C_PROD_NO`,`C_BRKR_COM`,`C_RI_COM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预付分保费分摊明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_pend_info`
--

DROP TABLE IF EXISTS `web_ri_el_pend_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_pend_info` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '险位序号',
  `N_RBK_SEQ` decimal(4,0) NOT NULL COMMENT '冲正标志',
  `N_PEND_TMS` decimal(4,0) DEFAULT NULL COMMENT '未决调整次数',
  `T_TORI_TM` datetime DEFAULT NULL COMMENT '转入时间',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险时间',
  `C_ACCDNT_CAUS_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '出险原因代码',
  `C_PLACE_LOSS` text COMMENT '出险地点',
  `T_RIDUE_TM` datetime NOT NULL COMMENT '再保挂账日期',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险种',
  `N_RI_CLM_AMT` decimal(20,2) DEFAULT NULL COMMENT '再保已决赔款',
  `N_REFUNDCLM_AMT` decimal(20,6) DEFAULT NULL COMMENT '已决摊回赔款',
  `N_RETCLM_AMT` decimal(20,6) DEFAULT NULL COMMENT '已决自留赔款',
  `C_READ_FLAG` varchar(1) DEFAULT NULL COMMENT '读写标志',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '机构代码',
  `C_CATA_CDE` varchar(30) DEFAULT NULL COMMENT '巨灾代码',
  `C_LOSS_TYPE` varchar(1) DEFAULT NULL COMMENT '损失类型',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超赔未决信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_reset_adj`
--

DROP TABLE IF EXISTS `web_ri_el_reset_adj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_reset_adj` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `C_RI_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保币种',
  `C_BRKR_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪人代码',
  `C_BRKR_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司，0否，1是',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保人代码',
  `C_ATTRIB` varchar(1) DEFAULT NULL COMMENT '境内外属性',
  `N_SHARE_PRPT` decimal(10,6) NOT NULL COMMENT '分出比例',
  `N_RESET_PRM_ADJ` decimal(20,2) NOT NULL COMMENT '重置保费-调整保费',
  `N_RESET_DUTY_ADJ` decimal(20,2) DEFAULT NULL COMMENT '重置保费-调整税',
  `N_RESET_DUTY_ADD_ADJ` decimal(20,2) DEFAULT NULL COMMENT '重置保费-调整附加税',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CLMORACCT_CDE` varchar(30) DEFAULT NULL COMMENT '事故号/赔案号',
  `N_SPLIT_SEQ` decimal(4,0) DEFAULT NULL COMMENT '险位序号',
  `N_REFUND_TMS` decimal(4,0) DEFAULT NULL COMMENT '摊回次数',
  `N_RESET_PRM` decimal(20,2) DEFAULT NULL COMMENT '重置保费',
  `N_NEW_RESET_PRM` decimal(20,2) DEFAULT NULL COMMENT '最新重置保费',
  `C_LOSS_TYPE` varchar(1) DEFAULT NULL COMMENT '损失类型 1险位损失，2事故损失',
  `N_RECOVER_NO` decimal(4,0) DEFAULT NULL COMMENT '恢复次数',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `WEB_RI_EL_RESET_ADJ_C_PK_ID` (`C_PK_ID`),
  UNIQUE KEY `IDX_WEB_RI_EL_RESET_ADJ` (`C_CLMORACCT_CDE`,`N_SPLIT_SEQ`,`N_REFUND_TMS`,`C_CONT_ID`,`N_LAYER`,`C_BRKR_COM`,`C_RI_COM`,`N_RECOVER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='重置保费调整明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_el_reset_adj_dtl`
--

DROP TABLE IF EXISTS `web_ri_el_reset_adj_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_el_reset_adj_dtl` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_REL_ID` varchar(50) DEFAULT NULL,
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `C_KIND_NO` varchar(30) DEFAULT NULL COMMENT '险类',
  `C_PROD_NO` varchar(30) DEFAULT NULL COMMENT '险种',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '机构',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '渠道',
  `C_RI_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保币种',
  `C_BRKR_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪人代码',
  `C_BRKR_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司，0否，1是',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保人代码',
  `C_ATTRIB` varchar(1) DEFAULT NULL COMMENT '境内外属性',
  `N_SHARE_PRPT` decimal(10,6) NOT NULL COMMENT '分出比例',
  `N_RESET_PRM_ADJ` decimal(20,2) NOT NULL COMMENT '重置保费-调整保费',
  `N_RESET_DUTY_ADJ` decimal(20,2) DEFAULT NULL COMMENT '重置保费-调整税',
  `N_RESET_DUTY_ADD_ADJ` decimal(20,2) DEFAULT NULL COMMENT '重置保费-调整附加税',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CLMORACCT_CDE` varchar(30) DEFAULT NULL COMMENT '事故号/赔案号',
  `N_SPLIT_SEQ` decimal(4,0) DEFAULT NULL COMMENT '险位序号',
  `N_REFUND_TMS` decimal(4,0) DEFAULT NULL COMMENT '摊回次数',
  `C_LOSS_TYPE` varchar(1) DEFAULT NULL COMMENT '损失类型 1险位损失，2事故损失',
  `N_RECOVER_NO` decimal(4,0) DEFAULT NULL COMMENT '恢复次数',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_EL_RESET_ADJ_DTL` (`C_PK_ID`),
  UNIQUE KEY `IDX_WEB_RI_EL_RESET_ADJ_DTL` (`C_CLMORACCT_CDE`,`N_SPLIT_SEQ`,`N_REFUND_TMS`,`C_CONT_ID`,`N_LAYER`,`C_KIND_NO`,`C_PROD_NO`,`C_BRKR_COM`,`C_RI_COM`,`N_RECOVER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RESET调整分摊明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ensure`
--

DROP TABLE IF EXISTS `web_ri_ensure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ensure` (
  `C_ENSURE_PK_ID` varchar(50) COLLATE utf8_bin NOT NULL,
  `C_SETT_NO` varchar(50) COLLATE utf8_bin NOT NULL,
  `C_RI_COM` varchar(30) COLLATE utf8_bin NOT NULL,
  `C_RI_BRKR` varchar(30) COLLATE utf8_bin NOT NULL,
  `C_BILL_CUR` varchar(30) COLLATE utf8_bin NOT NULL,
  `N_ENSURE_CED_PRPT` decimal(10,6) NOT NULL,
  `N_FEE_AMT` decimal(20,2) NOT NULL,
  `N_ENSURE_TMS` decimal(4,0) DEFAULT NULL,
  `C_CONT_ID` varchar(50) COLLATE utf8_bin NOT NULL,
  `C_CONT_CDE` varchar(30) COLLATE utf8_bin NOT NULL,
  `C_DOC_FLAG` varchar(2) COLLATE utf8_bin NOT NULL,
  `C_BILL_NO` varchar(50) COLLATE utf8_bin NOT NULL,
  `N_TMS` decimal(4,0) DEFAULT NULL,
  `C_PROVINCE` varchar(30) COLLATE utf8_bin NOT NULL,
  `C_CITY` varchar(30) COLLATE utf8_bin NOT NULL,
  `C_BILL_TYP` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `C_ENSURE_STATUS` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `C_RETURN_SETT_NO` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_ENSURE` (`C_ENSURE_PK_ID`),
  KEY `IDX_RI_ENSURE_C_CONT_ID` (`C_CONT_ID`,`C_RI_COM`,`C_RI_BRKR`,`C_BILL_CUR`),
  KEY `IDX_RI_ENSURE_C_SETT_NO` (`C_SETT_NO`),
  KEY `IDX_RI_ENSURE_N_TMS` (`N_TMS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_eq_info`
--

DROP TABLE IF EXISTS `web_ri_eq_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_eq_info` (
  `C_EQINFO_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_DOC_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'P' COMMENT '单证类型,''A'' 保单,''E'' 批单',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号 Policy No',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '批改序号,批改次数 Times of Endorsement',
  `N_TMS` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '分期序号,分期缴费的序号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单申请单号',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号',
  `N_RI_AMT` decimal(20,2) NOT NULL COMMENT '再保折人民币保额,地震险保额',
  `N_RI_PRM` decimal(20,2) NOT NULL COMMENT '再保保费,地震险保费',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `N_AMT` decimal(20,2) NOT NULL COMMENT '原保保额,地震险保额',
  `N_PRM` decimal(20,2) NOT NULL COMMENT '原保费',
  `C_AMT_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '承保保额币种',
  `C_PRM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保费币种 Currency of Premium',
  `C_RIPRM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_PRM_CHG_RATE` decimal(10,6) NOT NULL COMMENT '再保保费兑换汇率',
  `N_AMT_CHG_RATE` decimal(10,6) NOT NULL COMMENT '原保额折人民币汇率',
  `N_RBK_SEQ` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '冲正标志',
  `N_PLY_TMS` decimal(4,0) DEFAULT NULL COMMENT '对应保单期别',
  `N_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '原币种保额变化,地震险原币种保额变化',
  `N_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '原币种费变化,地震险原币种保费变化',
  `N_RMB_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '人民币保额变化,地震险人民币保额变化',
  `N_RI_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '再保币种费变化,地震险再保币种保费变化',
  `N_RI_UN_PRM` decimal(20,2) DEFAULT NULL COMMENT '再保币种当次批改后未了责任保费(上次保批单在当次批改生效期的未了责任保费+当次批改保费变化)',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_EQ_INFO` (`C_EQINFO_PK_ID`),
  KEY `IDX_RI_EQ_INFO_C_APP_NO` (`C_APP_NO`),
  KEY `IDX_RI_EQ_INFO_C_PLY_NO` (`C_PLY_NO`,`N_EDR_PRJ_NO`),
  KEY `IDX_RI_EQ_INFO_N_PLY_TMS` (`N_PLY_TMS`),
  KEY `IDX_RI_EQ_INFO_N_RBK_SEQ` (`N_RBK_SEQ`),
  KEY `IDX_RI_EQ_INFO_N_SPLIT_SEQ` (`N_SPLIT_SEQ`),
  KEY `IDX_RI_EQ_INFO_N_TMS` (`N_TMS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录地震险的保额、保费信息，承保写入保批单接口表时写该表对于财产险附加地震险，需要单独记录地震险的信息，在分保计算时需单独生成地震险的分出数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_excl_flow_info`
--

DROP TABLE IF EXISTS `web_ri_excl_flow_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_excl_flow_info` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '申请单号',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL COMMENT '批改序号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '拆分序号',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_RIKIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险类',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品',
  `C_RISK_LVL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '风险等级',
  `C_DECLARE_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '申报标志,0=非申报,1=转申报',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='除外流程信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_accdnt_note`
--

DROP TABLE IF EXISTS `web_ri_fac_accdnt_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_accdnt_note` (
  `C_FAC_ACCDNT_NOTE_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '临分出险通知PKID',
  `C_FAC_ACCDNT_NOTE_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '临分出险通知单号',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号',
  `C_UW_YEAR` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务年度',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '机构代码 Department No',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码 Product Code',
  `N_SUM_CLM_PAID` decimal(20,2) NOT NULL COMMENT '总赔付金额',
  `C_CLM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '总赔付金额币种',
  `C_INSRNT_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '被保人名称',
  `T_INSRNC_BGN_TM` datetime NOT NULL COMMENT '保险起期 Policy Effective Date',
  `T_INSRNC_END_TM` datetime NOT NULL COMMENT '保险止期 Policy Expire Date',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险日期',
  `N_SUM_AMT` decimal(20,2) DEFAULT NULL COMMENT '总保额',
  `C_ACCDNT_CAUS_CDE` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '出险原因代码',
  `C_PLACE_LOSS` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '出险地点',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保公司代码',
  `N_SHARE_PRPT` decimal(10,6) NOT NULL COMMENT '参与比例',
  `N_CLM_PAID` decimal(20,2) NOT NULL COMMENT '摊回赔款',
  `C_CONFIRM_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '确认标识,0=否(默认)，1=是',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_ACCDNT_TGT` varchar(100) DEFAULT NULL COMMENT '出险标的信息',
  `N_SPLIT_SEQ` decimal(4,0) DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `C_PEND_SOURCE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '理赔环节,''0''报案;''2''查勘定损（非意康险为核损）;''4''核赔;''6''结案',
  `C_CLM_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔付类型,0=理算(默认)，1=预付，2=垫付',
  `N_CLM_TMS` decimal(6,0) NOT NULL COMMENT '赔付次数',
  `C_CI_MRK` varchar(1) DEFAULT NULL COMMENT '共保方式,"0"=非共保业务,"1"=内部共保（我方主共）,"2"=内部共保（我方从共）,"3"=外部共保（我方主共）,"4"=外部共保（我方从共）',
  `N_CI_PAY_AMT` decimal(20,2) DEFAULT NULL COMMENT '共保总赔款',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '数据迁移标志1,迁移单，2.历史保单在新系统发生的赔',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '数据迁移时间',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT '0' COMMENT '批改序号,批改次数 Times of Endorsement',
  `N_CI_PRPT` decimal(10,6) DEFAULT NULL COMMENT '共保比例',
  `T_CONFIRM_TM` datetime DEFAULT NULL COMMENT '确认通知的时间',
  `N_NOTE_TYP` decimal(1,0) DEFAULT NULL COMMENT '通知类型：1 临分出险通知书，2注销临分出险通知书',
  `N_SOURCE_FLAG` decimal(1,0) DEFAULT NULL COMMENT '数据来源。0非车；1车险；2其它',
  `T_CANCLE_TM` datetime DEFAULT NULL COMMENT '注销时间',
  `C_RI_CUR` varchar(30) DEFAULT NULL COMMENT '再保币种',
  `N_RI_CLM_AMT` decimal(20,2) DEFAULT NULL COMMENT '再保赔付金额',
  `N_CHG_RATE` decimal(10,6) DEFAULT NULL COMMENT '兑换率',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_FAC_ACCDNT_NOTE` (`C_FAC_ACCDNT_NOTE_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='临分出险通知单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_accdnt_note_dtl`
--

DROP TABLE IF EXISTS `web_ri_fac_accdnt_note_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_accdnt_note_dtl` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_FAC_ACCDNT_NOTE_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '临分赔案通知单号',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标示ID',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保公司',
  `C_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否经纪公司,''0''否,''1''是',
  `C_RI_BRKR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪公司',
  `N_CLM_AMT` decimal(20,6) NOT NULL COMMENT '赔款金额',
  `N_CLM_PRPT` decimal(15,10) NOT NULL COMMENT '赔款比例',
  `C_CED_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '分出类型,A 正常，B 混合溢额成数分出,C 临分超赔,D 类地震溢额分出,Z 其他',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '数据迁移标志1,迁移单，2.历史保单在新系统发生的赔',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '数据迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_FAC_ACCDNT_NOTE_DTL` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='临分赔案通知单摊回明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_bid_main`
--

DROP TABLE IF EXISTS `web_ri_fac_bid_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_bid_main` (
  `C_FAC_BID_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报价单号',
  `C_DOC_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '单证类型,''A'' 保单,''E'' 批单',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '投保单号或批改申请单号',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码',
  `C_PROD_NME` varchar(50) DEFAULT NULL COMMENT '产品名称,可修改',
  `C_INSURED_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '被保人名称',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '保险起期',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '保险止期',
  `C_UW_YEAR` varchar(4) DEFAULT NULL COMMENT '承保年度',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '承保机构',
  `C_PRM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '承保保费币种',
  `N_PRM` decimal(20,2) NOT NULL COMMENT '承保保费,当前风险单位的',
  `C_AMT_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '承保保额币种',
  `N_AMT` decimal(20,2) NOT NULL COMMENT '承保保额,当前风险单位的',
  `N_RMB_AMT` decimal(20,6) DEFAULT NULL COMMENT '折人民币保额',
  `N_RMB_CHG_RATE` decimal(10,6) DEFAULT NULL COMMENT '折人民币汇率,按保险起期计算汇率',
  `C_RI_CUR` varchar(30) DEFAULT NULL COMMENT '再保保费币种,原保费币种是财务核算币种,则为原保费币种；如果不是财务核算币种，则转换为美元',
  `N_RI_PRM` decimal(20,2) DEFAULT NULL COMMENT '再保保费,再保可处理保费，原承保保费折算后保费',
  `N_PRM_CHG_RATE` decimal(10,6) DEFAULT NULL COMMENT '再保保费汇率',
  `N_RET_AMT` decimal(20,2) DEFAULT NULL COMMENT '自留额,币种为人民币',
  `N_RET_PRPT` decimal(10,6) DEFAULT NULL COMMENT '自留比例',
  `N_FAC_PRPT` decimal(10,8) DEFAULT NULL,
  `N_FAC_CED_AMT` decimal(20,6) DEFAULT NULL COMMENT '临分分出额,币种为人民币',
  `C_SURPLUS_MRK` varchar(1) DEFAULT NULL COMMENT '是否进溢额，''0''否,''1''是；预留',
  `N_SURPLUS_AMT` decimal(20,6) DEFAULT NULL COMMENT '溢额分出金额,预留',
  `C_FAC_XL_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否有临分超赔,''0''否,''1''是',
  `C_XL_CUR` varchar(30) DEFAULT NULL COMMENT '超赔限额币种,缺省为承保保额币种',
  `N_XL_BGN` decimal(20,2) DEFAULT NULL COMMENT '起赔点金额',
  `N_XL_LMT` decimal(20,2) DEFAULT NULL COMMENT '超赔限额',
  `N_XL_PRM` decimal(20,2) DEFAULT NULL COMMENT '超赔保费',
  `C_XLPRM_CUR` varchar(30) DEFAULT NULL COMMENT '超赔保费币种,默认与再保保费币种一致',
  `N_XLPRM_CHG_RATE` decimal(10,6) DEFAULT NULL COMMENT '超赔保费汇率',
  `N_CI_PRPT` decimal(10,6) DEFAULT NULL COMMENT '共保比例',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '状态,''0'' 待报价,''1''已报价,''2''已确认,''3''已生成账单,''4''已传财务',
  `C_BID_CDE` varchar(30) DEFAULT NULL COMMENT '报价人代码',
  `T_BID_TM` datetime DEFAULT NULL COMMENT '报价日期',
  `C_CONFIRM_CDE` varchar(30) DEFAULT NULL COMMENT '确认人代码',
  `T_CONFIRM_TM` datetime DEFAULT NULL COMMENT '确认日期',
  `C_CL_FAC_CDE` varchar(30) DEFAULT NULL COMMENT '取消临分人',
  `T_CL_FAC_TM` datetime DEFAULT NULL COMMENT '取消临分日期',
  `C_CL_CONFIRM_CDE` varchar(30) DEFAULT NULL COMMENT '取消确认人',
  `T_CL_CONFIRM_TM` datetime DEFAULT NULL COMMENT '取消确认日期',
  `C_REMARK` text COMMENT '备注',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT '0' COMMENT '批改次数',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_PRPT_PRM` decimal(20,6) DEFAULT NULL COMMENT '临分比例保费',
  `N_ACTUAL_PRM` decimal(20,6) DEFAULT NULL COMMENT '临分实际保费',
  `N_LAST_ACTUAL_PRM` decimal(20,6) DEFAULT NULL COMMENT '上一次临分实际保费',
  `N_ACTUAL_PRM_VAR` decimal(20,6) DEFAULT NULL COMMENT '临分实际保费变化',
  `N_BAL_PRM` decimal(20,6) DEFAULT NULL COMMENT '最新贴费金额',
  `N_AMT_VAR` decimal(20,6) DEFAULT NULL COMMENT '保额变化,当前风险单位的',
  `N_PRM_VAR` decimal(20,6) DEFAULT NULL COMMENT '保费变化,当前风险单位的',
  `C_FAC_BID_MAIN_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '临分报价PKID',
  `C_APPEND_MRK` varchar(1) DEFAULT '0' COMMENT '补打临分标识,0-否(默认),1-是',
  `N_RI_AMT` decimal(20,2) DEFAULT NULL COMMENT '再保保额',
  `N_RMB_PRM` decimal(20,2) DEFAULT NULL COMMENT '折人民币保费',
  `C_FAC_SPE_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT 'l临分差异分保标志，0=无差异，1=费率差异、2=免赔差异、3=责任差异',
  `N_CI_AMT` decimal(20,2) DEFAULT NULL COMMENT '共保全单保额',
  `N_CI_PRM` decimal(20,2) DEFAULT NULL COMMENT '共保全单保费',
  `N_DDUCT_AMT` decimal(20,2) DEFAULT NULL COMMENT '免赔额  Deductible Amount',
  `C_SPEC_DESC` text COMMENT '特别约定',
  `T_EDR_BGN_TM` datetime DEFAULT NULL COMMENT '批改生效起期',
  `T_EDR_END_TM` datetime DEFAULT NULL COMMENT '批改生效止期',
  `N_ASSURE_AMT` decimal(20,6) DEFAULT NULL COMMENT '保障保额,受合约保障保额值，用于计算受超赔合约包含的赔款比例',
  `C_XL_STATUS` varchar(1) DEFAULT NULL COMMENT '临分超赔状态,0=无超赔,1=有超赔,2=账单已生成,3=账单已传财务',
  `N_BILL_DUNNING_DAYS` decimal(6,0) DEFAULT NULL COMMENT '账单缴费期限',
  `N_XL_AMT` decimal(20,2) DEFAULT NULL COMMENT '临分超赔保额',
  `N_XL_PRPT` decimal(10,6) DEFAULT NULL COMMENT '临分超赔比例',
  `N_XL_PRPT_PRM` decimal(20,2) DEFAULT NULL COMMENT '参考超赔比例保费',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '数据迁移标志1,迁移单，2.历史保单在新系统发生的赔',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '数据迁移时间',
  `C_FAC_TYP` varchar(1) DEFAULT '0' COMMENT '临分类型，0=不需要临分，1=自主临分，2=提示临分，3=补打临分',
  `C_BUSINESS_CONFIRM` varchar(1) DEFAULT '0' COMMENT '临分业务确认，0=未确认，1=已确认',
  `C_CI_MRK` varchar(1) DEFAULT '0' COMMENT '共保方式,"0"=非共保业务,"1"=内部共保（我方主共）,"2"=内部共保（我方从共）,"3"=外部共保（我方主共）,"4"=外部共保（我方从共）',
  `C_DDUCT_DIFF_MRK` varchar(1) DEFAULT '0' COMMENT '永安需求.免赔差异0-否(默认).1-是',
  `C_DDUCT_DIFF_DESC` text COMMENT '永安需求.免赔差异说明',
  `C_LIAB_DIFF_MRK` varchar(1) DEFAULT '0' COMMENT '永安需求.责任差异0-否(默认).1-是',
  `C_LIAB_DIFF_DESC` text COMMENT '永安需求.责任差异说明',
  `C_FAC_RLT_NO` varchar(50) DEFAULT NULL COMMENT '批次号（临分保单批量报价关联号）',
  `C_LOS_EFFICACY_MRK` varchar(1) DEFAULT '0' COMMENT '失效标志，用于注销批单对应的保批单',
  `N_RI_VAT` decimal(20,2) DEFAULT NULL COMMENT '再保税',
  `N_RI_PRICE` decimal(20,2) DEFAULT NULL COMMENT '再保价',
  `N_RI_VAT_VAR` decimal(20,2) DEFAULT NULL COMMENT '再保税变化量',
  `N_RI_PRICE_VAR` decimal(20,2) DEFAULT NULL COMMENT '再保价变化量',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_FAC_BID_MAIN` (`C_FAC_BID_MAIN_PK_ID`),
  KEY `IDX_RI_FAC_BID_C_APP_NO` (`C_APP_NO`),
  KEY `IDX_RI_FAC_BID_C_FAC_BID_NO` (`C_FAC_BID_NO`),
  KEY `IDX_RI_FAC_BID_C_PLY_NO` (`C_PLY_NO`,`N_EDR_PRJ_NO`),
  KEY `IDX_RI_FAC_BID_N_SPLIT_SEQ` (`N_SPLIT_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_com`
--

DROP TABLE IF EXISTS `web_ri_fac_com`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_com` (
  `C_FACCOM_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_FAC_BID_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报价单号',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保公司',
  `C_XL_MRK` varchar(1) DEFAULT '0' COMMENT '是否超赔,''0''否,''1''是',
  `N_SHARE_PRPT` decimal(15,10) NOT NULL COMMENT '参与比例',
  `N_NET_PRM_RATE` decimal(10,6) DEFAULT NULL COMMENT '净费率,预留',
  `N_RI_RATE` decimal(10,6) DEFAULT NULL COMMENT '再保费率',
  `N_COMM_RATE` decimal(10,6) NOT NULL COMMENT '手续费率',
  `N_TAX_RATE` decimal(10,6) NOT NULL COMMENT '税率',
  `N_TAX_RATE_ADD` decimal(10,6) DEFAULT NULL COMMENT '增值税附加税率',
  `N_RI_PRM` decimal(20,6) NOT NULL COMMENT '分出保费',
  `N_RI_COMM` decimal(20,6) NOT NULL COMMENT '手续费,不含税，再保币种',
  `C_FAC_TYP` varchar(1) DEFAULT 'N' COMMENT '临分类型,N-正常 A-净费率 B-再保费率',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间 ',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `N_PRPT_PRM` decimal(20,6) DEFAULT NULL COMMENT '比例分出保费，再保币种',
  `N_XL_PRM` decimal(20,6) DEFAULT NULL COMMENT '超赔保费',
  `N_CED_AMT` decimal(20,6) DEFAULT NULL COMMENT '分出保额，再保币种',
  `N_LAST_CED_AMT` decimal(20,6) DEFAULT NULL COMMENT '上次分出保额，再保币种',
  `N_LAST_RI_PRM` decimal(20,6) DEFAULT NULL COMMENT '上次分出保费，再保币种',
  `N_CED_AMT_VAR` decimal(20,6) DEFAULT NULL COMMENT '分出保额变化，再保币种',
  `N_RI_PRM_VAR` decimal(20,6) DEFAULT NULL COMMENT '分出保费变化，再保币种',
  `N_DUTY` decimal(20,6) NOT NULL COMMENT '税费，再保币种',
  `N_DUTY_ADD` decimal(20,6) DEFAULT NULL COMMENT '增值税附加税',
  `N_ELSE_PRM` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '其它费用,记录临分分出的其它费用，再保币种',
  `N_ELSE_PRM_RATE` decimal(10,6) NOT NULL DEFAULT '0.000000' COMMENT '其它费用率',
  `C_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否经纪公司,''0'',''1''',
  `C_RI_BRKR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '经纪公司/再保公司',
  `N_RMB_CED_AMT` decimal(20,6) NOT NULL COMMENT '折人民币分出保额，供分保计算用',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT '0' COMMENT '批改序号,批改次数 Times of Endorsement,记录当前再保人是哪次批改新增的',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号 Policy No',
  `N_SPLIT_SEQ` decimal(4,0) DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_RI_COMM_VAR` decimal(20,6) DEFAULT NULL COMMENT '手续费变化，再保币种',
  `N_DUTY_VAR` decimal(20,6) DEFAULT NULL COMMENT '税费变化，再保币种',
  `N_DUTY_ADD_VAR` decimal(20,6) DEFAULT NULL COMMENT '附加税费变化，再保币种',
  `N_ELSE_PRM_VAR` decimal(20,6) DEFAULT NULL COMMENT '其它费用变化，再保币种',
  `N_LAST_RI_COMM` decimal(20,6) DEFAULT NULL COMMENT '上次手续费，再保币种',
  `N_LAST_DUTY` decimal(20,6) DEFAULT NULL COMMENT '上次税费，再保币种',
  `N_LAST_DUTY_ADD` decimal(20,6) DEFAULT NULL COMMENT '上次附加税费，再保币种',
  `N_LAST_ELSE_PRM` decimal(20,6) DEFAULT NULL COMMENT '上次其它费用，再保币种',
  `T_EFF_BGN_TM` datetime DEFAULT NULL COMMENT '有效起期',
  `T_EFF_END_TM` datetime DEFAULT NULL COMMENT '有效止期',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '历史迁移标识：1 = 历史',
  `N_CI_SHARE_PRPT` decimal(15,10) DEFAULT NULL COMMENT '共保业务再保人占整个保批单的比例',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_FAC_COM` (`C_FACCOM_PK_ID`),
  KEY `IDX_RI_FAC_COM_C_FAC_BID_NO` (`C_FAC_BID_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_el_accdnt_note`
--

DROP TABLE IF EXISTS `web_ri_fac_el_accdnt_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_el_accdnt_note` (
  `C_XLPAYMENT_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_FAC_BID_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报价单号',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_CLM_TMS` decimal(4,0) DEFAULT NULL COMMENT '赔付次数',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '拆分序号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层',
  `T_ACCDNT_TM` datetime DEFAULT NULL COMMENT '出现时间',
  `C_ACCDNT_CAUS_CDE` varchar(30) DEFAULT NULL COMMENT '出现原因代码',
  `N_START_POINT` decimal(20,2) NOT NULL COMMENT '起赔点',
  `N_CLM_AMT` decimal(20,2) DEFAULT NULL COMMENT '原赔付金额',
  `C_RI_CUR` varchar(30) DEFAULT NULL COMMENT '再保币种',
  `N_CHG_RATE` decimal(10,6) DEFAULT NULL COMMENT '兑换率',
  `N_CLM` decimal(20,2) DEFAULT NULL COMMENT '再保赔付金额',
  `N_CLM_PRPT_PRM` decimal(20,2) DEFAULT NULL COMMENT '？',
  `N_CLM_RET_PRM` decimal(20,2) DEFAULT NULL COMMENT '自留待摊回赔款',
  `N_CLM_PRM` decimal(20,2) DEFAULT NULL COMMENT '待摊回赔款金额，M值',
  `N_CLM_EL_PRM` decimal(20,2) NOT NULL COMMENT '层摊回赔款',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `C_BRKR_MRK` varchar(1) DEFAULT NULL COMMENT '是否经纪人，1是；0否',
  `C_BRKR_CDE` varchar(30) DEFAULT NULL COMMENT '经纪人代码',
  `C_RI_COM` varchar(30) DEFAULT NULL COMMENT '再保人代码',
  `N_SHARE_PRPT` decimal(10,6) DEFAULT NULL COMMENT '再保人比例',
  `N_RI_AMT` decimal(20,2) DEFAULT NULL COMMENT '再保总保额',
  `C_PLACE_LOSS` varchar(100) DEFAULT NULL COMMENT '出险地点',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超赔临分出现通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_el_com_share`
--

DROP TABLE IF EXISTS `web_ri_fac_el_com_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_el_com_share` (
  `C_XLCOM_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_FAC_BID_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '临分报价单号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层',
  `C_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪人标志',
  `C_BRKR_CDE` varchar(30) DEFAULT NULL COMMENT '经纪人',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保人',
  `N_SHARE_PRPT` decimal(10,6) NOT NULL COMMENT '分出比例',
  `N_CED_PRM` decimal(20,2) DEFAULT NULL COMMENT '分保费',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人',
  `T_UPD_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `N_CED_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '分出保费变化量',
  `N_ADJUST_PRM` decimal(20,2) DEFAULT NULL COMMENT '调整保费',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='临分超赔再保人比例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_el_installment`
--

DROP TABLE IF EXISTS `web_ri_fac_el_installment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_el_installment` (
  `C_XLINST_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_FAC_BID_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '临分报价单号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '期次',
  `T_PAY_BGN_TM` datetime NOT NULL COMMENT '付款起始时间',
  `T_PAY_END_TM` datetime NOT NULL COMMENT '付款结束时间',
  `N_PAY_AMT` decimal(20,2) NOT NULL COMMENT '付款金额',
  `N_PAY_RATE` decimal(10,6) DEFAULT NULL COMMENT '付款比例',
  `C_DEMO` varchar(100) DEFAULT NULL COMMENT '备注',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `T_UPD_TM` datetime NOT NULL COMMENT '更新时间',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT NULL COMMENT '批改序号,批改次数 Times of Endorsement，记录当前是哪次批改的缴费计划',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='临分超赔分期表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_el_layer`
--

DROP TABLE IF EXISTS `web_ri_fac_el_layer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_el_layer` (
  `C_XLLAYER_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分层信息PKID',
  `C_FAC_BID_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报价单号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `N_START_POINT` decimal(20,2) NOT NULL COMMENT '起赔点',
  `N_LAYER_LMT` decimal(20,2) NOT NULL COMMENT '限额',
  `N_CLM_AMT` decimal(20,2) DEFAULT NULL COMMENT '原币层保费',
  `N_LAYER_PRM` decimal(20,2) DEFAULT NULL COMMENT '层保费',
  `N_RECOVER_TMS` decimal(4,0) DEFAULT NULL COMMENT '层责任恢复次数',
  `N_TOTAL_LMT` decimal(20,2) NOT NULL COMMENT '总责任限额',
  `C_RECOVER_TYPE` varchar(1) DEFAULT NULL COMMENT '恢复保费类型,F=Free,R=固定比例恢复,T=按时间比例恢复',
  `N_RECOVER_RATE` decimal(10,6) DEFAULT NULL COMMENT '恢复保费比例,默认1',
  `N_CED_RATE` decimal(10,6) DEFAULT NULL COMMENT '分出份额,系统默认汇总接受人分出份额',
  `N_ADJUST_RATE` decimal(10,6) DEFAULT NULL COMMENT '调整比例',
  `N_ADJUST_PRM` decimal(20,2) DEFAULT NULL COMMENT '调整保费',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `N_TOTAL_PRPT` decimal(10,6) DEFAULT NULL COMMENT '总分出比例',
  `N_LAYER_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '层保费变化量',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_FAC_EL_LAYER` (`C_XLLAYER_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='临分赔合约分层设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_el_layer_inwd`
--

DROP TABLE IF EXISTS `web_ri_fac_el_layer_inwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_el_layer_inwd` (
  `C_XLLAYERINWD_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分入分层信息PKID',
  `C_FAC_BID_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报价单号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层数',
  `N_LAYER_LMT` decimal(20,2) DEFAULT NULL COMMENT '层高',
  `N_LAYER_PRM` decimal(20,2) DEFAULT NULL COMMENT '层保费',
  `N_RECOVER_TMS` decimal(4,0) DEFAULT NULL COMMENT '层责任恢复次数',
  `N_TOTAL_LMT` decimal(20,2) DEFAULT NULL COMMENT '总责任限额',
  `C_BRKR_MRK` varchar(1) DEFAULT '0' COMMENT '是否经纪公司，默认为0，否',
  `C_BRKR_CDE` varchar(30) DEFAULT NULL COMMENT '经纪公司',
  `C_RI_COM` varchar(30) DEFAULT NULL COMMENT '再保公司',
  `N_SHARE_PRPT` decimal(10,6) DEFAULT NULL COMMENT '我司份额',
  `N_OWN_PRM` decimal(20,2) DEFAULT NULL COMMENT '我司毛保费(在超频合约分入是预付分保费)',
  `N_OWN_LMT` decimal(20,2) DEFAULT NULL COMMENT '我司限额',
  `N_NET_PRM` decimal(20,2) DEFAULT NULL COMMENT '我司净保费',
  `N_BRKR_RATE` decimal(10,6) DEFAULT NULL COMMENT '经纪费率',
  `N_BRKR_CHARGE` decimal(20,2) DEFAULT NULL COMMENT '经纪费',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `N_LAYER_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '层保费变化量',
  `N_START_POINT` decimal(20,2) DEFAULT NULL COMMENT '起赔点',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_FAC_EL_LAYER_INWD` (`C_XLLAYERINWD_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='临分分入超赔分层设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_el_payment`
--

DROP TABLE IF EXISTS `web_ri_fac_el_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_el_payment` (
  `C_XLPAYMENT_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_FAC_BID_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '临分报价单号',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_CLM_TMS` decimal(4,0) DEFAULT NULL COMMENT '赔付次数',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '风险单位序号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层',
  `T_ACCDNT_TM` datetime DEFAULT NULL COMMENT '出现时间',
  `C_ACCDNT_CAUS_CDE` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '出险原因代码',
  `N_START_POINT` decimal(20,2) NOT NULL COMMENT '起赔点',
  `N_CLM_AMT` decimal(20,2) DEFAULT NULL COMMENT '摊回赔款',
  `C_RI_CUR` varchar(30) DEFAULT NULL COMMENT '再保币种',
  `N_CHG_RATE` decimal(10,6) DEFAULT NULL COMMENT '兑换率',
  `N_CLM` decimal(20,2) NOT NULL COMMENT '已决赔款总金额',
  `N_CLM_PRPT_PRM` decimal(20,2) NOT NULL COMMENT '已决比例摊回赔款',
  `N_CLM_RET_PRM` decimal(20,2) NOT NULL COMMENT '已决净自留赔款',
  `N_CLM_PRM` decimal(20,2) NOT NULL COMMENT '待摊回赔款',
  `N_CLM_EL_PRM` decimal(20,2) NOT NULL COMMENT '已决超赔摊回赔款',
  `N_PEND` decimal(20,2) NOT NULL COMMENT '未决赔款金额',
  `N_PEND_PRPT_PRM` decimal(20,2) NOT NULL COMMENT '未决比例摊回赔款',
  `N_PEND_RET_PRM` decimal(20,2) NOT NULL COMMENT '未决净自留赔款',
  `N_PEND_PRM` decimal(20,2) NOT NULL COMMENT '待摊回未决赔款',
  `N_PEND_EL_PRM` decimal(20,2) NOT NULL COMMENT '未决超赔摊回赔款',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `T_UPD_TM` datetime NOT NULL COMMENT '更新时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='临分超赔摊回赔款';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_el_payment_inwd`
--

DROP TABLE IF EXISTS `web_ri_fac_el_payment_inwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_el_payment_inwd` (
  `C_XLPAYMENT_INWD_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_FAC_BID_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报价单号',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_CLM_TMS` decimal(4,0) NOT NULL COMMENT '赔付次数',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT NULL COMMENT '批改序号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '拆分序号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层号',
  `T_ACCDNT_TM` datetime DEFAULT NULL COMMENT '出险日期',
  `C_ACCDNT_CAUS_CDE` varchar(30) DEFAULT NULL COMMENT '出险原因',
  `N_START_POINT` decimal(20,2) DEFAULT NULL COMMENT '起赔点',
  `N_CLM_AMT` decimal(20,2) DEFAULT NULL COMMENT '总赔款金额',
  `N_OWN_PRPT` decimal(10,6) DEFAULT NULL COMMENT '我司比例',
  `N_CLM_OWN_PRM` decimal(20,2) NOT NULL COMMENT '我司应摊赔款',
  `N_CLM_RET_PRM` decimal(20,2) DEFAULT NULL COMMENT '我司净应摊赔款',
  `N_CLM_LAYER_PRM` decimal(20,2) NOT NULL COMMENT '层应摊赔款',
  `C_RI_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保币种',
  `N_COUNT` decimal(4,0) DEFAULT NULL COMMENT '恢复次数',
  `N_RE_LAYER_PRM` decimal(20,2) NOT NULL COMMENT '层重置保费',
  `N_RE_OWN_PRM` decimal(20,2) NOT NULL COMMENT '我司重置保费',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `WEB_RI_FAC_EL_PAYMENT_INWD` (`C_XLPAYMENT_INWD_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='超赔临分分入摊回赔款';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_el_reinstatement`
--

DROP TABLE IF EXISTS `web_ri_fac_el_reinstatement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_el_reinstatement` (
  `C_REINSTAT_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_FAC_BID_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '临分报价单号',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_CLM_TMS` decimal(4,0) DEFAULT NULL COMMENT '赔付次数',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '风险单位序号',
  `N_LAYER` decimal(4,0) NOT NULL COMMENT '层',
  `T_ACCDNT_TM` datetime DEFAULT NULL COMMENT '出现时间',
  `C_RI_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保币种',
  `N_COUNT` decimal(4,0) NOT NULL COMMENT '恢复次数',
  `N_LOSS` decimal(20,2) NOT NULL COMMENT '总赔款',
  `N_ADDITIONAL` decimal(20,2) NOT NULL COMMENT '重置保费',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `T_UPD_TM` datetime NOT NULL COMMENT '更新时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新人',
  `C_CLM_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔付类型',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='临分超赔重置保费';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_enter_ret_lmt`
--

DROP TABLE IF EXISTS `web_ri_fac_enter_ret_lmt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_enter_ret_lmt` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_DPT_CDE` varchar(30) DEFAULT '*' COMMENT '机构,缺省为*表示全部机构适应，如为某一指定机构代码则只适应该机构',
  `C_RIKIND_NO` varchar(2) DEFAULT NULL COMMENT '险类代码',
  `C_PROD_NO` varchar(6) DEFAULT NULL COMMENT '产品代码',
  `C_RISK_LVL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '*' COMMENT '风险等级',
  `N_RET_LMT` decimal(20,2) DEFAULT '0.00' COMMENT '自留限额',
  `C_CUR` varchar(30) DEFAULT NULL COMMENT '币种',
  `N_VIP_LMT` decimal(20,2) DEFAULT '0.00' COMMENT 'VIP自留限额',
  `T_BGN_TM` datetime NOT NULL COMMENT '生效起期',
  `T_END_TM` datetime NOT NULL COMMENT '生效止期',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_FAC_ENTER_RET_LMT` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进入临分自留额限额设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_opn`
--

DROP TABLE IF EXISTS `web_ri_fac_opn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_opn` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `N_OPN_SEQ` decimal(4,0) NOT NULL COMMENT '意见序号',
  `C_DOC_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '单证类型,''A'' 保单,''E'' 批单',
  `C_OPN_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '意见类型,0-核保员意见,1=再保部反馈意见',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '投保单号',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构部门',
  `T_OPN_TM` datetime NOT NULL COMMENT '意见提交时间',
  `C_OPN_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '意见人代码',
  `C_OPN_CNM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '意见人名称',
  `C_OPN_TXT` text COMMENT '意见文本',
  `C_FAC_OPN_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '临分意见选项,A 需要临分B 不需要临分',
  `C_OPN_STS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '暂存状态,0-暂存,1-已发送',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号,核保时还未生成此号,保批单生成后需要回写',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号,核保时还未生成此号,保批单生成后需要回写',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT '0' COMMENT '批改序号,核保时还未生成此号,保批单生成后需要回写',
  `C_FAC_BID_NO` varchar(50) DEFAULT NULL COMMENT '报价单号,,核保时还未生成此号,保批单临分报价单生成后需要回写',
  `N_SPLIT_SEQ` decimal(4,0) DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号,预留',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_REL_FAC_MAIN_PK_ID` varchar(50) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_RI_FAC_OPN` (`C_PK_ID`),
  KEY `IDX_RI_FAC_APPNO` (`C_APP_NO`),
  KEY `IDX_RI_FAC_DOC_TYP` (`C_DOC_TYP`),
  KEY `IDX_RI_FAC_OPN_SEQ` (`N_OPN_SEQ`),
  KEY `IDX_RI_FAC_OPN_TYP` (`C_OPN_TYP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB_RI_FAC_OPN临分意见表,记录核保过程的核保意见信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_org_dpt`
--

DROP TABLE IF EXISTS `web_ri_fac_org_dpt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_org_dpt` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'sys_guid()' COMMENT 'ID',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构代码',
  `C_SNR_DPT` varchar(30) DEFAULT NULL COMMENT '上级机构',
  `C_DPT_CNM` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构名称',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人代码',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_IS_VALID` varchar(1) DEFAULT '1' COMMENT '是否有效：0：无效 1有效',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `P_WEB_RI_FAC_ORG_DPT` (`C_PK_ID`),
  KEY `IDX_FAC_ORGDPT_CDPTCDE` (`C_DPT_CDE`),
  KEY `IDX_FAC_ORGDPT_CSNRDPT` (`C_SNR_DPT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='临分机构码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fac_pay`
--

DROP TABLE IF EXISTS `web_ri_fac_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fac_pay` (
  `C_FAC_PAY_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分期付款PKID',
  `C_FAC_BID_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报价单号',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '期次',
  `T_PAY_BGN_TM` datetime NOT NULL COMMENT '付款起期',
  `T_PAY_END_TM` datetime NOT NULL COMMENT '付款止期',
  `N_PAY_AMT` decimal(20,2) NOT NULL COMMENT '付款金额',
  `N_PAY_RATE` decimal(10,6) NOT NULL COMMENT '付款比例',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT NULL COMMENT '批改序号,批改次数 Times of Endorsement，记录当前是哪次批改的缴费计划',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_FAC_PAY` (`C_FAC_PAY_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保批单一般临分的分期付款信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_fee_typ`
--

DROP TABLE IF EXISTS `web_ri_fee_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_fee_typ` (
  `C_FEETYP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '费用类型代码',
  `C_FEETYP_CNM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '费用类型中文名称',
  `C_FEETYP_ENM` varchar(50) DEFAULT NULL COMMENT '费用类型英文名称',
  `C_TYP_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '''0'' 保费，''1'' 赔款，''2''费用，''3'' 分保费，''4''准备金',
  `C_DESC` varchar(200) DEFAULT NULL COMMENT '费用描述',
  `C_DC_DIR` varchar(1) DEFAULT NULL COMMENT '''D'' DEBIT(收),''C'' CREDIT(付)',
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '有效否',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `C_FIN_FEETYP_CDE` varchar(30) DEFAULT NULL COMMENT '对应收付费用类型代码',
  `C_DOC_FLAG` varchar(1) DEFAULT NULL COMMENT '对应单据标识：1 分出保费2 分出摊回分保费用3 分出摊回分保赔款4 分出现金赔款5 分出存入分保准备金6 分出分保准备金利息',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='再保费用类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_img_idx`
--

DROP TABLE IF EXISTS `web_ri_img_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_img_idx` (
  `C_IMG_ID` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `C_VCH_TYP` varchar(30) DEFAULT NULL COMMENT '单据类型',
  `C_VCH_NO` varchar(50) DEFAULT NULL COMMENT '单据号',
  `C_IMG_TYP` varchar(30) DEFAULT NULL COMMENT '影像类型',
  `C_IMG_FILE_NME` varchar(200) DEFAULT NULL COMMENT '影像文件名',
  `C_IMG_DESC` varchar(200) DEFAULT NULL COMMENT '影像描述',
  `C_CRT_CDE` varchar(30) DEFAULT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime DEFAULT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) DEFAULT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime DEFAULT NULL COMMENT '修改时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='影像与单据的关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_insrnt_acum_set`
--

DROP TABLE IF EXISTS `web_ri_insrnt_acum_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_insrnt_acum_set` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品',
  `C_INSRNT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '被保人代码',
  `C_INSRNT_NME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '被保人名称',
  `N_AMT_LMT` decimal(20,6) NOT NULL COMMENT '设置累积限额',
  `T_BGN_TM` datetime NOT NULL COMMENT '生效起期',
  `T_END_TM` datetime NOT NULL COMMENT '生效止期',
  `T_CRT_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标识号',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='被保人合约限额设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_inter_bill_task`
--

DROP TABLE IF EXISTS `web_ri_inter_bill_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_inter_bill_task` (
  `C_BILL_YM` varchar(9) DEFAULT NULL COMMENT '出账年月',
  `C_CONFIRM_DATE` varchar(10) DEFAULT NULL COMMENT '确认日期',
  `C_CONFIRM_USER` varchar(30) DEFAULT NULL COMMENT '确认用户',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '状态A=已挂账 B= 已确认',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员 ',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_BILL_TASK` (`C_BILL_YM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合约分入任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_inter_clm_main`
--

DROP TABLE IF EXISTS `web_ri_inter_clm_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_inter_clm_main` (
  `C_CASE_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_RPT_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_RGST_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  绔嬫?鍙',
  `C_END_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  缁撴?鍙',
  `C_ARH_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  褰掓。鍙',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鎶曚繚鍗曞彿',
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鎵瑰崟鍙',
  `C_KIND_NO` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  浜у搧澶х被',
  `C_PROD_NO` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  浜у搧浠ｇ爜',
  `C_PLY_TYP_CDE` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  淇濆崟绫诲瀷浠ｇ爜锛?浜ゅ己銆?鍟嗕笟',
  `C_DPT_CDE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_BAH_DPT_CDE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鎵夸繚鏈烘瀯鎵?睘鍒嗗叕鍙镐唬鐮',
  `C_CLM_DPT_CDE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鐞嗚禂鏈烘瀯浠ｇ爜',
  `C_BSNS_TYP` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  涓氬姟鏉ユ簮',
  `C_BSNS_SUB_TYP` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  涓氬姟鏉ユ簮缁嗗垎',
  `C_SLS_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '涓氬姟鍛樹唬鐮',
  `C_SLS_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  涓氬姟鍛樺悕绉',
  `C_SLS_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  涓氬姟鍛樿韩浠借瘉鍙',
  `C_SLS_TEL` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  涓氬姟鍛樿仈绯荤數璇',
  `C_VHL_TYP` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  杞﹁締绫诲瀷浠ｇ爜',
  `C_VHL_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  杞﹁締绉嶇被浠ｇ爜',
  `C_USE_CDE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  浣跨敤鎬ц川浠ｇ爜',
  `C_LCN_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  杞︾墝鍙',
  `C_VHL_FRM` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  杞︽灦鍙',
  `C_ENG_NO` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鍙戝姩鏈哄彿',
  `N_TON_NUM` decimal(20,6) DEFAULT NULL COMMENT '  鍚ㄤ綅鏁',
  `N_SET_NUM` decimal(8,0) DEFAULT NULL COMMENT '  搴т綅鏁',
  `T_INS_BGN_TM` datetime NOT NULL,
  `T_INS_END_TM` datetime NOT NULL,
  `C_APP_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鎶曚繚浜轰唬鐮',
  `C_APP_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鎶曚繚浜哄悕绉',
  `C_INWD_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  鍒嗗叆鏍囧織锛?鍚︺?1鏄',
  `C_RI_FAC_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  涓村垎鏍囧織锛?鍚︺?1鏄',
  `C_CI_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  鍏变繚鏍囧織锛?鍚︺?1鏄',
  `C_CI_TYP` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鍏变繚鏂瑰紡锛?鍏卞嚭銆?鍏卞叆銆?鍏卞叆杞?叡鍑',
  `C_AGRI_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  娑夊啘鏍囧織锛?娑夊啘銆?闈炴秹鍐溿?3鍐滈櫓',
  `C_ENTRUST_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '濮旀墭/鍙楁墭锛?姝ｅ父銆?濮旀墭銆?鍙楁墭',
  `C_RGST_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  绔嬫?鏍囧織锛?鍚︺?1鑷?姩绔嬫?銆?浜哄伐绔嬫?',
  `C_ENDCASE_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  缁撴?鏍囧織锛?鍚︺?1鏄',
  `C_ARH_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  褰掓。鏍囧織锛?鍚︺?1鏄',
  `C_REOPEN_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  閲嶅紑妗堟爣蹇楋細0鍚︺?1鏄',
  `C_RECOVER_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  杩藉伩鏍囧織锛?鍚︺?1鏄',
  `C_PAY_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  鏀?粯鏍囧織锛?鍚︺?1閮ㄥ垎鏀?粯銆?鍏ㄩ儴鏀?粯',
  `N_PREPAY_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  棰勪粯鏍囧織锛?鍚︺?1鏄',
  `C_ADVPAY_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  鍨?粯鏍囧織锛?鍚︺?1鏄',
  `C_HUGE_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  宸ㄧ伨鏍囧織锛?鍚︺?1鏄',
  `C_GUP_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  娉ㄩ攢鏍囧織锛?鍚︺?1鏄',
  `C_RFU_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '鎷掕禂鏍囧織锛?鍚︺?1閮ㄥ垎鎷掕禂銆?鍏ㄩ儴鎷掕禂',
  `C_CNL_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  閿??鏍囧織锛?鍚︺?1鏄',
  `C_PXY_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  鏃犺矗浠ｈ禂鏍囧織锛?鍚︺?1鏄',
  `C_SELF_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  浜掔?鑷?禂鏍囧織锛?鍚︺?1鏄',
  `C_IS_BIG` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  澶ф?鏍囧織锛?鍚︺?1鏄',
  `C_IS_OTM` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  瓒呮椂鎶ユ?鏍囧織锛?鍚︺?1鏄',
  `C_DOC_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  妗堜欢鍗曡瘉榻愬?鏍囧織锛?鍚︺?1鏄??2浜哄伐蹇楅綈鍏',
  `C_IS_DUTY` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  鏄?惁淇濋櫓璐ｄ换鏍囧織锛?鍚︺?1鏄',
  `C_CLM_DEGREE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  妗堜欢绋嬪害',
  `C_CLM_PRI` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  妗堜欢浼樺厛绾',
  `C_CLM_STS` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '璧旀?鐘舵?锛?鎶ユ?鏆傚瓨銆?宸叉姤妗堛?2宸辨挙妗堛?3銆佸凡璋冨害銆?銆佸凡瀹氭崯銆?銆佸凡鏍告崯銆?宸茬珛妗堛?10宸辨敞閿??11銆佸凡鐞嗙畻銆?3銆佸凡鏍歌禂銆?5宸茬粨妗堛?16宸卞綊妗',
  `N_AMT` decimal(20,2) DEFAULT NULL COMMENT '  淇濋櫓閲戦?',
  `C_AMT_CUR` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  淇濋?甯佺?',
  `C_CLM_CUR` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鐞嗚禂甯佺?',
  `N_PEND_TMS` decimal(8,0) DEFAULT NULL COMMENT '  鏈?喅璋冩暣娆℃暟',
  `N_CLM_TMS` decimal(8,0) DEFAULT NULL COMMENT '  璧斾粯娆℃暟',
  `N_ADVPAY_TMS` decimal(8,0) DEFAULT NULL COMMENT '  鍨?粯娆℃暟',
  `N_PREPAY_TMS` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  棰勪粯娆℃暟',
  `N_RECOVER_TMS` decimal(8,0) DEFAULT NULL COMMENT '  杩藉伩娆℃暟',
  `N_REOPEN_TMS` decimal(8,0) DEFAULT NULL COMMENT '  閲嶅紑妗堟?鏁',
  `N_HIS_TMS` decimal(8,0) DEFAULT NULL COMMENT '  淇濆崟鍘嗗彶鍑洪櫓娆℃暟',
  `N_HIS_EFF_TMS` decimal(8,0) DEFAULT NULL COMMENT '  淇濆崟鏈夋晥骞村害鍑洪櫓娆℃暟',
  `N_HIS_LST_TMS` decimal(8,0) DEFAULT NULL COMMENT '  淇濆崟涓婂勾搴﹀嚭闄╂?鏁',
  `N_PREPAY` decimal(20,2) DEFAULT NULL COMMENT '  棰勪粯鎬婚?',
  `N_PP_AMT` decimal(14,2) DEFAULT NULL COMMENT '  鍨?粯鎬婚?',
  `N_CHASE_AMT` decimal(14,2) DEFAULT NULL COMMENT '  杩藉伩鎬婚?',
  `N_SELF_AMT` decimal(14,2) DEFAULT NULL COMMENT '  浜掔?鑷?禂鎬婚?',
  `N_PXY_AMT` decimal(14,2) DEFAULT NULL COMMENT '  鏃犺矗浠ｈ禂鎬婚?',
  `N_EXG_AMT` decimal(14,2) DEFAULT NULL COMMENT '  閫氳瀺鎬婚?',
  `N_PAY_AMT` decimal(14,2) DEFAULT NULL COMMENT '  璧旀?鎬婚?',
  `N_COIN_APPO` decimal(14,2) DEFAULT NULL COMMENT '鍏变繚鍒嗘憡鎬婚噾棰',
  `N_CLM_FEE` decimal(14,2) DEFAULT NULL COMMENT '  鐞嗚禂璐圭敤鎬婚?',
  `N_GUESS_AMT` decimal(14,2) DEFAULT NULL COMMENT '  鎶ユ崯閲戦?',
  `N_HLP_FEE` decimal(14,2) DEFAULT NULL COMMENT '  鏂芥晳璐规?棰',
  `C_RPT_TEL` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鎶ユ?浜虹數璇',
  `C_RPT_DPT_CDE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鎺ユ姤妗堟満鏋勪唬鐮',
  `T_PRT_IN_TM` datetime DEFAULT NULL COMMENT '  鎶ユ?褰曞叆鏃堕棿',
  `T_RPT_TM` datetime DEFAULT NULL COMMENT '  鎶ユ?鏃堕棿',
  `T_RGST_TM` datetime DEFAULT NULL COMMENT '  绔嬫?鏃堕棿',
  `T_END_CLM_TM` datetime DEFAULT NULL COMMENT '  缁撴?鏃堕棿',
  `T_SRVY_TM` datetime DEFAULT NULL COMMENT '  鏈?繎鏌ュ嫎鏃堕棿',
  `T_PRELOS_TM` datetime DEFAULT NULL COMMENT '  鏈?繎浼版崯鏃堕棿',
  `T_CHKLOS_TM` datetime DEFAULT NULL COMMENT '  鏈?繎鏍告崯鏃堕棿',
  `T_CHKPRI_TM` datetime DEFAULT NULL COMMENT '  鏈?繎鏍镐环鏃堕棿',
  `T_CHKCLM_TM` datetime DEFAULT NULL COMMENT '  鏈?繎鏍歌禂鏃堕棿',
  `T_IJR_CHKLOS_TM` datetime DEFAULT NULL COMMENT '  鏈?繎浜轰激鏍告崯鏃堕棿',
  `T_PRE_TM` datetime DEFAULT NULL COMMENT '  鏈?繎棰勪粯鏃堕棿',
  `T_ADV_TM` datetime DEFAULT NULL COMMENT '  鏈?繎鍨?粯鏃堕棿',
  `T_PAS_TM` datetime DEFAULT NULL COMMENT '  鏈?繎杩藉伩鏃堕棿',
  `T_ACDNT_TM` datetime DEFAULT NULL COMMENT '  鍑洪櫓鏃堕棿',
  `C_ACDNT_RSN_CDE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鍑洪櫓鍘熷洜浠ｇ爜',
  `C_INS_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  琚?繚闄╀汉浠ｇ爜',
  `C_INS_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  琚?繚闄╀汉濮撳悕',
  `C_CASE_TYP` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  妗堜欢绫诲瀷',
  `C_VIP_SIGN` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鏄?惁VIP瀹㈡埛锛?鍚︺?1鏄',
  `C_FAST_SIGN` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鏄?惁蹇??澶勭悊锛?鍚︺?1鏄',
  `C_STTL_WAY_CDE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  浜夎?瑙ｅ喅鏂瑰紡',
  `C_DUTY_TYP` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  浜嬫晠璐ｄ换锛?鍏ㄨ矗銆?涓昏矗銆?鍚岃矗銆?娆¤矗銆?鏃犺矗銆?鏃犳硶鍒ゅ畾',
  `N_DUTY_RAT` decimal(8,2) DEFAULT NULL COMMENT '  浜嬫晠璐ｄ换姣斾緥',
  `C_INJURY_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  鏄?惁鏈変汉浼わ細0鍚︺?1鏄',
  `C_ROBBER_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  鏄?惁鍏ㄨ溅鐩楁姠锛?鍚︺?1鏄',
  `C_EASY_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  绠?槗璧旀?鏍囧織锛?鍚︺?1鏄',
  `C_FRT_CHKLOS_DPT_CDE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鍒濆?鏍告崯鏈烘瀯浠ｇ爜',
  `C_LST_CHKLOS_DPT_CDE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  缁堝?鏍告崯鏈烘瀯浠ｇ爜',
  `C_FRT_CHKPRI_DPT_CDE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鍒濆?鏍镐环鏈烘瀯浠ｇ爜',
  `C_LST_CHKPRI_DPT_CDE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  缁堝?鏍镐环鏈烘瀯浠ｇ爜',
  `C_FRT_CHKCLM_DPT_CDE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鍒濆?鏍歌禂鏈烘瀯浠ｇ爜',
  `C_LST_CHKCLM_DPT_CDE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  缁堝?鏍歌禂鏈烘瀯浠ｇ爜',
  `C_CHKLOS_CDE` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鏈?繎鏍告崯浜轰唬鐮',
  `C_CHKPRI_CDE` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鏈?繎鏍镐环浜轰唬鐮',
  `C_CHKCLM_CDE` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鏈?繎鏍歌禂浜轰唬鐮',
  `C_IS_PROXY_SRV` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  鏄?惁浠ｆ煡鍕橈細0鍚︺?1鏄',
  `N_PROXY_SRV_FEE` decimal(14,2) DEFAULT NULL COMMENT '  浠ｆ煡鍕樿垂鐢',
  `N_SRV_FEE` decimal(14,2) DEFAULT NULL COMMENT '  鏌ュ嫎鎬昏垂鐢',
  `C_LARGE_BUSINESS` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  澶ч?浜ゆ槗鏍囪? 0闈炲ぇ棰?1 鏄?ぇ棰濅氦鏄',
  `C_SUS_BUSINESS` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  鍙?枒浜ゆ槗鏍囪? 0闈炲彲鐤戜氦鏄?1鏄?彲鐤戜氦鏄',
  `C_CRT_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  杩佺Щ鏍囧織',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  杩佺Щ鏃堕棿',
  `C_ADT_HND_CDE` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  浜嬫晠澶勭悊鏂瑰紡',
  `C_ADT_HDN_DPT_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '浜嬫晠澶勭悊閮ㄩ棬',
  `C_ACDNT_TYP_CDE` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '浜嬫晠绫诲瀷',
  `N_EDR_PRJ_NO` decimal(8,0) DEFAULT NULL COMMENT '鎵规敼娆℃暟',
  `C_RPT_PRN_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '鎶ユ?浜哄?鍚',
  `C_CTT_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '鑱旂郴浜哄?鍚',
  `C_CTT_TEL` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '鑱旂郴浜虹數璇',
  `C_ADT_DTL_ADR` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '鍑洪櫓璇︾粏鍦扮偣',
  `C_ADT_RMK` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '鍑洪櫓缁忚繃',
  `C_OP_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '鎿嶄綔鏈烘瀯浠ｇ爜',
  `T_GUP_TM` datetime DEFAULT NULL COMMENT '娉ㄩ攢鏃堕棿',
  `T_CNL_TM` datetime DEFAULT NULL COMMENT '閿??/鎷掕禂鏃堕棿',
  `T_PAY_TM` datetime DEFAULT NULL COMMENT '鏈?繎鏀?粯鏃堕棿',
  `T_IC_TM` datetime DEFAULT NULL COMMENT '鐞嗙畻鏃堕棿',
  `T_TERMN_TM` datetime DEFAULT NULL COMMENT '淇濆崟缁堟?鏃堕棿',
  `C_ZEROPRM_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '闆朵繚璐规爣蹇',
  `C_ESTMT_CPLT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `C_HUGE_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '宸ㄧ伨缂栫爜',
  `N_DSPT_TMS` decimal(4,0) DEFAULT '0' COMMENT '璋冨害娆℃暟',
  `N_SRVY_TMS` decimal(4,0) DEFAULT '0' COMMENT '鏌ュ嫎娆℃暟',
  `N_ESTMT` decimal(20,2) DEFAULT '0.00' COMMENT '瀹氭崯鎬婚噾棰',
  `C_ESTMT_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '瀹氭崯鎬婚噾棰濆竵绉',
  `N_ESTMT_RMB_EXCH` decimal(10,6) DEFAULT NULL COMMENT '瀹氭崯鎬婚噾棰濇姌RMB姹囩巼',
  `N_ESTMT_RMB` decimal(20,2) DEFAULT '0.00' COMMENT '瀹氭崯鎬婚噾棰濇姌RMB閲戦?',
  `N_PREPAY_RMB_EXCH` decimal(10,6) DEFAULT NULL COMMENT '棰勪粯鎬婚噾棰濇姌RMB姹囩巼',
  `N_PREPAY_RMB` decimal(20,2) DEFAULT '0.00' COMMENT '棰勪粯鎬婚噾棰濇姌RMB閲戦?',
  `C_PAY_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '璧旀?鎬婚噾棰濆竵绉',
  `N_PAY_RMB_EXCH` decimal(10,6) DEFAULT NULL COMMENT '璧旀?鎬婚噾棰濇姌RMB姹囩巼',
  `N_PAY_RMB` decimal(20,2) DEFAULT '0.00' COMMENT '璧旀?鎬婚噾棰濇姌RMB閲戦?',
  `C_CLMFEE_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '鐞嗚禂璐圭敤甯佺?',
  `N_CLMFEE_RMB_EXCH` decimal(10,6) DEFAULT NULL COMMENT '鐞嗚禂璐圭敤鎶楻MB姹囩巼',
  `N_CLMFEE_RMB` decimal(20,2) DEFAULT '0.00' COMMENT '鐞嗚禂璐圭敤鎶楻MB閲戦?',
  `C_IS_BIG_CLAIM` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '閲嶅ぇ璧旀?',
  `C_IS_HIGHT` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '宸ㄧ伨鏍囧織',
  `C_HIGHT_TYPE` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '宸ㄧ伨浠ｇ爜',
  `C_ACCIDENT_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '浜嬫晠缂栧彿',
  `C_COINSURE_REOPEN_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '鍏变繚閲嶅紑妗堟爣蹇',
  `N_COINSURE_REOPEN_TMS` decimal(4,0) DEFAULT NULL COMMENT '鍏变繚閲嶅紑妗堟?鏁',
  `C_LIAB_CONFIRM` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '璐ｄ换璁ゅ畾',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '璧旀?鍙',
  `N_COIN_APPO_RMB` decimal(20,2) DEFAULT NULL COMMENT '鍏变繚鍒嗘憡鎬婚?鍒欏悎RMB',
  `C_PREPAY_CUR` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '棰勪粯甯佺?',
  `N_CNL_TMS` decimal(4,0) DEFAULT NULL COMMENT '閿??娆℃暟',
  `C_IS_AUTO_ENDORSE` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '鏄?惁鑷?姩鍐插噺淇濋?鏍囧織_闈炶溅闄╀娇鐢',
  `C_AUTO_ENDORSE_RESULT` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '鑷?姩鍐插噺淇濋?缁撴灉_闈炶溅闄╀娇鐢',
  `SUBROGATION_FLAG` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '浠ｄ綅姹傚伩鏍囧織 0 鍚?1 鏄',
  `N_B_AMT` decimal(20,2) DEFAULT NULL COMMENT '鍥炴?閲戦?锛屼竴鑸?负璐熸暟',
  `SUBROGATION_B_FLAG` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '琚?唬浣嶆眰鍋挎爣蹇?null涓?0 鍚?1 鏄',
  `C_IMPORT_STS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '0:姝ｅ父妗堜欢锛?:瀵煎叆妗堜欢锛?:鍘嗗彶璧旀?琛ュ綍',
  `C_TRAN_EASY_MRK` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '杞?叆灏忛?妗堜欢鏍囧織锛?1杞?叆灏忛?妗堜欢',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`C_CLM_NO`),
  KEY `index_c_case_no` (`C_CASE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_inter_clm_pend`
--

DROP TABLE IF EXISTS `web_ri_inter_clm_pend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_inter_clm_pend` (
  `C_PEND_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_RPT_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CASE_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_PEND_TMS` decimal(8,0) NOT NULL,
  `T_PEND_TM` datetime NOT NULL,
  `C_YEAR` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_MONTH` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_LATEST_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PEND_SOURCE` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_AMT_CUR` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  币种',
  `N_THIS_PEND_AMT` decimal(14,2) DEFAULT NULL COMMENT '  本次未决：本次任务涉及的所有项目（险别）产生的未决之和',
  `N_THIS_DTMD_AMT` decimal(14,2) DEFAULT NULL COMMENT '  本次已决：本次任务涉及的所有项目（险别）产生的己决之和',
  `N_PEND_AMT` decimal(14,2) DEFAULT NULL COMMENT '  当前最新总未决：所有任务在各自最新状态下的未决之和',
  `N_DTMD_AMT` decimal(14,2) DEFAULT NULL COMMENT '  当前最新总己决：所有任务在各自最新状态下的己决之和',
  `N_THIS_FEE_PEND_AMT` decimal(14,2) DEFAULT NULL COMMENT '  本次费用未决：本次任务产生的未决费用',
  `N_THIS_FEE_DTMD_AMT` decimal(14,2) DEFAULT NULL COMMENT '  本次费用己决：本次任务产生的己决费用',
  `N_FEE_PEND_AMT` decimal(14,2) DEFAULT NULL COMMENT '  当前最新费用总未决：所有任务在各自最新状态下的费用未决之和',
  `N_FEE_DTMD_AMT` decimal(14,2) DEFAULT NULL COMMENT '  当前最新费用总己决：所有任务在各自最新状态下的费用己决之和',
  `C_CRT_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `N_CLMFEE` decimal(14,2) DEFAULT NULL COMMENT '理算费用金额',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '赔案号',
  `N_PEND_A_AMT` decimal(14,2) DEFAULT NULL COMMENT '代位未决金额',
  `N_DTMD_S_AMT` decimal(14,2) DEFAULT NULL COMMENT '代位已决金额',
  `N_B_AMT` decimal(14,2) DEFAULT NULL COMMENT '回款金额',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`C_PEND_ID`),
  UNIQUE KEY `PK_WEB_CLM_PEND` (`C_PEND_ID`),
  UNIQUE KEY `UIYA_PEND_CASE_NO_PEND_TMS` (`N_PEND_TMS`,`C_CASE_NO`),
  KEY `IYA_PEND_CASE_NO` (`C_CASE_NO`),
  KEY `IYA_PEND_PEND_SOURCE` (`C_PEND_SOURCE`),
  KEY `IYA_PEND_RPT_NO` (`C_RPT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_inter_cont_bill`
--

DROP TABLE IF EXISTS `web_ri_inter_cont_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_inter_cont_bill` (
  `INTER_CONT_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分入合约PKID',
  `C_BILL_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约分入账单号',
  `C_YOUR_DOC_NO` varchar(50) DEFAULT NULL COMMENT '单证号,保单号，批单号，赔案号',
  `C_RP_CDE` varchar(30) DEFAULT NULL COMMENT '结付人',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分出公司',
  `C_BRKR_MRK` varchar(1) DEFAULT '0' COMMENT '是否经纪公司,''0''否,''1''是',
  `C_RI_BRKR` varchar(30) DEFAULT NULL COMMENT '经纪公司/再保公司',
  `C_COM_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '承保公司,默认本公司',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_DESC` text COMMENT '合约描述',
  `C_UW_YEAR` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务年度',
  `C_BILLTM_TYPE` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账单期类型M-月S-季H-半年Y-年',
  `C_BILLTM` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账单期M-月:1-12S-季:1-4H-半年:1-2Y-年:1',
  `C_KIND_NO` varchar(2) DEFAULT NULL COMMENT '险类代码',
  `C_PROD_NO` varchar(30) DEFAULT NULL COMMENT '险种',
  `C_RI_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保币种',
  `N_BALANCE` decimal(20,2) NOT NULL COMMENT '余额',
  `N_PEND` decimal(20,2) NOT NULL COMMENT '未决赔款',
  `N_SHARE_PRPT` decimal(10,6) DEFAULT NULL COMMENT '分入比例',
  `N_PRM` decimal(20,2) NOT NULL COMMENT '保费',
  `N_COMM` decimal(20,2) NOT NULL COMMENT '手续费',
  `N_CLM_PRM` decimal(20,2) DEFAULT NULL COMMENT '已决赔款',
  `N_PRE_RES` decimal(20,2) DEFAULT NULL COMMENT '准备金',
  `N_TAX` decimal(20,2) DEFAULT NULL COMMENT '税费',
  `N_PRE_RET` decimal(20,2) DEFAULT NULL COMMENT '返回准备金',
  `N_INTEREST` decimal(20,2) DEFAULT NULL COMMENT '利息',
  `N_CASH_AMT` decimal(20,2) DEFAULT NULL COMMENT '现金赔款',
  `N_PROFIT_COMM` decimal(20,2) DEFAULT NULL COMMENT '纯益手续费',
  `C_STATUS` varchar(1) DEFAULT NULL COMMENT '状态,0-暂存,1-已确认,2-已传财务',
  `C_DEMO` text COMMENT '备注(对内)',
  `C_REMARKS` text COMMENT '备注(对外)',
  `T_YOUR_TM` datetime DEFAULT NULL COMMENT '对方制单日期',
  `T_DUE_TM` datetime NOT NULL COMMENT '应结付日期',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_INTER_CONT_BILL` (`INTER_CONT_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同分入账单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_interface_err_log`
--

DROP TABLE IF EXISTS `web_ri_interface_err_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_interface_err_log` (
  `C_APP_NO` varchar(50) DEFAULT NULL COMMENT '投保单号',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `C_CLM_NO` varchar(50) DEFAULT NULL COMMENT '赔案号',
  `C_CLASS_NAME` text COMMENT '类名',
  `C_METHOD_NAME` text COMMENT '方法名',
  `C_ERR_LOG` mediumtext COMMENT '错误日志',
  `T_CRT_TM` datetime DEFAULT NULL COMMENT '创建时间',
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PK_ID',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT NULL COMMENT '批改序号,批改次数 Times of Endorsement',
  `C_ERR_RSN_TYP` varchar(50) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='再保接口错误日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_market`
--

DROP TABLE IF EXISTS `web_ri_market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_market` (
  `c_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `c_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '再保市场名字',
  `c_crt_cde` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `t_crt_tm` datetime NOT NULL,
  `c_upd_cde` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `t_upd_tm` datetime NOT NULL,
  `c_trans_mrk` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `t_trans_tm` datetime DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='最终风险承担者所属再保市场';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_oc_prd_cvrg`
--

DROP TABLE IF EXISTS `web_ri_oc_prd_cvrg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_oc_prd_cvrg` (
  `C_PK_ID` varchar(50) NOT NULL,
  `C_PROD_NO` varchar(6) NOT NULL COMMENT '险种',
  `C_CVRG_NO` varchar(6) NOT NULL COMMENT '险别',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_oc_prd_cvrg_amt`
--

DROP TABLE IF EXISTS `web_ri_oc_prd_cvrg_amt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_oc_prd_cvrg_amt` (
  `C_PK_ID` varchar(50) NOT NULL,
  `C_PROD_NO` varchar(6) NOT NULL COMMENT '险种',
  `N_AMT` decimal(20,2) NOT NULL COMMENT '保额',
  `N_MIN_EFFECTIVE_DAYS` decimal(7,0) NOT NULL COMMENT '保险期间最小天数',
  `N_MAX_EFFECTIVE_DAYS` decimal(7,0) NOT NULL COMMENT '保险期间最大天数',
  `C_RISK_LVL_CDE` varchar(30) NOT NULL COMMENT '风险等级代码',
  `N_RET_LMT` decimal(20,2) NOT NULL COMMENT '风险等级自留额',
  `N_RI_PRM` decimal(20,2) NOT NULL COMMENT '分出保费 ',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`C_PK_ID`),
  KEY `PROD_CVRG_AMT_DAYS` (`C_PROD_NO`,`N_AMT`,`N_MIN_EFFECTIVE_DAYS`,`N_MAX_EFFECTIVE_DAYS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_outer_bill_dtl`
--

DROP TABLE IF EXISTS `web_ri_outer_bill_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_outer_bill_dtl` (
  `C_OUTER_DTL_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '对外账单明细PKID',
  `C_BILL_NO` varchar(200) NOT NULL COMMENT '季对外账单编号',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '期次',
  `C_PROD_NO` varchar(6) DEFAULT NULL COMMENT '产品代码',
  `C_FEETYP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '费用类型',
  `C_DOC_FLAG` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '单据标识：1 分出保费2 分出摊回分保费用3 分出摊回分保赔款4 分出现金赔款5 分出存入分保准备金6 分出分保准备金利息',
  `N_FEE_AMT` decimal(20,2) NOT NULL COMMENT '费用金额',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `C_CED_TYP` varchar(1) DEFAULT NULL COMMENT '分出类型,A 正常或者成数部分分出，B 溢额合约或者混合合约的溢额部分分出,C 临分超赔,D 类地震溢额分出,Z 其他，目前只用到合约账单区分成数和溢额，',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号(合同帐单)',
  `C_CONT_CDE` varchar(30) DEFAULT NULL COMMENT '合约代码(合同帐单)',
  `C_PROVINCE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '省',
  `C_CITY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '市',
  `C_USAGE_CDE` varchar(30) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_OUTER_BILL_DTL` (`C_OUTER_DTL_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='对外账单明细表,生成对外账单时写入，比对外账单主表按产品和费用类型细分，账单编号、期次、费用类型、产品为业务联合主键';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_outer_bill_main`
--

DROP TABLE IF EXISTS `web_ri_outer_bill_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_outer_bill_main` (
  `C_OUTER_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '对外账单PKID',
  `C_BILL_NO` varchar(200) NOT NULL COMMENT '季对外账单编号',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '付款期次,超赔预付分保费账单分期、临分超赔分保费账单分期、临分分保费账单分期用',
  `C_BILLPRD_TYPE` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账单期类型M-月S-季H-半年Y-年',
  `C_BILL_PRD` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账单期M-月:1-12S-季:1-4H-半年:1-2Y-年:1',
  `C_BILL_TYP` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账单类型,分出合同帐单                          AO：正常帐单                          BO：现金赔款帐单分出临分帐单                          FPO：临分保单帐单                          FEO：临分批单帐单                          FCO：临分赔款帐单临分超赔帐单                          FXPO：临分保单分保费帐单                          FXEO：临分批单保费调整账单                          FXCO：临分摊回赔款帐单                          FXRO：临分保费恢复账单分入合同账单                          IAO：正常分入账单                          IBO：现金赔款分入帐单分入临分账单                          IPO：分入保单账单                          IEO：分入批单账单                          ICO：分入赔案账单合约超赔帐单                          XPO：预付分保费账单                          XCO：超赔摊回帐单                          XRO：保费恢复账单                          XAO：保费调整账单合同核算账单                          S：合同核算账单',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '账单状态,''1''预估账单(未确认),''2''已确认(正式账单),''3''已结算(已结算账单)',
  `T_BILL_TM` datetime NOT NULL COMMENT '帐单日期,账单确认日期',
  `C_CONFIRM_CDE` varchar(30) DEFAULT NULL COMMENT '账单确认人',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '机构代码 Department No,默认保险总公司',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号(合同帐单)',
  `C_CONT_CDE` varchar(30) DEFAULT NULL COMMENT '合约代码(合同帐单)',
  `N_LAYER` decimal(4,0) DEFAULT NULL COMMENT '层数,超赔合约才有',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保公司',
  `C_BRKR_MRK` varchar(1) DEFAULT '0' COMMENT '是否经纪公司,''0''否,''1''是',
  `C_RI_BRKR` varchar(30) DEFAULT NULL COMMENT '合约中的经纪公司或再保公司',
  `C_UW_YEAR` varchar(4) DEFAULT NULL COMMENT '业务年度',
  `C_OPT_TYP` varchar(1) DEFAULT '0' COMMENT '业务类型,0-分出业务(默认)；1-分入业务',
  `C_INSRNT_NME` varchar(100) DEFAULT NULL COMMENT '被保人名称',
  `T_ACCDNT_TM` datetime DEFAULT NULL COMMENT '出险日期',
  `C_ACCDNT_CAUS_CDE` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '出险原因代码，现金赔款账单用',
  `C_PLACE_LOSS` varchar(100) DEFAULT NULL COMMENT '出险地点，现金赔款账单用',
  `C_DOC_NO` varchar(50) DEFAULT NULL COMMENT '单证号,保单号，批单号，赔案号跟单账单才有',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号 Policy No',
  `N_SPLIT_SEQ` decimal(4,0) DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号跟单账才有',
  `N_EDR_CLM_TMS` decimal(4,0) DEFAULT '0' COMMENT '批改序号赔付次数',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '保险起期 Policy Effective Date',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '保险止期 Policy Expire Date',
  `C_YOUR_DOC_NO` varchar(50) DEFAULT NULL COMMENT '单证号,保单号，批单号，赔案号跟单账单才有',
  `T_YOUR_TM` datetime DEFAULT NULL COMMENT '对方制单日期，分入账单用',
  `C_RIKIND_NO` varchar(2) DEFAULT NULL COMMENT '险类代码',
  `C_PROD_NO` varchar(6) DEFAULT NULL COMMENT '险种代码',
  `N_SHARE_PRPT` decimal(10,6) DEFAULT NULL COMMENT '参与比例',
  `C_ORI_CUR` varchar(30) DEFAULT NULL COMMENT '保费币种 Currency of Premium',
  `C_BILL_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '费用币种',
  `N_BILL_CHG_RATE` decimal(10,6) DEFAULT NULL COMMENT '再保保费兑换汇率',
  `N_BILL_BALANCE` decimal(20,2) NOT NULL COMMENT '费用金额对外帐单：=贷-借',
  `N_PEND` decimal(20,2) DEFAULT NULL COMMENT '未决赔款金额',
  `C_DEMO` text COMMENT '备注(对内)',
  `C_REMARKS` text COMMENT '备注(对外)',
  `C_SEPE_MRK` varchar(1) DEFAULT '0' COMMENT '分期账单标志,''0''否，''1''是',
  `T_PAY_BGN_TM` datetime DEFAULT NULL COMMENT '付款起期',
  `T_PAY_END_TM` datetime DEFAULT NULL COMMENT '付款止期',
  `N_PAY_AMT` decimal(20,2) DEFAULT NULL COMMENT '付款金额',
  `N_PAY_RATE` decimal(10,6) DEFAULT NULL COMMENT '付款比例',
  `C_SETT_NO` varchar(50) DEFAULT NULL COMMENT '结算单号',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `C_TO_FIN_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '传财务标识,0-未传财务（默认）,1-已传财务',
  `T_TO_FIN_TM` datetime DEFAULT NULL COMMENT '传财务对内帐日期',
  `C_TO_FIN_CDE` varchar(30) DEFAULT NULL COMMENT '传财务人',
  `C_EVENT_ID` varchar(30) DEFAULT NULL COMMENT '事故超赔标识号，用来区分不同事故超赔，存的是第三级巨灾代码，唯一标识一个事故，事故超赔账单用',
  `N_BILL_ELSE_AMT` decimal(20,2) DEFAULT NULL COMMENT '账单其它金额,现金赔款账单存总赔款，各类分期账单存合并分期后的总账单余额',
  `N_BILL_DUNNING_DAYS` decimal(6,0) DEFAULT NULL COMMENT '账单缴费期限',
  `N_RBK_SEQ` decimal(4,0) DEFAULT '0' COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT '0' COMMENT '批改次数',
  `C_AC_YEAR` varchar(4) DEFAULT NULL COMMENT '财务年度，内帐传财务的年份',
  `T_MODIFY_TM` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `N_DUTY_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '增值税发票号',
  UNIQUE KEY `PK_WEB_RI_OUTER_BILL_MAIN` (`C_OUTER_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成对外账单时写入，对于存在付款分期账单，按照付款分期写入多条，账单编号和付款期次为业务联合主键';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_pend_cal_err`
--

DROP TABLE IF EXISTS `web_ri_pend_cal_err`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_pend_cal_err` (
  `C_PEND_CALERR_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '未决出错PKID',
  `C_PEND_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '未决PKID',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_PEND_TMS` decimal(4,0) NOT NULL COMMENT '未决调整次数',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_RBK_SEQ` decimal(4,0) NOT NULL COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单',
  `C_PEND_YM` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '未决年月,yyyy-mm',
  `C_CAL_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '计算方式,A-自动 B-手工',
  `T_CAL_TM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '计算时间',
  `C_ERR_RSN` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '错误原因',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_pend_ced`
--

DROP TABLE IF EXISTS `web_ri_pend_ced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_pend_ced` (
  `C_PENDCED_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '未决分出PKID',
  `C_PEND_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '未决PKID',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_RBK_SEQ` decimal(4,0) NOT NULL COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单',
  `C_PEND_YM` varchar(7) DEFAULT NULL COMMENT '未决年月',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司,''0''否,''1''是',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪公司下的再保公司',
  `C_RI_BRKR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪公司/再保公司',
  `N_CLM_AMT` decimal(20,6) NOT NULL COMMENT '摊回赔款',
  `N_CLM_PRPT` decimal(15,10) NOT NULL COMMENT '摊回比例',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `C_BILL_YM` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '帐单年月',
  `C_UW_YM` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务年月',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码 Product Code',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构代码 Department No,默认保险总公司',
  `C_RICLM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保赔款币种',
  `C_CED_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分出类型,A 正常，B 混合溢额成数分出,C 临分超赔,D 类地震溢额分出,Z 其他',
  `C_INNER_BILL_NO` varchar(50) DEFAULT NULL COMMENT '月度流水号，月汇总时回写',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源,01=直销业务,02=代理业务,03=邮寄销售业务,04=网络销售业务,05=经纪业务,06=专业代理业务,07=个人代理,08=电话销售业务',
  `T_TORI_TM` datetime DEFAULT NULL COMMENT '转入再保时间',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`C_PENDCED_PK_ID`),
  KEY `IDX_CED_CLMNO` (`C_CLM_NO`),
  KEY `IDX_CED_NSPLITSEQ` (`N_SPLIT_SEQ`),
  KEY `IDX_CED_NRBKSEQ` (`N_RBK_SEQ`),
  KEY `IDX_PEND_CED_CPRODNO` (`C_PROD_NO`),
  KEY `IDX_PEND_CED_CPENDPKID` (`C_PEND_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_pend_due`
--

DROP TABLE IF EXISTS `web_ri_pend_due`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_pend_due` (
  `C_PEND_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '未决PKID',
  `C_CLM_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '赔案号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_RBK_SEQ` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单',
  `C_PEND_YM` varchar(7) DEFAULT NULL COMMENT '未决年月',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号',
  `N_PLY_TMS` decimal(4,0) DEFAULT '1' COMMENT '保单分期序号,分期缴费的序号',
  `N_PLY_SPLIT_SEQ` decimal(4,0) DEFAULT NULL COMMENT '保单拆分序号',
  `N_PLY_RBK_SEQ` decimal(4,0) DEFAULT NULL COMMENT '保单冲正序号',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构代码',
  `T_ACCDNT_TM` datetime NOT NULL COMMENT '出险日期',
  `T_RGST_TM` datetime DEFAULT NULL COMMENT '立案日期',
  `C_ACCDNT_CAUS_CDE` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '出险原因代码',
  `C_HUGE_LOS_CDE` varchar(30) DEFAULT NULL COMMENT '巨灾代码',
  `C_ORG_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '原币种',
  `N_ORG_CLM_AMT` decimal(20,2) NOT NULL COMMENT '原预估金额',
  `C_RI_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保币种',
  `N_RI_CLM_AMT` decimal(20,2) NOT NULL COMMENT '再保预估金额',
  `N_CHG_RATE` decimal(10,6) NOT NULL COMMENT '再保币种兑换率',
  `C_CAL_YM` varchar(7) DEFAULT NULL COMMENT '分出年月',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '状态,A可分,B已分,C确认,D不计算,E错误,F 已更正',
  `C_CI_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '共保方式,"0"=非共保业务,"1"=内部共保（我方主共）,"2"=内部共保（我方从共）,"3"=外部共保（我方主共）,"4"=外部共保（我方从共）',
  `C_INW_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '分入业务标志',
  `C_STOCK_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '股东业务标志',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_DUE_TM` datetime NOT NULL COMMENT '业务单挂账时间，业务写入，与财务接口表的挂账时间相同',
  `T_RIDUE_TM` datetime NOT NULL COMMENT '再保挂账时间，分出计算时间依据，缺省与业务单挂账时间相同，冲正单则不同',
  `C_RETRO_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '不转分保标识,0=转分(默认),1=不转分保，标记临分分入业务是否转分保',
  `C_SPLIT_MRK` varchar(1) DEFAULT '0' COMMENT '合并/拆散标志,0 = 正常保单(默认)  1 = 被合并 2= 合并后 -1= 被拆分 -2= 拆分后',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT NULL COMMENT '批改序号',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源',
  `N_CI_PAY_AMT` decimal(20,2) DEFAULT NULL COMMENT '共保总赔款',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '历史迁移标识：1 = 历史',
  `T_TORI_TM` datetime DEFAULT NULL COMMENT '转入未决时间:与赔案号构成业务主键',
  `N_SOURCE_FLAG` decimal(1,0) DEFAULT NULL COMMENT '数据来源。0非车；1车险；2其它',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `C_PROCESS` text COMMENT '出险经过--华海需求',
  `C_HUGE_LOSS_MRK` varchar(1) DEFAULT NULL COMMENT '巨灾标识',
  `N_PEND_TMS` decimal(4,0) DEFAULT NULL COMMENT '未决调整次数',
  `C_CITY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '市',
  `C_PROVINCE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '省',
  `C_READ_FLAG` varchar(1) DEFAULT NULL,
  `C_CLM_STS` varchar(100) DEFAULT NULL COMMENT '理赔环节',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_PEND_DUE` (`C_PEND_PK_ID`),
  KEY `PEND_DUE_CLMNO` (`C_CLM_NO`),
  KEY `IDX_DUE_NSPLITSEQ` (`N_SPLIT_SEQ`),
  KEY `IDX_DUE_NRBKSEQ` (`N_RBK_SEQ`),
  KEY `IDX_DUE_DUETM` (`T_DUE_TM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_acctinfo`
--

DROP TABLE IF EXISTS `web_ri_ply_acctinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_acctinfo` (
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  保单号',
  `N_EDR_PRJ_NO` decimal(6,0) DEFAULT '0' COMMENT '  批改序号',
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  批单号',
  `C_ACCT_NME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  账户名,特别约定代码',
  `C_ACCT_NO` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  账号,中文名',
  `C_BANK_REL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  收款行联行号',
  `C_BANK_PRO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  银行省',
  `C_BANK_AREA` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  银行市',
  `C_BANK_CDE` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  开户行',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_LATEST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  最新保单标志,0否,1是',
  `C_BANK_COUNTY` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  银行县',
  `C_BANK_REL_TYP` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '收款银行大类',
  `C_BANK_CNAPS` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'CNAPS号',
  `C_BANK_ADDR` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '开户行地址',
  `C_PUB_PRI` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '对公对私',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_PLY_ACCTINFO` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_agro`
--

DROP TABLE IF EXISTS `web_ri_ply_agro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_agro` (
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  保单号',
  `N_EDR_PRJ_NO` decimal(6,0) DEFAULT '0' COMMENT '  批改序号',
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  批单号',
  `N_SEQ_NO` decimal(22,0) NOT NULL,
  `C_ARG_REL` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  C_ARG_REL',
  `C_NAT_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  涉农性质,特别约定代码',
  `C_FIN_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  财政来源类型,英文名',
  `C_PRM_SOU` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  C_PRM_SOU',
  `C_PRM_SUSD_SOU` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_INSRNT_GATG` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  C_INSRNT_GATG',
  `C_INSRNT_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_INSRNT_CNM` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  C_INSRNT_CNM',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PLY_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  政策类型,中文名',
  `N_RESV_NUM_1` decimal(22,0) DEFAULT NULL COMMENT '  预留数值字段1,附加保费',
  `C_RESV_TXT_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段1',
  `C_RESV_TXT_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段2',
  `C_RESV_TXT_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段3',
  `C_RESV_TXT_4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段4',
  `C_RESV_TXT_5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段5',
  `C_RESV_TXT_6` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段6',
  `C_RESV_TXT_7` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段7',
  `C_RESV_TXT_8` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段8',
  `C_RESV_TXT_9` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段9',
  `C_RESV_TXT_10` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  预留文本字段10',
  `C_RESV_TXT_11` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  预留文本字段11',
  `C_RESV_TXT_12` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  预留文本字段12',
  `C_RESV_TXT_13` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  预留文本字段13',
  `C_RESV_TXT_14` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  预留文本字段14',
  `C_RESV_TXT_15` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  预留文本字段15',
  `C_RESV_TXT_16` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  预留文本字段16',
  `N_RESV_NUM_2` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段2,附加保费',
  `N_RESV_NUM_3` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段3,附加保费',
  `N_RESV_NUM_4` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段4,附加保费',
  `N_RESV_NUM_5` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段5,附加保费',
  `N_RESV_NUM_6` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段6,附加保费',
  `N_RESV_NUM_7` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段7,附加保费',
  `N_RESV_NUM_8` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段8,附加保费',
  `N_RESV_NUM_9` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段9,附加保费',
  `N_RESV_NUM_10` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段10,附加保费',
  `N_RESV_NUM_11` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段11,附加保费',
  `T_RESV_TM_1` datetime DEFAULT NULL COMMENT '  预留日期字段1',
  `T_RESV_TM_2` datetime DEFAULT NULL COMMENT '  预留日期字段2',
  `T_RESV_TM_3` datetime DEFAULT NULL COMMENT '  预留日期字段3',
  `T_RESV_TM_4` datetime DEFAULT NULL COMMENT '  预留日期字段4',
  `T_RESV_TM_5` datetime DEFAULT NULL COMMENT '  预留日期字段5',
  `T_RESV_TM_6` datetime DEFAULT NULL COMMENT '  预留日期字段6',
  `T_RESV_TM_7` datetime DEFAULT NULL COMMENT '  预留日期字段7',
  `T_RESV_TM_8` datetime DEFAULT NULL COMMENT '  预留日期字段8',
  `T_RESV_TM_9` datetime DEFAULT NULL COMMENT '  预留日期字段9',
  `T_RESV_TM_10` datetime DEFAULT NULL COMMENT '  预留日期字段10',
  `C_LATEST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  最新保单标志,0否,1是',
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  记录唯一标识号,投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID，如为新增记录则为批改申请单的PKID',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `SYS_C00613792` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_applicant`
--

DROP TABLE IF EXISTS `web_ri_ply_applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_applicant` (
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_EDR_PRJ_NO` decimal(6,0) NOT NULL,
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批单号',
  `C_APP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保人代码,投保人唯一客户代码',
  `C_APP_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_MRG_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '婚姻状况代码,婚姻状况',
  `C_WORK_DPT` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '工作单位',
  `C_EMAIL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'EMAIL',
  `C_COUNTRY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '国家',
  `C_PROVINCE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '省份',
  `C_CITY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '地市',
  `C_COUNTY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '县',
  `C_SUFFIX_ADDR` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '街',
  `C_CLNT_ADDR` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `C_ZIP_CDE` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `C_MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '移动电话',
  `C_TEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '固定电话,电话',
  `C_CNTR_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系人,投保人联系人',
  `C_SUB_TRD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '行业细分代码',
  `C_TRD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '行业代码',
  `C_STK_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '股东客户标志',
  `C_CUS_LVL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户等级',
  `C_CLNT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户分类,客户分类,0 法人，1 个人',
  `C_CERTF_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `C_CERTF_CLS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '证件类型',
  `C_LATEST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_FAX` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系传真',
  `N_APP_SUM` decimal(8,0) DEFAULT NULL COMMENT '投保人数',
  `C_APP_WAY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保方式',
  `N_JOB_SUM` decimal(8,0) DEFAULT NULL COMMENT '在职员工数',
  `N_RET_SUM` decimal(8,0) DEFAULT NULL COMMENT '退休员工数',
  `C_WORK_CTT` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '经营内容',
  `C_APP_DPT_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保部门',
  `C_WORK_AREA` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域',
  `C_WEB_ADDR` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '单位网址',
  `C_RESV_TXT_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '字符预留1',
  `C_RESV_TXT_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '字符预留2',
  `N_RESV_NUM_1` decimal(8,0) DEFAULT NULL COMMENT '数字预留1',
  `N_RESV_NUM_2` decimal(8,0) DEFAULT NULL COMMENT '数字预留2',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `C_REL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '与被保人关系',
  `C_CUS_RISK_LVL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户风险等级,新客户、普通客户等',
  `C_SEX` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `C_OCCUP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '职业代码',
  `T_BIRTHDAY` datetime DEFAULT NULL COMMENT '出生日期',
  `T_CERTF_END_DATE` datetime DEFAULT NULL COMMENT '证件有效期止',
  `C_LEGAL_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法定代表人姓名',
  `C_LEGAL_CERTF_CLS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法定代表人证件类型',
  `C_LEGAL_CERTF_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法定代表人证件号码',
  `T_LEGAL_CERTF_END_TM` datetime DEFAULT NULL COMMENT '法定代表人证件有效期限',
  `C_RESV_TXT_12` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段12',
  `C_ORGANIZATION_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '组织机构代码',
  `C_BUSLICENCE_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '营业执照号',
  `C_ORG_VALID` datetime DEFAULT NULL COMMENT '组织机构代码有效期',
  `C_BUSLICENCE_VALID` datetime DEFAULT NULL COMMENT '营业执照号有效期',
  `C_LEGAL_REP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法人代表',
  `C_IDENTIFICATION_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法人代表证件号码',
  `C_CERTIFICATE_VALID` datetime DEFAULT NULL COMMENT '法人代表证件号码有效期',
  `C_IDENTIFICATION_NO_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法人代表证件类型',
  `C_CEVENUE_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '税务登记号',
  `C_MANAGE_AREA` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '经营范围',
  `C_CUST_RISK_RANK` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '反洗钱客户风险等级',
  `C_CERT_VALID` datetime DEFAULT NULL COMMENT '税务有效期',
  `C_RESV_TXT_3` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '营业执照号',
  `C_RESV_TXT_4` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段4',
  `C_RESV_TXT_5` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段5',
  `C_RESV_TXT_6` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段6',
  `C_RESV_TXT_7` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段7',
  `C_RESV_TXT_8` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段8',
  `C_RESV_TXT_9` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段9',
  `C_RESV_TXT_10` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段10',
  `C_RESV_TXT_11` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段11',
  `C_RESV_TXT_13` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段13',
  `N_RESV_NUM_3` decimal(8,0) DEFAULT NULL COMMENT '数字预留3',
  `N_RESV_NUM_4` decimal(8,0) DEFAULT NULL COMMENT '数字预留4',
  `N_RESV_NUM_5` decimal(8,0) DEFAULT NULL COMMENT '数字预留5',
  `N_RESV_NUM_6` decimal(8,0) DEFAULT NULL COMMENT '数字预留6',
  `N_RESV_NUM_7` decimal(8,0) DEFAULT NULL COMMENT '数字预留7',
  `N_RESV_NUM_8` decimal(8,0) DEFAULT NULL COMMENT '数字预留8',
  `C_APP_CATE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保人类别',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_PLY_APPLICANT` (`C_APP_NO`),
  UNIQUE KEY `UI_PLY_APPLICANT` (`C_PLY_NO`,`N_EDR_PRJ_NO`),
  KEY `IDX_PLYAPPLICANT_PLYNO` (`C_PLY_NO`),
  KEY `IDX_PLY_APPLICANT_NME` (`C_APP_NME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB_PLY_APPLICANT保单投保人';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_base`
--

DROP TABLE IF EXISTS `web_ri_ply_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_base` (
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT ' A  投保单, E 批改申请单, Q 报价单, O 开口保单',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保单号 Policy No',
  `N_EDR_PRJ_NO` decimal(6,0) DEFAULT '0' COMMENT '批改次数 Times of Endorsement',
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批单号',
  `C_REL_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '依赖关联保单号 ，如财产险与利损险，车险商业与交强险',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品代码 Product Code',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '机构代码 Department No',
  `C_SLS_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '业务员',
  `C_BSNS_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '业务来源 Source Type of Business',
  `C_BSNS_SUBTYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '业务来源细分 Source Subtype of Business',
  `C_BRKR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '代理人/经纪人 Agent/Broker No',
  `C_AGT_AGR_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '代理协议或合作协议号 Agency Agreement No',
  `N_SUB_CO_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '补充协议号 Supplemental Agreement No',
  `C_OC_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '开口保单业务的预约保单号',
  `N_DISC_RATE` decimal(10,6) DEFAULT NULL COMMENT '整张单的折扣率',
  `N_RATE` decimal(10,6) DEFAULT NULL COMMENT '整张保单的费率',
  `N_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '手续费比例 Proportion of Commission to Premium',
  `C_RENEW_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '续保标志: 0 新保; 1 续保 Renewal Flag ',
  `C_ORIG_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '续保单上年保单号 Original Policy No of Renewal',
  `C_ORIG_INSURER` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '上年保险公司 Former Insurer',
  `C_AMT_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保额币种 Currency of Amount {Code}',
  `N_AMT` decimal(20,2) DEFAULT NULL COMMENT '保额合计 Amount Insured',
  `N_AMT_RMB_EXCH` decimal(10,6) DEFAULT NULL COMMENT '保费汇率 Exchange Rate of Premium',
  `C_PRM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保费币种 Currency of Premium',
  `N_CALC_PRM` decimal(20,2) DEFAULT NULL COMMENT '计算保费合计,系统自动计算的保费金额',
  `N_PRM` decimal(20,2) DEFAULT NULL COMMENT '保费合计 Premium',
  `N_PRM_RMB_EXCH` decimal(10,6) DEFAULT NULL COMMENT '保费人民币汇率',
  `N_INDEM_LMT` decimal(20,2) DEFAULT NULL COMMENT '赔偿限额合计 Limits of Idemnity',
  `C_RATIO_TYP` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '短期费率方式 Part-term Rate Type',
  `N_RATIO_COEF` decimal(10,6) DEFAULT NULL COMMENT '短期系数 Part-term Coefficient',
  `N_SAVING_AMT` decimal(20,2) DEFAULT NULL COMMENT '储金  Amount of Saving Fund',
  `C_PRM_STS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保费实收状态，0 未实收 1 部分实收 2 保费收齐',
  `C_PLY_STS` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保单状态 Policy Status，I: 非终止(有效或满期) T: Terminated 终止(注退)',
  `T_TERMN_TM` datetime DEFAULT NULL COMMENT '保单终止时间 Time of Policy Termination，初始为保险止期，注退后填上注退时间',
  `C_INWD_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '分入业务标志( 0 非分入; 1 分入) Reinsurance Inward Flag',
  `C_CI_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '共保标志( 0 非共保 1 共保) Coinsurance Flag',
  `C_CI_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '共保方式代码 Coinsurance Type {Code}',
  `N_CI_JNT_AMT` decimal(20,2) DEFAULT NULL COMMENT '共保总保额 Joint Amount of Coinsurance',
  `N_CI_JNT_PRM` decimal(20,2) DEFAULT NULL COMMENT '共保总保费 Joint Premium of Coinsurance',
  `C_LONG_TERM_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '多年期标志( 0 短期; 1 多年期) Long Term Flag',
  `T_APP_TM` datetime DEFAULT NULL COMMENT '投保日期 Applying Time',
  `C_OPR_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保单号生成方式, 0  自动, 1  手动',
  `C_PRN_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '印刷号 Print No',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '保险起期 Policy Effective Date',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '保险止期 Policy Expire Date',
  `C_TM_SYS_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '时制(0-24时/12-12时) Time System Code (0-24hr/12-12hr)',
  `C_UNFIX_SPC` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '非固定特别约定 Unfixed Special Provision',
  `C_GRP_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '团单标志( 0 个单; 1 团单) Group Insurance Flag',
  `C_MULT_INSRNT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT ' 0 否  , 1 是',
  `C_LISTORCOL_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '清单/汇总标志( 0 输入清单, 1 输入汇总  ; )，人身险需要',
  `C_MASTER_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '统括保单标志 Master Policy Flag',
  `C_BID_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '投标业务标志',
  `C_PKG_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT ' 0 否, 1 是',
  `C_PKG_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '一揽子编号 Package Business Flag',
  `N_PRM_DISC` decimal(10,6) DEFAULT NULL,
  `C_REG_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '记名标志: 0 不记名; 1 记名 Registered Flag',
  `C_DEC_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '法定申报标志(0非申报;1申报) Legal Declaration Flag',
  `C_JURI_CDE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '司法管辖代码 Jurisdition Code',
  `C_AGRI_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '涉农标志  Agriculture Related Flag',
  `C_FOREIGN_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '境内外标志(0:境内;1:境外) Domestic/Foreign Flag',
  `C_IMPOREXP_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_MANUAL_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '手工出单标志(0非手工1手工)',
  `C_INST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '分期付款标志 Installment Flag',
  `C_VIP_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT 'VIP标志 VIP Flag',
  `C_OPEN_COVER_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预约协议 Open Cover No',
  `C_DISPT_STTL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '诉讼方式 Dispute settle method {Code}',
  `C_DISPT_STTL_ORG` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '仲裁机构  Dispute settle Organ',
  `C_OPR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '操作员代码 Operator s No',
  `T_OPR_TM` datetime DEFAULT NULL COMMENT '操作日期 Operate Time',
  `C_CHK_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '复核人代码 Checker s No',
  `T_ISSUE_TM` datetime DEFAULT NULL COMMENT '签单日期 Issue Time',
  `T_UDR_TM` datetime DEFAULT NULL COMMENT '核保日期 Underwrite Time',
  `C_UDR_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '核保机构 Underwriting Department No',
  `C_UDR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '核保人代码 Underwriter s No',
  `C_UDR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '核保标志',
  `C_RI_FAC_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '临分标志 Facultative Reinsurance Flag',
  `C_RI_CHK_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '再保审核人代码 Reinsurance Approver s No',
  `C_RI_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '再保确认标志 Reinsurance Approved Flag',
  `T_NEXT_EDR_BGN_TM` datetime DEFAULT NULL COMMENT '批改生效起期 Beginning of Successive Edorsement  Effective Time ',
  `T_NEXT_EDR_END_TM` datetime DEFAULT NULL COMMENT '批改生效止期 End of Successive Edorsement Effective Time ',
  `T_NEXT_EDR_UDR_TM` datetime DEFAULT NULL COMMENT '下次批改核保日期 Underwriting Time of Endorsement in Succession',
  `C_REVERT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批改回退标志 0 无回退/新记录 1 被回退记录 2 目的记录',
  `C_REMARK` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '备注 Remark',
  `T_EDR_APP_TM` datetime DEFAULT NULL COMMENT '批改申请日期',
  `T_EDR_BGN_TM` datetime DEFAULT NULL COMMENT '批改生效起期',
  `T_EDR_END_TM` datetime DEFAULT NULL COMMENT '批改生效止期',
  `C_EDR_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '申请类型,1 内部批单，2 客户申请',
  `C_EDR_TYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批改类型,1 一般批改，2 注销，3退保  4、组合批改  5 满期返还  9 批单撤销',
  `C_EDR_RSN_BUNDLE_CDE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批改原因或组合代码',
  `N_BEF_EDR_PRJ_NO` decimal(6,0) DEFAULT NULL COMMENT '批改业务原保单记录序批改号 Predecessor Endorsement Prj No',
  `N_BEF_EDR_AMT` decimal(20,2) DEFAULT NULL COMMENT '批改前保额',
  `N_BEF_EDR_PRM` decimal(20,2) DEFAULT NULL COMMENT '批改前保费',
  `C_LATEST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT ' 0 否, 1 是',
  `N_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '保额变化，批单保额-上一批单（保单）保额',
  `N_CALC_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '计算保费变化',
  `N_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '保费变化，批单保费上一批单（保单）保费',
  `N_INDEM_LMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '赔偿限额变化',
  `C_APP_PRSN_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '申请人代码',
  `C_APP_PRSN_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '申请人名称',
  `C_EDR_CTNT` text CHARACTER SET utf8 COLLATE utf8_bin,
  `C_RESV_TXT_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留 Reserved Field',
  `C_RESV_TXT_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留 Reserved Field',
  `C_RESV_TXT_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留 Reserved Field',
  `C_RESV_TXT_4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留 Reserved Field',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人员 Creator No',
  `T_CRT_TM` datetime DEFAULT NULL COMMENT '创建时间 Create Time',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人员 Updater No',
  `T_UPD_TM` datetime DEFAULT NULL COMMENT '修改时间 Update Time',
  `C_GRANT_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_VIP_CUS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `N_MAX_FEE_PROP` decimal(10,6) DEFAULT NULL,
  `C_FIN_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `N_ORIG_TIMES` decimal(4,0) DEFAULT NULL,
  `C_DPT_ATTR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_SALEGRP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_SLS_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_SLS_TEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_SLS_NME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_FRZ_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '0 正常，1 质押/挂失',
  `C_FEE_CAL_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RATE_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_COMMON_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `C_SAVE_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0',
  `N_BEF_EDR_SAVING` decimal(20,2) DEFAULT NULL,
  `N_SAVING_VAR` decimal(20,2) DEFAULT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_TRANS_TM` datetime DEFAULT NULL,
  `C_IMMEFF_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '批文内容',
  `C_DATA_SRC` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '即时生效标志',
  `C_QUOTE_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `N_BASE_PRM` decimal(20,2) DEFAULT NULL COMMENT '应交基准保费',
  `N_ALL_PRM` decimal(20,2) DEFAULT NULL COMMENT '整期保费',
  `N_IRR_RATIO` decimal(20,2) DEFAULT NULL COMMENT '浮动率',
  `C_PROD_NO_OLD` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '老系统产品代码',
  `C_QUOTA_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否定额单 1 定额单 0 非定额单',
  `C_LARGE_BUSINESS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '大额交易标记 0非大额 1 是大额交易',
  `C_SUS_BUSINESS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '可疑交易标记 0非可疑交易 1是可疑交易',
  `C_CHA_TYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '渠道中级分类',
  `C_CHA_SUBTYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '渠道子类',
  `C_SUR_FORMULA` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '退保公式',
  `C_NOENDCLM_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '有在途赔案标记 1 有 0 没有',
  `N_TAX_AMT` decimal(20,2) DEFAULT '0.00' COMMENT '车船税-冗余字段',
  `T_REPSTOPEXT_BGN_TM` datetime DEFAULT NULL COMMENT '停驶起期',
  `T_REPSTOPEXT_END_TM` datetime DEFAULT NULL COMMENT '停驶展期',
  `C_REPSTOPEXT_RLE_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '报停展期的总天数',
  `T_REPSTOPEXT_LAST_END_TM` datetime DEFAULT NULL COMMENT '上次展期',
  `T_SRC_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '原始保单起期',
  `T_SRC_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '原始保单止期',
  `C_REPSTOPEXT_STATUS` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '停展状态 T停  Z展  N 非停展状态',
  `C_REPSTOPEXT_SRC_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '做报停展期批改前的最新投保单，如果是做第二此报停展期批改则还是原来的最新投保单号',
  `C_SLS_CDE_OLD` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '老系统业务员代码',
  `C_DPT_CDE_OLD` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '老系统承保机构代码',
  `C_BRK_SLS_CDE` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '代理业务员',
  `C_TENDER_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '政府采购任务编码',
  `C_APPROVE_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保险公司审批人员代码',
  `C_PREFERENTIAL` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '减免信息',
  `N_COMMISSION_RATE_UPPER` decimal(20,2) DEFAULT NULL COMMENT '手续费支付比例上限(宁波手续费上传)',
  `C_TRD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '国民经济行业分类与代码',
  `C_DDUCT_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '免赔说明(new)',
  `N_DDUCT_RATE` decimal(10,6) DEFAULT NULL COMMENT '免赔率(new)',
  `N_DDUCT_AMT` decimal(20,2) DEFAULT NULL COMMENT '绝对免赔额(new)',
  `C_RESV_TXT_6` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留 Reserved Field',
  `C_RESV_TXT_7` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留 Reserved Field',
  `C_RESV_TXT_8` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留 Reserved Field',
  `C_RI_FAC_OPN` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '临分意见',
  `N_CI_OWN_AMT` decimal(20,2) DEFAULT NULL COMMENT '共保我司净保额',
  `N_CI_OWN_PRM` decimal(20,2) DEFAULT NULL COMMENT '共保我司净保费',
  `C_CI_INP_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '[共保]录单方式',
  `C_CI_PRI_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '[共保]单证打印方式',
  `C_RESV_TXT_5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_AREA_FLAG` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '地区标识',
  `C_CERTF_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '代理业务跟单销售人员职业证号',
  `C_NEEDFEE_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '是否规定见费出单标志 0 否 1 是',
  `C_CANCLFEE_FLG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT ' 特殊取消见费出单标志 0 否 1 是',
  `C_CANCLFEERSN_CDE` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT ' 特殊取消见费出单原因',
  `T_LAST_BILL_DATE` datetime DEFAULT NULL COMMENT '上张保单签单日期',
  `T_LAST_START_DATE` datetime DEFAULT NULL COMMENT '上张保单起保日期/浮动因素计算期间起期',
  `T_LAST_END_DATE` datetime DEFAULT NULL COMMENT '上张保单终保日期/浮动因素计算区间止期',
  `T_RUN_BGN_TM` datetime DEFAULT NULL COMMENT '追溯起期',
  `T_RUN_END_TM` datetime DEFAULT NULL COMMENT '追溯止期',
  `C_PAYMENT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否已经将团单收付变为个单进行传送  0：未传送  1：已经传送',
  `C_UNFIX_SPC_CHANGE` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否修改特别约定（是否走自核）：0-否；1-是；',
  `C_UNFIX_SPC_HIDDEN` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '隐藏特别约定',
  `C_DANZHENG_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '单证类型',
  `N_SURR_RATE` decimal(20,2) DEFAULT NULL COMMENT '注销手续费率',
  `C_MONITOR_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '时间监控ID',
  `N_RESV_NUM_1` decimal(20,2) DEFAULT NULL COMMENT '预留数值字段1',
  `N_RESV_NUM_2` decimal(20,2) DEFAULT NULL COMMENT '预留数值字段2',
  `N_RESV_NUM_3` decimal(20,2) DEFAULT NULL COMMENT '预留数值字段3',
  `N_CHARGE_PRM` decimal(20,2) DEFAULT NULL COMMENT '换算保额(人民币)',
  `C_ISLOG_BACK` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否ilog返回修改，1为ilog返回修改，0为自核通过，或者自核转人工',
  `C_QUICK_FLAG` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否快速出单：0-否；1-是；',
  `C_UNFIX_SPC_ILOG` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '特别约定按照:特约编号---特约内容###特约编号---特约内容,传递给ilog',
  `C_UNDR_OPN` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'ilog申请核保返回修改原因',
  `C_GLASS_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_BRK_SLS_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '代理业务员名称',
  `C_EDR_RATIO_TYP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批改短期费率类型',
  `N_FUND_RATE` decimal(20,2) DEFAULT NULL COMMENT '计提救助基金比例',
  `N_FUND_AMOUNT` decimal(20,2) DEFAULT NULL COMMENT '计提救助基金金额',
  `C_PKG_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_PKG_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_MARKET_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_AGREE_START_TM` datetime DEFAULT NULL,
  `T_AGREE_STOP_TM` datetime DEFAULT NULL,
  `C_AGREEMENT_DAYS` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_WATER_MARK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否涉海|涉水 0 否 1是',
  `C_OC_AGR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '开口保单协议号',
  `C_SPEC_NO` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '特别约定序号集',
  `C_INTRO_DPTCDE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '服务机构',
  `C_RECEI_TITLE_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发票抬头',
  `C_RECEI_TITLE_NME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发票标题',
  `C_COUNTRY_FLAG` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '县/区',
  `C_APP_AREA_CODE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '指定查询区域',
  `C_PURE_PRM_FLAG` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '纯风险保费标识',
  `C_RECEI_HS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Y为回收发票，N未回收（发票丢失）',
  `C_CITY` varchar(30) DEFAULT NULL,
  `c_province` varchar(30) DEFAULT NULL,
  `c_paper_mrk` varchar(1) DEFAULT NULL COMMENT '是否需要纸质保单及发票,0：不需要 ，1：需要',
  `c_send_per` varchar(100) DEFAULT NULL COMMENT '配送人',
  `c_send_mobile` varchar(100) DEFAULT NULL COMMENT '配送人电话',
  `c_send_addr` varchar(200) DEFAULT NULL COMMENT '配送地址',
  `C_PRE_NO` varchar(50) DEFAULT NULL,
  `C_ORDER_NO` varchar(50) DEFAULT NULL,
  `C_JOINT_NO` varchar(50) DEFAULT NULL,
  `N_VAT` decimal(20,2) DEFAULT NULL COMMENT '税',
  `N_PRICE` decimal(20,2) DEFAULT NULL COMMENT '价',
  `N_VAT_VAR` decimal(20,2) DEFAULT NULL COMMENT '税变化量',
  `N_PRICE_VAR` decimal(20,2) DEFAULT NULL COMMENT '价变化量',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_PLY_BASE` (`C_APP_NO`),
  UNIQUE KEY `UI_PLY_BASE` (`C_PLY_NO`,`N_EDR_PRJ_NO`),
  KEY `IDX_BASE_PROD_NO` (`C_PROD_NO`),
  KEY `IDX_PLYBASE_APPTM` (`T_APP_TM`),
  KEY `IDX_PLYBASE_BGNTM` (`T_INSRNC_BGN_TM`),
  KEY `IDX_PLYBASE_C_DPT_CDE` (`C_DPT_CDE`),
  KEY `IDX_PLYBASE_EDRAPPTM` (`T_EDR_APP_TM`),
  KEY `IDX_PLYBASE_EDRBGNTM` (`T_EDR_BGN_TM`),
  KEY `IDX_PLYBASE_NEWPLYNO_QRY` (`T_UDR_TM`,`T_INSRNC_END_TM`),
  KEY `IDX_PLYBASE_PLYNO` (`C_PLY_NO`),
  KEY `IDX_PLY_BASE_UPDTM` (`T_UPD_TM`),
  KEY `IDX_WEBPLYBASE_C_EDR_NO` (`C_EDR_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_bnfc`
--

DROP TABLE IF EXISTS `web_ri_ply_bnfc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_bnfc` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  记录唯一标识号,投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID，如为新增记录则为批改申请单的PKID',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_EDR_PRJ_NO` decimal(6,0) NOT NULL,
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  批单号',
  `N_SEQ_NO` decimal(6,0) DEFAULT '1' COMMENT '  序号',
  `C_BNFC_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  受益人代码,受益人唯一客户代码',
  `C_BNFC_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  受益人名称',
  `C_INSURED_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  被保人编号,被保险人',
  `C_REL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  与被保人关系',
  `C_BENF_ORD` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  受益顺序',
  `N_BENF_PROP` decimal(10,6) DEFAULT NULL COMMENT '  受益比例,受费比例',
  `C_CERTF_CLS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  证件类型',
  `C_CERTF_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  证件号码',
  `C_SEX` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  性别',
  `T_BIRTHDAY` datetime DEFAULT NULL COMMENT '  出生日期,出生年月',
  `C_CLNT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  客户分类,客户分类,0 法人，1 个人',
  `C_CUS_LVL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  客户等级',
  `C_STK_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  股东客户标志',
  `C_CNTR_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  联系人',
  `C_TEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  固定电话',
  `C_MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  移动电话',
  `C_SUFFIX_ADDR` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  街',
  `C_COUNTY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  县',
  `C_CITY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  地市',
  `C_PROVINCE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  省份',
  `C_COUNTRY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  国家',
  `C_ADDR` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  联系地址,地址',
  `C_ZIP_CDE` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  联系地址邮编,邮编',
  `C_EMAIL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  电子邮箱,EMAIL',
  `C_LATEST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_RESV_TXT_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_PLY_BNFC` (`C_PK_ID`),
  KEY `IDX_PLYBNFC_APPNO` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='受益人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_ci`
--

DROP TABLE IF EXISTS `web_ri_ply_ci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_ci` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  记录唯一标识号,投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID，如为新增记录则为批改申请单的PKID',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_EDR_PRJ_NO` decimal(6,0) NOT NULL,
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  批单号',
  `N_SEQ_NO` decimal(6,0) NOT NULL,
  `C_CI_AGRMNT_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  共保协议号',
  `C_MAJOR_AGRMNT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  主从协议标志',
  `C_COINSURER_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CHIEF_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  主共标志',
  `C_ISSUE_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_CI_SHARE` decimal(10,6) DEFAULT NULL COMMENT '  共保比例',
  `N_CI_AMT` decimal(20,2) DEFAULT NULL COMMENT '  共保保额',
  `N_CI_RATE` decimal(10,6) DEFAULT NULL COMMENT '  共保费率',
  `N_CI_PRM` decimal(20,2) DEFAULT NULL COMMENT '  共保保费',
  `N_COMM` decimal(20,2) DEFAULT NULL COMMENT '  代理经纪费',
  `N_PLY_FEE` decimal(20,2) DEFAULT NULL COMMENT '  出单及相关费用',
  `N_CI_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '  保额变化',
  `N_CI_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '  保费变化',
  `N_COMM_VAR` decimal(20,2) DEFAULT NULL COMMENT '  代理经纪费变化',
  `N_PLY_FEE_VAR` decimal(20,2) DEFAULT NULL COMMENT '  出单费变化',
  `C_SELF_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '  本公司标志,表示本公司',
  `C_LATEST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_CI_SUB_COMP` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '共保子公司',
  `C_DPT_MRK` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '司内、司外标志',
  `N_PLY_FEE_RATE` decimal(10,6) DEFAULT NULL COMMENT '共保手续费比例',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_PLY_CI` (`C_PK_ID`),
  KEY `IDX_PLYCI_APPNO` (`C_APP_NO`),
  KEY `UI_PLY_CI` (`C_PLY_NO`,`N_EDR_PRJ_NO`,`C_COINSURER_CDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_cvrg`
--

DROP TABLE IF EXISTS `web_ri_ply_cvrg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_cvrg` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '记录唯一标识号,投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID， 如为新增记录则为批改申请单的PKID',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_EDR_PRJ_NO` decimal(6,0) NOT NULL,
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批单号',
  `N_SEQ_NO` decimal(6,0) NOT NULL,
  `C_CVRG_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CUST_CVRG_NME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '自定义险别名称,自定义险别名称 Customized Coverage Name',
  `C_CUST_CL_CTNT` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '自定义条款内容,自定义条款内容 Customized Clause Content',
  `N_AMT` decimal(20,2) DEFAULT NULL COMMENT '保额,保额 Amount Insured',
  `N_RATE` decimal(20,6) DEFAULT NULL COMMENT '费率,费率 Premium Rate',
  `N_BASE_PRM` decimal(20,2) DEFAULT NULL COMMENT '基本保费,基本保费 Base Premium',
  `N_BEF_PRM` decimal(20,2) DEFAULT NULL COMMENT '折前保费,折前保费 Premium without Discount',
  `N_DIS_COEF` decimal(10,6) DEFAULT '1.000000' COMMENT '折扣系数,优惠系数 Discount Coefficient',
  `N_CALC_PRM` decimal(20,2) DEFAULT NULL COMMENT '折后保费,计算保费 Calculated Premium',
  `N_PRM` decimal(20,2) DEFAULT NULL COMMENT '实际保费,保费 Premium',
  `N_BEF_ANN_PRM` decimal(20,2) DEFAULT NULL COMMENT '年折前保费,年折前保费 Annual Premium without Discount',
  `N_CALC_ANN_PRM` decimal(20,2) DEFAULT NULL COMMENT '年折后保费,年计算保费 Calculated Annual Premium',
  `T_PRM_CHG_TM` datetime DEFAULT NULL COMMENT '保费变化时间,保费变化时间，缺省为保单起保日期',
  `N_DUT_PRM` decimal(20,2) DEFAULT NULL COMMENT '变化前已了责任保费,已了责任保费，缺省为0',
  `C_REMARK` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '备注,备注 Remark',
  `C_TGT_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '标的类型代码,标的类型代码 Subject-matter Type',
  `C_TGT_NME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '标的名称,标的名称 Subject-matter Name',
  `N_TGT_QTY` decimal(8,0) DEFAULT NULL COMMENT '标的数量,标的数量 Quantity of Subject-matters',
  `N_INDEM_LMT` decimal(20,2) DEFAULT NULL COMMENT '赔偿限额,赔偿限额 Indemnity Limit',
  `C_DDUCT_MRK` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '不计免赔标志, 0  否, 1  是',
  `N_DDUCT_RATE` decimal(10,6) DEFAULT NULL COMMENT '免赔率,免赔率 Deductable Rate',
  `C_DDUCT_DESC` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '免赔说明,免赔说明 Deductable Description',
  `N_DDUCT_AMT` decimal(20,2) DEFAULT NULL COMMENT '绝对免赔额,绝对免赔额 Straight Deductible Amount',
  `C_CANCEL_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '退保标志,退保标志 Cancel Flag，缺省为 1 ，当批改退保时为‘0’',
  `C_INDEM_LMT_LVL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT ' 赔偿限额档次,赔偿限额档次(车险) Level of Indemnity Limit,起付限额[063013产品]',
  `N_LIAB_DAYS_LMT` decimal(4,0) DEFAULT NULL COMMENT '责任天数,责任时限(车险) Days Limit of Liability 车上人员责任险作为乘客座位数',
  `N_PER_AMT` decimal(20,2) DEFAULT NULL COMMENT '每标的保额,每标的保额  Amount for Each Subject-matter 车上人员责任险作为司机保额',
  `N_PER_INDEM_LMT` decimal(20,2) DEFAULT NULL COMMENT '每标的赔偿限额,每标的赔偿限额 Indemnity Limit for Each Subject-matter 车上人员责任险作为乘客保额',
  `N_PER_PRM` decimal(20,2) DEFAULT NULL COMMENT '每标的保费,每标的保费 Premium for Each Subject-matter',
  `N_ONCE_INDEM_LMT` decimal(20,2) DEFAULT NULL COMMENT '单次赔偿限额,单次赔偿限额 Indemnity Limit for Any One Claim',
  `N_SAVING_AMT` decimal(20,2) DEFAULT NULL COMMENT '储金,储金 Amount of Saving Fund',
  `T_BGN_TM` datetime DEFAULT NULL COMMENT '有效起期,险别的有效起期，保单为保单的保险起期，批单为批单的生效起期',
  `T_END_TM` datetime DEFAULT NULL COMMENT '有效止期,险别的有效起期，保单为保单的保险止期，批单为批单的生效止期',
  `N_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '保额变化',
  `N_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '保费变化',
  `N_CALC_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '计算保费变化,计算保费 Calculated Premium',
  `N_INDEM_VAR` decimal(20,2) DEFAULT NULL COMMENT '赔偿限额变化',
  `C_LATEST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_RESV_TXT_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段1,预留',
  `C_RESV_TXT_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段2,预留',
  `C_RESV_TXT_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段3,预留',
  `C_RESV_TXT_4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段4,预留',
  `C_RESV_TXT_5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段5,预留',
  `C_RESV_TXT_6` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段6,预留',
  `C_RESV_TXT_7` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段7,预留',
  `C_RESV_TXT_8` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段8,预留',
  `C_RESV_TXT_9` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段9,预留',
  `C_RESV_TXT_10` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段10,预留',
  `C_RESV_TXT_11` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段11,预留',
  `C_RESV_TXT_12` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段12,预留',
  `C_RESV_TXT_13` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段13,预留',
  `C_RESV_TXT_14` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段14,预留',
  `C_RESV_TXT_15` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '预留字符串字段15,预留',
  `C_RESV_TXT_16` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段16,预留',
  `C_RESV_TXT_17` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段17,预留',
  `C_RESV_TXT_18` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段18,预留',
  `C_RESV_TXT_19` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段19,预留',
  `C_RESV_TXT_20` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段20,预留',
  `C_RESV_TXT_21` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段21,预留',
  `C_RESV_TXT_22` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段22,预留',
  `C_RESV_TXT_23` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段23,预留',
  `C_RESV_TXT_24` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段24,预留',
  `C_RESV_TXT_25` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段25,预留',
  `C_RESV_TXT_26` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段26,预留',
  `C_RESV_TXT_27` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段27,预留',
  `C_RESV_TXT_28` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段28,预留',
  `C_RESV_TXT_29` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段29,预留',
  `C_RESV_TXT_30` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符串字段30,预留',
  `N_RESV_NUM_1` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段1,预留',
  `N_RESV_NUM_2` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段2,预留',
  `N_RESV_NUM_3` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段3,预留',
  `N_RESV_NUM_4` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段4,预留',
  `N_RESV_NUM_5` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段5,预留',
  `N_RESV_NUM_6` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段6,预留',
  `N_RESV_NUM_7` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段7,预留',
  `N_RESV_NUM_8` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段8,预留',
  `N_RESV_NUM_9` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段9,预留',
  `N_RESV_NUM_10` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段10,预留',
  `N_RESV_NUM_11` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段11,预留',
  `N_RESV_NUM_12` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段12,预留',
  `N_RESV_NUM_13` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段13,预留',
  `N_RESV_NUM_14` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段14,预留',
  `N_RESV_NUM_15` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段15,预留',
  `N_RESV_NUM_16` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段16,预留',
  `N_RESV_NUM_17` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段17,预留',
  `N_RESV_NUM_18` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段18,预留',
  `N_RESV_NUM_19` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段19,预留',
  `N_RESV_NUM_20` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段20,预留',
  `N_RESV_NUM_21` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段21,预留',
  `N_RESV_NUM_22` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段22,预留',
  `N_RESV_NUM_23` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段23,预留',
  `N_RESV_NUM_24` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段24,预留',
  `N_RESV_NUM_25` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段25,预留',
  `N_RESV_NUM_26` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段26,预留',
  `N_RESV_NUM_27` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段27,预留',
  `N_RESV_NUM_28` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段28,预留',
  `N_RESV_NUM_29` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段29,预留',
  `N_RESV_NUM_30` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段30,预留',
  `T_RESV_TM_1` datetime DEFAULT NULL COMMENT '预留时间字段1,预留',
  `T_RESV_TM_2` datetime DEFAULT NULL COMMENT '预留时间字段2,预留',
  `T_RESV_TM_3` datetime DEFAULT NULL COMMENT '预留时间字段3,预留',
  `T_RESV_TM_4` datetime DEFAULT NULL COMMENT '预留时间字段4,预留',
  `T_RESV_TM_5` datetime DEFAULT NULL COMMENT '预留时间字段5,预留',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `N_DDUCT_PRM` decimal(20,2) DEFAULT NULL COMMENT '不计免赔保费',
  `C_UNDER_INSURANCE_FLAG` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '不足额投保标志:0:足额投保,1:不足额投保',
  `C_CVRG_NO_OLD` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '老系统险别代码',
  `N_FLOAT_RATE` decimal(20,6) DEFAULT NULL COMMENT '浮动率',
  `C_PLAN_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '方案号',
  `N_EXEM_PERIOD` decimal(6,0) DEFAULT NULL COMMENT '免责期（天）',
  `C_FORMULA` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'CFormula保费计算过程  C_FORMULA',
  `N_PRM_ZB` decimal(20,2) DEFAULT NULL COMMENT '分入全单保费',
  `N_COMPEN_RATE` decimal(20,2) DEFAULT NULL COMMENT '赔付比例',
  `C_ADD_MRK` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '增加险别标志',
  `C_GLASS_TYP` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '玻璃单独破碎险-玻璃类型',
  `N_AMT_ZB` decimal(20,2) DEFAULT NULL COMMENT '分入全单保额',
  `IF_BY_RATIOCOEF` decimal(2,0) DEFAULT NULL COMMENT '是否需要乘短期费率系数',
  `C_EXT_AREA_RAD` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '扩展区域半径 字段（机动车出境保险 使用）',
  `C_ACCIDENT_TYP` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '事故类型 字段（约定区域通行费特约 使用）',
  `C_AGREEMENT_RATIO` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '协定比例 字段（新车特约A，新车特约B 使用）',
  `C_DDUCT_MONEY_MRK` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '添加 免赔额标记 字段（可选不计免赔 使用）',
  `N_AUTO_CHE_COEF` decimal(10,6) DEFAULT NULL COMMENT '自主核保系数',
  `N_DDUCT_BEF_PRM` decimal(20,6) DEFAULT NULL COMMENT '不计免赔折前保费',
  `N_DDUCT_PRM_VAR` decimal(20,6) DEFAULT NULL COMMENT '不计免赔变化值',
  `N_FRANCHISE_RATE` decimal(20,6) DEFAULT NULL COMMENT '可选免赔额费率',
  `N_BASE_PURE_PRM` decimal(20,6) DEFAULT NULL COMMENT '基准纯风险保费',
  `N_ORIG_VAT` decimal(20,2) DEFAULT NULL COMMENT '原保单税金额',
  `N_ORIG_PRICE` decimal(20,2) DEFAULT NULL COMMENT '原保单价金额',
  `N_ORIG_VAT_VAR` decimal(20,2) DEFAULT NULL COMMENT '原保单税变化量',
  `N_ORIG_PRICE_VAR` decimal(20,2) DEFAULT NULL COMMENT '原保单价变化量',
  `N_OWN_VAT` decimal(20,2) DEFAULT NULL COMMENT '我司税金额',
  `N_OWN_PRICE` decimal(20,2) DEFAULT NULL COMMENT '我司价金额',
  `N_OWN_VAT_VAR` decimal(20,2) DEFAULT NULL COMMENT '我司税变化量',
  `N_OWN_PRICE_VAR` decimal(20,2) DEFAULT NULL COMMENT '我司价变化量',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_PLY_COVER` (`C_PK_ID`),
  KEY `IDX_PLYCVRG_APPNO` (`C_APP_NO`),
  KEY `IDX_WEB_PLY_CVRG_PLYNO` (`C_PLY_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_ent_tgt`
--

DROP TABLE IF EXISTS `web_ri_ply_ent_tgt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_ent_tgt` (
  `C_PK_ID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '  PKID',
  `C_APP_NO` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '  申请单号,批改申请单号',
  `C_ROW_ID` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '  记录唯一标识号,投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID，如为新增记录则为批改申请单的PKID',
  `C_PLY_NO` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '  保单号,保单号 Policy No',
  `N_EDR_PRJ_NO` decimal(6,0) NOT NULL COMMENT '  批改序号,批改次数 Times of Endorsement',
  `C_EDR_NO` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '  批单号',
  `N_SEQ_NO` decimal(6,0) NOT NULL COMMENT '  标的序号',
  `C_ADDR_SEC_1` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段1',
  `C_ADDR_SEC_2` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段2',
  `C_ADDR_SEC_3` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段3',
  `C_ADDR_SEC_4` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段4',
  `C_ADDR_SEC_5` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段5',
  `C_TGT_ADDR` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  标的地址',
  `C_TGT_ZIP` varchar(6) COLLATE utf8_bin DEFAULT NULL COMMENT '  标的邮编',
  `C_MATERIAL` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '  主要原料及辅料',
  `C_PROCESS_TECH` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '  生产工艺',
  `C_JURI_CDE` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  司法管辖',
  `C_TRD_CDE` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  行业类型',
  `C_SUB_TRD_CDE` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  行业细分',
  `C_BLD_TYP_CDE` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  建筑类型',
  `C_IMPKID_CDE` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  占用性质',
  `C_SAFETY_DEV_1_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  安全设施1,安全设施',
  `C_SAFETY_DEV_2_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  安全设施2,安全设施',
  `C_SAFETY_DEV_3_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  安全设施3,安全设施',
  `C_SAFETY_DEV_4_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  安全设施4,安全设施',
  `C_SAFETY_DEV_5_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  安全设施5,安全设施',
  `C_NEARBY_RIVER_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  临近河流标志',
  `C_NEARBY_WAY_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  临近公路标志',
  `C_NEARBY_FLAM_EXPLO_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  临近易燃易爆物标志,临近易燃易爆物标志 Nearby Flamable, Explosive Goods Flag',
  `C_NEARBY_OTHER_BLD_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  临近其它建筑物标志',
  `C_NCLM_DESC` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  免赔说明',
  `C_CUR_TYP` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '  币种',
  `N_AMT` decimal(20,2) DEFAULT NULL COMMENT '  保额',
  `N_PRM` decimal(20,2) DEFAULT NULL COMMENT '  保费',
  `N_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '  保额变化,保额变化，批单保额-上一批单（保单）保额',
  `N_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '  保费变化,保费变化，批单保费上一批单（保单）保费',
  `C_LATEST_MRK` char(1) COLLATE utf8_bin NOT NULL COMMENT '  最新保单标志,0否,1是',
  `T_CRT_TM` datetime NOT NULL COMMENT '  创建时间',
  `C_CRT_CDE` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '  创建人代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '  修改时间',
  `C_UPD_CDE` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '  修改人代码',
  `C_RESV_TXT_1` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留-文本1,预留',
  `C_RESV_TXT_2` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段2,预留',
  `C_RESV_TXT_3` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段3,预留',
  `C_RESV_TXT_4` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段4,预留',
  `C_RESV_TXT_5` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段5,预留',
  `C_RESV_TXT_6` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段6,预留',
  `C_RESV_TXT_7` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段7,预留',
  `C_RESV_TXT_8` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段8,预留',
  `C_RESV_TXT_9` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段9,预留',
  `C_RESV_TXT_10` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段10,预留',
  `C_RESV_TXT_20` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段20,预留',
  `N_RESV_NUM_1` decimal(20,6) DEFAULT NULL COMMENT '  预留-数值1,预留',
  `N_RESV_NUM_2` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段2,预留',
  `N_RESV_NUM_3` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段3,预留',
  `N_RESV_NUM_4` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段4,预留',
  `N_RESV_NUM_5` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段5,预留',
  `N_RESV_NUM_6` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段6,预留',
  `N_RESV_NUM_7` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段7,预留',
  `N_RESV_NUM_8` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段8,预留',
  `N_RESV_NUM_9` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段9,预留',
  `N_RESV_NUM_10` decimal(20,6) DEFAULT NULL COMMENT '  预留数值字段10,预留',
  `N_RESV_NUM_20` decimal(20,6) DEFAULT NULL COMMENT '  预留-数值20,预留',
  `T_RESV_TM_1` datetime DEFAULT NULL COMMENT '  预留-时间1,预留',
  `T_RESV_TM_2` datetime DEFAULT NULL COMMENT '  预留-时间2,预留',
  `T_RESV_TM_3` datetime DEFAULT NULL COMMENT '  预留-时间3,预留',
  `T_RESV_TM_10` datetime DEFAULT NULL COMMENT '  预留-时间10,预留',
  `C_RESV_TXT_13` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `C_TRANS_MRK` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_RESV_TXT_11` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段11预留',
  `C_RESV_TXT_12` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段12,预留',
  `C_RESV_TXT_14` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '  预留字符串字段14,预留',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_img_idx`
--

DROP TABLE IF EXISTS `web_ri_ply_img_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_img_idx` (
  `c_img_id` varchar(259) COLLATE utf8_bin NOT NULL,
  `c_app_no` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `c_ply_no` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `c_img_typ` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `c_img_file_nme` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `c_img_desc` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `c_crt_cde` varchar(30) COLLATE utf8_bin NOT NULL,
  `t_crt_tm` datetime NOT NULL,
  `c_upd_cde` varchar(30) COLLATE utf8_bin NOT NULL,
  `t_upd_tm` datetime NOT NULL,
  `c_trans_mrk` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `t_trans_tm` datetime DEFAULT NULL,
  `c_app_typ` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `t_adb_tm` datetime DEFAULT NULL,
  `c_remark` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  `c_check_mrk` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `c_target` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `c_status` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `c_imgfile_path` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_insured`
--

DROP TABLE IF EXISTS `web_ri_ply_insured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_insured` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '记录唯一标识号,投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID， 如为新增记录则为批改申请单的PKID',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_EDR_PRJ_NO` decimal(6,0) NOT NULL,
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批单号',
  `N_SEQ_NO` decimal(8,0) NOT NULL,
  `C_INSURED_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_INSURED_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '被保人名称',
  `C_INSURED_CLS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '被保人类别,包括： 0 主被保人, 1 副被保人, 2 连带被保人',
  `C_REL_INSURED_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '副被保人对应主被保人码,副被保人对应主被保人代码',
  `C_CERTF_CLS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '证件类型',
  `C_CERTF_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `C_CLNT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户分类,客户分类,0 法人，1 个人',
  `C_CUS_LVL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户等级',
  `C_STK_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '股东客户标志',
  `C_TRD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '行业代码',
  `C_SUB_TRD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '行业细分代码',
  `C_CNTR_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系人,投保人联系人',
  `C_TEL` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '固定电话,电话',
  `C_MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '移动电话',
  `C_COUNTRY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '国家',
  `C_PROVINCE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '省份',
  `C_CITY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '地市',
  `C_COUNTY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '县',
  `C_SUFFIX_ADDR` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '街',
  `C_CLNT_ADDR` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `C_ZIP_CDE` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `C_EMAIL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'EMAIL',
  `C_RESID_ADDR` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '居住地址',
  `C_RESID_ZIP` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '居住地址邮编',
  `C_WORK_DPT` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '工作单位',
  `C_WORK_DPT_ADDR` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '工作单位地址',
  `C_WORK_DPT_ZIP` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '工作单位邮编',
  `C_SEX` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `T_BIRTHDAY` datetime DEFAULT NULL COMMENT '出生日期,出生年月',
  `C_HEALTH_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '健康状况代码',
  `C_HEALTH_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '健康状况说明',
  `C_OCCUP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '职业代码',
  `C_SIDELINE_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '副业标志',
  `C_POSITION` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '职位',
  `C_DUTY` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '职务,职务内容',
  `N_INCOME` decimal(20,2) DEFAULT NULL COMMENT '年收入,年薪',
  `C_EDU_LVL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '文化程度代码,文化程度',
  `C_MRG_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '婚姻状况代码,婚姻状况',
  `C_CHLD_STS_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '子女状况',
  `N_DRV_AGE` decimal(4,0) DEFAULT NULL COMMENT '驾龄',
  `C_CONVEYANCE_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '日常主要代步工具代码,日常主要代步工具',
  `C_INS_HISTORY` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '以住三年保险记录',
  `C_LATEST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_RESV_TXT_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符字段1,预留 Reserved Field',
  `C_RESV_TXT_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符字段2,预留 Reserved Field',
  `C_RESV_TXT_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留字符字段3,预留 Reserved Field',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `C_CUS_RISK_LVL` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户风险等级,新客户、普通客户等',
  `T_CERTF_END_DATE` datetime DEFAULT NULL COMMENT '证件有效期止',
  `C_CUS_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '客户类型',
  `C_LEGAL_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法定代表人姓名',
  `C_LEGAL_CERTF_CLS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法定代表人证件类型',
  `C_LEGAL_CERTF_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '法定代表人证件号码',
  `T_LEGAL_CERTF_END_TM` datetime DEFAULT NULL COMMENT '法定代表人证件有效期限',
  `C_OPERATER_CERTF_CDE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '经办人身份证号码',
  `T_OPERATER_CERTF_END_TM` datetime DEFAULT NULL COMMENT '经办人身份证有效期至',
  `C_FAX` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '传真',
  `N_AGE` decimal(4,0) DEFAULT NULL COMMENT '年龄',
  `C_ORG_VALID` datetime DEFAULT NULL,
  `C_BUSLICENCE_VALID` datetime DEFAULT NULL COMMENT '营业执照号有效期',
  `C_CUST_RISK_RANK` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '反洗钱客户风险等级',
  `C_CERT_VALID` datetime DEFAULT NULL COMMENT '税务有效期',
  `C_WORK_CTT` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '经营范围',
  `C_CUST_RISKRANK_LVL` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '反洗钱客户风险等级',
  `C_RESV_TXT_4` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段4',
  `C_RESV_TXT_5` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段5',
  `C_RESV_TXT_6` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段6',
  `C_RESV_TXT_7` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段7',
  `C_RESV_TXT_8` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段8',
  `C_RESV_TXT_9` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段9',
  `C_RESV_TXT_10` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段10',
  `C_RESV_TXT_11` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段11',
  `C_RESV_TXT_12` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段12',
  `N_RESV_NUM_3` decimal(8,0) DEFAULT NULL COMMENT '预留数值字段3',
  `N_RESV_NUM_2` decimal(8,0) DEFAULT NULL COMMENT '预留数值字段2',
  `N_RESV_NUM_1` decimal(8,0) DEFAULT NULL COMMENT '预留数值字段1',
  `C_RESV_TXT_20` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段20',
  `C_RESV_TXT_19` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段19',
  `C_RESV_TXT_18` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段18',
  `C_RESV_TXT_17` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段17',
  `C_RESV_TXT_16` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段16',
  `C_RESV_TXT_15` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段15',
  `C_RESV_TXT_14` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段14',
  `C_RESV_TXT_13` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段13',
  `C_RESV_TXT_21` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段21',
  `C_RESV_TXT_22` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段22',
  `C_RESV_TXT_23` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段23',
  `C_RESV_TXT_24` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段24',
  `C_RESV_TXT_25` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段25',
  `C_RESV_TXT_26` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段26',
  `C_RESV_TXT_27` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段27',
  `C_RESV_TXT_28` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段28',
  `N_RESV_NUM_4` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段4',
  `N_RESV_NUM_5` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段5',
  `N_RESV_NUM_6` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段6',
  `N_RESV_NUM_7` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段7',
  `N_RESV_NUM_8` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段8',
  `C_RESV_TXT_29` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段29',
  `C_RESV_TXT_30` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段30',
  `C_RESV_TXT_31` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段31',
  `C_RESV_TXT_32` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段32',
  `C_RESV_TXT_33` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段33',
  `C_RESV_TXT_34` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段34',
  `C_RESV_TXT_35` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段35',
  `C_RESV_TXT_36` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段36',
  `C_RESV_TXT_37` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段37',
  `C_RESV_TXT_38` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段38',
  `C_RESV_TXT_39` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段39',
  `C_RESV_TXT_40` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预留文本字段40',
  `N_RESV_NUM_9` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段9',
  `N_RESV_NUM_10` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段10',
  `N_RESV_NUM_11` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段11',
  `N_RESV_NUM_12` decimal(20,6) DEFAULT NULL COMMENT '预留数值字段12',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_PLY_INSURED` (`C_PK_ID`),
  UNIQUE KEY `UI_PLY_INSURED` (`C_PLY_NO`,`N_EDR_PRJ_NO`,`C_INSURED_CDE`),
  KEY `IDX_INSURED_CERTF` (`C_CERTF_CLS`),
  KEY `IDX_PLY_INSURED_APPNO` (`C_APP_NO`),
  KEY `IDX_PLY_INSURED_NME` (`C_INSURED_NME`),
  KEY `IDX_PLY_INSURED_PLYNO` (`C_PLY_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='WEB_PLY_INSURED保单被保人';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_inwd`
--

DROP TABLE IF EXISTS `web_ri_ply_inwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_inwd` (
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_EDR_PRJ_NO` decimal(6,0) NOT NULL,
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  批单号',
  `C_INWD_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PRJ_NME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  项目名称',
  `C_CLAUSE` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  使用条款',
  `C_ORIG_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  原保险保单号',
  `C_ORIG_INSR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  原保险保险人',
  `C_CED_COM_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  分出公司',
  `C_RI_BRK_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  再保经纪人',
  `C_INWD_BIZ_SRC` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  分入业务来源',
  `C_INWD_DATE` datetime DEFAULT NULL COMMENT '  分入日期',
  `C_ORIG_CUR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  原保险币种',
  `C_INWD_CUR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  分入币种',
  `N_EXCH_RATE` decimal(10,6) DEFAULT NULL COMMENT '  兑换率',
  `N_ORIG_AMT` decimal(20,2) DEFAULT NULL COMMENT '  原保险保额',
  `N_ORIG_RATE` decimal(10,6) DEFAULT NULL COMMENT '  原保险费率',
  `N_INWD_RATE` decimal(10,6) DEFAULT NULL COMMENT '  分入费率',
  `N_ORIG_PRM` decimal(20,2) DEFAULT NULL COMMENT '  原保险保费',
  `N_OWN_SHARE_RATIO` decimal(10,6) DEFAULT NULL COMMENT '  我司份额',
  `N_OWN_AMT` decimal(20,2) DEFAULT NULL COMMENT '  我司保额',
  `N_OWN_GR_PRM` decimal(20,2) DEFAULT NULL COMMENT '  我司毛保费',
  `N_INWD_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '  分保手续费率,分保手续费比例',
  `N_INWD_COMM` decimal(20,2) DEFAULT NULL COMMENT '  分保手续费',
  `N_OWN_NT_PRM` decimal(20,2) DEFAULT NULL COMMENT '  我司净保费',
  `C_JURI_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  司法管辖',
  `C_LOS_REC` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  损失纪录',
  `C_RI_CL` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  再保条件/条款',
  `C_LATEST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `N_INWD_TAX_RATE` decimal(10,6) DEFAULT NULL COMMENT '  税率',
  `C_INWD_TAX_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  是否含税',
  `N_INWD_TAX_AMT` decimal(20,2) DEFAULT NULL COMMENT '  应缴税额',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `N_OWN_GR_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '我司毛保费变化量',
  `N_INWD_COMM_VAR` decimal(20,2) DEFAULT NULL COMMENT '分保手续费变化量',
  `N_INWD_TAX_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '应缴税额变化量',
  `C_INWD_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否含经纪费',
  `N_INWD_ELSE_FEE_VAR` decimal(20,2) DEFAULT NULL COMMENT '其它费用所占金额变化量',
  `N_INWD_ELSE_FEE` decimal(20,2) DEFAULT NULL COMMENT '其它费用所占金额',
  `N_INWD_ELSE_FEE_RATE` decimal(10,6) DEFAULT NULL COMMENT '其他费用费率',
  `C_PROVINCE` varchar(30) DEFAULT NULL COMMENT '省',
  `C_CITY` varchar(30) DEFAULT NULL COMMENT '市',
  `N_ORIG_VAT` decimal(20,2) DEFAULT NULL COMMENT '原保单税金额',
  `N_ORIG_PRICE` decimal(20,2) DEFAULT NULL COMMENT '原保单价金额',
  `N_ORIG_VAT_VAR` decimal(20,2) DEFAULT NULL COMMENT '原保单税变化量',
  `N_ORIG_PRICE_VAR` decimal(20,2) DEFAULT NULL COMMENT '原保单价变化量',
  `N_OWN_VAT` decimal(20,2) DEFAULT NULL COMMENT '我司税金额',
  `N_OWN_PRICE` decimal(20,2) DEFAULT NULL COMMENT '我司价金额',
  `N_OWN_VAT_VAR` decimal(20,2) DEFAULT NULL COMMENT '我司税变化量',
  `N_OWN_PRICE_VAR` decimal(20,2) DEFAULT NULL COMMENT '我司价变化量',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_PLY_INWD` (`C_APP_NO`),
  UNIQUE KEY `UI_PLY_INWD` (`C_PLY_NO`,`N_EDR_PRJ_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_pay`
--

DROP TABLE IF EXISTS `web_ri_ply_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_pay` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID， 如为新增记录则为批改申请单的PKID',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_EDR_PRJ_NO` decimal(6,0) NOT NULL,
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批单号',
  `N_TMS` decimal(6,0) NOT NULL,
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品编号 Product No',
  `C_PAYOR_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PAYOR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '付款人代码 Payer s Client No',
  `N_PAYABLE_PRM` decimal(20,2) DEFAULT NULL COMMENT '应付保费 Payable Premium',
  `C_PAY_MODE_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '付款方式 Payment Mode Code',
  `T_PAY_BGN_TM` datetime DEFAULT NULL COMMENT '缴费起始日期 Beginning of Payment Period',
  `T_PAY_END_TM` datetime DEFAULT NULL COMMENT '缴费截止日期 End of Payment Period',
  `T_PAID_TM` datetime DEFAULT NULL COMMENT '收费日期 Payment Time',
  `C_VCH_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '单证类型 Voucher Type',
  `C_RECPT_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收据号 Receipt NO',
  `N_PAID_PRM` decimal(20,2) DEFAULT NULL COMMENT '实收保费 Paid-in Premium',
  `C_CUR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '付款币种 Currency Code',
  `C_BANK_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '开户银行',
  `C_AC_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '账户 Account No',
  `C_LATEST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `N_PRM_VAR` decimal(20,2) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_PLY_PAY` (`C_PK_ID`),
  UNIQUE KEY `UI_PLY_PAY` (`C_PLY_NO`,`N_EDR_PRJ_NO`,`N_TMS`),
  KEY `IDX_PLYPAY_APPNO` (`C_APP_NO`),
  KEY `IDX_PLYPAY_PLYNO` (`C_PLY_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_relation`
--

DROP TABLE IF EXISTS `web_ri_ply_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_relation` (
  `C_PLY_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_ID` decimal(20,0) NOT NULL,
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  保单号',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '  保险起期',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '  保险止期',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime DEFAULT NULL COMMENT '  创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'user' COMMENT '  创建人代码',
  `T_UPD_TM` datetime DEFAULT NULL COMMENT '  修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'user' COMMENT '  修改人代码',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  机构代码,机构代码 Department No',
  `C_APP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  投保人代码,投保人唯一客户代码',
  `C_APP_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  投保人名称',
  `C_PLATE_NO` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  车牌号码,车牌号码 Plate Number',
  `C_ENG_NO` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  发动机号码,发动机号码 Engine No',
  `C_JOINT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否快速出单联合投保：1-是；0-否；空-否',
  `C_FRM_NO` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '车架号',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_PLY_RELATION_APP_NO` (`C_PLY_APP_NO`),
  KEY `IDX_PLY_RELATION_APPNME` (`C_APP_NME`),
  KEY `IDX_PLY_RELATION_DPTCDE` (`C_DPT_CDE`),
  KEY `IDX_PLY_RELATION_ENGNO` (`C_ENG_NO`),
  KEY `IDX_PLY_RELATION_ID` (`N_ID`),
  KEY `IDX_PLY_RELATION_INSR_TM` (`T_INSRNC_BGN_TM`,`T_INSRNC_END_TM`),
  KEY `IDX_PLY_RELATION_PLATENO` (`C_PLATE_NO`),
  KEY `IDX_PLY_RELATION_PLY_NO` (`C_PLY_NO`),
  KEY `IDX_PLY_RELATION_UPDTM` (`T_UPD_TM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_risk_qust`
--

DROP TABLE IF EXISTS `web_ri_ply_risk_qust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_risk_qust` (
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_EDR_PRJ_NO` decimal(6,0) NOT NULL,
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  批单号',
  `C_RISK_QUERY1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本1,风险询问',
  `C_RISK_QUERY2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本2,风险询问',
  `C_RISK_QUERY3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本3,风险询问',
  `C_RISK_QUERY4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本4,风险询问',
  `C_RISK_QUERY5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本5,风险询问',
  `C_RISK_QUERY6` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本6,风险询问',
  `C_RISK_QUERY7` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本7,风险询问',
  `C_RISK_QUERY8` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本8,风险询问',
  `C_RISK_QUERY9` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本9,风险询问',
  `C_RISK_QUERY10` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本10,风险询问',
  `C_RISK_QUERY11` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本11,风险询问',
  `C_RISK_QUERY12` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本12,风险询问',
  `C_RISK_QUERY13` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本13,风险询问',
  `C_RISK_QUERY14` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本14,风险询问',
  `C_RISK_QUERY15` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本15,风险询问',
  `C_RISK_QUERY16` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本16,风险询问',
  `C_RISK_QUERY17` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本17,风险询问',
  `C_RISK_QUERY18` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本18,风险询问',
  `C_RISK_QUERY19` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本19,风险询问',
  `C_RISK_QUERY20` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本20,风险询问',
  `C_RISK_QUERY21` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本21,风险询问',
  `C_RISK_QUERY22` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本22,风险询问',
  `C_RISK_QUERY23` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本23,风险询问',
  `C_RISK_QUERY24` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本24,风险询问',
  `C_RISK_QUERY25` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本25,风险询问',
  `C_RISK_QUERY26` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  风险询问-文本26,风险询问',
  `C_RISK_QUERY27` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  风险询问-文本27,风险询问',
  `C_RISK_QUERY28` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  风险询问-文本28,风险询问',
  `C_RISK_QUERY29` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  风险询问-文本29,风险询问',
  `C_RISK_QUERY30` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  风险询问-文本30,风险询问',
  `N_RISK_QUERY1` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值1,风险询问（数值）',
  `N_RISK_QUERY2` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值2,风险询问（数值）',
  `N_RISK_QUERY3` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值3,风险询问（数值）',
  `N_RISK_QUERY4` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值4,风险询问（数值）',
  `N_RISK_QUERY5` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值5,风险询问（数值）',
  `N_RISK_QUERY6` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值6,风险询问（数值）',
  `N_RISK_QUERY7` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值7,风险询问（数值）',
  `N_RISK_QUERY8` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值8,风险询问（数值）',
  `N_RISK_QUERY9` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值9,风险询问（数值）',
  `N_RISK_QUERY10` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值10,风险询问（数值）',
  `N_RISK_QUERY11` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值11,风险询问（数值）',
  `N_RISK_QUERY12` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值12,风险询问（数值）',
  `N_RISK_QUERY13` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值13,风险询问（数值）',
  `N_RISK_QUERY14` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值14,风险询问（数值）',
  `N_RISK_QUERY15` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值15,风险询问（数值）',
  `N_RISK_QUERY16` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值16,风险询问（数值）',
  `N_RISK_QUERY17` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值17,风险询问（数值）',
  `N_RISK_QUERY18` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值18,风险询问（数值）',
  `N_RISK_QUERY19` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值19,风险询问（数值）',
  `N_RISK_QUERY20` decimal(20,6) DEFAULT NULL COMMENT '  风险询问-数值20,风险询问（数值）',
  `T_RISK_QUERY1` datetime DEFAULT NULL COMMENT '  风险询问-时间1,风险询问（时间）',
  `T_RISK_QUERY2` datetime DEFAULT NULL COMMENT '  风险询问-时间2,风险询问（时间）',
  `T_RISK_QUERY3` datetime DEFAULT NULL COMMENT '  风险询问-时间3,风险询问（时间）',
  `T_RISK_QUERY4` datetime DEFAULT NULL COMMENT '  风险询问-时间4,风险询问（时间）',
  `T_RISK_QUERY5` datetime DEFAULT NULL COMMENT '  风险询问-时间5,风险询问（时间）',
  `T_RISK_QUERY6` datetime DEFAULT NULL COMMENT '  风险询问-时间6,风险询问（时间）',
  `T_RISK_QUERY7` datetime DEFAULT NULL COMMENT '  风险询问-时间7,风险询问（时间）',
  `T_RISK_QUERY8` datetime DEFAULT NULL COMMENT '  风险询问-时间8,风险询问（时间）',
  `T_RISK_QUERY9` datetime DEFAULT NULL COMMENT '  风险询问-时间9,风险询问（时间）',
  `T_RISK_QUERY10` datetime DEFAULT NULL COMMENT '  风险询问-时间10,风险询问（时间）',
  `C_LATEST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_RISK_QUERY31` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY32` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY33` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY34` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY35` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY36` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY37` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY38` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY39` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY40` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY41` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY42` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY43` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY44` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY45` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY46` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY47` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY48` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY49` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY50` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY51` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY52` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY53` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY54` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY55` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY56` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY57` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY58` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY59` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY60` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY61` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY62` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY63` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `C_RISK_QUERY64` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '风险询问',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_PLY_RISKINQ` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_tgt`
--

DROP TABLE IF EXISTS `web_ri_ply_tgt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_tgt` (
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_EDR_PRJ_NO` decimal(6,0) NOT NULL,
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  批单号',
  `C_LATEST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_TGT_TXT_FLD_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本1,标的字段',
  `C_TGT_TXT_FLD_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本2,标的字段',
  `C_TGT_TXT_FLD_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本3,标的字段',
  `C_TGT_TXT_FLD_4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本4,标的字段',
  `C_TGT_TXT_FLD_5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本5,标的字段',
  `C_TGT_TXT_FLD_6` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本6,标的字段',
  `C_TGT_TXT_FLD_7` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本7,标的字段',
  `C_TGT_TXT_FLD_8` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本8,标的字段',
  `C_TGT_TXT_FLD_9` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本9,标的字段',
  `C_TGT_TXT_FLD_10` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本10,标的字段',
  `C_TGT_TXT_FLD_11` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本11,标的字段',
  `C_TGT_TXT_FLD_12` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本12,标的字段',
  `C_TGT_TXT_FLD_13` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本13,标的字段',
  `C_TGT_TXT_FLD_14` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本14,标的字段',
  `C_TGT_TXT_FLD_15` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本15,标的字段',
  `C_TGT_TXT_FLD_16` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本16,标的字段',
  `C_TGT_TXT_FLD_17` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本17,标的字段',
  `C_TGT_TXT_FLD_18` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本18,标的字段',
  `C_TGT_TXT_FLD_19` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本19,标的字段',
  `C_TGT_TXT_FLD_20` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本20,标的字段',
  `C_TGT_TXT_FLD_21` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本21,标的字段',
  `C_TGT_TXT_FLD_22` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本22,标的字段',
  `C_TGT_TXT_FLD_23` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本23,标的字段',
  `C_TGT_TXT_FLD_24` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本24,标的字段',
  `C_TGT_TXT_FLD_25` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本25,标的字段',
  `C_TGT_TXT_FLD_26` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本26,标的字段',
  `C_TGT_TXT_FLD_27` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本27,标的字段',
  `C_TGT_TXT_FLD_28` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本28,标的字段',
  `C_TGT_TXT_FLD_29` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本29,标的字段',
  `C_TGT_TXT_FLD_30` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本30,标的字段',
  `C_TGT_TXT_FLD_31` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本31,标的字段',
  `C_TGT_TXT_FLD_32` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本32,标的字段',
  `C_TGT_TXT_FLD_33` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本33,标的字段',
  `C_TGT_TXT_FLD_34` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本34,标的字段',
  `C_TGT_TXT_FLD_35` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本35,标的字段',
  `C_TGT_TXT_FLD_36` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本36,标的字段',
  `C_TGT_TXT_FLD_37` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本37,标的字段',
  `C_TGT_TXT_FLD_38` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本38,标的字段',
  `C_TGT_TXT_FLD_39` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本39,标的字段',
  `C_TGT_TXT_FLD_40` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的字段-文本40,标的字段',
  `N_TGT_NUM_FLD_1` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值1,标的字段',
  `N_TGT_NUM_FLD_2` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值2,标的字段',
  `N_TGT_NUM_FLD_3` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值3,标的字段',
  `N_TGT_NUM_FLD_4` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值4,标的字段',
  `N_TGT_NUM_FLD_5` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值5,标的字段',
  `N_TGT_NUM_FLD_6` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值6,标的字段',
  `N_TGT_NUM_FLD_7` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值7,标的字段',
  `N_TGT_NUM_FLD_8` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值8,标的字段',
  `N_TGT_NUM_FLD_9` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值9,标的字段',
  `N_TGT_NUM_FLD_10` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值10,标的字段',
  `N_TGT_NUM_FLD_11` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值11,标的字段',
  `N_TGT_NUM_FLD_12` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值12,标的字段',
  `N_TGT_NUM_FLD_13` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值13,标的字段',
  `N_TGT_NUM_FLD_14` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值14,标的字段',
  `N_TGT_NUM_FLD_15` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值15,标的字段',
  `N_TGT_NUM_FLD_16` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值16,标的字段',
  `N_TGT_NUM_FLD_17` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值17,标的字段',
  `N_TGT_NUM_FLD_18` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值18,标的字段',
  `N_TGT_NUM_FLD_19` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值19,标的字段',
  `N_TGT_NUM_FLD_20` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值20,标的字段',
  `N_TGT_NUM_FLD_21` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值21,标的字段',
  `N_TGT_NUM_FLD_22` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值22,标的字段',
  `N_TGT_NUM_FLD_23` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值23,标的字段',
  `N_TGT_NUM_FLD_24` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值24,标的字段',
  `N_TGT_NUM_FLD_25` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值25,标的字段',
  `N_TGT_NUM_FLD_26` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值26,标的字段',
  `N_TGT_NUM_FLD_27` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值27,标的字段',
  `N_TGT_NUM_FLD_28` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值28,标的字段',
  `N_TGT_NUM_FLD_29` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值29,标的字段',
  `N_TGT_NUM_FLD_30` decimal(20,6) DEFAULT NULL COMMENT '  标的字段-数值30,标的字段',
  `T_TGT_TM_FLD_1` datetime DEFAULT NULL COMMENT '  标的字段-日期1,标的字段',
  `T_TGT_TM_FLD_2` datetime DEFAULT NULL COMMENT '  标的字段-日期2,标的字段',
  `T_TGT_TM_FLD_3` datetime DEFAULT NULL COMMENT '  标的字段-日期3,标的字段',
  `T_TGT_TM_FLD_4` datetime DEFAULT NULL COMMENT '  标的字段-日期4,标的字段',
  `T_TGT_TM_FLD_5` datetime DEFAULT NULL COMMENT '  标的字段-日期5,标的字段',
  `T_TGT_TM_FLD_6` datetime DEFAULT NULL COMMENT '  标的字段-日期6,标的字段',
  `T_TGT_TM_FLD_7` datetime DEFAULT NULL COMMENT '  标的字段-日期7,标的字段',
  `T_TGT_TM_FLD_8` datetime DEFAULT NULL COMMENT '  标的字段-日期8,标的字段',
  `T_TGT_TM_FLD_9` datetime DEFAULT NULL COMMENT '  标的字段-日期9,标的字段',
  `T_TGT_TM_FLD_10` datetime DEFAULT NULL COMMENT '  标的字段-日期10,标的字段',
  `T_TGT_TM_FLD_11` datetime DEFAULT NULL COMMENT '  标的字段-日期11,标的字段',
  `T_TGT_TM_FLD_12` datetime DEFAULT NULL COMMENT '  标的字段-日期12,标的字段',
  `T_TGT_TM_FLD_13` datetime DEFAULT NULL COMMENT '  标的字段-日期13,标的字段',
  `T_TGT_TM_FLD_14` datetime DEFAULT NULL COMMENT '  标的字段-日期14,标的字段',
  `T_TGT_TM_FLD_15` datetime DEFAULT NULL COMMENT '  标的字段-日期15,标的字段',
  `T_TGT_TM_FLD_16` datetime DEFAULT NULL COMMENT '  标的字段-日期16,标的字段',
  `T_TGT_TM_FLD_17` datetime DEFAULT NULL COMMENT '  标的字段-日期17,标的字段',
  `T_TGT_TM_FLD_18` datetime DEFAULT NULL COMMENT '  标的字段-日期18,标的字段',
  `T_TGT_TM_FLD_19` datetime DEFAULT NULL COMMENT '  标的字段-日期19,标的字段',
  `T_TGT_TM_FLD_20` datetime DEFAULT NULL COMMENT '  标的字段-日期20,标的字段',
  `L_TGT_LTXT_FLD_1` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的字段-长文本1,标的字段',
  `L_TGT_LTXT_FLD_2` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的字段-长文本2,标的字段',
  `L_TGT_LTXT_FLD_3` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的字段-长文本3,标的字段',
  `L_TGT_LTXT_FLD_4` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的字段-长文本4,标的字段',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_ADDR_SEC_1` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段1',
  `C_ADDR_SEC_2` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段2',
  `C_ADDR_SEC_3` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段3',
  `C_ADDR_SEC_4` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段4',
  `C_ADDR_SEC_5` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  地址段5',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `N_TGT_NUM_CHECKED` bigint(22) DEFAULT NULL COMMENT '核定载客人数',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_PLYTGT` (`C_PLY_NO`,`N_EDR_PRJ_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ply_tgt_obj`
--

DROP TABLE IF EXISTS `web_ri_ply_tgt_obj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ply_tgt_obj` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_ROW_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  记录唯一标识号,投保时为投保单的PKID，批改申请时如非新增记录则为原投保单的PKID，如为新增记录则为批改申请单的PKID',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_EDR_PRJ_NO` decimal(6,0) NOT NULL,
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  批单号',
  `N_SEQ_NO` decimal(6,0) NOT NULL,
  `C_TGT_OBJ_TXT_FLD_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)1,标的物字段',
  `C_TGT_OBJ_TXT_FLD_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)2,标的物字段',
  `C_TGT_OBJ_TXT_FLD_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)3,标的物字段',
  `C_TGT_OBJ_TXT_FLD_4` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)4,标的物字段',
  `C_TGT_OBJ_TXT_FLD_5` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)5,标的物字段',
  `C_TGT_OBJ_TXT_FLD_6` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)6,标的物字段',
  `C_TGT_OBJ_TXT_FLD_7` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)7,标的物字段',
  `C_TGT_OBJ_TXT_FLD_8` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)8,标的物字段',
  `C_TGT_OBJ_TXT_FLD_9` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)9,标的物字段',
  `C_TGT_OBJ_TXT_FLD_10` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)10,标的物字段',
  `C_TGT_OBJ_TXT_FLD_11` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)11,标的物字段',
  `C_TGT_OBJ_TXT_FLD_12` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)12,标的物字段',
  `C_TGT_OBJ_TXT_FLD_13` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)13,标的物字段',
  `C_TGT_OBJ_TXT_FLD_14` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)14,标的物字段',
  `C_TGT_OBJ_TXT_FLD_15` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)15,标的物字段',
  `C_TGT_OBJ_TXT_FLD_16` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)16,标的物字段',
  `C_TGT_OBJ_TXT_FLD_17` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)17,标的物字段',
  `C_TGT_OBJ_TXT_FLD_18` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)18,标的物字段',
  `C_TGT_OBJ_TXT_FLD_19` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)19,标的物字段',
  `C_TGT_OBJ_TXT_FLD_20` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  标的物字段(文本)20,标的物字段',
  `T_TGT_OBJ_TM_FLD_1` datetime DEFAULT NULL COMMENT '  标的物字段(日期)1,标的物字段',
  `T_TGT_OBJ_TM_FLD_2` datetime DEFAULT NULL COMMENT '  标的物字段(日期)2,标的物字段',
  `T_TGT_OBJ_TM_FLD_3` datetime DEFAULT NULL COMMENT '  标的物字段(日期)3,标的物字段',
  `T_TGT_OBJ_TM_FLD_4` datetime DEFAULT NULL COMMENT '  标的物字段(日期)4,标的物字段',
  `T_TGT_OBJ_TM_FLD_5` datetime DEFAULT NULL COMMENT '  标的物字段(日期)5,标的物字段',
  `N_TGT_OBJ_NUM_FLD_1` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)1,标的物字段',
  `N_TGT_OBJ_NUM_FLD_2` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)2,标的物字段',
  `N_TGT_OBJ_NUM_FLD_3` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)3,标的物字段',
  `N_TGT_OBJ_NUM_FLD_4` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)4,标的物字段',
  `N_TGT_OBJ_NUM_FLD_5` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)5,标的物字段',
  `N_TGT_OBJ_NUM_FLD_6` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)6,标的物字段',
  `N_TGT_OBJ_NUM_FLD_7` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)7,标的物字段',
  `N_TGT_OBJ_NUM_FLD_8` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)8,标的物字段',
  `N_TGT_OBJ_NUM_FLD_9` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)9,标的物字段',
  `N_TGT_OBJ_NUM_FLD_10` decimal(20,6) DEFAULT NULL COMMENT '  标的物字段(数值)10,标的物字段',
  `L_TGT_OBJ_LTXT_FLD_1` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的物字段(长文本)1,标的物字段',
  `L_TGT_OBJ_LTXT_FLD_2` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的物字段(长文本)2,标的物字段',
  `L_TGT_OBJ_LTXT_FLD_3` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的物字段(长文本)3,标的物字段',
  `L_TGT_OBJ_LTXT_FLD_4` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的物字段(长文本)4,标的物字段',
  `L_TGT_OBJ_LTXT_FLD_5` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '  标的物字段(长文本)5,标的物字段',
  `C_CANCEL_MARK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  取消标志',
  `C_LATEST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_TGT_OBJ_TXT_FLD_21` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_22` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_23` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_24` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_25` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_26` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_27` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_28` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_29` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TGT_OBJ_TXT_FLD_30` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_PLY_SJB_MATTER` (`C_PK_ID`),
  UNIQUE KEY `UI_PLY_TGT_OBJ` (`C_PLY_NO`,`N_EDR_PRJ_NO`,`N_SEQ_NO`),
  KEY `IDX_PLYTGTOBJ_APPNO` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_cal_err`
--

DROP TABLE IF EXISTS `web_ri_plyedr_cal_err`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_cal_err` (
  `C_PLYEDR_CALERR_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单出错PKID',
  `C_PLYEDRDUE_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单PKID',
  `C_DOC_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'P' COMMENT '单证类型,''A'' 保单,''E'' 批单',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号 Policy No',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL COMMENT '批改序号,批改次数 Times of Endorsement',
  `N_TMS` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '分期序号,分期缴费的序号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_RBK_SEQ` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单申请单号',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号',
  `C_CAL_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '计算方式,A-自动 B-手工',
  `T_CAL_TM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '计算时间',
  `C_ERR_RSN` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '错误原因',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_PLYEDR_CAL_ERR` (`C_PLYEDR_CALERR_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='未决赔案计算错误信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_ced`
--

DROP TABLE IF EXISTS `web_ri_plyedr_ced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_ced` (
  `C_PLYEDRCED_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单分出PKID',
  `C_PLYEDRDUE_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单PKID,关联保批单接口表',
  `C_DOC_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '单证类型,''A'' 保单,''E'' 批单',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL COMMENT '批改序号',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '分期序号,记录保单或批单的缴费期次，与保批单接口表N_PLY_TMS一致对于保单，与保批单接口表期次N_TMS一致对于批单，与保批单接口表期次N_TMS不一定相同',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_RBK_SEQ` decimal(4,0) NOT NULL COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单申请单号',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号',
  `C_CED_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分出类型,A 正常或者成数部分分出，B 溢额合约或者混合合约的溢额部分分出,C 临分超赔,D 类地震溢额分出,Z 其他',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司,''0'',''1''',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪公司下的再保公司',
  `C_RI_BRKR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约中的经纪公司或再保公司',
  `N_CED_PRPT` decimal(15,10) NOT NULL COMMENT '最新保单分出比例',
  `N_COMM_PRPT` decimal(10,6) NOT NULL COMMENT '最新保单手续费比例',
  `N_DUTY_PRPT` decimal(10,6) NOT NULL COMMENT '最新保单税费比例',
  `N_DUTY_ADD_PRPT` decimal(10,6) DEFAULT NULL COMMENT '最新保单附加税费比例',
  `N_CED_AMT` decimal(20,6) NOT NULL COMMENT '分出保额',
  `N_CED_PRM` decimal(20,6) NOT NULL COMMENT '分出保费',
  `N_COMM` decimal(20,6) NOT NULL COMMENT '手续费',
  `C_HAS_TAX_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手续费含税标志,''0'',''1'',根据合约设置得到,如含税，则税费不再传账单表及财务接口表',
  `N_DUTY` decimal(20,6) NOT NULL COMMENT '税费',
  `N_DUTY_ADD` decimal(20,6) DEFAULT NULL COMMENT '附加税费',
  `N_EDR_CED_PRPT` decimal(15,10) DEFAULT NULL COMMENT '批单保额分出比例',
  `N_EDR_COMM_PRPT` decimal(15,10) DEFAULT NULL COMMENT '批单手续费比例',
  `N_EDR_DUTY_PRPT` decimal(15,10) DEFAULT NULL COMMENT '批单税费比例',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `C_BILL_YM` varchar(7) DEFAULT NULL COMMENT '帐单年月',
  `C_UW_YM` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务年月',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码 Product Code',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构代码 Department No,默认保险总公司',
  `C_RIPRM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保保费币种',
  `N_EDR_PRM_PRPT` decimal(15,10) DEFAULT NULL COMMENT '批改保费分出比例',
  `N_ELSE_PRM` decimal(20,6) NOT NULL COMMENT '其它费用,记录临分分出的其它费用',
  `N_ELSE_PRM_RATE` decimal(10,6) NOT NULL COMMENT '其它费用率',
  `N_CED_RI_CUR_AMT` decimal(20,6) DEFAULT NULL COMMENT '分出再保币种保额，对应V5分出再保保额',
  `C_INNER_BILL_NO` varchar(50) DEFAULT NULL COMMENT '月度对内账单号，月出账汇总时回写',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源,01=直销业务,02=代理业务,03=邮寄销售业务,04=网络销售业务,05=经纪业务,06=专业代理业务,07=个人代理,08=电话销售业务',
  `N_CED_AMT_ALL` decimal(20,6) DEFAULT NULL COMMENT '最新分出保额',
  `N_CED_PRM_ALL` decimal(20,6) DEFAULT NULL COMMENT '最新分出保费',
  `C_CVRG_NO` varchar(6) DEFAULT NULL COMMENT '险别，现主要用于区分工程险中物质部分与三者部分',
  `C_INNER_BILL_NO_FORMAL` varchar(50) DEFAULT NULL COMMENT '月度对内正式账单号，正式月度账汇总时回写',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_PAY_TM` datetime DEFAULT NULL COMMENT '缴费时间',
  `N_DI_CED_PRM` decimal(20,6) DEFAULT NULL COMMENT '直保分出保费',
  `N_DI_CED_DUTY` decimal(20,6) DEFAULT NULL COMMENT '直保分保税',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_PLYEDR_CED` (`C_PLYEDRCED_PK_ID`),
  KEY `IDX_RI_PLYEDR_CED_C_APP_NO` (`C_APP_NO`),
  KEY `IDX_RI_PLYEDR_CED_C_PLY_NO` (`C_PLY_NO`,`N_EDR_PRJ_NO`),
  KEY `IDX_RI_PLYEDR_CED_N_RBK_SEQ` (`N_RBK_SEQ`),
  KEY `IDX_RI_PLYEDR_CED_N_SPLIT_SEQ` (`N_SPLIT_SEQ`),
  KEY `IDX_RI_PLYEDR_CED_N_TMS` (`N_TMS`),
  KEY `IDX_WEB_RI_PLYEDR_CED_PLY_NO` (`C_PLY_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分保计算的结果，按合约、再保人分摊';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_ced_bill_detail`
--

DROP TABLE IF EXISTS `web_ri_plyedr_ced_bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_ced_bill_detail` (
  `C_PLYEDR_CED_BILL_ID` varchar(100) NOT NULL,
  `C_INNER_BILL_NO` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_BILL_NO` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号 Policy No',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '批改序号,批改次数 Times of Endorsement',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_TMS` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '分期序号,用来标识保额所在记录对于保单，与缴费期次一致对于批单，与缴费期次不一定相同',
  `N_RBK_SEQ` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单',
  `T_RIDUE_TM` datetime NOT NULL COMMENT '再保挂账时间，分出计算时间依据，缺省与业务单挂账时间相同，冲正单则不同',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '状态,A可分,B已分,C确认,D不计算,E错误,F 已更正',
  `C_BILL_YM` varchar(7) NOT NULL COMMENT '帐单年月',
  `C_UW_YM` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务年月',
  `C_RI_BRKR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约中的经纪公司或再保公司',
  `C_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司,''0'',''1''',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪公司下的再保公司',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构代码 Department No,默认保险总公司',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码 Product Code',
  `C_RIPRM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保保费币种',
  `C_CED_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分出类型,A 正常或者成数部分分出，B 溢额合约或者混合合约的溢额部分分出,C 临分超赔,D 类地震溢额分出,Z 其他',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源,01=直销业务,02=代理业务,03=邮寄销售业务,04=网络销售业务,05=经纪业务,06=专业代理业务,07=个人代理,08=电话销售业务',
  `C_CVRG_NO` varchar(6) DEFAULT NULL COMMENT '险别，现主要用于区分工程险中物质部分与三者部分',
  `N_CED_PRPT` decimal(15,10) DEFAULT NULL COMMENT '最新保单分出比例',
  `N_CED_AMT` decimal(20,6) DEFAULT NULL COMMENT '分出保额',
  `N_CED_PRM` decimal(20,6) DEFAULT NULL COMMENT '分出保费',
  `N_DI_CED_PRM` decimal(20,6) DEFAULT NULL COMMENT '直保分出保费',
  `N_COMM` decimal(20,6) DEFAULT NULL COMMENT '手续费',
  `N_DI_CED_DUTY` decimal(20,6) DEFAULT NULL COMMENT '直保分保税',
  `N_DI_CED_DUTY_ADD` decimal(20,6) DEFAULT NULL COMMENT '直保分保附加税',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改日期',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_SEC_ID` varchar(30) DEFAULT NULL COMMENT ' section ID',
  `C_BILL_QUARTER` varchar(2) DEFAULT NULL COMMENT '账单季'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_ced_cont`
--

DROP TABLE IF EXISTS `web_ri_plyedr_ced_cont`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_ced_cont` (
  `C_CEDCONT_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单申请单号',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号 Policy No',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_CONT_PRIO` decimal(4,0) NOT NULL COMMENT '合约优先级,记录各合约的分出优先顺序',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `N_CED_PRPT` decimal(15,10) NOT NULL COMMENT '最新分出比例',
  `N_CED_AMT` decimal(20,6) NOT NULL COMMENT '最新分出保额',
  `N_CED_PRM` decimal(20,6) NOT NULL COMMENT '最新分出保费',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `N_COMM` decimal(20,6) DEFAULT NULL COMMENT '最新手续费',
  `N_DUTY` decimal(20,6) DEFAULT NULL COMMENT '最新分出税费',
  `N_ELSE_PRM` decimal(20,6) DEFAULT NULL COMMENT '最新其它费用',
  `N_CED_PRPT_VAR` decimal(15,10) DEFAULT NULL COMMENT '分保变化比例',
  `N_CED_AMT_VAR` decimal(20,6) DEFAULT NULL COMMENT '分出保额变化',
  `N_CED_PRM_VAR` decimal(20,6) DEFAULT NULL COMMENT '分出保费变化',
  `N_COMM_VAR` decimal(20,6) DEFAULT NULL COMMENT '手续费变化',
  `N_DUTY_VAR` decimal(20,6) DEFAULT NULL COMMENT '税费变化',
  `N_ELSE_PRM_VAR` decimal(20,6) DEFAULT NULL COMMENT '其它费用变化',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL COMMENT '批改序号,批改次数 Times of Endorsement',
  `C_CVRG_NO` varchar(6) DEFAULT NULL COMMENT '险别，现主要用于区分工程险中物质部分与三者部分',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_PLYEDR_CED_CONT` (`C_CEDCONT_PK_ID`),
  KEY `IDX_RI_PLYEDR_CONT_C_APP_NO` (`C_APP_NO`),
  KEY `IDX_RI_PLYEDR_CONT_C_PLY_NO` (`C_PLY_NO`),
  KEY `IDX_RI_PLYEDR_CONT_N_SPLIT_SEQ` (`N_SPLIT_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录最新保单分出的合约情况，调整合约分出顺序或调整自留额时操作此表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_ced_count`
--

DROP TABLE IF EXISTS `web_ri_plyedr_ced_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_ced_count` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `T_DUE_TM` datetime DEFAULT NULL COMMENT '挂账日期',
  `C_PROD_NO` varchar(6) DEFAULT NULL COMMENT '产品代码',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT NULL COMMENT '批改序号,批改次数 Times of Endorsement',
  `N_VOLUNTEER_QS_AMT` decimal(20,6) DEFAULT NULL COMMENT '法定分出保额',
  `N_QS_AMT` decimal(20,6) DEFAULT NULL COMMENT '成数分出保额',
  `N_SURPLUS_AMT` decimal(20,6) DEFAULT NULL COMMENT '溢额分出保额',
  `N_FAC_AMT` decimal(20,6) DEFAULT NULL COMMENT '临分分出保额',
  `N_NET_AMT` decimal(20,6) DEFAULT NULL COMMENT '自留保额',
  `N_VOLUNTEER_QS_PRM` decimal(20,6) DEFAULT NULL COMMENT '法定分出保费',
  `N_QS_PRM` decimal(20,6) DEFAULT NULL COMMENT '成数分出保费',
  `N_SURPLUS_PRM` decimal(20,6) DEFAULT NULL COMMENT '溢额分出保费',
  `N_FAC_PRM` decimal(20,6) DEFAULT NULL COMMENT '临分分出保费',
  `N_NET_PRM` decimal(20,6) DEFAULT NULL COMMENT '自留保费',
  `C_CONT_CDE` varchar(30) DEFAULT NULL COMMENT '合约代码',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CUR_CDE` varchar(30) DEFAULT NULL COMMENT '币种',
  `T_RIDUE_TM` datetime DEFAULT NULL COMMENT '再保挂账日期',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '保险起期',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_PLYEDR_CED_COUNT` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保单分出情况表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_ced_prpt`
--

DROP TABLE IF EXISTS `web_ri_plyedr_ced_prpt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_ced_prpt` (
  `C_CEDPRPT_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单分出PKID',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号 Policy No',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL COMMENT '批改序号,批改次数 Times of Endorsement',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '拆分序号,标的风险单位拆分的序号',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司,''0''否,''1''是',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保公司',
  `C_RI_BRKR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪公司',
  `T_CED_EFFC_TM` datetime DEFAULT NULL COMMENT '分出生效日期',
  `N_CED_PRPT` decimal(15,10) NOT NULL COMMENT '最新分出比例',
  `N_COMM_PRPT` decimal(10,6) NOT NULL COMMENT '最新手续费比例',
  `N_DUTY_PRPT` decimal(10,6) NOT NULL COMMENT '最新税费比例',
  `N_DUTY_ADD_PRPT` decimal(10,6) DEFAULT NULL COMMENT '最新附加税费比例',
  `N_CED_AMT` decimal(20,6) DEFAULT NULL COMMENT '最新分出保额',
  `N_CED_PRM` decimal(20,6) DEFAULT NULL COMMENT '最新分出保费',
  `N_COMM` decimal(20,6) DEFAULT NULL COMMENT '最新手续费',
  `C_HAS_TAX_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手续费含税标志,''0''否,''1''是',
  `N_DUTY` decimal(20,6) DEFAULT NULL COMMENT '最新税费',
  `N_DUTY_ADD` decimal(20,6) DEFAULT NULL COMMENT '最新附加税费',
  `C_LATEST_MRK` varchar(1) DEFAULT NULL COMMENT '最新标志',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `C_CED_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分出类型,A 正常，B 混合溢额成数分出,C 临分超赔,D 类地震溢额分出,Z 其他',
  `N_RBK_SEQ` decimal(4,0) NOT NULL COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单，冲正时，保留该表信息',
  `N_ELSE_PRM` decimal(20,6) NOT NULL COMMENT '其它费用,记录临分分出的其它费用',
  `N_ELSE_PRM_RATE` decimal(10,6) NOT NULL COMMENT '其它费用率',
  `C_CVRG_NO` varchar(6) DEFAULT NULL COMMENT '险别，现主要用于区分工程险中物质部分与三者部分',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_PLYEDR_CED_PRPT` (`C_CEDPRPT_PK_ID`),
  KEY `IDX_RI_PLYEDR_PRPT_C_PLY_NO` (`C_PLY_NO`,`N_EDR_PRJ_NO`),
  KEY `IDX_RI_PLYEDR_PRPT_N_RBK_SEQ` (`N_RBK_SEQ`),
  KEY `IDX_RI_PLYEDR_PRPT_N_SPLIT_SEQ` (`N_SPLIT_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录最新保单的分出比例，按保单、标的序号、合约、再保公司记录分出信息，并记录分出生效时间，便于理赔摊回计算处理分出生效时间一般为保险起期';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_cont_main`
--

DROP TABLE IF EXISTS `web_ri_plyedr_cont_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_cont_main` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '自然主键',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '批改序号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '申请单号',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_DESC` text COMMENT '合约描述',
  `C_CONTRACT_NO` varchar(30) DEFAULT NULL COMMENT '合同号',
  `T_CONT_BGN_TM` datetime DEFAULT NULL COMMENT '有效起期，合约实际生效的起期',
  `T_CONT_END_TM` datetime DEFAULT NULL COMMENT '有效止期，合约实际生效的止期',
  `T_CONT_SIGN_TM` datetime DEFAULT NULL COMMENT '合约签订日期',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '合约分出机构',
  `C_CONTI_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '新/续标志,''0''新,''1''续',
  `C_ORIG_CONT_ID` varchar(50) DEFAULT NULL COMMENT '原合约标识号',
  `C_CONT_CUR` varchar(30) DEFAULT NULL COMMENT '合约币种',
  `C_RICAL_MRK` varchar(1) DEFAULT 'R' COMMENT '分保基础,''P''保单,''R''风险单位',
  `C_RIPRM_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'G' COMMENT '保费基础,''G''毛保费,''N''净保费',
  `C_STL_TYP` varchar(1) DEFAULT NULL COMMENT '结清类型,''0''按合同终止日，''1''按责任终止日',
  `C_UW_YEAR` varchar(4) DEFAULT NULL COMMENT '业务年度',
  `C_ACC_CYCLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Q' COMMENT '账单周期,''M''月,''Q''季度,''H''半年,''Y''年',
  `T_LOGOUT_TM` datetime DEFAULT NULL COMMENT '合同注销时限',
  `N_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '手续费率',
  `N_DUTY_RATE` decimal(10,6) DEFAULT NULL COMMENT '税率',
  `C_HAS_TAX_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '手续费是否含税,''0''否,''1''是',
  `N_ACT_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '实际手续费率',
  `N_QS_PRPT` decimal(10,6) DEFAULT NULL COMMENT '成数比例',
  `N_LINE` decimal(4,0) DEFAULT NULL COMMENT '线数',
  `N_CASHLOSS_BGN` decimal(20,2) DEFAULT NULL COMMENT '现金赔款起点',
  `N_MNGFEE_RATE` decimal(10,6) DEFAULT NULL COMMENT '管理费率',
  `C_CHIEF_RICOM` varchar(30) DEFAULT NULL COMMENT '首席再保人',
  `N_CHIEF_SHARE` decimal(10,6) DEFAULT NULL COMMENT '首席再保人份额',
  `C_PRM_RESV_WAY` varchar(1) DEFAULT '0' COMMENT '保费准备金提取方式,''0''按未到期责任计算,''1''指定比例',
  `N_PRM_RESV_PRPT` decimal(10,6) DEFAULT NULL COMMENT '保费准备金比例',
  `N_CLM_RESV_PRPT` decimal(10,6) DEFAULT NULL COMMENT '赔款准备金比例',
  `N_CYCLE` decimal(4,0) DEFAULT NULL COMMENT '核算周期',
  `C_LOSS_CVT_MRK` varchar(1) DEFAULT '0' COMMENT '亏损转换标志''0''否,''1''是',
  `N_LOSS_CVT_YEAR` decimal(4,0) DEFAULT NULL COMMENT '亏损滚转年数',
  `N_PROF_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '纯益手续费率',
  `N_UE_PRM_PRPT` decimal(10,6) DEFAULT NULL COMMENT '未满期保费比例,合同结清时的转入，转出',
  `N_OS_CLM_PRPT` decimal(10,6) DEFAULT NULL COMMENT '未决赔款比例,合同结清时的转入，转出',
  `N_EQ_PRM_PRPT` decimal(10,6) DEFAULT NULL COMMENT '地震险保费比例',
  `N_EQ_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '地震险手续费率',
  `C_INW_QS_WAY` varchar(1) DEFAULT '0' COMMENT '分入业务溢额系数方式,''0''按分入比例,''1''指定系数',
  `N_INW_QS_COEF` decimal(10,6) DEFAULT NULL COMMENT '分入业务限额系数',
  `C_REMARK` text COMMENT '备注',
  `C_CONT_STATUS` varchar(1) DEFAULT NULL COMMENT '合约状态,''T''未审核,''E''已审核,''P''已终止',
  `C_AUD_CDE` varchar(30) DEFAULT NULL COMMENT '合约审核人',
  `T_AUD_TM` datetime DEFAULT NULL COMMENT '合约审核时间',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `N_CONT_LMT` decimal(20,2) DEFAULT NULL COMMENT '限额，合约中公用限额',
  `N_CONT_CHG_RATE` decimal(10,6) DEFAULT NULL COMMENT '合约币种兑人民币汇率,分保计算用人民币比较',
  `N_COMM_RATE_LINE` decimal(10,6) DEFAULT '0.000000' COMMENT '溢额手续费率,成数溢额混合合约和溢额合约的溢额部分手续费率',
  `T_CONT_ORIG_BGN_TM` datetime DEFAULT NULL COMMENT '合同起期,合同上约定起期，不代表当前合约实际生效的起期。',
  `T_CONT_ORIG_END_TM` datetime DEFAULT NULL COMMENT '合同止期,合同上约定止期，不代表当前合约实际生效的止期。',
  `N_CONT_EDR_PRJ_NO` decimal(4,0) DEFAULT '1' COMMENT '合同批改次数,用来区分合同号与合同分项号所确定的合约的多次批改',
  `N_SECTION_NO` decimal(4,0) DEFAULT '1' COMMENT '合同分项号,用来区分同一个合同不同的分项(或称SECTION)',
  `C_CI_MAIN_WAY` varchar(1) DEFAULT '0' COMMENT '主共溢额系数方式,''0''按共保比例,''1''指定系数',
  `N_CI_MAIN_COEF` decimal(10,6) DEFAULT '1.000000' COMMENT '主共溢额系数,我方主共保时溢额合约使用',
  `C_CI_FROM_WAY` varchar(1) DEFAULT '0' COMMENT '从共溢额系数方式,''0''按共保比例,''1''指定系数',
  `N_CI_FROM_COEF` decimal(10,6) DEFAULT '1.000000' COMMENT '从共溢额系数,我方从共保时溢额合约使用',
  `C_CI_MAIN_STOCK_WAY` varchar(1) DEFAULT '0' COMMENT '主共股东溢额系数方式,''0''按共保比例,''1''指定系数',
  `N_CI_MAIN_STOCK_COEF` decimal(10,6) DEFAULT '1.000000' COMMENT '主共股东溢额系数,我方主共保并且为股东业务时溢额合约使用',
  `C_CI_FROM_STOCK_WAY` varchar(1) DEFAULT '0' COMMENT '从共股东溢额系数方式,''0''按共保比例,''1''指定系数',
  `N_CI_FROM_STOCK_COEF` decimal(10,6) DEFAULT '1.000000' COMMENT '从共股东溢额系数,我方从共保并且为股东业务时溢额合约使用',
  `N_BILL_DUNNING_DAYS` decimal(6,0) DEFAULT NULL COMMENT '账单缴费期限',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_PLYEDR_CONT_MAIN` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保批单合约主档信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_cont_priority`
--

DROP TABLE IF EXISTS `web_ri_plyedr_cont_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_cont_priority` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '批改序号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '申请单号',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `N_PRIORITY` decimal(4,0) NOT NULL COMMENT '优先级',
  `T_ADJ_TM` datetime NOT NULL COMMENT '调整时间',
  `C_ADJ_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调整人代码',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间 ',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_PLYEDR_CONT_PRIORITY` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保批单个性化计算顺序';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_cont_scene`
--

DROP TABLE IF EXISTS `web_ri_plyedr_cont_scene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_cont_scene` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '自然主键',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '批改序号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '申请单号',
  `C_PRIORITY_SCENE` varchar(10) DEFAULT NULL COMMENT '合约优先级场景【数据来源】',
  `C_MAIN_SCENE` varchar(10) DEFAULT NULL COMMENT '合约主档场景【数据来源】',
  `C_QUOTA_SCENE` varchar(10) DEFAULT NULL COMMENT '合约产品限额场景【数据来源】',
  `C_COM_SHARE_SCENE` varchar(10) DEFAULT NULL COMMENT '合约再保人场景【数据来源】',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码',
  `C_RISK_LVL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_PLYEDR_CONT_SCENE` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保批单合约场景';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_cvrg`
--

DROP TABLE IF EXISTS `web_ri_plyedr_cvrg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_cvrg` (
  `C_PLYEDR_CVRG_PK_ID` varchar(50) COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) COLLATE utf8_bin NOT NULL,
  `C_CVRG_NO` varchar(6) COLLATE utf8_bin NOT NULL,
  `C_CVRG_NME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `N_PRM` decimal(20,2) NOT NULL,
  `N_CVRG_AMT` decimal(20,2) NOT NULL,
  `N_CVRG_PRM` decimal(20,2) NOT NULL,
  `N_PRPT` decimal(10,6) DEFAULT NULL,
  `C_CRT_CDE` varchar(30) COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `N_VAT` decimal(20,2) DEFAULT NULL,
  `N_PRICE` decimal(20,2) DEFAULT NULL,
  `N_VAT_VAR` decimal(20,2) DEFAULT NULL,
  `N_PRICE_VAR` decimal(20,2) DEFAULT NULL,
  `C_PLY_NO` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT NULL,
  `C_PROD_NO` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `N_AMT` decimal(20,2) DEFAULT NULL,
  `N_AMT_VAR` decimal(20,2) DEFAULT NULL,
  `N_PRM_VAR` decimal(20,2) DEFAULT NULL,
  `N_CVRG_PRM_VAR` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `N_CVRG_AMT_VAR` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `N_RI_VAT` decimal(20,2) DEFAULT NULL,
  `N_RI_PRICE` decimal(20,2) DEFAULT NULL,
  `N_RI_VAT_VAR` decimal(20,2) DEFAULT NULL,
  `N_RI_PRICE_VAR` decimal(20,2) DEFAULT NULL,
  `N_SUM_RI_PRICE_VAR` decimal(20,2) DEFAULT NULL,
  `N_SUM_PRICE_VAR` decimal(20,2) DEFAULT NULL,
  `C_IS_CONT` varchar(1) COLLATE utf8_bin DEFAULT '1',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  PRIMARY KEY (`C_PLYEDR_CVRG_PK_ID`),
  KEY `IDX_RI_PLYEDR_CVRG_C_APP_NO` (`C_APP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_cvrg_ced`
--

DROP TABLE IF EXISTS `web_ri_plyedr_cvrg_ced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_cvrg_ced` (
  `C_PLYEDRCED_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单分出PKID',
  `C_PLYEDRDUE_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单PKID,关联保批单接口表',
  `C_DOC_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '单证类型,''A'' 保单,''E'' 批单',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL COMMENT '批改序号',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '分期序号,记录保单或批单的缴费期次，与保批单接口表N_PLY_TMS一致对于保单，与保批单接口表期次N_TMS一致对于批单，与保批单接口表期次N_TMS不一定相同',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_RBK_SEQ` decimal(4,0) NOT NULL COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单申请单号',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号',
  `C_CED_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分出类型,A 正常或者成数部分分出，B 溢额合约或者混合合约的溢额部分分出,C 临分超赔,D 类地震溢额分出,Z 其他',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_BRKR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否经纪公司,''0'',''1''',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '经纪公司下的再保公司',
  `C_RI_BRKR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约中的经纪公司或再保公司',
  `N_CED_PRPT` decimal(15,10) NOT NULL COMMENT '最新险别分出比例',
  `N_COMM_PRPT` decimal(10,6) NOT NULL COMMENT '最新险别手续费比例',
  `N_DUTY_PRPT` decimal(10,6) NOT NULL COMMENT '最新险别税费比例',
  `N_CED_AMT` decimal(20,6) NOT NULL COMMENT '险别分出保额',
  `N_CED_PRM` decimal(20,6) NOT NULL COMMENT '险别分出保费',
  `N_COMM` decimal(20,6) NOT NULL COMMENT '险别摊回手续费',
  `C_HAS_TAX_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手续费含税标志,''0'',''1'',根据合约设置得到,如含税，则税费不再传账单表及财务接口表',
  `N_DUTY` decimal(20,6) NOT NULL COMMENT '险别摊回税费',
  `N_EDR_CED_PRPT` decimal(15,10) DEFAULT NULL COMMENT '批单险别分出比例',
  `N_EDR_COMM_PRPT` decimal(15,10) DEFAULT NULL COMMENT '批单险别手续费比例',
  `N_EDR_DUTY_PRPT` decimal(15,10) DEFAULT NULL COMMENT '批单险别税费比例',
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_BILL_YM` varchar(7) DEFAULT NULL COMMENT '帐单年月',
  `C_UW_YM` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务年月',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码 Product Code',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构代码 Department No,默认保险总公司',
  `C_RIPRM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保保费币种',
  `N_EDR_PRM_PRPT` decimal(15,10) DEFAULT NULL COMMENT '批改保费分出比例',
  `N_ELSE_PRM` decimal(20,6) NOT NULL COMMENT '其它费用,记录临分分出的其它费用',
  `N_ELSE_PRM_RATE` decimal(10,6) NOT NULL COMMENT '其它费用率',
  `N_CED_RI_CUR_AMT` decimal(20,6) DEFAULT NULL COMMENT '分出再保币种保额，对应V5分出再保保额',
  `C_INNER_BILL_NO` varchar(50) DEFAULT NULL COMMENT '月度对内账单号，月出账汇总时回写',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源,01=直销业务,02=代理业务,03=邮寄销售业务,04=网络销售业务,05=经纪业务,06=专业代理业务,07=个人代理,08=电话销售业务',
  `N_CED_AMT_ALL` decimal(20,6) DEFAULT NULL COMMENT '险别最新分出保额',
  `N_CED_PRM_ALL` decimal(20,6) DEFAULT NULL COMMENT '险别最新分出保费',
  `C_CVRG_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险别，现主要用于区分工程险中物质部分与三者部分',
  `C_INNER_BILL_NO_FORMAL` varchar(50) DEFAULT NULL COMMENT '月度对内正式账单号，正式月度账汇总时回写',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_C_PLYEDR_CVRG_CED_ID` (`C_PLYEDRCED_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='险别分出明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_cvrg_due`
--

DROP TABLE IF EXISTS `web_ri_plyedr_cvrg_due`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_cvrg_due` (
  `C_PLYEDRCVRGDUE_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物理主键PKID',
  `C_DOC_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '单证类型,''A'' 保单,''E'' 批单',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号 Policy No',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL COMMENT '批改序号,批改次数 Times of Endorsement',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '分期序号,用来标识保额所在记录  对于保单，与缴费期次一致  对于批单，与缴费期次不一定相同',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_RBK_SEQ` decimal(4,0) NOT NULL COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单申请单号',
  `C_INSRNT_CDE` varchar(30) DEFAULT NULL COMMENT '被保人代码',
  `C_INSRNT_NME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '被保人名称',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '保险起期 Policy Effective Date',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '保险止期 Policy Expire Date',
  `T_SIGN_TM` datetime NOT NULL COMMENT '签单日期',
  `T_UDR_TM` datetime NOT NULL COMMENT '核保日期 Underwrite Time',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码 Product Code',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构代码 Department No',
  `C_CAL_YM` varchar(7) DEFAULT NULL COMMENT '分出年月，分保计算时写入',
  `T_DUE_TM` datetime NOT NULL COMMENT '业务单挂账时间，业务写入，与财务接口表的挂账时间相同',
  `T_RIDUE_TM` datetime NOT NULL COMMENT '再保挂账时间，分出计算时间依据，缺省与业务单挂账时间相同，冲正单则不同',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态,A可分,B已分,C确认,D不计算,E错误,F 已更正',
  `C_INW_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分入业务标志',
  `C_STOCK_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '股东业务标志',
  `C_FAC_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '临分标志 Facultative Reinsurance Flag,''0''非临分,''1''临分',
  `C_CI_MRK` varchar(1) DEFAULT NULL COMMENT '共保方式,"0"=非共保业务,"1"=内部共保（我方主共）,"2"=内部共保（我方从共）,"3"=外部共保（我方主共）,"4"=外部共保（我方从共）',
  `C_INST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分期标志, A = 一般保单,B = 分期付款,C = 多年期（需要按自然年拆分）',
  `N_RI_PROP` decimal(10,6) DEFAULT NULL COMMENT '再保份额,再保分出的份额比例，缺省为1',
  `N_AMT` decimal(20,2) NOT NULL COMMENT '险别保额合计 Amount Insured',
  `C_AMT_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保额币种 Currency of Amount {Code},原保额币种',
  `C_PRM_CED_WAY` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保费分出方式,''G''毛保费,''N''净保费',
  `N_PRM` decimal(20,2) NOT NULL COMMENT '险别保费',
  `N_NET_PRM` decimal(20,2) NOT NULL COMMENT '险别净保费',
  `C_PRM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保费币种 Currency of Premium',
  `N_RI_AMT` decimal(20,2) NOT NULL COMMENT '原险别保额折人民币保额',
  `N_AMT_CHG_RATE` decimal(10,6) NOT NULL COMMENT '原保额币种兑人民币汇率',
  `N_RI_PRM` decimal(20,2) NOT NULL COMMENT '险别再保保费,保费合计 Premium',
  `C_RIPRM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保保费币种,保费币种 Currency of Premium,原保费币种是财务核算币种,则为原保费币种；如果不是财务核算币种，则转换为美元',
  `N_PRM_CHG_RATE` decimal(10,6) NOT NULL COMMENT '再保保费兑换汇率',
  `C_SPLIT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合并/拆散标志',
  `C_RISK_LVL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '风险等级代码',
  `N_RET_AMT` decimal(20,2) NOT NULL COMMENT '自留额(人民币),可能为风险等级对应自留额，也可能为承保调整自留额，单位为人民币',
  `N_CI_PRPT` decimal(10,6) DEFAULT NULL COMMENT '共保比例，自身占的比例',
  `C_PL_INS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '利损险标志,''0''否,''1''是',
  `C_MAIN_PLY_NO` varchar(50) DEFAULT NULL COMMENT '主险保单号,对利损险单而言',
  `T_EDR_BGN_TM` datetime DEFAULT NULL COMMENT '批改生效起期',
  `T_EDR_END_TM` datetime DEFAULT NULL COMMENT '批改生效止期',
  `C_EDR_RSN` varchar(30) DEFAULT NULL COMMENT '批改原因，注意，安邦是批改大类和批改原因组合才能唯一确定一类批改',
  `N_PLY_TMS` decimal(4,0) NOT NULL COMMENT '批单对应保单期别,记录保单或批单的缴费期次  对于保单，与期次N_TMS一致  对于批单，与期次N_TMS不一定相同',
  `N_PLY_SPLIT_SEQ` decimal(4,0) DEFAULT NULL COMMENT '批单对应保单拆分序号,默认相同',
  `N_AMT_VAR` decimal(20,2) NOT NULL COMMENT '批单险别保额变化,币种为原保额币种',
  `N_PRM_VAR` decimal(20,2) NOT NULL COMMENT '批单险别保费变化,币种为原保费币种',
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_RMB_AMT_VAR` decimal(20,2) NOT NULL COMMENT '批单险别保额变化折人民币保额变化',
  `N_RI_PRM_VAR` decimal(20,2) NOT NULL COMMENT '批单险别保费变化折再保币种的保费变化',
  `C_EQ_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否含地震险责任标志，''0''否,''1''是',
  `C_RETRO_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '不转分保标识,0=转分(默认),1=不转分保，标记临分分入业务是否转分保',
  `N_CI_AMT` decimal(20,2) DEFAULT NULL COMMENT '共保全单保额',
  `N_CI_PRM` decimal(20,2) DEFAULT NULL COMMENT '共保全单保费',
  `N_RI_CUR_AMT` decimal(20,2) DEFAULT NULL COMMENT '再保币种保额，对应V5再保保额',
  `N_RI_CUR_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '折再保币种保额变化,对应V5再保保额变化',
  `N_RI_CUR_AMT_RATE` decimal(10,6) DEFAULT NULL COMMENT '折再保币种保额汇率，原保额折再保币种保额汇率',
  `C_EDR_TYP` varchar(30) DEFAULT NULL COMMENT '批改大类,1 一般批改，2 注销和增减保，3退保 ，注意，安邦是批改大类和批改原因组合才能唯一确定一类批改',
  `N_ADD_RET_AMT` decimal(20,2) DEFAULT NULL COMMENT '附加自留额(人民币),为承保调整自留额，单位为人民币',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源,01=直销业务,02=代理业务,03=邮寄销售业务,04=网络销售业务,05=经纪业务,06=专业代理业务,07=个人代理,08=电话销售业务',
  `C_FAC_TO_FIN_MRK` varchar(1) DEFAULT NULL COMMENT '临分传财务标识,0-未传财务（默认）,1-已传财务,此标志用来区分临分账单是否传财务，由于临分确认后允许删除账单，并存在冲正，因此临分确认的单可能传财务或未传，再次传时处理依据此标志不同',
  `N_RI_UN_PRM` decimal(20,2) DEFAULT NULL COMMENT '未了责任保费，批单的分保计算用，如果是保单等于N_RI_PRM',
  `C_CVRG_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险别，现主要用于区分工程险中物质部分与三者部分',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL,
  `T_TRANS_TM` datetime DEFAULT NULL,
  `C_RESV_TXT_1` varchar(200) DEFAULT NULL COMMENT '永安：是否农银代理业务',
  `C_RESV_TXT_2` varchar(200) DEFAULT NULL COMMENT '永安 今年以后起保业务状态：0=未处理；1=已处理',
  `C_RESV_TXT_3` varchar(200) DEFAULT NULL COMMENT '文本预留字段3',
  `C_CVRG_CNM` varchar(100) DEFAULT NULL COMMENT '险别名称',
  `N_SI` decimal(20,2) NOT NULL COMMENT '保批单保额',
  `C_TGT_ZIP` varchar(6) DEFAULT NULL COMMENT '标的邮编',
  `C_AREA_CDE` varchar(30) DEFAULT NULL COMMENT '区域编码',
  `C_CTTP_TYP` varchar(3) DEFAULT NULL COMMENT '''巨灾类型，attp type-catastrophe type  F：（flood）洪水  E：（earthquake）地震  N：（non）主险''',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_C_PLYEDR_CVRG_DUE_ID` (`C_PLYEDRCVRGDUE_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='险别接口表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_due`
--

DROP TABLE IF EXISTS `web_ri_plyedr_due`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_due` (
  `C_PLYEDRDUE_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单PKID',
  `C_DOC_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '单证类型,''A'' 保单,''E'' 批单',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号 Policy No',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '批改序号,批改次数 Times of Endorsement',
  `N_TMS` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '分期序号,用来标识保额所在记录对于保单，与缴费期次一致对于批单，与缴费期次不一定相同',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_RBK_SEQ` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单申请单号',
  `C_INSRNT_CDE` varchar(30) DEFAULT NULL COMMENT '被保人代码',
  `C_INSRNT_NME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '被保人名称',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '保险起期 Policy Effective Date',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '保险止期 Policy Expire Date',
  `T_SIGN_TM` datetime NOT NULL COMMENT '签单日期',
  `T_UDR_TM` datetime NOT NULL COMMENT '核保日期 Underwrite Time',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码 Product Code',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构代码 Department No',
  `C_CAL_YM` varchar(7) DEFAULT NULL COMMENT '分出年月，分保计算时写入',
  `T_DUE_TM` datetime NOT NULL COMMENT '业务单挂账时间，业务写入，与财务接口表的挂账时间相同',
  `T_RIDUE_TM` datetime NOT NULL COMMENT '再保挂账时间，分出计算时间依据，缺省与业务单挂账时间相同，冲正单则不同',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '状态,A可分,B已分,C确认,D不计算,E错误,F 已更正',
  `C_INW_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '分入业务标志',
  `C_STOCK_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '股东业务标志',
  `C_SUB_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '补贴业务标志',
  `C_FAC_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '临分标志 Facultative Reinsurance Flag,''0''非临分,''1''临分',
  `C_CI_MRK` varchar(1) DEFAULT '0' COMMENT '共保方式,"0"=非共保业务,"1"=内部共保（我方主共）,"2"=内部共保（我方从共）,"3"=外部共保（我方主共）,"4"=外部共保（我方从共）',
  `C_INST_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'A' COMMENT '分期标志, A = 一般保单,B = 分期付款,C = 多年期（需要按自然年拆分）',
  `N_RI_PROP` decimal(10,6) DEFAULT '1.000000' COMMENT '再保份额,再保分出的份额比例，缺省为1',
  `N_AMT` decimal(20,2) NOT NULL COMMENT '保额合计 Amount Insured,原保额',
  `C_AMT_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保额币种 Currency of Amount {Code},原保额币种',
  `C_PRM_CED_WAY` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'G' COMMENT '保费分出方式,''G''毛保费,''N''净保费',
  `N_PRM` decimal(20,2) NOT NULL COMMENT '毛保费',
  `N_NET_PRM` decimal(20,2) NOT NULL COMMENT '净保费',
  `C_PRM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保费币种 Currency of Premium',
  `N_RI_AMT` decimal(20,2) NOT NULL COMMENT '原保额折人民币保额',
  `N_AMT_CHG_RATE` decimal(10,6) NOT NULL COMMENT '原保额币种兑人民币汇率',
  `N_RI_PRM` decimal(20,2) NOT NULL COMMENT '再保保费,保费合计 Premium',
  `C_RIPRM_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保保费币种,保费币种 Currency of Premium,原保费币种是财务核算币种,则为原保费币种；如果不是财务核算币种，则转换为美元',
  `N_PRM_CHG_RATE` decimal(10,6) NOT NULL COMMENT '再保保费兑换汇率',
  `C_SPLIT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合并/拆散标志',
  `C_RISK_LVL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '风险等级代码',
  `N_RET_AMT` decimal(20,2) NOT NULL COMMENT '自留额(人民币),可能为风险等级对应自留额，也可能为承保调整自留额，单位为人民币',
  `N_CI_PRPT` decimal(10,6) DEFAULT NULL COMMENT '共保比例，自身占的比例',
  `C_PL_INS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '利损险标志,''0''否,''1''是',
  `C_MAIN_PLY_NO` varchar(50) DEFAULT NULL COMMENT '主险保单号,对利损险单而言',
  `T_EDR_BGN_TM` datetime DEFAULT NULL COMMENT '批改生效起期',
  `T_EDR_END_TM` datetime DEFAULT NULL COMMENT '批改生效止期',
  `C_EDR_RSN` varchar(30) DEFAULT NULL COMMENT '批改原因，注意，安邦是批改大类和批改原因组合才能唯一确定一类批改',
  `N_PLY_TMS` decimal(4,0) NOT NULL COMMENT '批单对应保单期别,记录保单或批单的缴费期次对于保单，与期次N_TMS一致对于批单，与期次N_TMS不一定相同',
  `N_PLY_SPLIT_SEQ` decimal(4,0) DEFAULT NULL COMMENT '批单对应保单拆分序号,默认相同',
  `N_AMT_VAR` decimal(20,2) NOT NULL COMMENT '批单保额变化,币种为原保额币种',
  `N_PRM_VAR` decimal(20,2) NOT NULL COMMENT '批单保费变化,币种为原保费币种',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `N_RMB_AMT_VAR` decimal(20,2) NOT NULL COMMENT '批单保额变化折人民币保额变化',
  `N_RI_PRM_VAR` decimal(20,2) NOT NULL COMMENT '批单保费变化折再保币种的保费变化',
  `C_EQ_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否含地震险责任标志，''0''否,''1''是',
  `C_RETRO_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '不转分保标识,0=转分(默认),1=不转分保，标记临分分入业务是否转分保',
  `N_CI_AMT` decimal(20,2) DEFAULT NULL COMMENT '共保全单保额',
  `N_CI_PRM` decimal(20,2) DEFAULT NULL COMMENT '共保全单保费',
  `N_RI_CUR_AMT` decimal(20,2) DEFAULT NULL COMMENT '再保币种保额，对应V5再保保额',
  `N_RI_CUR_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '折再保币种保额变化,对应V5再保保额变化',
  `N_RI_CUR_AMT_RATE` decimal(10,6) DEFAULT NULL COMMENT '折再保币种保额汇率，原保额折再保币种保额汇率',
  `C_EDR_TYP` varchar(30) DEFAULT NULL COMMENT '批改大类,1 一般批改，2 注销和增减保，3退保 ，注意，安邦是批改大类和批改原因组合才能唯一确定一类批改',
  `N_ADD_RET_AMT` decimal(20,2) DEFAULT '0.00' COMMENT '附加自留额(人民币),为承保调整自留额，单位为人民币',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源: 19001=直销业务; 19002=代理业务;  19003=经纪业务;  19009=其他; 191=其它业务来源; 192=服务渠道',
  `C_FAC_TO_FIN_MRK` varchar(1) DEFAULT '0' COMMENT '临分传财务标识,0-未传财务（默认）,1-已传财务,此标志用来区分临分账单是否传财务，由于临分确认后允许删除账单，并存在冲正，因此临分确认的单可能传财务或未传，再次传时处理依据此标志不同',
  `N_RI_UN_PRM` decimal(20,2) DEFAULT NULL COMMENT '未了责任保费，批单的分保计算用，如果是保单等于N_RI_PRM',
  `C_CVRG_NO` varchar(6) DEFAULT NULL COMMENT '险别，现主要用于区分工程险中物质部分与三者部分',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间 ',
  `C_RESV_TXT_1` varchar(200) DEFAULT NULL COMMENT '永安：是否农银代理业务',
  `C_RESV_TXT_2` varchar(200) DEFAULT NULL COMMENT '永安 今年以后起保业务状态：0=未处理；1=已处理',
  `C_RESV_TXT_3` varchar(200) DEFAULT NULL COMMENT '文本预留字段3',
  `N_ORG_PREM` decimal(15,2) DEFAULT NULL COMMENT '  原保费',
  `C_AREA_CDE` varchar(30) DEFAULT NULL COMMENT '区域编码',
  `C_SLS_CDE` varchar(30) DEFAULT NULL COMMENT '业务员',
  `C_LONG_TERM_MRK` varchar(1) DEFAULT NULL COMMENT '长短期标志： 短期：0  一年期 ：1  长期 ：2 ',
  `C_ZIP_CDE` varchar(6) DEFAULT NULL COMMENT '邮编',
  `C_SPECIAL_AGREEMENT` text COMMENT '特别约定--华海需求',
  `T_PAY_TM` datetime DEFAULT NULL COMMENT '缴费时间',
  `C_CITY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '市',
  `C_PROVINCE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '省',
  `C_GRP_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '团单标志(0 个单; 1 团单) Group Insurance Flag',
  `T_RIBUS_DUE_TM` date DEFAULT NULL,
  `N_VAT` decimal(20,2) DEFAULT NULL COMMENT '直保的税',
  `N_PRICE` decimal(20,2) DEFAULT NULL COMMENT '直保的价',
  `N_VAT_VAR` decimal(20,2) DEFAULT NULL COMMENT '直保的税变化量',
  `N_PRICE_VAR` decimal(20,2) DEFAULT NULL COMMENT '直保的价变化量',
  `C_USAGE_CDE` varchar(30) DEFAULT NULL,
  `N_RI_VAT` decimal(20,2) DEFAULT NULL COMMENT '再保的税',
  `N_RI_VAT_VAR` decimal(20,2) DEFAULT NULL COMMENT '再保的税变化量',
  `N_RI_PRICE_VAR` decimal(20,2) DEFAULT NULL COMMENT '再保的价变化量',
  `C_DUTY_FREE_MRK` varchar(1) DEFAULT NULL,
  `N_RI_PRICE` decimal(20,2) DEFAULT NULL COMMENT '再保价',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `C_TGT_ADDR` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '标的地址',
  `C_DDUCT_DESC` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '免赔说明',
  `C_UNFIX_SPC` varchar(3999) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '特别约定',
  `C_EDR_CTNT` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '批文',
  `LIKE_JSON_PARAMS` varchar(3999) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '类似于KEY1=VALUE1##KEY2=VALUE2的参数',
  UNIQUE KEY `PK_WEB_RI_PLYEDR_DUE` (`C_PLYEDRDUE_PK_ID`),
  KEY `IDX_RI_PLYEDR_DUE_C_APP_NO` (`C_APP_NO`),
  KEY `IDX_RI_PLYEDR_DUE_C_PLY_NO` (`C_PLY_NO`,`N_EDR_PRJ_NO`),
  KEY `IDX_RI_PLYEDR_DUE_N_PLY_TMS` (`N_PLY_TMS`),
  KEY `IDX_RI_PLYEDR_DUE_N_RBK_SEQ` (`N_RBK_SEQ`),
  KEY `IDX_RI_PLYEDR_DUE_N_SPLIT_SEQ` (`N_SPLIT_SEQ`),
  KEY `IDX_RI_PLYEDR_DUE_N_TMS` (`N_TMS`),
  KEY `IDX_APPNO_SEQNO_TMS` (`C_APP_NO`,`N_SPLIT_SEQ`,`N_PLY_TMS`),
  KEY `IDX_PLYNO_EDRPRJNO_SEQNO_TMS` (`C_PLY_NO`,`N_EDR_PRJ_NO`,`N_SPLIT_SEQ`,`N_PLY_TMS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保批单业务处理接口表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_inwd`
--

DROP TABLE IF EXISTS `web_ri_plyedr_inwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_inwd` (
  `C_PLYEDR_INWD_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '批改申请单号',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号 Policy No',
  `N_EDR_PRJ_NO` decimal(6,0) NOT NULL DEFAULT '0' COMMENT '批改次数 Times of Endorsement',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号',
  `C_INWD_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '临时分入类型',
  `C_PRJ_NME` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `C_CLAUSE` text COMMENT '使用条款',
  `C_ORIG_PLY_NO` varchar(50) DEFAULT NULL COMMENT '原保险保单号',
  `T_ORIG_INSRNC_BGN_TM` datetime NOT NULL COMMENT '原保单保险起期',
  `T_ORIG_INSRNC_END_TM` datetime NOT NULL COMMENT '原保单保险止期',
  `C_ORIG_INSR_CDE` varchar(30) DEFAULT NULL COMMENT '原保险保险人',
  `C_CED_COM_CDE` varchar(30) DEFAULT NULL COMMENT '分出公司',
  `C_CED_COM_ASSO_NME` varchar(30) DEFAULT NULL COMMENT '分出公司联系人人名',
  `C_ORIG_CED_COM_NME` varchar(30) DEFAULT NULL COMMENT '记录原分出公司名称',
  `C_RI_BRK_NO` varchar(30) DEFAULT NULL COMMENT '再保经纪人',
  `C_INWD_BIZ_SRC` varchar(30) DEFAULT NULL COMMENT '分入业务来源',
  `C_INWD_DATE` datetime DEFAULT NULL COMMENT '分入日期',
  `C_ORIG_CUR_CDE` varchar(30) DEFAULT NULL COMMENT '原保险币种',
  `C_INWD_CUR_CDE` varchar(30) DEFAULT NULL COMMENT '分入币种',
  `N_EXCH_RATE` decimal(10,6) DEFAULT NULL COMMENT '兑换率',
  `N_ORIG_AMT` decimal(20,2) DEFAULT NULL COMMENT '原保险保额',
  `N_ORIG_RATE` decimal(10,6) DEFAULT NULL COMMENT '原保险费率',
  `N_INWD_RATE` decimal(10,6) DEFAULT NULL COMMENT '分入费率',
  `N_ORIG_PRM` decimal(20,2) DEFAULT NULL COMMENT '原保险保费',
  `N_CED_COM_SHARE_RATIO` decimal(10,6) DEFAULT NULL COMMENT '分出公司所占份额',
  `N_CED_COM_AMT` decimal(20,2) DEFAULT NULL COMMENT '分出公司所占保额',
  `N_OWN_SHARE_RATIO` decimal(10,6) DEFAULT NULL COMMENT '我司份额（signed）',
  `N_OWN_AMT` decimal(20,2) DEFAULT NULL COMMENT '我司保额',
  `N_OWN_GR_PRM` decimal(20,2) DEFAULT NULL COMMENT '我司毛保费',
  `N_OWN_NT_PRM` decimal(20,2) DEFAULT NULL COMMENT '我司净保费',
  `N_INWD_COMM_RATE` decimal(10,6) DEFAULT NULL COMMENT '分保手续费比例（signed）',
  `N_INWD_COMM` decimal(20,2) DEFAULT NULL COMMENT '分保手续费',
  `N_INWD_TAX_RATE` decimal(10,6) DEFAULT NULL COMMENT '税率',
  `N_INWD_TAX` decimal(20,2) DEFAULT NULL COMMENT '税金',
  `C_INWD_TAX_MRK` varchar(1) DEFAULT NULL COMMENT '是否含税',
  `N_INWD_TAX_AMT` decimal(20,2) DEFAULT NULL COMMENT '应缴税额',
  `N_INWD_ELSE_FEE_RATE` decimal(10,6) DEFAULT NULL COMMENT '其它费用所占比例',
  `N_INWD_ELSE_FEE` decimal(20,2) DEFAULT NULL COMMENT '其它费用所占金额',
  `C_JURI_CDE` varchar(30) DEFAULT NULL COMMENT '司法管辖',
  `C_LOS_REC` text COMMENT '损失纪录',
  `C_RI_CL` text COMMENT '再保条件/条款',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `N_OWN_GR_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '我司毛保费变化量',
  `N_INWD_COMM_VAR` decimal(20,2) DEFAULT NULL COMMENT '分保手续费变化量',
  `N_INWD_TAX_AMT_VAR` decimal(20,2) DEFAULT NULL COMMENT '应缴税额变化量',
  `N_INWD_ELSE_FEE_VAR` decimal(20,2) DEFAULT NULL COMMENT '其它费用所占金额变化量',
  `C_INWD_BRKR_MRK` varchar(1) DEFAULT NULL COMMENT '是否含经纪费',
  `C_PROVINCE` varchar(30) DEFAULT NULL COMMENT '省',
  `C_CITY` varchar(30) DEFAULT NULL COMMENT '市',
  `N_ORIG_VAT` decimal(20,2) DEFAULT NULL COMMENT '原保单税金额',
  `N_ORIG_PRICE` decimal(20,2) DEFAULT NULL COMMENT '原保单价金额',
  `N_ORIG_VAT_VAR` decimal(20,2) DEFAULT NULL COMMENT '原保单税变化量',
  `N_ORIG_PRICE_VAR` decimal(20,2) DEFAULT NULL COMMENT '原保单价变化量',
  `N_OWN_VAT` decimal(20,2) DEFAULT NULL COMMENT '我司税金额',
  `N_OWN_PRICE` decimal(20,2) DEFAULT NULL COMMENT '我司价金额',
  `N_OWN_VAT_VAR` decimal(20,2) DEFAULT NULL COMMENT '我司税变化量',
  `N_OWN_PRICE_VAR` decimal(20,2) DEFAULT NULL COMMENT '我司价变化量',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_PLYEDR_INWD` (`C_PLYEDR_INWD_PK_ID`),
  KEY `IDX_RI_PLYEDR_INWD_C_PLY_NO` (`C_PLY_NO`,`N_EDR_PRJ_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分入业务信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_open_cover`
--

DROP TABLE IF EXISTS `web_ri_plyedr_open_cover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_open_cover` (
  `C_OPENCOVER_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '预约分保PKID',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号 Policy No',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '拆分序号,标的风险单位拆分的序号',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单申请单号',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `C_CONT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约标识号',
  `C_CAL_WAY` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '计算方式,''1''指定比例，''2''指定分出额',
  `N_CONT_PRPT` decimal(15,10) NOT NULL COMMENT '分出比例',
  `N_CONT_AMT` decimal(20,2) NOT NULL COMMENT '分出金额',
  `N_COMM_PRPT` decimal(10,6) NOT NULL COMMENT '手续费比例',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `C_AMT_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保额币种',
  `N_RI_AMT` decimal(20,2) NOT NULL COMMENT '折人民币金额',
  `N_SEQ_NO` decimal(6,0) NOT NULL COMMENT '序号,预约合约优先级',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='核保及再保数据维护均可插入预约分保合约';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_pay`
--

DROP TABLE IF EXISTS `web_ri_plyedr_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_pay` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '申请单号',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号',
  `N_EDR_PRJ_NO` decimal(6,0) NOT NULL DEFAULT '0' COMMENT '批改次数',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号',
  `N_TMS` decimal(6,0) NOT NULL DEFAULT '1' COMMENT '期别',
  `T_PAY_BGN_TM` datetime DEFAULT NULL COMMENT '缴费起始日期',
  `T_PAY_END_TM` datetime DEFAULT NULL COMMENT '缴费截止日期',
  `C_CUR` varchar(30) DEFAULT NULL COMMENT '币种',
  `N_PRM` decimal(20,2) DEFAULT NULL COMMENT '保费',
  `N_PRM_VAR` decimal(20,2) DEFAULT NULL COMMENT '保费变化',
  `N_RI_UN_PRM` decimal(20,2) DEFAULT NULL COMMENT '未了责任保费，批单的分保计算用，如果是保单等于N_PRM',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_DI_Prm` decimal(20,2) DEFAULT NULL COMMENT '直保分出保费',
  `N_DI_Prm_Var` decimal(20,2) DEFAULT NULL COMMENT '直保分出保费变化量',
  `N_DI_Un_Prm` decimal(20,2) DEFAULT NULL COMMENT '直保未了责任保费',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_RI_PLYEDR_PAY` (`C_PK_ID`),
  UNIQUE KEY `UI_RI_PLYEDR_PAY` (`C_PLY_NO`,`N_EDR_PRJ_NO`,`N_TMS`,`N_SPLIT_SEQ`),
  KEY `IDX_RIPLYEDRPAY_APPNO` (`C_APP_NO`),
  KEY `IDX_RIPLYEDRPAY_PLYNO` (`C_PLY_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='再保保批单缴费计划';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_relat`
--

DROP TABLE IF EXISTS `web_ri_plyedr_relat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_relat` (
  `C_PLYEDRRELAT_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单关系PKID',
  `C_PLY_NO_OLD` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '原保单号 Policy No',
  `N_EDR_PRJ_NO_OLD` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '原批改序号,批改次数 Times of Endorsement,默认为0，目前只处理保单合并拆分',
  `N_SPLIT_SEQ_OLD` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '原拆分序号,标的风险单位拆分的序号',
  `C_RELAT_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '合并/拆散关系0 = 合并(默认) 1 = 拆分',
  `C_PLY_NO_NEW` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '新主保单号 Policy No',
  `N_EDR_PRJ_NO_NEW` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '新批改序号,批改次数 Times of Endorsement,默认为0，目前只处理保单合并拆分',
  `N_SPLIT_SEQ_NEW` decimal(4,0) NOT NULL DEFAULT '1' COMMENT '新拆分序号,标的风险单位拆分的序号',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_PLYEDR_RELAT` (`C_PLYEDRRELAT_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保批单风险单位拆分或合并单之间的关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_ret_adj`
--

DROP TABLE IF EXISTS `web_ri_plyedr_ret_adj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_ret_adj` (
  `C_RET_ADJ_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_APP_NO` varchar(50) DEFAULT NULL COMMENT '投保单号或批改申请单号',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号',
  `N_SPLIT_SEQ` decimal(4,0) NOT NULL COMMENT '拆分序号,标的风险单位拆分的序号',
  `N_BEF_ADJ_RET` decimal(20,2) DEFAULT NULL,
  `N_AFT_ADJ_RET` decimal(20,2) DEFAULT NULL,
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_plyedr_spec`
--

DROP TABLE IF EXISTS `web_ri_plyedr_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_plyedr_spec` (
  `C_PLYEDR_SPEC_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保批单差异信息PKID',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '保单号 Policy No',
  `N_EDR_PRJ_NO` decimal(4,0) NOT NULL DEFAULT '0' COMMENT '批改序号,批改次数 Times of Endorsement',
  `C_KIND_NO` varchar(2) DEFAULT NULL COMMENT '产品大类',
  `C_PROD_NO` varchar(30) DEFAULT NULL COMMENT '产品代码',
  `N_VOYAGE` decimal(6,0) DEFAULT NULL COMMENT '航程 (货运险),Voyage',
  `T_DEF_BGN_TM` datetime DEFAULT NULL COMMENT '开始日期(加保保证期)工程险',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '开始日期(加保保证期)工程险',
  `C_JRD` varchar(100) DEFAULT NULL COMMENT '司法管辖 (责任险,工程险),Jurisdiction',
  `N_LOSS_LMT` decimal(20,2) DEFAULT NULL COMMENT '赔偿限额(责任险),Limit of Indemnity',
  `N_AOA` decimal(20,2) DEFAULT NULL COMMENT '每次责任限额(产品责任险),a.o.a.',
  `N_ADD_LMT` decimal(20,2) DEFAULT NULL COMMENT '累计责任限额(产品责任险),In Aggregate',
  `N_ANN_TUR` decimal(20,2) DEFAULT NULL COMMENT '年销售额(产品责任险),Annual Turnover',
  `C_RETR` varchar(100) DEFAULT NULL COMMENT '追溯期说明(产品责任险),Retroactive Date',
  `C_ARE_TYPE` varchar(30) DEFAULT NULL COMMENT '区域类型(产品责任险、工程险)包括（国内,国内不含港澳，国外不含美加，美加，全球）,Geographical Limit',
  `N_ESTI_ANN` decimal(20,2) DEFAULT NULL COMMENT '预估工资(雇主责任险) ,Estimated Annual',
  `N_EMP_NUM` decimal(6,0) DEFAULT NULL COMMENT '雇员数(雇主责任险)',
  `C_EMP_NMES` varchar(30) DEFAULT NULL COMMENT '雇员(雇主责任险)',
  `C_VESS_NME` varchar(100) DEFAULT NULL COMMENT '运输工具名称(货运险),Name of vessel',
  `C_YARD` varchar(100) DEFAULT NULL COMMENT '建造厂(建造险),',
  `C_BUILD_YEAR` varchar(4) DEFAULT NULL COMMENT '建造年份 (货运险),Year of Build',
  `C_BOAT_OWNER` varchar(30) DEFAULT NULL COMMENT '船东 (货运险，建造险) ,Interest',
  `C_TERRITORY` varchar(100) DEFAULT NULL COMMENT '工程地址（工程险）',
  `C_COVERAGE_FORM` varchar(30) DEFAULT NULL COMMENT '责任范围（产品责任险）',
  `N_WAGEROLL` decimal(10,2) DEFAULT NULL COMMENT '薪酬（雇主责任险）',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_PLYEDR_SPEC` (`C_PLYEDR_SPEC_PK_ID`),
  KEY `IDX_RI_PLYEDR_SPEC_C_PLY_NO` (`C_PLY_NO`,`N_EDR_PRJ_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保批单差异信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_prd_kind`
--

DROP TABLE IF EXISTS `web_ri_prd_kind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_prd_kind` (
  `C_RIKIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '大类代码',
  `C_RIKIND_CNM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '大类名称',
  `C_RIKIND_ENM` varchar(50) DEFAULT NULL COMMENT '大类英文名',
  `C_RIBS_CLS` varchar(1) DEFAULT NULL COMMENT '再保业务类型,''0''非水险，''1''''水险，''2''车险，''3''人身险，''4''高风险，''9''其它杂险',
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '有效状态,''0''失效,''1''有效',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_PRD_KIND` (`C_RIKIND_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='再保险类，再保产品大类，有别与承保理赔的产品大类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_prd_kind_prod_rel`
--

DROP TABLE IF EXISTS `web_ri_prd_kind_prod_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_prd_kind_prod_rel` (
  `C_KPREL_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `C_RIKIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '大类代码',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码',
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '有效状态,''0''失效,''1''有效',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `C_NME_CN` varchar(50) DEFAULT NULL COMMENT '产品中文名',
  UNIQUE KEY `PK_WEB_RI_PRD_KIND_PROD_REL` (`C_KPREL_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='再保险类与产品关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_prod_trans_set`
--

DROP TABLE IF EXISTS `web_ri_prod_trans_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_prod_trans_set` (
  `C_PROD_TRANS_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调整PKID',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码 Product Code',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标志,''0''实时不转入(默认),''1''手工不转入',
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '有效状态,''0''失效,''1''有效',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录不实时转入的产品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_rpt_acum`
--

DROP TABLE IF EXISTS `web_ri_rpt_acum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_rpt_acum` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_RPT_TYP` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报表类型 s：区间报  p：时点报',
  `C_RIKIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保险类编码',
  `C_AREA_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '区域编码',
  `N_AMT` decimal(20,6) NOT NULL COMMENT '险别保额',
  `C_CTTP_TYP` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '巨灾类型，attp type-catastrophe type  F：（flood）洪水  E：（earthquake）地震  N：（non）主险',
  `C_CONT_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约ID',
  `N_RISK_NUM` decimal(20,0) NOT NULL COMMENT '风险单位数量',
  `N_CONT_AMT` decimal(20,6) NOT NULL COMMENT '合同责任累积',
  `T_COUNT_TM` datetime DEFAULT NULL COMMENT '统计时间',
  `T_CRT_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_AMT_ACUM` decimal(20,6) DEFAULT NULL COMMENT '当前累积(险别自留额)',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_C_RPT_ACUM_ID` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='风险累积报';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_rpt_acum_ctrl`
--

DROP TABLE IF EXISTS `web_ri_rpt_acum_ctrl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_rpt_acum_ctrl` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标识号',
  `C_RIKIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '险类',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品编码',
  `C_AREA_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '区域编码',
  `C_CITY_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '地市县编码',
  `C_CTTP_TYP` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '巨灾类型，attp type-catastrophe type  F：（flood）洪水  E：（earthquake）地震  N：（non）主险',
  `N_AMT_LMT` decimal(20,6) NOT NULL COMMENT '设置累积限额',
  `N_AMT_ACUM` decimal(20,6) NOT NULL COMMENT '累积责任额',
  `N_AMT_LOSE` decimal(20,6) NOT NULL COMMENT '剩余累积责任额',
  `T_CRT_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_BGN_TM` datetime NOT NULL COMMENT '生效起期',
  `T_END_TM` datetime NOT NULL COMMENT '生效止期',
  `C_ZIP_CDE` varchar(6) DEFAULT NULL COMMENT '邮编',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='风险累积限额控制报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_rpt_acum_pnt_sc_ctrl`
--

DROP TABLE IF EXISTS `web_ri_rpt_acum_pnt_sc_ctrl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_rpt_acum_pnt_sc_ctrl` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_RIKIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保险类编码',
  `C_AREA_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '区域编码',
  `N_AMT` decimal(20,6) NOT NULL COMMENT '险别保额',
  `N_AMT_LMT` decimal(20,6) NOT NULL COMMENT '设置累积限额',
  `N_AMT_ACUM` decimal(20,6) NOT NULL COMMENT '累积责任额',
  `T_COUNT_TM` datetime DEFAULT NULL COMMENT '统计时间',
  `T_CRT_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CTTP_TYP` varchar(3) DEFAULT NULL COMMENT '巨灾类型，attp type-catastrophe type  F：（flood）洪水  E：（earthquake）地震  N：（non）主险',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_C_RPT_ACUM_PNT_SC_CTRL_ID` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='风险累积子险时点控制报';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_rpt_insrnt_acum_ctrl`
--

DROP TABLE IF EXISTS `web_ri_rpt_insrnt_acum_ctrl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_rpt_insrnt_acum_ctrl` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品编码',
  `C_INSRNT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '被保人编码',
  `C_INSRNT_NME` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '被保人姓名',
  `N_AMT_LMT` decimal(20,6) NOT NULL COMMENT '设置累积限额',
  `N_AMT_ACUM` decimal(20,6) NOT NULL COMMENT '被保人累积责任额',
  `N_AMT_LOSE` decimal(20,6) NOT NULL COMMENT '被保人剩余累积责任额',
  `T_CRT_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_BGN_TM` datetime NOT NULL COMMENT '生效起期',
  `T_END_TM` datetime NOT NULL COMMENT '生效止期',
  `C_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标识号',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='被保人累积限额控制报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_section_code`
--

DROP TABLE IF EXISTS `web_ri_section_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_section_code` (
  `C_SEC_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'SECTION ID',
  `C_SEC_CNM` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'SECTION名称',
  `C_SEC_ENM` varchar(100) DEFAULT NULL COMMENT 'SECTION英文名',
  `C_SEC_DESC` varchar(200) DEFAULT NULL COMMENT 'SECTION描述',
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '有效状态,''0''失效,''1''有效',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_SECTION_CODE` (`C_SEC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_sett_dtl`
--

DROP TABLE IF EXISTS `web_ri_sett_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_sett_dtl` (
  `C_SETT_DTL_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '对外账单明细PKID',
  `C_SETT_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '结算单号',
  `C_BILL_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '月账单编号',
  `N_TMS` decimal(4,0) NOT NULL COMMENT '期次',
  `C_DOC_FLAG` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '单据标识：1 分出保费2 分出摊回分保费用3 分出摊回分保赔款4 分出现金赔款5 分出存入分保准备金6 分出分保准备金利息',
  `C_CONT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '合约代码',
  `N_FEE_AMT` decimal(20,2) NOT NULL COMMENT '费用金额',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `C_PROVINCE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '省',
  `C_CITY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '市',
  `C_BILL_TYP` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_USAGE_CDE` varchar(30) DEFAULT NULL,
  `C_FEETYP_CDE` varchar(30) DEFAULT NULL COMMENT '费用类型',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_SETT_DTL` (`C_SETT_DTL_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算明细表，生成结算单时同时写入，对结算单主表按合约代码单据标识细分，结算单号、单据标识、产品为业务联合主键，单据标识是费用类型的分类财务要求对外账单不到产品和机构';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_sett_main`
--

DROP TABLE IF EXISTS `web_ri_sett_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_sett_main` (
  `C_SETT_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '结算单号',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保人',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '结算单状态,''1''未确认（默认）,''2''已确认''3''已复核,''4''已传财务,''5''已实收',
  `C_FEE_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '费用币种',
  `N_FEE_AMT` decimal(20,2) NOT NULL COMMENT '费用金额',
  `C_SETT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '结算人',
  `T_SETT_TM` datetime NOT NULL COMMENT '结算日期',
  `C_CONFIRM_CDE` varchar(30) DEFAULT NULL COMMENT '结算确认人',
  `T_CONFIRM_TM` datetime DEFAULT NULL COMMENT '结算确认日期',
  `C_CHECK_CDE` varchar(30) DEFAULT NULL COMMENT '结算复核人',
  `T_CHECK_TM` datetime DEFAULT NULL COMMENT '结算复核日期',
  `C_RP_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '收付标识，0=未收付(默认),1=已收付。',
  `N_RP_AMT` decimal(20,2) DEFAULT NULL COMMENT '收付总金额',
  `C_RP_CUR` varchar(30) DEFAULT NULL COMMENT '收付币种',
  `T_RP_TM` datetime DEFAULT NULL COMMENT '收付日期',
  `T_PAID_TM` datetime DEFAULT NULL COMMENT '收付复核日期',
  `N_PAID_AMT` decimal(20,2) DEFAULT NULL COMMENT '复核总金额',
  `C_DUE_CUR` varchar(30) DEFAULT NULL COMMENT '挂账币种',
  `N_DUE_AMT` decimal(20,2) DEFAULT NULL COMMENT '挂账金额',
  `T_DUE_TM` datetime DEFAULT NULL COMMENT '挂账日期',
  `C_DUE_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否已挂账：0未挂账（默认）；1已挂账。',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `N_BILL_DUNNING_DAYS` decimal(6,0) DEFAULT NULL COMMENT '账单缴费期限',
  `C_ACC_CDE` varchar(50) DEFAULT NULL COMMENT '账户编码',
  `C_ACCNT_NO` varchar(100) DEFAULT NULL COMMENT '收款人银行账号',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_SETT_MAIN` (`C_SETT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算表，生成结算单时写入。为多个对外账单的金额汇总。结算单号是主键';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_share_bill`
--

DROP TABLE IF EXISTS `web_ri_share_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_share_bill` (
  `C_SHARE_BILL_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '汇总账单PKID',
  `C_BILL_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账单类型,分出合同帐单                          AO：正常帐单                          BO：现金赔款帐单                          RBO：冲抵现金赔款分出临分帐单                          FPO：临分保单帐单                          FEO：临分批单帐单                          FCO：临分赔款帐单临分超赔帐单                          FXPO：临分保单分保费帐单                          FXEO：临分批单保费调整账单                          FXCO：临分摊回赔款帐单                          FXRO：临分保费恢复账单分入合同账单                          IAO：正常分入账单                          IBO：现金赔款分入帐单分入临分账单                          IPO：分入保单账单                          IEO：分入批单账单                          ICO：分入赔案账单合约超赔帐单                          XPO：预付分保费账单                          XCO：超赔摊回帐单                          XRO：保费恢复账单                          XAO：保费调整账单合同核算账单                          S：合同核算账单超赔分入合约账单          IXPO：预付分保费账单                          IXCO：超赔摊回帐单                          IXRO：保费恢复账单                          IXAO：保费调整账单',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '账单状态,''1''预估账单(未确认),''2''已确认(正式账单),''3''已结算(已结算账单)',
  `C_BILLPRD_TYPE` varchar(7) DEFAULT NULL COMMENT '账单期类型M-月S-季H-半年Y-年',
  `C_BILL_PRD` varchar(7) DEFAULT NULL COMMENT '账单期M-月:M1-M12S-季:Q1-Q4H-半年:H1-H2Y-年:Y1',
  `C_BILL_YEAR` varchar(4) DEFAULT NULL COMMENT '账单年',
  `C_BILL_MONTH` varchar(2) DEFAULT NULL COMMENT '账单月',
  `C_PROD_NO` varchar(6) DEFAULT NULL COMMENT '产品代码 Product Code',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '机构代码 Department No,默认保险总公司',
  `C_RI_COM` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保公司',
  `C_BRKR_MRK` varchar(1) DEFAULT '0' COMMENT '是否经纪公司,''0'',''1''',
  `C_RI_BRKR` varchar(30) DEFAULT NULL COMMENT '合约中的经纪公司或再保公司',
  `C_CONT_CDE` varchar(30) DEFAULT NULL COMMENT '合约代码',
  `C_CONT_ID` varchar(50) DEFAULT NULL COMMENT '合约标识号',
  `C_FEE_CUR` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '费用币种',
  `C_FEETYP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '费用类型',
  `N_FEE_AMT` decimal(20,2) NOT NULL COMMENT '费用金额',
  `C_UW_YEAR` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务年',
  `C_UW_MONTH` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务月',
  `N_LAYER` decimal(4,0) DEFAULT NULL COMMENT '层数',
  `N_TMS` decimal(4,0) DEFAULT '1' COMMENT '付款期次,超赔预付分保费账单分期、临分超赔分保费账单分期、临分分保费账单分期用',
  `C_PLY_NO` varchar(50) DEFAULT NULL COMMENT '保单号 Policy No',
  `N_EDR_CLM_TMS` decimal(4,0) DEFAULT '0' COMMENT '批改序号、赔付次数--浙商作废',
  `C_DOC_NO` varchar(50) DEFAULT NULL COMMENT '单证号,保单号，批单号，赔案号跟单账单才有--浙商作废',
  `N_SPLIT_SEQ` decimal(4,0) DEFAULT '1' COMMENT '拆分序号,标的风险单位拆分的序号跟单账才有',
  `C_SETT_NO` varchar(50) DEFAULT NULL COMMENT '结算单号，账单结算后回写',
  `C_INNER_BILL_NO` varchar(200) DEFAULT NULL COMMENT '月对内账单号',
  `C_YOUR_DOC_NO` varchar(50) DEFAULT NULL COMMENT '单证号,保单号，批单号，赔案号，账单号等，分入账单用',
  `T_YOUR_TM` datetime DEFAULT NULL COMMENT '对方制单日期，分入账单用',
  `N_SHARE_PRPT` decimal(10,6) DEFAULT '0.000000' COMMENT '参与比例，分入账单、现金赔款账单用',
  `C_INSRNT_NME` varchar(100) DEFAULT NULL COMMENT '被保人名称，现金赔款账单用',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '保险起期 Policy Effective Date，现金赔款账单用',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '保险止期 Policy Expire Date，现金赔款账单用',
  `T_ACCDNT_TM` datetime DEFAULT NULL COMMENT '出险日期，现金赔款账单用',
  `C_ACCDNT_CAUS_CDE` varchar(30) DEFAULT NULL COMMENT '出险原因代码，现金赔款账单用',
  `C_PLACE_LOSS` varchar(100) DEFAULT NULL COMMENT '出险地点，现金赔款账单用',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `C_ORI_CUR` varchar(30) DEFAULT NULL COMMENT '原币种',
  `N_BILL_CHG_RATE` decimal(10,6) DEFAULT NULL COMMENT '再保币种兑换汇率',
  `C_BILL_NO` varchar(200) DEFAULT NULL COMMENT '季对外账单编号',
  `T_BILL_TM` datetime DEFAULT NULL COMMENT '帐单日期,账单确认日期',
  `C_CONFIRM_CDE` varchar(30) DEFAULT NULL COMMENT '账单确认人',
  `C_TO_FIN_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '传财务标识,0-未传财务（默认）,1-已传财务',
  `T_TO_FIN_TM` datetime DEFAULT NULL COMMENT '传财务日期',
  `C_TO_FIN_CDE` varchar(30) DEFAULT NULL COMMENT '传财务人',
  `C_SEPE_MRK` varchar(1) DEFAULT '0' COMMENT '分期账单标识,''0''否，''1''是',
  `C_DOC_FLAG` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '单据标识：1 分出保费2 分出摊回分保费用3 分出摊回分保赔款4 分出现金赔款5 分出存入分保准备金6 分出分保准备金利息',
  `C_OFFSET_MRK` varchar(1) DEFAULT '0' COMMENT '是否冲销标识,0=未冲销（默认）,1=已冲销,-1=冲销单,现金赔款冲销账单用',
  `C_OUTBILL_MRK` varchar(1) DEFAULT '0' COMMENT '对外账标识,该数据是否生成对外账单，0-否（默认），1-是',
  `C_EVENT_ID` varchar(30) DEFAULT NULL COMMENT '事故超赔标识号，用来区分不同事故超赔，存的是第三级巨灾代码，唯一标识一个事故，事故超赔账单用',
  `N_BILL_ELSE_AMT` decimal(20,2) DEFAULT NULL COMMENT '账单其它金额,现金赔款账单存总赔款，各类分期账单存合并分期后的总账单余额',
  `C_CED_TYP` varchar(1) DEFAULT NULL COMMENT '分出类型,A 正常或者成数部分分出，B 溢额合约或者混合合约的溢额部分分出,C 临分超赔,D 类地震溢额分出,Z 其他，目前只用到合约账单区分成数和溢额，',
  `C_BSNS_TYP` varchar(10) DEFAULT NULL COMMENT '业务来源,01=直销业务,02=代理业务,03=邮寄销售业务,04=网络销售业务,05=经纪业务,06=专业代理业务,07=个人代理,08=电话销售业务',
  `N_RBK_SEQ` decimal(4,0) DEFAULT '0' COMMENT '冲正序号,计算冲正的序号，0为有效单，+n为冲正原单，-n为冲正负单',
  `C_CVRG_NO` varchar(6) DEFAULT NULL COMMENT '险别，现主要用于区分工程险中物质部分与三者部分',
  `N_INWD_TOL_FEE_AMT` decimal(20,2) DEFAULT NULL COMMENT '分入账单总费用金额',
  `C_PRE_MRK` varchar(1) DEFAULT NULL COMMENT '分入账单：账单类型标志，0=正式账单  1=预估账单',
  `C_RIKIND_NO` varchar(2) DEFAULT NULL COMMENT '分入账单：再保险类',
  `C_PROTOCOL_MRK` varchar(1) DEFAULT NULL COMMENT '预估/实际账单标识 0：正式 1：预估 2：冲抵',
  `C_OFFSET_NO` varchar(50) DEFAULT NULL COMMENT '红冲流水号',
  `N_EDR_PRJ_NO` decimal(4,0) DEFAULT '0' COMMENT '批改次数',
  `T_PAY_BGN_TM` datetime DEFAULT NULL COMMENT '付款起期',
  `T_PAY_END_TM` datetime DEFAULT NULL COMMENT '付款止期',
  `C_EDR_NO` varchar(50) DEFAULT NULL COMMENT '批单号',
  `C_CLM_NO` varchar(50) DEFAULT NULL COMMENT '赔案号',
  `N_CLM_TMS` decimal(4,0) DEFAULT '1' COMMENT '赔付次数',
  `C_DOC_TYP` varchar(1) DEFAULT NULL COMMENT '单据类型：保单P、批单E、赔款C',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `C_PAY_YM` varchar(6) DEFAULT NULL COMMENT '分期缴费年月',
  `C_CITY` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '市',
  `C_PROVINCE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '省',
  `T_RIBUS_DUE_TM` date DEFAULT NULL,
  `C_BILL_TM` varchar(9) DEFAULT NULL,
  `C_BUSI_SOURCE` varchar(1) DEFAULT NULL,
  `C_GRP_MRK` varchar(1) DEFAULT NULL COMMENT '团单标志( 0 个单; 1 团单)',
  `C_LONG_TERM_MRK` varchar(1) DEFAULT NULL COMMENT '长短期标志： 短期：0  一年期 ：1  长期 ：2 ',
  `C_USAGE_CDE` varchar(30) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  `C_BILL_QUARTER` varchar(2) DEFAULT NULL COMMENT '账单季',
  `C_FIN_CED_NO` varchar(200) DEFAULT NULL COMMENT '收付挂账单号',
  `C_SEC_ID` varchar(30) DEFAULT NULL COMMENT ' section ID',
  `C_ATTRIB` varchar(1) DEFAULT NULL COMMENT '公司属性,''A''境内,''B''境外',
  UNIQUE KEY `PK_WEB_RI_SHARE_BILL` (`C_SHARE_BILL_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='比例合约试出账时或月末关账时汇总分出明细数据写入该表，其它账单实时写入，包括预估账单，账单确认后变为正式账单。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_task`
--

DROP TABLE IF EXISTS `web_ri_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_task` (
  `C_TASK_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务ID',
  `C_TASK_TYPE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务类型,B = 出帐单 ,C = 计算,R = 报表',
  `C_SUBMIT_USER` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '提交用户',
  `T_SUBMIT_TM` datetime NOT NULL COMMENT '提交时间',
  `C_STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态,W = 等待执行,R = 正在执行,F = 执行完毕,D = 删除,E = 执行失败',
  `C_IS_ONLINE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否在线任务',
  `N_PRIORITY` decimal(4,0) NOT NULL DEFAULT '10' COMMENT '优先级',
  `T_EXEC_TM` datetime DEFAULT NULL COMMENT '执行时间',
  `T_FINISH_TM` datetime DEFAULT NULL COMMENT '完成时间',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RI_TASK` (`C_TASK_PK_ID`),
  KEY `PK_WEB_RI_STATUS` (`C_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调度任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_undr_opn`
--

DROP TABLE IF EXISTS `web_ri_undr_opn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_undr_opn` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_TYP` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_APP_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '投保单号',
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UNDR_TM` datetime NOT NULL,
  `C_UNDR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_UNDR_CNM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '核保人名称',
  `C_UNDR_OPN` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '核保意见',
  `C_UNDR_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '核保决定标志 ( A 通过 D 拒保 R 上报 3 退回修改 0 自核退回 1 自核上报 2 自核通过)',
  `C_PLY_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '保单号',
  `C_EDR_NO` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '批单号',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_OPN_STS` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '暂存0,非暂存1',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '  迁移时间',
  `C_ANTI_LNDER_RISK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '反洗钱风险:0 低, 1 中, 2 高(泰山项目组新增)',
  `C_IS_SHOW` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '0 否 1 是',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_PLY_UNDROPN` (`C_PK_ID`),
  KEY `IDX_UNDROPN_APPNO` (`C_APP_NO`),
  KEY `IDX_UNDROPN_PLYNO` (`C_PLY_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录核保过程的核保意见信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ws_rp`
--

DROP TABLE IF EXISTS `web_ri_ws_rp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ws_rp` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_WS_XML_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报文ID',
  `C_RP_CDE` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '返回结果类型：1 成功；0 失败',
  `C_ERR_CDE` varchar(30) DEFAULT NULL COMMENT '错误类型',
  `C_METHOD_NM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '方法名称',
  `C_RP_XML` text COMMENT '返回的报文',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='返回报文表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_ri_ws_rq`
--

DROP TABLE IF EXISTS `web_ri_ws_rq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_ri_ws_rq` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_WS_XML_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报文ID',
  `C_METHOD_NM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '方法名称',
  `C_RQ_XML` text COMMENT '接收到的报文',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接收报文表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_risk_acum_set`
--

DROP TABLE IF EXISTS `web_risk_acum_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_risk_acum_set` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_RIKIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保险类编码',
  `C_AREA_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '区域编码',
  `C_CTTP_TYP` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '巨灾类型，attp type-catastrophe type  F：（flood）洪水  E：（earthquake）地震  N：（non）主险',
  `N_AMT_LMT` decimal(20,6) NOT NULL COMMENT '设置累积限额',
  `T_BGN_TM` datetime NOT NULL COMMENT '生效止期',
  `T_END_TM` datetime NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CITY_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '地市县编码',
  `C_PROD_NO` varchar(6) DEFAULT NULL COMMENT '险种',
  `C_ID` varchar(30) DEFAULT NULL COMMENT '标识号',
  `C_ZIP_CDE` varchar(6) DEFAULT NULL COMMENT '邮编',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_C_RISK_ACUM_SET_ID` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='风险累积限额设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_risk_area`
--

DROP TABLE IF EXISTS `web_risk_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_risk_area` (
  `C_BLOCK_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '风险区域代码',
  `C_RISK_KIND_NO` varchar(2) DEFAULT NULL COMMENT '风险大类',
  `C_ELEMENT1` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `C_ELEMENT2` varchar(100) DEFAULT NULL COMMENT '国家',
  `C_ELEMENT3` varchar(100) DEFAULT NULL COMMENT '省',
  `C_ELEMENT4` varchar(100) DEFAULT NULL COMMENT '市',
  `C_ELEMENT5` varchar(100) DEFAULT NULL COMMENT '对应地区名',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RISK_AREA` (`C_BLOCK_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='风险累计_风险区域设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_risk_biz_code`
--

DROP TABLE IF EXISTS `web_risk_biz_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_risk_biz_code` (
  `C_RISK_BIZ_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务类别PKID',
  `C_RISK_BIZ_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务类别代码',
  `C_RISK_BIZ_CNM` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务类别中文名称',
  `C_RISK_BIZ_ENM` varchar(80) DEFAULT NULL COMMENT '业务类别英文名称',
  `C_RIKIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '再保险类',
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '有效状态,''0''失效,''1''有效',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间,删除操作时间',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RISK_BIZ_CODE` (`C_RISK_BIZ_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='风险业务类别代码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_risk_cum_dtl`
--

DROP TABLE IF EXISTS `web_risk_cum_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_risk_cum_dtl` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_PROD_NO` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码',
  `C_RISK_LVL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '风险等级代码',
  `C_BLOCK_NO` varchar(30) DEFAULT NULL COMMENT '风险区域号',
  `N_CUM_AMT` decimal(20,2) DEFAULT NULL COMMENT '累计金额',
  `N_LIMT_AMT` decimal(20,2) DEFAULT NULL COMMENT '初始化时从限额表拿出',
  `C_BGN_TM` varchar(10) DEFAULT NULL COMMENT '初始化时从限额表拿出',
  `C_END_TM` varchar(10) DEFAULT NULL COMMENT '初始化时从限额表拿出',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RISK_CUM_DTL` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_risk_cum_history`
--

DROP TABLE IF EXISTS `web_risk_cum_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_risk_cum_history` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_PLY_NO` varchar(30) DEFAULT NULL COMMENT '保单号',
  `C_EDR_NO` varchar(30) DEFAULT NULL COMMENT '批单号',
  `C_PROD_NO` varchar(6) DEFAULT NULL COMMENT '产品编码',
  `C_RISK_LVL_CDE` varchar(30) DEFAULT NULL COMMENT '风险等级代码',
  `C_APP_NME` varchar(50) DEFAULT NULL COMMENT '投保人名称',
  `C_DPT_CDE` varchar(30) DEFAULT NULL COMMENT '承保机构',
  `T_INSRNC_BGN_TM` datetime DEFAULT NULL COMMENT '保险起期',
  `T_INSRNC_END_TM` datetime DEFAULT NULL COMMENT '保险止期',
  `N_AMT` decimal(20,2) DEFAULT NULL COMMENT '保额',
  `N_EML` decimal(20,2) DEFAULT NULL COMMENT 'EML',
  `N_KEEP_AMT` decimal(20,2) DEFAULT NULL COMMENT '自留额',
  `C_BLOCK_NO` varchar(30) DEFAULT NULL COMMENT '风险区域代码',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RISK_CUM_HISTORY` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='累计数据的历史记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_risk_kind`
--

DROP TABLE IF EXISTS `web_risk_kind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_risk_kind` (
  `C_RISK_KIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '风险大类',
  `C_NME_CN` varchar(100) DEFAULT NULL COMMENT '中文名称',
  `C_NME_EN` varchar(100) DEFAULT NULL COMMENT '英文名称',
  `T_EFFC_TM` datetime DEFAULT NULL COMMENT '生效日期',
  `T_EXPD_TM` datetime DEFAULT NULL COMMENT '失效日期',
  `C_MEMO` text,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RISK_KIND` (`C_RISK_KIND_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_risk_lim_dtl`
--

DROP TABLE IF EXISTS `web_risk_lim_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_risk_lim_dtl` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_RISK_KIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '风险大类',
  `C_RISK_LVL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '风险等级代码',
  `N_LIMT_AMT` decimal(20,2) DEFAULT NULL COMMENT '限额值',
  `C_BGN_TM` varchar(10) DEFAULT NULL COMMENT '生效日期',
  `C_END_TM` varchar(10) DEFAULT NULL COMMENT '失效日期',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RISK_LIM_DTL` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_risk_lvl_cde`
--

DROP TABLE IF EXISTS `web_risk_lvl_cde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_risk_lvl_cde` (
  `C_RISK_LVL_CDE` varchar(30) DEFAULT NULL COMMENT '风险等级代码',
  `C_RISK_LVL_CNM` varchar(200) DEFAULT NULL COMMENT '风险等级中文名称',
  `C_RISK_LVL_ENM` varchar(100) DEFAULT NULL COMMENT '风险等级英文名称',
  `C_RISK_LVL_DESC` text COMMENT '风险等级描述',
  `C_RIKIND_NO` varchar(2) DEFAULT NULL COMMENT '再保险类',
  `C_IS_VALID` varchar(1) DEFAULT NULL COMMENT '有效状态,''0''失效,''1''有效',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间,删除操作时间',
  `T_CRT_TM` datetime DEFAULT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) DEFAULT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime DEFAULT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) DEFAULT NULL COMMENT '修改人员',
  `C_RISK_BIZ_CDE` varchar(30) DEFAULT NULL COMMENT '业务类别',
  `C_LVL_CDE` varchar(2) DEFAULT NULL COMMENT '级别',
  `T_EFFC_TM` datetime DEFAULT NULL COMMENT '有效起期',
  `T_EXPD_TM` datetime DEFAULT NULL COMMENT '有效止期',
  `C_TRANS_MRK` varchar(1) DEFAULT NULL COMMENT '迁移标志',
  `T_TRANS_TM` datetime DEFAULT NULL COMMENT '迁移时间',
  `C_PK_ID` varchar(50) DEFAULT NULL COMMENT '主键',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_PK_ID_1` (`C_PK_ID`),
  UNIQUE KEY `PK_WEB_RISK_LVL_CDE` (`C_RISK_LVL_CDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_risk_lvl_prd_rel`
--

DROP TABLE IF EXISTS `web_risk_lvl_prd_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_risk_lvl_prd_rel` (
  `C_LVLPRDREL_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_PROD_NO` varchar(6) DEFAULT NULL COMMENT '产品代码',
  `C_RIKIND_NO` varchar(2) DEFAULT NULL COMMENT '再保险类',
  `C_RISK_LVL_CDE` varchar(30) DEFAULT NULL COMMENT '风险等级代码',
  `C_FLD_ID_1` varchar(8) DEFAULT NULL COMMENT '风险等级要素1ID',
  `C_FLD_CNM_1` varchar(50) DEFAULT NULL COMMENT '风险等级要素1名称',
  `C_FLD_SRC_1` varchar(30) DEFAULT NULL COMMENT '风险等级要素1数据源',
  `C_FLD_VAL_1` varchar(30) DEFAULT NULL COMMENT '风险等级要素1值',
  `C_FLD_ID_2` varchar(8) DEFAULT NULL COMMENT '风险等级要素2ID',
  `C_FLD_CNM_2` varchar(50) DEFAULT NULL COMMENT '风险等级要素2名称',
  `C_FLD_SRC_2` varchar(30) DEFAULT NULL COMMENT '风险等级要素2数据源',
  `C_FLD_VAL_2` varchar(30) DEFAULT NULL COMMENT '风险等级要素2值',
  `C_FLD_ID_3` varchar(8) DEFAULT NULL COMMENT '风险等级要素3ID',
  `C_FLD_CNM_3` varchar(50) DEFAULT NULL COMMENT '风险等级要素3名称',
  `C_FLD_SRC_3` varchar(30) DEFAULT NULL COMMENT '风险等级要素3数据源',
  `C_FLD_VAL_3` varchar(30) DEFAULT NULL COMMENT '风险等级要素3值',
  `C_FLD_ID_4` varchar(8) DEFAULT NULL COMMENT '风险等级要素4ID',
  `C_FLD_CNM_4` varchar(50) DEFAULT NULL COMMENT '风险等级要素4名称',
  `C_FLD_SRC_4` varchar(30) DEFAULT NULL COMMENT '风险等级要素4数据源',
  `C_FLD_VAL_4` varchar(30) DEFAULT NULL COMMENT '风险等级要素4值',
  `C_FLD_ID_5` varchar(8) DEFAULT NULL COMMENT '风险等级要素5ID',
  `C_FLD_CNM_5` varchar(50) DEFAULT NULL COMMENT '风险等级要素5名称',
  `C_FLD_SRC_5` varchar(30) DEFAULT NULL COMMENT '风险等级要素5数据源',
  `C_FLD_VAL_5` varchar(30) DEFAULT NULL COMMENT '风险等级要素5值',
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '有效状态,''0''失效,''1''有效',
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '失效时间,删除操作时间',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'USER' COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'USER' COMMENT '修改人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RISK_LVL_PRD_REL` (`C_LVLPRDREL_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_risk_lvl_ret`
--

DROP TABLE IF EXISTS `web_risk_lvl_ret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_risk_lvl_ret` (
  `C_RISKLVLRET_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `C_RISK_LVL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '风险等级代码',
  `N_RET_AMT` decimal(20,2) NOT NULL COMMENT '自留额',
  `N_MIN_RET_RTE` decimal(10,6) DEFAULT NULL COMMENT '最小自留比率,自留额*最小自留比率，用以控制核保人下调自留额的幅度',
  `N_MAX_RET_RTE` decimal(10,6) DEFAULT NULL COMMENT '最大自留比率,自留额*最大自留比率，用以控制核保人上调自留额的幅度',
  `N_MAX_TRE_AMT` decimal(20,2) DEFAULT NULL COMMENT '合约分出限额',
  `N_MAX_FAC_AMT` decimal(20,2) NOT NULL COMMENT '最大临分限额,用以判断临分的起点',
  `T_BGN_TM` datetime NOT NULL COMMENT '有效起期',
  `T_END_TM` datetime NOT NULL COMMENT '有效止期',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RISK_LVL_RET` (`C_RISKLVLRET_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保留风险等级的自留额等限额值的设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_risk_max_ret`
--

DROP TABLE IF EXISTS `web_risk_max_ret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_risk_max_ret` (
  `C_MAXRET_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'PKID',
  `N_CAPITAL` decimal(20,2) NOT NULL COMMENT '公司实有资本金[人民币]',
  `N_PROV_FUND` decimal(20,2) NOT NULL COMMENT '公司公积金[人民币]',
  `N_MAX_RET_AMT` decimal(20,2) NOT NULL COMMENT '危险单位最大自留保额[人民币]',
  `N_RET_PRM` decimal(20,2) DEFAULT NULL COMMENT '当年自留保费[人民币]',
  `T_BGN_TM` datetime NOT NULL COMMENT '有效起期',
  `T_END_TM` datetime NOT NULL COMMENT '有效止期',
  `T_CRT_TM` datetime NOT NULL COMMENT '建立时间',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '建立人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人代码',
  `C_NEW_FLAG` varchar(1) DEFAULT NULL COMMENT '最新标志（1：为最新标志，0为旧标志）',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RISK_MAX_RET` (`C_MAXRET_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司最大自留额设置《保险法》第九十九条规定：“经营财产保险业务的保险公司当年自留保险费，不得超过其实有资本金加公积金总和的四倍。”第一百条规定 ：“保险公司对每一危险单位，即对一次保险事故可能造成的最大损失范围所承担的责任，不得超过其实有资本金加公积金总各的百分之十；超过的部分应当办理再保险。”';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_risk_relation`
--

DROP TABLE IF EXISTS `web_risk_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_risk_relation` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `C_RISK_KIND_NO` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '风险大类代码',
  `C_RISK_LVL_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '风险等级代码',
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品代码',
  `N_CUM_COUNT` decimal(4,0) DEFAULT NULL COMMENT '累计要素个数',
  `C_CUM_COL1` varchar(30) DEFAULT NULL COMMENT '累计要素一',
  `C_CUM_COL1_NAME` varchar(50) DEFAULT NULL COMMENT '累计要素一名称',
  `C_CUM_COL2` varchar(30) DEFAULT NULL COMMENT '累计要素二',
  `C_CUM_COL2_NAME` varchar(50) DEFAULT NULL COMMENT '累计要素二名称',
  `C_CUM_COL3` varchar(100) DEFAULT NULL COMMENT '累计要素三',
  `C_CUM_COL3_NAME` varchar(50) DEFAULT NULL COMMENT '累计要素三名称',
  `C_CUM_COL4` varchar(100) DEFAULT NULL COMMENT '累计要素四',
  `C_CUM_COL4_NAME` varchar(50) DEFAULT NULL COMMENT '累计要素四名称',
  `C_CUM_COL5` varchar(100) DEFAULT NULL COMMENT '累计要素五',
  `C_CUM_COL5_NAME` varchar(50) DEFAULT NULL COMMENT '累计要素五名称',
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人员',
  `T_CRT_TM` datetime NOT NULL COMMENT '创建时间',
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人员',
  `T_UPD_TM` datetime NOT NULL COMMENT '修改时间',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_RISK_RELATION` (`C_PK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置累计限额信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_sys_seriano`
--

DROP TABLE IF EXISTS `web_sys_seriano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_sys_seriano` (
  `C_VCH_TYP` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PROD_NO` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_YEAR` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `N_SERIANO` decimal(10,0) DEFAULT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_TRANS_TM` datetime DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_SYS_SERIANO` (`C_VCH_TYP`,`C_DPT_CDE`,`C_PROD_NO`,`C_YEAR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_sys_seriano_recycle`
--

DROP TABLE IF EXISTS `web_sys_seriano_recycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_sys_seriano_recycle` (
  `c_pk_id` varchar(50) COLLATE utf8_bin NOT NULL,
  `c_biz_no` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `c_prod_no` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `c_dpt_cde` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `c_year` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `c_biz_type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_sys_skin`
--

DROP TABLE IF EXISTS `web_sys_skin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_sys_skin` (
  `C_SKIN_ID` varchar(50) DEFAULT NULL,
  `C_SKIN_CNM` varchar(200) DEFAULT NULL,
  `C_SKIN_PATH` text,
  `C_SKIN_STATUS` varchar(1) DEFAULT NULL,
  `N_SKIN_ORDER` bigint(22) DEFAULT NULL,
  `C_TRANS_MRK` varchar(1) DEFAULT NULL,
  `T_TRANS_TM` datetime DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_WEB_SYS_SKIN` (`C_SKIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_sys_sta_dict`
--

DROP TABLE IF EXISTS `web_sys_sta_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_sys_sta_dict` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PAR_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PAR_CNM` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  分类名称',
  `C_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CNM` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  中文名称',
  `C_MAP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '*' COMMENT '  映射码，外部代码，可能根据不同的保险公司需要进行调整,*号表示仅供查看的静态字典',
  `C_MAP_NME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  映射名称',
  `C_RESV_1` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RESV_2` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_RESV_3` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_REMARK` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  备注',
  `C_IS_VALID` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_ADB_TM` datetime DEFAULT NULL COMMENT '  失效时间',
  `C_ENM` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '  英文名称',
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_TRANS_TM` datetime DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_SYS_STA_DICT` (`C_PK_ID`),
  UNIQUE KEY `IDX_UNI_SYS_STA_DICT` (`C_PAR_CDE`,`C_CDE`,`C_MAP_CDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_undr_dty`
--

DROP TABLE IF EXISTS `web_undr_dty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_undr_dty` (
  `C_PK_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_EMP_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_PROD_NO` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_DUTY_STRT_TM` datetime NOT NULL,
  `T_DUTY_END_TM` datetime DEFAULT NULL,
  `C_UNDR_CLS_CDE` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `C_CRT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_CRT_TM` datetime NOT NULL,
  `C_UPD_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T_UPD_TM` datetime NOT NULL,
  `C_REL_DPT_CDE` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `C_TRANS_MRK` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `T_TRANS_TM` datetime DEFAULT NULL,
  `C_UNDR_CLS_SHOW_CDE` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '核保人显示级别',
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳',
  UNIQUE KEY `PK_UNDR_DTY` (`C_PK_ID`),
  UNIQUE KEY `IDX_U_UNDR_DTY` (`C_EMP_CDE`,`C_PROD_NO`,`C_DPT_CDE`,`C_UNDR_CLS_CDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zj_bank_topclass`
--

DROP TABLE IF EXISTS `zj_bank_topclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zj_bank_topclass` (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `DIRECTCODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BANKNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `MEMO` text CHARACTER SET utf8 COLLATE utf8_bin,
  `STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ISDEFAULT` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BANKTYPE` varchar(5) DEFAULT NULL,
  `T_MODIFY_TM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间戳'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `v_cont_cnm`
--

/*!50001 DROP TABLE IF EXISTS `v_cont_cnm`*/;
/*!50001 DROP VIEW IF EXISTS `v_cont_cnm`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `v_cont_cnm` AS select `m`.`C_CONT_CDE` AS `c_cont_cde`,`m`.`C_CONT_ID` AS `c_cont_id`,`cod`.`C_CONT_ENM` AS `c_cont_enm`,(case `m`.`C_CONT_ID` when 'OC201301' then 'Special Motor Quota Share Reinsurance Treaty' when 'OC201302' then 'Personal Accident Insurance（Debtor）Surplus Open Cover' else `cod`.`C_CONT_ENM` end) AS `cont` from (`web_ri_cont_code` `cod` join `web_ri_cont_main` `m`) where (`m`.`C_CONT_CDE` = `cod`.`C_CONT_CDE`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_app_cargo`
--

/*!50001 DROP TABLE IF EXISTS `web_app_cargo`*/;
/*!50001 DROP VIEW IF EXISTS `web_app_cargo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_app_cargo` AS select `sync_comm`.`web_app_cargo`.`C_APP_NO` AS `C_APP_NO`,`sync_comm`.`web_app_cargo`.`C_CRGO_CDE` AS `C_CRGO_CDE`,`sync_comm`.`web_app_cargo`.`C_ENG_NME` AS `C_ENG_NME`,`sync_comm`.`web_app_cargo`.`C_TRANS_TOOL` AS `C_TRANS_TOOL`,`sync_comm`.`web_app_cargo`.`C_INVC_NO` AS `C_INVC_NO`,`sync_comm`.`web_app_cargo`.`C_PICK_NO` AS `C_PICK_NO`,`sync_comm`.`web_app_cargo`.`C_CARRIAGE_CDE` AS `C_CARRIAGE_CDE`,`sync_comm`.`web_app_cargo`.`C_SAIL_NO` AS `C_SAIL_NO`,`sync_comm`.`web_app_cargo`.`C_FROM_PRT` AS `C_FROM_PRT`,`sync_comm`.`web_app_cargo`.`C_TO_PRT` AS `C_TO_PRT`,`sync_comm`.`web_app_cargo`.`C_PASS_PRT` AS `C_PASS_PRT`,`sync_comm`.`web_app_cargo`.`C_CERT_MRK` AS `C_CERT_MRK`,`sync_comm`.`web_app_cargo`.`C_CERT_NO` AS `C_CERT_NO`,`sync_comm`.`web_app_cargo`.`C_PRN_FRM` AS `C_PRN_FRM`,`sync_comm`.`web_app_cargo`.`C_SHIP_NME` AS `C_SHIP_NME`,`sync_comm`.`web_app_cargo`.`C_VSL_LVL_CDE` AS `C_VSL_LVL_CDE`,`sync_comm`.`web_app_cargo`.`C_SHIP_NAT` AS `C_SHIP_NAT`,`sync_comm`.`web_app_cargo`.`C_SHIP_AGE` AS `C_SHIP_AGE`,`sync_comm`.`web_app_cargo`.`C_WATER_LINE` AS `C_WATER_LINE`,`sync_comm`.`web_app_cargo`.`C_TRA_MRK` AS `C_TRA_MRK`,`sync_comm`.`web_app_cargo`.`C_TRA_INFO` AS `C_TRA_INFO`,`sync_comm`.`web_app_cargo`.`C_CHECKER_CDE` AS `C_CHECKER_CDE`,`sync_comm`.`web_app_cargo`.`C_CHECK_ADDR` AS `C_CHECK_ADDR`,`sync_comm`.`web_app_cargo`.`C_FRM_PRT_ARA` AS `C_FRM_PRT_ARA`,`sync_comm`.`web_app_cargo`.`C_TO_PRT_ARA` AS `C_TO_PRT_ARA`,`sync_comm`.`web_app_cargo`.`C_TRAN_TOOL` AS `C_TRAN_TOOL`,`sync_comm`.`web_app_cargo`.`C_NO_TEXT` AS `C_NO_TEXT`,`sync_comm`.`web_app_cargo`.`C_PRN_FORM` AS `C_PRN_FORM`,`sync_comm`.`web_app_cargo`.`T_ARRIVE_DATE` AS `T_ARRIVE_DATE`,`sync_comm`.`web_app_cargo`.`C_SRVY_NME` AS `C_SRVY_NME`,`sync_comm`.`web_app_cargo`.`C_PAY_ADDR` AS `C_PAY_ADDR`,`sync_comm`.`web_app_cargo`.`N_INV_AMT` AS `N_INV_AMT`,`sync_comm`.`web_app_cargo`.`C_INV_CUR` AS `C_INV_CUR`,`sync_comm`.`web_app_cargo`.`N_ADD_QUOT` AS `N_ADD_QUOT`,`sync_comm`.`web_app_cargo`.`N_EXC_RATE` AS `N_EXC_RATE`,`sync_comm`.`web_app_cargo`.`N_RATE` AS `N_RATE`,`sync_comm`.`web_app_cargo`.`N_AMT` AS `N_AMT`,`sync_comm`.`web_app_cargo`.`C_AMT_CUR` AS `C_AMT_CUR`,`sync_comm`.`web_app_cargo`.`N_PRM` AS `N_PRM`,`sync_comm`.`web_app_cargo`.`C_PRM_CUR` AS `C_PRM_CUR`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_1` AS `C_RESV_TXT_1`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_2` AS `C_RESV_TXT_2`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_3` AS `C_RESV_TXT_3`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_4` AS `C_RESV_TXT_4`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_5` AS `C_RESV_TXT_5`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_6` AS `C_RESV_TXT_6`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_7` AS `C_RESV_TXT_7`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_8` AS `C_RESV_TXT_8`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_9` AS `C_RESV_TXT_9`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_10` AS `C_RESV_TXT_10`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_11` AS `C_RESV_TXT_11`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_12` AS `C_RESV_TXT_12`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_13` AS `C_RESV_TXT_13`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_14` AS `C_RESV_TXT_14`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_15` AS `C_RESV_TXT_15`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_16` AS `C_RESV_TXT_16`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_17` AS `C_RESV_TXT_17`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_18` AS `C_RESV_TXT_18`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_19` AS `C_RESV_TXT_19`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_20` AS `C_RESV_TXT_20`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_1` AS `N_RESV_NUM_1`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_2` AS `N_RESV_NUM_2`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_3` AS `N_RESV_NUM_3`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_4` AS `N_RESV_NUM_4`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_5` AS `N_RESV_NUM_5`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_6` AS `N_RESV_NUM_6`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_7` AS `N_RESV_NUM_7`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_8` AS `N_RESV_NUM_8`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_9` AS `N_RESV_NUM_9`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_10` AS `N_RESV_NUM_10`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_11` AS `N_RESV_NUM_11`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_12` AS `N_RESV_NUM_12`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_13` AS `N_RESV_NUM_13`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_14` AS `N_RESV_NUM_14`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_15` AS `N_RESV_NUM_15`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_16` AS `N_RESV_NUM_16`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_17` AS `N_RESV_NUM_17`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_18` AS `N_RESV_NUM_18`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_19` AS `N_RESV_NUM_19`,`sync_comm`.`web_app_cargo`.`N_RESV_NUM_20` AS `N_RESV_NUM_20`,`sync_comm`.`web_app_cargo`.`T_RESV_TM_2` AS `T_RESV_TM_2`,`sync_comm`.`web_app_cargo`.`T_RESV_TM_3` AS `T_RESV_TM_3`,`sync_comm`.`web_app_cargo`.`T_RESV_TM_4` AS `T_RESV_TM_4`,`sync_comm`.`web_app_cargo`.`T_RESV_TM_5` AS `T_RESV_TM_5`,`sync_comm`.`web_app_cargo`.`T_RESV_TM_6` AS `T_RESV_TM_6`,`sync_comm`.`web_app_cargo`.`T_RESV_TM_7` AS `T_RESV_TM_7`,`sync_comm`.`web_app_cargo`.`T_RESV_TM_8` AS `T_RESV_TM_8`,`sync_comm`.`web_app_cargo`.`T_RESV_TM_9` AS `T_RESV_TM_9`,`sync_comm`.`web_app_cargo`.`T_RESV_TM_10` AS `T_RESV_TM_10`,`sync_comm`.`web_app_cargo`.`T_RESV_TM_1` AS `T_RESV_TM_1`,`sync_comm`.`web_app_cargo`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_app_cargo`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_app_cargo`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_app_cargo`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_app_cargo`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_app_cargo`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_app_cargo`.`C_LTXT_FLD_1` AS `C_LTXT_FLD_1`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_21` AS `C_RESV_TXT_21`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_22` AS `C_RESV_TXT_22`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_23` AS `C_RESV_TXT_23`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_24` AS `C_RESV_TXT_24`,`sync_comm`.`web_app_cargo`.`T_MODIFY_TM` AS `T_MODIFY_TM`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_25` AS `C_RESV_TXT_25`,`sync_comm`.`web_app_cargo`.`C_RESV_TXT_26` AS `C_RESV_TXT_26` from `sync_comm`.`web_app_cargo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_app_cargo_list`
--

/*!50001 DROP TABLE IF EXISTS `web_app_cargo_list`*/;
/*!50001 DROP VIEW IF EXISTS `web_app_cargo_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_app_cargo_list` AS select `sync_comm`.`web_app_cargo_list`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_app_cargo_list`.`C_APP_NO` AS `C_APP_NO`,`sync_comm`.`web_app_cargo_list`.`C_ROW_ID` AS `C_ROW_ID`,`sync_comm`.`web_app_cargo_list`.`N_SEQ_NO` AS `N_SEQ_NO`,`sync_comm`.`web_app_cargo_list`.`C_MARKS_NO` AS `C_MARKS_NO`,`sync_comm`.`web_app_cargo_list`.`C_DESC_GOD` AS `C_DESC_GOD`,`sync_comm`.`web_app_cargo_list`.`C_QTY` AS `C_QTY`,`sync_comm`.`web_app_cargo_list`.`C_PACK` AS `C_PACK`,`sync_comm`.`web_app_cargo_list`.`C_WEIT` AS `C_WEIT`,`sync_comm`.`web_app_cargo_list`.`C_RESV_TXT_1` AS `C_RESV_TXT_1`,`sync_comm`.`web_app_cargo_list`.`C_RESV_TXT_2` AS `C_RESV_TXT_2`,`sync_comm`.`web_app_cargo_list`.`C_RESV_TXT_3` AS `C_RESV_TXT_3`,`sync_comm`.`web_app_cargo_list`.`C_RESV_TXT_4` AS `C_RESV_TXT_4`,`sync_comm`.`web_app_cargo_list`.`N_RESV_NUM_1` AS `N_RESV_NUM_1`,`sync_comm`.`web_app_cargo_list`.`N_RESV_NUM_2` AS `N_RESV_NUM_2`,`sync_comm`.`web_app_cargo_list`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_app_cargo_list`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_app_cargo_list`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_app_cargo_list`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_app_cargo_list`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_app_cargo_list`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_app_cargo_list`.`C_RESV_TXT_5` AS `C_RESV_TXT_5`,`sync_comm`.`web_app_cargo_list`.`C_RESV_TXT_6` AS `C_RESV_TXT_6`,`sync_comm`.`web_app_cargo_list`.`T_STARTGO_TM` AS `T_STARTGO_TM`,`sync_comm`.`web_app_cargo_list`.`T_RESV_TM1` AS `T_RESV_TM1`,`sync_comm`.`web_app_cargo_list`.`C_TRA_INFO` AS `C_TRA_INFO`,`sync_comm`.`web_app_cargo_list`.`C_PACKAGE_FIRST_TYP` AS `C_PACKAGE_FIRST_TYP`,`sync_comm`.`web_app_cargo_list`.`C_PACKAGE_SECOND_TYP` AS `C_PACKAGE_SECOND_TYP`,`sync_comm`.`web_app_cargo_list`.`C_GOODS_FIRST_TYP` AS `C_GOODS_FIRST_TYP`,`sync_comm`.`web_app_cargo_list`.`C_GOODS_SECOND_TYP` AS `C_GOODS_SECOND_TYP`,`sync_comm`.`web_app_cargo_list`.`T_MODIFY_TM` AS `T_MODIFY_TM`,`sync_comm`.`web_app_cargo_list`.`C_RESV_TXT_7` AS `C_RESV_TXT_7`,`sync_comm`.`web_app_cargo_list`.`C_RESV_TXT_8` AS `C_RESV_TXT_8` from `sync_comm`.`web_app_cargo_list` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_app_ent_tgt_obj`
--

/*!50001 DROP TABLE IF EXISTS `web_app_ent_tgt_obj`*/;
/*!50001 DROP VIEW IF EXISTS `web_app_ent_tgt_obj`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_app_ent_tgt_obj` AS select `sync_comm`.`web_app_ent_tgt_obj`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_app_ent_tgt_obj`.`C_APP_NO` AS `C_APP_NO`,`sync_comm`.`web_app_ent_tgt_obj`.`C_ROW_ID` AS `C_ROW_ID`,`sync_comm`.`web_app_ent_tgt_obj`.`N_SEQ_NO` AS `N_SEQ_NO`,`sync_comm`.`web_app_ent_tgt_obj`.`C_PRJ_TYP` AS `C_PRJ_TYP`,`sync_comm`.`web_app_ent_tgt_obj`.`C_PRJ_NME` AS `C_PRJ_NME`,`sync_comm`.`web_app_ent_tgt_obj`.`C_TGT_QTY` AS `C_TGT_QTY`,`sync_comm`.`web_app_ent_tgt_obj`.`C_AMT_DETERMINE_METHOD_CDE` AS `C_AMT_DETERMINE_METHOD_CDE`,`sync_comm`.`web_app_ent_tgt_obj`.`C_CUR_TYP` AS `C_CUR_TYP`,`sync_comm`.`web_app_ent_tgt_obj`.`N_AMT` AS `N_AMT`,`sync_comm`.`web_app_ent_tgt_obj`.`N_RATE` AS `N_RATE`,`sync_comm`.`web_app_ent_tgt_obj`.`N_PRM` AS `N_PRM`,`sync_comm`.`web_app_ent_tgt_obj`.`N_TGT_NO` AS `N_TGT_NO`,`sync_comm`.`web_app_ent_tgt_obj`.`C_DDUCT_DESC` AS `C_DDUCT_DESC`,`sync_comm`.`web_app_ent_tgt_obj`.`C_CANCEL_MARK` AS `C_CANCEL_MARK`,`sync_comm`.`web_app_ent_tgt_obj`.`C_TGT_OBJ_TXT_FLD_1` AS `C_TGT_OBJ_TXT_FLD_1`,`sync_comm`.`web_app_ent_tgt_obj`.`T_TGT_OBJ_TM_FLD_1` AS `T_TGT_OBJ_TM_FLD_1`,`sync_comm`.`web_app_ent_tgt_obj`.`N_TGT_OBJ_NUM_FLD_1` AS `N_TGT_OBJ_NUM_FLD_1`,`sync_comm`.`web_app_ent_tgt_obj`.`L_TGT_OBJ_LTXT_FLD_1` AS `L_TGT_OBJ_LTXT_FLD_1`,`sync_comm`.`web_app_ent_tgt_obj`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_app_ent_tgt_obj`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_app_ent_tgt_obj`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_app_ent_tgt_obj`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_app_ent_tgt_obj`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_app_ent_tgt_obj`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_app_ent_tgt_obj`.`C_TGT_OBJ_TXT_FLD_2` AS `C_TGT_OBJ_TXT_FLD_2`,`sync_comm`.`web_app_ent_tgt_obj`.`C_TGT_OBJ_TXT_FLD_3` AS `C_TGT_OBJ_TXT_FLD_3`,`sync_comm`.`web_app_ent_tgt_obj`.`C_TGT_OBJ_TXT_FLD_4` AS `C_TGT_OBJ_TXT_FLD_4`,`sync_comm`.`web_app_ent_tgt_obj`.`C_TGT_OBJ_TXT_FLD_5` AS `C_TGT_OBJ_TXT_FLD_5`,`sync_comm`.`web_app_ent_tgt_obj`.`N_TGT_OBJ_NUM_FLD_2` AS `N_TGT_OBJ_NUM_FLD_2`,`sync_comm`.`web_app_ent_tgt_obj`.`N_TGT_OBJ_NUM_FLD_3` AS `N_TGT_OBJ_NUM_FLD_3`,`sync_comm`.`web_app_ent_tgt_obj`.`N_TGT_OBJ_NUM_FLD_4` AS `N_TGT_OBJ_NUM_FLD_4`,`sync_comm`.`web_app_ent_tgt_obj`.`N_TGT_OBJ_NUM_FLD_5` AS `N_TGT_OBJ_NUM_FLD_5`,`sync_comm`.`web_app_ent_tgt_obj`.`T_TGT_OBJ_TM_FLG_2` AS `T_TGT_OBJ_TM_FLG_2`,`sync_comm`.`web_app_ent_tgt_obj`.`N_DDUCT_RATE` AS `N_DDUCT_RATE`,`sync_comm`.`web_app_ent_tgt_obj`.`N_DDUCT_AMT` AS `N_DDUCT_AMT`,`sync_comm`.`web_app_ent_tgt_obj`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_app_ent_tgt_obj` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_app_prj_rel`
--

/*!50001 DROP TABLE IF EXISTS `web_app_prj_rel`*/;
/*!50001 DROP VIEW IF EXISTS `web_app_prj_rel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_app_prj_rel` AS select `sync_comm`.`web_app_prj_rel`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_app_prj_rel`.`C_APP_NO` AS `C_APP_NO`,`sync_comm`.`web_app_prj_rel`.`C_ROW_ID` AS `C_ROW_ID`,`sync_comm`.`web_app_prj_rel`.`N_SEQ_NO` AS `N_SEQ_NO`,`sync_comm`.`web_app_prj_rel`.`C_PRJ_REL` AS `C_PRJ_REL`,`sync_comm`.`web_app_prj_rel`.`C_NAME` AS `C_NAME`,`sync_comm`.`web_app_prj_rel`.`C_ORG_CDE` AS `C_ORG_CDE`,`sync_comm`.`web_app_prj_rel`.`C_ADDR` AS `C_ADDR`,`sync_comm`.`web_app_prj_rel`.`C_ZIP` AS `C_ZIP`,`sync_comm`.`web_app_prj_rel`.`C_INSRANT_FLG` AS `C_INSRANT_FLG`,`sync_comm`.`web_app_prj_rel`.`C_RESV_TXT_1` AS `C_RESV_TXT_1`,`sync_comm`.`web_app_prj_rel`.`C_RESV_TXT_2` AS `C_RESV_TXT_2`,`sync_comm`.`web_app_prj_rel`.`C_RESV_TXT_3` AS `C_RESV_TXT_3`,`sync_comm`.`web_app_prj_rel`.`N_RESV_NUM_1` AS `N_RESV_NUM_1`,`sync_comm`.`web_app_prj_rel`.`N_RESV_NUM_2` AS `N_RESV_NUM_2`,`sync_comm`.`web_app_prj_rel`.`N_RESV_NUM_3` AS `N_RESV_NUM_3`,`sync_comm`.`web_app_prj_rel`.`C_CANCEL_MARK` AS `C_CANCEL_MARK`,`sync_comm`.`web_app_prj_rel`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_app_prj_rel`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_app_prj_rel`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_app_prj_rel`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_app_prj_rel`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_app_prj_rel`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_app_prj_rel`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_app_prj_rel` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_app_sub`
--

/*!50001 DROP TABLE IF EXISTS `web_app_sub`*/;
/*!50001 DROP VIEW IF EXISTS `web_app_sub`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_app_sub` AS select `sync_comm`.`web_app_sub`.`C_APP_NO` AS `C_APP_NO`,`sync_comm`.`web_app_sub`.`N_GOV_SUB_AMT` AS `N_GOV_SUB_AMT`,`sync_comm`.`web_app_sub`.`N_GOV_SUB_VAR` AS `N_GOV_SUB_VAR`,`sync_comm`.`web_app_sub`.`N_GOV_SUB_PROP` AS `N_GOV_SUB_PROP`,`sync_comm`.`web_app_sub`.`N_SELF_PAY_AMT` AS `N_SELF_PAY_AMT`,`sync_comm`.`web_app_sub`.`N_SELF_PAY_VAR` AS `N_SELF_PAY_VAR`,`sync_comm`.`web_app_sub`.`N_SELF_PAY_PROP` AS `N_SELF_PAY_PROP`,`sync_comm`.`web_app_sub`.`C_RESV_TXT_1` AS `C_RESV_TXT_1`,`sync_comm`.`web_app_sub`.`C_RESV_TXT_2` AS `C_RESV_TXT_2`,`sync_comm`.`web_app_sub`.`C_RESV_TXT_3` AS `C_RESV_TXT_3`,`sync_comm`.`web_app_sub`.`C_RESV_TXT_4` AS `C_RESV_TXT_4`,`sync_comm`.`web_app_sub`.`C_RESV_TXT_5` AS `C_RESV_TXT_5`,`sync_comm`.`web_app_sub`.`C_RESV_TXT_6` AS `C_RESV_TXT_6`,`sync_comm`.`web_app_sub`.`C_RESV_TXT_7` AS `C_RESV_TXT_7`,`sync_comm`.`web_app_sub`.`C_RESV_TXT_8` AS `C_RESV_TXT_8`,`sync_comm`.`web_app_sub`.`C_RESV_TXT_9` AS `C_RESV_TXT_9`,`sync_comm`.`web_app_sub`.`C_RESV_TXT_10` AS `C_RESV_TXT_10`,`sync_comm`.`web_app_sub`.`N_RESV_NUM_1` AS `N_RESV_NUM_1`,`sync_comm`.`web_app_sub`.`N_RESV_NUM_2` AS `N_RESV_NUM_2`,`sync_comm`.`web_app_sub`.`N_RESV_NUM_3` AS `N_RESV_NUM_3`,`sync_comm`.`web_app_sub`.`N_RESV_NUM_4` AS `N_RESV_NUM_4`,`sync_comm`.`web_app_sub`.`N_RESV_NUM_5` AS `N_RESV_NUM_5`,`sync_comm`.`web_app_sub`.`N_RESV_NUM_6` AS `N_RESV_NUM_6`,`sync_comm`.`web_app_sub`.`N_RESV_NUM_7` AS `N_RESV_NUM_7`,`sync_comm`.`web_app_sub`.`N_RESV_NUM_8` AS `N_RESV_NUM_8`,`sync_comm`.`web_app_sub`.`N_RESV_NUM_9` AS `N_RESV_NUM_9`,`sync_comm`.`web_app_sub`.`N_RESV_NUM_10` AS `N_RESV_NUM_10`,`sync_comm`.`web_app_sub`.`T_RESV_TM_1` AS `T_RESV_TM_1`,`sync_comm`.`web_app_sub`.`T_RESV_TM_2` AS `T_RESV_TM_2`,`sync_comm`.`web_app_sub`.`T_RESV_TM_3` AS `T_RESV_TM_3`,`sync_comm`.`web_app_sub`.`T_RESV_TM_4` AS `T_RESV_TM_4`,`sync_comm`.`web_app_sub`.`T_RESV_TM_5` AS `T_RESV_TM_5`,`sync_comm`.`web_app_sub`.`T_RESV_TM_6` AS `T_RESV_TM_6`,`sync_comm`.`web_app_sub`.`T_RESV_TM_7` AS `T_RESV_TM_7`,`sync_comm`.`web_app_sub`.`T_RESV_TM_8` AS `T_RESV_TM_8`,`sync_comm`.`web_app_sub`.`T_RESV_TM_9` AS `T_RESV_TM_9`,`sync_comm`.`web_app_sub`.`T_RESV_TM_10` AS `T_RESV_TM_10`,`sync_comm`.`web_app_sub`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_app_sub`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_app_sub`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_app_sub`.`C_UPD_CDE` AS `C_UPD_CDE` from `sync_comm`.`web_app_sub` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_bas_fin_banknet`
--

/*!50001 DROP TABLE IF EXISTS `web_bas_fin_banknet`*/;
/*!50001 DROP VIEW IF EXISTS `web_bas_fin_banknet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `web_bas_fin_banknet` AS select `sync_comm`.`web_bas_fin_banknet`.`C_BANKCODE` AS `C_BANKCODE`,`sync_comm`.`web_bas_fin_banknet`.`C_BANKNAME` AS `C_BANKNAME`,`sync_comm`.`web_bas_fin_banknet`.`C_BANKKIND` AS `C_BANKKIND`,`sync_comm`.`web_bas_fin_banknet`.`C_BANKZONE` AS `C_BANKZONE`,`sync_comm`.`web_bas_fin_banknet`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_bas_fin_banknet`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_bas_fin_banknet`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_bas_fin_banknet`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_bas_fin_banknet`.`T_ADB_TM` AS `T_ADB_TM`,`sync_comm`.`web_bas_fin_banknet`.`C_IS_VALID` AS `C_IS_VALID`,`sync_comm`.`web_bas_fin_banknet`.`C_BANK_PROVINCE` AS `C_BANK_PROVINCE`,`sync_comm`.`web_bas_fin_banknet`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_bas_fin_banknet`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_bas_fin_banknet`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_bas_fin_banknet` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_bas_fin_chg_rate`
--

/*!50001 DROP TABLE IF EXISTS `web_bas_fin_chg_rate`*/;
/*!50001 DROP VIEW IF EXISTS `web_bas_fin_chg_rate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_bas_fin_chg_rate` AS select `sync_comm`.`web_bas_fin_chg_rate`.`C_CHGRATE_PK_ID` AS `C_CHGRATE_PK_ID`,`sync_comm`.`web_bas_fin_chg_rate`.`C_CUR_CDE1` AS `C_CUR_CDE1`,`sync_comm`.`web_bas_fin_chg_rate`.`C_CUR_CDE2` AS `C_CUR_CDE2`,`sync_comm`.`web_bas_fin_chg_rate`.`N_CHG_RTE` AS `N_CHG_RTE`,`sync_comm`.`web_bas_fin_chg_rate`.`T_EFFC_TM` AS `T_EFFC_TM`,`sync_comm`.`web_bas_fin_chg_rate`.`T_EXPD_TM` AS `T_EXPD_TM`,`sync_comm`.`web_bas_fin_chg_rate`.`T_ADB_TM` AS `T_ADB_TM`,`sync_comm`.`web_bas_fin_chg_rate`.`C_IS_VALID` AS `C_IS_VALID`,`sync_comm`.`web_bas_fin_chg_rate`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_bas_fin_chg_rate`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_bas_fin_chg_rate`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_bas_fin_chg_rate`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_bas_fin_chg_rate`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_bas_fin_chg_rate`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_bas_fin_chg_rate`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_bas_fin_chg_rate` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_grt_menu`
--

/*!50001 DROP TABLE IF EXISTS `web_grt_menu`*/;
/*!50001 DROP VIEW IF EXISTS `web_grt_menu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_grt_menu` AS select `sync_comm`.`web_grt_menu`.`C_OPER_ID` AS `C_OPER_ID`,`sync_comm`.`web_grt_menu`.`C_DPT_CDE` AS `C_DPT_CDE`,`sync_comm`.`web_grt_menu`.`C_OP_CDE` AS `C_OP_CDE`,`sync_comm`.`web_grt_menu`.`C_PARENT_CDE` AS `C_PARENT_CDE`,`sync_comm`.`web_grt_menu`.`C_OP_CNM` AS `C_OP_CNM`,`sync_comm`.`web_grt_menu`.`C_OP_ACT` AS `C_OP_ACT`,`sync_comm`.`web_grt_menu`.`N_OP_ORDER` AS `N_OP_ORDER`,`sync_comm`.`web_grt_menu`.`C_OP_IMG` AS `C_OP_IMG`,`sync_comm`.`web_grt_menu`.`C_TARGET` AS `C_TARGET`,`sync_comm`.`web_grt_menu`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_grt_menu`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_grt_menu`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_grt_menu` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_grt_op`
--

/*!50001 DROP TABLE IF EXISTS `web_grt_op`*/;
/*!50001 DROP VIEW IF EXISTS `web_grt_op`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_grt_op` AS select `sync_comm`.`web_grt_op`.`C_OP_CDE` AS `C_OP_CDE`,`sync_comm`.`web_grt_op`.`C_PARENT_CDE` AS `C_PARENT_CDE`,`sync_comm`.`web_grt_op`.`C_OP_CNM` AS `C_OP_CNM`,`sync_comm`.`web_grt_op`.`C_OP_ACT` AS `C_OP_ACT`,`sync_comm`.`web_grt_op`.`C_OP_MEMO` AS `C_OP_MEMO`,`sync_comm`.`web_grt_op`.`N_OP_ORDER` AS `N_OP_ORDER`,`sync_comm`.`web_grt_op`.`C_OP_IMG` AS `C_OP_IMG`,`sync_comm`.`web_grt_op`.`C_TARGET` AS `C_TARGET`,`sync_comm`.`web_grt_op`.`C_OP_TYPE` AS `C_OP_TYPE`,`sync_comm`.`web_grt_op`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_grt_op`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_grt_op`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_grt_op`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_grt_op`.`C_SUB_SYS_CDE` AS `C_SUB_SYS_CDE`,`sync_comm`.`web_grt_op`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_grt_op`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_grt_op`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_grt_op` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_grt_role`
--

/*!50001 DROP TABLE IF EXISTS `web_grt_role`*/;
/*!50001 DROP VIEW IF EXISTS `web_grt_role`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_grt_role` AS select `sync_comm`.`web_grt_role`.`C_OPGRP_CDE` AS `C_OPGRP_CDE`,`sync_comm`.`web_grt_role`.`C_OPGRP_CNM` AS `C_OPGRP_CNM`,`sync_comm`.`web_grt_role`.`C_OPGRP_MEMO` AS `C_OPGRP_MEMO`,`sync_comm`.`web_grt_role`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_grt_role`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_grt_role`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_grt_role`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_grt_role`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_grt_role`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_grt_role`.`C_SUPER_ROLE` AS `C_SUPER_ROLE`,`sync_comm`.`web_grt_role`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_grt_role` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_grt_role_op`
--

/*!50001 DROP TABLE IF EXISTS `web_grt_role_op`*/;
/*!50001 DROP VIEW IF EXISTS `web_grt_role_op`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_grt_role_op` AS select `sync_comm`.`web_grt_role_op`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_grt_role_op`.`C_OPGRP_CDE` AS `C_OPGRP_CDE`,`sync_comm`.`web_grt_role_op`.`C_OP_CDE` AS `C_OP_CDE`,`sync_comm`.`web_grt_role_op`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_grt_role_op`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_grt_role_op`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_grt_role_op`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_grt_role_op`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_grt_role_op` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_grt_subsys_prod_map`
--

/*!50001 DROP TABLE IF EXISTS `web_grt_subsys_prod_map`*/;
/*!50001 DROP VIEW IF EXISTS `web_grt_subsys_prod_map`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_grt_subsys_prod_map` AS select `sync_comm`.`web_grt_subsys_prod_map`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_grt_subsys_prod_map`.`C_PROD_NO` AS `C_PROD_NO`,`sync_comm`.`web_grt_subsys_prod_map`.`C_SUBSYS_CDE` AS `C_SUBSYS_CDE`,`sync_comm`.`web_grt_subsys_prod_map`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_grt_subsys_prod_map`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_grt_subsys_prod_map`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_grt_subsys_prod_map`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_grt_subsys_prod_map`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_grt_subsys_prod_map`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_grt_subsys_prod_map`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_grt_subsys_prod_map` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_grt_usr_dpt`
--

/*!50001 DROP TABLE IF EXISTS `web_grt_usr_dpt`*/;
/*!50001 DROP VIEW IF EXISTS `web_grt_usr_dpt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_grt_usr_dpt` AS select `sync_comm`.`web_grt_usr_dpt`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_grt_usr_dpt`.`C_OPER_ID` AS `C_OPER_ID`,`sync_comm`.`web_grt_usr_dpt`.`C_DPT_CDE` AS `C_DPT_CDE`,`sync_comm`.`web_grt_usr_dpt`.`C_DAT_DPT_CDE` AS `C_DAT_DPT_CDE`,`sync_comm`.`web_grt_usr_dpt`.`C_SUB_DPT` AS `C_SUB_DPT`,`sync_comm`.`web_grt_usr_dpt`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_grt_usr_dpt`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_grt_usr_dpt`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_grt_usr_dpt`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_grt_usr_dpt`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_grt_usr_dpt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_grt_usr_dpt_diff`
--

/*!50001 DROP TABLE IF EXISTS `web_grt_usr_dpt_diff`*/;
/*!50001 DROP VIEW IF EXISTS `web_grt_usr_dpt_diff`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_grt_usr_dpt_diff` AS select `sync_comm`.`web_grt_usr_dpt_diff`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_grt_usr_dpt_diff`.`C_OPER_ID` AS `C_OPER_ID`,`sync_comm`.`web_grt_usr_dpt_diff`.`C_DPT_CDE` AS `C_DPT_CDE`,`sync_comm`.`web_grt_usr_dpt_diff`.`C_OP_CDE` AS `C_OP_CDE`,`sync_comm`.`web_grt_usr_dpt_diff`.`C_DAT_DPT_CDE` AS `C_DAT_DPT_CDE`,`sync_comm`.`web_grt_usr_dpt_diff`.`C_SUB_DPT` AS `C_SUB_DPT`,`sync_comm`.`web_grt_usr_dpt_diff`.`C_ENABLED` AS `C_ENABLED`,`sync_comm`.`web_grt_usr_dpt_diff`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_grt_usr_dpt_diff`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_grt_usr_dpt_diff`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_grt_usr_dpt_diff`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_grt_usr_dpt_diff`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_grt_usr_dpt_diff` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_grt_usr_op`
--

/*!50001 DROP TABLE IF EXISTS `web_grt_usr_op`*/;
/*!50001 DROP VIEW IF EXISTS `web_grt_usr_op`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_grt_usr_op` AS select `sync_comm`.`web_grt_usr_op`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_grt_usr_op`.`C_OPER_ID` AS `C_OPER_ID`,`sync_comm`.`web_grt_usr_op`.`C_DPT_CDE` AS `C_DPT_CDE`,`sync_comm`.`web_grt_usr_op`.`C_OPGRP_CDE` AS `C_OPGRP_CDE`,`sync_comm`.`web_grt_usr_op`.`C_OP_CDE` AS `C_OP_CDE`,`sync_comm`.`web_grt_usr_op`.`C_ENABLED` AS `C_ENABLED`,`sync_comm`.`web_grt_usr_op`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_grt_usr_op`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_grt_usr_op`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_grt_usr_op`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_grt_usr_op`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_grt_usr_op` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_grt_usr_op_dpt`
--

/*!50001 DROP TABLE IF EXISTS `web_grt_usr_op_dpt`*/;
/*!50001 DROP VIEW IF EXISTS `web_grt_usr_op_dpt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_grt_usr_op_dpt` AS select `sync_comm`.`web_grt_usr_op_dpt`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_grt_usr_op_dpt`.`C_OPER_ID` AS `C_OPER_ID`,`sync_comm`.`web_grt_usr_op_dpt`.`C_DPT_CDE` AS `C_DPT_CDE`,`sync_comm`.`web_grt_usr_op_dpt`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_grt_usr_op_dpt`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_grt_usr_op_dpt`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_grt_usr_op_dpt`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_grt_usr_op_dpt`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_grt_usr_op_dpt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_grt_usr_prod`
--

/*!50001 DROP TABLE IF EXISTS `web_grt_usr_prod`*/;
/*!50001 DROP VIEW IF EXISTS `web_grt_usr_prod`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_grt_usr_prod` AS select `sync_comm`.`web_grt_usr_prod`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_grt_usr_prod`.`C_OPER_ID` AS `C_OPER_ID`,`sync_comm`.`web_grt_usr_prod`.`C_DPT_CDE` AS `C_DPT_CDE`,`sync_comm`.`web_grt_usr_prod`.`C_PROD_NO` AS `C_PROD_NO`,`sync_comm`.`web_grt_usr_prod`.`C_NME_CN` AS `C_NME_CN`,`sync_comm`.`web_grt_usr_prod`.`C_PROD_CAT` AS `C_PROD_CAT`,`sync_comm`.`web_grt_usr_prod`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_grt_usr_prod`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_grt_usr_prod`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_grt_usr_prod`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_grt_usr_prod`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_grt_usr_prod` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_grt_usr_prod_diff`
--

/*!50001 DROP TABLE IF EXISTS `web_grt_usr_prod_diff`*/;
/*!50001 DROP VIEW IF EXISTS `web_grt_usr_prod_diff`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_grt_usr_prod_diff` AS select `sync_comm`.`web_grt_usr_prod_diff`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_grt_usr_prod_diff`.`C_OPER_ID` AS `C_OPER_ID`,`sync_comm`.`web_grt_usr_prod_diff`.`C_DPT_CDE` AS `C_DPT_CDE`,`sync_comm`.`web_grt_usr_prod_diff`.`C_OP_CDE` AS `C_OP_CDE`,`sync_comm`.`web_grt_usr_prod_diff`.`C_PROD_NO` AS `C_PROD_NO`,`sync_comm`.`web_grt_usr_prod_diff`.`C_NME_CN` AS `C_NME_CN`,`sync_comm`.`web_grt_usr_prod_diff`.`C_PROD_CAT` AS `C_PROD_CAT`,`sync_comm`.`web_grt_usr_prod_diff`.`C_ENABLED` AS `C_ENABLED`,`sync_comm`.`web_grt_usr_prod_diff`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_grt_usr_prod_diff`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_grt_usr_prod_diff`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_grt_usr_prod_diff`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_grt_usr_prod_diff`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_grt_usr_prod_diff` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_grt_usr_role`
--

/*!50001 DROP TABLE IF EXISTS `web_grt_usr_role`*/;
/*!50001 DROP VIEW IF EXISTS `web_grt_usr_role`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_grt_usr_role` AS select `sync_comm`.`web_grt_usr_role`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_grt_usr_role`.`C_OPER_ID` AS `C_OPER_ID`,`sync_comm`.`web_grt_usr_role`.`C_DPT_CDE` AS `C_DPT_CDE`,`sync_comm`.`web_grt_usr_role`.`C_OPGRP_CDE` AS `C_OPGRP_CDE`,`sync_comm`.`web_grt_usr_role`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_grt_usr_role`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_grt_usr_role`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_grt_usr_role`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_grt_usr_role`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_grt_usr_role` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_org_dpt`
--

/*!50001 DROP TABLE IF EXISTS `web_org_dpt`*/;
/*!50001 DROP VIEW IF EXISTS `web_org_dpt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_org_dpt` AS select `sync_comm`.`web_org_dpt`.`C_DPT_CDE` AS `C_DPT_CDE`,`sync_comm`.`web_org_dpt`.`C_SNR_DPT` AS `C_SNR_DPT`,`sync_comm`.`web_org_dpt`.`C_DPT_DISP_CDE` AS `C_DPT_DISP_CDE`,`sync_comm`.`web_org_dpt`.`C_DPT_OUT_CDE` AS `C_DPT_OUT_CDE`,`sync_comm`.`web_org_dpt`.`C_DPT_CNM` AS `C_DPT_CNM`,`sync_comm`.`web_org_dpt`.`C_DPT_ABR` AS `C_DPT_ABR`,`sync_comm`.`web_org_dpt`.`N_DPT_LEVL` AS `N_DPT_LEVL`,`sync_comm`.`web_org_dpt`.`T_FND_TM` AS `T_FND_TM`,`sync_comm`.`web_org_dpt`.`C_DPT_CADDR` AS `C_DPT_CADDR`,`sync_comm`.`web_org_dpt`.`C_ZIP_CDE` AS `C_ZIP_CDE`,`sync_comm`.`web_org_dpt`.`C_DPT_ENM` AS `C_DPT_ENM`,`sync_comm`.`web_org_dpt`.`C_DPT_EADDR` AS `C_DPT_EADDR`,`sync_comm`.`web_org_dpt`.`C_TEL` AS `C_TEL`,`sync_comm`.`web_org_dpt`.`C_FAX` AS `C_FAX`,`sync_comm`.`web_org_dpt`.`C_CTCT_PRSN` AS `C_CTCT_PRSN`,`sync_comm`.`web_org_dpt`.`C_RPT_TEL` AS `C_RPT_TEL`,`sync_comm`.`web_org_dpt`.`T_ADB_TM` AS `T_ADB_TM`,`sync_comm`.`web_org_dpt`.`C_CONS_TEL` AS `C_CONS_TEL`,`sync_comm`.`web_org_dpt`.`C_INSPRMT_NO` AS `C_INSPRMT_NO`,`sync_comm`.`web_org_dpt`.`C_TAXRGST_NO` AS `C_TAXRGST_NO`,`sync_comm`.`web_org_dpt`.`C_BNSRGST_NO` AS `C_BNSRGST_NO`,`sync_comm`.`web_org_dpt`.`C_ALARM_MRK` AS `C_ALARM_MRK`,`sync_comm`.`web_org_dpt`.`C_DPT_REL_CDE` AS `C_DPT_REL_CDE`,`sync_comm`.`web_org_dpt`.`C_RPT_ADDR` AS `C_RPT_ADDR`,`sync_comm`.`web_org_dpt`.`C_LCN_ABR` AS `C_LCN_ABR`,`sync_comm`.`web_org_dpt`.`C_DPT_SERNO` AS `C_DPT_SERNO`,`sync_comm`.`web_org_dpt`.`C_SRVY_DPT_MRK` AS `C_SRVY_DPT_MRK`,`sync_comm`.`web_org_dpt`.`C_SIGN_DPT_MRK` AS `C_SIGN_DPT_MRK`,`sync_comm`.`web_org_dpt`.`C_VCH_DPT_MRK` AS `C_VCH_DPT_MRK`,`sync_comm`.`web_org_dpt`.`C_ACCT_DPT_MRK` AS `C_ACCT_DPT_MRK`,`sync_comm`.`web_org_dpt`.`C_COUNTRY` AS `C_COUNTRY`,`sync_comm`.`web_org_dpt`.`C_PROVINCE` AS `C_PROVINCE`,`sync_comm`.`web_org_dpt`.`C_CITY` AS `C_CITY`,`sync_comm`.`web_org_dpt`.`C_COUNTY` AS `C_COUNTY`,`sync_comm`.`web_org_dpt`.`C_SUFFIX_ADDR` AS `C_SUFFIX_ADDR`,`sync_comm`.`web_org_dpt`.`C_PLY_PRN_INSR` AS `C_PLY_PRN_INSR`,`sync_comm`.`web_org_dpt`.`C_IS_VALID` AS `C_IS_VALID`,`sync_comm`.`web_org_dpt`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_org_dpt`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_org_dpt`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_org_dpt`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_org_dpt`.`C_DPT_CLS` AS `C_DPT_CLS`,`sync_comm`.`web_org_dpt`.`C_DPT_ATTR` AS `C_DPT_ATTR`,`sync_comm`.`web_org_dpt`.`C_GRANT_DPT_CDE` AS `C_GRANT_DPT_CDE`,`sync_comm`.`web_org_dpt`.`C_DEPARTMENT_CDE` AS `C_DEPARTMENT_CDE`,`sync_comm`.`web_org_dpt`.`C_COMPANY_CDE` AS `C_COMPANY_CDE`,`sync_comm`.`web_org_dpt`.`C_DEPARTMENT_MRK` AS `C_DEPARTMENT_MRK`,`sync_comm`.`web_org_dpt`.`C_FIN_COUNT_SET` AS `C_FIN_COUNT_SET`,`sync_comm`.`web_org_dpt`.`C_SWITCH_FLAG` AS `C_SWITCH_FLAG`,`sync_comm`.`web_org_dpt`.`C_TACTIC_LEVEL` AS `C_TACTIC_LEVEL`,`sync_comm`.`web_org_dpt`.`C_FEERATE_LEVEL` AS `C_FEERATE_LEVEL`,`sync_comm`.`web_org_dpt`.`C_CLOSE_FLAG` AS `C_CLOSE_FLAG`,`sync_comm`.`web_org_dpt`.`C_DEPT_LICENCE` AS `C_DEPT_LICENCE`,`sync_comm`.`web_org_dpt`.`C_DPTACC_CDE` AS `C_DPTACC_CDE`,`sync_comm`.`web_org_dpt`.`C_TEL_AREA_NO` AS `C_TEL_AREA_NO`,`sync_comm`.`web_org_dpt`.`C_PHONE_CODE_NO` AS `C_PHONE_CODE_NO`,`sync_comm`.`web_org_dpt`.`C_INTER_CDE` AS `C_INTER_CDE`,`sync_comm`.`web_org_dpt`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_org_dpt`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_org_dpt`.`C_SBU_CDE` AS `C_SBU_CDE`,`sync_comm`.`web_org_dpt`.`C_DPT_PRNNME` AS `C_DPT_PRNNME`,`sync_comm`.`web_org_dpt`.`C_DPT_XZQH` AS `C_DPT_XZQH`,`sync_comm`.`web_org_dpt`.`C_BOSS` AS `C_BOSS`,`sync_comm`.`web_org_dpt`.`C_BASE_SERNO` AS `C_BASE_SERNO`,`sync_comm`.`web_org_dpt`.`NC_MSG` AS `NC_MSG`,`sync_comm`.`web_org_dpt`.`NC_STATUS` AS `NC_STATUS`,`sync_comm`.`web_org_dpt`.`NC_OPR_STATUS` AS `NC_OPR_STATUS`,`sync_comm`.`web_org_dpt`.`NC_OPR_MSG` AS `NC_OPR_MSG`,`sync_comm`.`web_org_dpt`.`C_DPT_FNM` AS `C_DPT_FNM`,`sync_comm`.`web_org_dpt`.`C_CLM_DPT_CDE` AS `C_CLM_DPT_CDE`,`sync_comm`.`web_org_dpt`.`C_SALES_CHANNEL_CODE` AS `C_SALES_CHANNEL_CODE`,`sync_comm`.`web_org_dpt`.`C_BANK_NAME` AS `C_BANK_NAME`,`sync_comm`.`web_org_dpt`.`C_BANK_NO` AS `C_BANK_NO`,`sync_comm`.`web_org_dpt`.`C_DISPTSTTL_ORG` AS `C_DISPTSTTL_ORG`,`sync_comm`.`web_org_dpt`.`N_DPT_LEVL_OA` AS `N_DPT_LEVL_OA`,`sync_comm`.`web_org_dpt`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_org_dpt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_org_emp`
--

/*!50001 DROP TABLE IF EXISTS `web_org_emp`*/;
/*!50001 DROP VIEW IF EXISTS `web_org_emp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_org_emp` AS select `sync_comm`.`web_org_emp`.`C_EMP_CDE` AS `C_EMP_CDE`,`sync_comm`.`web_org_emp`.`C_EMP_CNM` AS `C_EMP_CNM`,`sync_comm`.`web_org_emp`.`C_DPT_CDE` AS `C_DPT_CDE`,`sync_comm`.`web_org_emp`.`T_BIRTHDAY` AS `T_BIRTHDAY`,`sync_comm`.`web_org_emp`.`C_SEX` AS `C_SEX`,`sync_comm`.`web_org_emp`.`C_NTN_CDE` AS `C_NTN_CDE`,`sync_comm`.`web_org_emp`.`C_EDU_CDE` AS `C_EDU_CDE`,`sync_comm`.`web_org_emp`.`C_MRG_CDE` AS `C_MRG_CDE`,`sync_comm`.`web_org_emp`.`C_CTFCT_TYP` AS `C_CTFCT_TYP`,`sync_comm`.`web_org_emp`.`C_CTFCT_NO` AS `C_CTFCT_NO`,`sync_comm`.`web_org_emp`.`C_REGIST` AS `C_REGIST`,`sync_comm`.`web_org_emp`.`T_ENT_TM` AS `T_ENT_TM`,`sync_comm`.`web_org_emp`.`C_EMP_ENM` AS `C_EMP_ENM`,`sync_comm`.`web_org_emp`.`C_MAJOR_CDE` AS `C_MAJOR_CDE`,`sync_comm`.`web_org_emp`.`C_TITLE_CDE` AS `C_TITLE_CDE`,`sync_comm`.`web_org_emp`.`C_HOBBY` AS `C_HOBBY`,`sync_comm`.`web_org_emp`.`C_PRTY_TYP` AS `C_PRTY_TYP`,`sync_comm`.`web_org_emp`.`C_HOME_ADDR` AS `C_HOME_ADDR`,`sync_comm`.`web_org_emp`.`C_ZIP_CDE` AS `C_ZIP_CDE`,`sync_comm`.`web_org_emp`.`C_MOBILE` AS `C_MOBILE`,`sync_comm`.`web_org_emp`.`T_REG_TM` AS `T_REG_TM`,`sync_comm`.`web_org_emp`.`T_LEV_TM` AS `T_LEV_TM`,`sync_comm`.`web_org_emp`.`C_EMP_DOC` AS `C_EMP_DOC`,`sync_comm`.`web_org_emp`.`C_REMARK` AS `C_REMARK`,`sync_comm`.`web_org_emp`.`C_DRE_CDE` AS `C_DRE_CDE`,`sync_comm`.`web_org_emp`.`C_STATUS` AS `C_STATUS`,`sync_comm`.`web_org_emp`.`C_GRNT_CDE1` AS `C_GRNT_CDE1`,`sync_comm`.`web_org_emp`.`C_GRNT_CDE2` AS `C_GRNT_CDE2`,`sync_comm`.`web_org_emp`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_org_emp`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_org_emp`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_org_emp`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_org_emp`.`C_IS_VALID` AS `C_IS_VALID`,`sync_comm`.`web_org_emp`.`C_HR_CDE` AS `C_HR_CDE`,`sync_comm`.`web_org_emp`.`C_TEL` AS `C_TEL`,`sync_comm`.`web_org_emp`.`C_SENDMSG_FLG` AS `C_SENDMSG_FLG`,`sync_comm`.`web_org_emp`.`NC_MSG` AS `NC_MSG`,`sync_comm`.`web_org_emp`.`NC_STATUS` AS `NC_STATUS`,`sync_comm`.`web_org_emp`.`NC_OPR_STATUS` AS `NC_OPR_STATUS`,`sync_comm`.`web_org_emp`.`NC_OPR_MSG` AS `NC_OPR_MSG`,`sync_comm`.`web_org_emp`.`C_EMAIL` AS `C_EMAIL`,`sync_comm`.`web_org_emp`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_org_emp`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_org_emp`.`C_PASSWD` AS `C_PASSWD`,`sync_comm`.`web_org_emp`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_org_emp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_org_oper`
--

/*!50001 DROP TABLE IF EXISTS `web_org_oper`*/;
/*!50001 DROP VIEW IF EXISTS `web_org_oper`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_org_oper` AS select `sync_comm`.`web_org_oper`.`C_OPER_ID` AS `C_OPER_ID`,`sync_comm`.`web_org_oper`.`c_call_center_oper_id` AS `c_call_center_oper_id`,`sync_comm`.`web_org_oper`.`C_OPER_CNM` AS `C_OPER_CNM`,`sync_comm`.`web_org_oper`.`C_PASSWD` AS `C_PASSWD`,`sync_comm`.`web_org_oper`.`C_IS_VALID` AS `C_IS_VALID`,`sync_comm`.`web_org_oper`.`T_PWD_STRT_TM` AS `T_PWD_STRT_TM`,`sync_comm`.`web_org_oper`.`T_PWD_END_TM` AS `T_PWD_END_TM`,`sync_comm`.`web_org_oper`.`C_SRC` AS `C_SRC`,`sync_comm`.`web_org_oper`.`C_REL_CDE` AS `C_REL_CDE`,`sync_comm`.`web_org_oper`.`C_DPT_PERM` AS `C_DPT_PERM`,`sync_comm`.`web_org_oper`.`C_DPT_DIFF` AS `C_DPT_DIFF`,`sync_comm`.`web_org_oper`.`C_PRD_DIFF` AS `C_PRD_DIFF`,`sync_comm`.`web_org_oper`.`C_OP_DIFF` AS `C_OP_DIFF`,`sync_comm`.`web_org_oper`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_org_oper`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_org_oper`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_org_oper`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_org_oper`.`C_OWN_DPT_CDE` AS `C_OWN_DPT_CDE`,`sync_comm`.`web_org_oper`.`C_CSS_STYLE` AS `C_CSS_STYLE`,`sync_comm`.`web_org_oper`.`C_EDU_CDE` AS `C_EDU_CDE`,`sync_comm`.`web_org_oper`.`C_STATUS` AS `C_STATUS`,`sync_comm`.`web_org_oper`.`C_LMT_FLAG` AS `C_LMT_FLAG`,`sync_comm`.`web_org_oper`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_org_oper`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_org_oper`.`C_ID_NO` AS `C_ID_NO`,`sync_comm`.`web_org_oper`.`C_OPER_CNM_BAK` AS `C_OPER_CNM_BAK`,`sync_comm`.`web_org_oper`.`T_MODIFY_TM` AS `T_MODIFY_TM`,`sync_comm`.`web_org_oper`.`NUMBER` AS `NUMBER`,`sync_comm`.`web_org_oper`.`LOCKED` AS `LOCKED` from `sync_comm`.`web_org_oper` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_ply_cargo`
--

/*!50001 DROP TABLE IF EXISTS `web_ply_cargo`*/;
/*!50001 DROP VIEW IF EXISTS `web_ply_cargo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_ply_cargo` AS select `sync_comm`.`web_ply_cargo`.`C_APP_NO` AS `C_APP_NO`,`sync_comm`.`web_ply_cargo`.`C_PLY_NO` AS `C_PLY_NO`,`sync_comm`.`web_ply_cargo`.`N_EDR_PRJ_NO` AS `N_EDR_PRJ_NO`,`sync_comm`.`web_ply_cargo`.`C_EDR_NO` AS `C_EDR_NO`,`sync_comm`.`web_ply_cargo`.`C_CRGO_CDE` AS `C_CRGO_CDE`,`sync_comm`.`web_ply_cargo`.`C_ENG_NME` AS `C_ENG_NME`,`sync_comm`.`web_ply_cargo`.`C_TRANS_TOOL` AS `C_TRANS_TOOL`,`sync_comm`.`web_ply_cargo`.`C_INVC_NO` AS `C_INVC_NO`,`sync_comm`.`web_ply_cargo`.`C_PICK_NO` AS `C_PICK_NO`,`sync_comm`.`web_ply_cargo`.`C_CARRIAGE_CDE` AS `C_CARRIAGE_CDE`,`sync_comm`.`web_ply_cargo`.`C_SAIL_NO` AS `C_SAIL_NO`,`sync_comm`.`web_ply_cargo`.`C_FROM_PRT` AS `C_FROM_PRT`,`sync_comm`.`web_ply_cargo`.`C_TO_PRT` AS `C_TO_PRT`,`sync_comm`.`web_ply_cargo`.`C_PASS_PRT` AS `C_PASS_PRT`,`sync_comm`.`web_ply_cargo`.`C_CERT_MRK` AS `C_CERT_MRK`,`sync_comm`.`web_ply_cargo`.`C_CERT_NO` AS `C_CERT_NO`,`sync_comm`.`web_ply_cargo`.`C_PRN_FRM` AS `C_PRN_FRM`,`sync_comm`.`web_ply_cargo`.`C_SHIP_NME` AS `C_SHIP_NME`,`sync_comm`.`web_ply_cargo`.`C_VSL_LVL_CDE` AS `C_VSL_LVL_CDE`,`sync_comm`.`web_ply_cargo`.`C_SHIP_NAT` AS `C_SHIP_NAT`,`sync_comm`.`web_ply_cargo`.`C_SHIP_AGE` AS `C_SHIP_AGE`,`sync_comm`.`web_ply_cargo`.`C_WATER_LINE` AS `C_WATER_LINE`,`sync_comm`.`web_ply_cargo`.`C_TRA_MRK` AS `C_TRA_MRK`,`sync_comm`.`web_ply_cargo`.`C_TRA_INFO` AS `C_TRA_INFO`,`sync_comm`.`web_ply_cargo`.`C_CHECKER_CDE` AS `C_CHECKER_CDE`,`sync_comm`.`web_ply_cargo`.`C_CHECK_ADDR` AS `C_CHECK_ADDR`,`sync_comm`.`web_ply_cargo`.`C_FRM_PRT_ARA` AS `C_FRM_PRT_ARA`,`sync_comm`.`web_ply_cargo`.`C_TO_PRT_ARA` AS `C_TO_PRT_ARA`,`sync_comm`.`web_ply_cargo`.`C_TRAN_TOOL` AS `C_TRAN_TOOL`,`sync_comm`.`web_ply_cargo`.`C_NO_TEXT` AS `C_NO_TEXT`,`sync_comm`.`web_ply_cargo`.`C_PRN_FORM` AS `C_PRN_FORM`,`sync_comm`.`web_ply_cargo`.`T_ARRIVE_DATE` AS `T_ARRIVE_DATE`,`sync_comm`.`web_ply_cargo`.`C_SRVY_NME` AS `C_SRVY_NME`,`sync_comm`.`web_ply_cargo`.`C_PAY_ADDR` AS `C_PAY_ADDR`,`sync_comm`.`web_ply_cargo`.`N_INV_AMT` AS `N_INV_AMT`,`sync_comm`.`web_ply_cargo`.`C_INV_CUR` AS `C_INV_CUR`,`sync_comm`.`web_ply_cargo`.`N_ADD_QUOT` AS `N_ADD_QUOT`,`sync_comm`.`web_ply_cargo`.`N_EXC_RATE` AS `N_EXC_RATE`,`sync_comm`.`web_ply_cargo`.`N_RATE` AS `N_RATE`,`sync_comm`.`web_ply_cargo`.`N_AMT` AS `N_AMT`,`sync_comm`.`web_ply_cargo`.`C_AMT_CUR` AS `C_AMT_CUR`,`sync_comm`.`web_ply_cargo`.`N_PRM` AS `N_PRM`,`sync_comm`.`web_ply_cargo`.`C_PRM_CUR` AS `C_PRM_CUR`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_1` AS `C_RESV_TXT_1`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_2` AS `C_RESV_TXT_2`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_3` AS `C_RESV_TXT_3`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_4` AS `C_RESV_TXT_4`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_5` AS `C_RESV_TXT_5`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_6` AS `C_RESV_TXT_6`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_7` AS `C_RESV_TXT_7`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_8` AS `C_RESV_TXT_8`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_9` AS `C_RESV_TXT_9`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_10` AS `C_RESV_TXT_10`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_11` AS `C_RESV_TXT_11`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_12` AS `C_RESV_TXT_12`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_13` AS `C_RESV_TXT_13`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_14` AS `C_RESV_TXT_14`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_15` AS `C_RESV_TXT_15`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_16` AS `C_RESV_TXT_16`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_17` AS `C_RESV_TXT_17`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_18` AS `C_RESV_TXT_18`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_19` AS `C_RESV_TXT_19`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_20` AS `C_RESV_TXT_20`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_1` AS `N_RESV_NUM_1`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_2` AS `N_RESV_NUM_2`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_3` AS `N_RESV_NUM_3`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_4` AS `N_RESV_NUM_4`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_5` AS `N_RESV_NUM_5`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_6` AS `N_RESV_NUM_6`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_7` AS `N_RESV_NUM_7`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_8` AS `N_RESV_NUM_8`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_9` AS `N_RESV_NUM_9`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_10` AS `N_RESV_NUM_10`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_11` AS `N_RESV_NUM_11`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_12` AS `N_RESV_NUM_12`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_13` AS `N_RESV_NUM_13`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_14` AS `N_RESV_NUM_14`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_15` AS `N_RESV_NUM_15`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_16` AS `N_RESV_NUM_16`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_17` AS `N_RESV_NUM_17`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_18` AS `N_RESV_NUM_18`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_19` AS `N_RESV_NUM_19`,`sync_comm`.`web_ply_cargo`.`N_RESV_NUM_20` AS `N_RESV_NUM_20`,`sync_comm`.`web_ply_cargo`.`T_RESV_TM_2` AS `T_RESV_TM_2`,`sync_comm`.`web_ply_cargo`.`T_RESV_TM_3` AS `T_RESV_TM_3`,`sync_comm`.`web_ply_cargo`.`T_RESV_TM_4` AS `T_RESV_TM_4`,`sync_comm`.`web_ply_cargo`.`T_RESV_TM_5` AS `T_RESV_TM_5`,`sync_comm`.`web_ply_cargo`.`T_RESV_TM_6` AS `T_RESV_TM_6`,`sync_comm`.`web_ply_cargo`.`T_RESV_TM_7` AS `T_RESV_TM_7`,`sync_comm`.`web_ply_cargo`.`T_RESV_TM_8` AS `T_RESV_TM_8`,`sync_comm`.`web_ply_cargo`.`T_RESV_TM_9` AS `T_RESV_TM_9`,`sync_comm`.`web_ply_cargo`.`T_RESV_TM_10` AS `T_RESV_TM_10`,`sync_comm`.`web_ply_cargo`.`T_RESV_TM_1` AS `T_RESV_TM_1`,`sync_comm`.`web_ply_cargo`.`C_LATEST_MRK` AS `C_LATEST_MRK`,`sync_comm`.`web_ply_cargo`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_ply_cargo`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_ply_cargo`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_ply_cargo`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_ply_cargo`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_ply_cargo`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_ply_cargo`.`C_LTXT_FLD_1` AS `C_LTXT_FLD_1`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_21` AS `C_RESV_TXT_21`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_22` AS `C_RESV_TXT_22`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_23` AS `C_RESV_TXT_23`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_24` AS `C_RESV_TXT_24`,`sync_comm`.`web_ply_cargo`.`T_MODIFY_TM` AS `T_MODIFY_TM`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_25` AS `C_RESV_TXT_25`,`sync_comm`.`web_ply_cargo`.`C_RESV_TXT_26` AS `C_RESV_TXT_26` from `sync_comm`.`web_ply_cargo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_ply_cargo_list`
--

/*!50001 DROP TABLE IF EXISTS `web_ply_cargo_list`*/;
/*!50001 DROP VIEW IF EXISTS `web_ply_cargo_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_ply_cargo_list` AS select `sync_comm`.`web_ply_cargo_list`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_ply_cargo_list`.`C_APP_NO` AS `C_APP_NO`,`sync_comm`.`web_ply_cargo_list`.`C_ROW_ID` AS `C_ROW_ID`,`sync_comm`.`web_ply_cargo_list`.`C_PLY_NO` AS `C_PLY_NO`,`sync_comm`.`web_ply_cargo_list`.`N_EDR_PRJ_NO` AS `N_EDR_PRJ_NO`,`sync_comm`.`web_ply_cargo_list`.`C_EDR_NO` AS `C_EDR_NO`,`sync_comm`.`web_ply_cargo_list`.`N_SEQ_NO` AS `N_SEQ_NO`,`sync_comm`.`web_ply_cargo_list`.`C_MARKS_NO` AS `C_MARKS_NO`,`sync_comm`.`web_ply_cargo_list`.`C_DESC_GOD` AS `C_DESC_GOD`,`sync_comm`.`web_ply_cargo_list`.`C_QTY` AS `C_QTY`,`sync_comm`.`web_ply_cargo_list`.`C_PACK` AS `C_PACK`,`sync_comm`.`web_ply_cargo_list`.`C_WEIT` AS `C_WEIT`,`sync_comm`.`web_ply_cargo_list`.`C_RESV_TXT_1` AS `C_RESV_TXT_1`,`sync_comm`.`web_ply_cargo_list`.`C_RESV_TXT_2` AS `C_RESV_TXT_2`,`sync_comm`.`web_ply_cargo_list`.`C_RESV_TXT_3` AS `C_RESV_TXT_3`,`sync_comm`.`web_ply_cargo_list`.`C_RESV_TXT_4` AS `C_RESV_TXT_4`,`sync_comm`.`web_ply_cargo_list`.`N_RESV_NUM_1` AS `N_RESV_NUM_1`,`sync_comm`.`web_ply_cargo_list`.`N_RESV_NUM_2` AS `N_RESV_NUM_2`,`sync_comm`.`web_ply_cargo_list`.`C_LATEST_MRK` AS `C_LATEST_MRK`,`sync_comm`.`web_ply_cargo_list`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_ply_cargo_list`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_ply_cargo_list`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_ply_cargo_list`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_ply_cargo_list`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_ply_cargo_list`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_ply_cargo_list`.`C_RESV_TXT_5` AS `C_RESV_TXT_5`,`sync_comm`.`web_ply_cargo_list`.`C_RESV_TXT_6` AS `C_RESV_TXT_6`,`sync_comm`.`web_ply_cargo_list`.`T_STARTGO_TM` AS `T_STARTGO_TM`,`sync_comm`.`web_ply_cargo_list`.`T_RESV_TM1` AS `T_RESV_TM1`,`sync_comm`.`web_ply_cargo_list`.`C_TRA_INFO` AS `C_TRA_INFO`,`sync_comm`.`web_ply_cargo_list`.`C_PACKAGE_FIRST_TYP` AS `C_PACKAGE_FIRST_TYP`,`sync_comm`.`web_ply_cargo_list`.`C_PACKAGE_SECOND_TYP` AS `C_PACKAGE_SECOND_TYP`,`sync_comm`.`web_ply_cargo_list`.`C_GOODS_FIRST_TYP` AS `C_GOODS_FIRST_TYP`,`sync_comm`.`web_ply_cargo_list`.`C_GOODS_SECOND_TYP` AS `C_GOODS_SECOND_TYP`,`sync_comm`.`web_ply_cargo_list`.`T_MODIFY_TM` AS `T_MODIFY_TM`,`sync_comm`.`web_ply_cargo_list`.`C_RESV_TXT_7` AS `C_RESV_TXT_7`,`sync_comm`.`web_ply_cargo_list`.`C_RESV_TXT_8` AS `C_RESV_TXT_8` from `sync_comm`.`web_ply_cargo_list` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_ply_ent_tgt_obj`
--

/*!50001 DROP TABLE IF EXISTS `web_ply_ent_tgt_obj`*/;
/*!50001 DROP VIEW IF EXISTS `web_ply_ent_tgt_obj`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_ply_ent_tgt_obj` AS select `sync_comm`.`web_ply_ent_tgt_obj`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_APP_NO` AS `C_APP_NO`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_ROW_ID` AS `C_ROW_ID`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_PLY_NO` AS `C_PLY_NO`,`sync_comm`.`web_ply_ent_tgt_obj`.`N_EDR_PRJ_NO` AS `N_EDR_PRJ_NO`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_EDR_NO` AS `C_EDR_NO`,`sync_comm`.`web_ply_ent_tgt_obj`.`N_SEQ_NO` AS `N_SEQ_NO`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_PRJ_TYP` AS `C_PRJ_TYP`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_PRJ_NME` AS `C_PRJ_NME`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_TGT_QTY` AS `C_TGT_QTY`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_AMT_DETERMINE_METHOD_CDE` AS `C_AMT_DETERMINE_METHOD_CDE`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_CUR_TYP` AS `C_CUR_TYP`,`sync_comm`.`web_ply_ent_tgt_obj`.`N_AMT` AS `N_AMT`,`sync_comm`.`web_ply_ent_tgt_obj`.`N_RATE` AS `N_RATE`,`sync_comm`.`web_ply_ent_tgt_obj`.`N_PRM` AS `N_PRM`,`sync_comm`.`web_ply_ent_tgt_obj`.`N_TGT_NO` AS `N_TGT_NO`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_DDUCT_DESC` AS `C_DDUCT_DESC`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_CANCEL_MARK` AS `C_CANCEL_MARK`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_TGT_OBJ_TXT_FLD_1` AS `C_TGT_OBJ_TXT_FLD_1`,`sync_comm`.`web_ply_ent_tgt_obj`.`T_TGT_OBJ_TM_FLD_1` AS `T_TGT_OBJ_TM_FLD_1`,`sync_comm`.`web_ply_ent_tgt_obj`.`N_TGT_OBJ_NUM_FLD_1` AS `N_TGT_OBJ_NUM_FLD_1`,`sync_comm`.`web_ply_ent_tgt_obj`.`L_TGT_OBJ_LTXT_FLD_1` AS `L_TGT_OBJ_LTXT_FLD_1`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_LATEST_MRK` AS `C_LATEST_MRK`,`sync_comm`.`web_ply_ent_tgt_obj`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_ply_ent_tgt_obj`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_ply_ent_tgt_obj`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_TGT_OBJ_TXT_FLD_2` AS `C_TGT_OBJ_TXT_FLD_2`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_TGT_OBJ_TXT_FLD_3` AS `C_TGT_OBJ_TXT_FLD_3`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_TGT_OBJ_TXT_FLD_4` AS `C_TGT_OBJ_TXT_FLD_4`,`sync_comm`.`web_ply_ent_tgt_obj`.`C_TGT_OBJ_TXT_FLD_5` AS `C_TGT_OBJ_TXT_FLD_5`,`sync_comm`.`web_ply_ent_tgt_obj`.`N_TGT_OBJ_NUM_FLD_2` AS `N_TGT_OBJ_NUM_FLD_2`,`sync_comm`.`web_ply_ent_tgt_obj`.`N_TGT_OBJ_NUM_FLD_3` AS `N_TGT_OBJ_NUM_FLD_3`,`sync_comm`.`web_ply_ent_tgt_obj`.`N_TGT_OBJ_NUM_FLD_4` AS `N_TGT_OBJ_NUM_FLD_4`,`sync_comm`.`web_ply_ent_tgt_obj`.`N_TGT_OBJ_NUM_FLD_5` AS `N_TGT_OBJ_NUM_FLD_5`,`sync_comm`.`web_ply_ent_tgt_obj`.`T_TGT_OBJ_TM_FLG_2` AS `T_TGT_OBJ_TM_FLG_2`,`sync_comm`.`web_ply_ent_tgt_obj`.`N_DDUCT_RATE` AS `N_DDUCT_RATE`,`sync_comm`.`web_ply_ent_tgt_obj`.`N_DDUCT_AMT` AS `N_DDUCT_AMT`,`sync_comm`.`web_ply_ent_tgt_obj`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_ply_ent_tgt_obj` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_ply_prj_rel`
--

/*!50001 DROP TABLE IF EXISTS `web_ply_prj_rel`*/;
/*!50001 DROP VIEW IF EXISTS `web_ply_prj_rel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_ply_prj_rel` AS select `sync_comm`.`web_ply_prj_rel`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_ply_prj_rel`.`C_APP_NO` AS `C_APP_NO`,`sync_comm`.`web_ply_prj_rel`.`C_ROW_ID` AS `C_ROW_ID`,`sync_comm`.`web_ply_prj_rel`.`C_PLY_NO` AS `C_PLY_NO`,`sync_comm`.`web_ply_prj_rel`.`N_EDR_PRJ_NO` AS `N_EDR_PRJ_NO`,`sync_comm`.`web_ply_prj_rel`.`C_EDR_NO` AS `C_EDR_NO`,`sync_comm`.`web_ply_prj_rel`.`N_SEQ_NO` AS `N_SEQ_NO`,`sync_comm`.`web_ply_prj_rel`.`C_PRJ_REL` AS `C_PRJ_REL`,`sync_comm`.`web_ply_prj_rel`.`C_NAME` AS `C_NAME`,`sync_comm`.`web_ply_prj_rel`.`C_ORG_CDE` AS `C_ORG_CDE`,`sync_comm`.`web_ply_prj_rel`.`C_ADDR` AS `C_ADDR`,`sync_comm`.`web_ply_prj_rel`.`C_ZIP` AS `C_ZIP`,`sync_comm`.`web_ply_prj_rel`.`C_INSRANT_FLG` AS `C_INSRANT_FLG`,`sync_comm`.`web_ply_prj_rel`.`C_RESV_TXT_1` AS `C_RESV_TXT_1`,`sync_comm`.`web_ply_prj_rel`.`C_RESV_TXT_2` AS `C_RESV_TXT_2`,`sync_comm`.`web_ply_prj_rel`.`C_RESV_TXT_3` AS `C_RESV_TXT_3`,`sync_comm`.`web_ply_prj_rel`.`N_RESV_NUM_1` AS `N_RESV_NUM_1`,`sync_comm`.`web_ply_prj_rel`.`N_RESV_NUM_2` AS `N_RESV_NUM_2`,`sync_comm`.`web_ply_prj_rel`.`N_RESV_NUM_3` AS `N_RESV_NUM_3`,`sync_comm`.`web_ply_prj_rel`.`C_CANCEL_MARK` AS `C_CANCEL_MARK`,`sync_comm`.`web_ply_prj_rel`.`C_LATEST_MRK` AS `C_LATEST_MRK`,`sync_comm`.`web_ply_prj_rel`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_ply_prj_rel`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_ply_prj_rel`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_ply_prj_rel`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_ply_prj_rel`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_ply_prj_rel`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_ply_prj_rel`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_ply_prj_rel` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_ply_sub`
--

/*!50001 DROP TABLE IF EXISTS `web_ply_sub`*/;
/*!50001 DROP VIEW IF EXISTS `web_ply_sub`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_ply_sub` AS select `sync_comm`.`web_ply_sub`.`C_APP_NO` AS `C_APP_NO`,`sync_comm`.`web_ply_sub`.`C_PLY_NO` AS `C_PLY_NO`,`sync_comm`.`web_ply_sub`.`N_EDR_PRJ_NO` AS `N_EDR_PRJ_NO`,`sync_comm`.`web_ply_sub`.`C_EDR_NO` AS `C_EDR_NO`,`sync_comm`.`web_ply_sub`.`N_GOV_SUB_AMT` AS `N_GOV_SUB_AMT`,`sync_comm`.`web_ply_sub`.`N_GOV_SUB_VAR` AS `N_GOV_SUB_VAR`,`sync_comm`.`web_ply_sub`.`N_GOV_SUB_PROP` AS `N_GOV_SUB_PROP`,`sync_comm`.`web_ply_sub`.`N_SELF_PAY_AMT` AS `N_SELF_PAY_AMT`,`sync_comm`.`web_ply_sub`.`N_SELF_PAY_VAR` AS `N_SELF_PAY_VAR`,`sync_comm`.`web_ply_sub`.`N_SELF_PAY_PROP` AS `N_SELF_PAY_PROP`,`sync_comm`.`web_ply_sub`.`C_RESV_TXT_1` AS `C_RESV_TXT_1`,`sync_comm`.`web_ply_sub`.`C_RESV_TXT_2` AS `C_RESV_TXT_2`,`sync_comm`.`web_ply_sub`.`C_RESV_TXT_3` AS `C_RESV_TXT_3`,`sync_comm`.`web_ply_sub`.`C_RESV_TXT_4` AS `C_RESV_TXT_4`,`sync_comm`.`web_ply_sub`.`C_RESV_TXT_5` AS `C_RESV_TXT_5`,`sync_comm`.`web_ply_sub`.`C_RESV_TXT_6` AS `C_RESV_TXT_6`,`sync_comm`.`web_ply_sub`.`C_RESV_TXT_7` AS `C_RESV_TXT_7`,`sync_comm`.`web_ply_sub`.`C_RESV_TXT_8` AS `C_RESV_TXT_8`,`sync_comm`.`web_ply_sub`.`C_RESV_TXT_9` AS `C_RESV_TXT_9`,`sync_comm`.`web_ply_sub`.`C_RESV_TXT_10` AS `C_RESV_TXT_10`,`sync_comm`.`web_ply_sub`.`N_RESV_NUM_1` AS `N_RESV_NUM_1`,`sync_comm`.`web_ply_sub`.`N_RESV_NUM_2` AS `N_RESV_NUM_2`,`sync_comm`.`web_ply_sub`.`N_RESV_NUM_3` AS `N_RESV_NUM_3`,`sync_comm`.`web_ply_sub`.`N_RESV_NUM_4` AS `N_RESV_NUM_4`,`sync_comm`.`web_ply_sub`.`N_RESV_NUM_5` AS `N_RESV_NUM_5`,`sync_comm`.`web_ply_sub`.`N_RESV_NUM_6` AS `N_RESV_NUM_6`,`sync_comm`.`web_ply_sub`.`N_RESV_NUM_7` AS `N_RESV_NUM_7`,`sync_comm`.`web_ply_sub`.`N_RESV_NUM_8` AS `N_RESV_NUM_8`,`sync_comm`.`web_ply_sub`.`N_RESV_NUM_9` AS `N_RESV_NUM_9`,`sync_comm`.`web_ply_sub`.`N_RESV_NUM_10` AS `N_RESV_NUM_10`,`sync_comm`.`web_ply_sub`.`C_LATEST_MRK` AS `C_LATEST_MRK`,`sync_comm`.`web_ply_sub`.`T_RESV_TM_1` AS `T_RESV_TM_1`,`sync_comm`.`web_ply_sub`.`T_RESV_TM_2` AS `T_RESV_TM_2`,`sync_comm`.`web_ply_sub`.`T_RESV_TM_3` AS `T_RESV_TM_3`,`sync_comm`.`web_ply_sub`.`T_RESV_TM_4` AS `T_RESV_TM_4`,`sync_comm`.`web_ply_sub`.`T_RESV_TM_5` AS `T_RESV_TM_5`,`sync_comm`.`web_ply_sub`.`T_RESV_TM_6` AS `T_RESV_TM_6`,`sync_comm`.`web_ply_sub`.`T_RESV_TM_7` AS `T_RESV_TM_7`,`sync_comm`.`web_ply_sub`.`T_RESV_TM_8` AS `T_RESV_TM_8`,`sync_comm`.`web_ply_sub`.`T_RESV_TM_9` AS `T_RESV_TM_9`,`sync_comm`.`web_ply_sub`.`T_RESV_TM_10` AS `T_RESV_TM_10`,`sync_comm`.`web_ply_sub`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_ply_sub`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_ply_sub`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_ply_sub`.`C_UPD_CDE` AS `C_UPD_CDE` from `sync_comm`.`web_ply_sub` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_prd_cvrg`
--

/*!50001 DROP TABLE IF EXISTS `web_prd_cvrg`*/;
/*!50001 DROP VIEW IF EXISTS `web_prd_cvrg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_prd_cvrg` AS select `sync_comm`.`web_prd_cvrg`.`C_CVRG_NO` AS `C_CVRG_NO`,`sync_comm`.`web_prd_cvrg`.`C_KIND_NO` AS `C_KIND_NO`,`sync_comm`.`web_prd_cvrg`.`C_RISK_TYP` AS `C_RISK_TYP`,`sync_comm`.`web_prd_cvrg`.`C_NME_CN` AS `C_NME_CN`,`sync_comm`.`web_prd_cvrg`.`C_NME_EN` AS `C_NME_EN`,`sync_comm`.`web_prd_cvrg`.`C_RDR_TYP` AS `C_RDR_TYP`,`sync_comm`.`web_prd_cvrg`.`C_CVRG_DESC` AS `C_CVRG_DESC`,`sync_comm`.`web_prd_cvrg`.`C_STATUS` AS `C_STATUS`,`sync_comm`.`web_prd_cvrg`.`T_ADB_TM` AS `T_ADB_TM`,`sync_comm`.`web_prd_cvrg`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_prd_cvrg`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_prd_cvrg`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_prd_cvrg`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_prd_cvrg`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_prd_cvrg`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_prd_cvrg`.`C_JY_FLG` AS `C_JY_FLG`,`sync_comm`.`web_prd_cvrg`.`C_YWORJK` AS `C_YWORJK`,`sync_comm`.`web_prd_cvrg`.`C_IFMEDICAL` AS `C_IFMEDICAL`,`sync_comm`.`web_prd_cvrg`.`C_FEETYP` AS `C_FEETYP`,`sync_comm`.`web_prd_cvrg`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_prd_cvrg` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_prd_kind`
--

/*!50001 DROP TABLE IF EXISTS `web_prd_kind`*/;
/*!50001 DROP VIEW IF EXISTS `web_prd_kind`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_prd_kind` AS select `sync_comm`.`web_prd_kind`.`C_KIND_NO` AS `C_KIND_NO`,`sync_comm`.`web_prd_kind`.`C_NME_CN` AS `C_NME_CN`,`sync_comm`.`web_prd_kind`.`C_NME_EN` AS `C_NME_EN`,`sync_comm`.`web_prd_kind`.`C_STATUS` AS `C_STATUS`,`sync_comm`.`web_prd_kind`.`T_ADB_TM` AS `T_ADB_TM`,`sync_comm`.`web_prd_kind`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_prd_kind`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_prd_kind`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_prd_kind`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_prd_kind`.`N_DISP_ORD` AS `N_DISP_ORD`,`sync_comm`.`web_prd_kind`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_prd_kind`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_prd_kind`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_prd_kind` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_prd_pic_tab_rel`
--

/*!50001 DROP TABLE IF EXISTS `web_prd_pic_tab_rel`*/;
/*!50001 DROP VIEW IF EXISTS `web_prd_pic_tab_rel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_prd_pic_tab_rel` AS select `sync_comm`.`web_prd_pic_tab_rel`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_prd_pic_tab_rel`.`C_PIC_ID` AS `C_PIC_ID`,`sync_comm`.`web_prd_pic_tab_rel`.`C_TAB_NO` AS `C_TAB_NO`,`sync_comm`.`web_prd_pic_tab_rel`.`N_SHOW_SEQ` AS `N_SHOW_SEQ`,`sync_comm`.`web_prd_pic_tab_rel`.`C_REC_NULL_MRK` AS `C_REC_NULL_MRK`,`sync_comm`.`web_prd_pic_tab_rel`.`C_PROD_NO` AS `C_PROD_NO`,`sync_comm`.`web_prd_pic_tab_rel`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_prd_pic_tab_rel`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_prd_pic_tab_rel`.`C_MAIN_CVRG_FLAG` AS `C_MAIN_CVRG_FLAG`,`sync_comm`.`web_prd_pic_tab_rel`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_prd_pic_tab_rel` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_prd_prod`
--

/*!50001 DROP TABLE IF EXISTS `web_prd_prod`*/;
/*!50001 DROP VIEW IF EXISTS `web_prd_prod`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_prd_prod` AS select `sync_comm`.`web_prd_prod`.`C_PROD_NO` AS `C_PROD_NO`,`sync_comm`.`web_prd_prod`.`C_NME_CN` AS `C_NME_CN`,`sync_comm`.`web_prd_prod`.`C_KIND_NO` AS `C_KIND_NO`,`sync_comm`.`web_prd_prod`.`C_NME_EN` AS `C_NME_EN`,`sync_comm`.`web_prd_prod`.`C_CNM_ABR` AS `C_CNM_ABR`,`sync_comm`.`web_prd_prod`.`C_STATUS` AS `C_STATUS`,`sync_comm`.`web_prd_prod`.`C_DOC_FMP` AS `C_DOC_FMP`,`sync_comm`.`web_prd_prod`.`C_DOC_ID` AS `C_DOC_ID`,`sync_comm`.`web_prd_prod`.`C_INSRNC_LONG` AS `C_INSRNC_LONG`,`sync_comm`.`web_prd_prod`.`C_PLYNO_FLAG` AS `C_PLYNO_FLAG`,`sync_comm`.`web_prd_prod`.`C_RATE_FLAG` AS `C_RATE_FLAG`,`sync_comm`.`web_prd_prod`.`C_INST_FLAG` AS `C_INST_FLAG`,`sync_comm`.`web_prd_prod`.`C_FINCVRG_FLAG` AS `C_FINCVRG_FLAG`,`sync_comm`.`web_prd_prod`.`C_CLMEDR_FLAG` AS `C_CLMEDR_FLAG`,`sync_comm`.`web_prd_prod`.`C_BS_TYPE` AS `C_BS_TYPE`,`sync_comm`.`web_prd_prod`.`C_PKG_FLAG` AS `C_PKG_FLAG`,`sync_comm`.`web_prd_prod`.`C_PKG_PLY_FLAG` AS `C_PKG_PLY_FLAG`,`sync_comm`.`web_prd_prod`.`N_DISP_ORD` AS `N_DISP_ORD`,`sync_comm`.`web_prd_prod`.`C_REL_PROD_NO` AS `C_REL_PROD_NO`,`sync_comm`.`web_prd_prod`.`C_VER_INFO` AS `C_VER_INFO`,`sync_comm`.`web_prd_prod`.`T_ADB_TM` AS `T_ADB_TM`,`sync_comm`.`web_prd_prod`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_prd_prod`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_prd_prod`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_prd_prod`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_prd_prod`.`C_INS_END_FLAG` AS `C_INS_END_FLAG`,`sync_comm`.`web_prd_prod`.`C_FIXED_AMT_FLAG` AS `C_FIXED_AMT_FLAG`,`sync_comm`.`web_prd_prod`.`T_BGN_TM` AS `T_BGN_TM`,`sync_comm`.`web_prd_prod`.`C_TAB_DISP_FLAG` AS `C_TAB_DISP_FLAG`,`sync_comm`.`web_prd_prod`.`C_GRP_FLAG` AS `C_GRP_FLAG`,`sync_comm`.`web_prd_prod`.`C_PER_FLAG` AS `C_PER_FLAG`,`sync_comm`.`web_prd_prod`.`C_ADD_TYPE` AS `C_ADD_TYPE`,`sync_comm`.`web_prd_prod`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_prd_prod`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_prd_prod`.`C_IS_GIFT` AS `C_IS_GIFT`,`sync_comm`.`web_prd_prod`.`C_SUBPROD_NO` AS `C_SUBPROD_NO`,`sync_comm`.`web_prd_prod`.`C_JOIN_MAIN_PROD_NO` AS `C_JOIN_MAIN_PROD_NO`,`sync_comm`.`web_prd_prod`.`C_JOIN_ATTACH_PROD_NO` AS `C_JOIN_ATTACH_PROD_NO`,`sync_comm`.`web_prd_prod`.`C_SEPA_CVRG_FLAG` AS `C_SEPA_CVRG_FLAG`,`sync_comm`.`web_prd_prod`.`N_CRITERION_TIME` AS `N_CRITERION_TIME`,`sync_comm`.`web_prd_prod`.`C_CRITERION_TIME_UNIT` AS `C_CRITERION_TIME_UNIT`,`sync_comm`.`web_prd_prod`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_prd_prod` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_prd_prod_cvrg_rel`
--

/*!50001 DROP TABLE IF EXISTS `web_prd_prod_cvrg_rel`*/;
/*!50001 DROP VIEW IF EXISTS `web_prd_prod_cvrg_rel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_prd_prod_cvrg_rel` AS select `sync_comm`.`web_prd_prod_cvrg_rel`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_prd_prod_cvrg_rel`.`C_PROD_NO` AS `C_PROD_NO`,`sync_comm`.`web_prd_prod_cvrg_rel`.`C_CVRG_NO` AS `C_CVRG_NO`,`sync_comm`.`web_prd_prod_cvrg_rel`.`C_PKG_REL_PROD` AS `C_PKG_REL_PROD`,`sync_comm`.`web_prd_prod_cvrg_rel`.`C_CHK` AS `C_CHK`,`sync_comm`.`web_prd_prod_cvrg_rel`.`C_TYP` AS `C_TYP`,`sync_comm`.`web_prd_prod_cvrg_rel`.`N_DISP_ORD` AS `N_DISP_ORD`,`sync_comm`.`web_prd_prod_cvrg_rel`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_prd_prod_cvrg_rel`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_prd_prod_cvrg_rel`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_prd_prod_cvrg_rel`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_prd_prod_cvrg_rel`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_prd_prod_cvrg_rel`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_prd_prod_cvrg_rel`.`C_SUM_FLAG` AS `C_SUM_FLAG`,`sync_comm`.`web_prd_prod_cvrg_rel`.`C_BIAODI_LB` AS `C_BIAODI_LB`,`sync_comm`.`web_prd_prod_cvrg_rel`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_prd_prod_cvrg_rel` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_prd_prod_pic`
--

/*!50001 DROP TABLE IF EXISTS `web_prd_prod_pic`*/;
/*!50001 DROP VIEW IF EXISTS `web_prd_prod_pic`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`tpadmin_core`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `web_prd_prod_pic` AS select `sync_comm`.`web_prd_prod_pic`.`C_PK_ID` AS `C_PK_ID`,`sync_comm`.`web_prd_prod_pic`.`C_PROD_NO` AS `C_PROD_NO`,`sync_comm`.`web_prd_prod_pic`.`C_NME_EN` AS `C_NME_EN`,`sync_comm`.`web_prd_prod_pic`.`C_NME_CN` AS `C_NME_CN`,`sync_comm`.`web_prd_prod_pic`.`C_FILE` AS `C_FILE`,`sync_comm`.`web_prd_prod_pic`.`C_FLAG` AS `C_FLAG`,`sync_comm`.`web_prd_prod_pic`.`C_NEED_GENE` AS `C_NEED_GENE`,`sync_comm`.`web_prd_prod_pic`.`N_SHOW_SEQ` AS `N_SHOW_SEQ`,`sync_comm`.`web_prd_prod_pic`.`C_TYPE` AS `C_TYPE`,`sync_comm`.`web_prd_prod_pic`.`C_REUSE_ID` AS `C_REUSE_ID`,`sync_comm`.`web_prd_prod_pic`.`T_CRT_TM` AS `T_CRT_TM`,`sync_comm`.`web_prd_prod_pic`.`C_CRT_CDE` AS `C_CRT_CDE`,`sync_comm`.`web_prd_prod_pic`.`T_UPD_TM` AS `T_UPD_TM`,`sync_comm`.`web_prd_prod_pic`.`C_UPD_CDE` AS `C_UPD_CDE`,`sync_comm`.`web_prd_prod_pic`.`C_POSTLOAD` AS `C_POSTLOAD`,`sync_comm`.`web_prd_prod_pic`.`C_ONLOAD` AS `C_ONLOAD`,`sync_comm`.`web_prd_prod_pic`.`C_LINKSRC` AS `C_LINKSRC`,`sync_comm`.`web_prd_prod_pic`.`C_GRP_FLAG` AS `C_GRP_FLAG`,`sync_comm`.`web_prd_prod_pic`.`C_TRANS_MRK` AS `C_TRANS_MRK`,`sync_comm`.`web_prd_prod_pic`.`T_TRANS_TM` AS `T_TRANS_TM`,`sync_comm`.`web_prd_prod_pic`.`T_MODIFY_TM` AS `T_MODIFY_TM` from `sync_comm`.`web_prd_prod_pic` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-27 10:14:50
