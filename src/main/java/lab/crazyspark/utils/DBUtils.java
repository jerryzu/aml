package lab.crazyspark.utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import lab.crazyspark.aml.BeanCfg;

public class DBUtils {
    private static ComboPooledDataSource ds = null;

    static {
        ds = new ComboPooledDataSource("mysql");
    }

    public synchronized static DataSource getDataSource() {
        return ds;
    }

    public synchronized static Connection getConnection() {
        Connection con = null;
        try {
            con = ds.getConnection();
        } catch (SQLException e) {
            System.out.println("获取数据库连接失败！");
        }
        return con;
    }

    public static void closeResource(ResultSet rs, Statement stmt, Connection con) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("关闭资源失败！");
            // e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        System.out.println(getConnection());
    }

    public static <T> BeanCfg GetBeanConfig(Class<T> cls, String objectname) {
        String sql = String.format("SELECT * FROM sys_bean_cfg WHERE objectname = '%s'", objectname);
        try {
            QueryRunner runner = new QueryRunner(DBUtils.getDataSource());
            BeanCfg beanCfg = runner.query(sql, new BeanHandler<BeanCfg>(BeanCfg.class));
            return beanCfg;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}