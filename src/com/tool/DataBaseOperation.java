package com.tool;

import com.common.File;

import java.sql.*;

/**
 * Created by ZKJ on 2017/3/16 0016.
 */
public class DataBaseOperation {
    public Connection conn = null;
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

    //添加文件
    public boolean addFile( File file ) throws SQLException {
        String addSql = "insert into file values(\"" + file.getFilename() + "\",\"" + file.getDbpath() + "\",\"" + file.getOwner()
                + "\",\"" + file.getTag() + "\",\"" + file.getSize() + "\",\"" + file.getType() + "\",\"" + file.getMd5() + "\")";
        stmt.executeUpdate(addSql);
        return true;
    }

    //删除文件
    public boolean deleteFile( String filename ) throws SQLException {
        String deleteSql = "delete from file where filename=\"" + filename + "\"";
        stmt.executeUpdate(deleteSql);
        return true;
    }

    //新建文件夹
    public boolean newDir( String dirName, String dbpath, String owner ) throws SQLException {
        String newDir = "insert into file values(\"" + dirName + "\",\"" + dbpath + "\",\"" + owner
                + "\",\"\",\"\",\"dir\",\"\")";
        stmt.executeUpdate(newDir);
        return true;
    }
    //删除文件夹
    public boolean deleteDir( String dirname ) throws SQLException {
        String deleteSql = "delete from file where filename=\"" + dirname + "\"";
        stmt.executeUpdate(deleteSql);
        return true;
    }
}
