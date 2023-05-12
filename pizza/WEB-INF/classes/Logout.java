import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;


public class Logout extends HttpServlet 
{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession sess=request.getSession();

        sess.invalidate();
        
        response.sendRedirect("login.jsp");
    }

    
}
