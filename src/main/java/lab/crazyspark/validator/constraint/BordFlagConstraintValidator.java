package lab.crazyspark.validator.constraint;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class BordFlagConstraintValidator implements ConstraintValidator<BordFlagCheck, String> {

    Class<?>[] cls;

    public void initialize(BordFlagCheck constraintAnnotation) {
        cls = constraintAnnotation.target();
    }

    public boolean isValid(String value, ConstraintValidatorContext constraintValidatorContext) {
        return value != null && (value.equals("10") || value.equals("11"));
        // if (cls.length > 0) {
        // for (Class<?> cl : cls) {
        // try {
        // if (cl.isEnum()) {
        // Object[] objs = cl.getEnumConstants();
        // Method method = cl.getMethod("name");
        // for (Object obj : objs) {
        // Object code = method.invoke(obj, null);
        // // if (value.equals(code.toString())) {
        // return true;
        // // }
        // }
        // }
        // } catch (NoSuchMethodException e) {
        // e.printStackTrace();
        // } catch (IllegalAccessException e) {
        // e.printStackTrace();
        // } catch (IllegalArgumentException e) {
        // e.printStackTrace();
        // } catch (InvocationTargetException e) {
        // e.printStackTrace();
        // }
        // }
        // } else {
        // return true;
        // }
    }
}