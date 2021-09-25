package com.proyect.chat.model.notify;

import com.proyect.chat.model.Relevance;
import com.proyect.chat.model.speaker.Speaker;


import java.time.LocalDateTime;

public class NotifyBuilder {
   protected Long unReadMessages;
   protected Relevance relevance;
   protected LocalDateTime date;
   protected Speaker emitter;

   public NotifyBuilder(Long unReadMessages, Speaker emitter) {
      this.unReadMessages = unReadMessages;
      this.emitter = emitter;
   }

   public NotifyBuilder relevance(Relevance relevance) {
      this.relevance = relevance;
      return this;
   }

   public NotifyBuilder date(LocalDateTime date) {
      this.date = date;
      return this;
   }

   public Notify build() {
      return new Notify(this);
   }

}
