package com.tool;

import java.io.*;
import java.net.URI;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.*;
import org.apache.hadoop.io.IOUtils;

/**
 * Created by ZKJ on 2017/3/16 0016.
 */
public class HDFSOperation {

    private Configuration conf;
    private FileSystem fs;
    private String localPath;
    private String dbPath;
    private String hdfsPath;




    public HDFSOperation() throws Exception {
        conf = new Configuration();
        fs = FileSystem.get(conf);
        //  fs = FileSystem.get(new URI("hdfs://192.168.58.29:8020"), conf, "zkj");
    }


    /*
      上传文件
     */
    private boolean upLoad(FileInputStream in,String hdfsPath) throws IOException {

        Path path = new Path(hdfsPath);
        if (fs.exists(path)) {
            System.out.println("文件已经存在");
            return false;
        }
        FSDataOutputStream out = fs.create(new Path(hdfsPath));
        IOUtils.copyBytes(in, out, 4096, true);
        in.close();
        out.close();
        return true;
    }

    /*
    下载文件
     */
    private boolean downLoad() throws IOException {
        Path path = new Path(hdfsPath);
        if (!fs.exists(path)) {
            System.out.println("云端文件不存在");
            return false;
        }
        Path dstPath = new Path(localPath);
        fs.copyToLocalFile(false, path, dstPath);
        return true;
    }

    /*删除文件
     */
    private boolean deleteFile() {
        try {
            fs.delete(new Path(hdfsPath), true);
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    //创建文件夹
    private boolean mkdir() {
        try {
            fs.mkdirs(new Path(localPath));
            fs.close();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }


    /*删除文件夹*/
    private boolean deleteDir() {
        try {
            fs.delete(new Path(localPath));
            fs.close();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public static void main( String[] args ) throws Exception {
        HDFSOperation h = new HDFSOperation();
        System.out.println(h.deleteDir() ? 1 : 0);
    }
}