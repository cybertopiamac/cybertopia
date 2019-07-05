package com.macteam.cybertopia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("article")
public class ArticleController {

    @RequestMapping("/all.do")
    public String articleList(){
        return "articleList";
    }

    @RequestMapping("/list.do")
    public String articleListPage(Model model, int pageIndex){
        System.out.println("请求页面"+pageIndex);
        if (pageIndex < 30) {
            model.addAttribute("haveNext",true);
            model.addAttribute("pageIndex", pageIndex);
            model.addAttribute("nextIndex", pageIndex+1);
        } else{
            model.addAttribute("pageIndex", pageIndex);
            model.addAttribute("haveNext",false);
        }
        return "articleListItem";
    }
}
