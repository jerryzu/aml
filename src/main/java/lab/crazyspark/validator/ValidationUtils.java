package lab.crazyspark.validator;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;


public class ValidationUtils {
    /**
     * 使用hibernate的注解来进行验证
     */
    // private static Validator validator =
    // Validation.byProvider(HibernateValidator.class).configure().failFast(true)
    // .buildValidatorFactory().getValidator();

    private static Validator validator = Validation.buildDefaultValidatorFactory().getValidator();

    public static <T> List<String> validate(T t) {
        Set<ConstraintViolation<T>> constraintViolations = validator.validate(t);

        List<String> messageList = new ArrayList<String>();
        for (ConstraintViolation<T> constraintViolation : constraintViolations) {
            messageList.add(constraintViolation.getPropertyPath().toString() + ":" + constraintViolation.getMessage());
        }
        return messageList;
    }
}