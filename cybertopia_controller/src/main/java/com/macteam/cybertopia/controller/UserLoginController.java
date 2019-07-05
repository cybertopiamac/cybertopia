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
        rightUser.setPassword("就不告诉你");
        session.setAttribute("recent_user", rightUser);
        return "redirect:/main/index.do";
    }


}
