package com.macteam.cybertopia.dao;

import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.pojo.ArticleTitle;

import java.util.List;

public interface ICollectionDao {
    //    int insertUserArticleCollect(@Param("userId") int userId, @Param("articleId") int articleId)
    int insertArticleCollection(int userId, int articleId);
    int getArticleCollectStatus(int userId, int articleId);
    int deleteArticleCollection(int userId, int articleId);

    List<ArticleTitle> getArticleCollectionByUserId(int id);
    List<Competition> getCompetitionCollectionByUserId(int id);
}
