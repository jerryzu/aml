package lab.crazyspark.broker;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;

import lab.crazyspark.aml.BeanCfg;
import lab.crazyspark.annotation.Entity;
import lab.crazyspark.bean.*;
import lab.crazyspark.dao.*;
import lab.crazyspark.excel.*;
import lab.crazyspark.utils.DBUtils;
import lab.crazyspark.validator.ValidationUtils;

import java.io.File;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.metadata.Sheet;
import com.alibaba.excel.support.ExcelTypeEnum;

public class BeanBroker {
    private static String tablename;
    private static BeanCfg beanCfg;
    private static Notifier notifier;
    private Set<String> companyList = new HashSet<String>();

    /* */
    public void loadRulCompany(List<Company> companies) {
        for (Company company : companies) {
            companyList.add(company.getcompany_code1());
        }
    }

    public boolean ValidRulCompany(Company company) {
        return companyList.contains(company.getcompany_code1());
    }

    public static <T> String Key(Class<T> cls, T iu) {
        List<String> Values = new ArrayList<String>();
        for (Field field : cls.getDeclaredFields()) {
            field.setAccessible(true);

            Annotation[] annotations = field.getDeclaredAnnotations();
            if (annotations.length <= 0)
                continue;
            if (annotations[0] instanceof lab.crazyspark.annotation.Key) {
                try {
                    Object obj = field.get(iu);
                    if (ObjectUtils.isNotEmpty(obj)) {
                        Values.add(obj.toString());
                    } else {
                        Values.add("<null>");
                    }
                } catch (IllegalArgumentException | IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
        }

        for (Method mtd : cls.getDeclaredMethods()) {
            Annotation[] annotations = mtd.getDeclaredAnnotations();
            if (annotations.length <= 0)
                continue;
            if (annotations[0] instanceof lab.crazyspark.annotation.Key) {
                try {
                    Values.add(mtd.invoke(iu, null).toString());
                } catch (IllegalArgumentException | IllegalAccessException | InvocationTargetException e) {
                    e.printStackTrace();
                }
            }
        }
        return Values.toString();
    }

    public static <T> boolean Table(Class<T> cls) {
        boolean hasAnnotation = cls.isAnnotationPresent(Entity.class);
        System.out.println("Entity:");
        if (hasAnnotation) {
            Entity entityAnnotation = cls.getAnnotation(Entity.class);
            tablename = entityAnnotation.table();
            notifier.doWork(entityAnnotation.table());
            return true;
        } else {
            return false;
        }
    }

    public static <T> void Check(Class<T> cls) {
        System.out.println("tablename" + tablename);
        String sql = String.format("SELECT * FROM %s", tablename);
        try {
            QueryRunner runner = new QueryRunner(DBUtils.getDataSource("mysql"));
            List<T> ius = runner.query(sql, new BeanListHandler<T>(cls));
            for (T iu : ius) {
                List<String> messageList = ValidationUtils.validate(iu);
                if (messageList.isEmpty()) {
                } else {
                    notifier.doWork(String.format("记录: %s 出错信息: %s", Key(cls, iu), messageList));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static <T> void GetBeanConfig(Class<T> cls) {
        String sql = String.format("SELECT * FROM sys_bean_cfg WHERE objectname = '%s'", "Company");
        try {
            QueryRunner runner = new QueryRunner(DBUtils.getDataSource("mysql"));
            beanCfg = runner.query(sql, new BeanHandler<BeanCfg>(BeanCfg.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static <T> void FetchData(Class<T> cls) {
        try {
            QueryRunner runner = new QueryRunner(DBUtils.getDataSource("mysql"));
            List<T> ius = runner.query(beanCfg.getSql_imp(), new BeanListHandler<T>(cls));
            for (T t : ius) {
                System.out.println(t.toString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void ConvertData() {
        String StartSheetInfo = "开始导入%s";
        String EndSheetInfo = "已导入%s";
        QueryRunner runner = new QueryRunner(DBUtils.getDataSource("src"));
        QueryRunner targetqr = new QueryRunner(DBUtils.getDataSource("target"));

        notifier.doWork(String.format(StartSheetInfo, "company"));
        CompanyDAO.ConvertData(runner, targetqr);

        notifier.doWork(String.format(StartSheetInfo, "company"));
        // InsRTypeDAO.ConvertData(runner, targetqr); --出错
        notifier.doWork(String.format(EndSheetInfo, "company"));
        notifier.doWork(String.format(StartSheetInfo, "InsPers"));
        InsPersDAO.ConvertData(runner, targetqr);
        notifier.doWork(String.format(EndSheetInfo, "InsPers"));
        notifier.doWork(String.format(StartSheetInfo, "InsUnit"));
        InsUnitDAO.ConvertData(runner, targetqr);
        notifier.doWork(String.format(EndSheetInfo, "InsUnit"));
        notifier.doWork(String.format(StartSheetInfo, "InsBo"));
        InsBoDAO.ConvertData(runner, targetqr); //无数据
        notifier.doWork(String.format(EndSheetInfo, "InsBo"));
        notifier.doWork(String.format(StartSheetInfo, "InsRpol"));
        InsRpolDAO.ConvertData(runner, targetqr);
        notifier.doWork(String.format(EndSheetInfo, "InsRpol"));
        notifier.doWork(String.format(StartSheetInfo, "InsGpol"));
        InsGpolDAO.ConvertData(runner, targetqr);
        notifier.doWork(String.format(EndSheetInfo, "InsGpol"));
        notifier.doWork(String.format(StartSheetInfo, "InsFavCst"));
        // InsFavCstDAO.ConvertData(runner, targetqr); --出错
        notifier.doWork(String.format(EndSheetInfo, "InsFavCst"));
        notifier.doWork(String.format(StartSheetInfo, "InsRenewal"));
        InsRenewalDAO.ConvertData(runner, targetqr);
        notifier.doWork(String.format(EndSheetInfo, "InsRenewal"));
        notifier.doWork(String.format(StartSheetInfo, "InsRsur"));
        InsRsurDAO.ConvertData(runner, targetqr);
        notifier.doWork(String.format(EndSheetInfo, "InsRsur"));
        notifier.doWork(String.format(StartSheetInfo, "InsRpay"));
        // InsRpayDAO.ConvertData(runner, targetqr); --出错
        notifier.doWork(String.format(EndSheetInfo, "InsRpay"));
        notifier.doWork(String.format(StartSheetInfo, "InsRcla"));
        // InsRclaDAO.ConvertData(runner, targetqr); --出错
        notifier.doWork(String.format(EndSheetInfo, "InsRcla"));
        notifier.doWork(String.format(StartSheetInfo, "InsRchg"));
        InsRchgDAO.ConvertData(runner, targetqr);
        notifier.doWork(String.format(EndSheetInfo, "InsRchg"));
        notifier.doWork(String.format(StartSheetInfo, "InsRiskNew"));
        InsRiskNewDAO.ConvertData(runner, targetqr);
        notifier.doWork(String.format(EndSheetInfo, "InsRiskNew"));
        notifier.doWork(String.format(StartSheetInfo, "InsRisk"));
        InsRiskDAO.ConvertData(runner, targetqr);
        notifier.doWork(String.format(EndSheetInfo, "InsRisk"));
        notifier.doWork(String.format(StartSheetInfo, "LarReport"));
        // LarReportDAO.ConvertData(runner, targetqr);
        notifier.doWork(String.format(EndSheetInfo, "LarReport"));
        notifier.doWork(String.format(StartSheetInfo, "SusReport"));
        // SusReportDAO.ConvertData(runner, targetqr);
        notifier.doWork(String.format(EndSheetInfo, "SusReport"));
    }

    public static void Exp2Excel(String file) {
        String StartSheetInfo = "开始导出%s";
        String EndSheetInfo = "已导出%s";

        try {
            QueryRunner runner = new QueryRunner(DBUtils.getDataSource("mysql"));
            OutputStream os = new FileOutputStream(new File(file));
            ExcelWriter writer = new ExcelWriter(os, ExcelTypeEnum.XLSX, true);

            // notifier.doWork();
            notifier.doWork(String.format(StartSheetInfo, "company"));
            Sheet company = new Sheet(1, 5, ExcelCompany.class);
            List<ExcelCompany> companyresult = CompanyDAO.Exp2Excel(runner, writer, company);
            writer.write(companyresult, company);
            notifier.doWork(String.format(EndSheetInfo, "company"));

            notifier.doWork(String.format(StartSheetInfo, "insRType"));
            Sheet insRType = new Sheet(2, 5, ExcelInsRType.class);
            List<ExcelInsRType> insRtyperesult = InsRTypeDAO.Exp2Excel(runner, writer, insRType);
            writer.write(insRtyperesult, insRType);
            notifier.doWork(String.format(EndSheetInfo, "insRType"));

            notifier.doWork(String.format(StartSheetInfo, "insPers"));
            Sheet insPers = new Sheet(3, 5, ExcelInsPers.class);
            List<ExcelInsPers> insPersresult = InsPersDAO.Exp2Excel(runner, writer, insPers);
            writer.write(insPersresult, insPers);
            notifier.doWork(String.format(EndSheetInfo, "insPers"));

            notifier.doWork(String.format(StartSheetInfo, "insUnit"));
            Sheet insUnit = new Sheet(4, 5, ExcelInsUnit.class);
            List<ExcelInsUnit> insUnitresult = InsUnitDAO.Exp2Excel(runner, writer, insUnit);
            writer.write(insUnitresult, insUnit);
            notifier.doWork(String.format(EndSheetInfo, "insUnit"));

            notifier.doWork(String.format(StartSheetInfo, "insBo"));
            Sheet insBo = new Sheet(5, 5, ExcelInsBo.class);
            List<ExcelInsBo> insBoresult = InsBoDAO.Exp2Excel(runner, writer, insBo);
            writer.write(insBoresult, insBo);
            notifier.doWork(String.format(EndSheetInfo, "insBo"));

            notifier.doWork(String.format(StartSheetInfo, "insRpol"));
            Sheet insRpol = new Sheet(6, 5, ExcelInsRpol.class);
            List<ExcelInsRpol> insRpolresult = InsRpolDAO.Exp2Excel(runner, writer, insRpol);
            writer.write(insRpolresult, insRpol);
            notifier.doWork(String.format(EndSheetInfo, "insRpol"));

            notifier.doWork(String.format(StartSheetInfo, "insGpol"));
            Sheet insGpol = new Sheet(7, 5, ExcelInsGpol.class);
            List<ExcelInsGpol> insGpolresult = InsGpolDAO.Exp2Excel(runner, writer, insGpol);
            writer.write(insGpolresult, insGpol);
            notifier.doWork(String.format(EndSheetInfo, "insGpol"));

            notifier.doWork(String.format(StartSheetInfo, "insFavCst"));
            Sheet insFavCst = new Sheet(8, 5, ExcelInsFavCst.class);
            List<ExcelInsFavCst> insFavCstresult = InsFavCstDAO.Exp2Excel(runner, writer, insFavCst);
            writer.write(insFavCstresult, insFavCst);
            notifier.doWork(String.format(EndSheetInfo, "insFavCst"));

            notifier.doWork(String.format(StartSheetInfo, "insRenewal"));
            Sheet insRenewal = new Sheet(9, 5, ExcelInsRenewal.class);
            List<ExcelInsRenewal> insRenewalresult = InsRenewalDAO.Exp2Excel(runner, writer, insRenewal);
            writer.write(insRenewalresult, insRenewal);
            notifier.doWork(String.format(EndSheetInfo, "insRenewal"));

            notifier.doWork(String.format(StartSheetInfo, "insRsur"));
            Sheet insRsur = new Sheet(10, 5, ExcelInsRsur.class);
            List<ExcelInsRsur> insRsurresult = InsRsurDAO.Exp2Excel(runner, writer, insRsur);
            writer.write(insRsurresult, insRsur);
            notifier.doWork(String.format(EndSheetInfo, "insRsur"));

            notifier.doWork(String.format(StartSheetInfo, "insRpay"));
            Sheet insRpay = new Sheet(11, 5, ExcelInsRpay.class);
            List<ExcelInsRpay> insRpayresult = InsRpayDAO.Exp2Excel(runner, writer, insRpay);
            writer.write(insRpayresult, insRpay);
            notifier.doWork(String.format(EndSheetInfo, "insRpay"));

            notifier.doWork(String.format(StartSheetInfo, "insRcla"));
            Sheet insRcla = new Sheet(12, 5, ExcelInsRcla.class);
            List<ExcelInsRcla> insRclaresult = InsRclaDAO.Exp2Excel(runner, writer, insRcla);
            writer.write(insRclaresult, insRcla);
            notifier.doWork(String.format(EndSheetInfo, "insRcla"));

            notifier.doWork(String.format(StartSheetInfo, "insRchg"));
            Sheet insRchg = new Sheet(13, 5, ExcelInsRchg.class);
            List<ExcelInsRchg> insRchgresult = InsRchgDAO.Exp2Excel(runner, writer, insRchg);
            writer.write(insRchgresult, insRchg);
            notifier.doWork(String.format(EndSheetInfo, "insRchg"));

            notifier.doWork(String.format(StartSheetInfo, "insRiskNew"));
            Sheet insRiskNew = new Sheet(14, 5, ExcelInsRiskNew.class);
            List<ExcelInsRiskNew> insRiskNewresult = InsRiskNewDAO.Exp2Excel(runner, writer, insRiskNew);
            writer.write(insRiskNewresult, insRiskNew);
            notifier.doWork(String.format(EndSheetInfo, "insRiskNew"));

            notifier.doWork(String.format(StartSheetInfo, "insRisk"));
            Sheet insRisk = new Sheet(15, 5, ExcelInsRisk.class);
            List<ExcelInsRisk> insRiskresult = InsRiskDAO.Exp2Excel(runner, writer, insRisk);
            writer.write(insRiskresult, insRisk);
            notifier.doWork(String.format(EndSheetInfo, "insRisk"));

            notifier.doWork(String.format(StartSheetInfo, "larReport"));
            Sheet larReport = new Sheet(16, 5, ExcelLarReport.class);
            List<ExcelLarReport> larReportresult = LarReportDAO.Exp2Excel(runner, writer, larReport);
            writer.write(larReportresult, larReport);
            notifier.doWork(String.format(EndSheetInfo, "larReport"));

            notifier.doWork(String.format(StartSheetInfo, "susReport"));
            Sheet susReport = new Sheet(17, 5, ExcelSusReport.class);
            List<ExcelSusReport> susReportresult = SusReportDAO.Exp2Excel(runner, writer, susReport);
            writer.write(susReportresult, susReport);
            notifier.doWork(String.format(EndSheetInfo, "susReport"));

            writer.finish();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static String getTablename() {
        return tablename;
    }

    public static void setTablename(String tablename) {
        BeanBroker.tablename = tablename;
    }

    public Set<String> getCompanyList() {
        return companyList;
    }

    public void setCompanyList(Set<String> companyList) {
        this.companyList = companyList;
    }

    public static Notifier getNotifier() {
        return notifier;
    }

    public static void setNotifier(Notifier notifier) {
        BeanBroker.notifier = notifier;
    }

    public static BeanCfg getBeanCfg() {
        return beanCfg;
    }

    public static void setBeanCfg(BeanCfg beanCfg) {
        BeanBroker.beanCfg = beanCfg;
    }
}