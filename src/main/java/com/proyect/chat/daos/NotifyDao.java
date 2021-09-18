package com.proyect.chat.daos;

import com.mongodb.client.AggregateIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.proyect.chat.daos.repository.NotifyRepository;
import com.proyect.chat.model.Relevance;
import com.proyect.chat.model.Speaker;
import com.proyect.chat.notify.Notify;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static com.mongodb.client.model.Filters.eq;
import static com.proyect.connDB.Mongo.DATABASE;
import static com.proyect.connDB.Mongo.getConnection;

public class NotifyDao implements NotifyRepository {
   private static final String COLLECTION = "user";
   private MongoCollection<Document> userCollection;

   @Override
   public List<Notify> getNotifications() {
      List<Notify> notifies = new ArrayList<>();
      //create a connection with MongoDB
      try (MongoClient mongoClient = getConnection()) {
         MongoDatabase pharmacyChat = mongoClient.getDatabase(DATABASE);
         userCollection = pharmacyChat.getCollection(COLLECTION);

         //get all users excepted the employees
         AggregateIterable<Document> results = userCollection.aggregate(findNotifications());
         //add users to list
         results.into(new ArrayList<>()).forEach(r -> notifies.add(makeNotify(r)));
      }
      return notifies;
   }

   //TODO:add pipeline for get the unRead messages
   @Override
   public Integer getNotificationOfUser(String id) {

      try (MongoClient mongoClient = getConnection()) {
         MongoDatabase pharmacyChat = mongoClient.getDatabase(DATABASE);
         userCollection = pharmacyChat.getCollection(COLLECTION);

         //find by ID
         Bson filterByID = eq("_id", new ObjectId(id));
         Document result = userCollection.find(filterByID).first();
      }
      return 1;
   }

   //read
   private Notify makeNotify(Document result) {
      //create a simple speaker with
      Speaker speaker = new Speaker()
             .setId(result.getObjectId("_id"));

      //create a Relevance
      Relevance relevance = Relevance.valueOf(result.getString("relevance"));

      //create
      return new Notify()
             .setSpeaker(speaker)
             .setRelevance(relevance)
             .setTimeOfLastNotify(result.getDate("createdAt"))
             .setUnReadMessages(result.getInteger("unRead"));
   }


   /***
    * This craft the Pipeline for get notify
    * This method get the number of unread messages (_id:ObjectId and unRead:Integer)
    * @return aggreate query
    */
   private List<Document> findNotifications() {
      //TODO: Upgrate this pipeline
      return Arrays.asList(new Document("$match",
                    new Document("isEmployee", false)),
             new Document("$lookup",
                    new Document("from", "message")
                           .append("localField", "_id")
                           .append("foreignField", "idEmitter")
                           .append("as", "messages")),
             new Document("$project",
                    new Document("_id", 1L)
                           .append("messages", 1L)),
             new Document("$unwind",
                    new Document("path", "$messages")
                           .append("preserveNullAndEmptyArrays", false)),
             new Document("$project",
                    new Document("_id", 1L)
                           .append("unRead",
                                  new Document("$cond", Arrays.asList("$messages.viewed",
                                         new Document("$sum", 0L),
                                         new Document("$sum", 1L))))),
             new Document("$group",
                    new Document("_id", "$_id")
                           .append("unRead",
                                  new Document("$sum", "$unRead"))));
   }
}
