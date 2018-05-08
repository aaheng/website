package cn.website.mapper.discuss;

import cn.website.page.pojo.DiscussQuestion;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DiscussQuestionMapper {

    public List<DiscussQuestion> getDiscussQuestionList();

    public DiscussQuestion getDiscussQuestionById(@Param("id") Integer id);

    public List<DiscussQuestion> getLatestQuestions(@Param("userId") Integer userId,@Param("index") Integer index, @Param("limit") Integer limit);

    public Integer updateQuestionCommentCount(@Param("comment_count") Integer comment_count,@Param("question_id") Integer question_id);

    public Integer insertDiscussQuestion(DiscussQuestion question);
}
