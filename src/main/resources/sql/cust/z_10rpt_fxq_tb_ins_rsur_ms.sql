/*
select count(1) from information_schema.partitions 
where table_schema = schema() 
    and table_name='rpt_fxq_tb_ins_rsur_ms' 
    and partition_name = 'pt20190903000000';

alter table rpt_fxq_tb_ins_rsur_ms add partition (partition pt20190903000000 values less than ('{lastday}999999'));

alter table rpt_fxq_tb_ins_rsur_ms truncate partition pt20190903000000;
*/
truncate table rpt_fxq_tb_ins_rsur_ms;

INSERT INTO rpt_fxq_tb_ins_rsur_ms(
        company_code1,
        company_code2,
        company_code3,
        company_code4,
        pay_type,
        pol_no,
        app_no,
        ins_date,
        eff_date,
        cur_code,
        pre_amt_all,
        usd_amt_all,
        pay_amt_all,
        usd_pay_amt_all,
        app_name,
        app_cst_no,
        id_no,
        cus_pro,
        sur_name,
        sur_id_no,
        sur_date,
        pay_date,
        cur_code2,
        sur_amt,
        usd_sur_amt,
        tsf_flag,
        acc_name,
        acc_no,
        acc_bank,
        receipt_no,
        endorse_no,
        pt
)
select
    a.c_dpt_cde as company_codel,-- 机构网点代码
    '' as company_code2,-- 金融机构编码
    '' as company_code3,-- 保单归属机构网点代码
    '' as company_code4,-- 受理业务机构网点代码
    a.c_edr_rsn_bundle_cde as pay_type,-- 业务类型 11:退保;12:减保;13:保单部分领取;14:保单贷款;15:其他
    a.c_ply_no as pol_no,-- 保单号
    a.c_app_no as app_no,-- 投保单号
    date_format(a.t_app_tm,'%y%m%d') as ins_date,-- 投保日期
    date_format(a.t_insrnc_bgn_tm,'%y%m%d') as eff_date,-- 合同生效日期
    '' as cur_code,-- 保费货币代码
    null as pre_amt_all,-- 按合同币种累计缴纳保费金额
    null as usd_amt_all,-- 累计缴纳保费折合美元金额
    null as pay_amt_all,-- 累计退费金额
    null as usd_pay_amt_all,-- 累计退费金额折合美元金额
    b.c_applicant_name as app_name,-- 投保人名称
    b.c_cst_no as app_cst_no,-- 投保人客户号
    b.c_cert_cde as id_no,-- 投保人证件号码
    b.c_clnt_mrk as cus_pro,-- 投保人客户类型 11:个人;12:单位;
    '' as sur_name,-- 业务申请人名称
    '' as sur_id_no,-- 业务申请人证件号码
    '' as sur_date,-- 业务日期
    '' as pay_date,-- 资金交易日期
    '' as cur_code2,-- 币种
    null as sur_amt,-- 业务发生金额
    null as usd_sur_amt,-- 折合美元金额
    '' as tsf_flag,-- 支付方式 10:现金;11:银行转账;12:其他
    '' as acc_name,-- 交费账号名称
    '' as acc_no,-- 交费账号
    '' as acc_bank,-- 交费账户开户机构名称
    '' as receipt_no,-- 作业流水号,唯一标识号
    a.c_edr_no as endorse_no,-- 批单号
    '20190903' pt
from ods_cthx_web_ply_base partition(pt20190903000000) a
	inner join edw_cust_ply_party_applicant partition(pt20190903000000) b on a.c_ply_no=b.c_ply_no
	inner join ods_cthx_web_bas_edr_rsn   partition(pt20190903000000) c on a.c_edr_rsn_bundle_cde=c.c_rsn_cde and substr(a.c_prod_no,1,2)=c.c_kind_no
where c.c_rsn_cde in ('08','s1','s2') and a.t_next_edr_bgn_tm > now() 
	-- and a.t_edr_bgn_tm between and 
