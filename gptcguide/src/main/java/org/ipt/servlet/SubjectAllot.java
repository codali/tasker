/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ipt.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.owasp.esapi.ESAPI;
import org.ipt.poly.DataFetch;
import org.iptgptc.db.HikariPool;
/**
 *
 * @author musthafa
 */
public class SubjectAllot extends HttpServlet {
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
            throws ServletException, IOException{
    HikariPool pool = HikariPool.getInstance();
    Connection con = null;
    try {
        con = pool.getConnection();
    } catch (SQLException ex) {
        Logger.getLogger(SubjectAllot.class.getName()).log(Level.SEVERE, null, ex);
    }
    try {
        Enumeration en=request.getParameterNames();
        DataFetch df = new DataFetch();
        String subject;
        String teacher;
        PreparedStatement ps = con.prepareStatement("INSERT INTO DB_GPTC.SubjectAllotTbl (Subject_Id,Teacher_Id) VALUES (?,?)");
        while(en.hasMoreElements())
        {
            
            Object objOri=en.nextElement();
            subject =(String)objOri;
            teacher = request.getParameter(subject);
            log(""+df.getSubjectId(subject));
            log( ""+df.getTeacherId(teacher));
            log("Subject Is "+subject);
            log("Teacher "+teacher);
            ps.setInt(1, df.getSubjectId(subject));
            ps.setInt(2, df.getTeacherId(teacher));
            ps.executeUpdate();
        }
        ps.close();
    } catch (SQLException ex) {
        Logger.getLogger(SubjectAllot.class.getName()).log(Level.SEVERE, null, ex);
    }
    finally{
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(SubjectAllot.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    response.sendRedirect("index.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    

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
