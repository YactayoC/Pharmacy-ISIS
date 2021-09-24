package com.proyect.servlets.UClient;

import com.proyect.modelsDAO.General.UserDAO;
import com.proyect.modelsDAO.OProduct.CategoryDAO;
import com.proyect.modelsDAO.OProduct.ProductDAO;
import com.proyect.modelsDAO.UClient.ClientDAO;
import com.proyect.modelsDAO.UClient.DistrictDAO;
import com.proyect.modelsDTO.General.User;
import com.proyect.modelsDTO.OProduct.Category;
import com.proyect.modelsDTO.OProduct.Product;
import com.proyect.modelsDTO.UClient.Client;
import com.proyect.modelsDTO.UClient.District;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SCHome", value = "/SCHome")
public class SCHome extends HttpServlet {

    List<Product> products = new ArrayList<>();
    List<Category> categories = new ArrayList<>();
    List<District> districts = new ArrayList<>();
    Client client = new Client();
    User user = new User();
    District district = new District();
    DistrictDAO ddao = new DistrictDAO();
    ClientDAO cdao = new ClientDAO();
    UserDAO udao = new UserDAO();
    ProductDAO pdao = new ProductDAO();
    CategoryDAO ctdao = new CategoryDAO();



    /***
     * <p></p>  sebas da una explicación de esto
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "search" -> {
                categories = ctdao.list();
                String text = request.getParameter("search");
                products = pdao.search(text);
                request.setAttribute("categories", categories);
                request.setAttribute("products", products);
                request.getRequestDispatcher("/views/user/store.jsp").forward(request, response);
            }
            case "getProfile" -> {
                int idClient = Integer.parseInt(request.getParameter("idClient"));
                client = cdao.byId(idClient);
                districts = ddao.list();
                request.setAttribute("districtHome", client.getDistrict().getIdDistrict());
                request.setAttribute("districts", districts);
                request.setAttribute("client", client);
                request.getRequestDispatcher("/views/user/profile.jsp").forward(request, response);
            }
            default -> {
                products = pdao.listLast();
                request.getSession().setAttribute("productsHome", products);
                request.getRequestDispatcher("/views/user/home.jsp").forward(request, response);
            }
        }
    }

    /***
     * <p>This update the username</p>  sebas da una explicación de esto
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("editProfile".equals(action)) {
            int idClient = Integer.parseInt(request.getParameter("idClient"));
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String username = request.getParameter("username");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            int districtt = Integer.parseInt(request.getParameter("district"));

            client.setIdClient(idClient);
            client.setUsername(username);
            client.setName(name);
            client.setSurname(surname);
            client.setAddress(address);
            client.setPhone(phone);
            district.setIdDistrict(districtt);
            client.setDistrict(district);

            user.setIdUser(client.getUser().getIdUser());
            user.setPassword(password);

            udao.save(user);
            cdao.save(client);

            request.getSession().setAttribute("usernameHome", username);
            request.getSession().setAttribute("actualizateHome", true);
            response.sendRedirect("SCHome?action=list");
        }
    }

}
