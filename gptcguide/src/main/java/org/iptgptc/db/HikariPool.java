/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.iptgptc.db;

import com.typesafe.config.Config;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

public class HikariPool {
    private HikariPool() {

    }
    
    public static HikariDataSource getDataSourceFromConfig(
        Config conf
        ) {

        HikariConfig jdbcConfig = new HikariConfig();
        jdbcConfig.setDriverClassName(conf.getString("jdbcDriver"));
        jdbcConfig.setPoolName(conf.getString("poolName"));
        jdbcConfig.setMaximumPoolSize(conf.getInt("maximumPoolSize"));
        jdbcConfig.setMinimumIdle(conf.getInt("minimumIdle"));
        jdbcConfig.setJdbcUrl(conf.getString("jdbcUrl"));
        jdbcConfig.setUsername(conf.getString("username"));
        jdbcConfig.setPassword(conf.getString("password"));

        jdbcConfig.addDataSourceProperty("cachePrepStmts", conf.getBoolean("cachePrepStmts"));
        jdbcConfig.addDataSourceProperty("prepStmtCacheSize", conf.getInt("prepStmtCacheSize"));
        jdbcConfig.addDataSourceProperty("prepStmtCacheSqlLimit", conf.getInt("prepStmtCacheSqlLimit"));
        jdbcConfig.addDataSourceProperty("useServerPrepStmts", conf.getBoolean("useServerPrepStmts"));

        // Add HealthCheck

        // Add Metrics
        return new HikariDataSource(jdbcConfig);
    }
}