package com.tool;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by ZKJ on 2017/3/16 0016.
 */
public class LoginAction extends ActionSupport{
    private String username;
    private  String password;

    public String getUsername() {
        return username;
    }

    public void setUsername( String username ) {
        this.username = username;
    }

    public String getPassword() {
    
        return password;
    }

    public void setPassword( String password ) {
        this.password = password;
    }

    @Override
    public String execute() throws Exception {
        System.out.println(username+password);
        return "ok";
    }
}
