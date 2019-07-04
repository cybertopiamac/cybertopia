package com.macteam.cybertopia.controller;

import com.macteam.cybertopia.dao.IUserDao;
import com.macteam.cybertopia.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class UserLoginController {
    @Autowired
    IUserDao userDao;

    @RequestMapping("/main.do")
    public String main(){
        return "index";
    }

    @RequestMapping("/toLogin.do")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/login.do")
    public String login(Model model, HttpServletRequest request, User user){
        User rightUser = userDao.getUserByUsername(user.getUsername());
//        System.out.println(rightUser.getName());
//        System.out.println(rightUser.getMajor());
//        System.out.println(user.getPassword());
//        System.out.println(rightUser.getPassword());
        //判断是否存在用户
        if (rightUser == null) {
            model.addAttribute("msg", "不存在该用户");
            System.out.println("不存在该用户");
            return "login";
        }
        if (!rightUser.getPassword().equals(user.getPassword())) {
            model.addAttribute("msg", "账号或密码错误");
            System.out.println("账号或密码错误");
            return "login";
        }
        HttpSession session = request.getSession();
        session.setAttribute("user", rightUser);
        return "index";
    }



}
