package com.java.test;

import com.java.bean.CompetitionTeam;
import com.java.bean.Member;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;

import java.util.List;

/**
 * Created by CSC on 2016/10/23.
 */
public class test5 {
    public static void main(String[] args) {
        IDao<CompetitionTeam> teamIDao = new DaoImpl<>();
        IDao<Member> memberIDao = new DaoImpl<>();

        List<CompetitionTeam> cpTeam = teamIDao.queryAll(CompetitionTeam.class);

        String s="";

        for (CompetitionTeam t : cpTeam) {
            s=s+t.getId()+","+t.getTeamName()+","+t.getProjectName()+"\n";
            /*
            if (t.getMember1Id() != 0) {
                System.out.println("成员1" + memberIDao.query(Member.class, t.getMember1Id()).getName());
            }
            if (t.getMember2Id() != 0) {
                System.out.println("成员2" + memberIDao.query(Member.class, t.getMember2Id()).getName());
            }
            if (t.getMember3Id() != 0) {
                System.out.println("成员3" + memberIDao.query(Member.class, t.getMember3Id()).getName());
            }
            if (t.getMember4Id() != 0) {
                System.out.println("成员4" + memberIDao.query(Member.class, t.getMember4Id()).getName());
            }*/
            //System.out.println("项目功能" + t.getProjectFunction());
            //System.out.println("项目细节" + t.getProjectDetails());
        }


        System.out.println(s);
    }
}
