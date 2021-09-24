package com.proyect.chat.model.message;

import com.proyect.chat.model.Relevance;
import com.proyect.chat.model.speaker.Speaker;
import org.bson.types.ObjectId;

import java.time.LocalDateTime;

public class Message {

  private final ObjectId id;
  private final Speaker emitter;
  private final Speaker receiver;
  private final String content;
  private final Relevance relevance;
  private final boolean viewed;
  private final LocalDateTime date;

  protected Message(MessageBuilder builder) {
    this.id = builder.id;
    this.emitter = builder.emitter;
    this.receiver = builder.receiver;
    this.content = builder.content;
    this.relevance = builder.relevance;
    this.viewed = builder.viewed;
    this.date = builder.date;
  }

  public ObjectId getId() {
    return id;
  }

  public Speaker getEmitter() {
    return emitter;
  }

  public Speaker getReceiver() {
    return receiver;
  }

  public String getContent() {
    return content;
  }

  public Relevance getRelevance() {
    return relevance;
  }

  public boolean isViewed() {
    return viewed;
  }

  public LocalDateTime getCreatedAt() {
    return date;
  }


  @Override
  public String toString() {
    return "Message{" +
           "id='" + id + '\'' +
           ", emitter=" + emitter +
           ", receiver=" + receiver +
           ", content='" + content + '\'' +
           ", relevance=" + relevance +
           ", viewed=" + viewed +
           ", date=" + date +
           '}';
  }
}
