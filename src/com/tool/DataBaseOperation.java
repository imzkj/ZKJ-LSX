package com.tool;

import java.sql.*;

/**
 * Created by ZKJ on 2017/3/16 0016.
 */
public class DataBaseOperation {
    private Connection conn = null;
    Statement stmt = null;

    public DataBaseOperation() throws Exception {
        String url = "jdbc:mysql://192.168.58.29:3306/hadoop?"
                + "user=root&password=yes&useUnicode=true&characterEncoding=UTF8";
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url);
        stmt = conn.createStatement();

    }

    public ResultSet querySql( String sql ) throws SQLException {
        ResultSet resultSet = stmt.executeQuery(sql);
        return resultSet;
    }
    public void updateSql( String sql ) throws SQLException {
        stmt.executeUpdate(sql);

    }
    //添加用户
    public boolean addUser() throws SQLException {
        String sql = "insert into user(name,password) values()";
        stmt.executeUpdate(sql);
        return true;
    }
}
