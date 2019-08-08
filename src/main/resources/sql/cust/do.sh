# sed -i.bak "s/{lastday}/20190808/g" demo.sql 

sed "s/{lastday}/20190808/" edw_cust_units_info.sql > edw_cust_units_info.n.sql
