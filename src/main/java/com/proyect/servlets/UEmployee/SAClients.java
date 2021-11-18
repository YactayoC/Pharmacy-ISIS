package com.proyect.servlets.UEmployee;

import com.proyect.modelsDAO.UClient.ClientDAO;
import com.proyect.modelsDTO.UClient.Client;
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
        if (action.equals("listReceV")) {
            //List Receipt Virtual
            clients = cdao.listReiptV();
            request.setAttribute("clients",clients);
            request.getRequestDispatcher("/views/delivery-man/orders.jsp").forward(request, response);
        }if (action.equals("search")) {
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
