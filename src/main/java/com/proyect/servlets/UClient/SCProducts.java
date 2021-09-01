package com.proyect.servlets.UClient;

import com.proyect.modelsDAO.OProduct.CategoryDAO;
import com.proyect.modelsDAO.OProduct.ProductDAO;
import com.proyect.modeslDTO.OProduct.Category;
import com.proyect.modeslDTO.OProduct.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SCProducts", value = "/SCProducts")
public class SCProducts extends HttpServlet {

    List<Product> products = new ArrayList<>();
    List<Product> productsCategories = new ArrayList<>();
    List<Product> categories = new ArrayList<>();
    ProductDAO pdao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "listProduct":
                int idCategory = Integer.parseInt(request.getParameter("idCategory"));
                productsCategories = pdao.listCategory(idCategory);
                request.setAttribute("idCategory", idCategory);
                request.setAttribute("productsC", productsCategories);
                this.list(request, response);
                break;
            case "search":
                categories = pdao.list();
                String text = request.getParameter("search");
                products = pdao.search(text);
                request.setAttribute("categories", categories);
                request.setAttribute("products", products);
                request.getRequestDispatcher("/views/user/store.jsp").forward(request, response);
                break;
            default:
                this.list(request, response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        products = pdao.list();
        categories = pdao.list();
        request.setAttribute("categories", categories);
        request.setAttribute("products", products);
        request.getRequestDispatcher("/views/user/store.jsp").forward(request, response);
    }

}
