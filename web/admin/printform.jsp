<%-- 
    Document   : printform
    Created on : Mar 5, 2020, 2:10:56 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PrintForm</title>
    </head>
    <body>
            <% 
            response.setHeader("Cache-Control", "no-cache,no-store,mustrevalidate");
            response.setHeader("pragma","no-cache");
            if(session.getAttribute("admin_username")==null){
            response.sendRedirect("admin_login.jsp");
            }
            %>
        <script>
            var stdid=prompt("Enter seat_no");
           
            url="../student/admission_form.jsp?stdid="+stdid;
            window.location.href=url;
            
          
        </script>
       
    </body>
</html>
