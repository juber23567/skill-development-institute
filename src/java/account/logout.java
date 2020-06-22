package account;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
    try{
     Connection conn=CreateConnection.intializeDatabase();
    HttpSession session=request.getSession();
    int seat_no=(int) session.getAttribute("stdid");
      PreparedStatement pt=conn.prepareStatement("update student set status=? where stdid=?");
      pt.setString(1,"offline");
      pt.setInt(2,seat_no);
     session.removeAttribute("uname");
     session.removeAttribute("stdid");
     session.invalidate();
      pt.executeUpdate();
     response.sendRedirect("student/Login.jsp");
    }
    catch(Exception e)
    {
     out.println(e);   
    }}}
            
    
   