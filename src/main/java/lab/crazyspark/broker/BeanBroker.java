package lab.crazyspark.broker;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

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

    private Set<String> companyList = new HashSet<String>();

    public void loadRulCompany(List<Company> companies) {
        for (Company company : companies) {
            companyList.add(company.getCompany_codel());
        }
    }

    public boolean ValidRulCompany(Company company) {
        return companyList.contains(company.getCompany_codel());
    }

    public static <T> void Key(Class<T> cls, T iu) {
    }

    public static <T> boolean Table(Class<T> cls, List<String> strList) {
        boolean hasAnnotation = cls.isAnnotationPresent(Entity.class);
        System.out.println("Entity:");
        if (hasAnnotation) {
            Entity entityAnnotation = cls.getAnnotation(Entity.class);
            tablename = entityAnnotation.table();
            System.out.println("tablename:" + tablename);
            if (strList != null) {
                strList.add(entityAnnotation.table());
            }
            return true;
        } else {
            return false;
        }
    }

    public static <T> void Check(Class<T> cls, List<String> strList) {
        System.out.println("tablename" + tablename);
        String sql = String.format("SELECT * FROM %s", tablename);
        try {
            QueryRunner runner = new QueryRunner(DBUtils.getDataSource());
            List<T> ius = runner.query(sql, new BeanListHandler<T>(cls));
            for (T iu : ius) {
                List<String> messageList = ValidationUtils.validate(iu);
                if (messageList.isEmpty()) {
                } else {
                    Key(cls, iu);
                    System.out.println(String.format("%s ", messageList));
                    if (strList != null) {
                        strList.addAll(messageList);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static <T> BeanCfg GetBeanConfig(Class<T> cls) {
        String sql = String.format("SELECT * FROM sys_bean_cfg WHERE objectname = '%s'", "Company");
        try {
            QueryRunner runner = new QueryRunner(DBUtils.getDataSource());
            BeanCfg beanCfg = runner.query(sql, new BeanHandler<BeanCfg>(BeanCfg.class));
            return beanCfg;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static <T> void FetchData(Class<T> cls) {
        BeanCfg beanCfg = GetBeanConfig(cls);
        try {
            QueryRunner runner = new QueryRunner(DBUtils.getDataSource());
            List<T> ius = runner.query(beanCfg.getSql_imp(), new BeanListHandler<T>(cls));
            for (T t : ius) {
                System.out.println(t.toString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void ConvertData() {
        QueryRunner runner = new QueryRunner(DBUtils.getDataSource());
        QueryRunner targetqr = new QueryRunner(DBUtils.getDataSource());
        // CompanyDAO.ConvertData(runner, targetqr);
        InsRTypeDAO.ConvertData(runner, targetqr);
        // InsPersDAO.ConvertData(runner, targetqr);
        // InsUnitDAO.ConvertData(runner, targetqr);
        // InsBoDAO.ConvertData(runner, targetqr);
        // InsRpolDAO.ConvertData(runner, targetqr);
        // InsGpolDAO.ConvertData(runner, targetqr);
        // InsFavCstDAO.ConvertData(runner, targetqr);
        // InsRenewalDAO.ConvertData(runner, targetqr);
        // InsRsurDAO.ConvertData(runner, targetqr);
        // InsRpayDAO.ConvertData(runner, targetqr);
        // InsRclaDAO.ConvertData(runner, targetqr);
        // InsRchgDAO.ConvertData(runner, targetqr);
        // InsRiskNewDAO.ConvertData(runner, targetqr);
        // InsRiskDAO.ConvertData(runner, targetqr);
        // LarReportDAO.ConvertData(runner, targetqr);
        // SusReportDAO.ConvertData(runner, targetqr);
    }

    public static  void Exp2Excel(String file, List<String> strList) {
        String StartSheetInfo = "开始导出%s";
        String EndSheetInfo= "已导出%s";

        try {
            QueryRunner runner = new QueryRunner(DBUtils.getDataSource());
            OutputStream os = new FileOutputStream(new File(file));
            ExcelWriter writer = new ExcelWriter(os, ExcelTypeEnum.XLSX, true);

            strList.add(String.format(StartSheetInfo, "company"));
            Sheet company = new Sheet(1, 5, ExcelCompany.class);
            List<ExcelCompany> companyresult = CompanyDAO.Exp2Excel(runner, writer, company);
            writer.write(companyresult, company);
            strList.add(String.format(EndSheetInfo, "company"));

            strList.add(String.format(StartSheetInfo, "insRType"));
            Sheet insRType = new Sheet(2, 5, ExcelInsRType.class);
            List<ExcelInsRType> insRtyperesult = InsRTypeDAO.Exp2Excel(runner, writer, insRType);
            writer.write(insRtyperesult, insRType);
            strList.add(String.format(EndSheetInfo, "insRType"));

            strList.add(String.format(StartSheetInfo, "insPers"));
            Sheet insPers = new Sheet(3, 5, ExcelInsPers.class);
            List<ExcelInsPers> insPersresult = InsPersDAO.Exp2Excel(runner, writer, insPers);
            writer.write(insPersresult, insPers);
            strList.add(String.format(EndSheetInfo, "insPers"));

            strList.add(String.format(StartSheetInfo, "insUnit"));
            Sheet insUnit = new Sheet(4, 5, ExcelInsUnit.class);
            List<ExcelInsUnit> insUnitresult = InsUnitDAO.Exp2Excel(runner, writer, insUnit);
            writer.write(insUnitresult, insUnit);
            strList.add(String.format(EndSheetInfo, "insUnit"));

            strList.add(String.format(StartSheetInfo, "insBo"));
            Sheet insBo = new Sheet(5, 5, ExcelInsBo.class);
            List<ExcelInsBo> insBoresult = InsBoDAO.Exp2Excel(runner, writer, insBo);
            writer.write(insBoresult, insBo);
            strList.add(String.format(EndSheetInfo, "insBo"));

            strList.add(String.format(StartSheetInfo, "insRpol"));
            Sheet insRpol = new Sheet(6, 5, ExcelInsRpol.class);
            List<ExcelInsRpol> insRpolresult = InsRpolDAO.Exp2Excel(runner, writer, insRpol);
            writer.write(insRpolresult, insRpol);
            strList.add(String.format(EndSheetInfo, "insRpol"));

            strList.add(String.format(StartSheetInfo, "insGpol"));
            Sheet insGpol = new Sheet(7, 5, ExcelInsGpol.class);
            List<ExcelInsGpol> insGpolresult = InsGpolDAO.Exp2Excel(runner, writer, insGpol);
            writer.write(insGpolresult, insGpol);
            strList.add(String.format(EndSheetInfo, "insGpol"));

            strList.add(String.format(StartSheetInfo, "insFavCst"));
            Sheet insFavCst = new Sheet(8, 5, ExcelInsFavCst.class);
            List<ExcelInsFavCst> insFavCstresult = InsFavCstDAO.Exp2Excel(runner, writer, insFavCst);
            writer.write(insFavCstresult, insFavCst);
            strList.add(String.format(EndSheetInfo, "insFavCst"));

            strList.add(String.format(StartSheetInfo, "insRenewal"));
            Sheet insRenewal = new Sheet(9, 5, ExcelInsRenewal.class);
            List<ExcelInsRenewal> insRenewalresult = InsRenewalDAO.Exp2Excel(runner, writer, insRenewal);
            writer.write(insRenewalresult, insRenewal);
            strList.add(String.format(EndSheetInfo, "insRenewal"));

            strList.add(String.format(StartSheetInfo, "insRsur"));
            Sheet insRsur = new Sheet(10, 5, ExcelInsRsur.class);
            List<ExcelInsRsur> insRsurresult = InsRsurDAO.Exp2Excel(runner, writer, insRsur);
            writer.write(insRsurresult, insRsur);
            strList.add(String.format(EndSheetInfo, "insRsur"));

            strList.add(String.format(StartSheetInfo, "insRpay"));
            Sheet insRpay = new Sheet(11, 5, ExcelInsRpay.class);
            List<ExcelInsRpay> insRpayresult = InsRpayDAO.Exp2Excel(runner, writer, insRpay);
            writer.write(insRpayresult, insRpay);
            strList.add(String.format(EndSheetInfo, "insRpay"));

            strList.add(String.format(StartSheetInfo, "insRcla"));
            Sheet insRcla = new Sheet(12, 5, ExcelInsRcla.class);
            List<ExcelInsRcla> insRclaresult = InsRclaDAO.Exp2Excel(runner, writer, insRcla);
            writer.write(insRclaresult, insRcla);
            strList.add(String.format(EndSheetInfo, "insRcla"));

            strList.add(String.format(StartSheetInfo, "insRchg"));
            Sheet insRchg = new Sheet(13, 5, ExcelInsRchg.class);
            List<ExcelInsRchg> insRchgresult = InsRchgDAO.Exp2Excel(runner, writer, insRchg);
            writer.write(insRchgresult, insRchg);
            strList.add(String.format(EndSheetInfo, "insRchg"));

            strList.add(String.format(StartSheetInfo, "insRiskNew"));
            Sheet insRiskNew = new Sheet(14, 5, ExcelInsRiskNew.class);
            List<ExcelInsRiskNew> insRiskNewresult = InsRiskNewDAO.Exp2Excel(runner, writer, insRiskNew);
            writer.write(insRiskNewresult, insRiskNew);
            strList.add(String.format(EndSheetInfo, "insRiskNew"));

            strList.add(String.format(StartSheetInfo, "insRisk"));
            Sheet insRisk = new Sheet(15, 5, ExcelInsRisk.class);
            List<ExcelInsRisk> insRiskresult = InsRiskDAO.Exp2Excel(runner, writer, insRisk);
            writer.write(insRiskresult, insRisk);
            strList.add(String.format(EndSheetInfo, "insRisk"));

            strList.add(String.format(StartSheetInfo, "larReport"));
            Sheet larReport = new Sheet(16, 5, ExcelLarReport.class);
            List<ExcelLarReport> larReportresult = LarReportDAO.Exp2Excel(runner, writer, larReport);
            writer.write(larReportresult, larReport);
            strList.add(String.format(EndSheetInfo, "larReport"));

            strList.add(String.format(StartSheetInfo, "susReport"));
            Sheet susReport = new Sheet(17, 5, ExcelSusReport.class);
            List<ExcelSusReport> susReportresult = SusReportDAO.Exp2Excel(runner, writer, susReport);
            writer.write(susReportresult, susReport);
            strList.add(String.format(EndSheetInfo, "susReport"));

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
}