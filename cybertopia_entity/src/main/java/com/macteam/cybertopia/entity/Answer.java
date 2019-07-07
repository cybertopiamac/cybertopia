package com.macteam.cybertopia.entity;

import java.util.Date;

public class Answer {
    private int id;
    private String content;
    private Date date;
    private int questionId;
    private int userId;

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

    public int getArticleId() {
        return questionId;
    }

    public void setArticleId(int questionId) {
        this.questionId = questionId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Answer{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", date=" + date +
                ", questionId=" + questionId +
                ", userId=" + userId +
                '}';
    }
}

