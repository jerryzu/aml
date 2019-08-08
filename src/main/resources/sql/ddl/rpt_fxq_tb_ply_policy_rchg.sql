CREATE TABLE `rpt_fxq_tb_ply_policy_rchg` (
  `company_code1` varchar(20) DEFAULT NULL COMMENT '机构网点代码',
  `company_code2` varchar(16) DEFAULT NULL COMMENT '金融机构编码',
  `company_code3` varchar(20) DEFAULT NULL COMMENT '保单归属机构网点代码',
  `company_code4` varchar(20) DEFAULT NULL COMMENT '受理业务机构网点代码',
  `pol_no` varchar(60) DEFAULT NULL COMMENT '保单号',
  `app_no` varchar(60) DEFAULT NULL COMMENT '投保单号',
  `app_name` varchar(120) DEFAULT NULL COMMENT '投保人名称',
  `app_cst_no` varchar(30) DEFAULT NULL COMMENT '投保人客户号',
  `app_date` varchar(8) DEFAULT NULL COMMENT '申请日期',
  `chg_date` varchar(8) DEFAULT NULL COMMENT '变更或批改日期',
  `chg_no` varchar(60) DEFAULT NULL COMMENT '批单号',
  `item` varchar(2) DEFAULT NULL COMMENT '保全/批改项目',
  `con_bef` varchar(2000) DEFAULT NULL COMMENT '变更内容摘要',
  `pt` varchar(15) DEFAULT NULL COMMENT '分区字段'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查期所有非支付类保全/批改业务清单'
/*!50500 PARTITION BY RANGE  COLUMNS(pt)
(PARTITION pt20190704000000 VALUES LESS THAN ('20190704999999') ENGINE = InnoDB) */

INSERT INTO rpt_fxq_tb_ply_policy_rchg (
    company_code1, company_code2, company_code3, company_code4,
    pol_no,app_no, app_name, app_cst_no, app_date, chg_date,
    chg_no, item, con_bef, pt
)
select
	'' as company_codel,-- 机构网点代码
	'' as company_code2,-- 金融机构编码
	'' as company_code3,-- 保单归属机构网点代码
	'' as company_code4,-- 受理业务机构网点代码
	a.c_ply_no as pol_no,-- 保单号
	a.c_app_no as app_no,-- 投保单号
	b.c_app_nme as app_name,-- 投保人名称
	concat(rpad(b.c_certf_cls, 6, '0') , rpad(b.c_certf_cde, 18, '0')) app_cst_no,-- 投保人客户号
    -- c_app_cde as app_cst_no,-- 投保人客户号
	date_format(a.t_edr_app_tm,'%Y%m%d') as app_date,-- 申请日期
	date_format(a.t_edr_bgn_tm,'%Y%m%d') as chg_date,-- 变更或批改日期
	a.c_edr_no as chg_no,-- 批单号
    case 
        when a.c_edr_rsn_bundle_cde = '22' then 12 -- 变更团单被保险人 -> 12 团险替换被保险人
        -- when a.c_edr_rsn_bundle_cde = 'J1' then 13 -- 减少被保险人 -> 
        -- when a.c_edr_rsn_bundle_cde = 'Z1' then 12 -- 增加被保险人
    end as item, -- 保全/批改项目	11:变更投保人;12:团险替换被保险人;13:变更受益人;14:变更客户(投保人被保人)信息;15:保单转移;
	a.c_edr_ctnt as con_bef, -- 变更内容摘要
    '20190625000000' pt
from ods_cthx_web_ply_base partition(pt20190625000000) a
	inner join ods_cthx_web_ply_applicant partition(pt20190625000000) b on a.c_ply_no=b.c_ply_no
	inner join ods_cthx_web_bas_edr_rsn   partition(pt20190625000000) c on a.c_edr_rsn_bundle_cde=c.c_rsn_cde and substr(a.c_prod_no,1,2)=c.c_kind_no
where c.c_rsn_cde in ('22','-J1','-Z1')


-----------------------------------------------------------------------------------------------------
INSERT INTO rpt_fxq_tb_ins_rchg_ms (
    company_code1, company_code2, company_code3, company_code4,
    pol_no,app_no, app_name, app_cst_no, app_date, chg_date,
    chg_no, item, con_bef, pt
)
select
	'' as company_codel,-- 机构网点代码
	'' as company_code2,-- 金融机构编码
	'' as company_code3,-- 保单归属机构网点代码
	'' as company_code4,-- 受理业务机构网点代码
	a.c_ply_no as pol_no,-- 保单号
	a.c_app_no as app_no,-- 投保单号
	b.c_app_nme as app_name,-- 投保人名称
	concat(rpad(b.c_certf_cls, 6, '0') , rpad(b.c_certf_cde, 18, '0')) app_cst_no,-- 投保人客户号
    -- c_app_cde as app_cst_no,-- 投保人客户号
	date_format(a.t_edr_app_tm,'%Y%m%d') as app_date,-- 申请日期
	date_format(a.t_edr_bgn_tm,'%Y%m%d') as chg_date,-- 变更或批改日期
	a.c_edr_no as chg_no,-- 批单号
    case 
        when a.c_edr_rsn_bundle_cde = '22' then 12 -- 变更团单被保险人 -> 12 团险替换被保险人
        -- when a.c_edr_rsn_bundle_cde = 'J1' then 13 -- 减少被保险人 -> 
        -- when a.c_edr_rsn_bundle_cde = 'Z1' then 12 -- 增加被保险人
    end as item, -- 保全/批改项目	11:变更投保人;12:团险替换被保险人;13:变更受益人;14:变更客户(投保人被保人)信息;15:保单转移;
	a.c_edr_ctnt as con_bef, -- 变更内容摘要
    '20190625000000' pt
from rpt_fxq_tb_ply_policy_rchg a
