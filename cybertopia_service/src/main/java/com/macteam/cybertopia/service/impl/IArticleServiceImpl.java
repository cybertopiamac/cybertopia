package com.macteam.cybertopia.service.impl;

import com.macteam.cybertopia.dao.IArticleDao;
import com.macteam.cybertopia.entity.Article;
import com.macteam.cybertopia.pojo.ArticleTitle;
import com.macteam.cybertopia.service.IArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IArticleServiceImpl implements IArticleService {
    @Autowired
    private IArticleDao articleDao;

    public List<ArticleTitle> getArticleListByRange(int skip, int limit){
        return articleDao.getArticleListByRange(skip,limit);
    }
    public Article getArticleById(int id){
        return articleDao.getArticleById(id);
    }
    public int deleteArticleById(int id){
        return articleDao.deleteArticleById(id);
    }
    public int insertArticle(Article article){
        return articleDao.insertArticle(article);
    }
}
