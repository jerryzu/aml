create table `rpt_fxq_tb_ply_policy_core_factors` (
  `cst_no` varchar(24) character set utf8 collate utf8_bin default null COMMENT '客户号',
  `c_ply_no` varchar(50) character set utf8 collate utf8_bin default null COMMENT '保单号',
  `bgn_tm` varchar(8) default null COMMENT '保险起期',
  `end_tm` varchar(8) default null COMMENT '保险止期',
  `c_clnt_mrk` varchar(1) character set utf8 collate utf8_bin default null COMMENT '客户类型: 0:法人;1:自然人',
  `biz_type` bigint(20) not null default '0' COMMENT '10: 收款人, 21: 投保人, 22: 法人投保人, 31:被保人, 32:法人被保人, 41: 受益人, 42: 法人受益人, 43: 间接受益人, 44: 法人间接受益人',
  `pt` varchar(15) DEFAULT NULL COMMENT '分区字段'
) engine=innodb default charset=utf8
/*!50500 PARTITION BY RANGE  COLUMNS(pt)
(PARTITION pt20190704000000 VALUES LESS THAN ('20190704999999') ENGINE = InnoDB) */

truncate TABLE rpt_fxq_tb_ply_policy_core_factors;
INSERT
INTO
    rpt_fxq_tb_ply_policy_core_factors
    (
        cst_no,
        c_ply_no,
        bgn_tm,
        end_tm,
        c_clnt_mrk,
        biz_type
    )
SELECT
    concat(rpad(c_card_type, 6, '0') , rpad(c_card_cde, 18, '0')) cst_no,
    b.c_ply_no ,
    date_format(t_insrnc_bgn_tm, '%Y%m%d') bgn_tm ,
    date_format(greatest(t_insrnc_bgn_tm,t_udr_tm,COALESCE(t_edr_bgn_tm,t_insrnc_bgn_tm)), '%Y%m%d'
    ) end_tm ,
    CASE
        WHEN LEFT(c_card_type, 1) = '1'
        THEN 0
        WHEN LEFT(c_card_type, 1) = '2'
        THEN 1
    END c_clnt_mrk,
    10  biz_type
FROM
    ods_cthx_web_clm_bank partition(pt{lastday}000000) a
INNER JOIN
    ods_cthx_web_clm_main partition(pt{lastday}000000) b
ON
    a.c_clm_no = b.c_clm_no
INNER JOIN
    ods_cthx_web_ply_base partition(pt{lastday}000000) c
ON
    b.c_ply_no = c.c_ply_no
WHERE
    c.t_next_edr_bgn_tm > now()
UNION
SELECT
    concat(rpad(c_certf_cls, 6, '0') , rpad(c_certf_cde, 18, '0')) cst_no,
    b.c_ply_no ,
    date_format(t_insrnc_bgn_tm, '%Y%m%d') bgn_tm ,
    date_format(greatest(t_insrnc_bgn_tm,t_udr_tm,COALESCE(t_edr_bgn_tm,t_insrnc_bgn_tm)), '%Y%m%d'
    ) end_tm ,
    a.c_clnt_mrk,
    21 biz_type
FROM
    ods_cthx_web_ply_applicant partition(pt{lastday}000000) a
INNER JOIN
    ods_cthx_web_ply_base partition(pt{lastday}000000) b
ON
    a.c_app_no = b.c_app_no
WHERE
    a.c_clnt_mrk = 1 
AND b.t_next_edr_bgn_tm > now()
UNION
SELECT
    concat(rpad(c_certf_cls, 6, '0') , rpad(c_certf_cde, 18, '0')) cst_no,
    b.c_ply_no ,
    date_format(t_insrnc_bgn_tm, '%Y%m%d') bgn_tm ,
    date_format(greatest(t_insrnc_bgn_tm,t_udr_tm,COALESCE(t_edr_bgn_tm,t_insrnc_bgn_tm)), '%Y%m%d'
    ) end_tm ,
    a.c_clnt_mrk,
    31 biz_type
FROM
    ods_cthx_web_app_insured partition(pt{lastday}000000) a 
INNER JOIN
    ods_cthx_web_ply_base partition(pt{lastday}000000) b
ON
    a.c_app_no = b.c_app_no
WHERE
    a.c_clnt_mrk = 1
AND b.t_next_edr_bgn_tm > now()
UNION
SELECT
    concat(rpad(c_certf_cls, 6, '0') , rpad(c_certf_cde, 18, '0')) cst_no,
    b.c_ply_no ,
    date_format(t_insrnc_bgn_tm, '%Y%m%d') bgn_tm ,
    date_format(greatest(t_insrnc_bgn_tm,t_udr_tm,COALESCE(t_edr_bgn_tm,t_insrnc_bgn_tm)), '%Y%m%d'
    ) end_tm ,
    a.c_clnt_mrk,
    41 biz_type
FROM
    ods_cthx_web_ply_bnfc partition(pt{lastday}000000) a
