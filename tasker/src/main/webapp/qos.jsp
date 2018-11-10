<%-- 
    Document   : File
    Created on : 10 Jan, 2017, 5:41:03 PM
    Author     : musthafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="org.gec.fetch.JSPFetch" %>
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
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Assignment Topic Submission</h3>
                                </div>
                                <form action="TopicSubmit" method="post">
                                    <div class="box-body">
                                        <%
                                       if(session.getAttribute("form").equals("error"))
                                     { 
                                        session.setAttribute("form","null");
                                 %>
                                <div class="alert alert-danger alert-dismissible ">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <h4><i class="icon fa fa-ban"></i> Alert!</h4>
                                     Server Error Occured. Please validate the form Input(s) Before Submit
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
                                            <label>Subject</label>
                                            <select class="form-control" name="subject">
                                                <%
                                                    JSPFetch js = new JSPFetch();
                                                    String[][] subject = js.getTeacherSubject(Integer.parseInt(session.getAttribute("id").toString()));
                                                    for(int i = 0 ; i < subject.length ; i++)
                                                    {
                                                        if(subject[i][0]==null)break;
                                                %>
                                                <option value="<%=subject[i][0]%>"><%=subject[i][1]%></option>
                                                <%  }%>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Topic</label>
                                            <input type="text" class="form-control" placeholder="Enter Topic" name="topic" data-validation="length" data-validation-length="2-100">
                                        </div>
                                        <div class="form-group">
                                            <label>Last Date</label>
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input class="form-control" name="lastDate" placeholder="dd/mm/yyyy" data-inputmask="'alias': 'date'"
                                                       data-validation="date" data-validation-format="dd/mm/yyyy">
                                            </div>
                                        </div>
                                            
                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="latesubmit">
                                                    Allow Late Submission
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="box-body pad">
                                                <textarea class="textarea" placeholder="Place some text here" name="details" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                                </textarea>
                                            </div>
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