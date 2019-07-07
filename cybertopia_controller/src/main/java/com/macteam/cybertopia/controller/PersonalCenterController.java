package com.macteam.cybertopia.controller;

import com.alibaba.fastjson.JSON;
import com.macteam.cybertopia.dao.IUserDao;
import com.macteam.cybertopia.entity.Comment;
import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.entity.User;
import com.macteam.cybertopia.pojo.ArticleTitle;
import com.macteam.cybertopia.service.IPersonalCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("personalCenter")
public class PersonalCenterController {
    @Autowired
    IPersonalCenterService personalCenterService;
    @Autowired
    IUserDao userDao;

    @RequestMapping("/home.do")
    public String getPage(){
        return "personalCenter";
    }
    @RequestMapping("update.do")
    public String update(User user){

        return "null";
    }

    class TwoList{
        public int isArticlesEmpty;
        public int isCompetionEmpty;
        public List<ArticleTitle> articles;
        public List<Competition> competitions;
        TwoList(int articleStatus, int competionStatus, List<ArticleTitle> article, List<Competition> competition){
            isArticlesEmpty = articleStatus;
            isCompetionEmpty = competionStatus;
            articles = article;
            competitions = competition;
        }
    }

    public List<ArticleTitle> getAticleCollect(int id){
        List<ArticleTitle> articles = personalCenterService.getArticleCollectById(id);
        return articles;
    }

    public List<Competition> getCompetitionCollect(int id){
        List<Competition> competitions = personalCenterService.getCompetitionById(id);
        return competitions;
    }

    @RequestMapping(value ="/myLike")//获取收藏
    @ResponseBody
    public TwoList myLike(@RequestParam("id") int id){
        List<ArticleTitle> article_titles = getAticleCollect(id);
        List<Competition> competitions = getCompetitionCollect(id);
        int articleStatus = 1;
        int competitionStatus = 1;
        if(!article_titles.isEmpty()){
           articleStatus = 0;
        }
        if(!competitions.isEmpty()){
            competitionStatus = 0;
        }
        TwoList result = new TwoList(articleStatus,competitionStatus, article_titles, competitions);
        System.out.println(JSON.toJSONString(result));
        return result;
    }


    @RequestMapping(value ="/articleHistory")//获取发表的文章
    @ResponseBody
    public String getArticlePublish(@RequestParam("id") int id){
        List<ArticleTitle> articles = personalCenterService.getArticlePublishById(id);
        return JSON.toJSONString(articles);
    }


    @RequestMapping("/commentHistory")
    @ResponseBody
    public String getCommentHistory(@RequestParam("id") int id){
        List<Comment> comments = personalCenterService.getCommentHistoryById(id);
        return JSON.toJSONString(comments);
    }



    @RequestMapping(value ="/changePassword")
    @ResponseBody
    public String getPassMsg(HttpSession session,@RequestParam("old") String oldPass,@RequestParam("new") String newPass){
        String pass_mag="修改失败";
        User user= (User) session.getAttribute("user");
        System.out.println(user);
        //原密码错误
        if(!(userDao.getPasswordCode(oldPass)).equals(user.getPassword())){
            pass_mag="原密码输入错误";
        }
        //更新密码
        else {
            int result=personalCenterService.updateUserPassword(user.getId(),userDao.getPasswordCode(newPass));
            user.setPassword(userDao.getPasswordCode(newPass));
            if(result>0){
                pass_mag="修改成功";
            }
        }
        System.out.println(oldPass);
        System.out.println(newPass);
        return JSON.toJSONString(pass_mag);
    }

    @RequestMapping("/toArticleDetails.do")
    public String toArticleDetails(){
        return "redirect:/article/detail.do";

    }
}
