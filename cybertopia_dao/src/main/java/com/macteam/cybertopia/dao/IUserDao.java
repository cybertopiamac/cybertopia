package com.macteam.cybertopia.dao;

import com.macteam.cybertopia.entity.User;

public interface IUserDao {
    User getUserById(int id);
    User getUserByUsername(String username);
    User updateUser(User user);
    User deleteUserById(int id);
    User deleteUserByuserName(String userName);
}
