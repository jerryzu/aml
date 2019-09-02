/*
select count(1) from information_schema.partitions 
where table_schema = schema() 
    and table_name='rpt_fxq_tb_ins_unit_ms' 
    and partition_name = 'pt20190827000000';

alter table rpt_fxq_tb_ins_unit_ms add partition (partition pt20190827000000 values less than ('{lastday}999999'));

alter table rpt_fxq_tb_ins_unit_ms truncate partition pt20190827000000;
*/
truncate table rpt_fxq_tb_ins_unit_ms;

INSERT INTO rpt_fxq_tb_ins_unit_ms(
        company_code1,
        company_code2,
        cst_no,
        open_time,
        close_time,
        acc_name,
        address,
        operate,
        set_file,
        license,
        id_deadline,
        org_no,
        tax_no,
        rep_name,
        id_type2,
        id_no2,
        id_deadline2,
        man_name,
        id_type3,
        id_no3,
        id_deadline3,
        ope_name,
        id_type4,
        id_no4,
        id_deadline4,
        industry_code,
        industry,
        reg_amt,
        code,
        sys_name,
        pt
)
SELECT
        null	        company_code1	,
        c_dpt_cde	        company_code2	,
        c_cst_no	        cst_no	,
        date_format(t_open_time,'%Y%m%d')	        open_time	,
        date_format(t_close_time,'%Y%m%d')	        close_time	,
        c_acc_name	        acc_name	,
        c_clnt_addr	        address	,
        c_manage_area	        operate	,        
        '21'                           set_file,-- 依法设立的执照名称，21营业执照、22其他
        c_buslicence_no	        license	,
        date_format(c_buslicence_valid,'%Y%m%d')	        id_deadline	,
        c_organization_no	        org_no	,
        c_cevenue_no	        tax_no	,
        c_legal_nme	        rep_name	,
        case c_legal_certf_cls
        when '120001' then 11 -- 居民身份证
        when '120002' then 13 -- 护照
        when '120003' then 12 -- 军人证
        when '120004' then 13 -- 回乡证
        when '120005' then 14 -- 港澳居民居住证
        when '120006' then 14 -- 台湾居民居住证
        when '120009' then 18 -- 其它
        else 
        18 -- 其它
        end 	        id_type2	,
        c_legal_certf_cde	        id_no2	,
        date_format(t_legal_cert_end_tm,'%Y%m%d')	        id_deadline2	,
        c_actualholding_nme	        man_name	,
        case c_acth_certf_cls
        when '120001' then 11 -- 居民身份证
        when '120002' then 13 -- 护照
        when '120003' then 12 -- 军人证
        when '120004' then 13 -- 回乡证
        when '120005' then 14 -- 港澳居民居住证
        when '120006' then 14 -- 台湾居民居住证
        when '120009' then 18 -- 其它
        else 
        18 -- 其它
        end id_type3	,
        c_acth_certf_cde	        id_no3	,
        date_format(t_acth_certf_end_tm,'%Y%m%d')	        id_deadline3	,
        c_ope_name	        ope_name	,
        case c_ope_certf_cls
        when '120001' then 11 -- 居民身份证
        when '120002' then 13 -- 护照
        when '120003' then 12 -- 军人证
        when '120004' then 13 -- 回乡证
        when '120005' then 14 -- 港澳居民居住证
        when '120006' then 14 -- 台湾居民居住证
        when '120009' then 18 -- 其它
        else 
        18 -- 其它
        end id_type4,
        c_ope_certf_cde	        id_no4	,
        date_format(t_ope_certf_end_tm,'%Y%m%d')	        id_deadline4	,
        c_trd_cde	        industry_code	,
        c_sub_trd_cde	        industry	,
        n_reg_amt	        reg_amt	,
        null	        code	,
        null	        sys_name	,
        '20190827' pt
FROM
    edw_cust_units_info partition(pt20190827000000);