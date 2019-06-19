package lab.crazyspark.aml.test;

import lab.crazyspark.broker.*;


public class Test {
    public static void main1(String[] args) {
       Notifier notifier = new Notifier ();
       CallListener a = new CallListener(null);
    //    CallListener b = new CallListener();
       // 给通知者注册监听者，并直接启动通知
       notifier.regist(a);
    //    notifier.regist(b);
      // 此处回调监听Listener的processEvent处理事件
       notifier.doWork("wine中国");       
       notifier.doWork("wine美国");       
    }

    public static void main(String[] args){
        // Target target = new Target();
        Notifier notifier = new Notifier ();
        CallListener a = new CallListener(null);
        notifier.regist(a);
        Target.setNotifier(notifier);
        Target.done();
    }
}