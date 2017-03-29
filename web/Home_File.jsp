<%--
  Created by IntelliJ IDEA.
  User: ZKJ
  Date: 2017/3/18 0018
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<html ng-app>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>基于JFinal+Hadoop+bootstrap+AngularJs的云端文件管理系统</title>

    <style type="text/css">
        body {
            background: url(/images/bg1.jpg) no-repeat 0px 0px;
            font-family: 'Open Sans', sans-serif;
            background-size: cover;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            min-height: 800px;
        }
        .contain {
            width: 1024px;
            height: auto;
            border-style: solid;
            border-color: #2b2b36;
            border-width: 3px;
            background-color: #FFFFFF;
            margin: 0 auto;
            border-radius: 15px;
            -webkit-border-radius: 15px;
            -moz-border-radius: 15px;
            -o-border-radius: 15px;
        }
        .head {
            width: 1024px;
            height: auto;
            margin: 0 auto
        }
        .center {
            width: 100%;
            height: 550px;
            margin: 0 auto;
            padding: 10px;
        }
        label.lbl-1 {
            cursor: pointer;
            background: #9199aa;
            width: 20px;
            height: 20px;
            display: block;
            float: right;
            border-radius: 50%;
            margin: 16px 10px 0px 0px;
        }
        label.lbl-2 {
            cursor: pointer;
            background: #ea569a;
            width: 20px;
            height: 20px;
            display: block;
            float: right;
            border-radius: 50%;
            margin: 16px 10px 0px 0px;
        }
        label.lbl-3 {
            cursor: pointer;
            background: #f1c85f;
            width: 20px;
            height: 20px;
            display: block;
            float: right;
            border-radius: 50%;
            margin: 16px 10px 0px 0px;
        }
        label.lbl-4 {
            cursor: pointer;
            background: #FFFFFF;
            width: 20px;
            height: 20px;
            display: block;
            float: right;
            border-radius: 50%;
            margin: 16px 10px 0px 0px;
        }
        .Title {
            text-align: center;
            padding-top: 1em;
            padding-bottom: 10px;
            font-weight: 500;
            color: #2B2B36;
            font-size: 3em;
        }
        #menu_context{
            width: 80px;
            height: 90px;
            display: none;
            position: absolute;
            background-color:white;
            border-style: groove;
            cursor: pointer;
            border-bottom-left-radius: 10px;
            -webkit-border-bottom-left-radius: 10px;
            -moz-border-bottom-left-radius: 10px;
            -o-border-bottom-left-radius: 10px;
            border-top-left-radius: 10px;
            -webkit-border-top-left-radius: 10px;
            -moz-border-top-left-radius: 10px;
            -o-border-top-left-radius: 10px;"
        border-bottom-right-radius: 10px;
            -webkit-border-bottom-right-radius: 10px;
            -moz-border-bottom-right-radius: 10px;
            -o-border-bottom-right-radius: 10px;
            border-top-right-radius: 10px;
            -webkit-border-top-right-radius: 10px;
            -moz-border-top-right-radius: 10px;
            -o-border-top-right-radius: 10px;"
        }
        .grid_wrapper{
            margin-top: 2em;
            width: 240px;
            height: 240px;
            margin-left: auto;
            margin-right: auto;
        }
        .grid{
            margin-left: 5px;
            margin-top: 5px;
        }
        .grid:after{
            content: ".";
            display: block;
            line-height: 0;
            height: 0;
            clear: both;
            visibility: hidden;
            overflow: hidden;
        }
        .grid a,.grid a:visited{
            float: left;
            display: inline;
            border: 5px solid #ccc;
            width: 80px;
            height: 80px;
            text-align: center;
            line-height: 50px;
            margin-left: -5px;
            margin-top: -5px;
            position: relative;
            z-index: 1;
        }
        .grid a:hover{
            border-color: #f00;
            z-index: 2;
        }
    </style>

</head>
<body ng-controller="MyBody">
<div class="Title"><b>Welcome</b></div>

