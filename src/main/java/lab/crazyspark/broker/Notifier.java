package lab.crazyspark.broker;

import java.util.ArrayList;
import java.util.List;

// 传入包含回调函数的对象
public class Notifier {
    private List<CallListener> callListenerList = new ArrayList();

    public void regist(CallListener callListener) {
        callListenerList.add(callListener);
    }

    public void doWork(String EventInfo) {
        for (CallListener callListener : callListenerList) {
            // 触发回调函数
            callListener.processEvent(EventInfo);
        }
    }
}