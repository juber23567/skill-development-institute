
package Admin;

import account.CreateConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class admin_registration extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       try{
          String first_name=request.getParameter("first_name").toUpperCase();
          String middle_name=request.getParameter("middle_name").toUpperCase();
          String last_name=request.getParameter("last_name").toUpperCase();
          String number=request.getParameter("number");
          String email=request.getParameter("email");
          String ausername=request.getParameter("username");
          String apassword=request.getParameter("password");
          LocalDate date=java.time.LocalDate.now();
          Date date1=Date.valueOf(date);
       LocalTime time=java.time.LocalTime.now();
        Time time1=Time.valueOf(time);   
    Connection conn=CreateConnection.intializeDatabase();
    PreparedStatement check=conn.prepareStatement("select First_name,Last_name from admin where First_name=? AND Last_name=?");
    check.setString(1,first_name);
    check.setString(2, last_name);
    PreparedStatement usercheck=conn.prepareStatement("select username from admin where username=?");
    usercheck.setString(1,ausername);
    PreparedStatement ps=conn.prepareStatement("insert into admin values(?,?,?,?,?,?,?,?,?,?)");
    ps.setInt(1,0);
    ps.setString(2,first_name);
    ps.setString(3, middle_name);
    ps.setString(4, last_name);
    ps.setString(5, number);
    ps.setString(6, email);
    ps.setString(7, ausername);
    ps.setString(8,apassword);
    ps.setDate(9, date1);
    ps.setTime(10, time1);
    ResultSet rs1=check.executeQuery();
    ResultSet rs2=usercheck.executeQuery();
    if(rs1.next()){
       response.sendRedirect("admin/UserError.jsp");
    }
    else if(rs2.next())
    {
     response.sendRedirect("admin/UsernameError.jsp");
    } else{
    int count=ps.executeUpdate();
   if(count>0){
    response.sendRedirect("admin/success.jsp");
   }
    }
    }
    
        catch(Exception e)
        {
           out.println(e);
        }
    }
    
}
