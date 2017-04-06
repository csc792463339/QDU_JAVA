package com.java.test;


import com.java.bean.CompetitionTeam;
import com.java.bean.Member;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.sun.javafx.property.adapter.PropertyDescriptor;

import java.io.*;
import java.util.List;

public class test6 {

    public static void main(String[] args) {
        IDao<CompetitionTeam> dao = new DaoImpl<CompetitionTeam>();
        IDao<Member> dao1 = new DaoImpl<Member>();
        List<CompetitionTeam> list = dao.queryAll(CompetitionTeam.class);
        File file = new File("C:/teamOrder.txt");
        String order = "";
        Member m = new Member();
        FileOutputStream fos = null;
        OutputStreamWriter osw = null;
        try {
            fos = new FileOutputStream("c:\\teamOrder.txt");
            osw = new OutputStreamWriter(fos, "UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        }
        int i = 1;
        for (CompetitionTeam team : list) {
            m = dao1.query(Member.class, team.getLeaderId());
            order = order + (i++) + "," + team.getId() + "," + team.getTeamName() + "," + m.getName() + ";" + "\r\n";
        }

        try {
            osw.write(order.trim());
            osw.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}