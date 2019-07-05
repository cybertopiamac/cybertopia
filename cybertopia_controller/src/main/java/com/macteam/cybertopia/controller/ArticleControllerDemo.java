package com.macteam.cybertopia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("article")
public class ArticleControllerDemo {

    //全部文章列表
    @RequestMapping("/allDemo.do")
    public String articleLists(){
        return "articleList";
    }

   //文章详情
   @RequestMapping("/detailDemo.do")
   public String articleDetails(/*int article_id*/) {
        //传入文章id
       return "articleDetail";
   }

   //发表文章
    @RequestMapping("/publishDemo.do")
    public String articleWrite(){
        return "articleWriteDemo";
    }
}
