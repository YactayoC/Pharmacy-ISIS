package com.proyect.servlets.UEmployee;

import com.proyect.modelsDTO.OProduct.Category;
import com.proyect.modelsDTO.General.SaveImage;
import com.proyect.modelsDTO.OProduct.Laboratory;
import com.proyect.modelsDTO.OProduct.Presentation;
import com.proyect.modelsDTO.OProduct.Product;
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
import java.util.Optional;

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
            case "search":
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
        String urlPhoto = new SaveImage().saveImage(part, "product");
        String detail = request.getParameter("precaution");

        String action = request.getParameter("action");
        switch (action) {
            case "add":

                products = pdao.list();
                Optional<Product> nameExist = products.stream().filter(p -> p.getNameP().equalsIgnoreCase(nameP)).findFirst();

                if (nameExist.isPresent()) {
                    request.setAttribute("error", "El producto ya ha sido usado");
                    this.list(request, response); //Error, despues cambiar
                } else {
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
                break;

            case "edit": //TODO: Completar codigo del editar productos
                idProduct = Integer.parseInt(request.getParameter("idProduct"));
                String nameProductE = request.getParameter("nameProduct");
                int stockE = Integer.parseInt(request.getParameter("stock"));
                double priceE = Double.parseDouble(request.getParameter("price"));
                int categoryE = Integer.parseInt(request.getParameter("category"));
                int laboratoryE = Integer.parseInt(request.getParameter("laboratory"));
                int presentationE = Integer.parseInt(request.getParameter("presentation"));
                Part partE = request.getPart("image");
                String imageE = new SaveImage().saveImage(partE, "product");
                String precautionE = request.getParameter("precaution");
                product.setIdProduct(idProduct);
                product.setNameP(nameProductE);
                product.setPrice(priceE);
                product.setStock(stockE);
                product.setUrlPhoto(imageE);
                product.setDetail(precautionE);

                laboratory.setIdLaboratory(laboratoryE);
                category.setIdCategory(categoryE);
                presentation.setIdPresentation(presentationE);

                product.setLaboratory(laboratory);
                product.setCategory(category);
                product.setPresentation(presentation);

                pdao.save(product);
                this.list(request, response);
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
