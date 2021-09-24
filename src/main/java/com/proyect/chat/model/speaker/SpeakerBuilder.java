package com.proyect.chat.model.speaker;

import org.bson.types.ObjectId;

public class SpeakerBuilder {
   protected ObjectId id;
   protected String name;
   protected String username;
   protected String email;
   protected String photo;
   protected boolean isEmployee;

   public SpeakerBuilder(ObjectId id) {
      this.id = id;
   }

   public SpeakerBuilder name(String name) {
      this.name = name;
      return this;
   }

   public SpeakerBuilder username(String username) {
      this.username = username;
      return this;
   }

   public SpeakerBuilder email(String email) {
      this.email = email;
      return this;
   }

   public SpeakerBuilder photo(String photo) {
      this.photo = photo;
      return this;
   }

   public SpeakerBuilder isEmployee(boolean employee) {
      isEmployee = employee;
      return this;
   }

   public Speaker build() {
      return new Speaker(this);
   }

}
