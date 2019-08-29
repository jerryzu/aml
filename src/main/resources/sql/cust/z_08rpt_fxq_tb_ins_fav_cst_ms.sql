/*
select count(1) from information_schema.partitions 
where table_schema = schema() 
    and table_name='rpt_fxq_tb_ins_fav_cst_ms' 
    and partition_name = 'pt20190827000000';

alter table rpt_fxq_tb_ins_fav_cst_ms add partition (partition pt20190827000000 values less than ('{lastday}999999'));

alter table rpt_fxq_tb_ins_fav_cst_ms truncate partition pt20190827000000;
*/
truncate table rpt_fxq_tb_ins_fav_cst_ms;

INSERT INTO rpt_fxq_tb_ins_fav_cst_ms(
        company_code1,
        company_code2,
        company_code3,
        pol_no,
        ins_date,
        app_name,
        app_cst_no,
        app_id_no,
        insfav_type,
        insbene_cus_pro,
        relation,
        fav_type,
        name,
        insbene_cst_no,
        insbene_id_no,
        pt
)
select
	a.c_dpt_cde as company_codel,-- 机构网点代码
	'' as company_code2,-- 金融机构编码
	'' as company_code3,-- 保单归属机构网点代码
	a.c_ply_no as pol_no,-- 保单号
	date_format(a.t_app_tm,'%y%m%d') as ins_date,-- 投保日期

	b.c_app_nme as app_name,-- 投保人名称
	b.c_app_cde as app_cst_no,-- 投保人客户号
	b.c_certf_cde as app_id_no,-- 投保人证件号码

	'11' as insfav_type,-- 被保人或受益人标识 11:被保险人； 12：受益人
	c.c_clnt_mrk as insbene_cus_pro,-- 被保人或受益人类型 11：个人；12：单位
	case c.c_app_relation
	when '601001' then '12' -- 配偶
	when '601002' then '13' -- 父母
	when '601003' then '14' -- 子女
	when '601004' then '17' -- 兄弟姐妹
	when '601005' then '11' -- 本人
	when '601006' then '17' -- 雇主
	when '601007' then '16' -- 雇员
	when '601008' then '17' -- 祖父母、外祖父母
	when '601009' then '17' -- 祖孙、外祖孙
	when '601010' then '17' -- 监护人
	when '601011' then '17' -- 被监护人
	when '601012' then '17' -- 朋友
	when '601013' then '17' -- 未知
	when '601014' then '17' -- 其他
	else
	'@N' -- 其它
	end  as relation,-- 投保人、被保人之间的关系 11：本单位；12本单位董事、监事或高级管理人员；13：雇佣或劳务；14：其他
	'' as fav_type,-- 受益人标识 11：法定受益人；12非法定受益人 insfav_type=12时填写

	c.c_insured_nme as name,-- 被保人或受益人名称
	concat(rpad(c.c_certf_cls, 6, '0') , rpad(c.c_certf_cde, 18, '0')) as insbene_cst_no,-- 被保险人或受益人客户号
	c.c_certf_cde as insbene_id_no,-- 被保险人或受益人身份证件号码

    '20190827' pt
from ods_cthx_web_ply_base partition(pt20190827000000) a
	left join ods_cthx_web_ply_applicant partition(pt20190827000000) b on a.c_ply_no=b.c_ply_no
	left join ods_cthx_web_app_insured partition(pt20190827000000) c on a.c_app_no=c.c_app_no
where a.t_next_edr_bgn_tm > now()
union all
select
	a.c_dpt_cde as company_codel,-- 机构网点代码
	'' as company_code2,-- 金融机构编码
	'' as company_code3,-- 保单归属机构网点代码
	a.c_ply_no as pol_no,-- 保单号
	date_format(a.t_app_tm,'%y%m%d') as ins_date,-- 投保日期

	b.c_app_nme as app_name,-- 投保人名称
	b.c_app_cde as app_cst_no,-- 投保人客户号
	b.c_certf_cde as app_id_no,-- 投保人证件号码

	'12' as insfav_type,-- 被保人或受益人标识 11:被保险人； 12：受益人
	c.c_clnt_mrk as insbene_cus_pro,-- 被保人或受益人类型 11：个人；12：单位
	'' as relation,-- 投保人、被保人之间的关系 11：本单位；12本单位董事、监事或高级管理人员；13：雇佣或劳务；14：其他
	'' as fav_type,-- 受益人标识 11：法定受益人；12非法定受益人 insfav_type=12时填写

	c.c_bnfc_nme as name,-- 被保人或受益人名称
	concat(rpad(c.c_certf_cls, 6, '0') , rpad(c.c_certf_cde, 18, '0')) as insbene_cst_no,-- 被保险人或受益人客户号
	c.c_certf_cde as insbene_id_no,-- 被保险人或受益人身份证件号码

	'20190827' pt
from ods_cthx_web_ply_base partition(pt20190827000000) a
	left join ods_cthx_web_ply_applicant partition(pt20190827000000) b on a.c_ply_no=b.c_ply_no
	left join ods_cthx_web_ply_bnfc partition(pt20190827000000) c on a.c_app_no=c.c_app_no
where a.t_next_edr_bgn_tm > now()