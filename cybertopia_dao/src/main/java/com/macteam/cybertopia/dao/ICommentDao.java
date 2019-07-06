package com.macteam.cybertopia.dao;

import com.macteam.cybertopia.entity.Comment;
import com.macteam.cybertopia.entity.Competition;

import java.util.List;

public interface ICommentDao {
    int insertComment(Comment comment);
    List<Comment> getCommentByUserId(int id);
}
