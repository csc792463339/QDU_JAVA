package com.java.strutsaction;

import com.java.bean.Member;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.opensymphony.xwork2.Action;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

public class memberPresent implements Action {
    private String phone;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String execute() throws Exception {

        IDao<Member> dao = new DaoImpl<Member>();
        Member member = dao.queryPhone(Member.class, phone);
        if (null != member) {
            HttpServletResponse response = ServletActionContext.getResponse();
            String n = URLEncoder.encode(member.getName(), "utf-8");
            ServletActionContext.getRequest().getSession().setAttribute("name", n);

            Cookie id = new Cookie("id", member.getId().toString());
            id.setMaxAge(31536000);
            id.setPath("/");

            Cookie phone = new Cookie("phone", member.getPhone());
            phone.setMaxAge(31536000);
            phone.setPath("/");

            Cookie name = new Cookie("name", n);
            name.setMaxAge(31536000);
            name.setPath("/");

            response.addCookie(name);
            response.addCookie(id);
            response.addCookie(phone);
            dao.memberPresent(member.getId());
            return "success";
        } else {
            return "error";
        }


    }

}
