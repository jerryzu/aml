package lab.crazyspark.broker;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Target {
    private static Notifier notifier;

    public static void done() {
        do {
            Date dt = new Date();// 如果不需要格式,可直接用dt,dt就是当前系统时间
            DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");// 设置显示格式
            String nowTime = "";
            nowTime = df.format(dt);// 用DateFormat的format()方法在dt中获取并以yyyy/MM/dd HH:mm:ss格式显示
            notifier.doWork(nowTime);
            try {
                Thread.sleep(1000);// 延时2秒
            } catch (InterruptedException e) {
                e.printStackTrace();
            } 
        } while (true);
    }

    public static Notifier getNotifier() {
        return notifier;
    }

    public static void setNotifier(Notifier notifier) {
        Target.notifier = notifier;
    }
}