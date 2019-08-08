concat(rpad(app_id_type, 6, '0') , rpad(app_id_no, 18, '0')) app_cst_no-- 投保人客户号

    ,case cla_id_type
        when '120001' then 11 -- 居民身份证
        when '120002' then 13 -- 护照
        when '120003' then 12 -- 军人证
        when '120004' then 13 -- 回乡证
        when '120005' then 14 -- 港澳居民居住证
        when '120006' then 14 -- 台湾居民居住证
        when '120009' then 18 -- 其他类个人身份证件
        when '110000' then 21 -- 营业执照(含社会统一信用代码证,多证合一) 
    -- else 
        -- 18 -- 其它
    end as cla_id_type  

web_app_applicant	c_rel_cde	与被保人关系
web_app_bnfc	c_rel_cde	与被保人关系
web_clm_rpt	c_insured_rel	与被保人关系