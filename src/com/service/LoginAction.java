package com.service;

import com.common.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tool.DataBaseOperation;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.sql.ResultSet;
import java.util.Map;

/**
 * Created by ZKJ on 2017/3/16 0016.
 */
public class LoginAction extends ActionSupport {
    private String username;
    private String password;
    private String phonenum;
    private String email;
    private DataBaseOperation dataBaseOperation;
    private ResultSet resultSet;

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum( String phonenum ) {
        this.phonenum = phonenum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail( String email ) {
        this.email = email;
    }


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

    public String login() throws Exception {
        dataBaseOperation = new DataBaseOperation();
        String selectsql = "select * from user where username=\"" + username + "\" and password=\"" + password + "\"";
        resultSet = dataBaseOperation.querySql(selectsql);
        if (resultSet.next()) {
            setEmail(resultSet.getString("email"));
            setPhonenum(resultSet.getString("phonenum"));
            Map<String, Object> session = ActionContext.getContext().getSession();
            session.put("username", username);
            session.put("email", resultSet.getString("email"));
            session.put("phonenum", resultSet.getString("phonenum"));
            return "ok";
        }
        return "failed";
    }

    public String register() throws Exception {
        dataBaseOperation = new DataBaseOperation();
        String selectsql = "insert into user(username,password,phonenum,email,totalsize,used) values(\""
                + username + "\",\"" + password + "\",\"" + phonenum + "\",\"" + email + "\",10,0)";
        System.out.println(selectsql);
        dataBaseOperation.updateSql(selectsql);
        return "ok";
    }
}
