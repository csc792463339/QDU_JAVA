package com.java.strutsaction;

import com.opensymphony.xwork2.Action;

import java.io.File;
import java.io.FileWriter;

/**
 * Created by CSC on 2016/10/25.
 */
public class setCurrent implements Action {
    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    private String tid;

    @Override
    public String execute() throws Exception {
        File file = new File("currentTeam");
        if (!file.exists()) {
            file.createNewFile();
        }
        FileWriter fw = new FileWriter(file);
        fw.write(tid);
        fw.flush();
        fw.close();
        return SUCCESS;
    }
}
