package com.macteam.cybertopia.service;

import com.macteam.cybertopia.entity.Article;
import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.entity.User;

import java.util.List;

public interface IPersonalCenterService {
    User getUserById(int id);
    User getUserByName(String name);
    List<Article> getArticleCollectById(int id);
    List<Article> getArticleCollectByUser(User user);
    List<Competition> getCompetitionById(int id);
    List<Competition> getCompetitionByUser(User user);
}
