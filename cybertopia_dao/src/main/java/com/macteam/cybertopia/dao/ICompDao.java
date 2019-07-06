package com.macteam.cybertopia.dao;

import com.macteam.cybertopia.entity.Competition;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICompDao {
    List<Competition> getCompetitions();

    List<Competition> getCompetitionsByKeywords(@Param(value = "keywords") String keywords);

    List<Competition> getCompetitionsByType(@Param(value = "type") String type);

    List<Competition> getCompetitionsByKeywordsAndType(@Param(value = "keywords") String keywords, @Param(value = "type") String type);
}
