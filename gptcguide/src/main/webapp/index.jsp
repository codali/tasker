<%-- 
    Document   : File
    Created on : 10 Jan, 2017, 5:41:03 PM
    Author     : musthafa
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="org.ipt.poly.JSPFetch" %>
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
        <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    </head>
    <body class="hold-transition skin-purple sidebar-mini">
        <div class="wrapper">
            <%@include file="cutpages/header.jsp" %>
            <%
                String side = session.getAttribute("role").toString();
                if(side.equals("TCR"))
                {
            %>
            <%@include file="cutpages/teacherside.jsp" %>
            <%
                }else if(side.equals("ADM"))
                   {
            %>
            <%@include file="cutpages/adminside.jsp" %>
            <%
                }else if(side.equals("HOD"))
                   {
            %>
            <%@include file="cutpages/hodside.jsp" %>
            <%
                }else if(side.equals("STD"))
                   {
            %>
            <%@include file="cutpages/studentside.jsp" %>
            <%}%>
            <div class="content-wrapper">
                <section class="content">
                    <div class="row">
                        <div class="col-md-9">
                        </div>
                    </div>
                </section> 
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper --> 
            <%@include file="cutpages/footer.jsp" %>
    </body
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
    <script src="plugins/input-mask/jquery.inputmask.js"></script>
    <script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>

    <!-- Slimscroll -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <!--<script src="plugins/fastclick/fastclick.js"></script>-->
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js"></script>
    <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>    <script>
        $(function () {
            $(".textarea").wysihtml5();
            
        });
    </script>
    <script>
        $(document).ready(function () {

            $(":input").inputmask();

        });
    </script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
    <script>

       $.validate({
           lang: 'en'
       });
    </script>
    
    

</html>