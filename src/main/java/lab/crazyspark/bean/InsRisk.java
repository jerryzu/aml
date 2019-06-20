package lab.crazyspark.bean;

import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import lab.crazyspark.annotation.Entity;

@Entity(table = "tb_ins_risk")
public class InsRisk {
    private String company_code1;
    private String company_code2;
    private String company_code3;
    private String app_name;
    private String app_cst_no;
    private String app_id_no;
    private String risk_code;
    private String div_date;
    private String first_type;
    private double score;
    private String norm;

    public void print() {
        System.out.println(String.format(
                "InsRisk:  company_code1%s  company_code2%s  company_code3%s  app_name%s  app_cst_no%s  app_id_no%s  risk_code%s  div_date%s  first_type%s  score%s  norm%s",
                company_code1, company_code2, company_code3, app_name, app_cst_no, app_id_no, risk_code, div_date,
                first_type, score, norm));
    }

    public String getcompany_code1() {
        return company_code1;
    }

    public void setcompany_code1(String company_code1) {
        this.company_code1 = company_code1;
    }

    public String getCompany_code2() {
        return company_code2;
    }

    public void setCompany_code2(String company_code2) {
        this.company_code2 = company_code2;
    }

    public String getCompany_code3() {
        return company_code3;
    }

    public void setCompany_code3(String company_code3) {
        this.company_code3 = company_code3;
    }

    public String getApp_name() {
        return app_name;
    }

    public void setApp_name(String app_name) {
        this.app_name = app_name;
    }

    public String getApp_cst_no() {
        return app_cst_no;
    }

    public void setApp_cst_no(String app_cst_no) {
        this.app_cst_no = app_cst_no;
    }

    public String getApp_id_no() {
        return app_id_no;
    }

    public void setApp_id_no(String app_id_no) {
        this.app_id_no = app_id_no;
    }

    public String getRisk_code() {
        return risk_code;
    }

    public void setRisk_code(String risk_code) {
        this.risk_code = risk_code;
    }

    public String getDiv_date() {
        return div_date;
    }

    public void setDiv_date(String div_date) {
        this.div_date = div_date;
    }

    public String getFirst_type() {
        return first_type;
    }

    public void setFirst_type(String first_type) {
        this.first_type = first_type;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public String getNorm() {
        return norm;
    }

    public void setNorm(String norm) {
        this.norm = norm;
    }
}
