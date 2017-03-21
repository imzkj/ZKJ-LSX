package com.common;

/**
 * Created by ZKJ on 2017/3/17 0017.
 */
public class File {
    private String filename;
    private String dbpath;
    private String owner;
    private String tag;
    private String size;
    private String used;

    public String getUsed() {
        return used;
    }

    public void setUsed( String used ) {
        this.used = used;
    }

    private String type;

    @Override
    public String toString() {
        return "File{" +
                "filename='" + filename + '\'' +
                ", dbpath='" + dbpath + '\'' +
                ", owner='" + owner + '\'' +
                ", tag='" + tag + '\'' +
                ", size='" + size + '\'' +
                ", type='" + type + '\'' +
                ", md5='" + md5 + '\'' +
                '}';
    }

    public String getTag() {
        return tag;
    }

    public void setTag( String tag ) {
        this.tag = tag;
    }

    public String getMd5() {
        return md5;
    }

    public void setMd5( String md5 ) {
        this.md5 = md5;
    }

    private String md5;

    public String getFilename() {
        return filename;
    }

    public void setFilename( String filename ) {
        this.filename = filename;
    }

    public String getDbpath() {
        return dbpath;
    }

    public void setDbpath( String dbpath ) {
        this.dbpath = dbpath;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner( String owner ) {
        this.owner = owner;
    }


    public String getSize() {
        return size;
    }

    public void setSize( String size ) {
        this.size = size;
    }

    public String getType() {
        return type;
    }

    public void setType( String type ) {
        this.type = type;
    }
}
