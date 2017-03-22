package com.service;

import com.common.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tool.DataBaseOperation;
import com.tool.FileMd5Utils;
import com.tool.HDFSOperation;

import java.io.*;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;

import com.common.File;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    private String dirName;
    private String email;
    private String deftag;

    public String getDeftag() {
        return deftag;
    }

    public void setDeftag( String deftag ) {
        this.deftag = deftag;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail( String email ) {
        this.email = email;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum( String phonenum ) {
        this.phonenum = phonenum;
    }

    private String phonenum;

    public String getDirName() {
        return dirName;
    }

    public void setDirName( String dirName ) {
        this.dirName = dirName;
    }

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

    public static List<File> fileslist;

    public FileServiceAction() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        username = (String) session.get("username");
        email = (String) session.get("email");
        phonenum = (String) session.get("phonenum");
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
        if (!deftag.equals("")) {
            setTag(deftag);
        }
        System.out.println(deftag);
        FileInputStream in = new FileInputStream(getFilename());
        String filename1 = "";
        String type = "";
        String fileMd5 = md5.getFileMD5String(filename);
        HttpServletRequest request = ServletActionContext.getRequest();
        if (filenameFileName.lastIndexOf(".") != -1) {
            filename1 = filenameFileName.substring(0, filenameFileName.lastIndexOf("."));
            type = filenameFileName.substring(filenameFileName.lastIndexOf(".") + 1);
        } else {
            filename1 = filenameFileName;
            type = "UnKnown";
        }

        //相同文件名相同路径下不允许上传
        String selectSql = "select * from file where filename=\"" + filenameFileName + "\" and dbpath=\"" + dbPath + "\""
                + " and owner=\"" + username + "\"";
        ResultSet resultSet = dataBaseOperation.querySql(selectSql);
        if (resultSet.next()) {
            //弹出提示框
            request.setAttribute("errorMessage", "目录：" + dbPath + "下已经存在" + filenameFileName + "文件！");
            return "ok";
        }
        String hdfsName = filename1 + "_";
        //重命名文件在网盘的名字
        String fileSql = "select hdfsPath from file where owner=\"" + username + "\" order by hdfsPath desc";
        ResultSet resultSet0 = dataBaseOperation.querySql(fileSql);
        String hdfsName1 = "";

        //如果网盘已存在文件
        while(resultSet0.next()) {
            hdfsName1 = resultSet0.getString("hdfsPath").substring(resultSet0.getString("hdfsPath").lastIndexOf("/") + 1,
                    resultSet0.getString("hdfsPath").lastIndexOf("_"));
            if (filename1.equals(hdfsName1)) {
                int index = Integer.parseInt(resultSet0.getString("hdfsPath").substring(resultSet0.getString("hdfsPath").lastIndexOf("_") + 1,
                        resultSet0.getString("hdfsPath").lastIndexOf(".")), 10) + 1;
                hdfsName += index + "." + type;
                System.out.println(hdfsName);
                break;
            }
        }
        String temp = filename1 + "_";
        if (hdfsName.equals(temp)) {
            hdfsName += "0." + type;
        }
        String image = ".jpg,.png,.gif";//图片类型
        String zip = ".zip,.rar,.gzip";//压缩包类型
        String word = ".doc,.docx";//word文档类型
        String excel = ".xls";//excel文件类型
        String TXT = ".txt";//TXT文件类型
        String EXE = ".exe";//EXE文件类型
        if (image.contains(type)) {
            type = "image";
        }
        if (zip.contains(type)) {
            type = "zip";
        }
        if (word.contains(type)) {
            type = "word";
        }
        if (excel.contains(type)) {
            type = "excel";
        }
        if (TXT.contains(type)) {
            type = "TXT";
        }
        if (EXE.contains(type)) {
            type = "EXE";
        }
//如果网盘存在内容相同的文件则
        String fileExistHdfs = "select md5,hdfsPath from file where owner=\"" + username + "\"";
        ResultSet resultSet2 = dataBaseOperation.querySql(fileExistHdfs);
        String hdfsPath = "/Disk/" + username + "/" + hdfsName;
        boolean isUploadFile = true;
        while(resultSet2.next()) {
            if (resultSet2.getString("md5").equals(fileMd5)) {
                hdfsPath = resultSet2.getString("hdfsPath");
                isUploadFile = false;
                break;
            }
        }
        String selectUsed = "select used,totalsize from user where username=\"" + username + "\"";
        ResultSet resultSet1 = dataBaseOperation.querySql(selectUsed);
        if (resultSet1.next()) {
            double used = resultSet1.getDouble("used");
            used += (double) filename.length() / (1024 * 1024);
            if (resultSet1.getDouble("totalsize") < used) {
                //弹出提示框
                request.setAttribute("errorMessage", "您的空间已达到上限，请升级会员继续使用！");
                return "ok";
            }
            Map<String, Object> session = ActionContext.getContext().getSession();
            DecimalFormat df = new DecimalFormat("0.00");
            session.put("used", df.format(used));
            session.put("totalsize", resultSet1.getDouble("totalsize"));
            String updateUesd = "update user set used=" + used + " where username=\"" + username + "\"";
            dataBaseOperation.updateSql(updateUesd);
        }
        String addFile = "insert into file(filename,dbpath,owner,tag,size,type,md5,hdfsPath) values(\"" +
                filenameFileName + "\",\"" + dbPath + "\",\"" + username + "\",\"" + tag + "\",\""
                + FormetFileSize(filename.length()) + "\",\"" + type + "\",\"" + fileMd5 + "\",\""
                + hdfsPath + "\")";
        dataBaseOperation.updateSql(addFile);
        if (isUploadFile) {
            hdfsOperation.upLoad(in, hdfsPath);
        }
        return "ok";
    }

    public String uploadFilePath() throws Exception {

        System.getProperty("java.class.path");

        return "ok";
    }

    public String listAll() throws Exception {
        fileslist = new ArrayList<File>();
        String sql = "select * from file where owner=\""+username+"\"";
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

    public String listDir() throws Exception {
        fileslist = new ArrayList<File>();
        String sql = "select * from file where dbpath=\"" + dirName + "\" and owner=\""+username+"\"";
        System.out.println(sql);
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

    public String listTag() throws Exception {
        fileslist = new ArrayList<File>();
        String sql = "select * from file where tag=\"" + tag + "\" and owner=\""+username+"\"";
        System.out.println(sql);
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
