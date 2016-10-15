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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>信息确认----Java兴趣社团～</title>
</head>

<link rel="stylesheet"
      href="font-awesome-4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/templatemo-style.css">
<link rel="stylesheet" href="css/csc.css">

</head>
<body>
<div class="container-fluid">
    <div class="row tm-section tm-wrapper-center ">
        <section class="tm-section-contact">
            <div
                    class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-xs-center">
                <br/> <br/> <br/>
                <p class="tm-section-intro-text">
                    抱歉!未找到您的信息，<br/>请尝试使用QQ号搜索
                </p>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <form action="club/searchByQQ" method="get" class="tm-contact-form">
                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="number" id="qq" name="member.qq" class="form-control"
                               placeholder="QQ" required/>
                        <br/>
                        <button type="button" onclick="window.location.href='searchByPhone.jsp'"
                                class="btn tm-bordered-btn"><i class="fa fa-chevron-circle-left"></i> 返回
                        </button>

                        <button type="submit" id='btn' class="btn tm-bordered-btn pull-xs-right">提交 <i
                                class="fa fa-check-circle"></i></button>
                    </div>
                </form>
            </div>
        </section>
    </div>

</div>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.touchSwipe.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#qq").blur(function () {
            if (($('#qq').val().length < 5) | $('#qq').val().length > 11) {
                $("#qq").css("background-color", "#A3E496");
                $('#btn').attr('disabled', "true");
            } else {
                $("#qq").css("background-color", "#FFFFFF");
                $('#btn').removeAttr("disabled");
            }
        });
        $('#qq').keyup(function () {
            if (($('#qq').val().length > 4) & ($('#qq').val().length < 11)) {
                $("#qq").css("background-color", "#FFFFFF");
                $('#btn').removeAttr("disabled");
            }
        })
    });
</script>

</body>
</html>