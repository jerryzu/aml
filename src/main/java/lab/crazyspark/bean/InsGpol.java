package lab.crazyspark.bean;

import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import lab.crazyspark.annotation.Entity;

@Entity(table = "tb_ins_gpol")
public class InsGpol {
    private String company_code1;
    private String company_code2;
    private String company_code3;
    private String pol_no;
    private String app_no;
    private String ins_state;
    private String app_type;
    private String sale_type;
    private String sale_name;
    private String ins_date;
    private String eff_date;
    private String app_name;
    private String app_cst_no;
    private String app_id_type;
    private String app_id_no;
    private String state_owned;
    private String ins_num;
    private String ins_no;
    private String cur_code;
    private double pre_amt;
    private double usd_amt;
    private String del_way;
    private String del_period;
    private String limit;
    private String subject;
    private String tsf_flag;
    private String acc_name;
    private String acc_no;
    private String acc_bank;

    public void print() {
        System.out.println(String.format(
                "InsGpol:  company_code1%s  company_code2%s  company_code3%s  pol_no%s  app_no%s  ins_state%s  app_type%s  sale_type%s  sale_name%s  ins_date%s  eff_date%s  app_name%s  app_cst_no%s  app_id_type%s  app_id_no%s  state_owned%s  ins_num%s  ins_no%s  cur_code%s  pre_amt%s  usd_amt%s  del_way%s  del_period%s  limit%s  subject%s  tsf_flag%s  acc_name%s  acc_no%s  acc_bank%s",
                company_code1, company_code2, company_code3, pol_no, app_no, ins_state, app_type, sale_type, sale_name,
                ins_date, eff_date, app_name, app_cst_no, app_id_type, app_id_no, state_owned, ins_num, ins_no,
                cur_code, pre_amt, usd_amt, del_way, del_period, limit, subject, tsf_flag, acc_name, acc_no, acc_bank));
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

    public String getApp_no() {
        return app_no;
    }

    public void setApp_no(String app_no) {
        this.app_no = app_no;
    }

    public String getIns_state() {
        return ins_state;
    }

    public void setIns_state(String ins_state) {
        this.ins_state = ins_state;
    }

    public String getApp_type() {
        return app_type;
    }

    public void setApp_type(String app_type) {
        this.app_type = app_type;
    }

    public String getSale_type() {
        return sale_type;
    }

    public void setSale_type(String sale_type) {
        this.sale_type = sale_type;
    }

    public String getSale_name() {
        return sale_name;
    }

    public void setSale_name(String sale_name) {
        this.sale_name = sale_name;
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

    public String getState_owned() {
        return state_owned;
    }

    public void setState_owned(String state_owned) {
        this.state_owned = state_owned;
    }

    public String getIns_num() {
        return ins_num;
    }

    public void setIns_num(String ins_num) {
        this.ins_num = ins_num;
    }

    public String getIns_no() {
        return ins_no;
    }

    public void setIns_no(String ins_no) {
        this.ins_no = ins_no;
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

    public String getDel_way() {
        return del_way;
    }

    public void setDel_way(String del_way) {
        this.del_way = del_way;
    }

    public String getDel_period() {
        return del_period;
    }

    public void setDel_period(String del_period) {
        this.del_period = del_period;
    }

    public String getLimit() {
        return limit;
    }

    public void setLimit(String limit) {
        this.limit = limit;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
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
}
