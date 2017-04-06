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
    <title>比赛情况----Java兴趣社团～</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet"
          href="../font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/csc.css">
</head>
<body>

<br/><br/>

<br/>
<div class="tm-wrapper-center">
    <a href="competition/queryCompetitionMember.jsp"
       class="btn btn-danger  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i class="fa fa-users"></i>
        报名人员
    </a>
    <br/>
    <a href="competition/queryCompetitionProject.jsp"
       class="btn btn-success  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
            class="fa fa-navicon"></i>
        已提交的项目 </a>
    <br/>
    <a href="admin/setCurrentTeam.jsp"
       class="btn btn-warning  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
            class="fa fa-cloud-upload"></i>
        设置当前演讲团队 </a>
    <br/>
    <a href="../competition/showCompetitionProject.jsp"
       class="btn btn-primary  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i class="fa fa-tv"></i>
        当前项目
    </a>
    <br/>
    <a href="competition/competitionJudge.jsp"
       class="btn btn-success  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
            class="fa fa-navicon"></i>
        评委打分 </a>
    <br/>
    <a href="competition/showCompetitionProjectScore.jsp"
       class="btn btn-primary  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
            class="fa fa-navicon"></i>
        项目得分 </a>
    <br/>
    <a href="competition/showCompetitionProjectLike.jsp"
       class="btn btn-info  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
            class="fa fa-heart"></i>
        项目点赞</a>
    <br/>
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