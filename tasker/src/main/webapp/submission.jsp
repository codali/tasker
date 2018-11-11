<%-- 
    Document   : submission
    Created on : 2 Feb, 2017, 11:51:07 AM
    Author     : musthafa
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.gec.fetch.JSPFetch" %>
<!DOCTYPE html>
<%
    if(session.getAttribute("assignm").toString().isEmpty())
      response.sendRedirect("topics.jsp");
%>

<html>
    
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Tazker</title>
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
    <%@include file="cutpages/studentside.jsp" %>
    <div class="content-wrapper">
    <section class="content">
        <%
                        JSPFetch js = new JSPFetch();
                        boolean status = js.getAssignmentStatus(Integer.parseInt(session.getAttribute("assignm").toString()), Integer.parseInt(session.getAttribute("id").toString()));
                        String[] assignment = js.getAssignment(Integer.parseInt(session.getAttribute("assignm").toString()));
                    %>
        <%if(status == true){%>
        <div class="callout callout-info">
        <h4>Reminder!</h4>
        You have already submitted assignment
      </div><%}%>
        <div class="box box-widget">
            <div class="box-header with-border">
                <form method="post" action="UploadServlet" enctype="multipart/form-data">
                <i class="fa fa-text-width"></i>
                    
                    <h3 class="box-title">Assignment Title - <%=assignment[1]%></h3>
            </div>
            <div class="box-body">
                <%=assignment[2]%>
            </div>
            <div class="box-footer">
                    <input type="file" name="dataFile" id="fileChooser"/><br/><br/>
                    <button type="submit" class="btn btn-primary" value="<%=assignment[0]%>" name="submit">Submit</button>
                    <p class="help-block">File Type Should be PDF with size < 10 MB</p>
                </form>
            </div>
        </div>
    </section>
    </div>
    <%@include file="cutpages/footer.jsp" %>
    </div>
    </body>
    <!-- jQuery 2.2.3 -->
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script> 
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
</html>
