package com.proyect.chat.utils;

import com.proyect.chat.model.Message;
import com.proyect.chat.model.Relevance;
import com.proyect.chat.model.Speaker;
import jakarta.json.Json;
import jakarta.json.JsonObject;
import jakarta.json.JsonReader;
import jakarta.websocket.DecodeException;
import jakarta.websocket.Decoder;
import org.bson.types.ObjectId;

import java.io.StringReader;

public class DecoderChat implements Decoder.Text<Message>{

  @Override
  public Message decode(String jsonMessage) throws DecodeException {
    Message message = new Message();
    System.out.println(jsonMessage);
    try (JsonReader jsonReader = Json.createReader(new StringReader(jsonMessage))) {

      JsonObject json = jsonReader.readObject();

      Speaker emitter = new Speaker();
      Speaker receiver = new Speaker();

      //transform a string to Relevance Enum
      String jsonRelevance = json.getString("relevance");
      Relevance relevance = Relevance.valueOf(jsonRelevance);

      //Add attributes(id - isEmployee) to emitter and receiver
      emitter.setId(new ObjectId(json.getString("idEmitter")))
             .setEmployee(json.getBoolean("emitterIsEmployee"));

      receiver.setId(new ObjectId(json.getString("idReceiver")));

      //set  attributes of chat :D
      message.setContent(json.getString("content"))
             .setReceiver(receiver)
             .setEmitter(emitter)
             .setRelevance(relevance);
    }
    return message;
  }

  @Override //verify that string is a valid JSON
  public boolean willDecode(String jsonMessage) {
    return jsonMessage != null;
  }
}
