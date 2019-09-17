CREATE TABLE `rpt_fxq_amltp_entity` (
  `c_cst_no` varchar(24) DEFAULT NULL,
  `c_clnt_nme` varchar(200) DEFAULT NULL COMMENT '客户姓名',
  `c_cert_type` varchar(20) DEFAULT NULL COMMENT '证件类型',
  `c_cert_cde` varchar(100) DEFAULT NULL COMMENT '证件号',
  `c_clnt_cde` varchar(460) NOT NULL COMMENT '客户编码',
  `pt` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
 PARTITION BY RANGE  COLUMNS(`pt`)
(PARTITION `pt20190903000000` VALUES LESS THAN ('20190903999999') ENGINE = InnoDB,
 PARTITION `future` VALUES LESS THAN (MAXVALUE) ENGINE = InnoDB);

CREATE TABLE `rpt_fxq_amltp_risk` (
  `company_code1` varchar(20) DEFAULT NULL COMMENT '机构网点代码',
  `company_code2` varchar(16) DEFAULT NULL COMMENT '金融机构编码',
  `company_code3` binary(0) DEFAULT NULL,
  `c_acc_name` binary(0) DEFAULT NULL,
  `c_cst_no` varchar(765) DEFAULT NULL,
  `c_cert_cde` varchar(50) DEFAULT NULL COMMENT '身份证件号码',
  `risk_code` varchar(765) DEFAULT NULL,
  `score_time` date DEFAULT NULL,
  `score` varchar(765) DEFAULT NULL,
  `norm` binary(0) DEFAULT NULL,
  `pt` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
 PARTITION BY RANGE  COLUMNS(`pt`)
(PARTITION `pt20190903000000` VALUES LESS THAN ('20190903999999') ENGINE = InnoDB,
 PARTITION `future` VALUES LESS THAN (MAXVALUE) ENGINE = InnoDB);

CREATE TABLE `rpt_fxq_amltp_score` (
  `c_clnt_cde` varchar(765) DEFAULT NULL,
  `bat` varchar(765) DEFAULT NULL,
  `score` varchar(765) DEFAULT NULL,
  `score_time` date DEFAULT NULL,
  `pt` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
 PARTITION BY RANGE  COLUMNS(`pt`)
(PARTITION `pt20190903000000` VALUES LESS THAN ('20190903999999') ENGINE = InnoDB,
 PARTITION `future` VALUES LESS THAN (MAXVALUE) ENGINE = InnoDB);