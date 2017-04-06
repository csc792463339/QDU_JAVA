<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="java.io.*" %>
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
    <title>团队演讲顺序----青岛大学第三届易途杯Java编程大赛</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <link rel="stylesheet"
          href="font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/csc.css">
</head>
<body>
<%
    String cid = (String) request.getParameter("teamid");
    String order = "";
    try {
        FileInputStream fis = new FileInputStream("c:\\teamOrder.txt");
        InputStreamReader isr = new InputStreamReader(fis, "UTF-8");
        BufferedReader br = new BufferedReader(isr);
        String line = null;
        while ((line = br.readLine()) != null) {
            order += line;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    order = order.trim();
    String[] teams = order.split(";");
%>
<div class="table-responsive">
    <table class="table table-striped " width="100%">
        <thead>
        <tr>
            <th>顺序</th>
            <th>团队名称</th>
            <th>队长</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (String team : teams) {
                out.print("<tr>");
                if (team.split(",")[1].equals(cid)) {
                    out.print("<td style='background-color:yellowgreen'>" + team.split(",")[0] + "</td>");
                    out.print("<td style='background-color:yellowgreen'>" + team.split(",")[2] + "</td>");
                    out.print("<td style='background-color:yellowgreen'>" + team.split(",")[3] + "</td>");
                } else {
                    out.print("<td>" + team.split(",")[0] + "</td>");
                    out.print("<td>" + team.split(",")[2] + "</td>");
                    out.print("<td>" + team.split(",")[3] + "</td>");
                }

                out.print("</tr>");
            }
        %>
        </tbody>
    </table>
</div>
<div class="tm-wrapper-center">
    <a href="competition/showCompetitionProject.jsp"
       class="btn btn-success  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i class="fa  fa-reply "></i> 返回
    </a>
    <br/>
</div>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.touchSwipe.min.js"></script>

</body>
</html>