alter table rpt_fxq_amltp_risk truncate partition future;

insert into rpt_fxq_amltp_risk(
	company_code1,
	company_code2,
	company_code3,
	c_acc_name,
	c_cst_no,
	c_cert_cde,
	risk_code,
	score_time,
	score,
	norm,
	pt
)
select
	co.company_code1,	--	机构网点代码
	co.company_code2,	--	金融机构编码
	null company_code3,	--	保单归属机构网点代码
	pi.c_acc_name c_acc_name,	--	投保人名称
	e.c_cst_no c_cst_no,	--	投保人客户号
	pi.c_cert_cde c_cert_cde,	--	投保人证件号码
	r.score risk_code,	--	风险等级
	r.score_time score_time,	--	划分日期	
	r.score score,	--	评分分值
	null norm,	--	划分依据
	'{lastday}000000' pt	--	分区字段
from rpt_fxq_amltp_entity  partition (future) e
    inner join rpt_fxq_amltp_score  partition (future) r on e.c_clnt_cde = r.c_clnt_cde
    left join edw_cust_pers_info  partition (future) pi on e.c_cst_no = pi.c_cst_no
    left join  rpt_fxq_tb_company_ms partition (future) co on co.company_code1 = pi.c_dpt_cde
order by r.c_clnt_cde, r.score_time