/*
select count(1) from information_schema.partitions 
where table_schema = schema() 
    and table_name='rpt_fxq_tb_company_ms' 
    and partition_name = 'pt{lastday}000000';

alter table rpt_fxq_tb_company_ms add partition (partition pt{lastday}000000 values less than ('{lastday}999999'));

alter table rpt_fxq_tb_company_ms truncate partition pt{lastday}000000;
*/
truncate table rpt_fxq_tb_company_ms;

INSERT INTO rpt_fxq_tb_ins_rtype_ms (
	head_no, 
	company_code1, 
	ins_type, 
	ins_no, 
	ins_name, 
	pt
)
select distinct '' as head_no, -- 法人机构报告机构编码，央行统一分配
	'' as company_code1, -- 机构网点代码，内部的机构编码
	case 
	when d.c_kind_no = '01' then '11'
	when d.c_kind_no = '02' then '11'
	when d.c_kind_no = '03' then '10'
	when d.c_kind_no = '04' then '13'
	when d.c_kind_no = '05' then '15'
	when d.c_kind_no = '06' then '14'
	when d.c_kind_no = '07' then '14'
	when d.c_kind_no = '08' then '11'
	when d.c_kind_no = '09' then '11'
	when d.c_kind_no = '10' then '16'
	when d.c_kind_no = '11' then '12'
	when d.c_kind_no = '12' then '15'
	when d.c_kind_no = '16' then '16'
	else '其他'
	end as ins_type, -- 险种分类
	c.c_prod_no as ins_no, -- 险种代码
	c.c_nme_cn as  ins_name, -- 险种名称
    '{lastday}' pt
from ods_cthx_web_org_dpt partition(pt{lastday}000000) a 
	inner join ods_cthx_web_org_dpt_map partition(pt{lastday}000000) b on a.c_dpt_cde=b.c_dpt_cde
	left join ods_cthx_web_prd_prod partition(pt{lastday}000000) c on b.c_kind_no=c.c_kind_no
	left join ods_cthx_web_prd_kind partition(pt{lastday}000000) d on c.c_kind_no=d.c_kind_no