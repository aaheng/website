package cn.website.controller.user;

import cn.website.common.plugins.PageData;
import cn.website.common.pojo.Code;
import cn.website.common.pojo.Constants;
import cn.website.common.pojo.SResponse;
import cn.website.controller.BaseController;
import cn.website.page.pojo.User;
import cn.website.service.user.UserService;
import com.alibaba.fastjson.JSONObject;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.InputStream;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController{
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

    //编辑用户信息
    @RequestMapping("/toEditUser/{id}")
    public String toEditUser(@PathVariable("id") Integer userId, Model model){
        User user = userService.getUserById(userId);
        model.addAttribute("user",user);
        return "user/editUser";
    }

    @RequestMapping("/editUser")
    @ResponseBody
    public SResponse editUser(User user){
        SResponse resp = new SResponse();
        boolean result = userService.editUser(user);
        if (result){
            resp.setCode(Code.SUCCESS_CODE);
            resp.setMsg(Code.SUCCESS_MSG);
        }else {
            resp.setMsg(Code.EXCEPTION_MSG);
            resp.setCode(Code.EXCEPTION_CODE);
        }
        return resp;
    }

}
