<%-- 
    Document   : Admission
    Created on : 22 Feb, 2017, 3:48:13 PM
    Author     : musthafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <%@include file="cutpages/sidebar.jsp" %>
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content">
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-7">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Student Registration</h3>
                                </div>
                                <form class="form-horizontal" id="regForm" method="post" action="StdAdmission">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="admissionNum" class="col-sm-2 control-label">Admission Number</label>
                                        <div class="col-xs-4">
                                            <input type="text" class="form-control" id="admissionNum" name="admnNo" placeholder="Required" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="stdName" class="col-sm-2 control-label">Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="stdName" name="stdName">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="stdGender" class="col-sm-2 control-label">Gender</label>
                                        <div class="right">
                                            <label><input type="radio" name="gender" value="male">Male</label>
                                            <label><input type="radio" name="gender" value="Female">Female</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="dob" class="col-sm-2 control-label">D.O.B</label>
                                        <div class="col-xs-3">
                                            <input class="form-control" name="DOB" id="dob" name="lastDate" placeholder="DD/MM/YYYY" data-inputmask="'alias': 'date'" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="stdCourse" class="col-sm-2 control-label">Course</label>
                                        <div class="col-sm-10">
                                            <select name="course">
                                                <option>Computer Eng.</option>
                                                <option>Electronics Eng</option>
                                                <option>Printing Technology</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="stdCategory" class="col-sm-2 control-label">Category</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="category" class="form-control" id="stdCategory" placeholder="Required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="stdNationality" class="col-sm-2 control-label">Nationality</label>
                                        <div class="col-sm-10">
                                            <select name="nation">
                                                <option>Indian</option>
                                                <option>Other</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="stdGuardian" class="col-sm-2 control-label">Guardian Name</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="guardian" class="form-control" id="stdGuardian" placeholder="eg John D">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="stdGuardOcp" class="col-sm-2 control-label">Guardian Occupation</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="guardOccup" class="form-control" id="stdGuardOcp" placeholder="eg Teacher">
                                        </div>
                                        
                                    </div>
                                    <div class="form-group">
                                        <label for="stdGuardInc" class="col-sm-2 control-label">Annual Income</label>
                                        <div class="col-xs-4">
                                            <input type="text"name="income" class="form-control" id="stdGuardInc" placeholder="Required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2">Certificates</label>
                                            <div class="checkbox">
                                                <label><input type="checkbox">Income</label>
                                                <label><input type="checkbox">Cast</label>
                                                <label><input type="checkbox">Community</label>
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
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="dist/js/app.min.js"></script>
    <script>
        $(document).ready(function () {

            $(":input").inputmask();

        });
    </script>
    <script src="dist/js/jquery.validate.js"></script>
    <script>
        $().ready(function() {
            $("#regForm").validate({
                rules: {
                    admissionNum :{
                        required :true,
                        minlength :6,
                        maxlength :6
                    }
                },
                messages:{
                    admissionNum :{
                        required:"Enter Admission Number",
                        minlength:"Must Be 6 Digit",
                        maxlenth:"Must Be 6 Digit"
                    }
                }
             });
         });
        
    </script>
    

</html>