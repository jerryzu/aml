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