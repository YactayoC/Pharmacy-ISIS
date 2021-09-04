package com.proyect.connDB;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;

public class ConnectionMDB {

    private final static String CONNECTION_STRING = "mongodb://localhost:27017/?readPreference=primary&appname=MongoDB%20Compass" +
            "&directConnection=true&ssl=false";
    public final static String DATABASE = "idChat";
    private static MongoClient instance;

    private void Mongo (){}

    public static MongoClient getConnection() {
        if (instance == null) {
            instance = MongoClients.create(CONNECTION_STRING);
        }
        return instance;
    }
/*  return a database
    public MongoDatabase getConnection() {
        MongoClient mongoClient = MongoClients.create(CONNECTION_STRING);
        return mongoClient.getDatabase(DATABASE);
    }*/
}
