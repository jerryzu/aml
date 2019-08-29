# sed -i.bak "s/{lastday}/20190808/g" demo.sql 
# echo ALTER TABLE edw_cust_pers_info  ADD PARTITION (PARTITION pt20190808000000 VALUES LESS THAN ('20190808999999'));
# echo mysql -utaipingbi_etl -pTpstic123456 -Dtpedw -hrm-bp19v63q682asdrja.mysql.rds.aliyuncs.com -A

# select 
#  partition_name part,  
#  partition_expression expr,  
#  partition_description descr,  
#  table_rows, table_name
#  , concat('alter table ', table_name, ' drop partition   ', partition_name, ';') drop_part
#  , concat('alter table ', table_name, ' add partition  (partition pt', date_format(now(),'%Y%m%d'),'000000 values less than (''', date_format(now(),'%Y%m%d'),'999999'')) ', ';') add_part
#from information_schema.partitions  where 
#  table_schema = schema()  and table_name like 'rpt_fxq%'


echo '请输入分区日期?'
read lastday 

ll *.sql | awk '{print "sed \"s/{lastday}/'\$lastday'/\" " $9 ">z_" $9}'

ll *.sql | awk '{print$9}' | gawk -F"." '{print"sed \"s/{lastday}/'\$lastday'/\" " $1"."$2">"$1".txt"}'

mysql -utaipingbi_etl -pTpstic123456 -Dtpedw -hrm-bp19v63q682asdrja.mysql.rds.aliyuncs.com -A < edw_cust_pers_info.n.sql
mysql -utaipingbi_etl -pTpstic123456 -Dtpedw -hrm-bp19v63q682asdrja.mysql.rds.aliyuncs.com -A < edw_cust_units_info.n.sql
mysql -utaipingbi_etl -pTpstic123456 -Dtpedw -hrm-bp19v63q682asdrja.mysql.rds.aliyuncs.com -A < edw_cust_ply_partycd .n.sql