package com.proyect.chat.daos;

import com.mongodb.client.AggregateIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.InsertManyOptions;
import com.proyect.chat.daos.repository.MessageRepository;
import com.proyect.chat.model.message.Message;
import com.proyect.chat.model.message.MessageBuilder;
import com.proyect.chat.model.speaker.Speaker;
import com.proyect.chat.model.speaker.SpeakerBuilder;
import com.proyect.connDB.Mongo;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static com.mongodb.client.model.Aggregates.*;
import static com.mongodb.client.model.Filters.*;
import static com.mongodb.client.model.Updates.*;
import static com.proyect.connDB.Mongo.*;

public class MessageDao implements MessageRepository {
   private static final String COLLECTION = "message";

   @Override
   public List<Message> getConversation(Speaker emitter, Speaker receiver) {
      List<Message> messages = new ArrayList<>();
      Mongo mongo = new Mongo();
      MongoDatabase pharmacyChat = mongo.getClient().getDatabase(DATABASE);
      MongoCollection<Document> messageColl = pharmacyChat.getCollection(COLLECTION);

      AggregateIterable<Document> conversation = messageColl
             .aggregate(Arrays.asList(getConversationById(emitter.getId(), receiver.getId())));

      conversation.into(new ArrayList<>())
             .forEach(m -> messages.add(getMessage(m)));
      mongo.closeConnections();
      return messages;
   }

   @Override
   public void saveMessages(List<Message> messages) {
      Mongo mongo = new Mongo();
      MongoDatabase pharmacyChat = mongo.getClient().getDatabase(DATABASE);
      MongoCollection<Document> messageColl = pharmacyChat.getCollection(COLLECTION);

      if (messages.size() == 1) {
         messageColl.insertOne(generateBsonMessage(messages.get(0)));
      } else {
         List<Document> conversation = new ArrayList<>();
         messages.forEach(message ->
                conversation.add(generateBsonMessage(message))
         );
         InsertManyOptions options = new InsertManyOptions().ordered(false);
         messageColl.insertMany(conversation, options);
      }
      mongo.closeConnections();
   }

   @Override
   public void viewed(Speaker emitter) {
      Mongo mongo = new Mongo();
      MongoDatabase pharmacyChat = mongo.getClient().getDatabase(DATABASE);
      MongoCollection<Document> messageColl = pharmacyChat.getCollection(COLLECTION);

      Bson filter = eq("idEmitter", emitter.getId());
      Bson updateViewed = set("viewed", true);

      messageColl.updateMany(filter, updateViewed);
      mongo.closeConnections();
   }

   private Document generateBsonMessage(Message message) {
      return new Document("_id", new ObjectId())
             .append("idEmitter", message.getEmitter().getId())
             .append("idReceiver", message.getReceiver().getId())
             .append("content", message.getContent())
             .append("relevance", message.getRelevance().toString())
             .append("viewed", message.isViewed())
             .append("createdAt", message.getCreatedAt());
   }

   private Message getMessage(Document result) {
      Speaker emitter = new SpeakerBuilder(new ObjectId(result.getString("idEmitter")))
             .isEmployee(result.getBoolean("isEmployee"))
             .build();
      Speaker receiver = new SpeakerBuilder(new ObjectId(result.getString("idReceiver"))).build();
      String content = result.getString("content");
      LocalDateTime date = LocalDateTime.parse(result.getString("date"));


      return new MessageBuilder(emitter, receiver, content)
             .date(date)
             .build();
   }

   private Bson[] getConversationById(ObjectId emitter, ObjectId receiver) {
      Bson match = match(in("idEmitter", emitter, in("idReceiver", receiver)));
      Bson lookup = lookup("user", "idEmitter", "_id", "emitter");
      Bson unwind = unwind("$emitter");
      Bson project = new Document("$project",
             new Document("_id", 1L)
                    .append("idEmitter", 1L)
                    .append("idReceiver", 1L)
                    .append("date",
                           new Document("$dateToString",
                                  new Document("format", "%Y-%m-%dT%H:%M")
                                         .append("date", "$date")))
                    .append("content", 1L)
                    .append("isEmployee", "$emitter.isEmployee"));
      return new Bson[]{match, lookup, unwind, project};
   }

}
