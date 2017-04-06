package com.java.test;

import com.java.bean.CompetitionTeam;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;

import java.io.*;
import java.util.Date;

/**
 * Created by CSC on 2016/10/4.
 */
public class test2 {


    public static void main(String[] args) {


    /*
        try {
            file.createNewFile();
            FileWriter fw=new FileWriter(file);
            fw.write("p3");
            fw.flush();
            fw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        */
        File file = new File("present.txt");
        String present = new String();
        try {
            FileReader fr = new FileReader(file);
            char[] p = new char[10];

            fr.read(p);
            fr.close();
            for (int i = 0; i < p.length; i++) {
                present = present + p[i];
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
