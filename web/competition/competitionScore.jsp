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
    <meta name="viewport" content="width=device-width, initial-scale=0.6">
    <title>项目打分----青岛大学第三届易途杯Java编程大赛</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <link rel="stylesheet"
          href="font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/csc.css">
</head>
<body>
<%
    String cid = (String) request.getParameter("teamid");
%>
<div class="container-fluid">
    <div class="row tm-section ">
        <section class="tm-section-contact tm-wrapper-center ">
            <div
                    class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-xs-center">
                <h3 class="tm-section-intro-text">评委打分</h3>
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 ">
                <form action="competition/competitionScore" method="post"
                      class="tm-contact-form form-horizontal">
                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="number" name="score.teamid" value=<%=cid%>
                                class="form-control" placeholder="团队ID" readonly hidden="hidden">
                    </div>
                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="number" name="score.score1"
                               class="form-control" placeholder="评委1打分" required>
                    </div>
                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="number" name="score.score2"
                               class="form-control" placeholder="评委2打分" required>
                    </div>
                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="number" name="score.score3"
                               class="form-control" placeholder="评委3打分" required>
                    </div>
                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="number" name="score.score4"
                               class="form-control" placeholder="评委4打分" required>
                    </div>
                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="number" name="score.special"
                               class="form-control" placeholder="特殊加分" required>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                      <textarea type="text" rows="4" name="score.comment"
                                class="form-control" placeholder="点评(请给出优点和不足)" required></textarea>
                    </div>
                    <br/>
                    <button type="submit" id="btn" class="btn tm-bordered-btn pull-xs-right">确认 <i
                            class="fa fa-check-circle"></i></button>
                </form>
            </div>
        </section>
    </div>
</div>
</body>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.touchSwipe.min.js"></script>


</html>