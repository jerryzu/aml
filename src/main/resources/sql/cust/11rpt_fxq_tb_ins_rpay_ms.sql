/*
select count(1) from information_schema.partitions 
where table_schema = schema() 
    and table_name='rpt_fxq_tb_ins_rpay_ms' 
    and partition_name = 'pt{lastday}000000';

alter table rpt_fxq_tb_ins_rpay_ms add partition (partition pt{lastday}000000 values less than ('{lastday}999999'));

alter table rpt_fxq_tb_ins_rpay_ms truncate partition pt{lastday}000000;
*/
truncate table rpt_fxq_tb_ins_rpay_ms;

INSERT INTO rpt_fxq_tb_ins_rpay_ms(
        company_code1,
        company_code2,
        company_code3,
        company_code4,
        pol_no,
        app_no,
        ins_date,
        eff_date,
        cur_code1,
        pre_amt_all,
        usd_amt_all,
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
        benefit_pro,
        relation_1,
        relation_2,
        pay_type,
        rpay_date,
        pay_date,
        cur_code2,
        pay_amt,
        pay_usd_amt,
        tsf_flag,
        acc_name,
        acc_no,
        acc_bank,
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
    '' as cur_code1,-- 币种
    '' as pre_amt_all,-- 累计保费金额
    '' as usd_amt_all,-- 累计保费折合美元金额
    b.c_app_nme as app_name,-- 投保人名称
    b.c_app_cde as app_cst_no,-- 投保人客户号
    b.c_certf_cde as app_id_no,-- 投保人证件号码
    b.c_clnt_mrk as app_cus_pro,-- 投保人客户类型
    c.c_insured_nme as ins_name,-- 被保险人客户名称
    c.c_insured_cde as ins_cst_no,-- 被保险人客户号
    c.c_certf_cde as ins_id_no,-- 被保险人证件号码
    c.c_clnt_mrk as ins_cus_pro,-- 被保险人客户类型
    d.c_bnfc_nme as benefit_name,-- 受益人名称
    -- d.c_bnfc_cert_no   as benefit_id_no,-- 受益人身份证件号码,无此字段
    ''   as benefit_id_no,-- 受益人身份证件号码
    '' as benefit_pro,-- 受益人类型
    -- d.c_app_relation as relation_1,-- 投保人被保人之间的关系,无此字段
    '' as relation_1,-- 投保人被保人之间的关系
    '' as relation_2,-- 受益人被保人之间的关系
    '' as pay_type,-- 给付类型
    '' as rpay_date,-- 给付业务办理日期
    '' as pay_date,-- 资金交易日期
    '' as cur_code2,-- 币种
    '' as pay_amt,-- 给付金额
    '' as pay_usd_amt,-- 折合美元金额
    '' as tsf_flag,-- 给付方式
    '' as acc_name,-- 收款账号名称
    '' as acc_no,-- 收款账号
    '' as acc_bank,-- 收款账户开户机构名称
    '' as receipt_no,-- 作业流水号,唯一标识号
    '{lastday}' pt
from ods_cthx_web_ply_base partition(pt{lastday}000000) a
	left join ods_cthx_web_ply_applicant partition(pt{lastday}000000) b on a.c_ply_no=b.c_ply_no
	left join ods_cthx_web_app_insured partition(pt{lastday}000000) c on a.c_app_no=c.c_app_no
	left join ods_cthx_web_ply_bnfc partition(pt{lastday}000000) d on  a.c_ply_no=d.c_ply_no
	left join ods_cthx_web_app_grp_member partition(pt{lastday}000000) g on  a.c_ply_no=g.c_ply_no
where a.t_next_edr_bgn_tm > now() 