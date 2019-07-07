package com.macteam.cybertopia.service.impl;

import com.macteam.cybertopia.dao.IQuestionDao;
import com.macteam.cybertopia.dao.ICollectionDao;
import com.macteam.cybertopia.dao.IAnswerDao;
import com.macteam.cybertopia.entity.Question;
import com.macteam.cybertopia.entity.Answer;
import com.macteam.cybertopia.pojo.AnswerInfo;
import com.macteam.cybertopia.pojo.QuestionTitle;
import com.macteam.cybertopia.service.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionServiceImpl implements IQuestionService {
    @Autowired
    private IQuestionDao questionDao;

    @Autowired
    private IAnswerDao answerDao;

    @Autowired
    private ICollectionDao collectionDao;

    public List<QuestionTitle> getQuestionListByRange(int skip, int limit){
        return questionDao.getQuestionListByRange(skip,limit);
    }
    public Question getQuestionById(int id){
        return questionDao.getQuestionById(id);
    }
    public int deleteQuestionById(int id){
        return questionDao.deleteQuestionById(id);
    }
    public int insertQuestion(Question question){
        return questionDao.insertQuestion(question);
    }
    public int increaseQuestionBrowseNum(Question question, int delta){
        question.setBrowseNum(question.getBrowseNum() + delta);
        return questionDao.updateQuestion(question);
    }

    public int insertAnswer(Answer answer){
        return answerDao.insertAnswer(answer);
    }
    public List<AnswerInfo> getAnswerByQuestionId(int questionId){
        return answerDao.getAnswerByQuestionId(questionId);
    }
    public List<QuestionTitle> getQuestionListByKeywordRange(String keyword, int skip, int limit){
        return questionDao.getQuestionListByKeywordRange(keyword,skip,limit);
    }
}
