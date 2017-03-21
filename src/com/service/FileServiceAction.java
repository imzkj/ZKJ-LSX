package com.service;

import com.common.User;
import com.opensymphony.xwork2.ActionSupport;
import com.tool.DataBaseOperation;
import com.tool.FileMd5Utils;
import com.tool.HDFSOperation;

import java.io.*;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import com.common.File;
import javafx.scene.control.Alert;
import org.apache.struts2.ServletActionContext;

import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by ZKJ on 2017/3/16 0016.
 */
public class FileServiceAction extends ActionSupport {
    private HDFSOperation hdfsOperation = new HDFSOperation();
    private DataBaseOperation dataBaseOperation = new DataBaseOperation();
    private FileMd5Utils md5 = new FileMd5Utils();
    private String localPath;
    private String dbPath;
    private String hdfsPath;
    private java.io.File filename;
    private String filenameFileName;
    private String tag;
    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername( String username ) {
        this.username = username;
    }

    public String getTag() {
        return tag;
    }

    public void setTag( String tag ) {
        this.tag = tag;
    }

    public static List<File> fileslist = new ArrayList<File>();

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
        FileInputStream in = new FileInputStream(getFilename());
        String filename1 = "";
        String type = "";
        if( filenameFileName.lastIndexOf(".")!=-1) {
            filename1=filenameFileName.substring(0, filenameFileName.lastIndexOf("."));
            type=filenameFileName.substring(filenameFileName.lastIndexOf(".")+1);
        } else {
            filename1=filenameFileName;
            type="UnKnown";
        }
        String hdfsName = filename1 + "_";
        //重命名文件在网盘的名字
        String fileSql = "select hdfsPath from file where owner=\"" + username + "\" order by hdfsPath desc";
        ResultSet resultSet0 = dataBaseOperation.querySql(fileSql);
        String hdfsName1="";
        //如果网盘已存在文件
        while(resultSet0.next()) {
            hdfsName1=resultSet0.getString("hdfsPath").substring(resultSet0.getString("hdfsPath").lastIndexOf("/")+1,
                    resultSet0.getString("hdfsPath").lastIndexOf("_"));
            if (filename1.equals(hdfsName1)) {
                int index = Integer.parseInt(resultSet0.getString("hdfsPath").substring(resultSet0.getString("hdfsPath").lastIndexOf("_")+1,
                        resultSet0.getString("hdfsPath").lastIndexOf(".")), 10)+1;
                hdfsName += index + "." + type;
                System.out.println(hdfsName);
                break;
            }
        }
        String temp=filename1 + "_";
        if (hdfsName.equals(temp)) {
            hdfsName+="0."+type;
        }
//相同文件名相同路径下不允许上传
        String selectSql = "select * from file where filename=\"" + filenameFileName + "\" and dbpath=\"" + dbPath + "\"";
        ResultSet resultSet = dataBaseOperation.querySql(selectSql);
        if (resultSet.next()) {
            //弹出提示框
            this.addActionMessage("shanchu");
        }
        String addFile = "insert into file(filename,dbpath,owner,tag,size,type,md5,hdfsPath) values(\"" +
                filenameFileName + "\",\"" + dbPath + "\",\"" + username + "\",\"" + tag + "\",\""
                + FormetFileSize(filename.length()) + "\",\"" + type + "\",\"" + md5.getFileMD5String(filename)
                + "\",\"" + "/Disk/" + username + "/" + hdfsName + "\")";
        dataBaseOperation.updateSql(addFile);
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

    public static String FormetFileSize( long fileS ) {//转换文件大小
        DecimalFormat df = new DecimalFormat("#.00");
        String fileSizeString = "";
        if (fileS < 1024) {
            fileSizeString = df.format((double) fileS) + "B";
        } else if (fileS < 1048576) {
            fileSizeString = df.format((double) fileS / 1024) + "K";
        } else if (fileS < 1073741824) {
            fileSizeString = df.format((double) fileS / 1048576) + "M";
        } else {
            fileSizeString = df.format((double) fileS / 1073741824) + "G";
        }
        return fileSizeString;
    }

    public static boolean fileIsExist() {

        return true;
    }
}
