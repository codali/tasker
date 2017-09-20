/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ipt.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.ipt.poly.DataFetch;
import org.iptgptc.db.HikariPool;
import java.lang.Exception;
import javax.sql.DataSource;
import org.iptgptc.db.ConnectionPools;
/**
 *
 * @author musthafa
 */
public class TimeTableServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            DataFetch df = new DataFetch();
            int[] slot = new int[36];
            int i = 0;
            int classid=0;
            for(int j=1; j<= 5; j++){
                for(int k = 1; k <= 7; k++){
                    slot[i] = df.getSubjectId(request.getParameter("sub"+j+""+k));
                    log(""+slot[i]);
                    i++;
                }
            }
            DataSource pool = ConnectionPools.getTransactional();
            Connection con = pool.getConnection();
            PreparedStatement pst = con.prepareStatement
        
        ("SELECT Class_Id FROM "
                    + "DB_GPTC.ClassTbl WHERE Tutor_Id = ?");
            pst.setString(1, session.getAttribute("id").toString());
            ResultSet rs = pst.executeQuery();
            if(rs.next())
                classid = rs.getInt(1);
            pst = con.prepareStatement("INSERT INTO DB_GPTC.TimeTbl VALUES"
                    + "(?,?,?,?,?,?,?,?,?),"
                    + "(?,?,?,?,?,?,?,?,?),"
                    + "(?,?,?,?,?,?,?,?,?),"
                    + "(?,?,?,?,?,?,?,?,?),"
                    + "(?,?,?,?,?,?,?,?,?)");
            i=0;
            int m=1;
            for(int day=1; day<= 5; day++){
                pst.setInt(m, classid);
                m++;
                pst.setInt(m, day);
                m++;
                for(int k = 1; k <= 7; k++,m++){
                    pst.setInt(m, slot[i]);
                    i++;
                }
            }
            pst.executeUpdate();
            response.sendRedirect("index.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(TimeTableServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
            
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
