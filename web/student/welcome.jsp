<%@page import="account.CreateConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="account.CreateConnection.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="assets/css/w3.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WELCOME</title>
        <style>
            a
            {
                text-decoration: none;
            }
            b
            {
                font-size: 20px;
            }
            li
            {
                list-style: none;
            }
            #photo
            {
                width: 200px;
                height: 200px;
                margin-top: 5px;
                  border: 1px solid black;
                
            }
            #sign{
                width: 260px;
                height: 60px;
                margin-top: 5px;
                border: 1px solid black;
            }
       
        </style>
    </head>
    <body>
        <nav class=" w3-green ">
         <form action="../logout" >
             <a href="reset-password.jsp" class="w3-half w3-padding w3-green w3-center w3-border w3-border-black">Change Password</a>
            <input type="submit" value="Logout" class="w3-half w3-padding w3-green w3-center w3-border w3-border-black" >
     </form>         
     </nav> 
        <% 
            response.setHeader("Cache-Control", "no-cache,no-store,mustrevalidate");
            response.setHeader("pragma","no-cache");
            if(session.getAttribute("uname")==null){
            response.sendRedirect("Login.jsp");
            }
        %>
       
          <%
           
   try{
   Connection conn=CreateConnection.intializeDatabase();
   PreparedStatement pt=conn.prepareStatement("select examid,Name from exam where active=?");
      PreparedStatement check=conn.prepareStatement("select type from exam where active=? limit 1");
      check.setInt(1, 1);
      pt.setInt(1, 1);
  String mode;
       ResultSet rs1=check.executeQuery();
       while(rs1.next())
       {
         String act=rs1.getString("type");
         if(act.equals("e"))
         {
         mode="exam";
         pageContext.setAttribute("mode", mode);
         }
         else
         {
             mode="practice";
             pageContext.setAttribute("mode", mode);
         }
          
       }  
   ResultSet rs=pt.executeQuery();
     %> 
     
   
    <center>
     <form method="post" action="../quiz/<%=pageContext.getAttribute("mode")%>.jsp" id="start" >
         <br>                    
<img src="img.jsp?id=${stdid}" id="photo">
<br>
<img src="sign.jsp?id=${stdid}" id="sign">
<br>
<br>
<b>&nbsp;Seat no&nbsp;:&nbsp;${stdid}           
        <br>&nbsp;Name&nbsp;:&nbsp;${uname}&nbsp;${last_name}</b>
        <br>
        <br>
     <table class=" w3-green w3-padding-large">
        <tr>
          <td> <label>Select Exam </label></td>
          <td><select name="exam" id="exam">
              <option>Select Exam</option>
         <% 
   
   while(rs.next()){
             
             %>
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
  <tr>
      <td></td>
      <td><input type="submit" value="Start" ></td>
  </tr>
     </table>
    </center>
       
    <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
    <script>
        $('#start').submit( function(){
        {
            var check=confirm("ONCE THE EXAM IS OPENED, YOU MUST COMPLETE IT AT THAT TIME \n ALL THE BEST \n ARE YOU READY ");
            if(check===true)
            {
                return true;
            }
            else
            {
              return false;  
            }
        }
        });
    </script>
       
    </body>
</html>
