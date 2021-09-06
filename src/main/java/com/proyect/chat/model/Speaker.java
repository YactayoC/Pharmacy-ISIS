package com.proyect.chat.model;

import org.bson.types.ObjectId;

import java.util.Objects;

public class Speaker {
  private ObjectId id;
  private String name;
  private String username;
  private String email;
  private String photo;
  private boolean isEmployee;

  public Speaker() {
    this.isEmployee = false;
  }

  public Speaker(String name, String username, String email, String photo) {
    this();
    this.name = name;
    this.username = username;
    this.email = email;
    this.photo = photo;
  }

  public Speaker(ObjectId id, String name, String username, String email, String photo, boolean isEmployee) {
    this(name, username, email, photo);
    this.id = id;
    this.isEmployee = isEmployee;
  }

  public ObjectId getId() {
    return id;
  }

  public Speaker setId(ObjectId id) {
    this.id = id;
    return this;
  }

  public String getName() {
    return name;
  }

  public Speaker setName(String name) {
    this.name = name;
    return this;
  }

  public String getUsername() {
    return username;
  }

  public Speaker setUsername(String username) {
    this.username = username;
    return this;
  }

  public String getEmail() {
    return email;
  }

  public Speaker setEmail(String email) {
    this.email = email;
    return this;
  }

  public String getPhoto() {
    return photo;
  }

  public Speaker setPhoto(String photo) {
    this.photo = photo;
    return this;
  }

  public boolean isEmployee() {
    return isEmployee;
  }

  public Speaker setEmployee(boolean employee) {
    isEmployee = employee;
    return this;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Speaker speaker = (Speaker) o;
    return Objects.equals(id, speaker.id);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, name, email);
  }

  @Override
  public String toString() {
    return "User{" +
           "id='" + id + '\'' +
           ", name='" + name + '\'' +
           ", username='" + username + '\'' +
           ", email='" + email + '\'' +
           ", photo='" + photo + '\'' +
           ", isEmployee=" + isEmployee +
           '}';
  }
}
