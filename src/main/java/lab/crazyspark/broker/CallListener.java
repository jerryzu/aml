package lab.crazyspark.broker;

//实现接口的回调方法
public class CallListener implements Event {
    private String name;

    public CallListener(String name) {
        // 新建一个事件通知者对象，并把自己传递给它
        this.name = name;
    }
    // 实现事件发生时，实际处理事件的方法
    // @override
    // public void processEvent() {
    // // 监听到事件发生了，进行处理
    // }

    public void processEvent(String EventInfo) {
        System.out.println("start");
        System.out.println(EventInfo);
    }
}