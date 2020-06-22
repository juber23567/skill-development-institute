<%@page import="account.CreateConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
        <style>
            .img
            {
                width: 200px;
                height:200px;
            }
        </style>
    </head>
    <body>
     
        
     <%
    
 Connection conn=CreateConnection.intializeDatabase();
   //Statement st= conn.createStatement();
   Integer id=Integer.parseInt(request.getParameter("id"));
     String sql="select qimg from question where qid="+id;
PreparedStatement pt=conn.prepareStatement("select qimg from question where qid=?");
      pt.setInt(1, id);
   ResultSet rs=pt.executeQuery();

   if(rs.next())
                    {
                       
                        Blob blob =rs.getBlob("qimg");
                        byte[] imageData=blob.getBytes(1,(int)blob.length());
                        response.setContentType("image/png");
                        OutputStream os = response.getOutputStream();
                        %>
                       
                      <img src="<%os.write(imageData);%>">   
                      <%
                  os.flush();
                 os.close();
                    }else
                    {
                        out.println("no image");
                     
                    } 
         
                     %>
                     
                     
    </body>
</html>
