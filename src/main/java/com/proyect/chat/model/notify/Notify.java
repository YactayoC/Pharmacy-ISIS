package com.proyect.chat.model.notify;

import com.proyect.chat.model.Relevance;
import com.proyect.chat.model.speaker.Speaker;

import java.time.LocalDateTime;


public class Notify {
   protected Integer unReadMessages;
   protected Relevance relevance;
   protected LocalDateTime date;
   protected Speaker emitter;

   protected Notify(NotifyBuilder builder) {
      this.unReadMessages = builder.unReadMessages;
      this.relevance = builder.relevance;
      this.date = builder.date;
      this.emitter = builder.emitter;
   }

   public Integer getUnReadMessages() {
      return unReadMessages;
   }

   public Relevance getRelevance() {
      return relevance;
   }

   public LocalDateTime getDate() {
      return date;
   }

   public Speaker getEmitter() {
      return emitter;
   }

   public void setEmitter(Speaker emitter) {
      this.emitter = emitter;
   }
}
