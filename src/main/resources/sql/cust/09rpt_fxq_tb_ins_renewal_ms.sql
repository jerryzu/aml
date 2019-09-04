/*
select count(1) from information_schema.partitions 
where table_schema = schema() 
    and table_name='rpt_fxq_tb_ins_renewal_ms' 
    and partition_name = 'pt{lastday}000000';

alter table rpt_fxq_tb_ins_renewal_ms add partition (partition pt{lastday}000000 values less than ('{lastday}999999'));

alter table rpt_fxq_tb_ins_renewal_ms truncate partition pt{lastday}000000;
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
    b.c_applicant_name as app_name,-- 投保人名称
    b.c_cst_no as app_cst_no,-- 投保人客户号
    case b.c_cert_cls
    when '100111' then 22 -- 税务登记证
    when '100112' then 21 -- 统一社会信用代码
    when '110001' then 22 -- 组织机构代码
    when '110002' then 22 -- 工商注册号码
    when '110003' then 21 -- 营业执照
    when  '120001' then 11 -- 居民身份证
    when  '120002' then 13 -- 护照
    when  '120003' then 12 -- 军人证
    when  '120004' then 13 -- 回乡证
    when  '120005' then 14 -- 港澳居民居住证
    when  '120006' then 14 -- 台湾居民居住证
    when  '120009' then 18 -- 其它
    else 22 -- 其它
    end as app_id_type,-- 投保人身份证件类型
    b.c_cert_cde as app_id_no,-- 投保人证件号码
    case p.c_kind_no
	when '01' then '11'
	when '02' then '11'
	when '03' then '10'
	when '04' then '13'
	when '05' then '15'
	when '06' then '14'
	when '07' then '14'
	when '08' then '11'
	when '09' then '11'
	when '10' then '16'
	when '11' then '12'
	when '12' then '15'
	when '16' then '16'
	else '其他'
    end as ins_no,-- 险种代码
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
    '{lastday}' pt
from ods_cthx_web_ply_base partition(pt{lastday}000000) a
	inner join edw_cust_ply_party_applicant partition(pt{lastday}000000) b on a.c_ply_no=b.c_ply_no
	inner join ods_cthx_web_bas_edr_rsn   partition(pt{lastday}000000) c on a.c_edr_rsn_bundle_cde=c.c_rsn_cde and substr(a.c_prod_no,1,2)=c.c_kind_no
	inner join ods_cthx_web_prd_prod partition(pt{lastday}000000) p on a.c_prod_no=p.c_prod_no
where c.c_rsn_cde in ('07') and a.t_next_edr_bgn_tm > now() 
	-- and a.t_edr_bgn_tm between and