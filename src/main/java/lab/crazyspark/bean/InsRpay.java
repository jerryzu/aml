package lab.crazyspark.bean;

import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import lab.crazyspark.annotation.Entity;

@Entity(table = "tb_ins_rpay")
public class InsRpay {
    private String company_codel;
    private String company_code2;
    private String company_code3;
    private String company_code4;
    private String pol_no;
    private String app_no;
    private String ins_date;
    private String eff_date;
    private String cur_code1;
    private double pre_amt_all;
    private double usd_amt_all;
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
    private String benefit_pro;
    private String relation_1;
    private String relation_2;
    private String pay_type;
    private String rpay_date;
    private String pay_date;
    private String cur_code2;
    private double pay_amt;
    private double pay_usd_amt;
    private String tsf_flag;
    private String acc_name;
    private String acc_no;
    private String acc_bank;
    private String receipt_no;

    public void print() {
        System.out.println(String.format(
                "InsRpay:  company_codel%s  company_code2%s  company_code3%s  company_code4%s  pol_no%s  app_no%s  ins_date%s  eff_date%s  cur_code1%s  pre_amt_all%s  usd_amt_all%s  app_name%s  app_cst_no%s  app_id_no%s  app_cus_pro%s  ins_name%s  ins_cst_no%s  ins_id_no%s  ins_cus_pro%s  benefit_name%s  benefit_id_no%s  benefit_pro%s  relation_1%s  relation_2%s  pay_type%s  rpay_date%s  pay_date%s  cur_code2%s  pay_amt%s  pay_usd_amt%s  tsf_flag%s  acc_name%s  acc_no%s  acc_bank%s  receipt_no%s",
                company_codel, company_code2, company_code3, company_code4, pol_no, app_no, ins_date, eff_date,
                cur_code1, pre_amt_all, usd_amt_all, app_name, app_cst_no, app_id_no, app_cus_pro, ins_name, ins_cst_no,
                ins_id_no, ins_cus_pro, benefit_name, benefit_id_no, benefit_pro, relation_1, relation_2, pay_type,
                rpay_date, pay_date, cur_code2, pay_amt, pay_usd_amt, tsf_flag, acc_name, acc_no, acc_bank,
                receipt_no));
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

    public String getCur_code1() {
        return cur_code1;
    }

    public void setCur_code1(String cur_code1) {
        this.cur_code1 = cur_code1;
    }

    public double getPre_amt_all() {
        return pre_amt_all;
    }

    public void setPre_amt_all(double pre_amt_all) {
        this.pre_amt_all = pre_amt_all;
    }

    public double getUsd_amt_all() {
        return usd_amt_all;
    }

    public void setUsd_amt_all(double usd_amt_all) {
        this.usd_amt_all = usd_amt_all;
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

    public String getBenefit_pro() {
        return benefit_pro;
    }

    public void setBenefit_pro(String benefit_pro) {
        this.benefit_pro = benefit_pro;
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

    public String getPay_type() {
        return pay_type;
    }

    public void setPay_type(String pay_type) {
        this.pay_type = pay_type;
    }

    public String getRpay_date() {
        return rpay_date;
    }

    public void setRpay_date(String rpay_date) {
        this.rpay_date = rpay_date;
    }

    public String getPay_date() {
        return pay_date;
    }

    public void setPay_date(String pay_date) {
        this.pay_date = pay_date;
    }

    public String getCur_code2() {
        return cur_code2;
    }

    public void setCur_code2(String cur_code2) {
        this.cur_code2 = cur_code2;
    }

    public double getPay_amt() {
        return pay_amt;
    }

    public void setPay_amt(double pay_amt) {
        this.pay_amt = pay_amt;
    }

    public double getPay_usd_amt() {
        return pay_usd_amt;
    }

    public void setPay_usd_amt(double pay_usd_amt) {
        this.pay_usd_amt = pay_usd_amt;
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

    public String getReceipt_no() {
        return receipt_no;
    }

    public void setReceipt_no(String receipt_no) {
        this.receipt_no = receipt_no;
    }
}
