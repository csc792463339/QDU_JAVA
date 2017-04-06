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
    <title>各种链接----Java兴趣社团～</title>
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
       class="btn btn-danger  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i class="fa fa-user"></i>
        成员登录|签到
    </a>
    <br/>
    <a href="member/memberRegister.jsp"
       class="btn btn-success  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
            class="fa fa-user-plus"></i>
        新成员注册 </a>
    <br/>
    <a href="member/searchByPhone.jsp"
       class="btn btn-primary  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
            class="fa fa-user-secret"></i>
        成员信息验证|更改 </a>
    <br/>
    <a href="member/memberBookSite.jsp"
       class="btn btn-info  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
            class="fa fa-phone-square"></i>
        座位预订 </a>
    <br/>
    <a href="member/memberChangeDep.jsp"
       class="btn btn-warning  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
            class="fa fa-star"></i>
        加入部门 </a>
    <br/>
    <a href="competition/competitionProjectSubmit.jsp"
       class="btn btn-danger  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
            class="fa fa-upload"></i>
        项目提交 </a>
    <br/>
    <a href="/admin/adminInfo.jsp"
       class="btn btn-success  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i class="fa fa-reply"></i> 返回</a>
    <br/>
</div>

<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/tether.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.touchSwipe.min.js"></script>

</body>
</html>