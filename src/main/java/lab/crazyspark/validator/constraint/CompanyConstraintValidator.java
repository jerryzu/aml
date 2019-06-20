package lab.crazyspark.validator.constraint;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import lab.crazyspark.aml.Setting;
import lab.crazyspark.bean.Company;
import java.util.List;

public class CompanyConstraintValidator implements ConstraintValidator<CompanyCheck, String> {

    private List<Company> Companies;

    public void initialize(CompanyCheck  constraintAnnotation) {
        Companies = Setting.getCompanies();
        for (Company com : Companies) {
            System.out.println("company_code1:" + com.getcompany_code1());            
        }
    }

    public boolean isValid(String company, ConstraintValidatorContext constraintValidatorContext) {
        if (company == null) {
            return false;
        }

        for (Company compan : Companies) {
            if (compan.getcompany_code1().equals(company)) {
                return true;
            }
        }
        return false;
    }
}