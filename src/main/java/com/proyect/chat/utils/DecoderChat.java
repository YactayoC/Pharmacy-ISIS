package com.proyect.chat.utils;

import com.proyect.chat.model.message.Message;
import com.proyect.chat.model.Relevance;
import com.proyect.chat.model.message.MessageBuilder;
import com.proyect.chat.model.speaker.Speaker;
import com.proyect.chat.model.speaker.SpeakerBuilder;
import jakarta.json.Json;
import jakarta.json.JsonObject;
import jakarta.json.JsonReader;
import jakarta.websocket.DecodeException;
import jakarta.websocket.Decoder;
import org.bson.types.ObjectId;

import java.io.StringReader;

public class DecoderChat implements Decoder.Text<Message> {

   @Override
   public Message decode(String jsonMessage) throws DecodeException {
      Message message;
      System.out.println(jsonMessage);
      try (JsonReader jsonReader = Json.createReader(new StringReader(jsonMessage))) {

         JsonObject json = jsonReader.readObject();

         Speaker emitter = new SpeakerBuilder(new ObjectId(json.getString("idEmitter")))
                .isEmployee(json.getBoolean("emitterIsEmployee"))
                .build();
         Speaker receiver = new SpeakerBuilder(new ObjectId(json.getString("idReceiver"))).build();

         Relevance relevance = Relevance.valueOf(json.getString("relevance"));
         String content = json.getString("content");

         message = new MessageBuilder(emitter, receiver, content)
                .relevance(relevance)
                .viewed(false)
                .build();

      }
      return message;
   }

   @Override //verify that string is a valid JSON
   public boolean willDecode(String jsonMessage) {
      return jsonMessage != null;
   }
}
