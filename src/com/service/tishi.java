package com.service;

import com.common.DesUtil;
import com.common.File;
import com.opensymphony.xwork2.ActionSupport;
import com.tool.DataBaseOperation;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;
import sun.misc.BASE64Encoder;
import sun.misc.BASE64Decoder;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.Transferable;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.List;

/**
 * Created by ZKJ on 2017/3/24 0024.
 */
public class tishi extends ActionSupport{
    private java.util.List<File> fileslist = new ArrayList<File>();

    public List<File> getFileslist() {
        return fileslist;
    }

    public void setFileslist( List<File> fileslist ) {
        this.fileslist = fileslist;
    }

    public String getIJtyzVlqab8() {
        return IJtyzVlqab8;
    }

    public void setIJtyzVlqab8( String IJtyzVlqab8 ) {
        this.IJtyzVlqab8 = IJtyzVlqab8;
    }

    private String IJtyzVlqab8;

    public String share() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        String en = DesUtil.en(IJtyzVlqab8);
        en="http://127.0.0.1:8080/listId?IJtyzVlqab8="+en;
        request.setAttribute("sharemess", en);
        Clipboard clip = Toolkit.getDefaultToolkit().getSystemClipboard();
        Transferable tText = new StringSelection(en);
        clip.setContents(tText, null);

        return "ok";
    }


    public String listId() throws Exception {
        String id = DesUtil.de(IJtyzVlqab8);
        String sql = "select * from file where id=\"" + id + "\"";
        DataBaseOperation dataBaseOperation = new DataBaseOperation();
        ResultSet resultSet = dataBaseOperation.querySql(sql);
        if (resultSet.next()) {
            File file = new File();
            file.setId(resultSet.getString("id"));
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

    public static void main( String[] args ) throws Exception {
//        String writeMe = "fff";
//        Clipboard clip = Toolkit.getDefaultToolkit().getSystemClipboard();
//        Transferable tText = new StringSelection(writeMe);
//        clip.setContents(tText, null);
        System.out.println(DesUtil.en("1"));
System.out.println(DesUtil.de(DesUtil.en("1")));
    }


}
