package com.proyect.connDB;

import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;

public class Mongo {
    public final static String DATABASE = "chatIcis";
    public final static String URL_CONNECTION = "mongodb://localhost:27017/?readPreference=primary&appname=MongoDB%20Compass&directConnection=true&ssl=false";
    protected final ConnectionString CONNECTION_STRING = new ConnectionString(URL_CONNECTION);
    private MongoClient client;

    public Mongo() {
        this.client = createMongoClient();
    }

    public MongoClient getClient() {
        return client;
    }

    private MongoClient createMongoClient() {
        MongoClientSettings mcs = MongoClientSettings.builder()
               .applyConnectionString(CONNECTION_STRING)
               .build();

        return MongoClients.create(mcs);
    }

    public MongoClient resetMongoClient() {
        client.close();
        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        return client = createMongoClient();
    }

    public void closeConnections() {
        client.close();
    }

}
