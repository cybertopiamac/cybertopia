package com.macteam.cybertopia.service.impl;

import com.macteam.cybertopia.dao.IUserDao;
import com.macteam.cybertopia.entity.User;
import com.macteam.cybertopia.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public void addNewUser(User user) {
        //userDao.addNewUser(user);
    }
}
