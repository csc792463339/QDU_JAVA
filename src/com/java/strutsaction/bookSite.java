package com.java.strutsaction;

import com.java.bean.BookSite;
import com.java.bean.Member;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.opensymphony.xwork2.Action;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.net.URLEncoder;

/**
 * Created by CSC on 2016/10/22.
 */
public class bookSite implements Action {
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    private String phone;

    @Override
    public String execute() throws Exception {

        IDao<Member> dao = new DaoImpl<Member>();
        Member m;
        m = dao.queryPhone(Member.class, phone);
        IDao<BookSite> b = new DaoImpl<>();
        HttpServletResponse response = ServletActionContext.getResponse();
        String n = URLEncoder.encode(m.getName(), "utf-8");
        Cookie id = new Cookie("id", m.getId().toString());
        id.setPath("/");
        id.setMaxAge(31536000);
        response.addCookie(id);
        Cookie phone = new Cookie("phone", m.getPhone());
        phone.setPath("/");
        phone.setMaxAge(31536000);
        response.addCookie(phone);

        Cookie name = new Cookie("name", n);
        name.setMaxAge(31536000);
        name.setPath("/");
        response.addCookie(name);

        File file = new File("booksite");
        FileReader fr = new FileReader(file);
        char[] booksite = new char[10];
        String content = "";
        fr.read(booksite);
        for (char c : booksite) {
            content = content + c;
        }
        int week = Integer.parseInt(content.split(";")[0].trim());
        int number = Integer.parseInt(content.split(";")[1].trim());

        if (b.getCount(BookSite.class, week) > number) {
            return "full";
        } else {
            HttpServletRequest request = ServletActionContext.getRequest();
            request.getSession().setAttribute("name", n);
            BookSite bookSite = new BookSite();
            bookSite.setNumber(week);
            bookSite.setMid(m.getId());
            b.add(bookSite);
            return SUCCESS;
        }
    }
}

