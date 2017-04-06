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
    <title>当前项目----青岛大学第三届易途杯Java编程大赛</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <link rel="stylesheet"
          href="font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/csc.css">
    <%
        IDao<Member> memberIDao = new DaoImpl<Member>();
        CompetitionTeam t = memberIDao.getCurrentTeam();
    %>

</head>
<body>
<br/><br/>
<div class="tm-wrapper-center">
    <h1 class="tm-section-intro-title"><%=t.getTeamName()%>
    </h1>
    <br/>
</div>
<div class="table-responsive">
    <%
        out.print("<table class=\"table table-striped \" width=\"100%\">");
        out.print("<tbody>");
        Member m = memberIDao.query(Member.class, t.getLeaderId());
        out.print("<tr><td>队长</td><td>" + m.getName() + "</td><td>" + m.getGrade() + "</td><td>" + m.getCollege() + "</td><td>" + m.getMajor() + "</td></tr>");
        if (t.getMember1Id() != 0) {
            m = memberIDao.query(Member.class, t.getMember1Id());
            out.print("<tr><td>队员1</td><td>" + m.getName() + "</td><td>" + m.getGrade() + "</td><td>" + m.getCollege() + "</td><td>" + m.getMajor() + "</td></tr>");
        }
        if (t.getMember2Id() != 0) {
            m = memberIDao.query(Member.class, t.getMember2Id());
            out.print("<tr><td>队员2</td><td>" + m.getName() + "</td><td>" + m.getGrade() + "</td><td>" + m.getCollege() + "</td><td>" + m.getMajor() + "</td></tr>");
        }
        if (t.getMember3Id() != 0) {
            m = memberIDao.query(Member.class, t.getMember3Id());
            out.print("<tr><td>队员3</td><td>" + m.getName() + "</td><td>" + m.getGrade() + "</td><td>" + m.getCollege() + "</td><td>" + m.getMajor() + "</td></tr>");
        }
        if (t.getMember4Id() != 0) {
            m = memberIDao.query(Member.class, t.getMember4Id());
            out.print("<tr><td>队员4</td><td>" + m.getName() + "</td><td>" + m.getGrade() + "</td><td>" + m.getCollege() + "</td><td>" + m.getMajor() + "</td></tr>");
        }
        out.print("<tr><td>项目名称</td><td colspan=\"4\">" + t.getProjectName() + "</td></tr>");
        out.print("<tr><td>项目功能</td><td colspan=\"4\">" + t.getProjectFunction() + "</td></tr>");
        out.print("<tr><td>项目细节</td><td colspan=\"4\">" + t.getProjectDetails() + "</td></tr>");
        out.print("</tbody></table>");
    %>
    <br/>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-wrapper-center">

        <button id="socre" class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 btn btn-danger  btn-lg "
                onclick="window.location.href='/competition/competitionScore.jsp?teamid='+<%=t.getId()%>"><i
                class="fa fa-magic"></i><span> 打分</span>
        </button>
    </div>
    <br/><br/>
</div>

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.touchSwipe.min.js"></script>

<script>
    function setCookie(c_name, value, expiredays) {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + expiredays);
        document.cookie = c_name + "=" + escape(value) + ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString());
    }
    function getCookie(name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");

        if (arr = document.cookie.match(reg))

            return (arr[2]);
        else
            return null;
    }
    $().ready(function () {
        var pass = getCookie("judge");
        if ("judge" != pass) {
            var password = prompt("password");
            if (password != "judge") {
                window.location.href = "/admin/adminInfo.jsp"
            } else {
                setCookie("judge", "judge", "10");
            }
        }
    })
</script>


</body>
</html>