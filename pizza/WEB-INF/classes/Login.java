import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class Login extends HttpServlet 
{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/online_pizza";
            Connection con = DriverManager.getConnection(url, "root", "root");
            Statement st = con.createStatement();
            String query = "select * from userinfo where email='"+email+"'and pwd='"+pwd+"'";

            ResultSet rs = st.executeQuery(query);
            if (rs.next())
            {
                String name = rs.getString(1) + " " + rs.getString(2);
                int role = rs.getInt(7);
                HttpSession session = request.getSession();
                session.setAttribute("login", "true");
                session.setAttribute("name", name);
                session.setAttribute("email", rs.getString(5));
                
                if (role == 1) 
                {
                    session.setAttribute("role", "admin");
                    response.sendRedirect("adminHome.jsp");
                }
                else
                {
                    session.setAttribute("role", "customer");
                    response.sendRedirect("customerHome.jsp");
                }
            }
            else
            {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Wrong email or password!");
                response.sendRedirect("login.jsp");
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }

    
}
