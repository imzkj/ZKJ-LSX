package com.service;

import com.opensymphony.xwork2.ActionSupport;
import com.tool.DataBaseOperation;
import com.tool.FileMd5Utils;
import com.tool.HDFSOperation;

import java.io.*;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.common.File;
import org.apache.struts2.ServletActionContext;

import org.apache.struts2.ServletActionContext;

/**
 * Created by ZKJ on 2017/3/16 0016.
 */
public class FileServiceAction extends ActionSupport {
    private HDFSOperation hdfsOperation=new HDFSOperation();
    private DataBaseOperation dataBaseOperation=new DataBaseOperation();
    private FileMd5Utils md5=new FileMd5Utils();
    private String localPath;
    private String dbPath;
    private String hdfsPath;
    private java.io.File filename;
    private String filenameFileName;

    public FileServiceAction() throws Exception {
    }

    public String getFilenameFileName() {
        return filenameFileName;
    }

    public void setFilenameFileName( String filenameFileName ) {
        this.filenameFileName = filenameFileName;
    }

    public java.io.File getFilename() {
        return filename;
    }

    public void setFilename( java.io.File filename ) {
        this.filename = filename;
    }

    public static List<File> fileslist = new ArrayList<File>();

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

    public String uploadFile() throws Exception {
        FileInputStream is = new FileInputStream(getFilename());
       System.out.println(md5.getFileMD5String(filename));
//        BufferedReader tBufferedReader = new BufferedReader(new InputStreamReader(is));
//        StringBuffer tStringBuffer = new StringBuffer();
//        String sTempOneLine = new String("");
//        while((sTempOneLine = tBufferedReader.readLine()) != null) {
//            tStringBuffer.append(sTempOneLine);
//        }
//        System.out.println("输入文件内容:" + tStringBuffer.toString());
//        System.out.println("输入文件名字:" + filenameFileName);
//        OutputStream os = new FileOutputStream(hdfsPath);
//        byte buffer[] = new byte[1024];
//        int cnt = 0;
//        while((cnt = is.read(buffer)) > 0) {
//            os.write(buffer, 0, cnt);
//        }
//        os.close();
//        is.close();
        return "ok";
    }

    public String listAll() throws Exception {
        String sql = "select * from file ";
        //"where dbpath=\"" + path + "\"";
        ResultSet resultSet = dataBaseOperation.querySql(sql);
        while(resultSet.next()) {
            File file = new File();
            file.setFilename(resultSet.getString("filename"));
            file.setDbpath(resultSet.getString("dbpath"));
            file.setOwner(resultSet.getString("owner"));
            file.setTag(resultSet.getString("tag"));
            file.setSize(resultSet.getString("size"));
            file.setType(resultSet.getString("type"));
            file.setMd5(resultSet.getString("md5"));
            fileslist.add(file);
        }
        return "ok";
    }
}
