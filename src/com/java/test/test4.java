package com.java.test;

import com.java.bean.BookSite;
import com.java.bean.Member;
import com.java.bean.Message;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


/**
 * Created by CSC on 2016/10/22.
 */
public class test4 {

    public static void main(String[] args) {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/java";
        String username = "csc";
        String password = "csc";
        Connection conn = null;
        ResultSet rs = null;
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, username, password);
            PreparedStatement pstmt;
            String sql = "SELECT member.id,member.name,member.college,member.grade,member.major,booksite.time from member JOIN booksite ON member.id=booksite.mid WHERE booksite.number=2";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            while (rs.next()) {
                System.out.println(rs.getString(1));
                System.out.println(rs.getString(2));
                System.out.println(rs.getString(3));
                System.out.println(rs.getString(4));
                System.out.println(rs.getString(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
