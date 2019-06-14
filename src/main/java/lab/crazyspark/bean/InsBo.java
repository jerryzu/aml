package lab.crazyspark.bean;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import lab.crazyspark.annotation.Entity;
import lab.crazyspark.validator.constraint.IDTypeCheck;

@Entity(table = "tb_ins_bo")
public class InsBo {
    private String company_codel;

    private String company_code2;

    private String acc_name;

    private String cst_no;
    private String license;
    private String bnf_name;

    @NotNull(message = "判定受益所有人方式不能为空")
    @IDTypeCheck(message = "判定受益所有人方式", IDType = "bnf_type")
    private String bnf_type;
    private double shareholding_ratio; // bnf_type=11时填写
    private String bnf_address;

    @IDTypeCheck(message = "身份证件类型错误", IDType = "app_id_type")
    private String id_type5;
    private String id_no5;

    @Pattern(message = "执照有效期限的日期格式不正确(YYYYMMDD)", regexp = "(((\\d{4})(0[13578]|10|12)(0[1-9]|[12][0-9]|3[01]))|((\\d{4})(0[469]|11)(0[1-9]|[12][0-9]|30))|((\\d{4})(02)(0[1-9]|1[0-9]|2[0-8]))|([0-9][0-9][02468]40229)|([0-9][0-9][02468]80229)|([0-9][0-9][13579]20229)|([0-9][0-9][13579]60229)|([0-9][0-9][02468]00229))")
    private String id_deadline5;
    private String sys_name;

    public void print() {
        System.out.println(String.format(
                "InsBo:  company_codel%s  company_code2%s  acc_name%s  cst_no%s  license%s  bnf_name%s  bnf_type%s  shareholding_ratio%s  bnf_address%s  id_type5%s  id_no5%s  id_deadline5%s  sys_name%s",
                company_codel, company_code2, acc_name, cst_no, license, bnf_name, bnf_type, shareholding_ratio,
                bnf_address, id_type5, id_no5, id_deadline5, sys_name));
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

    public String getAcc_name() {
        return acc_name;
    }

    public void setAcc_name(String acc_name) {
        this.acc_name = acc_name;
    }

    public String getCst_no() {
        return cst_no;
    }

    public void setCst_no(String cst_no) {
        this.cst_no = cst_no;
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license;
    }

    public String getBnf_name() {
        return bnf_name;
    }

    public void setBnf_name(String bnf_name) {
        this.bnf_name = bnf_name;
    }

    public String getBnf_type() {
        return bnf_type;
    }

    public void setBnf_type(String bnf_type) {
        this.bnf_type = bnf_type;
    }

    public double getShareholding_ratio() {
        return shareholding_ratio;
    }

    public void setShareholding_ratio(double shareholding_ratio) {
        this.shareholding_ratio = shareholding_ratio;
    }

    public String getBnf_address() {
        return bnf_address;
    }

    public void setBnf_address(String bnf_address) {
        this.bnf_address = bnf_address;
    }

    public String getId_type5() {
        return id_type5;
    }

    public void setId_type5(String id_type5) {
        this.id_type5 = id_type5;
    }

    public String getId_no5() {
        return id_no5;
    }

    public void setId_no5(String id_no5) {
        this.id_no5 = id_no5;
    }

    public String getId_deadline5() {
        return id_deadline5;
    }

    public void setId_deadline5(String id_deadline5) {
        this.id_deadline5 = id_deadline5;
    }

    public String getSys_name() {
        return sys_name;
    }

    public void setSys_name(String sys_name) {
        this.sys_name = sys_name;
    }
}