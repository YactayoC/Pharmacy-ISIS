package com.proyect.chat.model.speaker;

import org.bson.types.ObjectId;

import java.util.Objects;

public class Speaker {
  //
  private final ObjectId id;
  private final String name;
  private final String username;
  private final String email;
  private final String photo;
  private final boolean isEmployee;

  protected Speaker(SpeakerBuilder builder) {
    this.id = builder.id;
    this.name = builder.name;
    this.username = builder.username;
    this.email = builder.email;
    this.photo = builder.photo;
    this.isEmployee = builder.isEmployee;
  }

  public ObjectId getId() {
    return id;
  }

  public String getName() {
    return name;
  }

  public String getUsername() {
    return username;
  }

  public String getEmail() {
    return email;
  }

  public String getPhoto() {
    return photo;
  }

  public boolean isEmployee() {
    return isEmployee;
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
