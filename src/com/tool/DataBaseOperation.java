package com.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by ZKJ on 2017/3/16 0016.
 */
public class DataBaseOperation {
    private Connection conn=null;
    Statement stmt =null;
    public DataBaseOperation() throws Exception {
        String url = "jdbc:mysql://192.168.58.29:3306/hadoop?"
                + "user=root&password=yes&useUnicode=true&characterEncoding=UTF8";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url);
        stmt = conn.createStatement();

    }
    //添加用户
    private boolean addUser() throws SQLException {
        String sql="insert into user(name,password) values()";
        stmt.executeUpdate(sql);
        return true;
    }
}
