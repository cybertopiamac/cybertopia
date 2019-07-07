package com.macteam.cybertopia.service;

import com.macteam.cybertopia.entity.Article;
import com.macteam.cybertopia.entity.Comment;
import com.macteam.cybertopia.pojo.ArticleTitle;
import com.macteam.cybertopia.pojo.CommentInfo;

import java.util.List;

public interface IArticleService {
    List<ArticleTitle> getArticleListByRange(int skip, int limit);
    //    List<Article> getArticleListByKeyword(String keyword);
    Article getArticleById(int id);
    int deleteArticleById(int id);
    int insertArticle(Article article);
    int increaseArticleBrowseNum(Article article, int delta);
    int insertComment(Comment comment);
    List<CommentInfo> getCommentByArticleId(int articleId);
    int insertArticleCollection(int userId, int articleId);
    int getArticleCollectStatus(int userId, int articleId);
    int deleteArticleCollection(int userId, int articleId);
}
