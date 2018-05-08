package cn.website.controller.video;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import cn.website.common.pojo.FileEntity;
import cn.website.common.utils.FileUploadTool;
import cn.website.service.file.FileService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@RequestMapping("/uploadflv")
public class UploadController {

    @Resource(name = "fileService")
    private FileService fileService;

    @RequestMapping(value = "/upload", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public ModelAndView upload(@RequestParam(value = "file", required = false) MultipartFile multipartFile,
                               HttpServletRequest request, ModelMap map) {
        String message = "";
        FileEntity entity = new FileEntity();
        FileUploadTool fileUploadTool = new FileUploadTool();
        try {
            entity = fileUploadTool.createFile(multipartFile, request);
            if (entity != null) {
                if (fileService.insertFile(entity)){
                    message = "上传成功";
                    map.put("entity", entity);
                    map.put("result", message);
                };
            } else {
                message = "上传失败";
                map.put("result", message);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView("result", map);
    }

    @RequestMapping("/file")
    public String file(){
        return "discuss1";
    }
}