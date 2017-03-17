package com.service;

import com.opensymphony.xwork2.ActionSupport;
import com.tool.DataBaseOperation;
import com.tool.HDFSOperation;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.common.File;

/**
 * Created by ZKJ on 2017/3/16 0016.
 */
public class FileServiceAction extends ActionSupport {
    private HDFSOperation hdfsOperation;
    private DataBaseOperation dataBaseOperation;
    private String localPath;
    private String dbPath;
    private String hdfsPath;
    private List<File> fileslist = new ArrayList<File>();

    public List<File> getFileslist() {
        return fileslist;
    }

    public String getLocalPath() {
        return localPath;
    }

    public void setLocalPath( String localPath ) {
        this.localPath = localPath;
    }

    public String getDbPath() {
        return dbPath;
    }

    public void setDbPath( String dbPath ) {
        this.dbPath = dbPath;
    }

    public String getHdfsPath() {
        return hdfsPath;
    }

    public void setHdfsPath( String hdfsPath ) {
        this.hdfsPath = hdfsPath;
    }

    // FileService
    public String uploadFile() {
        return "";
    }

    public String listAll() throws Exception {
        dataBaseOperation = new DataBaseOperation();

        File file = new File();
        String sql = "select * from file ";
        //"where dbpath=\"" + path + "\"";
        ResultSet resultSet = dataBaseOperation.querySql(sql);
        while(resultSet.next()) {
            file.setFilename(resultSet.getString("filename"));
            file.setDbpath(resultSet.getString("dbpath"));
            file.setOwner(resultSet.getString("owner"));
            file.setHdfspath(resultSet.getString("hdfspath"));
            file.setSize(resultSet.getString("size"));
            file.setType(resultSet.getString("type"));
            fileslist.add(file);
        }
        return "ok";
    }
}