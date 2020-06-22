<%-- 
    Document   : change_pass
    Created on : Jan 14, 2020, 9:26:59 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Login</title>
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="../assets/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="./assets/css/styles.css">
</head>

<body>
    <div class="login-dark">
        <form method="post" action="../admin_login">
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><i class="icon ion-edit"></i></div>
            <div class="form-group"><input class="form-control" type="text" placeholder="Username" name="username"></div>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password"></div>
            <button class="btn btn-primary btn-block" type="submit">Login</button>
            <div class="form-group"><a class="forgot" href="change.jsp">Change Password</a></div>
        </form>
    </div>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>