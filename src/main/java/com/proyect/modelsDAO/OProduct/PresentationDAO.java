package com.proyect.modelsDAO.OProduct;

import com.proyect.connDB.ConnectionDB;
import com.proyect.modelsDTO.OProduct.Presentation;
import com.proyect.interfaces.Repository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PresentationDAO implements Repository<Presentation> {

    private Connection getConnection() throws SQLException {
        return ConnectionDB.getConnection();
    }

    @Override
    public List<Presentation> list() {
        List<Presentation> presentations = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM presentation")) {
            while (rs.next()) {
                Presentation pr = createPresentation(rs);
                presentations.add(pr);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return presentations;
    }

    @Override
    public Presentation byId(int id) {
        return null;
    }

    @Override
    public void save(Presentation presentation) {

    }

    @Override
    public void delete(int id) {

    }

    private Presentation createPresentation(ResultSet rs) throws SQLException {
        Presentation pr = new Presentation();
        pr.setIdPresentation(rs.getInt("idPresentation"));
        pr.setNamePr(rs.getString("namePr"));

        return pr;
    }
}
