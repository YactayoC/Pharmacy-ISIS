package com.proyect.chat.daos.repository;

import com.proyect.chat.model.notify.Notify;

import java.util.List;

public interface NotifyRepository {
   List<Notify> getNotifications();
   Integer getNotificationOfUser(String id);
}
