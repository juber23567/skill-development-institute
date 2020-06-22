<%@page import="account.CreateConnection"%>
<%@page import="account.CreateConnection.*"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
        <link href="../styles/w3.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
        <style>
          body
          {
              margin:10px;
             
          }
            #logo{
                float:left;
                width: 100px;
                height: 100px;
            }
            p{
                font-family: courier new;
              
            }
            #sign
            {
                width: 170px;
                height: 50px;
                display: block;
                margin-left: auto;
                margin-right: auto;
                border:3px solid black;
            }
            #student_photo
            {
                height: 120px;
                width: 120px;
                border:3px solid black;
                display: block;
                margin-left: auto;
                margin-right: auto;
            }
            #student_detail
            {
                margin-left:50px;
                margin-right: 50px;
                font-family: Lucida Calligraphy;
              
            }
            #student_detail>b{
                font-family: arial Black;
            }
            #rule
            {
              border: 2px solid black;
               border-radius: 20px;
             padding: 10px;  
            }
         i
         {
             border: 1px solid black;
             width: 50px;
             height: 2px;
             
         }
        </style>
    </head>
 
    <% try{
        String seat_no=request.getParameter("seat_no");
      Connection conn=CreateConnection.intializeDatabase();
     LocalDateTime date=java.time.LocalDateTime.now();
       String date1=DateTimeFormatter.ofPattern("dd-MM-yyyy",Locale.ENGLISH).format(date);
    
    PreparedStatement getresult=conn.prepareStatement("select examid, stdid,obtain_marks,status from result where stdid=?");
    PreparedStatement getstudent=conn.prepareStatement("select stdid, first_name,middle_name,last_name,gender from student  where stdid=?");
   PreparedStatement getexam=conn.prepareStatement("select * from exam where examid=?");
    getresult.setString(1,seat_no);
  ResultSet rs= getresult.executeQuery();
  while(rs.next())
{
    getstudent.setInt(1,rs.getInt("stdid"));    
    getexam.setInt(1,  rs.getInt("examid"));
    ResultSet student=getstudent.executeQuery();
    ResultSet exam = getexam.executeQuery();
    while(student.next() && exam.next())
    {
        
  
    %>
    <body onclick="print()">
      
      
 <img src="../static-file/SDI LOGO.png" id="logo">
            <h2 align="center"><b style="font-family: Bernard MT Condensed">SDI-SKILL DEVELOPMENT INSTITUTE</b></h2>
            <p align="center">SUNNI NOORI MASJID, BEHIND FAROUK SODAGAR DARVESH & CO., MUSTUFA<br> BAZAR, SANT.SAVAT MARG, MUMBAI-400010<br>
            E-MAIL: sdiskill2017@gmail.com
            </p>
            <h2 align="center" style="font-family: courier new;"><b>M A R K S H E E T </b></h2>
            <img src="../student/img.jsp?id=<%=student.getInt("stdid")%>" id="student_photo"><br>
<img src="../student/sign.jsp?id=<%=student.getInt("stdid")%>" id="sign">
<p align="center" id="student_detail">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This is to mention that&nbsp;<% String gender=student.getString("gender"); if(gender.equals("MALE") || gender.equals("male")){ out.println("Mr.");} else if(gender.equals("FEMALE") || gender.equals("female")) {out.println("Ms.");}%>
    <b><%=student.getString("last_name")%>&nbsp;<%=student.getString("first_name")%>&nbsp;<%=student.getString("middle_name")%></b>
    Having seat no. <b><%=student.getString("stdid")%></b> has appeared for<b> <%=exam.getString("Name")%></b> exam on <b><%=date1%></b> from
   At <b>SDI-SKILL DEVELOPMENT INSTITUTE, BYCULLA, MUMBAI</b>
</p>

<p>Details of the Marks obtained are as follows:</p>
<table class="w3-table w3-center w3-border w3-border-black" >
    <tr class="w3-center w3-border w3-border-black" >
        <th>Section</th>
        <th>Section Name</th>
        <th>Marks Obtained</th>
        <th>Maximum Marks</th>
        <th>Result</th>
    </tr>
      <tr class="w3-center w3-border w3-border-black">
        <td>I</td>
        <td>Objective</td>
        <td><%=rs.getInt("obtain_marks")%></td>
        <td><%=exam.getInt("marks")%></td>
        <td><%=rs.getString("status")%></td>
    </tr>
    <tr class="w3-center w3-border w3-border-black">
        <td><b></b></td>
        <td><b>Total Marks</b></td>
        <td><b><%=rs.getInt("obtain_marks")%></b></td>
        <td> <b><%=exam.getInt("total_marks")%></b></td>
        <td><b><%=rs.getString("status")%></b></td>
    </tr>
</table>
<br>
<div id="rule">
    <b style="font-family: Adobe Hebrew;">&nbsp;&nbsp;Following is the criteria for passing the basic computer examination successfully:</b><br>
    <b style="font-family: Adobe Hebrew;">Minimum&nbsp;<%=exam.getInt("marks")%>&nbsp;marks out of <%=exam.getInt("total_marks")%> are required for passing in Objectives</b><br>
    <b style="font-family: Arial Black;">*only passed candidates will receive certificate.</b>
</div>
<br>
<br>
<br>
<br>
<table class="w3-table w3-centered">
    <tr>
         <td>_______________________</td>
         <td>_______________________</td>
         <td>_______________________</td>
    </tr>
    <tr style="font-family: Arial Narrow">
        <td>Examiner </td>
         <td>Seal of the Exam Center</td>
          <td>Head of the Exam Center</td>
    </tr>  
</table>
<script>
    
</script>
<%    }
    
}
    }catch(Exception e)
{
    out.println(e);
}
      %>
</body>
</html>
