
package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SDI
 */
public class admin_logout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
         HttpSession session=request.getSession();
     
     session.removeAttribute("admin_username");
      session.invalidate();
      response.sendRedirect("admin/admin_login.jsp");
    }
        catch(Exception e)
            
        {
            out.println(e);
        }
    }
}