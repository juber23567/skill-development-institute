package account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpSession;
public class login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Integer seat_no=Integer.parseInt(request.getParameter("seat_no"));
        String lpassword=request.getParameter("password");
        try{
    Connection conn=CreateConnection.intializeDatabase();
      Statement st=conn.createStatement();
      ResultSet rs=st.executeQuery("select first_name,last_name,stdid,password from student");
      PreparedStatement pt=conn.prepareStatement("update student set status=? where stdid=?");
      pt.setString(1,"online");
      pt.setInt(2,seat_no);
      while(rs.next()){
          int stdid=rs.getInt("stdid");
          String pass=rs.getString("password");
          String uname=rs.getString("first_name");
          String last_name=rs.getString("last_name");
        if(seat_no.equals(stdid) && lpassword.equals(pass)){
            int rs1=pt.executeUpdate();
            if(rs1>0){
            HttpSession  session =request.getSession();
            session.setAttribute("stdid",stdid);
            session.setAttribute("uname",uname);
            session.setAttribute("last_name",last_name);
            response.sendRedirect("student/welcome.jsp");
            }
            } }
      response.sendRedirect("student/Login.jsp");
        }catch(Exception e)
        {
            out.println(e);}  }}
