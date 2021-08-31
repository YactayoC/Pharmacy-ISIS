package com.proyect.servlets.UEmployee;

import com.proyect.modeslDTO.OProduct.Category;
import com.proyect.modeslDTO.General.saveImage;
import com.proyect.modeslDTO.OProduct.Laboratory;
import com.proyect.modeslDTO.OProduct.Presentation;
import com.proyect.modeslDTO.OProduct.Product;
import com.proyect.modelsDAO.OProduct.CategoryDAO;
import com.proyect.modelsDAO.OProduct.LaboratoryDAO;
import com.proyect.modelsDAO.OProduct.PresentationDAO;
import com.proyect.modelsDAO.OProduct.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig
@WebServlet(name = "SAProducts", value = "/SAProducts")
public class SAProducts extends HttpServlet {

    List<Product> products = new ArrayList<>();
    List<Category> categories = new ArrayList<>();
    List<Laboratory> laboratories = new ArrayList<>();
    List<Presentation> presentations = new ArrayList<>();
    ProductDAO pdao = new ProductDAO();
    CategoryDAO cdao = new CategoryDAO();
    LaboratoryDAO ldao = new LaboratoryDAO();
    PresentationDAO prdao = new PresentationDAO();
    Product product = new Product();
    Laboratory laboratory = new Laboratory();
    Category category = new Category();
    Presentation presentation = new Presentation();
    Integer idProduct;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "delete":
                idProduct = Integer.parseInt(request.getParameter("idProduct"));
                pdao.delete(idProduct);
                this.list(request, response);
                break;
            case "byId":
                /// recoge
                break;
            case "searchP":
                String text = request.getParameter("search-product");
                products = pdao.search(text);
                request.setAttribute("products", products);
                request.getRequestDispatcher("/views/admin/products.jsp").forward(request, response);
                break;
            default:
                this.list(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nameP = request.getParameter("nameProduct");
        int stock = Integer.parseInt(request.getParameter("stock"));
        double price = Double.parseDouble(request.getParameter("price"));
        int idLaboratory = Integer.parseInt(request.getParameter("laboratory"));
        int idCategory = Integer.parseInt(request.getParameter("category"));
        int idPresentation = Integer.parseInt(request.getParameter("presentation"));
        Part part = request.getPart("image");
        String urlPhoto = new saveImage().saveImageProduct(part);
        String detail = request.getParameter("precaution");

        String action = request.getParameter("action");
        switch (action) {
            case "add":
                int countTrue = 0;
                products = pdao.list();
                Object[] namesProduct = products.toArray();
                try {
                    for (int i = 0; i < products.size(); i++) {
                        Boolean em = null;
                        if (em = namesProduct[i].toString().contains(nameP)) {
                            em = true;
                            countTrue++;
                        } else {
                            em = false;
                        }
                    }

                    if (countTrue > 0) {
                        request.setAttribute("error", "El producto ya ha sido usado");
                        this.list(request, response); //Error, despues cambiar
                    } else if (countTrue == 0) {
                        Integer idUser = null;
                        product.setIdProduct(idUser);
                        product.setNameP(nameP);
                        product.setStock(stock);
                        product.setPrice(price);
                        product.setDetail(detail);
                        product.setUrlPhoto(urlPhoto);

                        laboratory.setIdLaboratory(idLaboratory);
                        category.setIdCategory(idCategory);
                        presentation.setIdPresentation(idPresentation);

                        product.setLaboratory(laboratory);
                        product.setCategory(category);
                        product.setPresentation(presentation);
                        pdao.save(product);
                    }
                    this.list(request, response);
                } catch (Exception ignored) {
                }
                break;

            case "edit":
                // edita
                break;

            default:
                this.list(request, response);
                break;
        }
    }

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        products = pdao.list();
        categories = cdao.list();
        laboratories = ldao.list();
        presentations = prdao.list();
        HttpSession session = request.getSession();
        session.setAttribute("products", products);
        session.setAttribute("categories", categories);
        session.setAttribute("laboratories", laboratories);
        session.setAttribute("presentations", presentations);
        request.getRequestDispatcher("/views/admin/products.jsp").forward(request, response);
    }
}
