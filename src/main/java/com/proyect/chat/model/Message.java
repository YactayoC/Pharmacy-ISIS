package com.proyect.chat.model;

import org.bson.types.ObjectId;

import java.time.LocalDateTime;

public class Message {
  private ObjectId id;
  private Speaker emitter;
  private Speaker receiver;
  private String content;
  private Relevance relevance;
  private boolean viewed;
  private LocalDateTime createdAt;

  public Message() {
    this.createdAt = LocalDateTime.now();
  }

  public Message(Speaker emitter, Speaker receiver, String content, Relevance relevance) {
    this();
    this.emitter = emitter;
    this.receiver = receiver;
    this.content = content;
    this.relevance = relevance;
    this.viewed = false;
  }

  public ObjectId getId() {
    return id;
  }

  public Message setId(ObjectId id) {
    this.id = id;
    return this;
  }

  public Speaker getEmitter() {
    return emitter;
  }

  public Message setEmitter(Speaker emitter) {
    this.emitter = emitter;
    return this;
  }

  public Speaker getReceiver() {
    return receiver;
  }

  public Message setReceiver(Speaker receiver) {
    this.receiver = receiver;
    return this;
  }

  public String getContent() {
    return content;
  }

  public Message setContent(String content) {
    this.content = content;
    return this;
  }

  public Relevance getRelevance() {
    return relevance;
  }

  public Message setRelevance(Relevance relevance) {
    this.relevance = relevance;
    return this;
  }

  public boolean isViewed() {
    return viewed;
  }

  public Message setViewed(boolean viewed) {
    this.viewed = viewed;
    return this;
  }

  public LocalDateTime getCreatedAt() {
    return createdAt;
  }

  public Message setCreatedAt(LocalDateTime createdAt) {
    this.createdAt = createdAt;
    return this;
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
           ", createdAt=" + createdAt +
           '}';
  }
}
