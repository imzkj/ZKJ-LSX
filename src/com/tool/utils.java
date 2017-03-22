package com.tool;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * Created by ZKJ on 2017/3/22 0022.
 */
public class utils {
    public String streamToString( FileInputStream in ) throws IOException {
        StringBuffer strBuffer = new StringBuffer();
        String line = "";
        BufferedReader reader = new BufferedReader(new InputStreamReader(in,"GBK"));
        line = reader.readLine();
        while(line != null) {
            strBuffer.append(line);
            strBuffer.append("\n");
            line = reader.readLine();
        }
        reader.close();
        return strBuffer.toString();
    }
    public static void main(String[] args) {

    }
}
