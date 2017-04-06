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
        function isPhone(phone) {
            var pattern = /^1[34578]\d{9}$/;
            return pattern.test(phone);
        }
        function isQQ(QQ) {
            var pattern = /^[1-9]\d{4,10}$/
            return pattern.test(QQ);
        }

        $(document).ready(function () {

            $('#phone').blur(function () {
                $('#divphone').addClass('has-success has-danger');
                if (isPhone($('#phone').val())) {
                    $('#phone').removeClass('form-control-danger');
                    $('#phone').addClass('form-control-success');
                    $('#divphone').removeClass('has-danger');
                    if (isQQ($('#qq').val())) {
                        $('#btn').removeAttr('disabled');
                    }
                } else {
                    $('#phone').removeClass('form-control-success');
                    $('#phone').addClass('form-control-danger');
                    $('#btn').attr("disabled", true);
                }
            });
            $('#phone').keyup(function () {
                if (isPhone($('#phone').val())) {
                    $('#divphone').removeClass('has-danger');
                    $('#phone').removeClass('form-control-danger');
                    $('#phone').addClass('form-control-success');
                    if (isQQ($('#qq').val())) {
                        $('#btn').removeAttr('disabled');
                    }
                }
            });


            $('#qq').blur(function () {
                $('#divqq').addClass('has-danger has-success');
                if (isQQ($('#qq').val())) {
                    $('#qq').removeClass('form-control-danger');
                    $('#qq').addClass('form-control-success');
                    $('#divqq').removeClass('has-danger');
                    if (isPhone($('#phone').val())) {
                        $('#btn').removeAttr('disabled');
                    }
                } else {
                    $('#qq').removeClass('form-control-success');
                    $('#qq').addClass('form-control-danger');
                    $('#btn').attr("disabled", true);
                }
            });
            $('#qq').keyup(function () {
                if (isQQ($('#qq').val())) {
                    $('#qq').removeClass('form-control-danger');
                    $('#qq').addClass('form-control-success');
                    $('#divqq').removeClass('has-danger');
                    if (isPhone($('#phone').val())) {
                        $('#btn').removeAttr('disabled');
                    }
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
                var pass = prompt("此设备已绑定 " + phone + "如要更换请向管理员索要密码");
                if (pass == 'csc') {
                    $("input").removeAttr("readonly");
                } else {
                    alert("密码错误！");
                    location.href = "../index.html";
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
                        <select id="grade" name="member.grade"
                                class="form-control text-md-center text-sm-center text-lg-center text-xl-center">
                            <option value="选择年级">选择年级</option>
                            <option value="2014">2014</option>
                            <option value="2015">2015</option>
                            <option value="2016">2016</option>
                        </select>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <select id="college" name="member.college"
                                class="form-control text-md-center text-sm-center text-lg-center text-xl-center">
                            <option value="选择学院"><a>选择学院</a></option>
                            <option value="数据科学与软件工程学院"><a>数据科学与软件工程学院</a></option>
                            <option value="计算机科学技术学院"><a>计算机科学技术学院</a></option>
                            <option value="机电工程学院"><a>机电工程学院</a></option>
                            <option value="自动化与电气工程学院"><a>自动化与电气工程学院 </a></option>
                            <option value="材料科学与工程学院"><a>材料科学与工程学院</a></option>
                            <option value="物理科学学院"><a>物理科学学院</a></option>
                            <option value="应用技术学院"><a>应用技术学院</a></option>
                            <option value="电子信息学院"><a>电子信息学院</a></option>
                            <option value="数学与统计学院"><a>数学与统计学院</a></option>
                            <option value="化学化工学院"><a>化学化工学院</a></option>
                            <option value="纺织服装学院"><a>纺织服装学院</a></option>
                            <option value="环境科学与工程学院"><a>环境科学与工程学院</a></option>
                            <option value="生命科学学院"><a>生命科学学院</a></option>
                            <option value="商学院"><a>商学院</a></option>
                            <option value="经济学院"><a>经济学院</a></option>
                            <option value="文学院"><a>文学院</a></option>
                            <option value="外语学院"><a>外语学院</a></option>
                            <option value="旅游与地理科学学院"><a>旅游与地理科学学院</a></option>
                            <option value="师范学院"><a>师范学院</a></option>
                            <option value="体育学院"><a>体育学院</a></option>
                            <option value="新闻与传播学院"><a>新闻与传播学院</a></option>
                            <option value="马克思主义学院"><a>马克思主义学院</a></option>
                            <option value="法学院"><a>法学院</a></option>
                            <option value="美术学院"><a>美术学院</a></option>
                            <option value="音乐学院"><a>音乐学院</a></option>
                            <option value="哲学与历史学院"><a>哲学与历史学院</a></option>
                            <option value="政治与公共管理学院"><a>政治与公共管理学院</a></option>
                            <option value="公共外语教育学院"><a>公共外语教育学院</a></option>
                            <option value="国际教育学院"><a>国际教育学院</a></option>
                            <option value="公共卫生学院"><a>公共卫生学院</a></option>
                            <option value="护理学院"><a>护理学院</a></option>
                            <option value="基础医学院"><a>基础医学院</a></option>
                            <option value="口腔医学院"><a>口腔医学院</a></option>
                            <option value="药学院"><a>药学院</a></option>
                            <option value="其他"><a>其他</a></option>
                        </select>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="text" id="major" name="member.major"
                               class="form-control" placeholder="专业班级 " required/>
                    </div>

                    <div
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <select id="campus" name="member.campus"
                                class="form-control text-md-center text-sm-center text-lg-center text-xl-center">
                            <option value="选择校区">选择校区</option>
                            <option value="中心校区">中心校区</option>
                            <option value="东校区">东校区</option>
                        </select>
                    </div>

                    <div style="display: none"
                            class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="text" id="dormitory" name="member.dormitory"
                               class="form-control" placeholder="宿舍 " required value="游客"/>
                    </div>
                    <div id="divphone"
                         class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center  ">
                        <input type="number" id="phone" name="member.phone"
                               class="form-control " placeholder="手机" required/>
                    </div>

                    <div id="divqq"
                         class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-form-group-center">
                        <input type="number" id="qq" name="member.qq" class="form-control"
                               placeholder="QQ" required/>
                    </div>
                    <button type="submit" id="btn" class="btn tm-bordered-btn pull-xs-right">确认</button>
                </form>
            </div>

        </section>

    </div>
</div>


</body>
</html>