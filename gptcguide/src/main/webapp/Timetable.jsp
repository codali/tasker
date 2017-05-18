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
           <%@include file="cutpages/teacherside.jsp" %>
            <div class="content-wrapper">
              <section class="content">
                  <div class="row">
                      <div class="col-md-12">
                          <div class="box box-primary">
                              <div class="box box-header">
                                  <div class="box-header">
                                      <%
                                          JSPFetch js = new JSPFetch();
                                      %>
                                      <h3 class="box-title">Time Table of Class <%=js.getClassName(Integer.parseInt(session.getAttribute("id").toString()))%></h3>
                                  </div>
                                  <div class="box-body">
                                      <form action="TimeTableServlet" method="post">
                                      <table class="table table-bordered">
                                          <%
                                              
                                              String option[][]= js.getSubjectArrayForTT(Integer.parseInt(session.getAttribute("id").toString()));
                                              if(option[1][0]==null){
                                          %>
                                          <h1>NO SUBJECTS FOUND</h1>
                                          <%}else{%>
                                          
                                          <tr>
                                              <th>DAY\HOUR</th>
                                              <th>HOUR 1</th>
                                              <th>HOUR 2</th>
                                              <th>HOUR 3</th>
                                              <th>HOUR 4</th>
                                              <th>HOUR 5</th>
                                              <th>HOUR 6</th>
                                              <th>HOUR 7</th>
                                          </tr>
                                          <tr>
                                              <th>DAY 1</th>
                                              <td>
                                                  <select name="sub11" id="1_1" onchange="clik('1_1')">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub12" onchange="clik('1_2')" id="1_2">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td><td>
                                                  <select name="sub13" onchange="clik('1_3')" id="1_3">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td><td>
                                                  <select name="sub14" onchange="clik('1_4')" id="1_4">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    
                                                    <<option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td><td>
                                                  <select name="sub15" onchange="clik('1_5')" id="1_5">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub16" onchange="clik('1_6')" id="1_6">
                                                      <option>----<option>
                                                     <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub17" onchange="clik('1_7')" id="1_7">
                                                      <option>------</option>
                                                   <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                          </tr>
                                          <tr>
                                              <th>DAY 2</th>
                                              <td>
                                                  <select name="sub21" onchange="clik('2_1')" id="2_1">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub22" onchange="clik('2_2')" id="2_2">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub23" onchange="clik('2_3')" id="2_3">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub24" onchange="clik('2_4')" id="2_4">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub25" onchange="clik('2_5')" id="2_5">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub26" onchange="clik('2_6')" id="2_6">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub27" onchange="clik('2_7')" id="2_7">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                          </tr>
                                          <tr>
                                              <th>DAY 3</th>
                                              <td>
                                                  <select name="sub31" onchange="clik('3_1')" id="3_1">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub32" onchange="clik('3_2')" id="3_2">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td><td>
                                                  <select name="sub33" onchange="clik('3_3')" id="3_3">
                                                      <option>------</option>
                                                     <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td><td>
                                                  <select name="sub34" onchange="clik('3_4')" id="3_4">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td><td>
                                                  <select name="sub35" onchange="clik('3_5')" id="3_5">
                                                      <option>------</option>
                                                     <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub36" onchange="clik('3_6')" id="3_6">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub37" onchange="clik('3_7')" id="3_7">
                                                      <option>------</option>
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                          </tr>
                                          <tr>
                                              <th>DAY 4</th>
                                              <td>
                                                  <select name="sub41" onchange="clik('4_1')" id="4_1">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub42" onchange="clik('4_2')" id="4_2">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td><td>
                                                  <select name="sub43" onchange="clik('4_3')" id="4_3">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td><td>
                                                  <select name="sub44" onchange="clik('4_4')" id="4_4">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td><td>
                                                  <select name="sub45" onchange="clik('4_5')" id="4_5">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub46" onchange="clik('4_6')" id="4_6">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub47" onchange="clik('4_7')" id="4_7">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                          </tr>
                                          <tr>
                                              <th>DAY 5</th>
                                              <td>
                                                  <select name="sub51" onchange="clik('5_1')" id="5_1">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub52" onchange="clik('5_2')" id="5_2">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td><td>
                                                  <select name="sub53" onchange="clik('5_3')" id="5_3">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td><td>
                                                  <select name="sub54" onchange="clik('5_4')" id="5_4">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td><td>
                                                  <select name="sub55" onchange="clik('5_5')" id="5_5">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub56" onchange="clik('5_6')" id="5_6">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                              <td>
                                                  <select name="sub57" onchange="clik('5_7')" id="5_7">
                                                      <option>------</option>
                                                    <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                    <option value ="<%=option[i][0]%>"><%=option[i][0]%></option>
                                                    <%}%>
                                                  </select>
                                              </td>
                                          </tr>
                                          <%}%>
                                      </table>
                                      <div class="callout callout-info">
                                        <h4>Remaining period allowance</h4>
                                        <div id="infobox">
                                        </div>
                                      <script>
                                          <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                        var <%=option[i][0].replaceAll("\\s+","")%> = <%=option[i][1]%>;
                                                    <%}%>
                                          
                                          function vals()
                                          {<%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                        <%=option[i][0].replaceAll("\\s+","")%> = <%=option[i][1]%>;
                                                    <%}%>
                                          }
                                                    var lastClick;
                                           
                                          function periodCheck(){
                                              document.getElementById('infobox').innerHTML = '<%for(int i = 0;i<option.length; i++){%>'<%if(option[i][0]==null)break;%>+'<%=option[i][0]%> = '+<%=option[i][0].replaceAll("\\s+","")%>+'<br><%}%>;
                                              vals();
                                          }
                                          /*
                                           * Function is used to store the clicked SelectBox id
                                           */
                                          function clik(last){
                                              lastClick = last;
                                              change();
                                              periodCheck();
                                          }
                                          function change(){
                                              counter(document.getElementById('1_1').value);
                                              counter(document.getElementById('1_2').value);
                                              counter(document.getElementById('1_3').value);
                                              counter(document.getElementById('1_4').value);
                                              counter(document.getElementById('1_5').value);
                                              counter(document.getElementById('1_6').value);
                                              counter(document.getElementById('1_7').value);
                                              counter(document.getElementById('2_1').value);
                                              counter(document.getElementById('2_2').value);
                                              counter(document.getElementById('2_3').value);
                                              counter(document.getElementById('2_4').value);
                                              counter(document.getElementById('2_5').value);
                                              counter(document.getElementById('2_6').value);
                                              counter(document.getElementById('2_7').value);
                                              counter(document.getElementById('3_1').value);
                                              counter(document.getElementById('3_2').value);
                                              counter(document.getElementById('3_3').value);
                                              counter(document.getElementById('3_4').value);
                                              counter(document.getElementById('3_5').value);
                                              counter(document.getElementById('3_6').value);
                                              counter(document.getElementById('3_7').value);
                                              counter(document.getElementById('4_1').value);
                                              counter(document.getElementById('4_2').value);
                                              counter(document.getElementById('4_3').value);
                                              counter(document.getElementById('4_4').value);
                                              counter(document.getElementById('4_5').value);
                                              counter(document.getElementById('4_6').value);
                                              counter(document.getElementById('4_7').value);
                                              counter(document.getElementById('5_1').value);
                                              counter(document.getElementById('5_2').value);
                                              counter(document.getElementById('5_3').value);
                                              counter(document.getElementById('5_4').value);
                                              counter(document.getElementById('5_5').value);
                                              counter(document.getElementById('5_6').value);
                                              counter(document.getElementById('5_7').value);
                                          }
                                          function counter(val){
                                              switch(val) {
                                                  <%for(int i = 0;i<option.length; i++){%>
                                                    <%if(option[i][0]==null)break;%>
                                                  case "<%=option[i][0]%>": <%=option[i][0].replaceAll("\\s+","")%>--;
                                                      break;
                                                      <%}%>
                                              }
                                              <%for(int i = 0;i<option.length; i++){%><%if(option[i][0]==null)break;%>
                                              if(<%=option[i][0].replaceAll("\\s+","")%><0)
                                              {
                                                reset();
                                              }
                                              <%}%>
                                                  
                                          }
                                          function reset(){
                                              document.getElementById(lastClick).selectedIndex=0;
                                          }
                                      </script>                                  
                                      <script>periodCheck();</script>
                                  </div>
                                  <div class="box-footer">
                                      <button type="submit">Submit</button>
                                  </div>
                                  </form>
                              </div>
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
    </body>
</html>
