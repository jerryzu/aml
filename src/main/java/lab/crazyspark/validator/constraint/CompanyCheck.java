package lab.crazyspark.validator.constraint;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = CompanyConstraintValidator.class)
public @interface CompanyCheck {

    String message() default "Company不存在";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}