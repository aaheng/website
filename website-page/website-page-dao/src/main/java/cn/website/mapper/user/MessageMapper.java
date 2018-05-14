package cn.website.mapper.user;

import cn.website.page.pojo.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageMapper {

    public Integer insertMessage(Message message);

    public List<Message> getConversationList(@Param("userId") Integer userId);

    int getConversationUnreadCount(@Param("userId") int userId,
                                   @Param("conversationId") String conversationId);

    List<Message> getConversationDetail(@Param("conversationId") String conversationId,
                                        @Param("offset") int offset,
                                        @Param("limit") int limit);
}
