package lab.crazyspark.bean;

import lab.crazyspark.annotation.Entity;

@Entity(table = "tb_ins_fav_cst")
public class InsFavCst {
    private String company_code1;
    private String company_code2;
    private String company_code3;
    private String pol_no;
    private String ins_date;
    private String app_name;
    private String app_cst_no;
    private String app_id_no;
    private String insfav_type;
    private String insbene_cus_pro;
    private String relation;
    private String fav_type;
    private String name;
    private String insbene_cst_no;
    private String insbene_id_no;

    public void print() {
        System.out.println(String.format(
                "InsFavCst:  company_code1%s  company_code2%s  company_code3%s  pol_no%s  ins_date%s  app_name%s  app_cst_no%s  app_id_no%s  insfav_type%s  insbene_cus_pro%s  relation%s  fav_type%s  name%s  insbene_cst_no%s  insbene_id_no%s",
                company_code1, company_code2, company_code3, pol_no, ins_date, app_name, app_cst_no, app_id_no,
                insfav_type, insbene_cus_pro, relation, fav_type, name, insbene_cst_no, insbene_id_no));
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

    public String getPol_no() {
        return pol_no;
    }

    public void setPol_no(String pol_no) {
        this.pol_no = pol_no;
    }

    public String getIns_date() {
        return ins_date;
    }

    public void setIns_date(String ins_date) {
        this.ins_date = ins_date;
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

    public String getInsfav_type() {
        return insfav_type;
    }

    public void setInsfav_type(String insfav_type) {
        this.insfav_type = insfav_type;
    }

    public String getInsbene_cus_pro() {
        return insbene_cus_pro;
    }

    public void setInsbene_cus_pro(String insbene_cus_pro) {
        this.insbene_cus_pro = insbene_cus_pro;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public String getFav_type() {
        return fav_type;
    }

    public void setFav_type(String fav_type) {
        this.fav_type = fav_type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInsbene_cst_no() {
        return insbene_cst_no;
    }

    public void setInsbene_cst_no(String insbene_cst_no) {
        this.insbene_cst_no = insbene_cst_no;
    }

    public String getInsbene_id_no() {
        return insbene_id_no;
    }

    public void setInsbene_id_no(String insbene_id_no) {
        this.insbene_id_no = insbene_id_no;
    }
}
