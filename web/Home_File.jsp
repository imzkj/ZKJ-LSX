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
            min-height: 900px;
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
        .Bottom {
            font-family: 'Exo 2', sans-serif;
            text-align: center;
            padding-top: 1em;
            font-weight: 600;
            color: silver;
            font-size: 2em;
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

    </div> <!--center end -->

    <div id="menu_context">
        <ul style="line-height: 40px;list-style-type: none; padding: 0px;margin-left: 5px;border: 2px;">
            <li>download</li>
            <li>delete</li>
        </ul>
    </div>

    <div class="progress" style="margin-left: 40px;margin-right: 300px;">
        <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
             style="min-width: 2em;">
            0%
        </div>
        <span style="float: right;padding-right: 50px;">0K/10G</span>

    </div>


</div> <!-- contain end -->


<div class="Bottom">基于JFinal+Hadoop+bootstrap+AngularJs的云端文件管理系统</div>
</body>
</html>
<script>

    $('#upload').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('whatever') // Extract info from data-* attributes
// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('.modal-title').text('New message to ' + recipient)
        modal.find('.modal-body input').val(recipient)
    })

    function lblwhite() {
        var bc = document.getElementById("mainform");
        bc.style.background = "#FFFFFF";
    }
    ;
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
    function click(){

    }
    function addFile() {

    }
    function sortType_name() {
        var st= document.getElementById("FileType");
        st.setAttribute("placeholder","According FileName");

    }
    function sortType_context() {
        var st= document.getElementById("FileType");
        st.setAttribute("placeholder","According FileContext");

    }
    function menu_context() {
        var menu = document.getElementById("menu_context");
        document.oncontextmenu = function(ev) {
            var oEvent = ev || event;
            //自定义的菜单显示
            menu.style.display = "block";
            //让自定义菜单随鼠标的箭头位置移动
            menu.style.left = oEvent.clientX + "px";
            menu.style.top = oEvent.clientY + "px";
            //return false阻止系统自带的菜单，
            //return false必须写在最后，否则自定义的右键菜单也不会出现
            return false;
        }
        //实现点击document，自定义菜单消失
        document.onclick = function() {
            menu.style.display = "none";
            document.oncontextmenu=true;
        }

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