package com.java.strutsaction;

import com.java.bean.Member;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.opensymphony.xwork2.Action;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

public class memberConfirm implements Action {

    private Member member = new Member();

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    @Override
    public String execute() throws Exception {
        int id = 0;
        String n = URLEncoder.encode(member.getName(), "utf-8");

        HttpServletRequest request = ServletActionContext.getRequest();
        request.getSession().setAttribute("name", n);
        HttpServletResponse response = ServletActionContext.getResponse();

        Cookie phone = new Cookie("phone", member.getPhone());
        phone.setPath("/");
        phone.setMaxAge(31536000);
        response.addCookie(phone);

        Cookie name = new Cookie("name", n);
        name.setMaxAge(31536000);
        name.setPath("/");
        response.addCookie(name);

        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("id")) {
                id = Integer.parseInt(cookie.getValue());
                break;
            }
        }
        if (id != 0) {
            member.setId(id);
            IDao<Member> dao = new DaoImpl<Member>();
            if (dao.update(member)) {
                dao.memberPresent(id);
                return "success";
            } else return "error";
        } else {
            return "error";
        }
    }
}
