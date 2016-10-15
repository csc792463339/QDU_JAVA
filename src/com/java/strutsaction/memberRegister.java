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

public class memberRegister implements Action {

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
        IDao<Member> dao = new DaoImpl<Member>();
        member.setDepartment("普通成员");


        if (dao.add(member)) {
            Member m = dao.queryPhone(Member.class, member.getPhone());
            HttpServletResponse response = ServletActionContext.getResponse();
            String n = URLEncoder.encode(member.getName(), "utf-8");
            ServletActionContext.getRequest().getSession().setAttribute("name", n);

            Cookie id = new Cookie("id", m.getId().toString());
            id.setMaxAge(31536000);
            id.setPath("/");

            Cookie phone = new Cookie("phone", m.getPhone());
            phone.setMaxAge(31536000);
            phone.setPath("/");

            Cookie name = new Cookie("name", n);
            name.setMaxAge(31536000);
            name.setPath("/");

            response.addCookie(name);
            response.addCookie(id);
            response.addCookie(phone);
            dao.memberPresent(m.getId());

            return "success";
        } else
            return "error";
    }


}
