/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.gec.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import org.owasp.esapi.ESAPI;
import org.owasp.esapi.errors.IntrusionException;
import org.owasp.esapi.errors.ValidationException;
import org.gec.fetch.DataFetch;
import org.gec.db.Connect;
/**
 *
 * @author musthafa
 */
public class ClassAllocation extends HttpServlet {

    /**
     * Processes requests for both <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try{
            String depCode = request.getParameter("dept");
            String teacherName = request.getParameter("tchr");
            depCode = ESAPI.validator().getValidInput("Department Code", depCode, "Dept", 4, false);
            teacherName = ESAPI.validator().getValidInput("Teacher name", teacherName, "Name", 40, false);
            int sem = ESAPI.validator().getValidInteger("Semester", request.getParameter("semester"), 1, 6, false);
            DataFetch df = new DataFetch();
            Connection con = null;
            try {
                con = Connect.getConnection();
                PreparedStatement pst = con.prepareStatement("INSERT INTO tazker.ClassTbl (Dep_Id,Tutor_Id,Semester) VALUES (?,?,?)");
                pst.setInt(1, df.getDepId(depCode));
                pst.setInt(2, df.getTeacherId(teacherName));
                pst.setInt(3, sem);
                pst.executeUpdate();
                session.setAttribute("form", "sucess");
                pst.close();
            } catch (SQLException ex) {
                Logger.getLogger(ClassAllocation.class.getName()).log(Level.SEVERE, null, ex);
                session.setAttribute("form", "used");
            }
            
        }
        catch(NullPointerException | ValidationException | IntrusionException |NumberFormatException ex){
            Logger.getLogger(ClassAllocation.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("from", "error");
        }
        response.sendRedirect("class_table.jsp");
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
