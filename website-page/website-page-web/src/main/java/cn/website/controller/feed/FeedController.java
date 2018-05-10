package cn.website.controller.feed;

import cn.website.common.utils.JedisAdapter;
import cn.website.common.utils.RedisKeyUtils;
import cn.website.page.pojo.EntityType;
import cn.website.page.pojo.Feed;
import cn.website.page.pojo.HostHolder;
import cn.website.service.feed.FeedService;
import cn.website.service.follow.FollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/feed")
public class FeedController {

    @Autowired
    FeedService feedService;

    @Autowired
    FollowService followService;

    @Autowired
    HostHolder hostHolder;

    @Autowired
    JedisAdapter jedisAdapter;

    @RequestMapping(path = {"/pushfeeds"}, method = {RequestMethod.GET, RequestMethod.POST})
    private String getPushFeeds(Model model) {
        int localUserId = hostHolder.get() != null ? hostHolder.get().getId() : 0;
        List<String> feedIds = jedisAdapter.lrange(RedisKeyUtils.getTimelineKey(localUserId), 0, 10);
        List<Feed> feeds = new ArrayList<Feed>();
        for (String feedId : feedIds) {
            Feed feed = feedService.getById(Integer.parseInt(feedId));
            if (feed != null) {
                feeds.add(feed);
            }
        }
        model.addAttribute("feeds", feeds);
        return "feeds";
    }

    @RequestMapping(path = {"/pullfeeds"}, method = {RequestMethod.GET, RequestMethod.POST})
    private String getPullFeeds(Model model) {
        int localUserId = hostHolder.get() != null ? hostHolder.get().getId() : 0;
        List<Integer> followees = new ArrayList<Integer>();
        if (localUserId != 0) {
            // 关注的人
            followees = followService.getFollowees(localUserId, EntityType.ENTITY_USER, Integer.MAX_VALUE);
        }
        List<Feed> feeds = feedService.getUserFeeds(followees, 10);
        model.addAttribute("feeds", feeds);
        return "feeds";
    }

}
