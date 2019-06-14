create table sys_properties
as
SELECT  o.objectid objectid, o.objectname objectname,  f.fieldid propertyid, f.fieldname propertyname, f.fielddesc, f.datatype, f.remark
FROM sys_fields f
inner join sys_objects o
    on f.tablename = o.tablename
order by o.objectid, f.fieldid;

create table sys_objects
as
SELECT  cast(remark  as int) as objectid, tablename objectname, tablename,   remark ,tabledesc FROM sys_tables
order by cast(remark  as int);

create table sys_sql_imp
as
SELECT  cast(remark  as int) as objectid, tablename objectname, tablename,   remark 
FROM sys_tables
order by cast(remark  as int) 

create table sys_prop_validator
as
SELECT objectid, objectname, propertyid, propertyname
    , propertyid validatorid, propertyname validatorname
    , remark 
FROM sys_properties
where 1 = 2

