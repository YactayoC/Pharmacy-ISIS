package com.proyect.servlets.UClient;

import com.proyect.chat.daos.SpeakerDao;
import com.proyect.chat.model.speaker.Speaker;
import com.proyect.chat.model.speaker.SpeakerBuilder;
import com.proyect.modelsDAO.UClient.ClientDAO;
import com.proyect.modelsDAO.General.UserDAO;
import com.proyect.modelsDTO.UClient.Client;
import com.proyect.modelsDTO.UClient.District;
import com.proyect.modelsDTO.General.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.bson.types.ObjectId;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "SCRegister", value = "/SCRegister")
public class SCRegister extends HttpServlet {

    List<User> users = new ArrayList<>();
    User user = new User();
    Client client = new Client();
    District district = new District();
    UserDAO udao = new UserDAO();
    ClientDAO cdao = new ClientDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("register")) {
            this.saveAccount(request, response);
        }
    }

    public void saveAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String phone = request.getParameter("phone");
        String docIdentity = request.getParameter("docIdentity");

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        users = udao.list();
        boolean emailExists = users.stream().parallel().anyMatch(u -> u.getEmail().equals(email));

        if (emailExists) {
            request.setAttribute("errorReg", true);
            request.setAttribute("errorRegister", "El email ingresado ya ha sido usado");//jsp register
            request.getRequestDispatcher("/views/user/register.jsp").forward(request, response);
        } else {
            String avatar = "client.png";
            //TODO: Posible concurrencia
            //Mongo User
            ObjectId _id = new ObjectId();
            SpeakerBuilder speakerBuilder = new SpeakerBuilder(_id);
            Speaker speaker = speakerBuilder.name(name)
                   .username(username)
                   .email(email)
                   .photo(avatar)
                   .isEmployee(false).build();

            new SpeakerDao().save(speaker);

            // Mysql User
            Integer idUser = null;
            user.setIdUser(idUser);
            user.setEmail(email);
            user.setPassword(password);
            user.setAvatar(avatar);
            user.setFlag(0);
            user.setIdMongo(_id.toHexString());
            udao.save(user);

            idUser = udao.getLastIdUser();
            user.setIdUser(idUser);
            district.setIdDistrict(1);

            client.setUsername(username);
            client.setName(name);
            client.setSurname(surname);
            client.setPhone(phone);
            client.setDocIdentity(docIdentity);
            client.setUser(user);
            client.setDistrict(district);
            cdao.save(client);

        }
        response.sendRedirect("views/user/login.jsp");
    }

}
