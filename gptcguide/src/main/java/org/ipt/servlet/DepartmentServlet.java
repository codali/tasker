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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import org.iptgptc.db.ConnectionPools;
import org.owasp.esapi.ESAPI;
import org.owasp.esapi.errors.IntrusionException;
import org.iptgptc.db.HikariPool;
import org.owasp.esapi.errors.ValidationException;

/**
 *
 * @author musthafa
 */
@WebServlet(name = "DepartmentServlet", urlPatterns = {"/DepartmentServlet"})
public class DepartmentServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        String departmentCode = null;
        String deparmentName =null;
        DataSource pool = ConnectionPools.getProcessing();
        Connection con= null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        
        try
        {
            departmentCode = request.getParameter("deptcode");
            deparmentName = request.getParameter("deptname");
            log(departmentCode);
            log(deparmentName);
            if(!departmentCode.isEmpty() && !deparmentName.isEmpty())
            {
                departmentCode = ESAPI.validator().getValidInput("DepartmentCode", departmentCode, "Name", 5, false);
                deparmentName =  ESAPI.validator().getValidInput("DepartmentName", deparmentName, "Name", 30, false);
                log("Success :Code = "+departmentCode);
                try{
                    con = pool.getConnection();
                    pstmt = con.prepareStatement("INSERT INTO DB_GPTC.DepartmentTbl (Dep_Code,Dep_Name) VALUES (?,?)");
                    pstmt.setString(1, departmentCode);
                    pstmt.setString(2, deparmentName);
                    pstmt.executeUpdate();
                    session.setAttribute("form", "success");
                    pstmt.close();
                    con.close();
                 }
                catch (SQLException ex) {
                    Logger.getLogger(DepartmentServlet.class.getName()).log(Level.SEVERE, null, ex);
                    session.setAttribute("form", "used");
                }
            }
            
            
        }
        catch(IntrusionException  | NullPointerException |ValidationException ex){
            Logger.getLogger(DepartmentServlet.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("form", "error");
        }
        finally{
            
            request.getRequestDispatcher("/dept.jsp").forward(request, response);
            }
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