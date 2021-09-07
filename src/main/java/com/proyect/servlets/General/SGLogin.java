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
    Boolean validats = true;
    Integer idUser;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("exit")) {
            idUser = null;
            validats = false;
            user.setIdUser(idUser);
            request.getSession().setAttribute("validats", validats);
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
                validats = true;
                request.getSession().setAttribute("email", email);
                request.getSession().setAttribute("password", password);
                request.getSession().setAttribute("validats", validats);
                idUser = user.getIdUser();
                int flag = user.getFlag();
                if (flag == 1) {
                    employee = edao.getIdUser(idUser);
                    int idEmployee = employee.getIdEmployee();
                    int role = employee.getRole().getIdRole();
                    String avatarE = user.getAvatar();
                    String surnameE = employee.getSurname();
                    request.getSession().setAttribute("idEmployee", idEmployee);
                    request.getSession().setAttribute("role", role);
                    request.getSession().setAttribute("surnameE", surnameE);
                    request.getSession().setAttribute("avatarE", avatarE);
                    request.getRequestDispatcher("/views/admin/summary.jsp").forward(request, response);
                } else {
                    client = cdao.getIdUser(idUser);
                    int idClient = client.getIdClient();
                    String username = client.getUsername();
                    request.getSession().setAttribute("idClientHome", idClient);
                    request.getSession().setAttribute("username", username);
                    response.sendRedirect("SCHome?action=list");
                }
            } else {
                String errorMessage = "Datos incorrectos";
                request.setAttribute("errorLog", true);
                request.setAttribute("errorLogin", errorMessage); //jsp login
                request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
            }
        }
    }

}
