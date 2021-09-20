package com.proyect.chat.daos;

import com.mongodb.client.AggregateIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.InsertManyOptions;
import com.proyect.chat.daos.repository.MessageRepository;
import com.proyect.chat.model.Message;
import com.proyect.chat.model.Speaker;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static com.mongodb.client.model.Filters.*;
import static com.mongodb.client.model.Updates.*;
import static com.proyect.connDB.Mongo.*;

public class MessageDao implements MessageRepository {
  private static final String COLLECTION = "message";
  private MongoCollection<Document> messageCollection;

  @Override
  public List<Message> getConversation(Speaker emitter, Speaker receiver) {
    List<Message> messages = new ArrayList<>();
    try (MongoClient mongoClient = getConnection()) {
      MongoDatabase pharmacyChat = mongoClient.getDatabase(DATABASE);
      messageCollection = pharmacyChat.getCollection(COLLECTION);

      AggregateIterable<Document> conversation = messageCollection
             .aggregate(filterConversation(emitter.getId(), receiver.getId()));

      conversation.into(new ArrayList<>())
             .forEach(m -> messages.add(getConversationMessage(m)));
    }
    return messages;
  }

  @Override
  public void saveMessages(List<Message> messages) {
    try (MongoClient mongoClient = getConnection()) {
      MongoDatabase pharmacyChat = mongoClient.getDatabase(DATABASE);
      messageCollection = pharmacyChat.getCollection(COLLECTION);

      if (messages.size() == 1) {
        messageCollection.insertOne(generateMessage(messages.get(0)));
      } else {
        List<Document> conversation = new ArrayList<>();
        messages.forEach(message ->
               conversation.add(generateMessage(message))
        );
        InsertManyOptions options = new InsertManyOptions().ordered(false);
        messageCollection.insertMany(conversation, options);
      }
    }
  }

  @Override
  public void viewed(Speaker emitter) {
    try (MongoClient mongoClient = getConnection()) {
      MongoDatabase pharmacyChat = mongoClient.getDatabase(DATABASE);
      messageCollection = pharmacyChat.getCollection(COLLECTION);

      Bson filter = eq("idEmitter", emitter.getId());
      Bson updateViewed = set("viewed", true);

      messageCollection.updateMany(filter, updateViewed);
    }
  }

  private Document generateMessage(Message message) {
    return new Document("_id", new ObjectId())
           .append("idEmitter", message.getEmitter().getId())
           .append("idReceiver", message.getReceiver().getId())
           .append("content", message.getContent())
           .append("relevance", message.getRelevance().toString())
           .append("viewed", message.isViewed())
           .append("createdAt", message.getCreatedAt());
  }

  private Message getConversationMessage(Document result) {
      //var createdAt = LocalDateTime.parse(result.getDate("time").toString()); //parse date to localDateTime
      var emitter = new Speaker();
      emitter.setName(result.getString("emitterName"))
             .setUsername(result.getString("username"))
             .setEmployee(result.getBoolean("emitterIsEmployee"))
             .setPhoto(result.getString("photo"));

      var message = new Message();
      message.setId(result.getObjectId("_id"))
             .setEmitter(emitter)
             .setContent(result.getString("message"))
      /*.setCreatedAt(createdAt)*/;

      return message;
  }

  //TODO: optimize this pipeliene
  private List<Document> filterConversation(ObjectId emitter, ObjectId receiver) {
    Document in = new Document("$in", Arrays.asList(emitter, receiver));
        /*$match: {
            idEmitter:{$in: [ emitter, receiver]},
            idReceiver:{$in: [ emitter, receiver]},
          }*/
    Document match = new Document("$match", new Document("idEmitter", in).append("idReceiver", in));

    return Arrays.asList(match, new Document("$limit", 10L),
           new Document("$lookup",
                  new Document("from", "user")
                         .append("localField", "idEmitter")
                         .append("foreignField", "_id")
                         .append("as", "emitter")),
           new Document("$unwind",
                  new Document("path", "$emitter")
                         .append("preserveNullAndEmptyArrays", true)),
           new Document("$lookup",
                  new Document("from", "user")
                         .append("localField", "idReceiver")
                         .append("foreignField", "_id")
                         .append("as", "receiver")),
           new Document("$unwind",
                  new Document("path", "$receiver")
                         .append("preserveNullAndEmptyArrays", true)),
           new Document("$project",
                  new Document("emitterIsEmployee", "$emitter.isEmployee")
                         .append("emitterName", "$emitter.name")
                         .append("message", "$content")
                         .append("username",
                                new Document("$ifNull", Arrays.asList("$emitter.username", "$emitter.name")))
                         .append("time",
                                new Document("$hour", "$createdAt"))
                         .append("photo", "$emitter.photo"))
    );
  }
}
