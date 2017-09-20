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
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import org.owasp.esapi.ESAPI;
import org.owasp.esapi.errors.IntrusionException;
import org.owasp.esapi.errors.ValidationException;
import org.ipt.poly.DataFetch;
import org.ipt.poly.PasswordAuthentication;
import org.iptgptc.db.ConnectionPools;


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
            int admno = ESAPI.validator().getValidInteger("Admission No.", request.getParameter("admission"), 1000, 99999, false);
            String name = ESAPI.validator().getValidInput("Student Name", request.getParameter("name"), "Name", 30, false);
            String address = ESAPI.validator().getValidInput("Address", request.getParameter("address"), "Address", 199, false);
            int pin = ESAPI.validator().getValidInteger("Pincode", request.getParameter("pin"), 100000, 999999, false);
            String gender = "f";
            if(request.getParameter("gender").equals("male"))
                gender = "m";
            String dob = ESAPI.validator().getValidInput("DOB", request.getParameter("dob"), "Date", 10, false);
            String email = ESAPI.validator().getValidInput("Email", request.getParameter("email"), "Email", 100, true);
            String phone = ESAPI.validator().getValidInput("Phone", request.getParameter("phone"), "Number", 10, false);
            String dept = ESAPI.validator().getValidInput("Department Code", request.getParameter("dept"), "Dept", 3, false);
            String nation = ESAPI.validator().getValidInput("Nationality", request.getParameter("nation"), "Name", 6, false);
            String religion = ESAPI.validator().getValidInput("Religion", request.getParameter("religion"), "Name", 10, false);
            String caste = ESAPI.validator().getValidInput("Caste", request.getParameter("caste"), "Name", 10, false);
            String gaurdian = ESAPI.validator().getValidInput("Gaurdian", request.getParameter("gaurdian"), "Name", 50, false);
            String relation = ESAPI.validator().getValidInput("Relation", request.getParameter("relation"), "Name", 10, false);
            String occup = ESAPI.validator().getValidInput("Occupation", request.getParameter("occupation"), "Name", 50, false);
            int income = ESAPI.validator().getValidInteger("Income", request.getParameter("income"), 100, 999999999, false);
            String adDate = ESAPI.validator().getValidInput("Admission Date", request.getParameter("adDate"), "Date", 10, false);
            boolean tenth = request.getParameter("tenth") != null;
            boolean vhse = request.getParameter("vhse") != null;
            boolean iti = request.getParameter("iti") != null;
            boolean community = request.getParameter("community") != null;
            boolean incomeCert = request.getParameter("income") != null;
            boolean castCert = request.getParameter("castecert") != null;
            boolean nativity = request.getParameter("nativity") != null;
            boolean tc = request.getParameter("tc") != null;
            DataFetch df = new DataFetch();
            Connection con = null;
            PreparedStatement pst = null;
            try{
                DataSource pool = ConnectionPools.getProcessing();
                con = pool.getConnection();
                log("HEY");
                pst = con.prepareStatement("INSERT INTO DB_GPTC.StudentTbl (Adm_No, "
                        + "Std_Name, Address, Class_ID, Pin, Gender, Dob, Email, "
                        + "Phone,Nationality, Religion, Caste, Guar_Name, "
                        + "Relation, Guar_Occ,Anual_Income, Adm_Date, Tenth_Cert, "
                        + "Vhse_Cert, Iti_Cert,Community_Cert, Income_Cert,Cast_Cert, "
                        + "Nativity_Cert, Tc_Cert) VALUES"
                        + "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                pst.setInt(1, admno);
                pst.setString(2, name);
                pst.setString(3, address);
                pst.setInt(4,df.getClassIdBy(dept, 1));
                log("TEST IN 87 ");
                log(""+df.getClassIdBy(dept, 1));
                log("TEST IN ");
                pst.setInt(5,pin);
                pst.setString(6,gender);
                pst.setDate(7, java.sql.Date.valueOf(DataFetch.formatDate(dob, "dd/mm/yyyy", "yyyy-mm-dd")));
                pst.setString(8, email);
                pst.setString(9, phone);
                pst.setString(10,nation);
                pst.setString(11, religion);
                pst.setString(12, caste);
                pst.setString(13, gaurdian);
                pst.setString(14, relation);
                pst.setString(15, occup);
                pst.setInt(16, income);
                pst.setDate(17, java.sql.Date.valueOf(DataFetch.formatDate(adDate, "dd/mm/yyyy", "yyyy-mm-dd")));
                pst.setBoolean(18, tenth);
                pst.setBoolean(19, vhse);
                pst.setBoolean(20, iti);
                pst.setBoolean(21, community);
                pst.setBoolean(22, incomeCert);
                pst.setBoolean(23, castCert);
                pst.setBoolean(24, nativity);
                pst.setBoolean(25, tc);
                log("117");
                pst.executeUpdate();
                log("118");
                pst.close();
                pst = con.prepareStatement("INSERT INTO DB_GPTC.LoginTbl values (last_insert_id(),?,?,?,?)");
                byte[] salt = PasswordAuthentication.getNextSalt();
                byte[] hashed = PasswordAuthentication.hash(dob.toCharArray(), salt);
                pst.setString(1,""+admno);
                pst.setBytes(2,hashed);
                pst.setBytes(3, salt);
                pst.setString(4, "STD");
                pst.executeUpdate();
                response.sendRedirect("admission1.jsp");
            }
            catch(SQLException |ParseException ex){
                Logger.getLogger(StdAdmission.class.getName()).log(Level.SEVERE, null, ex);
            }
            finally{
                try {
                    pst.close();
                    con.close();
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
