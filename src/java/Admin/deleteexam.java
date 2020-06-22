
package Admin;
import account.CreateConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deleteexam extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         String name=request.getParameter("exam");
       
         try  {
    Connection conn=CreateConnection.intializeDatabase();
    PreparedStatement pt=conn.prepareStatement("select examid from exam where Name=?");
    PreparedStatement pt1=conn.prepareStatement("delete from question where examid=?");
    PreparedStatement pt2=conn.prepareStatement("delete from exam where examid=?");
    pt.setString(1, name);
             ResultSet rs= pt.executeQuery();
             int examid;
             if(name!=null)
             {
             while(rs.next())
                     {
                     examid=rs.getInt("examid");
                      pt1.setInt(1, examid);
                      pt2.setInt(1, examid);
                      
                      int status=pt1.executeUpdate();
                      if(status>0)
                      {
                         int examsuccess=pt2.executeUpdate();
                         if(examsuccess>0)
                         {
                          
                          out.println("<script>alert('Exam deleted ');");
                          out.println("document.location.href='admin/editexam1.jsp';</script>");
                         }
                         else
                         {
                             out.println("<script>alert('Exam not deleted');");
                             out.println("document.location.href='admin/editexam1.jsp';</script>");
                         }
                      }
                      else{
                          out.println("<script>alert('Error');");
                          out.println("document.location.href='admin/editexam1.jsp';</script>");
                      }
                    
                     }
             }else
             {
                 out.println("<script>alert('Please Eneter Exam Name')");
                          out.println("document.location.href='admin/editexam1.jsp';</script>");
             }
    
         
     }
         catch(Exception e)
         {
             out.println(e);
         }
    }
}