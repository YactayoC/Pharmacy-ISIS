package com.proyect.servlets.chat;

import com.proyect.chat.daos.*;
import com.proyect.chat.model.message.Message;
import com.proyect.chat.model.speaker.Speaker;
import com.proyect.chat.model.speaker.SpeakerBuilder;
import com.proyect.chat.utils.custom.notify.ComplexNotification;
import jakarta.json.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.bson.types.ObjectId;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@WebServlet(name = "ServletChat", value = "/ServletChat")
public class ServletChat extends HttpServlet {

  //objects for actions in mongoDB
  private final MessageDao messageDao = new MessageDao();

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    String idEmitter = request.getParameter("emitter");
    String idReceiver = request.getParameter("receiver");

    if (idEmitter != null && idReceiver != null) {
      //Method for send information of speaker to client
      Speaker emitter = new SpeakerBuilder(new ObjectId(idEmitter)).build();
      Speaker receiver = new SpeakerBuilder(new ObjectId(idReceiver)).build() ;

      List<Message> conversation = messageDao.getConversation(emitter, receiver);

      PrintWriter out = response.getWriter();
      response.setContentType("application/json");
      response.setCharacterEncoding("UTF-8");
      out.print(parseToJson(conversation).toString());
      out.flush();

    } else {
      //redirect to message.jsp and send the list of speakers
      if (session.getAttribute("notifies") == null) {
        session.setAttribute("notifies", new ComplexNotification().build());
      }
      request.setAttribute("notifies",session.getAttribute("notifies"));
      //request.getSession().setAttribute("notifies", new ComplexNotification().buildNotification());
      request.getRequestDispatcher("/views/admin/message.jsp").forward(request, response);
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  }

  /***
   * This method converter a message list to JsonArray for send to client JS
   * @param messages Message List that comming from messageDao
   * @return a JsonArray ready to ship to client JS
   */
  private JsonArray parseToJson(List<Message> messages) {

    Map<String, String> config = new TreeMap<>();
    JsonBuilderFactory factory = Json.createBuilderFactory(config);

    JsonArrayBuilder jsonBuilder = factory.createArrayBuilder();

    messages.forEach(message -> jsonBuilder.add(factory.createObjectBuilder()
           .add("emitterIsEmployee", message.getEmitter().isEmployee())
           .add("content", message.getContent())
    ));

    return jsonBuilder.build();
  }
}
