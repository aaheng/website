package cn.website.mapper.user;

import cn.website.page.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;


public interface UserMapper {

    User getUserById(@Param("id") Integer id);

    User getUserByUsername(@Param("username") String username);

    User getUserByPhone(@Param("phone") String phone);

    Integer insertUser(User user);

    //获取刚插入用户的id
    Integer getInsertId();


    Integer updateUserStatus(Integer userId);
}
