<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Change</title>
    <link href="../styles/w3.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="../assets/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="./assets/css/styles.css">
</head>

<body>
    
    <div class="login-dark">
        <form method="get" action="change_password.jsp">
            <h2 class="sr-only">Send OTP</h2>
            <div class="illustration"><i class="icon ion-edit"></i></div>
            <div class="form-group"><input class="form-control" type="text" placeholder="Username" name="user" required></div>
    
            <button class="btn btn-primary btn-block" type="submit">Change</button>
           
        </form>
    </div>
    
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>