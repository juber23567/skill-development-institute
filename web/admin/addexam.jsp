
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam</title>
        <link rel="stylesheet" href="../styles/w3.css">
    </head>
    <jsp:include page="header.jsp"></jsp:include>
     
    <body id="demo1">
         <% 
            response.setHeader("Cache-Control", "no-cache,no-store,mustrevalidate");
            response.setHeader("pragma","no-cache");
            if(session.getAttribute("admin_username")==null){
            response.sendRedirect("admin_login.jsp");
            }
        %>
        <% String st=request.getParameter("st");
        if(st!=null){
            
        %>
    <center><h3><% out.println(st); } else{ }%></h3></center>
        <table align="center"class="w3-display-middle w3-green  w3-padding ">
            <tr>
                <td colspan="2" align="center">Create New Exam </td>
        <form action="../addexam" method="GET">
        
            <tr>
            <td class="w3-padding" >Enter Exam Name</td>        
       <td><input type="text" name="exam" ></td>   
       </tr>
       <tr>
            <td class="w3-padding" >Time In Minute</td>        
       <td><input type="text" name="time" ></td>   
       </tr>
       <tr>
       <td class="w3-padding" >Passing-Marks</td>        
       <td><input type="text" name="marks" ></td>   
       </tr>
        <tr>
       <td class="w3-padding" >Total-Marks</td>        
       <td><input type="text" name="total-marks" ></td>   
       </tr>
        <tr>
       <td class="w3-padding" >Mode</td>        
       <td><select name="mode" id="sel" class="w3-select w3-twothird w3-margin-bottom w3-border-black w3-border">
   <option value="" selected>Select Mode</option>
    <option value="e">EXAM</option>
     <option value="p">PRACTICE</option>
  </select></td>   
       </tr>
       <tr><td align="center" class="w3-padding"><input type="submit" value="ADD" class="w3-lime w3-button">
           </td>
           <td align="center"><button type="button" onclick="update()" class="w3-button w3-lime">Update Exam</button></td>
           </tr>
           <tr>
               <td colspan="2" align="center"><button type="button" onclick="add()" class="w3-lime w3-button">Add Question</button></td>
           </tr>
        </form>
        </table>
      
 
   
     <div id="demo">
    
     
    </div>
     <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
     
    <script>
    function update()
    {
      document.location.href="editexam1.jsp";
    }
     function add()
    {
      document.location.href="addquestion.jsp";
    }
 
    </script>    
    </body>
</html>
