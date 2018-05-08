package cn.website.controller.discuss;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/discuss")
public class DiscussController {

    @RequestMapping("/index")
    public String toDiscuss(){
        return "redirect:/discuss/getQuestionList";
    }

}
