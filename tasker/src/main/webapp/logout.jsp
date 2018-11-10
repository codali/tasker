<%-- 
    Document   : logout
    Created on : 9 Feb, 2017, 10:31:01 PM
    Author     : musthafa
--%>

<%  
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
