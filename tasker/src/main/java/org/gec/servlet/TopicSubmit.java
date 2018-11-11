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
import javax.servlet.http.HttpSession;

import org.owasp.esapi.ESAPI;
import org.gec.fetch.DataFetch;
import org.gec.db.Connect;
import org.owasp.esapi.errors.IntrusionException;
import org.owasp.esapi.errors.ValidationException;

/**
 *
 * @author musthafa
 */
public class TopicSubmit extends HttpServlet {

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
        PreparedStatement pst=null;
        Connection con = null;
        DataFetch df = new DataFetch();
        try{
            
            String topic = ESAPI.validator().getValidInput("Assignment Topic", 
                    request.getParameter("topic"), "Name", 100, false);
            String temp = request.getParameter("subject");
            log(request.getParameter("lastDate"));
            int subject = Integer.parseInt(temp.substring(0,temp.indexOf("_")));
            int semester = Integer.parseInt(temp.substring(temp.indexOf("_")+1));
            log(""+subject);
            log(""+semester);
            String lastDate = ESAPI.validator().getValidInput("Last Date", request.getParameter("lastDate")
                    , "Date", 10,false);
            String details = ESAPI.validator().getValidSafeHTML("Assignment Details",
                    request.getParameter("details"),1999, false);
            boolean lateSubmission = request.getParameter("latesubmit") != null;
            con = Connect.getConnection();
            log("63");
            pst = con.prepareStatement("INSERT INTO tazker.AssignmentDetailsTbl"
                    + " (Subject_Id,Class_Id,Topic,Body,Lst_Date,Allow_Late) VALUES (?,?,?,?,?,?)");
            log("66");
            pst.setInt(1, subject);
            log("68");
            pst.setInt(2, df.getClassIdBy(subject, semester));
            log("70");
            pst.setString(3, topic);
            log("72");
            pst.setString(4, details);
            log("74");
            pst.setDate(5, java.sql.Date.valueOf(DataFetch.formatDate(lastDate, "dd/mm/yyyy", "yyyy-mm-dd")));
            pst.setBoolean(6, lateSubmission);
            log("76");
            //pst.executeUpdate();
            log("78");
            session.setAttribute("form","success");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            

        } catch (ValidationException | IntrusionException | SQLException | ParseException ex) {
            Logger.getLogger(TopicSubmit.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("form","error");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        finally{
            try {
                pst.close();
                //con.close();
            } catch (SQLException  | NullPointerException ex) {
                Logger.getLogger(TopicSubmit.class.getName()).log(Level.SEVERE, null, ex);
            }
            
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
