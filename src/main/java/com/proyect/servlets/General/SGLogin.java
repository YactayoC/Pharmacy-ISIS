package com.proyect.servlets.General;

import com.proyect.modelsDAO.UClient.ClientDAO;
import com.proyect.modelsDAO.UEmployee.EmployeeDAO;
import com.proyect.modelsDAO.General.UserDAO;
import com.proyect.modeslDTO.UClient.Client;
import com.proyect.modeslDTO.UEemployee.Employee;
import com.proyect.modeslDTO.General.User;
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
    Boolean validats = null;
    Integer idUser;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("exit")) {
            validats = false;
            idUser = null;
            user.setIdUser(idUser);
            request.getSession().setAttribute("validats", validats);
            request.getRequestDispatcher("/SCHome?action=list").forward(request, response);
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
            int r = udao.validate(user);
            if (r == 1) {
                validats = true;
                request.getSession().setAttribute("email", email);
                request.getSession().setAttribute("password", password);
                request.getSession().setAttribute("validats", validats);

                idUser = user.getIdUser();
                client = cdao.getIdUser(idUser);
                String username = client.getUsername();
                String name = client.getName();
                String surname = client.getSurname();
                String docIdentity = client.getDocIdentity();
                String phone = client.getPhone();

                //Puede volar para el SProfile con byId
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("name", name);
                request.getSession().setAttribute("surname", surname);
                request.getSession().setAttribute("docIdentity", docIdentity);
                request.getSession().setAttribute("phone", phone);

                int flag = user.getFlag();
                if (flag == 1) {
                    employee = edao.getIdUser(idUser);
                    //Puede hacer con el byId en un servlet de setting
                    String avatarE = user.getAvatar();
                    String nameE = employee.getName();
                    String surnameE = employee.getSurname();
                    String phoneE = employee.getPhone();
                    String docIdentityE = employee.getDocIdentity();
                    int role = employee.getRole().getIdRole();
                    request.getSession().setAttribute("nameE", nameE);
                    request.getSession().setAttribute("surnameE", surnameE);
                    request.getSession().setAttribute("phoneE", phoneE);
                    request.getSession().setAttribute("docIdentityE", docIdentityE);
                    request.getSession().setAttribute("avatarE", avatarE);
                    request.getSession().setAttribute("role", role);
                    request.getRequestDispatcher("/views/admin/summary.jsp").forward(request, response);
                } else {
                    System.out.println("Inicio sesion");
                    response.sendRedirect("SCHome?action=list");
                }
            } else {
                request.setAttribute("error2", "Datos Incorrectos");
                request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
            }
        }
    }

}
