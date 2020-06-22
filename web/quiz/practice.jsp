<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="width=device-width,initial-scale=1.0"; charset=UTF-8" name="viewport">
        <title>Exam</title>
 
       <link href="exam.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
        <link href="../styles/w3.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <% int getexamid=Integer.parseInt(request.getParameter("exam")); 
     response.setHeader("Cache-Control", "no-cache,no-store,mustrevalidate");
            response.setHeader("pragma","no-cache");
    HttpSession session1=request.getSession();
     if(session.getAttribute("uname")==null){
    response.sendRedirect("./logout");}
     
    session1.setAttribute("getexamid", getexamid);
    
    
    %>
   <% try{
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/sdi","root","");
   PreparedStatement pt=conn.prepareStatement("select * from question  where examid=? order by rand() limit ?");
   pt.setInt(1,getexamid);
   PreparedStatement pt1=conn.prepareStatement("select * from exam where examid=?");
   pt1.setInt(1,getexamid);
   ResultSet examid=pt1.executeQuery();
   while(examid.next())
   {
          pt.setInt(2,examid.getInt(6));
    
   %>
   <script>
   function showTimer(){
   var time;
   
   if(sessionStorage.getItem("ti")===null) {
      time="00:"+<%=examid.getInt(3)%>+":00";  
   }
  
   else
   {
       time=sessionStorage.getItem("ti");
   }
    
    timer_div=document.getElementById("timer_div");
    //applyCSS(timer_div);
    timer_div.innerHTML=time;
    my_timer=setInterval(function(){
       
       var hr=0;
       var min=0;
       var sec=0;
       var time_up=false;
       t=time.split(":");
      hr=parseInt(t[0]);
       min=parseInt(t[1]);
       sec=parseInt(t[2]);
       if(sec===0)
       {
        if(min>0){
            sec=59;
            min--;
        } 
        else if(hr>0)
        {
            min=59;
            sec=59;
            hr--;
        }
        else
        {
            time_up=true;
        }
       }
       else
           
        {
            sec--;
        }
        if(hr<10)
        
            hr="0"+hr;
        
        if(min<10)
        
            min="0"+min;
        
        if(sec<10)
            sec="0"+sec;
        time=hr+":"+min+":"+sec;
           sessionStorage.setItem("ti",time);

        if(time_up)
             time="TIME UP";
             
        var timer_div=document.getElementById("timer_div");
        
        timer_div.innerHTML=time;
        timer_div.style.color="blue";
       
        if(time_up)
        { 
            alert("TIME_UP");
            setTimeout(function(){
              document.getElementById("submit").click();  
            },1000);
            
            clearInterval(my_timer);
        }   
    },1000);
  

}


    
   </script>
   <body onload="showTimer()">
   <%
  
   }
   ResultSet rs=pt.executeQuery();
   int i=0;
   %>
   <header>
       
            <div id="timer_div"></div>
        </header>

   <form method="post" action="presult.jsp">
    <center> Online Exam </center>
    <% while(rs.next()){
       i++;
    
    %>
    <div>
    <br><hr class="line"> 
    <label class="w3-green w3-padding" style="display: block; font-family: arial black;font-size: 18px;" ><%=i%>]&nbsp;<input type="hidden" name="q<%=i%>" value="<%=rs.getString(2)%>"><%=rs.getString(2)%></label>
     <img src="getQuestionImg.jsp?id=<%=rs.getInt(1)%>" alt="no" id="qimg<%=i%>">
     <br><div><input type="radio" id= "opt1<%=i%>" name="rd<%=i%>" value="<%=rs.getString(3)%>"><label for="opt1<%=i%>"><%=rs.getString(3)%></label></div>
     <br><div><input type="radio" id="opt2<%=i%>" name="rd<%=i%>" value="<%=rs.getString(4)%>"><label for="opt2<%=i%>"><%=rs.getString(4)%></label></div>
     <br><div><input type="radio" id="opt3<%=i%>" name="rd<%=i%>" value="<%=rs.getString(5)%>"><label for="opt3<%=i%>"><%=rs.getString(5)%></label></div>
     <br><div><input type="radio" id="opt4<%=i%>" name="rd<%=i%>" value="<%=rs.getString(6)%>"><label for="opt4<%=i%>"><%=rs.getString(6)%></label></div>
     <br><input type="radio" id="opt5<%=i%>" name="rd<%=i%>" value="Not Selected"  checked>
      <% String ans ="ans"+i;%>
      <br><input type="hidden" name="<%=ans%>" value="<%=rs.getString(8)%>">
      <input type="hidden" name="type" id="type<%=i%>" value="<%=rs.getString(10)%>">
      
      <% } %>
    </div>
       <br>
     <input type="hidden" name="total" value="<%=i%>" id="total">
       <input type="submit" value="END-EXAM" id="submit" class="w3-button w3-blue w3-half">
   </form>

   <% }catch(Exception e)
   {
       out.println(e);
       
   }
   %>
   
   <script>
    $(document).ready(function(){ 
     var total=$("#total").val();
     for(var i=1;i<=total;i++)
     {
     var qimg="#qimg"+i;
     var opt1="#opt1"+i;
     var opt2="#opt1"+i;
     var opt3="#opt3"+i;
     var opt4="#opt4"+i;
     var opt5="#opt5"+i;
     var type="#type"+i;
     type1=$(type).val();
     
     if(type1==="true")
     {    
     $(opt3).hide();
     $(opt4).hide();
      $(opt5).hide();
     $(qimg).hide();
 }
 else if(type1==="multi")
 {
   $(qimg).hide();
    $(opt5).hide();
   
 }
 else if(type1==="img" && $(opt3).val()==="" && $(opt4).val()===""){  
   $(opt3).hide();
   $(opt4).hide(); 
     $(opt5).hide();
 }else
 {
      $(opt5).hide();
 }}

 });

   </script>
   </body>
</html>