<div class="contain" id="mainform">

    <!-- 头部 -->
    <div class="head">

        <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"
              style="cursor:pointer; margin-left: 10px;height: 30px;"
              onclick="window.location.href='../index.html'"></span>

        <label class="lbl-1" onclick="lblbrown()" style="margin-right: 30px;"> </label>
        <label class="lbl-2" onclick="lblpink()"> </label>
        <label class="lbl-3" onclick="lblyellow()"> </label>
        <label class="lbl-4" onclick="lblwhite()"> </label>

    </div> <!-- head end -->


    <!-- 中部 -->
    <div class="center">
        <ul class="nav nav-tabs">
            <li role="presentation" ><a href="Home.jsp">Home</a></li>
            <li role="presentation" class="active"><a href="#">File</a></li>
        </ul>

        <div class="center_left" style="width: 50%;height: 400px;float: left;">
             <label class="control-label" style="margin-top: 1em; margin-left:1em;font-size: 24px;">会员等级:</label>    <br>
             <label class="control-label" style="margin-top: 2em; margin-left:1em;">存储空间：会员等级*10G</label>   <br>
            <label class="control-label" style="margin-top: 2em; margin-left:1em;font-size: 24px;">每日任务:</label>    <br>
            <label class="control-label" style="margin-top: 2em; margin-left:1em;">任务一：每日签到</label>   <br>
            <label class="control-label" style="margin-top: 2em; margin-left:1em;">任务二：邮箱验证</label>   <br>
            <label class="control-label" style="margin-top: 2em; margin-left:1em;">任务三：手机验证</label>   <br>
            <label class="control-label" style="margin-top: 2em; margin-left:1em;">任务四：手机验证</label>
        </div>

        <div class="center_right" style="height: 400px;width: 50%;float: left;">
            <label class="control-label" style="margin-top: 1em; margin-left:1em;font-size: 24px; " >会员充值:</label>    <br>
            <div class="grid_wrapper">
                <div class="grid">
                    <a onclick="showImg()" title="1" style="cursor: pointer;">1元</a>
                    <a href="#" title="2" style="cursor: pointer;">5元</a>
                    <a href="#" title="3" style="cursor: pointer;">10元</a>
                    <a href="#" title="4" style="cursor: pointer;">15元</a>
                    <a href="#" title="5" style="cursor: pointer;">20元</a>
                    <a href="#" title="6" style="cursor: pointer;">25元</a>
                    <a href="#" title="7" style="cursor: pointer;">50元</a>
                    <a href="#" title="8" style="cursor: pointer;">80元</a>
                    <a href="#" title="9" style="cursor: pointer;">100元</a>
                </div>
            </div>

        </div>
        <div id="wxImg" style="display:none; right: 120px; top: 50px;back-ground:#f00;position:absolute; z-index:999;">
            <img src="/images/avtar.png" />
        </div>
    </div> <!--center end -->

    <%--<div id="menu_context">--%>
        <%--<ul style="line-height: 40px;list-style-type: none; padding: 0px;margin-left: 5px;border: 2px;">--%>
            <%--<li>download</li>--%>
            <%--<li>delete</li>--%>
        <%--</ul>--%>
    <%--</div>--%>

<%--进度条--%>

        <div class="progress" style="margin-left: 40px;margin-right: 300px;">
        <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="80">
        </div>
        <div class="progress-bar progress-bar-danger" role="progressbar" id="progressbar2" aria-valuemin="0" aria-valuemax="20" >
        </div>
        <span style="float: right;padding-right: 0px;margin-right: 0px;position: absolute;display: inline-block;left: 0px;margin-left: 370px;">
        <s:property value="#session.used"/>G/<s:property value="#session.totalsize"/>G
        </span>
        </div>


    </div> <!-- contain end -->

</div>
</body>
</html>
<script type="text/javascript">
    function lblwhite() {
        var bc = document.getElementById("mainform");
        bc.style.background = "#FFFFFF";
    }
    function lblbrown() {
        var bc = document.getElementById("mainform");
        bc.style.background = "#9199aa";
    }
    function lblpink() {
        var bc = document.getElementById("mainform");
        bc.style.background = "#ea569a";
    }
    function lblyellow() {
        var bc = document.getElementById("mainform");
        bc.style.background = "#f1c85f";
    }
    //进度条
    function getCurrentProgress() {
        var probar=${session.used}/${session.totalsize};
//            var probar = 50;
        if( probar == 100){
            alert("boom!");
        }
        else {
            document.getElementById("progressbar").style.width = probar + "%";
        }
    }
    function  showImg(){
            alert("a");
            document.getElementById("wxImg").style.display='block';
        }
    function hideImg(){
            document.getElementById("wxImg").style.display='none';
        }
</script>

<!-- angularjs插件 -->
<script type="text/javascript" src="/web-plug/AngularJS/angular.min.js"></script>

<!-- jquery插件 -->
<script type="text/javascript" src="/web-plug/jquery.min.js"></script>

<!-- bootstrap插件 -->
<script type="text/javascript" src="/web-plug/bootstrap-3.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/web-plug/bootstrap-3.0.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/web-plug/bootstrap-3.0.0/css/bootstrap.min.css">

<script type="text/javascript" src="/web-plug/jQuery-Form.min.js"></script>
<script>
    window.onload = function () {

        var proaa =<%=session.getAttribute("used")%>;
        var probbb =<%=session.getAttribute("totalsize")%>;

        var probar = (proaa / probbb) * 100;
        //   var probar = 50;
        if (probar == 100) {
            alert("boom!");
        }
        else if(probar<=80){
            document.getElementById("progressbar").style.width = probar + "%";
        }
        else {
            document.getElementById("progressbar").style.width = 0 + "%";
            document.getElementById("progressbar2").style.width = probar + "%";
        }
    }
</script>