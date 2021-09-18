package com.proyect.chat.notify;

import com.proyect.chat.model.Relevance;
import com.proyect.chat.model.Speaker;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class Notify {
   private LocalTime TimeOfLastNotify;
   private Integer unReadMessages;
   private Relevance relevance;
   private Speaker speaker;

   public Notify() {
   }

   public String getTimeOfLastNotify() {
      DateTimeFormatter format = DateTimeFormatter.ofPattern("hh:mm:ss a");
      return TimeOfLastNotify.format(format);
   }

   public Notify setTimeOfLastNotify(Date date) {
      TimeOfLastNotify = LocalTime.parse(date.toString());
      return this;
   }

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

   public Speaker getSpeaker() {
      return speaker;
   }

   public Notify setSpeaker(Speaker speaker) {
      this.speaker = speaker;
      return this;
   }
}
