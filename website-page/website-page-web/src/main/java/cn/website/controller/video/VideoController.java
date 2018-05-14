package cn.website.controller.video;

import cn.website.common.pojo.Code;
import cn.website.common.pojo.FileEntity;
import cn.website.common.pojo.SResponse;
import cn.website.common.utils.FileUploadTool;
import cn.website.page.pojo.HostHolder;
import cn.website.page.pojo.User;
import cn.website.service.file.FileService;
import cn.website.service.video.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/video")
public class VideoController {
    @Autowired
    private FileService fileService;
    @Autowired
    private VideoService videoService;
    @Autowired
    private HostHolder hostHolder;

    @RequestMapping("/")
    public String toVideoIndex(Model model) {
        List<FileEntity> videoList = videoService.getVideoList(".mp4");
        model.addAttribute("videoList",videoList);
        return "video";
    }
    @RequestMapping("/toAddVideo")
    public String toAddVideo() {
        return "/video/addVideo";
    }

    @RequestMapping("/detail/{id}")
    public String toVideoDetail(@PathVariable("id") Integer id,Model model) {
        List<FileEntity> video = videoService.getVideoById(id);
        if (video != null && video.size() > 0){
            model.addAttribute("video",video.get(0));
        }
        //获取最新的数据
        List<FileEntity> videoList = videoService.getVideoList(".mp4");
        model.addAttribute("videoList",videoList);
        return "videodetail";
    }

    @RequestMapping("/getVideoList")
    @ResponseBody
    public String getVideoList(Model model){
        List<FileEntity> videoList = videoService.getVideoList(".mp4");
        model.addAttribute("videoList",videoList);
        return "/";
    }

    @RequestMapping("/upload")
    @ResponseBody
    public SResponse upload(@RequestParam(value = "file", required = false) MultipartFile multipartFile,
                               HttpServletRequest request, ModelMap map) {
        SResponse resp = new SResponse();
        User user = hostHolder.get();
        if (user == null) {
            resp.setCode(Code.USER_UN_LOGIN_CODE);
            resp.setMsg(Code.USER_UN_LOGIN_MSG);
            resp.setResult(request.getRequestURI());
            return resp;
        }
        Integer userId = user.getId();

        FileEntity entity = new FileEntity();
        FileUploadTool fileUploadTool = new FileUploadTool();
        try {
            entity = fileUploadTool.createFile(multipartFile, request);
            if (entity != null) {
                entity.setUserId(userId);
                if (fileService.insertFile(entity)) {
                    resp.setCode(Code.SUCCESS_CODE);
                    resp.setMsg(Code.UPLOAD_SUCCESS_MSG);
                    return resp;
                }
            } else {
                resp.setCode(Code.UPLOAD_FAIL_CODE);
                resp.setMsg(Code.UPLOAD_FAIL_MSG);
                return resp;
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.setCode(Code.EXCEPTION_CODE);
            resp.setMsg(Code.EXCEPTION_MSG);
        }
        return resp;
    }

}
