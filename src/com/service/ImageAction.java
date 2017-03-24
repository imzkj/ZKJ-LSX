package com.service;

import com.common.ImageOperation;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.io.File;
import java.io.FileInputStream;
import java.util.Map;

/**
 * Created by ZKJ on 2017/3/24 0024.
 */
public class ImageAction extends ActionSupport {
    private File picture;
    private String username;

    public File getPicture() {
        return picture;
    }

    public void setPicture( File picture ) {
        this.picture = picture;
    }

    public ImageAction() {
        Map<String, Object> session = ActionContext.getContext().getSession();
        username = (String) session.get("username");
        System.out.println(picture + " ");
        System.out.println(username);
    }

    public String getUsername() {
        return username;
    }

    public void setUsername( String username ) {
        this.username = username;
    }

    public String photo() throws Exception {
        System.out.println(username + " ");
        System.out.println(picture);
        FileInputStream fileInputStream = new FileInputStream(picture);
        ImageOperation.readImage2DB(username, fileInputStream);
        return "ok";
    }
}
