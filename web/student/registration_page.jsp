<!DOCTYPE html>
<html>
    <head>
        <title>registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--<link rel="stylesheet" href="styles/style.css" ></style>-->
    <link rel="stylesheet" href="../styles/w3.css" >
    <style>
       #reg
       {
           float: left;
           
       } 
       .in
       {
           
           display:block;
           background-image: url("assets/img/background.jpg")
 
       }
       body{
           margin-top:0; 
           background-image: url("assets/img/star-sky.jpg");
           color :white;
       }
       .alig
       {
           text-align: center;       
       }
        
    </style>
    </head>
    <body>
     
   
    <div class="container">
        <form action="../demo1" enctype="multipart/form-data" method="post" class="w3-container w3-card-5  ">
<h1 align="center">Student Registration Form</h1>
<input type="text" name="first_name"   placeholder="First Name" class="w3-input w3-border-black  w3-third w3-margin-bottom w3-border" required>
<input type="text" name="middle_name"  placeholder="Middle Name" class="w3-input w3-third w3-margin-bottom w3-border-black w3-border " required>
<input type="text" name="last_name" pattern="[A-Za-z]+" placeholder="Last Name" class="w3-input w3-third w3-margin-bottom w3-border-black w3-border" required>
                    
<input type="text" name="school_name" placeholder="school/college name" class="w3-input w3-half w3-margin-bottom w3-border w3-border-black" required>
  <select name="qualification" id="sel" class="w3-select w3-half w3-margin-bottom w3-border-black w3-border">

   <option value="" selected>Select your qualification</option>
    <option value="1st-9th">1st-9th</option>
     <option value="ssc">SSC</option>
   <option value="hsc">HSC</option>
     <option value="graduate">GRADUATE</option>
  </select>
  <input type="text" style="float:right"   name="bplace" placeholder="Place Of Birth" class="w3-input w3-border-black w3-border  w3-margin-bottom w3-half">
  <div  class=" w3-border-black w3-border w3-input w3-margin-bottom w3-half"><input type="date"  name="dob" placeholder="Date Of Birth">DOB</div>
 <input type="email" style="float:right;"  class="w3-border-black w3-border w3-input w3-margin-bottom w3-half" name="email" placeholder="Enter E-Mail ">                   
   <div class="w3-half  w3-margin-bottom" style="float:top;" >Gender<input type="radio" name="gender" value="Male" class="w3-radio">Male
       <input type="radio" name="gender" value="Female" class="w3-radio ">Female</div>

             
<select style="float:left;" name="id_proof" id="sel" class="w3-select w3-margin-bottom w3-half w3-border-black w3-border">
<option value="" selected>Id_proof</option>
 <option value="aadhar-card" name="id_proof">Aadhar-Card</option>
<option value="School-Id" name="id_proof">School-Id</option>
<option value="pan-card" name="id_proof">Pan-Card</option>
</select>
<input type="text" name="id_no" placeholder="Id_Proof Number" class=" w3-border-black w3-border w3-input w3-margin-bottom w3-half">
<input type="text" name="mobile1" placeholder="Mobile_Number-1" pattern="[0-9]{10}"  class=" w3-border-black w3-border w3-input w3-margin-bottom w3-half" required>
 <input type="text" name="mobile2" placeholder="Mobile_Number-2" class=" w3-border-black w3-border w3-input w3-half w3-margin-bottom w3-half">
 <select name="phy_chal" id="sel" class=" w3-border-black w3-border w3-select w3-margin-bottom w3-half" required>
 <option value="" selected >Physically Challenged</option>
<option value="yes">Yes</option>
<option value="no">No</option>
</select>           
 <input type="text" placeholder="father's occuption" name="foccupation" class=" w3-border-black w3-border w3-select w3-margin-bottom w3-half" required>
<div class="w3-input w3-margin-bottom w3-half w3-border-black w3-border">Upload-Photo (size>120kb)</div>
<input type="file" name="upload_img"class="w3-input w3-margin-bottom w3-half w3-border-black w3-border" placeholder="Upload img" required>

<div class ="w3-input w3-margin-bottom w3-half w3-border-black w3-border">Upload-Sign (size>120kb)</div>
<input type="file" name="upload_sign"class="w3-input w3-margin-bottom w3-half w3-border-black w3-border" placeholder="Upload your sign" required>
<textarea placeholder="ENTER PERMANENT ADDRESS" pattern="[A-Za-z0-9]+"name="address" class="w3-border-black w3-border w3-input w3-margin-bottom   w3-twothird w3-margin-right" required></textarea> 
 <input type="submit" value="Register" class="w3-left-align w3-button w3-black w3-margin-bottom w3-third" id="reg">  
 </form>  
</div>
    </body>
</html>