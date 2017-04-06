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

        Cookie[] cookies = request.getCookies();
        String id = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("id")) {
                    id = cookie.getValue();
                    break;
                }
            }
        }
        if (id == null) {
            out.print("<script>alert('您还没有账号，请先验证或注册...'); window.location.href='/member/memberPresent.jsp';</script>");
        }
    %>

</head>
<body>
<br/><br/>
<div class="tm-wrapper-center">
    <h1 class="tm-section-intro-title"><%=t.getTeamName()%>
    </h1>
    <h3 class="center-block">如果你喜欢他(她)们的作品,请在下方点个赞～</h3>
    <h3 class="center-block">每个人只能点一次,且不能取消.(参赛人员不能为自己的项目点赞)</h3>
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
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
        <button id="order" class="btn btn-success  btn-lg pull-left"
                onclick="window.location.href='/competition/competitionOrder.jsp?teamid='+<%=t.getId()%>">
            <i class="fa fa-star"></i>
            <span>演讲顺序</span>
        </button>
        <button id="like" class="btn btn-danger  btn-lg pull-right"><i
                class="fa fa-heartbeat"></i><span><%=t.getLikeCount().split(";").length%> </span>
        </button>
    </div>
    <br/><br/>
</div>

<div style="display: none" id="mid"><%=id%>
</div>

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.touchSwipe.min.js"></script>

<script>
    $().ready(function () {
        $('#like').click(function () {
            $.ajax({
                url: '/competition/likeTeam',
                type: 'POST',
                data: "mid=" + $("#mid").text(),
                success: function () {
                    window.location.reload();
                }
            });
        })
    })
</script>


</body>
</html>