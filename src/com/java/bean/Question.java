package com.java.bean;

public class Question implements java.io.Serializable {
    private int id;
    private int mid;
    private String question;
    private int num;

    public void setId(int id) {
        this.id = id;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public void setQuestion(String question) {
        this.question = question;
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

    public String getQuestion() {
        return question;
    }

    public int getNum() {
        return num;
    }
}
