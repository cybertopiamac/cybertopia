package com.macteam.cybertopia.controller;

import com.macteam.cybertopia.entity.User;
import com.macteam.cybertopia.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("newuser")
public class UserRegisterController {
    @Autowired
    private IUserService userService;

    @RequestMapping("toRegister.do")
    public String toRegister(Model model){
        return "register";
    }

    @RequestMapping("toNextRegister.do")
    public String toNextRegister(Model model, HttpServletRequest request, User user){
        System.out.println(user);
        boolean isRegistered=userService.isRegistered(user.getUsername());
        //判断
        if(isRegistered){
            model.addAttribute("msg","用户名已被注册，请更改用户名！");
            return "register";
        }
        else{
            HttpSession session = request.getSession();
            session.setAttribute("newuser", user);
            //System.out.println((User) request.getSession().getAttribute("newuser"));
            return "finalRegister";
        }
    }

    @RequestMapping("toFinalRegister.do")
    public String toFinalRegister(HttpServletRequest request){
        String nickname = request.getParameter("nickname");
        String school = request.getParameter("school");
        String email=request.getParameter("email");
        String sex=request.getParameter("sex");
        String grade=request.getParameter("grade");
        String major=request.getParameter("major");
        String description=request.getParameter("description");
        String phone=request.getParameter("phone");

        User newuser=(User) request.getSession().getAttribute("newuser");

        System.out.println(newuser);

        newuser.setNickname(nickname);
        newuser.setSchool(school);
        newuser.setEmail(email);
        newuser.setSex(Integer.parseInt(sex));
        newuser.setGrade(Integer.parseInt(grade));
        newuser.setMajor(major);
        newuser.setDescription(description);
        newuser.setPhone(phone);
        newuser.setRole(1);

        System.out.println(newuser);

        userService.insertUser(newuser);

        return "redirect:/user/toLogin.do";
    }

}
