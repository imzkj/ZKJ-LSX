package com.service;

import com.common.User;
import com.email.MailUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tool.DataBaseOperation;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Path;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
    private Map<String, Object> session = ActionContext.getContext().getSession();

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
        String sql = " SELECT * FROM user WHERE username = \"" + username + "\"";
        ResultSet rs = dataBaseOperation.querySql(sql);
        if (rs.next()) {
            try {
                if (rs.getBlob("photo").equals(null)) {
                    session.put("hasphoto", "0");
                } else {
                    session.put("hasphoto", "1");
                }
                String a = (String) rs.getString("signday");
                int signtime = rs.getInt("signtime");
                Date now = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
                String signday = dateFormat.format(now);
                DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
                Date d1 = df.parse(signday);
                if (!a.equals("0")) {
                    Date d2 = df.parse(a);
                    long diff = d1.getTime() - d2.getTime();
                    long days = diff / (1000 * 60 * 60 * 24);
                    if (days > 1) {
                        String updateTime = "update user set username=\"" + username + "\" and signtime=0";
                        DataBaseOperation dataBaseOperation = new DataBaseOperation();
                        dataBaseOperation.updateSql(updateTime);
                        signtime = 0;
                    }
                }
                String temp = "";
                temp += signtime;
                session.put("signtime", temp);
            } catch (Exception e) {
                session.put("hasphoto", "0");
                System.out.println("blob is null");
            }

        }


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
        if (identify == null) {
            identify = "0";
        }
        String jcode = icode + "";
        String selectsql = "";
        if (code.equals("0")) {
            selectsql = "insert into user(username,password,phonenum,email,totalsize,used) values(\""
                    + username + "\",\"" + password + "\",\"" + phonenum + "\",\"" + email + "\",10,0)";
        } else {
            selectsql = "insert into user(username,password,phonenum,email,totalsize,used) values(\""
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

    public static void main( String[] args ) throws ParseException {
//        Date now = new Date();
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");//可以方便地修改日期格式
//        String hehe = dateFormat.format(now);
//        System.out.println(hehe);
        DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
        Date d1 = df.parse("2004/03/26");
        Date d2 = df.parse("2004/03/24");
        long diff = d1.getTime() - d2.getTime();
        long days = diff / (1000 * 60 * 60 * 24);
        System.out.println(days);
    }
}
