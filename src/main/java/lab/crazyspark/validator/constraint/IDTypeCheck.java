package lab.crazyspark.validator.constraint;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = IDTypeConstraintValidator.class)
public @interface IDTypeCheck {

    String message() default "身份证类型错误";

	String IDType() default ""; 

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

}