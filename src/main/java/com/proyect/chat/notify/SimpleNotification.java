package com.proyect.chat.notify;

import com.proyect.chat.daos.NotifyDao;

public class SimpleNotification implements Notifiable<String> {

   private final Integer unReadMessages;

   public SimpleNotification(String id) {
      this.unReadMessages = new NotifyDao().getNotificationOfUser(id);
   }

   @Override
   public String buildNotification() {
      return unReadMessages.toString();
   }
}
