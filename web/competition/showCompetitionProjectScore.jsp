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
    <title>项目得分情况----青岛大学第三届易途杯Java编程大赛</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <link rel="stylesheet"
          href="font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/csc.css">

</head>
<body>
<br/>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-xs-center">
    <h3 class="tm-section-intro-text">项目得分排名<br>只显示前十名</h3>
</div>
<%
    IDao<CompetitionScore> dao = new DaoImpl<CompetitionScore>();
    IDao<CompetitionTeam> dao1 = new DaoImpl<CompetitionTeam>();
    IDao<Member> dao2 = new DaoImpl<Member>();
    List<CompetitionScore> list = dao.queryScore();
    CompetitionTeam t = new CompetitionTeam();
    Member m = new Member();
    int hasShow = 0;
    Cookie[] cookies = request.getCookies();
    String id = "-1";
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("id")) {
                id = cookie.getValue().trim();
                break;
            }
        }
    }
    int mid = Integer.parseInt(id);
%>
<br/>
<div class="table-responsive col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
    <table class="table table-striped " width="100%" style="text-align: center">
        <tbody>
        <%
            int i = 1;
            for (CompetitionScore s : list) {

                t = dao1.query(CompetitionTeam.class, s.getTeamid());
                if (i > 10) {
                    if (mid == -1) {
                        break;
                    }
                    if (mid != t.getLeaderId() && mid != t.getMember1Id() && mid != t.getMember2Id() && mid != t.getMember3Id() && mid != t.getMember4Id()) {
                        continue;
                    }
                }

                out.print("<tr><td colspan=1 style='color:red'><B>第" + (i++) + "名</B></td><td colspan=4 style='color:green'><B>" + t.getTeamName() + "</B></td></tr>");
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
                out.print("<tr><td>评委1:<span style='color:blue'>" + (float) s.getScore1() / 10 + "</span></td><td>评委2:<span style='color:blue'>" + (float) s.getScore2() / 10 + "</span></td><td>评委3:<span style='color:blue'>" + (float) s.getScore3() / 10 + "</span></td><td>评委4:<span style='color:blue'>" + (float) s.getScore4() / 10 + "</span></td><td>特殊加分:<span style='color:blue'>" + (float) s.getSpecial() / 10 + "</span><br/>总分:<span style='color:blue'>" + (float) s.getTotal() / 10 + "</span></td></tr>");
                out.print("<tr><td >评委点评</td><td  colspan=4>" + s.getComment() + "</td></tr>");
                out.print("<tr> <td colspan=6 ></td>  </tr>");
            }
        %>
        </tbody>
    </table>

</div>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.touchSwipe.min.js"></script>

</body>
</html>