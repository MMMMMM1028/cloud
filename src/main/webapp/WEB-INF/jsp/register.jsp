<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>注册账号</title>
    <!--<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">-->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="../css/my.css" rel="stylesheet">
    <!--<style type="text/css">-->
    <!--/*body{*/-->
    <!--/*margin:0px;*/-->
    <!--/*padding:0px;*/-->
    <!--/*}*/-->
    <!--.d1{-->
    <!--position:absolute;-->
    <!--/*width:100%;*/-->
    <!--/*height:100%;*/-->
    <!--z-index:-1;-->
    <!--}-->
    <!--</style>-->
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
        <h1>欢迎注册云数据库</h1>
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
                <input type="password" class="form-control" id="pwd" placeholder="请输入密码">
            </div>
        </div>
        <div class="form-group">
            <label for="pwd" class="col-sm-2  col-sm-offset-2 control-label">确认密码</label>
            <div class="col-sm-5">
                <input type="password" class="form-control"  placeholder="请再次输入密码">
            </div>
        </div>
        <div class="form-group">
            <label for="tell" class="col-sm-2  col-sm-offset-2 control-label">电话</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="tell" placeholder="请输入电话">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-5 text-center">
                <button type="submit" class="btn btn-primary" id="btn-register" style="width: 100%">注册</button>
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
        $("#btn-register").click(function () {
            var uname = $("#uname").val()
            var pwd = $("#pwd").val()
            var dto = {"uname":uname,"pwd":pwd};
            $.ajax({
                type:'PUT',
                contentType:'application/json',
                url:'/user',
                data:JSON.stringify(dto),
                success:function (user) {
                    if (user == null)
                        alert("重试")
                    else{
                        window.location.replace("http://localhost:8080/login");
                    }
                },
                error:function () {
                    alert("稍后重试")
                }
            })
        })
    })
</script>

</body>
</html>