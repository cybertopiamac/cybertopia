package com.macteam.cybertopia.dao;

import com.macteam.cybertopia.entity.User;
import org.apache.ibatis.annotations.Param;

public interface IUserDao {
    User getUserById(int id);
    User getUserByUsername(String username);
    User deleteUserById(int id);
    User deleteUserByuserName(String userName);
    String getPasswordCode(@Param("input") String input);

    //注册用
    void addNewUser(User user);
}
