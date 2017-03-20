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

        .center_left {
            width: 30%;
            height: 450px;;
            margin: 0 auto;
            padding: 10px;
            float: left;
        }

        .center_right {
            width: 70%;
            height: 450px;;
            margin: 0 auto;
            padding: 10px;
            float: left;
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
            <li role="presentation" class="active"><a href="#">Home</a></li>
            <li role="presentation"><a href="File.jsp">File</a></li>
        </ul>

        <div class="center_left">

            <div class="col-sm-6 col-md-4" style="margin-top: 20px;width:280px;">
                <div class="thumbnail">
                    <img src="/images/person299.svg" alt="个人图片" style="width:160px;height: 200px;">
                    <div class="caption">
                        <h5>UserName:<font color="red"><s:property value="username"/></font> </h5>
                        <h5>E_mail:<font color="red"><s:property value="email"/></font></h5>
                        <h5>PhoneNumber:<font color="red"><s:property value="phonenum"/></font></h5>
                        <p><button type="file" class="btn btn-primary" id="modifyPhoto" name="modifyPhoto">Modify Photo</button></p>
                    </div>
                </div>
            </div>



        </div>
        <div class="center_right" style="margin-top: 1em;">

            <table id="sort" cellpadding="5px;">
                <tr>
                    <th>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#upload"
                                data-whatever="upload" >Upload
                        </button>

                        <div class="modal fade" id="upload" tabindex="-1" role="dialog" aria-labelledby="uploadLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                                aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="uploadLabel">New File</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form action="upload">
                                            <div class="form-group">

                                                <input type='text' name='textfield' id='textfield' class='txt' />
                                                <input type="file" name="fileField" class="file" id="fileField" size="28" onchange="document.getElementById('textfield').value=this.value" />

                                                <label class="control-label">File_input:</label>
                                                <input type="file" id="uploadfile" style="margin-bottom: 1em;" id="local_path" name="localPath1">
                                                <label class="control-label">Upload_path:</label>

                                                <textarea class="form-control" id="input-text" name="dbPath1" placeholder="address"></textarea>
                                                <%--<select class="form-control" >--%>
                                                    <%--<option value="C">C:\</option>--%>
                                                    <%--<option value="D">D:\</option>--%>
                                                <%--</select>--%>
                                                <%--<input type="text" class="form-control" id="upload_path">--%>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Confirm</button>
                                            </div>
                                            <%--<div class="form-group">--%>
                                                <%--<label for="message-text" class="control-label">Message:</label>--%>
                                                <%--<textarea class="form-control" id="message-text"></textarea>--%>
                                            <%--</div>--%>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </th>
                    <th>
                        <div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" type="button" id="sortType"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                sortType
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="sortType">
                                <li ><a onclick="sortType_name()">According FileName</a></li>
                                <li ><a onclick="sortType_context()">According FileContext</a></li>
                                <!--<li><a href="#">Something else here</a></li>-->
                                <!--<li role="separator" class="divider"></li>-->
                                <!--<li><a href="#">Separated link</a></li>-->
                            </ul>
                        </div>
                    </th>
                    <form action="">
                    <th><input type="text" class="form-control" id="FileType" placeholder="According FileType" style="width:400px;"></th>
                    <th><input class="btn btn-default" type="submit" value="Search"></th>
                    </form>
                </tr>
            </table>

            <ol class="breadcrumb" style="margin-top: 1em;">
                <li><a href="#">Home</a></li>
                <%--<li><a href="#">Library</a></li>--%>
                <%--<li class="active">Data</li>--%>
            </ol>
            <div style="overflow-x: auto; overflow-y: auto; height: 350px; width:680px;">
            <table class="table table-hover" id="fileTable" width="680px" height="350px">
                <tr>
                    <th style="width:20px">filename</th>
                    <th style="width:20px">tag</th>
                    <th style="width:20px" >size</th>
                </tr>
                <s:iterator value="fileslist" >
                    <tr>
                        <td><s:property value="filename"/></td>
                        <td><s:property value="dbpath"/></td>
                        <td><s:property value="owner"/></td>
                        <td><s:property value="tag"/></td>
                        <td><s:if test='type=="s"'><img src="images/file.jpg"></s:if>
                            <s:elseif test='type=="f"'><img src="images/avtar.png"></s:elseif>
                        </td>
                    </tr>
                </s:iterator>
            </table>
            </div>

            <div id="menu_context">
                <ul style="line-height: 40px;list-style-type: none; padding: 0px;margin-left: 5px;border: 2px;">
                    <li>download</li>
                    <li>delete</li>
                </ul>
            </div>

            <nav aria-label="Page navigation" style="margin-left: 5em;margin-right: 5em; ">
                <ul class="pagination" style="margin-left: 5em;margin-right: 5em; ">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div> <!--center end -->


    <div class="progress" style="margin-left: 40px;margin-right: 300px;">
        <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
             style="min-width: 2em;">
            0%
        </div>
        <span style="float: right;padding-right: 50px;">0K/1024G</span>

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
