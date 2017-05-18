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
            <%@include file="cutpages/sidebar.jsp" %>
            <div class="content-wrapper">
                <section class="content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h1 class="box-title">Subject Allotment For Teacher</h1>
                                </div>
                                <form method="post" action="SubjectAllot">
                                <div class="box-body">
                                    <table class="table tab-primary">
                                        <tr>
                                            <th>Subject Name</th>
                                            <th>Teacher Name</th>
                                        </tr>
                                <% int depId=1;
                                    JSPFetch js=new JSPFetch();
                                    String[] teacher = JSPFetch.getTeacherName();
                                    String[] sub = js.getNotAllotSubjectArray(depId);
                                    for(int i = 0 ; i < sub.length ; i++)
                                        { %>
                                        <%if(sub[i]==null)break;%>
                                        <tr>
                                            <td><%=sub[i]%></td>
                                            <td>
                                                <select name="<%=sub[i]%>">
                                                <%for(int j = 0 ; j < sub.length ; j++)
                                                {
                                                   if(teacher[j]==null)break;%>
                                                    <option value="<%=teacher[j]%>"><%=teacher[j]%></option>
                                                <% } %>
                                                </select>
                                            </td>
                                        <%}%>
                                     </tr>
                                    </table>
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
        </div>
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="plugins/fastclick/fastclick.js"></script>
    <script src="dist/js/app.min.js"></script>
    </body>
</html>
