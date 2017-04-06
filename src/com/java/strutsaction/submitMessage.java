package com.java.strutsaction;

import com.java.bean.Message;
import com.java.dao.DaoImpl;
import com.opensymphony.xwork2.Action;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;

public class submitMessage implements Action {

    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String execute() throws Exception {
        Cookie[] cookies = ServletActionContext.getRequest().getCookies();
        String id = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("id")) {
                id = cookie.getValue();
                break;
            }
        }
        DaoImpl<Message> dao = new DaoImpl<Message>();
        Message m = new Message();
        if (id != null) {
            m.setMid(Integer.parseInt(id));
            m.setMessage(message);
            dao.add(m);
            return "success";
        } else
            return "error";
    }

}
