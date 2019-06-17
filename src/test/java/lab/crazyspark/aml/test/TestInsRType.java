package lab.crazyspark.aml.test;

import org.testng.annotations.Test;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import org.slf4j.LoggerFactory;
import lab.crazyspark.annotation.Entity;
import lab.crazyspark.annotation.FRule;
import lab.crazyspark.annotation.MRule;
import lab.crazyspark.bean.InsRType;
import lab.crazyspark.utils.DBUtils;
import lab.crazyspark.validator.ValidationUtils;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class TestInsRType {
    private static org.slf4j.Logger logger = LoggerFactory.getLogger(TestInsRType.class);

    // @Test
    public void test() {
        logger.info("测试开始......");
        try {
            boolean hasAnnotation = InsRType.class.isAnnotationPresent(Entity.class);
            String tableName;
            System.out.println("Entity:");
            if (hasAnnotation) {
                Entity entityAnnotation = InsRType.class.getAnnotation(Entity.class);
                System.out.println("table:" + entityAnnotation.table());
                tableName = entityAnnotation.table();
            } else {
                return;
            }

            QueryRunner runner = new QueryRunner(DBUtils.getDataSource());
            String sql = String.format("SELECT * FROM %s", tableName);
            List<InsRType> ius = runner.query(sql, new BeanListHandler<InsRType>(InsRType.class));
            for (InsRType iu : ius) {
                List<String> messageList = ValidationUtils.validate(iu);
                if (messageList.isEmpty()) {
                    // System.out.println(String.format("%s", iu.getIns_no()));
                } else {
                    System.out.println(String.format("%s: %s", iu.getIns_no(),  messageList));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.info("测试结束......");
    }
}