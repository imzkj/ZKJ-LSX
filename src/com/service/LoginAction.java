package com.service;

import com.common.User;
import com.email.MailUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tool.DataBaseOperation;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.sql.ResultSet;
import java.util.Map;
import java.util.Random;

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
    private String code;

    public String getCode() {
        return code;
    }

    public void setCode( String code ) {
        this.code = code;
    }

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
        String selectUsed = "select used,totalsize from user where username=\"" + username + "\"";
        ResultSet resultSet1 = dataBaseOperation.querySql(selectUsed);
        Map<String, Object> session = ActionContext.getContext().getSession();
        if (resultSet1.next()) {
            session.put("used", resultSet1.getDouble("used"));
            session.put("totalsize", resultSet1.getDouble("totalsize"));
        }
        String selectsql = "select * from user where username=\"" + username + "\" and password=\"" + password + "\"";
        resultSet = dataBaseOperation.querySql(selectsql);
        if (resultSet.next()) {
            setEmail(resultSet.getString("email"));
            setPhonenum(resultSet.getString("phonenum"));
            session.put("username", username);
            session.put("email", resultSet.getString("email"));
            session.put("phonenum", resultSet.getString("phonenum"));
            return "ok";
        }
        return "failed";
    }

    public String register() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        int icode;//定义两变量
        String identify = "";
        Random ne = new Random();//实例化一个random的对象ne
        icode = ne.nextInt(900000) + 100000;//为变量赋随机值1000-9999
        session.put("username", username);
        session.put("phonenum", phonenum);
        session.put("email", email);
        identify = (String) session.get("code");
        if (identify==null) {
            identify="0";
        }
        String jcode = icode + "";
        String selectsql="";
        if (code.equals("0")) {
            selectsql= "insert into user(username,password,phonenum,email,totalsize,used) values(\""
                    + username + "\",\"" + password + "\",\"" + phonenum + "\",\"" + email + "\",10,0)";
        }else {
            selectsql= "insert into user(username,password,phonenum,email,totalsize,used) values(\""
                    + username + "\",\"" + password + "\",\"" + phonenum + "\",\"" + email + "\",100,0)";
            if (!identify.equals(code)) {
                session.put("code", jcode);
                MailUtil.sendEmail(email, icode, username);
                return "again";
            }
        }
        dataBaseOperation = new DataBaseOperation();
        System.out.println(selectsql);
        dataBaseOperation.updateSql(selectsql);
        return "ok";
    }
}
