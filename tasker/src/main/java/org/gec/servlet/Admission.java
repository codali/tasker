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
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.owasp.esapi.ESAPI;
import org.owasp.esapi.errors.IntrusionException;
import org.owasp.esapi.errors.ValidationException;
import org.gec.fetch.DataFetch;
import org.gec.db.Connect;


/**
 *
 * @author musthafa
 */

public class Admission extends HttpServlet {
;
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

        try{
            log("test");
            String name = ESAPI.validator().getValidInput("Student Name", request.getParameter("name"), "Name", 30, false);
            String user = ESAPI.validator().getValidInput("User Name", request.getParameter("username"), "Name", 10, false);
            String dob = ESAPI.validator().getValidInput("DOB", request.getParameter("dob"), "Date", 10, false);
            String email = ESAPI.validator().getValidInput("Email", request.getParameter("email"), "Email", 100, true);
            String phone = ESAPI.validator().getValidInput("Phone", request.getParameter("phone"), "Number", 10, false);
            String dept = ESAPI.validator().getValidInput("Department Code", request.getParameter("dept"), "Dept", 3, false);
            String gaurdian = ESAPI.validator().getValidInput("Gaurdian", request.getParameter("gaurdian"), "Name", 50, false);
            String adDate = ESAPI.validator().getValidInput("Admission Date", request.getParameter("adDate"), "Date", 10, false);
            String password = ESAPI.validator().getValidInput("Password", request.getParameter("password"), "SafeString", 16, false);
                //boolean tc = request.getParameter("tc") != null;
            DataFetch df = new DataFetch();
            Connection con = null;
            PreparedStatement pst = null;
            try{
                con = Connect.getConnection();
                log("HEY");
                pst = con.prepareStatement("INSERT INTO `tazker`.`StudentTbl` "
                        + "(`Std_Name`, `Class_ID`, `Dob`, `Email`, `Phone`, `Guar_Name`, `Adm_Date`)"
                        + " VALUES (?,?,?,?,?,?,?)");
                pst.setString(1, name);
                pst.setInt(2,df.getClassIdBy(dept, 1));
                log("TEST IN 87 ");
                log(""+df.getClassIdBy(dept, 1));
                log("TEST IN ");
                pst.setDate(3, java.sql.Date.valueOf(DataFetch.formatDate(dob, "dd/mm/yyyy", "yyyy-mm-dd")));
                pst.setString(4, email);
                pst.setString(5, phone);
                pst.setString(6, gaurdian);
                pst.setDate(7, java.sql.Date.valueOf(DataFetch.formatDate(adDate, "dd/mm/yyyy", "yyyy-mm-dd")));
                log("117");
                pst.executeUpdate();
                log("118");
                pst.close();
                pst = con.prepareStatement("INSERT INTO tazker.login values (last_insert_id(),?,?,?)");
                pst.setString(1, user);
                pst.setString(2, password);
                pst.setString(3, "STD");
                pst.executeUpdate();
                response.sendRedirect("admission1.jsp");
            }
            catch(SQLException |ParseException ex){
                Logger.getLogger(StdAdmission.class.getName()).log(Level.SEVERE, null, ex);
            }
            finally{
                try {
                    pst.close();
                    //con.close();
                } catch (SQLException |NullPointerException ex) {
                    Logger.getLogger(StdAdmission.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        catch(ValidationException | IntrusionException | NullPointerException ex)
        {
            Logger.getLogger(StdAdmission.class.getName()).log(Level.SEVERE, null, ex);
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
