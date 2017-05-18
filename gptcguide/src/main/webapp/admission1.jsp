<%-- 
    Document   : Admission
    Created on : 22 Feb, 2017, 3:48:13 PM
    Author     : musthafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.ipt.poly.JSPFetch" %>
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
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
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
                                        <label for="admissionNum" class="col-sm-2 control-label">Admission Number</label>
                                        <div class="col-xs-4">
                                            <input type="text" data-validation="number" 
		                        data-validation-optional-if-answered="home-phone, work-phone" 
		                        data-validation-length="4-6" 
                                        data-validation-error-msg="admission number is incorrect" name="admission"  class="form-control" id="admissionNum" placeholder="Required" minlength="4" maxlength="6">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="stdName" class="col-sm-2 control-label">Student Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" data-validation="alphanumeric" data-validation-allowing="-_" class="form-control" name="name" id="stdName" placeholder="Required" minlength="2" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="stdName" class="col-sm-2 control-label">Address</label>
                                        <div class="col-sm-10">
                                            <input type="textarea" class="form-control" name="address" id="stdName" placeholder="Required" minlength="2" required>
                                        </div>
                                    </div> 
                                    <div class="form-group">
                                        <label for="stdName" class="col-sm-2 control-label">PIN Code</label>
                                        <div class="col-xs-4">
                                            <input type="text" data-validation="number" 
		                        data-validation-optional-if-answered="home-phone, work-phone" 
		                        data-validation-length="6" 
                                        data-validation-error-msg="pin code is incorrect" class="form-control" name="pin" id="stdName" placeholder="Required"minlength="4" maxlength="6">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="stdGender" class="col-sm-2 control-label">Gender</label>
                                        <div class="right">
                                            <label><input type="radio" name="gender" checked="checked" value="male">Male</label>
                                            <label><input type="radio" name="gender" value="female">Female</label>
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
                                        <label for="stdNationality" class="col-sm-2 control-label">Nationality</label>
                                        <div class="col-sm-10">
                                            <select name="nation">
                                                <option value="indian">Indian</option>
                                                <option value="other">Other</option>
                                            </select>
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label for="stdGuardian" class="col-sm-2 control-label">Religion</label>
                                         <div class="col-sm-10">
                                             <select name="religion">
                                                <option>Hindu</option>
                                                <option>Muslim</option>
                                                 <option>Christian</option>
                                                  <option>Others</option>
                                            </select>
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label for="stdGuardian" class="col-sm-2 control-label">Caste</label>
                                         <div class="col-sm-10">
                                            <select name="caste">
                                                <option>General</option>
                                                <option>OBC</option>
                                                <option>OEC</option>
                                                <option>SC</option>
                                                <option>ST</option>
                                                <option>Others</option>
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
                                        <label for="stdGuardian" class="col-sm-2 control-label">Relation</label>
                                         <div class="col-sm-10">
                                             <select name="relation">
                                                <option>Father</option>
                                                <option>Mother</option>
                                                 <option>Others</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="stdGuardOcp" class="col-sm-2 control-label">Guardian's Occupation</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="occupation" class="form-control" id="stdGuardOcp" placeholder="eg Teacher">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="stdGuardInc" class="col-sm-2 control-label">Annual Income</label>
                                        <div class="col-xs-4">
                                            <input type="text" name="income" data-validation="number" data-validation-length="100-50000000" class="form-control" id="stdGuardInc" placeholder="Required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="dob" class="col-sm-2 control-label">Admission Date</label>
                                        <div class="col-xs-3">
                                            <input class="form-control" id="adDate" name="adDate" placeholder="DD/MM/YYYY" data-inputmask="'alias': 'date'" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2">Certificates</label>
                                            <div class="col-sm-10">
                                                <div class="checkbox">
                                                    <label><input type="checkbox" name="tenth">SSLC/THSLC/CBSE 10th</label></br>
                                                    <label><input type="checkbox" name="vhse">VHSE</label></br>
                                                    <label><input type="checkbox" name="iti">ITI</label></br>
                                                    <label><input type="checkbox" name="community">Community</label></br>
                                                    <label><input type="checkbox" name="income">Income</label></br>
                                                    <label><input type="checkbox" name="castecert">Cast</label></br>
                                                    <label><input type="checkbox" name="nativity">Nativity</label></br>
                                                    <label><input type="checkbox" name="tc">TC</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="submit" name="submit" class="btn btn-primary">Next</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section> 
            </div>
            <%@include file="cutpages/footer.jsp" %>
    </body
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