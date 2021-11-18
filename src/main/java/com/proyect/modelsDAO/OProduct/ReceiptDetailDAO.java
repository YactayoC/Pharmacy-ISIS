package com.proyect.modelsDAO.OProduct;

import com.proyect.connDB.ConnectionDB;
import com.proyect.interfaces.Repository;
import com.proyect.modelsDTO.BCar.ReceiptDetail;
import com.proyect.modelsDTO.OProduct.Product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ReceiptDetailDAO  {
    /*
    private Connection getConnection() throws SQLException {
        return ConnectionDB.getConnection();
    }
    @Override
    public List<ReceiptDetail> list() {
        List<ReceiptDetail> receiptd = new ArrayList<>();

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
    public Object byId(int id) {
        return null;
    }

    @Override
    public void save(Object o) {

    }

    @Override
    public void delete(int id) {

    }
    */

}
