package com.proyect.modelsDAO.UEmployee;

import com.proyect.connDB.ConnectionDB;
import com.proyect.modelsDTO.OProduct.Audit;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Summary {
    private Connection getConnection() throws SQLException {
        return ConnectionDB.getConnection();
    }

    //GET TOTAL INCOMES
    public double getIncome() {
        double income = 0.0;
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM gettotal")) {
            if (rs.next()) {
                income = rs.getDouble("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return income;
    }
    public double getSummary() {
        int count = 0;
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT count(*) AS quantity FROM receipt")) {
            if (rs.next()) {
                count = rs.getInt("quantity");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}