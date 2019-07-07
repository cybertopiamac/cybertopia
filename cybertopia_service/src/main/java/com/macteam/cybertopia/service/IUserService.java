package com.macteam.cybertopia.service;

import com.macteam.cybertopia.entity.User;

public interface IUserService {
    boolean isRegistered(String username);

    void insertUser(User user);

    int updateUserInfo(User user);
}
