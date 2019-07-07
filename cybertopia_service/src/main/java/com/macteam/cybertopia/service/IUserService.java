package com.macteam.cybertopia.service;

import com.macteam.cybertopia.entity.User;

import javax.servlet.http.HttpServletRequest;

public interface IUserService {
    boolean isRegistered(String username);

    void insertUser(User user);

    int updateUserInfo(User user);
    User getCurrentUser(HttpServletRequest request);
}
