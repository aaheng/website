package cn.website.controller;

import cn.website.page.pojo.DiscussComment;
import cn.website.page.pojo.DiscussQuestion;
import cn.website.page.pojo.User;
import cn.website.page.pojo.ViewObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class TestController {

    @RequestMapping("/test")
    public String toTest(Model model) {


        List<ViewObject> vos = new ArrayList<ViewObject>();
        for (int i = 0; i < 2; i++) {
            ViewObject vo = new ViewObject();
            User user1 = new User();
            user1.setUsername("xiaoing" + i);
            user1.setId(i);
            vo.set("group",user1);

            List<DiscussComment> comment = new ArrayList<DiscussComment>();
            DiscussComment comment1 = new DiscussComment();
            comment1.setId(i);
            comment1.setContent("hello" + i);
            DiscussComment comment2 = new DiscussComment();
            comment2.setId(i + 1);
            comment2.setContent("world" + i);
            comment.add(comment1);
            comment.add(comment2);
            vo.set("comment", comment);

            List<DiscussQuestion> questions = new ArrayList<DiscussQuestion>();
            DiscussQuestion question1 = new DiscussQuestion();
            question1.setId(i);
            question1.setTitle("question" + i);
            questions.add(question1);

            DiscussQuestion question2 = new DiscussQuestion();
            question2.setId(i + 1);
            question2.setTitle("question" + i + 1);
            questions.add(question2);
            vo.set("question", questions);
            vos.add(vo);
        }

        model.addAttribute("vos",vos);

        return "discuss1";
    }

}
