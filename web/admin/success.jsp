<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.lang.Exception"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<!DOCTYPE html>

    <head>
        <link href="../student/assets/css/w3.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html/jpg; charset=UTF-8">
        <title>register-successfully</title>
        <style>
            #img
            {
                width: 250px;
                height: 200px;
                
            }
           
        </style>
    </head> 
    <body>
       
     <div class="w3-container w3-light-green">
     <center>
         <img src="../student/assets/img/check icon.png" id="img" alt="not"/>
         <h1>Registration Completed Successfully </h1>
         
     <br>
     <br>
     <button class="w3-btn w3-round w3-xlarge w3-blue" ><a href="admin_registration.jsp">Back</a></button>&nbsp
     &nbsp&nbsp&nbsp<button class="w3-btn w3-round w3-xlarge w3-blue" ><a href="admin_login.jsp">Login</a></button>
     
     </center></div>
</body>
</html>
             
    


