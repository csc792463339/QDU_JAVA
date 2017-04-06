<%@ page import="com.java.bean.Present" %>
<%@ page import="com.java.dao.IDao" %>
<%@ page import="com.java.dao.DaoImpl" %>
<%@ page import="java.util.List" %>
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
                <form action="club/setPresent" method="get"
                      class="tm-contact-form">
                    <select id="preset" name="present"
                            class="form-control text-md-center text-sm-center text-lg-center text-xl-center">
                        <%
                            IDao<Present> dao = new DaoImpl<Present>();
                            List<Present> list = dao.queryAll(Present.class);
                            for (Present p : list) {
                                out.print("<option value=\'" + p.getId() + "\'>" + p.getName() + "</option>");
                            }
                        %>
                    </select>
                    <br/><br/>
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