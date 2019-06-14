package lab.crazyspark.aml;

public class BeanCfg {
    private Integer objectid;
    private String objectname;
    private String tablename;
    private String sql_imp;

    public Integer getObjectid() {
        return objectid;
    }

    public void setObjectid(Integer objectid) {
        this.objectid = objectid;
    }

    public String getObjectname() {
        return objectname;
    }

    public void setObjectname(String objectname) {
        this.objectname = objectname;
    }

    public String getTablename() {
        return tablename;
    }

    public void setTablename(String tablename) {
        this.tablename = tablename;
    }

    public String getSql_imp() {
        return sql_imp;
    }

    public void setSql_imp(String sql_imp) {
        this.sql_imp = sql_imp;
    }
}