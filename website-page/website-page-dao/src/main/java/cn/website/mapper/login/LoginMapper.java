package cn.website.mapper.login;

import cn.website.page.pojo.User;

public interface LoginMapper {

    //注册
    public Integer register(User user);
    //检查用户名是否可用
    public User getUserByUsername(String username);
    //检查手机号是否可用
    public User getUserByPhone(String phone);

}
