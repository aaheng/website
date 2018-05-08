package cn.website.controller.video;

import cn.website.common.pojo.SResponse;
import cn.website.service.video.VideoCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/video")
public class VideoCommentController {
    @Autowired
    private VideoCommentService videoCommentService;

    @RequestMapping("/comment/add")
    @ResponseBody
    public SResponse addVideoComment(@RequestParam("content") String content, Integer videoId){
        SResponse sResponse = videoCommentService.addComment(content, videoId);
        return sResponse;
    }

}
