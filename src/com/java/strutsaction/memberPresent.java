package com.java.strutsaction;

import com.java.bean.Member;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.opensymphony.xwork2.Action;

public class memberPresent implements Action {
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    private String phone;

    @Override
    public String execute() throws Exception {

        IDao<Member> dao = new DaoImpl<Member>();
        Member member = dao.queryPhone(Member.class, phone);
        if (null != member) {
            dao.memberPresent(member.getId());
            return "success";
        } else {
            return "error";
        }


    }

}
