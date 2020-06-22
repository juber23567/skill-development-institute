package Admin;
import account.CreateConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpSession;

public class admin_login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String admin_username=request.getParameter("username");
        String lpassword=request.getParameter("password");
        try{
     Connection conn=CreateConnection.intializeDatabase();
      Statement st=conn.createStatement();
      ResultSet rs=st.executeQuery("select username,password from admin");
      while(rs.next())
      {
          String username1=rs.getString("username");
          String pass=rs.getString("password");
        
        if(lpassword.equals(pass) && admin_username.equals(username1)){
            
            HttpSession  session =request.getSession();
            session.setAttribute("admin_username",username1);
           
           
            response.sendRedirect("admin/Dashboard.jsp");
            
          }
      
      }
      response.sendRedirect("admin/admin_login.jsp");
        
        }catch(Exception e)
        {
            out.println(e);
        } 
          
        
        
    }

   
}
