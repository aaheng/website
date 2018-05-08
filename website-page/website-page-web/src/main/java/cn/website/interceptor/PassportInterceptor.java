package cn.website.interceptor;


import cn.website.mapper.login.LoginTokenMapper;
import cn.website.mapper.user.UserMapper;
import cn.website.page.pojo.HostHolder;
import cn.website.page.pojo.LoginToken;
import cn.website.page.pojo.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

public class PassportInterceptor implements HandlerInterceptor {
    @Autowired
    private LoginTokenMapper loginTokenMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private HostHolder hostHolder;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        //查看用户是否登录,首先要看Cookie中是否有token
        String token = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("token")) {
                    token = cookie.getValue();
                    break;
                }
            }
            //判断这个token是否可用
            if (StringUtils.isNotBlank(token)) {
                LoginToken loginToken = loginTokenMapper.getByToken(token);
                //查看是否过期,
                if (loginToken.getExpired().before(new Date()) || loginToken.getStatus() == 1) {
                    return true;
                }
                //没有过期,根据里面的userId查看相关用户
                User user = userMapper.getUserById(loginToken.getUser_id());
                //将这个用户和当前线程绑定
                hostHolder.set(user);
            }
        }
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        //在页面为渲染之前执行这段代码
        if (modelAndView != null) {
            modelAndView.addObject("user", hostHolder.get());
        }
    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
