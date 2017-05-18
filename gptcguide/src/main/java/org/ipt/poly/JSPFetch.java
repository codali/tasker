/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ipt.poly;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.iptgptc.db.HikariPool;

/**
 *
 * @author musthafa
 */
public class JSPFetch {
    private static Connection con = null;
    /**
     * 
     * @return Object Of Department Code
     * @throws SQLException 
     */
    public String getName(int id,String type) throws SQLException{
        getCon();
        ResultSet rs;
        String qry="";
        String name="";
        if(type.equals("TCR"))
        {
            qry = "SELECT Tchr_Name FROM DB_GPTC.TeachersTbl WHERE Teacher_Id=?";
        }
        else if(type.equals("STD"))
            qry = "SELECT Std_Name FROM DB_GPTC.StudentTbl WHERE Std_Id=?";
        else if(type.equals("HOD"))
            name ="Sudheer";
        else
            name="Admin";
        
        if(type.equals("TCR") ||type.equals("STD")){
            PreparedStatement ps = con.prepareStatement(qry);
            ps.setInt(1, id);
            rs=ps.executeQuery();
            rs.next();
            return rs.getString(1);

        }
        return name;
        
    }
    public ResultSet getDep() throws SQLException
    {
        getCon();
        ResultSet rs;
        try (PreparedStatement pstmnt = con.prepareStatement("SELECT Dep_Code,Dep_Name FROM DB_GPTC.DepartmentTbl")) {
            rs = pstmnt.executeQuery();
        }
        finally{
            killCon();
        }
        return  rs;
    }
    public static String[] getTeacherName() throws SQLException{
        getCon();
        String[] array = new String[100];
        int i = 0;
        try (PreparedStatement ps = con.prepareStatement("SELECT Tchr_Name FROM DB_GPTC.TeachersTbl")){
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                array[i] = rs.getString(1);
                i++;
            }
            rs.close();
        }
        finally{
            killCon();
        }
        return array;
    }
    
    public String[][] getSubjectArrayForTT(int tutorId)throws SQLException
    {   
        getCon();
        String[][] array = new String[100][2];
        int i = 0;
        try (PreparedStatement ps = con.prepareStatement("SELECT S.Subject_Name,"
                + "S.Periods_Week  FROM DB_GPTC.SubjectTbl S INNER JOIN DB_GPTC.ClassTbl C"
                + " ON S.Dep_Id = C.Dep_Id AND S.Semester = C.Semester WHERE C.Tutor_Id = ?")){
            ps.setInt(1,tutorId);
            try (ResultSet rs = ps.executeQuery()) {
                while(rs.next())
                {
                    array[i][0] = rs.getString(1);
                    array[i][1] = rs.getString(2);
                    i++;
                }
            }
            ps.close();
        }
        finally{
            killCon();
        }
        return array;
    }
    public String[] getNotAllotSubjectArray(int depId)throws SQLException
    {   
        getCon();
        String[] array = new String[100];
        int i = 0;
        try (PreparedStatement ps = con.prepareStatement("SELECT Subject_Name FROM DB_GPTC.SubjectTbl WHERE Subject_Id NOT IN (SELECT Subject_Id FROM DB_GPTC.SubjectAllotTbl) AND Dep_Id = ?")){
            ps.setInt(1,depId);
            try (ResultSet rs = ps.executeQuery()) {
                while(rs.next())
                {
                    array[i] = rs.getString(1);
                    i++;
                }
            }
            ps.close();
        }
        finally{
            killCon();
        }
        return array;
    }
    public String[] getStudentList(int class_Id)throws SQLException
    {   
        getCon();
        String[] array = new String[100];
        int i = 0;
        try (PreparedStatement ps = con.prepareStatement("SELECT Std_Id,Std_Name FROM DB_GPTC.StudentTbl WHERE Class_ID = ? ORDER By Std_Name ASC")){
            ps.setInt(1,class_Id);
            try (ResultSet rs = ps.executeQuery()) {
                while(rs.next())
                {
                    array[i] ="<td>"+rs.getString(2)+"</td>\n" +
"                                            <td><input type=\"checkbox\" name=\""+rs.getString(1)+"\" checked=\"checked\"></td>";
                    i++;
                }
            }
            ps.close();
        }
        finally{
            killCon();
        }
        return array;
    }
    
    public String[] getClasses () throws SQLException
    {   
        getCon();
        String[] array = new String[25];
        int i = 0;
        try (PreparedStatement ps = con.prepareStatement("SELECT D.Dep_Code ,C.Semester,"
                + "C.Class_Id FROM DB_GPTC.DepartmentTbl D INNER JOIN"
                + " DB_GPTC.ClassTbl C ON D.Dep_Id = C.Dep_Id")){
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                array[i] = "<option value =\""+ rs.getString(3)+"\">"+rs.getString(1)+rs.getString(2)+"</option>";
                i++;
            }
        }
        finally{
            killCon();
        }
        return array;
    }
    public String getClassName (int tutorId)throws SQLException
    {   
        getCon();
        String className = null;
        try (PreparedStatement ps = con.prepareStatement("SELECT Dep_Code FROM "
                + "DB_GPTC.DepartmentTbl WHERE Dep_Id IN (SELECT Dep_Id FROM "
                + "DB_GPTC.ClassTbl WHERE Tutor_Id = ?) UNION ( SELECT Semester "
                + "FROM DB_GPTC.ClassTbl WHERE Tutor_Id = ?)")){
            ps.setInt(1, tutorId);
            ps.setInt(2, tutorId);
            try (ResultSet rs = ps.executeQuery()) {
                if(rs.next())
                {
                    className = rs.getString(1);
                    rs.next();
                    className = className+rs.getString(1);
                }
            }
            ps.close();
        }
        finally{
            killCon();
        }
        return className;
    }
    
    public String[][] getTeacherSubject (int teacherId)throws SQLException
    {   
        getCon();
        String[][] array = new String[100][3];
        int i = 0;
        try (PreparedStatement ps = con.prepareStatement("SELECT Subject_Id, Subject_Name,"
                + " Dep_Id,Semester FROM DB_GPTC.SubjectTbl WHERE Subject_Id IN"
                + "(SELECT Subject_Id FROM DB_GPTC.SubjectAllotTbl WHERE Teacher_Id= ?)")){
            ps.setInt(1, teacherId);
            try (ResultSet rs = ps.executeQuery()) {
                while(rs.next())
                {
                    array[i][0] = rs.getString(1)+"_"+rs.getInt(4);
                    array[i][1] = rs.getString(2)+"("+getDepCode(rs.getInt(3))+")";
                    i++;
                }
            }
            ps.close();
        }
        finally{
            killCon();
        }
        return array;
    }
    public String[][] getAssignments()throws SQLException
    {   
        getCon();
        String[][] array = new String[100][6];
        int i = 0;
        try (PreparedStatement ps = con.prepareStatement("SELECT A.Assignment_Id"
                + ", S.Subject_Name, A.Topic, A.Lst_Date FROM "
                + "DB_GPTC.AssignmentDetailsTbl A ,DB_GPTC.SubjectTbl S WHERE "
                + "A.Subject_Id = S.Subject_Id")){
            try (ResultSet rs = ps.executeQuery()) {
                while(rs.next())
                {
                    array[i][0] = rs.getString(1);
                    array[i][1] = rs.getString(2);
                    array[i][2] = rs.getString(3);
                    array[i][3] = rs.getString(4);
                    i++;
                }
                rs.close();
            }
            ps.close();
        }
        finally{
            killCon();
        }
        return array;
    }
    
    public String[][] getAssignmentStd(int stdid )throws SQLException
    {   
        getCon();
        DataFetch df =new DataFetch();
        String[][] array = new String[100][5];
        int i = 0;
        try (PreparedStatement ps = con.prepareStatement("SELECT A.Assignment_Id,"
                + " S.Subject_Name, A.Topic, A.Lst_Date FROM "
                + "DB_GPTC.AssignmentDetailsTbl A ,DB_GPTC.SubjectTbl S,"
                + "DB_GPTC.StudentTbl C WHERE A.Subject_Id = S.Subject_Id AND "
                + "A.Class_ID = ?")){
            ps.setInt(1, df.getClassOfStd(stdid));
            try (ResultSet rs = ps.executeQuery()) {
                while(rs.next())
                {
                    array[i][0] = rs.getString(1);
                    array[i][1] = rs.getString(2);
                    array[i][2] = rs.getString(3);
                    array[i][3] = rs.getString(4);
                    i++;
                }
                rs.close();
            }
            ps.close();
        }
        finally{
            killCon();
        }
        return array;
    }
    
    
    public String[] getAssignment(int assignment_Id)throws SQLException
    {   
        getCon();
        String[] array = new String[4];
        int i = 0;
        try (PreparedStatement ps = con.prepareStatement("SELECT Assignment_Id,"
                + "Topic, Body FROM DB_GPTC.AssignmentDetailsTbl"
                + " WHERE Assignment_Id = ?")){
            ps.setInt(1,assignment_Id);
            try (ResultSet rs = ps.executeQuery()) {
                if(rs.next())
                {
                    array[0] = rs.getString(1);
                    array[1] = rs.getString(2);
                    array[2] = rs.getString(3);
                }
                rs.close();
            }
            ps.close();
        }
        finally{
            killCon();
        }
        return array;
    }
    public String[][] getSubmittedAssignment(int assignmentId) throws SQLException
    {
        getCon();
        //List<List<String>> listOfLists = new ArrayList<List<String>>();
        String[][] array = new String[100][2];
        try{
            PreparedStatement ps = con.prepareStatement("SELECT S.Std_Name,"
                    + "A.File_Name FROM DB_GPTC.ASSIGN_DOCS A INNER JOIN "
                    + "DB_GPTC.StudentTbl S ON A.Std_Id = S.Std_Id WHERE"
                    + " A.Assignment_Id = ? AND A.Status = 0");
            ps.setInt(1, assignmentId);
            ResultSet rs = ps.executeQuery();
            
            int i = 0;
            while(rs.next()){
                array[i][0] = rs.getString(1);
                array[i][1] = rs.getString(2);
            }
        } catch (SQLException ex ) {
            Logger.getLogger(JSPFetch.class.getName()).log(Level.SEVERE, null, ex);
            
        } catch (ArrayIndexOutOfBoundsException ex){
            Logger.getLogger(JSPFetch.class.getName()).log(Level.WARNING, null, ex);

        }
        
         
        finally{
            killCon();
        }
        return array;
    }
 
       public String getDepCode(int dep_Id) throws SQLException{
        getCon();
        String result = null;
        try (PreparedStatement ps = con.prepareStatement("SELECT Dep_code "
                + "FROM DB_GPTC.DepartmentTbl WHERE Dep_Id = ?")) {
            ps.setInt(1, dep_Id);
            ResultSet rs  = ps.executeQuery();
            if(rs.next())
                result = rs.getString(1);
            rs.close();
        }
        finally{
            killCon();
        }
        return result;
    }
    public String[][] getDepName() throws SQLException{
        getCon();
        String[][] array = new String[20][2];
        int i = 0;
        try (PreparedStatement ps = con.prepareStatement("SELECT Dep_code,Dep_Name FROM DB_GPTC.DepartmentTbl")) {
            ResultSet rs  = ps.executeQuery();
            while(rs.next())
            {
                array[i][0] = rs.getString(1);
                array[i][1] = rs.getString(2);
                i++;
            }
            rs.close();
        }
        finally{
            killCon();
        }
        return array;
    }
   /* public String[] getTutorName(int depId) throws SQLException
    {
        getCon();
        ResultSet res;
        PreparedStatement pst = con.prepareStatement("SELECT TeacherName FROM DB_GPTC DepartmentTbl ")
    }*/
    public int getDepCount() throws SQLException
    {
        getCon();
        PreparedStatement pstmnt = con.prepareStatement("SELECT COUNT(Dep_ID) from DB_GPTC.DepartmentTbl");
        ResultSet rs = pstmnt.executeQuery();
        if(rs.next())
            return rs.getInt("COUNT(Dep_ID)");
        else 
            return 0;
    }
    
    private static void getCon()
    {
        
        try {
            HikariPool pool = HikariPool.getInstance();
            con =  pool.getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(DataFetch.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
        
    }
    public static void killCon() throws SQLException{
        if(con != null) {
            con.close();
        }
    }
}
