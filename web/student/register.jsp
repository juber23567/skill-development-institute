<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.lang.Exception"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<!DOCTYPE html>

    
        <link href="student/assets/css/w3.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html/jpg; charset=UTF-8">
        <title>register-successfully</title>
        <style>
            #img
            {
                width: 250px;
                height: 200px;
                
            }
           
        </style>
     
    <body>
           <% String first_name=request.getAttribute("first_name").toString();
        String last_name=request.getAttribute("last_name").toString();
       pageContext.setAttribute("first_name",first_name);
      pageContext.setAttribute("last_name", last_name);
 
     %>
     <div class="w3-container w3-light-green">
     <center>
         <img src="student/assets/img/check icon.png" id="img" alt="not"/>
         <h1>Registration Completed Successfully </h1>
      <h2><strong>Dear&nbsp<c:out value="${first_name}"></c:out>&nbsp<c:out value="${last_name}"></c:out> </strong></h2>
      <b>Your Seat_no is <%=request.getAttribute("stdid")%></b>
     <br><b>Your Password is Your Mobile_number1</b>
     <br>
     <br>
     </center>
     <button class="w3-btn w3-round w3-xlarge w3-blue w3-third" ><a href="student/registration_page.jsp">Back</a></button>
      <button  class="w3-button w3-round w3-xlarge w3-blue w3-third " onclick="FormPrint()">Print Admission Form</button>
     <button class="w3-btn w3-round w3-xlarge w3-blue w3-third" ><a href="student/Login.jsp">Login</a></button>
     
    
     <script>
        function FormPrint()
         {
             var stdid=<%=request.getAttribute("stdid")%>;
             var url="student/admission_form.jsp?stdid="+stdid;
          window.location.href=url;   
         }
     </script>
     </body>
</html>
             
    

