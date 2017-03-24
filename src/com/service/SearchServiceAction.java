package com.service;

import com.common.File;
import com.opensymphony.xwork2.ActionContext;
import com.tool.DataBaseOperation;
import com.tool.LuceneFileSearch;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by ZKJ on 2017/3/22 0022.
 */
public class SearchServiceAction {
    private String username;
    private String search;
    private String searchType;
    private LuceneFileSearch fileSearch = new LuceneFileSearch();
    private DataBaseOperation dataBaseOperation = new DataBaseOperation();

    public List<File> getFileslist() {
        return fileslist;
    }

    public void setFileslist( List<File> fileslist ) {
        this.fileslist = fileslist;
    }

    public List<File> fileslist;

    public String getUsername() {
        return username;
    }

    public void setUsername( String username ) {
        this.username = username;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch( String search ) {
        this.search = search;
    }

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType( String searchType ) {
        this.searchType = searchType;
    }

    public SearchServiceAction() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        username = (String) session.get("username");
    }

    public String search() throws Exception {
        fileslist = new ArrayList<File>();
        if (searchType.equals("FileName")) {
            searchFileName();
        }
        if (searchType.equals("FileContext")) {
            searchFileContent();
        }
        return "ok";
    }

    public void searchFileName() throws Exception {
        String sql = "select * from file where owner=\"" + username + "\" and filename like \"%" + search + "%\"";
        ResultSet resultSet = dataBaseOperation.querySql(sql);
        while(resultSet.next()) {
            File file = new File();
            file.setId(resultSet.getString("id"));
            file.setFilename(resultSet.getString("filename"));
            file.setDbpath(resultSet.getString("dbpath"));
            file.setOwner(resultSet.getString("owner"));
            file.setTag(resultSet.getString("tag"));
            file.setSize(resultSet.getString("size"));
            file.setType(resultSet.getString("type"));
            file.setMd5(resultSet.getString("md5"));
            fileslist.add(file);
        }
    }

    public void searchFileContent() throws Exception {
        fileslist = fileSearch.contentSearch(search, username);
    }
}
