package com.macteam.cybertopia.dao;

import com.macteam.cybertopia.entity.Article;
import com.macteam.cybertopia.entity.Comment;
import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface IPersonalCenterDao {
    List<Article> getUserArticleCollectByUserId(int id);
    List<Competition> getUserCompetitionCollectByUserId(int id);
    int updateUserInfo(User user);
    int updateUserPassword(@Param("id") int id, @Param("password") String password);
    int updateUserDesc(int id, @Param("desc") String desc);
    List<Article> getUserArticlePublishByUserId(int id);

    List<Comment> getUserCommentHistoryByUserId(int id);
}
