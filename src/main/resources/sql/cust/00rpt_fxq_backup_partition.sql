-- alter table rpt_fxq_tb_company_ms add partition (partition future values less than (maxvalue));
-- select * from rpt_fxq_tb_company_ms partition (future)
-- alter table rpt_fxq_tb_company_ms reorganize partition future into (partition pt20190916000000 values less than('20190916999999'),  partition future values less than(maxvalue)); 
-- select * from rpt_fxq_tb_company_ms partition (pt20190916000000)
-- select * from rpt_fxq_tb_company_ms partition (future)

alter table rpt_fxq_tb_company_ms add partition (partition pt{lastday}000000 values less than ('{lastday}999999'));
alter table rpt_fxq_tb_company_ms add partition (partition future values less than (maxvalue));
-- maybe start backup(history) or maybe finish backup(current), backup(history) data couldn't use current script
alter table rpt_fxq_tb_company_ms reorganize partition future into (partition pt{lastday}000000 values less than('{lastday}999999'), partition future values less than(maxvalue)); 
select  group_concat(table_name  separator ' ') from information_schema.partitions where table_name like 'ods_amltp%'  or table_name like 'ods_cthx%'

select 'alter table', table_name, ' truncate  partition pt20190918000000 ;' 
from information_schema.tables where table_schema = 'tpedw' and table_name like 'ods_cthx%' 

select 'alter table', table_name, ' add partition (partition pt20190925000000 values less than (''20190925999999''));' 
from information_schema.tables where table_schema = 'tpedw' and table_name like 'rpt_fxq%' 

select 'insert into tpedw.', table_name, ' select * from wine.', table_name, ';' 
from information_schema.tables where table_schema = 'wine' and table_name like 'ods_cthx%' 

select 'alter table', table_name, ' drop partition ', partition_name , ';'
from information_schema.partitions where table_schema = 'tpedw' and table_name like 'rpt_fxq_tb%' 

select 'alter table', table_name, ' add partition (partition pt20190922000000 values less than (''20190922999999''));' 
from information_schema.tables where table_schema = 'tpedw' and table_name like 'rpt_fxq_tb%' 

select 'alter table', table_name, ' add partition (partition future values less than (maxvalue));' 
from information_schema.tables where table_schema = 'tpedw' and table_name like 'edw_cust_%' 

select 'alter table', table_name, ' drop partition pt20190922000000;'
from information_schema.tables 
where table_schema = 'tpedw' 
    and table_name like 'rpt_fxq_tb%' 

select 'alter table', table_name, ' add partition (partition future values less than (maxvalue));' 
from information_schema.tables 
where table_schema = 'tpedw' 
    and table_name like 'rpt_fxq_tb%' 	

alter table edw_cust_ply_party_applicant add index edw_cust_ply_party_applicant_pk(c_ply_no, pt);
alter table edw_cust_ply_party_insured add index edw_cust_ply_party_insured_pk(c_ply_no, pt);
alter table edw_cust_ply_party_bnfc add index edw_cust_ply_party_bnfc_pk(c_ply_no, pt);
alter table ods_cthx_web_ply_base add index ods_cthx_web_ply_base_pk(c_ply_no, pt);
alter table edw_cust_ply_party add index edw_cust_ply_party_pk(c_ply_no, pt);
alter table ods_cthx_web_ply_ent_tgt add index ods_cthx_web_ply_ent_tgt_pk(c_ply_no, pt);

alter table ods_cthx_web_app_insured add index ods_cthx_web_app_insured_pk(c_app_no, pt);
alter table ods_cthx_web_ply_base add index ods_cthx_web_ply_base_pk1(c_app_no, pt);
alter table edw_cust_ply_party_applicant add index edw_cust_ply_party_applicant_pk1(c_app_no, pt);
alter table edw_cust_ply_party_insured add index edw_cust_ply_party_insured_pk1(c_app_no, pt);
