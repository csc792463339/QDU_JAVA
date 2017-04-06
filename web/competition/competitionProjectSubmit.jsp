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
    <title>比赛项目提交----青岛大学第三届易途杯Java编程大赛</title>
    <script src="../js/jquery-1.11.3.min.js"></script>
    <script src="../js/tether.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.touchSwipe.min.js"></script>

    <link rel="stylesheet"
          href="../font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet" href="../css/csc.css">

    <script type="text/javascript">
        alert("项目只需团队队长提交一次即可.不需要上传项目文件,只要填写项目信息即可.");
        var count;
        window.onload = function () {
            count = 1;
            $("#member2").hide();
            $("#member3").hide();
            $("#member4").hide();
            $("#member5").hide();
        }
        function hide1() {
            count--;
            if (count <= 1) {
                count = 1;
            }
            switch (count) {
                case 1 :
                    $("#member2").hide();
                    $('#m2phone').val("");
                    $("#m2name").val("");
                    $("#m2id").val("");
                    break;
                case 2 :
                    $("#member3").hide();
                    $('#m3phone').val("");
                    $("#m3name").val("");
                    $("#m3id").val("");
                    break;
                case 3 :
                    $("#member4").hide();
                    $('#m4phone').val("");
                    $("#m4name").val("");
                    $("#m4id").val("");
                    break;
                case 4 :
                    $("#member5").hide();
                    $('#m5phone').val("");
                    $("#m5name").val("");
                    $("#m5id").val("");
                    break;
                default :
                    break;
            }
        }
        function show1() {
            count++;
            if (count >= 5) {
                count = 5;
            }
            switch (count) {
                case 2 :
                    $("#member2").show();
                    break;
                case 3 :
                    $("#member3").show();
                    break;
                case 4 :
                    $("#member4").show();
                    break;
                case 5 :
                    $("#member5").show();
                    break;
                default :
                    break;
            }
        }
        $(function () {
            $('#m1phone').blur(function () {
                $.ajax({
                    url: '/getMember/getMember',
                    type: "post",
                    data: "phone=" + $(this).val(),
                    dataType: 'json',
                    success: function (data) {
                        var name = data.toString().split(',')[0];
                        var id = data.toString().split(',')[1];
                        if (data != 'null') {
                            $('#m1name').val(name);
                            $('#m1id').val(id)
                        } else {
                            alert("抱歉！未找到该同学的信息，请先报名～")
                            $('#m1phone').val("");
                            $("#m1name").val("");
                            $("#m1id").val("");
                        }
                    }
                });
            });

            $('#m2phone').blur(function () {
                $.ajax({
                    url: '/getMember/getMember',
                    type: "post",
                    data: "phone=" + $(this).val(),
                    dataType: 'json',
                    success: function (data) {
                        var name = data.toString().split(',')[0];
                        var id = data.toString().split(',')[1];
                        if (data != 'null') {
                            $('#m2name').val(name);
                            $('#m2id').val(id)
                        } else {
                            alert("抱歉！未找到该同学的信息，请先报名～")
                            $('#m2phone').val("");
                            $("#m2name").val("");
                            $("#m2id").val("");
                        }
                    }
                });
            });

            $('#m3phone').blur(function () {
                $.ajax({
                    url: '/getMember/getMember',
                    type: "post",
                    data: "phone=" + $(this).val(),
                    dataType: 'json',
                    success: function (data) {
                        var name = data.toString().split(',')[0];
                        var id = data.toString().split(',')[1];
                        if (data != 'null') {
                            $('#m3name').val(name);
                            $('#m3id').val(id)
                        } else {
                            alert("抱歉！未找到该同学的信息，请先报名～")
                            $('#m3phone').val("");
                            $("#m3name").val("");
                            $("#m3id").val("");
                        }
                    }
                });
            });

            $('#m4phone').blur(function () {
                $.ajax({
                    url: '/getMember/getMember',
                    type: "post",
                    data: "phone=" + $(this).val(),
                    dataType: 'json',
                    success: function (data) {
                        var name = data.toString().split(',')[0];
                        var id = data.toString().split(',')[1];
                        if (data != 'null') {
                            $('#m4name').val(name);
                            $('#m4id').val(id)
                        } else {
                            alert("抱歉！未找到该同学的信息，请先报名～")
                            $('#m4phone').val("");
                            $("#m4name").val("");
                            $("#m4id").val("");
                        }
                    }
                });
            });


            $('#m5phone').blur(function () {
                $.ajax({
                    url: '/getMember/getMember',
                    type: "post",
                    data: "phone=" + $(this).val(),
                    dataType: 'json',
                    success: function (data) {
                        var name = data.toString().split(',')[0];
                        var id = data.toString().split(',')[1];
                        if (data != 'null') {
                            $('#m5name').val(name);
                            $('#m5id').val(id)
                        } else {
                            alert("抱歉！未找到该同学的信息，请先报名～")
                            $('#m5phone').val("");
                            $("#m5name").val("");
                            $("#m5id").val("");
                        }
                    }
                });
            });

        });
    </script>


