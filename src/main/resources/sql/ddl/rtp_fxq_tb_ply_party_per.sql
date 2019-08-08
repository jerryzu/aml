CREATE TABLE `rtp_fxq_tb_ply_party_pers` (
        company_code1 VARCHAR(20) COMMENT '机构网点代码',
        company_code2 VARCHAR(16) COMMENT '金融机构编码',
        cst_no VARCHAR(100) COMMENT '客户号',
        open_time VARCHAR(8) COMMENT '客户号创建日期',
        close_time VARCHAR(8) COMMENT '结束日期',
        acc_name VARCHAR(40) COMMENT '客户名称',
        cst_sex VARCHAR(2) COMMENT '性别',
        nation VARCHAR(3) COMMENT '国籍地区',
        id_type VARCHAR(2) COMMENT '身份证件种类',
        id_no VARCHAR(50) COMMENT '身份证件号码',
        id_deadline VARCHAR(8) COMMENT '身份证件有效期限到期日',
        occupation_code VARCHAR(80) COMMENT '职业代码',
        occupation VARCHAR(80) COMMENT '职业',
        income DECIMAL(16,2) COMMENT '年收入',
        contact1 VARCHAR(20) COMMENT '联系方式,客户手机或固定电话号码',
        contact2 VARCHAR(20) COMMENT '联系方式2',
        contact3 VARCHAR(20) COMMENT '联系方式3',
        address1 VARCHAR(500) COMMENT '住所地或工作单位地址',
        address2 VARCHAR(500) COMMENT '住所地或工作单位地址2',
        address3 VARCHAR(500) COMMENT '住所地或工作单位地址3',
        company VARCHAR(120) COMMENT '客户工作单位名称',
        sys_name VARCHAR(120) COMMENT '系统名称',
        biz_type int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO rtp_fxq_tb_ply_party_pers(
	company_code1,company_code2,cst_no,open_time,close_time,
	acc_name,cst_sex,nation,id_type,id_no,id_deadline,occupation_code,occupation,income,
	contact1,contact2,contact3,address1,address2,address3,company,sys_name,biz_type
)
select distinct null company_code1
    ,null company_code2
    ,concat(rpad(c_bnfc_cert_typ, 6, '0') , rpad(c_bnfc_cert_no, 18, '0'))  cst_no -- 被保人编码  
    ,null open_time
    ,null close_time
    ,c_bnfc_nme acc_name -- 受益人 
    ,null cst_sex
    ,c_country nation  -- 国籍
    ,c_bnfc_cert_typ  id_type -- 受益人证件类型
    ,c_bnfc_cert_no id_no -- 受益人证件号码 
    ,null id_deadline
    ,concat(c_occup_cde, '-', c_occup_sub_cde) occupation_code -- 职业代码
    ,'' occupation   -- 职业细分
    ,null income
    ,null contact1
    ,null contact2
    ,null contact3
    ,null address1
    ,null address2
    ,null address3
    ,null company
    ,null sys_name
    ,null biz_type
from ods_cthx_web_app_grp_member partition(pt{lastday}000000) 
union 
select
    null company_code1
    ,null company_code2
    ,concat(rpad(c_certf_cls, 6, '0') , rpad(c_certf_cde, 18, '0')) cst_no -- 被保人编码  
    ,null open_time
    ,null close_time
    ,c_insured_nme acc_name -- 被保人名称
    ,c_sex cst_sex -- 性别
    ,c_aml_country nation -- 国籍
    ,c_certf_cls id_type -- 证件类型
    ,c_certf_cde id_no -- 证件号码
    ,date_format(t_certf_end_date, '%Y%m%d')  id_deadline -- 证件有效期止
    ,c_occup_cde occupation_code -- 职业代码  
    ,null occupation
    ,n_income income -- 年薪
    ,c_mobile contact1 -- 移动电话
    ,c_tel contact2 -- 电话
    ,c_fax contact3 -- 传真
    ,c_clnt_addr address1 -- 地址
    ,c_resid_addr address2 -- 居住地址
    ,c_work_dpt_addr address3 -- 工作单位地址
    ,c_work_dpt company -- 工作单位
    ,null sys_name
    ,null biz_type
from ods_cthx_web_app_insured partition(pt{lastday}000000) 
where c_clnt_mrk = 1
union
select 
    null company_code1
    ,null company_code2
    ,concat(rpad(c_card_type, 6, '0') , rpad(c_card_cde, 18, '0')) cst_no -- 收款人编号
    ,null open_time
    ,null close_time
    ,c_payee_nme acc_name -- 收款人名称
    ,null cst_sex
    ,null nation
    ,c_card_type id_type -- 证件类型
    ,c_card_cde id_no -- 证件号码 
    ,null id_deadline
    ,null occupation_code
    ,null occupation
    ,null income
    ,c_tel_no contact1-- 收款人手机号码
    ,null contact2
    ,null contact3
    ,null address1
    ,null address2
    ,null address3
    ,null company
    ,null sys_name
    ,null biz_type
from ods_cthx_web_clm_bank partition(pt{lastday}000000) 
union 
select
    null company_code1
    ,null company_code2
    ,concat(rpad(c_certf_cls, 6, '0') , rpad(c_certf_cde, 18, '0')) cst_no -- 投保人代码,投保人唯一客户代码
    ,null open_time
    ,null close_time
    ,c_app_nme acc_name -- 投保人名称
    ,c_sex cst_sex -- 性别
    ,c_aml_country nation -- 国籍
    ,c_certf_cls id_type -- 证件类型
    ,c_certf_cde id_no -- 证件号码
    ,date_format(t_certf_end_date, '%Y%m%d') id_deadline -- 证件有效期止
    ,c_occup_cde occupation_code -- 职业代码
    ,null occupation
    ,null income
    ,c_mobile contact1 -- 移动电话
    ,c_tel contact2 -- 固定电话,电话
    ,null contact3
    ,c_clnt_addr address1 -- 地址
    ,null address2
    ,null address3
    ,c_work_dpt company -- 工作单位
    ,null sys_name
    ,null biz_type
from ods_cthx_web_ply_applicant partition(pt{lastday}000000) 
where c_clnt_mrk = 1
union
select
    null company_code1
    ,null company_code2
    ,concat(rpad(c_certf_cls, 6, '0') , rpad(c_certf_cde, 18, '0')) cst_no-- 受益人代码,受益人唯一客户代码
    ,null open_time
    ,null close_time
    ,c_bnfc_nme acc_name -- 受益人名称
    ,c_sex  cst_sex -- 性别
    ,c_country nation -- 国家
    ,c_certf_cls  id_type -- 证件类型
    ,c_certf_cde id_no --  证件号码
    ,null id_deadline
    ,null occupation_code
    ,null occupation
    ,null income
    ,c_tel  contact1 -- 固定电话
    ,c_mobile  contact2 -- 移动电话
    ,null contact3
    ,null address1
    ,null address2
    ,null address3
    ,null company
    ,null sys_name
    ,null biz_type
from ods_cthx_web_ply_bnfc partition(pt{lastday}000000) 
where c_clnt_mrk = 1
------------------------------------------------------

SELECT @@global.group_concat_max_len;
SET GLOBAL group_concat_max_len=10240;


INSERT INTO rpt_fxq_tb_ins_pers_ms(
    company_code1,company_code2,cst_no,open_time,close_time,
    acc_name,cst_sex,nation,id_type,id_no,id_deadline,
    occupation_code,occupation,income,contact1,contact2,contact3,
    address1,address2,address3,company,sys_name,pt
)
select 
    ifnull(substring_index(company_code1,',',1),'@N') company_code1
    ,ifnull(substring_index(company_code2,',',1),'@N') company_code2
    ,ifnull(substring_index(cst_no,',',1),'@N') cst_no
    ,ifnull(substring_index(open_time,',',1),'@N') open_time
    ,ifnull(substring_index(close_time,',',1),'@N') close_time --  没有投保,被保,时提供(另有受益,领款人填写@N)
    ,ifnull(substring_index(acc_name,',',1),'@N') acc_name
    -- ,ifnull(substring_index(cst_sex,',',1),'@N') cst_sex
    ,case substring_index(cst_sex,',',1) 
        when '1' then '11' -- 11:男
        when '2' then '12' -- 12:女
    else 
        '@N' -- 其它
    end  as cst_sex,-- 性别
    -- ,ifnull(substring_index(nation,',',1),'@N') nation
    case substring_index(nation,',',1)
        when '1' then 'CHN' -- 居民身份证
        else 
            'CHN' -- 其它
    end  as nation -- 国籍
    --    ,ifnull(substring_index(id_type,',',1),'@N') id_type
    ,case substring_index(id_type,',',1)
        when '120001' then 11 -- 居民身份证
        when '120002' then 13 -- 护照
        when '120003' then 12 -- 军人证
        when '120004' then 13 -- 回乡证
        when '120005' then 14 -- 港澳居民居住证
        when '120006' then 14 -- 台湾居民居住证
        when '120009' then 18 -- 其它
    else 
        18 -- 其它
    end as id_type -- 身份证件类型
    ,ifnull(substring_index(id_no,',',1),'@N') id_no
    ,ifnull(substring_index(id_deadline,',',1),'@N') id_deadline
    ,ifnull(substring_index(occupation_code,',',1),'@N') occupation_code
    ,ifnull(substring_index(occupation,',',1),'@N') occupation
    ,ifnull(substring_index(income,',',1),'-9999') income
    ,ifnull(substring_index(contact1,',',1),'@N') contact1
    ,ifnull(substring_index(contact2,',',1),'@N') contact2
    ,ifnull(substring_index(contact3,',',1),'@N') contact3
    ,ifnull(substring_index(address1,',',1),'@N') address1
    ,ifnull(substring_index(address2,',',1),'@N') address2
    ,ifnull(substring_index(address3,',',1),'@N') address3
    ,ifnull(substring_index(company,',',1),'@N') company
	,'' sys_name
	,'20190704000000' pt
from (
	select     
	    group_concat(company_code1 order by biz_type)  company_code1
	    , group_concat(company_code2 order by biz_type)  company_code2
	    , group_concat(cst_no order by biz_type)  cst_no
	    , group_concat(open_time order by biz_type)  open_time
	    , group_concat(close_time order by biz_type)  close_time
	    , group_concat(acc_name order by biz_type)  acc_name
	    , group_concat(cst_sex order by biz_type)  cst_sex
	    , group_concat(nation order by biz_type)  nation
	    , group_concat(id_type order by biz_type)  id_type
	    , group_concat(id_no order by id_no)  id_no
	    , group_concat(id_deadline order by biz_type)  id_deadline
	    , group_concat(occupation_code order by biz_type)  occupation_code
	    , group_concat(occupation order by biz_type)  occupation
	    , group_concat(income order by biz_type)  income
	    , group_concat(contact1 order by biz_type)  contact1
	    , group_concat(contact2 order by biz_type)  contact2
	    , group_concat(contact3 order by biz_type)  contact3
	    , group_concat(address1 order by biz_type)  address1
	    , group_concat(address2 order by biz_type)  address2
	    , group_concat(address3 order by biz_type)  address3
	    , group_concat(company order by biz_type)  company
	from rtp_fxq_tb_ply_party_pers
	group by cst_no
) vw