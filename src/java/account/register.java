package account;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig(maxFileSize = 16177216)
public class register extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
       
        String first_name=request.getParameter("first_name").toUpperCase();
        String middle_name=request.getParameter("middle_name").toUpperCase();
        String last_name=request.getParameter("last_name").toUpperCase();
        String school_name=request.getParameter("school_name").toUpperCase();
        String qualification =request.getParameter("qualification").toUpperCase();
        String dob=request.getParameter("dob"); 
        String bplace=request.getParameter("bplace").toUpperCase();
        String gender=request.getParameter("gender").toUpperCase();
        String email=request.getParameter("email");
        String id_proof=request.getParameter("id_proof").toUpperCase();
        String id_no=request.getParameter("id_no");
        String mobile1=request.getParameter("mobile1");
        String mobile2=request.getParameter("mobile2");
        String phy_chal=request.getParameter("phy_chal").toUpperCase();
        String foccupation=request.getParameter("foccupation").toUpperCase();
        String address=request.getParameter("address").toUpperCase();
       LocalDate date=java.time.LocalDate.now();
       Date date1=Date.valueOf(date);
       LocalTime time=java.time.LocalTime.now();
        Time time1=Time.valueOf(time);
         Part upload_img=request.getPart("upload_img");
         Part upload_sign=request.getPart("upload_sign");
         
         
            if(upload_img!=null && mobile1!=null)
            {
                try{
                    Connection conn=CreateConnection.intializeDatabase();
                 
                    PreparedStatement ps=conn.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    InputStream img=upload_img.getInputStream();
                    InputStream sign =upload_sign.getInputStream();
                    ps.setInt(1, 0);
                    ps.setString(2,first_name);
                    ps.setString(3, middle_name);
                    ps.setString(4, last_name);
                    ps.setString(5, school_name);
                    ps.setString(6, qualification);
                    ps.setString(7, dob);
                    ps.setString(8,bplace);
                    ps.setString(9, gender);
                    ps.setString(10, email);
                    ps.setString(11, id_proof);
                    ps.setString(12, id_no);
                    ps.setString(13, mobile1);
                    ps.setString(14, mobile2);
                    ps.setString(15, phy_chal);
                    ps.setString(16, foccupation);
                    ps.setBlob(17, img);
                    ps.setBlob(18,sign );
                    ps.setString(19,address);
                    ps.setDate(20,date1);
                    ps.setTime(21, time1);
                    ps.setString(22, mobile1);
                    ps.setString(23, "offline");
                    PreparedStatement check=conn.prepareStatement("select first_name ,middle_name,last_name from student where first_name=? AND middle_name=? AND last_name=?");
                  check.setString(1, first_name);
                  check.setString(2, middle_name);
                  check.setString(3, last_name);
                  ResultSet rs1=check.executeQuery();
                  if(rs1.next()){
                      response.sendRedirect("student/UserError.jsp");
                  }else{
                    
                    int count=ps.executeUpdate();
                    if(count>0)
                    {
                   PreparedStatement getid=conn.prepareStatement("select stdid from student where first_name=? AND middle_name=? AND last_name=?");
                  getid.setString(1, first_name);
                  getid.setString(2, middle_name);
                  getid.setString(3, last_name);
              ResultSet rs=getid.executeQuery();
                while(rs.next())
                 {
                    request.setAttribute("stdid", rs.getInt("stdid"));
                }
                        
  request.setAttribute("first_name",first_name);
  request.setAttribute("last_name",last_name);
  RequestDispatcher success=request.getRequestDispatcher("student/register.jsp");
  success.forward(request, response);
                    }
  else
                    {
  RequestDispatcher fail=request.getRequestDispatcher("student/registration_page.jsp");
  fail.forward(request, response);
                             
                    }
                    
                           
                  }
                }catch(Exception e)
                {
                   out.println(e);
                }
            }
                    
        }
}
    

