package com.java.strutsaction;

import com.java.bean.Member;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.opensymphony.xwork2.Action;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by CSC on 2016/10/16.
 */
public class competitionMember implements Action {
    private Member member = new Member();

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    @Override
    public String execute() throws Exception {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        try {
            date = (Date) df.parse(df.format(date));
        } catch (ParseException e1) {
            e1.printStackTrace();
        }
        member.setDate(date);
        member.setDepartment("普通成员");
        member.setDormitory("比赛");

        IDao<Member> dao = new DaoImpl<Member>();
        String n = URLEncoder.encode(member.getName(), "utf-8");
        ServletActionContext.getRequest().getSession().setAttribute("name", n);
        Member m1 = dao.queryPhone(Member.class, member.getPhone());
        if (null != m1) {
            member.setId(m1.getId());
            member.setDepartment(m1.getDepartment());
            if (dao.update(member)) {
                HttpServletResponse response = ServletActionContext.getResponse();
                Cookie id = new Cookie("id", member.getId().toString());
                id.setMaxAge(31536000);
                id.setPath("/");
                Cookie phone = new Cookie("phone", member.getPhone());
                phone.setMaxAge(31536000);
                phone.setPath("/");
                response.addCookie(id);
                response.addCookie(phone);
                return "success";
            } else {
                return "error";
            }
        } else {
            if (dao.add(member)) {
                Member m2 = dao.queryPhone(Member.class, member.getPhone());
                HttpServletResponse response = ServletActionContext.getResponse();
                Cookie id = new Cookie("id", m2.getId().toString());
                id.setMaxAge(31536000);
                id.setPath("/");
                Cookie phone = new Cookie("phone", m2.getPhone());
                phone.setMaxAge(31536000);
                phone.setPath("/");
                response.addCookie(id);
                response.addCookie(phone);
                return "success";
            } else
                return "error";
        }
    }
}
