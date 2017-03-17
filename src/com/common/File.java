package com.common;

/**
 * Created by ZKJ on 2017/3/17 0017.
 */
public class File {
    private String filename;
    private String dbpath;
    private String owner;
    private String hdfspath;
    private String size;
    private String type;

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

    public String getHdfspath() {
        return hdfspath;
    }

    public void setHdfspath( String hdfspath ) {
        this.hdfspath = hdfspath;
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
