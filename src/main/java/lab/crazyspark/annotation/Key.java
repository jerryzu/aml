package lab.crazyspark.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.annotation.ElementType;

// @Target(ElementType.METHOD)
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Key {
    String value() default "";
}