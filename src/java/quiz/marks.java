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
import javax.servlet.http.HttpSession;
public class marks extends HttpServlet {
    private Object session;
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       response.setHeader("Cache-Control", "no-cache,no-store,mustrevalidate");
            response.setHeader("pragma","no-cache");
            HttpSession session=request.getSession();
            if(session.getAttribute("uname")==null){
            response.sendRedirect("student/Login.jsp");
            }
    
        String status;
        try  {
          
           int stdid=(int)session.getAttribute("stdid");
            int getexamid=(int) session.getAttribute("getexamid");
            int exam_marks=(int) session.getAttribute("marks");
            int total_marks=(int) session.getAttribute("total_marks");
         
    Connection conn=CreateConnection.intializeDatabase();
   PreparedStatement res=conn.prepareStatement("insert into result values(?,?,?,?,?)");
   res.setInt(1, 0);
   res.setInt(2, stdid);
    res.setInt(3, getexamid);
   out.println("<html><head><link rel='stylesheet' href='./styles/w3.css'></head><body>");
         
           
          int total=Integer.parseInt(request.getParameter("total"));
           int marks=0;
           int wrong=0;
           for(int i=1;i<=total;i++)
           {
               String sel=request.getParameter("rd"+i);
               String ans=request.getParameter("ans"+i);
              
              
               if(sel.equals(ans))
               {
                   marks++;
               }
               else if(sel.equals(null))
               {
                   wrong++;
               }
               else
               {
                   wrong++;
               }
    
           }
           if(marks>=exam_marks)
           {
               status="PASS";
             
           }
           else
           {
                status="FAIL";
                
           }
           res.setInt(4, marks);
         res.setString(5, status);
         int success=res.executeUpdate();
         if(success>0)
         {
       
        out.println("<table class=' w3-display-middle w3-green w3-padding'><tr class='w3-padding'><td colspan='2' class='w3-center w3-padding'>Your Result</td></tr><tr><td class='w3-padding'>Incorrect</td><td class='w3-padding'>"+wrong+"</td><tr><tr> ");
           out.println("<td class='w3-padding'>Correct</td>");
           out.println("<td class='w3-padding'>"+marks+"</td></tr>");
           out.println("<td class='w3-padding'>Total_Marks</td>");
           out.println("<td class='w3-padding'>"+total_marks+"</td></tr>");
           out.println("<td class='w3-padding'>Result</td>");
           out.println("<td class='w3-padding'>"+status+"</td></tr>");
             out.println("</table><form action='./logout'><input type='submit' value='LOGOUT' class='w3-button w3-green'></form>");
             
           out.println("</body></html>");
    
           
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