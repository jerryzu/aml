SELECT @@global.group_concat_max_len;
SET SESSION group_concat_max_len=10240;
alter table edw_cust_pers_info truncate partition pt20190808000000;

INSERT INTO edw_cust_pers_info(
    c_dpt_cde,
    c_cst_no,
    t_open_time,
    t_close_time,
    c_acc_name,
    c_cst_sex,
    c_country,
    c_cert_cls,
    c_cert_cde,
    t_cert_end_date,
    c_occup_cde,
    c_occup_sub_cde,
    n_income,
    c_mobile,
    c_clnt_addr,
    c_work_dpt,
    pt
)
select 
    substring_index(c_dpt_cde,',',1) c_dpt_cde
	-- 1.个人(1),团体(2)	2.身份证类型	3.身份证号	4.序列号(忽略)	5.校验位(1位)
	-- c_cst_no已经处理了2. 3. 4.暂时忽略, 这里只需要处理1.5.
	-- 开始(1)标识为个人
	-- c_cst_no已经编码由身份证类型6位,身份证号码18位组成,这里校验码取倒数第7位至倒数第2位与9取MOD
    ,concat('1', c_cst_no, mod(substr(c_cst_no, -7, 6), 9)) c_cst_no
    ,t_open_time t_open_time
    ,t_close_time  t_close_time
    ,substring_index(c_acc_name,',',1) c_acc_name
    ,substring_index(c_cst_sex,',',1) c_cst_sex
    ,substring_index(c_country,',',1) c_country
    ,substring_index(c_cert_cls,',',1) c_cert_cls
    ,substring_index(c_cert_cde,',',1) c_cert_cde
    ,substring_index(c_cert_end_date,',',1) c_cert_end_date
    ,substring_index(c_occup_cde,',',1) c_occup_cde
    ,substring_index(c_occup_sub_cde,',',1) c_occup_sub_cde
    ,substring_index(n_income,',',1) n_income
    ,substring_index(c_mobile,',',1) c_mobile
    ,substring_index(c_clnt_addr,',',1) c_clnt_addr
    ,substring_index(c_work_dpt,',',1) c_work_dpt
    ,'20190808' pt
