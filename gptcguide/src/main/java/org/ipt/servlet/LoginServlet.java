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
import org.ipt.poly.PasswordAuthentication;
import org.iptgptc.db.HikariPool;

/**
 *
 * @author musthafa
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if(!request.getParameter("userid").equals("") && !request.getParameter("password").equals(""))
        {
            HikariPool pool = HikariPool.getInstance();
            try {
                Connection con = pool.getConnection();
                PreparedStatement pstm = con.prepareStatement("SELECT Id, HashPass, Salt,Role from DB_GPTC.LoginTbl where UserName = ?");
                pstm.setString(1, request.getParameter("userid"));
                ResultSet rs = pstm.executeQuery();
                if(rs.next())
                {
                    byte[] pass = rs.getBytes("HashPass");
                    byte[] salt = rs.getBytes("salt");
                    char[] tempPass = request.getParameter("password").toCharArray();
                    if(PasswordAuthentication.isExpectedPassword(tempPass, salt, pass))
                    {
                        response.sendRedirect("index.jsp");
                        session.setAttribute("id", rs.getString("Id"));
                        session.setAttribute("role", rs.getString("Role"));
                        session.setAttribute("form", "");
                        rs.close();
                        pstm.close();
                        con.close();
                        log(session.getAttribute("id").toString());

                    }
                    else
                    {
                        session.setAttribute("valid", "error");
                        request.getRequestDispatcher("/login.jsp").forward(request, response);
                    }
                }
                else{
                        rs.close();
                        pstm.close();
                        con.close();
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
