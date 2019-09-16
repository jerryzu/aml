alter table rpt_fxq_tb_ins_risk truncate partition future;

insert into rpt_fxq_tb_ins_risk(
	company_code1,	--	机构网点代码
	company_code2,	--	金融机构编码
	company_code3,	--	保单归属机构网点代码
	app_name,	--	投保人名称
	app_cst_no,	--	投保人客户号
	app_id_no,	--	投保人证件号码
	risk_code,	--	风险等级
	div_date,	--	划分日期
	first_type,	--	首次标识
	score,	--	评分分值
	norm,	--	划分依据
	pt	--	分区字段
)
select
	co.company_code1,	--	机构网点代码
	co.company_code2 as company_code2,	--	金融机构编码
	null company_code3,	--	保单归属机构网点代码
	null app_name,	--	投保人名称
	r.c_clnt_cde app_cst_no,	--	投保人客户号
	pi.c_cert_cde app_id_no,	--	投保人证件号码
	r.previous_score risk_code,	--	风险等级
	r.score_time div_date,	--	划分日期	
    r.first_type  first_type,	--	首次标识
	r.previous_score score,	--	评分分值
	null norm,	--	划分依据
	'{lastday}000000' pt	--	分区字段
from rpt_fxq_amltp_entity e
    inner join rpt_fxq_amltp_entity_risk r on e.c_clnt_cde = r.c_clnt_cde
    left join edw_cust_pers_info pi on e.c_cst_no = pi.c_cst_no
    left join  rpt_fxq_tb_company_ms partition (future) co on co.company_code1 = pi.c_dpt_cde