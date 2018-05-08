package cn.website.common.async;

import cn.website.common.utils.JedisAdapter;
import cn.website.common.utils.JsonUtils;
import cn.website.common.utils.RedisKeyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/**
 * 这是所有事件的入口,由它来发这些事件
 */
@Service
public class EventProducer {
    //
    @Autowired
    private JedisAdapter jedisAdapter;

    public boolean fireEvent(EventModel model){
        //将event保存到队列中
        try {
            String json = JsonUtils.objectToJson(model);
            String key = RedisKeyUtils.getEventQueue();
            jedisAdapter.lpush(key,json);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
