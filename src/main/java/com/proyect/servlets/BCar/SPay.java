package com.proyect.servlets.BCar;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SPay", value = "/SPay")
public class SPay extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /*HttpSession session = request.getSession();

        if (session.getAttribute("validado") == null || (boolean) session.getAttribute("validado") == false) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        int idCliente = (Integer) session.getAttribute("idCliente");
        registerAddress(request, response, idCliente);

         */
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
