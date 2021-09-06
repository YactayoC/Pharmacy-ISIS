package com.proyect.chat.daos.repository;

import com.proyect.chat.model.User;

import java.util.List;

public interface UserRepository {

  //create and update (id==null) ? CREATE : UPDATE;
  boolean save(User user);

  //READ
  List<User> list();

  //GET BY _ID
  User list(String _id);

  //there is no DELETE
}
