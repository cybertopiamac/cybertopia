package com.macteam.cybertopia.service;

import com.macteam.cybertopia.entity.Competition;

import java.util.List;

public interface ICompService {

    List<Competition> getCompetitions(int page,int size);

}
