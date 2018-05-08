package cn.website.service.discuss;

import cn.website.common.pojo.Code;
import cn.website.common.pojo.SResponse;
import cn.website.common.utils.WebSiteUtils;
import cn.website.mapper.discuss.DiscussQuestionMapper;
import cn.website.page.pojo.DiscussQuestion;
import cn.website.page.pojo.HostHolder;
import cn.website.page.pojo.User;
import cn.website.service.SensitiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

import javax.annotation.Resource;
import java.util.List;

@Service("discussQuestionService")
public class DiscussQuestionService {
    @Resource(name = "discussQuestionMapper")
    private DiscussQuestionMapper discussQuestionMapper;

    @Autowired
    private HostHolder hostHolder;
    @Autowired
    private SensitiveService sensitiveService;

    public List<DiscussQuestion> getQuestionList() {
        return discussQuestionMapper.getDiscussQuestionList();
    }

    //根据id查找问题
    public DiscussQuestion getDiscussQuestionById(Integer id) {
        return discussQuestionMapper.getDiscussQuestionById(id);
    }

    //获取分页的问题列表
    public List<DiscussQuestion> getLatestQuestions(Integer userId, Integer index, Integer limit) {
        if (userId == 0) {
            return getQuestionList();
        }
        return discussQuestionMapper.getLatestQuestions(userId, index, limit);
    }

    //更新评论数
    public Integer updateCommentCount(Integer commentCount, Integer questionId) {
        return discussQuestionMapper.updateQuestionCommentCount(commentCount, questionId);
    }

    public SResponse insertDiscussQuestion(String title, String content) {
        SResponse resp = new SResponse();
        DiscussQuestion question = new DiscussQuestion();
        try {
            User user = hostHolder.get();
            if (user == null) {
                question.setUser_id(WebSiteUtils.anonymousId);
            } else {
                question.setUser_id(user.getId());
            }
            question.setComment_count("0");
            //进行HTML敏感词的解析
            title = HtmlUtils.htmlEscape(title);
            content = HtmlUtils.htmlEscape(content);
            //在这里进行敏感词的判断
            title = sensitiveService.filterWords(title);
            content = sensitiveService.filterWords(content);
            question.setTitle(title);
            question.setContent(content);

            int result = discussQuestionMapper.insertDiscussQuestion(question);
            if (result > 0) {
                resp.setCode(Code.SUCCESS_CODE);
                resp.setMsg(Code.SUCCESS_MSG);
            } else {
                resp.setCode(Code.EXCEPTION_CODE);
                resp.setMsg(Code.EXCEPTION_MSG);
            }
            return resp;
        } catch (Exception e) {
            resp.setCode(Code.EXCEPTION_CODE);
            resp.setMsg(Code.EXCEPTION_MSG);
            return resp;
        }

    }
}
