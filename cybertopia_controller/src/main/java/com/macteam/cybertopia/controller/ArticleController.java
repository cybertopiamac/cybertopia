package com.macteam.cybertopia.controller;

import com.macteam.cybertopia.dao.IUserDao;
import com.macteam.cybertopia.entity.Article;
import com.macteam.cybertopia.entity.User;
import com.macteam.cybertopia.pojo.ArticleTitle;
import com.macteam.cybertopia.service.IArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("article")
public class ArticleController {

    @Autowired
    private IArticleService articleService;

    @Autowired
    private UserLoginController userLoginController;

    @Autowired
    private IUserDao userDao;

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
        articleService.increaseArticleBrowseNum(article,1);
        if(article != null){
            User author = userDao.getUserById(article.getAuthorId());
            model.addAttribute("article",article);
            model.addAttribute("author_name",author.getNickname());
        }
        return "articleDetail";
    }

    @RequestMapping("/write.do")
    public String articleWrite(HttpServletRequest request){
//        User user = userLoginController.getCurrentUser(request);
//        if(user != null)
//            return "articleWrite";
//        else
//            return "login";

        // 测试用代码
        return "articleWrite";
    }

    @RequestMapping(value = "/post.do", method= RequestMethod.POST)
    @ResponseBody
    public int articlePost(HttpServletRequest request, @RequestBody Article article){
//        User user = userLoginController.getCurrentUser(request);
//        if(user != null) {
//            article.setAuthorId(user.getId());
//            article.setAuthorId(1);
//            article.setDate(Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant()));
//            articleService.insertArticle(article);
//            return "redirect:/article/all.do";
//        }
//        else
//        return "login";

        // 测试用代码
        article.setAuthorId(1);
        article.setDate(new Date(System.currentTimeMillis()));
        int result = articleService.insertArticle(article);
        System.out.println(article.toString());
        return result;
    }
}
