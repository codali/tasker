<%-- 
<%-- 
    Document   : Admission
    Created on : 22 Feb, 2017, 3:48:13 PM
    Author     : siniya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Tazker </title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
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
                                    <h3 class="box-title">DEPARTMENT</h3>
                                </div>
                                  
                                <form class="form-horizontal" id="Department" method="post" action="DepartmentServlet">
                                <div class="box-body">
                                <% 
                                    if(session.getAttribute("form").equals("used")){
                                      session.setAttribute("form", "");
                                 %>
                                <div class="alert alert-danger alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <h4><i class="icon fa fa-ban"></i> Alert!</h4>
                                    Department Code&Backslash;Name is already used
                                </div> 
                                 <%
                                     }
                                     if(session.getAttribute("form").equals("error"))
                                     { 
                                        session.setAttribute("form","");
                                 %>
                                <div class="alert alert-danger alert-dismissible ">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <h4><i class="icon fa fa-ban"></i> Alert!</h4>
                                    Invalid Department Code &Backslash; Name
                                </div> 
                                <% } %>
                                <% if(session.getAttribute("form").equals("success")){%>
                                <div class="alert alert-success alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                                    <h4><i class="icon fa fa-check"></i>Success</h4>
                                </div>
                                <% }
                                    session.setAttribute("form", "");
                                %>
                                    
                                    <div class="form-group">
                                        <label for="teacher_name" class="col-sm-2 control-label">Department Code</label>
                                        <div class="col-xs-4">
                                            <input type="text" class="form-control" id="deptcode" name="deptcode" placeholder="Required" >
                                        </div>
                                        
                                    </div>
                                    <div class="form-group">
                                        <label for="empolee_no" class="col-sm-2 control-label">Department Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="deptname" name="deptname">
                                        </div>
                                    </div>
                                    <!-- /.box-body -->
                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                                
                            </div>
                        </div>
                    </div>
                                <div class="col-md-9">
                                    <table class="table tab-primary">
                                        <tr>
                                            <th>slno</th>
                                            <th>Dep. Code</th>
                                            <th>Department Code</th>
                                            <th>Edit/Remove
                                            </th>
                                            
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </table>
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
    <script src="dist/js/app.min.js"></script>
    
</html>