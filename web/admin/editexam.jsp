<%@page import="java.sql.Statement"%>
<%@page import="account.CreateConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EditExam</title>
        <link rel="stylesheet" href="../styles/w3.css">
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
        <table align="center" class="w3-display-middle w3-green  w3-padding ">
       
          <%   try  {
              String examname=request.getParameter("examname");
      Connection conn=CreateConnection.intializeDatabase();
   PreparedStatement pt1=conn.prepareStatement("select Name,Time,marks,total_marks from exam where examid=?");
  pt1.setString(1, examname);
   ResultSet rs=pt1.executeQuery();
   while(rs.next()){
  %>
            <tr>
                <td colspan="2" align="center">Update Exam</td>
        <form action="../editexam" method="get">
         <tr>
            <td class="w3-padding" >Enter Old Exam Name</td>        
       <td><input type="text" name="oldexam"  id="oldexam" value="<%=rs.getString("Name")%>"></td>   
       </tr>
            <tr>
            <td class="w3-padding" >Enter New Exam Name</td>        
            <td><input type="text" name="exam" id="exam" value="<%=rs.getString("Name")%>" ></td>   
       </tr>
       <tr>
            <td class="w3-padding" >Time In Minute</td>        
            <td><input type="text" name="time"  id="time" value="<%=rs.getInt("Time")%>"></td>   
       </tr>
       <tr>
       <td class="w3-padding" >Passing-Marks</td>        
       <td><input type="text" name="marks" id="marks" value="<%=rs.getInt("marks")%>"></td>   
       </tr>
       <tr>
       <td class="w3-padding" >Total-Marks</td>        
       <td><input type="text" name="total-marks"  id="totalmarks" value="<%=rs.getInt("total_marks")%>"></td>   
       </tr>
       <tr><td align="center" class="w3-padding"><input type="submit" value="UPDATE"> </form></td>
       <form action="../deleteexam" ><td align="center"><input type="hidden" name="exam" value="<%=rs.getString("Name")%>" id="delete"><button type="submit" >Delete</button></td> </form>          
        </tr>
        </table>
    <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
    
    <%} }catch(Exception e){
        out.println(e);
    } %>
    </body>
</html>

