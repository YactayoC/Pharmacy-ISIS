package com.proyect.chat.daos;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.UpdateOptions;
import com.mongodb.client.result.UpdateResult;
import com.proyect.chat.daos.repository.UserRepository;
import com.proyect.chat.model.Speaker;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import java.util.ArrayList;
import java.util.List;

import static com.mongodb.client.model.Filters.*;
import static com.mongodb.client.model.Updates.*;
import static com.proyect.connDB.Mongo.*;

public class SpeakerDao implements UserRepository {
    private static final String COLLECTION = "user";
    private MongoCollection<Document> userCollection;

    @Override
    public boolean save(Speaker speaker) {
        boolean wasInserted;
        try (MongoClient mongoClient = getConnection()) {
            MongoDatabase pharmacyChat = mongoClient.getDatabase(DATABASE);
            userCollection = pharmacyChat.getCollection(COLLECTION);

            if (speaker.getId() == null) speaker.setId(new ObjectId());
            System.out.println(speaker.getId());
            Bson filterByID = eq("_id", speaker.getId()); //filter for update
            UpdateOptions options = new UpdateOptions().upsert(true); //if _id doesn't exist create a new user
            UpdateResult result = userCollection
                    .updateOne(filterByID, generateUser(speaker), options);
            //if the document exist return true
            wasInserted = result.wasAcknowledged();
        }
        return wasInserted;
        // if true == update , if false == create new user
    }

    @Override
    public List<Speaker> list() {
        List<Speaker> speakers = new ArrayList<>();
        //create a connection with MongoDB
        try (MongoClient mongoClient = getConnection()) {
            MongoDatabase pharmacyChat = mongoClient.getDatabase(DATABASE);
            userCollection = pharmacyChat.getCollection(COLLECTION);

            //get all users excepted the employees
            Bson filterByIsEmployee = eq("isEmployee", false);
            List<Document> result = userCollection.find(filterByIsEmployee).into(new ArrayList<>());
            //add users to list
            result.forEach(u -> speakers.add(getUser(u)));
        }
        return speakers;
    }

    @Override
    public Speaker list(String id) {
        Speaker speaker = null;
        try (MongoClient mongoClient = getConnection()) {
            MongoDatabase pharmacyChat = mongoClient.getDatabase(DATABASE);
            userCollection = pharmacyChat.getCollection(COLLECTION);

            //find by ID
            Bson filterByID = eq("_id", new ObjectId(id));
            Document result = userCollection.find(filterByID).first();
            if (result != null) speaker = getUser(result);
        }
        return speaker;
    }

    @Override
    public void saveAvatar(Speaker speaker) {
        try (MongoClient mongoClient = getConnection()) {
            MongoDatabase pharmacyChat = mongoClient.getDatabase(DATABASE);
            userCollection = pharmacyChat.getCollection(COLLECTION);

            Bson filterByID = eq("_id", speaker.getId()); //filter for update
            UpdateResult result = userCollection
                    .updateOne(filterByID, changeAvatar(speaker));
        }
    }

    private Speaker getUser(Document result) {
        return new Speaker(result.getObjectId("_id"),
                result.getString("name"),
                result.getString("username"),
                result.getString("email"),
                result.getString("photo"),
                result.getBoolean("isEmployee")
        );
    }

    //create default client
    private Bson generateUser(Speaker speaker) {

        Bson updatePhoto = set("photo", speaker.getPhoto());

        Bson updateName = set("name", speaker.getName());
        Bson updateUsername = set("username", speaker.getUsername());
        Bson updateEmail = set("email", speaker.getEmail());

        return combine(updateName, updateUsername, updateEmail, updatePhoto);
    }

    private Bson changeAvatar(Speaker speaker) {
        Bson updatePhoto = set("photo", speaker.getPhoto());
        return combine(updatePhoto);
    }
}
