<%--
  Created by IntelliJ IDEA.
  User: ZKJ
  Date: 2017/3/21 0021
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
    window.onload=function(){ var errorMsg="${requestScope.errorMessage}";  alert(errorMsg); }
</script>
<body>
<table class="table table-hover" id="fileTable" width="680px" height="350px">

    <s:iterator value="fileslist">
        <tr><td>aaa</td>
            <td style="width:226px">
                <s:if test='type=="image"'><img src="images/file.svg"><s:property
                        value="filename"/></s:if>
                <s:elseif test='type=="txt"'><img src="images/txt.svg"><s:property
                        value="filename"/></s:elseif>
                <s:elseif test='type=="word"'><img src="images/word.svg"><s:property value="filename"/></s:elseif>
                <s:elseif test='type=="xls"'><img src="images/xls.svg"><s:property
                        value="filename"/></s:elseif>
                <s:elseif test='type=="exe"'><img src="images/exe.svg"><s:property
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
            <td style="width:226px">
                <a href="listTag?tag=<s:property value="tag"/>"><s:property
                        value="tag"/></a></td>
            <td style="width:226px">
                <s:property value="size"/>
            </td>
        </tr>
    </s:iterator>
</table>
<s:property value="username"></s:property>
<s:property value="searchType"></s:property>
</body>
</html>
