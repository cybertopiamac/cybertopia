package com.macteam.cybertopia.service.impl;


import com.macteam.cybertopia.dao.IArticleDao;
import com.macteam.cybertopia.dao.ICollectionDao;
import com.macteam.cybertopia.dao.ICommentDao;
import com.macteam.cybertopia.dao.IUserDao;
import com.macteam.cybertopia.entity.Comment;
import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.entity.User;
import com.macteam.cybertopia.pojo.ArticleTitle;
import com.macteam.cybertopia.service.IPersonalCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class IPersonalCenterImpl implements IPersonalCenterService {
    @Autowired
    private IUserDao userDao;

    @Autowired
    private ICommentDao commentDao;

    @Autowired
    private IArticleDao articleDao;

    @Autowired
    private ICollectionDao collectionDao;

    public User getUserById(int id) {
        User user = userDao.getUserById(id);
        return user;
    }

    public User getUserByName(String name) {
        User user = userDao.getUserByUsername(name);
        return user;
    }

    public List<ArticleTitle> getArticleCollectById(int id) {
        List<ArticleTitle> articles = collectionDao.getArticleCollectionByUserId(id);
        return articles;
    }

    public List<ArticleTitle> getArticleCollectByUser(User user) {
        List<ArticleTitle> articles = collectionDao.getArticleCollectionByUserId(user.getId());
        return articles;
    }

    public List<Competition> getCompetitionById(int id) {
        List<Competition> competitions = collectionDao.getCompetitionCollectionByUserId(id);
        return competitions;
    }

    public List<Competition> getCompetitionByUser(User user) {
        List<Competition> competitions = collectionDao.getCompetitionCollectionByUserId(user.getId());
        return competitions;
    }

    public int updateUserInfo(User user) {
        int iErrorCode = 0;
        iErrorCode = userDao.updateUserInfo(user);
        return iErrorCode;
    }

    public int updateUserPassword(int id,String password) {
        return userDao.updateUserPassword(id,password);
    }


    public List<ArticleTitle> getArticlePublishById(int id) {
        List<ArticleTitle> articles = articleDao.getArticleTitleByAuthorId(id);
        return articles;
    }

    public List<Comment> getCommentHistoryById(int id) {
        List<Comment> comments = commentDao.getCommentByUserId(id);
        return null;
    }
}
