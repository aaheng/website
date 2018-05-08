package cn.website.service.user;

import cn.website.common.pojo.Code;
import cn.website.common.pojo.SResponse;
import cn.website.mapper.user.UserMapper;
import cn.website.page.pojo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.UUID;

@Service("userService")
public class UserService {
    private final static Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private UserMapper userMapper;

    public SResponse insertUser(User user) {
        SResponse response = new SResponse();
        //判断用户名是否已经存在
        try {
            User uExist = userMapper.getUserByUsername(user.getUsername());
            if (uExist != null) {
                response.setCode(Code.USER_EXIST_CODE);
                response.setMsg(Code.USER_EXIST_MSG);
                return response;
            }
            //查看手机号码是否已存在
            User pExist = userMapper.getUserByPhone(user.getPhone());
            if (pExist != null) {
                response.setCode(Code.PHONE_EXIST_CODE);
                response.setMsg(Code.PHONE_EXIST_MSG);
                return response;
            }
            //将用户信息添加进数据库
            user.setSalt(UUID.randomUUID().toString().substring(0, 5));
            user.setPassword(DigestUtils.md5DigestAsHex((user.getPassword() + user.getSalt()).getBytes()));
            user.setCreated(new Date().toString());
            Integer result = userMapper.insertUser(user);
            if (result > 0) {
                response.setMsg(Code.SUCCESS_MSG);
                response.setCode(Code.SUCCESS_CODE);
            } else {
                logger.error("用户注册失败");
                response.setCode(Code.EXCEPTION_CODE);
                response.setMsg(Code.EXCEPTION_MSG);
            }
            return response;
            //注册完成后会跳到首页,那么在这里要将用户信息保存起来
        } catch (Exception e) {
            logger.error("用户注册失败" + e);
            response.setCode(Code.EXCEPTION_CODE);
            response.setMsg(Code.EXCEPTION_MSG);
            return response;
        }
    }

    public User getUserById(Integer id) {
        return userMapper.getUserById(id);
    }

    //根据username获取用户
    public User getUserByUsername(String username){
        return userMapper.getUserByUsername(username);
    }

}
