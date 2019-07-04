package com.macteam.cybertopia.dao;

import com.macteam.cybertopia.entity.Article;
import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.entity.User;

import java.util.List;


public interface IPersonalCenterDao {
    List<Article> getUserArticleCollectByUserId(int id);
    List<Competition> getUserCompetitionCollectByUserId(int id);
}
