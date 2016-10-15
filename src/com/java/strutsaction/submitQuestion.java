package com.java.strutsaction;

import com.java.bean.Question;
import com.java.dao.DaoImpl;
import com.opensymphony.xwork2.Action;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;

public class submitQuestion implements Action {

    private String question;

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
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
        DaoImpl<Question> dao = new DaoImpl<Question>();
        Question q = new Question();
        if (id != null) {
            q.setMid(Integer.parseInt(id));
            q.setQuestion(question);
            dao.add(q);
            return "success";
        } else
            return "error";
    }

}
