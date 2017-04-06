package com.java.dao;

import java.io.File;
import java.io.FileReader;
import java.util.List;

import com.java.bean.*;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
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
    public List queryBookSite(String number) {
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            String hl = "SELECT member.id,member.name,member.phone,member.qq,member.college,member.grade,member.major,member.campus,member.dormitory,member.department,member.date,booksite.id,booksite.mid,booksite.time,booksite.number from member JOIN booksite ON member.id=booksite.mid WHERE booksite.number=2";
            Query query = session.createSQLQuery(hl).addEntity(Member.class).addEntity(BookSite.class);
            List data = query.list();
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
    public List queryCompetitionMember() {

        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            String hql = "from Member where dormitory='比赛'";
            Query query = session.createQuery(hql);
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
    public CompetitionTeam getCurrentTeam() {
        int currentTeam = 0;
        File comTeam = new File("currentTeam");
        try {
            FileReader fr = new FileReader(comTeam);
            char[] c = new char[10];
            fr.read(c);
            fr.close();
            String s = "";
            for (char cc : c) {
                s = s + cc;
            }
            currentTeam = Integer.parseInt(s.trim());
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            String hql = "from CompetitionTeam where id=:id";
            Query query = session.createQuery(hql);
            query.setParameter("id", currentTeam);
            List list = query.list();
            tx.commit();
            return (CompetitionTeam) list.get(0);
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
        File file = new File("present");
        String present = new String();
        int pid = 0;
        try {
            FileReader fr = new FileReader(file);
            char[] p = new char[10];
            fr.read(p);
            fr.close();
            for (int i = 0; i < p.length; i++) {
                present = present + p[i];
            }
            pid = Integer.parseInt(present.trim());
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            Query query = session.createQuery("select mid from Present where id=" + pid);
            String presentOld = query.list().get(0).toString();
            if (presentOld.equals("0")) {
                presentOld = mid + ",";
            } else {
                String[] presentArray = presentOld.split(",");
                String smid = String.valueOf(mid).trim();
                for (String id : presentArray) {
                    if (id.equals(smid)) {
                        return true;
                    }
                }
                presentOld = presentOld + smid + ",";
            }
            String hql = "update  Present  set mid=:newPresent where id=:id";
            query = session.createQuery(hql);
            query.setParameter("newPresent", presentOld);
            query.setParameter("id", pid);
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
    public List<Member> queryPresent(String pid) {
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            Query query = session.createQuery("select mid from Present where id=" + pid);
            String presentmid = query.list().get(0).toString();
            if (presentmid.equals("0")) {
                presentmid = "(0)";
            } else {
                presentmid = "(" + presentmid.substring(0, presentmid.length() - 1) + ")";
            }
            query = session
                    .createSQLQuery("select * from member where member.id in " + presentmid).addEntity(Member.class);
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
    public List<Message> queryMessage() {
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            Query query = session.createQuery("from Message m order by m.num desc");
            List<Message> data = query.list();
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
    public void likeMessage(String id) {

        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            String hql = "update Message q set q.num=q.num+1 where q.id=:id";
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
    public int getCount(Class<T> cls, int n) {
        int num = 0;
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            String hql = "select mid from BookSite b where b.number=:n1";
            Query query = session.createQuery(hql);
            query.setParameter("n1", n);
            num = query.list().size();
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null)
                session.close();
        }
        return num;
    }

    @Override
    public boolean updateScore(CompetitionScore score) {
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            String sql = "update  competition_score set score1=" + score.getScore1() + ",score2=" + score.getScore2() + ",score3=" + score.getScore3() + ",special=" + score.getSpecial() + ",comment=\'" +
                    score.getComment() + "\' where teamid=" + score.getTeamid();
            Query q = session.createSQLQuery(sql);
            q.executeUpdate();
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
    public List<CompetitionScore> queryScore() {
        try {
            session = SF.getSession();
            tx = session.beginTransaction();
            Query query = session.createQuery("from CompetitionScore s order by s.total desc");
            List<CompetitionScore> data = query.list();
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

}
