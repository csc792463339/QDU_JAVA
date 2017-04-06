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
    <title>留言----Java兴趣社团～</title>
</head>

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
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-xs-center">
                <br/>
                <p class="tm-section-intro-text">
                    可留言可吐槽可留下你不成熟的小建议<br/>此留言板根据点赞数排名，小伙伴们轻刷～
                </p>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <form action="club/submitMessage" method="post" class="tm-contact-form">

                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
						<textarea name="message" rows="5" class="form-control"
                                  placeholder="你总得留下点什么吧"
                                  required></textarea>
                    </div>

                    <button type="submit" class="btn tm-bordered-btn pull-xs-right">提交 <i
                            class="fa fa-check-circle "></i></button>
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