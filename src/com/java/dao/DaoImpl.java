package com.java.dao;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.java.bean.Member;
import com.java.factory.SF;

public class DaoImpl<T> implements IDao<T> {
    Session session = null;
    Transaction tx = null;

    @Override
    public boolean add(T t) {
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            session.save(t);
            tx.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (session != null)
                session.close();
        }
    }

    @Override
    public T query(Class<T> cls, int id) {
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            T t = (T) session.get(cls, id);
            tx.commit();
            return t;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null)
                session.close();
        }
    }

    @Override
    public List<T> queryAll(Class<T> cls) {
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            Criteria cri = session.createCriteria(cls);
            List<T> data = cri.list();
            tx.commit();
            return data;
        } catch (Exception e) {
            e.printStackTrace();
            if (tx != null)
                tx.rollback();
            return null;
        } finally {
            if (session != null)
                session.close();
        }
    }

    @Override
    public boolean update(T t) {
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            session.update(t);
            tx.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (session != null)
                session.close();
        }

    }

    @Override
    public T queryPhone(Class<T> cls, String phone) {
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            String hql = "from Member where phone=:phone";
            Query query = session.createQuery(hql);
            query.setParameter("phone", phone);
            List list = query.list();
            tx.commit();

            if (list.size() > 0) {
                T t = (T) list.get(0);
                if (t != null) {
                    return t;
                } else
                    return null;
            } else
                return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null)
                session.close();
        }
    }

    @Override
    public T queryQq(Class<T> cls, String qq) {
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            String hql = "from Member where qq=:qq";
            Query query = session.createQuery(hql);
            query.setParameter("qq", qq);
            List list = query.list();
            tx.commit();
            if (list.size() > 0) {
                T t = (T) list.get(0);
                if (t != null) {
                    return t;
                } else
                    return null;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null)
                session.close();
        }
    }


    @Override
    public boolean memberChangeDep(String phone, String dep) {
        int b = 0;
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            String sql = "update member set department=\'" + dep + "\' where phone=\'" + phone + "\'";
            SQLQuery query = session.createSQLQuery(sql);
            b = query.executeUpdate();
            tx.commit();
            if (b > 0)
                return true;
            else return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (session != null)
                session.close();
        }
    }

    @Override
    public boolean memberPresent(int mid) {
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            String hql = "update Present p set p.p1=1 where p.mid=:mid";
            Query query = session.createQuery(hql);
            query.setParameter("mid", mid);
            query.executeUpdate();
            tx.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (session != null)
                session.close();
        }

    }

    @Override
    public List<Member> queryPresent(String state) {
        try {
            session = SF.getSession();
            tx = session.beginTransaction();

            SQLQuery query = session
                    .createSQLQuery("select * from member join present on member.id= present.mid where present.p1=?")
                    .addEntity(Member.class);
            query.setString(0, state);
            List<Member> data = query.list();
            tx.commit();
            return data;
        } catch (Exception e) {
            e.printStackTrace();
            if (tx != null)
                tx.rollback();
            return null;
        } finally {
            if (session != null)
                session.close();
        }
    }

    @Override
    public List<Member> queryDepartment(String dep) {

        if (dep.equals(0)) {
            dep = "普通成员";
        } else if (dep.equals("1")) {
            dep = "技术部";
        } else if (dep.equals("2")) {
            dep = "秘书部";
        } else if (dep.equals("3")) {
            dep = "活动部";
        }

        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            String hql = "from Member where department=:dep";
            Query query = session.createQuery(hql);
            query.setParameter("dep", dep);
            List<Member> list = query.list();
            tx.commit();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null)
                session.close();
        }
    }

    @Override
    public void likeQuestion(String id) {

        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            String hql = "update Question q set q.num=q.num+1 where q.id=:id";
            Query query = session.createQuery(hql);
            query.setParameter("id", Integer.parseInt(id));
            query.executeUpdate();
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null)
                session.close();
        }
    }

    @Override
    public HashMap<String, String> count() {
        HashMap<String, String> map = null;
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            map = new HashMap<String, String>();
            SQLQuery query = session.createSQLQuery("select count(*) from present where p1='1'");
            map.put("memberPresent", query.list().get(0).toString());
            query = session.createSQLQuery("select count(*) from present where p1='2'");
            map.put("memberAbsent", query.list().get(0).toString());
            query = session.createSQLQuery("select count(*) from member where department='技术部'");
            map.put("tech", query.list().get(0).toString());
            query = session.createSQLQuery("select count(*) from member where department='秘书部'");
            map.put("clerk", query.list().get(0).toString());
            query = session.createSQLQuery("select count(*) from member where department='活动部'");
            map.put("activity", query.list().get(0).toString());
            tx.commit();
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null)
                session.close();
        }

    }

    @Override
    public boolean memberAbsent(String phone) {

        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            String hql = "update Present p set p.p1=2 where p.mid in (select id from Member m where m.phone=:phone)";
            Query query = session.createQuery(hql);
            query.setParameter("phone", phone);
            query.executeUpdate();
            tx.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (session != null)
                session.close();
        }
    }
}
