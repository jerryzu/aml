/*
select count(1) from information_schema.partitions 
where table_schema = schema() 
    and table_name='rpt_fxq_tb_ins_rpol_ms' 
    and partition_name = 'pt{lastday}000000';

alter table rpt_fxq_tb_ins_rpol_ms add partition (partition pt{lastday}000000 values less than ('{lastday}999999'));

alter table rpt_fxq_tb_ins_rpol_ms truncate partition pt{lastday}000000;
*/
truncate table rpt_fxq_tb_ins_rpol_ms;

INSERT INTO rpt_fxq_tb_ins_rpol_ms(
        company_code1,
        company_code2,
        company_code3,
        pol_no,
        app_no,
        ins_state,
        sale_type,
        sale_name,
        ins_date,
        eff_date,
        app_name,
        app_cst_no,
        app_id_type,
        app_id_no,
        ins_name,
        ins_cst_no,
        ins_id_no,
        ins_cus_pro,
        relation,
        legal_type,
        benefit_cus_pro,
        benefit_name,
        benefit_cst_no,
        benefit_id_no,
        ins_no,
        cur_code,
        pre_amt,
        usd_amt,
        prof_type,
        del_way,
        del_period,
        `limit`,
        subject,
        tsf_flag,
        acc_name,
        acc_no,
        acc_bank,
        receipt_no,
        pt
)
select 
        a.c_dpt_cde as company_codel,-- 机构网点代码
        ''  as company_code2,-- 金融机构编码
        '' as company_code3,-- 保单归属机构网点代码
        a.c_ply_no as  pol_no,-- 保单号
        a.c_app_no as app_no,-- 投保单号
        a.c_ply_sts as ins_state,-- 保单状态
        a.c_bsns_typ as sale_type,-- 销售渠道
        a.c_bsns_subtyp as sale_name,-- 销售渠道名称
        date_format(a.t_app_tm,'%Y%m%d') as ins_date,-- 投保日期
        date_format(a.t_insrnc_bgn_tm,'%Y%m%d') as eff_date,-- 合同生效日期
        a1.c_acc_name as app_name,-- 投保人名称
        a1.c_cst_no as app_cst_no,-- 投保人客户号
        case a1.c_cert_cls
        when  '120001' then 11 -- 居民身份证
        when  '120002' then 13 -- 护照
        when  '120003' then 12 -- 军人证
        when  '120004' then 13 -- 回乡证
        when  '120005' then 14 -- 港澳居民居住证
        when  '120006' then 14 -- 台湾居民居住证
        when  '120009' then 18 -- 其它
        else 
        18 -- 其它
        end as app_id_type,-- 投保人身份证件类型
        a1.c_cert_cde as app_id_no,-- 投保人证件号码
        i.c_acc_name as ins_name,-- 被保险人名称
        i.c_cst_no as ins_cst_no,-- 被保险人客户号
        i.c_cert_cde as ins_id_no,-- 被保险人证件号码
        pi.c_clnt_mrk as ins_cus_pro,-- 被保险人客户类型
        case id.c_app_relation 
        -- select concat('when ''', c_cde, ''' then '' '' -- ',  c_cnm) from ods_cthx_web_bas_comm_code partition(pt{lastday}000000) where c_par_cde = '601' order by c_cde 
        -- 11: 本人； 12：配偶； 13：父母； 14：子女 15：其他近亲属 16 雇佣或劳务 17：其他  --tb_ins_rpay  tb_ins_rpol
        when '601001' then '12' -- 配偶
        when '601002' then '13' -- 父母
        when '601003' then '14' -- 子女
        when '601004' then '17' -- 兄弟姐妹
        when '601005' then '11' -- 本人
        when '601006' then '17' -- 雇主
        when '601007' then '16' -- 雇员
        when '601008' then '17' -- 祖父母、外祖父母
        when '601009' then '17' -- 祖孙、外祖孙
        when '601010' then '17' -- 监护人
        when '601011' then '17' -- 被监护人
        when '601012' then '17' -- 朋友
        when '601013' then '17' -- 未知
        when '601014' then '17' -- 其他
        else
        '@N' -- 其它
        end as relation,-- 投保人、被保险人之间的关系
        '' as legal_type,-- 受益人标识
        '' as benefit_cus_pro,-- 受益人类型
        b.c_acc_name as  benefit_name,-- 受益人名称
        b.c_cst_no as  benefit_cst_no,-- 受益人客户号
        b.c_cert_cde as benefit_id_no,-- 受益人身份证号码
        a.c_prod_no as ins_no,-- 险种代码
        /*SELECT C_PAR_CDE, C_CDE, C_CNM FROM ods_cthx_web_bas_codelist WHERE C_PAR_CDE = 'M03' */
        case a.c_prm_cur 
        when  '01' then 'CNY' -- 人民币
        when  '02' then 'USD' -- 美元
        when  '03' then 'HKD' -- 港币
        when  '04' then 'CHF' -- 瑞士法郎
        when  '05' then 'FF' -- 法国法郎
        when  '06' then 'JPY' -- 日元
        when  '07' then 'GBP' -- 英镑
        when  '08' then 'EUR' -- 欧元
        when  '09' then 'DM' -- 德国马克
        when  '10' then 'SEK' -- 瑞典克朗
        else 
        '@N' -- 其它
        end as cur_code,-- 币种
        a.n_prm as pre_amt,-- 本期交保费金额
        '' as usd_amt,-- 折合美元金额
        /* case c.c_kind_no
	when '01' then '11'
	when '02' then '11'
	when '03' then '10'
	when '04' then '13'
	when '05' then '15'
	when '06' then '14'
	when '07' then '14'
	when '08' then '11'
	when '09' then '11'
	when '10' then '16'
	when '11' then '12'
	when '12' then '15'
	when '16' then '16'
	else '其他'
	end */ 
        12 as  prof_type,-- 业务种类 11:人身保险;12:财产保险;
        11 as del_way,-- 交费方式 -- 11:趸交;12:期缴;13:不定期缴
        14 as del_period,-- 缴费间隔 -- 11:年缴;12:季缴;13:月缴;14:其他;
        1 as `limit`,-- 交费期数  趸交为1;终身缴费填写9999.填写实际期数.
        '' as subject,-- 保险标的物
        -- 修改成从资金系统取以下数据
        '' as tsf_flag,-- d.c_pay_mde_cde  as tsf_flag,-- 现转标识 --  SELECT C_CDE, C_CNM, 'codeKind' FROM  ods_cthx_WEB_BAS_CODELIST PARTITION(pt20190818000000)   WHERE C_PAR_CDE = 'shoufeifangshi' ORDER BY C_CDE ;
        '' as acc_name,-- 交费账号名称
        '' as acc_no,-- 交费账号
        '' as acc_bank,-- 交费账户开户机构名称
        a.c_app_no  as receipt_n,-- 作业流水号,唯一标识号
        '{lastday}'		pt
from ods_cthx_web_ply_base partition(pt{lastday}000000) a
        left join ods_cthx_web_ply_insured partition(pt{lastday}000000) id on a.c_ply_no=id.c_ply_no
        left join edw_cust_ply_party partition(pt{lastday}000000) pa on a.c_ply_no=pa.c_ply_no and pa.c_biz_type =  21 -- 10: 收款人, 21: 投保人, 22: 法人投保人, 31:被保人, 32:法人被保人, 41: 受益人, 42: 法人受益人, 43: 间接受益人, 44: 法人间接受益人
        left join edw_cust_pers_info partition(pt{lastday}000000) a1 on pa.c_cst_no =a1.c_cst_no

        left join edw_cust_ply_party partition(pt{lastday}000000) pi on a.c_ply_no=pi.c_ply_no and pi.c_biz_type =  31 -- 10: 收款人, 21: 投保人, 22: 法人投保人, 31:被保人, 32:法人被保人, 41: 受益人, 42: 法人受益人, 43: 间接受益人, 44: 法人间接受益人        
        left join edw_cust_pers_info partition(pt{lastday}000000) i on pi.c_cst_no =i.c_cst_no
        
        left join edw_cust_ply_party partition(pt{lastday}000000) pb on a.c_ply_no=pb.c_ply_no and pb.c_biz_type =  41 -- 10: 收款人, 21: 投保人, 22: 法人投保人, 31:被保人, 32:法人被保人, 41: 受益人, 42: 法人受益人, 43: 间接受益人, 44: 法人间接受益人
        left join edw_cust_pers_info partition(pt{lastday}000000) b on pb.c_cst_no =b.c_cst_no
        
	-- left join ods_cthx_web_prd_prod partition(pt{lastday}000000) c on a.c_prod_no=c.c_prod_no
where a.t_next_edr_bgn_tm > now() 