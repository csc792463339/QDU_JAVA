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
    <meta name="viewport" content="width=device-width, initial-scale=0.9">
    <title>建议列表----Java兴趣社团～</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet"
          href="../font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/csc.css">


    <style>
        table {
            font-size: 20px;
        }

        a {
            font-size: 20px;
        }
    </style>

</head>
<body>

<%
    IDao dao = new DaoImpl<Suggest>();
    List<Suggest> suggests = dao.queryAll(Suggest.class);
%>

<div class="table-responsive">
    <table class="table  table-striped " width="100%">
        <thead>
        <tr>
            <th>NO</th>
            <th>MId</th>
            <th>Suggest</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (int i = 0; i < suggests.size(); i++) {
                out.print("<tr>");
                out.print("<td width=5%/>" + suggests.get(i).getId() + "</td>");
                out.print("<td width=10%/>" + suggests.get(i).getMid() + "</td>");
                out.print("<td width=75%/>" + suggests.get(i).getSuggest() + "</td>");
                out.print("</tr>");
            }
        %>
        </tbody>
    </table>

</div>


<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/tether.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.touchSwipe.min.js"></script>

</body>
</html>