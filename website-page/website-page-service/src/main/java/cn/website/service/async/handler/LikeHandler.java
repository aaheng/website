package cn.website.service.async.handler;

import cn.website.common.async.EventHandler;
import cn.website.common.async.EventModel;
import cn.website.common.async.EventType;
import cn.website.page.pojo.Message;
import cn.website.page.pojo.User;
import cn.website.service.user.MessageService;
import cn.website.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
@Service
public class LikeHandler implements EventHandler {
    @Autowired
    private UserService userService;
    @Autowired
    private MessageService messageService;

    public void doHandle(EventModel model) {
        //给用户发一个站内信
        Message message = new Message();
        message.setFrom_id(model.getActorId());
        message.setTo_id(model.getEntityOwnerId());
        User user = userService.getUserById(model.getActorId());
        message.setContent("用户"+user.getUsername()+"赞了你的评论,http://127.0.0.1:8080/question/"+model.getExt("questionId"));
        //发送站内信
        messageService.insertMessage(message);
    }

    public List<EventType> getSupportEventTypes() {
        return Arrays.asList(EventType.LIKE);
    }
}
