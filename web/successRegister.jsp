<%@ page import="java.net.URLDecoder" %>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册成功----Java兴趣社团～</title>

    <link rel="stylesheet"
          href="font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <link rel="stylesheet" href="css/csc.css">
</head>
<body>

<%
    String name = URLDecoder.decode((String) request.getSession().getAttribute("name"), "utf-8");
%>
<div class="container-fluid">
    <div class="row">
        <section class="tm-section-intro">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <div class="tm-wrapper-center">
                    <h1 class="tm-section-intro-title">欢迎<%=name%>同学加入社团！</h1>
                    <br/>
                </div>
                <div class="tm-wrapper-center">
                    <a href="submitQuestion.jsp"
                       class="tm-btn-white-big col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
                            class="fa fa-question-circle"></i> 向学长提问!</a>
                    <br/> <a href="queryQuestion.jsp"
                             class="tm-btn-white-big col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
                        class="fa fa-comments"></i> 查看留言板</a>

                </div>
            </div>
        </section>

    </div>
</div>

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.touchSwipe.min.js"></script>


</body>
</html>