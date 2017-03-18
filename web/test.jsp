<%--
  Created by IntelliJ IDEA.
  User: ZKJ
  Date: 2017/3/18 0018
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@page import="com.service.FileServiceAction" %>
<%@ page import="com.common.File" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table>
    <s:iterator value="fileslist">
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
<%--s
<table>
    <%
        FileServiceAction fileServiceAction = new FileServiceAction();
        List<File> fileslist = fileServiceAction.getFileslist();
        Iterator<File> iterator = fileslist.iterator();
        int i = 0;
        while(iterator.hasNext()) {
            if (i == 0) {
    %>
    <tr>
        <% }
            if (iterator.next().getType().equals("f")) {

            }
        %>
        <td><img src="images/avtar.png">
            <img src="images/pass.png">
        </td>
        <%
            i++;
            if (i % 3 == 2) {
                i = 0;
        %></tr>
    <%
            }

        }
    %>
</table>
--%>
</body>
</html>
