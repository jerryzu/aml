package lab.crazyspark.bean;

import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import lab.crazyspark.annotation.Entity;

@Entity(table = "tb_ins_rpol")
public class InsRpol {
    private String company_code1;
    private String company_code2;
    private String company_code3;
    private String pol_no;
    private String app_no;
    private String ins_state;
    private String sale_type;
    private String sale_name;
    private String ins_date;
    private String eff_date;
    private String app_name;
    private String app_cst_no;
    private String app_id_type;
    private String app_id_no;
    private String ins_name;
    private String ins_cst_no;
    private String ins_id_no;
    private String ins_cus_pro;
    private String relation;
    private String legal_type;
    private String benefit_cus_pro;
    private String benefit_name;
    private String benefit_cst_no;
    private String benefit_id_no;
    private String ins_no;
    private String cur_code;
    private double pre_amt;
    private double usd_amt;
    private String prof_type;
    private String del_way;
    private String del_period;
    private String limit;
    private String subject;
    private String tsf_flag;
    private String acc_name;
    private String acc_no;
    private String acc_bank;
    private String receipt_no;

    public void print() {
        System.out.println(String.format(
                "InsRpol:  company_code1%s  company_code2%s  company_code3%s  pol_no%s  app_no%s  ins_state%s  sale_type%s  sale_name%s  ins_date%s  eff_date%s  app_name%s  app_cst_no%s  app_id_type%s  app_id_no%s  ins_name%s  ins_cst_no%s  ins_id_no%s  ins_cus_pro%s  relation%s  legal_type%s  benefit_cus_pro%s  benefit_name%s  benefit_cst_no%s  benefit_id_no%s  ins_no%s  cur_code%s  pre_amt%s  usd_amt%s  prof_type%s  del_way%s  del_period%s  limit%s  subject%s  tsf_flag%s  acc_name%s  acc_no%s  acc_bank%s  receipt_no%s",
                company_code1, company_code2, company_code3, pol_no, app_no, ins_state, sale_type, sale_name, ins_date,
                eff_date, app_name, app_cst_no, app_id_type, app_id_no, ins_name, ins_cst_no, ins_id_no, ins_cus_pro,
                relation, legal_type, benefit_cus_pro, benefit_name, benefit_cst_no, benefit_id_no, ins_no, cur_code,
                pre_amt, usd_amt, prof_type, del_way, del_period, limit, subject, tsf_flag, acc_name, acc_no, acc_bank,
                receipt_no));
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

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public String getLegal_type() {
        return legal_type;
    }

    public void setLegal_type(String legal_type) {
        this.legal_type = legal_type;
    }

    public String getBenefit_cus_pro() {
        return benefit_cus_pro;
    }

    public void setBenefit_cus_pro(String benefit_cus_pro) {
        this.benefit_cus_pro = benefit_cus_pro;
    }

    public String getBenefit_name() {
        return benefit_name;
    }

    public void setBenefit_name(String benefit_name) {
        this.benefit_name = benefit_name;
    }

    public String getBenefit_cst_no() {
        return benefit_cst_no;
    }

    public void setBenefit_cst_no(String benefit_cst_no) {
        this.benefit_cst_no = benefit_cst_no;
    }

    public String getBenefit_id_no() {
        return benefit_id_no;
    }

    public void setBenefit_id_no(String benefit_id_no) {
        this.benefit_id_no = benefit_id_no;
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

    public String getProf_type() {
        return prof_type;
    }

    public void setProf_type(String prof_type) {
        this.prof_type = prof_type;
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

    public String getReceipt_no() {
        return receipt_no;
    }

    public void setReceipt_no(String receipt_no) {
        this.receipt_no = receipt_no;
    }

}
