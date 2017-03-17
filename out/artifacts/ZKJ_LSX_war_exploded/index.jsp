<%--
  Created by IntelliJ IDEA.
  User: ZKJ
  Date: 2017/3/17 0017
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <table>
  <s:iterator value="fileslist" var="file">
    <!--
    遍历值栈list集合，得到每个user对象
    机制： 把每次遍历出来的user对象放到 context里面
    获取context里面数据特点：写ognl表达式，
    使用特殊符号 #
    -->
    <tr>
    <td><s:property value="#file.filename"/></td>
      <td><s:property value="#file.dbpath"/></td>
      <td><s:property value="#file.owner"/></td>
      <td><s:property value="#file.hdfspath"/></td>
      <td><s:property value="#file.size"/></td>
      <td><s:property value="#file.type"/></td>
    </tr>
  </s:iterator>
  </table>
  </body>
</html>
