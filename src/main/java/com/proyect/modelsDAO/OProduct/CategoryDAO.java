package com.proyect.modelsDAO.OProduct;

import com.proyect.connDB.ConnectionDB;
import com.proyect.modeslDTO.OProduct.Category;
import com.proyect.interfaces.Repository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO implements Repository<Category> {

    private Connection getConnection() throws SQLException {
        return ConnectionDB.getConnection();
    }

    @Override
    public List<Category> list() {
        List<Category> categories = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM category")) {
            while (rs.next()) {
                Category c = createCategory(rs);
                categories.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    @Override
    public Category byId(int id) {
        return null;
    }

    @Override
    public void save(Category category) {

    }

    @Override
    public void delete(int id) {

    }

    private Category createCategory(ResultSet rs) throws SQLException {
        Category c = new Category();
        c.setIdCategory(rs.getInt("idCategory"));
        c.setNameC(rs.getString("nameC"));
        c.setUrlCateg(rs.getString("urlCateg"));

        return c;
    }
}
