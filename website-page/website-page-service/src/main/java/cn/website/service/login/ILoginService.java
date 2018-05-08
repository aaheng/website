package cn.website.service.login;

import cn.website.common.pojo.SResponse;
import cn.website.page.pojo.User;

public interface ILoginService {

    SResponse register(User user);

    SResponse login(String username,String password);

    boolean updateUserStatus(Integer userId);

   /* User getUserByUsername(String username);
    User getUserByPhone(String phone);
*/
}
