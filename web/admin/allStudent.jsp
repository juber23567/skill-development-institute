<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="account.CreateConnection"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student</title>
        <style>
           
            img
            {
                height: 50px;
                width: 50px;
            }
            img:hover
            {
                height: 100px;
                width: 100px;
            } 
            table
            {
                font-family: cursive;
                font-weight: bold;
            }
            
            
        </style>
        <link href="../styles/w3.css" rel="stylesheet" type="text/css"/>
    </head>
    <jsp:include page="header.jsp"></jsp:include>
    <body>
          <% 
            response.setHeader("Cache-Control", "no-cache,no-store,mustrevalidate");
            response.setHeader("pragma","no-cache");
            if(session.getAttribute("admin_username")==null){
            response.sendRedirect("admin_login.jsp");
           } %>&nbsp;
   
           <% try{
      Connection conn=CreateConnection.intializeDatabase();
   PreparedStatement pt=conn.prepareStatement("select stdid, first_name,middle_name,last_name,mobile1,Email,img,sign from student order by stdid desc");
   ResultSet rs=pt.executeQuery();
     %>  
            <div class="w3-responsive">
            <table class="w3-table-all w3-hoverable w3-centered">
                        
                <tr class="w3-small"><td>SEAT-NO</td>
                    <td>FULL-NAME</td>
                    <td>MOBILE-NO</td>
                    <td>Email</td>
                    <td>PHOTO</td>
                    <td>SIGN</td>
                    <td>&nbsp;</td>
                </tr>
                <% while(rs.next()){%>
       <form action="deletestudent.jsp" method="get">
        <tr><td>  <%=rs.getInt("stdid")%></td>
       <td> <%=rs.getString("first_name")%>
                &nbsp;<%=rs.getString("middle_name")%>
       
                    &nbsp;<%=rs.getString("last_name")%>
       </td>
       <td><%=rs.getString("mobile1")%></td>
       <td><%=rs.getString("Email")%></td>
       <td><img src="../student/img.jsp?id=<%=rs.getInt("stdid")%>" alt="error"></td>
       <td> <img src="../student/sign.jsp?id=<%=rs.getInt("stdid")%>" alt="error"></td>
       <input type="hidden" name="stdid" value="<%=rs.getInt("stdid")%>">
       <td> <input type="submit" value="Delete"></td>
        </tr>
        </form>
        <% } %>
              
            </table>
            </div>
<%} catch(Exception e)
{
out.println(e);
} %>
    </body>
</html>
