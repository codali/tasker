<%-- 
    Document   : AssignmentMarking
    Created on : 19 Apr, 2017, 9:57:01 PM
    Author     : musthafa
--%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.gec.fetch.JSPFetch"%>
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
        
    </head>
    <body class="hold-transition skin-blue sidebar-mini" onload="setInvisible()>
        <div class="wrapper">
            <%@include file="cutpages/header.jsp" %>
            <%@include file="cutpages/teacherside.jsp" %>
            <div class="content-wrapper">
                <div class="content-header">
                    <h1>Assignment<small>Submit Only in PDF format</small></h1>
                </div>
                <section class="content">
                    <div class="row">
                        <%
                                            JSPFetch js = new JSPFetch();
                                            String[][] table = js.getSubmittedAssignment(Integer.parseInt(session.getAttribute("assignm").toString()));
                                        %>
                        <div class="col-xs-12">
                            <div class="box">
                                
                                <div class="box-header">
                                    <h3 class="box-title">Assignments to be Submitted</h3>
                                </div>
                                <div class="box-body table-responsive no-padding">
                                    <form action="AssignmentMark" method="post" id="assgform">
                                        
                                    <table class="table table-hover">
                                        <tr>
                                            <th>SL<%Integer.parseInt(session.getAttribute("assignm").toString());%> No</th>
                                            <th>Studnt Name</th>
                                            <th>View</th>
                                            <th>Mark</th>
                                            <th>Submission</p></th>
                                        </tr>
                                        <%for(int i = 0; i < table.length; i++){if(table[i][0] == null) break;%>
                                        <tr>
                                            <td><%=i+1%></td>
                                            <td><%=table[i][0]%></td>
                                            <td><a class="btn btn-block btn-primary" href="data/<%=table[i][1]%>" target="_blank">View</a></td>
                                            <td><input type="text" class="col-xs-2" id="<%=table[i][0]%>"></td>
                                            <td><button onclick="nmset('<%=table[i][0]%>')" name="fname" value="<%=table[i][1]%>" class="btn btn-block btn-primary btn-xs" type="submit">Submit Mark</button></td>
                                        </tr>
                                        <%}%>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-7">
                            <div class="box">
                                <%String[][] valuated = js.getValuatedAssignment(Integer.parseInt(session.getAttribute("assignm").toString()));%>
                                <div class="box-header">
                                    <h3 class="box-title">Valued Assignments</h3>
                                </div>
                                <div class="box-body table-responsive no-padding">
                                    <form action="AssignmentMark" method="post" id="assgform">
                                        
                                    <table class="table table-hover">
                                        <tr>
                                            <th>SL No</th>
                                            <th>Studnt Name</th>
                                            <th>View</th>
                                            <th>Mark</th>
                                            <th>Edit</th>
                                        </tr>
                                        <%for(int i = 0; i < valuated.length; i++){if(valuated[i][0] == null) break;%>
                                        <tr>
                                            <td><%=i+1%></td>
                                            <td><%=valuated[i][0]%></td>
                                            <td><a class="btn btn-block btn-primary" href="data/<%=valuated[i][1]%>" target="_blank">View</a></td>
                                            <td><input type="text" class="col-xs-4 " id="<%=valuated[i][0]%>" disabled="false" value="<%=valuated[i][2]%>"></td>
                                            <td><button onclick="nmedit('<%=valuated[i][0]%>','<%=valuated[i][1].replace(".", "")%>')"  id ="<%=valuated[i][1].replace(".", "")%>" value="<%=valuated[i][1]%>" class="btn btn-block btn-primary btn-sm" type="button"><span class="glyphicon glyphicon-pencil"></span></button>
                                                <button onclick="nmset('<%=valuated[i][0]%>')" name="fname" id ="bt<%=valuated[i][1].replace(".", "")%>" value="<%=valuated[i][1]%>" class="btn btn-block btn-primary btn-sm" type="submit"><span class="glyphicon glyphicon-floppy-save"></span></button>
                                            </td>
                                        </tr>
                                        <%}%>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </section>
            </div>
            <%@include file="footer.html" %>
        </div> 
    </body>
    <script>
        function nmset(val)
        {
            document.getElementById(val).name = "mark";
        }
        function nmedit(val,btid)
        {
             document.getElementById(val).removeAttribute("disabled"); 
             document.getElementById(btid).disabled = true;
             document.getElementById("bt"+btid).disabled = false;
             
        }
        window.onload = function() {
            <%for(int i = 0; i < valuated.length; i++){if(valuated[i][0] == null) break;%>
            document.getElementById("bt"+"<%=valuated[i][1].replace(".", "")%>").disabled = true;
            <%}%>
        };
    </script>
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="plugins/fastclick/fastclick.js"></script>
<script src="dist/js/app.min.js"></script>
<script src="dist/js/demo.js"></script>

</html>