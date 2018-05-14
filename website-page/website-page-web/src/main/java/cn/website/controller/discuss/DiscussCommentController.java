package cn.website.controller.discuss;

import cn.website.common.async.EventModel;
import cn.website.common.async.EventProducer;
import cn.website.common.async.EventType;
import cn.website.common.pojo.Code;
import cn.website.common.pojo.SResponse;
import cn.website.page.pojo.EntityType;
import cn.website.page.pojo.HostHolder;
import cn.website.service.discuss.DiscussCommentService;
import cn.website.service.discuss.DiscussQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/discuss")
public class DiscussCommentController {
    @Resource(name = "discussCommentService")
    private DiscussCommentService discussCommentService;
    @Resource(name = "discussQuestionService")
    private DiscussQuestionService discussQuestionService;
    @Autowired
    private HostHolder hostHolder;
    @Autowired
    private EventProducer eventProducer;

    @RequestMapping("/comment/add")
    @ResponseBody
    public SResponse addComment(@RequestParam("content") String content, Integer questionId) {
        SResponse resp = new SResponse();
        if (hostHolder.get() == null){
            resp.setCode(Code.USER_UN_LOGIN_CODE);
            resp.setMsg(Code.USER_UN_LOGIN_MSG);
            resp.setResult("/discuss/question/detail/"+questionId);
            return resp;
        }
        resp = discussCommentService.addComment(content, questionId);
        eventProducer.fireEvent(new EventModel().setType(EventType.COMMENT).setActorId(hostHolder.get().getId())
                .setEntityId(questionId));
        return resp;
    }


}
