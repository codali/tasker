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
                    <h1>Attendence<small>Report</small></h1>
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
                                    <h3 class="box-title">Attendence Report of May 2017</h3>
                                </div>
                                <div class="box-body table-responsive no-padding">
                                    <table id="example2" class="table table-bordered table-hover" align="centre">
                                        <tr>
                                            <th>
                                                Name
                                            </th>
                                            <th>W Days</th>
                                            <th>P Days</th>
                                            <th>%</th>
                                        </tr>
                                        <tr>
                                            <td>
                                                Musthafa
                                            </td>
                                            <td>
                                                18
                                            </td>
                                            <td>
                                                9
                                            </td>
                                            <td>
                                                50
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Krishnendu
                                            </td>
                                            <td>
                                                18
                                            </td>
                                            <td>
                                                13.5
                                            </td>
                                            <td>
                                               75
                                            </td>
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
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="plugins/fastclick/fastclick.js"></script>
<script src="dist/js/app.min.js"></script>
<script src="dist/js/demo.js"></script>

</html>