package com.proyect.chat.utils.custom.notify;

import com.proyect.chat.daos.NotifyDao;
import com.proyect.chat.model.notify.Notify;
import com.proyect.chat.model.speaker.Speaker;
import com.proyect.chat.model.speaker.SpeakerBuilder;
import com.proyect.modelsDAO.UClient.ClientDAO;
import com.proyect.modelsDTO.UClient.Client;

import java.util.List;
import java.util.Map;

public class ComplexNotification implements Notifiable<List<Notify>> {

   //for get the other info of users
   private final Map<String, Client> userMap;

   public ComplexNotification() {
      this.userMap = new ClientDAO().getMapUsers();
   }

   @Override
   public List<Notify> build() {
      List<Notify> notifies = new NotifyDao().getNotifications();
      notifies.forEach(n -> n.setEmitter(completeUser(n.getEmitter())));
      return notifies;
   }

   /***
    * <p>Add avatar, email, username from Mysql to speaker</p>
    * @param speaker <span>a speaker list without avatar</span>
    */
   private Speaker completeUser(Speaker speaker) {
      String id = speaker.getId().toString();
      return new SpeakerBuilder(speaker.getId()).photo(userMap.get(id).getUser().getAvatar())
             .email(userMap.get(id).getUser().getEmail())
             .username(userMap.get(id).getUsername()).build();
   }
}