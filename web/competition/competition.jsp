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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>青岛大学第三届易途杯JAVA编程大赛</title>
    <link rel="stylesheet"
          href="../font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet" href="../css/csc.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <section class="tm-section-intro">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <div class="tm-wrapper-center">

                    <a href="../competition/showCompetitionProject.jsp"
                       class="tm-btn-white-big col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xl-8"><i class="fa fa-users"></i> 当前演讲团队</a>
                    <br/>

                    <a href="../message/queryMessage.jsp"
                       class="tm-btn-white-big col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xl-8"><i
                            class="fa fa-commenting"></i> 现场留言板</a>
                    <br/>

                    <!--
                    <a href="../competition/showCompetitionProjectScore.jsp"
                       class="tm-btn-white-big col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xl-8"><i
                            class="fa fa-list-ol"></i> 项目得分排名</a>
                    <br/>
                    <a href="../competition/showCompetitionProjectLike.jsp"
                       class="tm-btn-white-big col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xl-8"><i
                            class="fa fa-heart"></i> 项目点赞排名</a>
                    <br/>
                    <br/>
                    -->
                </div>
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
