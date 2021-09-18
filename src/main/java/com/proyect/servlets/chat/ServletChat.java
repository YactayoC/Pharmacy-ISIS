package com.proyect.servlets.chat;

import com.proyect.chat.daos.*;
import com.proyect.chat.model.Message;
import com.proyect.chat.model.Speaker;
import com.proyect.modelsDAO.General.UserDAO;
import jakarta.json.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.bson.types.ObjectId;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@WebServlet(name = "ServletChat", value = "/ServletChat")
public class ServletChat extends HttpServlet {

  //objects for actions in mongoDB
  private final SpeakerDao speakerDao = new SpeakerDao();
  private final MessageDao messageDao = new MessageDao();

  //for get the avatar of users
  private final UserDAO userDAO = new UserDAO();

  /***
   * <p>redirect to message.jsp and send the list of speakers </p>
   *
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    request.getSession().setAttribute("speakers", setAvatars(speakerDao.list()));
    request.getRequestDispatcher("/views/admin/message.jsp").forward(request, response);
  }

    /***
     *  <p>Method for send information of speaker to client</p>
     * @param request <p>get the id of speaker</p>
     * @param response <p>return a JSON with messages</p>
     */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //TODO:get info from javaScript
    String idEmitter = request.getParameter("emitter");
    String idReceiver = request.getParameter("receiver");

    if (idEmitter != null && idReceiver != null) {
      Speaker emitter = new Speaker().setId(new ObjectId(idEmitter));
      Speaker receiver = new Speaker().setId(new ObjectId(idReceiver));

      List<Message> conversation = messageDao.getConversation(emitter, receiver);

      response.setContentType("application/json");
      response.getWriter().write(parseJson(conversation).toString());
    }
  }

  /***
   * <p>Add avatar from Mysql to speaker</p>
   * @param speakers <span>a speaker list without avatar</span>
   * @return <span>A speaker list with changed avatar </span>
   */
  private List<Speaker> setAvatars(List<Speaker> speakers){

    Map<String, String> avatars = userDAO.getAvatars();

    speakers.forEach(speaker -> speaker.setPhoto(avatars.get(speaker.getId().toString())));

    return speakers;
  }

  /***
   * This method converter a message list to JsonArray for send to client JS
   * @param messages Message List that comming from messageDao
   * @return a JsonArray ready to ship to client JS
   */
  private JsonArray parseJson(List<Message> messages) {

    Map<String, String> config = new TreeMap<>();
    JsonBuilderFactory factory = Json.createBuilderFactory(config);

    JsonArrayBuilder jsonBuilder = factory.createArrayBuilder();

    messages.forEach(message -> jsonBuilder.add(factory.createObjectBuilder()
           .add("idReceiver", message.getReceiver().getId().toHexString())
           .add("idEmitter", message.getEmitter().getId().toHexString())
           .add("emitterIsEmployee", message.getEmitter().isEmployee())
           .add("relevance", message.getRelevance().toString())
           .add("content", message.getContent())
           .add("viewed", message.isViewed())
    ));

    return jsonBuilder.build();
  }
}
