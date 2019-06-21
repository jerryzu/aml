package lab.crazyspark.bean;

import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import lab.crazyspark.annotation.Entity;
import lab.crazyspark.annotation.Key;
import lab.crazyspark.validator.constraint.CompanyCheck;
import lab.crazyspark.validator.constraint.IDTypeCheck;

@Entity(table = "tb_ins_rtype")
public class InsRType {
    private String head_no;

    @CompanyCheck
    private String company_code1;

    @IDTypeCheck(message = "险种分类错误", IDType = "ins_type") // 暂无人身险
    private String ins_type;
    
    @Key
    private String ins_no;

    private String ins_name;

    public void print() {
        System.out.println(String.format("InsRType: head_no%s company_code1%s ins_type%s ins_no%s ins_name%s", head_no,
                company_code1, ins_type, ins_no, ins_name));
    }

    public String getHead_no() {
        return head_no;
    }

    public void setHead_no(String head_no) {
        this.head_no = head_no;
    }

    public String getcompany_code1() {
        return company_code1;
    }

    public void setcompany_code1(String company_code1) {
        this.company_code1 = company_code1;
    }

    public String getIns_type() {
        return ins_type;
    }

    public void setIns_type(String ins_type) {
        this.ins_type = ins_type;
    }

    public String getIns_no() {
        return ins_no;
    }

    public void setIns_no(String ins_no) {
        this.ins_no = ins_no;
    }

    public String getIns_name() {
        return ins_name;
    }

    public void setIns_name(String ins_name) {
        this.ins_name = ins_name;
    }
}