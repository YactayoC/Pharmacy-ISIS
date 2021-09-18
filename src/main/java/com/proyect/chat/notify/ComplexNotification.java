package com.proyect.chat.notify;

import com.proyect.chat.daos.NotifyDao;
import com.proyect.chat.model.Speaker;
import com.proyect.modelsDAO.UClient.ClientDAO;
import com.proyect.modelsDTO.UClient.Client;

import java.util.List;
import java.util.Map;

public class ComplexNotification implements Notifiable<List<Notify>> {

   //for get the other info of users
   private final Map<String, Client> userMap = new ClientDAO().getMapUsers();


   @Override
   public List<Notify> buildNotification() {
      List<Notify> notifies = new NotifyDao().getNotifications();
      notifies.stream().parallel().forEach(n -> completeUser(n.getSpeaker()));
      return notifies;
   }

   /***
    * <p>Add avatar, email, username from Mysql to speaker</p>
    * @param speaker <span>a speaker list without avatar</span>
    */
   private void completeUser(Speaker speaker) {
      String id = speaker.getId().toString();
      speaker.setPhoto(userMap.get(id).getUser().getAvatar())
             .setEmail(userMap.get(id).getUser().getEmail())
             .setUsername(userMap.get(id).getUsername());
   }
}
