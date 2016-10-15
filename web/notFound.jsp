<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>抱歉,未找到您的信息----Java兴趣社团～</title>

    <link rel="stylesheet"
          href="font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <link rel="stylesheet" href="css/csc.css">

</head>

<body>

<div class="container-fluid">

    <div class="row tm-section">

        <section class="tm-section-contact">
            <br/> <br/> <br/> <br/>
            <div
                    class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-xs-center">
                <p class="tm-section-intro-text">抱歉！仍未找到您的信息,请您重新报名</p>
            </div>
            <br/>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <button type="button" onclick="window.location.href='searchByQQ.jsp'" class="btn tm-bordered-btn"><i
                        class="fa fa-chevron-circle-left"></i> 返回
                </button>
                <a href="memberRegister.jsp" class="btn tm-bordered-btn pull-xs-right"><i class="fa fa-user-plus"></i>重新报名</a>

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