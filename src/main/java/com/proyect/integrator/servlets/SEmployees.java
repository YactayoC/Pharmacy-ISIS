package com.proyect.integrator.servlets;

import com.proyect.integrator.modelDAO.EmployeeDAO;
import com.proyect.integrator.modelDAO.UserDAO;
import com.proyect.integrator.modelDTO.Employee;
import com.proyect.integrator.modelDTO.Role;
import com.proyect.integrator.modelDTO.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SEmployees", value = "/SEmployees")
public class SEmployees extends HttpServlet {

    List<Employee> employees = new ArrayList<>();
    Employee employee = new Employee();
    User user = new User();
    Role role = new Role();
    EmployeeDAO edao = new EmployeeDAO();
    UserDAO udao = new UserDAO();
    Integer idEmployee;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "delete":
                idEmployee = Integer.parseInt(request.getParameter("idEmployee"));
                employee = edao.byId(idEmployee);
                int idUser = employee.getUser().getIdUser();
                udao.delete(idUser);
                edao.delete(idEmployee);
                this.list(request, response);
                break;
            case "byId":
                // recoge
                break;
            case "searchE":
                String text = request.getParameter("search-employee");
                employees = edao.search(text);
                request.setAttribute("employees", employees);
                request.getRequestDispatcher("/views/admin/employee.jsp").forward(request, response);
                break;
            default:
                this.list(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nameE = request.getParameter("name-employee");
        String surnameE = request.getParameter("last-name");
        int idRole = Integer.parseInt(request.getParameter("role"));
        String docIdentity = request.getParameter("dni");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        String action = request.getParameter("action");
        switch (action) {
            case "add":
                Integer idUser = null;
                user.setIdUser(idUser);
                user.setEmail(email);
                user.setPassword(password);
                user.setAvatar("employee.png");
                user.setFlag(1);
                udao.save(user);

                idUser = udao.getLastIdUser();
                user.setIdUser(idUser);
                employee.setName(nameE);
                employee.setSurname(surnameE);
                employee.setDocIdentity(docIdentity);
                employee.setPhone(phone);
                role.setIdRole(idRole);
                employee.setRole(role);
                employee.setUser(user);
                edao.save(employee);
                this.list(request, response);
                break;
            case "edit":
                // edita
                break;
            default:
                this.list(request, response);
                break;
        }
    }

    public void list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        employees = edao.list();
        HttpSession session = request.getSession();
        session.setAttribute("employees", employees);
        request.getRequestDispatcher("/views/admin/employee.jsp").forward(request, response);
    }
}
