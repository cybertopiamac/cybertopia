package com.macteam.cybertopia.service;

import com.macteam.cybertopia.entity.Question;
import com.macteam.cybertopia.entity.Answer;
import com.macteam.cybertopia.pojo.QuestionTitle;

import java.util.List;

public interface IQuestionService {
    List<QuestionTitle> getQuestionListByRange(int skip, int limit);
    //    List<Question> getQuestionListByKeyword(String keyword);
    Question getQuestionById(int id);
    int deleteQuestionById(int id);
    int insertQuestion(Question question);
    int increaseQuestionBrowseNum(Question question, int delta);
    int insertAnswer(Answer answer);
    List<Answer> getAnswerByQuestionId(int questionId);
}
