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

export lastday=20190903
ll *.sql | awk '{print "sed \"s/{lastday}/'\$lastday'/g\" " $9 ">z_" $9}'

ll *.sql | awk '{print$9}' | gawk -F"." '{print"sed \"s/{lastday}/'\$lastday'/g\" " $1"."$2">"$1".txt"}'

mysql -utaipingbi_etl -pTpstic123456 -Dtpedw -hrm-bp19v63q682asdrja.mysql.rds.aliyuncs.com -A < edw_cust_pers_info.n.sql
mysql -utaipingbi_etl -pTpstic123456 -Dtpedw -hrm-bp19v63q682asdrja.mysql.rds.aliyuncs.com -A < edw_cust_units_info.n.sql
mysql -utaipingbi_etl -pTpstic123456 -Dtpedw -hrm-bp19v63q682asdrja.mysql.rds.aliyuncs.com -A < edw_cust_ply_partycd .n.sql

echo "first step"
sed "s/{lastday}/$lastday/g" edw_cust_pers_info.sql>z_edw_cust_pers_info.sql
sed "s/{lastday}/$lastday/g" edw_cust_units_info.sql>z_edw_cust_units_info.sql
sed "s/{lastday}/$lastday/g" edw_cust_ply_party.sql>z_edw_cust_ply_party.sql
sed "s/{lastday}/$lastday/g" edw_cust_ply_party_applicant.sql>z_edw_cust_ply_party_applicant.sql
sed "s/{lastday}/$lastday/g" edw_cust_ply_party_bnfc.sql>z_edw_cust_ply_party_bnfc.sql
sed "s/{lastday}/$lastday/g" edw_cust_ply_party_insured.sql>z_edw_cust_ply_party_insured.sql

source z_edw_cust_pers_info.sql;
source z_edw_cust_units_info.sql;
source z_edw_cust_ply_party.sql;
source z_edw_cust_ply_party_applicant.sql;
source z_edw_cust_ply_party_bnfc.sql;
source z_edw_cust_ply_party_insured.sql;


echo "second step"
sed "s/{lastday}/$lastday/g" 01rpt_fxq_tb_company_ms.sql>z_01rpt_fxq_tb_company_ms.sql
sed "s/{lastday}/$lastday/g" 02rpt_fxq_tb_ins_rtype_ms.sql>z_02rpt_fxq_tb_ins_rtype_ms.sql

source z_01rpt_fxq_tb_company_ms.sql
source z_02rpt_fxq_tb_ins_rtype_ms.sql

echo "third step"

sed "s/{lastday}/$lastday/g" 03rpt_fxq_tb_ins_pers_ms.sql>z_03rpt_fxq_tb_ins_pers_ms.sql
sed "s/{lastday}/$lastday/g" 04rpt_fxq_tb_ins_units_ms.sql>z_04rpt_fxq_tb_ins_units_ms.sql
sed "s/{lastday}/$lastday/g" 05rpt_fxq_tb_ins_bo_ms.sql>z_05rpt_fxq_tb_ins_bo_ms.sql

source z_03rpt_fxq_tb_ins_pers_ms.sql;
source z_04rpt_fxq_tb_ins_units_ms.sql;
source z_05rpt_fxq_tb_ins_bo_ms.sql;

echo "fourth"
sed "s/{lastday}/$lastday/g" 06rpt_fxq_tb_ins_rpol_ms.sql>z_06rpt_fxq_tb_ins_rpol_ms.sql

echo "inner join slowly"
source z_06rpt_fxq_tb_ins_rpol_ms.sql

sed "s/{lastday}/$lastday/g" 06rpt_fxq_tb_ins_rpol_ms.sql>z_06rpt_fxq_tb_ins_rpol_ms.sql


sed "s/{lastday}/$lastday/g" 07rpt_fxq_tb_ins_gpol_ms.sql>z_07rpt_fxq_tb_ins_gpol_ms.sql
sed "s/{lastday}/$lastday/g" 08rpt_fxq_tb_ins_fav_cst_ms.sql>z_08rpt_fxq_tb_ins_fav_cst_ms.sql
sed "s/{lastday}/$lastday/g" 09rpt_fxq_tb_ins_renewal_ms.sql>z_09rpt_fxq_tb_ins_renewal_ms.sql
sed "s/{lastday}/$lastday/g" 10rpt_fxq_tb_ins_rsur_ms.sql>z_10rpt_fxq_tb_ins_rsur_ms.sql
sed "s/{lastday}/$lastday/g" 11rpt_fxq_tb_ins_rpay_ms.sql>z_11rpt_fxq_tb_ins_rpay_ms.sql
sed "s/{lastday}/$lastday/g" 12rpt_fxq_tb_ins_rcla_ms.sql>z_12rpt_fxq_tb_ins_rcla_ms.sql
sed "s/{lastday}/$lastday/g" 13rpt_fxq_tb_ins_rchg_ms.sql>z_13rpt_fxq_tb_ins_rchg_ms.sql

source z_07rpt_fxq_tb_ins_gpol_ms.sql;
source z_08rpt_fxq_tb_ins_fav_cst_ms.sql;
source z_09rpt_fxq_tb_ins_renewal_ms.sql;
source z_10rpt_fxq_tb_ins_rsur_ms.sql;
source z_11rpt_fxq_tb_ins_rpay_ms.sql;
source z_12rpt_fxq_tb_ins_rcla_ms.sql;
source z_13rpt_fxq_tb_ins_rchg_ms.sql;