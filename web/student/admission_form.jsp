<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="account.CreateConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%  try{
     Connection conn=CreateConnection.intializeDatabase();
     PreparedStatement getstudentdetail=conn.prepareStatement("select * from student where stdid=?");
    int stdid=Integer.parseInt(request.getParameter("stdid"));
     getstudentdetail.setInt(1,stdid);
      ResultSet rs=getstudentdetail.executeQuery();
      while(rs.next())
      {
      %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=rs.getInt("stdid")%></title>
         <link rel="stylesheet" href="../styles/w3.css">
        <style>
             #logo{
                float:left;
                width: 100px;
                height: 100px;
             }
             #header
             {
                 border:1px solid black;
                padding: 10px;
                height: 80px;
             }
             #photo
             {
              
                 width: 100px;
                 height: 110px;
                 border: 1px solid black;
                 margin-left: auto;
                 margin-right: auto;
                  display: block;
           
             }
             td
             {
                 border: 2px solid black;
                 font-family: cursive;
                 
             }
             #sign{
                 width: 200px;
                 height: 30px;
             }
            </style>
            
    </head>
    <body onclick="print()">    
   
       <img src="../static-file/SDI LOGO.png" id="logo">
            <h2 align="center"><b style="font-family: Bernard MT Condensed">SDI-SKILL DEVELOPMENT INSTITUTE</b></h2>
            <p align="center">SUNNI NOORI MASJID, BEHIND FAROUK SODAGAR DARVESH & CO., MUSTUFA<br> BAZAR, SANT.SAVAT MARG, MUMBAI-400010<br>
            E-MAIL: sdiskill2017@gmail.com
            </p>
      <img src="img.jsp?id=<%=rs.getInt("stdid")%>" id="photo"><br>
      
     
      <br>
      <table class="w3-table ">
          <tr>
              <td>Course Applied For</td>
              <td colspan="2">&nbsp;</td>
            
          </tr>
          <tr>
              <td>First Name</td>
              <td>Middle Name</td>
              <td> Last Name</td>
          </tr>
          <tr>
              <td><b><%=rs.getString("first_name")%></b></td>
              <td> <b><%=rs.getString("middle_name")%></b></td>
              <td><b><%=rs.getString("last_name")%> </b></td>
          </tr>
          <tr>
              <td colspan="3"> Permanent Address</td>
   
          </tr>
          <tr>
              <td colspan="3"><b><%=rs.getString("address")%></b></td>
          
          </tr>
          <tr>
              <td colspan="2">School/College</td>
              <td>Qualification</td>
              
          </tr>
          <tr>
              <td colspan="2"><b><%=rs.getString("school_name")%></b></td>
              <td><b><%=rs.getString("qualification")%></b></td>
              
          </tr>
          <tr>
              <td>Date of Birth(YYYY-MM-DD)</td>
              <td>Place of Birth</td>
              <td>Gender</td>
          </tr>
          <tr>
              <td><b><%=rs.getString("dob")%></b></td>
              <td><b><%=rs.getString("dplace")%></b></td>
              <td><b><%=rs.getString("gender")%></b></td>
          </tr>
          <tr>
              <td>ID Proof</td>
              <td>Contact Number-1</td>
              <td>Contact Number-2</td>
          </tr>
          <tr>
              <td><b><%=rs.getString("id_proof")%></b></td>
              <td><b><%=rs.getString("mobile1")%></b></td>
              <td><b><%=rs.getString("mobile2")%></b></td>
          </tr>
          <tr>
              <td>E-Mail</td>
              <td>Physically Challenged</td>
              <td>Father's Occuption</td>
          </tr>
          <tr>
              <td><b><%=rs.getString("Email")%></b></td>
              <td><b><%=rs.getString("phy_chal")%></b></td>
              <td><b><%=rs.getString("f_occuption")%></b></td>
          </tr>
       
      </table>  
      <br>
      <table class='w3-table' id='footer'>
          <tr>
              <td><img src="sign.jsp?id=<%=rs.getInt("stdid")%>" id="sign" align="center"></td>
            
              <td>&nbsp;</td>
          </tr>
           <tr>
              <td style="text-align: center;">Applicant's Signature</td>
             
              <td style="text-align: center;">Parent's/Guardian's Signature</td>
          </tr>
      </table>
          
        
        
        <%}}catch(Exception e)
      {
          out.println(e);
          
      }
    %>
    </body>
</html>
