<%--
  Created by IntelliJ IDEA.
  User: ZKJ
  Date: 2017/3/18 0018
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
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
            min-height: 680px;
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
            height: 560px;
            margin: 0 auto;
            /*padding: 5px;*/
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
            /*padding-top: 1em;*/
            /*padding-bottom: 5px;*/
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

        #menu_context {
            width: 80px;
            height: 90px;
            display: none;
            position: absolute;
            background-color: white;
            border-style: groove;
            cursor: pointer;
            border-bottom-left-radius: 10px;
            -webkit-border-bottom-left-radius: 10px;
            -moz-border-bottom-left-radius: 10px;
            -o-border-bottom-left-radius: 10px;
            border-top-left-radius: 10px;
            -webkit-border-top-left-radius: 10px;
            -moz-border-top-left-radius: 10px;
            -o-border-top-left-radius: 10px;
            border-bottom-right-radius: 10px;
            -webkit-border-bottom-right-radius: 10px;
            -moz-border-bottom-right-radius: 10px;
            -o-border-bottom-right-radius: 10px;
            border-top-right-radius: 10px;
            -webkit-border-top-right-radius: 10px;
            -moz-border-top-right-radius: 10px;
            -moz-border-top-right-radius: 10px;
            -o-border-top-right-radius: 10px; "
        }
        .download{
            cursor: pointer;
            background: url(/images/download148.svg) no-repeat 0px 0px;
            width: 20px;
            height: 20px;
            display: block;
            float: left;
            border-radius: 50%;
            margin: 16px 10px 0px 0px;
        }
        .delete{
            cursor: pointer;
            background: url(/images/delete67.svg) no-repeat 0px 0px;
            width: 20px;
            height: 20px;
            display: block;
            float: left;
            border-radius: 50%;
            margin: 16px 10px 0px 0px;
        }
        .share{
            cursor: pointer;
            background: url(/images/share6.svg) no-repeat 0px 0px;
            width: 20px;
            height: 20px;
            display: block;
            float: left;
            border-radius: 50%;
            margin: 16px 10px 0px 0px;
        }
    </style>

</head>
<body ng-controller="MyBody">
<div class="Title" style="height: 60px;"><b>Welcome</b></div>

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
            <li role="presentation"><a href="Home_File.jsp">File</a></li>
        </ul>


        <div class="center_left" style="height: 480px;">
<%-- 个人信息--%>
            <div class="col-sm-6 col-md-4" style="margin-top: 20px;width:280px;">
                <div class="thumbnail">
                    <img src="/images/person.svg" alt="个人图片" style="width:160px;height: 200px;">
                    <div class="caption">
                        <h5>UserName:<font color="red"><s:property value="#session.username"/></font></h5>
                        <h5>E_mail:<font color="red"><s:property value="#session.email"/></font></h5>
                        <h5>PhoneNumber:<font color="red"><s:property value="#session.phonenum"/></font></h5>
                        <p>
                            <button type="button" class="btn btn-primary" name="modifyPhoto" data-toggle="modal"
                                    data-target="#modifyPhoto"
                                    data-whatever="modifyPhoto">Modify
                                Photo
                            </button>

                        <div class="modal fade" id="modifyPhoto" tabindex="-1" role="dialog"
                             aria-labelledby="modifyPhotoLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close"><span
                                                aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="modifyPhotoLabel">New h</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form action="">
                                            <div class="form-group">
                                                <input type="file" name="photoField" class="file" id="photoField"
                                                       size="28"/>
                                                <label class="control-label"
                                                       style="margin-top: 5px;">文件最大不能超过20MB</label><br>
                                                <label class="control-label">文件格式必须是：JPG,JPEG,PNG</label>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                                    Close
                                                </button>
                                                <button type="submit" class="btn btn-primary">Confirm</button>
                                            </div>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>

                        </p>
                    </div>
                </div>
            </div>
<%-- 进度条--%>
            <div class="progress" style="width: 280px; margin-top: 30em;">
                <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                     style="min-width: 2em;">
                    0%
                </div>
                <span style="float: right;padding-right: 50px;">
                    <s:property value="#session.used"/>G/<s:property value="#session.totalsize"/>G
                </span>

            </div>

        </div>
        <div class="center_right" style="margin-top: 1em;">
