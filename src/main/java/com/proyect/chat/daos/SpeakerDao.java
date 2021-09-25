package com.proyect.chat.daos;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.UpdateOptions;
import com.proyect.chat.daos.repository.UserRepository;
import com.proyect.chat.model.speaker.Speaker;
import com.proyect.chat.model.speaker.SpeakerBuilder;
import com.proyect.connDB.Mongo;
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
   public void save(Speaker speaker) {

      Mongo mongo = new Mongo();
      MongoDatabase pharmacyChat = mongo.getClient().getDatabase(DATABASE);
      userCollection = pharmacyChat.getCollection(COLLECTION);

      ObjectId id = (speaker.getId() != null) ? speaker.getId() : new ObjectId();

      Bson filterByID = eq("_id", id); //filter for update
      UpdateOptions options = new UpdateOptions().upsert(true); //if _id doesn't exist create a new user

      userCollection.updateOne(filterByID, generateUser(speaker), options);

      mongo.closeConnections();
   }

   @Override
   public List<Speaker> list() {
      List<Speaker> speakers = new ArrayList<>();

      Mongo mongo = new Mongo();
      MongoDatabase pharmacyChat = mongo.getClient().getDatabase(DATABASE);
      userCollection = pharmacyChat.getCollection(COLLECTION);

      //get all users excepted the employees
      Bson filterByIsEmployee = eq("isEmployee", false);
      List<Document> result = userCollection.find(filterByIsEmployee).into(new ArrayList<>());

      //add users to list
      result.forEach(u -> speakers.add(getUser(u)));

      mongo.closeConnections();
      return speakers;
   }

   @Override
   public Speaker list(String id) {
      Speaker speaker = null;
      Mongo mongo = new Mongo();
      MongoDatabase pharmacyChat = mongo.getClient().getDatabase(DATABASE);
      userCollection = pharmacyChat.getCollection(COLLECTION);

      //find by ID
      Bson filterByID = eq("_id", new ObjectId(id));
      Document result = userCollection.find(filterByID).first();
      if (result != null) speaker = getUser(result);

      mongo.closeConnections();
      return speaker;
   }

   /***
    * This method create a user with result of MongoDB
    * @param result result query of MongoDB
    * @return Speaker
    */
   private Speaker getUser(Document result) {

      String name = result.getString("name");
      String email = result.getString("email");
      String username = result.getString("username");
      boolean isEmployee = result.getBoolean("isEmployee");

      return new SpeakerBuilder(result.getObjectId("_id"))
             .name(name)
             .email(email)
             .username(username)
             .isEmployee(isEmployee)
             .build();
   }

   /***
    * This method prepare a speaker for save in mongoDB
    * @param speaker object speaker
    * @return return a Bson ready for save in MongoDB
    */
   private Bson generateUser(Speaker speaker) {
      Bson updatePhoto = set("photo", speaker.getPhoto());

      Bson updateName = set("name", speaker.getName());
      Bson updateUsername = set("username", speaker.getUsername());
      Bson updateEmail = set("email", speaker.getEmail());
      Bson isEmployee = set("isEmployee", speaker.isEmployee());

      return combine(updateName, updateUsername, updateEmail, updatePhoto, isEmployee);
   }

}
