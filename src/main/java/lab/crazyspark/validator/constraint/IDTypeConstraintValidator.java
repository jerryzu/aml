package lab.crazyspark.validator.constraint;

import java.util.List;
import lab.crazyspark.aml.Item;
import lab.crazyspark.aml.Setting;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class IDTypeConstraintValidator implements ConstraintValidator<IDTypeCheck, String> {
    private List<Item> IDTypes;

    public void initialize(IDTypeCheck constraintAnnotation) {
        IDTypes = Setting.getIDTypes(constraintAnnotation.IDType());
    }

    public boolean isValid(String item, ConstraintValidatorContext constraintValidatorContext) {
        if (item == null) {
            return false;
        }

        for (Item idType : IDTypes) {
            if (idType.getC_par_cde().equals(item)) {
                return true;
            }
        }
        return false;
    }
}