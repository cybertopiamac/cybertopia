package com.macteam.cybertopia.controller;

import com.alibaba.fastjson.JSON;
import com.macteam.cybertopia.dao.IUserDao;
import com.macteam.cybertopia.entity.Article;
import com.macteam.cybertopia.entity.Comment;
import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.entity.User;
import com.macteam.cybertopia.pojo.ArticleTitle;
import com.macteam.cybertopia.service.IPersonalCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;
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
        public List<ArticleTitle> articles;
        public List<Competition> competitions;
        TwoList(List<ArticleTitle> article, List<Competition> competition){
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
    public String myLike(@RequestParam("id") int id){
        List<ArticleTitle> article_titles = getAticleCollect(id);
        List<Competition> competitions = getCompetitionCollect(id);
        TwoList result = new TwoList(article_titles, competitions);
        System.out.println(JSON.toJSONString(result));
        return JSON.toJSONString(result);
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

    @RequestMapping("/file.do")
    public String ini(){
        return "file";
    }
    @RequestMapping("/upLoad.do")
    public String upLoad(HttpServletRequest request,@RequestParam("file") MultipartFile dropzFile) {

        System.out.println("开始");

        //获取该文件的名字
        String fileName = dropzFile.getOriginalFilename();
        //获取服务器的绝对路径
        String filePath = request.getSession().getServletContext().getRealPath("/upload");
        //切割文件的后缀，获取文件的类型
        String fileSuffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
        System.out.println(filePath);
        //创建文件对象，把服务器的路径放进去
        File file = new File(filePath);
        //判断路径是否存在，不在创建
        if (!file.exists()) {
            file.mkdirs();
        }
        //拼接文件名  使用uuid防重名和文件的后缀，
        file = new File(filePath, UUID.randomUUID() + fileSuffix);
        if(!file.exists()){
            try {
                //创建文件
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            //开始搬运文件
            dropzFile.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "index";

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
