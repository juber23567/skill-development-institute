

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="width=device-width,initial-scale=1.0"; charset=UTF-8" name="viewport">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="styles/w3.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                height:500px;
                width: 100%;
            }
            .computer
            {
                background-image: url("static-file/computer.jpg");
            }
            li{
                font-family:times new roman;
            }
            h2,h3{
                font-family:  arial Black ;
            }
            #navi
            {
                position: relative;
            }
            p
            {
               text-align: center;
               background-color: teal;
               padding: 5px;
               
            }
        </style>
        <title  class="w3-green">SDI</title>
    </head>
   
    <body>
        <div class="w3-bar w3-teal " id="navi" >
  <a href="student/registration_page.jsp" class="w3-quarter w3-button" style="font-family: arial Black;">REGISTRATION</a>
  <a href="student/Login.jsp" class="w3-quarter w3-button" style="font-family: arial Black;" style="font-family: arial Black;">LOGIN</a>
  <a href="student/contact.jsp" class="w3-quarter w3-button" style="font-family: arial Black;">CONTACT</a>
  <a href="admin/admin_login.jsp" class="w3-quarter w3-button " style="font-family: arial Black;">ADMIN LOGIN</a>
</div>
          <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="static-file\SDI LOGO.png" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100 " src="static-file\sdi1.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="static-file\sdi2.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
        <div class="w3-container" class="computer">
            <H2 style="font-family: bernard MT condensed;"><MARQUEE><FONT COLOR="GREEN">SDI SKILL DEVELOPMENT INSTITUTE</FONT></MARQUEE></h2>
        <div class="w3-third w3-white w3-margin-top w3-animate-left" >
        <h3 class="w3-orange w3-padding w3-text-black w3-margin-right w3-round">COMPUTER-BASIC</h3> 
        <ol>
            <li>Fundamental-Computer</li>
            <li>Input & output processing(CPU)</li>
            <li>Email & Internet</li>
            <li>Application Of Computer</li>
            <li> Microsoft Office</li>
        </ol>
        <h2 class="w3-green w3-center w3-margin-right">FREE</h2>  
        </div>
             
      
        <div class="w3-third w3-white w3-margin-top w3-animate-zoom w3-round">
        <h3 class="w3-orange w3-padding w3-text-black w3-text">ADV.MS EXCEL</h3>
        <ol>    
        <li> MS-Excel</li>
            <li>Office Level Report</li>
            <li>All-Formulas</li>
            <li>Introduction to Developer Tab</li>
            <li>Macros etc</li>
            
        </ol>
        <h2 class="w3-green w3-center">FREE</h2>  
        </div>
   
        <div class="w3-third w3-white w3-margin-top w3-animate-right">
        <h3 class="w3-orange w3-padding w3-text-black w3-margin-left w3-round">TALLY ERP.9</h3> 
        <ol>
            <li>Fundamental Accounts</li>
            <li>Company Creation</li>
            <li>Voucher Entry</li>
            <li>Inventory & Basic Reports</li>
            <li>Configuration & GST etc</li>
        </ol>
        <h2 class="w3-green w3-center w3-margin-left">FREE</h2>  
        </div>
   </div>
     
                
                <p>Copyright&copy;SDI SKILL DEVELOPMENT INSTITUTE (BYCULLA)</p>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
    
</html>
