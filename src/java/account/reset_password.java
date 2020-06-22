
package account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
public class reset_password extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int seat_no=Integer.parseInt(request.getParameter("seat_no"));
        String spassword=request.getParameter("password");
        String srpassword=request.getParameter("rpassword");
        try  {
     Connection conn=CreateConnection.intializeDatabase();
    PreparedStatement pt=conn.prepareStatement("update student set password=? where stdid=?");
    pt.setString(1,spassword);
    pt.setInt(2,seat_no);
    if(spassword.equals(srpassword))
    {
    int rs=pt.executeUpdate();
    if(rs>0)
    {
        out.println("<script>alert('Your Password Has Been Changed');</script>");
        response.sendRedirect("student/Login.jsp");
    }
    else
    {
        out.println("<script>alert('Error');</script>");
      response.sendRedirect("student/reset-password.jsp");
    }}
    else
    {
        out.println("<script>alert('Both password must match');</script>");
        response.sendRedirect("student/reset-password.jsp");
    }}catch(Exception e){
           out.println(e) ;
        } }}
   

