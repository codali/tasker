<%-- 
    Document   : Admission
    Created on : 22 Feb, 2017, 3:48:13 PM
    Author     : musthafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.ipt.poly.JSPFetch" %>
<%session.setAttribute("Class" ,"3");%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 2 | Simple Tables</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
    </head>
    <body>
            <body class="hold-transition skin-purple sidebar-mini">
        <div class="wrapper">
            <%@include file="cutpages/header.jsp" %>
            <%@include file="cutpages/teacherside.jsp" %>
            <div class="content-wrapper">
                <section class="content">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <%
                                            JSPFetch js = new JSPFetch();
                                            String classes[] = js.getClasses(); 
                                        %>
                                        <h3 class="box-title">Attendance Of Class</h3><select id="clas" onchange="clik()" name="class">
                                            <option></option>
                                            <%for(int i = 0;i<classes.length; i++){%>
                                            <%if(classes[i]==null)break;%><%=classes[i]%><%}%>
                                        </select>
                                </div>
                                <div class="box-body table-responsive no-padding">
                                    <form action="#" method="post">
                                    <table class="table table-hover">
                                        <%if(request.getParameter("clasid")==null){%>
                                        <h3>SELECT A CLASS</h3><%}else{
                String list[]=js.getStudentList(Integer.parseInt(request.getParameter("clasid")));%>
                                        <tr>
                                            <th>Roll No.</th>
                                            <th>Name</th>
                                            <th>Attndc</th>
                                        </tr>
                                        <%for(int i = 0;i<list.length; i++){%>
                                            <%if(list[i]==null)break;%>
                                        <tr>
                                            <td><%=i+1%></td>
                                            <%=list[i]%>
                                        </tr>
                                        <%}}%>
                                    </table>
                                    <div class="box-footer">
                                        <input type="submit" value="Submit">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                
            </div>
        
        <%@include file="cutpages/footer.jsp" %>
        </div>
        <!-- jQuery 2.2.3 -->
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.6 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>

    <!-- Slimscroll -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <!--<script src="plugins/fastclick/fastclick.js"></script>-->
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js"></script>
    <script>
        function clik(){
            var val = document.getElementById("clas").value;
            window.location.href = "Attendance.jsp?clasid="+val;
        }
    </script>
    
    </body>
</html>
