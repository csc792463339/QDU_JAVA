package com.java.strutsaction;

import com.java.bean.Member;
import com.java.bean.Suggest;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.opensymphony.xwork2.Action;
import com.sun.javafx.geom.AreaOp;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;

/**
 * Created by CSC on 2016/10/22.
 */
public class submitSuggest implements Action {

    String suggest;

    public String getSuggest() {
        return suggest;
    }

    public void setSuggest(String suggest) {
        this.suggest = suggest;
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

        IDao<Suggest> dao = new DaoImpl<Suggest>();
        Suggest s = new Suggest();
        s.setSuggest(suggest);
        s.setMid(Integer.parseInt(id.trim()));
        if (dao.add(s)) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }
}
