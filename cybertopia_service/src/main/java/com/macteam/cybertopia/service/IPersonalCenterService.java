package com.macteam.cybertopia.service;

import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.entity.User;
import com.macteam.cybertopia.pojo.ArticleTitle;
import com.macteam.cybertopia.pojo.CommentSimplify;

import java.util.List;

public interface IPersonalCenterService {
    User getUserById(int id);
    User getUserByName(String name);
    List<ArticleTitle> getArticleCollectById(int id);
    List<ArticleTitle> getArticleCollectByUser(User user);
    List<Competition> getCompetitionById(int id);
    List<Competition> getCompetitionByUser(User user);
    int updateUserInfo(User user);
    int updateUserPassword(int id,String password);

    List<ArticleTitle> getArticlePublishById(int id);

    List<CommentSimplify> getCommentHistoryById(int id);
}
