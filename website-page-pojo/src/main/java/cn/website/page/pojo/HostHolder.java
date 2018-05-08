package cn.website.page.pojo;


import org.springframework.stereotype.Service;

@Service
public class HostHolder {
    private ThreadLocal<User> users = new ThreadLocal<User>();
    public void set(User user){
        users.set(user);
    }
    public User get(){
        return users.get();
    }
    public void clear(){
        users.remove();
    }
}
