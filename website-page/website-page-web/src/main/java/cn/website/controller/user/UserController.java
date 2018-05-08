package cn.website.controller.user;

import cn.website.common.pojo.Code;
import cn.website.common.pojo.Constants;
import cn.website.common.pojo.SResponse;
import cn.website.page.pojo.User;
import cn.website.service.user.UserService;
import com.alibaba.fastjson.JSONObject;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.InputStream;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/{userId}")
    @ResponseBody
    public SResponse getUserById(@PathVariable Integer userId){
        SResponse response = new SResponse();
        User user = userService.getUserById(userId);
        response.setResult(user);
        return response;
    }


}
