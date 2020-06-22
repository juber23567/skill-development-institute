
package Admin;
import account.CreateConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class editexam extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         String oldname=request.getParameter("oldexam");
         String name=request.getParameter("exam");
          String tempmarks=request.getParameter("marks");
        Integer marks=Integer.parseInt(tempmarks);
      LocalDate date=java.time.LocalDate.now();
       Date date1=Date.valueOf(date);
       String temptime=request.getParameter("time");
       Integer time=Integer.parseInt(temptime);
       String temptotal=request.getParameter("total-marks");
       Integer totalmarks=Integer.parseInt(temptotal);
         try  {
           Connection conn=CreateConnection.intializeDatabase();
    Statement st=conn.createStatement();
    PreparedStatement all=conn.prepareStatement("update exam set Name=?,Time=?,marks=?,total_marks=? where  examid=?");
    PreparedStatement examname=conn.prepareStatement("update exam set Name=? where  examid=? ");
    PreparedStatement examtime=conn.prepareStatement("update exam set Time=? where  examid=? ");
    PreparedStatement exammarks=conn.prepareStatement("update exam set marks=? where  examid=? ");
    PreparedStatement examtotal=conn.prepareStatement("update exam set total_marks=? where  examid=? ");
    PreparedStatement pt1=conn.prepareStatement("select examid,Name from exam where Name=?");
    all.setString(1, name);
    all.setInt(2, time);
    all.setInt(3, marks);
    all.setInt(4, totalmarks);
  examname.setString(1, name);
  examtime.setInt(1, time);
  exammarks.setInt(1, marks);
  examtotal.setInt(1, totalmarks);
    pt1.setString(1, oldname);
    ResultSet rs=pt1.executeQuery();
    if(rs.next()){    
    int examid=rs.getInt("examid");
    all.setInt(5, examid);
    examname.setInt(2, examid);
      examtime.setInt(2, examid);
       exammarks.setInt(2,examid);
       examtotal.setInt(2, examid);
    if(name == null)
    {
       int count= examtime.executeUpdate();
       int count1= exammarks.executeUpdate();
        int count2=examtotal.executeUpdate();
       if(count>0 && count1>0 && count2>0)
       {
      response.sendRedirect("admin/editexam1.jsp?st=update"); 
       }
       else
        {
        response.sendRedirect("admin/editexam1.jsp?st=Please Check Exam Name");         
       }
        
    }
    else if(marks.equals(null) )
    {
     int count=examname.executeUpdate();
     int count1=examtime.executeUpdate();
     int count2=examtotal.executeUpdate();
       if(count>0 && count1>0 && count2>0)
       {
      response.sendRedirect("admin/editexam1.jsp?st=update");     
      
       }
       else
        {
        response.sendRedirect("admin/editexam1.jsp?st=Please Check Exam Name");         
       }
    }
    else if(totalmarks.equals(null))
    {
     int count=examname.executeUpdate();
     int count1=examtime.executeUpdate();
     int count2=exammarks.executeUpdate();
       if(count>0 && count1>0 && count2>0)
       {
      response.sendRedirect("admin/editexam1.jsp?st=update");     
      
       }
       else
        {
        response.sendRedirect("admin/editexam1.jsp?st=Please Check Exam Name");         
       }
    }
    else
    {
        int count3=all.executeUpdate();
        if(count3>0)
        {
            response.sendRedirect("admin/editexam1.jsp?st=update");
        }
        else
        {
        response.sendRedirect("admin/editexam1.jsp?st=Please Check Exam Name");         
       }
    }}
    else
    {
        response.sendRedirect("admin/editexam1.jsp?st=Please Check Exam Name");
    }
         }
         catch(Exception e)
         {
           out.println(e); 
         }}}
    

