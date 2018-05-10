package cn.website.controller.index;


import cn.website.page.pojo.*;
import cn.website.service.discuss.DiscussCommentService;
import cn.website.service.discuss.DiscussQuestionService;
import cn.website.service.follow.FollowService;
import cn.website.service.user.UserService;
import org.aspectj.weaver.patterns.TypePatternQuestions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {
    Logger logger = LoggerFactory.getLogger(IndexController.class);

    @Resource(name = "discussQuestionService")
    private DiscussQuestionService discussQuestionService;

    @Resource(name = "userService")
    private UserService userService;

    @Autowired
    private FollowService followService;
    @Autowired
    private DiscussCommentService discussCommentService;
    @Autowired
    private HostHolder hostHolder;

    @RequestMapping("/")
    public String discussIndex(Model model){
        //将封装完的Vos传到前台即可
        model.addAttribute("vos", getQuestions(0,0,10));
        return "index";
    }

    /*@RequestMapping(path = {"/user/{userId}"})
    public String userIndex(Model model, @PathVariable("userId") Integer userId) {
        model.addAttribute("vos", getQuestions(userId, 0, 8));
        return "index";
    }*/

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
                vos.add(viewObject);
            }
            return vos;
        }
        return null;
    }

    @RequestMapping(path = {"/user/{userId}"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String userIndex(Model model, @PathVariable("userId") int userId) {
        model.addAttribute("vos", getQuestions(userId, 0, 10));

        User user = userService.getUserById(userId);
        ViewObject vo = new ViewObject();
        vo.set("user", user);
        vo.set("commentCount", discussCommentService.getUserCommentCount(userId));
        vo.set("followerCount", followService.getFollowerCount(EntityType.ENTITY_USER, userId));
        vo.set("followeeCount", followService.getFolloweeCount(userId, EntityType.ENTITY_USER));
        if (hostHolder.get() != null) {
            vo.set("followed", followService.isFollower(hostHolder.get().getId(), EntityType.ENTITY_USER, userId));
        } else {
            vo.set("followed", false);
        }
        model.addAttribute("profileUser", vo);
        return "profile";
    }
}
