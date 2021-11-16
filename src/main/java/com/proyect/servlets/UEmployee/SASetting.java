package com.proyect.servlets.UEmployee;

import com.proyect.modelsDAO.General.UserDAO;
import com.proyect.modelsDAO.UEmployee.EmployeeDAO;
import com.proyect.modelsDTO.General.User;
import com.proyect.modelsDTO.UEemployee.Employee;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SASetting", value = "/SASetting")
public class SASetting extends HttpServlet {

    Employee employee = new Employee();
    EmployeeDAO edao = new EmployeeDAO();
    User user = new User();
    UserDAO udao = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action.equals("getSetting")){
            int idEmployee = Integer.parseInt(request.getParameter("idEmployee"));
            employee = edao.byId(idEmployee);
            request.setAttribute("employeeS", employee);
            request.getRequestDispatcher("/views/admin/setting.jsp").forward(request, response);
        }if(action.equals("getSetting2")){
            int idEmployee = Integer.parseInt(request.getParameter("idEmployee"));
            employee = edao.byId(idEmployee);
            request.setAttribute("employeeS", employee);
            request.getRequestDispatcher("/views/delivery-man/settings.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action.equals("editSetting")){
            int idEmployee = Integer.parseInt(request.getParameter("idEmployee"));
            String nameE = request.getParameter("name");
            String surnameE = request.getParameter("surname");
            String phoneE = request.getParameter("phone");
            String docIdentityE = request.getParameter("docIdentity");
            String password = request.getParameter("password");

            employee.setIdEmployee(idEmployee);
            employee.setName(nameE);
            employee.setSurname(surnameE);
            employee.setPhone(phoneE);
            employee.setDocIdentity(docIdentityE);

            user.setIdUser(employee.getUser().getIdUser());
            user.setPassword(password);
            user.setAvatar("employee.png");

            udao.save(user);
            edao.saveSetting(employee);
            request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
        }
    }
}
