package lab.crazyspark.validator.constraint;

import java.util.Date;
import java.text.SimpleDateFormat;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class DateConstraintValidator implements ConstraintValidator<DateCheck, Date> {
    private DateCheck mydt;

    public void initialize(DateCheck mydt) {
        this.mydt = mydt;
    }

    public boolean isValid(Date value, ConstraintValidatorContext context) {
        String pattern = mydt.pattern();
        SimpleDateFormat df = new SimpleDateFormat(pattern);
        Date minDt;
        Date maxDt;
        boolean isOK = true;
        try {
            String msg;
            if (value == null) {
                isOK = false;
                msg = mydt.message() + ",当前日期为空";
            } else {
                msg = mydt.message() + ",当前日期为=" + value;
                String strMinDt = mydt.minDate();
                String strMaxDt = mydt.maxDate();

                minDt = df.parse(strMinDt);
                maxDt = df.parse(strMaxDt);

                int check1 = value.compareTo(minDt);
               int check2 = value.compareTo(maxDt);
                if (check1 == -1 || check2 == 1)
                    isOK = false;
            }

            if (isOK == false) {
                context.disableDefaultConstraintViolation();
                context.buildConstraintViolationWithTemplate(msg).addConstraintViolation();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isOK;
    }
}