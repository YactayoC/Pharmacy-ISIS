package com.proyect.modelsDAO.OProduct;

import com.proyect.connDB.ConnectionDB;
import com.proyect.interfaces.Repository;
import com.proyect.modelsDTO.OProduct.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AuditDAO implements Repository<Audit> {

    private Connection getConnection() throws SQLException {
        return ConnectionDB.getConnection();
    }


    @Override
    public List<Audit> list() {
        List<Audit> audit = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("")) {
            while (rs.next()) {
                Audit a = createAudit(rs);
                audit.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return audit;
    }

    @Override
    public Audit byId(int id) {
        return null;
    }

    @Override
    public void save(Audit audit) {

    }

    @Override
    public void delete(int id) {

    }
    private Audit createAudit(ResultSet rs) throws SQLException {
        Audit a =new Audit();
        a.setRegistD(rs.getDate("registD"));
        a.setHour(rs.getDate("hour"));
        a.setOldPhoto(rs.getString("oldPhoto"));
        a.setNewPhoto(rs.getString("newPhoto"));
        a.setOldPname(rs.getString("oldPname"));
        a.setNewPname(rs.getString("newPname"));
        a.setOldPprice(rs.getDouble("oldPrice"));
        a.setNewPprice(rs.getDouble("newPrice"));
        a.setOldPcateg(rs.getString("oldPcateg"));
        a.setNewPcateg(rs.getString("newPcateg"));
        a.setOldPlab(rs.getString("oldPlab"));
        a.setNewPlab(rs.getString("newPlab"));
        a.setOldPpresent(rs.getString("oldPpresent"));
        a.setNewPpresent(rs.getString("newPpresent"));
        a.setAvatarE(rs.getString("avatarE"));
        a.setEmployee(rs.getString("employee"));
        return a;
    }
}