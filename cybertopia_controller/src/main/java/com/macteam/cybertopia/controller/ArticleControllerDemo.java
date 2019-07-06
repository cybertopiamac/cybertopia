package com.macteam.cybertopia.controller;

import com.macteam.cybertopia.entity.Article;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

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

    //接受post
    @RequestMapping(value = "postDemo.do", method= RequestMethod.POST)
    @ResponseBody
    public String articlePost(HttpServletRequest request, @RequestBody Article article){
        System.out.println(article);
        return article.toString();
    }
}
