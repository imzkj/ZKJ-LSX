<%--
  Created by IntelliJ IDEA.
  User: ZKJ
  Date: 2017/3/24 0024
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*, javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.math.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String username = request.getParameter("username");
//mysql连接
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String URL = "jdbc:mysql://192.168.58.29:3306/hadoop?user=root&password=yes";
    Connection con = DriverManager.getConnection(URL);

//oracle连接
//String URL="jdbc:oracle:thin@localhost:1521:orcl2";
//user="system";
//password="manager";
//Connection con = DriverManager.getConnection(URL,user,password);


    try {
// 准备语句执行对象
        Statement stmt = con.createStatement();
        String sql = " SELECT * FROM user WHERE username = \""+username+"\"";
        ResultSet rs = stmt.executeQuery(sql);
        if (rs.next()) {
            Blob b = rs.getBlob("photo");
            long size = b.length();
//out.print(size);
            byte[] bs = b.getBytes(1, (int) size);
            response.setContentType("image/jpeg");
            OutputStream outs = response.getOutputStream();
            outs.write(bs);
            outs.flush();
            request.setAttribute("tx",bs);
            rs.close();
        } else {
            rs.close();
            response.sendRedirect("./images/pass.png");
        }
    }finally {
        con.close();
    }
%>
</body>
</html>
