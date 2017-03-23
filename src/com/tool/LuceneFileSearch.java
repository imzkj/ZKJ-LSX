package com.tool;

/**
 * Created by ZKJ on 2017/3/22 0022.
 */

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.common.File;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.WildcardQuery;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

public class LuceneFileSearch {
    private DataBaseOperation dataBaseOperation = new DataBaseOperation();

    public LuceneFileSearch() throws Exception {
    }

    public List<File> contentSearch( String contents, String username ) throws Exception {
        List<File> fileslist = new ArrayList<File>();
        String indexDir = "d:/luceneindex";
        Directory dir = FSDirectory.getDirectory(indexDir);
        IndexSearcher searcher = new IndexSearcher(dir);
        ScoreDoc[] hits = null;
        Term term = new Term("contents", contents);
        TermQuery query = new TermQuery(term);
        TopDocs topDocs = searcher.search(query, 100);
        hits = topDocs.scoreDocs;
        String key = "";
        for (int i = 0; i < hits.length; i++) {
            Document doc = searcher.doc(hits[i].doc);
            key += doc.get("id") + ",";
        }
        if (!key.equals("")) {
            key = key.substring(0, key.length() - 1);
            String selectSql = "select * from file where owner=\"" + username + "\" and id in(" + key + ")";
            System.out.println(selectSql);
            ResultSet resultSet = dataBaseOperation.querySql(selectSql);
            while(resultSet.next()) {
                File file = new File();
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
        searcher.close();
        dir.close();
        return fileslist;
    }

}

