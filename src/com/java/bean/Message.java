package com.java.bean;

public class Message implements java.io.Serializable {
    private int id;
    private int mid;
    private String message;
    private int num;

    public void setId(int id) {
        this.id = id;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getId() {
        return id;

    }

    public int getMid() {
        return mid;
    }

    public String getMessage() {
        return message;
    }

    public int getNum() {
        return num;
    }
}
