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
    <title>选择周次----Java兴趣社团～</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/templatemo-style.css">
    <link rel="stylesheet"
          href="../font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/csc.css">
</head>
<body>
<br/><br/>
<div class="tm-wrapper-center">
    <h2 class="tm-section-title ">Java兴趣社团</h2>
</div>
<br/>

<div class="tm-wrapper-center">
    <div
            class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 text-xs-center">
        <p class="tm-section-intro-text">选择周次</p>
    </div>
    <br/>
</div>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-wrapper-center">
    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10">
        <form class="tm-contact-form">
            <select id="booksite"
                    class="form-control text-md-center text-sm-center text-lg-center text-xl-center">
                <option value="1">第1次</option>
                <option value="2">第2次</option>
                <option value="3">第3次</option>
                <option value="4">第4次</option>
                <option value="5">第5次</option>
                <option value="6">第6次</option>
                <option value="7">第7次</option>
                <option value="8">第8次</option>
                <option value="9">第9次</option>
                <option value="10">第10次</option>
            </select>
        </form>
    </div>
    <br/><br/>
    <a href="admin/queryBookSiteInfo.jsp"
       class="btn btn-success  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i class="fa fa-users"></i>
        已抢到人员
    </a>

</div>


<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/tether.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.touchSwipe.min.js"></script>

<script>
    $(document).ready(function () {
        $('#booksite').change(function () {
            var cookies = "booksiteid="+$(this).val() + ";expires=1111;" + ";path=/";
            document.cookie = cookies;
        })
    });

</script>
</body>
</html>