INNER JOIN
    ods_cthx_web_ply_base partition(pt{lastday}000000) b
ON
    a.c_app_no = b.c_app_no
WHERE
    a.c_clnt_mrk = 1 
AND b.t_next_edr_bgn_tm > now()
UNION
SELECT
    concat(rpad(m.c_bnfc_cert_typ, 6, '0') , rpad(m.c_bnfc_cert_no, 18, '0')) cst_no,
    b.c_ply_no ,
    date_format(t_insrnc_bgn_tm, '%Y%m%d') bgn_tm ,
    date_format(greatest(t_insrnc_bgn_tm,b.t_udr_tm,COALESCE(t_edr_bgn_tm,t_insrnc_bgn_tm)),
    '%Y%m%d') end_tm ,
    a.c_clnt_mrk ,
    43 biz_type
FROM
    ods_cthx_web_ply_applicant partition(pt{lastday}000000) a
INNER JOIN
    ods_cthx_web_ply_base partition(pt{lastday}000000) b
ON
    a.c_app_no = b.c_app_no
INNER JOIN
    ods_cthx_web_app_grp_member partition(pt{lastday}000000) m
ON
    a.c_app_no = m.c_app_no
WHERE
    a.c_clnt_mrk = 1 
AND b.t_next_edr_bgn_tm > now()
UNION

SELECT
    concat(rpad(a.c_certf_cls, 6, '0') , rpad(a.c_certf_cde, 18, '0')) cst_no,
    b.c_ply_no ,
    date_format(t_insrnc_bgn_tm, '%Y%m%d') bgn_tm ,
    date_format(greatest(t_insrnc_bgn_tm,t_udr_tm,COALESCE(t_edr_bgn_tm,t_insrnc_bgn_tm)), '%Y%m%d'
    ) end_tm ,
    a.c_clnt_mrk ,
    22 biz_type
FROM
    ods_cthx_web_ply_applicant partition(pt{lastday}000000) a
INNER JOIN
    ods_cthx_web_ply_base partition(pt{lastday}000000) b
ON
    a.c_app_no = b.c_app_no
WHERE
    a.c_clnt_mrk = 0 
AND b.t_next_edr_bgn_tm > now()
UNION
SELECT
    concat(rpad(c_certf_cls, 6, '0') , rpad(c_certf_cde, 18, '0')) cst_no,
    b.c_ply_no ,
    date_format(t_insrnc_bgn_tm, '%Y%m%d') bgn_tm ,
    date_format(greatest(t_insrnc_bgn_tm,t_udr_tm,COALESCE(t_edr_bgn_tm,t_insrnc_bgn_tm)), '%Y%m%d'
    ) end_tm ,
    a.c_clnt_mrk,
    32 biz_type
FROM
    ods_cthx_web_app_insured partition(pt{lastday}000000) a 
INNER JOIN
    ods_cthx_web_ply_base partition(pt{lastday}000000) b
ON
    a.c_app_no = b.c_app_no
WHERE
    a.c_clnt_mrk = 0 
AND b.t_next_edr_bgn_tm > now()
UNION
SELECT
    concat(rpad(c_certf_cls, 6, '0') , rpad(c_certf_cde, 18, '0')) cst_no,
    b.c_ply_no ,
    date_format(t_insrnc_bgn_tm, '%Y%m%d') bgn_tm ,
    date_format(greatest(t_insrnc_bgn_tm,t_udr_tm,COALESCE(t_edr_bgn_tm,t_insrnc_bgn_tm)), '%Y%m%d'
    ) end_tm ,
    a.c_clnt_mrk,
    42 biz_type
FROM
    ods_cthx_web_ply_bnfc partition(pt{lastday}000000) a
INNER JOIN
    ods_cthx_web_ply_base partition(pt{lastday}000000) b
ON
    a.c_app_no = b.c_app_no
WHERE
    a.c_clnt_mrk = 0 
AND b.t_next_edr_bgn_tm > now()
UNION
SELECT
    concat(rpad(m.c_bnfc_cert_typ, 6, '0') , rpad(m.c_bnfc_cert_no, 18, '0')) cst_no,
    b.c_ply_no ,
    date_format(t_insrnc_bgn_tm, '%Y%m%d') bgn_tm ,
    date_format(greatest(t_insrnc_bgn_tm,b.t_udr_tm,COALESCE(t_edr_bgn_tm,t_insrnc_bgn_tm)),
    '%Y%m%d') end_tm ,
    a.c_clnt_mrk ,
    44 biz_type
FROM
    ods_cthx_web_ply_applicant partition(pt{lastday}000000) a
INNER JOIN
    ods_cthx_web_ply_base partition(pt{lastday}000000) b
ON
    a.c_app_no = b.c_app_no
INNER JOIN
    ods_cthx_web_app_grp_member partition(pt{lastday}000000) m
ON
    a.c_app_no = m.c_app_no
WHERE
    a.c_clnt_mrk = 0 
AND b.t_next_edr_bgn_tm > now();
COMMIT;