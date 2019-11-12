/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.gec.servlet;

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
import org.gec.db.Connect;

/**
 *
 * @author Shamla
 */
public class LoginServlet extends HttpServlet {

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
        
        if(!request.getParameter("userid").equals("") && !request.getParameter("password").equals(""))
        {
            //session.setAttribute("id", "1211");
            //session.setAttribute("role", "STD");
            //session.setAttribute("form", "");
            //request.getRequestDispatcher("/index.jsp").forward(request, response);
            try {
                Connection con = Connect.getConnection();
                PreparedStatement pstm = con.prepareStatement("SELECT ID, role from tazker.login where user = ? and password = ?");
                pstm.setString(1, request.getParameter("userid"));
                pstm.setString(2, request.getParameter("password"));
                ResultSet rs = pstm.executeQuery();
                if(rs.next())
                {
                    response.sendRedirect("index.jsp");
                    log("LOGIN SUCCESSSSS");
                    session.setAttribute("id", rs.getString("ID"));
                    session.setAttribute("role", rs.getString("role"));
                    session.setAttribute("form", "");
                    rs.close();
                    pstm.close();
                    //con.close();
                    log(session.getAttribute("id").toString());
                }
                else{
                        rs.close();
                        pstm.close();
                        //con.close();
                        session.setAttribute("valid", "error");
                        request.getRequestDispatcher("/login.jsp").forward(request, response);
                }
                
            } catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                session.setAttribute("valid", "error");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }
        else
        {
            session.setAttribute("valid", "error");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
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
