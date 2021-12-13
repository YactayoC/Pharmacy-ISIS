package com.proyect.connDB;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class ConnectionDB {
    private final static String url = "jdbc:mysql://localhost:3306/pharmacydb?useSSL=false&"
            + "useTimezone=true&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private final static String username = "root";
    private final static String password = "12345";
    private static BasicDataSource pool;

    public static BasicDataSource getInstance() {
        if (pool == null) {
            pool = new BasicDataSource();
            pool.setUrl(url);
            pool.setUsername(username);
            pool.setPassword(password);
            pool.setInitialSize(3);
            pool.setMinIdle(3);
            pool.setMaxIdle(8);
            pool.setMaxTotal(8);
        }
        return pool;
    }

    public static Connection getConnection() throws SQLException {
        return getInstance().getConnection();
    }
}
