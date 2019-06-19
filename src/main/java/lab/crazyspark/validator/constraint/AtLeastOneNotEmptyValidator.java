package lab.crazyspark.validator.constraint;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.lang.reflect.Field;

public class AtLeastOneNotEmptyValidator implements ConstraintValidator<AtLeastOneNotEmpty, Object> {
    private String[] fields;

    public void initialize(AtLeastOneNotEmpty atLeastOneNotEmpty) {
        this.fields = atLeastOneNotEmpty.fields();
    }

    public boolean isValid(Object object, ConstraintValidatorContext constraintValidatorContext) {
        if (object == null) {
            return true;
        }
        try {
            for (String fieldName : fields) {
                Object property = getField(object, fieldName);

                if (property != null && !"".equals(property)) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private Object getField(Object object, String fieldName) throws IllegalAccessException {
        if (object == null) {
            return null;
        }
        Class clazz = object.getClass();
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            if (field.getName().equals(fieldName)) {
                field.setAccessible(true);
                return field.get(object);
            }
        }
        return null;
    }
}