

<%@page import="account.CreateConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
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
          int stdid=Integer.parseInt(request.getParameter("stdid"));
          out.println(stdid);
          Connection conn=CreateConnection.intializeDatabase();
          PreparedStatement delete=conn.prepareStatement("delete  from student where stdid=?");
          delete.setInt(1, stdid);
          int status=delete.executeUpdate();
          if(status>0)
          {
              response.sendRedirect("allStudent.jsp");
          }
          else
          {
            response.sendRedirect("allStudent.jsp");  
          }
          %>
    </body>
</html>
