<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>购买云数据库</title>
    <!--<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">-->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-slider/9.4.1/css/bootstrap-slider.css" rel="stylesheet">

    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-slider/9.4.1/bootstrap-slider.min.js"></script>


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
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("uname")%></a></li>
            </ul>
        </div>
    </nav>
    <div class="container" style="padding-top: 10px;">
        <div class="page-header">
            <h2>云数据库 <small>配置选项</small></h2>
        </div>
    </div>
    <!--基本配置-->
    <div class="container config" id="basicConfig" style="height: 13em">
        <!--<div class="row">-->
            <div class="col-sm-1" style="height: 13em;" >
                <p class="text-center config-type" style="writing-mode:tb-rl; height: 13em">基本配置</p>
            </div>
            <!--基本配置选项-->
            <div class="col-sm-11">
                <!--地域-->
                <div class="row">
                    <div class="col-sm-2">
                        <p>地域</p>
                    </div>
                    <div class="col-sm-7">
                        <div class="btn-group" id="region" data-toggle="buttons">
                            <label class="btn btn-primary" id="region1">
                                <input type="radio" name="regions" id="1" checked="checked" value="华东1"> 华东1
                            </label>
                            <label class="btn btn-default" id="region2" >
                                <input type="radio" name="regions" id="2" value="华东2"> 华东2
                            </label>
                            <label class="btn btn-default" id="region3" >
                                <input type="radio" name="regions" id="3" value="华北1"> 华北1
                            </label>
                        </div>
                    </div>
                </div>
                <!--数据库类型-->
                <div class="row">
                    <div class="col-sm-2">
                        <p>数据库类型</p>
                    </div>
                    <div class="col-sm-7">
                        <div class="btn-group" id="dbType" data-toggle="buttons">
                            <label class="btn btn-primary" id="dbType1">
                                <input type="radio" name="types" id="option1" value="MySql" checked="checked"> MySql
                            </label>
                        </div>
                    </div>
                </div>
                <!--版本-->
                <div class="row">
                    <div class="col-sm-2">
                        <p>版本</p>
                    </div>
                    <div class="col-sm-7">
                        <div class="btn-group" id="dbVersion" data-toggle="buttons">
                            <label class="btn btn-primary" id="version1">
                                <input type="radio" name="versions" id="v1" value="8.0" checked="checked"> 8.0
                            </label>
                            <label class="btn btn-default" id="version2">
                                <input type="radio" name="versions" id="v2" value="5.7"> 5.7
                            </label>
                            <label class="btn btn-default" id="version3">
                                <input type="radio" name="versions" id="v3" value="5.6"> 5.6
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        <!--</div>-->
    </div>

    <!--实力规格-->
    <div class="container config"  id="instanceSpecification" style="height: 6em">
        <div class="col-sm-1"style="height: 6em" >
            <p class="config-type text-center" style="writing-mode:tb-rl;height: 6em" >实例规格</p>
        </div>
        <div class="col-sm-11">
            <div class="row">
                <div class="col-sm-2">
                    <p>规格</p>
                </div>
                <div class="col-sm-7">
                    <div class="btn-group" id="specification" data-toggle="buttons">
                        <label class="btn btn-primary" id="specification1">
                            <!--value为单价-->
                            <input type="radio" name="specifications" id="s1" value="1核1G" checked="checked"> 1核1G
                        </label>
                        <label class="btn btn-default" id="specification2">
                            <!--value为单价-->
                            <input type="radio" name="specifications" id="s2" value="1核2G"> 1核2G
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--存储空间--%>
    <div class="container config"  id="storege" style="height: 6em">
        <div class="col-sm-1"style="height: 6em" >
            <p class="config-type text-center" style="writing-mode:tb-rl;height: 6em" >存储空间</p>
        </div>
        <div class="col-sm-11">
            <div class="row">
                <div class="col-sm-2">
                    <p>存储空间</p>
                </div>
                <div class="col-sm-7">
                    <input  id="ex3" data-slider-id="ex3Slider" type="text"
                            data-provide="slider"
                            data-slider-min="50"
                            data-slider-max="200"
                            data-slider-ticks="[50,100,150,200]"
                            data-slider-ticks-labels='["50GB", "100GB", "150GB", "200GB"]'
                            data-slider-step="50"
                            data-slider-value="50"
                            style="width: 300px"
                    />
                </div>
            </div>
        </div>
    </div>

    <!--购买量-->
    <div class="container config"  id="purchase-amount" style="height: 6em">
        <div class="col-sm-1"style="height: 6em" >
            <p class="config-type text-center" style="writing-mode:tb-rl;height: 6em" >购买量</p>
        </div>
        <div class="col-sm-11">
            <div class="row">
                <div class="col-sm-2">
                    <p>购买时长</p>
                </div>
                <div class="col-sm-7">
                    <input  id="ex2" data-slider-id="ex2Slider" type="text"
                            data-provide="slider"
                            data-slider-min="1"
                            data-slider-max="12"
                            data-slider-ticks="[1, 2, 3,4,5,6,7,8,9,10,11,12]"
                            data-slider-ticks-labels='["1个月", "2个月", "3个月", "4个月", "5个月", "6个月", "7个月", "8个月", "9个月", "10个月", "11个月", "12个月"]'
                            data-slider-step="1"
                            data-slider-value="1"
                            style="width: 500px"
                    />
                </div>
            </div>
        </div>
    </div>

    <div class="container" id="total-price">
        <div class="col-sm-6 col-sm-offset-4" >
            <button id="btn-purchase" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#current-config">
                立即购买
            </button>
        </div>
    </div>

    <div class="modal fade" id="current-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        当前配置
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>类型</th>
                                <th>配置</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>地域</td>
                                <td id="cur-region">华北1</td>
                            </tr>
                            <tr>
                                <td>数据库类型</td>
                                <td id="cur-type">MySql</td>
                            </tr>
                            <tr>
                                <td>版本</td>
                                <td id="cur-version">8.0</td>
                            </tr>
                            <tr>
                                <td>规格</td>
                                <td id="cur-specification">1核1G</td>
                            </tr>
                            <tr>
                                <td>存储空间</td>
                                <td id="cur-storage">100G</td>
                            </tr>
                            <tr>
                                <td>购买时长</td>
                                <td id="cur-time">10个月</td>
                            </tr>
                            <tr>
                                <td>配置费用</td>
                                <td class="strong" style="color: orange;font-size: xx-large" id="cur-price">￥1710</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" id="btn-confirm-purchase">
                        确认购买
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
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
        $(function(){
            //地域
            $("#region1").click(function(){
                $("#region .btn").addClass("btn-default").removeClass("btn-primary");
                $("#region1").addClass("btn-primary");
            })
            $("#region2").click(function(){
                $("#region .btn").addClass("btn-default").removeClass("btn-primary");
                $("#region2").addClass("btn-primary");
            })
            $("#region3").click(function(){
                $("#region .btn").addClass("btn-default").removeClass("btn-primary");
                $("#region3").addClass("btn-primary");
            })


            //版本
            $("#version1").click(function(){
                $("#dbVersion .btn").addClass("btn-default").removeClass("btn-primary");
                $("#version1").addClass("btn-primary");
            })
            $("#version2").click(function(){
                $("#dbVersion .btn").addClass("btn-default").removeClass("btn-primary");
                $("#version2").addClass("btn-primary");
            })
            $("#version3").click(function(){
                $("#dbVersion .btn").addClass("btn-default").removeClass("btn-primary");
                $("#version3").addClass("btn-primary");
            })


            //规格
            $("#specification1").click(function(){
                $("#specification .btn").addClass("btn-default").removeClass("btn-primary");
                $("#specification1").addClass("btn-primary");
            })
            $("#specification2").click(function(){
                $("#specification .btn").addClass("btn-default").removeClass("btn-primary");
                $("#specification2").addClass("btn-primary");
            })
            //

            var region;
            var type;
            var version;
            var specification;
            var storage;
            var time;
            var totalPrice;
            $("#btn-purchase").click(function () {
                region = $("#region input[name='regions']:checked").val();
                type = $("#dbType input[name='types']:checked").val();
                version = $("#dbVersion input[name='versions']:checked").val();
                specification =$("#specification input[name='specifications']:checked").val();
                storage = Number($("#ex3").val());
                time = Number($("#ex2").val());
                var price = 10;
                if (specification == "1核2G")
                {
                     price = 15
                }
                totalPrice = ((price+2*storage*(1-storage/1000))*time*(1-time/100)).toFixed(2);

                $("#cur-region").html(region);
                $("#cur-version").html(version);
                $("#cur-type").html(type);
                $("#cur-specification").html(specification);
                $("#cur-storage").html(storage+"GB");
                $("#cur-time").html(time+"个月");
                $("#cur-price").html("￥"+totalPrice);
                // alert("region:  "+region+"\n"+"type:  "+type+"\n"+"version:  "+version+"\n"+"specification:  "+specification+"\n"+"storage:  "+storage +"\n"+"time:  "+time+"\n"+"price:  "+price+"\n"+"total:  "+totalPrice)
            })
            $("#btn-confirm-purchase").click(function () {
                //todo  session 用户信息
                var cpu = 1;
                var ram = 1;
                if (specification == "1核2G"){
                    ram = 2
                }
                var dto = {"version":version,"ram":ram,"cpu":cpu,"storage":storage,"type":type}
                // alert(JSON.stringify(dto))
                $.ajax({
                    type:'PUT',
                    url:'/db',
                    contentType:'application/json',
                    data:JSON.stringify(dto),
                    success:function (data) {
                        if (data==null)
                            alert("稍后重试")
                        else{
                            alert("购买成功")
                            $("#current-config").modal("hide")
                        }
                    },
                    error:function () {
                        alert("稍后重试")
                    }
                })
            })
        });


    </script>
</body>
</html>