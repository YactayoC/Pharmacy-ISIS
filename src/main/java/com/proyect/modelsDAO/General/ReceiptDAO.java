package com.proyect.modelsDAO.General;

import com.proyect.connDB.ConnectionDB;
import com.proyect.modelsDTO.BCar.Receipt;
import com.proyect.modelsDTO.BCar.ReceiptDetail;
import com.proyect.modelsDTO.OProduct.Product;
import com.proyect.modelsDTO.UEemployee.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReceiptDAO {
    private Connection getConnection() throws SQLException {
        return ConnectionDB.getConnection();
    }
    public List<ReceiptDetail> listDetail(int id) {
        List<ReceiptDetail> receiptsDR = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM receipt AS r "
                     + "INNER JOIN receiptdetail AS rd ON (r.idReceipt = rd.idReceipt )"
                     + "INNER JOIN employee As e ON (r.idEmployee = e.idEmployee)"
                     + "INNER JOIN product As p ON (rd.idProduct = p.idProduct) WHERE rd.idReceipt = '"+id+"'")) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ReceiptDetail r = createReceipt(rs);
                    receiptsDR.add(r);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return receiptsDR;
    }
    public List<Receipt> listReipt() {
        List<Receipt> receipts = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT r.idReceipt,r.serialN,count(p.idProduct) as quantity, e.name, r.dateP,sum(p.price) as price FROM receipt AS r "
                     + "INNER JOIN receiptdetail AS rd ON (r.idReceipt = rd.idReceipt )"
                     + "INNER JOIN employee As e ON (r.idEmployee = e.idEmployee)"
                     + "INNER JOIN product As p ON (rd.idProduct = p.idProduct) group by r.idReceipt ")) {
            while (rs.next()) {
                Receipt r = createReceipt2(rs);
                receipts.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return receipts;
    }
    public String GenerateSerial() {
        String serialNum = "";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT MAX(serialN) FROM receipt")) {
            while (rs.next()) {
                serialNum = rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serialNum;
    }

    public String ReceiptId(){
        String receiptid = "";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT MAX(idReceipt) FROM receipt")) {
            while (rs.next()) {
                receiptid = rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return receiptid;
    }
    public void save(Receipt receipt){
        String sql= null;
        sql ="INSERT INTO receipt(serialN, dateP, delSt, idEmployee, idmetPay, idmetSale)VALUES (?,?,?,?,?,?)";
        try(Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)){
            stmt.setString(1, receipt.getSerialN());
            stmt.setString(2, receipt.getDateP());
            stmt.setString(3, receipt.getPaySt());
            stmt.setInt(4, receipt.getEmployee().getIdEmployee());
            stmt.setInt(5, receipt.getMetPay().getIdMetPay());
            stmt.setInt(6, receipt.getMetSale().getIdMetSale());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
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
    private ReceiptDetail createReceipt(ResultSet rs) throws SQLException {
        Receipt r = new Receipt();
        r.setIdReceipt(rs.getInt("idReceipt"));
        r.setSerialN(rs.getString("serialN"));
        r.setDateP(rs.getString("dateP"));
        r.setPaySt(rs.getString("delSt"));

        ReceiptDetail rd = new ReceiptDetail();
        rd.setPrice(rs.getDouble("price"));
        rd.setQuantity(rs.getInt("quantity"));

        Employee e = new Employee();
        e.setIdEmployee(rs.getInt("idEmployee"));
        e.setName(rs.getString("name"));
        e.setSurname(rs.getString("surname"));
        e.setDocIdentity(rs.getString("docIdentity"));
        e.setPhone(rs.getString("phone"));

        Product p = new Product();
        p.setIdProduct(rs.getInt("idProduct"));
        p.setNameP(rs.getString("nameP"));
        p.setPrice(rs.getDouble("price"));
        p.setStock(rs.getInt("stock"));
        p.setUrlPhoto(rs.getString("urlPhoto"));
        p.setDetail(rs.getString("detail"));

        r.setEmployee(e);
        rd.setProduct(p);
        rd.setReceipt(r);
        return rd;
    }
    private Receipt createReceipt2(ResultSet rs) throws SQLException {
        Receipt r = new Receipt();
        r.setIdReceipt(rs.getInt("idReceipt"));
        r.setSerialN(rs.getString("serialN"));
        r.setDateP(rs.getString("dateP"));

        ReceiptDetail rd = new ReceiptDetail();
        rd.setPrice(rs.getDouble("price"));
        rd.setQuantity(rs.getInt("quantity"));

        Employee e = new Employee();
        e.setName(rs.getString("name"));

        r.setEmployee(e);
        r.setReceiptDetail(rd);
        return r;
    }
}
