alter table rpt_fxq_tb_ins_risk_new truncate partition future;

insert into rpt_fxq_tb_ins_risk_new(
	company_code1,	--	机构网点代码
	company_code2,	--	金融机构编码
	company_code3,	--	保单归属机构网点代码
	app_name,	--	投保人名称
	app_cst_no,	--	投保人客户号
	app_id_no,	--	投保人证件号码
	risk_code,	--	风险等级
	div_date,	--	划分日期
	score,	--	评分分值
	norm,	--	划分依据
	pt	--	分区字段
)
select 
	co.company_code2 as company_code2, -- 金融机构编码，人行科技司制定的14位金融标准化编码  暂时取“监管机构码，机构外部码，列为空”
	c_clnt_cde,
	bat,
	previous_score,
	score_time
    '{lastday}000000' pt
from rpt_fxq_amltp_entity_risk_new
    left join  rpt_fxq_tb_company_ms partition (future) co on co.company_code1 = a.c_dpt_cde