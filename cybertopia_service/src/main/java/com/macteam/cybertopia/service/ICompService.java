package com.macteam.cybertopia.service;

import com.macteam.cybertopia.entity.Competition;

import java.util.List;

public interface ICompService {

    List<Competition> getCompetitions(int page,int size);

    List<Competition> getCompetitionsBySearch(int page,int size,String keywords,String type);
}
