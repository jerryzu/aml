package lab.crazyspark.aml.test;

import org.testng.annotations.Test;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.LoggerFactory;

import lab.crazyspark.aml.Setting;
import lab.crazyspark.bean.*;
import lab.crazyspark.broker.BeanBroker;
import lab.crazyspark.broker.Event;
import lab.crazyspark.broker.Notifier;

public class TestBean implements Event {
    private static org.slf4j.Logger logger = LoggerFactory.getLogger(TestBean.class);

    @Test
    public void test() {
        logger.info("测试开始......");

        Notifier notifier = new Notifier();
        notifier.regist(this);
        BeanBroker.setNotifier(notifier);

        try {
            Integer i = 1;

            do {
                i += 1;
                Check(InsRType.class);
                Thread.sleep(2000);
            } while (i < 10);

            // Check(Company.class);
            // Check(InsRType.class);
            // Check(InsPers.class);
            // Check(InsUnit.class);
            // Check(InsBo.class);
            // Check(InsRpol.class);
            // Check(InsGpol.class);
            // Check(InsFavCst.class);
            // Check(InsRenewal.class);
            // Check(InsRsur.class);
            // Check(InsRpay.class);
            // Check(InsRcla.class);
            // Check(InsRchg.class);
            // Check(InsRiskNew.class);
            // Check(InsRisk.class);
            // Check(LarReport.class);
            // Check(SusReport.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.info("测试结束......");
    }

    public static <T> void Check(Class<T> cls) {
        if (BeanBroker.Table(cls)) {
            BeanBroker.Check(cls);
        }
    }

    // @Test
    public void test1() {
        logger.info("测试开始......");
        try {
            FetchData(Company.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.info("测试结束......");
    }

    public static <T> void FetchData(Class<T> cls) {
        BeanBroker.FetchData(cls);
    }

    // @Test
    public void test2() {
        logger.info("测试开始......");
        try {
            Exp2Excel(Company.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.info("测试结束......");
    }

    public static <T> void Exp2Excel(Class<T> cls) {

        String filepath = "/app/work/aml/auditing/aml.xlsx";
        BeanBroker.Exp2Excel(filepath);
    }

    // @Test
    public void test3() {
        logger.info("测试开始......");
        try {
            ConvertData(Company.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        logger.info("测试结束......");
    }

    public static <T> void ConvertData(Class<T> cls) {
        BeanBroker.ConvertData();
    }

    public void processEvent(String EventInfo) {
        // System.out.println(String.format("%s", EventInfo));
    }

    // @Test
    public void test4() {
        List<Company> Companies = new ArrayList<>();
        Companies = Setting.getCompanies();
        Companies = Setting.getCompanies();
    }
}