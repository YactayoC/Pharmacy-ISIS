package com.proyect.modelsDAO.OProduct;

import com.proyect.connDB.ConnectionDB;
import com.proyect.interfaces.Repository;
import com.proyect.modelsDTO.BCar.Receipt;
import com.proyect.modelsDTO.BCar.ReceiptDetail;
import com.proyect.modelsDTO.OProduct.Product;
import com.proyect.modelsDTO.UClient.Client;
import com.proyect.modelsDTO.UEemployee.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReceiptDetailDAO  {

    private Connection getConnection() throws SQLException {
        return ConnectionDB.getConnection();
    }

    public int getLast() {
        int id = 0;
        try (PreparedStatement stmt = getConnection().prepareStatement("SELECT idReceipt FROM receipt ORDER BY idReceipt DESC limit 1");
             ResultSet resultSet = stmt.executeQuery()) {
            if (resultSet.next()) {
                id = resultSet.getInt("idReceipt");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    public List<ReceiptDetail> list() {
        List<ReceiptDetail> detailr = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM details order by details desc")) {
            while (rs.next()) {
                detailr.add(getReceiptDetail(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return detailr;
    }

    //RECEIPTDETAIL DAO
    public void  saveRD(ReceiptDetail receipt){
        String sql= null;
        sql ="INSERT INTO receiptdetail(price, quantity, idProduct, idReceipt)VALUES (?,?,?,?)";
        try(Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setDouble(1, receipt.getPrice());
            stmt.setInt(2, receipt.getQuantity());
            stmt.setInt(3, receipt.getProduct().getIdProduct());
            stmt.setInt(4, receipt.getReceipt().getIdReceipt());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private ReceiptDetail getReceiptDetail(ResultSet rs) throws SQLException {

        ReceiptDetail rd = new ReceiptDetail();
        rd.setReceiptDetail(rs.getInt("details"));
        rd.setQuantity(rs.getInt("quantity"));

        Client c = new Client();
        c.setIdClient(rs.getInt("idClient"));
        c.setName(rs.getString("names"));
        c.setSurname(rs.getString("surnames"));

        Employee e = new Employee();
        e.setIdEmployee(rs.getInt("idEmployee"));
        e.setName(rs.getString("nameE"));

        Receipt r = new Receipt();
        r.setIdReceipt(rs.getInt("id"));
        r.setDateP(String.valueOf(rs.getDate("date")));

        r.setClient(c);
        r.setEmployee(e);

        Product p = new Product();
        p.setIdProduct(rs.getInt("idProduct"));
        p.setNameP(rs.getString("nameP"));
        p.setPrice(rs.getDouble("price"));

        rd.setReceipt(r);
        rd.setProduct(p);

        return rd;

    }

}
