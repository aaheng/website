package cn.website.mapper.login;

import cn.website.page.pojo.LoginToken;
import org.apache.ibatis.annotations.Param;

public interface LoginTokenMapper {

    public Integer insertToken(LoginToken loginToken);

    public LoginToken getByToken(@Param("token") String token);

    //用户退出
    public Integer updateLoginTokenStatus(@Param("user_id") Integer user_id);

}
