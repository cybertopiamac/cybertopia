package com.macteam.cybertopia.controller;

import com.alibaba.fastjson.JSON;
import com.macteam.cybertopia.dao.IUserDao;
import com.macteam.cybertopia.entity.Comment;
import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.entity.User;
import com.macteam.cybertopia.pojo.ArticleTitle;
import com.macteam.cybertopia.pojo.CommentSimplify;
import com.macteam.cybertopia.service.IPersonalCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
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
    //整合文章和竞赛收藏的类
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
    //收藏的文章
    public List<ArticleTitle> getAticleCollect(int id){
        List<ArticleTitle> articles = personalCenterService.getArticleCollectById(id);
        return articles;
    }
    //收藏的竞赛
    public List<Competition> getCompetitionCollect(int id){
        List<Competition> competitions = personalCenterService.getCompetitionById(id);
        return competitions;
    }
    //得到文章和竞赛收藏
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


    @RequestMapping("/articleHistory")//获取发表的文章
    @ResponseBody
    public String getArticlePublish(@RequestParam("id") int id){
        List<ArticleTitle> articles = personalCenterService.getArticlePublishById(id);
        return JSON.toJSONString(articles);
    }

    //历史评论
    @RequestMapping("/commentHistory")
    @ResponseBody
    public String getCommentHistory(@RequestParam("id") int id){
        List<CommentSimplify> comments = personalCenterService.getCommentHistoryById(id);
//        System.out.println(JSON.toJSONString(comments));
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

    @RequestMapping(value = "/changeUserInfo")
    @ResponseBody
    public String getUserMsg(HttpSession session, @RequestParam(value="picture",required = false) MultipartFile picture, @RequestParam("sex") int sex,
                             @RequestParam("school")String school, @RequestParam("major")String major,
                             @RequestParam("grade")int grade, @RequestParam("description")String description,
                             @RequestParam("phone")String phone, @RequestParam("email")String email){
        User currentUser= (User) session.getAttribute("user");
        String pic="";
        if(picture==null){
            pic=currentUser.getPicture();
        }
        else{
            pic=picture.getOriginalFilename();
        }
        User user=new User(currentUser.getId(),currentUser.getUsername(),currentUser.getPassword(),
                currentUser.getRole(),currentUser.getNickname(),sex,school,major,grade,email,description,
                pic,phone);

        String info_msg="";
        if(personalCenterService.updateUserInfo(user)>0){
            info_msg="修改成功";
            if(!pic.equals(currentUser.getPicture())){
                try {
                    String sourcePath=session.getServletContext().getRealPath("/");
                    File file=new File(sourcePath).getParentFile();
                    String path=file.getParent()+"/src/main/webapp/images/head_icon/"+picture.getOriginalFilename();
                    System.out.println(path);
                    System.out.println(sourcePath+"images/head_icon/"+picture.getOriginalFilename());
                    //picture.transferTo(new File(path));
                    picture.transferTo(new File(sourcePath+"images/head_icon/"+picture.getOriginalFilename()));
                    copyFile(sourcePath+"images/head_icon/"+picture.getOriginalFilename(),path);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            session.setAttribute("user",user);
        }
        else{
            info_msg="修改失败";
        }
        System.out.println(pic);
        return JSON.toJSONString(info_msg);
    }

    //图片放到head_icon
    public void copyFile(String srcPathStr, String desPathStr) {
        //1.获取源文件的名称
        String newFileName = srcPathStr.substring(srcPathStr.lastIndexOf("\\")+1); //目标文件地址

        try{
            //2.创建输入输出流对象
            FileInputStream fis = new FileInputStream(srcPathStr);
            FileOutputStream fos = new FileOutputStream(desPathStr);

            //创建搬运工具
            byte datas[] = new byte[1024*8];
            //创建长度
            int len = 0;
            //循环读取数据
            while((len = fis.read(datas))!=-1){
                fos.write(datas,0,len);
            }
            //3.释放资源
            fis.close();
            fis.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
