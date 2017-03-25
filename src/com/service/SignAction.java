package com.service;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tool.DataBaseOperation;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * Created by ZKJ on 2017/3/25 0025.
 */
public class SignAction extends ActionSupport {
    public String sign() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        Map<String, Object> session = ActionContext.getContext().getSession();
        String username = (String) session.get("username");
        DataBaseOperation dataBaseOperation = new DataBaseOperation();
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        String signday = dateFormat.format(now);
        int signtime;
        String signdaydb = "";
        String updateDay = "update user set signday=\"" + signday + "\" where username=\"" + username + "\"";
        String updateTime = "update user set signtime=";
        String sql = " SELECT * FROM user WHERE username = \"" + username + "\"";
        double size = 0;
        ResultSet rs = dataBaseOperation.querySql(sql);
        if (rs.next()) {
            try {
                signdaydb = (String) rs.getString("signday");
                signtime = rs.getInt("signtime");
                size = rs.getDouble("totalsize");
                DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
                Date d1 = df.parse(signday);
                if (signdaydb.equals("0")) {
                    dataBaseOperation.updateSql(updateDay);
                    updateTime += "1 where username=\"" + username + "\"";
                    dataBaseOperation.updateSql(updateTime);
                    session.put("signtime", "1");
                    request.setAttribute("signmessge", "签到成功,您已连续签到1天,请继续坚持！");
                    return "ok";
                }
                Date d2 = df.parse(signdaydb);
                long diff = d1.getTime() - d2.getTime();
                long days = diff / (1000 * 60 * 60 * 24);
                if (signdaydb.equals(signday)) {
                    request.setAttribute("signmessge", "您今天已经签到过了，明天再来吧！");
                } else {
                    dataBaseOperation.updateSql(updateDay);
                    int temp = signtime + 1;
                    String a = "";
                    a += temp;
                    updateTime += temp + " where username=\"" + username + "\"";
                    session.put("signtime", a);
                    dataBaseOperation.updateSql(updateTime);
                    request.setAttribute("signmessge", "签到成功,您已连续签到" + a + "天,请继续坚持！");
                    if (temp == 7) {
                        size += 10;
                        updateTime = "update user set signtime=7,totalsize=" + size + " where username=\"" + username + "\"";
                        dataBaseOperation.updateSql(updateTime);
                        String aaa = "";
                        aaa += size;
                        session.put("totalsize", aaa);
                        request.setAttribute("signmessge", "您已连续签到7天,恭喜您获得10G免费空间，请再接再厉！");
                    }
                }
            } catch (Exception e) {
            }

        }
        return "ok";
    }
}
