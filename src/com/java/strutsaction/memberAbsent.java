package com.java.strutsaction;

import com.java.bean.Member;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.opensymphony.xwork2.Action;

public class memberAbsent implements Action {

    private String phone1;

    public String getPhone1() {
        return phone1;
    }

    public void setPhone1(String phone1) {
        this.phone1 = phone1;
    }

    public String getPhone2() {
        return phone2;
    }

    public void setPhone2(String phone2) {
        this.phone2 = phone2;
    }

    public String getPhone3() {
        return phone3;
    }

    public void setPhone3(String phone3) {
        this.phone3 = phone3;
    }

    private String phone2;
    private String phone3;

    @Override
    public String execute() throws Exception {
        IDao<Member> dao = new DaoImpl<Member>();
        boolean b = false;
        if (phone1.length() == 11) {
            b = dao.memberAbsent(phone1);
        }

        if (phone2.length() == 11) {
            b = dao.memberAbsent(phone2);
        }

        if (phone3.length() == 11) {
            b = dao.memberAbsent(phone3);
        }
        if (b)

            return "success";
        else return "error";
    }

}
