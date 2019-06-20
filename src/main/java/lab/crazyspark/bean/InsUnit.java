package lab.crazyspark.bean;

import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lab.crazyspark.annotation.Entity;
import lab.crazyspark.validator.constraint.IDTypeCheck;

@Entity(table = "tb_ins_unit")
public class InsUnit {
    private String company_code1;
    private String company_code2;
    private String cst_no;

    @Pattern(message = "日期格式不正确(YYYYMMDD)", regexp = "(((\\d{4})(0[13578]|10|12)(0[1-9]|[12][0-9]|3[01]))|((\\d{4})(0[469]|11)(0[1-9]|[12][0-9]|30))|((\\d{4})(02)(0[1-9]|1[0-9]|2[0-8]))|([0-9][0-9][02468]40229)|([0-9][0-9][02468]80229)|([0-9][0-9][13579]20229)|([0-9][0-9][13579]60229)|([0-9][0-9][02468]00229))")
    private String open_time;
    @Pattern(message = "日期格式不正确(YYYYMMDD)", regexp = "(((\\d{4})(0[13578]|10|12)(0[1-9]|[12][0-9]|3[01]))|((\\d{4})(0[469]|11)(0[1-9]|[12][0-9]|30))|((\\d{4})(02)(0[1-9]|1[0-9]|2[0-8]))|([0-9][0-9][02468]40229)|([0-9][0-9][02468]80229)|([0-9][0-9][13579]20229)|([0-9][0-9][13579]60229)|([0-9][0-9][02468]00229))")
    private String close_time;
    private String acc_name;
    private String address;
    private String operate;

    @NotNull(message = "执照名称、执照类型不能为空")
    @IDTypeCheck(message = "执照名称、执照类型错误", IDType = "set_file")
    private String set_file;

    private String license;

    @Pattern(message = "执照有效期限的日期格式不正确(YYYYMMDD)", regexp = "(((\\d{4})(0[13578]|10|12)(0[1-9]|[12][0-9]|3[01]))|((\\d{4})(0[469]|11)(0[1-9]|[12][0-9]|30))|((\\d{4})(02)(0[1-9]|1[0-9]|2[0-8]))|([0-9][0-9][02468]40229)|([0-9][0-9][02468]80229)|([0-9][0-9][13579]20229)|([0-9][0-9][13579]60229)|([0-9][0-9][02468]00229))")
    private String id_deadline;
    private String org_no;
    private String tax_no;
    private String rep_name;

    @IDTypeCheck(message = "身份证件类型错误", IDType = "app_id_type")
    private String id_type2;
    private String id_no2;

    @Pattern(message = "执照有效期限的日期格式不正确(YYYYMMDD)", regexp = "(((\\d{4})(0[13578]|10|12)(0[1-9]|[12][0-9]|3[01]))|((\\d{4})(0[469]|11)(0[1-9]|[12][0-9]|30))|((\\d{4})(02)(0[1-9]|1[0-9]|2[0-8]))|([0-9][0-9][02468]40229)|([0-9][0-9][02468]80229)|([0-9][0-9][13579]20229)|([0-9][0-9][13579]60229)|([0-9][0-9][02468]00229))")
    private String id_deadline2;
    private String man_name;

    @IDTypeCheck(message = "身份证件类型错误", IDType = "id_type3")
    private String id_type3;
    private String id_no3;

    @Pattern(message = "执照有效期限的日期格式不正确(YYYYMMDD)", regexp = "(((\\d{4})(0[13578]|10|12)(0[1-9]|[12][0-9]|3[01]))|((\\d{4})(0[469]|11)(0[1-9]|[12][0-9]|30))|((\\d{4})(02)(0[1-9]|1[0-9]|2[0-8]))|([0-9][0-9][02468]40229)|([0-9][0-9][02468]80229)|([0-9][0-9][13579]20229)|([0-9][0-9][13579]60229)|([0-9][0-9][02468]00229))")
    private String id_deadline3;
    private String ope_name;

    @IDTypeCheck(message = "身份证件类型错误", IDType = "app_id_type")
    private String id_type4;
    private String id_no4;

    @Pattern(message = "执照有效期限的日期格式不正确(YYYYMMDD)", regexp = "(((\\d{4})(0[13578]|10|12)(0[1-9]|[12][0-9]|3[01]))|((\\d{4})(0[469]|11)(0[1-9]|[12][0-9]|30))|((\\d{4})(02)(0[1-9]|1[0-9]|2[0-8]))|([0-9][0-9][02468]40229)|([0-9][0-9][02468]80229)|([0-9][0-9][13579]20229)|([0-9][0-9][13579]60229)|([0-9][0-9][02468]00229))")
    private String id_deadline4;
    private String industry_code;
    private String industry;
    private double reg_amt;

