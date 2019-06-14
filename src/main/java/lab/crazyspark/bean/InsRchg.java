package lab.crazyspark.bean;


import lab.crazyspark.annotation.Entity;

@Entity(table = "tb_ins_rchg")
public class InsRchg {
    private String company_codel;
    private String company_code2;
    private String company_code3;
    private String company_code4;
    private String pol_no;
    private String app_no;
    private String app_name;
    private String app_cst_no;
    private String app_date;
    private String chg_date;
    private String chg_no;
    private String item;
    private String con_bef;

    public void print() {
        System.out.println(String.format(
                "InsRchg:  company_codel%s  company_code2%s  company_code3%s  company_code4%s  pol_no%s  app_no%s  app_name%s  app_cst_no%s  app_date%s  chg_date%s  chg_no%s  item%s  con_bef%s",
                company_codel, company_code2, company_code3, company_code4, pol_no, app_no, app_name, app_cst_no,
                app_date, chg_date, chg_no, item, con_bef));
    }

    public String getCompany_codel() {
        return company_codel;
    }

    public void setCompany_codel(String company_codel) {
        this.company_codel = company_codel;
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

    public String getCompany_code4() {
        return company_code4;
    }

    public void setCompany_code4(String company_code4) {
        this.company_code4 = company_code4;
    }

    public String getPol_no() {
        return pol_no;
    }

    public void setPol_no(String pol_no) {
        this.pol_no = pol_no;
    }

    public String getApp_no() {
        return app_no;
    }

    public void setApp_no(String app_no) {
        this.app_no = app_no;
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

    public String getApp_date() {
        return app_date;
    }

    public void setApp_date(String app_date) {
        this.app_date = app_date;
    }

    public String getChg_date() {
        return chg_date;
    }

    public void setChg_date(String chg_date) {
        this.chg_date = chg_date;
    }

    public String getChg_no() {
        return chg_no;
    }

    public void setChg_no(String chg_no) {
        this.chg_no = chg_no;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public String getCon_bef() {
        return con_bef;
    }

    public void setCon_bef(String con_bef) {
        this.con_bef = con_bef;
    }
}