<%--上传按键--%>
            <table id="sort" cellpadding="5px;">
                <tr>
                    <th>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#upload"
                                data-whatever="upload">Upload
                        </button>
<%--上传框--%>
                        <div class="modal fade" id="upload" tabindex="-1" role="dialog" aria-labelledby="uploadLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close"><span
                                                aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="uploadLabel">New File</h4>
                                    </div>
                                    <div class="modal-body">

                                        <s:form action="upload" method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label class="control-label">File_input:</label>
                                                <input type="file" id="uploadfile" style="margin-bottom: 1em;"
                                                       id="local_path" name="filename">
                                                <label class="control-label">Upload_path:</label>
                                                <label class="form-control" id="input-text"
                                                       name="dbPath"><s:property
                                                        value="#session.dir"></s:property></label>
                                                <select style="width: 152px;margin-left: 0px;border-top-width: 1px;margin-top: 10px;height: 31px;"
                                                        name="tag">
                                                    <option selected>=请选择文件标签=</option>
                                                    <option>人物</option>
                                                    <option>风景</option>
                                                </select>
                                                <input type="text" name="deftag" placeholder="自定义标签"
                                                       style=" width: 154px; height: 32px; margin-top: 10px;margin-left: 10px;"/>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                                    Close
                                                </button>
                                                <button type="submit" class="btn btn-primary">Confirm</button>
                                            </div>
                                            <%--<div class="form-group">--%>
                                            <%--<label for="message-text" class="control-label">Message:</label>--%>
                                            <%--<textarea class="form-control" id="message-text"></textarea>--%>
                                            <%--</div>--%>
                                        </s:form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </th>
<%--新建文件夹按键--%>
                    <th>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newdir"
                                data-whatever="newdir">New Dir
                        </button>
                    </th>
<%--新建文件夹栏--%>
                    <div class="modal fade" id="newdir" tabindex="-1" role="dialog" aria-labelledby="newdirLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="newdirLabel">New Dir</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="newDir">
                                        <div class="form-group">
                                            <label class="control-label">New Folder Name:</label>
                                            <input class="form-control" id="inputDirName" name="inputFolderName" placeholder="Folder Name"></input>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                                Close
                                            </button>
                                            <button type="submit" class="btn btn-primary">Confirm</button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>

<%--搜索--%>
                    <form action="search">
                        <th><input type="text" class="form-control" id="FileType" placeholder="According FileType"
                                   style="width:315px;" name="search"></th>
                        <th>
                            <div class="dropdown">
                                <select class="btn btn-default" name="searchType" style="width: 105px;" onchange="document.getElementById('FileType').setAttribute('placeholder',this.value)">
                                    <option selected>Type</option>
                                    <option value="FileName">FileName</option>
                                    <option value="FileContext">FileContext</option>
                                </select>
                            </div>
                        </th>
                        <th><input class="btn btn-default" type="submit" value="Search"></th>
                    </form>
                </tr>
            </table>
<%--路径导航栏--%>
            <ol class="breadcrumb" style="margin-top: 10px;border-top-width: 0px;margin-bottom: 10px;">
                <li><a href="list">Home</a></li>
                <s:iterator value="dirList">
                    <li><a href="listDir?dirName=<s:property value="dirPath"/>&dirType=DIR"><s:property
                            value="dir"/></a></li>
                </s:iterator>
                <%--<li class="active">Data</li>--%>
            </ol>
<%--文件table--%>
            <table class="table table-hover" style="margin-bottom: 0px;">
                <tr>
<<<<<<< HEAD
                    <th style="width:166px;text-align: left" >filename</th>
                    <th style="width:166px;text-align: left">tag</th>
                    <th style="width:150px;text-align: left">size</th>
                    <th style="width:166px;text-align: left">operation</th>
=======
                    <th style="width:200px;text-align: left" >filename</th>
                    <th style="width:200px;text-align: left">tag</th>
                    <th style="width:200px;text-align: left">size</th>
                    <th style="text-align: left">operation</th>
                    <%--<th><a><div class="download"></div></a>--%>
                    <%--<a><div class="delete"></div></a>--%>
                    <%--<a><div class="share"></div></a></th>--%>
