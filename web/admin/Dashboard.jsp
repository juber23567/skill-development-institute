
<%@page import="account.CreateConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="account.CreateConnection.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styles/w3.css">
        <title>Dashboard</title>
        <style>
       
            
            .flex-container
            {
                display: flex;
                flex-direction:row;
                background-color: teal;
                align-content:center;
                flex-wrap:wrap;
                justify-content:center;
                align-items:center;
            }
            .flex-container>button{
                background-color: white;
                height: 120px;
                width: 200px;
                margin: 20px;
                text-align:center;
                border: 5px solid blue;
                font-family: arial Black;
                color:teal;
                
                
            }
            #status
            {
                width: 25%;
               padding: 10px;
               background-color: red;
               color:white;
               border: 1px solid black;
               font-family: COURIER NEW;
               font-weight: bolder;
            }
          #mode
          {
              
              
              background-color: green;
              padding: 10px;
          }
         
            
        </style>
    </head>
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
        int num=0;
    Connection conn=CreateConnection.intializeDatabase();
      Statement st=conn.createStatement();
      ResultSet rs=st.executeQuery("select COUNT(*) from student where status='online'");
    while(rs.next())
    {
        num =rs.getInt("count(*)");
    }
  
      %>
        
        <div class="w3-bar w3-teal">
       <a href="admin_registration.jsp" class="w3-third w3-button " style="font-family: arial Black;">REGISTRATION</a>
        <a href="change.jsp" class="w3-third w3-button"style="font-family: arial Black;" >CHANGE-PASSWORD</a>   
        <a href="../admin_logout" class="w3-third w3-button " style="font-family: arial Black;">LOGOUT</a>  
        </div>
      <h1 style="font-family: BERNARD MT CONDENSED; "><marquee>SDI SKILL DEVELOPMENT INSTITUE</marquee> </h1>
      <div>
      <p id="status">Active Student:  <%=num%>
          <jsp:include page="mode.jsp"></jsp:include></p>
      </div>
      
        <div class="flex-container">
          
            <button type="submit" onclick="window.location.href='../student/registration_page.jsp'" class="w3-button w3-hover-border-green "><p>NEW ADMISSION</p></button>
            <button type="submit" onclick="window.location.href='allStudent.jsp'" class="w3-button w3-hover-border-green"><p>STUDENT-DETAILS</p></button>
            <button type="submit" onclick="window.location.href='addexam.jsp'" class="w3-button w3-hover-border-green"><p>ADD EXAM </p></button>
            <button type="submit" onclick="window.location.href='editexam1.jsp'" class="w3-button w3-hover-border-green"><p> EDIT EXAM</p></button>
             <button type="submit" onclick="window.location.href='addquestion.jsp'" class="w3-button w3-hover-border-green"><p> ADD QUESTION</p></button>
        <button type="submit" onclick="window.location.href='editquestion.jsp'" class="w3-button w3-hover-border-green"><p> EDIT QUESTION</p></button>
        <button type="submit" onclick="window.location.href='result.jsp'" class="w3-button w3-hover-border-green"><p>GENERATE RESULT</p></button>
        <button type="submit" onclick="window.location.href='printform.jsp'" class="w3-button w3-hover-border-green" target="_blank"><p>PRINT FORM</p></button>
</div> 
        
        <%
 }
  catch(Exception e)
    {
        out.println(e);
    }
       
%>  
  </body>
    
</html>
