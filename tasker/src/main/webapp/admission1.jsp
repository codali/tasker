<%-- 
    Document   : Admission
    Created on : 22 Feb, 2017, 3:48:13 PM
    Author     : musthafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.gec.fetch.JSPFetch" %>
<!DOCTYPE html>
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
                        <!-- left column -->
                        <div class="col-md-7">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Student Registration</h3>
                                </div>
                                <form class="form-horizontal" method="post" action="Admission"> 
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="userNum" class="col-sm-2 control-label">User Name</label>
                                        <div class="col-xs-4">
                                            <input type="text" class="form-control" id="admissionNum" name="username" placeholder="Required" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="stdName" class="col-sm-2 control-label">Student Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" data-validation="alphanumeric" data-validation-allowing="-_" class="form-control" name="name" id="stdName" placeholder="Required" minlength="2" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="dob" class="col-sm-2 control-label">D.O.B</label>
                                        <div class="col-xs-3">
                                            <input class="form-control" id="dob" name="dob" data-validation="dob" data-validation-format="dd-mm-yyyy" placeholder="DD/MM/YYYY" data-inputmask="'alias': 'date'" />
                                  
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label for="stdmail" class="col-sm-2 control-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="email" data-validation="email" class="form-control" id="stdMail" minlength="2" required>
                                        </div>
                                    </div> 
                                    <div class="form-group">
                                        <label for="phonenumber" class="col-sm-2 control-label">Phone Number</label>
                                        <div class="col-xs-4">
                                            <input type="text"  data-validation="number" data-validation-length="10"
		                         data-validation-optional-if-answered="home-phone, work-phone"
                                         data-validation-error-msg="phone number is incorrect (10 chars)" name="phone" class="form-control" id="phone " placeholder="Required" maxlength="10">
                                        </div>
                                    </div>
                                
                                    <div class="form-group">
                                        <label for="stdDepartmentid" class="col-sm-2 control-label">Department</label>
                                        <div class="col-sm-10">
                                            <select name="dept">
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
                                        <label for="stdGuardian" class="col-sm-2 control-label">Guardian's Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="gaurdian" data-validation="letternumeric" class="form-control" id="stdGuardian" placeholder="eg John D" minlength="2">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="dob" class="col-sm-2 control-label">Admission Date</label>
                                        <div class="col-xs-3">
                                            <input class="form-control" id="adDate" name="adDate" placeholder="DD/MM/YYYY" data-inputmask="'alias': 'date'" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="col-sm-2 control-label">Password</label>
                                        <div class="col-sm-10">
                                            <input type="password" name="password"  class="form-control" id="stdGuardian" placeholder="Required" minlength="4">
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="submit" name="submit" class="btn btn-primary">SUBMIT</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section> 
            </div>
            <%@include file="cutpages/footer.jsp" %>
        </body>
        
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>
    <script src="dist/js/jquery.validate.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="plugins/input-mask/jquery.inputmask.js"></script>
    <script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="dist/js/app.min.js"></script>
    <script>
        $(document).ready(function () {

            $(":input").inputmask();

        });
    </script>
    <!--<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>-->
    <script>

//  $.validate({
//    modules : 'location, date, security, file',
//    onModulesLoaded : function() {
//      $('#country').suggestCountry();
//    }
//  });
//
//  $('#presentation').restrictLength( $('#pres-max-length') );

</script>

</html>