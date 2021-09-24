package com.proyect.chat.notify;

import com.proyect.chat.model.Relevance;
import com.proyect.chat.model.speaker.Speaker;

import java.time.LocalDateTime;


public class Notify {

   private Integer unReadMessages;
   private Relevance relevance;
   private LocalDateTime date;
   private Speaker emitter;

   public Integer getUnReadMessages() {
      return unReadMessages;
   }

   public Notify setUnReadMessages(Integer unReadMessages) {
      this.unReadMessages = unReadMessages;
      return this;
   }

   public Relevance getRelevance() {
      return relevance;
   }

   public Notify setRelevance(Relevance relevance) {
      this.relevance = relevance;
      return this;
   }

   public LocalDateTime getDate() {
      return date;
   }

   public Notify setDate(LocalDateTime date) {
      this.date = date;
      return this;
   }
}
