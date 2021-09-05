package com.proyect.modelsDAO.UClient;

import com.proyect.connDB.ConnectionDB;
import com.proyect.interfaces.Repository;
import com.proyect.modelsDTO.OProduct.Category;
import com.proyect.modelsDTO.UClient.District;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DistrictDAO implements Repository<District> {

    private Connection getConnection() throws SQLException {
        return ConnectionDB.getConnection();
    }

    @Override
    public List<District> list() {
        List<District> districts = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM district")) {
            while (rs.next()) {
                District d = createDistrict(rs);
                districts.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return districts;
    }

    @Override
    public District byId(int id) {
        return null;
    }

    @Override
    public void save(District district) {

    }

    @Override
    public void delete(int id) {

    }

    private District createDistrict(ResultSet rs) throws SQLException {
        District d = new District();
        d.setIdDistrict(rs.getInt("idDistrict"));
        d.setNameD(rs.getString("nameD"));

        return d;
    }
}
