CREATE TABLE `rpt_fxq_tb_ply_policy_rcla` (
  `company_code1` varchar(20) DEFAULT NULL COMMENT '机构网点代码',
  `company_code2` varchar(16) DEFAULT NULL COMMENT '金融机构编码',
  `company_code3` varchar(20) DEFAULT NULL COMMENT '保单归属机构网点代码',
  `company_code4` varchar(20) DEFAULT NULL COMMENT '受理业务机构网点代码',
  `pol_no` varchar(60) DEFAULT NULL COMMENT '保单号',
  `app_no` varchar(60) DEFAULT NULL COMMENT '投保单号',
  `ins_date` varchar(8) DEFAULT NULL COMMENT '投保日期',
  `eff_date` varchar(8) DEFAULT NULL COMMENT '合同生效日期',
  `app_name` varchar(120) DEFAULT NULL COMMENT '投保人名称',
  `app_cst_no` varchar(30) DEFAULT NULL COMMENT '投保人客户号',
  `app_id_type` varchar(8) DEFAULT NULL COMMENT '投保人身份证件类型',
  `app_id_no` varchar(30) DEFAULT NULL COMMENT '投保人证件号码',
  `app_cus_pro` varchar(2) DEFAULT NULL COMMENT '投保人客户类型',
  `ins_name` varchar(120) DEFAULT NULL COMMENT '被保险人客户名称',
  `ins_cst_no` varchar(30) DEFAULT NULL COMMENT '被保险人客户号',
  `ins_id_type` varchar(8) DEFAULT NULL COMMENT '被保险人身份证件类型',
  `ins_id_no` varchar(50) DEFAULT NULL COMMENT '被保险人证件号码',
  `ins_cus_pro` varchar(2) DEFAULT NULL COMMENT '被保险人客户类型',
  `benefit_name` varchar(120) DEFAULT NULL COMMENT '受益人名称',
  `benefit_id_no` varchar(50) DEFAULT NULL COMMENT '受益人身份证件号码',
  `benefit_type` varchar(8) DEFAULT NULL COMMENT '受益人类型',
  `relation_1` varchar(8) DEFAULT NULL COMMENT '投保人被保人之间的关系',
  `relation_2` varchar(8) DEFAULT NULL COMMENT '受益人被保人之间的关系',
  `cla_app_name` varchar(120) DEFAULT NULL COMMENT '理赔申请人名称',
  `cla_id_type` varchar(2) DEFAULT NULL COMMENT '理赔申请人身份证件类型',
  `cla_id_no` varchar(60) DEFAULT NULL COMMENT '理赔申请人身份证件号码',
  `cla_pro` varchar(2) DEFAULT NULL COMMENT '理赔申请人类型',
  `cla_date` varchar(8) DEFAULT NULL COMMENT '理赔日期',
  `pay_date` varchar(8) DEFAULT NULL COMMENT '资金交易日期',
  `cur_code` varchar(3) DEFAULT NULL COMMENT '币种',
  `cla_amt` decimal(16,2) DEFAULT NULL COMMENT '理赔金额',
  `cla_usd_amt` decimal(16,2) DEFAULT NULL COMMENT '折合美元金额',
  `cla_no` varchar(60) DEFAULT NULL COMMENT '赔案号',
  `tsf_flag` varchar(2) DEFAULT NULL COMMENT '支付方式',
  `acc_name` varchar(160) DEFAULT NULL COMMENT '实际领款人名称',
  `acc_no` varchar(600) DEFAULT NULL COMMENT '实际领款人账号',
  `acc_bank` varchar(600) DEFAULT NULL COMMENT '实际领款人开户机构',
  `acc_type` varchar(2) DEFAULT NULL COMMENT '实际领款人类型',
  `acc_id_type` varchar(8) DEFAULT NULL COMMENT '实际领款人身份证件类型',
  `acc_id_no` varchar(600) DEFAULT NULL COMMENT '实际领款人身份证件号码',
  `receipt_no` varchar(40) DEFAULT NULL COMMENT '作业流水号',
  `pt` varchar(15) DEFAULT NULL COMMENT '分区字段'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查期所有理赔业务保单'
/*!50500 PARTITION BY RANGE  COLUMNS(pt)
(PARTITION pt20190704000000 VALUES LESS THAN ('20190704999999') ENGINE = InnoDB) */

INSERT
INTO
    rpt_fxq_tb_ply_policy_rcla
    (
        company_code1,
        company_code2,
        company_code3,
        company_code4,
        pol_no,
        app_no,
        ins_date,
        eff_date,
        app_name,
        app_cst_no,
        app_id_no,
        app_cus_pro,
        ins_name,
        ins_cst_no,
        ins_id_no,
        ins_cus_pro,
        benefit_name,
        benefit_id_no,
        benefit_type,
        relation_1,
        relation_2,
        cla_app_name,
        cla_id_type,
        cla_id_no,
        cla_pro,
        cla_date,
        pay_date,
        cur_code,
        cla_amt,
        cla_usd_amt,
        cla_no,
        tsf_flag,
        acc_name,
        acc_no,
        acc_bank,
        acc_type,
        acc_id_type,
        acc_id_no,
        receipt_no,
        pt
    )
select 
	'' as company_codel,-- 机构网点代码
	'' as company_code2,-- 金融机构编码
	'' as company_code3,-- 保单归属机构网点代码
	'' as company_code4,-- 受理业务机构网点代码
	
	a.c_ply_no as pol_no,-- 保单号
	a.c_app_no as app_no,-- 投保单号
	date_format(a.t_app_tm,'%Y%m%d') as ins_date,-- 投保日期
	date_format(a.t_insrnc_bgn_tm,'%Y%m%d') as eff_date,-- 合同生效日期
	b.c_app_nme as app_name,-- 投保人名称
	b.c_app_cde as app_cst_no,-- 投保人客户号
	b.c_certf_cde as app_id_no,-- 投保人证件号码
	b.c_clnt_mrk as app_cus_pro,-- 投保人客户类型

	c.c_insured_nme as ins_name,-- 被保险人客户名称
	c.c_insured_cde as ins_cst_no,-- 被保险人客户号
	c.c_certf_cde as ins_id_no,-- 被保险人证件号码
	c.c_clnt_mrk as ins_cus_pro,-- 被保险人客户类型
	d.c_bnfc_nme as benefit_name,-- 受益人名称
	d.c_certf_cde as benefit_id_no,-- 受益人身份证件号码
	'' as benefit_type,-- 受益人类型

	c.c_app_relation as relation_1,-- 投保人被保人之间的关系
	d.c_rel_cde as relation_2,-- 受益人被保人之间的关系
	e.c_rptman_nme as cla_app_name,-- 理赔申请人名称
	'' as  cla_id_type,-- 理赔申请人身份证件类型
	'' as  cla_id_no,-- 理赔申请人身份证件号码
	e.c_insured_rel as cla_pro,-- 理赔申请人类型
	date_format(u.t_paid_tm,'%Y%m%d') as pay_date,-- 理赔日期
	date_format(u.t_paid_tm,'%Y%m%d') as cla_date,-- 理赔日期
	'' as cur_code,-- 币种
	u.n_due_amt as cla_amt,-- 理赔金额 same as n_paid_amt
	'' as cla_usd_amt,-- 折合美元金额
	u.c_clm_no cla_no,-- 赔案号
	'' as tsf_flag,-- 支付方式
	
	g.c_payee_nme as acc_name,-- 实际领款人名称
	g.c_bank_num as acc_no,-- 实际领款人账号
	g.c_bank_cde as acc_bank,-- 实际领款人开户机构
	g.c_pub_piv as acc_type,-- 实际领款人类型
	g.c_card_type as acc_id_type,-- 实际领款人身份证件类型
	g.c_id_card as acc_id_no,-- 实际领款人身份证件号码
	'' as receipt_no,-- 作业流水号,唯一标识号	
    '20190625000000' pt
from ods_cthx_web_ply_base partition(pt20190714000000) a
	 inner join ods_cthx_web_ply_applicant partition(pt20190714000000) b on a.c_ply_no=b.c_ply_no
	 inner join ods_cthx_web_app_insured partition(pt20190714000000) c on a.c_app_no=c.c_app_no
     inner join ods_cthx_web_ply_bnfc partition(pt20190714000000) d on  a.c_ply_no=d.c_ply_no -- 多个受益人相应生成多条记录
	 inner join ods_cthx_web_fin_clm_due partition(pt20190714000000) u on a.c_ply_no = u.c_ply_no and u.c_feetyp_cde ='CPPK'
	 inner join ods_cthx_web_clm_bank partition(pt20190714000000) g on u.c_clm_no=g.c_clm_no
	 inner join ods_cthx_web_clm_rpt partition(pt20190714000000) e on g.c_clm_no=e.c_clm_no


----------------------------------------------------------------------------------------------------------------------------------------
INSERT
INTO
    rpt_fxq_tb_ins_rcla_ms
    (
        company_code1,
        company_code2,
        company_code3,
        company_code4,
        pol_no,
        app_no,
        ins_date,
        eff_date,
        app_name,
        app_cst_no,
        app_id_no,
        app_cus_pro,
        ins_name,
        ins_cst_no,
        ins_id_no,
        ins_cus_pro,
        benefit_name,
        benefit_id_no,
        benefit_type,
        relation_1,
        relation_2,
        cla_app_name,
        cla_id_type,
        cla_id_no,
        cla_pro,
        cla_date,
        pay_date,
        cur_code,
        cla_amt,
        cla_usd_amt,
        cla_no,
        tsf_flag,
        acc_name,
        acc_no,
        acc_bank,
        acc_type,
        acc_id_type,
        acc_id_no,
        receipt_no,
        pt
    )
SELECT
    company_code1  -- 机构网点代码
    ,company_code2  -- 金融机构编码
    ,company_code3  -- 保单归属机构网点代码
    ,company_code4  -- 受理业务机构网点代码
    ,pol_no  -- 保单号
    ,app_no  -- 投保单号
    ,ins_date  -- 投保日期
    ,eff_date  -- 合同生效日期
    ,app_name  -- 投保人名称
    ,concat(rpad(app_id_type, 6, '0') , rpad(app_id_no, 18, '0')) app_cst_no-- 投保人客户号
    ,app_id_no  -- 投保人证件号码
    ,app_cus_pro  -- 投保人客户类型 11:个人; 12:单位
    
    ,ins_name  -- 被保险人客户名称
    ,concat(rpad(ins_id_type, 6, '0') , rpad(ins_id_no, 18, '0')) ins_cst_no  -- 被保险人客户号
    -- ,ins_id_type  -- 被保险人证件号码
    ,ins_id_no  -- 被保险人证件号码
    ,ins_cus_pro  -- 被保险人客户类型 11:个人; 12:单位
    ,benefit_name  -- 受益人名称
    ,benefit_id_no  -- 受益人身份证件号码
    ,benefit_type  -- 受益人类型 11:个人; 12:单位
    
    ,relation_1  -- 投保人被保人之间的关系 11:本人; 12:直系亲属; 13:近亲属; 14:雇佣或劳务; 15:业务关系; 16:其他
    ,relation_2  -- 受益人被保人之间的关系 11:本人; 12:直系亲属; 13:近亲属; 14:雇佣或劳务; 15:业务关系; 16:其他
    ,cla_app_name  -- 理赔申请人名称
    ,case cla_id_type
        when '120001' then 11 -- 居民身份证
        when '120002' then 13 -- 护照
        when '120003' then 12 -- 军人证
        when '120004' then 13 -- 回乡证
        when '120005' then 14 -- 港澳居民居住证
        when '120006' then 14 -- 台湾居民居住证
        when '120009' then 18 -- 其他类个人身份证件
        when '110000' then 21 -- 营业执照(含社会统一信用代码证,多证合一) 
    -- else 
        -- 18 -- 其它
    end as cla_id_type  -- 理赔申请人身份证件类型
    ,cla_id_no  -- 理赔申请人身份证件号码
    ,cla_pro  -- 理赔申请人类型  11:被保险人; 12:受益人; 13:其他
    ,cla_date  -- 理赔日期
    ,pay_date  -- 资金交易日期
    ,cur_code  -- 币种 CNY, USD
    ,cla_amt  -- 理赔金额
    ,cla_usd_amt  -- 折合美元金额
    ,cla_no  -- 赔案号
    ,tsf_flag  -- 支付方式 10:现金; 11:银行转账; 12: 其他
    ,acc_name  -- 实际领款人名称
    ,acc_no  -- 实际领款人账号
    ,acc_bank  -- 实际领款人开户机构
    ,acc_type  -- 实际领款人类型 11:个人; 12:单位
    ,case acc_id_type
        when '120001' then 11 -- 居民身份证
        when '120002' then 13 -- 护照
        when '120003' then 12 -- 军人证
        when '120004' then 13 -- 回乡证
        when '120005' then 14 -- 港澳居民居住证
        when '120006' then 14 -- 台湾居民居住证
        when '120009' then 18 -- 其他类个人身份证件
        when '110000' then 21 -- 营业执照(含社会统一信用代码证,多证合一) 
    else 
        -18 -- 其它
    end as acc_id_type  -- 实际领款人身份证件类型
    ,acc_id_no  -- 实际领款人身份证件号码
    ,receipt_no  -- 作业流水号
    ,pt  -- 分区字段
FROM
    rpt_fxq_tb_ply_policy_rcla;     