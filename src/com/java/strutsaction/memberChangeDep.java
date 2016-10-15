package com.java.strutsaction;

import com.java.bean.Member;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.opensymphony.xwork2.Action;
import org.apache.struts2.ServletActionContext;

import java.net.URLEncoder;

public class memberChangeDep implements Action {
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    private String phone;
    private String department;


    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String execute() throws Exception {

        IDao<Member> dao = new DaoImpl<Member>();
        String dep;
        if (department.equals("0")) {
            dep = "普通成员";
        } else if (department.equals("1")) {
            dep = "技术部";
        } else if (department.equals("2")) {
            dep = "秘书部";
        } else {
            dep = "活动部";
        }

        if (dao.memberChangeDep(phone, dep)) {
            String dapartment = URLEncoder.encode(dep, "utf-8");
            ServletActionContext.getRequest().getSession().setAttribute("dep", dapartment);
            return "success";
        } else return "error";

    }

}
