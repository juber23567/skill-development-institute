<%@page import="otp.Mailer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
<%@page import="account.CreateConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
    <%
        
        try
        {
            String user=request.getParameter("user");
            session.setAttribute("user",user);
            String to;
            String sub="ONE TIME PASSWORD";
   Connection conn=CreateConnection.intializeDatabase();
   PreparedStatement getEmail=conn.prepareStatement("select Email from Admin where username=?");
   getEmail.setString(1, user);
   ResultSet rs=getEmail.executeQuery();
   Random rand=new Random();
   int otp=rand.nextInt(9000)+1000;
  
   String otp1=String.valueOf(otp);
   String format="<center><h1 style='font-size:70px;'><b>"+otp1+"</b></h1></center>";
   session.setAttribute("otp", otp1);
  while(rs.next())
          {
            to=rs.getString(1); 
           
          
        Mailer.send(to, sub,format);
          }
        %>
    <div class="login-dark">
        <form method="post" action="../changepassword">
            <h2 class="sr-only">Change Password</h2>
            <div class="illustration"><i class="icon ion-edit"></i></div>
            <div class="form-group"><input class="form-control" type="number" placeholder="OTP" name="otp" required></div>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password" required></div>
                 <div class="form-group"><input class="form-control" type="password" name="cpassword" placeholder="Confirm-Password"required></div>
            <button class="btn btn-primary btn-block" type="submit">Change</button>
           
        </form>
    </div>
    
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
</body>
<% }catch(Exception e)
{
    out.println(e);
}
        %>
</html>