package com.java.dao;


import java.awt.print.Book;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.java.bean.*;

public interface IDao<T> {
    public void likeMessage(String id);

    public int getCount(Class<T> cls, int n);

    public boolean add(T t);

    public boolean update(T t);

    public boolean memberChangeDep(String phone, String dep);

    public boolean memberPresent(int mid);

    public T query(Class<T> cls, int id);

    public T queryPhone(Class<T> cls, String phone);

    public T queryQq(Class<T> cls, String phone);

    public CompetitionTeam getCurrentTeam();

    public List<T> queryAll(Class<T> cls);

    public List queryBookSite(String number);

    public List queryCompetitionMember();

    public List<Member> queryPresent(String pid);

    public List<Member> queryDepartment(String dep);

    public List<Message> queryMessage();

    public List<CompetitionScore> queryScore();

    public boolean updateScore(CompetitionScore score);

}
