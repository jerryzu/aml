alter table tpedw.rpt_fxq_tb_amltp_risk modify column company_code3 varchar(20);

alter table tpedw.ods_cthx_web_fin_cav_doc add `t_udr_tm` datetime default null comment '核保/核赔时间';
alter table tpedw.ods_cthx_web_fin_cav_doc add `c_follow_con_cde` varchar(200) default null comment '共保人（仅供页面显示使用）';
alter table tpedw.ods_cthx_web_fin_cav_doc add `c_bfn_no` varchar(50) default null comment '商户号';
alter table tpedw.ods_cthx_web_fin_cav_doc add `c_bank_cde` varchar(50) default null comment '银行代码';
alter table tpedw.ods_cthx_web_fin_cav_doc add `c_bank_account` varchar(50) default null comment '银行帐号';
alter table tpedw.ods_cthx_web_fin_cav_doc add `c_abstract` varchar(100) default null comment '资金系统对账码';

alter table ods_cthx_web_fin_cav_mny add  `c_abstract` varchar(100) default null comment '资金系统对账码';
alter table ods_cthx_web_fin_cav_mny add  `c_urid` varchar(50) default null comment '资金收款明细信息urid';
alter table ods_cthx_web_fin_cav_mny add  `c_doc_flag` varchar(2) default null comment '账单标识';