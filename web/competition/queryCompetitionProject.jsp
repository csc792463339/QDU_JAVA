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
    <title>项目提交情况----青岛大学第三届易途杯Java编程大赛</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <link rel="stylesheet"
          href="font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/csc.css">

</head>
<body>
<%
    IDao<CompetitionTeam> teamIDao = new DaoImpl<CompetitionTeam>();
    IDao<Member> memberIDao = new DaoImpl<Member>();
    List<CompetitionTeam> cpteam = teamIDao.queryAll(CompetitionTeam.class);
%>
<br/>
<h2 class="tm-section-title">已提交项目:<%=cpteam.size()%>
</h2>
<div class="table-responsive">

    <%
        for (CompetitionTeam t : cpteam) {
            out.print("<table class=\"table table-striped \" width=\"100%\"><thead> <tr>");
            out.print("<th colspan=\"1\">ID:</th>");
            out.print("<th colspan=\"1\">" + t.getId() + "</th>");
            out.print("<th colspan=\"2\">团队名称:</th>");
            out.print("<th colspan=\"2\">" + t.getTeamName() + "</th></tr></thead>");

            out.print("<tbody>");
            Member m = memberIDao.query(Member.class, t.getLeaderId());
            out.print("<tr><td>队长</td><td>" + m.getName() + "</td><td>" + m.getGrade() + "</td><td>" + m.getCollege() + "</td><td>" + m.getMajor() + "</td><td>" + m.getPhone() + "</td></tr>");
            if (t.getMember1Id() != 0) {
                m = memberIDao.query(Member.class, t.getMember1Id());
                out.print("<tr><td>队员1</td><td>" + m.getName() + "</td><td>" + m.getGrade() + "</td><td>" + m.getCollege() + "</td><td>" + m.getMajor() + "</td><td>" + m.getPhone() + "</td></tr>");
            }
            if (t.getMember2Id() != 0) {
                m = memberIDao.query(Member.class, t.getMember2Id());
                out.print("<tr><td>队员2</td><td>" + m.getName() + "</td><td>" + m.getGrade() + "</td><td>" + m.getCollege() + "</td><td>" + m.getMajor() + "</td><td>" + m.getPhone() + "</td></tr>");
            }
            if (t.getMember3Id() != 0) {
                m = memberIDao.query(Member.class, t.getMember3Id());
                out.print("<tr><td>队员3</td><td>" + m.getName() + "</td><td>" + m.getGrade() + "</td><td>" + m.getCollege() + "</td><td>" + m.getMajor() + "</td><td>" + m.getPhone() + "</td></tr>");
            }
            if (t.getMember4Id() != 0) {
                m = memberIDao.query(Member.class, t.getMember4Id());
                out.print("<tr><td>队员4</td><td>" + m.getName() + "</td><td>" + m.getGrade() + "</td><td>" + m.getCollege() + "</td><td>" + m.getMajor() + "</td><td>" + m.getPhone() + "</td></tr>");
            }
            out.print("<tr><td>项目名称</td><td colspan=\"5\">" + t.getProjectName() + "</td></tr>");
            out.print("<tr><td>项目功能</td><td colspan=\"5\">" + t.getProjectFunction() + "</td></tr>");
            out.print("<tr><td>项目细节</td><td colspan=\"5\">" + t.getProjectDetails() + "</td></tr>");
            out.print("</tbody></table><br />");

        }

    %>

</div>
<div class="tm-wrapper-center">
    <a href="admin/competitionInfo.jsp"
       class="btn btn-success  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i class="fa fa-reply"></i> 返回</a>
    <br/>
</div>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.touchSwipe.min.js"></script>

</body>
</html>