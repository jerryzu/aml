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
    }

    public boolean isValid(String company, ConstraintValidatorContext constraintValidatorContext) {
        if (company == null) {
            return false;
        }

        for (Company compan : Companies) {
            if (compan.getCompany_codel().equals(company)) {
                return true;
            }
        }
        return false;
    }
}