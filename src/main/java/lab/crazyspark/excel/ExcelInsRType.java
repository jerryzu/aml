package lab.crazyspark.excel;

import java.sql.SQLException;
import java.util.List;

import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;
import com.alibaba.excel.metadata.Sheet;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

public class ExcelInsRType extends BaseRowModel {

    @ExcelProperty(value = "head_no", index = 0)
    private String head_no;

    @ExcelProperty(value = "company_codel", index = 0)
    private String company_codel;

    @ExcelProperty(value = "ins_type", index = 0)
    private String ins_type;

    @ExcelProperty(value = "ins_no", index = 0)
    private String ins_no;

    @ExcelProperty(value = "ins_name", index = 0)
    private String ins_name;

    public void print() {
        System.out.println(String.format("InsRType: head_no%s company_codel%s ins_type%s ins_no%s ins_name%s", head_no,
                company_codel, ins_type, ins_no, ins_name));
    }

    public static List<ExcelInsRType> Exp2Excel(QueryRunner runner, ExcelWriter writer, Sheet sheet)
            throws SQLException {
        sheet.setSheetName("InsRType");
        String sql = "SELECT * from tb_ins_rtype";
        List<ExcelInsRType> result = runner.query(sql, new BeanListHandler<ExcelInsRType>(ExcelInsRType.class));
        return result;
    }

    public String getHead_no() {
        return head_no;
    }

    public void setHead_no(String head_no) {
        this.head_no = head_no;
    }

    public String getCompany_codel() {
        return company_codel;
    }

    public void setCompany_codel(String company_codel) {
        this.company_codel = company_codel;
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