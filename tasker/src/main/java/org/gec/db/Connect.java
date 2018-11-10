/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.gec.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



/**
 *
 * @author musthafa
 */
public class Connect {
    static Connection con=null;
    public static Connection getConnection() throws SQLException
    {
        if (con != null) return con;
        // get db, user, pass from settings file
        return getConnection("tazker", "root", "root");
    }

    private static Connection getConnection(String db_name,String user_name,String password)
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/"+db_name+"?user="+user_name+"&password="+password);
        }
        catch(ClassNotFoundException | SQLException e)
        {
            e.printStackTrace();
        }

        return con;        
    }
} 

