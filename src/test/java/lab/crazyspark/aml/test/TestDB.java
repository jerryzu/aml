package lab.crazyspark.aml.test;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import lab.crazyspark.bean.Company;
import lab.crazyspark.utils.DBUtils;

public class TestDB {

    public static void main(String[] args) {
        getCompany();
    }

    public static void getCompany() {
        List<Company> companyList = new ArrayList<Company>();
        QueryRunner runner = new QueryRunner(DBUtils.getDataSource("mysql")) {
            protected ResultSet wrap(ResultSet rs) {
                System.out.println("Wrap");
                return MyStringTrimmedResultSet.wrap(rs);
            }
        };
        String sql = "select * from tb_company";
        try {
            System.out.println("querying");
            companyList = runner.query(sql, new BeanListHandler<Company>(Company.class));
            
            System.out.println("query");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}