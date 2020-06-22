<%-- 
    Document   : result
    Created on : Feb 27, 2020, 4:43:29 PM
    Author     : Danish Muchhale
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
        <title>Result</title>
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
            $(document).ready(function(){
              var seat_no=prompt("enter seat no");
           
              var url="getresult.jsp?seat_no="+seat_no;
              window.location.href=url;
          
        
            });
        </script>
    </body>
</html>
