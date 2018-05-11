package cn.website.service.async.handler;

import cn.website.common.async.EventHandler;
import cn.website.common.async.EventModel;
import cn.website.common.async.EventType;
import cn.website.common.utils.WebSiteUtils;
import cn.website.page.pojo.EntityType;
import cn.website.page.pojo.Message;
import cn.website.page.pojo.User;
import cn.website.service.user.MessageService;
import cn.website.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * Created by nowcoder on 2016/7/30.
 */
@Component
public class FollowHandler implements EventHandler {
    @Autowired
    MessageService messageService;

    @Autowired
    UserService userService;

    @Override
    public void doHandle(EventModel model) {
        Message message = new Message();
        message.setFrom_id(WebSiteUtils.SYSTEM_USERID);
        message.setTo_id(model.getEntityOwnerId());
        message.setCreate_time(new Date().toString());
        User user = userService.getUserById(model.getActorId());

        if (model.getEntityType() == EntityType.ENTITY_QUESTION) {
            message.setContent("用户" + user.getUsername()
                    + "关注了你的问题,http://127.0.0.1:8081/question/" + model.getEntityId());
        } else if (model.getEntityType() == EntityType.ENTITY_USER) {
            message.setContent("用户" + user.getUsername()
                    + "关注了你,http://127.0.0.1:8081/user/" + model.getActorId());
        }

        messageService.insertMessage(message);
    }

    @Override
    public List<EventType> getSupportEventTypes() {
        return Arrays.asList(EventType.FOLLOW);
    }
}
