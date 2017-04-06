package com.java.strutsaction;

import com.opensymphony.xwork2.Action;

import java.io.File;
import java.io.FileWriter;

/**
 * Created by CSC on 2016/10/19.
 */
public class setPresent implements Action {
    private String present;

    public String getPresent() {
        return present;
    }

    public void setPresent(String present) {
        this.present = present;
    }

    @Override
    public String execute() throws Exception {
        File file = new File("present");
        if (!file.exists()) {
            file.createNewFile();
        }
        FileWriter fw = new FileWriter(file);
        fw.write(present.trim());
        fw.flush();
        fw.close();
        return SUCCESS;
    }
}
