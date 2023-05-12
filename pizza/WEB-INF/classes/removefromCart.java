import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class removefromCart extends HttpServlet
{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        
        PrintWriter out = response.getWriter();

        String id = request.getParameter("item");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/online_pizza";
            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();
            String query = "delete from cart where useremail='"+email+"'and itemid='"+id+"'";
            int res = st.executeUpdate(query);
            if (res == 1) 
            {
                
                session.setAttribute("message", "Removed from cart!");
                
                response.sendRedirect("menu.jsp");
            }
            else
            {
                session.setAttribute("message", "Something went wrong!");
                
                response.sendRedirect("menu.jsp");
            }

        } catch (Exception e) {
            out.println(e);
        }

    }
}