package com.java.strutsaction;

import com.java.bean.Present;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.opensymphony.xwork2.Action;

/**
 * Created by CSC on 2016/10/28.
 */
public class addPresent implements Action {

    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String execute() throws Exception {
        IDao<Present> dao = new DaoImpl<Present>();
        Present p = new Present();
        p.setName(name);
        p.setMid("0");
        dao.add(p);
        return SUCCESS;
    }
}
