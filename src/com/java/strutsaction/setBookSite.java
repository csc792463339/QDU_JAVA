package com.java.strutsaction;

import com.opensymphony.xwork2.Action;

import java.io.File;
import java.io.FileWriter;

/**
 * Created by CSC on 2016/10/22.
 */
public class setBookSite implements Action {
    String booksite;
    String number;

    public String getBooksite() {
        return booksite;
    }

    public void setBooksite(String booksite) {
        this.booksite = booksite;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    @Override
    public String execute() throws Exception {

        File file = new File("booksite");
        FileWriter fw = new FileWriter(file);
        if (!file.exists()) {
            file.createNewFile();
        }
        fw.write(booksite + ";" + number);
        fw.flush();
        fw.close();
        return SUCCESS;
    }
}
