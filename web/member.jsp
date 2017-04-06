<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

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
    <title>社团成员----Java兴趣社团～</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet"
          href="../font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/csc.css">
</head>
<body>

<br/><br/>
<div class="tm-wrapper-center">
    <a href="member/memberPresent.jsp"
       class="btn btn-danger  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i class="fa fa-users"></i>
        成员签到
    </a>
    <br/>
    <a href="member/memberRegister.jsp"
       class="btn btn-success  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
            class="fa fa-users"></i>
        新成员注册 </a>
    <br/>
    <a href="member/searchByPhone.jsp"
       class="btn btn-primary  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
            class="fa fa-users"></i>
        成员信息验证|更改 </a>
    <br/>
  <a href="../message/queryMessage.jsp"
       class="btn btn-warning  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i class="fa fa-comments"></i>
        留言板
    </a>
</div>

<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/tether.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.touchSwipe.min.js"></script>

</body>
</html>