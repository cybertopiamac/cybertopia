package com.macteam.cybertopia.service;

public interface ICollectionService {
    int insertArticleCollection(int userId, int articleId);
    int getArticleCollectStatus(int userId, int articleId);
    int deleteArticleCollection(int userId, int articleId);
}
