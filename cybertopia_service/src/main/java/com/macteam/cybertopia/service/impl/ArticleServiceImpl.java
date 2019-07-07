package com.macteam.cybertopia.service.impl;

import com.macteam.cybertopia.dao.IArticleDao;
import com.macteam.cybertopia.dao.ICollectionDao;
import com.macteam.cybertopia.dao.ICommentDao;
import com.macteam.cybertopia.entity.Article;
import com.macteam.cybertopia.entity.Comment;
import com.macteam.cybertopia.pojo.ArticleTitle;
import com.macteam.cybertopia.pojo.CommentInfo;
import com.macteam.cybertopia.service.IArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements IArticleService {
    @Autowired
    private IArticleDao articleDao;

    @Autowired
    private ICommentDao commentDao;

    @Autowired
    private ICollectionDao collectionDao;

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
    public int increaseArticleBrowseNum(Article article, int delta){
        article.setBrowseNum(article.getBrowseNum() + delta);
        return articleDao.updateArticle(article);
    }

    public int insertComment(Comment comment){
        return commentDao.insertComment(comment);
    }
    public List<CommentInfo> getCommentByArticleId(int articleId){
        return commentDao.getCommentByArticleId(articleId);
    }

    public int insertArticleCollection(int userId, int articleId){
        return collectionDao.insertArticleCollection(userId,articleId);
    }

    public int getArticleCollectStatus(int userId, int articleId){
        return collectionDao.getArticleCollectStatus(userId,articleId);
    }

    public int deleteArticleCollection(int userId, int articleId){
        return collectionDao.deleteArticleCollection(userId,articleId);
    }
    public List<ArticleTitle> getArticleListByKeywordRange(String keyword, int skip, int limit){
        return articleDao.getArticleListByKeywordRange(keyword,skip,limit);
    }
}
