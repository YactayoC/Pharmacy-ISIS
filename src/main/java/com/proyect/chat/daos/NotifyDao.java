package com.proyect.chat.daos;

import com.mongodb.client.AggregateIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.proyect.chat.daos.repository.NotifyRepository;
import com.proyect.chat.model.Relevance;
import com.proyect.chat.model.notify.NotifyBuilder;
import com.proyect.chat.model.speaker.Speaker;
import com.proyect.chat.model.notify.Notify;
import com.proyect.chat.model.speaker.SpeakerBuilder;
import com.proyect.connDB.Mongo;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

import static com.mongodb.client.model.Accumulators.*;
import static com.mongodb.client.model.Aggregates.*;
import static com.mongodb.client.model.Filters.*;
import static com.mongodb.client.model.Projections.*;
import static com.proyect.connDB.Mongo.DATABASE;

public class NotifyDao implements NotifyRepository {
   private static final String COLLECTION = "user";

   @Override
   public List<Notify> getNotifications() {
      List<Notify> notifies = new ArrayList<>();

      Mongo mongo = new Mongo();
      MongoDatabase pharmacyChat = mongo.getClient().getDatabase(DATABASE);
      MongoCollection<Document> userColl = pharmacyChat.getCollection(COLLECTION);

      AggregateIterable<Document> results = userColl.aggregate(Arrays.asList(allUnreadMessages()));
      results.forEach(r -> notifies.add(makeNotify(r)));

      mongo.closeConnections();
      return notifies;
   }

   @Override
   public Integer getNotificationOfUser(String id) {
      Integer unReadMessages;

      Mongo mongo = new Mongo();
      MongoDatabase pharmacyChat = mongo.getClient().getDatabase(DATABASE);
      MongoCollection<Document> messageColl = pharmacyChat.getCollection("message");

      AggregateIterable<Document> result = messageColl.aggregate(findNotificationById(id));
      unReadMessages = Objects.requireNonNull(result.first()).getInteger("unRead");

      mongo.closeConnections();
      return unReadMessages;
   }

   private Notify makeNotify(Document result) {
      String simpleDate = (result.getString("date") != null)? result.getString("date"):"2021-09-22T05:00";
      Speaker emitter = new SpeakerBuilder(result.getObjectId("_id")).build();
      Relevance relevance = Relevance.valueOf(result.getString("relevance"));
      LocalDateTime date = LocalDateTime.parse(simpleDate);
      //2021-09-22T05:00
      return new NotifyBuilder(result.getLong("unread"), emitter)
             .relevance(relevance)
             .date(date)
             .build();
   }


   /***
    * This craft the Pipeline for get notify
    * This method get the number of unread messages (_id:ObjectId and unRead:Integer)
    * @return Bson[] with query of aggregate
    */
   private Bson[] allUnreadMessages() {
      Bson match = match(eq("isEmployee", false));
      Bson lookup = lookup("message", "_id", "idEmitter", "messages");
      Bson firstProject = project(fields(include("_id", "messages")));
      Bson unwind = unwind("$messages");
      Bson secondProject = new Document("$project", new Document("_id", 1L)
             .append("relevance", "$messages.relevance")
             .append("date",
                    new Document("$dateToString",
                           new Document("format", "%Y-%m-%dT%H:%M ")
                                  .append("date", "$messages.date")))
             .append("unRead",
                    new Document("$cond", Arrays.asList("$messages.viewed", 0L, 1L))));

      Bson group = group("$_id",
             sum("unread", "$unRead"),
             first("relevance", "$relevance"),
             first("date", "$date"));

      return new Bson[]{match, lookup, firstProject, unwind, secondProject, group};
   }

   /***
    * This creates a pipeline for get the unread messages of user
    * @param idEmitter the id of user to find
    * @return aggregate query
    */
   private List<Document> findNotificationById(String idEmitter) {
      return Arrays.asList(new Document("$match",
                    new Document("$and", Arrays.asList(new Document("idEmitter",
                                  new ObjectId(idEmitter)),
                           new Document("viewed", false)))),
             new Document("$count", "unRead"));
   }
}
