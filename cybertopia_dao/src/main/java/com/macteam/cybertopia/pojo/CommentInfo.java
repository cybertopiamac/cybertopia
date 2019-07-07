package com.macteam.cybertopia.pojo;

import java.util.Date;

public class CommentInfo {
    private int id;
    private String content;
    private Date date;
    private int articleId;
    private String userName;

    @Override
    public String toString() {
        return "CommentInfo{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", date=" + date +
                ", articleId=" + articleId +
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

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
