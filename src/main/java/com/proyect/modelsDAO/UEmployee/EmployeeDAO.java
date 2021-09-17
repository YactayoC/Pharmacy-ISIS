package com.proyect.modelsDAO.UEmployee;

import com.proyect.connDB.ConnectionDB;
import com.proyect.modelsDTO.UEemployee.Employee;
import com.proyect.modelsDTO.UEemployee.Role;
import com.proyect.modelsDTO.General.User;
import com.proyect.interfaces.Repository;
import com.proyect.interfaces.Search;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO implements Repository<Employee>, Search<Employee> {

    private Connection getConnection() throws SQLException {
        return ConnectionDB.getConnection();
    }

    @Override
    public List<Employee> list() {
        List<Employee> employees = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT e.*,r.*,u.* FROM employee AS e " +
                     "INNER JOIN role AS r ON (e.idRole = r.idRole) " +
                     "INNER JOIN user AS u ON (e.idUser = u.idUser) WHERE e.idEmployee != 1")) {
            while (rs.next()) {
                Employee e = createEmployee(rs);
                employees.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }

    @Override
    public Employee byId(int id) {
        Employee employee = null;

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.
                     prepareStatement("SELECT e.*,r.*,u.* FROM employee AS e " +
                             "INNER JOIN role AS r ON (e.idRole = r.idRole) " +
                             "INNER JOIN user AS u ON (e.idUser = u.idUser) WHERE e.idEmployee = ?")) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    employee = createEmployee(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    @Override
    public void save(Employee employee) {
        String sql;
        if (employee.getIdEmployee() != null && employee.getIdEmployee() > 0) {
            sql = "UPDATE employee SET name=?, surname = ?, phone = ?, idRole = ? WHERE idEmployee = ?";
        } else {
            sql = "INSERT INTO employee(name, surname, docIdentity, phone, idRole, idUser) VALUES (?,?,?,?,?,?) ";
        }
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, employee.getName());
            stmt.setString(2, employee.getSurname());

            if (employee.getIdEmployee() != null && employee.getIdEmployee() > 0) {
                stmt.setString(3, employee.getPhone());
                stmt.setInt(4, employee.getRole().getIdRole());
                stmt.setInt(5, employee.getIdEmployee());
            } else {
                stmt.setString(3, employee.getDocIdentity());
                stmt.setString(4, employee.getPhone());
                stmt.setInt(5, employee.getRole().getIdRole());
                stmt.setInt(6, employee.getUser().getIdUser());
            }

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM employee WHERE idEmployee = ?")) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Employee getIdUser(int idUser) {
        Employee employee = null;
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM employee AS e " +
                     "INNER JOIN user AS u ON (e.idUser = u.idUser )" +
                     "INNER JOIN role AS r ON (e.idRole = r.idRole) WHERE e.idUser = " + idUser)) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
/*                    employee.setIdEmployee(rs.getInt("idEmployee"));
                    employee.setName(rs.getString("name"));
                    employee.setSurname(rs.getString("surname"));
                    employee.setDocIdentity(rs.getString("docIdentity"));
                    employee.setPhone(rs.getString("phone"));
                    Role role = new Role();
                    role.setIdRole(rs.getInt("idRole"));
                    role.setNameR(rs.getString("nameR"));
                    employee.setRole(role);*/
                    employee = createEmployee(rs);
                }
            }
        } catch (SQLException ignored) {
        }
        return employee;
    }

    @Override
    public List<Employee> search(String text) {
        List<Employee> employees = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT e.*, r.*, u.* FROM employee AS e "
                     + "INNER JOIN role AS r ON (e.idRole = r.idRole) "
                     + "INNER JOIN user AS u ON (e.idUser = u.idUser) "
                     + "WHERE e.docIdentity like '%" + text + "%' AND e.idEmployee != 1")) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Employee e = createEmployee(rs);
                    employees.add(e);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }

    public void saveSetting(Employee employee) {
        String sql = null;
        sql = "UPDATE employee SET name=?, surname = ?, phone = ? WHERE idEmployee = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, employee.getName());
            stmt.setString(2, employee.getSurname());
            stmt.setString(3, employee.getPhone());
            stmt.setInt(4, employee.getIdEmployee());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Employee createEmployee(ResultSet rs) throws SQLException {
        Employee e = new Employee();
        e.setIdEmployee(rs.getInt("idEmployee"));
        e.setName(rs.getString("name"));
        e.setSurname(rs.getString("surname"));
        e.setDocIdentity(rs.getString("docIdentity"));
        e.setPhone(rs.getString("phone"));

        Role role = new Role();
        role.setIdRole(rs.getInt("idRole"));
        role.setNameR(rs.getString("nameR"));

        User user = new User();
        user.setIdUser(rs.getInt("idUser"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setAvatar(rs.getString("avatar"));
        user.setFlag(rs.getInt("flag"));
        user.setIdMongo(rs.getString("idMongo"));

        e.setRole(role);
        e.setUser(user);

        return e;
    }

}
