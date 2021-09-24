package com.proyect.chat.model.message;

import com.proyect.chat.model.Relevance;
import com.proyect.chat.model.speaker.Speaker;
import org.bson.types.ObjectId;

import java.time.LocalDateTime;

public class MessageBuilder {
   protected ObjectId id;
   protected Speaker emitter;
   protected Speaker receiver;
   protected String content;
   protected Relevance relevance;
   protected boolean viewed;
   protected LocalDateTime date;

   public MessageBuilder(Speaker emitter, Speaker receiver, String content) {
      this.emitter = emitter;
      this.receiver = receiver;
      this.content = content;
   }

   public MessageBuilder id(ObjectId id) {
      this.id = id;
      return this;
   }

   public MessageBuilder relevance(Relevance relevance) {
      this.relevance = relevance;
      return this;
   }

   public MessageBuilder viewed(boolean viewed) {
      this.viewed = viewed;
      return this;
   }

   public MessageBuilder date(LocalDateTime date) {
      this.date = date;
      return this;
   }

   public Message build() {
      return new Message(this);
   }
}
