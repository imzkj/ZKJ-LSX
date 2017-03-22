package com.tool;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import net.paoding.analysis.analyzer.PaodingAnalyzer;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

/**
 * Created by ZKJ on 2017/3/22 0022.
 */
public class LuceneFileIndex {


    public void index( String id, String contents ) throws Exception {
        String indexDir = "d:\\luceneindex";
        Analyzer analyzer = new PaodingAnalyzer();
        Directory dir = FSDirectory.getDirectory(indexDir);
        IndexWriter writer = new IndexWriter(dir, analyzer, true, IndexWriter.MaxFieldLength.UNLIMITED);
        Document document = new Document();
        document.add(new Field("id", id, Field.Store.YES, Field.Index.NOT_ANALYZED));
        document.add(new Field("contents", contents, Field.Store.YES, Field.Index.ANALYZED));
        writer.addDocument(document);
        writer.close();
        dir.close();
    }

}
