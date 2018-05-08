package cn.website.controller.discuss;

import cn.website.common.async.EventModel;
import cn.website.common.async.EventProducer;
import cn.website.common.async.EventType;
import cn.website.common.pojo.Code;
import cn.website.common.pojo.SResponse;
import cn.website.page.pojo.DiscussComment;
import cn.website.page.pojo.EntityType;
import cn.website.page.pojo.HostHolder;
import cn.website.page.pojo.User;
import cn.website.service.discuss.DiscussCommentService;
import cn.website.service.discuss.LikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/discuss")
public class LikeController {

    @Resource(name = "likeService")
    private LikeService likeService;
    @Autowired
    private HostHolder hostHolder;
    @Resource(name = "discussCommentService")
    private DiscussCommentService discussCommentService;
    @Autowired
    private EventProducer eventProducer;

    //对评论进行点赞
    @RequestMapping("/likeComment")
    @ResponseBody
    public SResponse likeComment(Integer commentId, HttpServletRequest request) {
        SResponse resp = new SResponse();
        User user = hostHolder.get();
        if (user == null) {
            resp.setCode(Code.USER_UN_LOGIN_CODE);
            resp.setMsg(Code.USER_UN_LOGIN_MSG);
            resp.setResult(request.getRequestURI());
            return resp;
        }

        Integer userId = user.getId();
        long like = likeService.like(userId, EntityType.ENTITY_COMMENT, commentId);

        //点赞之后,要给相关用户发送站内信通知
        DiscussComment comment = discussCommentService.getDiscussCommentById(commentId);
        eventProducer.fireEvent(new EventModel().setType(EventType.LIKE).setActorId(userId).
                setEntityType(EntityType.ENTITY_COMMENT).setEntityId(commentId).
                setEntityOwnerId(comment.getUser_id()).setExt("questionId", String.valueOf(comment.getEntity_id())));

        resp.setCode(Code.SUCCESS_CODE);
        resp.setMsg(Code.SUCCESS_MSG);
        resp.setResult(like);
        return resp;
    }

    @RequestMapping("/dislikeComment")
    @ResponseBody
    public SResponse DislikeComment(Integer commentId) {
        SResponse resp = new SResponse();
        User user = hostHolder.get();
        if (user == null) {
            resp.setCode(Code.USER_UN_LOGIN_CODE);
            resp.setMsg(Code.USER_UN_LOGIN_MSG);
            return resp;
        }
        Integer userId = user.getId();
        long like = likeService.disLike(userId, EntityType.ENTITY_COMMENT, commentId);

        resp.setCode(Code.SUCCESS_CODE);
        resp.setMsg(Code.SUCCESS_MSG);
        resp.setResult(like);
        return resp;
    }
}
