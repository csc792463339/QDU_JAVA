<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.java.bean.Member" %>
<%@ page import="com.java.dao.*" %>

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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理员页面----Java兴趣社团～</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet"
          href="../font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/csc.css">
</head>
<body>
<%
    IDao<Member> dao = new DaoImpl<Member>();
    HashMap<String, String> m = new HashMap(20);
%>

<br/><br/>
<div class="tm-wrapper-center">
    <h2 class="tm-section-title ">Java兴趣社团</h2>
</div>
<br/>
<div class="tm-wrapper-center">

    <a href="admin/queryTech.jsp"
       class="btn btn-primary  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i class="fa fa-google"></i>
        技术部
    </a>
    <br/>
    <a href="admin/queryClerk.jsp"
       class="btn btn-warning  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i class="fa fa-yelp"></i>
        秘书部
    </a>
    <br/>
    <a href="admin/queryActivity.jsp"
       class="btn btn-danger  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i class="fa fa-modx"></i>
        活动部
    </a>
    <br />
    <a href="/admin/adminInfo.jsp"
       class="btn btn-success  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i class="fa fa-reply"></i> 返回</a>
    <br/>
    <br/>
</div>

<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/tether.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.touchSwipe.min.js"></script>

</body>
</html>