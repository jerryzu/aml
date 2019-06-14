package lab.crazyspark.validator.constraint;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class SexConstraintValidator implements ConstraintValidator<SexCheck, String> {
    public boolean isValid(String value, ConstraintValidatorContext context) {
        return value != null && (value.equals("男") || value.equals("女"));
    }

    public void initialize(SexCheck constraintAnnotation) {

    }
}