<%-- 
    Document   : changemode
    Created on : Mar 20, 2020, 6:17:25 PM
    Author     : admin
--%>

<%@page import="account.CreateConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
    </head>
    <body>
        <% String mode=request.getParameter("mode");
         Connection conn=CreateConnection.intializeDatabase();
   PreparedStatement exam=conn.prepareStatement("update exam set active=? where type=?");
   PreparedStatement practice=conn.prepareStatement("update exam set active=? where type=?");
   
      exam.setString(2,"e");
      practice.setString(2,"p");
        if(mode.equals("p"))
        {
         exam.setInt(1,1);
         practice.setInt(1,0);
          int status=exam.executeUpdate();
          int status1=practice.executeUpdate();
          if(status>0 && status1>0)
          {
              response.sendRedirect("Dashboard.jsp?st=e");
          }
        }
        else if(mode.equals("e"))
        {
            exam.setInt(1,0);
         practice.setInt(1,1);
          int status=exam.executeUpdate();
          int status1=practice.executeUpdate();
     
          if(status>0 && status1>0)
          {
              response.sendRedirect("Dashboard.jsp?st=p");
          }
        }
        else
            {
               response.sendRedirect("mode.jsp?st=error"); 
            }
        %>
    </body>
</html>
