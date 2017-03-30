package com.common;

import com.tool.HDFSOperation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.TimerTask;

/**
 * Created by ZKJ on 2017/3/23 0023.
 */
public class TimerDelete extends TimerTask {
    @Override
    public void run() {
        String driverName = "org.apache.hadoop.hive.jdbc.HiveDriver";
        String url = "jdbc:hive://localhost:10000/default";
        String userName = "";
        String passWord = "";
        String deleteSql = "select * from recycle where hdfspath not in(select hdfspath from file)";
        try {
            Class.forName(driverName);
            Connection con = DriverManager.getConnection("url", "userName",
                    "passWord");
            Statement stmt = con.createStatement();
            ResultSet resultSet = stmt.executeQuery(deleteSql);

            HDFSOperation hdfsOperation = new HDFSOperation();
            while(resultSet.next()) {
                String deletefile = resultSet.getString("hdfspath");
                hdfsOperation.deleteFile(deletefile);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
