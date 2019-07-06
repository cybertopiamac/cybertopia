package com.macteam.cybertopia.service.impl;

import com.macteam.cybertopia.dao.ICollectionDao;
import com.macteam.cybertopia.service.ICollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CollectionServiceImpl implements ICollectionService {

    @Autowired
    private ICollectionDao collectionDao;

    public int insertArticleCollection(int userId, int articleId){
        return collectionDao.insertArticleCollection(userId,articleId);
    }

    public int getArticleCollectStatus(int userId, int articleId){
        return collectionDao.getArticleCollectStatus(userId,articleId);
    }

    public int deleteArticleCollection(int userId, int articleId){
        return collectionDao.deleteArticleCollection(userId,articleId);
    }
}
