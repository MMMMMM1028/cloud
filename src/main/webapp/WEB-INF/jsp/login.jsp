<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>登陆</title>
    <!--<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">-->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="../css/my.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="/" style="color: orange"><span class="glyphicon glyphicon-globe"></span> <strong>云数据库</strong></a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="./register"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
            <li><a href="./login"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="row text-center" style="margin-bottom: 2%">
        <h1>欢迎登陆云数据库</h1>
    </div>
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="uname" class="col-sm-2 col-sm-offset-2 control-label">账号</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="uname" placeholder="请输入账号">
            </div>
        </div>
        <div class="form-group">
            <label for="pwd" class="col-sm-2  col-sm-offset-2 control-label">密码</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="pwd" placeholder="请输入密码">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-5 text-center">
                <button type="submit" class="btn btn-primary" style="width: 100%" id="btn-login">登陆</button>
            </div>
        </div>
    </form>

</div>

<footer class="footer" style="background-color: #373d41">
    <div class="container">
        <div class="row" style="color: white; margin-top: 10px">
            <div class="col-lg-4">联系我们</div>
            <div class="col-lg-4">关于我们</div>
            <div class="col-lg-4">帮助</div>
        </div>
        <!--<p class="text-muted">Place sticky footer content here.</p>-->
    </div>
</footer>

<script type="text/javascript">
    $(function () {
        $("#btn-login").click(function () {
            var uname = $("#uname").val()
            var pwd = $("#pwd").val()
            $.ajax({
                type:'GET',
                url:'/user',
                data:{
                    uname:uname,
                    pwd:pwd,
                },
                success:function (data) {
                    if (data=null)
                        alert("密码或账号错误")
                    else{
                        //todo 跳转到 session
                    }
                },
                error:function () {
                    alert("稍后重试")
                }
            })
        });
    })
</script>
</body>
</html>