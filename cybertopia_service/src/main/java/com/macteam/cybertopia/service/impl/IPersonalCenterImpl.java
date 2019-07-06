package com.macteam.cybertopia.service.impl;


import com.macteam.cybertopia.dao.IPersonalCenterDao;
import com.macteam.cybertopia.dao.IUserDao;
import com.macteam.cybertopia.entity.Article;
import com.macteam.cybertopia.entity.Comment;
import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.entity.User;
import com.macteam.cybertopia.service.IPersonalCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class IPersonalCenterImpl implements IPersonalCenterService {
    @Autowired
    IPersonalCenterDao personalCenterDao;
    @Autowired
    IUserDao userDao;

    public User getUserById(int id) {
        User user = userDao.getUserById(id);
        return user;
    }

    public User getUserByName(String name) {
        User user = userDao.getUserByUsername(name);
        return user;
    }

    public List<Article> getArticleCollectById(int id) {
        List<Article> articles = personalCenterDao.getUserArticleCollectByUserId(id);
        return articles;
    }

    public List<Article> getArticleCollectByUser(User user) {
        List<Article> articles = personalCenterDao.getUserArticleCollectByUserId(user.getId());
        return articles;
    }

    public List<Competition> getCompetitionById(int id) {
        List<Competition> competitions = personalCenterDao.getUserCompetitionCollectByUserId(id);
        return competitions;
    }

    public List<Competition> getCompetitionByUser(User user) {
        List<Competition> competitions = personalCenterDao.getUserCompetitionCollectByUserId(user.getId());
        return competitions;
    }

    public int updateUserInfo(User user) {
        int iErrorCode = 0;
        iErrorCode = personalCenterDao.updateUserInfo(user);
        return iErrorCode;
    }

    public int updateUserPassword(int id,String password) {
        return personalCenterDao.updateUserPassword(id,password);
    }


    public List<Article> getArticlePublishById(int id) {
        List<Article> articles = personalCenterDao.getUserArticlePublishByUserId(id);
        return articles;
    }

    public List<Comment> getCommentHistoryById(int id) {
        List<Comment> comments = personalCenterDao.getUserCommentHistoryByUserId(id);
        return null;
    }
}
