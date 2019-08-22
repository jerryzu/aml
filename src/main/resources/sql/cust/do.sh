# sed -i.bak "s/{lastday}/20190808/g" demo.sql 
# echo ALTER TABLE edw_cust_pers_info  ADD PARTITION (PARTITION pt20190808000000 VALUES LESS THAN ('20190808999999'));
# echo mysql -utaipingbi_etl -pTpstic123456 -Dtpedw -hrm-bp19v63q682asdrja.mysql.rds.aliyuncs.com -A

echo '请输入分区日期?'
read lastday 

sed "s/{lastday}/$lastday/" rpt_fxq_tb_company.sql > rpt_fxq_tb_company.n.sql
sed "s/{lastday}/$lastday/" edw_cust_pers_info.sql > edw_cust_pers_info.n.sql
sed "s/{lastday}/$lastday/" edw_cust_units_info.sql > edw_cust_units_info.n.sql
sed "s/{lastday}/$lastday/" edw_cust_ply_party.sql > edw_cust_ply_party.n.sql


mysql -utaipingbi_etl -pTpstic123456 -Dtpedw -hrm-bp19v63q682asdrja.mysql.rds.aliyuncs.com -A < edw_cust_pers_info.n.sql
mysql -utaipingbi_etl -pTpstic123456 -Dtpedw -hrm-bp19v63q682asdrja.mysql.rds.aliyuncs.com -A < edw_cust_units_info.n.sql
mysql -utaipingbi_etl -pTpstic123456 -Dtpedw -hrm-bp19v63q682asdrja.mysql.rds.aliyuncs.com -A < edw_cust_ply_partycd .n.sql