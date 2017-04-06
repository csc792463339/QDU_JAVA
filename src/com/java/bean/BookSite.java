package com.java.bean;

import java.sql.Time;
import java.sql.Timestamp;

/**
 * Created by CSC on 2016/10/22.
 */
public class BookSite {
    int id;
    int mid;
    int number;
    Timestamp time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }


}
