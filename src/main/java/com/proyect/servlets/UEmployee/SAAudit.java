package com.proyect.servlets.UEmployee;

import com.proyect.modelsDAO.OProduct.AuditDAO;
import com.proyect.modelsDTO.OProduct.Audit;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SAAudit", value = "/SAAudit")
public class SAAudit extends HttpServlet {
    List<Audit> audit=new ArrayList<>();
    AuditDAO adao=new AuditDAO();
    Audit auditory=new Audit();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action= request.getParameter("action");
        switch (action){
            case "list1":
                //Listar la opción de insertados
                break;
            case "list2":
                //Listar la opción de eliminados
                break;
            default:
                this.list0(request,response);
                break;
        }
    }

    private void list0(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Listar la opción de actualizados
        audit = adao.list();
        HttpSession session = request.getSession();

        request.getRequestDispatcher("/views/admin/audit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
