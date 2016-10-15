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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>选择部门----Java兴趣社团～</title>

    <link rel="stylesheet"
          href="font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <link rel="stylesheet" href="css/csc.css">
</head>
<body>

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
</script>
<%
    Cookie[] cookies = request.getCookies();
    String phone = null;
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("phone")) {
                phone = cookie.getValue();
                break;
            }
        }
    }
    if (phone == null) {
        out.print("<script>alert('您还没有账号，请先验证或注册...'); window.location='index.html' </script>");
        //response.sendRedirect("searchByPhone.jsp");
    }
%>

<div class="container-fluid">
    <div class="row tm-section">
        <section class="tm-section-contact">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-xs-center">
                <h2>请选择您要加入的部门</h2>
                <br/>
                <br/>
            </div>
            <br/>
            <div class="tm-wrapper-center col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 ">
                <form action="club/memberChangeDep" method="get"
                      class="tm-contact-form">

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="number" id="phone" name="phone" class="form-control" placeholder="手机" required
                               readonly="readonly"
                               value=<%=phone %>>
                    </div>
                    <br/>
                    <br/>
                    <div style="font-size: 25px">
                        <div id="d0" class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 ">
                            <input type="radio" id="department" name="department" value="0"
                                   checked/> <i class="fa fa-odnoklassniki"></i><span>普通成员</span>
                        </div>
                        <div id="d1" class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 ">
                            <input type="radio" name="department" value="1"/> <i class="fa fa-google"></i>技术部
                        </div>
                        <br/>
                        <div id="d2"
                             class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                            <input type="radio" name="department" value="2"> <i class="fa fa-yelp"></i>秘书部
                        </div>
                        <br/>
                        <div id="d3"
                             class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                            <input type="radio" name="department" value="3"/> <i class="fa fa-modx"></i><span>活动部</span>
                        </div>
                    </div>

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


</body>
</html>