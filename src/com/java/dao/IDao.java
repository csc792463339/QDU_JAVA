package com.java.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.java.bean.Member;

public interface IDao<T> {
    public void likeQuestion(String id);

    public boolean add(T t);

    public boolean update(T t);

    public boolean memberChangeDep(String phone, String dep);

    public boolean memberPresent(int mid);

    public boolean memberAbsent(String phone);

    public T query(Class<T> cls, int id);

    public T queryPhone(Class<T> cls, String phone);

    public T queryQq(Class<T> cls, String phone);

    public List<T> queryAll(Class<T> cls);

    public List<Member> queryPresent(String state);

    public List<Member> queryDepartment(String dep);

    public HashMap<String, String> count();
}
