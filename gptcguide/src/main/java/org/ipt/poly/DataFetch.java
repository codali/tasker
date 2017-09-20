/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ipt.poly;

import static java.rmi.server.LogStream.log;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import org.iptgptc.db.ConnectionPools;

/**
 *
 * @author musthafa
 */
public class DataFetch {
    private Connection con = null;
    /**
     * 
     * @param date Date To Convert
     * @param initDateFormat From Date Format
     * @param endDateFormat To Date Format
     * @return Date in the New Format
     * @throws ParseException 
     */
    
    public static String formatDate (String date, String initDateFormat, String endDateFormat) throws ParseException {

        Date initDate = new SimpleDateFormat(initDateFormat).parse(date);
        SimpleDateFormat formatter = new SimpleDateFormat(endDateFormat);
        String parsedDate = formatter.format(initDate);

        return parsedDate;
    }
    
    /**
     * 
     * @param DepCode Department Code
     * @return Department Id of Given Department Code
     * @throws NullPointerException
     * 
     * 
     */
    public int getDepId(String DepCode)
    {
        try {
            getCon();
            PreparedStatement psmnt = con.prepareStatement("SELECT Dep_Id from DB_GPTC.DepartmentTbl where Dep_Code = ?");
            psmnt.setString(1, DepCode);
            ResultSet rs = psmnt.executeQuery();
            if(rs.next())
            {
                killCon();
                return  rs.getInt("Dep_Id");
            }
            else{
                killCon();
                return 0;
            }
        } catch (SQLException | NullPointerException ex) {
            Logger.getLogger(DataFetch.class.getName()).log(Level.SEVERE, null, ex);
            killCon();
            return 0;
        }
    }
    public int getTeacherId(String Teachr) throws SQLException{
        getCon();
        int id = 0;
        try(PreparedStatement pst = con.prepareStatement("SELECT Teacher_Id FROM DB_GPTC.TeachersTbl WHERE Tchr_Name =?")){
            pst.setString(1, Teachr);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            {
                id = rs.getInt(1);
            }
            rs.close();
            pst.close();
        }
        finally{
            killCon();
        }
        return id;
    }
    
    public int getSubjectId(String subject) throws SQLException{
        getCon();
        int id = 0;
        try(PreparedStatement pst = con.prepareStatement("SELECT Subject_Id from DB_GPTC.SubjectTbl WHERE Subject_Name = ?")){
            pst.setString(1, subject);
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            {
                id = rs.getInt(1);
                
            }
            rs.close();
            pst.close();
        }
        finally{
            killCon();
        }
        return id;
    }
    public int getAllotSubjectId(String subject) throws SQLException{
        getCon();
        int id = 0;
        try(PreparedStatement pst = con.prepareStatement("SELECT Subject_Id FROM"
                + " DB_GPTC.SubjectAllotTbl WHERE Subject_Id IN"
                + " (SELECT Subject_Id FROM DB_GPTC.SubjectTbl WHERE Subject_Name = ?)")){
            pst.setString(1, subject);
            try (ResultSet rs = pst.executeQuery()) {
                if(rs.next())
                {
                    id = rs.getInt(1);
                    
                }
            }
            pst.close();
        }
        finally{
            killCon();
        }
        return id;
    }
            
    
    public int getClassIdBy(int subject_Id,int semester) throws SQLException{
        getCon();
        int id = 0;
        try(PreparedStatement pst =con.prepareStatement("SELECT Class_Id FROM DB_GPTC.ClassTbl WHERE "
                + "Semester = ? AND Dep_Id IN(SELECT Dep_Id FROM DB_GPTC.SubjectTbl WHERE Subject_Id = ?)")){
            pst.setInt(1, semester);
            pst.setInt(2, subject_Id);
            try (ResultSet rs = pst.executeQuery()) {
                if(rs.next())
                {
                    id = rs.getInt(1);
                    
                }
            }
            pst.close();
        }
        finally{
            killCon();
        }
        return id;
    }
    public int getClassIdBy(String dept,int semester) throws SQLException{
        getCon();
        int id = 0;
        try(PreparedStatement pst =con.prepareStatement("SELECT Class_Id FROM DB_GPTC.ClassTbl WHERE "
                + "Semester = ? AND Dep_Id = ?")){
            pst.setInt(1, semester);
            pst.setInt(2, getDepId(dept));
            try (ResultSet rs = pst.executeQuery()) {
                if(rs.next())
                {
                    id = rs.getInt(1);
                    
                }
            }
            pst.close();
        }
        finally{
            killCon();
        }
        return id;
    }
    public int getClassIdBy(int tutorId) throws SQLException{
        getCon();
        int id = 0;
        try(PreparedStatement pst =con.prepareStatement("SELECT Class_Id FROM DB_GPTC.ClassTbl WHERE Tutor_Id =?")){
            pst.setInt(1, tutorId);
            try (ResultSet rs = pst.executeQuery()) {
                if(rs.next())
                {
                    id = rs.getInt(1);
                }
            }
            pst.close();
        }
        finally{
            killCon();
        }
        return id;
    }
    public int getClassOfStd(int std_Id) throws SQLException{
        getCon();
        int id = 0;
        try(PreparedStatement pst =con.prepareStatement("SELECT Class_ID FROM DB_GPTC.StudentTbl WHERE Std_Id = ?")){
            pst.setInt(1, std_Id);
            try (ResultSet rs = pst.executeQuery()) {
                if(rs.next())
                {
                    id = rs.getInt(1);
                    
                }
            }
            pst.close();
        }
        finally{
            killCon();
        }
        return id;
    }
    
    
    private void getCon()
    {
        
        try {
            DataSource pool = ConnectionPools.getProcessing();
            con =  pool.getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(DataFetch.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
    }
    private void killCon()
    {
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DataFetch.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
