/*
select count(1) from information_schema.partitions 
where table_schema = schema() 
    and table_name='rpt_fxq_tb_ins_renewal_ms' 
    and partition_name = 'pt20190827000000';

alter table rpt_fxq_tb_ins_renewal_ms add partition (partition pt20190827000000 values less than ('{lastday}999999'));

alter table rpt_fxq_tb_ins_renewal_ms truncate partition pt20190827000000;
*/
truncate table rpt_fxq_tb_ins_renewal_ms;

INSERT INTO rpt_fxq_tb_ins_renewal_ms(
        company_code1,
        company_code2,
        company_code3,
        company_code4,
        pol_no,
        app_no,
        ins_date,
        app_name,
        app_cst_no,
        app_id_type,
        app_id_no,
        ins_no,
        renew_date,
        pay_date,
        cur_code,
        pre_amt,
        usd_amt,
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
    a.c_ply_no as pol_no,-- 保单号
    a.c_app_no as app_no,-- 投保单号
    date_format(a.t_app_tm,'%Y%m%d') as ins_date,-- 投保日期
    b.c_app_nme as app_name,-- 投保人名称
    b.c_app_cde as app_cst_no,-- 投保人客户号
    right(b.c_certf_cls, 2) as app_id_type,-- 投保人身份证件类型
    b.c_certf_cde as app_id_no,-- 投保人证件号码
    a.c_prod_no as ins_no,-- 险种代码
    '' as renew_date,-- 业务发生日期
    '' as pay_date,-- 资金交易日期
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
    a.n_prm as pre_amt,-- 本期交保费金额
    -9999 as usd_amt,-- 折合美元金额
    '' as tsf_flag,-- 现转标识
    '' as acc_name,-- 交费账号名称
    '' as acc_no,-- 交费账号
    '' as acc_bank,-- 交费账户开户机构名称
    '' as receipt_no,-- 作业流水号,唯一标识号
    a.c_edr_no as endorse_no,-- 批单号
    '20190827' pt
from ods_cthx_web_ply_base partition(pt20190827000000) a
	inner join ods_cthx_web_ply_applicant partition(pt20190827000000) b on a.c_ply_no=b.c_ply_no
	inner join ods_cthx_web_bas_edr_rsn   partition(pt20190827000000) c on a.c_edr_rsn_bundle_cde=c.c_rsn_cde and substr(a.c_prod_no,1,2)=c.c_kind_no
where c.c_rsn_cde in ('07') and a.t_next_edr_bgn_tm > now() 
	-- and a.t_edr_bgn_tm between and 