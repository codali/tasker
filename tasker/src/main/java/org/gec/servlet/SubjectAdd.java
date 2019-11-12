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
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.owasp.esapi.ESAPI;
import org.owasp.esapi.errors.IntrusionException;
import org.owasp.esapi.errors.ValidationException;
import org.gec.fetch.DataFetch;
import org.gec.db.Connect;

/**
 *
 * @author musthafa
 */
public class SubjectAdd extends HttpServlet {
    private int success = 0, error = 0;

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
        success = 0;
        error = 0;
        Enumeration en=request.getParameterNames();
        HttpSession session = request.getSession();
        String code ="";
        String name ="";
        int sem = 0;
        int periods = 0;
        int ringCount = 0;
        
        while(en.hasMoreElements())
	{
            
            Object objOri=en.nextElement();
            String value=(String)objOri;
            log(value);
            try{
                if(value.contains("periods")) {
                    periods = ESAPI.validator().getValidInteger("Periods/Week", request.getParameter(value), 1, 100, false);
                    log("per = "+periods);
                    ringCount++;
                }
                else if(value.contains("code")) {
                    code = request.getParameter(value);
                    log("Code  = "+code);
                    ringCount++;
                }
                else if(value.contains("name")) {
                    name = ESAPI.validator().getValidInput("Subject Name", request.getParameter(value), "Name", 30, false);
                    log("NAm "+name);
                    ringCount++;
                }
                else if(value.contains("semester")) {
                    sem = ESAPI.validator().getValidInteger("Semester", request.getParameter(value), 1, 8, false);
                    log("sen = "+sem);
                    ringCount++;
                }
                if(ringCount == 4) {
                    ringCount = 0;
                    dataUpload(code, name, periods, sem);
                }
//                switch(ringCount){
//                    case 2: code = request.getParameter(value);
//                            log("Code  = "+code);
//                            ringCount++;
//                            break;
//                    case 4: name = ESAPI.validator().getValidInput("Subject Name", request.getParameter(value), "Name", 30, false);
//                            log("NAm "+name);
//                            ringCount++;
//                            break;
//                    case 1: periods = ESAPI.validator().getValidInteger("Periods/Week", request.getParameter(value), 1, 100, false);
//                            log("per = "+periods);
//                            ringCount++;
//                            break;
//                    case 3: sem = ESAPI.validator().getValidInteger("Semester", request.getParameter(value), 1, 8, false);
//                            log("sen = "+sem);
//                            ringCount = 1;
//                            dataUpload(code, name, periods, sem);
//                            break;
//                }
            }
            catch(ValidationException |IntrusionException | SQLException ex){
               Logger.getLogger(SubjectAdd.class.getName()).log(Level.SEVERE, null, ex);
               error++;
            }
        }
        session.setAttribute("form", "Success = "+success+" Error = "+error);
        response.sendRedirect("subjectadd.jsp");
    }
    private void dataUpload(String cod, String nam, int period, int seme) throws SQLException
    {
        Connection con = Connect.getConnection();
        
        DataFetch df = new DataFetch();
        try (PreparedStatement pst = con.prepareStatement("INSERT INTO"
                + " `tazker`.`SubjectTbl`(`Subject_Code`,`Subject_Name`,"
                + "`Periods_Week`,`Dep_Id`,`Semester`)"
                + "VALUES(?,?,?,?,?)")) {
        pst.setString(1, cod);
            log("dsfds = "+nam);
        pst.setString(2, nam);
        pst.setInt(3, period);
        pst.setInt(4,df.getDepId("CSE"));//HARD CODED DEP NAME
        pst.setInt(5, seme);
        pst.executeUpdate();
        success++;
        }
        finally{
            //con.close();
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
