package com.macteam.cybertopia.controller;

import com.macteam.cybertopia.dao.IUserDao;
import com.macteam.cybertopia.entity.Article;
import com.macteam.cybertopia.entity.Comment;
import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.entity.User;
import com.macteam.cybertopia.service.IPersonalCenterService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @RequestMapping("/articleLike")//获取收藏的文章
    public void getAticleCollect(int id, Model model){
        List<Article> articles = personalCenterService.getArticleCollectById(id);
        model.addAttribute("articles",articles);
    }

    @RequestMapping("/competitionLike")//获取收藏的文章
    public void getCompetitionCollect(int id, Model model){
        List<Competition> competitions = personalCenterService.getCompetitionById(id);
        model.addAttribute("competitions", competitions);
    }

    @RequestMapping("/articleHistory")//获取收藏的文章
    public void getAticlePublish(int id, Model model){
        List<Article> articles = personalCenterService.getArticlePublishById(id);
        model.addAttribute("articles", articles);
    }

    @RequestMapping("/commentHistory")
    public void getCommentHistory(int id, Model model){
        List<Comment> comments = personalCenterService.getCommentHistoryById(id);
        model.addAttribute("comments", comments);
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
    @RequestMapping("/changePassword.do")
    public String changePassword(HttpSession session, @RequestParam("oldPass") String oldPass, @RequestParam("newPass") String newPass, @RequestParam("againPass") String againPass){
        User user= (User) session.getAttribute("user");
        //原密码错误
        if(!oldPass.equals(user.getPassword())){
        }
        //更新密码
        else {
        }
        System.out.println(oldPass);
        return "personalCenter";
    }

    @RequestMapping("/toArticleDetails.do")
    public String toArticleDetails(){
        return "redirect:/article/detail.do";
    }
}
