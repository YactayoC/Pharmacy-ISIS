package com.proyect.servlets.UClient;

import com.proyect.modelsDAO.OProduct.ProductDAO;
import com.proyect.modeslDTO.OProduct.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SCHome", value = "/SCHome")
public class SCHome extends HttpServlet {

    List<Product> products = new ArrayList<>();
    List<Product> categories = new ArrayList<>();
    ProductDAO pdao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("list")) {
            products = pdao.list();
            HttpSession session = request.getSession();
            session.setAttribute("products", products);
            request.getRequestDispatcher("/views/user/home.jsp").forward(request, response);
        } else if (action.equals("search")){
            categories = pdao.list();
            String text = request.getParameter("search");
            products = pdao.search(text);
            request.setAttribute("categories", categories);
            request.setAttribute("products", products);
            request.getRequestDispatcher("/views/user/store.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
