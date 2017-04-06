package com.java.bean;

/**
 * Created by CSC on 2016/10/16.
 */
public class CompetitionTeam {

    private int id;
    private int leaderId;
    private int member1Id;
    private int member2Id;
    private int member3Id;
    private int member4Id;
    private String teamName;
    private String projectName;
    private String projectFunction;
    private String projectDetails;
    private String likeCount;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLeaderId() {
        return leaderId;
    }

    public void setLeaderId(int leaderId) {
        this.leaderId = leaderId;
    }

    public int getMember1Id() {
        return member1Id;
    }

    public void setMember1Id(int member1Id) {
        this.member1Id = member1Id;
    }

    public int getMember2Id() {
        return member2Id;
    }

    public void setMember2Id(int member2Id) {
        this.member2Id = member2Id;
    }

    public int getMember3Id() {
        return member3Id;
    }

    public void setMember3Id(int member3Id) {
        this.member3Id = member3Id;
    }

    public int getMember4Id() {
        return member4Id;
    }

    public void setMember4Id(int member4Id) {
        this.member4Id = member4Id;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectFunction() {
        return projectFunction;
    }

    public void setProjectFunction(String projectFunction) {
        this.projectFunction = projectFunction;
    }

    public String getProjectDetails() {
        return projectDetails;
    }

    public void setProjectDetails(String projectDetails) {
        this.projectDetails = projectDetails;
    }

    public String getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(String likeCount) {
        this.likeCount = likeCount;
    }
}
