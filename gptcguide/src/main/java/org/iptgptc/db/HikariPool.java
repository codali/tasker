/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.iptgptc.db;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;
import java.sql.SQLException;
/**
 *
 * @author musthafa
 */


public class HikariPool {

    private static HikariPool instance = null;
    private HikariDataSource ds = null;

    static {
        try {
            instance = new HikariPool();
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(), e);
        }

    }

    
    private HikariPool() {
        ds = new HikariDataSource();

        ds.setMaximumPoolSize(10);
        ds.setDriverClassName("com.mysql.jdbc.Driver");
        ds.setJdbcUrl("jdbc:mysql://localhost:3306/DB_GPTC");
        ds.setUsername("root");
        ds.setPassword("rootuser");
        ds.addDataSourceProperty("cachePrepStmts", "true");
        ds.addDataSourceProperty("prepStmtCacheSize", "250");
        ds.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
        ds.addDataSourceProperty("useServerPrepStmts", "true");
    }

    public static HikariPool getInstance() {
        return instance;
    }

    public Connection getConnection() throws SQLException {
        return ds.getConnection();
    }

}