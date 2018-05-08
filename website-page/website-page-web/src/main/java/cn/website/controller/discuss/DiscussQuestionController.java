package cn.website.controller.discuss;

import cn.website.common.pojo.Code;
import cn.website.common.pojo.SResponse;
import cn.website.page.pojo.*;
import cn.website.service.discuss.DiscussCommentService;
import cn.website.service.discuss.DiscussQuestionService;
import cn.website.service.discuss.LikeService;
import cn.website.service.user.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/discuss")
public class DiscussQuestionController {

    @Resource(name = "discussQuestionService")
    private DiscussQuestionService discussQuestionService;
    @Resource(name = "discussCommentService")
    private DiscussCommentService discussCommentService;
    @Resource(name = "userService")
    private UserService userService;
    @Autowired
    private HostHolder hostHolder;
    @Autowired
    private LikeService likeService;

    //获取问题列表
    @RequestMapping("/getQuestionList")
    public String getQuestionList(Model model) {
        List<DiscussQuestion> questionList = discussQuestionService.getQuestionList();
        model.addAttribute("questionList", questionList);
        return "discuss";
    }


    @RequestMapping("/question/insert")
    @ResponseBody
    public SResponse insertQuestion(String title, String content) {
        SResponse response = new SResponse();
        if (StringUtils.isBlank(title) || StringUtils.isBlank(content)) {
            //参数错误
            response.setCode(Code.PARAMS_ERROR_CODE);
            response.setMsg(Code.PARAMS_ERROR_MSG);
            return response;
        }
        //调用service
        response = discussQuestionService.insertDiscussQuestion(title, content);
        return response;
    }

    /***
     * 跳转到问题详情页面
     * @return
     */
    @RequestMapping("/question/detail/{id}")
    public String toQuestionDetail(@PathVariable("id") Integer id, Model model) {
        //根据id查找问题的相关信息,标题内容评论
        DiscussQuestion question = discussQuestionService.getDiscussQuestionById(id);
        //查找该问题的评论
        List<DiscussComment> commentList = discussCommentService.getCommentByEntity(id, EntityType.ENTITY_QUESTION);
        List<ViewObject> vos = new ArrayList<ViewObject>();
        for (DiscussComment comment : commentList) {
            ViewObject vo = new ViewObject();
            vo.set("comment", comment);
            //封装该评论的用户信息
            User user = userService.getUserById(comment.getUser_id());
            //评论的点赞信息
            if (hostHolder.get() == null) {
                vo.set("liked", 0);
            } else {
                vo.set("liked", likeService.getLikeStatus(hostHolder.get().getId(), EntityType.ENTITY_COMMENT, comment.getId()));
            }

            vo.set("likeCount", likeService.getLikeCount(EntityType.ENTITY_COMMENT, comment.getId()));
            vo.set("user", user);
            vos.add(vo);
        }

        model.addAttribute("question", question);
        model.addAttribute("vos", vos);
        return "question";
    }

    @RequestMapping("/toAddQuestion")
    public String toAddQuestion() {
        return "discuss/addQuestion";
    }


}
