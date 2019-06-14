package lab.crazyspark.validator.constraint;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


import javax.validation.Constraint;
import javax.validation.Payload;

@Target({ElementType.FIELD, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy=DateConstraintValidator.class)

public @interface DateCheck {
       String minDate() default "1990-9-1"; //设最小日期的缺省值
    
       String maxDate() default "1999-8-30";  //设最大日期的 缺省值
       String pattern() default "yyyy-MM-dd";
       String message();
    
       Class<?>[] groups() default {};

       Class<? extends Payload>[] payload() default {}; 
}