package cn.website.service.login;

import cn.website.common.pojo.Code;
import cn.website.common.pojo.SResponse;
import cn.website.mapper.login.LoginTokenMapper;
import cn.website.mapper.user.UserMapper;
import cn.website.page.pojo.LoginToken;
import cn.website.page.pojo.User;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.UUID;

@Service
public class LoginService{
    private final static Logger logger = LoggerFactory.getLogger(LoginService.class);

    @Autowired
    private UserMapper userMapper;
    @Resource(name = "loginTokenMapper")
    private LoginTokenMapper loginTokenMapper;

    public boolean register(User user) {
        //将用户信息添加进数据库
        user.setSalt(UUID.randomUUID().toString().substring(0, 5));
        user.setPassword(DigestUtils.md5DigestAsHex((user.getPassword() + user.getSalt()).getBytes()));
        Integer result = userMapper.insertUser(user);
        return result > 0 ? true : false;
    }

    public SResponse login(String username, String password) {
        SResponse resp = new SResponse();
        try {
            //非空判断
            if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
                resp.setCode(Code.PARAMS_ERROR_CODE);
                resp.setMsg(Code.PARAMS_ERROR_MSG);
                return resp;
            }
            //判断用户名是否存在
            User user = userMapper.getUserByUsername(username);
            if (user == null) {
                resp.setCode(Code.USER_NOEXIST_CODE);
                resp.setMsg(Code.USER_NOEXIST_MSG);
                return resp;
            }
            //用户名存在,判断密码是否正确
            if (!DigestUtils.md5DigestAsHex((password + user.getSalt()).getBytes()).equals(user.getPassword())) {
                resp.setCode(Code.PASSWORD_ERROR_CODE);
                resp.setMsg(Code.PASSWORD_ERROR_MSG);
                return resp;
            }
            resp.setCode(Code.SUCCESS_CODE);
            resp.setMsg(Code.SUCCESS_MSG);

            //密码正确,需要将用户的信息保存起来,
            LoginToken loginToken = new LoginToken();
            Date date = new Date();
            date.setTime(date.getTime() + 3600 * 24 * 2);
            loginToken.setExpired(date);
            loginToken.setStatus(0);// 0有效，1无效
            loginToken.setUser_id(user.getId());
            String token = UUID.randomUUID().toString().replaceAll("-", "");
            loginToken.setToken(token);
            loginTokenMapper.insertToken(loginToken);
            //将token返回
            resp.setResult(token);
            return resp;
        } catch (Exception e) {
            logger.error("用户登录失败" + e);
            resp.setCode(Code.EXCEPTION_CODE);
            resp.setMsg(Code.EXCEPTION_MSG);
            return resp;
        }
    }

    public boolean updateUserStatus(Integer userId) {
        Integer result = loginTokenMapper.updateLoginTokenStatus(userId);
        return result > 0 ? true : false;
    }

    public User getUserByUsername(String username) {
        return userMapper.getUserByUsername(username);
    }

    public User getUserByPhone(String phone) {
        return userMapper.getUserByPhone(phone);
    }
}
