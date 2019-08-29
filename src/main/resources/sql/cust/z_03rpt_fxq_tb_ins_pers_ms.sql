/*
select count(1) from information_schema.partitions 
where table_schema = schema() 
    and table_name='rpt_fxq_tb_ins_pers_ms' 
    and partition_name = 'pt20190827000000';

alter table rpt_fxq_tb_ins_pers_ms add partition (partition pt20190827000000 values less than ('{lastday}999999'));

alter table rpt_fxq_tb_ins_pers_ms truncate partition pt20190827000000;
*/
truncate table rpt_fxq_tb_ins_pers_ms;

INSERT INTO rpt_fxq_tb_ins_pers_ms(
        company_code1,
        company_code2,
        cst_no,
        open_time,
        close_time,
        acc_name,
        cst_sex,
        nation,
        id_type,
        id_no,
        id_deadline,
        occupation_code,
        occupation,
        income,
        contact1,
        contact2,
        contact3,
        address1,
        address2,
        address3,
        company,
        sys_name,
        pt
)
SELECT
        null		company_code1,
        c_dpt_cde		company_code2,
        c_cst_no		cst_no,
        date_format(t_open_time,'%Y%m%d')		open_time,
        date_format(t_close_time,'%Y%m%d')		close_time,
        c_acc_name		acc_name,
        case c_cst_sex
        when '1' then '11' -- 11:男
        when '2' then '12' -- 12:女
        else 
        '-1' -- 其它
        end	cst_sex,
        case 
        when c_country = '1' then 'CHN' -- 居民身份证
        else 
            'CHN' -- 其它
        end  		nation,
        case c_cert_cls
        when  '120001' then 11 -- 居民身份证
        when  '120002' then 13 -- 护照
        when  '120003' then 12 -- 军人证
        when  '120004' then 13 -- 回乡证
        when  '120005' then 14 -- 港澳居民居住证
        when  '120006' then 14 -- 台湾居民居住证
        when  '120009' then 18 -- 其它
        else 
        18 -- 其它
        end id_type,
        c_cert_cde		id_no,
        date_format(t_cert_end_date,'%Y%m%d')		id_deadline,
        c_occup_cde		occupation_code,
        c_occup_sub_cde		occupation,
        n_income		income,
        c_mobile		contact1,
        null		contact2,
        null		contact3,
        c_clnt_addr		address1,
        null		address2,
        null		address3,
        c_work_dpt		company,
        null		sys_name,
        '20190827' pt
FROM
    edw_cust_pers_info partition(pt20190827000000);