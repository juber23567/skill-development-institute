<%@page import="account.CreateConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" href="../styles/w3.css">
    <title>edit Question</title>
    <style>
     img
     {
         width: 50px;
         height: 50px;
     }
     img:hover{
         width: 200px;
         height: 200px;
     }
     table{
         font-family: cursive;
     }
        
    </style>
    
    </head>
    <jsp:include page="header.jsp"></jsp:include>
   
    <body>
        <% 
            response.setHeader("Cache-Control", "no-cache,no-store,mustrevalidate");
            response.setHeader("pragma","no-cache");
            if(session.getAttribute("admin_username")==null){
            response.sendRedirect("admin_login.jsp");
            }
        %>  
 <%
   try{
    Connection conn=CreateConnection.intializeDatabase();
   PreparedStatement pt=conn.prepareStatement("select examid,Name from exam");
   ResultSet rs=pt.executeQuery();
   
     %> 
    <table align="center">
        <tr>
          <td> <label>Select Exam </label></td>
          <td><select name="exam" id="exam">
              <option>Select Exam</option>
         <% while(rs.next()){ %>
         <option id="opt"  value="<%=rs.getInt("examid")%>" name="exam"><%=rs.getString("Name")%></option>
         <% 
         }
          rs.close();
 pt.close();
  
         
         %>
 
</select>
</table>
         <table class="w3-table" id="table">
            

    <tr>
        <td>sr</td>
        <td>Question</td>
        <td>opt1</td>
        <td>opt2</td>
        <td>opt3</td>
        <td>opt4</td>
        <td>Answer</td>
        <td>Image</td>
        <td>Delete</td>
    </tr>   
    
    <%
 PreparedStatement question=conn.prepareStatement("SELECT qid,question,opt1,opt2,opt3,opt4,answer  from question where examid=?");
String examid=request.getParameter("examid");


 question.setString(1,examid);
   ResultSet q=question.executeQuery();
   int no =0;
   while(q.next())
   { 
    no++;
    %>
     <form action="../deletequestion" method="get"> 
      <tr>
        <td><%=no %></td>
        <td><%=q.getString("question")%></td>
        <td><%=q.getString("opt1") %></td>
        <td><%=q.getString("opt2") %></td>
        <td><%=q.getString("opt3") %></td>
        <td><%=q.getString("opt4") %></td>
        <td><%=q.getString("answer") %></td>
        <td><img src="../quiz/getQuestionImg.jsp?id=<%=q.getInt("qid")%>" alt="No Image"></td>
        <input type="hidden" name="delete" value="<%=q.getInt("qid")%>" >
   <td><input type="submit" value="Delete Question" ></td>
</form>
      </tr>   
       
 <%  }
   q.close();
   question.close();
 
   %> 
 
    </table>     

<script src="../assets/js/jquery.min.js" type="text/javascript"></script>      
<script>
 $(document).ready(function(){
 });
 $("#exam").change(function (){
   
 var a=$("#exam option:selected").val();
 document.location.href="editquestion.jsp?examid="+a;
    });
 
 </script>
       <% 
   conn.close(); }
   
catch(Exception e)
{
out.println(e);
} %>                

    </body>
</html>
