package com.proyect.modelsDAO.OProduct;

import com.proyect.connDB.ConnectionDB;
import com.proyect.interfaces.Repository;
import com.proyect.modelsDTO.OProduct.Category;
import com.proyect.modelsDTO.OProduct.Laboratory;
import com.proyect.modelsDTO.OProduct.Presentation;
import com.proyect.modelsDTO.OProduct.Product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AuditDAO implements Repository<Void> {

    private Connection getConnection() throws SQLException {
        return ConnectionDB.getConnection();
    }

    @Override
    public List<Void> list() {
        List<Void> products = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("")) {
            while (rs.next()) {
                Void p = createAudit(rs);
                products.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public Void byId(int id) {
        return null;
    }

    @Override
    public void save(Void product) {

    }

    @Override
    public void delete(int id) {

    }
    private Audit createAudit(ResultSet rs) throws SQLException {
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
        c.setUrlCateg(rs.getString("urlCateg"));
        c.setDescription(rs.getString("description"));

        Presentation pr = new Presentation();
        pr.setIdPresentation(rs.getInt("idPresentation"));
        pr.setNamePr(rs.getString("namePr"));

        p.setLaboratory(l);
        p.setCategory(c);
        p.setPresentation(pr);

        return a;
    }
}