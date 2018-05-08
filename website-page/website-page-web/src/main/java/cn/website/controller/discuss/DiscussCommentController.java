package cn.website.controller.discuss;

import cn.website.common.pojo.SResponse;
import cn.website.page.pojo.EntityType;
import cn.website.service.discuss.DiscussCommentService;
import cn.website.service.discuss.DiscussQuestionService;
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

    @RequestMapping("/comment/add")
    @ResponseBody
    public SResponse addComment(@RequestParam("content") String content, Integer questionId) {
        SResponse sResponse = discussCommentService.addComment(content, questionId);
        return sResponse;
    }


}
