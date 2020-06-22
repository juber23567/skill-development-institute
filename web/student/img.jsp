
<%@page import="com.mysql.jdbc.PreparedStatement"%>
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
    
     Class.forName("com.mysql.jdbc.Driver");
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/sdi","root","");
   Statement st= conn.createStatement();
   Integer id=Integer.parseInt(request.getParameter("id"));
     String sql="select * from student where stdid="+id;
out.println(sql);
      
   ResultSet rs=st.executeQuery(sql);

   if(rs.next())
                    {
                       
                        Blob blob =rs.getBlob("img");
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
