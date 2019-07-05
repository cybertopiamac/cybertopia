package com.macteam.cybertopia.service.impl;

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

    public List<Competition> getCompetitions() {
        return compDao.getCompetitions();
    }
}
