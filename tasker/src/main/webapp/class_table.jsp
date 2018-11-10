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
        <link rel="stylesheet" href="plugins/select2/select2.min.css">
        
    </head>
    <body class="hold-transition skin-purple sidebar-mini">
        <div class="wrapper">
            <%@include file="cutpages/header.jsp" %>
            <%@include file="cutpages/adminside.jsp" %>
            <div class="content-wrapper">
                <section class="content">
                    <div class="row">
                        <div class="col-md-7">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">CLASS Tutor Allocation</h3>
                                </div>
                               
                                <form class="form-horizontal" id="regForm" method="post" action="ClassAllocation">
                                <div class="box-body">
                                    <%
                                    if(session.getAttribute("form").equals("used")){
                                      session.setAttribute("form", "");
                                 %>
                                <div class="alert alert-danger alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <h4><i class="icon fa fa-ban"></i> Alert!</h4>
                                    Database error Octry {
//            //con.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(DataFetch.class.getName()).log(Level.SEVERE, null, ex);
//        }cured.
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
                                    Validation Error. Please Ensure all the data is correct.
                                </div> 
                                <% } %>
                                <% if(session.getAttribute("form").equals("success")){%>
                                <div class="alert alert-success alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                                    <h4><i class="icon fa fa-check"></i>Success</h4>
                                        Form Successfully Submitted.
                                </div>
                                <% }
                                    session.setAttribute("form", "");
                                %>
                                    <div class="form-group">
                                        <label for="teacher_name" class="col-sm-2 control-label">Department code</label>
                                        <div class="col-xs-4">
                                            <select name="dept" class="form-control select2" style="width: 100%">
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
                                        <label for="empolee_no" class="col-sm-2 control-label">Teacher's Name</label>
                                        <div class="col-sm-10">
                                           <select name="tchr" class="form-control select2" style="width: 100%;">
                                                <% String[] tchr= js.getTeacherName();
                                                   for(int i = 0 ; i < dep.length ; i++)
                                                   { %>
                                                   <%if(tchr[i]==null)break;%>
                                                   <option value="<%=tchr[i]%>"><%=tchr[i]%></option>
                                                   <% } %>
                                            </select> 
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label for="empolee_no" class="col-sm-2 control-label">Semester</label>
                                        <div class="col-sm-10">
                                            <select name="semester">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="6">7</option>
                                                <option value="6">8</option>
                                            </select>
                                        </div>
                                     </div>
                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-primary">Submit</button>
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
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="dist/js/app.min.js"></script>
    <script src="plugins/select2/select2.full.min.js"></script>
    <script>
        $(function () {
            $(".select2").select2();
        });
    </script>
</html>