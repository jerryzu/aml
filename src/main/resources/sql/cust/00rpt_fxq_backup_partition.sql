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

select 'alter table', table_name, ' add partition (partition pt20190918000000 values less than (''20190918999999''));' 
from information_schema.tables where table_schema = 'tpedw' and table_name like 'ods_cthx%' 

select 'insert into tpedw.', table_name, ' select * from wine.', table_name, ';' 
from information_schema.tables where table_schema = 'wine' and table_name like 'ods_cthx%' 

select 'alter table', table_name, ' drop partition ', partition_name , ';'
from information_schema.partitions where table_schema = 'tpedw' and table_name like 'rpt_fxq_tb%' 

ALTER TABLE
    `tpedw`.`rpt_fxq_tb_lar_report_ms` MODIFY COLUMN `crmb` DECIMAL(20,3) COMMENT '末知'