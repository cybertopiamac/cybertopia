package com.macteam.cybertopia.service.impl;

import com.macteam.cybertopia.dao.IUserDao;
import com.macteam.cybertopia.entity.User;
import com.macteam.cybertopia.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    IUserDao userDao;


    public boolean isRegistered(String username) {
        if(userDao.getUserByUsername(username)==null){
            //未注册过
            return false;
        }
        else{
            //改用户名已被使用
            return true;
        }
    }

    public void insertUser(User user) {
        userDao.insertUser(user);
    }

    public int updateUserInfo(User user) {
        return userDao.updateUserInfo(user);

    public User getCurrentUser(HttpServletRequest request){
        HttpSession session = request.getSession();
        Object userId = session.getAttribute("user");
        if(userId != null){

            //应对直接放user的“设计”
            if(userId instanceof User)
                return (User)userId;

            User user = userDao.getUserById((Integer)userId);
            return user;
        }
        else
            return null;
    }
}
