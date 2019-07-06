package com.macteam.cybertopia.dao;

import com.macteam.cybertopia.entity.Question;
import com.macteam.cybertopia.pojo.QuestionTitle;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IQuestionDao {
    List<QuestionTitle> getQuestionListByRange(@Param("skip") int skip, @Param("limit") int limit);
    //    List<Question> getQuestionListByKeyword(String keyword);
    Question getQuestionById(int id);
    int deleteQuestionById(int id);
    int insertQuestion(Question question);
    int updateQuestion(Question question);
}
