package lab.crazyspark.bean;

import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import lab.crazyspark.annotation.Entity;

@Entity(table = "tb_ins_rsur")
public class InsRsur {
    private String company_code1;
    private String company_code2;
    private String company_code3;
    private String company_code4;
    private String pay_type;
    private String pol_no;
    private String app_no;
    private String ins_date;
    private String eff_date;
    private String cur_code;
    private double pre_amt_all;
    private double usd_amt_all;
    private double pay_amt_all;
    private double usd_pay_amt_all;
    private String app_name;
    private String app_cst_no;
    private String id_no;
    private String cus_pro;
    private String sur_name;
    private String sur_id_no;
    private String sur_date;
    private String pay_date;
    private String cur_code2;
    private double sur_amt;
    private double usd_sur_amt;
    private String tsf_flag;
    private String acc_name;
    private String acc_no;
    private String acc_bank;
    private String receipt_no;
    private String endorse_no;

    public void print() {
        System.out.println(String.format(
                "InsRsur:  company_code1%s  company_code2%s  company_code3%s  company_code4%s  pay_type%s  pol_no%s  app_no%s  ins_date%s  eff_date%s  cur_code%s  pre_amt_all%s  usd_amt_all%s  pay_amt_all%s  usd_pay_amt_all%s  app_name%s  app_cst_no%s  id_no%s  cus_pro%s  sur_name%s  sur_id_no%s  sur_date%s  pay_date%s  cur_code2%s  sur_amt%s  usd_sur_amt%s  tsf_flag%s  acc_name%s  acc_no%s  acc_bank%s  receipt_no%s  endorse_no%s",
                company_code1, company_code2, company_code3, company_code4, pay_type, pol_no, app_no, ins_date,
                eff_date, cur_code, pre_amt_all, usd_amt_all, pay_amt_all, usd_pay_amt_all, app_name, app_cst_no, id_no,
                cus_pro, sur_name, sur_id_no, sur_date, pay_date, cur_code2, sur_amt, usd_sur_amt, tsf_flag, acc_name,
                acc_no, acc_bank, receipt_no, endorse_no));
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

    public String getPay_type() {
        return pay_type;
    }

    public void setPay_type(String pay_type) {
        this.pay_type = pay_type;
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

    public String getCur_code() {
        return cur_code;
    }

    public void setCur_code(String cur_code) {
        this.cur_code = cur_code;
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

    public double getPay_amt_all() {
        return pay_amt_all;
    }

    public void setPay_amt_all(double pay_amt_all) {
        this.pay_amt_all = pay_amt_all;
    }

    public double getUsd_pay_amt_all() {
        return usd_pay_amt_all;
    }

    public void setUsd_pay_amt_all(double usd_pay_amt_all) {
        this.usd_pay_amt_all = usd_pay_amt_all;
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

    public String getId_no() {
        return id_no;
    }

    public void setId_no(String id_no) {
        this.id_no = id_no;
    }

    public String getCus_pro() {
        return cus_pro;
    }

    public void setCus_pro(String cus_pro) {
        this.cus_pro = cus_pro;
    }

    public String getSur_name() {
        return sur_name;
    }

    public void setSur_name(String sur_name) {
        this.sur_name = sur_name;
    }

    public String getSur_id_no() {
        return sur_id_no;
    }

    public void setSur_id_no(String sur_id_no) {
        this.sur_id_no = sur_id_no;
    }

    public String getSur_date() {
        return sur_date;
    }

    public void setSur_date(String sur_date) {
        this.sur_date = sur_date;
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

    public double getSur_amt() {
        return sur_amt;
    }

    public void setSur_amt(double sur_amt) {
        this.sur_amt = sur_amt;
    }

    public double getUsd_sur_amt() {
        return usd_sur_amt;
    }

    public void setUsd_sur_amt(double usd_sur_amt) {
        this.usd_sur_amt = usd_sur_amt;
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
