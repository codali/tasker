/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.gec.servlet;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.RandomStringUtils;
import org.gec.db.Connect;


/**
 * Servlet implementation class UploadServlet
 */
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DATA_DIRECTORY = "data";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 10;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 10;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Check that we have a file upload request
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) {
            return;
        }
        HttpSession session = request.getSession();
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(MAX_MEMORY_SIZE);
        log("On 48");
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        String uploadFolder = getServletContext().getRealPath("")
                + File.separator + DATA_DIRECTORY;
        log(uploadFolder);
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(MAX_REQUEST_SIZE);

        try {
            // Parse the request
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            boolean fileCheck = false, idCheck = false;
            int id = 0;
            String fileName = null;
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (item.isFormField()) {
                    String inputname = item.getFieldName();
                    String inputvalue = item.getString();
                    if(inputname.equals("submit"))
                    {
                        id = Integer.parseInt(inputvalue);
                        idCheck = true;
                    }
                }
                else
                {
                    if(getFileExtension(item.getName()).equals("pdf"))
                    {
                        String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
                        log(timeStamp);
                        fileName = new File(timeStamp+RandomStringUtils.randomAlphabetic(4)+".pdf").getName();
                        log(fileName);
                        String filePath = uploadFolder + File.separator + fileName;
                        log(filePath);
                        File uploadedFile = new File(filePath);
                        item.write(uploadedFile);
                        fileCheck = true;
                    }
                    else{
                        log("Not PDF");
                        errorDispatch(request,response);
                    }
                    // saves the file to upload directory
                }
            }
            if(fileCheck && idCheck){
                Connection con = Connect.getConnection();
                PreparedStatement pst = con.prepareStatement("INSERT INTO tazker.ASSIGN_DOCS"
                        + " (Assignment_Id,Std_Id,File_Name) values (?,?,?)");
                pst.setInt(1, id);
                pst.setInt(2, Integer.parseInt(session.getAttribute("id").toString()));
                pst.setString(3, fileName);
                pst.executeUpdate();
            }
            
            getServletContext().getRequestDispatcher("/index.jsp").forward(
                    request, response);

        } catch (FileUploadException ex) {
            errorDispatch(request,response);
        } catch (Exception ex) {
            errorDispatch(request,response);
        } 
    }
    private void errorDispatch(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException
    {
        getServletContext().getRequestDispatcher("/submission.jsp").forward(
                    request, response);
    }
    private static String getFileExtension(String fileName) {
        
        if(fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0)
        return fileName.substring(fileName.lastIndexOf(".")+1);
        else return "";
    }
}