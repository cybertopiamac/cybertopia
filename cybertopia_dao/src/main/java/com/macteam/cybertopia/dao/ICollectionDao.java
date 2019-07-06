package com.macteam.cybertopia.dao;

public interface ICollectionDao {
    //    int insertUserArticleCollect(@Param("userId") int userId, @Param("articleId") int articleId)
    int insertArticleCollection(int userId, int articleId);
    int getArticleCollectStatus(int userId, int articleId);
    int deleteArticleCollection(int userId, int articleId);
}
