<%-- 
<%-- 
    Document   : Admission
    Created on : 22 Feb, 2017, 3:48:13 PM
    Author     : musthafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.gec.fetch.JSPFetch,java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 2 | Simple Tables</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="plugins/select2/select2.min.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        
    </head>
    <body class="hold-transition skin-purple sidebar-mini">
        <div class="wrapper">
            <%@include file="cutpages/header.jsp" %>
            <%@include file="cutpages/adminside.jsp" %>
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content">
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-7">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Teacher Table</h3>
                                </div>
                               
                                <form class="form-horizontal" id="regForm" method="post" action="Teacher">
                                <div class="box-body">
                                    <%  
                                    if(session.getAttribute("form").equals("used")){
                                      session.setAttribute("form", "null");
                                 %>
                                <div class="alert alert-danger alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <h4><i class="icon fa fa-ban"></i> Alert!</h4>
                                    Duplication Found
                                </div> 
                                <%
                                     }
                                     if(session.getAttribute("form").equals("error"))
                                     { 
                                        session.setAttribute("form","null");
                                 %>
                                <div class="alert alert-danger alert-dismissible ">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <h4><i class="icon fa fa-ban"></i> Alert!</h4>
                                     Validation Error
                                </div>         
                                </div> 
                                <% } %>
                                <% if(session.getAttribute("form").equals("success")){%>
                                <div class="alert alert-success alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                                    <h4><i class="icon fa fa-check"></i>Success</h4>
                                </div>
                                <% }
                                    session.setAttribute("form", "null");
                                %>
                                    <div class="form-group">
                                        <label for="teacher_name" class="col-sm-2 control-label">Department</label>
                                        <div class="col-sm-10">
                                            <select class="form-control select2" style="width: 100%;" name="branch" >
                                                <% JSPFetch js = new JSPFetch();
                                                   String[][] dep= js.getDepName();
                                                   for(int i = 0 ; i < dep.length ; i++)
                                                   { %>
                                                   <%if(dep[i][0]==null)break;%>
                                                   <option value="<%=dep[i][0]%>"><%=dep[i][1]%></option>
                                                   <% } %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="empolee_no" class="col-sm-2 control-label">User Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="em_no" name="empno">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="teacher_name" class="col-sm-2 control-label">EmailId</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="teacherEmail" placeholder="Required" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="teacher_name" class="col-sm-2 control-label">Teacher name</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="teachername" name="teachername" placeholder="Required" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                            <div class="col-sm-10">
                                                <label>
                                                    <input type="checkbox" name="setHOD">
                                                    Set as Head of the Department
                                                </label>
                                            </div>
                                    </div>
                                     <div class="form-group">
                                        <label for="empolee_no" class="col-sm-2 control-label">phone:</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="phone" name="phone">
                                        </div>
                                     </div>
                                     <div class="form-group">
                                        <label for="empolee_no" class="col-sm-2 control-label">Password</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="phone" name="password">
                                        </div>
                                     </div>
                                     <div class="form-group">
                                        <label for="empolee_no" class="col-sm-2 control-label">Confirm Password</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="phone" name="confpassword">
                                        </div>
                                     </div>
                                            <div class="box-footer">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                                
                            </div>
                        </div>
                    </div>
                </section> 
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper --> 
            <%@include file="cutpages/footer.jsp" %>
        </body>
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
    
    <!-- InputMask -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="dist/js/app.min.js"></script>
    <script src="plugins/select2/select2.full.min.js"></script>
    
    <script src="dist/js/jquery.validate.js"></script>
    <script>
        $(function () {
            $(".select2").select2();
        });
    </script>
    

</html>