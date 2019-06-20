package lab.crazyspark.bean;

import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import lab.crazyspark.annotation.Entity;

@Entity(table = "tb_ins_renewal")
public class InsRenewal {
    private String company_code1;
    private String company_code2;
    private String company_code3;
    private String company_code4;
    private String pol_no;
    private String app_no;
    private String ins_date;
    private String app_name;
    private String app_cst_no;
    private String app_id_type;
    private String app_id_no;
    private String ins_no;
    private String renew_date;
    private String pay_date;
    private String cur_code;
    private double pre_amt;
    private double usd_amt;
    private String tsf_flag;
    private String acc_name;
    private String acc_no;
    private String acc_bank;
    private String receipt_no;
    private String endorse_no;

    public void print() {
        System.out.println(String.format(
                "InsRenewal:  company_code1%s  company_code2%s  company_code3%s  company_code4%s  pol_no%s  app_no%s  ins_date%s  app_name%s  app_cst_no%s  app_id_type%s  app_id_no%s  ins_no%s  renew_date%s  pay_date%s  cur_code%s  pre_amt%s  usd_amt%s  tsf_flag%s  acc_name%s  acc_no%s  acc_bank%s  receipt_no%s  endorse_no%s",
                company_code1, company_code2, company_code3, company_code4, pol_no, app_no, ins_date, app_name,
                app_cst_no, app_id_type, app_id_no, ins_no, renew_date, pay_date, cur_code, pre_amt, usd_amt, tsf_flag,
                acc_name, acc_no, acc_bank, receipt_no, endorse_no));
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

    public String getApp_id_type() {
        return app_id_type;
    }

    public void setApp_id_type(String app_id_type) {
        this.app_id_type = app_id_type;
    }

    public String getApp_id_no() {
        return app_id_no;
    }

    public void setApp_id_no(String app_id_no) {
        this.app_id_no = app_id_no;
    }

    public String getIns_no() {
        return ins_no;
    }

    public void setIns_no(String ins_no) {
        this.ins_no = ins_no;
    }

    public String getRenew_date() {
        return renew_date;
    }

    public void setRenew_date(String renew_date) {
        this.renew_date = renew_date;
    }

    public String getPay_date() {
        return pay_date;
    }

    public void setPay_date(String pay_date) {
        this.pay_date = pay_date;
    }

    public String getCur_code() {
        return cur_code;
    }

    public void setCur_code(String cur_code) {
        this.cur_code = cur_code;
    }

    public double getPre_amt() {
        return pre_amt;
    }

    public void setPre_amt(double pre_amt) {
        this.pre_amt = pre_amt;
    }

    public double getUsd_amt() {
        return usd_amt;
    }

    public void setUsd_amt(double usd_amt) {
        this.usd_amt = usd_amt;
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

    public String getEndorse_no() {
        return endorse_no;
    }

    public void setEndorse_no(String endorse_no) {
        this.endorse_no = endorse_no;
    }
}
