
package Admin;

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

/**
 *
 * @author Danish Muchhale
 */
public class changepassword extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        String otp=(String) session.getAttribute("otp");
        String admin_username=(String) session.getAttribute("user");
        String getotp=request.getParameter("otp");
        String admin_password=request.getParameter("password");
        String admin_rpassword=request.getParameter("cpassword");
      
        try  {
        Connection conn=CreateConnection.intializeDatabase();
    PreparedStatement pt=conn.prepareStatement("update admin set password=? where username=?");
    pt.setString(1,admin_password);
    pt.setString(2,admin_username);
   if(  getotp == null ? otp == null : getotp.equals(otp))
   {
    if(admin_rpassword.equals(admin_password))
    {
    int rs=pt.executeUpdate();
    if(rs>0)
    {
        out.println("<script>alert('Your Password Has Been Changed');");
       
        out.println("document.location.href='admin/admin_login.jsp'</script>");
    }
    else
    {
        out.println("<script>alert('Error');");
        out.println("document.location.href='admin/change_password.jsp'</script>");
    }
    }
    else
    {
      
        out.println("<script>alert('Both password must match');");
        out.println("document.location.href='admin/change_password.jsp'</script>");
    }
   }
   else
   {
     out.println("<script>alert('Wrong OTP /n Refresh page to resend new otp');");
        out.println("document.location.href='admin/change_password.jsp'</script>");   
   }
   conn.close();
       
        }catch(Exception e){
           out.println(e) ;
        } 
    }

}