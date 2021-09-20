package com.proyect.chat.websocket;

import com.proyect.chat.daos.MessageDao;
import com.proyect.chat.model.Message;
import com.proyect.chat.utils.DecoderChat;
import com.proyect.chat.utils.EncoderChat;
import jakarta.websocket.*;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;

import java.io.IOException;
import java.util.*;

@ServerEndpoint(value = "/chatIcis/{idUser}",
       encoders = {EncoderChat.class},
       decoders = {DecoderChat.class})
public class ChatIcis {

  private static final Map<String, Session> users = new HashMap<>();

  private static final MessageDao MESSAGE_DAO = new MessageDao();

  private static final List<Message> messages = new ArrayList<>();

  @OnOpen
  public void init(Session session,
                   @PathParam("idUser") String idUser) throws IOException {
    //add user to Map
    users.put(idUser, session);
    System.out.println(idUser);

  }

  @OnMessage
  public void message(Message message) throws IOException, EncodeException {
    messages.add(message);
    String idReceiver = message.getReceiver().getId().toString();
    System.out.println(idReceiver);
    Session receiver = users.get(idReceiver);
    sendMessage(receiver, message);
  }

  @OnError
  public void onError(Session session, Throwable throwable) {
    System.out.println("There has been an error with session " + session.getId());
    System.err.println(Arrays.toString(throwable.getStackTrace()));
    System.out.println(throwable.getMessage());
  }

  @OnClose
  public void logout() throws IOException{
    System.out.println("logout");
    saveMessages();
  }

  private void sendMessage(Session receiver, Message message) throws EncodeException, IOException {
    receiver.getBasicRemote().sendObject(message);
  }

  private void saveMessages() {
    if (!messages.isEmpty()) {
      MESSAGE_DAO.saveMessages(messages);
      messages.clear();
    }
  }
}
