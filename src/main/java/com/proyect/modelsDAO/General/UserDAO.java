package com.proyect.modelsDAO.General;

import com.proyect.connDB.ConnectionDB;
import com.proyect.modelsDTO.General.User;
import com.proyect.interfaces.Repository;
import com.proyect.interfaces.Validate;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDAO implements Repository<User>, Validate {

    private Connection getConnection() throws SQLException {
        return ConnectionDB.getConnection();
    }

    @Override
    public List<User> list() {
        List<User> users = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM user")) {
            while (rs.next()) {
                User u = createUser(rs);
                users.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public User byId(int id) {
        User user = null;

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.
                     prepareStatement("SELECT * FROM user WHERE idUser = ?")) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    user = createUser(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void save(User user) {
        String sql;
        if (user.getIdUser() != null && user.getIdUser() > 0) {
            sql = "UPDATE user SET  password = ? WHERE idUser = ?";
        } else {
            sql = "INSERT INTO user(email,password,avatar,flag, idMongo) VALUES (?,?,?,?,?) ";
        }
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            if (user.getIdUser() != null && user.getIdUser() > 0) {
                stmt.setString(1, user.getPassword());
                stmt.setInt(2, user.getIdUser());
            } else {
                stmt.setString(1, user.getEmail());
                stmt.setString(2, user.getPassword());
                stmt.setString(3, user.getAvatar());
                stmt.setInt(4, user.getFlag());
                stmt.setString(5, user.getIdMongo());
            }
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM user WHERE idUser = ?")) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean validate(User user) {
        boolean userExist = false;
        String sql = "SELECT * FROM user WHERE email=? AND password=? ";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPassword());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                userExist = true;
                user.setIdUser(rs.getInt("idUser"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setAvatar(rs.getString("avatar"));
                user.setFlag(rs.getInt("flag"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userExist;
    }

    public void saveAvatar(User user) {
        String sql = null;
        sql = "UPDATE user SET avatar = ? WHERE idUser = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getAvatar());
            stmt.setInt(2, user.getIdUser());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /***
     * @return <p>A Map<String> with idMongo-Avatar </p>
     */
    public Map<String ,String> getAvatars() {
        Map<String, String> avatars = new HashMap<>();
        try (Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM user")) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String idMongo = rs.getString("idMongo");
                String avatar = rs.getString("avatar");

                avatars.put(idMongo, avatar);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return avatars;
    }

    public int getLastIdUser() {
        int idUser = 0;
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT idUser FROM user ORDER BY idUser DESC")) {
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    idUser = rs.getInt("idUser");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idUser;
    }

    private User createUser(ResultSet rs) throws SQLException {
        User u = new User();
        u.setIdUser(rs.getInt("idUser"));
        u.setEmail(rs.getString("email"));
        u.setPassword(rs.getString("password"));
        u.setFlag(rs.getInt("flag"));
        u.setAvatar(rs.getString("avatar"));
        u.setIdMongo(rs.getString("idMongo"));
        return u;
    }

}
