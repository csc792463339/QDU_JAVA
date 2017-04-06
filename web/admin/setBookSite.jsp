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
    <title>设置周次----Java兴趣社团～</title>

    <link rel="stylesheet"
          href="../font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet" href="../css/csc.css">


</head>

<body>

<div class="container-fluid">
    <div class="row tm-section tm-wrapper-center ">
        <section class="tm-section-contact">
            <br/> <br/>
            <div
                    class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-xs-center">
                <p class="tm-section-intro-text">选择周次</p>
            </div>
            <br/>

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <form action="club/setBookSite" method="get"
                      class="tm-contact-form">
                    <select id="week" name="booksite"
                            class="form-control text-md-center text-sm-center text-lg-center text-xl-center">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                    <br/>
                    <div class="form-group tm-form-group-center">
                        <input type="num" id="number" name="number"
                               class="form-control" placeholder="数量" required/>
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