    @IDTypeCheck(message = "注册资本金币种错误", IDType = "cur_code")
    private String code;
    private String sys_name;

    public void print() {
        System.out.println(String.format(
                "InsUnit:  company_code1%s  company_code2%s  cst_no%s  open_time%s  close_time%s  acc_name%s  address%s  operate%s  set_file%s  license%s  id_deadline%s  org_no%s  tax_no%s  rep_name%s  id_type2%s  id_no2%s  id_deadline2%s  man_name%s  id_type3%s  id_no3%s  id_deadline3%s  ope_name%s  id_type4%s  id_no4%s  id_deadline4%s  industry_code%s  industry%s  reg_amt%s  code%s  sys_name%s",
                company_code1, company_code2, cst_no, open_time, close_time, acc_name, address, operate, set_file,
                license, id_deadline, org_no, tax_no, rep_name, id_type2, id_no2, id_deadline2, man_name, id_type3,
                id_no3, id_deadline3, ope_name, id_type4, id_no4, id_deadline4, industry_code, industry, reg_amt, code,
                sys_name));
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

    public String getCst_no() {
        return cst_no;
    }

    public void setCst_no(String cst_no) {
        this.cst_no = cst_no;
    }

    public String getOpen_time() {
        return open_time;
    }

    public void setOpen_time(String open_time) {
        this.open_time = open_time;
    }

    public String getClose_time() {
        return close_time;
    }

    public void setClose_time(String close_time) {
        this.close_time = close_time;
    }

    public String getAcc_name() {
        return acc_name;
    }

    public void setAcc_name(String acc_name) {
        this.acc_name = acc_name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOperate() {
        return operate;
    }

    public void setOperate(String operate) {
        this.operate = operate;
    }

    public String getSet_file() {
        return set_file;
    }

    public void setSet_file(String set_file) {
        this.set_file = set_file;
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license;
    }

    public String getId_deadline() {
        return id_deadline;
    }

    public void setId_deadline(String id_deadline) {
        this.id_deadline = id_deadline;
    }

    public String getOrg_no() {
        return org_no;
    }

    public void setOrg_no(String org_no) {
        this.org_no = org_no;
    }

    public String getTax_no() {
        return tax_no;
    }

    public void setTax_no(String tax_no) {
        this.tax_no = tax_no;
    }

    public String getRep_name() {
        return rep_name;
    }

    public void setRep_name(String rep_name) {
        this.rep_name = rep_name;
    }

    public String getId_type2() {
        return id_type2;
    }

    public void setId_type2(String id_type2) {
        this.id_type2 = id_type2;
    }

    public String getId_no2() {
        return id_no2;
    }

    public void setId_no2(String id_no2) {
        this.id_no2 = id_no2;
    }

    public String getId_deadline2() {
        return id_deadline2;
    }

    public void setId_deadline2(String id_deadline2) {
        this.id_deadline2 = id_deadline2;
    }

    public String getMan_name() {
        return man_name;
    }

    public void setMan_name(String man_name) {
        this.man_name = man_name;
    }

    public String getId_type3() {
        return id_type3;
    }

    public void setId_type3(String id_type3) {
        this.id_type3 = id_type3;
    }

    public String getId_no3() {
        return id_no3;
    }

    public void setId_no3(String id_no3) {
        this.id_no3 = id_no3;
    }

    public String getId_deadline3() {
        return id_deadline3;
    }

    public void setId_deadline3(String id_deadline3) {
        this.id_deadline3 = id_deadline3;
    }

    public String getOpe_name() {
        return ope_name;
    }

    public void setOpe_name(String ope_name) {
        this.ope_name = ope_name;
    }

    public String getId_type4() {
        return id_type4;
    }

    public void setId_type4(String id_type4) {
        this.id_type4 = id_type4;
    }

    public String getId_no4() {
        return id_no4;
    }

    public void setId_no4(String id_no4) {
        this.id_no4 = id_no4;
    }

    public String getId_deadline4() {
        return id_deadline4;
    }

    public void setId_deadline4(String id_deadline4) {
        this.id_deadline4 = id_deadline4;
    }

    public String getIndustry_code() {
        return industry_code;
    }

    public void setIndustry_code(String industry_code) {
        this.industry_code = industry_code;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public double getReg_amt() {
        return reg_amt;
    }

    public void setReg_amt(double reg_amt) {
        this.reg_amt = reg_amt;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getSys_name() {
        return sys_name;
    }

    public void setSys_name(String sys_name) {
        this.sys_name = sys_name;
    }
}