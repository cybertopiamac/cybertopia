package com.macteam.cybertopia.dao;

import com.macteam.cybertopia.entity.Answer;

import java.util.List;

public interface IAnswerDao {
    int insertAnswer(Answer comment);

    List<Answer> getAnswerByUserId(int userId);

    List<Answer> getAnswerByQuestionId(int questionId);
}

