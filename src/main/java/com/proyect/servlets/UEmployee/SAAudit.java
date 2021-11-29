package com.proyect.servlets.UEmployee;

import com.proyect.modelsDAO.OProduct.AuditDAO;
import com.proyect.modelsDTO.OProduct.Audit;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@WebServlet(name = "SAAudit", value = "/SAAudit")

public class SAAudit extends HttpServlet{
    List<Audit> audit=new ArrayList<>();
    AuditDAO adao=new AuditDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action= request.getParameter("action");
        switch (action){
            case "search":
                //search
                break;
            default:
                this.list(request,response);
                break;
        }
    }

    private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        audit = adao.list();
        HttpSession session = request.getSession();
        session.setAttribute("audit", audit);
        request.getRequestDispatcher("/views/admin/audit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

