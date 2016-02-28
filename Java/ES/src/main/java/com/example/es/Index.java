package com.example.es;

import com.google.common.collect.Maps;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.common.logging.ESLogger;
import org.elasticsearch.common.logging.ESLoggerFactory;

import java.util.Map;
import java.util.logging.Logger;

/**
 * Created by cqshinn on 28/02/2016.
 */
public class Index {
    private static Logger log = Logger.getLogger(Index.class.getName());
    public static void main(String[] args){
        Client es = ES.getES();
        Map<String,	Object> document1= Maps.newConcurrentMap();
        document1.put("screen_name",	"d_bharvi");
        document1.put("followers_count",	2000);
        document1.put("create_at",	"2015-09-20");
        IndexResponse response = es.prepareIndex().setIndex("index_name").setType("doc_type")
                .setId("1").setSource(document1).execute().actionGet();
        log.info("Create new");
    }
}
