<%@page import="account.CreateConnection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Question</title>
        <style>
         
            body{
                margin: 0px;
                padding: 0;
            }
           option{
            font-family: arial Black;
            padding: 10px;
            }   
            table{
                font-family:Courier New;
            }
            tr,label,input,select{
               margin: 20px;
               padding: 5px;
            }
            tr,td
            {
                margin: 10px;
            }
            #question{
                width:500px;
            }
      </style>
    </head>
 <jsp:include page="header.jsp"></jsp:include>
      <% 
            response.setHeader("Cache-Control", "no-cache,no-store,mustrevalidate");
            response.setHeader("pragma","no-cache");
            if(session.getAttribute("admin_username")==null){
            response.sendRedirect("admin_login.jsp");
            }
        %>
    <%
        
      String status=request.getParameter("status");
      if(status!=null){
     %>
     <center><h3><% out.println(status);}
     else{
             
             }
      %></h3></center>
       
   <%
   try{
      Connection conn=CreateConnection.intializeDatabase();
   PreparedStatement pt=conn.prepareStatement("select examid,Name from exam");
   ResultSet rs=pt.executeQuery();
     %>  
     
    <form method="POST" action="../addquestion" enctype="multipart/form-data">
     <table align="center">
        <tr>
          <td> <label>Select Exam </label></td>
          <td><select name="exam" id="exam">
              <option>Select Exam</option>
         <% while(rs.next()){ %>
         <option value="<%=rs.getInt("examid")%>" name="exam"><%=rs.getString("Name")%></option>
 <% } rs.close();
 pt.close();
         conn.close(); }
catch(Exception e)
{
out.println(e);
} %>
              </select></td>
  </tr>
  <tr><td>
          <label>SELECT QUESTION TYPE</label></td>
      <td><select name="type" id="type">
          <option selected="selected">SELECT QUESTION TYPE</option>
          <option name="type" value="true">TRUE OR FALSE</option>
          <option name="type" value="multi">MULTIPLE-CHOICE QUESTION</option>
          <option name="type" value="img">MULTIPLE-CHOICE WITH IMAGE </option>

          </select></td>
  </tr>
  <tr><td><label id="lquestion">Enter Your Question</label></td><td><input type="text" id="question" name="question"></td></tr>
  <tr><td><label id="lopt1">Option-1</label></td><td><input type="text" id="opt1" name="opt1"></td></tr>
  <tr><td><label id="lopt2">Option-2</label></td><td><input type="text" id="opt2" name="opt2"></td></tr>
  <tr><td><label id="lopt3">Option-3</label></td><td><input type="text" id="opt3" name="opt3"></td></tr>
  <tr><td><label id="lopt4">Option-4</label></td><td><input type="text" id="opt4" name="opt4"></td></tr>
  <tr><td><label id="lfile">Upload-Image</label></td><td><input type="file" name="img" id="file"></td></tr>
  <tr><td><label id="lcorrect">Answer</label></td><td><input type="text" name="correct" id="correct" ></td></tr>
  <tr><td colspan="2" align="center"><input type="submit" value="Add Question" id="submit"></td><tr>
  </table>
      </form>
     
  <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
  <script>
    $(document).ready(function (){
   $("#lquestion,#question,#submit,#lopt1,#lopt2,#lopt3,#lopt4,#opt1,#opt2,#opt3,#opt4,#lfile,#file,#lcorrect,#correct,#question").hide(); 
});
    $("#type").change(function (){
var sel=document.getElementById('type').value;

if(sel==="true"){
 $("#lopt1,#lquestion,#question,#submit,#lopt2,#opt1,#opt2,#question,#lcorrect,#correct").show();
 $("#opt3,#lopt3,#lfile,#file").hide();
 $("#opt4,#lopt4").hide();
}else if(sel==="multi"){
 $("#lquestion,#question,#submit,#lopt1,#lopt2,#lopt3,#lopt4,#opt1,#opt2,#opt3,#opt4,#question,#lcorrect,#correct").show();
 $("#file,#lfile").hide(); 
}
else if(sel==="img"){
$("#lquestion,#question,#submit,#lopt1,#lopt2,#lopt3,#lopt4,#opt1,#opt2,#opt3,#opt4,#lfile,#file,#lcorrect,#correct,#question").show();
}else {
  $("#lquestion,#question,#lopt1,#lopt2,#lopt3,#lopt4,#opt1,#opt2,#opt3,#opt4,#lfile,#file").show();  
}
    });
    
  </script>
</body>
</html>

