package cn.website.controller.common;

import cn.website.common.pojo.Code;
import cn.website.common.pojo.SResponse;
import cn.website.page.pojo.HostHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/common")
public class CommonController {
    @Autowired
    private HostHolder hostHolder;

    @RequestMapping("/checkLogin")
    @ResponseBody
    public SResponse checkLogin(){
        SResponse resp = new SResponse();
        if (hostHolder.get() == null){
            resp.setCode(Code.USER_UN_LOGIN_CODE);
            resp.setMsg(Code.USER_UN_LOGIN_MSG);
            return resp;
        }else {
            resp.setCode(Code.USER_LOGIN_CODE);
            resp.setMsg(Code.USER_LOGIN_MSG);
            return resp;
        }
    }

}
