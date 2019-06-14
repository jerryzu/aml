package lab.crazyspark.bean;

import lab.crazyspark.annotation.Entity;

@Entity(table = "tb_ins_rcla")
public class InsRcla {
    private String company_codel;
    private String company_code2;
    private String company_code3;
    private String company_code4;
    private String pol_no;
    private String app_no;
    private String ins_date;
    private String eff_date;
    private String app_name;
    private String app_cst_no;
    private String app_id_no;
    private String app_cus_pro;
    private String ins_name;
    private String ins_cst_no;
    private String ins_id_no;
    private String ins_cus_pro;
    private String benefit_name;
    private String benefit_id_no;
    private String benefit_type;
    private String relation_1;
    private String relation_2;
    private String cla_app_name;
    private String cla_id_type;
    private String cla_id_no;
    private String cla_pro;
    private String cla_date;
    private String cur_code;
    private double cla_amt;
    private double cla_usd_amt;
    private String cla_no;
    private String tsf_flag;
    private String acc_name;
    private String acc_no;
    private String acc_bank;
    private String acc_type;
    private String acc_id_type;
    private String acc_id_no;

    public void print() {
        System.out.println(String.format(
                "InsRcla:  company_codel%s  company_code2%s  company_code3%s  company_code4%s  pol_no%s  app_no%s  ins_date%s  eff_date%s  app_name%s  app_cst_no%s  app_id_no%s  app_cus_pro%s  ins_name%s  ins_cst_no%s  ins_id_no%s  ins_cus_pro%s  benefit_name%s  benefit_id_no%s  benefit_type%s  relation_1%s  relation_2%s  cla_app_name%s  cla_id_type%s  cla_id_no%s  cla_pro%s  cla_date%s  cur_code%s  cla_amt%s  cla_usd_amt%s  cla_no%s  tsf_flag%s  acc_name%s  acc_no%s  acc_bank%s  acc_type%s  acc_id_type%s  acc_id_no%s",
                company_codel, company_code2, company_code3, company_code4, pol_no, app_no, ins_date, eff_date,
                app_name, app_cst_no, app_id_no, app_cus_pro, ins_name, ins_cst_no, ins_id_no, ins_cus_pro,
                benefit_name, benefit_id_no, benefit_type, relation_1, relation_2, cla_app_name, cla_id_type, cla_id_no,
                cla_pro, cla_date, cur_code, cla_amt, cla_usd_amt, cla_no, tsf_flag, acc_name, acc_no, acc_bank,
                acc_type, acc_id_type, acc_id_no));
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

    public String getIns_date() {
        return ins_date;
    }

    public void setIns_date(String ins_date) {
        this.ins_date = ins_date;
    }

    public String getEff_date() {
        return eff_date;
    }

    public void setEff_date(String eff_date) {
        this.eff_date = eff_date;
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

    public String getApp_cus_pro() {
        return app_cus_pro;
    }

    public void setApp_cus_pro(String app_cus_pro) {
        this.app_cus_pro = app_cus_pro;
    }

    public String getIns_name() {
        return ins_name;
    }

    public void setIns_name(String ins_name) {
        this.ins_name = ins_name;
    }

    public String getIns_cst_no() {
        return ins_cst_no;
    }

    public void setIns_cst_no(String ins_cst_no) {
        this.ins_cst_no = ins_cst_no;
    }

    public String getIns_id_no() {
        return ins_id_no;
    }

    public void setIns_id_no(String ins_id_no) {
        this.ins_id_no = ins_id_no;
    }

    public String getIns_cus_pro() {
        return ins_cus_pro;
    }

    public void setIns_cus_pro(String ins_cus_pro) {
        this.ins_cus_pro = ins_cus_pro;
    }

    public String getBenefit_name() {
        return benefit_name;
    }

    public void setBenefit_name(String benefit_name) {
        this.benefit_name = benefit_name;
    }

    public String getBenefit_id_no() {
        return benefit_id_no;
    }

    public void setBenefit_id_no(String benefit_id_no) {
        this.benefit_id_no = benefit_id_no;
    }

    public String getBenefit_type() {
        return benefit_type;
    }

    public void setBenefit_type(String benefit_type) {
        this.benefit_type = benefit_type;
    }

    public String getRelation_1() {
        return relation_1;
    }

    public void setRelation_1(String relation_1) {
        this.relation_1 = relation_1;
    }

    public String getRelation_2() {
        return relation_2;
    }

    public void setRelation_2(String relation_2) {
        this.relation_2 = relation_2;
    }

    public String getCla_app_name() {
        return cla_app_name;
    }

    public void setCla_app_name(String cla_app_name) {
        this.cla_app_name = cla_app_name;
    }

    public String getCla_id_type() {
        return cla_id_type;
    }

    public void setCla_id_type(String cla_id_type) {
        this.cla_id_type = cla_id_type;
    }

    public String getCla_id_no() {
        return cla_id_no;
    }

    public void setCla_id_no(String cla_id_no) {
        this.cla_id_no = cla_id_no;
    }

    public String getCla_pro() {
        return cla_pro;
    }

    public void setCla_pro(String cla_pro) {
        this.cla_pro = cla_pro;
    }

    public String getCla_date() {
        return cla_date;
    }

    public void setCla_date(String cla_date) {
        this.cla_date = cla_date;
    }

    public String getCur_code() {
        return cur_code;
    }

    public void setCur_code(String cur_code) {
        this.cur_code = cur_code;
    }

    public double getCla_amt() {
        return cla_amt;
    }

    public void setCla_amt(double cla_amt) {
        this.cla_amt = cla_amt;
    }

    public double getCla_usd_amt() {
        return cla_usd_amt;
    }

    public void setCla_usd_amt(double cla_usd_amt) {
        this.cla_usd_amt = cla_usd_amt;
    }

    public String getCla_no() {
        return cla_no;
    }

    public void setCla_no(String cla_no) {
        this.cla_no = cla_no;
    }

    public String getTsf_flag() {
        return tsf_flag;
    }

    public void setTsf_flag(String tsf_flag) {
        this.tsf_flag = tsf_flag;
    }

    public String getAcc_name() {
        return acc_name;
    }

    public void setAcc_name(String acc_name) {
        this.acc_name = acc_name;
    }

    public String getAcc_no() {
        return acc_no;
    }

    public void setAcc_no(String acc_no) {
        this.acc_no = acc_no;
    }

    public String getAcc_bank() {
        return acc_bank;
    }

    public void setAcc_bank(String acc_bank) {
        this.acc_bank = acc_bank;
    }

    public String getAcc_type() {
        return acc_type;
    }

    public void setAcc_type(String acc_type) {
        this.acc_type = acc_type;
    }

    public String getAcc_id_type() {
        return acc_id_type;
    }

    public void setAcc_id_type(String acc_id_type) {
        this.acc_id_type = acc_id_type;
    }

    public String getAcc_id_no() {
        return acc_id_no;
    }

    public void setAcc_id_no(String acc_id_no) {
        this.acc_id_no = acc_id_no;
    }
}
