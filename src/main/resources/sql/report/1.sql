select 
        a.c_ply_no,
        b.c_certf_cde as app_id_no,-- 投保人证件号码
        (select c_cnm from  ods_cthx_web_bas_codelist  partition(pt20190822000000) v where v.c_par_cde='policyCertificateTyp'  and v.c_cde = c.c_certf_cls) as ins_id_type, -- 被保险人证件类型
        c.c_clnt_addr as ins_clnt_addr, -- 被保险人通讯地址
        c.c_certf_cde as ins_id_no,-- 被保险人证件号码
        (select c_cnm from  ods_cthx_web_bas_comm_code    partition(pt20190821000000) v where v.c_par_cde like 'SS%'  and v.c_cde = c.c_occup_cde)  as ins_occupation_code,
        (select  c_cnm from ods_cthx_web_bas_comm_code  partition(pt20190822000000) v  where v.c_par_cde = '601'   and v.c_cde = c.c_app_relation)  as relation-- 投保人、被保险人之间的关系  中
from ods_cthx_web_ply_base partition(pt20190822000000) a
  inner join ods_cthx_web_ply_applicant partition(pt20190822000000) b on a.c_ply_no=b.c_ply_no
  inner join ods_cthx_web_ply_insured partition(pt20190822000000) c on a.c_ply_no=c.c_ply_no
where a.t_next_edr_bgn_tm > now()   
union all
select 
        a.c_ply_no,
        b.c_certf_cde as app_id_no,-- 投保人证件号码
        (select c_cnm from  ods_cthx_web_bas_codelist  partition(pt20190822000000) v where v.c_par_cde='policyCertificateTyp'  and v.c_cde = c.c_cert_typ) as ins_id_type, -- 被保险人证件类型
       null as ins_clnt_addr, -- c.c_clnt_addr as ins_clnt_addr, -- 被保险人通讯地址
        c.c_cert_no as ins_id_no,-- 被保险人证件号码 C_CERT_NO
        (select c_cnm from  ods_cthx_web_bas_comm_code    partition(pt20190821000000) v where v.c_par_cde like 'SS%'  and v.c_cde = c.c_occup_cde) as ins_occupation_code, -- 被保险人职业大类
       null as relation-- c.c_app_relation as relation -- 投保人、被保险人之间的关系
from ods_cthx_web_ply_base partition(pt20190822000000) a
  inner join ods_cthx_web_ply_applicant partition(pt20190822000000) b on a.c_ply_no=b.c_ply_no
  inner join ods_cthx_web_app_grp_member partition(pt20190822000000) c on a.c_ply_no=c.c_ply_no
where a.t_next_edr_bgn_tm > now()   

select c_occup_cde,  cnt, (select c_cnm from  ods_cthx_web_bas_comm_code    partition(pt20190821000000) v where v.c_par_cde like 'SS%'  and v.c_cde = c.c_occup_cde) as ins_occupation_code
from (select  c_occup_cde, count(1) cnt
from  ods_cthx_web_ply_insured partition(pt20190822000000) c
group by c_occup_cde) c

select c_occup_cde,  cnt, (select c_cnm from  ods_cthx_web_bas_comm_code    partition(pt20190821000000) v where v.c_par_cde like 'SS%'  and v.c_cde = c.c_occup_cde) as ins_occupation_code
from (select  c_occup_cde, count(1) cnt
from  ods_cthx_web_app_grp_member partition(pt20190822000000) c
group by c_occup_cde) c