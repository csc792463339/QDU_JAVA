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

    <script src="../js/jquery-1.11.3.min.js"></script>
    <script src="../js/tether.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.touchSwipe.min.js"></script>
    <link rel="stylesheet"
          href="../font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet" href="../css/csc.css">
</head>
<body>
<jsp:useBean id="member" class="com.java.bean.Member" scope="request"></jsp:useBean>

<%
    Cookie id = new Cookie("id", member.getId().toString());
    id.setMaxAge(31536000);
    id.setPath("/");
    response.addCookie(id);
%>

<script>
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
        })

    });
</script>

<div class="container-fluid">
    <div class="row tm-section ">
        <section class="tm-section-contact tm-wrapper-center ">
            <div
                    class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-xs-center">
                <h2 class="tm-section-title">java兴趣社团</h2>
                <p class="tm-section-subtitle">请确认您的信息</p>
            </div>

            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 ">
                <form action="club/confirm" method="post"
                      class="tm-contact-form form-horizontal">
                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        姓名:<input type="text" id="name" name="member.name"
                                  value=<%=member.getName()%> class="form-control"
                                  placeholder="姓名" required/>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        年级:<input type="number" id="grade" name="member.grade"
                                  class="form-control" placeholder="年级"
                                  value=<%=member.getGrade()%> required/>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        学院:<input type="text" id="college" name="member.college"
                                  class="form-control" placeholder="学院"
                                  value=<%=member.getCollege()%> required/>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        专业班级:<input type="text" id="major" name="member.major"
                                    class="form-control" placeholder="专业班级 "
                                    value=<%=member.getMajor()%> required/>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        校区:<input type="text" id="campus" name="member.campus"
                                  class="form-control" placeholder="校区 "
                                  value=<%=member.getCampus() %> required/>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        宿舍:<input type="text" id="dormitory" name="member.dormitory"
                                  class="form-control" placeholder="宿舍 "
                                  value=<%=member.getDormitory() %> required/>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        手机:<input type="number" id="phone" name="member.phone"
                                  class="form-control" placeholder="手机"
                                  value=<%=member.getPhone()%> required/>
                    </div>
                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        QQ:<input type="number" id="QQ" name="member.qq" class="form-control"
                                  placeholder="QQ" value=<%=member.getQq()%> required readonly="readonly"/>
                    </div>

                    <div style="display:none"
                         class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        部门:<input type="text" id="department" name="member.department" class="form-control"
                                  placeholder="department" value=<%=member.getDepartment()%> required/>
                    </div>

                    <div style="display:none"
                         class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        日期:<input type="text" id="date" name="member.date" class="form-control"
                                  placeholder="date" value=<%=member.getDate()%> required/>
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