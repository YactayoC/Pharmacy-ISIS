package com.proyect.chat.daos;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.UpdateOptions;
import com.mongodb.client.result.UpdateResult;
import com.proyect.chat.daos.repository.UserRepository;
import com.proyect.chat.model.User;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import java.util.ArrayList;
import java.util.List;

import static com.mongodb.client.model.Filters.*;
import static com.proyect.connDB.Mongo.*;

public class UserDao implements UserRepository {
  private static final String COLLECTION = "user";
  private MongoCollection<Document> userCollection;

  @Override
  public boolean save(User user) {
    boolean wasInserted;
    try(MongoClient mongoClient = getConnection()) {
      MongoDatabase pharmacyChat = mongoClient.getDatabase(DATABASE);
      userCollection = pharmacyChat.getCollection(COLLECTION);

      if (user.getId() == null) user.setId(new ObjectId());

      Bson filterByID = eq("_id", user.getId()); //filter for update
      UpdateOptions options = new UpdateOptions().upsert(true); //if _id doesn't exist create a new user
      UpdateResult result = userCollection
             .updateOne(filterByID, generateUser(user), options);
      //if the document exist return true
      wasInserted = result.wasAcknowledged();
    }
    return wasInserted;
    // if true == update , if false == create new user
  }

  @Override
  public List<User> list() {
    List<User> users = new ArrayList<>();
    //create a connection with MongoDB
    try(MongoClient mongoClient = getConnection()) {
      MongoDatabase pharmacyChat = mongoClient.getDatabase(DATABASE);
      userCollection = pharmacyChat.getCollection(COLLECTION);

      //get all users excepted the employees
      Bson filterByIsEmployee = eq("isEmployee",false);
      List<Document> result = userCollection.find(filterByIsEmployee).into(new ArrayList<>());
      //add users to list
      result.forEach(u -> users.add(getUser(u)));
    }
    return users;
  }

  @Override
  public User list(String id) {
    User user = null;
    try (MongoClient mongoClient = getConnection()) {
      MongoDatabase pharmacyChat = mongoClient.getDatabase(DATABASE);
      userCollection = pharmacyChat.getCollection(COLLECTION);

      //find by ID
      Bson filterByID = eq("_id", new ObjectId(id));
      Document result = userCollection.find(filterByID).first();
      if (result != null) user = getUser(result);
    }
    return user;
  }

  private User getUser(Document result) {
    return new User(result.getObjectId("_id"),
           result.getString("name"),
           result.getString("username"),
           result.getString("email"),
           result.getString("photo"),
           result.getBoolean("isEmployee")
    );
  }

  //create default client
  private Document generateUser(User user) {
    return new Document("_id", user.getId())
           .append("name", user.getName())
           .append("username", user.getUsername())
           .append("email", user.getEmail())
           .append("photo", user.getPhoto())
           .append("isEmployee", false);
  }
}
