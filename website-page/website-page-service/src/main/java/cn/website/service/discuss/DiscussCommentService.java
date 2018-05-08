package cn.website.service.discuss;

import cn.website.common.pojo.Code;
import cn.website.common.pojo.SResponse;
import cn.website.common.utils.WebSiteUtils;
import cn.website.mapper.discuss.DiscussCommentMapper;
import cn.website.page.pojo.DiscussComment;
import cn.website.page.pojo.EntityType;
import cn.website.page.pojo.HostHolder;
import cn.website.page.pojo.User;
import cn.website.service.SensitiveService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

import javax.annotation.Resource;
import java.util.List;

@Service("discussCommentService")
public class DiscussCommentService {

    @Resource(name = "discussCommentMapper")
    private DiscussCommentMapper discussCommentMapper;
    @Resource(name = "discussQuestionService")
    private DiscussQuestionService discussQuestionService;

    @Autowired
    private HostHolder hostHolder;
    @Autowired
    private SensitiveService sensitiveService;

    public List<DiscussComment> getCommentByEntity(Integer entityId, Integer entityType) {
        return discussCommentMapper.getCommentByEntity(entityId, entityType);
    }

    //新增评论
    public SResponse addComment(String content, Integer questionId) {
        SResponse resp = new SResponse();
        //非空判断
        if (StringUtils.isBlank(content)) {
            resp.setCode(Code.PARAMS_ERROR_CODE);
            resp.setMsg(Code.PARAMS_ERROR_MSG);
            return resp;
        }
        try {
            DiscussComment comment = new DiscussComment();
            comment.setContent(content);
            comment.setEntity_id(questionId);
            comment.setEntity_type(EntityType.ENTITY_QUESTION);
            User user = hostHolder.get();
            if (user == null) {
                //那就匿名评论
                comment.setUser_id(WebSiteUtils.anonymousId);
            } else {
                comment.setUser_id(user.getId());
            }
            //进行敏感词的过滤
            comment.setContent(HtmlUtils.htmlEscape(comment.getContent()));
            comment.setContent(sensitiveService.filterWords(comment.getContent()));
            Integer result = discussCommentMapper.insertDiscussComment(comment);
            if (result > 0) {
                //添加评论后,对应的问题的评论要增加
                Integer update = discussQuestionService.updateCommentCount(discussCommentMapper.getCommentCountByEntity(questionId, EntityType.ENTITY_QUESTION), questionId);
                if (update > 0) {
                    resp.setMsg(Code.SUCCESS_MSG);
                    resp.setCode(Code.SUCCESS_CODE);
                } else {
                    resp.setCode(Code.EXCEPTION_CODE);
                    resp.setMsg(Code.EXCEPTION_MSG);
                }
            } else {
                resp.setCode(Code.EXCEPTION_CODE);
                resp.setMsg(Code.EXCEPTION_MSG);
            }
            return resp;
        } catch (Exception e) {
            resp.setCode(Code.EXCEPTION_CODE);
            resp.setMsg(Code.EXCEPTION_MSG);
            e.printStackTrace();
            return resp;
        }


    }

    //通过id获取评论
    public DiscussComment getDiscussCommentById(Integer id){
        return discussCommentMapper.getDiscussCommentById(id);
    }

    //获取用户的评论数
    public int getUserCommentCount(int userId) {
        return discussCommentMapper.getUserCommentCount(userId);
    }
}
