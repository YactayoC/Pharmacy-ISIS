package com.proyect.servlets.UClient;

import com.proyect.modelsDAO.UClient.ClientDAO;
import com.proyect.modelsDTO.UClient.Client;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SCProfile", value = "/SCProfile")
public class SCProfile extends HttpServlet {

    ClientDAO cdao = new ClientDAO();
    Client client = new Client();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  //biYd , post modificar
            throws ServletException, IOException {
    String action = request.getParameter("action");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
