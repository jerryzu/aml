alter table rpt_fxq_tb_ins_pers_ms truncate partition future;

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
	a.c_dpt_cde as company_code1, -- 机构网点代码，内部的机构编码
        co.company_code2	company_code2,
        c_cst_no		cst_no,
        date_format(t_open_time,'%Y%m%d')		open_time,
        date_format(t_close_time,'%Y%m%d')		close_time,
        c_acc_name		acc_name,
        case c_cst_sex
        when '1' then '11' -- 11:男
        when '2' then '12' -- 12:女
        else 
        null-- 其它
        end	cst_sex,
        case 
        when c_country = '1' then 'CHN' -- 居民身份证
        else 
            null-- 其它
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
        '{lastday}000000' pt
FROM edw_cust_pers_info partition(future) a
    left join  rpt_fxq_tb_company_ms partition (future) co on co.company_code1 = a.c_dpt_cde