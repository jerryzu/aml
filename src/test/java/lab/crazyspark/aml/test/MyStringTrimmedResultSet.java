package lab.crazyspark.aml.test;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.sql.ResultSet;

import org.apache.commons.dbutils.ProxyFactory;

public class MyStringTrimmedResultSet implements InvocationHandler {
    private static final ProxyFactory factory = ProxyFactory.instance();

    public static ResultSet wrap(ResultSet rs) {
        return factory.createResultSet(new MyStringTrimmedResultSet(rs));
    }

    private final ResultSet rs;

    public MyStringTrimmedResultSet(ResultSet rs) {
        super();
        this.rs = rs;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        Object result = method.invoke(this.rs, args);
        // ＆＆逻辑与 ｜｜逻辑或 它们都是逻辑运算符
        if ((method.getName().equals("getObject") || method.getName().equals("getString"))
                && result instanceof String) {
            result = ((String) result).trim();
        }
        if (args == null) {
        } else {
            // System.out.println("invoke" + args.getClass() +
            // method.getName()+(String)result);
        }
        return result;
    }
}