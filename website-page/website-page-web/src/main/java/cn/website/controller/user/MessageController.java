package cn.website.controller.user;

import cn.website.common.pojo.Code;
import cn.website.common.pojo.SResponse;
import cn.website.page.pojo.HostHolder;
import cn.website.page.pojo.Message;
import cn.website.page.pojo.User;
import cn.website.page.pojo.ViewObject;
import cn.website.service.user.MessageService;
import cn.website.service.user.UserService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class MessageController {
    private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
    @Autowired
    private MessageService messageService;
    @Autowired
    private UserService userService;
    @Autowired
    HostHolder hostHolder;

    @RequestMapping("/message/add")
    @ResponseBody
    public SResponse addMessage(String toName, String content, HttpServletRequest request){
        SResponse resp = new SResponse();
        //判断当前用户是否是登录的
        User currentUser = hostHolder.get();
        if (currentUser == null){
            resp.setCode(Code.USER_UN_LOGIN_CODE);
            resp.setMsg(Code.USER_UN_LOGIN_MSG);
            return resp;
        }
        if (StringUtils.isBlank(toName)){
            resp.setCode(Code.PARAMS_ERROR_CODE);
            resp.setMsg(Code.PARAMS_ERROR_MSG);
            return resp;
        }
         //判断toName是否是为空
        User user = userService.getUserByUsername(toName);
        if (user == null){
            resp.setCode(Code.MESSAGE_RECEIVER_NONE_CODE);
            resp.setMsg(Code.MESSAGE_RECEIVER_NONE_MSG);
            return resp;
        }
        if (StringUtils.isBlank(content)){
            resp.setCode(Code.PARAMS_ERROR_CODE);
            resp.setMsg(Code.PARAMS_ERROR_MSG);
            return resp;
        }
        Message message = new Message();
        message.setTo_id(user.getId());
        message.setFrom_id(currentUser.getId());
        message.setContent(content);
        message.setConversation_id(message.getConversationId());
        SResponse result = messageService.insertMessage(message);
        return result;
    }

    @RequestMapping("/toMessage")
    public String messageList(HttpServletRequest request){
        User user = hostHolder.get();
        if (user == null){
            return "redirect:/reglogin?callback="+request.getRequestURI();
        }
        Integer currentUserId = user.getId();
        List<Message> messageList = messageService.getConversationList(currentUserId);
        List<ViewObject> vos = new ArrayList<ViewObject>();
        for (Message message : messageList){
            ViewObject viewObject = new ViewObject();
            viewObject.set("message",message);
            Integer targetId = message.getFrom_id().equals(currentUserId)?message.getTo_id():message.getFrom_id();
            viewObject.set("user",userService.getUserById(targetId));
            viewObject.set("unread", messageService.getConversationUnreadCount(user.getId(), message.getConversationId()));
            vos.add(viewObject);
        }
        request.setAttribute("vos",vos);
        return "message";
    }

    @RequestMapping(path = {"/msg/detail"}, method = {RequestMethod.GET})
    public String getConversationDetail(Model model, @RequestParam("conversationId") String conversationId) {
        try {
            List<Message> messageList = messageService.getConversationDetail(conversationId, 0, 10);
            List<ViewObject> messages = new ArrayList<ViewObject>();
            for (Message message : messageList) {
                ViewObject vo = new ViewObject();
                vo.set("message", message);
                vo.set("user", userService.getUserById(message.getFrom_id()));
                messages.add(vo);
            }
            model.addAttribute("messages", messages);
        } catch (Exception e) {
            logger.error("获取详情失败" + e.getMessage());
        }
        return "messageDetail";
    }

    @RequestMapping("/toAddMessage")
    public String toAddMessage() {
        return "/addMessage";
    }


}
