<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
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
    <title>已抢到座位人员信息----Java兴趣社团～</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet"
          href="../font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/csc.css">
</head>
<body>
<%
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/java";
    String username = "csc";
    String password = "csc";
    Connection conn = null;
    ResultSet rs = null;
    int count = 0;
    String num = "1";
    Cookie[] cookies = request.getCookies();
    for (Cookie c : cookies) {
        if (c.getName().equals("booksiteid")) {
            num = c.getValue().trim();
            break;
        }
    }
    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, username, password);
        PreparedStatement pstmt;
        String sql = "SELECT member.id,member.name,member.grade,member.college,member.major,booksite.time from member JOIN booksite ON member.id=booksite.mid WHERE booksite.number=" + num;
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<br/>


<div class="table-responsive">
    <table class="table table-striped" width="100%">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Grade</th>
            <th>College</th>
            <th>Major</th>
            <th>Time</th>
        </tr>
        </thead>
        <tbody>
        <%
            while (rs.next()) {
                count++;
                out.print("<tr>");
                out.print("<td width=10% />" + rs.getString(1) + "</td>");
                out.print("<td width=20% />" + rs.getString(2) + "</td>");
                out.print("<td width=10% />" + rs.getString(3) + "</td>");
                out.print("<td width=20% />" + rs.getString(4) + "</td>");
                out.print("<td width=15% />" + rs.getString(5) + "</td>");
                out.print("<td width=15% />" + rs.getString(6) + "</td>");
                out.print("</tr>");
            }
        %>
        </tbody>
    </table>
</div>
<h2 class="tm-section-title">已抢到座位:<%=count%>
</h2>

<div class="tm-wrapper-center">
    <a href="/admin/bookSiteInfo.jsp"
       class="btn btn-success  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i class="fa fa-reply"></i> 返回</a>
    <br/>
</div>

<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/tether.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.touchSwipe.min.js"></script>

</body>
</html>