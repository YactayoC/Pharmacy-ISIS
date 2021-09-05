package com.proyect.chat.model;

import org.bson.types.ObjectId;

import java.util.Objects;

public class User {
  private ObjectId id;
  private String name;
  private String username;
  private String email;
  private String photo;
  private boolean isEmployee;

  public User() {
    this.isEmployee = false;
  }

  public User(String name, String username, String email, String photo) {
    this();
    this.name = name;
    this.username = username;
    this.email = email;
    this.photo = photo;
  }

  public User(ObjectId id, String name, String username, String email, String photo, boolean isEmployee) {
    this(name, username, email, photo);
    this.id = id;
    this.isEmployee = isEmployee;
  }

  public ObjectId getId() {
    return id;
  }

  public User setId(ObjectId id) {
    this.id = id;
    return this;
  }

  public String getName() {
    return name;
  }

  public User setName(String name) {
    this.name = name;
    return this;
  }

  public String getUsername() {
    return username;
  }

  public User setUsername(String username) {
    this.username = username;
    return this;
  }

  public String getEmail() {
    return email;
  }

  public User setEmail(String email) {
    this.email = email;
    return this;
  }

  public String getPhoto() {
    return photo;
  }

  public User setPhoto(String photo) {
    this.photo = photo;
    return this;
  }

  public boolean isEmployee() {
    return isEmployee;
  }

  public User setEmployee(boolean employee) {
    isEmployee = employee;
    return this;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    User user = (User) o;
    return Objects.equals(id, user.id);
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