>>>>>>> 1bb09c7dccc582b74b4277f38d12b01cdb753fe9
                </tr>
            </table>
            <div style="overflow-x: auto; overflow-y: auto; height: 350px; width:680px;">
                <table class="table table-hover" id="fileTable" width="680px" height="350px">

                    <s:iterator value="fileslist">
                        <tr style="height: 40px;">
                            <td style="width:196px;">
                                <s:if test='type=="image"'><img src="images/file.svg"><s:property
                                        value="filename"/></s:if>
                                <s:elseif test='type=="TXT"'><img src="images/txt.svg"><s:property
                                        value="filename"/></s:elseif>
                                <s:elseif test='type=="word"'><img src="images/word.svg"><s:property value="filename"/></s:elseif>
                                <s:elseif test='type=="xls"'><img src="images/xls.svg"><s:property
                                        value="filename"/></s:elseif>
                                <s:elseif test='type=="EXE"'><img src="images/exe.svg"><s:property
                                        value="filename"/></s:elseif>
                                <s:elseif test='type=="zip"'><img src="images/zip.svg"><s:property
                                        value="filename"/></s:elseif>
                                <s:elseif test='type=="dir"'>
                                    <a href="listDir?dirName=<s:property value="filename"/>">
                                        <img src="images/zip.svg">
                                        <s:property value="filename"/>
                                    </a>
                                </s:elseif>
                                <s:else><img src="images/unknown.svg"><s:property value="filename"/></s:else>
                            </td>
                            <td style="width:196px">
                                <a href="listTag?tag=<s:property value="tag"/>"><s:property
                                        value="tag"/></a></td>
                            <td style="width:196px">
                                <s:property value="size"/>
                            </td>
                            <td style="width:216px"; padding-left: 20px;>
                                <a href="download?id=<s:property value="id"/>"><div class="download"></div></a>
                                <a href="delete?id=<s:property value="id"/>"><div class="delete"></div></a>
                                <a href="share?id=<s:property value="id"/>" data-whatever="share" data-toggle="modal" data-target="#share"><div class="delete"></div></a>

                            </td>
                        </tr>

                    </s:iterator>
                </table>
            </div>
    <div class="modal fade" id="share" tabindex="-1" role="dialog" aria-labelledby="shareLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="aaa">Share</h4>
                </div>
                <div class="modal-body">
                    <form action="">
                        <div class="form-group">
                            <label class="control-label">New Folder Name:</label>
                            <label class="form-control" id="sha"
                                   name="dbPath"><s:property
                                    value="#session.share"></s:property></label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                Close
                            </button>
                            <button type="submit" class="btn btn-primary" onclick="copy()">Copy</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
<%--右键菜单--%>
            <%--<div id="menu_context">--%>
                <%--<ul style="line-height: 40px;list-style-type: none; padding: 0px;margin-left: 5px;border: 2px;">--%>
                    <%--<a href=""><li>download</li></a>--%>
                    <%--<a href=""><li>delete</li></a>--%>
                <%--</ul>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div> <!--center end -->

</div> <!-- contain end -->


<%--<div class="Bottom">基于JFinal+Hadoop+bootstrap+AngularJs的云端文件管理系统</div>--%>
</body>
</html>

<script>
    $('#upload').on('show.bs.modal', function (event) {                 //上传function
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('whatever') // Extract info from data-* attributes
// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('.modal-title').text('New message to ' + recipient)
        modal.find('.modal-body input').val(recipient)
    })

    function lblwhite() {               //换色布function
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
    function click() {                  //左键function

    }
    function addFile() {

    }
    function menu_context() {          //右键function
        var menu = document.getElementById("menu_context");
        document.oncontextmenu = function (ev) {
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
        document.onclick = function () {

            menu.style.display = "none";
            document.oncontextmenu = true;
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
<script>
    window.onload = function () {
        var errorMsg = "${request.errorMessage}";
        if (errorMsg != "") {
            alert(errorMsg);
        }
    }

    window.clipboardData.setData("copytext",sha.value)
</script>