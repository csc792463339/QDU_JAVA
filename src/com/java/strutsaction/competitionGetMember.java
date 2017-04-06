package com.java.strutsaction;

import com.java.bean.Member;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.opensymphony.xwork2.Action;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by CSC on 2016/10/18.
 */
public class competitionGetMember implements Action {
    private String phone;
    private String result;

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    @Override
    public String execute() throws Exception {
        IDao<Member> dao = new DaoImpl<Member>();
        Member m = dao.queryPhone(Member.class, phone);
        if (null != m) {
            result = m.getName() + "," + m.getId();
        } else {
            result = "null";
        }
        return SUCCESS;
    }
}
