package cn.website.mapper.feed;

import cn.website.page.pojo.Feed;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FeedMapper {

    public Integer addFeed(Feed feed);

    Feed getFeedById(@Param("id") Integer id);

    List<Feed> selectUserFeeds(@Param("userIds") List<Integer> userIds,
                               @Param("count") int count);
}
