package com.java.strutsaction;

import com.java.bean.Question;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.opensymphony.xwork2.Action;


public class likeQuestion implements Action {

    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {
        IDao<Question> dao = new DaoImpl<Question>();
        dao.likeQuestion(id);
        return "success";
    }

}
