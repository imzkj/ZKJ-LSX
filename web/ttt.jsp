<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/21
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
</head>
<body>

<ol class="breadcrumb" style="margin-top: 10px;border-top-width: 0px;margin-bottom: 10px;">
    <li><a href="#">Home</a></li>
    <%--<li><a href="#">Library</a></li>--%>
    <%--<li class="active">Data</li>--%>
</ol>

<script>
    var app = angular.module('myApp', []);
    app.controller('myCtrl', function($scope) {
        $scope.names = ["Google", "Runoob", "Taobao"];
    });
</script>

<script type="text/javascript" src="/web-plug/AngularJS/angular.min.js"></script>
</body>
</html>
