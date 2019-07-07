package com.macteam.cybertopia.dao;

import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.pojo.ArticleTitle;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICollectionDao {
    //    int insertUserArticleCollect(@Param("userId") int userId, @Param("articleId") int articleId)
    int insertArticleCollection(@Param("userId") int userId, @Param("articleId") int articleId);
    int getArticleCollectStatus(@Param("userId") int userId, @Param("articleId") int articleId);
    int deleteArticleCollection(@Param("userId") int userId, @Param("articleId") int articleId);

    List<ArticleTitle> getArticleCollectionByUserId(int userId);
    List<Competition> getCompetitionCollectionByUserId(int id);
}
