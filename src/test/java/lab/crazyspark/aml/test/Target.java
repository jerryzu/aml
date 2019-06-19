package lab.crazyspark.aml.test;

import lab.crazyspark.broker.*;


public class Target {
    private static Notifier notifier;

    public static void done() {
       notifier.doWork("wine中国");       
       notifier.doWork("wine美国");       
    }

    public static Notifier getNotifier() {
        return notifier;
    }

    public static void setNotifier(Notifier notifier) {
        Target.notifier = notifier;
    }
}