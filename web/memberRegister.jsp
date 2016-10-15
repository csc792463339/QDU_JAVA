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

    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.touchSwipe.min.js"></script>

    <link rel="stylesheet"
          href="font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <link rel="stylesheet" href="css/csc.css">

    <script type="text/javascript">
        if (window.history && window.history.pushState) {
            $(window).on('popstate', function () {
                var hashLocation = location.hash;
                var hashSplit = hashLocation.split("#!/");
                var hashName = hashSplit[1];
                if (hashName !== '') {
                    var hash = window.location.hash;
                }
            });
            window.history.pushState('forward', null, './#java');
        }
        $(document).ready(function () {
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
            });

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
            });

            function getCookie(name) {
                var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
                if (arr = document.cookie.match(reg))
                    return (arr[2]);
                else
                    return null;
            }

            var phone = getCookie('phone');
            if (phone.length == 11) {
                $("input").attr("readonly", "readonly");
                var pass = prompt("此设备已绑定 " + phone + "如要更换请向学长索要密码");
                if (pass == 'csc') {
                    $("input").removeAttr("readonly");
                } else {
                    alert("密码错误！");
                    location.href = "index.html";
                }
            }
        })
    </script>


</head>

<body>


<div class="container-fluid">
    <div class="row tm-section ">
        <section class="tm-section-contact tm-wrapper-center ">

            <div
                    class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-xs-center">

                <p class="tm-section-subtitle">欢迎你加入</p>
                <h3 class="tm-section-title">Java兴趣社团</h3>
                <br/>

            </div>

            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 ">
                <form action="club/memberRegister" method="post"
                      class="tm-contact-form form-horizontal">
                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="text" id="name" name="member.name"
                               class="form-control" placeholder="姓名" required/>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="number" id="grade" name="member.grade"
                               class="form-control" placeholder="年级" required/>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="text" id="college" name="member.college"
                               class="form-control" placeholder="学院" required/>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="text" id="major" name="member.major"
                               class="form-control" placeholder="专业班级 " required/>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="text" id="campus" name="member.campus"
                               class="form-control" placeholder="校区 " required/>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="text" id="dormitory" name="member.dormitory"
                               class="form-control" placeholder="宿舍 " required/>
                    </div>


                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="number" id="phone" name="member.phone"
                               class="form-control" placeholder="手机" required/>
                    </div>
                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="number" id="qq" name="member.qq" class="form-control"
                               placeholder="QQ" required/>
                    </div>
                    <button type="submit" id="btn" class="btn tm-bordered-btn pull-xs-right">确认 <i
                            class="fa fa-check-circle"></i></button>
                </form>
            </div>

        </section>

    </div>
</div>


</body>
</html>