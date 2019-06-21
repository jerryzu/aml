package lab.crazyspark.aml;

import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import lab.crazyspark.bean.Company;
import lab.crazyspark.utils.DBUtils;

public class Setting {
    private static List<Company> Companies = null;
    private static List<Item> Items;

    static {
        QueryRunner runner = new QueryRunner(DBUtils.getDataSource("target"));
        // String sql = String.format("SELECT company_code1 FROM tb_company");
        String itemsql = String.format("SELECT * FROM web_commcode_sjsb");
        try {
            Items = runner.query(itemsql, new BeanListHandler<Item>(Item.class));
            // Companies = runner.query(sql, new BeanListHandler<Company>(Company.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Company> getCompanies() {
        QueryRunner runner = new QueryRunner(DBUtils.getDataSource("target"));
        String sql = String.format("SELECT company_code1 FROM tb_company");
        try {
            Companies = runner.query(sql, new BeanListHandler<Company>(Company.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Companies;
    }

    public static List<Item> getIDTypes(String cde) {
        List<Item> IDTypes = new ArrayList();
        for (Item item : Items) {
            if (item.getC_cde().equals(cde)) {
                IDTypes.add(item);
            }
        }
        return IDTypes;
    }
}