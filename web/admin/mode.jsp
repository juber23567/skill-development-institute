<%@page import="java.sql.ResultSet"%>
<%@page import="account.CreateConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
        <%
            try{
            Connection conn=CreateConnection.intializeDatabase();
   
      PreparedStatement check=conn.prepareStatement("select type from exam where active=? limit 1");
      check.setInt(1, 1);
      
      ResultSet rs1=check.executeQuery();
      while(rs1.next())
      {  
          String mode=rs1.getString(1);
          pageContext.setAttribute("mode",mode);
      
        
          if(mode.equals("p"))
          {
      %>
        <button onclick="window.location.href='changemode.jsp?mode=${mode}'">START EXAM</button> 
        <%}else{%>
        
      <button onclick="window.location.href='changemode.jsp?mode=${mode}'">STOP EXAM</button> 
        <%
          }}}catch(Exception e)
          {
              out.println(e);
          }      
        %> 
    </body>
</html>
