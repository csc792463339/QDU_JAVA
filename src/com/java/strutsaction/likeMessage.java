package com.java.strutsaction;

import com.java.bean.Message;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.opensymphony.xwork2.Action;


public class likeMessage implements Action {

    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {
        IDao<Message> dao = new DaoImpl<Message>();
        dao.likeMessage(id);
        return "success";
    }

}
