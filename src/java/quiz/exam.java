
package quiz;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class exam extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/sdi","root","");
   PreparedStatement pt=conn.prepareStatement("select * from question inner join exam where exam.examid=501");
   ResultSet rs=pt.executeQuery();
   int i=0;
   out.println("<html><head></head><body>");
   out.println("<form method='get' action='marks'>");
   out.println("<center> Online Exam </center>");
   while(rs.next()){
       i++;
       out.println("<br><br><hr>"+i+"");
       out.println(rs.getString(2));
       out.println("<br><input type='radio' name=rd"+i+" value="+rs.getString(3)+">"+rs.getString(3));
       out.println("<br><input type='radio' name=rd"+i+" value="+rs.getString(4)+">"+rs.getString(4));
       out.println("<br><input type='radio' name=rd"+i+" value="+rs.getString(5)+">"+rs.getString(5));
       out.println("<br><input type='radio' name=rd"+i+" value="+rs.getString(6)+">"+rs.getString(6));
       String ans ="ans"+i;
       out.println("<br><input type='hidden' name="+ans+" value="+rs.getString(8)+">");
   }
       out.println("<br><input type='hidden' name='total' value="+i+">");
   out.println("<input type=submit value='submit'");
   out.println("</form>");
   out.println("</body></html>");

    
}  
   
        
        catch(Exception e){
            out.println(e.getMessage());
        }
    }

}