package com.macteam.cybertopia.dao;

import com.macteam.cybertopia.entity.Article;
import com.macteam.cybertopia.pojo.ArticleTitle;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IArticleDao {
    List<ArticleTitle> getArticleListByRange(@Param("skip") int skip, @Param("limit") int limit);
//    List<Article> getArticleListByKeyword(String keyword);
    Article getArticleById(int id);
    int deleteArticleById(int id);
    int insertArticle(Article article);
}
