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
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <%@include file="cutpages/header.jsp" %>
            <%@include file="cutpages/teacherside.jsp" %>
            <div class="content-wrapper">
                <div class="content-header">
                    <h1>Assignment<small>Submit Only in PDF format</small></h1>
                </div>
                <section class="content">
                    <div class="row">
<!--                        <div class="box box-default">
                            <div class="box-header with-border">
                                <h3 class="box-title">Filter by</h3>
                            </div>
                            
                        </div>
-->
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Complete list of Assignment Marks</h3>
                                </div>
            <!-- /.box-header -->
                                <div class="box-body table-responsive no-padding">
                                    <table id="example2" class="table table-bordered table-hover" align="centre">
                                        <thead>
                                            <tr>
                                                <th colspan="6">NAME OF THE SUBJECT</th>
                                            </tr>
                                            <tr>
                                                <th rowspan="2">Roll No</th>
                                                <th rowspan="2">Name</th>
                                                <th colspan="4">Assignment Marks</th>
                                            </tr>
                                            <tr>
                                                <td>1</td><td>2</td><td>3</td><td>4</td>
                                            </tr>
                                        </thead>
                                            <tr>
                                                <td>20</td>
                                                <td>ANONY</td>
                                                <td>15</td><td>14</td><td>12</td><td>10</td>
                                            </tr>
                                        
                                    </table>
                                </div>
                                <div class="box-footer">
                                    <button type="button"class="btn bg-purple-gradient btn-flat" onclick="window.print()"><i class="fa-print"></i>Print Report</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <%@include file="footer.html" %>
        </div> 
        
    </body>
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- Slimscroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

</html>