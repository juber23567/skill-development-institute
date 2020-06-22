
package quiz;

import account.CreateConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig(maxFileSize = 16177216)
public class addquestion extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        Integer examid=Integer.parseInt(request.getParameter("exam"));
        String type=request.getParameter("type");
        String question=request.getParameter("question");
        String opt1=request.getParameter("opt1");
        String opt2=request.getParameter("opt2");
        String opt3=request.getParameter("opt3");
        String opt4=request.getParameter("opt4");
        Part img=request.getPart("img");
        String correct=request.getParameter("correct");
        int count=1;
             
        try  {
    Connection conn=CreateConnection.intializeDatabase();
    PreparedStatement pt=conn.prepareStatement("insert into question values(?,?,?,?,?,?,?,?,?,?)");
    if(type.equals("true") && type!=null)
    {
     pt.setInt(1,0);
     pt.setString(2, question);
     pt.setString(3, opt1);
     pt.setString(4, opt2);
     pt.setString(5, "");
     pt.setString(6, "");
     pt.setString(7, "");
     pt.setString(8, correct);
     pt.setInt(9, examid);
     pt.setString(10,type);
     if(opt1.equals(correct) || opt2.equals(correct)){
       int a=pt.executeUpdate();
       if(a>0)
       {
      
       response.sendRedirect("admin/addquestion.jsp?status=One Question inserted");  
       }
       
     }
     else{
          response.sendRedirect("admin/addquestion.jsp?status=Option and Answer Not Match");   
       }
       }
    
    else if(type.equals("multi") && type!=null)
    {
     pt.setInt(1,0);
     pt.setString(2, question);
     pt.setString(3, opt1);
     pt.setString(4, opt2);
     pt.setString(5, opt3);
     pt.setString(6, opt4);
     pt.setString(7, "");
     pt.setString(8, correct);
     pt.setInt(9, examid);
     pt.setString(10,type);
 
  if(opt1.equals(correct) || opt2.equals(correct)|| opt3.equals(correct) || opt4.equals(correct)){
       int b=pt.executeUpdate();
       if(b>0)
       {
       response.sendRedirect("admin/addquestion.jsp?status=One Question inserted");  
       }
       
     }
     else{
          response.sendRedirect("admin/addquestion.jsp?status=Option and Answer Not Match");   
       }
    
    }
    else if(type.equals("img") && type!=null)
    {
    InputStream img1=img.getInputStream();
     pt.setInt(1,0);
     pt.setString(2, question);
     pt.setString(3, opt1);
     pt.setString(4, opt2);
     pt.setString(5, opt3);
     pt.setString(6, opt4);
     pt.setBlob(7, img1);
     pt.setString(8, correct);
     pt.setInt(9, examid);
     pt.setString(10,type);
    if(opt1.equals(correct) || opt2.equals(correct)|| opt3.equals(correct) || opt4.equals(correct)){
    int c=pt.executeUpdate();
       if(c>0)
       {
       response.sendRedirect("admin/addquestion.jsp?status=One Question inserted");  
       }
     else{
          response.sendRedirect("admin/addquestion.jsp?status=Option and Answer Not Match");   
       }
    }}
    pt.close();
    conn.close();
    }
        
        catch(Exception e)
        {
          out.println(e);  
        }
    }

}