package com.proyect.chat.daos.repository;

import com.proyect.chat.model.Message;
import com.proyect.chat.model.Speaker;

import java.util.List;

public interface MessageRepository {

  //get messages of 10 in 10
  List<Message> getConversation(Speaker emitter, Speaker receiver);

  //send message === insert message
  void saveMessages(List<Message> messages);

  //change field VIEWED message
  void viewed(Speaker emitter);
}
