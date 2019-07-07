package com.macteam.cybertopia.pojo;

import java.util.Date;

public class AnswerInfo {
    private int id;
    private String content;
    private Date date;
    private int questionId;
    private String userName;

    @Override
    public String toString() {
        return "AnswerInfo{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", date=" + date +
                ", questionId=" + questionId +
                ", userName='" + userName + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
