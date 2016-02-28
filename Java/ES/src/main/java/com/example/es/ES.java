package com.example.es;

import	org.elasticsearch.client.Client;
import	org.elasticsearch.client.transport.TransportClient;
import	org.elasticsearch.common.settings.Settings;
import	org.elasticsearch.common.transport.InetSocketTransportAddress;

import java.net.InetAddress;

/**
 * Created by cqshinn on 28/02/2016.
 */
public class ES {

    private static Client client = null;
    private static Settings settings = null;
    private final static String HOST = "localhost";
    private final static int PORT = 9300;

    public static Client getES(String host,int port){
        if(client == null){
            settings = Settings.settingsBuilder()
                    .put("cluster.name","elasticsearch")
                    .put("client.transport.ping_timeout","10s")
                    .put("path.home","/").build();
            try{
                client = TransportClient.builder().settings(settings)
                        .build().addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName(host),port));

            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
        return client;
    }

    public static Client getES(){
        return getES(HOST,PORT);
    }
}
