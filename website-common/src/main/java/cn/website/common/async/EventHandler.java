package cn.website.common.async;

import java.util.List;

public interface EventHandler {
    //处理事件eventm有model
    void doHandle(EventModel model);

    //这个Handler所关联的事件有哪些,当这些事件来的时候,调用它上面的doHandle方法进行处理
    List<EventType> getSupportEventTypes();
}
