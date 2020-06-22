<%-- 
    Document   : editexam1
    Created on : Mar 4, 2020, 11:12:49 PM
    Author     : Danish Muchhale
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="account.CreateConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDIT EXAM</title>
        <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
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
         <% String st=request.getParameter("st");
        if(st!=null){   
        %>
        
    <center><h3><% out.println(st); } else{ }%></h3></center>
        <%try{
               Connection conn=CreateConnection.intializeDatabase();
              PreparedStatement pt=conn.prepareStatement("select examid,Name from exam");
   ResultSet rs=pt.executeQuery();
               %>
               <form method="get" action="editexam.jsp" class="w3-display-middle">
                   <table align="center">
        <tr>
          <td> <label>Select Exam </label></td>
          <td><select name="examname" id="exam">
              <option>Select Exam</option>
         <% while(rs.next()){ %>
         <option value="<%=rs.getInt("examid")%>" name="examname"><%=rs.getString("Name")%></option>
       <% } %> </select></td>
  </tr>
  <tr>
      <td><input type="submit" ></td>
  </tr>
               </form>
          <%  }
catch(Exception e)
{
out.println(e);
} %>
          
    </body>
</html>
