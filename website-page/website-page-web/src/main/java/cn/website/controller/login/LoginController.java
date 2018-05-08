package cn.website.controller.login;

import cn.website.common.pojo.Code;
import cn.website.common.pojo.SResponse;
import cn.website.page.pojo.LoginToken;
import cn.website.page.pojo.User;
import cn.website.service.login.ILoginService;
import cn.website.service.login.LoginService;
import cn.website.service.login.LoginTokenService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.UUID;

@Controller
public class LoginController {
    private final static Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private LoginService loginService;
    @Autowired
    private LoginTokenService loginTokenService;

    @RequestMapping("/register")
    @ResponseBody
    public SResponse register(User user, Model model, HttpServletResponse response) {
        //SResponse resp = loginService.register(user);
        SResponse resp = new SResponse();
        if (user == null) {
            resp.setCode(Code.PARAMS_ERROR_CODE);
            resp.setMsg(Code.PARAMS_ERROR_MSG);
            return resp;
        }
        //检查USER的参数是否为空
        if (StringUtils.isBlank(user.getEmail()) || StringUtils.isBlank(user.getUsername())
                || StringUtils.isBlank(user.getPassword()) || StringUtils.isBlank(user.getPhone())) {
            resp.setCode(Code.PARAMS_ERROR_CODE);
            resp.setMsg(Code.PARAMS_ERROR_MSG);
            return resp;
        }
        try {
            //判断用户名是否已经存在
            User uExist = loginService.getUserByUsername(user.getUsername());
            if (uExist != null) {
                resp.setCode(Code.USER_EXIST_CODE);
                resp.setMsg(Code.USER_EXIST_MSG);
                return resp;
            }
            //查看手机号码是否已存在
            User pExist = loginService.getUserByPhone(user.getPhone());
            if (pExist != null) {
                resp.setCode(Code.PHONE_EXIST_CODE);
                resp.setMsg(Code.PHONE_EXIST_MSG);
                return resp;
            }
            //将数据插入数据库
            boolean result = loginService.register(user);
            if (result) {
                //注册成功,将用户信息存储起来
                LoginToken loginToken = new LoginToken();
                Date date = new Date();
                date.setTime(date.getTime() + 3600 * 24 * 2);
                loginToken.setExpired(date);
                loginToken.setStatus(0);// 0有效，1无效
                loginToken.setUser_id(user.getId());
                String token = UUID.randomUUID().toString().replaceAll("-", "");
                loginToken.setToken(token);
                if (loginTokenService.insertToken(loginToken)) {
                    Cookie cookie = new Cookie("token", token);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                    resp.setCode(Code.SUCCESS_CODE);
                    return resp;
                } else {
                    resp.setCode(Code.EXCEPTION_CODE);
                    resp.setMsg(Code.EXCEPTION_MSG);
                }
            } else {
                resp.setCode(Code.EXCEPTION_CODE);
                resp.setMsg(Code.EXCEPTION_MSG);
            }
        } catch (Exception e) {
            resp.setCode(Code.EXCEPTION_CODE);
            resp.setMsg(Code.EXCEPTION_MSG);
            return  resp;
        }
        return resp;
    }


    @RequestMapping("/login")
    public String login(String username, String password, Model model, HttpServletResponse response, @RequestParam(name = "callback", defaultValue = "") String callback) {
        SResponse resp = loginService.login(username, password);
        //登录成功,需要将token信息存起来
        if (resp.getResult() != null) {
            String token = (String) resp.getResult();
            Cookie cookie = new Cookie("token", token);
            cookie.setPath("/");
            cookie.setMaxAge(3600 * 24);
            response.addCookie(cookie);
            if (StringUtils.isNotBlank(callback)) {
                return "redirect:" + callback;
            }
            return "redirect:/";
        }
        model.addAttribute("result", response);
        return "login";
    }

    @RequestMapping("/toLogin")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("/toRegister")
    public String toRegister() {
        return "register";
    }

    //退出登录
    @RequestMapping("/logout/{userId}")
    public String logout(@PathVariable("userId") Integer userId) {
        loginService.updateUserStatus(userId);
        return "redirect:/";
    }
}
