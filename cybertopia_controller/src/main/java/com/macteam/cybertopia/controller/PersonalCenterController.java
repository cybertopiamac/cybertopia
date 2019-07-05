package com.macteam.cybertopia.controller;

import com.macteam.cybertopia.dao.IUserDao;
import com.macteam.cybertopia.service.IPersonalCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("personalCenter")
public class PersonalCenterController {
    @Autowired
    IPersonalCenterService personalCenterService;
    @Autowired
    IUserDao userDao;

    @RequestMapping("home.do")
    public String getPage(){

        return "personalCenter";
    }

    @RequestMapping("file")
    public String ini(){
        return "file";
    }
    @RequestMapping("/upLoad")
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



//        //创建一个多分解的容器
//        CommonsMultipartResolver cmr = new CommonsMultipartResolver(request.getSession().getServletContext());
//        //设置编码
//        cmr.setDefaultEncoding("utf-8");
//        //判断是否有文件上传
//        if(cmr.isMultipart(request)){
//            //将request转换成多分解请求
//            MultipartHttpServletRequest mhs = cmr.resolveMultipart(request);
//            //根据input中存在的name来获取是否存在上传文件
//            MultipartFile mf = mhs.getFile("file");//这里可以用getFiles("file")的方式来处理多个文件。返回的是一个list.然后一个一个处理就可以了
//
//            String path = "/用户/liuyucheng/";
//            //创建文件保存名
//            File file = new File(path+mf.getOriginalFilename());
//            //上传文件
//            mf.transferTo(file);
//            System.out.println("成功");
//          }
    }
}