from (
	select     
	    group_concat(c_dpt_cde order by biz_type)  c_dpt_cde
	    ,c_cst_no -- ,group_concat(c_cst_no order by biz_type)  c_cst_no
	    ,min(t_open_time)  t_open_time
	    ,max(ifnull(t_close_time,adddate('9999-12-31',0)))  t_close_time
	    ,group_concat(c_acc_name order by biz_type)  c_acc_name
	    ,group_concat(c_cst_sex order by biz_type)  c_cst_sex
	    ,group_concat(c_country order by biz_type)  c_country
	    ,group_concat(c_cert_cls order by biz_type)  c_cert_cls
	    ,group_concat(c_cert_cde order by biz_type)  c_cert_cde
	    ,group_concat(c_cert_end_date order by biz_type)  c_cert_end_date
	    ,group_concat(c_occup_cde order by biz_type)  c_occup_cde
	    ,group_concat(c_occup_sub_cde order by biz_type)  c_occup_sub_cde
	    ,group_concat(n_income order by biz_type)  n_income
	    ,group_concat(c_mobile order by biz_type)  c_mobile
	    ,group_concat(c_clnt_addr order by biz_type)  c_clnt_addr
	    ,group_concat(c_work_dpt order by biz_type)  c_work_dpt
	from (
		select distinct b.c_dpt_cde c_dpt_cde
		    ,concat(rpad(c_bnfc_cert_typ, 6, '0') , rpad(c_bnfc_cert_no, 18, '0'))  c_cst_no -- 被保人编码  
		    ,date_format(b.t_insrnc_bgn_tm, '%Y%m%d') t_open_time
		    ,date_format(greatest(b.t_insrnc_bgn_tm,b.t_udr_tm,coalesce(b.t_edr_bgn_tm,b.t_insrnc_bgn_tm)), '%Y%m%d') t_close_time
		    ,c_bnfc_nme c_acc_name -- 受益人 
		    ,null c_cst_sex
		    ,c_country  -- 国籍
		    ,c_bnfc_cert_typ  c_cert_cls -- 受益人证件类型
		    ,c_bnfc_cert_no c_cert_cde -- 受益人证件号码 
		    ,null c_cert_end_date
		    ,c_occup_cde -- 职业代码
		    ,c_occup_sub_cde   -- 职业细分
		    ,null n_income
		    ,null c_mobile
		    ,null c_clnt_addr
		    ,null c_work_dpt
		    ,null biz_type
		from ods_cthx_web_app_grp_member  partition(pt20190808000000)  a
            inner join ods_cthx_web_ply_base partition(pt20190808000000) b on a.c_app_no = b.c_app_no
            -- inner join ods_cthx_web_ply_bnfc partition(pt20190808000000) bn  on bn.c_app_no = b.c_app_no
		-- where bn.c_clnt_mrk = 1
		union 
		select b.c_dpt_cde c_dpt_cde
		    ,concat(rpad(c_certf_cls, 6, '0') , rpad(c_certf_cde, 18, '0')) c_cst_no -- 被保人编码  
		    ,date_format(b.t_insrnc_bgn_tm, '%Y%m%d') t_open_time
		    ,date_format(greatest(b.t_insrnc_bgn_tm,b.t_udr_tm,coalesce(b.t_edr_bgn_tm,b.t_insrnc_bgn_tm)), '%Y%m%d') t_close_time
		    ,c_insured_nme c_acc_name -- 被保人名称
		    ,c_sex c_cst_sex -- 性别
		    ,c_aml_country c_country -- 国籍
		    ,c_certf_cls -- 证件类型
		    ,c_certf_cde -- 证件号码
		    ,date_format(t_certf_end_date, '%Y%m%d')  c_cert_end_date -- 证件有效期止
		    ,c_occup_cde -- 职业代码  
		    ,null c_occup_sub_cde 
		    ,n_income  -- 年薪
		    ,c_mobile  -- 移动电话
		    ,c_clnt_addr -- 地址
		    ,c_work_dpt -- 工作单位
		    ,null biz_type
		from ods_cthx_web_app_insured  partition(pt20190808000000)  a
            inner join ods_cthx_web_ply_base partition(pt20190808000000) b on a.c_app_no = b.c_app_no
		where a.c_clnt_mrk = 1
		union
		select b.c_dpt_cde c_dpt_cde
		    ,concat(rpad(c_card_type, 6, '0') , rpad(c_card_cde, 18, '0')) c_cst_no -- 收款人编号
		    ,date_format(b.t_insrnc_bgn_tm, '%Y%m%d') t_open_time
		    ,date_format(greatest(b.t_insrnc_bgn_tm,b.t_udr_tm,coalesce(b.t_edr_bgn_tm,b.t_insrnc_bgn_tm)), '%Y%m%d') t_close_time
		    ,c_payee_nme c_acc_name -- 收款人名称
		    ,null c_cst_sex
		    ,null c_country
		    ,c_card_type c_cert_cls -- 证件类型
		    ,c_card_cde c_cert_cde -- 证件号码 
		    ,null c_cert_end_date
		    ,null c_occup_cde
		    ,null c_occup_sub_cde
		    ,null n_income
		    ,c_tel_no c_mobile-- 收款人手机号码
		    ,null c_clnt_addr
		    ,null c_work_dpt
		    ,null biz_type
		from ods_cthx_web_clm_bank  partition(pt20190808000000)  a
		    inner join ods_cthx_web_clm_main partition(pt20190808000000) c on a.c_clm_no = c.c_clm_no
            inner join ods_cthx_web_ply_base  partition(pt20190808000000) b on c.c_ply_no = b.c_ply_no
		union 
		select b.c_dpt_cde c_dpt_cde
		    ,concat(rpad(c_certf_cls, 6, '0') , rpad(c_certf_cde, 18, '0')) c_cst_no -- 投保人代码,投保人唯一客户代码
		    ,date_format(b.t_insrnc_bgn_tm, '%Y%m%d') t_open_time
		    ,date_format(greatest(b.t_insrnc_bgn_tm,b.t_udr_tm,coalesce(b.t_edr_bgn_tm,b.t_insrnc_bgn_tm)), '%Y%m%d') t_close_time
		    ,c_app_nme c_acc_name -- 投保人名称
		    ,c_sex c_cst_sex -- 性别
		    ,c_aml_country c_country -- 国籍
		    ,c_certf_cls  -- 证件类型
		    ,c_certf_cde  -- 证件号码
		    ,date_format(t_certf_end_date, '%Y%m%d') t_certf_end_date -- 证件有效期止
		    ,c_occup_cde  -- 职业代码
		    ,null c_occup_sub_cde
		    ,null n_income
		    ,c_mobile  -- 移动电话
		    ,c_clnt_addr c_clnt_addr -- 地址
		    ,c_work_dpt  -- 工作单位
		    ,null biz_type
		from ods_cthx_web_ply_applicant  partition(pt20190808000000)  a
            inner join ods_cthx_web_ply_base partition(pt20190808000000) b on a.c_app_no = b.c_app_no
		where a.c_clnt_mrk = 1
		union
		select b.c_dpt_cde c_dpt_cde
		    ,concat(rpad(c_certf_cls, 6, '0') , rpad(c_certf_cde, 18, '0')) c_cst_no-- 受益人代码,受益人唯一客户代码
		    ,date_format(b.t_insrnc_bgn_tm, '%Y%m%d') t_open_time
		    ,date_format(greatest(b.t_insrnc_bgn_tm,b.t_udr_tm,coalesce(b.t_edr_bgn_tm,b.t_insrnc_bgn_tm)), '%Y%m%d') t_close_time
		    ,c_bnfc_nme c_acc_name -- 受益人名称
		    ,c_sex  c_cst_sex -- 性别
		    ,c_country -- 国家
		    ,c_certf_cls -- 证件类型
		    ,c_certf_cde --  证件号码
		    ,null t_certf_end_date
		    ,null occupation_code
		    ,null occupation
		    ,null n_income
		    ,c_mobile  c_mobile -- 移动电话
		    ,null  c_clnt_addr -- 地址
		    ,null c_work_dpt  -- 工作单位
		    ,null biz_type
		from ods_cthx_web_ply_bnfc  partition(pt20190808000000)  a
            inner join ods_cthx_web_ply_base partition(pt20190808000000) b on a.c_app_no = b.c_app_no
		where a.c_clnt_mrk = 1
		) vw
	group by c_cst_no
) vw