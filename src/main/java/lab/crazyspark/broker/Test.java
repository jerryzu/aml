package lab.crazyspark.broker;

public class Test {
   public static void main(String[] args) {
      Notifier notifier = new Notifier();
      CallListener a = new CallListener("Test");
      notifier.regist(a);
      Target.setNotifier(notifier);
      Target.done();
   }
}