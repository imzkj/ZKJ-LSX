package com.common;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
/**
 * Created by ZKJ on 2017/3/23 0023.
 */
public class TMTask {
    Timer timer;

    public TMTask(){
        Date time = getTime();
        System.out.println("指定时间time=" + time);
        timer = new Timer();
        timer.schedule(new TimerDelete(), time);
    }

    public Date getTime(){
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 20);
        calendar.set(Calendar.MINUTE, 48);
        calendar.set(Calendar.SECOND, 00);
        Date time = calendar.getTime();

        return time;
    }

    public static void main(String[] args) {
        new TMTask();
    }
}
