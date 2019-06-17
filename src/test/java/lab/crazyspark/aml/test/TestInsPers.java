package lab.crazyspark.aml.test;

import org.testng.annotations.Test;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import org.slf4j.LoggerFactory;
import lab.crazyspark.annotation.Entity;
import lab.crazyspark.annotation.FRule;
import lab.crazyspark.annotation.MRule;
import lab.crazyspark.bean.InsPers;
import lab.crazyspark.utils.DBUtils;
import lab.crazyspark.validator.ValidationUtils;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class TestInsPers {
    private static org.slf4j.Logger logger = LoggerFactory.getLogger(TestInsPers.class);

    // @Test
    public void test() {
        logger.info("测试开始......");
        try {
            boolean hasAnnotation = InsPers.class.isAnnotationPresent(Entity.class);
            String tableName;
            System.out.println("Entity:");
            if (hasAnnotation) {
                Entity entityAnnotation = InsPers.class.getAnnotation(Entity.class);
                System.out.println("table:" + entityAnnotation.table());
                tableName = entityAnnotation.table();
            } else {
                return;
            }

            QueryRunner runner = new QueryRunner(DBUtils.getDataSource());
            String sql = String.format("SELECT * FROM %s", tableName);
            List<InsPers> ius = runner.query(sql, new BeanListHandler<InsPers>(InsPers.class));
            for (InsPers iu : ius) {
                List<String> messageList = ValidationUtils.validate(iu);
                if (messageList.isEmpty()) {
                } else {
                    System.out.println(String.format("%s: %s", iu.getCst_no(),  messageList));
                }
            }

            Field[] fs = InsPers.class.getDeclaredFields();
            for (Field f : fs) {
                if (f.isAnnotationPresent(FRule.class)) {
                    System.out.println(f.getName());
                    FRule annotation = f.getAnnotation(FRule.class);
                    System.out.println(annotation.abc() + " " + annotation.value());
                    if (annotation instanceof FRule) {
                        System.out.println("FRule annotation:");
                        // for (InsPers iu : ius) {
                        // if (iu.getDbLinkID() > ((FRule) annotation).value()) {
                        // System.out.println("ins_unit.getDbLinkID: " + iu.getDbLinkID());
                        // System.out.println("((FRule)annotation).value(): " + ((FRule)
                        // annotation).value());
                        // }
                        // }
                    }
                }
            }

            // Method[] ms = c.getDeclaredMethods();
            Method[] ms = InsPers.class.getDeclaredMethods();
            for (Method m : ms) {
                if (m.isAnnotationPresent(MRule.class)) {
                    System.out.println(m.getName());
                    MRule annotation = m.getAnnotation(MRule.class);
                    System.out.println(annotation.abc() + " " + annotation.value());
                    if (annotation instanceof MRule) {
                        System.out.println("MRule annotation:");
                        for (InsPers iu : ius) {
                            iu.print();
                            ValidationUtils.validate(iu);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.info("测试结束......");
    }
}