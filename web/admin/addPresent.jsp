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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>现场注册----Java兴趣社团～</title>

    <script src="../js/jquery-1.11.3.min.js"></script>
    <script src="../js/tether.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.touchSwipe.min.js"></script>

    <link rel="stylesheet"
          href="../font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet" href="../css/csc.css">
<body>

<div class="container-fluid">
    <div class="row tm-section tm-wrapper-center ">
        <section class="tm-section-contact">
            <br/> <br/>

            <br/>

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <form action="club/addPresent" method="post"
                      class="tm-contact-form">
                    <div
                         class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="text" name="name"
                               class="form-control" placeholder="活动日期|名称" required/>
                    </div>
                    <br/>
                    <button id='btn' type="submit" class="btn tm-bordered-btn pull-xs-right">确定 <i
                            class="fa fa-check-circle"></i></button>
                </form>
            </div>
        </section>
    </div>

</div>
<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/tether.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.touchSwipe.min.js"></script>
</body>
</html>