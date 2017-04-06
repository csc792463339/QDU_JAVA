package com.java.test;

import com.java.bean.CompetitionScore;
import com.java.bean.CompetitionTeam;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class test3 {

    public static void main(String[] args) {

        IDao dao = new DaoImpl();
        CompetitionScore s=new CompetitionScore();
        s.setScore1(10);
        s.setSpecial(10);
        s.setTeamid(1);
        dao.updateScore(s);
    }

}