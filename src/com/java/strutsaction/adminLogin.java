package com.java.strutsaction;

import com.opensymphony.xwork2.Action;

public class adminLogin implements Action {

    private String password;


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String execute() throws Exception {
        if (password.equals("admin")) {
            return "success";
        } else {
            return "error";
        }
    }
}
