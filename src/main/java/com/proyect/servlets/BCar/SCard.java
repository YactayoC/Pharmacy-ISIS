package com.proyect.servlets.BCar;

import com.proyect.modelsDTO.BCar.ListCard;
import com.proyect.modelsDAO.OProduct.ProductDAO;
import com.proyect.modelsDTO.OProduct.Product;
import com.proyect.modelsDTO.BCar.ItemCard;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SCard", value = "/SCard")
public class SCard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        ListCard listCard = (ListCard) session.getAttribute("card");
        if (listCard != null && action.equals("listCart")) {
            request.setAttribute("cardInfo", listCard.getItems());
            request.setAttribute("total", listCard.getTotal());
        }
        request.getRequestDispatcher("/views/user/shopp-cart.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*Get a ID of the product with AJAX from 'send_data.js'*/
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        ListCard listcard;
        if (action == null) {
            int idProduct = Integer.parseInt(request.getParameter("idProduct"));
            Product product = new ProductDAO().byId(idProduct);
            ItemCard item = new ItemCard(1, product);
            if (session.getAttribute("card") == null) {
                listcard = new ListCard();
                session.setAttribute("card", listcard);
            } else {
                listcard = (ListCard) session.getAttribute("card");
            }
            listcard.addItemCard(item);
        }
        if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            listcard = (ListCard) session.getAttribute("card");
            listcard.removeItem(id);
        }
    }
}
