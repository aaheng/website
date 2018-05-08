package cn.website.service.login;

import cn.website.mapper.login.LoginTokenMapper;
import cn.website.page.pojo.LoginToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginTokenService {
    @Autowired
    private LoginTokenMapper loginTokenMapper;

    public boolean insertToken(LoginToken loginToken){
        Integer result = loginTokenMapper.insertToken(loginToken);
        return result > 0 ? true : false;
    }

}
