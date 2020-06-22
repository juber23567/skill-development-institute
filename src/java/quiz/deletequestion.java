
package quiz;

import account.CreateConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deletequestion extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try  {
        
         int delete=Integer.parseInt(request.getParameter("delete"));
    Connection conn=CreateConnection.intializeDatabase();
   PreparedStatement pt=conn.prepareStatement("DELETE FROM question WHERE qid=?");
   pt.setInt(1, delete);
   int rs=pt.executeUpdate();
   if(rs>0)
   {
       response.sendRedirect("admin/editquestion.jsp");
   }
   else
   {
       out.println("Error");
   }
   
   
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}

  