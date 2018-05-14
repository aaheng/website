package cn.website.service.user;

import cn.website.common.pojo.Code;
import cn.website.common.pojo.SResponse;
import cn.website.mapper.user.MessageMapper;
import cn.website.page.pojo.Message;
import cn.website.service.SensitiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

import java.util.List;

@Service
public class MessageService {
    @Autowired
    private MessageMapper messageMapper;
    @Autowired
    private SensitiveService sensitiveService;
    @Autowired
    private UserService userService;

    public SResponse insertMessage(Message message){
        SResponse resp = new SResponse();
        message.setContent(HtmlUtils.htmlEscape(message.getContent()));
        message.setContent(sensitiveService.filterWords(message.getContent()));
        Integer result = messageMapper.insertMessage(message);
        if (result > 0){
            String conversationId = message.getConversationId();
            resp.setCode(Code.SUCCESS_CODE);
            resp.setMsg(Code.SUCCESS_MSG);
            resp.setResult(conversationId);
            return resp;
        }
        resp.setCode(Code.EXCEPTION_CODE);
        resp.setMsg(Code.EXCEPTION_MSG);
        return resp;
    }

    public List<Message> getConversationList(Integer currentUserId) {

        return messageMapper.getConversationList(currentUserId);
    }

    public int getConversationUnreadCount(int userId, String conversationId) {
        return messageMapper.getConversationUnreadCount(userId, conversationId);
    }

    public List<Message> getConversationDetail(String conversationId,int offset, int limit){
        return messageMapper.getConversationDetail(conversationId, offset, limit);
    }
}
