package cn.website.controller.discuss;

import cn.website.common.async.EventModel;
import cn.website.common.async.EventProducer;
import cn.website.common.async.EventType;
import cn.website.common.pojo.Code;
import cn.website.common.pojo.SResponse;
import cn.website.page.pojo.*;
import cn.website.service.discuss.DiscussCommentService;
import cn.website.service.discuss.DiscussQuestionService;
import cn.website.service.discuss.LikeService;
import cn.website.service.follow.FollowService;
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
    @Autowired
    private FollowService followService;

    //获取问题列表
    @RequestMapping("/getQuestionList")
    public String getQuestionList(Model model) {
        model.addAttribute("vos", getQuestions(0,0,10));
        return "discuss";
    }


    @RequestMapping("/question/insert")
    @ResponseBody
    public SResponse insertQuestion(String title, String content) {
        SResponse response = new SResponse();
        if (hostHolder.get() == null) {
            response.setCode(Code.USER_UN_LOGIN_CODE);
            response.setMsg(Code.USER_UN_LOGIN_MSG);
            response.setResult("/discuss/getQuestionList");
            return response;
        }
        if (StringUtils.isBlank(title) || StringUtils.isBlank(content)) {
            //参数错误
            response.setCode(Code.PARAMS_ERROR_CODE);
            response.setMsg(Code.PARAMS_ERROR_MSG);
            return response;
        }
        //调用service
        response = discussQuestionService.insertDiscussQuestion(title, content);
        /*eventProducer.fireEvent(new EventModel().setType(EventType.ADD_QUESTION)
                .setActorId(question.getUserId()).setEntityId(question.getId())
                .setExt("title", question.getTitle()).setExt("content", question.getContent()));*/
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

        List<ViewObject> followUsers = new ArrayList<ViewObject>();
        // 获取关注的用户信息
        List<Integer> users = followService.getFollowers(EntityType.ENTITY_QUESTION, id, 20);
        for (Integer userId : users) {
            ViewObject vo = new ViewObject();
            User u = userService.getUserById(userId);
            if (u == null) {
                continue;
            }
            vo.set("name", u.getUsername());
            vo.set("headUrl", u.getHeadUrl());
            vo.set("id", u.getId());
            followUsers.add(vo);
        }
        model.addAttribute("followUsers", followUsers);
        if (hostHolder.get() != null) {
            model.addAttribute("followed", followService.isFollower(hostHolder.get().getId(), EntityType.ENTITY_QUESTION, id));
        } else {
            model.addAttribute("followed", false);
        }
        return "question";
    }

    @RequestMapping("/toAddQuestion")
    public String toAddQuestion() {
        return "discuss/addQuestion";
    }


    public List<ViewObject> getQuestions(Integer userId, Integer index, Integer limit) {
        //展示最新十条信息,以及用户信息
        List<DiscussQuestion> questionList = discussQuestionService.getLatestQuestions(userId, index, limit);
        //将每一条问答信息封装进map中
        if (questionList != null && questionList.size() > 0) {
            List<ViewObject> vos = new ArrayList<ViewObject>();
            for (DiscussQuestion question : questionList) {
                ViewObject viewObject = new ViewObject();
                viewObject.set("question", question);
                viewObject.set("user", userService.getUserById(question.getUser_id()));
                viewObject.set("followCount", followService.getFollowerCount(EntityType.ENTITY_QUESTION, question.getId()));
                vos.add(viewObject);
            }
            return vos;
        }
        return null;
    }
}
