package cn.website.mapper.user;

import cn.website.page.pojo.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageMapper {

    public Integer insertMessage(Message message);

    public List<Message> getConversationList(@Param("id") Integer userId);
}
