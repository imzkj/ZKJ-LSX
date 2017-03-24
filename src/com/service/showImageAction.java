package com.service;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.ResultSet;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.tool.DataBaseOperation;
import org.apache.struts2.ServletActionContext;

public class showImageAction extends HttpServlet implements Action {
    private static final long serialVersionUID = 1L;

    public String getUsername() {
        return username;
    }

    public void setUsername( String username ) {
        this.username = username;
    }

    private String username;
    private Map<String, Object> session = ActionContext.getContext().getSession();

    @Override
    protected void doGet( HttpServletRequest req, HttpServletResponse resp )
            throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost( HttpServletRequest req, HttpServletResponse resp )
            throws ServletException, IOException {
        try {
            DataBaseOperation dataBaseOperation = new DataBaseOperation();
            String sql = " SELECT * FROM user WHERE username = \"" + username + "\"";
            ResultSet resultSet = dataBaseOperation.querySql(sql);
            Blob blob = null;
            if (resultSet.next()) {
                blob = resultSet.getBlob("photo");
            }
            InputStream inputStream = blob.getBinaryStream();// IO流
            int length = (int) blob.length();
            byte[] b = new byte[length];
            inputStream.read(b, 0, length);
            PrintWriter out = resp.getWriter();
            InputStream is = new ByteArrayInputStream(b);
            int a = is.read();
            while(a != -1) {
                out.print((char) a);
                a = is.read();
            }
            out.flush();
            out.close();
            /*OutputStream outputStream = resp.getOutputStream();// 从response中获取getOutputStream
            outputStream.write(b);// 写
            inputStream.close();
            outputStream.close();*/
        } catch (Exception e) {
            System.out.println("error");
        }
    }

    @Override
    public String execute() throws Exception {
        try {
            HttpServletResponse response = ServletActionContext.getResponse();
            DataBaseOperation dataBaseOperation = new DataBaseOperation();
            String sql = " SELECT * FROM user WHERE username = \"" + username + "\"";
            ResultSet resultSet = dataBaseOperation.querySql(sql);
            Blob blob = null;
            if (resultSet.next()) {
                blob = resultSet.getBlob("photo");
            }
            if (blob.equals(null)) {
                session.put("hasphoto","0");
            }else {
                session.put("hasphoto","1");
            }
            InputStream inputStream = blob.getBinaryStream();// IO流
            int length = (int) blob.length();
            byte[] b = new byte[length];
            inputStream.read(b, 0, length);
            PrintWriter out = response.getWriter();
            InputStream is = new ByteArrayInputStream(b);
            int a = is.read();
            while(a != -1) {
                out.print((char) a);
                a = is.read();
            }
            out.flush();
            out.close();
            /*OutputStream outputStream = resp.getOutputStream();// 从response中获取getOutputStream
            outputStream.write(b);// 写
            inputStream.close();
            outputStream.close();*/
        } catch (Exception e) {
            System.out.println("error");
        }
        return NONE;
    }
}
