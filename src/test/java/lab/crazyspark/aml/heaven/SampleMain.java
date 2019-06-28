package lab.crazyspark.aml.heaven;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class SampleMain {
    public static void main(String... args) {
        try {
            ResultSetMapper<SamplePojo> resultSetMapper = new ResultSetMapper<SamplePojo>();
            ResultSet resultSet = null;
            // simple JDBC code to run SQL query and populate resultSet - START
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String database = "jdbc:odbc:AkDb";
            Connection connection = DriverManager.getConnection(database, "", "");
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM UsersSample");
            resultSet = statement.executeQuery();
            /******************************/
            List<SamplePojo> pojoList = resultSetMapper.mapRersultSetToObject(resultSet, SamplePojo.class);
            /******************************/
            if (pojoList != null) {
                for (SamplePojo pojo : pojoList) {
                    System.out.println(pojo);
                }
            } else {
                System.out.println("ResultSet is empty. Please check if database table is empty");
            }
            connection.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}