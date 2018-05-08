package cn.website.service.discuss;

import cn.website.common.utils.JedisAdapter;
import cn.website.common.utils.RedisKeyUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("likeService")
public class LikeService {
    @Resource(name = "jedisAdapter")
    private JedisAdapter jedisAdapter;

    //获取当前问题或评论的点赞数
    public long getLikeCount(Integer entityType, Integer entityId) {
        String likeKey = RedisKeyUtils.getLikeKey(entityType, entityId);
        return jedisAdapter.scard(likeKey);
    }

    public long like(Integer userId, Integer entityType, Integer entityId) {
        //将用户id存在redis中,
        String likeKey = RedisKeyUtils.getLikeKey(entityType, entityId);
        jedisAdapter.sadd(likeKey, String.valueOf(userId));
        //点赞添加的话,那如果之前这个用户是点踩的话,就要将踩删掉
        String disLikeKey = RedisKeyUtils.getDisLikeKey(entityType, entityId);
        jedisAdapter.srem(disLikeKey, String.valueOf(userId));
        return jedisAdapter.scard(likeKey);
    }

    public long disLike(Integer userId, Integer entityType, Integer entityId) {
        //将用户id存在redis中,
        String disLikeKey = RedisKeyUtils.getDisLikeKey(entityType, entityId);
        jedisAdapter.sadd(disLikeKey, String.valueOf(userId));
        //点赞添加的话,那如果之前这个用户是点踩的话,就要将踩删掉
        String likeKey = RedisKeyUtils.getLikeKey(entityType, entityId);
        jedisAdapter.srem(likeKey, String.valueOf(userId));
        return jedisAdapter.scard(likeKey);
    }

    //获取状态
     public int getLikeStatus(int userId, int entityType, int entityId) {
        String likeKey = RedisKeyUtils.getLikeKey(entityType, entityId);
        if (jedisAdapter.sismember(likeKey, String.valueOf(userId))) {
            return 1;
        }
        String disLikeKey = RedisKeyUtils.getDisLikeKey(entityType, entityId);
        return jedisAdapter.sismember(disLikeKey, String.valueOf(userId)) ? -1 : 0;
    }
}
