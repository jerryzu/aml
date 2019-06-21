package lab.crazyspark.bean;

import lab.crazyspark.annotation.Entity;
import lab.crazyspark.annotation.Key;
import lab.crazyspark.validator.constraint.AtLeastOneNotEmpty;
import lab.crazyspark.validator.constraint.BordFlag;
import lab.crazyspark.validator.constraint.BordFlagCheck;

@Entity(table = "tb_company")
public class Company {
    private String head_no;

    @Key
    public String company_code1;

    private String company_code2;

    private String company_name;

    @BordFlagCheck(message = "境内外标识输入错误", target = BordFlag.class)
    private String bord_flag;

    public void print() {
        System.out
                .println(String.format("Company: head_no%s company_code1%s company_code2%s company_name%s bord_flag%s",
                        head_no, company_code1, company_code2, company_name, bord_flag));
    }

    public String getHead_no() {
        return head_no;
    }

    public void setHead_no(String head_no) {
        this.head_no = head_no;
    }

    public String getCompany_code1() {
        return company_code1;
    }

    public void setCompany_code1(String company_code1) {
        this.company_code1 = company_code1;
    }

    public String getCompany_code2() {
        return company_code2;
    }

    public void setCompany_code2(String company_code2) {
        this.company_code2 = company_code2;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getBord_flag() {
        return bord_flag;
    }

    public void setBord_flag(String bord_flag) {
        this.bord_flag = bord_flag;
    }
}