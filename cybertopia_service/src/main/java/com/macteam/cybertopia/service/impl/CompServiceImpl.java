package com.macteam.cybertopia.service.impl;

import com.github.pagehelper.PageHelper;
import com.macteam.cybertopia.dao.ICompDao;
import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.service.ICompService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompServiceImpl implements ICompService {
    @Autowired
    private ICompDao compDao;

    public List<Competition> getCompetitions(int page,int size) {
        PageHelper.startPage(page,size);
        return compDao.getCompetitions();
    }

    public List<Competition> getCompetitionsBySearch(int page, int size, String keywords, String type) {
        if(type.equals("")&&!keywords.equals("")){
            PageHelper.startPage(page,size);
            System.out.println("111111");
            return compDao.getCompetitionsByKeywords(keywords);
        }
        else if(keywords.equals("")&&!type.equals("")){
            System.out.println("222222");
            PageHelper.startPage(page,size);
            return compDao.getCompetitionsByType(type);
        }
        else if(keywords.equals("")&&type.equals("")){
            System.out.println("333333");
            PageHelper.startPage(page,size);
            return compDao.getCompetitions();
        }
        else{
            PageHelper.startPage(page,size);
            return compDao.getCompetitionsByKeywordsAndType(keywords,type);
        }
    }

    public Competition getCompetitionById(int id) {
        return compDao.getCompetitionById(id);
    }
}
