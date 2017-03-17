<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基于JFinal+Hadoop+bootstrap+AngularJs的云端文件管理系统</title>

<style type="text/css">
body{
	background: url(images/bg1.jpg) no-repeat 0px 0px;
	font-family: 'Open Sans', sans-serif;
	background-size:cover;
	-webkit-background-size:cover;
	-moz-background-size:cover;
	-o-background-size:cover;
	min-height:800px;
}
.contain{
	width:1024px;
	height:auto;
	border-style:solid;
	border-color:#2b2b36;
	border-width: 3px;
	background-color:#FFFFFF;
	margin:0 auto;
	border-radius: 15px;
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	-o-border-radius: 15px;
}
.head{
width:1024px;
height:auto;
margin:0 auto
}
.center{
width:1024px;
height:550px;
margin:0 auto;
padding:10px;
}
label.lbl-1 {
  cursor: pointer;
  background: #6756ea;
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
.Title{
	
	  text-align: center;
	  padding-top: 1em;
	  padding-bottom: 10px;
	  font-weight: 500;
	  color: #2B2B36;
	  font-size: 3em;
}
.Bottom{
	 font-family: 'Exo 2', sans-serif;
	  text-align: center;
	  padding-top: 1em;
	  font-weight: 600;
	  color:silver;
	  font-size: 2em;
}
</style>

</head>
<body  ng-controller="MyBody" >
<div class="Title"><b>Welcome</b></div>
<div class="contain" id="mainform">

<!-- 头部 -->
<div class="head">

<span class="glyphicon glyphicon-arrow-left" aria-hidden="true" style="cursor:pointer; margin-left: 10px;" onclick="window.location.href='index.html'" ></span>

<!-- 文件夹预览 -->
<img ng-repeat="item in dirlist" src="/images/file.jpg" width="60" class="img-circle" id="popover_dir_{{item.id}}"
     onmouseover="$(this).popover('show');"
     onmouseleave="$(this).popover('hide');"
     ng-click="select_dir(item.id,item.name)"
     data-placement="bottom"
     data-toggle="popover"
     data-html=true
     data-content="<span class='label label-success'>文件夹名称：{{item.name}}</span><br><br>
				  <span class='label label-success'>已上传文件数：{{item.sonfilenum}}个</span>"
     data-original-title="<b>文件夹描述</>">

<!-- 添加文件夹 -->
<img src="/images/addfile.jpg" width="40" class="img-circle" id="popover_adddir" style="margin-left: 5px;"
     onmouseover="$('#popover_adddir').popover('show');"
     data-placement="bottom"
     data-toggle="popover"
     data-html=true
     data-content="<div class='col-lg-16'>
    <div class='input-group'>
     <input type='text' class='form-control' placeholder='输入文件夹名称'>
      <span class='input-group-btn'>
        <button class='btn btn-default' type='button' id='adddir_bt'>确认添加</button>
      </span>
    </div>
  </div>" data-original-title="<b>添加文件夹</b>" >

			<label class="lbl-1" onclick="lblblue()" style="margin-right: 30px;"> </label>
			<label class="lbl-2" onclick="lblpink()"> </label>
			<label class="lbl-3" onclick="lblyellow()"> </label>
			<label class="lbl-4" onclick="lblwhite()"> </label>

</div> <!-- head end -->


<!-- 中部 -->
<div class="center">

<div>
 <div class="col-lg-6">
    <div class="input-group">
      <input type="text" class="form-control" placeholder="请输入文件名称或相关关键词">
      <span class="input-group-btn">
        <button class="btn btn-warning" style="margin-left:3px;" type="button">搜索文件</button>
      </span>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
  
  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">上传文件到云盘</button>
  <span class="label label-success">当前路径：/</span>
  <span class="label label-info" ng-bind="selectdir"></span>
</div><!-- /.row -->

<br>

<!-- 文件列表 -->
<table class="table table-hover table-bordered table-striped  table-condensed" >
<tbody>
  <th class="active">选择</th>
  <th class="success">文件名称</th>
  <th class="warning">文件大小</th>
  <th class="danger">文件类型</th>
  <th class="active">下载次数</th>
  <th class="success">工具栏</th>
</tbody>

 <tr align="center" ng-repeat="item in filelist">
  <td width="50"><input type="checkbox"></td>
  <td ng-bind="item.filename"></td>
  <td ng-bind="item.filesize"></td>
  <td ng-bind="item.filetype"></td>
  <td ng-bind="item.download_num"></td>
  <td width=250>
  <button type="button" class="btn btn-primary" ng-click="download(item.id)">下载</button><!--  ng-href="javascript:window.location.href='/file/downloadfile?fileid={{item.id}}'" -->
  <button type="button" class="btn btn-danger" ng-click="deletebyid(item.id)">删除</button>
  <button type="button" class="btn btn-success">重命名</button>
  </td>
</tr>

</table>

<center>
 <!--  page  -->
 <ul class="pagination pagination-lg">
  <li class="active"><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#">6</a></li>
  <li>&nbsp;&nbsp;&nbsp;</li>
  <li>
<button type="button" class="btn btn-info btn-lg">下一页</button></li>
</ul>
 <!--  page end  -->
</center>

   
</div> <!--center end -->

</div> <!-- contain end -->


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
 <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">文件上传</h4>
      </div>
      <div class="modal-body">

<form id="text_form" action="/file/uploadfile" enctype="multipart/form-data" method="post">
  <table class="table table-bordered">
  <thead>
  <tr><td class="success">
  <input type="hidden" name="dirname" value="{{selectdir}}">
  <input type="hidden" name="dirid" value="{{dirid}}">
  <input type="file" name="file" id="uploadfile"></td>
  <td><button type="submit" class="btn btn-info">上传文件到云端</button></td></tr>
  </thead>
  </table>
  </form>       


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
<!--         <button type="button" class="btn btn-primary">上传</button> -->
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="Bottom">基于JFinal+Hadoop+bootstrap+AngularJs的云端文件管理系统</div>
</body>
</html>

<script>
	function lblwhite(){
		var bc = document.getElementById("mainform");
		bc.style.background = "#FFFFFF";
	};
	function lblblue(){
		var bc = document.getElementById("mainform");
		bc.style.background = "#6756ea"; 
	}
	function lblpink(){
		var bc = document.getElementById("mainform");
		bc.style.background = "#ea569a";
	}
	function lblyellow(){
		var bc = document.getElementById("mainform");
		bc.style.background = "#f1c85f";
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

<!-- 全局JS -->
<%@include file="/js/index-js.jsp" %>