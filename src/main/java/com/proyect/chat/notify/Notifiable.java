package com.proyect.chat.notify;

/***
 * to create a notification format
 * @param <T> final format of the notification
 */
public interface Notifiable<T> {
   T buildNotification();
}
