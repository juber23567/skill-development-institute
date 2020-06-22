
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Admin</title>
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="../assets/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="../assets/css/styles.css">
</head>

<body>
      <% 
            response.setHeader("Cache-Control", "no-cache,no-store,mustrevalidate");
            response.setHeader("pragma","no-cache");
            if(session.getAttribute("admin_username")==null){
            response.sendRedirect("admin_login.jsp");
            }
        %>
    <div class="login-dark">
        <form method="post" action="../admin_registration">
            <h2 class="sr-only">Admin</h2>
            <div class="illustration"><i class="icon ion-android-person-add"></i></div>
            <div class="form-group"><input class="form-control" type="text" placeholder="First_Name" name="first_name"  required></div>
            <div class="form-group"><input class="form-control" type="text" placeholder="Middle_Name" name="middle_name" required></div>
            <div class="form-group"><input class="form-control" type="text" placeholder="Last-Name" name="last_name"  required></div>
            
            <div class="form-group"><input class="form-control" type="text" name="number" placeholder="Mobile-Number"  required></div>
            <div class="form-group"><input class="form-control" type="email" name="email" placeholder="Email" required></div>
            <div class="form-group"><input class="form-control" type="text" name="username" placeholder="username" required></div>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password"></div>
            <button class="btn btn-primary btn-block" type="submit">Register</button>
            <a class="forgot" href="change.jsp">Change Password</a></form>
    </div>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>