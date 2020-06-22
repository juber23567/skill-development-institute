
package quiz;

import account.CreateConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class addexam extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String name=request.getParameter("exam");
        Integer marks=Integer.parseInt(request.getParameter("marks"));
        Integer totalmarks=Integer.parseInt(request.getParameter("total-marks"));
            LocalDate date=java.time.LocalDate.now();
       Date date1=Date.valueOf(date);
       Integer time=Integer.parseInt(request.getParameter("time"));
       String mode=request.getParameter("mode");
         try  {
            Connection conn=CreateConnection.intializeDatabase();
    Statement st=conn.createStatement();
    PreparedStatement pt=conn.prepareStatement("insert into exam values(?,?,?,?,?,?,?,?)");
    PreparedStatement pt1=conn.prepareStatement("select Name from exam where Name=?");
    pt.setInt(1, 0);
    pt.setString(2, name);
    pt.setInt(3, time);
    pt.setDate(4, date1);
    pt.setInt(5,marks);
    pt.setInt(6,totalmarks);
     pt.setString(7,mode);
      pt.setInt(8,2);
    pt1.setString(1, name);
    ResultSet rs=pt1.executeQuery();
    if(rs.next()){    
    response.sendRedirect("admin/addexam.jsp?st=EXAM ALREADY EXISTS");
    }
    else
    {
       int a=pt.executeUpdate();
       if(a>0)
       {
      response.sendRedirect("admin/addexam.jsp?st=NEW EXAM ADDED");     
      
       }
    }
    
    }
         catch( ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException | IOException e)
         {
            out.println(e); 
         }
    }

}