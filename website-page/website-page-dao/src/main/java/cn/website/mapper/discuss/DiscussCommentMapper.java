package cn.website.mapper.discuss;

import cn.website.page.pojo.DiscussComment;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface DiscussCommentMapper {

    //获取一个问题或评论的评论
    public List<DiscussComment> getCommentByEntity(@Param("entityId") Integer entityId, @Param("entityType") Integer entityType);

    //增加评论
    public Integer insertDiscussComment(DiscussComment discussComment);

    public Integer getCommentCountByEntity(@Param("entity_id") Integer entityId, @Param("entity_type") Integer entityType);

    public DiscussComment getDiscussCommentById(@Param("id") Integer id);

    public Integer getDiscussCommentCountByUserId(@Param("userId") Integer userId);
}
