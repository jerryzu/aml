package lab.crazyspark.bean;

import java.sql.SQLException;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.apache.commons.dbutils.QueryRunner;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import lab.crazyspark.annotation.Entity;
import lab.crazyspark.validator.constraint.IDTypeCheck;
import lab.crazyspark.validator.constraint.SexCheck;

@Entity(table = "tb_ins_pers")
public class InsPers {
    private String company_code1;

    private String company_code2;

    private String cst_no;

    @Pattern(message = "日期格式不正确(YYYYMMDD)", regexp = "(((\\d{4})(0[13578]|10|12)(0[1-9]|[12][0-9]|3[01]))|((\\d{4})(0[469]|11)(0[1-9]|[12][0-9]|30))|((\\d{4})(02)(0[1-9]|1[0-9]|2[0-8]))|([0-9][0-9][02468]40229)|([0-9][0-9][02468]80229)|([0-9][0-9][13579]20229)|([0-9][0-9][13579]60229)|([0-9][0-9][02468]00229))")
    private String open_time;

    @Pattern(message = "日期格式不正确(YYYYMMDD)", regexp = "(((\\d{4})(0[13578]|10|12)(0[1-9]|[12][0-9]|3[01]))|((\\d{4})(0[469]|11)(0[1-9]|[12][0-9]|30))|((\\d{4})(02)(0[1-9]|1[0-9]|2[0-8]))|([0-9][0-9][02468]40229)|([0-9][0-9][02468]80229)|([0-9][0-9][13579]20229)|([0-9][0-9][13579]60229)|([0-9][0-9][02468]00229))")
    private String close_time;

    private String acc_name;

    @SexCheck(message = "性别 1:男;12:女")
    private String cst_sex;

    @IDTypeCheck(message = "国籍地区错误", IDType = "nation")
    private String nation;

    @NotNull(message = "身份证类型不能为空")
    @IDTypeCheck(message = "身份证类型错误", IDType = "acc_id_type")
    private String id_type;

    @Length(min = 15, max = 18, message = "身份证号码长度必须为15-18位")
    private String id_no;

    @Pattern(message = "日期格式不正确(YYYYMMDD)", regexp = "(((\\d{4})(0[13578]|10|12)(0[1-9]|[12][0-9]|3[01]))|((\\d{4})(0[469]|11)(0[1-9]|[12][0-9]|30))|((\\d{4})(02)(0[1-9]|1[0-9]|2[0-8]))|([0-9][0-9][02468]40229)|([0-9][0-9][02468]80229)|([0-9][0-9][13579]20229)|([0-9][0-9][13579]60229)|([0-9][0-9][02468]00229))")
    private String id_deadline;

    private String occupation_code;// 职业代码末处理

    private String occupation;

    @Min(value = 0, message = "年收入必须大于等于零")
    private double income;

    private String contact1;

    private String contact2;

    private String contact3;

    private String address1;

    private String address2;

    private String address3;

    private String company;

    private String sys_name;

    public void print() {
        System.out.println(String.format(
                "InsPers:  company_code1%s company_code2%s cst_no%s open_time%s close_time%s acc_name%s cst_sex%s nation%s id_type%s id_no%s id_deadline%s occupation_code%s occupation%s income%s contact1%s contact2%s contact3%s address1%s address2%s address3%s company%s sys_name%s ",
                company_code1, company_code2, cst_no, open_time, close_time, acc_name, cst_sex, nation, id_type, id_no,
                id_deadline, occupation_code, occupation, income, contact1, contact2, contact3, address1, address2,
                address3, company, sys_name));
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

    public String getCst_sex() {
        return cst_sex;
    }

    public void setCst_sex(String cst_sex) {
        this.cst_sex = cst_sex;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getId_type() {
        return id_type;
    }

    public void setId_type(String id_type) {
        this.id_type = id_type;
    }

    public String getId_no() {
        return id_no;
    }

    public void setId_no(String id_no) {
        this.id_no = id_no;
    }

    public String getId_deadline() {
        return id_deadline;
    }

    public void setId_deadline(String id_deadline) {
        this.id_deadline = id_deadline;
    }

    public String getOccupation_code() {
        return occupation_code;
    }

    public void setOccupation_code(String occupation_code) {
        this.occupation_code = occupation_code;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public double getIncome() {
        return income;
    }

    public void setIncome(double income) {
        this.income = income;
    }

    public String getContact1() {
        return contact1;
    }

    public void setContact1(String contact1) {
        this.contact1 = contact1;
    }

    public String getContact2() {
        return contact2;
    }

    public void setContact2(String contact2) {
        this.contact2 = contact2;
    }

    public String getContact3() {
        return contact3;
    }

    public void setContact3(String contact3) {
        this.contact3 = contact3;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getAddress3() {
        return address3;
    }

    public void setAddress3(String address3) {
        this.address3 = address3;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getSys_name() {
        return sys_name;
    }

    public void setSys_name(String sys_name) {
        this.sys_name = sys_name;
    }

}