</head>

<body>


<div class="container-fluid">
    <div class="row tm-section ">
        <section class="tm-section-contact tm-wrapper-center ">

            <div
                    class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-xs-center">

                <p class="tm-section-title">青岛大学第三届易途杯JAVA编程大赛</p>
                <h3 class="tm-section-intro-text">比赛项目提交</h3>
                <br/>

            </div>
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 ">
                <form action="competition/comitTeam" method="post"
                      class="tm-contact-form form-horizontal">
                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="text" name="team.teamName"
                               class="form-control" placeholder="团队名称" required>
                    </div>
                    <div id="member1"
                         class="form-group row col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">

                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-xl-8 ">
                            <input type="text" id="m1phone" name="team.leaderPhone"
                                   class="form-control mphone" placeholder="队长手机号" required>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                            <input type="text" id="m1name"
                                   class="form-control" placeholder="队长姓名" readonly>
                            <input type="number" id="m1id" name="team.leaderId" hidden readonly>
                        </div>
                    </div>
                    <div id="member2"
                         class="form-group row col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-xl-8 ">
                            <input type="text" id="m2phone"
                                   class="form-control mphone" placeholder="成员1手机号">
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                            <input type="text" id="m2name"
                                   class="form-control" placeholder="成员1姓名" readonly>
                            <input type="number" id="m2id" name="team.member1Id" hidden readonly>
                        </div>
                    </div>
                    <div id="member3"
                         class="form-group row col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-xl-8 ">
                            <input type="text" id="m3phone"
                                   class="form-control mphone" placeholder="成员2手机号">
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                            <input type="text" id="m3name"
                                   class="form-control" placeholder="成员2姓名" readonly>
                            <input type="number" id="m3id" name="team.member2Id" hidden readonly>
                        </div>
                    </div>
                    <div id="member4"
                         class="form-group row col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-xl-8">
                            <input type="text" id="m4phone"
                                   class="form-control mphone" placeholder="成员3手机号 ">
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                            <input type="text" id="m4name"
                                   class="form-control" placeholder="成员3姓名" readonly>
                            <input type="number" id="m4id" name="team.member3Id" hidden readonly>
                        </div>
                    </div>
                    <div id="member5"
                         class="form-group row col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-xl-8 ">
                            <input type="text" id="m5phone"
                                   class="form-control mphone" placeholder="成员4手机号">
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                            <input type="text" id="m5name"
                                   class="form-control" placeholder="成员4姓名" readonly>
                            <input type="number" id="m5id" name="team.member4Id" hidden readonly>
                        </div>
                    </div>
                    <div
                            class="form-group row col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xl-6">
                            <button type="button" class="btn tm-bordered-btn pull-right" onclick="show1()"><i
                                    class="fa fa-user-plus" aria-hidden="true"></i></button>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xl-6">
                            <button type="button" class="btn tm-bordered-btn" onclick="hide1()"><i
                                    class="fa fa-user-times" aria-hidden="true"></i></button>
                        </div>
                    </div>
                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="text" name="team.projectName"
                               class="form-control" placeholder="项目名称" required>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <textarea rows="5" class="form-control" placeholder="项目可实现的功能" name="team.projectFunction"
                                  required></textarea>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <textarea rows="2" class="form-control"
                                  placeholder="项目细节(请列举出该项目所使用的第三方Jar包,并说明其功能.如果没有请填写：无.)例:sqljdbc.jar--数据库连接驱动"
                                  name="team.projectDetails"
                                  required></textarea>
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