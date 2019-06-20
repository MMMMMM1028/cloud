<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>云数据库</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
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
    <!--style="background-image: url(https://img.alicdn.com/tps/TB1lygkOVXXXXXvaFXXXXXXXXXX-2880-1080.jpg);background-size: 100%; background-position: center; height: 1"-->
    <div class="jumbotron bg"  >
        <div class="container">
            <h1 style="color: white">云数据库</h1>
            <p style="color: Orange">MySQL 是全球最受欢迎的开源数据库之一，作为开源软件组合 LAMP（Linux + Apache + MySQL + Perl/PHP/Python）
                中的重要一环，广泛应用于各类应用场景。 </p>
            <p style="margin-top: 40px">
                <a class="btn btn-primary btn-lg" href="purchase" role="button">立即购买</a>
                <a class="btn btn-lg btn-default" style="margin-left: 15px" href="console" id="manage-console">管理控制台</a>
            </p>
        </div>
    </div>

    <%--<div class="modal fade" id="console" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">--%>
        <%--<div class="modal-dialog">--%>
            <%--<div class="modal-content">--%>
                <%--<div class="modal-header">--%>
                    <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
                    <%--<h4 class="modal-title" id="myModalLabel">管理控制台（使用ssh工具登陆）</h4>--%>
                <%--</div>--%>
                <%--<div class="modal-body">--%>
                    <%--<div class="table-responsive">--%>
                        <%--<table class="table">--%>
                            <%--<thead>--%>
                            <%--<tr>--%>
                                <%--<th>数据库类型</th>--%>
                                <%--<th>版本</th>--%>
                                <%--<th>IPV4地址</th>--%>
                                <%--<th>磁盘(GB)</th>--%>
                                <%--<th>CPU数量&内存(GB)</th>--%>
                            <%--</tr>--%>
                            <%--</thead>--%>
                            <%--<tbody>--%>
                            <%--<tr>--%>
                                <%--<td>MySql</td>--%>
                                <%--<td>8.0</td>--%>
                                <%--<td>10.1.1.1</td>--%>
                                <%--<td>10</td>--%>
                                <%--<td>1核1G</td>--%>
                            <%--</tr>--%>
                            <%--</tbody>--%>
                        <%--</table>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="modal-footer">--%>
                    <%--<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>--%>
                    <%--<!--<button type="button" class="btn btn-primary">提交更改</button>-->--%>
                <%--</div>--%>
            <%--</div><!-- /.modal-content -->--%>
        <%--</div><!-- /.modal -->--%>
    <%--</div>--%>

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
        //todo 点击后从服务器请求自己购买的
        $("#manage-console").click(function () {

        })
    })
</script>
</body>
</html>