package cn.website.service.feed;

import cn.website.mapper.feed.FeedMapper;
import cn.website.page.pojo.Feed;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeedService {
    @Autowired
    private FeedMapper feedMapper;

    public List<Feed> getUserFeeds(List<Integer> userIds, int count) {
        return feedMapper.selectUserFeeds(userIds, count);
    }

    public boolean addFeed(Feed feed) {
        feedMapper.addFeed(feed);
        return feed.getId() > 0;
    }

    public Feed getById(int id) {
        return feedMapper.getFeedById(id);
    }

}
