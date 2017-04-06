<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@page import="com.java.bean.*,com.java.dao.*,java.util.List " %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=0.6">
    <title>项目点赞情况----青岛大学第三届易途杯Java编程大赛</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <link rel="stylesheet"
          href="font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/csc.css">

</head>
<body>
<br/>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-xs-center">
    <h3 class="tm-section-intro-text">项目点赞排名</h3>
</div>
<%
    IDao<Member> dao2 = new DaoImpl<Member>();
    Member m = new Member();
    IDao<CompetitionTeam> teamIDao = new DaoImpl<CompetitionTeam>();
    List<CompetitionTeam> cpteam = teamIDao.queryAll(CompetitionTeam.class);
    CompetitionTeam temp;
    int size = cpteam.size();
    for (int i = 0; i < size; i++) {
        int k = i;
        for (int j = size - 1; j > i; j--) {
            if ((cpteam.get(j).getLikeCount().split(";").length) > (cpteam.get(k).getLikeCount().split(";").length)) {
                k = j;
            }
        }
        temp = cpteam.get(i);
        cpteam.set(i, cpteam.get(k));
        cpteam.set(k, temp);
    }
%>
<br/>
<div class="table-responsive">
    <table class="table table-striped " width="100%">
        <tbody>
        <%
            int i = 1;
            for (CompetitionTeam t : cpteam) {
                out.print("<tr><td style='color:red'>第" + i++ + "名</td><td colspan=2>" + t.getTeamName() + "</td><td>点赞</td><td>" + t.getLikeCount().split(";").length + "</td></tr></tr>");
                m = dao2.query(Member.class, t.getLeaderId());
                out.print("<tr><td>队长</td><td>" + m.getName() + "</td><td>" + m.getGrade() + "</td><td>" + m.getCollege() + "</td><td>" + m.getMajor() + "</td></tr>");
                if (t.getMember1Id() != 0) {
                    m = dao2.query(Member.class, t.getMember1Id());
                    out.print("<tr><td>队员</td><td>" + m.getName() + "</td><td>" + m.getGrade() + "</td><td>" + m.getCollege() + "</td><td>" + m.getMajor() + "</td></tr>");
                }
                if (t.getMember2Id() != 0) {
                    m = dao2.query(Member.class, t.getMember2Id());
                    out.print("<tr><td>队员</td><td>" + m.getName() + "</td><td>" + m.getGrade() + "</td><td>" + m.getCollege() + "</td><td>" + m.getMajor() + "</td></tr>");
                }
                if (t.getMember3Id() != 0) {
                    m = dao2.query(Member.class, t.getMember3Id());
                    out.print("<tr><td>队员</td><td>" + m.getName() + "</td><td>" + m.getGrade() + "</td><td>" + m.getCollege() + "</td><td>" + m.getMajor() + "</td></tr>");
                }
                if (t.getMember4Id() != 0) {
                    m = dao2.query(Member.class, t.getMember4Id());
                    out.print("<tr><td>队员</td><td>" + m.getName() + "</td><td>" + m.getGrade() + "</td><td>" + m.getCollege() + "</td><td>" + m.getMajor() + "</td></tr>");
                }
                out.print("<tr><td>项目名称</td><td >" + t.getProjectName() + "</td><td>项目功能</td><td colspan=2>" + t.getProjectFunction() + "</td></tr>");
                out.print("<tr> <td colspan=6 ></td>  </tr>");

            }
        %>
        </tbody>
    </table>

</div>
<div class="tm-wrapper-center">
    <a href="admin/adminInfo.jsp"
       class="btn btn-success  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i class="fa fa-reply"></i> 返回</a>
    <br/>
</div>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.touchSwipe.min.js"></script>

</body>
</html>