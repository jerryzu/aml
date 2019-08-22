/*
select count(1) from information_schema.partitions 
where table_schema = schema() 
    and table_name='rpt_fxq_tb_ins_rchg_ms' 
    and partition_name = 'pt{lastday}000000';

alter table rpt_fxq_tb_ins_rchg_ms add partition (partition pt{lastday}000000 values less than ('{lastday}999999'));

alter table rpt_fxq_tb_ins_rchg_ms truncate partition pt{lastday}000000;
*/
truncate table rpt_fxq_tb_ins_rchg_ms;

INSERT INTO rpt_fxq_tb_ins_rchg_ms(
        company_code1,
        company_code2,
        company_code3,
        company_code4,
        pol_no,
        app_no,
        app_name,
        app_cst_no,
        app_date,
        chg_date,
        chg_no,
        item,
        con_bef,
        pt
)
select
	a.c_dpt_cde as company_codel,-- 机构网点代码
	'' as company_code2,-- 金融机构编码
	'' as company_code3,-- 保单归属机构网点代码
	'' as company_code4,-- 受理业务机构网点代码
	a.c_ply_no as pol_no,-- 保单号
	a.c_app_no as app_no,-- 投保单号
	b.c_app_nme as app_name,-- 投保人名称
	concat(rpad(b.c_certf_cls, 6, '0') , rpad(b.c_certf_cde, 18, '0')) as app_cst_no,-- 投保人客户号
	date_format(a.t_edr_app_tm,'%Y%m%d') as app_date,-- 申请日期
	date_format(a.t_edr_bgn_tm,'%Y%m%d') as chg_date,-- 变更或批改日期
	a.c_edr_no as chg_no,-- 批单号
    case 
        when a.c_edr_rsn_bundle_cde = '22' then 12 -- 变更团单被保险人 -> 12 团险替换被保险人
        -- when a.c_edr_rsn_bundle_cde = 'J1' then 13 -- 减少被保险人 -> 
        -- when a.c_edr_rsn_bundle_cde = 'Z1' then 12 -- 增加被保险人
    end as item, -- 保全/批改项目	11:变更投保人;12:团险替换被保险人;13:变更受益人;14:变更客户(投保人被保人)信息;15:保单转移;
	a.c_edr_ctnt as con_bef,-- 变更内容摘要
    '{lastday}' pt
from ods_cthx_web_ply_base partition(pt{lastday}000000) a
	inner join ods_cthx_web_ply_applicant partition(pt{lastday}000000) b on a.c_ply_no=b.c_ply_no
	inner join ods_cthx_web_bas_edr_rsn   partition(pt{lastday}000000) c on a.c_edr_rsn_bundle_cde=c.c_rsn_cde and substr(a.c_prod_no,1,2)=c.c_kind_no
where c.c_rsn_cde in ('22','-J1','-Z1') and a.t_next_edr_bgn_tm > now() 
	-- and a.t_edr_bgn_tm between and 