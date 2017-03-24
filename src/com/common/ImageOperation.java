package com.common;
/**
 *
 */

import com.tool.DataBaseOperation;

import java.io.*;
import java.io.File;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Administrator 测试写入数据库以及从数据库中读取
 */
public class ImageOperation {

    // 将图片插入数据库
    public static void readImage2DB( String username, FileInputStream in ) throws Exception {
        DataBaseOperation dataBaseOperation = new DataBaseOperation();
        PreparedStatement ps = null;
        try {
            String sql = "UPDATE user set photo=? where username=\"" + username + "\"";
            ps = dataBaseOperation.conn.prepareStatement(sql);
            ps.setBinaryStream(1, in, in.available());
            int count = ps.executeUpdate();
            if (count > 0) {
                System.out.println("插入成功！");
            } else {
                System.out.println("插入失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    // 读取数据库中图片
    public static void readDB2Image( String username ) throws Exception {
        DataBaseOperation dataBaseOperation = new DataBaseOperation();
        String targetPath = "D:/1.png";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select * from user where username =?";
            ps = dataBaseOperation.conn.prepareStatement(sql);
            ps.setString(1,username);
            rs = ps.executeQuery();
            while(rs.next()) {
                InputStream in = rs.getBinaryStream("photo");
                ImageUtil.readBin2Image(in, targetPath);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //测试
    public static void main( String[] args ) throws Exception {
        //readImage2DB();
        String path="C:\\Users\\ZKJ\\Desktop\\花.jpg";
        FileInputStream in = new FileInputStream(new File(path));
       // readImage2DB("a",in);
        readDB2Image("a");
    }
}