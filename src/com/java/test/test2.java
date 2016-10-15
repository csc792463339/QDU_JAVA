package com.java.test;

import com.java.bean.Member;
import com.java.factory.SF;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by CSC on 2016/10/4.
 */
public class test2 {


    public static void main(String[] args) {
        Session session = null;
        Transaction tx = null;
        try {
            HashMap<String, String> map = new HashMap<String, String>();
            session = SF.getSession();
            tx = session.beginTransaction();
            SQLQuery query;
            query = session.createSQLQuery("select count(*) from member where department='技术部'");
            map.put("tech", query.list().get(0).toString());
            query = session.createSQLQuery("select count(*) from member where department='秘书部'");
            map.put("clerk", query.list().get(0).toString());
            query = session.createSQLQuery("select count(*) from member where department='活动部'");
            map.put("activity", query.list().get(0).toString());
            query = session.createSQLQuery("select count(*) from memberPresent where p1='1'");
            map.put("memberPresent", query.list().get(0).toString());
            query = session.createSQLQuery("select count(*) from memberPresent where p1='2'");
            map.put("memberAbsent", query.list().get(0).toString());
            tx.commit();

            System.out.print(map.get("tech"));

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null)
                session.close();
        }
    }
}
