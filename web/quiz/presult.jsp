<%-- 
    Document   : check
    Created on : Mar 17, 2020, 4:38:27 PM
    Author     : Danish Muchhale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
          <link rel="stylesheet" href="../styles/w3.css">
    </head>
    <%
        response.setHeader("Cache-Control", "no-cache,no-store,mustrevalidate");
            response.setHeader("pragma","no-cache");
          
            if(session.getAttribute("uname")==null){
            response.sendRedirect("student/Login.jsp");
            }
        %>
        <%  
               int total=Integer.parseInt(request.getParameter("total"));
        %>
    <body>
    <table class="w3-table w3-center">
        <tr>
            <td>Question</td>
            <td>You Selected</td>
            <td>Correct</td>
        </tr>
       <%  for(int i=1;i<=total;i++)
           {
               String sel=request.getParameter("rd"+i);
               String ans=request.getParameter("ans"+i);
               String question=request.getParameter("q"+1);
               %>
         <tr>
            <td><%=question%></td>
            <td><%=sel%></td>
            <td><%=ans%></td>
        </tr>
        <% } %>
        
        
        
    </table>
    </body>
</html>
