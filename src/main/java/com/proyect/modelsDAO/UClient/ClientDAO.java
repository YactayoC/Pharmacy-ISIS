package com.proyect.modelsDAO.UClient;

import com.proyect.connDB.ConnectionDB;
import com.proyect.modelsDTO.BCar.Receipt;
import com.proyect.modelsDTO.UClient.Client;
import com.proyect.modelsDTO.UClient.District;
import com.proyect.modelsDTO.General.User;
import com.proyect.interfaces.Repository;
import com.proyect.interfaces.Search;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ClientDAO implements Repository<Client>, Search<Client> {


    private Connection getConnection() throws SQLException {
        return ConnectionDB.getConnection();
    }

    @Override
    public List<Client> list() {
        List<Client> clients = new ArrayList<>();
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT c.*,d.*, u.* FROM client AS c "
                     + "INNER JOIN user AS u ON (c.idUser = u.idUser)"
                     + "INNER JOIN district AS d ON (c.idDistrict = d.idDistrict)")) {
            while (rs.next()) {
                Client c = createClient(rs);
                clients.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clients;
    }
    public List<Client> listReiptV() {
        List<Client> clients = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM client AS c  "
                     + "INNER JOIN receipt As r ON (r.idClient = c.idClient)"
                     + "INNER JOIN district As d ON (c.idDistrict = d.idDistrict)")) {
            while (rs.next()) {
                Client c = createReceiptV(rs);
                clients.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clients;
    }

    @Override
    public Client byId(int id) {
        Client client = null;

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.
                     prepareStatement("SELECT c.*,d.*, u.* FROM client AS c "
                             + "INNER JOIN user AS u ON (c.idUser = u.idUser) "
                             + "INNER JOIN district AS d ON (c.idDistrict = d.idDistrict) WHERE c.idClient = ?")) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    client = createClient(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return client;
    }

    @Override
    public void save(Client client) {
        String sql;
        if (client.getIdClient() != null && client.getIdClient() > 0) {
            sql = "UPDATE client SET username = ?, name=?, surname = ?, address = ?, phone = ?, idDistrict = ? WHERE idClient = ?";
        } else {
            sql = "INSERT INTO client(username, name, surname, docIdentity, address, phone, idUser, idDistrict) VALUES (?,?,?,?,?,?,?,?) ";
        }

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, client.getUsername());
            stmt.setString(2, client.getName());
            stmt.setString(3, client.getSurname());

            if (client.getIdClient() != null && client.getIdClient() > 0) {
                stmt.setString(4, client.getAddress());
                stmt.setString(5, client.getPhone());
                stmt.setInt(6, client.getDistrict().getIdDistrict());
                stmt.setInt(7, client.getIdClient());
            } else {
                stmt.setString(4, client.getDocIdentity());
                stmt.setString(5, client.getAddress());
                stmt.setString(6, client.getPhone());
                stmt.setInt(7, client.getUser().getIdUser());
                stmt.setInt(8, client.getDistrict().getIdDistrict());
            }
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {

    }

    public Client getIdUser(int idUser) {
        Client client = null;
        //District district = new District();
        //User user = new User();
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM client AS c " +
                     "INNER JOIN user AS u ON (c.idUser = u.idUser ) " +
                     "INNER JOIN district AS d ON (c.idDistrict = d.idDistrict) " +
                     "WHERE c.idUser = " + idUser)) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
/*                    client.setIdClient(rs.getInt("idClient"));
                    client.setUsername(rs.getString("username"));
                    client.setName(rs.getString("name"));
                    client.setSurname(rs.getString("surname"));
                    client.setDocIdentity(rs.getString("docIdentity"));
                    client.setPhone(rs.getString("phone"));
                    client.setAddress(rs.getString("address"));*/
                    client = createClient(rs);
                }
            }
        } catch (SQLException ignored) {
        }
        return client;
    }

    @Override
    public List<Client> search(String text) {
        List<Client> clients = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT c.*,d.*, u.* FROM client AS c "
                     + "INNER JOIN user AS u ON (c.idUser = u.idUser) "
                     + "INNER JOIN district AS d ON (c.idDistrict = d.idDistrict) "
                     + "WHERE c.docIdentity like '%" + text + "%' ")) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Client c = createClient(rs);
                    clients.add(c);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clients;
    }

    public List<Client> listLast() {
        List<Client> clients = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT c.*,d.*, u.* FROM client AS c "
                     + "INNER JOIN user AS u ON (c.idUser = u.idUser) "
                     + "INNER JOIN district AS d ON (c.idDistrict = d.idDistrict) ORDER BY c.idClient DESC LIMIT 5")) {
            while (rs.next()) {
                Client c = createClient(rs);
                clients.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clients;
    }
    public int updateAddress(Client client) {
        int rows = 0;
        String sql;
        sql = "UPDATE client SET address=?, idDistrict = ? WHERE idClient=?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, client.getAddress());
            stmt.setInt(2, client.getIdDistrict());
            stmt.setInt(3, client.getIdClient());
            rows = stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rows;
    }

    private Client createClient(ResultSet rs) throws SQLException {
        Client c = new Client();
        c.setIdClient(rs.getInt("idClient"));
        c.setUsername(rs.getString("username"));
        c.setName(rs.getString("name"));
        c.setSurname(rs.getString("surname"));
        c.setDocIdentity(rs.getString("docIdentity"));
        c.setAddress(rs.getString("address"));
        c.setPhone(rs.getString("phone"));

        User u = new User();
        u.setIdUser(rs.getInt("idUser"));
        u.setAvatar(rs.getString("avatar"));
        u.setEmail(rs.getString("email"));
        u.setPassword(rs.getString("password"));
        u.setIdMongo(rs.getString("idMongo"));

        District d = new District();
        d.setIdDistrict(rs.getInt("idDistrict"));
        d.setNameD(rs.getString("nameD"));

        c.setUser(u);
        c.setDistrict(d);

        return c;
    }
    private Client createReceiptV(ResultSet rs) throws SQLException {
        Client c = new Client();
        c.setIdClient(rs.getInt("idClient"));
        c.setUsername(rs.getString("username"));
        c.setName(rs.getString("name"));
        c.setSurname(rs.getString("surname"));
        c.setDocIdentity(rs.getString("docIdentity"));
        c.setAddress(rs.getString("address"));
        c.setPhone(rs.getString("phone"));

        Receipt r = new Receipt();
        r.setIdReceipt(rs.getInt("idReceipt"));
        r.setSerialN(rs.getString("serialN"));
        r.setDateP(rs.getString("dateP"));
        r.setPaySt(rs.getString("delSt"));

        District d = new District();
        d.setIdDistrict(rs.getInt("idDistrict"));
        d.setNameD(rs.getString("nameD"));

        c.setReceipt(r);
        c.setDistrict(d);
        return c;
    }

    /***
     * @return <p>A Map<String, User> with idMongo-Avatar </p>
     */
    public Map<String ,Client> getMapUsers() {
        Map<String, Client> clientMap = new HashMap<>();
        this.list().forEach(client -> clientMap.put(client.getUser().getIdMongo(), client));
        return clientMap;
    }

}
