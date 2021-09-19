package com.proyect.chat.notify;

import com.proyect.chat.model.Relevance;
import com.proyect.chat.model.Speaker;

import java.text.DateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class Notify {
   private Date timeOfLastNotify;
   private Long unReadMessages;
   private Relevance relevance;
   private Speaker speaker;

   public Notify() {
   }

   public String getTimeOfLastNotify() {
      DateFormat dateformat = DateFormat.getDateInstance(DateFormat.SHORT);
      return dateformat.format(this.timeOfLastNotify);
   }

   public Notify setTimeOfLastNotify(Date date) {
      this.timeOfLastNotify = date;
      return this;
   }

   public Long getUnReadMessages() {
      return unReadMessages;
   }

   public Notify setUnReadMessages(Long unReadMessages) {
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

   public Speaker getSpeaker() {
      return speaker;
   }

   public Notify setSpeaker(Speaker speaker) {
      this.speaker = speaker;
      return this;
   }
}
