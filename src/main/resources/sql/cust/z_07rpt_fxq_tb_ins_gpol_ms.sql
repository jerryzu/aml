/*
select count(1) from information_schema.partitions 
where table_schema = schema() 
    and table_name='rpt_fxq_tb_ins_gpol_ms' 
    and partition_name = 'pt20190827000000';

alter table rpt_fxq_tb_ins_gpol_ms add partition (partition pt20190827000000 values less than ('{lastday}999999'));

alter table rpt_fxq_tb_ins_gpol_ms truncate partition pt20190827000000;
*/
truncate table rpt_fxq_tb_ins_gpol_ms;


INSERT INTO rpt_fxq_tb_ins_gpol_ms(
        company_code1,
        company_code2,
        company_code3,
        pol_no,
        app_no,
        ins_state,
        app_type,
        sale_type,
        sale_name,
        ins_date,
        eff_date,
        app_name,
        app_cst_no,
        app_id_type,
        app_id_no,
        state_owned,
        ins_num,
        ins_no,
        cur_code,
        pre_amt,
        usd_amt,
        del_way,
        del_period,
        `limit`,
        subject,
        tsf_flag,
        acc_name,
        acc_no,
        acc_bank,
        pt
)
SELECT
    a.c_dpt_cde                             as company_codel,-- 机构网点代码
    ''                                      as company_code2,-- 金融机构编码
    ''                                      as company_code3,-- 保单归属机构网点代码
    a.c_ply_no                              as pol_no,-- 保单号
    a.c_app_no                              as app_no,-- 投保单号
    a.c_ply_sts                             as ins_state,-- 保单状态
    a.c_grp_mrk                             as app_type,-- 保单类型
    a.c_bsns_typ                            as sale_type,-- 销售渠道
    a.c_bsns_subtyp                         as sale_name,-- 销售渠道名称
    date_format(a.t_app_tm,'%Y%m%d')        as ins_date,-- 投保日期
    date_format(a.t_insrnc_bgn_tm,'%Y%m%d') as eff_date,-- 合同生效日期
    u.c_acc_name                            as app_name,-- 投保人名称
    u.c_cst_no                              as app_cst_no,-- 投保人客户号
    case u.c_certf_cls
    when '100111' then 11 -- 税务登记证
    when '100112' then 13 -- 统一社会信用代码
    when '110001' then 12 -- 组织机构代码
    when '110002' then 13 -- 工商注册号码
    when '110003' then 14 -- 营业执照
    else 18 -- 其它
    end           as app_id_type,-- 投保人证件种类(单位客户)
    u.c_certf_cde as app_id_no,-- 投保人证件号码(单位客户)
    ''            as state_owned,-- 国有属性(单位客户)
    v.ins_num     as ins_num,-- 被保险人数量
    case c.c_kind_no
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
	end as ins_no,-- 险种代码  case
    case a.c_prm_cur
    when '01' then 'CNY' -- 人民币
    when '02' then 'USD' -- 美元
    when '03' then 'HKD' -- 港币
    when '04' then 'CHF' -- 瑞士法郎
    when '05' then 'FF' -- 法国法郎
    when '06' then 'JPY' -- 日元
    when '07' then 'GBP' -- 英镑
    when '08' then 'EUR' -- 欧元
    when '09' then 'DM' -- 德国马克
    when '10' then 'SEK' -- 瑞典克朗
    else '@N' -- 其它     
    end      as ur_code,-- 币种
    a.n_prm  as pre_amt,-- 本期交保费金额
    -9999    as usd_amt,-- 折合美元金额
    11       as del_way,-- 交费方式 -- 11:趸交;12:期缴;13:不定期缴
    14       as del_period,-- 缴费间隔 -- 11:年缴;12:季缴;13:月缴;14:其他;
    1        as `limit`,-- 交费期数  趸交为1;终身缴费填写9999.填写实际期数.
    left(t.c_tgt_addr, 100) as subject,-- 保险标的物
    -- 修改成从资金系统取以下数据
    ''          as tsf_flag,-- 现转标识
    ''          as acc_name,-- 交费账号名称
    ''          as acc_no,-- 交费账号
    ''          as acc_bank,-- 交费账户开户机构名称
    '20190827'    pt
from  ods_cthx_web_ply_base partition(pt20190827000000) a
    left join edw_cust_ply_party partition(pt20190827000000) ua
        on a.c_ply_no=ua.c_ply_no and ua.c_biz_type = 22 -- 10: 收款人, 21: 投保人, 22: 法人投保人, 31:被保人, 32:法人被保人, 41: 受益人, 42: 法人受益人, 43: 间接受益人, 44: 法人间接受益人
    left join edw_cust_units_info partition(pt20190827000000) u
        on ua.c_cst_no =u.c_cst_no
    left join ods_cthx_web_ply_ent_tgt partition(pt20190827000000) t
        on a.c_ply_no=t.c_ply_no
    left join ods_cthx_web_prd_prod partition(pt20190827000000) c 
        on a.c_prod_no=c.c_prod_no
    left join (select a.c_ply_no, count(1) ins_num
        from  ods_cthx_web_ply_base partition(pt20190827000000) a 
            left join edw_cust_ply_party partition(pt20190827000000) pi 
            on a.c_ply_no=pi.c_ply_no and pi.c_biz_type =  32 -- 10: 收款人, 21: 投保人, 22: 法人投保人, 31:被保人, 32:法人被保人, 41: 受益人, 42: 法人受益人, 43: 间接受益人, 44: 法人间接受益人        
        ) v on a.c_ply_no = v.c_ply_no
where a.t_next_edr_bgn_tm > now() 
