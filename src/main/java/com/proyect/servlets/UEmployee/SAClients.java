package com.proyect.servlets.UEmployee;

import com.proyect.modelsDAO.UClient.ClientDAO;
import com.proyect.modeslDTO.UClient.Client;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SAClients", value = "/SAClients")
public class SAClients extends HttpServlet {

    List<Client> clients = new ArrayList<>();
    ClientDAO cdao = new ClientDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("searchC")) {
            String text = request.getParameter("search-client");
            clients = cdao.search(text);
        } else {
            clients = cdao.list();
        }
        request.setAttribute("clients", clients);
        request.getRequestDispatcher("/views/admin/client.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
