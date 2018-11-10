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
            <%@include file="cutpages/hodside.jsp" %>
            <div class="content-wrapper">
              <section class="content" >
                  <div class="row">
                      <div class="col-xs-12">
                          <div class="box box-primary">
                              <div class="box-header with-border">
                                  <h3 class="box-title">Subject Allocation</h3>
                              </div>
                              <form method="post" action="SubjectAdd">
                              <div class="box-body">
                                  <%
                                    if(!session.getAttribute("form").equals("")){
                                      
                                 %>
                                <div class="alert alert-success alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <h4><i class="icon fa fa-ban"></i> From Details</h4>
                                    <%=session.getAttribute("form")%>
                                </div>
                                    <%session.setAttribute("form", "null");}%>
                                  <table class="table tab-primary">
                                      <tr>
                                          <th>sl</th>
                                          <th>Code</th>
                                          <th>Name</th>
                                          <th>Total Periods</th>
                                          <th>Semester</th>
                                          <th></th>
                                      </tr>
                                      <tr>
                                          <td>
                                              1
                                          </td>
                                          <td>
                                              <input type="text" name="code[1]" class="form-control col-xs-3"   minlength="2" maxlength="15">
                                          </td>
                                          <td>
                                              <input type="text" name="name[1]" class="form-control">
                                          </td>
                                          <td>
                                              <input type="text" name="periods[1]" class="form-control col-xs-2">
                                          </td>
                                          <td>
                                              <select name="semester[1]">
                                                  <option>1</option>
                                                  <option>2</option>
                                                  <option>3</option>
                                                  <option>4</option>
                                                  <option>5</option>
                                                  <option>6</option>
                                                  <option>7</option>
                                                  <option>8</option>
                                              </select>
                                              
                                          </td>
                                          <td></td>
                                      </tr>
                                  </table>
                                  
                              </div>
                                 <div class="box-footer clearfix">
                                     <button class="btn btn-sm btn-info btn-flat pull-left" id="add">Add Subject</button>
                                     <button type="submit" class="btn btn-sm btn-primary btn-flat pull-right">Submit</button>
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
    <script src="dist/js/app.min.js"></script>
    <script>
$(document).ready(function() {
    var max_fields      = 100;
    var wrapper         = $(".table"); 
    var add_button      = $("#add"); 
    
    var x = 1; 
    $(add_button).click(function(e){ 
        e.preventDefault();
        if(x < max_fields){ 
            x++; 
            $(wrapper).append('<tr><td>'+x+'</td><td><input type="text" name="code['+x+']" class="form-control col-xs-3" minlength="2" maxlength="15"></td><td><input type="text"name="name['+x+']" class="form-control"></td><td><input type="text" name="week['+x+']" class="form-control col-xs-2"></td><td><select name="semester['+x+']"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option></select></td><td><button type="button" id="delete" class="btn btn-danger">x</button></td></tr>');
        }
		else
		{
		alert('You Reached the limits')
		}
    });
    
    $(wrapper).on("click","#delete", function(e){ 
        e.preventDefault(); $(this).closest('tr').remove(); x--;
    })
});
</script>
    
    </body>
</html>