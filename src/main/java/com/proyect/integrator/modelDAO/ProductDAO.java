package com.proyect.integrator.modelDAO;

import com.proyect.integrator.config.Conexion;
import com.proyect.integrator.modelDTO.*;
import com.proyect.integrator.repository.Repository;
import com.proyect.integrator.repository.Search;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements Repository<Product>, Search<Product> {

    private Connection getConnection() throws SQLException {
        return Conexion.getConnection();
    }

    @Override
    public List<Product> list() {
        List<Product> products = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT p.*,l.*,c.*,pr.* FROM product AS p "
                     + "INNER JOIN laboratory AS l ON (p.idLaboratory = l.idLaboratory)"
                     + "INNER JOIN category AS c ON (p.idCategory = c.idCategory)"
                     + "INNER JOIN presentation AS pr ON (p.idPresentation = pr.idPresentation)")) {
            while (rs.next()) {
                Product p = createProduct(rs);
                products.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public Product byId(int id) {
        Product product = null;

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.
                     prepareStatement("SELECT p.*,l.*,c.*,pr.* FROM product AS p "
                             + "INNER JOIN laboratory AS l ON (p.idLaboratory = l.idLaboratory)"
                             + "INNER JOIN category AS c ON (p.idCategory = c.idCategory)"
                             + "INNER JOIN presentation AS pr ON (p.idPresentation = pr.idPresentation) WHERE p.idProduct = ?")) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    product = createProduct(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public void save(Product product) {
        String sql = null;
        if (product.getIdProduct() != null && product.getIdProduct() > 0) {
            sql = "UPDATE product SET nameP=?, price = ?, stock = ?, urlPhoto = ?, detail = ?, idLaboratory = ?, idCategory = ?, idPresentation = ? " +
                    "WHERE idProduct = ?";
        } else {
            sql = "INSERT INTO product(nameP, price, stock, urlPhoto, detail, idLaboratory, idCategory, idPresentation) VALUES (?,?,?,?,?,?,?,?) ";
        }
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, product.getNameP());
            stmt.setDouble(2, product.getPrice());
            stmt.setInt(3, product.getStock());
            stmt.setString(4, product.getUrlPhoto());
            stmt.setString(5, product.getDetail());
            stmt.setInt(6, product.getLaboratory().getIdLaboratory());
            stmt.setInt(7, product.getCategory().getIdCategory());
            stmt.setInt(8, product.getPresentation().getIdPresentation());
            if (product.getIdProduct() != null && product.getIdProduct() > 0) {
                stmt.setInt(9, product.getIdProduct());
            }

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM product WHERE idProduct = ?")) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Product createProduct(ResultSet rs) throws SQLException {
        Product p = new Product();
        p.setIdProduct(rs.getInt("idProduct"));
        p.setNameP(rs.getString("nameP"));
        p.setPrice(rs.getDouble("price"));
        p.setStock(rs.getInt("stock"));
        p.setUrlPhoto(rs.getString("urlPhoto"));
        p.setDetail(rs.getString("detail"));

        Laboratory l = new Laboratory();
        l.setIdLaboratory(rs.getInt("idLaboratory"));
        l.setNameL(rs.getString("nameL"));

        Category c = new Category();
        c.setIdCategory(rs.getInt("idCategory"));
        c.setNameC(rs.getString("nameC"));

        Presentation pr = new Presentation();
        pr.setIdPresentation(rs.getInt("idPresentation"));
        pr.setNamePr(rs.getString("namePr"));

        p.setLaboratory(l);
        p.setCategory(c);
        p.setPresentation(pr);

        return p;
    }

    @Override
    public List<Product> search(String text) {
        List<Product> products = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT p.*,l.*,c.*,pr.* FROM product AS p "
                     + "INNER JOIN laboratory AS l ON (p.idLaboratory = l.idLaboratory) "
                     + "INNER JOIN category AS c ON (p.idCategory = c.idCategory) "
                     + "INNER JOIN presentation AS pr ON (p.idPresentation = pr.idPresentation) "
                     + "WHERE p.nameP like '%" + text + "%' ")) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Product p = createProduct(rs);
                    products.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
