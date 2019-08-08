CREATE TABLE `rtp_fxq_tb_ply_party_unit` (
  `company_code1` varchar(20) DEFAULT NULL,
  `company_code2` varchar(16) DEFAULT NULL,
  `cst_no` varchar(100) DEFAULT NULL,
  `open_time` varchar(8) DEFAULT NULL,
  `close_time` varchar(8) DEFAULT NULL,
  `acc_name` varchar(120) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `operate` varchar(100) DEFAULT NULL,
  `set_file` varchar(2) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `id_deadline` varchar(8) DEFAULT NULL,
  `org_no` varchar(50) DEFAULT NULL,
  `tax_no` varchar(50) DEFAULT NULL,
  `rep_name` varchar(100) DEFAULT NULL,
  `id_type2` varchar(30) DEFAULT NULL,
  `id_no2` varchar(20) DEFAULT NULL,
  `id_deadline2` varchar(8) DEFAULT NULL,
  `man_name` varchar(100) DEFAULT NULL,
  `id_type3` varchar(30) DEFAULT NULL,
  `id_no3` varchar(30) DEFAULT NULL,
  `id_deadline3` varchar(8) DEFAULT NULL,
  `ope_name` varchar(100) DEFAULT NULL,
  `id_type4` varchar(30) DEFAULT NULL,
  `id_no4` varchar(20) DEFAULT NULL,
  `id_deadline4` varchar(8) DEFAULT NULL,
  `industry_code` varchar(30) DEFAULT NULL,
  `industry` varchar(30) DEFAULT NULL,
  `reg_amt` varchar(30) DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  `biz_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

select null company_code1
    ,null company_code2
    ,concat(rpad(c_certf_cls, 6, '0') , rpad(c_certf_cde, 18, '0')) cst_no -- 客户号
    ,null open_time
    ,null close_time
    ,c_app_nme acc_name -- 客户名称，
    ,c_clnt_addr address -- 实际经营地址或注册地址
    ,c_manage_area operate -- 经营范围/业务范围
    ,null set_file
    ,c_buslicence_no license -- 依法设立或经营的执照号码
    ,date_format(c_buslicence_valid, '%Y%m%d')  id_deadline -- 依法设立或经营的执照有效期限到期日
    ,c_organization_no org_no -- 组织机构代码
    ,c_cevenue_no tax_no -- 税务登记证号码
    ,c_legal_nme rep_name -- 法定代表人或负责人姓名
    ,c_legal_certf_cls id_type2 -- 法定代表人或负责人身份证件种类
    ,c_legal_certf_cde id_no2 -- 法定代表人或负责人身份证件号码
    ,date_format(t_legal_certf_end_tm, '%Y%m%d')  id_deadline2 -- 有效期限到期日
    ,c_actualholding_nme man_name -- 控股股东或者实际控制人姓名
    ,c_acth_certf_cls id_type3 -- 控股股东或者实际控制人身份证件类型
    ,c_acth_certf_cde id_no3 -- 控股股东或者实际控制人身份证件号码
    ,date_format(t_acth_certf_end_tm, '%Y%m%d')  id_deadline3 -- 控股股东或者实际控制人身份证件有效期限到期日
    ,c_cntr_nme ope_name -- 授权办理业务人员名称
    ,null id_type4 -- 授权办理业务人员身份证件类型
    ,null id_no4 -- 授权办理业务人员身份证件号码
    ,null id_deadline4 -- 授权办理业务人员身份证件有效期限到期日
    ,c_trd_cde industry_code -- 行业代码
    ,c_sub_trd_cde industry -- 行业
    ,null reg_amt
    ,null code
    ,2 biz_type
from ods_cthx_web_ply_applicant partition(pt{lastday}000000) 
where c_clnt_mrk = 0 -- 客户分类,0 法人，1 个人
union 
select null company_code1
    ,null company_code2
    ,concat(rpad(c_certf_cls, 6, '0') , rpad(c_certf_cde, 18, '0'))  cst_no -- 客户号
    ,null open_time
    ,null close_time
    ,c_insured_nme acc_name -- 客户名称，
    ,c_clnt_addr address -- 实际经营地址或注册地址
    ,c_manage_area operate -- 经营范围/业务范围
    ,null set_file
    ,c_buslicence_no license -- 依法设立或经营的执照号码
    ,date_format(c_buslicence_valid, '%Y%m%d')  id_deadline -- 依法设立或经营的执照有效期限到期日
    ,c_organization_no org_no -- 组织机构代码
    ,c_cevenue_no tax_no -- 税务登记证号码
    ,c_legal_nme rep_name -- 法定代表人或负责人姓名
    ,c_legal_certf_cls id_type2 -- 法定代表人或负责人身份证件种类
    ,c_legal_certf_cde id_no2 -- 法定代表人或负责人身份证件号码
    ,date_format(t_legal_certf_end_tm, '%Y%m%d')  id_deadline2 -- 有效期限到期日
    ,c_actualholding_nme man_name -- 控股股东或者实际控制人姓名
    ,c_acth_certf_cls id_type3 -- 控股股东或者实际控制人身份证件类型
    ,c_acth_certf_cde id_no3 -- 控股股东或者实际控制人身份证件号码
    ,date_format(t_acth_certf_end_tm, '%Y%m%d')  id_deadline3 -- 控股股东或者实际控制人身份证件有效期限到期日
    ,c_cntr_nme ope_name -- 授权办理业务人员名称
    ,c_operater_certf_cde id_no4 -- 授权办理业务人员身份证件号码
    ,date_format(t_operater_certf_end_tm, '%Y%m%d')  id_deadline4 -- 授权办理业务人员身份证件有效期限到期日
    ,null id_deadline4
    ,c_trd_cde industry_code -- 行业代码
    ,null industry -- 行业
    ,null reg_amt -- 注册资本金
    ,null code
    ,3 biz_type
from ods_cthx_web_app_insured  partition(pt{lastday}000000)  -- 被保人
where c_clnt_mrk = 0 -- 客户分类,0 法人，1 个人
union  
select null company_code1
    ,null company_code2
    ,concat(rpad(c_certf_cls, 6, '0') , rpad(c_certf_cde, 18, '0')) cst_no -- 客户号
    ,null open_time
    ,null close_time
    ,c_bnfc_nme acc_name -- 客户名称，
    ,c_addr address -- 实际经营地址或注册地址
    ,null operate
    ,null set_file
    ,null license
    ,null id_deadline
    ,null org_no
    ,null tax_no
    ,null rep_name
    ,null id_type2
    ,null id_no2
    ,null id_deadline2
    ,null man_name
    ,null id_type3
    ,null id_no3
    ,null id_deadline3
    ,c_cntr_nme ope_name -- 授权办理业务人员名称
    ,c_certf_cls id_type4 -- 授权办理业务人员身份证件类型
    ,c_certf_cde id_no4 -- 授权办理业务人员身份证件号码
    ,null id_deadline4
    ,null industry_code
    ,null industry
    ,null reg_amt
    ,null code
    ,4 biz_type
from ods_cthx_web_ply_bnfc partition(pt{lastday}000000) 
where c_clnt_mrk = 0 -- 客户分类,0 法人，1 个人

-----------------------------------------------------
SELECT @@global.group_concat_max_len;
SET GLOBAL group_concat_max_len=10240;
INSERT INTO rpt_fxq_tb_ins_unit_ms (
    company_code1, company_code2, cst_no,open_time,close_time,acc_name,address,operate,set_file,license,
    id_deadline,org_no,tax_no,rep_name,id_type2,id_no2,id_deadline2,man_name,id_type3,id_no3,id_deadline3,
    ope_name,id_type4,id_no4,id_deadline4,industry_code,industry,reg_amt,code,sys_name,pt
)
select 
	ifnull(substring_index(company_code1,',',1) ,'@N') company_code1
	,ifnull(substring_index(company_code2,',',1) ,'@N') company_code2
	,ifnull(substring_index(cst_no,',',1) ,'@N') cst_no
	,ifnull(substring_index(open_time,',',1) ,'@N') open_time
	,ifnull(substring_index(close_time,',',1) ,'@N') close_time
	,ifnull(substring_index(acc_name,',',1) ,'@N') acc_name
	,ifnull(substring_index(address,',',1) ,'@N') address
	,ifnull(substring_index(operate,',',1) ,'@N') operate
	,ifnull(substring_index(set_file,',',1) ,'@N') set_file
	,ifnull(substring_index(license,',',1) ,'@N') license
	,ifnull(substring_index(id_deadline,',',1) ,'@N') id_deadline
	,ifnull(substring_index(org_no,',',1) ,'@N') org_no
	,ifnull(substring_index(tax_no,',',1) ,'@N') tax_no
	,ifnull(substring_index(rep_name,',',1) ,'@N') rep_name
	,ifnull(substring_index(id_type2,',',1) ,'@N') id_type2
	,ifnull(substring_index(id_no2,',',1) ,'@N') id_no2
	,ifnull(substring_index(id_deadline2,',',1) ,'@N') id_deadline2
	,ifnull(substring_index(man_name,',',1) ,'@N') man_name
	,ifnull(substring_index(id_type3,',',1) ,'@N') id_type3
	,ifnull(substring_index(id_no3,',',1) ,'@N') id_no3
	,ifnull(substring_index(id_deadline3,',',1) ,'@N') id_deadline3
	,ifnull(substring_index(ope_name,',',1) ,'@N') ope_name
	,ifnull(substring_index(id_type4,',',1) ,'@N') id_type4
	,ifnull(substring_index(id_no4,',',1) ,'@N') id_no4
	,ifnull(substring_index(id_deadline4,',',1) ,'@N') id_deadline4
	,ifnull(substring_index(industry_code,',',1) ,'@N') industry_code
	,ifnull(substring_index(industry,',',1) ,'@N') industry
	,ifnull(substring_index(reg_amt,',',1) ,'-9999') reg_amt
	,ifnull(substring_index(code,',',1) ,'@N') code
	,'' sys_name
	,'20190704000000' pt
from (
    select     
		company_code1 company_code1
		,company_code2 company_code2
		,cst_no
		,group_concat(open_time order by cst_no, biz_type) open_time
		,group_concat(close_time order by cst_no, biz_type) close_time
		,group_concat(acc_name order by cst_no, biz_type) acc_name
		,group_concat(address order by cst_no, biz_type) address
		,group_concat(operate order by cst_no, biz_type) operate
		,group_concat(set_file order by cst_no, biz_type) set_file
		,group_concat(license order by cst_no, biz_type) license
		,group_concat(id_deadline order by cst_no, biz_type) id_deadline
		,group_concat(org_no order by cst_no, biz_type) org_no
		,group_concat(tax_no order by cst_no, biz_type) tax_no
		,group_concat(rep_name order by cst_no, biz_type) rep_name
		,group_concat(id_type2 order by cst_no, biz_type) id_type2
		,group_concat(id_no2 order by cst_no, biz_type) id_no2
		,group_concat(id_deadline2 order by cst_no, biz_type) id_deadline2
		,group_concat(man_name order by cst_no, biz_type) man_name
		,group_concat(id_type3 order by cst_no, biz_type) id_type3
		,group_concat(id_no3 order by cst_no, biz_type) id_no3
		,group_concat(id_deadline3 order by cst_no, biz_type) id_deadline3
		,group_concat(ope_name order by cst_no, biz_type) ope_name
		,group_concat(id_type4 order by cst_no, biz_type) id_type4
		,group_concat(id_no4 order by cst_no, biz_type) id_no4
		,group_concat(id_deadline4 order by cst_no, biz_type) id_deadline4
		,group_concat(industry_code order by cst_no, biz_type) industry_code
		,group_concat(industry order by cst_no, biz_type) industry
		,group_concat(reg_amt order by cst_no, biz_type) reg_amt
		,group_concat(code order by cst_no, biz_type) code
	from rtp_fxq_tb_ply_party_unit
	group by cst_no, company_code1
) vw
COMMIT;

----------------------------------------------                                              
CREATE TABLE `rtp_fxq_tb_ply_party_bo` (
  `company_code1` varchar(20) DEFAULT NULL COMMENT '机构网点代码',
  `company_code2` varchar(16) DEFAULT NULL COMMENT '金融机构编码',
  `acc_name` varchar(120) DEFAULT NULL COMMENT '客户名称',
  `cst_no` varchar(50) DEFAULT NULL COMMENT '客户号',
  `license` varchar(50) DEFAULT NULL COMMENT '依法设立或经营的执照号码，单位客户身份证件号码',
  `bnf_name` varchar(40) DEFAULT NULL COMMENT '受益所有人姓名',
  `bnf_type` varchar(2) DEFAULT NULL COMMENT '判定受益所有人方式',
  `shareholding_ratio` decimal(4,2) DEFAULT NULL COMMENT '持股数量或表决所占比重',
  `bnf_address` varchar(120) DEFAULT NULL COMMENT '受益所有人居住地址',
  `id_type5` varchar(8) DEFAULT NULL COMMENT '受益所有人身份证件类型',
  `id_no5` varchar(50) DEFAULT NULL COMMENT '受益所有人身份证件号码',
  `id_deadline5` varchar(8) DEFAULT NULL COMMENT '受益所有人身份证件有效期限到期日',
  `sys_name` varchar(120) DEFAULT NULL COMMENT '系统名称',
  `pt` varchar(15) DEFAULT NULL COMMENT '分区字段'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='受益所有人身份信息记录清单表'
/*!50500 PARTITION BY RANGE  COLUMNS(pt)
(PARTITION pt20190704000000 VALUES LESS THAN ('20190704999999') ENGINE = InnoDB) */

insert into rtp_fxq_tb_ply_party_bo(
    company_code1,company_code2
    ,acc_name,cst_no,license,bnf_name,bnf_type,shareholding_ratio,bnf_address,id_type5,id_no5,id_deadline5
    ,sys_name,pt
)
select 
    null company_code1
    ,null company_code2
    ,a.c_app_nme acc_name
    ,concat(rpad(a.c_certf_cls, 6, '0') , rpad(a.c_certf_cde, 18, '0')) cst_no -- 客户号 cst_no
	-- ,concat(b.c_bnfc_cert_typ, b.c_bnfc_cert_no) cst_bo_no
    -- ,a.c_buslicence_no license
    ,concat(rpad(b.c_bnfc_cert_typ, 6, '0'), rpad(b.c_bnfc_cert_no, 18, '0')) license
    ,b.c_bnfc_nme bnf_name
    ,null bnf_type
    ,null shareholding_ratio
    ,null bnf_address
    ,b.c_bnfc_cert_typ id_type5
    ,b.c_bnfc_cert_no id_no5
    ,null id_deadline5
    ,null sys_name
    ,null pt
from ods_cthx_web_ply_applicant  partition(pt{lastday}000000) a
    inner join ods_cthx_web_app_grp_member  partition(pt{lastday}000000) b on a.c_app_no = b.c_app_no

SELECT @@global.group_concat_max_len;
SET GLOBAL group_concat_max_len=10240;
INSERT INTO rpt_fxq_tb_ins_bo_ms(
    company_code1,company_code2
    ,acc_name,cst_no,license,bnf_name,bnf_type,shareholding_ratio,bnf_address,id_type5,id_no5,id_deadline5
    ,sys_name,pt
)
select 
    null company_code1
    ,null company_code2
    ,ifnull(substring_index(acc_name,',',1) ,'@N') acc_name
    ,ifnull(substring_index(cst_no,',',1) ,'@N') cst_no
    -- ,ifnull(substring_index(cst_bo_no,',',1) ,'@N') cst_bo_no
    ,ifnull(substring_index(license,',',1) ,'@N') license
    ,ifnull(substring_index(bnf_name,',',1) ,'@N') bnf_name
    ,ifnull(substring_index(bnf_type,',',1) ,'@N') bnf_type
    ,ifnull(substring_index(shareholding_ratio,',',1) ,'@N') shareholding_ratio
    ,ifnull(substring_index(bnf_address,',',1) ,'@N') bnf_address
    -- ,ifnull(substring_index(id_type5,',',1) ,'@N') id_type5
    ,case substring_index(id_type5,',',1)
        when '120001' then 11 -- 居民身份证
        when '120002' then 13 -- 护照
        when  '120003' then 12 -- 军人证
        when  '120004' then 13 -- 回乡证
        when '120005' then 14 -- 港澳居民居住证
        when '120006' then 14 -- 台湾居民居住证
        when '120009' then 18 -- 其它
    else 
        18 -- 其它
    end as id_type5,-- 受益所有人证件类型
    ,ifnull(substring_index(id_no5,',',1) ,'@N') id_no5
    ,ifnull(substring_index(id_deadline5,',',1) ,'@N') id_deadline5
	,'' sys_name
	,'20190704000000' pt
from (
	select     
        group_concat(cst_no order by license, id_type5, id_no5) cst_no
        -- ,group_concat(cst_bo_no order by cst_no, id_type5, id_no5) cst_bo_no
        ,group_concat(acc_name order by license, id_type5, id_no5) acc_name
        ,group_concat(license order by license, id_type5, id_no5) license
        ,group_concat(bnf_name order by license, id_type5, id_no5) bnf_name
        ,group_concat(bnf_type order by license, id_type5, id_no5) bnf_type
        ,group_concat(shareholding_ratio order by license, id_type5, id_no5) shareholding_ratio
        ,group_concat(bnf_address order by license, id_type5, id_no5) bnf_address
        ,group_concat(id_type5 order by license, id_type5, id_no5) id_type5
        ,group_concat(id_no5 order by license, id_type5, id_no5) id_no5
        ,group_concat(id_deadline5 order by license, id_type5, id_no5) id_deadline5
	from rtp_fxq_tb_ply_party_bo
	group by license, id_type5, id_no5
) vw