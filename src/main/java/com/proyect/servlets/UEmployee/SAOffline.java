package com.proyect.servlets.UEmployee;

import com.proyect.modelsDAO.OProduct.ProductDAO;
import com.proyect.modelsDTO.OProduct.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SAOffline", value = "/SAOffline")
public class SAOffline extends HttpServlet {

    List<Product> products = new ArrayList<>();
    ProductDAO pdao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "search" -> {
                String text = request.getParameter("searchOffline");
                products = pdao.search(text);
                request.setAttribute("productsOffline", products);
                request.getRequestDispatcher("/views/admin/offline-sale.jsp").forward(request, response);
            }
            default -> this.list(request, response);
        }
    }

    public void list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        products = pdao.list();
        request.getSession().setAttribute("productsOffline", products);
        request.getRequestDispatcher("/views/admin/offline-sale.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
