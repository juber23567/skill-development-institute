
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : reset-password
    Created on : Jan 9, 2020, 10:53:23 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    
    </script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>reset password</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/beautiful-warning-alert.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="assets/css/styles.css">
<style>
    #alert{
    margin-bottom:0;
   display:none;
    }
</style>
</head>
<%
/* String seat_no=request.getParameter("seat_no");
String password=request.getParameter("password");
String rpassword=request.getParameter("rpassword");
//pageContext.setAttribute("seat_no", seat_no);
//pageContext.setAttribute("password",password);
//pageContext.setAttribute("rpassword", rpassword);
if(password==null&& rpassword==null && password!=rpassword ){
String mess="<div id='alert' class='alert alert-warning beautiful' role='alert' >hello</div>";
out.println(mess);}*/
%>
<body>
   
    <div class="login-dark">
        <div id="alert" class="alert alert-warning beautiful" role="alert" >hello</div>;
        <form method="post" action="../reset_password" id="form">
            <h2 class="sr-only">Login Form</h2>
            
            <div class="illustration"><i class="icon ion-android-contact flash animated"></i></div>
            <div class="form-group"><input class="form-control" type="text" name="seat_no" placeholder="Seat-No" id="seat_no"></div>
            <div  class="form-group"><input class="form-control" type="password" name="password" placeholder="Password" id="password"></div>
            <div class="form-group"><input class="form-control" type="password" name="rpassword" placeholder="Re-Type Password" id="rpassword"></div>
            <button class="btn btn-primary btn-block" type="submit" onclick=demo>Change</button></form>
    </div>
    
       <script src="assets/js/jquery.min.js"></script>
       <script>
      
       </script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>


</html>