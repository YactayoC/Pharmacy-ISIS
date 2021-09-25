package com.proyect.servlets.General;

import com.proyect.modelsDAO.UClient.ClientDAO;
import com.proyect.modelsDAO.UEmployee.EmployeeDAO;
import com.proyect.modelsDAO.General.UserDAO;
import com.proyect.modelsDTO.UClient.Client;
import com.proyect.modelsDTO.UEemployee.Employee;
import com.proyect.modelsDTO.General.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SGLogin", value = "/SGLogin")

public class SGLogin extends HttpServlet {

    User user = new User();
    Client client = new Client();
    Employee employee = new Employee();
    ClientDAO cdao = new ClientDAO();
    UserDAO udao = new UserDAO();
    EmployeeDAO edao = new EmployeeDAO();

    Integer idUser;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("exit")) {
            request.getSession().setAttribute("actualizateHome", false);
            request.getSession().setAttribute("validats", false);
            request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("login")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            user.setEmail(email);
            user.setPassword(password);
            boolean userExist = udao.validate(user);
            if (userExist) {
                request.getSession().setAttribute("email", email);
                request.getSession().setAttribute("password", password);
                request.getSession().setAttribute("validats", true);

                idUser = user.getIdUser();
                int flag = user.getFlag();
                if (flag == 1) {
                    employee = edao.getIdUser(idUser);

                    //String notification = new SimpleNotification(idMongo).buildNotification();
                    request.getSession().setAttribute("idEmployee", employee.getIdEmployee());
                    request.getSession().setAttribute("role", employee.getRole().getIdRole());
                    request.getSession().setAttribute("surnameE", employee.getSurname());
                    request.getSession().setAttribute("avatarE", user.getAvatar());
                    request.getSession().setAttribute("idMongo", user.getIdMongo());
                    //request.getSession().setAttribute("notifications", notification);
                    response.sendRedirect("SASummary?action=list");
                } else {
                    client = cdao.getIdUser(idUser);
                    //String notification = new SimpleNotification(idMongo).build();
                    request.getSession().setAttribute("idClientHome", client.getIdClient());
                    request.getSession().setAttribute("usernameLog", client.getUsername());
                    request.getSession().setAttribute("idMongo", client.getUser().getIdMongo());
                    //request.getSession().setAttribute("notifications", notification);
                    response.sendRedirect("SCHome?action=list");
                }
            } else {
                String errorMessage = "Datos incorrectos";
                request.setAttribute("errorLog", true);
                request.setAttribute("errorLogin", errorMessage);
                request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
            }
        }
    }

}
