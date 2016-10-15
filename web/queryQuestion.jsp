<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@page import="com.java.bean.*,com.java.dao.*,java.util.List " %>
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
    <meta name="viewport" content="width=device-width, initial-scale=0.9">
    <title>问题列表----Java兴趣社团～</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <link rel="stylesheet"
          href="font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/csc.css">


    <style>
        table {
            font-size: 20px;
        }

        a {
            font-size: 20px;
        }
    </style>

</head>
<body>

<%
    IDao dao = new DaoImpl<Question>();
    List<Question> questions = dao.queryAll(Question.class);
%>

<div class="table-responsive">
    <table class="table  table-striped " width="100%">
        <thead>
        <tr>
            <th>NO</th>
            <th>Question</th>
            <th>Like</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (int i = 0; i < questions.size(); i++) {
                out.print("<tr>");
                out.print("<td width=5%/>" + questions.get(i).getId() + "</td>");
                out.print("<td width=75%/>" + questions.get(i).getQuestion() + "</td>");
                // out.print("<td width=20%/>" + questions.get(i).getNum() + "</td>");
                out.print("<td width=20%/>" + "<button class=\"btn btn-danger  btn-lg \" id=" + questions.get(i).getId() + ">" + "<i class=\"fa fa-heart \"></i>" + "<span>" + questions.get(i).getNum() + "</span>" + "</button>" + "</td>");
                out.print("</tr>");
            }
        %>
        </tbody>
    </table>

</div>
</div>

<div class="tm-wrapper-center">
    <a href='queryQuestion.jsp' class="btn btn-info  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
            class="fa fa-refresh fa-spin"></i> 刷新页面
    </a>
    <br/>
    <a href='submitQuestion.jsp' class="btn btn-warning  btn-lg col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10"><i
            class="fa fa-question-circle"></i> 我也要提问
    </a>
    <br/>
</div>


<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.touchSwipe.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("button").click(function () {
            $(this).children("span").text(parseInt($(this).children("span").text()) + 1);
            $.ajax({
                url: '/club/likeQuestion',
                type: 'POST',
                data: "id=" + $(this).attr('id'),
                dataType: 'json',
                success: function (data) {
                }
            });
        });
    });
</script>
</body>
</html>