package cn.website.controller.follow;



import cn.website.common.async.EventModel;
import cn.website.common.async.EventProducer;
import cn.website.common.async.EventType;
import cn.website.common.pojo.Code;
import cn.website.common.pojo.SResponse;
import cn.website.page.pojo.*;
import cn.website.service.discuss.DiscussCommentService;
import cn.website.service.discuss.DiscussQuestionService;
import cn.website.service.follow.FollowService;
import cn.website.service.user.UserService;
import com.alibaba.fastjson.JSONObject;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FollowController {

    @Autowired
    FollowService followService;

    @Autowired
    DiscussCommentService discussCommentService;

    @Autowired
    DiscussQuestionService questionService;

    @Autowired
    UserService userService;

    @Autowired
    HostHolder hostHolder;

    @Autowired
    EventProducer eventProducer;

    @RequestMapping(path = {"/followUser"}, method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public SResponse followUser(@RequestParam("userId") int userId) {
        SResponse resp = new SResponse();
        if (hostHolder.get() == null) {
            resp.setCode(Code.USER_UN_LOGIN_CODE);
            resp.setMsg(Code.USER_UN_LOGIN_MSG);
            return resp;
        }

        boolean ret = followService.follow(hostHolder.get().getId(), EntityType.ENTITY_USER, userId);

        eventProducer.fireEvent(new EventModel().setType(EventType.FOLLOW)
                .setActorId(hostHolder.get().getId()).setEntityId(userId)
                .setEntityType(EntityType.ENTITY_USER).setEntityOwnerId(userId));

        // 返回关注的人数
        JSONObject result = new JSONObject();
        result.put("result",ret ? 0 : 1);
        result.put("fCount",String.valueOf(followService.getFolloweeCount(hostHolder.get().getId(), EntityType.ENTITY_USER)));
        resp.setResult(result);
        return resp;
    }

    @RequestMapping(path = {"/unfollowUser"}, method = {RequestMethod.POST})
    @ResponseBody
    public SResponse unfollowUser(@RequestParam("userId") int userId) {
       SResponse resp = new SResponse();
        if (hostHolder.get() == null) {
            resp.setCode(Code.USER_UN_LOGIN_CODE);
            resp.setMsg(Code.USER_UN_LOGIN_MSG);
            return resp;
        }

        boolean ret = followService.unfollow(hostHolder.get().getId(), EntityType.ENTITY_USER, userId);

        eventProducer.fireEvent(new EventModel().setType(EventType.UNFOLLOW)
                .setActorId(hostHolder.get().getId()).setEntityId(userId)
                .setEntityType(EntityType.ENTITY_USER).setEntityOwnerId(userId));

        // 返回关注的人数
        JSONObject result = new JSONObject();
        result.put("result",ret ? 0 : 1);
        result.put("fCount",String.valueOf(followService.getFolloweeCount(hostHolder.get().getId(), EntityType.ENTITY_USER)));
        resp.setResult(result);
        return resp;
    }

    @RequestMapping(path = {"/followQuestion"}, method = {RequestMethod.POST})
    @ResponseBody
    public SResponse followQuestion(@RequestParam("questionId") int questionId) {
       SResponse resp = new SResponse();
        if (hostHolder.get() == null) {
            resp.setCode(Code.USER_UN_LOGIN_CODE);
            resp.setMsg(Code.USER_UN_LOGIN_MSG);
            return resp;
        }
        DiscussQuestion q = questionService.getDiscussQuestionById(questionId);
        if (q == null) {
            resp.setCode(Code.QUESTION_NOT_EXIST_CODE);
            resp.setMsg(Code.QUESTION_NOT_EXIST_MSG);
            return resp;
        }

        boolean ret = followService.follow(hostHolder.get().getId(), EntityType.ENTITY_QUESTION, questionId);

        eventProducer.fireEvent(new EventModel().setType(EventType.FOLLOW)
                .setActorId(hostHolder.get().getId()).setEntityId(questionId)
                .setEntityType(EntityType.ENTITY_QUESTION).setEntityOwnerId(q.getUser_id()));

        Map<String, Object> info = new HashMap<String,Object>();
        info.put("name", hostHolder.get().getUsername());
        info.put("id", hostHolder.get().getId());
        info.put("count", followService.getFollowerCount(EntityType.ENTITY_QUESTION, questionId));
        JSONObject result = new JSONObject();
        result.put("result",ret ? 0 : 1);
        result.put("info",info);
        resp.setCode(Code.SUCCESS_CODE);
        resp.setMsg(Code.SUCCESS_MSG);
        resp.setResult(result);
        return resp;
    }

    @RequestMapping(path = {"/unfollowQuestion"}, method = {RequestMethod.POST})
    @ResponseBody
    public SResponse unfollowQuestion(@RequestParam("questionId") int questionId) {
        SResponse resp = new SResponse();
        if (hostHolder.get() == null) {
            resp.setCode(Code.USER_UN_LOGIN_CODE);
            resp.setMsg(Code.USER_UN_LOGIN_MSG);
            return resp;
        }

        DiscussQuestion q = questionService.getDiscussQuestionById(questionId);
        if (q == null) {
            resp.setCode(Code.QUESTION_NOT_EXIST_CODE);
            resp.setMsg(Code.QUESTION_NOT_EXIST_MSG);
            return resp;
        }

        boolean ret = followService.unfollow(hostHolder.get().getId(), EntityType.ENTITY_QUESTION, questionId);

        eventProducer.fireEvent(new EventModel().setType(EventType.UNFOLLOW)
                .setActorId(hostHolder.get().getId()).setEntityId(questionId)
                .setEntityType(EntityType.ENTITY_QUESTION).setEntityOwnerId(q.getUser_id()));

        Map<String, Object> info = new HashMap<String, Object>();
        info.put("id", hostHolder.get().getId());
        info.put("count", followService.getFollowerCount(EntityType.ENTITY_QUESTION, questionId));

        JSONObject result = new JSONObject();
        result.put("result",ret ? 0 : 1);
        result.put("info",info);
        resp.setCode(Code.SUCCESS_CODE);
        resp.setMsg(Code.SUCCESS_MSG);
        resp.setResult(result);
        return resp;
    }

    @RequestMapping(path = {"/user/{uid}/followers"}, method = {RequestMethod.GET})
    public String followers(Model model, @PathVariable("uid") int userId) {
        List<Integer> followerIds = followService.getFollowers(EntityType.ENTITY_USER, userId, 0, 10);
        if (hostHolder.get() != null) {
            model.addAttribute("followers", getUsersInfo(hostHolder.get().getId(), followerIds));
        } else {
            model.addAttribute("followers", getUsersInfo(0, followerIds));
        }
        model.addAttribute("followerCount", followService.getFollowerCount(EntityType.ENTITY_USER, userId));
        model.addAttribute("curUser", userService.getUserById(userId));
        return "/follow/followers";
    }

    @RequestMapping(path = {"/user/{uid}/followees"}, method = {RequestMethod.GET})
    public String followees(Model model, @PathVariable("uid") int userId) {
        List<Integer> followeeIds = followService.getFollowees(userId, EntityType.ENTITY_USER, 0, 10);

        if (hostHolder.get() != null) {
            model.addAttribute("followees", getUsersInfo(hostHolder.get().getId(), followeeIds));
        } else {
            model.addAttribute("followees", getUsersInfo(0, followeeIds));
        }
        model.addAttribute("followeeCount", followService.getFolloweeCount(userId, EntityType.ENTITY_USER));
        model.addAttribute("curUser", userService.getUserById(userId));
        return "/follow/followees";
    }

    private List<ViewObject> getUsersInfo(int localUserId, List<Integer> userIds) {
        List<ViewObject> userInfos = new ArrayList<ViewObject>();
        for (Integer uid : userIds) {
            User user = userService.getUserById(uid);
            if (user == null) {
                continue;
            }
            ViewObject vo = new ViewObject();
            vo.set("user", user);
            vo.set("commentCount", discussCommentService.getUserCommentCount(uid));
            vo.set("followerCount", followService.getFollowerCount(EntityType.ENTITY_USER, uid));
            vo.set("followeeCount", followService.getFolloweeCount(uid, EntityType.ENTITY_USER));
            if (localUserId != 0) {
                vo.set("followed", followService.isFollower(localUserId, EntityType.ENTITY_USER, uid));
            } else {
                vo.set("followed", false);
            }
            userInfos.add(vo);
        }
        return userInfos;
    }


    @RequestMapping("/follow")
    public String toFOllow(){
        return "follow/followers";
    }
}
