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
    <title>信息确认----Java兴趣社团～</title>

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
            <br/> <br/> <br/> <br/>
            <div
                    class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-xs-center">
                <p class="tm-section-intro-text">请输入您的手机号</p>
            </div>
            <br/>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <form action="club/searchByPhone" method="get"
                      class="tm-contact-form">
                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="number" id="phone" name="member.phone"
                               class="form-control" placeholder="手机" required/>
                    </div>
                    <button id='change' type="button" class="btn tm-bordered-btn"><i class="fa fa-repeat"></i> 更改账号
                    </button>
                    <button id='btn' type="submit" class="btn tm-bordered-btn pull-xs-right">提交 <i
                            class="fa fa-check-circle"></i></button>
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
        $('#change').hide();
        $("#phone").blur(function () {
            if ($('#phone').val().length !== 11) {
                $("#phone").css("background-color", "#A3E496");
                $('#btn').attr('disabled', "true");
            } else {
                $("#phone").css("background-color", "#FFFFFF");
                $('#btn').removeAttr("disabled");
            }
        });
        $('#phone').keyup(function () {
            if ($('#phone').val().length == 11) {
                $("#phone").css("background-color", "#FFFFFF");
                $('#btn').removeAttr("disabled");
            }
        })
        function getCookie(name) {
            var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
            if (arr = document.cookie.match(reg))
                return (arr[2]);
            else
                return null;
        }

        var phone = getCookie('phone');
        if (phone.length == 11) {
            $('#change').show();
            $("#phone").val(phone);
            $("#phone").attr("readonly", true);
        }
        ;

        $('#change').click(function () {
            var pass = prompt("请向学长索要密码");
            if (pass == 'csc') {
                $('#phone').removeAttr('readonly');
            } else {
                alert("密码错误！");
            }
        });
    });
</script>
</body>
</html>