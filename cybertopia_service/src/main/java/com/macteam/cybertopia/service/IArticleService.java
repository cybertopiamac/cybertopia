package com.macteam.cybertopia.service;

import com.macteam.cybertopia.entity.Article;
import com.macteam.cybertopia.pojo.ArticleTitle;

import java.util.List;

public interface IArticleService {
    List<ArticleTitle> getArticleListByRange(int skip, int limit);
    //    List<Article> getArticleListByKeyword(String keyword);
    Article getArticleById(int id);
    int deleteArticleById(int id);
    int insertArticle(Article article);
    int increaseArticleBrowseNum(Article article, int delta);
}
