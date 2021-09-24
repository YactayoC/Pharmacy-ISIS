package com.proyect.chat.utils;

import com.proyect.chat.model.message.Message;
import jakarta.json.Json;
import jakarta.json.JsonObject;
import jakarta.websocket.Encoder;

public class EncoderChat implements Encoder.Text<Message> {

  @Override
  public String encode(Message message) {
    JsonObject jsonObject = Json.createObjectBuilder()
           .add("idReceiver", message.getReceiver().getId().toHexString())
           .add("idEmitter", message.getEmitter().getId().toHexString())
           .add("emitterIsEmployee", message.getEmitter().isEmployee())
           .add("relevance", message.getRelevance().toString())
           .add("content", message.getContent())
           .add("viewed", message.isViewed())
           .build();
    return jsonObject.toString();
  }
}
