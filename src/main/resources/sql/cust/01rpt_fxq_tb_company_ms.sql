alter table rpt_fxq_tb_company_ms truncate partition future;

insert into rpt_fxq_tb_company_ms (
    head_no, 
    company_code1, 
    company_code2, 
    company_name, 
    bord_flag, 
    pt
) 
select c.head_no as head_no, -- 法人机构报告机构编码，央行统一分配
    a.c_dpt_cde as company_code1, -- 机构网点代码，内部的机构编码
    c.company_code2 as company_code2, -- 金融机构编码，人行科技司制定的14位金融标准化编码  暂时取“监管机构码，机构外部码，列为空”
    a.c_dpt_cnm as company_name, -- 机构名称
    c.bord_flag as  bord_flag, -- 制定经营地点，10境内、11境外 --ref
    '{lastday}000000' pt
from ods_cthx_web_org_dpt partition(pt{lastday}000000) a
    left join  rpt_fxq_manual_company_ms partition(future) c 
		on c.company_code1 = a.c_dpt_cde