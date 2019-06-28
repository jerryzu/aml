package lab.crazyspark.aml.test;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public class Main extends Generic<String> {

    public static void main(String[] args) {
        // 具体参数类型
        Main testClass = new Main();
        System.out.println(getGenericType(testClass.getClass()));
    }

    /**
     * 获取所继承类的泛型实际类型
     *
     * @param declaredClass 传入Class实例
     * @return 泛型实际类型
     */
    private static Class getGenericType(Class declaredClass) {
        ParameterizedType parameterizedType = (ParameterizedType) declaredClass.getGenericSuperclass();
        Type[] actualTypeArguments = parameterizedType.getActualTypeArguments();
        return (Class) actualTypeArguments[0];
    }

}