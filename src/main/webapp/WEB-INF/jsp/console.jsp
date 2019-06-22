<%@ page contentType="text/html;charset=UTF-8" language="java"
isELIgnored="false" import="cn.wzc.cloud.domain.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    Object userId = session.getAttribute("userId");
    if (userId == null)
        userId = -1;
    Object uname = session.getAttribute("uname");
    if (uname == null){
        uname = "";
    }
%>
<html>
<head>
    <meta charset="utf-8">
    <title>管理控制台</title>
    <!--<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">-->
    <link href="..cloud_war/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-slider/9.4.1/css/bootstrap-slider.css" rel="stylesheet">

    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="../css/my.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <!--todo 显示个人头像-->
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="/" style="color: orange"><span class="glyphicon glyphicon-globe"></span> <strong>云数据库</strong></a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> <%=uname%></a></li>
        </ul>
    </div>
</nav>
<div class="container" style="padding-top: 10px;">
    <div class="page-header">
        <h2>管理控制台</h2>
    </div>
</div>

<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th>虚拟机名称</th>
            <th>状态</th>
            <th>磁盘（GB）</th>
            <th>内存（GB）</th>
            <th>CPU数量</th>
            <th>IPV4:PORT</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${dbList}" var="db">
                <tr id="${db.getDbId()}">
                    <td>${db.getDbId()}</td>
                    <td id="${db.getDbId()}-state">${db.getState()}</td>
                    <td>${db.getStorage()}</td>
                    <td>${db.getCpu()}</td>
                    <td>${db.getRam()}</td>
                    <td>${db.getIP()}</td>
                    <td>
                        <button class="btn btn-primary" onclick=operateDB(${db.getDbId()},"open")>开机</button>
                        <button class="btn btn-warning" onclick=operateDB(${db.getDbId()},"close")>关机</button>
                        <button class="btn btn-danger" onclick=operateDB(${db.getDbId()},"delete")>删除</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>



<footer class="footer" style="background-color: #373d41">
    <div class="container">
        <div class="row" style="color: white; margin-top: 10px">
            <div class="col-sm-4">联系我们</div>
            <div class="col-sm-4">关于我们</div>
            <div class="col-sm-4">帮助</div>
        </div>
        <!--<p class="text-muted">Place sticky footer content here.</p>-->
    </div>
</footer>
<script type="text/javascript">
    function operateDB(id,state) {
        if (state == "delete"){
            var delteDTO = {"dbId":id};
            $.ajax({
                //修改状态用psot
                type:'DELETE',
                url:'/db',
                contentType:'application/x-www-form-urlencoded',
                data:delteDTO,
                success:function (result) {
                    if (result != null){
                        $("#"+id).remove();
                    }else{
                        alert("稍后重试");
                    }
                },
                error:function () {
                    alert("稍后重试");
                }
            })
        }else{
            var dto = {"dbId":id,"state":state};
            $.ajax({
                //修改状态用psot
                type:'POST',
                url:'/db',
                contentType:'application/x-www-form-urlencoded',
                data:dto,
                success:function (result) {
                    if (result != null){
                        $("#"+id+"-state").html(state);
                    }else{
                        alert("稍后重试");
                    }
                },
                error:function () {
                    alert("稍后重试");
                }
            })
        }

    }
</script>
</body>
</html>