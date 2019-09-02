/*
select count(1) from information_schema.partitions 
where table_schema = schema() 
    and table_name='rpt_fxq_tb_ins_rcla_ms' 
    and partition_name = 'pt{lastday}000000';

alter table rpt_fxq_tb_ins_rcla_ms add partition (partition pt{lastday}000000 values less than ('{lastday}999999'));

alter table rpt_fxq_tb_ins_rcla_ms truncate partition pt{lastday}000000;
*/
truncate table rpt_fxq_tb_ins_rcla_ms;

INSERT INTO rpt_fxq_tb_ins_rcla_ms(
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
	a.c_dpt_cde as company_codel,-- 机构网点代码
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
	d.C_CERTF_CDE as benefit_id_no,-- 受益人身份证件号码
	'' as benefit_type,-- 受益人类型
	c.c_app_relation as relation_1,-- 投保人被保人之间的关系
	'' as relation_2,-- 受益人被保人之间的关系
	e.c_rptman_nme as cla_app_name,-- 理赔申请人名称
	'' as  cla_id_type,-- 理赔申请人身份证件类型
	'' as  cla_id_no,-- 理赔申请人身份证件号码
	e.c_insured_rel as cla_pro,-- 理赔申请人类型
	date_format(u.t_paid_tm,'%Y%m%d') as cla_date,-- 理赔日期 web_clmnv_endcase.t_endcase_tm
	case a.c_prm_cur 
	when  '01' then 'CNY' -- 人民币
	when  '02' then 'USD' -- 美元
	when  '03' then 'HKD' -- 港币
	when  '04' then 'CHF' -- 瑞士法郎
	when  '05' then 'FF' -- 法国法郎
	when  '06' then 'JPY' -- 日元
	when  '07' then 'GBP' -- 英镑
	when  '08' then 'EUR' -- 欧元
	when  '09' then 'DM' -- 德国马克
	when  '10' then 'SEK' -- 瑞典克朗
	else 
	'@N' -- 其它
	end as  cur_code,-- 币种
	u.n_due_amt as cla_amt,-- 理赔金额 same as n_paid_amt --web_clm_bank.n_amt
	'' as cla_usd_amt,-- 折合美元金额
	u.c_clm_no cla_no,-- 赔案号
	'' as tsf_flag,-- 支付方式
	g.c_payee_nme as acc_name,-- 实际领款人名称
	g.c_bank_num as acc_no,-- 实际领款人账号
	g.c_bank_cde as acc_bank,-- 实际领款人开户机构
	g.c_pub_piv as acc_type,-- 实际领款人类型
	g.c_card_type as acc_id_type,-- 实际领款人身份证件类型
	g.c_id_card as acc_id_no,-- 实际领款人身份证件号码
	'' as receipt_no-- 作业流水号,唯一标识号	
from ods_cthx_web_ply_base partition(pt20190714000000) a
	 inner join ods_cthx_web_ply_applicant partition(pt20190714000000) b on a.c_ply_no=b.c_ply_no
	 inner join ods_cthx_web_app_insured partition(pt20190714000000) c on a.c_app_no=c.c_app_no
     inner join ods_cthx_web_ply_bnfc partition(pt20190714000000) d on  a.c_ply_no=d.c_ply_no -- 多个受益人相应生成多条记录
	 -- inner join ods_cthx_web_fin_clm_due partition(pt20190714000000) u on a.c_ply_no = u.c_ply_no and u.c_feetyp_cde ='CPPK'
	 inner join web_clmnv_endcase partition(pt20190714000000) u on a.c_ply_no = u.c_ply_no and u.c_feetyp_cde ='CPPK'
	 inner join ods_cthx_web_clm_bank partition(pt20190714000000) g on u.c_clm_no=g.c_clm_no
	 inner join ods_cthx_web_clm_rpt partition(pt20190714000000) e on g.c_clm_no=e.c_clm_no
where a.c_ply_no = 'P997304805201700000002'
-- where u.t_paid_tm between and


--------------------------------------------------------------------------------------------------------------
INSERT INTO rpt_fxq_tb_ins_rcla_ms(
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
	a.c_dpt_cde as company_codel,-- 机构网点代码
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
	b.c_clnt_mrk as app_cus_pro,-- 投保人客户类型 11:个人;12:单位;
	c.c_insured_nme as ins_name,-- 被保险人客户名称
	c.c_insured_cde as ins_cst_no,-- 被保险人客户号
	c.c_certf_cde as ins_id_no,-- 被保险人证件号码
	c.c_clnt_mrk as ins_cus_pro,-- 被保险人客户类型 11:个人;12:单位;
	d.c_bnfc_nme as benefit_name,-- 受益人名称
	d.C_CERTF_CDE as benefit_id_no,-- 受益人身份证件号码
	'' as benefit_type,-- 受益人类型 11:个人;12:单位;
	c.c_app_relation as relation_1,-- 投保人被保人之间的关系 11:本人;12:配偶;13:父母;14:子女;15:其他近亲属;16:雇佣或劳务;17:其他;
	'' as relation_2,-- 受益人被保人之间的关系 11:本人;12:配偶;13:父母;14:子女;15:其他近亲属;16:雇佣或劳务;18:其他;
	e.c_rptman_nme as cla_app_name,-- 理赔申请人名称 11:居民身份证或临时身份证;12:军人或武警身份证件;13:港澳居民来往内地通行证,台湾居民来往大陆通行证或其他有效旅游证件;14:港澳台居民居住证;15:外国公民护照;16:户口簿;17:出生证;18:其他类个人身份证件;21:营业执照;22:其他,
	'' as  cla_id_type,-- 理赔申请人身份证件类型
	'' as  cla_id_no,-- 理赔申请人身份证件号码
	e.c_insured_rel as cla_pro,-- 理赔申请人类型 11:被保险人;12:受益人;13其他;
	-- date_format(u.t_paid_tm,'%Y%m%d') as cla_date,-- 理赔日期 web_clmnv_endcase.t_endcase_tm
	date_format(u.t_endcase_tm,'%Y%m%d') as cla_date,-- 理赔日期 web_clmnv_endcase.t_endcase_tm
	'' as cur_code,-- 币种 CNY,USD
	-- u.n_due_amt as cla_amt,-- 理赔金额 same as n_paid_amt --web_clm_bank.n_amt
	g.n_amt as cla_amt,-- 理赔金额 same as n_paid_amt --web_clm_bank.n_amt 保留2位小数
	'' as cla_usd_amt,-- 折合美元金额
	u.c_clm_no cla_no,-- 赔案号
	'' as tsf_flag,-- 支付方式 10:现金;11:银行转账;12:其他
	g.c_payee_nme as acc_name,-- 实际领款人名称
	g.c_bank_num as acc_no,-- 实际领款人账号
	g.c_bank_cde as acc_bank,-- 实际领款人开户机构
	g.c_pub_piv as acc_type,-- 实际领款人类型 11:个人;12:单位客户
	g.c_card_type as acc_id_type,-- 实际领款人身份证件类型 11:居民身份证或临时身份证;12:军人或武警身份证件;13:港澳居民来往内地通行证,台湾居民来往大陆通行证或其他有效旅游证件;14:港澳台居民居住证;15:外国公民护照;16:户口簿;17:出生证;18:其他类个人身份证件;21:营业执照;22:其他,
	g.c_id_card as acc_id_no,-- 实际领款人身份证件号码
	'' as receipt_no,-- 作业流水号,唯一标识号	
    '{lastday}' pt
from ods_cthx_web_ply_base partition(pt{lastday}000000) a
	 inner join ods_cthx_web_ply_applicant partition(pt{lastday}000000) b on a.c_ply_no=b.c_ply_no
	 inner join ods_cthx_web_app_insured partition(pt{lastday}000000) c on a.c_app_no=c.c_app_no
     inner join ods_cthx_web_ply_bnfc partition(pt{lastday}000000) d on  a.c_ply_no=d.c_ply_no -- 多个受益人相应生成多条记录
	 -- inner join ods_cthx_web_fin_clm_due partition(pt{lastday}000000) u on a.c_ply_no = u.c_ply_no and u.c_feetyp_cde ='CPPK'
	 inner join ods_cthx_web_clmnv_endcase partition(pt{lastday}000000) u on a.c_ply_no = u.c_clm_no and u.c_feetyp_cde ='CPPK'
	 inner join ods_cthx_web_clm_bank partition(pt{lastday}000000) g on u.c_clm_no=g.c_clm_no
	 inner join ods_cthx_web_clm_rpt partition(pt{lastday}000000) e on g.c_clm_no=e.c_clm_no
where a.c_ply_no = 'P997304805201700000002' and a.t_next_edr_bgn_tm > now() 