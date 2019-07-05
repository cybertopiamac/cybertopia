package com.macteam.cybertopia.controller;

import com.macteam.cybertopia.entity.Article;
import com.macteam.cybertopia.pojo.ArticleTitle;
import com.macteam.cybertopia.service.IArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("article")
public class ArticleController {

    @Autowired
    private IArticleService articleService;

    @RequestMapping("/all.do")
    public String articleList(){
        return "articleList";
    }

    @RequestMapping("/list.do")
    public String articleListPage(Model model, int pageIndex){
        int default_pack_size = 10;
        List<ArticleTitle> article_titles = articleService.getArticleListByRange(
                pageIndex*default_pack_size, default_pack_size);
        model.addAttribute("article_titles",article_titles);
        boolean haveNext = article_titles.size() == default_pack_size;
        model.addAttribute("haveNext",haveNext);
        model.addAttribute("pageIndex", pageIndex);
        return "articleListItem";
    }

    @RequestMapping("/detail.do")
    public String articleDetail(Model model, int articleId){
        Article article = articleService.getArticleById(articleId);
        model.addAttribute("article",article);
        return "articleDetail";
    }

    @RequestMapping("/write.do")
    public String articleWrite(){
        return "articleWriet";
    }

    @RequestMapping("/post.do")
    public String articlePost(Article article){
        articleService.insertArticle(article);
        return "redirect:/article/all.do";
    }
}
